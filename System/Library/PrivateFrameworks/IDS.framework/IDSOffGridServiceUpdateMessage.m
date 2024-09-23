@implementation IDSOffGridServiceUpdateMessage

- (IDSOffGridServiceUpdateMessage)initWithPreferredServiceType:(int64_t)a3 senderURI:(id)a4 recipientURI:(id)a5
{
  id v9;
  id v10;
  void *v11;
  IDSOffGridServiceUpdateMessage *v12;
  IDSOffGridServiceUpdateMessage *v13;
  id *p_isa;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSOffGridServiceUpdateMessage;
    v13 = -[IDSOffGridServiceUpdateMessage init](&v16, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      v13->_preferredServiceType = a3;
      objc_storeStrong((id *)&v13->_senderURI, a4);
      objc_storeStrong(p_isa + 2, a5);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (IDSOffGridServiceUpdateMessage)initWithDictionaryMessage:(id)a3
{
  id v4;
  IDSOffGridServiceUpdateMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IDSURI *senderURI;
  void *v11;
  void *v12;
  uint64_t v13;
  IDSURI *recipientURI;
  uint64_t v15;
  NSDate *expirationDate;
  IDSOffGridServiceUpdateMessage *v17;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSOffGridServiceUpdateMessage;
    v5 = -[IDSOffGridServiceUpdateMessage init](&v19, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preferredService"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_preferredServiceType = (int)objc_msgSend(v6, "intValue");

      v7 = (void *)MEMORY[0x1E0D34EA8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderURI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URIWithPrefixedURI:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      senderURI = v5->_senderURI;
      v5->_senderURI = (IDSURI *)v9;

      v11 = (void *)MEMORY[0x1E0D34EA8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientURI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URIWithPrefixedURI:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      recipientURI = v5->_recipientURI;
      v5->_recipientURI = (IDSURI *)v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expirationDate"));
      v15 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v15;

    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *expirationDate;
  void *v8;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredServiceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFDictionarySetValue(v3, CFSTR("preferredService"), v4);

  -[IDSURI prefixedURI](self->_senderURI, "prefixedURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    CFDictionarySetValue(v3, CFSTR("senderURI"), v5);

  -[IDSURI prefixedURI](self->_recipientURI, "prefixedURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v3, CFSTR("recipientURI"), v6);

  expirationDate = self->_expirationDate;
  if (expirationDate)
    CFDictionarySetValue(v3, CFSTR("expirationDate"), expirationDate);
  v8 = (void *)-[__CFDictionary copy](v3, "copy");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridServiceUpdateMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IDSOffGridServiceUpdateMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientURI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IDSOffGridServiceUpdateMessage initWithPreferredServiceType:senderURI:recipientURI:]([IDSOffGridServiceUpdateMessage alloc], "initWithPreferredServiceType:senderURI:recipientURI:", (int)objc_msgSend(v5, "intValue"), v6, v7);
  -[IDSOffGridServiceUpdateMessage setExpirationDate:](v9, "setExpirationDate:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t preferredServiceType;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  preferredServiceType = self->_preferredServiceType;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", preferredServiceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("preferredService"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_senderURI, CFSTR("senderURI"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_recipientURI, CFSTR("recipientURI"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (IDSURI)recipientURI
{
  return self->_recipientURI;
}

- (int64_t)preferredServiceType
{
  return self->_preferredServiceType;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_recipientURI, 0);
  objc_storeStrong((id *)&self->_senderURI, 0);
}

@end
