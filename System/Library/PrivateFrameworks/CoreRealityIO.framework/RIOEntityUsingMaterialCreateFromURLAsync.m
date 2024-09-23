@implementation RIOEntityUsingMaterialCreateFromURLAsync

void __RIOEntityUsingMaterialCreateFromURLAsync_block_invoke(uint64_t a1)
{
  uint64_t v1;
  CFErrorRef Error;
  void *__p[2];
  char v4;

  v1 = *(_QWORD *)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "CoreRealityIO only supports loading content from file URLs");
  Error = realityio::createError((uint64_t)__p);
  (*(void (**)(uint64_t, _QWORD, CFErrorRef))(v1 + 16))(v1, 0, Error);
  if (v4 < 0)
    operator delete(__p[0]);
}

void __RIOEntityUsingMaterialCreateFromURLAsync_block_invoke_2(uint64_t a1)
{
  char *v2;
  char *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
    v2 = *(char **)v2;
  v3 = (char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
    v3 = *(char **)v3;
  v4 = *(uint64_t **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (uint64_t *)RIOPxrUsdStageCreateWithFilePathWithErrorReporting(v2, 0);
  if (v6)
  {
    MaterialToEntity::setup(v4, v5, v3, v6);
    v7 = *(std::__shared_weak_count **)(a1 + 48);
    v28[0] = *(_QWORD *)(a1 + 40);
    v28[1] = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = *(_QWORD *)(a1 + 32);
    v30 = 0;
    if (v10)
    {
      v29[0] = &off_24FDE95D0;
      v29[1] = MEMORY[0x2348B5260]();
      v30 = v29;
    }
    MaterialToEntity::evaluateAsync(v28, (uint64_t)v29);
    v11 = v30;
    if (v30 == v29)
    {
      v12 = 4;
      v11 = v29;
    }
    else
    {
      if (!v30)
        goto LABEL_25;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_25:
    if (v7)
    {
      v22 = (unint64_t *)&v7->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    return;
  }
  REEngineConfigurationCreateFromEngine();
  REEngineConfigurationGetEngineQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  RERelease();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3321888768;
  v24[2] = __RIOEntityUsingMaterialCreateFromURLAsync_block_invoke_3;
  v24[3] = &unk_24FDE9090;
  v14 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v15 = *(std::__shared_weak_count **)(a1 + 48);
  v25 = v14;
  v26 = v16;
  v27 = v15;
  if (v15)
  {
    v17 = (unint64_t *)&v15->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  dispatch_async(v13, v24);
  v19 = v27;
  if (v27)
  {
    v20 = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

const void **__RIOEntityUsingMaterialCreateFromURLAsync_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  const void **v2;
  const void *v3;
  const void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(const void ***)(*(_QWORD *)(a1 + 40) + 32);
  if (v2)
  {
    v3 = *v2;
    v5 = v3;
    if (v3)
      CFRetain(v3);
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  (*(void (**)(uint64_t, _QWORD, const void *))(v1 + 16))(v1, 0, v3);
  return realityio::WrappedCFRef<__CFError *>::~WrappedCFRef(&v5);
}

@end
