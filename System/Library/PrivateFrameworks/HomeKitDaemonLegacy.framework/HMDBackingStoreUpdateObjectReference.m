@implementation HMDBackingStoreUpdateObjectReference

- (HMDBackingStoreUpdateObjectReference)initWithObject:(id)a3 uuid:(id)a4
{
  id v6;
  HMDBackingStoreUpdateObjectReference *v7;
  id v8;
  HMDBackingStoreUpdateObjectReference *v9;
  objc_super v11;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDBackingStoreUpdateObjectReference;
  v7 = -[HMDBackingStoreUpdateObjectReference init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_object, v8);

    objc_storeStrong((id *)&v7->_uuid, a4);
    v9 = v7;
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreUpdateObjectReference object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreUpdateObjectReference uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak(&self->_object);
}

@end
