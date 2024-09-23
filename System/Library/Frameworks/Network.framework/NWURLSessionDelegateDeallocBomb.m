@implementation NWURLSessionDelegateDeallocBomb

- (void)dealloc
{
  NSObject *v3;
  id v4;
  const char *Name;
  NSObject *object;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self || !self->__disarmed)
  {
    v14 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (self)
    {
      Name = sel_getName(self->__method);
      object = self->__object;
    }
    else
    {
      Name = sel_getName(0);
      object = 0;
    }
    v7 = object;
    v8 = (void *)objc_opt_class();
    if (self)
    {
      v9 = self->__object;
      v10 = self->__object;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v15 = 136315906;
    v16 = Name;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    v11 = v8;
    v12 = (void *)MEMORY[0x1E0C81028];
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  v13.receiver = self;
  v13.super_class = (Class)NWURLSessionDelegateDeallocBomb;
  -[NWURLSessionDelegateDeallocBomb dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__object, 0);
}

- (uint64_t)disarm
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 8))
    {
      os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      sel_getName(*(SEL *)(v1 + 24));
      v2 = *(id *)(v1 + 16);
      v5 = (void *)objc_opt_class();
      v3 = *(id *)(v1 + 16);
      v4 = v5;
      _os_log_send_and_compose_impl();

      _os_crash_msg();
      __break(1u);
    }
    *(_BYTE *)(result + 8) = 1;
  }
  return result;
}

@end
