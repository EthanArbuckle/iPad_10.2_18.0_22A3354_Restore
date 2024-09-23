@implementation CLSSaveResponse

- (CLSSaveResponse)init
{
  CLSSaveResponse *v2;
  uint64_t v3;
  NSMutableDictionary *objectsByID;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSSaveResponse;
  v2 = -[CLSSaveResponse init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    objectsByID = v2->_objectsByID;
    v2->_objectsByID = (NSMutableDictionary *)v3;

    CLSDispatchQueueName(v2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB3E8 != -1)
      dispatch_once(&qword_1ED0FB3E8, &unk_1E9749990);
    v10 = (id)qword_1ED0FB3E0;
    v11 = dispatch_queue_create_with_target_V2(v8, v9, v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (id)savedObjectWithObjectID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D4069F44;
  v16 = sub_1D4069F54;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4069F5C;
  block[3] = &unk_1E974A038;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)clientRemote_deliverObject:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406A050;
  block[3] = &unk_1E9749DC0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clientRemote_saveDone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D82575D0](self->_completion);
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D406A1F8;
    v8[3] = &unk_1E974A088;
    v10 = v5;
    v9 = v4;
    dispatch_async(queue, v8);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_objectsByID, 0);
}

@end
