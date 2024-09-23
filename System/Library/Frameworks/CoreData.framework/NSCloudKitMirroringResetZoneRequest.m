@implementation NSCloudKitMirroringResetZoneRequest

- (NSCloudKitMirroringResetZoneRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringResetZoneRequest *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSCloudKitMirroringResetZoneRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v8, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
    v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
    v4->_recordZoneIDsToReset = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_recordZoneIDsToReset = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringResetZoneRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (void)setRecordZoneIDsToReset:(uint64_t)a1
{
  void *v4;
  id v5;
  id v6;

  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    if (v4 != a2)
    {

      if (a2)
      {
        *(_QWORD *)(a1 + 80) = a2;
      }
      else
      {
        v5 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
        v6 = (id)objc_msgSend(v5, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
        *(_QWORD *)(a1 + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);

      }
    }
  }
}

@end
