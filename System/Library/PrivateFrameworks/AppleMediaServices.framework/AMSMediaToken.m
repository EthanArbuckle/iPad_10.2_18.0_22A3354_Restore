@implementation AMSMediaToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSMediaToken)initWithCoder:(id)a3
{
  id v4;
  AMSMediaToken *v5;
  uint64_t v6;
  NSDate *expirationDate;
  double v8;
  uint64_t v9;
  NSString *tokenString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSMediaToken;
  v5 = -[AMSMediaToken init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("l"));
    v5->_lifetime = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
    v9 = objc_claimAutoreleasedReturnValue();
    tokenString = v5->_tokenString;
    v5->_tokenString = (NSString *)v9;

    v5->_valid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("v"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSMediaToken *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  AMSMediaToken *v11;

  v5 = [AMSMediaToken alloc];
  -[AMSMediaToken tokenString](self, "tokenString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[AMSMediaToken expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[AMSMediaToken lifetime](self, "lifetime");
  v11 = -[AMSMediaToken initWithString:expirationDate:lifetime:valid:](v5, "initWithString:expirationDate:lifetime:valid:", v7, v9, -[AMSMediaToken isValid](self, "isValid"), v10);

  return v11;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5 valid:(BOOL)a6
{
  id v10;
  id v11;
  AMSMediaToken *v12;
  uint64_t v13;
  NSString *tokenString;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSMediaToken;
  v12 = -[AMSMediaToken init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    tokenString = v12->_tokenString;
    v12->_tokenString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_lifetime = a5;
    v12->_valid = a6;
  }

  return v12;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  BOOL v4;

  -[AMSMediaToken expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 < 0.0;

  return v4;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)percentageOfLifetimeRemaining
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AMSMediaToken expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;
  -[AMSMediaToken lifetime](self, "lifetime");
  v7 = v5 / v6;

  return v7;
}

- (double)lifetime
{
  return self->_lifetime;
}

- (BOOL)willExpireWithin:(double)a3
{
  void *v4;
  double v5;
  BOOL v6;

  -[AMSMediaToken expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5 < a3;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5
{
  return -[AMSMediaToken initWithString:expirationDate:lifetime:valid:](self, "initWithString:expirationDate:lifetime:valid:", a3, a4, 1, a5);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSMediaToken expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("e"));

  -[AMSMediaToken lifetime](self, "lifetime");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("l"));
  -[AMSMediaToken tokenString](self, "tokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("t"));

  objc_msgSend(v6, "encodeBool:forKey:", -[AMSMediaToken isValid](self, "isValid"), CFSTR("v"));
}

- (id)invalidCopy
{
  _BYTE *v2;

  v2 = (_BYTE *)-[AMSMediaToken copy](self, "copy");
  v2[8] = 0;
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSMediaToken tokenString](self, "tokenString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("tokenString"));

  -[AMSMediaToken expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("expirationDate"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSMediaToken lifetime](self, "lifetime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("lifetime"));

  if (-[AMSMediaToken isValid](self, "isValid"))
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("valid"));
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    v13 = 0;
    v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  v5 = v4;

  if (v5)
  {
    -[AMSMediaToken tokenString](self, "tokenString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[AMSMediaToken expirationDate](self, "expirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDate:", v9))
      {
        -[AMSMediaToken lifetime](self, "lifetime");
        v11 = v10;
        objc_msgSend(v5, "lifetime");
        v13 = v11 == v12;
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

    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

@end
