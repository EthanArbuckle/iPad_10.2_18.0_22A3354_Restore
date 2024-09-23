@implementation HMAccessoryAccessCodeConstraintsFetchResponse

- (HMAccessoryAccessCodeConstraintsFetchResponse)initWithAccessory:(id)a3 constraints:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMAccessoryAccessCodeConstraintsFetchResponse *v12;
  HMAccessoryAccessCodeConstraintsFetchResponse *v13;
  uint64_t v14;
  HMAccessCodeConstraints *constraints;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryAccessCodeConstraintsFetchResponse;
  v12 = -[HMAccessoryAccessCodeConstraintsFetchResponse init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a3);
    v14 = objc_msgSend(v10, "copy");
    constraints = v13->_constraints;
    v13->_constraints = (HMAccessCodeConstraints *)v14;

    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessCodeConstraints)constraints
{
  return (HMAccessCodeConstraints *)objc_getProperty(self, a2, 16, 1);
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
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)responseWithValue:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMAccessoryAccessCodeConstraintsFetchResponse *v9;
  void *v10;
  void *v11;
  HMAccessoryAccessCodeConstraintsFetchResponse *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMAccessoryAccessCodeConstraintsFetchResponse alloc];
  objc_msgSend(v6, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMAccessoryAccessCodeConstraintsFetchResponse initWithAccessory:constraints:error:](v9, "initWithAccessory:constraints:error:", v8, v10, v11);
  return v12;
}

@end
