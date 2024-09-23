@implementation _BCULayerRendererOperation

- (_BCULayerRendererOperation)initWithRenderer:(id)a3 priority:(float)a4 waitForCPUSynchronization:(BOOL)a5 logKey:(id)a6 layerBlock:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  _BCULayerRendererOperation *v19;
  _BCULayerRendererOperation *v20;
  uint64_t v21;
  id layerBlock;
  uint64_t v23;
  id completion;
  uint64_t v25;
  void *logKey;
  uint64_t v27;
  NSString *v28;
  unint64_t v29;
  objc_super v31;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_BCULayerRendererOperation;
  v19 = -[_BCULayerRendererOperation init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_renderer, a3);
    v21 = objc_msgSend(v17, "copy");
    layerBlock = v20->_layerBlock;
    v20->_layerBlock = (id)v21;

    v23 = objc_msgSend(v18, "copy");
    completion = v20->_completion;
    v20->_completion = (id)v23;

    v20->_priority = a4;
    v20->_waitForCPUSynchronization = a5;
    if (objc_msgSend(v16, "length"))
    {
      v25 = objc_msgSend(v16, "copy");
      logKey = v20->_logKey;
      v20->_logKey = (NSString *)v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      logKey = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(logKey, "UUIDString");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v20->_logKey;
      v20->_logKey = (NSString *)v27;

    }
    do
      v29 = __ldxr(&qword_2540D97D0);
    while (__stxr(v29 + 1, &qword_2540D97D0));
    atomic_store(v29, (unint64_t *)&v20->_operationId);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
  }

  return v20;
}

- (void)setPriority:(float)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  self->_priority = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
}

- (float)priority
{
  float priority;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  priority = self->_priority;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
  return priority;
}

- (void)start
{
  MEMORY[0x24BEDD108](self->_renderer, sel__startOperation_);
}

- (id)configureLayer
{
  void (**v3)(_QWORD);
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id completion;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  if (self->_cancelled)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
    v3 = 0;
LABEL_3:
    v4 = 0;
    goto LABEL_4;
  }
  self->_configuring = 1;
  v3 = (void (**)(_QWORD))MEMORY[0x22E2B2564](self->_layerBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
  if (!v3)
    goto LABEL_3;
  v3[2](v3);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  self->_configuring = 0;
  if (!self->_cancelled)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
    goto LABEL_4;
  }

  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2B2564](self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
  if (v4)
  {
    ((void (**)(_QWORD, _BCULayerRendererOperation *, _QWORD))v4)[2](v4, self, 0);

    goto LABEL_3;
  }
LABEL_4:

  return v4;
}

- (void)cancel
{
  id completion;
  void (**v4)(id, _BCULayerRendererOperation *, _QWORD);

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  self->_cancelled = 1;
  if (self->_configuring)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
  }
  else
  {
    v4 = (void (**)(id, _BCULayerRendererOperation *, _QWORD))MEMORY[0x22E2B2564](self->_completion);
    completion = self->_completion;
    self->_completion = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
    if (v4)
    {
      v4[2](v4, self, 0);

    }
  }
}

- (void)completeWithImage:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id completion;
  id v6;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2B2564](self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
  if (v4)
    ((void (**)(_QWORD, _BCULayerRendererOperation *, id))v4)[2](v4, self, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[_BCULayerRendererOperation cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_BCULayerRendererOperation;
  -[_BCULayerRendererOperation dealloc](&v3, sel_dealloc);
}

- (int64_t)_compareHoldingStateLock:(id)a3
{
  id v4;
  float v5;
  float priority;
  int64_t v7;
  int64_t v8;
  int64_t v9;

  v4 = a3;
  v5 = *((float *)v4 + 5);
  priority = self->_priority;
  if (priority >= v5)
  {
    if (priority == v5)
    {
      v8 = atomic_load((unint64_t *)&self->_operationId);
      v9 = atomic_load((unint64_t *)v4 + 1);
      if (v8 > v9)
        v7 = -1;
      else
        v7 = 1;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (id)layerBlock
{
  return self->_layerBlock;
}

- (void)setLayerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (BCUPurgeableImage)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)waitForCPUSynchronization
{
  return self->_waitForCPUSynchronization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_layerBlock, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end
