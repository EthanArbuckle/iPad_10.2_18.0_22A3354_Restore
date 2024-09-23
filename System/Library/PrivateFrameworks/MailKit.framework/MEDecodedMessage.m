@implementation MEDecodedMessage

- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context
{
  return -[MEDecodedMessage initWithData:securityInformation:context:banner:](self, "initWithData:securityInformation:context:banner:", rawData, securityInformation, context, 0);
}

- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context banner:(MEDecodedMessageBanner *)banner
{
  NSData *v11;
  MEMessageSecurityInformation *v12;
  NSData *v13;
  MEDecodedMessageBanner *v14;
  MEDecodedMessage *v15;
  MEDecodedMessage *v16;
  objc_super v18;

  v11 = rawData;
  v12 = securityInformation;
  v13 = context;
  v14 = banner;
  v18.receiver = self;
  v18.super_class = (Class)MEDecodedMessage;
  v15 = -[MEDecodedMessage init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rawData, rawData);
    objc_storeStrong((id *)&v16->_securityInformation, securityInformation);
    objc_storeStrong((id *)&v16->_context, context);
    objc_storeStrong((id *)&v16->_banner, banner);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEDecodedMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MEDecodedMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rawData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_banner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_securityInformation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MEDecodedMessage initWithData:securityInformation:context:banner:](self, "initWithData:securityInformation:context:banner:", v5, v8, v6, v7);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MEDecodedMessage rawData](self, "rawData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_rawData"));

  -[MEDecodedMessage securityInformation](self, "securityInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_securityInformation"));

  -[MEDecodedMessage context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_context"));

  -[MEDecodedMessage banner](self, "banner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_banner"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEDecodedMessage rawData](self, "rawData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      -[MEDecodedMessage securityInformation](self, "securityInformation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "securityInformation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[MEDecodedMessage context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[MEDecodedMessage banner](self, "banner");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "banner");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = EFObjectsAreEqual();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (MEMessageSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (NSData)context
{
  return self->_context;
}

- (MEDecodedMessageBanner)banner
{
  return self->_banner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
