@implementation DACActivityAssertion

- (id)_initWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5 relinquishHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DACActivityAssertion *v15;
  DACActivityAssertion *v16;
  id invalidationHandler;
  uint64_t v18;
  id relinquishHandler;
  void **p_changeMarker;
  DACChangeMarker *v21;
  void *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)DACActivityAssertion;
  v15 = -[DACActivityAssertion init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_activity, a3);
    objc_storeStrong((id *)&v16->_origin, a4);
    invalidationHandler = v16->_invalidationHandler;
    v16->_invalidationHandler = 0;

    v16->_state = 0;
    v18 = objc_msgSend(v14, "copy");
    relinquishHandler = v16->_relinquishHandler;
    v16->_relinquishHandler = (id)v18;

    p_changeMarker = (void **)&v16->_changeMarker;
    objc_storeStrong((id *)&v16->_changeMarker, a5);
    if (!v16->_changeMarker)
    {
      v21 = objc_alloc_init(DACChangeMarker);
      v22 = *p_changeMarker;
      *p_changeMarker = v21;

    }
  }

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  DACActivityAssertion *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[DACActivityAssertion state](self, "state") != 2)
  {
    DACLogForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_224FBF000, v3, OS_LOG_TYPE_DEFAULT, "%p relinquishing", buf, 0xCu);
    }

    -[DACActivityAssertion relinquishHandler](self, "relinquishHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[DACActivityAssertion activity](self, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DACActivityAssertion origin](self, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v4)[2](v4, v5, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)DACActivityAssertion;
  -[DACActivityAssertion dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DACActivityAssertion state](self, "state");
  -[DACActivityAssertion changeMarker](self, "changeMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DACActivityAssertion activity](self, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, s(%lu) cm(%@) %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DACActivityAssertion *v7;
  DACActivityAssertion *v8;
  DACActivityAssertion *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  int v18;

  v7 = (DACActivityAssertion *)a3;
  v8 = v7;
  if (v7)
  {
    if (self == v7)
    {
      LOBYTE(self) = 1;
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if (!self)
      {
LABEL_24:

        goto LABEL_25;
      }
      -[DACActivityAssertion activity](self, "activity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DACActivityAssertion activity](v9, "activity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:", v11))
      {
        LOBYTE(self) = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[DACActivityAssertion origin](self, "origin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[DACActivityAssertion origin](v9, "origin"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DACActivityAssertion origin](self, "origin");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[DACActivityAssertion origin](v9, "origin");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
        {

          LOBYTE(self) = 0;
          goto LABEL_20;
        }
        v18 = 1;
      }
      else
      {
        v18 = 0;
      }
      v13 = -[DACActivityAssertion state](self, "state");
      if (v13 == -[DACActivityAssertion state](v9, "state"))
      {
        -[DACActivityAssertion changeMarker](self, "changeMarker");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DACActivityAssertion changeMarker](v9, "changeMarker");
        v17 = v3;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = objc_msgSend(v14, "isEqual:", v15);

        v3 = v17;
        if (!v18)
          goto LABEL_20;
        goto LABEL_19;
      }
      LOBYTE(self) = 0;
      if ((v18 & 1) != 0)
      {
LABEL_19:

      }
LABEL_20:
      if (!v12)

      goto LABEL_23;
    }
  }
  LOBYTE(self) = 0;
LABEL_25:

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DACActivityAssertion activity](self, "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (DACActivityDescriptor)origin
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__DACActivityAssertion_origin__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (DACActivityDescriptor *)v2;
}

void __30__DACActivityAssertion_origin__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOrigin:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__DACActivityAssertion_setOrigin___block_invoke;
  v6[3] = &unk_24ED13280;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v6);

}

void __34__DACActivityAssertion_setOrigin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (id)invalidationHandler
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__DACActivityAssertion_invalidationHandler__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v4);
  v2 = (void *)MEMORY[0x22768F8DC](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__DACActivityAssertion_invalidationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__DACActivityAssertion_setInvalidationHandler___block_invoke;
  v6[3] = &unk_24ED132A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v6);

}

void __47__DACActivityAssertion_setInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (unint64_t)state
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__DACActivityAssertion_state__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__DACActivityAssertion_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  DACActivityAssertion *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__DACActivityAssertion_setState___block_invoke;
  v7[3] = &unk_24ED132D0;
  v7[5] = &v8;
  v7[6] = a3;
  v7[4] = self;
  -[DACActivityAssertion _withLock:](self, "_withLock:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    DACLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_impl(&dword_224FBF000, v4, OS_LOG_TYPE_DEFAULT, "%p invalidating", buf, 0xCu);
    }

    -[DACActivityAssertion invalidationHandler](self, "invalidationHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);

  }
  _Block_object_dispose(&v8, 8);
}

void __33__DACActivityAssertion_setState___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a1[6];
  v3 = a1[4];
  if (v2 == *(_QWORD *)(v3 + 32) + 1)
  {
    *(_QWORD *)(v3 + 32) = v2;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 32) == 2;
  }
  else
  {
    DACLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = a1[6];
      v7 = *(_QWORD *)(v5 + 32);
      v8 = 134218496;
      v9 = v5;
      v10 = 2048;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_error_impl(&dword_224FBF000, v4, OS_LOG_TYPE_ERROR, "%p invalid state change to %lu from %lu", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (DACActivityDescriptor)activity
{
  return self->_activity;
}

- (id)relinquishHandler
{
  return self->_relinquishHandler;
}

- (DACChangeMarker)changeMarker
{
  return self->_changeMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong(&self->_relinquishHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
