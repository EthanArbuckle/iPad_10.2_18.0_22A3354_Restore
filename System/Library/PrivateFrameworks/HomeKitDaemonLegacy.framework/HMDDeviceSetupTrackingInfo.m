@implementation HMDDeviceSetupTrackingInfo

- (HMDDeviceSetupTrackingInfo)initWithIdentifier:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 role:(int64_t)a6 accessoryUUID:(id)a7 accessoryCategory:(id)a8 accessoryIDSIdentifier:(id)a9 setupClientBundleID:(id)a10
{
  id v16;
  id v17;
  HMDDeviceSetupTrackingInfo *v18;
  HMDDeviceSetupTrackingInfo *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v25.receiver = self;
  v25.super_class = (Class)HMDDeviceSetupTrackingInfo;
  v18 = -[HMDDeviceSetupTrackingInfo init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19->_startTime = a4;
    v19->_endTime = a5;
    v19->_role = a6;
    objc_storeStrong((id *)&v19->_accessoryUUID, a7);
    objc_storeStrong((id *)&v19->_accessoryCategory, a8);
    objc_storeStrong((id *)&v19->_accessoryIDSIdentifier, a9);
    objc_storeStrong((id *)&v19->_setupClientBundleID, a10);
  }

  return v19;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessoryUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)accessoryIDSIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessoryIDSIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (HMAccessoryCategory)accessoryCategory
{
  return (HMAccessoryCategory *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)setupClientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSetupClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (NSError)sessionError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)role
{
  return self->_role;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_setupClientBundleID, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
