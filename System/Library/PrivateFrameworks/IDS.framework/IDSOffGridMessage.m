@implementation IDSOffGridMessage

- (IDSOffGridMessage)initWithMessage:(id)a3 senderURI:(id)a4 recipientURI:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSOffGridMessage *v12;
  id *p_isa;
  IDSOffGridMessage *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IDSOffGridMessage;
  v12 = -[IDSOffGridMessage init](&v16, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12)
    goto LABEL_5;
  v14 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
LABEL_5:
    v14 = p_isa;
  }

  return v14;
}

- (IDSOffGridMessage)initWithDictionaryMessage:(id)a3
{
  id v4;
  IDSOffGridMessage *v5;
  uint64_t v6;
  NSData *message;
  uint64_t v8;
  NSString *service;
  void *v10;
  void *v11;
  uint64_t v12;
  IDSURI *senderURI;
  void *v14;
  void *v15;
  uint64_t v16;
  IDSURI *recipientURI;
  IDSOffGridMessage *v18;
  objc_super v20;

  v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)IDSOffGridMessage;
    v5 = -[IDSOffGridMessage init](&v20, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
      v6 = objc_claimAutoreleasedReturnValue();
      message = v5->_message;
      v5->_message = (NSData *)v6;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("service"));
      v8 = objc_claimAutoreleasedReturnValue();
      service = v5->_service;
      v5->_service = (NSString *)v8;

      v10 = (void *)MEMORY[0x1E0D34EA8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderURI"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URIWithPrefixedURI:withServiceLoggingHint:", v11, v5->_service);
      v12 = objc_claimAutoreleasedReturnValue();
      senderURI = v5->_senderURI;
      v5->_senderURI = (IDSURI *)v12;

      v14 = (void *)MEMORY[0x1E0D34EA8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientURI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URIWithPrefixedURI:withServiceLoggingHint:", v15, v5->_service);
      v16 = objc_claimAutoreleasedReturnValue();
      recipientURI = v5->_recipientURI;
      v5->_recipientURI = (IDSURI *)v16;

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSData *message;
  void *v6;
  void *v7;
  NSString *service;
  void *v9;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  message = self->_message;
  if (message)
    CFDictionarySetValue(v3, CFSTR("message"), message);
  -[IDSURI prefixedURI](self->_senderURI, "prefixedURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v4, CFSTR("senderURI"), v6);

  -[IDSURI prefixedURI](self->_recipientURI, "prefixedURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v4, CFSTR("recipientURI"), v7);

  service = self->_service;
  if (service)
    CFDictionarySetValue(v4, CFSTR("service"), service);
  v9 = (void *)-[__CFDictionary copy](v4, "copy");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IDSOffGridMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientURI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IDSOffGridMessage initWithMessage:senderURI:recipientURI:]([IDSOffGridMessage alloc], "initWithMessage:senderURI:recipientURI:", v5, v6, v7);
  -[IDSOffGridMessage setService:](v9, "setService:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *message;
  id v5;

  message = self->_message;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderURI, CFSTR("senderURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientURI, CFSTR("recipientURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("service"));

}

- (NSData)message
{
  return self->_message;
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (void)setSenderURI:(id)a3
{
  objc_storeStrong((id *)&self->_senderURI, a3);
}

- (IDSURI)recipientURI
{
  return self->_recipientURI;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recipientURI, 0);
  objc_storeStrong((id *)&self->_senderURI, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
