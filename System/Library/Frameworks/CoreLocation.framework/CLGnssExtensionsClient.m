@implementation CLGnssExtensionsClient

- (CLGnssExtensionsClient)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4 dispatchQueue:(id)a5 codeBlock:(id)a6
{
  CLGnssExtensionsClient *v10;
  CLGnssExtensionsCallbackAssertionInternal *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  objc_super v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  void *v27[2];
  uint64_t (*v28)(uint64_t, CLConnectionMessage **);
  void *v29;
  CLGnssExtensionsCallbackAssertionInternal *v30;
  void *__p[2];
  char v32;
  id v33;
  char *v34;

  v22.receiver = self;
  v22.super_class = (Class)CLGnssExtensionsClient;
  v10 = -[CLGnssExtensionsClient init](&v22, sel_init);
  if (v10)
  {
    v11 = (CLGnssExtensionsCallbackAssertionInternal *)operator new();
    v33 = a4;
    v34 = (char *)a3;
    v11->var0 = a5;
    v11->var1 = 0;
    v12 = operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v12, __p, v11->var0);
    if (v32 < 0)
      operator delete(__p[0]);
    v11->var2 = (CLConnectionClient *)v12;
    dispatch_retain((dispatch_object_t)v11->var0);
    v11->var1 = _Block_copy(a6);
    sub_18F5D5990(v27, (char *)a3);
    CLConnectionClient::setHandlerForMessage();
    if (SHIBYTE(v28) < 0)
      operator delete(v27[0]);
    v27[0] = (void *)MEMORY[0x1E0C809B0];
    v27[1] = (void *)3221225472;
    v28 = sub_18F696208;
    v29 = &unk_1E29913A8;
    v30 = v11;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start(v11->var2);
    sub_18F5F3D54(&v34, &v33, &v25);
    v23 = v25;
    v24 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    v15 = v24;
    if (v24)
    {
      v16 = (unint64_t *)&v24->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v26;
    if (v26)
    {
      v19 = (unint64_t *)&v26->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v10->fInternal = v11;
  }
  return v10;
}

- (void)invalidate
{
  CLGnssExtensionsCallbackAssertionInternal *fInternal;

  fInternal = self->fInternal;
  if (fInternal)
    sub_18F5F2D44((uint64_t)fInternal);
}

- (void)dealloc
{
  CLGnssExtensionsCallbackAssertionInternal *fInternal;
  objc_super v4;

  fInternal = self->fInternal;
  if (fInternal)
  {
    sub_18F5F2D44((uint64_t)self->fInternal);
    MEMORY[0x194002D30](fInternal, 0xA0C40114AFA65);
  }
  self->fInternal = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLGnssExtensionsClient;
  -[CLGnssExtensionsClient dealloc](&v4, sel_dealloc);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6
{
  return (id)sub_18F695AD8((uint64_t)a3, &stru_1E2993188, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 withCallbackQueue:(id)a5 andBlock:(id)a6
{
  const char *v9;

  v9 = (const char *)objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)sub_18F695AD8((uint64_t)&stru_1E2993188, v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

@end
