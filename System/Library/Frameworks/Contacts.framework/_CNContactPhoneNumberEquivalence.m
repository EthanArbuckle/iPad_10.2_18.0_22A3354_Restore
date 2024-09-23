@implementation _CNContactPhoneNumberEquivalence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawString, 0);
}

- (void)dealloc
{
  $2A2B7EFAB7F70232912E632107C7A237 *decomposedRepresentation;
  char *decomposedNumberDigits;
  objc_super v5;

  decomposedRepresentation = self->_decomposedRepresentation;
  if (decomposedRepresentation)
    free(decomposedRepresentation);
  decomposedNumberDigits = self->_decomposedNumberDigits;
  if (decomposedNumberDigits)
    free(decomposedNumberDigits);
  v5.receiver = self;
  v5.super_class = (Class)_CNContactPhoneNumberEquivalence;
  -[_CNContactPhoneNumberEquivalence dealloc](&v5, sel_dealloc);
}

- (_CNContactPhoneNumberEquivalence)initWithPhoneNumberString:(id)a3
{
  id v4;
  _CNContactPhoneNumberEquivalence *v5;
  uint64_t v6;
  NSString *rawString;
  _CNContactPhoneNumberEquivalence *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNContactPhoneNumberEquivalence;
  v5 = -[_CNContactPhoneNumberEquivalence init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rawString = v5->_rawString;
    v5->_rawString = (NSString *)v6;

    v5->_decomposedRepresentation = 0;
    v5->_decomposedNumberDigits = 0;
    v8 = v5;
  }

  return v5;
}

+ (id)indexKeyForString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13B00], "lastFourDigitsForNumber:", a3);
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[_CNContactPhoneNumberEquivalence isRawStringEquivalent:](self, "isRawStringEquivalent:", v6))
  {
    v7 = 1;
    *a4 = 1;
  }
  else if (-[_CNContactPhoneNumberEquivalence preparePhoneNumberRepresentation](self, "preparePhoneNumberRepresentation"))
  {
    v7 = -[_CNContactPhoneNumberEquivalence isPhoneNumberEquivalent:strict:](self, "isPhoneNumberEquivalent:strict:", v6, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isRawStringEquivalent:(id)a3
{
  return -[NSString isEqualToString:](self->_rawString, "isEqualToString:", a3);
}

- (BOOL)preparePhoneNumberRepresentation
{
  $2A2B7EFAB7F70232912E632107C7A237 *decomposedRepresentation;
  void *v4;
  NSString *v5;
  void *v6;
  char *v7;

  decomposedRepresentation = self->_decomposedRepresentation;
  if (!decomposedRepresentation)
  {
    self->_decomposedRepresentation = ($2A2B7EFAB7F70232912E632107C7A237 *)malloc_type_calloc(1uLL, 0x40uLL, 0x105004024FC7E8CuLL);
    v4 = (void *)MEMORY[0x1E0D13B00];
    v5 = self->_rawString;
    objc_msgSend(v4, "countryCodeForNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (char *)PNCopyBestGuessNormalizedNumberForCountry();

    self->_decomposedNumberDigits = v7;
    PNDecomposeForCountry();

    decomposedRepresentation = self->_decomposedRepresentation;
  }
  return decomposedRepresentation != 0;
}

- (BOOL)isPhoneNumberEquivalent:(id)a3 strict:(BOOL *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = (void *)MEMORY[0x1E0D13B00];
  v6 = a3;
  objc_msgSend(v5, "countryCodeForNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)PNCopyBestGuessNormalizedNumberForCountry();

  PNDecomposeForCountry();
  v9 = decomposedPhoneNumbersEqual();
  if (a4)
    *a4 = 0;
  if (v8)
    free(v8);
  return v9;
}

@end
