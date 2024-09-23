@implementation BLSAssertionAcquisitionObserver

+ (BLSAssertionAcquisitionObserver)observerWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[BLSAssertionAcquisitionObserver initWithCompletion:](objc_alloc((Class)a1), v4);

  return (BLSAssertionAcquisitionObserver *)v5;
}

- (_QWORD)initWithCompletion:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BLSAssertionAcquisitionObserver;
    v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = 0;
      v5 = MEMORY[0x1B5E0F100](v3);
      v6 = (void *)a1[2];
      a1[2] = v5;

    }
  }

  return a1;
}

- (void)assertionWasAcquired:(id)a3
{
  -[BLSAssertionAcquisitionObserver completeForAssertion:success:error:]((uint64_t)self, a3, 1, 0);
}

- (void)completeForAssertion:(uint64_t)a3 success:(void *)a4 error:
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(v7, "removeObserver:", a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0F100](*(_QWORD *)(a1 + 16));
    v10 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    bls_assertions_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "explanation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bls_loggingString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134219010;
      v15 = a1;
      v16 = 2048;
      v17 = v7;
      v18 = 2114;
      v19 = v12;
      v20 = 1024;
      v21 = a3;
      v22 = 2114;
      v23 = v13;
      _os_log_debug_impl(&dword_1B0C75000, v11, OS_LOG_TYPE_DEBUG, "%p completed acquisition for assertion:%p:%{public}@ with success:%{BOOL}u error:%{public}@", (uint8_t *)&v14, 0x30u);

    }
    ((void (**)(_QWORD, uint64_t, id))v9)[2](v9, a3, v8);

  }
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  -[BLSAssertionAcquisitionObserver completeForAssertion:success:error:]((uint64_t)self, a3, 0, a4);
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  -[BLSAssertionAcquisitionObserver completeForAssertion:success:error:]((uint64_t)self, a3, 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
}

@end
