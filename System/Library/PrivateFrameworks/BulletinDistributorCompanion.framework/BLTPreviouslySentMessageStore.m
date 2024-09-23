@implementation BLTPreviouslySentMessageStore

- (BLTPreviouslySentMessageStore)initWithMessageStorePath:(id)a3
{
  id v5;
  BLTPreviouslySentMessageStore *v6;
  BLTPreviouslySentMessageStore *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSMutableDictionary *messageDigests;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  id v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BLTPreviouslySentMessageStore;
  v6 = -[BLTPreviouslySentMessageStore init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentsAtPath:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v13, &v25);
    v15 = v25;
    if (v15)
    {
      blt_general_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[BLTPreviouslySentMessageStore initWithMessageStorePath:].cold.2((uint64_t)v15, v16);

    }
    objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x24BDD0E88]);
    v17 = objc_claimAutoreleasedReturnValue();
    messageDigests = v7->_messageDigests;
    v7->_messageDigests = (NSMutableDictionary *)v17;

    if (!v7->_messageDigests)
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v20 = v7->_messageDigests;
      v7->_messageDigests = v19;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.bulletindistributor.previouslysentmessagestore", v21);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;

  }
  return v7;
}

- (id)messageDigestForUnsentMessage:(id)a3 messageKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__BLTPreviouslySentMessageStore_messageDigestForUnsentMessage_messageKey___block_invoke;
  v13[3] = &unk_24D762750;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __74__BLTPreviouslySentMessageStore_messageDigestForUnsentMessage_messageKey___block_invoke(uint64_t a1)
{
  BLTMessageDigest *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[BLTMessageDigest initWithMessage:]([BLTMessageDigest alloc], "initWithMessage:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isEqual:", v8))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  v7 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setDirty:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)recordMessageDigestAsPreviouslySent:(id)a3 messageKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__BLTPreviouslySentMessageStore_recordMessageDigestAsPreviouslySent_messageKey___block_invoke;
  block[3] = &unk_24D761D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __80__BLTPreviouslySentMessageStore_recordMessageDigestAsPreviouslySent_messageKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setDirty:", 1);
}

- (void)removeDigestForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BLTPreviouslySentMessageStore_removeDigestForKey___block_invoke;
  block[3] = &unk_24D761AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __52__BLTPreviouslySentMessageStore_removeDigestForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDirty:", 1);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BLTPreviouslySentMessageStore_invalidate__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__BLTPreviouslySentMessageStore_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

- (void)dealloc
{
  objc_super v3;

  -[BLTPreviouslySentMessageStore invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLTPreviouslySentMessageStore;
  -[BLTPreviouslySentMessageStore dealloc](&v3, sel_dealloc);
}

- (void)clear
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BLTPreviouslySentMessageStore_clear__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __38__BLTPreviouslySentMessageStore_clear__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

- (BOOL)isEmpty
{
  BLTPreviouslySentMessageStore *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__BLTPreviouslySentMessageStore_isEmpty__block_invoke;
  v5[3] = &unk_24D761CF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__BLTPreviouslySentMessageStore_isEmpty__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (void)_save
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "Exception %@ archiving to %@");
  OUTLINED_FUNCTION_5();
}

- (void)_enqueueSave
{
  OS_dispatch_source *v3;
  OS_dispatch_source *saveTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  -[BLTPreviouslySentMessageStore _cancelSave](self, "_cancelSave");
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  saveTimer = self->_saveTimer;
  self->_saveTimer = v3;

  v5 = self->_saveTimer;
  v6 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v7 = self->_saveTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __45__BLTPreviouslySentMessageStore__enqueueSave__block_invoke;
  handler[3] = &unk_24D761AD0;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_saveTimer);
}

void __45__BLTPreviouslySentMessageStore__enqueueSave__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_save");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void)_cancelSave
{
  NSObject *saveTimer;

  saveTimer = self->_saveTimer;
  if (saveTimer)
    dispatch_source_cancel(saveTimer);
}

- (void)setDirty:(BOOL)a3
{
  if (self->_dirty != a3 && a3)
    -[BLTPreviouslySentMessageStore _enqueueSave](self, "_enqueueSave");
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDigests, 0);
}

- (void)initWithMessageStorePath:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_2173D9000, a2, a3, "Exception %@ unarchiving %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)initWithMessageStorePath:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Error initializing unarchiver for previously sent message store: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
