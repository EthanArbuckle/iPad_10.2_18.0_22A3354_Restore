@implementation AFAssertionContext

- (AFAssertionContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAssertionContextMutation *);
  AFAssertionContext *v5;
  AFAssertionContext *v6;
  _AFAssertionContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *reason;
  void *v11;
  uint64_t v12;
  NSDate *effectiveDate;
  double v14;
  void *v15;
  uint64_t v16;
  NSDictionary *userInfo;
  objc_super v19;

  v4 = (void (**)(id, _AFAssertionContextMutation *))a3;
  v19.receiver = self;
  v19.super_class = (Class)AFAssertionContext;
  v5 = -[AFAssertionContext init](&v19, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAssertionContextMutation initWithBase:]([_AFAssertionContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAssertionContextMutation isDirty](v7, "isDirty"))
    {
      v6->_timestamp = -[_AFAssertionContextMutation getTimestamp](v7, "getTimestamp");
      -[_AFAssertionContextMutation getReason](v7, "getReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v9;

      -[_AFAssertionContextMutation getEffectiveDate](v7, "getEffectiveDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v12;

      -[_AFAssertionContextMutation getExpirationDuration](v7, "getExpirationDuration");
      v6->_expirationDuration = v14;
      -[_AFAssertionContextMutation getUserInfo](v7, "getUserInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v16;

    }
  }

  return v6;
}

- (AFAssertionContext)init
{
  return -[AFAssertionContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AFAssertionContext *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  double v25;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__AFAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke;
  v20[3] = &unk_1E3A2D870;
  v21 = v12;
  v22 = v13;
  v25 = a6;
  v23 = v14;
  v24 = a3;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = -[AFAssertionContext initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (NSString)description
{
  return (NSString *)-[AFAssertionContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFAssertionContext;
  -[AFAssertionContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timestamp = %llu, reason = %@, effectiveDate = %@, expirationDuration = %f, userInfo = %@}"), v5, self->_timestamp, self->_reason, self->_effectiveDate, *(_QWORD *)&self->_expirationDuration, self->_userInfo);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_reason, "hash");
  v6 = v5 ^ -[NSDate hash](self->_effectiveDate, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSDictionary hash](self->_userInfo, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFAssertionContext *v4;
  AFAssertionContext *v5;
  unint64_t timestamp;
  double expirationDuration;
  double v8;
  BOOL v9;
  NSString *v11;
  NSString *reason;
  NSDate *v13;
  NSDate *effectiveDate;
  NSDictionary *v15;
  NSDictionary *userInfo;

  v4 = (AFAssertionContext *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timestamp = self->_timestamp;
      if (timestamp == -[AFAssertionContext timestamp](v5, "timestamp")
        && (expirationDuration = self->_expirationDuration,
            -[AFAssertionContext expirationDuration](v5, "expirationDuration"),
            expirationDuration == v8))
      {
        -[AFAssertionContext reason](v5, "reason");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        reason = self->_reason;
        if (reason == v11 || -[NSString isEqual:](reason, "isEqual:", v11))
        {
          -[AFAssertionContext effectiveDate](v5, "effectiveDate");
          v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
          effectiveDate = self->_effectiveDate;
          if (effectiveDate == v13 || -[NSDate isEqual:](effectiveDate, "isEqual:", v13))
          {
            -[AFAssertionContext userInfo](v5, "userInfo");
            v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            userInfo = self->_userInfo;
            v9 = userInfo == v15 || -[NSDictionary isEqual:](userInfo, "isEqual:", v15);

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFAssertionContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  AFAssertionContext *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAssertionContext::timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAssertionContext::reason"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAssertionContext::effectiveDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAssertionContext::expirationDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v23 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v22, v21, v8, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("AFAssertionContext::userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[AFAssertionContext initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:](self, "initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:", v26, v25, v24, v18, v7);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  timestamp = self->_timestamp;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("AFAssertionContext::timestamp"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_reason, CFSTR("AFAssertionContext::reason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_effectiveDate, CFSTR("AFAssertionContext::effectiveDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("AFAssertionContext::expirationDuration"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_userInfo, CFSTR("AFAssertionContext::userInfo"));
}

- (AFAssertionContext)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFAssertionContext *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v9 = objc_msgSend(v7, "unsignedLongLongValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("effectiveDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("expirationDuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(v5, "objectForKey:", CFSTR("userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    self = -[AFAssertionContext initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:](self, "initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:", v9, v11, v13, v19, v17);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *reason;
  NSDate *effectiveDate;
  void *v7;
  NSDictionary *userInfo;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKey:", reason, CFSTR("reason"));
  effectiveDate = self->_effectiveDate;
  if (effectiveDate)
    objc_msgSend(v3, "setObject:forKey:", effectiveDate, CFSTR("effectiveDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("expirationDuration"));

  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

void __89__AFAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setReason:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setEffectiveDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setExpirationDuration:", *(double *)(a1 + 64));
  objc_msgSend(v4, "setUserInfo:", *(_QWORD *)(a1 + 48));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFAssertionContextMutation *);
  _AFAssertionContextMutation *v5;
  AFAssertionContext *v6;
  void *v7;
  uint64_t v8;
  NSString *reason;
  void *v10;
  uint64_t v11;
  NSDate *effectiveDate;
  double v13;
  void *v14;
  uint64_t v15;
  NSDictionary *userInfo;

  v4 = (void (**)(id, _AFAssertionContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAssertionContextMutation initWithBase:]([_AFAssertionContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAssertionContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAssertionContext);
      v6->_timestamp = -[_AFAssertionContextMutation getTimestamp](v5, "getTimestamp");
      -[_AFAssertionContextMutation getReason](v5, "getReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v8;

      -[_AFAssertionContextMutation getEffectiveDate](v5, "getEffectiveDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v11;

      -[_AFAssertionContextMutation getExpirationDuration](v5, "getExpirationDuration");
      v6->_expirationDuration = v13;
      -[_AFAssertionContextMutation getUserInfo](v5, "getUserInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v15;

    }
    else
    {
      v6 = (AFAssertionContext *)-[AFAssertionContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAssertionContext *)-[AFAssertionContext copy](self, "copy");
  }

  return v6;
}

@end
