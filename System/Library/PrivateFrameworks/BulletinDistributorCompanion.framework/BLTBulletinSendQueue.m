@implementation BLTBulletinSendQueue

- (BLTBulletinSendQueue)init
{
  BLTBulletinSendQueue *v2;
  BLTBulletinSendQueueAttachmentSender *v3;
  BLTBulletinSendQueueAttachmentSender *attachmentSender;
  BLTSendQueueSerializer *v5;
  BLTSendQueueSerializer *queueSerializer;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableArray *completionHandlers;
  uint64_t v13;
  NSMutableArray *queuedBlockHandlers;
  NSObject *v15;
  _QWORD block[4];
  BLTBulletinSendQueue *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BLTBulletinSendQueue;
  v2 = -[BLTBulletinSendQueue init](&v19, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAttachmentFiles"))
    {
      v3 = objc_alloc_init(BLTBulletinSendQueueAttachmentSender);
      attachmentSender = v2->_attachmentSender;
      v2->_attachmentSender = v3;

    }
    v5 = -[BLTSendQueueSerializer initWithUsesMessageIdentifiers:]([BLTSendQueueSerializer alloc], "initWithUsesMessageIdentifiers:", 0);
    queueSerializer = v2->_queueSerializer;
    v2->_queueSerializer = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("BLTBulletinSendQueueSupported", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    queuedBlockHandlers = v2->_queuedBlockHandlers;
    v2->_queuedBlockHandlers = (NSMutableArray *)v13;

    v15 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__BLTBulletinSendQueue_init__block_invoke;
    block[3] = &unk_24D761AD0;
    v18 = v2;
    dispatch_async(v15, block);

  }
  return v2;
}

void __28__BLTBulletinSendQueue_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  BLTFileURLInPairingPathWait(CFSTR("bulletintmpdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __28__BLTBulletinSendQueue_init__block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);

    BLTFileURLInHomePath(CFSTR("bulletintmpdata"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      blt_general_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __28__BLTBulletinSendQueue_init__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setSendFileURL:", v2);

}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unsigned __int16 v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BLTBulletinSendQueue_sendRequest_type_didSend_didQueue___block_invoke;
  block[3] = &unk_24D762B80;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

uint64_t __58__BLTBulletinSendQueue_sendRequest_type_didSend_didQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Queuing new request", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 64), 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  BLTBulletinSendQueue *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BLTBulletinSendQueue_sendRequest_withTimeout_didSend___block_invoke;
  block[3] = &unk_24D761D70;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

uint64_t __56__BLTBulletinSendQueue_sendRequest_withTimeout_didSend___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "redact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Queuing new intelligent summary request %@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(_QWORD *)(a1 + 32), 27, *(_QWORD *)(a1 + 48), 0, 0, 0);
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  BLTBulletinSendQueue *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__BLTBulletinSendQueue_sendRequest_withTimeout_isTrafficRestricted_didSend___block_invoke;
  block[3] = &unk_24D762BA8;
  v18 = v10;
  v19 = self;
  v22 = a5;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

void __76__BLTBulletinSendQueue_sendRequest_withTimeout_isTrafficRestricted_didSend___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "redact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Queuing new add bulletin request %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "bulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  objc_msgSend(v4, "attachmentURLURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentKey:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttachment:key:", v6, v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "additionalAttachments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        objc_msgSend(v12, "attachmentURLURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attachmentKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAttachment:key:", v14, v16);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), 0);
}

- (void)_queue_sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 isTrafficRestricted:(BOOL)a6 didSend:(id)a7 didQueue:(id)a8
{
  _BOOL4 v10;
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  NSDate *lastItemDate;
  uint64_t v22;
  int *v23;
  NSNumber *v24;
  NSNumber *timeout;
  void *v26;
  double v27;
  NSDate *v28;
  NSDate *v29;
  NSNumber *v30;
  NSNumber *v31;
  NSMutableArray *completionHandlers;
  void *v33;
  NSMutableArray *queuedBlockHandlers;
  void *v35;
  NSDate *lastQueueSendDate;
  double v37;
  void *v38;
  void *v39;
  id v40;

  v10 = a6;
  v12 = a4;
  v40 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18 = (void *)MEMORY[0x24BDBCE60];
  v19 = 0.5;
  if (v10)
    v19 = (double)BLTGetTrafficRestrictedBufferTime();
  objc_msgSend(v18, "dateWithTimeIntervalSinceNow:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  lastItemDate = self->_lastItemDate;
  if (lastItemDate)
  {
    -[NSDate earlierDate:](lastItemDate, "earlierDate:", v20);
    v22 = objc_claimAutoreleasedReturnValue();

    -[BLTBulletinSendQueue _queue_queuePending](self, "_queue_queuePending");
    -[BLTSendQueueSerializer add:type:](self->_queueSerializer, "add:type:", v40, v12);
    v20 = (void *)v22;
    v23 = &OBJC_IVAR___BLTRemoteRequestLogItem__sessionState;
    if (v10)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      timeout = self->_timeout;
      self->_timeout = v24;
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDBCE60];
    v27 = 1.0;
    if (v10)
      v27 = (double)BLTGetTrafficRestrictedBufferTime();
    objc_msgSend(v26, "dateWithTimeIntervalSinceNow:", v27);
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v29 = self->_lastItemDate;
    self->_lastItemDate = v28;

    v23 = &OBJC_IVAR___BLTRemoteRequestLogItem__sessionState;
    objc_storeStrong((id *)&self->_firstRequest, a3);
    self->_firstRequestType = v12;
    if (v10)
      goto LABEL_5;
  }
  if (v15)
  {
    v30 = self->_timeout;
    if (!v30 || -[NSNumber compare:](v30, "compare:", v15) == NSOrderedAscending)
    {
      v31 = (NSNumber *)v15;
      timeout = self->_timeout;
      self->_timeout = v31;
      goto LABEL_13;
    }
  }
LABEL_14:
  if (v16)
  {
    completionHandlers = self->_completionHandlers;
    v33 = (void *)objc_msgSend(v16, "copy");
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v33);

  }
  if (v17)
  {
    queuedBlockHandlers = self->_queuedBlockHandlers;
    v35 = (void *)objc_msgSend(v17, "copy");
    -[NSMutableArray addObject:](queuedBlockHandlers, "addObject:", v35);

  }
  if (*(Class *)((char *)&self->super.super.isa + v23[405]))
  {
    if (!v10)
    {
      lastQueueSendDate = self->_lastQueueSendDate;
      if (!lastQueueSendDate)
        goto LABEL_24;
      -[NSDate timeIntervalSinceNow](lastQueueSendDate, "timeIntervalSinceNow");
      if (v37 < -0.5)
        goto LABEL_24;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "earlierDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 == v20)
LABEL_24:
    -[BLTBulletinSendQueue _queue_performSend](self, "_queue_performSend");
  else
    -[BLTBulletinSendQueue _queue_startTimerWithFireDate:](self, "_queue_startTimerWithFireDate:", v20);

}

- (BOOL)handleFileURL:(id)a3
{
  BLTSendQueueSerializer *queueSerializer;
  id v5;
  void *v6;

  queueSerializer = self->_queueSerializer;
  v5 = a3;
  -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(queueSerializer) = -[BLTSendQueueSerializer handleFileURL:protobufHandler:](queueSerializer, "handleFileURL:protobufHandler:", v5, v6);

  return (char)queueSerializer;
}

- (void)queuePending
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__BLTBulletinSendQueue_queuePending__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__BLTBulletinSendQueue_queuePending__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queuePending");
}

- (void)sendNow
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BLTBulletinSendQueue_sendNow__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__BLTBulletinSendQueue_sendNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performSend");
}

- (void)_queue_performSend
{
  NSDate *lastItemDate;
  NSNumber *v4;
  _BOOL4 v5;
  NSDate *v6;
  void *v7;
  NSNumber *timeout;
  void *v9;
  NSDate *v10;
  NSDate *lastQueueSendDate;
  dispatch_group_t v12;
  BLTBulletinSendQueueAttachmentSender *attachmentSender;
  void *v14;
  NSObject *v15;
  void *v16;
  PBCodable *firstRequest;
  uint64_t firstRequestType;
  uint64_t v19;
  void *v20;
  BLTSendQueueSerializer *queueSerializer;
  void *v22;
  uint64_t v23;
  id *v24;
  PBCodable *v25;
  NSObject *queue;
  id v27;
  void *v28;
  _QWORD block[4];
  id v30;
  uint64_t *v31;
  _QWORD *v32;
  uint8_t *v33;
  _QWORD *v34;
  _QWORD v35[4];
  PBCodable *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  _QWORD v39[5];
  _QWORD v40[4];
  _QWORD v41[3];
  char v42;
  _QWORD v43[5];
  NSObject *v44;
  _QWORD *v45;
  uint64_t *v46;
  uint8_t *v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[3];
  char v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;

  lastItemDate = self->_lastItemDate;
  blt_general_log();
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO);
  if (lastItemDate)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2173D9000, &v4->super.super, OS_LOG_TYPE_INFO, "Sending queue now", buf, 2u);
    }

    v6 = self->_lastItemDate;
    self->_lastItemDate = 0;

    -[BLTBulletinSendQueue timer](self, "timer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[BLTBulletinSendQueue setTimer:](self, "setTimer:", 0);
    v4 = self->_timeout;
    timeout = self->_timeout;
    self->_timeout = 0;

    v9 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
    v28 = (void *)-[NSMutableArray copy](self->_queuedBlockHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_queuedBlockHandlers, "removeAllObjects");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastQueueSendDate = self->_lastQueueSendDate;
    self->_lastQueueSendDate = v10;

    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    *(_QWORD *)buf = 0;
    v55 = buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__4;
    v58 = __Block_byref_object_dispose__4;
    v59 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__4;
    v50[4] = __Block_byref_object_dispose__4;
    v51 = 0;
    v12 = dispatch_group_create();
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v49 = 0;
    attachmentSender = self->_attachmentSender;
    -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke;
    v43[3] = &unk_24D762BF8;
    v43[4] = self;
    v45 = v48;
    v46 = &v60;
    v47 = buf;
    v15 = v12;
    v44 = v15;
    LODWORD(attachmentSender) = -[BLTBulletinSendQueueAttachmentSender sendAttachmentsWithSender:timeout:completion:](attachmentSender, "sendAttachmentsWithSender:timeout:completion:", v14, v4, v43);

    if ((_DWORD)attachmentSender)
      dispatch_group_enter(v15);
    else
      *((_BYTE *)v61 + 24) = 1;

    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = 0;
    dispatch_group_enter(v15);
    if (self->_firstRequest)
    {
      -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      firstRequest = self->_firstRequest;
      firstRequestType = self->_firstRequestType;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_3;
      v39[3] = &unk_24D762BF8;
      v39[4] = self;
      v40[1] = v41;
      v40[2] = v52;
      v40[3] = v50;
      v40[0] = v15;
      v19 = objc_msgSend(v28, "count");
      if (v19)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v16, "sendRequest:type:withTimeout:didSend:didQueue:", firstRequest, firstRequestType, v4, v39, v20);
      v24 = (id *)v40;
      if (v19)

      v25 = self->_firstRequest;
      self->_firstRequest = 0;
    }
    else
    {
      queueSerializer = self->_queueSerializer;
      -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_5;
      v37[3] = &unk_24D762BF8;
      v37[4] = self;
      v38[1] = v41;
      v38[2] = v52;
      v38[3] = v50;
      v38[0] = v15;
      v35[0] = v23;
      v35[1] = 3221225472;
      v35[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_7;
      v35[3] = &unk_24D761AD0;
      v36 = v28;
      -[BLTSendQueueSerializer sendWithSender:timeout:responseHandlers:didSend:didQueue:](queueSerializer, "sendWithSender:timeout:responseHandlers:didSend:didQueue:", v22, v4, 0, v37, v35);
      v24 = (id *)v38;

      v25 = v36;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_8;
    block[3] = &unk_24D762C20;
    v30 = v9;
    v31 = &v60;
    v32 = v52;
    v33 = buf;
    v34 = v50;
    v27 = v9;
    dispatch_group_notify(v15, queue, block);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v48, 8);

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v52, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v60, 8);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, &v4->super.super, OS_LOG_TYPE_INFO, "Request to send queue now. Nothing to send.", buf, 2u);
  }

}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  __int128 v13;
  char v14;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_2;
  block[3] = &unk_24D762BD0;
  v14 = a2;
  v13 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 72);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  __int128 v13;
  char v14;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_4;
  block[3] = &unk_24D762BD0;
  v14 = a2;
  v13 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 72);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  __int128 v13;
  char v14;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_6;
  block[3] = &unk_24D762BD0;
  v14 = a2;
  v13 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_6(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 72);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_7(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          v7 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;
        else
          v7 = 1;
        v8 = !v7;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          v9 = *(_QWORD *)(a1 + 56);
        else
          v9 = *(_QWORD *)(a1 + 64);
        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), v8, *(_QWORD *)(*(_QWORD *)(v9 + 8) + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_queue_startTimerWithFireDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *queue;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  -[BLTBulletinSendQueue timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3748]), "initWithIdentifier:", CFSTR("com.apple.bulletindistributor.coalescebulletinrequest"));
  -[BLTBulletinSendQueue setTimer:](self, "setTimer:", v6);

  objc_initWeak(&location, self);
  -[BLTBulletinSendQueue timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__BLTBulletinSendQueue__queue_startTimerWithFireDate___block_invoke;
  v9[3] = &unk_24D762C48;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "scheduleForDate:leewayInterval:queue:handler:", v4, queue, v9, 1.0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __54__BLTBulletinSendQueue__queue_startTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performSend");

}

- (void)_queue_queuePending
{
  PBCodable *firstRequest;
  PBCodable *v4;

  firstRequest = self->_firstRequest;
  if (firstRequest)
  {
    -[BLTSendQueueSerializer add:type:](self->_queueSerializer, "add:type:", firstRequest, self->_firstRequestType);
    v4 = self->_firstRequest;
    self->_firstRequest = 0;

  }
}

- (SWWakingTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queueSerializer, 0);
  objc_storeStrong((id *)&self->_attachmentSender, 0);
  objc_storeStrong((id *)&self->_lastQueueSendDate, 0);
  objc_storeStrong((id *)&self->_firstRequest, 0);
  objc_storeStrong((id *)&self->_lastItemDate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_queuedBlockHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __28__BLTBulletinSendQueue_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "ERROR! Unable to create fall back URL!", a5, a6, a7, a8, 0);
}

void __28__BLTBulletinSendQueue_init__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "ERROR! Bulletin send queue file URL is nil!", a5, a6, a7, a8, 0);
}

@end
