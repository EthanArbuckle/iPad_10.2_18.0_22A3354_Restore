@implementation CKDSaveUserPrivacySettingsOperationInfo

- (CKDSaveUserPrivacySettingsOperationInfo)init
{
  CKDSaveUserPrivacySettingsOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDSaveUserPrivacySettingsOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
    result->_discoverable = 0;
  return result;
}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void)setDiscoverable:(int64_t)a3
{
  self->_discoverable = a3;
}

@end
