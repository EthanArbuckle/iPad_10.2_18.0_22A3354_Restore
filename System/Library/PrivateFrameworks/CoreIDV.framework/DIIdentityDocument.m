@implementation DIIdentityDocument

- (DIIdentityDocument)initWithEncryptedData:(id)a3
{
  id v5;
  DIIdentityDocument *v6;
  DIIdentityDocument *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIIdentityDocument;
  v6 = -[DIIdentityDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_encryptedData, a3);

  return v7;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end
