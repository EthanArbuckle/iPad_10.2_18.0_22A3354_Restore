@implementation __NSCFDeallocBomb

- (_QWORD)initWithMethod:(void *)a3 delegate:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)__NSCFDeallocBomb;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a3);
      a1[2] = a2;
    }
  }

  return a1;
}

- (uint64_t)disarm
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  const char *Name;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 24))
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
      v2 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v4 = (char *)objc_opt_class();
        v5 = *(_QWORD *)(v1 + 8);
        v8 = 138412802;
        v9 = v4;
        v10 = 2112;
        v11 = v5;
        v12 = 2048;
        v13 = v5;
        v6 = v4;
        _os_log_error_impl(&dword_183ECA000, v2, OS_LOG_TYPE_ERROR, "API MISUSE: NSURLSession delegate %@: %@ (%p)", (uint8_t *)&v8, 0x20u);

      }
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
      v3 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        Name = sel_getName(*(SEL *)(v1 + 16));
        v8 = 136315138;
        v9 = Name;
        _os_log_fault_impl(&dword_183ECA000, v3, OS_LOG_TYPE_FAULT, "API MISUSE: %s completion handler called more than once", (uint8_t *)&v8, 0xCu);
      }

      return 0;
    }
    else
    {
      result = 1;
      *(_BYTE *)(v1 + 24) = 1;
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  char *v5;
  id object;
  char *v7;
  const char *Name;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->disarmed)
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v3 = (id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (char *)objc_opt_class();
      object = self->object;
      *(_DWORD *)buf = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = object;
      v14 = 2048;
      v15 = object;
      v7 = v5;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "API MISUSE: NSURLSession delegate %@: %@ (%p)", buf, 0x20u);

    }
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v4 = (id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      Name = sel_getName(self->method);
      *(_DWORD *)buf = 136315138;
      v11 = Name;
      _os_log_fault_impl(&dword_183ECA000, v4, OS_LOG_TYPE_FAULT, "API MISUSE: %s completion handler not called", buf, 0xCu);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)__NSCFDeallocBomb;
  -[__NSCFDeallocBomb dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->object, 0);
}

@end
