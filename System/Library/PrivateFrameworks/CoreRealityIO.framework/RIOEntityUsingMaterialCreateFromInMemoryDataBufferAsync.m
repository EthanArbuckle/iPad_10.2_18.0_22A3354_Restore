@implementation RIOEntityUsingMaterialCreateFromInMemoryDataBufferAsync

void __RIOEntityUsingMaterialCreateFromInMemoryDataBufferAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  char *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (const char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
    v3 = *(const char **)v3;
  v4 = (char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
    v4 = *(char **)v4;
  if (MaterialToEntity::setup(v2, *(_QWORD *)(a1 + 56), v3, v4, *(CFDataRef *)(a1 + 112)))
  {
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    v26[0] = *(_QWORD *)(a1 + 40);
    v26[1] = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = *(_QWORD *)(a1 + 32);
    v28 = 0;
    if (v8)
    {
      v27[0] = &off_24FDE95D0;
      v27[1] = MEMORY[0x2348B5260]();
      v28 = v27;
    }
    MaterialToEntity::evaluateAsync(v26, (uint64_t)v27);
    v9 = v28;
    if (v28 == v27)
    {
      v10 = 4;
      v9 = v27;
    }
    else
    {
      if (!v28)
        goto LABEL_25;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_25:
    if (v5)
    {
      v20 = (unint64_t *)&v5->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    return;
  }
  REEngineConfigurationCreateFromEngine();
  REEngineConfigurationGetEngineQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  RERelease();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3321888768;
  v22[2] = __RIOEntityUsingMaterialCreateFromInMemoryDataBufferAsync_block_invoke_2;
  v22[3] = &unk_24FDE9090;
  v12 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v13 = *(std::__shared_weak_count **)(a1 + 48);
  v23 = v12;
  v24 = v14;
  v25 = v13;
  if (v13)
  {
    v15 = (unint64_t *)&v13->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  dispatch_async(v11, v22);
  v17 = v25;
  if (v25)
  {
    v18 = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

}

const void **__RIOEntityUsingMaterialCreateFromInMemoryDataBufferAsync_block_invoke_2(uint64_t a1)
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
