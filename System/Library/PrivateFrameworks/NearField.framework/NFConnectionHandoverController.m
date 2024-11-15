@implementation NFConnectionHandoverController

- (id)initWithType:(char)a3 initiator:(void *)a4 callbackQueue:
{
  id v8;
  id *v9;
  objc_super v11;

  v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)NFConnectionHandoverController;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[2] = a2;
      *((_DWORD *)v9 + 3) = 0;
      objc_storeStrong(v9 + 4, a4);
      a1[3] = 0;
      *((_BYTE *)a1 + 9) = 1;
      *((_BYTE *)a1 + 8) = a3;
    }
  }

  return a1;
}

- (void)executeWithLock:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v3;
  void (**v4)(void);

  v4 = a2;
  if (a1)
  {
    v3 = a1 + 3;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }

}

- (os_unfair_lock_s)executeWithLockAndReturn:(os_unfair_lock_s *)a1
{
  void (**v3)(_QWORD);
  os_unfair_lock_s *v4;

  v3 = a2;
  if (a1)
  {
    v4 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    v3[2](v3);
    a1 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
  }

  return a1;
}

- (void)start
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFConnectionHandoverController.m"), 503, CFSTR("Requires override"));

}

- (void)startWithCustomBroadcastData:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFConnectionHandoverController.m"), 509, CFSTR("Requires override"));

}

- (void)stop
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFConnectionHandoverController.m"), 515, CFSTR("Requires override"));

}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
