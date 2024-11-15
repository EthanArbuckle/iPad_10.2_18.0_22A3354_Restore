@implementation RepairToolRequestItem

- (RepairToolRequestItem)initWithDestination:(id)a3 andEncryptionKey:(id)a4 andToken:(id)a5 andExtraHeaders:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RepairToolRequestItem *v15;
  RepairToolRequestItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RepairToolRequestItem;
  v15 = -[RepairToolRequestItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_destination, a3);
    objc_storeStrong((id *)&v16->_encryptionKey, a4);
    objc_storeStrong((id *)&v16->_token, a5);
    objc_storeStrong((id *)&v16->_extraHeaders, a6);
  }

  return v16;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSString)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSDictionary)extraHeaders
{
  return self->_extraHeaders;
}

- (void)setExtraHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_extraHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraHeaders, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
