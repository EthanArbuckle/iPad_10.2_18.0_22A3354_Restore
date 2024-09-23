@implementation APSAppTokenInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

- (APSAppTokenInfo)initWithDictionary:(id)a3
{
  id v4;
  APSAppTokenInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APSAppTokenInfo;
  v5 = -[APSAppTokenInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoTopic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSAppTokenInfo setTopic:](v5, "setTopic:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSAppTokenInfo setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoBaseTokenKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoBaseTokenKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSAppTokenInfo setBaseToken:](v5, "setBaseToken:", v9);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoExpirationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoExpirationDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSAppTokenInfo setExpirationDate:](v5, "setExpirationDate:", v13);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("APSAppTokenInfoIsUnextendedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSAppTokenInfo setIsUnextended:](v5, "setIsUnextended:", objc_msgSend(v14, "BOOLValue"));

  }
  return v5;
}

- (void)setBaseToken:(id)a3
{
  objc_storeStrong((id *)&self->_baseToken, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_27;
  }
  v5 = v4;
  -[APSAppTokenInfo topic](self, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[APSAppTokenInfo identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v5, "identifier"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[APSAppTokenInfo identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        if (!v8)
          goto LABEL_18;
      }
      else
      {

        if ((v8 & 1) == 0)
          goto LABEL_17;
      }
    }
    -[APSAppTokenInfo expirationDate](self, "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v5, "expirationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_16;
    }
    -[APSAppTokenInfo expirationDate](self, "expirationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v14, "isEqual:", v15);

    if (v13)
    {

      if (!v8)
        goto LABEL_18;
      goto LABEL_16;
    }

    if ((v8 & 1) != 0)
    {
LABEL_16:
      v16 = -[APSAppTokenInfo isUnextended](self, "isUnextended");
      v8 = v16 ^ objc_msgSend(v5, "isUnextended") ^ 1;
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
  }
LABEL_18:
  -[APSAppTokenInfo baseToken](self, "baseToken");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v5, "baseToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v12 = 0;
    else
      v12 = v8;
    if (v19 && ((v8 ^ 1) & 1) == 0)
    {
      -[APSAppTokenInfo baseToken](self, "baseToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "baseToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v20, "isEqualToData:", v21);

    }
  }
  else
  {
    v12 = v8;
  }

LABEL_27:
  return v12;
}

- (NSData)baseToken
{
  return self->_baseToken;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return -[APSAppTokenInfo isUnextended](self, "isUnextended") ^ 1;
}

- (BOOL)isUnextended
{
  return self->_isUnextended;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)initUnextendedAppTokenWithTopic:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  APSAppTokenInfo *v8;
  APSAppTokenInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  v8 = -[APSAppTokenInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[APSAppTokenInfo setTopic:](v8, "setTopic:", v6);
    -[APSAppTokenInfo setIdentifier:](v9, "setIdentifier:", v7);
    -[APSAppTokenInfo setIsUnextended:](v9, "setIsUnextended:", 1);
  }

  return v9;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setIsUnextended:(BOOL)a3
{
  self->_isUnextended = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (APSAppTokenInfo)initWithTopic:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  APSAppTokenInfo *v8;
  APSAppTokenInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  v8 = -[APSAppTokenInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[APSAppTokenInfo setTopic:](v8, "setTopic:", v6);
    -[APSAppTokenInfo setIdentifier:](v9, "setIdentifier:", v7);
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[APSAppTokenInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("APSAppTokenInfoTopic"));

  -[APSAppTokenInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("APSAppTokenInfoIdentifier"));

  -[APSAppTokenInfo baseToken](self, "baseToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[APSAppTokenInfo baseToken](self, "baseToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("APSAppTokenInfoBaseTokenKey"));

  }
  -[APSAppTokenInfo expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[APSAppTokenInfo expirationDate](self, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("APSAppTokenInfoExpirationDate"));

  }
  if (-[APSAppTokenInfo isUnextended](self, "isUnextended"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[APSAppTokenInfo isUnextended](self, "isUnextended"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("APSAppTokenInfoIsUnextendedKey"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[APSAppTokenInfo topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[APSAppTokenInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[APSAppTokenInfo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v6, "hash");

  }
  -[APSAppTokenInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[APSAppTokenInfo expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v8, "hash");

  }
  return v4 ^ -[APSAppTokenInfo isUnextended](self, "isUnextended");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[APSAppTokenInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[APSAppTokenInfo type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo baseToken](self, "baseToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<APSAppTokenInfo %p>: Topic %@ Identifier %@ Expiration %@ type %@ base token %@"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[APSAppTokenInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("APSAppTokenInfoTopic"));

  -[APSAppTokenInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("APSAppTokenInfoIdentifier"));

  -[APSAppTokenInfo baseToken](self, "baseToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[APSAppTokenInfo baseToken](self, "baseToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("APSAppTokenInfoBaseTokenKey"));

  }
  -[APSAppTokenInfo expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[APSAppTokenInfo expirationDate](self, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("APSAppTokenInfoExpirationDate"));

  }
  objc_msgSend(v10, "encodeBool:forKey:", -[APSAppTokenInfo isUnextended](self, "isUnextended"), CFSTR("APSAppTokenInfoIsUnextendedKey"));

}

- (APSAppTokenInfo)initWithCoder:(id)a3
{
  id v4;
  APSAppTokenInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSAppTokenInfo;
  v5 = -[APSAppTokenInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSAppTokenInfoTopic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSAppTokenInfo setTopic:](v5, "setTopic:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSAppTokenInfoIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSAppTokenInfo setIdentifier:](v5, "setIdentifier:", v7);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("APSAppTokenInfoBaseTokenKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSAppTokenInfoBaseTokenKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSAppTokenInfo setBaseToken:](v5, "setBaseToken:", v8);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("APSAppTokenInfoExpirationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSAppTokenInfoExpirationDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSAppTokenInfo setExpirationDate:](v5, "setExpirationDate:", v9);

    }
    -[APSAppTokenInfo setIsUnextended:](v5, "setIsUnextended:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("APSAppTokenInfoIsUnextendedKey")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  APSAppTokenInfo *v4;
  void *v5;
  void *v6;
  APSAppTokenInfo *v7;
  void *v8;
  void *v9;

  v4 = [APSAppTokenInfo alloc];
  -[APSAppTokenInfo topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[APSAppTokenInfo initWithTopic:identifier:](v4, "initWithTopic:identifier:", v5, v6);

  -[APSAppTokenInfo expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo setExpirationDate:](v7, "setExpirationDate:", v8);

  -[APSAppTokenInfo setIsUnextended:](v7, "setIsUnextended:", -[APSAppTokenInfo isUnextended](self, "isUnextended"));
  -[APSAppTokenInfo baseToken](self, "baseToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSAppTokenInfo setBaseToken:](v7, "setBaseToken:", v9);

  return v7;
}

- (NSData)vapidPublicKey
{
  return 0;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

@end
