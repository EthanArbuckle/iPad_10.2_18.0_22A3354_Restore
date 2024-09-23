@implementation APSURLTokenInfo

- (APSURLTokenInfo)initWithTopic:(id)a3
{
  return -[APSURLTokenInfo initWithTopic:vapidPublicKey:expirationDate:](self, "initWithTopic:vapidPublicKey:expirationDate:", a3, 0, 0);
}

- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4
{
  return -[APSURLTokenInfo initWithTopic:vapidPublicKey:expirationDate:](self, "initWithTopic:vapidPublicKey:expirationDate:", a3, a4, 0);
}

- (APSURLTokenInfo)initWithTopic:(id)a3 vapidPublicKey:(id)a4 expirationDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  APSURLTokenInfo *v12;
  id *p_isa;
  APSURLTokenInfo *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)APSURLTokenInfo;
    v12 = -[APSURLTokenInfo init](&v16, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_topic, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (APSURLTokenInfo)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  APSURLTokenInfo *v9;
  APSURLTokenInfo *v10;
  void *v11;
  uint64_t v12;
  NSDate *expirationDate;
  APSURLTokenInfo *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vPK"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eD"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bT"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16.receiver = self;
        v16.super_class = (Class)APSURLTokenInfo;
        v9 = -[APSURLTokenInfo init](&v16, sel_init);
        v10 = v9;
        if (v9)
        {
          objc_storeStrong((id *)&v9->_topic, v5);
          objc_storeStrong((id *)&v10->_vapidPublicKey, v6);
          if (v7)
          {
            v11 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v7, "doubleValue");
            objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
            v12 = objc_claimAutoreleasedReturnValue();
            expirationDate = v10->_expirationDate;
            v10->_expirationDate = (NSDate *)v12;
          }
          else
          {
            expirationDate = v10->_expirationDate;
            v10->_expirationDate = 0;
          }

          objc_storeStrong((id *)&v10->_baseToken, v8);
        }
        self = v10;

        v14 = self;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[APSURLTokenInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("t"));

  -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("vPK"));

  -[APSURLTokenInfo expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[APSURLTokenInfo expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eD"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("eD"));
  }

  -[APSURLTokenInfo baseToken](self, "baseToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bT"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[APSURLTokenInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[APSURLTokenInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[APSURLTokenInfo type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLTokenInfo baseToken](self, "baseToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<APSURLTokenInfo %p>: Topic: %@ VapidPublicKey: %@ Expiration: %@ Type: %@ Base Token: %@"), self, v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_28;
  }
  v6 = v5;
  -[APSURLTokenInfo topic](self, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v6, "vapidPublicKey"), (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vapidPublicKey");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToData:", v3) & 1) == 0)
      {

        v13 = 0;
        goto LABEL_16;
      }
      v29 = v10;
      v11 = 1;
    }
    else
    {
      v27 = 0;
      v11 = 0;
    }
    v26 = v3;
    -[APSURLTokenInfo expirationDate](self, "expirationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v6, "expirationDate"), (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = v11;
      -[APSURLTokenInfo expirationDate](self, "expirationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expirationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "isEqualToDate:", v16);

      if (v14)
      {

        v17 = v29;
        if (v28)
        {
LABEL_15:

        }
LABEL_16:
        if (!v9)

        goto LABEL_19;
      }
      v17 = v29;
      LOBYTE(v11) = v28;
      v24 = (void *)v25;
    }
    else
    {
      v24 = 0;
      v13 = 1;
      v17 = v29;
    }

    if ((v11 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v13 = 0;
LABEL_19:

  -[APSURLTokenInfo baseToken](self, "baseToken");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v6, "baseToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v12 = 0;
    else
      v12 = v13;
    if (v20 && ((v13 ^ 1) & 1) == 0)
    {
      -[APSURLTokenInfo baseToken](self, "baseToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "baseToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqualToData:", v22);

    }
  }
  else
  {
    v12 = v13;
  }

LABEL_28:
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[APSURLTokenInfo topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v6, "hash");

  }
  -[APSURLTokenInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[APSURLTokenInfo expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 ^= objc_msgSend(v8, "hash");

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[APSURLTokenInfo topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("t"));

  -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("vPK"));

  -[APSURLTokenInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("eD"));

  -[APSURLTokenInfo baseToken](self, "baseToken");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bT"));

}

- (APSURLTokenInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  APSURLTokenInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vPK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[APSURLTokenInfo initWithTopic:vapidPublicKey:expirationDate:](self, "initWithTopic:vapidPublicKey:expirationDate:", v5, v6, v7);
  -[APSURLTokenInfo setBaseToken:](v9, "setBaseToken:", v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  APSURLTokenInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  APSURLTokenInfo *v8;
  void *v9;

  v4 = [APSURLTokenInfo alloc];
  -[APSURLTokenInfo topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLTokenInfo vapidPublicKey](self, "vapidPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLTokenInfo expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[APSURLTokenInfo initWithTopic:vapidPublicKey:expirationDate:](v4, "initWithTopic:vapidPublicKey:expirationDate:", v5, v6, v7);

  -[APSURLTokenInfo baseToken](self, "baseToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSURLTokenInfo setBaseToken:](v8, "setBaseToken:", v9);

  return v8;
}

- (int64_t)type
{
  return 2;
}

- (NSString)identifier
{
  return 0;
}

- (BOOL)allowMultipleTokens
{
  return 0;
}

- (NSData)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
  objc_storeStrong((id *)&self->_baseToken, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (NSData)vapidPublicKey
{
  return self->_vapidPublicKey;
}

- (void)setVapidPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_vapidPublicKey, a3);
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
  objc_storeStrong((id *)&self->_vapidPublicKey, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

@end
