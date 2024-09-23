@implementation NSCloudKitMirroringDelegateSerializationRequestResult

- (NSCloudKitMirroringDelegateSerializationRequestResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 serializedObjects:(id)a5 error:(id)a6
{
  NSCloudKitMirroringDelegateSerializationRequestResult *v7;
  NSDictionary *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequestResult;
  v7 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](&v10, sel_initWithRequest_storeIdentifier_success_madeChanges_error_, a3, a4, a5 != 0, 0, a6);
  if (v7)
  {
    if (a5)
      v8 = (NSDictionary *)objc_msgSend(a5, "copy");
    else
      v8 = (NSDictionary *)(id)NSDictionary_EmptyDictionary;
    v7->_serializedObjects = v8;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequestResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (NSDictionary)serializedObjects
{
  return self->_serializedObjects;
}

@end
