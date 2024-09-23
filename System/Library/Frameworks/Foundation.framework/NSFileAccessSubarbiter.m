@implementation NSFileAccessSubarbiter

- (NSFileAccessSubarbiter)initWithQueue:(id)a3 listener:(id)a4
{
  NSFileAccessSubarbiter *v6;
  NSFileAccessSubarbiter *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSFileAccessSubarbiter;
  v6 = -[NSFileAccessSubarbiter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_realSubarbiter = -[NSFileAccessArbiter initWithQueue:isSubarbiter:listener:]([NSFileAccessArbiter alloc], "initWithQueue:isSubarbiter:listener:", a3, 1, a4);
  }
  return v7;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)NSFileAccessSubarbiter;
  -[NSFileAccessSubarbiter dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  objc_msgSend(a4, "setExportedObject:", self->_realSubarbiter);
  objc_msgSend(a4, "setExportedInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  objc_msgSend(a4, "_setQueue:", self->_queue);
  objc_msgSend(a4, "resume");
  return 1;
}

- (void)stopArbitrating
{
  -[NSFileAccessArbiter stopArbitrating](self->_realSubarbiter, "stopArbitrating");
}

- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *queue;
  void *v8;
  _QWORD v10[6];
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  objc_msgSend(a3, "prepareClaimForGrantingWithArbiterQueue:", self->_queue);
  queue = self->_queue;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke;
    block[3] = &unk_1E0F52CB0;
    block[4] = self;
    block[5] = a3;
    block[6] = &v12;
    dispatch_sync(queue, block);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke_2;
    v10[3] = &unk_1E0F4C650;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(queue, v10);
  }
  v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_grantAccessClaim:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "claimerWaiter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_grantAccessClaim:", *(_QWORD *)(a1 + 40));
}

- (void)revokeAccessClaimForID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NSFileAccessSubarbiter_revokeAccessClaimForID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(queue, block);
}

uint64_t __49__NSFileAccessSubarbiter_revokeAccessClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_revokeAccessClaimForID:fromLocal:", *(_QWORD *)(a1 + 40), 1);
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Nested invocation of -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:] is not supported."), 0));
}

- (void)cancelAccessClaimForID:(id)a3
{
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NSFileAccessSubarbiter_cancelAccessClaimForID___block_invoke;
  block[3] = &unk_1E0F4C650;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

void __49__NSFileAccessSubarbiter_cancelAccessClaimForID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "cancelAccessClaimForID:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of cancellation and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5
{
  NSObject *queue;
  uint64_t v10;
  _QWORD block[10];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v10 = 0;
  _NSGetFSIDAndFileID((void *)objc_msgSend(a5, "logicalURL"), v12, &v10);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NSFileAccessSubarbiter_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke;
  block[3] = &unk_1E0F54758;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = v10;
  block[9] = v12[0];
  dispatch_async(queue, block);
}

void __69__NSFileAccessSubarbiter_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:", a1[5], a1[6], a1[7], a1[9], a1[8]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of file movement and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of item disconnection, which is a surprise.", v5, 2u);
  }
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of item reconnection, which is a surprise.", v5, 2u);
  }
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __75__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", a1[5], a1[6]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of a ubiquity change and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__NSFileAccessSubarbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __74__NSFileAccessSubarbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "writerWithPurposeID:didChangeSharingOfItemAtURL:", a1[5], a1[6]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of a sharing change and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  NSObject *queue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
  block[3] = &unk_1E0F54200;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_async(queue, block);
}

void __86__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of a ubiquity attribute change and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of item disappearance, which is a surprise.", v5, 2u);
  }
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of a change, which is a surprise.", v5, 2u);
  }
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  NSObject *queue;
  _QWORD block[11];

  block[10] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__NSFileAccessSubarbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
  block[3] = &unk_1E0F54228;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  block[9] = a7;
  dispatch_async(queue, block);
}

void __99__NSFileAccessSubarbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a1[5], a1[6], a1[7], a1[8], a1[9]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of file movement and it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__NSFileAccessSubarbiter_tiePresenterForID_toItemAtURL___block_invoke;
  v5[3] = &unk_1E0F51588;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __56__NSFileAccessSubarbiter_tiePresenterForID_toItemAtURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "superarbitrationConnection");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "tiePresenterForID:toItemAtURL:", a1[5], a1[6]);
  }
  else
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A subarbiter is being notified of file prsenter tying it's not even subarbitrating yet, which is a surprise.", v4, 2u);
    }
  }
}

@end
