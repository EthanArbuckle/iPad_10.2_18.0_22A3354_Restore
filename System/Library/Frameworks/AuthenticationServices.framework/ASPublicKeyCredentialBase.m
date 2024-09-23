@implementation ASPublicKeyCredentialBase

- (ASPublicKeyCredentialBase)initWithCredentialID:(id)a3 rawClientDataJSON:(id)a4 attachment:(int64_t)a5
{
  id v8;
  id v9;
  ASPublicKeyCredentialBase *v10;
  uint64_t v11;
  NSData *credentialID;
  uint64_t v13;
  NSData *rawClientDataJSON;
  ASPublicKeyCredentialBase *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASPublicKeyCredentialBase;
  v10 = -[ASPublicKeyCredentialBase init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    credentialID = v10->_credentialID;
    v10->_credentialID = (NSData *)v11;

    v13 = objc_msgSend(v9, "copy");
    rawClientDataJSON = v10->_rawClientDataJSON;
    v10->_rawClientDataJSON = (NSData *)v13;

    v10->_attachment = a5;
    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCredentialID:rawClientDataJSON:attachment:", self->_credentialID, self->_rawClientDataJSON, self->_attachment);
}

- (void)encodeWithCoder:(id)a3
{
  NSData *credentialID;
  id v5;

  credentialID = self->_credentialID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawClientDataJSON, CFSTR("rawClientDataJSON"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attachment, CFSTR("attachment"));

}

- (ASPublicKeyCredentialBase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ASPublicKeyCredentialBase *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawClientDataJSON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attachment"));

  v8 = -[ASPublicKeyCredentialBase initWithCredentialID:rawClientDataJSON:attachment:](self, "initWithCredentialID:rawClientDataJSON:attachment:", v5, v6, v7);
  return v8;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (int64_t)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(int64_t)a3
{
  self->_attachment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
}

@end
