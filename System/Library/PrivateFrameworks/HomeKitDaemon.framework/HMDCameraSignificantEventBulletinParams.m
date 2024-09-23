@implementation HMDCameraSignificantEventBulletinParams

- (HMDCameraSignificantEventBulletinParams)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCameraSignificantEventBulletinParams)initWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfileUUID:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDCameraSignificantEventBulletinParams *v18;
  HMDCameraSignificantEventBulletinParams *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraSignificantEventBulletinParams;
  v18 = -[HMDCameraSignificantEventBulletinParams init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_UUID, a3);
    v19->_reason = a4;
    objc_storeStrong((id *)&v19->_dateOfOccurrence, a5);
    v19->_confidenceLevel = a6;
    objc_storeStrong((id *)&v19->_faceClassifications, a7);
    objc_storeStrong((id *)&v19->_cameraProfileUUID, a8);
  }

  return v19;
}

- (HMDCameraSignificantEventBulletinParams)initWithSignificantEvent:(id)a3 cameraProfileUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDCameraSignificantEventBulletinParams *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "reason");
  objc_msgSend(v7, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "confidenceLevel");
  objc_msgSend(v7, "faceClassifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMDCameraSignificantEventBulletinParams initWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfileUUID:](self, "initWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfileUUID:", v8, v9, v10, v11, v12, v6);
  return v13;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
