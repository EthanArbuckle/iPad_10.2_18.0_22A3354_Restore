@implementation NSCloudKitMirroringDelegateSetupResult

- (NSCloudKitMirroringDelegateSetupResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 error:(id)a6 container:(id)a7 database:(id)a8
{
  NSCloudKitMirroringDelegateSetupResult *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSCloudKitMirroringDelegateSetupResult;
  v10 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](&v12, sel_initWithRequest_storeIdentifier_success_madeChanges_error_, a3, a4, a5, 0, a6);
  if (v10)
  {
    v10->_container = (CKContainer *)a7;
    v10->_database = (CKDatabase *)a8;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_container = 0;
  self->_database = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateSetupResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

@end
