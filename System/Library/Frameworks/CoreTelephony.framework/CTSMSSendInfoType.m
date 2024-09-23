@implementation CTSMSSendInfoType

- (CTSMSSendInfoType)init
{
  CTSMSSendInfoType *v2;
  CTSMSSendInfoType *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTSMSSendInfoType;
  v2 = -[CTSMSSendInfoType init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CTSMSSendInfoType setStatusType:](v2, "setStatusType:", 3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setError1:](v3, "setError1:", v4);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setError2:](v3, "setError2:", v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setRecommendedRetryDelayInSeconds:](v3, "setRecommendedRetryDelayInSeconds:", v6);

  }
  return v3;
}

- (CTSMSSendInfoType)initWithStatusType:(int64_t)a3 error1:(int)a4 error2:(int)a5 delay:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CTSMSSendInfoType *v10;
  CTSMSSendInfoType *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)CTSMSSendInfoType;
  v10 = -[CTSMSSendInfoType init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CTSMSSendInfoType setStatusType:](v10, "setStatusType:", a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setError1:](v11, "setError1:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setError2:](v11, "setError2:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTSMSSendInfoType setRecommendedRetryDelayInSeconds:](v11, "setRecommendedRetryDelayInSeconds:", v14);

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTSMSSendInfoType *v4;
  CTSMSSendInfoType *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (CTSMSSendInfoType *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CTSMSSendInfoType statusType](self, "statusType");
      if (v6 == -[CTSMSSendInfoType statusType](v5, "statusType"))
      {
        -[CTSMSSendInfoType error1](self, "error1");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSMSSendInfoType error1](v5, "error1");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToNumber:", v8))
        {
          -[CTSMSSendInfoType error2](self, "error2");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSMSSendInfoType error2](v5, "error2");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToNumber:", v10))
          {
            -[CTSMSSendInfoType recommendedRetryDelayInSeconds](self, "recommendedRetryDelayInSeconds");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTSMSSendInfoType recommendedRetryDelayInSeconds](v5, "recommendedRetryDelayInSeconds");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

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
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatusType:", -[CTSMSSendInfoType statusType](self, "statusType"));
  -[CTSMSSendInfoType error1](self, "error1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError1:", v5);

  -[CTSMSSendInfoType error2](self, "error2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError2:", v6);

  -[CTSMSSendInfoType recommendedRetryDelayInSeconds](self, "recommendedRetryDelayInSeconds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecommendedRetryDelayInSeconds:", v7);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t statusType;
  id v5;

  statusType = self->_statusType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", statusType, CFSTR("status_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error1, CFSTR("error1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error2, CFSTR("error2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recommendedRetryDelayInSeconds, CFSTR("recommended_retry_interval"));

}

- (CTSMSSendInfoType)initWithCoder:(id)a3
{
  id v4;
  CTSMSSendInfoType *v5;
  uint64_t v6;
  NSNumber *error1;
  uint64_t v8;
  NSNumber *error2;
  uint64_t v10;
  NSNumber *recommendedRetryDelayInSeconds;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSMSSendInfoType;
  v5 = -[CTSMSSendInfoType init](&v13, sel_init);
  if (v5)
  {
    v5->_statusType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("status_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error1"));
    v6 = objc_claimAutoreleasedReturnValue();
    error1 = v5->_error1;
    v5->_error1 = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error2"));
    v8 = objc_claimAutoreleasedReturnValue();
    error2 = v5->_error2;
    v5->_error2 = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommended_retry_interval"));
    v10 = objc_claimAutoreleasedReturnValue();
    recommendedRetryDelayInSeconds = v5->_recommendedRetryDelayInSeconds;
    v5->_recommendedRetryDelayInSeconds = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)error1
{
  return self->_error1;
}

- (void)setError1:(id)a3
{
  objc_storeStrong((id *)&self->_error1, a3);
}

- (NSNumber)error2
{
  return self->_error2;
}

- (void)setError2:(id)a3
{
  objc_storeStrong((id *)&self->_error2, a3);
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(int64_t)a3
{
  self->_statusType = a3;
}

- (NSNumber)recommendedRetryDelayInSeconds
{
  return self->_recommendedRetryDelayInSeconds;
}

- (void)setRecommendedRetryDelayInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedRetryDelayInSeconds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedRetryDelayInSeconds, 0);
  objc_storeStrong((id *)&self->_error2, 0);
  objc_storeStrong((id *)&self->_error1, 0);
}

@end
