@implementation _HFHomeKitSettingsVendorSettingsWriteValueTransaction

- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)initWithSetting:(id)a3 previousValue:(id)a4 value:(id)a5 changeType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  _HFHomeKitSettingsVendorSettingsWriteValueTransaction *v14;
  _HFHomeKitSettingsVendorSettingsWriteValueTransaction *v15;
  uint64_t v16;
  NSNumber *transactionNumber;
  NAFuture *v18;
  NAFuture *settingWriteFuture;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_HFHomeKitSettingsVendorSettingsWriteValueTransaction;
  v14 = -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_setting, a3);
    objc_storeStrong(&v15->_previousValue, a4);
    objc_storeStrong(&v15->_value, a5);
    ++initWithSetting_previousValue_value_changeType__i;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v16 = objc_claimAutoreleasedReturnValue();
    transactionNumber = v15->_transactionNumber;
    v15->_transactionNumber = (NSNumber *)v16;

    v18 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    settingWriteFuture = v15->_settingWriteFuture;
    v15->_settingWriteFuture = v18;

    v15->_changeType = a6;
  }

  return v15;
}

- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSetting_previousValue_value_changeType_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeKitSettingsValueManager.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[_HFHomeKitSettingsVendorSettingsWriteValueTransaction init]",
    v5);

  return 0;
}

- (void)setStarted:(BOOL)a3
{
  NSDate *v4;
  NSDate *transactionStartDate;

  self->_started = a3;
  if (a3 && !self->_transactionStartDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    transactionStartDate = self->_transactionStartDate;
    self->_transactionStartDate = v4;

  }
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction transactionNumber](self, "transactionNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("transactionNumber"));

  if (-[_HFHomeKitSettingsVendorSettingsWriteValueTransaction changeType](self, "changeType") == 1)
    v6 = CFSTR("Atomic");
  else
    v6 = CFSTR("FullReplace");
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("changeType"));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke;
  v26[3] = &unk_1EA7273E0;
  v26[4] = self;
  __75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke((uint64_t)v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("status"));
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction setting](self, "setting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("setting"));

  v13 = (void *)MEMORY[0x1E0CBA7F0];
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction previousValue](self, "previousValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction setting](self, "setting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_debugDescriptionForValue:keyPath:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("previousValue"));

  v19 = (void *)MEMORY[0x1E0CBA7F0];
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction value](self, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction setting](self, "setting");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hf_debugDescriptionForValue:keyPath:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendObject:withName:", v23, CFSTR("value"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NAFuture)settingWriteFuture
{
  return self->_settingWriteFuture;
}

- (void)setSettingWriteFuture:(id)a3
{
  objc_storeStrong((id *)&self->_settingWriteFuture, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)hasStarted
{
  return self->_started;
}

- (NSDate)transactionStartDate
{
  return self->_transactionStartDate;
}

- (id)value
{
  return self->_value;
}

- (id)previousValue
{
  return self->_previousValue;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionNumber, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_settingWriteFuture, 0);
}

@end
