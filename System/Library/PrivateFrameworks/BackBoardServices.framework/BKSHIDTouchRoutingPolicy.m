@implementation BKSHIDTouchRoutingPolicy

- (BKSHIDTouchRoutingPolicy)init
{
  BKSHIDTouchRoutingPolicy *v2;
  uint64_t v3;
  BSMutableSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSHIDTouchRoutingPolicy;
  v2 = -[BKSHIDTouchRoutingPolicy init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    settings = v2->_settings;
    v2->_settings = (BSMutableSettings *)v3;

  }
  return v2;
}

- (BKSHIDTouchRoutingPolicy)initWithCoder:(id)a3
{
  id v4;
  BKSHIDTouchRoutingPolicy *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BKSHIDTouchRoutingPolicy *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BKSHIDTouchRoutingPolicy init](self, "init");
  if (!v5)
    goto LABEL_9;
  -[BKSHIDTouchRoutingPolicy setAvoidHitTesting:](v5, "setAvoidHitTesting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAvoidHitTesting")));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("contextIDsToAlwaysSendTouches"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((_BKSVerifyIsArrayOfNumbers(v9) & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v28 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported contextIDsToAlwaysSendTouches structure %@"), v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v19);

      goto LABEL_12;
    }
    -[BKSHIDTouchRoutingPolicy setContextIDsToAlwaysSendTouches:](v5, "setContextIDsToAlwaysSendTouches:", v9);
  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("contextIDsToExcludeFromHitTesting"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (_BKSVerifyIsArrayOfNumbers(v13))
    {
      -[BKSHIDTouchRoutingPolicy setContextIDsToExcludeFromHitTesting:](v5, "setContextIDsToExcludeFromHitTesting:", v13);
      goto LABEL_8;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB28A8];
    v26 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported contextIDsToExcludeFromHitTesting structure %@"), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 4866, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v24);

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
LABEL_8:

LABEL_9:
  v14 = v5;
LABEL_13:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[BKSHIDTouchRoutingPolicy shouldAvoidHitTesting](self, "shouldAvoidHitTesting"), CFSTR("shouldAvoidHitTesting"));
  -[BKSHIDTouchRoutingPolicy contextIDsToAlwaysSendTouches](self, "contextIDsToAlwaysSendTouches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextIDsToAlwaysSendTouches"));

  -[BKSHIDTouchRoutingPolicy contextIDsToExcludeFromHitTesting](self, "contextIDsToExcludeFromHitTesting");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contextIDsToExcludeFromHitTesting"));

}

- (BOOL)shouldAvoidHitTesting
{
  return -[BSMutableSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", 3);
}

- (void)setAvoidHitTesting:(BOOL)a3
{
  -[BSMutableSettings setFlag:forSetting:](self->_settings, "setFlag:forSetting:", a3, 3);
}

- (NSArray)contextIDsToAlwaysSendTouches
{
  return (NSArray *)-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 1);
}

- (void)setContextIDsToAlwaysSendTouches:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", a3, 1);
}

- (NSArray)contextIDsToExcludeFromHitTesting
{
  return (NSArray *)-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2);
}

- (void)setContextIDsToExcludeFromHitTesting:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", a3, 2);
}

- (BSMutableSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)inspectChangesWithOldPolicy:(id)a3 newPolicy:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01858], "diffFromSettings:toSettings:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__BKSHIDTouchRoutingPolicy_inspectChangesWithOldPolicy_newPolicy_usingBlock___block_invoke;
  v13[3] = &unk_1E1E9FB28;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "inspectChangesWithBlock:", v13);

}

uint64_t __77__BKSHIDTouchRoutingPolicy_inspectChangesWithOldPolicy_newPolicy_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
