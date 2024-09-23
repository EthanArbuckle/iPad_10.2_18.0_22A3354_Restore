@implementation MKTileOverlayRequesterOp

- (MKTileOverlayRequesterOp)init
{
  MKTileOverlayRequesterOp *v2;
  id v3;
  uint64_t v4;
  OS_dispatch_queue *workQueue;
  MKTileOverlayRequesterOp *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKTileOverlayRequesterOp;
  v2 = -[MKTileOverlayRequesterOp init](&v8, sel_init);
  if (v2)
  {
    if (qword_1EDFB7CF0 != -1)
      dispatch_once(&qword_1EDFB7CF0, &__block_literal_global_81_1);
    v3 = (id)qword_1EDFB7CE8;
    v4 = geo_dispatch_queue_create_with_target();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MKTileOverlayRequesterOp_start__block_invoke;
  block[3] = &unk_1E20DA4A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __33__MKTileOverlayRequesterOp_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  char isKindOfClass;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  double v18;
  id v19;
  int v20;
  int v21;
  NSObject *delegateQueue;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];
  _QWORD block[5];

  v3 = (*(unsigned int *)&self->_anon_c[5] | ((unint64_t)(*(unsigned __int16 *)&self->_anon_c[9] | (self->_anon_c[11] << 16)) << 32)) >> 2;
  if (qword_1EDFB7CD0 != -1)
    dispatch_once(&qword_1EDFB7CD0, &__block_literal_global_79_0);
  RequesterRegistry::lookup((RequesterRegistry *)qword_1EDFB7CC8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isGeometryFlipped");
    v7 = *(_DWORD *)&self->_anon_c[5];
    v8 = *(_QWORD *)&self->_key.var0;
    v9 = (HIDWORD(v8) & 0x3FFFFFF) + (-1 << v8);
    if (v9 + 1 >= 0)
      v10 = (v9 + 1);
    else
      v10 = ~v9;
    if (v6)
      v11 = v10;
    else
      v11 = HIDWORD(v8) & 0x3FFFFFF;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __34__MKTileOverlayRequesterOp__start__block_invoke_2;
    v26[3] = &unk_1E20DF0B0;
    v26[4] = self;
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D778DB8](v26);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = v7;
    v15 = v8 >> 6;
    v16 = v8 & 0x3F;
    v17 = (v8 >> 58) | (v14 << 6);
    v18 = (double)v17;
    if ((isKindOfClass & 1) != 0)
    {
      v19 = v5;
      v20 = self->_anon_c[11];
      v21 = *(unsigned __int16 *)&self->_anon_c[9];
      if ((unsigned __int16)((unint64_t)(v21 | (v20 << 16)) >> 2) >= (unint64_t)objc_msgSend(v19, "keyframesCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v23);

      }
      else
      {
        v25[0] = v15;
        v25[1] = v11;
        v25[2] = v16;
        *(double *)&v25[3] = v18;
        objc_msgSend(v19, "loadTileAtPath:keyframeIndex:result:", v25);
      }

    }
    else
    {
      v24[0] = v8 >> 6;
      v24[1] = v11;
      v24[2] = v8 & 0x3F;
      *(double *)&v24[3] = (double)v17;
      objc_msgSend(v5, "loadTileAtPath:result:", v24, v12);
    }

  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__MKTileOverlayRequesterOp__start__block_invoke;
    block[3] = &unk_1E20DA4A0;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }

}

void __34__MKTileOverlayRequesterOp__start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_operationFailed:error:", v2, v3);

}

void __34__MKTileOverlayRequesterOp__start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MKTileOverlayRequesterOp__start__block_invoke_3;
  block[3] = &unk_1E20DF088;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __34__MKTileOverlayRequesterOp__start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setData:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  if (v2)
    objc_msgSend(WeakRetained, "_operationFinished:", v4);
  else
    objc_msgSend(WeakRetained, "_operationFailed:error:", v4, *(_QWORD *)(a1 + 48));

}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MKTileOverlayRequesterOp_cancel__block_invoke;
  block[3] = &unk_1E20DA4A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__MKTileOverlayRequesterOp_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_cancel
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  id v17;
  int v18;
  int v19;
  _QWORD v20[4];
  _QWORD v21[4];

  if (qword_1EDFB7CD0 != -1)
    dispatch_once(&qword_1EDFB7CD0, &__block_literal_global_79_0);
  RequesterRegistry::lookup((RequesterRegistry *)qword_1EDFB7CC8, (*(unsigned int *)&self->_anon_c[5] | ((unint64_t)(*(unsigned __int16 *)&self->_anon_c[9] | (self->_anon_c[11] << 16)) << 32)) >> 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isGeometryFlipped");
    v6 = *(_DWORD *)&self->_anon_c[5];
    v7 = *(_QWORD *)&self->_key.var0;
    v8 = (HIDWORD(v7) & 0x3FFFFFF) + (-1 << v7);
    if (v8 + 1 >= 0)
      v9 = (v8 + 1);
    else
      v9 = ~v8;
    if (v5)
      v10 = v9;
    else
      v10 = HIDWORD(v7) & 0x3FFFFFF;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = v6;
    v13 = v7 >> 6;
    v14 = v7 & 0x3F;
    v15 = (v7 >> 58) | (v12 << 6);
    v16 = (double)v15;
    if ((isKindOfClass & 1) != 0)
    {
      v17 = v4;
      v18 = self->_anon_c[11];
      v19 = *(unsigned __int16 *)&self->_anon_c[9];
      if ((unsigned __int16)((unint64_t)(v19 | (v18 << 16)) >> 2) < (unint64_t)objc_msgSend(v17, "keyframesCount"))
      {
        v21[0] = v13;
        v21[1] = v10;
        v21[2] = v14;
        *(double *)&v21[3] = v16;
        objc_msgSend(v17, "cancelLoadingTileAtPath:keyframeIndex:", v21);
      }

    }
    else
    {
      v20[0] = v7 >> 6;
      v20[1] = v10;
      v20[2] = v7 & 0x3F;
      *(double *)&v20[3] = (double)v15;
      objc_msgSend(v4, "_cancelLoadingTileAtPath:", v20);
    }
  }

}

- (uint64_t)key
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)setKey:(uint64_t)a3
{
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = a4;
  return result;
}

- (_MKOverlayTileRequester)delegate
{
  return (_MKOverlayTileRequester *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong(&self->_data, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
