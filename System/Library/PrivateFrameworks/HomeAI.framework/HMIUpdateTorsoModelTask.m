@implementation HMIUpdateTorsoModelTask

- (HMIUpdateTorsoModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 torsoAnnotations:(id)a5
{
  uint64_t v6;
  id v8;
  HMIUpdateTorsoModelTask *v9;
  uint64_t v10;
  NSSet *torsoAnnotations;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIUpdateTorsoModelTask;
  v9 = -[HMIHomeTask initWithTaskID:homeUUID:timeout:](&v13, sel_initWithTaskID_homeUUID_timeout_, v6, a4, 60.0);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    torsoAnnotations = v9->_torsoAnnotations;
    v9->_torsoAnnotations = (NSSet *)v10;

  }
  return v9;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  HMIUpdateTorsoModelTask *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomeTask homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIUpdateTorsoModelTask torsoAnnotations](self, "torsoAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v3, "updateTorsoModelForHome:torsoAnnotations:error:", v4, v6, &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error during update torso model task: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMFOperation cancelWithError:](v10, "cancelWithError:", v8);
  }
  -[HMFOperation finish](self, "finish");

}

- (NSSet)torsoAnnotations
{
  return (NSSet *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoAnnotations, 0);
}

@end
