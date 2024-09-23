@implementation NSCloudKitMirroringExportProgressResult

- (NSCloudKitMirroringExportProgressResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 objectIDToLastExportedToken:(id)a5 error:(id)a6
{
  NSCloudKitMirroringExportProgressResult *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSCloudKitMirroringExportProgressResult;
  v7 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](&v9, sel_initWithRequest_storeIdentifier_success_madeChanges_error_, a3, a4, a5 != 0, 0, a6);
  if (v7)
    v7->_objectIDToLastExportedToken = (NSDictionary *)a5;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_objectIDToLastExportedToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringExportProgressResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (NSDictionary)objectIDToLastExportedToken
{
  return self->_objectIDToLastExportedToken;
}

@end
