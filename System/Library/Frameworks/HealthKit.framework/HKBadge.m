@implementation HKBadge

- (HKBadge)initWithType:(int64_t)a3 count:(int64_t)a4
{
  HKBadge *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKBadge;
  result = -[HKBadge init](&v7, sel_init);
  if (result)
  {
    result->_count = a4;
    result->_type = a3;
  }
  return result;
}

+ (HKBadge)zeroBadge
{
  return (HKBadge *)objc_msgSend(a1, "numberBadgeWithCount:", 0);
}

+ (HKBadge)indicatorBadge
{
  return (HKBadge *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:count:", 0, 0);
}

+ (HKBadge)errorBadge
{
  return (HKBadge *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:count:", 2, 0);
}

+ (id)numberBadgeWithCount:(int64_t)a3
{
  void *v7;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKBadge.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 0"));

  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:count:", 1, a3);
}

- (id)badgeByAggregatingWithBadge:(id)a3
{
  id v4;
  HKBadge *v5;
  _QWORD *v6;
  HKBadge *v7;
  HKBadge *v8;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = self;
  v6 = v4;
  if (-[HKBadge isErrorBadge](v5, "isErrorBadge") || objc_msgSend(v6, "isErrorBadge"))
  {
    +[HKBadge errorBadge](HKBadge, "errorBadge");
    v7 = (HKBadge *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (-[HKBadge isZeroBadge](v5, "isZeroBadge"))
  {
LABEL_8:
    v7 = v6;
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isZeroBadge"))
    goto LABEL_10;
  if (-[HKBadge isIndicatorBadge](v5, "isIndicatorBadge"))
    goto LABEL_8;
  if (objc_msgSend(v6, "isIndicatorBadge"))
  {
LABEL_10:
    v7 = v5;
    goto LABEL_4;
  }
  if (!-[HKBadge isNumberBadge](v5, "isNumberBadge") || (objc_msgSend(v6, "isNumberBadge") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKBadge * _Nonnull _aggregateBadges(HKBadge * _Nonnull __strong, HKBadge * _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HKBadge.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("badge1.isNumberBadge && badge2.isNumberBadge"));

  }
  +[HKBadge numberBadgeWithCount:](HKBadge, "numberBadgeWithCount:", v6[1] + v5->_count);
  v7 = (HKBadge *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v8 = v7;

  return v8;
}

- (id)badgeByIncrementingByCount:(int64_t)a3
{
  HKBadge *v5;
  void *v8;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBadge.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 0"));

  }
  v5 = -[HKBadge type](self, "type");
  if (v5 == (HKBadge *)2)
    goto LABEL_6;
  if (v5 == (HKBadge *)1)
  {
    +[HKBadge numberBadgeWithCount:](HKBadge, "numberBadgeWithCount:", self->_count + a3);
    v5 = (HKBadge *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (!v5)
LABEL_6:
    v5 = self;
  return v5;
}

- (id)description
{
  int64_t v3;
  __CFString *v4;

  v3 = -[HKBadge type](self, "type");
  if (v3 == 1)
  {
    if (-[HKBadge isZeroBadge](self, "isZeroBadge"))
    {
      v4 = CFSTR("none");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), self->_count);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v3 == 2)
  {
    v4 = CFSTR("error");
  }
  else
  {
    v4 = CFSTR("indicator");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HKBadge *v4;
  HKBadge *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (HKBadge *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[HKBadge isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[HKBadge type](v5, "type");
    if (v6 == -[HKBadge type](self, "type"))
    {
      -[HKBadge value](v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKBadge value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 == v8;

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

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HKBadge type](self, "type");
  -[HKBadge value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKBadge type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_count, CFSTR("count"));

}

- (HKBadge)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  HKBadge *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));

  v7 = 0;
  if (v5 <= 2 && (v6 & 0x8000000000000000) == 0)
  {
    self = -[HKBadge initWithType:count:](self, "initWithType:count:", v5, v6);
    v7 = self;
  }

  return v7;
}

- (BOOL)isErrorBadge
{
  return -[HKBadge type](self, "type") == 2;
}

- (BOOL)isIndicatorBadge
{
  return -[HKBadge type](self, "type") == 0;
}

- (BOOL)isNumberBadge
{
  return -[HKBadge type](self, "type") == 1;
}

- (BOOL)isZeroBadge
{
  _BOOL4 v3;

  v3 = -[HKBadge isNumberBadge](self, "isNumberBadge");
  if (v3)
    LOBYTE(v3) = self->_count == 0;
  return v3;
}

- (NSObject)value
{
  int64_t v3;
  __CFString *v4;

  v3 = -[HKBadge type](self, "type");
  if (v3 == 1)
  {
    if (-[HKBadge isZeroBadge](self, "isZeroBadge"))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v3 == 2)
  {
    v4 = CFSTR("!");
  }
  else
  {
    v4 = &stru_1E37FD4C0;
  }
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)stringValue
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  HKBadge *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HKBadge value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "stringValue");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    _HKInitializeLogging();
    v6 = HKLogNotifications;
    if (os_log_type_enabled((os_log_t)HKLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = v3;
      v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Invalid badge value %{public}@ for %{public}@.", (uint8_t *)&v8, 0x16u);
    }
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v4 = v3;
LABEL_6:
  v5 = v4;
LABEL_10:

  return (NSString *)v5;
}

- (NSNumber)keyValueRepresentation
{
  int64_t v3;
  void *v4;

  v3 = -[HKBadge type](self, "type");
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = &unk_1E3893F70;
  }
  else
  {
    v4 = &unk_1E3893F88;
  }
  return (NSNumber *)v4;
}

+ (id)badgeFromKeyValueRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;

  v3 = a3;
  +[HKBadge zeroBadge](HKBadge, "zeroBadge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_5:
    v8 = v4;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "integerValue");
  v6 = v5;
  if (v5 <= -3)
  {
    _HKInitializeLogging();
    v7 = HKLogNotifications;
    if (os_log_type_enabled((os_log_t)HKLogNotifications, OS_LOG_TYPE_ERROR))
      +[HKBadge(KeyValueEntitySupport) badgeFromKeyValueRepresentation:].cold.1(v6, v7);
    goto LABEL_5;
  }
  if (v5 == -1)
  {
    +[HKBadge indicatorBadge](HKBadge, "indicatorBadge");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 == -2)
      +[HKBadge errorBadge](HKBadge, "errorBadge");
    else
      +[HKBadge numberBadgeWithCount:](HKBadge, "numberBadgeWithCount:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v9 = v8;

  return v9;
}

@end
