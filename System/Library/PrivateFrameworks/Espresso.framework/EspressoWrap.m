@implementation EspressoWrap

void __EspressoWrap__default_layer_parameters_block_invoke()
{
  std::__shared_weak_count *v0;
  unint64_t *p_shared_owners;
  unint64_t v2;
  char *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  char __s1[8];
  char v7;

  Espresso::default_layer_parameters(&v4);
  (*(void (**)(char *__return_ptr))(*(_QWORD *)v4 + 304))(__s1);
  v0 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v2 = __ldaxr(p_shared_owners);
    while (__stlxr(v2 - 1, p_shared_owners));
    if (!v2)
    {
      ((void (*)(std::__shared_weak_count *))v0->__on_zero_shared)(v0);
      std::__shared_weak_count::__release_weak(v0);
    }
  }
  if (v7 < 0)
  {
    v3 = *(char **)__s1;
    EspressoWrap__default_layer_parameters::default_layer_parameters_str = (uint64_t)strdup(*(const char **)__s1);
    operator delete(v3);
  }
  else
  {
    EspressoWrap__default_layer_parameters::default_layer_parameters_str = (uint64_t)strdup(__s1);
  }
}

uint64_t __EspressoWrap__Layer__set_blob_by_name_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 32) + 48))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48) + 16);
}

void __EspressoWrap__Layer__set_blob_by_name_raw_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *__p[2];
  char v6;

  v4 = *(_QWORD *)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, void **, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v4 + 168))(v4, a2, __p, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
  if (v6 < 0)
    operator delete(__p[0]);
}

uint64_t __EspressoWrap__Layer__readonly_blob_by_name_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 40) + 40))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
}

uint64_t __EspressoWrap__Layer__finalize_weights_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 176))(*(_QWORD *)(a1 + 32));
}

void __EspressoWrap__Net_copy_from_image_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  char v10;
  void *v11;
  void *v12;
  _OWORD *v13;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = operator new(0x20uLL);
  v12 = v5 + 2;
  v13 = v5 + 2;
  v6 = *(_OWORD *)(a1 + 56);
  *v5 = *(_OWORD *)(a1 + 40);
  v5[1] = v6;
  v11 = v5;
  v7 = *(unsigned int *)(a1 + 160);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 152));
  Espresso::fill_network_with_images_batch_safe_v2(a2, (uint64_t *)(v4 + 144), (const char ***)&v11, v7, v8, (__int128 *)(a1 + 72), (std::string::size_type)__p);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }
}

void __EspressoWrap__Net__forward_block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), a2, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void __EspressoWrap__Net__forward_n_times_block_invoke(uint64_t a1, _QWORD *a2)
{
  int v4;

  if (*(int *)(a1 + 40) >= 1)
  {
    v4 = 0;
    do
    {
      Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), a2, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 40));
  }
}

void __EspressoWrap__Net__forward_partial_block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), a2, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t __EspressoWrap__MemoryMap__delete_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(***(_QWORD ***)(a1 + 32) + 48))(**(_QWORD **)(a1 + 32), a2, *(_QWORD *)(a1 + 32) + 16);
}

@end
