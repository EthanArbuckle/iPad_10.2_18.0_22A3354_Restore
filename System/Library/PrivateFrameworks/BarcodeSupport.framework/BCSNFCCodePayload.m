@implementation BCSNFCCodePayload

- (BCSNFCCodePayload)initWithNFCPayload:(id)a3
{
  id v5;
  BCSNFCCodePayload *v6;
  BCSNFCCodePayload *v7;
  BCSNFCCodePayload *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSNFCCodePayload;
  v6 = -[BCSNFCCodePayload init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nfcPayload, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 2;
}

- (void)savePayloadInUserActivity:(id)a3
{
  objc_msgSend(a3, "setNdefMessagePayload:", self->_nfcPayload);
}

- (BCSNFCCodePayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSNFCCodePayload *v6;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getNFCNDEFMessageClass(), CFSTR("payloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSNFCCodePayload initWithNFCPayload:](self, "initWithNFCPayload:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_nfcPayload, CFSTR("payloadData"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcPayload, 0);
}

@end
