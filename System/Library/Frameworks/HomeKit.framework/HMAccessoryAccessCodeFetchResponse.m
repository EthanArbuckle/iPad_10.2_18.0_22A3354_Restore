@implementation HMAccessoryAccessCodeFetchResponse

- (HMAccessoryAccessCodeFetchResponse)initWithAccessory:(id)a3 accessoryAccessCodes:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMAccessoryAccessCodeFetchResponse *v13;
  HMAccessoryAccessCodeFetchResponse *v14;
  HMAccessoryAccessCodeFetchResponse *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMAccessoryAccessCodeFetchResponse;
    v13 = -[HMAccessoryAccessCodeFetchResponse init](&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_accessory, a3);
      objc_storeStrong((id *)&v14->_accessoryAccessCodes, a4);
      objc_storeStrong((id *)&v14->_error, a5);
    }

    return v14;
  }
  else
  {
    v16 = (HMAccessoryAccessCodeFetchResponse *)_HMFPreconditionFailure();
    return (HMAccessoryAccessCodeFetchResponse *)-[HMAccessoryAccessCodeFetchResponse accessory](v16, v17);
  }
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)accessoryAccessCodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodes, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)responseWithValue:(id)a3 accessory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMAccessoryAccessCodeFetchResponse *v10;
  void *v11;
  HMAccessoryAccessCodeFetchResponse *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "accessoryAccessCodeValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HMAccessoryAccessCodeFetchResponse_responseWithValue_accessory___block_invoke;
  v14[3] = &unk_1E3AB2FD0;
  v15 = v5;
  v8 = v5;
  objc_msgSend(v7, "na_map:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HMAccessoryAccessCodeFetchResponse alloc];
  objc_msgSend(v6, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMAccessoryAccessCodeFetchResponse initWithAccessory:accessoryAccessCodes:error:](v10, "initWithAccessory:accessoryAccessCodes:error:", v8, v9, v11);
  return v12;
}

HMAccessoryAccessCode *__66__HMAccessoryAccessCodeFetchResponse_responseWithValue_accessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMAccessoryAccessCode *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMAccessoryAccessCode *v9;

  v3 = a2;
  v4 = [HMAccessoryAccessCode alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "accessCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "hasRestrictions");

  v9 = -[HMAccessoryAccessCode initWithAccessory:accessCodeValue:uniqueIdentifier:hasRestrictions:](v4, "initWithAccessory:accessCodeValue:uniqueIdentifier:hasRestrictions:", v5, v6, v7, v8);
  return v9;
}

@end
