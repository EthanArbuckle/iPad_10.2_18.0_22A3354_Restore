@implementation LNIntentEnablement

- (LNIntentEnablement)initWithValue:(int64_t)a3 disabledReason:(id)a4
{
  id v7;
  LNIntentEnablement *v8;
  LNIntentEnablement *v9;
  LNIntentEnablement *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNIntentEnablement;
  v8 = -[LNIntentEnablement init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_disabledReason, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNIntentEnablement value](self, "value"), CFSTR("value"));
  -[LNIntentEnablement disabledReason](self, "disabledReason");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("disabledReason"));

}

- (LNIntentEnablement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  LNIntentEnablement *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disabledReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNIntentEnablement initWithValue:disabledReason:](self, "initWithValue:disabledReason:", v5, v6);
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNIntentEnablement value](self, "value");
  -[LNIntentEnablement disabledReason](self, "disabledReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, value: %ld, disabledReason: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[LNIntentEnablement value](self, "value");
  -[LNIntentEnablement disabledReason](self, "disabledReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  LNIntentEnablement *v4;
  LNIntentEnablement *v5;
  LNIntentEnablement *v6;
  int64_t v7;
  void *v8;
  void *v9;
  LNIntentEnablement *v10;
  LNIntentEnablement *v11;
  LNIntentEnablement *v12;
  char v13;

  v4 = (LNIntentEnablement *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNIntentEnablement value](self, "value");
        if (v7 != -[LNIntentEnablement value](v6, "value"))
        {
          v13 = 0;
LABEL_16:

          goto LABEL_17;
        }
        -[LNIntentEnablement disabledReason](self, "disabledReason");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNIntentEnablement disabledReason](v6, "disabledReason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          v13 = 1;
        }
        else
        {
          v13 = 0;
          if (v10 && v11)
            v13 = -[LNIntentEnablement isEqual:](v10, "isEqual:", v11);
        }

      }
      else
      {
        v13 = 0;
        v10 = v6;
        v6 = 0;
      }
    }
    else
    {
      v10 = 0;
      v13 = 0;
    }

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (int64_t)value
{
  return self->_value;
}

- (LNStaticDeferredLocalizedString)disabledReason
{
  return self->_disabledReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledReason, 0);
}

+ (id)disabledWithReason:(id)a3
{
  id v3;
  LNIntentEnablement *v4;

  v3 = a3;
  v4 = -[LNIntentEnablement initWithValue:disabledReason:]([LNIntentEnablement alloc], "initWithValue:disabledReason:", 0, v3);

  return v4;
}

+ (id)enabled
{
  return -[LNIntentEnablement initWithValue:disabledReason:]([LNIntentEnablement alloc], "initWithValue:disabledReason:", 1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
