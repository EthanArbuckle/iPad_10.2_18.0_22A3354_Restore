@implementation HMAccessCodeModificationResponse

- (HMAccessCodeModificationResponse)initWithAccessory:(id)a3 accessoryAccessCode:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMAccessCodeModificationResponse *v18;
  HMAccessCodeModificationResponse *v19;
  uint64_t v20;
  HMAccessCodeValue *accessCodeValue;
  HMAccessCodeModificationResponse *v23;
  SEL v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    v17 = v16;
    v25.receiver = self;
    v25.super_class = (Class)HMAccessCodeModificationResponse;
    v18 = -[HMAccessCodeModificationResponse init](&v25, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_accessory, a3);
      objc_storeStrong((id *)&v19->_accessoryAccessCode, a4);
      v20 = objc_msgSend(v15, "copy");
      accessCodeValue = v19->_accessCodeValue;
      v19->_accessCodeValue = (HMAccessCodeValue *)v20;

      v19->_operationType = a6;
      objc_storeStrong((id *)&v19->_error, a7);
    }

    return v19;
  }
  else
  {
    v23 = (HMAccessCodeModificationResponse *)_HMFPreconditionFailure();
    return (HMAccessCodeModificationResponse *)-[HMAccessCodeModificationResponse accessory](v23, v24);
  }
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessoryAccessCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessCodeValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCode, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)responseWithValue:(id)a3 accessory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMAccessCodeModificationResponse *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMAccessCodeModificationResponse *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "accessoryAccessCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessoryAccessCode accessoryAccessCodeWithValue:accessory:](HMAccessoryAccessCode, "accessoryAccessCodeWithValue:accessory:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMAccessCodeModificationResponse alloc];
  objc_msgSend(v6, "accessCodeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "operationType");
  objc_msgSend(v6, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMAccessCodeModificationResponse initWithAccessory:accessoryAccessCode:accessCodeValue:operationType:error:](v9, "initWithAccessory:accessoryAccessCode:accessCodeValue:operationType:error:", v5, v8, v10, v11, v12);
  return v13;
}

@end
