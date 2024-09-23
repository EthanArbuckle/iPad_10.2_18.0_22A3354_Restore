@implementation HMDBackingStoreResidentUpdateResult

- (HMDBackingStoreResidentUpdateResult)initWithAddedResidentDevices:(id)a3 deletedResidentDevices:(id)a4 reachabilityUpdates:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDBackingStoreResidentUpdateResult *v11;
  HMDBackingStoreResidentUpdateResult *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreResidentUpdateResult;
  v11 = -[HMDBackingStoreResidentUpdateResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HMDBackingStoreResidentUpdateResult setAddedResidentDevices:](v11, "setAddedResidentDevices:", v8);
    -[HMDBackingStoreResidentUpdateResult setDeletedResidentDevices:](v12, "setDeletedResidentDevices:", v9);
    -[HMDBackingStoreResidentUpdateResult setReachabilityUpdates:](v12, "setReachabilityUpdates:", v10);
  }

  return v12;
}

- (NSSet)addedResidentDevices
{
  return self->_addedResidentDevices;
}

- (void)setAddedResidentDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)deletedResidentDevices
{
  return self->_deletedResidentDevices;
}

- (void)setDeletedResidentDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)reachabilityUpdates
{
  return self->_reachabilityUpdates;
}

- (void)setReachabilityUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityUpdates, 0);
  objc_storeStrong((id *)&self->_deletedResidentDevices, 0);
  objc_storeStrong((id *)&self->_addedResidentDevices, 0);
}

@end
