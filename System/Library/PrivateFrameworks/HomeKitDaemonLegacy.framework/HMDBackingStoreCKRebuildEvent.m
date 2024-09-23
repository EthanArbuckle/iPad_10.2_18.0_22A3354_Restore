@implementation HMDBackingStoreCKRebuildEvent

- (HMDBackingStoreCKRebuildEvent)initWithCloudZoneID:(id)a3 rebuildStatus:(id)a4
{
  id v6;
  HMDBackingStoreCKRebuildEvent *v7;
  unint64_t v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDBackingStoreCKRebuildEvent;
  v7 = -[HMDHMBLogEvent initWithCloudZoneID:](&v10, sel_initWithCloudZoneID_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "rebuildState");
    if (v8 <= 7)
      v7->_rebuildStatus = v8;
  }

  return v7;
}

- (int)rebuildStatus
{
  return self->_rebuildStatus;
}

@end
