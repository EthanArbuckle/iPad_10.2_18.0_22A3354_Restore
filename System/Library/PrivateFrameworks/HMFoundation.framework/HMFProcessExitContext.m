@implementation HMFProcessExitContext

+ (id)lastExitContext
{
  void *v2;
  void *v3;
  HMFProcessExitContext *v4;
  void *v5;
  void *v6;
  void *v7;
  HMFProcessExitContext *v8;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastExitContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [HMFProcessExitContext alloc];
  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFProcessExitContext initWithRBSProcessExitContext:processName:userDefaultsStore:resetStoreReadToken:](v4, "initWithRBSProcessExitContext:processName:userDefaultsStore:resetStoreReadToken:", v3, v6, v7, 0);

  return v8;
}

+ (BOOL)onceCompareAndSetTimestamp:(id)a3 toStoredValueWithKey:(id)a4 inStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__HMFProcessExitContext_onceCompareAndSetTimestamp_toStoredValueWithKey_inStore___block_invoke;
  block[3] = &unk_1E3B38480;
  v21 = v9;
  v22 = v8;
  v23 = v7;
  v10 = qword_1ED013158;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v13;
  if (v10 == -1)
  {
    v15 = v13;
    v16 = v12;
    v17 = v11;
  }
  else
  {
    dispatch_once(&qword_1ED013158, block);
    v16 = v22;
    v17 = v23;
    v15 = v21;
  }
  v18 = _MergedGlobals_61;

  return v18;
}

void __81__HMFProcessExitContext_onceCompareAndSetTimestamp_toStoredValueWithKey_inStore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(v2, "isEqualToDate:", *(_QWORD *)(a1 + 48)))
    _MergedGlobals_61 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (HMFProcessExitContext)initWithRBSProcessExitContext:(id)a3 processName:(id)a4 userDefaultsStore:(id)a5 resetStoreReadToken:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  HMFProcessExitContext *v18;
  HMFProcessExitContext *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;

  if (a3)
  {
    v8 = a3;
    v25 = a6;
    v9 = a5;
    v10 = v8;
    objc_msgSend(CFSTR("HMFProcessExitContextLast_"), "stringByAppendingString:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "status");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v26, "domain");
    objc_msgSend(v10, "status");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "code");
    objc_msgSend(v10, "status");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v13, "isCrash");
    objc_msgSend(v10, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isJetsam");
    objc_msgSend(v10, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v21) = v15;
    LOBYTE(v21) = (_BYTE)v8;
    v18 = -[HMFProcessExitContext initWithUserDefaultsStore:processLastRecordedExitTimeKey:resetStoreReadToken:timestamp:osReasonDomain:osReasonCode:isCrash:isJetsam:errorRepresentation:](self, "initWithUserDefaultsStore:processLastRecordedExitTimeKey:resetStoreReadToken:timestamp:osReasonDomain:osReasonCode:isCrash:isJetsam:errorRepresentation:", v9, v24, v25, v23, v22, v12, v21, v17);

    self = v18;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (HMFProcessExitContext)initWithUserDefaultsStore:(id)a3 processLastRecordedExitTimeKey:(id)a4 resetStoreReadToken:(BOOL)a5 timestamp:(id)a6 osReasonDomain:(int64_t)a7 osReasonCode:(unint64_t)a8 isCrash:(BOOL)a9 isJetsam:(BOOL)a10 errorRepresentation:(id)a11
{
  _BOOL4 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  HMFProcessExitContext *v21;
  objc_super v23;

  v14 = a5;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a11;
  v23.receiver = self;
  v23.super_class = (Class)HMFProcessExitContext;
  v21 = -[HMFProcessExitContext init](&v23, sel_init);
  if (v21)
  {
    if (v14)
      qword_1ED013158 = 0;
    if (v18)
      v21->_isStale = objc_msgSend((id)objc_opt_class(), "onceCompareAndSetTimestamp:toStoredValueWithKey:inStore:", v19, v18, v17);
    objc_storeStrong((id *)&v21->_timestamp, a6);
    v21->_isCrash = a9;
    v21->_OSReasonDomain = a7;
    v21->_OSReasonCode = a8;
    if (a9)
      v21->_crashReasonCode = objc_msgSend(v20, "code");
    v21->_isJetsam = a10;
    if (a10)
      v21->_jetsamReasonCode = objc_msgSend(v20, "code");
    objc_storeStrong((id *)&v21->_errorRepresentation, a11);
  }

  return v21;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (BOOL)isCrash
{
  return self->_isCrash;
}

- (int64_t)crashReasonCode
{
  return self->_crashReasonCode;
}

- (BOOL)isJetsam
{
  return self->_isJetsam;
}

- (int64_t)jetsamReasonCode
{
  return self->_jetsamReasonCode;
}

- (NSError)errorRepresentation
{
  return self->_errorRepresentation;
}

- (int64_t)OSReasonDomain
{
  return self->_OSReasonDomain;
}

- (unint64_t)OSReasonCode
{
  return self->_OSReasonCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorRepresentation, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
