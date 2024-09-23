@implementation IDSCloudKitTransportLogChangeToken

- (IDSCloudKitTransportLogChangeToken)initWithCKToken:(id)a3
{
  id v5;
  IDSCloudKitTransportLogChangeToken *v6;
  IDSCloudKitTransportLogChangeToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCloudKitTransportLogChangeToken;
  v6 = -[IDSCloudKitTransportLogChangeToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ckToken, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSCloudKitTransportLogChangeToken)initWithCoder:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  IDSCloudKitTransportLogChangeToken *v8;

  objc_msgSend_decodeObjectForKey_(a3, a2, (uint64_t)CFSTR("IDSCloudKitTransportLogChangeTokenCKToken"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (IDSCloudKitTransportLogChangeToken *)objc_msgSend_initWithCKToken_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_ckToken(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, CFSTR("IDSCloudKitTransportLogChangeTokenCKToken"));

}

- (IDSCKServerChangeToken)ckToken
{
  return self->_ckToken;
}

- (void)setCkToken:(id)a3
{
  objc_storeStrong((id *)&self->_ckToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckToken, 0);
}

@end
