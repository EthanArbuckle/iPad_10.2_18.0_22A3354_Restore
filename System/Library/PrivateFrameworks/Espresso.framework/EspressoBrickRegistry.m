@implementation EspressoBrickRegistry

+ (void)registerBrickClass:(Class)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  Class v9;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[EspressoBrickRegistry registerBrickClass:]::onceToken != -1)
    dispatch_once(&+[EspressoBrickRegistry registerBrickClass:]::onceToken, &__block_literal_global_18642);
  v5 = lockQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EspressoBrickRegistry_registerBrickClass___block_invoke_2;
  block[3] = &unk_1E2DD7920;
  v8 = v4;
  v9 = a3;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__EspressoBrickRegistry_registerBrickClass___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *__p[2];
  char v7;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    objc_msgSend((id)registry, "setObject:forKeyedSubscript:", v1, *(_QWORD *)(a1 + 32));
  v2 = Espresso::factory_t<Espresso::SerDes::layer_io_base>::shared();
  std::string::basic_string[abi:ne180100]<0>(__p, "brick");
  v3 = (std::__shared_weak_count *)operator new(0x20uLL);
  v3->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBF140;
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DA1D58;
  Espresso::factory_t<Espresso::SerDes::layer_io_base>::register_object((uint64_t)v2, (uint64_t)__p, (uint64_t)&v3[1], (uint64_t)v3);
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  if (v7 < 0)
    operator delete(__p[0]);
}

void __44__EspressoBrickRegistry_registerBrickClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)registry;
  registry = v0;

  v2 = dispatch_queue_create("com.apple.Espresso.registerBrickLock", 0);
  v3 = (void *)lockQ;
  lockQ = (uint64_t)v2;

}

@end
