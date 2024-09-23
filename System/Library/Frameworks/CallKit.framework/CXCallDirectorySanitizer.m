@implementation CXCallDirectorySanitizer

- (CXCallDirectorySanitizer)init
{
  CXCallDirectorySanitizer *v2;
  uint64_t v3;
  NSCharacterSet *phoneNumbersCharacterSet;
  uint64_t v5;
  NSCharacterSet *nonPhoneNumbersCharacterSet;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSCharacterSet *phoneNumbersIgnoredCharacterSet;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CXCallDirectorySanitizer;
  v2 = -[CXCallDirectorySanitizer init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    phoneNumbersCharacterSet = v2->_phoneNumbersCharacterSet;
    v2->_phoneNumbersCharacterSet = (NSCharacterSet *)v3;

    -[NSCharacterSet invertedSet](v2->_phoneNumbersCharacterSet, "invertedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    nonPhoneNumbersCharacterSet = v2->_nonPhoneNumbersCharacterSet;
    v2->_nonPhoneNumbersCharacterSet = (NSCharacterSet *)v5;

    v7 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formUnionWithCharacterSet:", v8);

    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formUnionWithCharacterSet:", v9);

    objc_msgSend(v7, "addCharactersInString:", CFSTR("+"));
    v10 = objc_msgSend(v7, "copy");
    phoneNumbersIgnoredCharacterSet = v2->_phoneNumbersIgnoredCharacterSet;
    v2->_phoneNumbersIgnoredCharacterSet = (NSCharacterSet *)v10;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbersIgnoredCharacterSet, 0);
  objc_storeStrong((id *)&self->_nonPhoneNumbersCharacterSet, 0);
  objc_storeStrong((id *)&self->_phoneNumbersCharacterSet, 0);
}

- (id)canonicalizedPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[CXCallDirectorySanitizer phoneNumbersIgnoredCharacterSet](self, "phoneNumbersIgnoredCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_1E4B8CB80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectorySanitizer nonPhoneNumbersCharacterSet](self, "nonPhoneNumbersCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8);

  v10 = 0;
  if (objc_msgSend(v7, "length"))
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = strtoll((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0, 10);
      v10 = 0;
      if ((unint64_t)(v11 + 0x7FFFFFFFFFFFFFFFLL) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v10;
}

- (NSCharacterSet)phoneNumbersIgnoredCharacterSet
{
  return self->_phoneNumbersIgnoredCharacterSet;
}

- (NSCharacterSet)nonPhoneNumbersCharacterSet
{
  return self->_nonPhoneNumbersCharacterSet;
}

- (NSCharacterSet)phoneNumbersCharacterSet
{
  return self->_phoneNumbersCharacterSet;
}

@end
