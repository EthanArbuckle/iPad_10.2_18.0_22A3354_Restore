@implementation NSCloudKitMirroringDelegateResetRequest

- (NSCloudKitMirroringDelegateResetRequest)initWithError:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringDelegateResetRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCloudKitMirroringDelegateResetRequest;
  v5 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v7, sel_initWithOptions_completionBlock_, 0, a4);
  if (v5)
    v5->_causedByError = (NSError *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateResetRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

@end
