@implementation MAAutoAssetPushNotification

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:](self, "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:", a3, 0, 0, 0, 0, 0);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:](self, "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:", a3, a4, a5, a6, 0, 0);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:](self, "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:", a3, a4, a5, a6, a7, 0);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7 withAdditional:(id)a8
{
  id v15;
  id v16;
  id v17;
  MAAutoAssetPushNotification *v18;
  MAAutoAssetPushNotification *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MAAutoAssetPushNotification;
  v18 = -[MAAutoAssetPushNotification init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_pushReason = a3;
    objc_storeStrong((id *)&v18->_assetType, a4);
    objc_storeStrong((id *)&v19->_assetSpecifier, a5);
    objc_storeStrong((id *)&v19->_assetVersion, a6);
    objc_storeStrong((id *)&v19->_autoUpdatePolicy, a7);
    objc_storeStrong((id *)&v19->_additionalPushParameters, a8);
  }

  return v19;
}

- (MAAutoAssetPushNotification)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetPushNotification *v5;
  uint64_t v6;
  NSString *assetType;
  uint64_t v8;
  NSString *assetSpecifier;
  uint64_t v10;
  NSString *assetVersion;
  uint64_t v12;
  MAAutoAssetUpdatePolicy *autoUpdatePolicy;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *additionalPushParameters;
  objc_super v20;
  _QWORD v21[9];

  v21[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetPushNotification;
  v5 = -[MAAutoAssetPushNotification init](&v20, sel_init);
  if (v5)
  {
    v5->_pushReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pushReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSpecifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoUpdatePolicy"));
    v12 = objc_claimAutoreleasedReturnValue();
    autoUpdatePolicy = v5->_autoUpdatePolicy;
    v5->_autoUpdatePolicy = (MAAutoAssetUpdatePolicy *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v21[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("additionalPushParameters"));
    v17 = objc_claimAutoreleasedReturnValue();
    additionalPushParameters = v5->_additionalPushParameters;
    v5->_additionalPushParameters = (NSDictionary *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPushNotification pushReason](self, "pushReason"), CFSTR("pushReason"));
  -[MAAutoAssetPushNotification assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetType"));

  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetSpecifier"));

  -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assetVersion"));

  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("autoUpdatePolicy"));

  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("additionalPushParameters"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)newAssetName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[MAAutoAssetPushNotification assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return &stru_1E5D5F930;
  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetPushNotification assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v5)
    {
      -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("(%@|%@|%@)"), v7, v9, v10);

    }
    else
    {
      v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("(%@|%@)"), v7, v8);
    }

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetPushNotification assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("(%@)"), v7);
  }

  return v11;
}

- (id)summary
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAAutoAssetPushNotification newAssetName](self, "newAssetName");
  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "summary");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("NONE");
  }
  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("PRESENT");
  if (!v9)
    v10 = CFSTR("NONE");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@|policy:%@|additional:%@"), v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

  }
  return v11;
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("pushReason"));

  v5 = -[MAAutoAssetPushNotification newAssetName](self, "newAssetName");
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("assetName"));

  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newSummaryDictionary");
    objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("autoUpdatePolicy"));

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("autoUpdatePolicy"));
  }

  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  v11 = v10;
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("additionalPushParameters"));

  return v3;
}

- (id)pushReasonName
{
  return +[MAAutoAssetPushNotification pushReasonName:](MAAutoAssetPushNotification, "pushReasonName:", -[MAAutoAssetPushNotification pushReason](self, "pushReason"));
}

+ (id)pushReasonName:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("UNKNOWN");
  else
    return off_1E5D5CED8[a3];
}

- (NSDictionary)historyRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetPushNotification assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MAAutoAssetPushNotification assetType](self, "assetType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("assetType"));

  }
  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("assetSpecifier"));

  }
  -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("pushReasonName"));

  }
  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatePolicyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updatePolicyName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setSafeObject:forKey:", v15, CFSTR("autoUpdatePolicy"));

    }
  }
  -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("assetVersion"));

  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v18;
}

- (int64_t)pushReason
{
  return self->_pushReason;
}

- (void)setPushReason:(int64_t)a3
{
  self->_pushReason = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (MAAutoAssetUpdatePolicy)autoUpdatePolicy
{
  return self->_autoUpdatePolicy;
}

- (NSDictionary)additionalPushParameters
{
  return self->_additionalPushParameters;
}

- (void)setAdditionalPushParameters:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPushParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPushParameters, 0);
  objc_storeStrong((id *)&self->_autoUpdatePolicy, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
