@implementation ZN2NL15EntityConverter5mergeERKNS

NL::Entity *___ZN2NL15EntityConverter5mergeERKNS_6EntityEjS3_jU13block_pointerFvNSt3__110unique_ptrIS1_NS4_14default_deleteIS1_EEEEE_block_invoke(uint64_t a1, NL::Entity *this)
{
  uint64_t v4;
  NL::DateConverter *v5;
  const NL::DatePeriod *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  int v10;
  uint64_t v11;
  const NL::DatePeriod *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const void **v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::string *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  NL::Entity *v31;
  NL::Entity *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  NL::Entity *result;
  uint64_t v37;
  _QWORD v38[2];
  NL::Entity *(*v39)(uint64_t, uint64_t);
  void *v40;
  __int128 v41;
  uint64_t v42;
  NL::Entity *v43;
  uint64_t v44;
  NL::Entity *v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  const NL::DatePeriod *v48;
  std::__shared_weak_count *v49;
  const NL::DatePeriod *v50;
  std::__shared_weak_count *v51;
  const void **v52;
  std::string *v53;

  v4 = *(_QWORD *)(a1 + 48);
  NL::Entity::entityTemplate(this, &v53);
  v5 = *(NL::DateConverter **)(v4 + 16);
  v6 = (const NL::DatePeriod *)*((_QWORD *)this + 16);
  v7 = (std::__shared_weak_count *)*((_QWORD *)this + 17);
  v50 = v6;
  v51 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = *(_DWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(const NL::DatePeriod **)(v11 + 128);
  v13 = *(std::__shared_weak_count **)(v11 + 136);
  v48 = v12;
  v49 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  NL::DateConverter::mergeRange(v5, v6, v12, v10, *(_DWORD *)(a1 + 68), 1, (uint64_t *)&v52);
  std::shared_ptr<NL::DatePeriod>::operator=[abi:ne180100]<NL::DatePeriod,std::default_delete<NL::DatePeriod>,void>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (uint64_t *)&v52);
  v16 = v52;
  v52 = 0;
  if (v16)
  {
    NL::DatePeriod::~DatePeriod(v16);
    MEMORY[0x1A1B0E068]();
  }
  if (v13)
  {
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v51)
  {
    v19 = &v51->__shared_owners_;
    do
      v20 = __ldaxr((unint64_t *)v19);
    while (__stlxr(v20 - 1, (unint64_t *)v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(_QWORD *)(v21 + 40);
  if (v22)
  {
    v23 = v53;
    v24 = *(std::__shared_weak_count **)(v21 + 48);
    v46 = v22;
    v47 = v24;
    if (v24)
    {
      v25 = (unint64_t *)&v24->__shared_owners_;
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
    std::shared_ptr<NL::ParseIntent>::operator=[abi:ne180100](&v23[5].__r_.__value_.__l.__size_, &v46);
    v27 = v47;
    if (v47)
    {
      v28 = (unint64_t *)&v47->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v30 = *(_QWORD *)(a1 + 32);
    v31 = (NL::Entity *)v53;
    v53 = 0;
    v45 = v31;
    (*(void (**)(void))(v30 + 16))();
    v32 = v45;
    v45 = 0;
    if (v32)
    {
      NL::Entity::~Entity(v32);
      MEMORY[0x1A1B0E068]();
    }
  }
  v33 = *(_QWORD *)(a1 + 56);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 0x40000000;
  v39 = ___ZN2NL15EntityConverter5mergeERKNS_6EntityEjS3_jU13block_pointerFvNSt3__110unique_ptrIS1_NS4_14default_deleteIS1_EEEEE_block_invoke_2;
  v40 = &unk_1E45D00A0;
  v42 = v4;
  v43 = this;
  v44 = *(_QWORD *)(a1 + 64);
  v41 = *(_OWORD *)(a1 + 32);
  v34 = *(uint64_t **)(v33 + 160);
  v35 = *(uint64_t **)(v33 + 168);
  while (v34 != v35)
  {
    v39((uint64_t)v38, *v34);
    v34 += 2;
  }
  result = (NL::Entity *)v53;
  v53 = 0;
  if (result)
  {
    NL::Entity::~Entity(result);
    return (NL::Entity *)MEMORY[0x1A1B0E068](v37, 0x1072C4084E83484);
  }
  return result;
}

NL::Entity *___ZN2NL15EntityConverter5mergeERKNS_6EntityEjS3_jU13block_pointerFvNSt3__110unique_ptrIS1_NS4_14default_deleteIS1_EEEEE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NL::DateConverter *v5;
  uint64_t v6;
  const NL::DatePeriod *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int v11;
  const NL::DatePeriod *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const void **v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::string *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  std::string *v31;
  NL::Entity *result;
  NL::Entity *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  const NL::DatePeriod *v36;
  std::__shared_weak_count *v37;
  const NL::DatePeriod *v38;
  std::__shared_weak_count *v39;
  const void **v40;
  std::string *v41;

  v4 = *(_QWORD *)(a1 + 48);
  NL::Entity::entityTemplate(*(NL::Entity **)(a1 + 56), &v41);
  v5 = *(NL::DateConverter **)(v4 + 16);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(const NL::DatePeriod **)(v6 + 128);
  v8 = *(std::__shared_weak_count **)(v6 + 136);
  v38 = v7;
  v39 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = *(_DWORD *)(a1 + 64);
  v12 = *(const NL::DatePeriod **)(a2 + 128);
  v13 = *(std::__shared_weak_count **)(a2 + 136);
  v36 = v12;
  v37 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  NL::DateConverter::mergeRange(v5, v7, v12, v11, *(_DWORD *)(a1 + 68), 1, (uint64_t *)&v40);
  std::shared_ptr<NL::DatePeriod>::operator=[abi:ne180100]<NL::DatePeriod,std::default_delete<NL::DatePeriod>,void>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (uint64_t *)&v40);
  v16 = v40;
  v40 = 0;
  if (v16)
  {
    NL::DatePeriod::~DatePeriod(v16);
    MEMORY[0x1A1B0E068]();
  }
  if (v13)
  {
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v39)
  {
    v19 = &v39->__shared_owners_;
    do
      v20 = __ldaxr((unint64_t *)v19);
    while (__stlxr(v20 - 1, (unint64_t *)v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(_QWORD *)(v21 + 40);
  if (v22)
  {
    v23 = v41;
    v24 = *(std::__shared_weak_count **)(v21 + 48);
    v34 = v22;
    v35 = v24;
    if (v24)
    {
      v25 = (unint64_t *)&v24->__shared_owners_;
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
    std::shared_ptr<NL::ParseIntent>::operator=[abi:ne180100](&v23[5].__r_.__value_.__l.__size_, &v34);
    v27 = v35;
    if (v35)
    {
      v28 = (unint64_t *)&v35->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v30 = *(_QWORD *)(a1 + 32);
    v31 = v41;
    v41 = 0;
    v33 = (NL::Entity *)v31;
    (*(void (**)(void))(v30 + 16))();
    if (v33)
    {
      NL::Entity::~Entity(v33);
      MEMORY[0x1A1B0E068]();
    }
  }
  result = (NL::Entity *)v41;
  v41 = 0;
  if (result)
  {
    NL::Entity::~Entity(result);
    return (NL::Entity *)MEMORY[0x1A1B0E068]();
  }
  return result;
}

@end
