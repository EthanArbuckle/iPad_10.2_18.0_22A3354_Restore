@implementation EDAMSavedSearchScope

+ (id)structName
{
  return CFSTR("SavedSearchScope");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1641;
  if (!structFields_structFields_1641)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("includeAccount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("includePersonalLinkedNotebooks"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("includeBusinessLinkedNotebooks"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1641;
    structFields_structFields_1641 = v6;

    v2 = (void *)structFields_structFields_1641;
  }
  return v2;
}

- (NSNumber)includeAccount
{
  return self->_includeAccount;
}

- (void)setIncludeAccount:(id)a3
{
  objc_storeStrong((id *)&self->_includeAccount, a3);
}

- (NSNumber)includePersonalLinkedNotebooks
{
  return self->_includePersonalLinkedNotebooks;
}

- (void)setIncludePersonalLinkedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includePersonalLinkedNotebooks, a3);
}

- (NSNumber)includeBusinessLinkedNotebooks
{
  return self->_includeBusinessLinkedNotebooks;
}

- (void)setIncludeBusinessLinkedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeBusinessLinkedNotebooks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeBusinessLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includePersonalLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeAccount, 0);
}

@end
