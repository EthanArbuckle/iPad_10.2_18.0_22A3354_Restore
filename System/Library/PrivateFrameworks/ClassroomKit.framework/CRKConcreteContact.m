@implementation CRKConcreteContact

- (CRKConcreteContact)initWithContact:(id)a3
{
  id v5;
  CRKConcreteContact *v6;
  CRKConcreteContact *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteContact;
  v6 = -[CRKConcreteContact init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingContact, a3);

  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)nickname
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)familyName
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)givenName
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)phoneticFamilyName
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneticFamilyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)phoneticGivenName
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneticGivenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)thumbnailImageData
{
  void *v2;
  void *v3;

  -[CRKConcreteContact underlyingContact](self, "underlyingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (CNContact)underlyingContact
{
  return self->_underlyingContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContact, 0);
}

@end
