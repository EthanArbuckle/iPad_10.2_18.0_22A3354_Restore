@implementation NSCloudKitMirroringExportProgressRequest

- (NSCloudKitMirroringExportProgressRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringExportProgressRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v6, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
    v4->_objectIDsToFetch = (NSSet *)(id)NSSet_EmptySet;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_objectIDsToFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (void)setObjectIDsToFetch:(id)a3
{
  NSSet *objectIDsToFetch;
  NSSet *v6;

  objectIDsToFetch = self->_objectIDsToFetch;
  if (objectIDsToFetch != a3)
  {

    if (a3)
      v6 = (NSSet *)objc_msgSend(a3, "copy");
    else
      v6 = (NSSet *)(id)NSSet_EmptySet;
    self->_objectIDsToFetch = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  v4 = -[NSCloudKitMirroringRequest copyWithZone:](&v6, sel_copyWithZone_, a3);

  v4[10] = self->_objectIDsToFetch;
  return v4;
}

- (NSSet)objectIDsToFetch
{
  return self->_objectIDsToFetch;
}

@end
