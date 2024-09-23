@implementation HMDThreadAccessoryInfo

- (HMDThreadAccessoryInfo)initWithName:(id)a3 ipAddress:(id)a4 isMatter:(BOOL)a5 isBatteryPowered:(BOOL)a6
{
  id v11;
  id v12;
  HMDThreadAccessoryInfo *v13;
  HMDThreadAccessoryInfo *v14;
  NSMutableDictionary *threadAccessoryInfo;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDThreadAccessoryInfo;
  v13 = -[HMDThreadAccessoryInfo init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_ipAddress, a4);
    v14->_isMatter = a5;
    v14->_isBatteryPowered = a6;
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_isThreadAccessoryInfoValid = 0;
    threadAccessoryInfo = v14->_threadAccessoryInfo;
    v14->_threadAccessoryInfo = 0;

  }
  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddress, a3);
}

- (BOOL)isMatter
{
  return self->_isMatter;
}

- (void)setIsMatter:(BOOL)a3
{
  self->_isMatter = a3;
}

- (BOOL)isBatteryPowered
{
  return self->_isBatteryPowered;
}

- (void)setIsBatteryPowered:(BOOL)a3
{
  self->_isBatteryPowered = a3;
}

- (BOOL)isThreadAccessoryInfoValid
{
  return self->_isThreadAccessoryInfoValid;
}

- (void)setIsThreadAccessoryInfoValid:(BOOL)a3
{
  self->_isThreadAccessoryInfoValid = a3;
}

- (NSMutableDictionary)threadAccessoryInfo
{
  return self->_threadAccessoryInfo;
}

- (void)setThreadAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_threadAccessoryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
