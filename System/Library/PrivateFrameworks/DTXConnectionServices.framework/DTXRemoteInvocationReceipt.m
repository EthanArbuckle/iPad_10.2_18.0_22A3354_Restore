@implementation DTXRemoteInvocationReceipt

- (DTXRemoteInvocationReceipt)init
{
  DTXRemoteInvocationReceipt *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTXRemoteInvocationReceipt;
  result = -[DTXRemoteInvocationReceipt init](&v3, sel_init);
  if (result)
    result->_guard._os_unfair_lock_opaque = 0;
  return result;
}

- (void)_checkedAssign:(id)a3
{
  id returnValue;
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id v9;
  id completionHandler;
  char v11;
  void *v12;
  void (**v13)(_QWORD);
  id waiterChain;
  void (**v15)(void);

  v15 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_guard);
  v15[2]();
  if (self->_completionHandler && (*((_BYTE *)self + 36) & 3) != 0)
  {
    if ((*((_BYTE *)self + 36) & 3) == 1)
      returnValue = self->_returnValue;
    else
      returnValue = 0;
    v6 = returnValue;
    if ((*((_BYTE *)self + 36) & 3) == 2)
      v8 = self->_returnValue;
    else
      v8 = 0;
    v5 = v8;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22079E258](self->_completionHandler);
    v9 = self->_returnValue;
    self->_returnValue = 0;

    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    if (v7)
      v11 = 4;
    else
      v11 = 8;
    *((_BYTE *)self + 36) = *((_BYTE *)self + 36) & 0xF3 | v11;
    os_unfair_lock_unlock(&self->_guard);
    if (v7)
    {
      v12 = (void *)MEMORY[0x22079E084]();
      ((void (**)(_QWORD, id, id))v7)[2](v7, v6, v5);
      objc_autoreleasePoolPop(v12);
      os_unfair_lock_lock(&self->_guard);
      *((_BYTE *)self + 36) = *((_BYTE *)self + 36) & 0xF3 | 8;
      v13 = (void (**)(_QWORD))MEMORY[0x22079E258](self->_waiterChain);
      waiterChain = self->_waiterChain;
      self->_waiterChain = 0;

      os_unfair_lock_unlock(&self->_guard);
      if (v13)
        v13[2](v13);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_guard);
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }

}

- (void)handleCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21DC87404;
  v7[3] = &unk_24E1AA9B0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend__checkedAssign_(self, v6, (uint64_t)v7);

}

- (void)invokeCompletionWithReturnValue:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21DC874F8;
  v11[3] = &unk_24E1AA9D8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend__checkedAssign_(self, v10, (uint64_t)v11);

}

- (void)waitForFulfillment
{
  NSObject *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = sub_21DC8762C;
  v8 = sub_21DC8763C;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21DC87644;
  v3[3] = &unk_24E1AAA28;
  v3[4] = self;
  v3[5] = &v4;
  objc_msgSend__checkedAssign_(self, a2, (uint64_t)v3);
  v2 = v5[5];
  if (v2)
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v4, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waiterChain, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_returnValue, 0);
}

@end
