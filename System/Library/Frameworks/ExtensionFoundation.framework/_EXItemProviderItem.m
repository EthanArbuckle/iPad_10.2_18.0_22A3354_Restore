@implementation _EXItemProviderItem

- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  _EXItemProviderItem *v8;
  uint64_t v9;
  NSString *typeIdentifier;
  uint64_t v11;
  NSUUID *payloadIdentifier;

  v6 = a3;
  v7 = a4;
  v8 = -[_EXItemProviderItem init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    typeIdentifier = v8->_typeIdentifier;
    v8->_typeIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_payload, a4);
    if (v7)
    {
      v11 = objc_opt_new();
      payloadIdentifier = v8->_payloadIdentifier;
      v8->_payloadIdentifier = (NSUUID *)v11;

    }
  }

  return v8;
}

- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _EXItemProviderItem *v8;
  uint64_t v9;
  NSString *typeIdentifier;

  v6 = a3;
  v7 = a4;
  v8 = -[_EXItemProviderItem init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    typeIdentifier = v8->_typeIdentifier;
    v8->_typeIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderItem)initWithCoder:(id)a3
{
  id v4;
  _EXItemProviderItem *v5;
  uint64_t v6;
  NSString *typeIdentifier;
  uint64_t v8;
  NSUUID *payloadIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSError *error;

  v4 = a3;
  v5 = -[_EXItemProviderItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    payloadIdentifier = v5->_payloadIdentifier;
    v5->_payloadIdentifier = (NSUUID *)v8;

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("error"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  NSUUID *payloadIdentifier;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("typeIdentifier"));
  error = self->_error;
  if (error)
    objc_msgSend(v6, "encodeObject:forKey:", error, CFSTR("error"));
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier)
    objc_msgSend(v6, "encodeObject:forKey:", payloadIdentifier, CFSTR("payloadIdentifier"));

}

- (id)payloadOfClass:(Class)a3
{
  NSObject *payload;
  NSCoder *encodedPayload;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  payload = self->_payload;
  if (!payload)
  {
    encodedPayload = self->_encodedPayload;
    if (!encodedPayload)
    {
      v10 = 0;
      return v10;
    }
    -[NSUUID UUIDString](self->_payloadIdentifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](encodedPayload, "decodeObjectOfClass:forKey:", a3, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
  }
  v10 = payload;
  return v10;
}

- (id)payloadOfClasses:(id)a3
{
  id v4;
  NSObject *payload;
  NSCoder *encodedPayload;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  payload = self->_payload;
  if (!payload)
  {
    encodedPayload = self->_encodedPayload;
    if (!encodedPayload)
    {
      v10 = 0;
      goto LABEL_5;
    }
    -[NSUUID UUIDString](self->_payloadIdentifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](encodedPayload, "decodeObjectOfClasses:forKey:", v4, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
  }
  v10 = payload;
LABEL_5:

  return v10;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)payloadIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSObject)payload
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSCoder)encodedPayload
{
  return (NSCoder *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncodedPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedPayload, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

@end
