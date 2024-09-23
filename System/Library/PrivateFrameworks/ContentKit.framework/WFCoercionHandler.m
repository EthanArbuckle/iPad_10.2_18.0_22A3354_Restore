@implementation WFCoercionHandler

- (WFCoercionHandler)initWithBlock:(id)a3 asynchronousBlock:(id)a4 keyPath:(id)a5 availabilityCheck:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFCoercionHandler *v15;
  uint64_t v16;
  id block;
  uint64_t v18;
  id asynchronousBlock;
  uint64_t v20;
  NSString *keyPath;
  uint64_t v22;
  id availabilityCheck;
  WFCoercionHandler *v24;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && !v12 && !v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercion.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block || asynchronousBlock || keyPath"));

  }
  v27.receiver = self;
  v27.super_class = (Class)WFCoercionHandler;
  v15 = -[WFCoercionHandler init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    block = v15->_block;
    v15->_block = (id)v16;

    v18 = objc_msgSend(v12, "copy");
    asynchronousBlock = v15->_asynchronousBlock;
    v15->_asynchronousBlock = (id)v18;

    v20 = objc_msgSend(v13, "copy");
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    availabilityCheck = v15->_availabilityCheck;
    v15->_availabilityCheck = (id)v22;

    v24 = v15;
  }

  return v15;
}

- (BOOL)hasAvailabilityCheck
{
  return self->_availabilityCheck != 0;
}

- (BOOL)coercionIsAvailableForItem:(id)a3
{
  uint64_t (**availabilityCheck)(id, id);

  availabilityCheck = (uint64_t (**)(id, id))self->_availabilityCheck;
  if (availabilityCheck)
    return availabilityCheck[2](availabilityCheck, a3);
  else
    return 1;
}

- (int64_t)concurrencyMode
{
  return self->_asynchronousBlock != 0;
}

- (id)performSynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  WFCoercionContext *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_block)
  {
    v12 = -[WFCoercionContext initWithRequestedType:options:]([WFCoercionContext alloc], "initWithRequestedType:options:", v10, v11);
    (*((void (**)(void))self->_block + 2))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (self->_keyPath)
  {
    objc_msgSend(v9, "valueForKeyPath:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  WFRepresentationsFromCoercionHandlerResult(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)performAsynchronousCoercionWithContentItem:(id)a3 forType:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  WFCoercionContext *v15;
  _QWORD *asynchronousBlock;
  void (*v17)(_QWORD *, id, WFCoercionContext *, _QWORD *);
  WFCoercionContext *v18;
  _QWORD v19[4];
  WFCoercionContext *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (self->_asynchronousBlock)
  {
    v15 = -[WFCoercionContext initWithRequestedType:options:]([WFCoercionContext alloc], "initWithRequestedType:options:", v11, v12);
    asynchronousBlock = self->_asynchronousBlock;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __98__WFCoercionHandler_performAsynchronousCoercionWithContentItem_forType_options_completionHandler___block_invoke;
    v19[3] = &unk_24C4E3590;
    v20 = v15;
    v21 = v14;
    v17 = (void (*)(_QWORD *, id, WFCoercionContext *, _QWORD *))asynchronousBlock[2];
    v18 = v15;
    v17(asynchronousBlock, v10, v18, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

- (id)block
{
  return self->_block;
}

- (id)asynchronousBlock
{
  return self->_asynchronousBlock;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)availabilityCheck
{
  return self->_availabilityCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availabilityCheck, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_asynchronousBlock, 0);
  objc_storeStrong(&self->_block, 0);
}

void __98__WFCoercionHandler_performAsynchronousCoercionWithContentItem_forType_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v7 = a3;
  WFRepresentationsFromCoercionHandlerResult(a2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!(v7 | v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestedType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentItem badCoercionErrorForType:](WFContentItem, "badCoercionErrorForType:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)block:(id)a3
{
  return (id)objc_msgSend(a1, "block:availabilityCheck:", a3, 0);
}

+ (id)asynchronousBlock:(id)a3
{
  return (id)objc_msgSend(a1, "asynchronousBlock:availabilityCheck:", a3, 0);
}

+ (id)keyPath:(id)a3
{
  return (id)objc_msgSend(a1, "keyPath:availabilityCheck:", a3, 0);
}

+ (id)block:(id)a3 availabilityCheck:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:asynchronousBlock:keyPath:availabilityCheck:", v7, 0, 0, v6);

  return v8;
}

+ (id)asynchronousBlock:(id)a3 availabilityCheck:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:asynchronousBlock:keyPath:availabilityCheck:", 0, v7, 0, v6);

  return v8;
}

+ (id)keyPath:(id)a3 availabilityCheck:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:asynchronousBlock:keyPath:availabilityCheck:", 0, 0, v7, v6);

  return v8;
}

+ (id)keyPath:(id)a3 unavailableIfNilOrEmpty:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFCoercionHandler_keyPath_unavailableIfNilOrEmpty___block_invoke;
    aBlock[3] = &unk_24C4E3568;
    v12 = v6;
    v8 = _Block_copy(aBlock);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "keyPath:availabilityCheck:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __53__WFCoercionHandler_keyPath_unavailableIfNilOrEmpty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  BOOL v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "count") == 0;
  else
    v3 = v2 == 0;
  v4 = !v3;

  return v4;
}

@end
