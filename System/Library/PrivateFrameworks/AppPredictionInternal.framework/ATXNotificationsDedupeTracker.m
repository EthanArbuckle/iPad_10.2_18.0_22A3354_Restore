@implementation ATXNotificationsDedupeTracker

+ (ATXNotificationsDedupeTracker)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_217);
  return (ATXNotificationsDedupeTracker *)(id)sharedInstance_instance_5;
}

void __47__ATXNotificationsDedupeTracker_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_5;
  sharedInstance_instance_5 = v0;

}

- (ATXNotificationsDedupeTracker)init
{
  ATXNotificationsDedupeTracker *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableSet *recordsTable;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationsDedupeTracker;
  v2 = -[ATXNotificationsDedupeTracker init](&v12, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    recordsTable = v2->_recordsTable;
    v2->_recordsTable = (NSMutableSet *)v9;

  }
  return v2;
}

- (BOOL)addNotificationId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v9;
  ATXNotificationsDedupeTracker *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ATXNotificationsDedupeTracker_addNotificationId___block_invoke;
  block[3] = &unk_1E82DCC50;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

uint64_t __51__ATXNotificationsDedupeTracker_addNotificationId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", *(_QWORD *)(a1 + 32));
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)insertEvent:(int64_t)a3 notificationID:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  ATXNotificationsDedupeTracker *v11;
  int64_t v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ATXNotificationsDedupeTracker_insertEvent_notificationID___block_invoke;
  block[3] = &unk_1E82DEAD0;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

_QWORD *__60__ATXNotificationsDedupeTracker_insertEvent_notificationID___block_invoke(_QWORD *result)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = result[6];
  v2 = v1 > 0xD;
  v3 = (1 << v1) & 0x202E;
  if (!v2 && v3 != 0)
  {
    if (result[4])
      return (_QWORD *)objc_msgSend(*(id *)(result[5] + 16), "removeObject:");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
