@implementation _CNContactEmailAddressEquivalence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawString, 0);
}

- (_CNContactEmailAddressEquivalence)initWithEmailAddress:(id)a3
{
  id v4;
  _CNContactEmailAddressEquivalence *v5;
  uint64_t v6;
  NSString *rawString;
  _CNContactEmailAddressEquivalence *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNContactEmailAddressEquivalence;
  v5 = -[_CNContactEmailAddressEquivalence init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rawString = v5->_rawString;
    v5->_rawString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)indexKeyForString:(id)a3
{
  return (id)objc_msgSend(a3, "lowercaseString");
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  int v5;

  v5 = -[NSString _cn_caseInsensitiveIsEqual:](self->_rawString, "_cn_caseInsensitiveIsEqual:", a3);
  if (v5)
    *a4 = 1;
  return v5;
}

@end
