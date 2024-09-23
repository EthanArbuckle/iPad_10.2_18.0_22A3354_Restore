@implementation DNDBypassSettings

- (DNDBypassSettings)init
{
  return (DNDBypassSettings *)-[DNDBypassSettings _initWithSettings:](self, "_initWithSettings:", 0);
}

- (id)_initWithSettings:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "immediateBypassEventSourceType");
  objc_msgSend(v4, "immediateBypassCNGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "repeatEventSourceBehaviorEnabledSetting");

  v8 = -[DNDBypassSettings _initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:](self, "_initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:", v5, v6, v7);
  return v8;
}

- (id)_initWithImmediateBypassEventSourceType:(unint64_t)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(unint64_t)a5
{
  id v8;
  DNDBypassSettings *v9;
  DNDBypassSettings *v10;
  uint64_t v11;
  NSString *immediateBypassCNGroupIdentifier;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDBypassSettings;
  v9 = -[DNDBypassSettings init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_immediateBypassEventSourceType = a3;
    v11 = objc_msgSend(v8, "copy");
    immediateBypassCNGroupIdentifier = v10->_immediateBypassCNGroupIdentifier;
    v10->_immediateBypassCNGroupIdentifier = (NSString *)v11;

    v10->_repeatEventSourceBehaviorEnabledSetting = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
  -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDBypassSettings *v8;
  DNDBypassSettings *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;

  v8 = (DNDBypassSettings *)a3;
  if (self == v8)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = -[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
      if (v10 != -[DNDBypassSettings immediateBypassEventSourceType](v9, "immediateBypassEventSourceType"))
      {
        v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDBypassSettings immediateBypassCNGroupIdentifier](v9, "immediateBypassCNGroupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v15 = 0;
          goto LABEL_17;
        }
        v3 = (void *)v13;
        -[DNDBypassSettings immediateBypassCNGroupIdentifier](v9, "immediateBypassCNGroupIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v4 = (void *)v14;
        -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDBypassSettings immediateBypassCNGroupIdentifier](v9, "immediateBypassCNGroupIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v15 = 0;
LABEL_13:

LABEL_16:
          goto LABEL_17;
        }
      }
      v16 = -[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
      v15 = v16 == -[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](v9, "repeatEventSourceBehaviorEnabledSetting");
      if (v11 != v12)
        goto LABEL_13;
LABEL_17:

      goto LABEL_18;
    }
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDEventSourceTypeToString(-[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; immediateBypassEventSourceType: %@; immediateBypassCNGroupIdentifier: '%@'; repeatEventSourceBehaviorEnabledSetting: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)diffDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DNDEventSourceTypeToString(-[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("immediateBypassEventSourceType:%@;immediateBypassCNGroupIdentifier:%@;repeatEventSourceBehaviorEnabledSetting:%@"),
    v4,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDBypassSettings _initWithSettings:]([DNDMutableBypassSettings alloc], "_initWithSettings:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDBypassSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  DNDBypassSettings *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("immediateBypassEventSourceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("immediateBypassCNGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatEventSourceBehaviorEnabledSetting"));

  v8 = -[DNDBypassSettings _initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:](self, "_initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType"), CFSTR("immediateBypassEventSourceType"));
  -[DNDBypassSettings immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("immediateBypassCNGroupIdentifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting"), CFSTR("repeatEventSourceBehaviorEnabledSetting"));
}

- (unint64_t)immediateBypassEventSourceType
{
  return self->_immediateBypassEventSourceType;
}

- (NSString)immediateBypassCNGroupIdentifier
{
  return self->_immediateBypassCNGroupIdentifier;
}

- (unint64_t)repeatEventSourceBehaviorEnabledSetting
{
  return self->_repeatEventSourceBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immediateBypassCNGroupIdentifier, 0);
}

@end
