@implementation NSCloudKitMirroringDelegateSetupRequestOptions

- (id)copy
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringDelegateSetupRequestOptions;
  v3 = -[NSCloudKitMirroringRequestOptions copy](&v5, sel_copy);
  objc_msgSend(v3, "setFromNotification:", -[NSCloudKitMirroringDelegateSetupRequestOptions fromNotification](self, "fromNotification"));
  return v3;
}

- (id)createDefaultOperationConfiguration
{
  return objc_alloc_init((Class)getCloudKitCKOperationConfigurationClass[0]());
}

- (BOOL)fromNotification
{
  return self->_fromNotification;
}

- (void)setFromNotification:(BOOL)a3
{
  self->_fromNotification = a3;
}

@end
