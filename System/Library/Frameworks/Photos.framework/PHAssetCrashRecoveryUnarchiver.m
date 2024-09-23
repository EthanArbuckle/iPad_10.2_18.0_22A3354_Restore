@implementation PHAssetCrashRecoveryUnarchiver

- (NSObject)userInfo
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
