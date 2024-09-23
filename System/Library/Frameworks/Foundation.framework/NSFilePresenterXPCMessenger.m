@implementation NSFilePresenterXPCMessenger

- (NSFilePresenterXPCMessenger)initWithFilePresenter:(id)a3 queue:(id)a4
{
  NSFilePresenterXPCMessenger *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFilePresenterXPCMessenger;
  v6 = -[NSFilePresenterXPCMessenger init](&v8, sel_init);
  if (v6)
  {
    v6->_filePresenter = (NSFilePresenter *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (NSFilePresenterXPCMessenger)initWithFilePresenterProxy:(id)a3
{
  NSFilePresenterXPCMessenger *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFilePresenterXPCMessenger;
  v4 = -[NSFilePresenterXPCMessenger init](&v6, sel_init);
  if (v4)
    v4->_filePresenterProxy = (NSFilePresenterProxy *)a3;
  return v4;
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
  v4.super_class = (Class)NSFilePresenterXPCMessenger;
  -[NSFilePresenterXPCMessenger dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{

  self->_filePresenter = 0;
  self->_filePresenterProxy = 0;
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6
{
  NSFilePresenter *filePresenter;
  id v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke;
    v14[3] = &unk_1E0F4E088;
    v14[4] = a6;
    -[NSFilePresenterXPCMessenger _makePresenter:relinquishToReadingClaimWithID:purposeID:options:completionHandler:](self, "_makePresenter:relinquishToReadingClaimWithID:purposeID:options:completionHandler:", filePresenter, a3, a5, a4, v14);
  }
  else if (self->_filePresenterProxy)
  {
    v13 = -[NSXPCConnection userInfo](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "userInfo");
    if (object_getClass(v13) != (Class)NSFileSubarbitrationClaim)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessArbiter.m"), 3327, CFSTR("Wrong class in connection userInfo: %@"), objc_opt_class());
    if (objc_msgSend(v13, "isRevoked"))
      NSLog((NSString *)CFSTR("NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked"));
    objc_msgSend(v13, "forwardRelinquishmentForWritingClaim:withID:options:purposeID:subitemURL:toPresenter:usingReplySender:", 0, a3, a4, a5, 0, self->_filePresenterProxy, a6);
  }
  else
  {
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2;
  v4[3] = &unk_1E0F4E060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7
{
  NSFilePresenter *filePresenter;
  uint64_t v14;
  id v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v14 = objc_msgSend(a6, "URL");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
    v17[3] = &unk_1E0F54328;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a5;
    v17[7] = a6;
    v17[8] = a7;
    v17[9] = a4;
    -[NSFilePresenterXPCMessenger _makePresenter:validateRelinquishmentToSubitemAtURL:completionHandler:](self, "_makePresenter:validateRelinquishmentToSubitemAtURL:completionHandler:", filePresenter, v14, v17);
  }
  else if (self->_filePresenterProxy)
  {
    v16 = -[NSXPCConnection userInfo](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "userInfo");
    if (object_getClass(v16) != (Class)NSFileSubarbitrationClaim)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessArbiter.m"), 3363, CFSTR("Wrong class in connection userInfo: %@"), objc_opt_class());
    if (objc_msgSend(v16, "isRevoked"))
      NSLog((NSString *)CFSTR("NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked"));
    objc_msgSend(v16, "forwardRelinquishmentForWritingClaim:withID:options:purposeID:subitemURL:toPresenter:usingReplySender:", 1, a3, a4, a5, a6, self->_filePresenterProxy, a7);
  }
  else
  {
    (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
  }
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[8] + 16))(a1[8], 0);
  v3 = (_QWORD *)a1[4];
  v2 = a1[5];
  v4 = v3[1];
  v5 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
  v9[3] = &unk_1E0F4E088;
  v7 = a1[9];
  v9[4] = a1[8];
  return objc_msgSend(v3, "_makePresenter:relinquishToWritingClaimWithID:options:purposeID:subitemURL:completionHandler:", v4, v2, v7, v5, v6, v9);
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
  v4[3] = &unk_1E0F4E060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)reacquireFromReadingClaimForID:(id)a3
{
  id v6;

  if (self->_filePresenter)
  {
    objc_msgSend(-[NSFilePresenterXPCMessenger _readRelinquishment](self, "_readRelinquishment"), "removeBlockingAccessClaimID:", a3);
  }
  else if (self->_filePresenterProxy)
  {
    v6 = -[NSXPCConnection userInfo](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "userInfo");
    if (object_getClass(v6) != (Class)NSFileSubarbitrationClaim)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessArbiter.m"), 3390, CFSTR("Wrong class in connection userInfo: %@"), objc_opt_class());
    if (objc_msgSend(v6, "isRevoked"))
      NSLog((NSString *)CFSTR("NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked"));
    objc_msgSend(v6, "forwardReacquisitionForWritingClaim:withID:toPresenterForID:usingReplySender:", 0, a3, -[NSFileReactorProxy reactorID](self->_filePresenterProxy, "reactorID"), 0);
  }
}

- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4
{
  id v8;

  if (self->_filePresenter)
  {
    objc_msgSend(-[NSFilePresenterXPCMessenger _writeRelinquishment](self, "_writeRelinquishment"), "removeBlockingAccessClaimID:thenContinue:", a3, a4);
  }
  else if (self->_filePresenterProxy)
  {
    v8 = -[NSXPCConnection userInfo](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "userInfo");
    if (object_getClass(v8) != (Class)NSFileSubarbitrationClaim)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessArbiter.m"), 3413, CFSTR("Wrong class in connection userInfo: %@"), objc_opt_class());
    if (objc_msgSend(v8, "isRevoked"))
      NSLog((NSString *)CFSTR("NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked"));
    objc_msgSend(v8, "forwardReacquisitionForWritingClaim:withID:toPresenterForID:usingReplySender:", 1, a3, -[NSFileReactorProxy reactorID](self->_filePresenterProxy, "reactorID"), a4);
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  NSFilePresenter *filePresenter;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E0F4E088;
    v5[4] = a3;
    -[NSFilePresenterXPCMessenger _makePresenter:saveChangesWithCompletionHandler:](self, "_makePresenter:saveChangesWithCompletionHandler:", filePresenter, v5);
  }
  else if (self->_filePresenterProxy)
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A server unexpectedly received a saveChangesWithCompletionHandler: message", buf, 2u);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E0F4E060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4
{
  NSFilePresenter *filePresenter;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v7 = objc_msgSend(a3, "URL");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke;
    v9[3] = &unk_1E0F4E088;
    v9[4] = a4;
    -[NSFilePresenterXPCMessenger _makePresenter:accommodateDeletionWithSubitemURL:completionHandler:](self, "_makePresenter:accommodateDeletionWithSubitemURL:completionHandler:", filePresenter, v7, v9);
  }
  else if (self->_filePresenterProxy)
  {
    v8 = _NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v8, OS_LOG_TYPE_FAULT, "A server unexpectedly received a accommodateDeletionOfSubitemAtURL: message", buf, 2u);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2;
  v4[3] = &unk_1E0F4E060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)observeChangeWithSubitemURL:(id)a3
{
  NSFilePresenter *filePresenter;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeChangeWithSubitemURL:](self, "_makePresenter:observeChangeWithSubitemURL:", filePresenter, objc_msgSend(a3, "URL"));
  }
  else if (self->_filePresenterProxy)
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeChangeWithSubitemURL: message", v5, 2u);
    }
  }
}

- (void)observeMoveToURL:(id)a3 withSubitemURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  id v14;

  if (self->_filePresenter)
  {
    objc_msgSend(a3, "logicalURL", a3, a4, a5);
    _CFURLNoteSecurityScopedResourceMoved();
    -[NSFilePresenterXPCMessenger _makePresenter:observeMoveToURL:withSubitemURL:](self, "_makePresenter:observeMoveToURL:withSubitemURL:", self->_filePresenter, objc_msgSend(a3, "URL"), objc_msgSend(a4, "URL"));
  }
  else if (self->_filePresenterProxy)
  {
    v14 = -[NSXPCConnection userInfo](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "userInfo");
    if (object_getClass(v14) != (Class)NSFileSubarbitrationClaim)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileAccessArbiter.m"), 3509, CFSTR("Wrong class in connection userInfo: %@"), objc_opt_class());
    if (objc_msgSend(v14, "isRevoked"))
      NSLog((NSString *)CFSTR("NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked"));
    -[NSFilePresenterProxy observeMoveOfSubitemAtURL:toURL:byWriterWithPurposeID:withFSID:andFileID:](self->_filePresenterProxy, "observeMoveOfSubitemAtURL:toURL:byWriterWithPurposeID:withFSID:andFileID:", a4, a3, a5, a6, a7);
  }
}

- (void)observeDisconnection
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveDisconnection:](self, "_makePresenterObserveDisconnection:");
  }
  else if (self->_filePresenterProxy)
  {
    v2 = _NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_1817D9000, v2, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeDisconnection message", v3, 2u);
    }
  }
}

- (void)observeReconnection
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveReconnection:](self, "_makePresenterObserveReconnection:");
  }
  else if (self->_filePresenterProxy)
  {
    v2 = _NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_1817D9000, v2, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeReconnection message", v3, 2u);
    }
  }
}

- (void)observeUbiquityChangeWithSubitemURL:(id)a3
{
  NSFilePresenter *filePresenter;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeUbiquityChangeWithSubitemURL:](self, "_makePresenter:observeUbiquityChangeWithSubitemURL:", filePresenter, objc_msgSend(a3, "URL"));
  }
  else if (self->_filePresenterProxy)
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeUbiquityChangeWithSubitemURL: message", v5, 2u);
    }
  }
}

- (void)observeSharingChangeWithSubitemURL:(id)a3
{
  NSFilePresenter *filePresenter;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeSharingChangeWithSubitemURL:](self, "_makePresenter:observeSharingChangeWithSubitemURL:", filePresenter, objc_msgSend(a3, "URL"));
  }
  else if (self->_filePresenterProxy)
  {
    v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeSharingChangeWithSubitemURL: message", v5, 2u);
    }
  }
}

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeChangeOfUbiquityAttributes:](self, "_makePresenter:observeChangeOfUbiquityAttributes:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeChangeOfUbiquityAttributes: message", v4, 2u);
    }
  }
}

- (void)observeVersionChangeOfKind:(id)a3 toItemAtURL:(id)a4 withClientID:(id)a5 name:(id)a6
{
  NSFilePresenter *filePresenter;
  NSObject *v7;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeVersionChangeOfKind:withClientID:name:subitemURL:](self, "_makePresenter:observeVersionChangeOfKind:withClientID:name:subitemURL:", filePresenter, a3, a5, a6, objc_msgSend(a4, "URL"));
  }
  else if (self->_filePresenterProxy)
  {
    v7 = _NSFCPresenterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1817D9000, v7, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeVersionChangeOfKind: message", v8, 2u);
    }
  }
}

- (void)observePresenterChange:(BOOL)a3 forSubitemAtURL:(id)a4
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[7];
  BOOL v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", self->_filePresenter);
    v8 = _NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543875;
      v15 = v7;
      v16 = 1024;
      v17 = v5;
      v18 = 2113;
      v19 = a4;
      _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe presenter change: %d at %{private}@", buf, 0x1Cu);
    }
    v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", self->_filePresenter, CFSTR("Observe Presenter Change"));
    v10 = (void *)-[NSFilePresenter presentedItemOperationQueue](self->_filePresenter, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke;
    v12[3] = &unk_1E0F54350;
    v12[4] = v9;
    v12[5] = self;
    v13 = v5;
    v12[6] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v12);
  }
  else if (self->_filePresenterProxy)
  {
    v11 = _NSFCPresenterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v11, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observePresenterChange: message", buf, 2u);
    }
  }
}

uint64_t __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "presentedSubitemHasPresenters:atURL:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 48), "URL"));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)updateLastEventID:(unint64_t)a3
{
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setLastPresentedItemEventIdentifier:](self, "_makePresenter:setLastPresentedItemEventIdentifier:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a updateLastEventID: message", v4, 2u);
    }
  }
}

- (void)setProviderPurposeIdentifier:(id)a3
{
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setProviderPurposeIdentifier:](self, "_makePresenter:setProviderPurposeIdentifier:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1817D9000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a setProviderPurposeIdentifier: message", v4, 2u);
    }
  }
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation](NSFileAccessArbiterProxy, "_fileReactorDebuggingInformation"));
}

- (void)logSuspensionWarning
{
  NSFilePresenter *filePresenter;
  NSString *v3;

  filePresenter = self->_filePresenter;
  if (filePresenter)
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File presenter %@ with presentedItemURL %@"), filePresenter, objc_msgSend((id)-[NSFilePresenter presentedItemURL](self->_filePresenter, "presentedItemURL"), "path"));
  else
    v3 = (NSString *)CFSTR("An unknown file presenter");
  NSLog((NSString *)CFSTR("%@ was still registered at the time this application was suspended, and implements one or more NSFilePresenter messages requiring a response. For NSFilePresenters for file system locations that are accessible to other processes (e.g. iCloud or group containers), you should either call removeFilePresenter: when the process is backgrounded, or remove any implementations of NSFilePresenter methods requiring a response. Otherwise, the system will kill your process instead of risking deadlock."), v3);
}

- (void)_makePresenter:(id)a3 saveChangesWithCompletionHandler:(id)a4
{
  id v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Save Changes"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E0F543A0;
    v8[4] = a3;
    v8[5] = v7;
    v8[6] = self;
    v8[7] = a4;
    objc_msgSend((id)objc_msgSend(a3, "presentedItemOperationQueue"), "addOperation:", +[NSFilePresenterAsynchronousOperation operationWithBlock:](NSFilePresenterAsynchronousOperation, "operationWithBlock:", v8));
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 32));
  v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ savePresentedItemChanges", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_417;
  v9[3] = &unk_1E0F545F8;
  v9[4] = v4;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v11 = a2;
  v12 = v7;
  return objc_msgSend(v6, "savePresentedItemChangesWithCompletionHandler:", v9);
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_417(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished savePresentedItemChanges", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_418;
  block[3] = &unk_1E0F54378;
  v8 = *(_QWORD *)(a1 + 64);
  block[5] = a2;
  block[6] = v8;
  block[1] = 3221225472;
  block[4] = v6;
  dispatch_async(v7, block);
  return objc_msgSend(*(id *)(a1 + 56), "finish");
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_418(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 reportUnsavedChangesWithCompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Report Unsaved Changes"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E0F50670;
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = a3;
    v10[7] = self;
    v10[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v10);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ reportUnsavedChanges", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_424;
  v7[3] = &unk_1E0F53E48;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v4, "presentedItemHasUnsavedChangesWithCompletionHandler:", v7);
}

void __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_424(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[6];
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = "YES";
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2080;
    v15 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reportUnsavedChanges with reply: %s", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_427;
  block[3] = &unk_1E0F543C8;
  block[1] = 3221225472;
  v9 = *(_QWORD *)(a1 + 56);
  block[4] = v7;
  block[5] = v9;
  v11 = a2;
  dispatch_async(v8, block);
}

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_427(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(_QWORD, NSNumber *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
}

- (void)_makePresenter:(id)a3 validateRemoteDeletionRecordingRelinquishment:(id)a4 completionHandler:(id)a5
{
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke;
    v9[3] = &unk_1E0F543F0;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend(a4, "performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:withReply:", v9, a5);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[6];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 32));
  v5 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", *(_QWORD *)(a1 + 32), CFSTR("Validate Deletion"));
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "presentedItemOperationQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2;
  v8[3] = &unk_1E0F50670;
  v8[4] = v4;
  v8[5] = v5;
  v9 = *(_OWORD *)(a1 + 32);
  v10 = a2;
  return objc_msgSend(v6, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ validatePresentedItemDeletion", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_432;
  v7[3] = &unk_1E0F53E48;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v4, "validatePresentedItemRemoteDeletionWithCompletionHandler:", v7);
}

void __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_432(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[6];
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = "YES";
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2080;
    v15 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished validatePresentedItemDeletion with reply: %s", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_433;
  block[3] = &unk_1E0F543C8;
  block[1] = 3221225472;
  v9 = *(_QWORD *)(a1 + 56);
  block[4] = v7;
  block[5] = v9;
  v11 = a2;
  dispatch_async(v8, block);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_433(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_makePresenter:(id)a3 accommodateDeletionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  NSFilePresenterXPCMessenger *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSFilePresenterXPCMessenger *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Accommodate Subitem Deletion"));
      v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke;
      v26 = &unk_1E0F533F8;
      v27 = v9;
      v28 = a4;
      v29 = v10;
      v30 = a3;
      v31 = self;
      v32 = a5;
      v12 = &v23;
LABEL_6:
      objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
        v29,
        v30,
        v31,
        v32);
      return;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Accommodate Deletion"));
    v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2;
    v17 = &unk_1E0F50670;
    v18 = v9;
    v19 = v13;
    v20 = a3;
    v21 = self;
    v22 = a5;
    v12 = &v14;
    goto LABEL_6;
  }
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    v12 = v3;
    v13 = 2113;
    v14 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateSubitemDeletion for %{private}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "didBegin");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_439;
  v9[3] = &unk_1E0F54418;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v7;
  v10 = *(_OWORD *)(a1 + 64);
  return objc_msgSend(v6, "accommodatePresentedSubitemDeletionAtURL:completionHandler:", v5, v9);
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_439(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemDeletion", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_440;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_440(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateDeletion", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_445;
  v7[3] = &unk_1E0F54418;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v4, "accommodatePresentedItemDeletionWithCompletionHandler:", v7);
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_445(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateDeletion", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_446;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_446(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 accommodateEvictionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  NSFilePresenterXPCMessenger *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSFilePresenterXPCMessenger *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Accommodate Subitem Eviction"));
      v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke;
      v26 = &unk_1E0F533F8;
      v27 = v9;
      v28 = a4;
      v29 = v10;
      v30 = a3;
      v31 = self;
      v32 = a5;
      v12 = &v23;
LABEL_6:
      objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
        v29,
        v30,
        v31,
        v32);
      return;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Accommodate Eviction"));
    v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2;
    v17 = &unk_1E0F50670;
    v18 = v9;
    v19 = v13;
    v20 = a3;
    v21 = self;
    v22 = a5;
    v12 = &v14;
    goto LABEL_6;
  }
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    v12 = v3;
    v13 = 2113;
    v14 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateSubitemEviction for %{private}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "didBegin");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_451;
  v9[3] = &unk_1E0F54418;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v7;
  v10 = *(_OWORD *)(a1 + 64);
  return objc_msgSend(v6, "accommodatePresentedSubitemEvictionAtURL:completionHandler:", v5, v9);
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_451(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemEviction", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_452;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_452(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateEviction", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_457;
  v7[3] = &unk_1E0F54418;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v4, "accommodatePresentedItemEvictionWithCompletionHandler:", v7);
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_457(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateEviction", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_458;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_458(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 accommodateDisconnectionWithCompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Accommodate Disconnection"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E0F50670;
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = a3;
    v10[7] = self;
    v10[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v10);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_INFO, "Making presenter %{public}@ accommodateDisconnection", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "didBegin");
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_463;
  v7[3] = &unk_1E0F54418;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v4, "accommodatePresentedItemDisconnectionWithCompletionHandler:", v7);
}

void __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_463(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_INFO, "%{public}@ finished accommodateDisconnection", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_464;
  block[3] = &unk_1E0F54378;
  block[1] = 3221225472;
  v8 = *(_QWORD *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_464(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 observeChangeWithSubitemURL:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[7];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ observe change", buf, 0xCu);
  }
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Subitem Did Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E0F51588;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Did Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E0F4C650;
    v12[4] = v11;
    v12[5] = a3;
    v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willEnd");
  objc_msgSend(*(id *)(a1 + 40), "presentedSubitemDidChangeAtURL:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willEnd");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenter:(id)a3 observeMoveToURL:(id)a4 withSubitemURL:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD v15[7];
  _QWORD v16[6];
  _QWORD v17[8];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v9 = _NSFCPresenterLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v19 = v8;
    v20 = 2113;
    v21 = a4;
    _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ observe move to URL: %{private}@", buf, 0x16u);
  }
  if (a5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Subitem Did Move"));
      v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke;
      v17[3] = &unk_1E0F54200;
      v17[4] = v10;
      v17[5] = a3;
      v17[6] = a5;
      v17[7] = a4;
      v12 = v17;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Did Change"));
      v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2;
      v16[3] = &unk_1E0F4C650;
      v16[4] = v14;
      v16[5] = a3;
      v12 = v16;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Did Move"));
    v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3;
    v15[3] = &unk_1E0F51588;
    v15[4] = v13;
    v15[5] = a3;
    v15[6] = a4;
    v12 = v15;
  }
  objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v8, v12);
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedSubitemAtURL:didMoveToURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidMoveToURL:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenterObserveDisconnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe disconnection", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Disconnection"));
    v7 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke;
    v8[3] = &unk_1E0F4C650;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }
}

uint64_t __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidDisconnect");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenterObserveReconnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe reconnection", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Reconnection"));
    v7 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke;
    v8[3] = &unk_1E0F4C650;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }
}

uint64_t __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidReconnect");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenter:(id)a3 observeUbiquityChangeWithSubitemURL:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[7];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe ubiquity change", buf, 0xCu);
  }
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Subitem Ubiquity Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E0F51588;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Ubiquity Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E0F4C650;
    v12[4] = v11;
    v12[5] = a3;
    v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedSubitemUbiquityDidChangeAtURL:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemUbiquityDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenter:(id)a3 observeSharingChangeWithSubitemURL:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[7];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe sharing change", buf, 0xCu);
  }
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Subitem Sharing Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E0F51588;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Sharing Change"));
    v9 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E0F4C650;
    v12[4] = v11;
    v12[5] = a3;
    v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedSubitemSharingDidChangeAtURL:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemSharingDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenter:(id)a3 observeChangeOfUbiquityAttributes:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[7];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v8 = _NSFCPresenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = a4;
    _os_log_impl(&dword_1817D9000, v8, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe ubiquity attributes change: %{public}@", buf, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Observe Ubiquity Attributes Change"));
    v10 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__NSFilePresenterXPCMessenger__makePresenter_observeChangeOfUbiquityAttributes___block_invoke;
    v11[3] = &unk_1E0F51588;
    v11[4] = v9;
    v11[5] = a3;
    v11[6] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeUbiquityChangeWithSubitemURL:](self, "_makePresenter:observeUbiquityChangeWithSubitemURL:", a3, 0);
  }
}

uint64_t __80__NSFilePresenterXPCMessenger__makePresenter_observeChangeOfUbiquityAttributes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "presentedItemURL"), "removeAllCachedResourceValues");
  objc_msgSend(*(id *)(a1 + 40), "presentedItemDidChangeUbiquityAttributes:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "didEnd");
}

- (void)_makePresenter:(id)a3 observeVersionChangeOfKind:(id)a4 withClientID:(id)a5 name:(id)a6 subitemURL:(id)a7
{
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v17[6];
  _QWORD v18[7];
  _QWORD v19[6];
  _QWORD v20[7];
  _QWORD v21[6];
  _QWORD v22[7];
  _QWORD v23[8];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke;
  v23[3] = &unk_1E0F54440;
  v23[4] = a7;
  v23[5] = a3;
  v23[6] = a5;
  v23[7] = a6;
  v13 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v14 = _NSFCPresenterLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe version change", buf, 0xCu);
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("added")))
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_515;
      v22[3] = &unk_1E0F4DF70;
      v22[5] = a7;
      v22[6] = v23;
      v22[4] = a3;
      v16 = v22;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2;
      v21[3] = &unk_1E0F4E060;
      v21[4] = a3;
      v21[5] = v23;
      v16 = v21;
    }
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("removed")))
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3;
      v20[3] = &unk_1E0F4DF70;
      v20[5] = a7;
      v20[6] = v23;
      v20[4] = a3;
      v16 = v20;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4;
      v19[3] = &unk_1E0F4E060;
      v19[4] = a3;
      v19[5] = v23;
      v16 = v19;
    }
  }
  else
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("resolved")))
      return;
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5;
      v18[3] = &unk_1E0F4DF70;
      v18[5] = a7;
      v18[6] = v23;
      v18[4] = a3;
      v16 = v18;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return;
      v15 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6;
      v17[3] = &unk_1E0F4E060;
      v17[4] = a3;
      v17[5] = v23;
      v16 = v17;
    }
  }
  objc_msgSend(v15, "_fc_addUncancellableOperationForReactorID:block:", v13, v16);
}

id __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke(uint64_t a1)
{
  id v2;
  id result;
  uint64_t v4;

  v2 = *(id *)(a1 + 32);
  if (v2 || (result = (id)objc_msgSend(*(id *)(a1 + 40), "presentedItemURL"), (v2 = result) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 40), "_presentedItemTemporaryVersionStorageIdentifier");
    else
      v4 = 0;
    return +[NSFileVersion _versionOfItemAtURL:forClientID:name:temporaryStorageIdentifier:evenIfDeleted:](NSFileVersion, "_versionOfItemAtURL:forClientID:name:temporaryStorageIdentifier:evenIfDeleted:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, 1);
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_515(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedSubitemAtURL:didGainVersion:", *(_QWORD *)(a1 + 40), result);
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedItemDidGainVersion:", result);
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedSubitemAtURL:didLoseVersion:", *(_QWORD *)(a1 + 40), result);
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedItemDidLoseVersion:", result);
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedSubitemAtURL:didResolveConflictVersion:", *(_QWORD *)(a1 + 40), result);
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "presentedItemDidResolveConflictVersion:", result);
  return result;
}

- (void)_makePresenter:(id)a3 setLastPresentedItemEventIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
  v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ setLastPresentedItemIdentifier: %llu", buf, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke;
    v9[3] = &unk_1E0F4EE20;
    v9[4] = a3;
    v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLastPresentedItemEventIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_makePresenter:(id)a3 setProviderPurposeIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
  v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = a4;
    _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ setProviderPurposeIdentifier: %{public}@", buf, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke;
    v9[3] = &unk_1E0F4C650;
    v9[4] = a3;
    v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }
}

uint64_t __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProviderPurposeIdentifier:", *(_QWORD *)(a1 + 40));
}

- (id)_readRelinquishment
{
  NSFilePresenterRelinquishment *AssociatedObject;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject(self->_filePresenter, "NSFilePresenterReadRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(NSFilePresenterRelinquishment);
    objc_setAssociatedObject(self->_filePresenter, "NSFilePresenterReadRelinquishment", AssociatedObject, (void *)0x301);

  }
  return AssociatedObject;
}

- (id)_writeRelinquishment
{
  NSFilePresenterRelinquishment *AssociatedObject;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject(self->_filePresenter, "NSFilePresenterWriteRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(NSFilePresenterRelinquishment);
    objc_setAssociatedObject(self->_filePresenter, "NSFilePresenterWriteRelinquishment", AssociatedObject, (void *)0x301);

  }
  return AssociatedObject;
}

- (void)_makePresenter:(id)a3 relinquishToAccessClaimWithID:(id)a4 purposeID:(id)a5 ifNecessaryUsingSelector:(SEL)a6 recordingRelinquishment:(id)a7 continuer:(id)a8
{
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke;
    v15[3] = &unk_1E0F54508;
    v15[4] = self;
    v15[5] = a3;
    v15[6] = a4;
    v15[7] = a5;
    v15[8] = a7;
    v15[9] = a6;
    objc_msgSend(a7, "performRelinquishmentToAccessClaimIfNecessary:usingBlock:withReply:", a4, v15, a8);
  }
  else
  {
    (*((void (**)(id))a8 + 2))(a8);
  }
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *Name;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[13];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", *(_QWORD *)(a1 + 40));
  v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 48);
    Name = sel_getName(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138543874;
    v17 = v4;
    v18 = 2114;
    v19 = v6;
    v20 = 2082;
    v21 = Name;
    _os_log_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEFAULT, "Asking presenter %{public}@ to relinquish to claim %{public}@ via %{public}s", buf, 0x20u);
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "presentedItemOperationQueue");
  v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", *(_QWORD *)(a1 + 40), CFSTR("Relinquish"));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_535;
  v15[3] = &unk_1E0F544E0;
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v15[4] = v9;
  v15[5] = v10;
  v12 = *(_QWORD *)(a1 + 72);
  v15[11] = a2;
  v15[12] = v12;
  v13 = *(_QWORD *)(a1 + 32);
  v15[6] = *(_QWORD *)(a1 + 40);
  v15[7] = v4;
  v15[8] = v13;
  v15[9] = v11;
  v15[10] = v8;
  return objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v4, v15);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_535(uint64_t a1)
{
  __int128 v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[6];
  __int128 v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:](NSFileCoordinator, "_setCurrentClaimPurposeIdentifier:", *(_QWORD *)(a1 + 40));
  v7[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  v3 = *(const char **)(a1 + 96);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2;
  v7[3] = &unk_1E0F544B8;
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 56);
  v7[5] = v5;
  v9 = v4;
  v10 = v2;
  objc_msgSend(v4, v3, v7);
  return +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:](NSFileCoordinator, "_setCurrentClaimPurposeIdentifier:", 0);
}

void __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ relinquished", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "willEnd");
  v9[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_536;
  v9[3] = &unk_1E0F54490;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = a2;
  v15 = *(_QWORD *)(a1 + 80);
  dispatch_async(v7, v9);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_536(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_537;
    v6[3] = &unk_1E0F52CD8;
    v4 = *(_OWORD *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 40);
    v8 = v4;
    v9 = v2;
    objc_msgSend(v3, "setReacquirer:", v6);
  }
  objc_msgSend(*(id *)(a1 + 72), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_537(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEFAULT, "Telling presenter %{public}@ to reacquire", buf, 0xCu);
  }
  v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a1[6], CFSTR("Reacquire"));
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_540;
  v14 = &unk_1E0F54468;
  v8 = a1[4];
  v7 = a1[5];
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v18 = a2;
  v9 = (void *)a1[7];
  v19 = a1[8];
  return objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:");
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_540(uint64_t a1)
{
  uint64_t TSD;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didBegin");
  TSD = NSFileCoordinatorGetTSD();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_542;
  v5[3] = &unk_1E0F53270;
  v3 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v5[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(TSD + 16) = +[NSFileCoordinatorReacquisitionBlockCompletion completionWithBlock:queue:](NSFileCoordinatorReacquisitionBlockCompletion, "completionWithBlock:queue:", v5, *(_QWORD *)(v3 + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "willEnd");
  result = objc_msgSend(*(id *)(TSD + 16), "decrement");
  *(_QWORD *)(TSD + 16) = 0;
  return result;
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_542(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ reacquired", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 relinquishToReadingClaimWithID:(id)a4 purposeID:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  int v8;
  uint64_t (*v13)(uint64_t);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];

  v8 = a6;
  v17[5] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke;
  v17[3] = &unk_1E0F4E870;
  v17[4] = a7;
  if ((v8 & 1) != 0)
  {
    v14 = v17;
  }
  else
  {
    if ((v8 & 0x10000) != 0)
    {
      v16 = MEMORY[0x1E0C809B0];
      v13 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2;
      v14 = &v16;
    }
    else
    {
      v15 = MEMORY[0x1E0C809B0];
      v13 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4;
      v14 = &v15;
    }
    v14[1] = 3221225472;
    v14[2] = (uint64_t)v13;
    v14[3] = (uint64_t)&unk_1E0F53270;
    v14[4] = (uint64_t)self;
    v14[5] = (uint64_t)a3;
    v14[6] = (uint64_t)a7;
  }
  -[NSFilePresenterXPCMessenger _makePresenter:relinquishToAccessClaimWithID:purposeID:ifNecessaryUsingSelector:recordingRelinquishment:continuer:](self, "_makePresenter:relinquishToAccessClaimWithID:purposeID:ifNecessaryUsingSelector:recordingRelinquishment:continuer:", a3, a4, a5, sel_relinquishPresentedItemToReader_, -[NSFilePresenterXPCMessenger _readRelinquishment](self, "_readRelinquishment", v15), v14);
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3;
  v3[3] = &unk_1E0F54530;
  v3[4] = v1;
  return objc_msgSend(v1, "_makePresenter:reportUnsavedChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40), v3);
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  NSError *v5;
  uint64_t (*v6)(uint64_t, NSError *);
  uint64_t v7;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:saveChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3072, 0);
    v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
    v7 = v4;
  }
  else
  {
    v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
    v7 = v4;
    v5 = 0;
  }
  return v6(v7, v5);
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:saveChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_makePresenter:(id)a3 relinquishToWritingClaimWithID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v15;
  _QWORD *v16;
  id v17;
  NSFilePresenter *filePresenter;
  _QWORD v19[7];
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t);
  void *v22;
  NSFilePresenterXPCMessenger *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[8];
  _QWORD v30[8];
  _QWORD v31[9];
  _QWORD v32[3];
  char v33;
  _QWORD v34[7];
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
  v35[3] = &unk_1E0F4E870;
  v35[4] = a8;
  if ((a5 & 4) != 0)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
    v34[3] = &unk_1E0F53270;
    v34[4] = self;
    v34[5] = a3;
    v34[6] = a8;
    v16 = (id)objc_msgSend(v34, "copy");
  }
  else
  {
    v16 = v35;
  }
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  if ((a5 & 9) != 0)
  {
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
    v31[3] = &unk_1E0F54558;
    v31[7] = a8;
    v31[8] = v32;
    v31[4] = self;
    v31[5] = a3;
    v31[6] = a7;
    v16 = (id)objc_msgSend(v31, "copy");
  }
  if ((a5 & 0x100000) != 0)
  {
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4;
    v30[3] = &unk_1E0F509A0;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = a7;
    v30[7] = a8;
    v16 = (id)objc_msgSend(v30, "copy");
  }
  if ((a5 & 0x10000) != 0)
  {
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5;
    v29[3] = &unk_1E0F545A8;
    v29[4] = self;
    v29[5] = a3;
    v29[6] = a8;
    v29[7] = a5;
    v16 = (id)objc_msgSend(v29, "copy");
  }
  v17 = -[NSFilePresenterXPCMessenger _writeRelinquishment](self, "_writeRelinquishment");
  v20[0] = v15;
  v20[1] = 3221225472;
  v21 = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7;
  v22 = &unk_1E0F533F8;
  v23 = self;
  v24 = a3;
  v25 = a4;
  v26 = a6;
  v27 = v17;
  v28 = v16;
  if ((a5 & 1) != 0)
  {
    if ((objc_msgSend(a6, "isEqualToString:", CFSTR("com.apple.icloud.drive")) & 1) != 0
      || (objc_msgSend(a6, "isEqualToString:", CFSTR("com.apple.bird")) & 1) != 0)
    {
      filePresenter = self->_filePresenter;
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8;
      v19[3] = &unk_1E0F545D0;
      v19[6] = v32;
      v19[4] = self;
      v19[5] = v20;
      -[NSFilePresenterXPCMessenger _makePresenter:validateRemoteDeletionRecordingRelinquishment:completionHandler:](self, "_makePresenter:validateRemoteDeletionRecordingRelinquishment:completionHandler:", filePresenter, v17, v19);
    }
    else
    {
      v21((uint64_t)v20);
    }
  }
  else
  {
    __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7((uint64_t)v20);
  }
  _Block_object_dispose(v32, 8);
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:saveChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:accommodateDeletionWithSubitemURL:completionHandler:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "URL"), *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:accommodateEvictionWithSubitemURL:completionHandler:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "URL"), *(_QWORD *)(a1 + 56));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    return objc_msgSend(v2, "_makePresenter:accommodateDisconnectionWithCompletionHandler:", v3, *(_QWORD *)(a1 + 48));
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6;
  v8 = &unk_1E0F54580;
  return objc_msgSend(v2, "_makePresenter:saveChangesWithCompletionHandler:", MEMORY[0x1E0C809B0], 3221225472, __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6, &unk_1E0F54580, v2, v3, *(_QWORD *)(a1 + 48));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:accommodateDisconnectionWithCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend(*(id *)(a1 + 32), "_makePresenter:relinquishToAccessClaimWithID:purposeID:ifNecessaryUsingSelector:recordingRelinquishment:continuer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), sel_relinquishPresentedItemToWriter_, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), *(dispatch_block_t *)(a1 + 40));
}

- (void)_makePresenter:(id)a3 validateRelinquishmentToSubitemAtURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _QWORD v12[11];

  v12[10] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a3);
    v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:](NSFileAccessArbiterProxy, "_willBeginOperationForReactor:withDescription:", a3, CFSTR("Validate Subitem Relinquishment"));
    v11 = (void *)objc_msgSend(a3, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke;
    v12[3] = &unk_1E0F533F8;
    v12[4] = v9;
    v12[5] = a4;
    v12[6] = v10;
    v12[7] = a3;
    v12[8] = self;
    v12[9] = a5;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

void __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[6];
  char v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    v14 = v3;
    v15 = 2113;
    v16 = v4;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ validate subitem relinquishment for URL: %{private}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "didBegin");
  v5 = objc_msgSend(*(id *)(a1 + 56), "shouldRelinquishToWriterOfSubitemAtURL:", *(_QWORD *)(a1 + 40));
  v6 = _NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    v8 = *(_QWORD *)(a1 + 32);
    if (v5)
      v7 = "YES";
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2080;
    v16 = v7;
    _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ finished validate subitem relinquishment with reply: %s", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "willEnd");
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 64) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_557;
  block[3] = &unk_1E0F543C8;
  block[1] = 3221225472;
  block[4] = *(_QWORD *)(a1 + 48);
  block[5] = v9;
  v12 = v5;
  dispatch_async(v10, block);
}

uint64_t __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_557(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didEnd");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
