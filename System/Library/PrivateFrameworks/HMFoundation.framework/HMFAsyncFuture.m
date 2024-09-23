@implementation HMFAsyncFuture

- (uint64_t)initWithPromise:(uint64_t)a1
{
  HMFPromise *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v4 = [HMFPromise alloc];
    *(_DWORD *)(a1 + 12) = 0;
    *(_QWORD *)(a1 + 16) = v4;
    objc_storeWeak((id *)&v4->_future, (id)a1);
    v5 = *a2;
    *a2 = v4;

    v6 = (id)a1;
  }

  return a1;
}

- (BOOL)_resolveWithState:(void *)a3 value:
{
  id v6;
  int v7;
  _BOOL8 v8;

  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v7 = *(_DWORD *)(a1 + 12);
    v8 = v7 == 0;
    if (!v7)
    {
      *(_DWORD *)(a1 + 12) = a2;
      *(_QWORD *)(a1 + 16) = 0;
      objc_storeStrong((id *)(a1 + 24), a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPending
{
  os_unfair_lock_s *p_lock;
  uint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if ((unint64_t)(state - 1) < 2)
    return 0;
  if (state)
  {
    if (state == 3)
      return objc_msgSend(self->_value, "isPending");
    return 0;
  }
  return 1;
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  os_unfair_lock_s *p_lock;
  uint64_t state;
  id v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _HMFFutureBlockOutcome result;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  switch(state)
  {
    case 3:
      v6 = objc_msgSend(self->_value, "outcomeIfSettled");
      v5 = v7;
      break;
    case 2:
      v8 = self->_value;
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

      v6 = 2;
      break;
    case 1:
      v5 = self->_value;
      v6 = 1;
      break;
    default:
      v6 = 0;
      v5 = 0;
      break;
  }
  v11 = v5;
  result.var1 = v11;
  result.var0 = v6;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
  -[HMFAsyncFuture _callOrAddCompletionBlock:]((uint64_t)self, a3);
}

- (uint64_t)_callOrAddCompletionBlock:(uint64_t)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v4 = *(int *)(a1 + 12);
    if (!(_DWORD)v4)
    {
      -[HMFPromise _addCompletion:](*(_QWORD *)(a1 + 16), v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
LABEL_10:
      a1 = 1;
      goto LABEL_11;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4 != 3)
    {
      if (v4 == 2)
      {
        (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, *(_QWORD *)(a1 + 24));
      }
      else
      {
        if (v4 != 1)
        {
          a1 = 0;
          goto LABEL_11;
        }
        (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 24), 0);
      }
      goto LABEL_10;
    }
    a1 = -[HMFAsyncFuture _callOrAddCompletionBlock:](*(_QWORD *)(a1 + 24), v3);
  }
LABEL_11:

  return a1;
}

- (id)then:(id)a3
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, a3, 0);
}

- (HMFAsyncFuture)_inContext:(void *)a3 then:(void *)a4 orRecover:
{
  id v7;
  id v8;
  id v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  HMFAsyncFuture *v16;
  void *v17;
  HMFAsyncFuture *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_25;
  v10 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  v11 = *(int *)(a1 + 12);
  if ((_DWORD)v11)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    switch(v11)
    {
      case 3:
        -[HMFAsyncFuture _inContext:then:orRecover:](*(_QWORD *)(a1 + 24), v7, v8, v9);
        v16 = (HMFAsyncFuture *)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v18 = v16;
        goto LABEL_26;
      case 2:
        if (v9)
        {
          if (v7)
          {
            v12 = *(void **)(a1 + 24);
            v13 = v7;
            v14 = v9;
            goto LABEL_15;
          }
          v23 = (*((uint64_t (**)(id, _QWORD))v9 + 2))(v9, *(_QWORD *)(a1 + 24));
          goto LABEL_21;
        }
        break;
      case 1:
        if (v8)
        {
          if (v7)
          {
            v12 = *(void **)(a1 + 24);
            v13 = v7;
            v14 = v8;
LABEL_15:
            +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, v13, v12, v14);
            v16 = (HMFAsyncFuture *)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
          v23 = (*((uint64_t (**)(id, _QWORD))v8 + 2))(v8, *(_QWORD *)(a1 + 24));
LABEL_21:
          if (HMFFuture)
          {
            +[HMFFuture _futureWithOutcome:]((uint64_t)HMFFuture, v23, v24);
            v16 = (HMFAsyncFuture *)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }

LABEL_25:
          v18 = 0;
          goto LABEL_26;
        }
        break;
      default:
        goto LABEL_25;
    }
    v16 = (HMFAsyncFuture *)(id)a1;
    goto LABEL_23;
  }
  if (v7)
  {
    v15 = v7;
  }
  else
  {
    HMFRequireCurrentAsyncContext();
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v15;
  v31 = 0;
  v18 = [HMFAsyncFuture alloc];
  -[HMFAsyncFuture initWithPromise:]((uint64_t)v18, &v31);
  v19 = *(_QWORD *)(a1 + 16);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke;
  v26[3] = &unk_1E3B37D88;
  v28 = v17;
  v29 = v8;
  v20 = v31;
  v27 = v31;
  v30 = v9;
  v21 = v17;
  v22 = v20;
  -[HMFPromise _addCompletion:](v19, v26);

  os_unfair_lock_unlock(v10);
LABEL_26:

  return v18;
}

- (id)inContext:(id)a3 then:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, a4, 0);
}

- (id)recover:(id)a3
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, 0, a3);
}

- (id)inContext:(id)a3 recover:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, 0, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, 0, a3, a4);
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  return -[HMFAsyncFuture _inContext:then:orRecover:]((uint64_t)self, a3, a4, a5);
}

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", v6);
      goto LABEL_9;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_3;
    v10[3] = &unk_1E3B37D60;
    v7 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v12 = v6;
    objc_msgSend(v7, "performBlock:", v10);

    v8 = v11;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", v5);
      goto LABEL_9;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_2;
    v14[3] = &unk_1E3B37D60;
    v9 = *(void **)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    v16 = v5;
    objc_msgSend(v9, "performBlock:", v14);

    v8 = v15;
  }

LABEL_9:
}

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1[4];
  v2 = (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5]);
  if (v1)
    -[HMFPromise resolveWithOutcome:](v1, v2, v3);
  else

}

void __44__HMFAsyncFuture__inContext_then_orRecover___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1[4];
  v2 = (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5]);
  if (v1)
    -[HMFPromise resolveWithOutcome:](v1, v2, v3);
  else

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
