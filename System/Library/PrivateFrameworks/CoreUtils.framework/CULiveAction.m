@implementation CULiveAction

- (CULiveAction)init
{
  CULiveAction *v2;
  CULiveAction *v3;
  CULiveAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CULiveAction;
  v2 = -[CULiveAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (CULiveAction)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CULiveAction *v12;
  CULiveAction *v13;
  void *v15;
  const char *v16;
  uint64_t v17;

  v6 = a3;
  v12 = -[CULiveAction init](self, "init");
  if (!v12)
  {
    if (a4)
    {
      v15 = (void *)*MEMORY[0x1E0CB2F90];
      v16 = "init failed";
LABEL_9:
      NSErrorF_safe(v15, 4294960540, (uint64_t)v16, v7, v8, v9, v10, v11, v17);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_4;
  }
  if (MEMORY[0x18D78F504](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      v15 = (void *)*MEMORY[0x1E0CB2F90];
      v16 = "XPC non-dict";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v13 = v12;
LABEL_4:

  return v13;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CULiveAction_activateWithCompletion___block_invoke;
  block[3] = &unk_1E25DF300;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, block);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CULiveAction_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int)a3
{
  self->_alertType = a3;
}

- (NSArray)destinationIDs
{
  return self->_destinationIDs;
}

- (void)setDestinationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (NSString)originatingHomeKitAccessoryID
{
  return self->_originatingHomeKitAccessoryID;
}

- (void)setOriginatingHomeKitAccessoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (void)setSoundFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)speakText
{
  return self->_speakText;
}

- (void)setSpeakText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakText, 0);
  objc_storeStrong((id *)&self->_soundFileURL, 0);
  objc_storeStrong((id *)&self->_originatingHomeKitAccessoryID, 0);
  objc_storeStrong((id *)&self->_destinationIDs, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __26__CULiveAction_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;

  v11 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v8 = v11;
  if (v11)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    v8 = v11;
  }
  if (gLogCategory_CULiveAction <= 30)
  {
    if (gLogCategory_CULiveAction != -1
      || (v9 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x1Eu), v8 = v11, v9))
    {
      LogPrintF((uint64_t)&gLogCategory_CULiveAction, (uint64_t)"-[CULiveAction invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidated", v4, v5, v6, v7, v10);
      v8 = v11;
    }
  }

}

void __39__CULiveAction_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;

  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960561, (uint64_t)"Not supported, use HomeKit instead", a4, a5, a6, a7, a8, v15);
  v9 = objc_claimAutoreleasedReturnValue();
  v16 = (id)v9;
  if (gLogCategory_CULiveAction <= 90)
  {
    if (gLogCategory_CULiveAction != -1
      || (v14 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x5Au), v9 = (uint64_t)v16, v14))
    {
      LogPrintF((uint64_t)&gLogCategory_CULiveAction, (uint64_t)"-[CULiveAction activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", v10, v11, v12, v13, v9);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
