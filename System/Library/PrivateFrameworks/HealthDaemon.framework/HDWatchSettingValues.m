@implementation HDWatchSettingValues

- (HDWatchSettingValues)initWithFeatureSettingEnabledValue:(id)a3 defaultsEnabledValue:(id)a4 lastReconciledEnabledValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDWatchSettingValues *v11;
  uint64_t v12;
  NSNumber *featureSettingEnabledValue;
  uint64_t v14;
  NSNumber *defaultsEnabledValue;
  uint64_t v16;
  NSNumber *lastReconciledEnabledValue;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDWatchSettingValues;
  v11 = -[HDWatchSettingValues init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    featureSettingEnabledValue = v11->_featureSettingEnabledValue;
    v11->_featureSettingEnabledValue = (NSNumber *)v12;

    v14 = objc_msgSend(v9, "copy");
    defaultsEnabledValue = v11->_defaultsEnabledValue;
    v11->_defaultsEnabledValue = (NSNumber *)v14;

    v16 = objc_msgSend(v10, "copy");
    lastReconciledEnabledValue = v11->_lastReconciledEnabledValue;
    v11->_lastReconciledEnabledValue = (NSNumber *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HDWatchSettingValues *v4;
  HDWatchSettingValues *v5;
  NSNumber *featureSettingEnabledValue;
  NSNumber *v7;
  NSNumber *defaultsEnabledValue;
  NSNumber *v9;
  NSNumber *lastReconciledEnabledValue;
  NSNumber *v11;
  char v12;

  v4 = (HDWatchSettingValues *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      featureSettingEnabledValue = self->_featureSettingEnabledValue;
      v7 = v5->_featureSettingEnabledValue;
      if (featureSettingEnabledValue != v7
        && (!v7 || !-[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:")))
      {
        goto LABEL_14;
      }
      defaultsEnabledValue = self->_defaultsEnabledValue;
      v9 = v5->_defaultsEnabledValue;
      if (defaultsEnabledValue != v9 && (!v9 || !-[NSNumber isEqual:](defaultsEnabledValue, "isEqual:")))
        goto LABEL_14;
      lastReconciledEnabledValue = self->_lastReconciledEnabledValue;
      v11 = v5->_lastReconciledEnabledValue;
      if (lastReconciledEnabledValue == v11)
      {
        v12 = 1;
        goto LABEL_15;
      }
      if (v11)
        v12 = -[NSNumber isEqual:](lastReconciledEnabledValue, "isEqual:");
      else
LABEL_14:
        v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_featureSettingEnabledValue, "hash");
  v4 = -[NSNumber hash](self->_defaultsEnabledValue, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_lastReconciledEnabledValue, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ db:%@, df:%@, lr:%@>"), objc_opt_class(), self->_featureSettingEnabledValue, self->_defaultsEnabledValue, self->_lastReconciledEnabledValue);
}

- (id)reconciledEnabledValue
{
  NSNumber *featureSettingEnabledValue;
  NSNumber *defaultsEnabledValue;
  NSNumber *v5;
  NSNumber *v6;
  int v7;
  void *v8;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  HDWatchSettingValues *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  featureSettingEnabledValue = self->_featureSettingEnabledValue;
  defaultsEnabledValue = self->_defaultsEnabledValue;
  if (!featureSettingEnabledValue)
  {
    if (defaultsEnabledValue)
    {
      v6 = defaultsEnabledValue;
      return v6;
    }
    goto LABEL_15;
  }
  if (!defaultsEnabledValue)
  {
LABEL_10:
    v6 = featureSettingEnabledValue;
    return v6;
  }
  if (!-[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:"))
  {
    featureSettingEnabledValue = self->_featureSettingEnabledValue;
    if (!self->_lastReconciledEnabledValue)
      goto LABEL_10;
    v7 = -[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:");
    featureSettingEnabledValue = self->_defaultsEnabledValue;
    if (v7)
      goto LABEL_10;
    if (-[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:", self->_lastReconciledEnabledValue))
    {
      v5 = self->_featureSettingEnabledValue;
      goto LABEL_5;
    }
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5310];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5310], OS_LOG_TYPE_FAULT))
    {
      v10 = v8;
      v12 = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = self;
      v11 = v13;
      _os_log_fault_impl(&dword_1B7802000, v10, OS_LOG_TYPE_FAULT, "[%{public}@] Unexpected settings evaluation: %{public}@", (uint8_t *)&v12, 0x16u);

    }
LABEL_15:
    v6 = 0;
    return v6;
  }
  v5 = self->_defaultsEnabledValue;
LABEL_5:
  v6 = v5;
  return v6;
}

- (NSNumber)featureSettingEnabledValue
{
  return self->_featureSettingEnabledValue;
}

- (NSNumber)defaultsEnabledValue
{
  return self->_defaultsEnabledValue;
}

- (NSNumber)lastReconciledEnabledValue
{
  return self->_lastReconciledEnabledValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReconciledEnabledValue, 0);
  objc_storeStrong((id *)&self->_defaultsEnabledValue, 0);
  objc_storeStrong((id *)&self->_featureSettingEnabledValue, 0);
}

@end
