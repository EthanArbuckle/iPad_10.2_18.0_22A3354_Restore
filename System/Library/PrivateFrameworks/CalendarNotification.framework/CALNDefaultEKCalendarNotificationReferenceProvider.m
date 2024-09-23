@implementation CALNDefaultEKCalendarNotificationReferenceProvider

+ (CALNDefaultEKCalendarNotificationReferenceProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__CALNDefaultEKCalendarNotificationReferenceProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1)
    dispatch_once(&sharedInstance_onceToken_20, block);
  return (CALNDefaultEKCalendarNotificationReferenceProvider *)(id)sharedInstance_sharedInstance_17;
}

void __68__CALNDefaultEKCalendarNotificationReferenceProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_17;
  sharedInstance_sharedInstance_17 = v0;

}

- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 inEventStore:(id)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v7 = (objc_class *)MEMORY[0x24BDC7498];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithType:objectID:eventStore:", v5, v9, v8);

  return v10;
}

- (id)notificationReferenceForObjectID:(id)a3 withType:(int)a4 date:(id)a5 inEventStore:(id)a6
{
  uint64_t v7;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = *(_QWORD *)&a4;
  v9 = (objc_class *)MEMORY[0x24BDC7498];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithType:objectID:date:eventStore:", v7, v12, v11, v10);

  return v13;
}

@end
