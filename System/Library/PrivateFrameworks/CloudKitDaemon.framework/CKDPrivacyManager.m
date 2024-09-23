@implementation CKDPrivacyManager

+ (id)sharedManager
{
  if (qword_1ED702788 != -1)
    dispatch_once(&qword_1ED702788, &unk_1E7830C10);
  return (id)qword_1ED702780;
}

- (CKDPrivacyManager)init
{
  id v2;
  const char *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x1E0C94D90]);
  v4 = (id)objc_msgSend_initWithCode_format_(v2, v3, 12, CFSTR("Use +[CKDPrivacyManager sharedManager] instead"));
  objc_exception_throw(v4);
}

- (id)initInternal
{
  CKDPrivacyManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *privacyManagerQueue;
  uint64_t v7;
  NSMutableSet *operations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDPrivacyManager;
  v2 = -[CKDPrivacyManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.cloudkit.privacyManagerQueue", v4);
    privacyManagerQueue = v2->_privacyManagerQueue;
    v2->_privacyManagerQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableSet *)v7;

  }
  return v2;
}

- (void)resetPrivacySettingsWithCompletionHandler:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v5 = a3;
  objc_msgSend_privacyManagerQueue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA51DEC;
  block[3] = &unk_1E7830108;
  v11 = v5;
  v12 = a2;
  block[4] = self;
  v9 = v5;
  dispatch_async(v8, block);

}

- (void)_resetPrivacySettingsForAppContainerAccountTuple:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  CKDPrivacyManager *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_privacyManagerQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA52508;
  block[3] = &unk_1E782F678;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (OS_dispatch_queue)privacyManagerQueue
{
  return self->_privacyManagerQueue;
}

- (void)setPrivacyManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privacyManagerQueue, a3);
}

- (NSMutableSet)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_storeStrong((id *)&self->_operations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_privacyManagerQueue, 0);
}

@end
