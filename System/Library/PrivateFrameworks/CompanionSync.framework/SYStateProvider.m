@implementation SYStateProvider

+ (id)stateProviderWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SYStateProvider *v12;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&__provider_table_lock);
  v9 = (void *)__provider_table;
  if (!__provider_table)
  {
    v10 = objc_opt_new();
    v11 = (void *)__provider_table;
    __provider_table = v10;

    v9 = (void *)__provider_table;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v12 = (SYStateProvider *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[SYStateProvider initWithName:type:typeName:]([SYStateProvider alloc], "initWithName:type:typeName:", v7, v6, v8);
    objc_msgSend((id)__provider_table, "setObject:forKeyedSubscript:", v12, v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__provider_table_lock);

  return v12;
}

- (SYStateProvider)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("-[SYStateProvider init] is unavailable. Please use +stateProviderWithName:type: instead."));

  return 0;
}

- (SYStateProvider)initWithName:(id)a3 type:(unsigned int)a4 typeName:(id)a5
{
  id v8;
  id v9;
  SYStateProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  SYStateProvider *v16;
  id v18;
  void *v19;
  id v20;
  unsigned int v21;
  id location;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SYStateProvider;
  v10 = -[SYStateProvider init](&v23, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = (void *)objc_msgSend(v9, "copy");
    v10->_type = a4;
    v10->_lock._os_unfair_lock_opaque = 0;
    -[SYStateProvider setEncoder:](v10, "setEncoder:", 0);
    objc_initWeak(&location, v10);
    dispatch_get_global_queue(0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v20, &location);
    v21 = a4;
    v18 = v9;
    v19 = v11;
    v14 = v11;
    v15 = v12;
    v10->_handle = os_state_add_handler();

    v16 = v10;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

char *__46__SYStateProvider_initWithName_type_typeName___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  char *v6;

  v2 = (void *)MEMORY[0x212BE0D64]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_encodedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (char *)malloc_type_malloc(objc_msgSend(v5, "length") + 200, 0xD0FC354AuLL);
  *(_DWORD *)v6 = *(_DWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 32))
  {
    __strlcpy_chk();
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    __strlcpy_chk();
  }
  else
  {
    v6[8] = 0;
    v6[72] = 0;
  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  __strlcpy_chk();
  *((_DWORD *)v6 + 1) = objc_msgSend(v5, "length");
  objc_msgSend(v5, "getBytes:length:", v6 + 200, objc_msgSend(v5, "length"));

  objc_autoreleasePoolPop(v2);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)SYStateProvider;
  -[SYStateProvider dealloc](&v3, sel_dealloc);
}

- (void)updateState:(id)a3
{
  id v4;
  id state;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  self->_state = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setEncoder:(id)a3
{
  void *v4;
  id encoder;
  unsigned int type;
  void *v7;
  id v8;
  _QWORD v9[4];
  unsigned int v10;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    encoder = self->_encoder;
    self->_encoder = v4;

  }
  else
  {
    type = self->_type;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __30__SYStateProvider_setEncoder___block_invoke;
    v9[3] = &__block_descriptor_36_e16___NSData_16__0_8l;
    v10 = type;
    v7 = (void *)MEMORY[0x212BE0F2C](v9, a2);
    v8 = self->_encoder;
    self->_encoder = v7;

  }
}

id __30__SYStateProvider_setEncoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v16;

  v3 = a2;
  v4 = v3;
  v5 = *(_DWORD *)(a1 + 32);
  switch(v5)
  {
    case 3:
      v14 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v14;
      else
        v6 = 0;

      break;
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v4, "data");
      else
        objc_msgSend(CFSTR("<object is not a protobuf object>"), "dataUsingEncoding:", 4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v16 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v16);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v7 = (objc_class *)MEMORY[0x24BDD17C8];
        v8 = v16;
        v9 = [v7 alloc];
        objc_msgSend(v8, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "code");

        v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("<object does not support property list serialization : %@ (%@ / %ld)>"), v10, v11, v12);
        objc_msgSend(v13, "dataUsingEncoding:", 4);
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_encodedState
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    (*((void (**)(void))self->_encoder + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_encoder, 0);
  objc_storeStrong(&self->_state, 0);
}

@end
