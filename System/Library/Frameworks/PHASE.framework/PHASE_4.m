uint64_t Phase::SpatialModeler::Scheduler::InitGraphSequence(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t i;
  uint64_t v13;

  std::vector<Phase::SpatialModeler::Graph>::reserve(a2, 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 3));
  v6 = *a3;
  v7 = a3[1];
  if (*a3 == v7)
    return 1;
  while (1)
  {
    v9 = *a2;
    v8 = a2[1];
    if (v8 >= a2[2])
    {
      v10 = std::vector<Phase::SpatialModeler::Graph>::__emplace_back_slow_path<Phase::SpatialModeler::GraphSequence &>(a2, (uint64_t)a2);
    }
    else
    {
      *(_QWORD *)v8 = a2;
      *(_OWORD *)(v8 + 8) = 0u;
      *(_OWORD *)(v8 + 24) = 0u;
      *(_OWORD *)(v8 + 40) = 0u;
      *(_QWORD *)(v8 + 56) = -1;
      *(_QWORD *)(v8 + 64) = 0;
      *(_QWORD *)(v8 + 96) = 0;
      *(_OWORD *)(v8 + 128) = 0u;
      *(_OWORD *)(v8 + 144) = 0u;
      v10 = v8 + 192;
      *(_OWORD *)(v8 + 160) = 0u;
      *(_OWORD *)(v8 + 176) = 0u;
    }
    a2[1] = v10;
    if (!Phase::SpatialModeler::Scheduler::InitGraph(a1, a2, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - v9) >> 6), v6))
      break;
    v6 += 24;
    if (v6 == v7)
      return 1;
  }
  v13 = *a2;
  for (i = a2[1]; i != v13; std::allocator<Phase::SpatialModeler::Graph>::destroy[abi:ne180100]((uint64_t)(a2 + 2), i))
    i -= 192;
  result = 0;
  a2[1] = v13;
  return result;
}

void **std::vector<Phase::SpatialModeler::Graph>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 6) < a2)
  {
    if (a2 >= 0x155555555555556)
      std::vector<Phase::SpatialModeler::Graph>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::Graph>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 192 * v6;
    std::vector<Phase::SpatialModeler::Graph>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<Phase::SpatialModeler::Graph>::~__split_buffer(v7);
  }
  return result;
}

void sub_2166CBA04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<Phase::SpatialModeler::Graph>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

BOOL Phase::SpatialModeler::Scheduler::InitGraph(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  const std::string *v6;
  uint64_t v7;
  const std::string *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  std::string *v13;
  void **v14;
  __int128 *size;
  __int128 *data;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  std::string *v20;
  uint64_t v21;
  std::string **v22;
  uint64_t v23;
  std::string *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  std::string *v28;
  std::string *v29;
  std::string *i;
  uint64_t v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  const std::string *v46;
  const std::string *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  const std::string *v63;
  uint64_t data_low;
  _QWORD *v65;
  BOOL v66;
  void *v67;
  _QWORD *v68;
  uint64_t v69;
  __int128 *v70;
  uint64_t v71;
  unint64_t v73;
  const std::string **v74;
  __int128 v78;
  char *v79;
  __int128 *v80;
  uint64_t *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v73 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 6);
  if (v73 <= a3)
    return v73 > a3;
  v5 = *(_QWORD *)(a4 + 16);
  v6 = *(const std::string **)a4;
  v7 = v4 + 192 * a3;
  *(_QWORD *)(v7 + 56) = *(_QWORD *)(a4 + 8);
  v8 = (const std::string *)(v7 + 8);
  std::string::operator=((std::string *)(v7 + 8), v6);
  if (v8 != v6)
  {
    v9 = v4 + 192 * a3;
    v12 = *(_QWORD *)(v9 + 48);
    v11 = (_QWORD *)(v9 + 48);
    v10 = v12;
    v14 = (void **)(v11 - 2);
    v13 = (std::string *)*(v11 - 2);
    data = (__int128 *)v6[1].__r_.__value_.__l.__data_;
    size = (__int128 *)v6[1].__r_.__value_.__l.__size_;
    v17 = ((char *)size - (char *)data) >> 5;
    if (v17 > (v12 - (uint64_t)v13) >> 5)
    {
      if (v13)
      {
        std::vector<Phase::SpatialModeler::GraphDescriptionNode>::__clear[abi:ne180100](v11 - 2);
        operator delete(*v14);
        v10 = 0;
        *v14 = 0;
        *(v11 - 1) = 0;
        *v11 = 0;
      }
      if ((char *)size - (char *)data < 0)
        goto LABEL_75;
      v18 = v10 >> 4;
      if (v10 >> 4 <= v17)
        v18 = ((char *)size - (char *)data) >> 5;
      v19 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0 ? 0x7FFFFFFFFFFFFFFLL : v18;
      if (v19 >> 59)
LABEL_75:
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v20 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>>((uint64_t)v11, v19);
      *v14 = v20;
      v21 = v4 + 192 * a3;
      *(_QWORD *)(v21 + 40) = v20;
      v22 = (std::string **)(v21 + 40);
      *v11 = (char *)v20 + 32 * v23;
      v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*>((uint64_t)v11, data, size, v20);
      goto LABEL_16;
    }
    v25 = v4 + 192 * a3;
    v26 = *(_QWORD *)(v25 + 40);
    v22 = (std::string **)(v25 + 40);
    v27 = (v26 - (uint64_t)v13) >> 5;
    if (v27 < v17)
    {
      v28 = (std::string *)&data[2 * v27];
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,0>((std::string *)data, v28, v13);
      v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*>((uint64_t)v11, (__int128 *)v28, size, *v22);
LABEL_16:
      *v22 = v24;
      goto LABEL_22;
    }
    v29 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,0>((std::string *)data, (std::string *)size, v13);
    for (i = *v22; i != v29; i = (std::string *)((char *)i - 32))
    {
      if (i[-1].__r_.__value_.__s.__data_[15] < 0)
        operator delete((void *)i[-2].__r_.__value_.__r.__words[2]);
    }
    *v22 = v29;
  }
LABEL_22:
  *(_QWORD *)(v4 + 192 * a3 + 64) = v5;
  Phase::Geometry::System::ObserveSystemState(*(Phase::Geometry::System **)(a1 + 8), &v78);
  v31 = v4 + 192 * a3;
  v32 = v78;
  v78 = 0uLL;
  v33 = *(std::__shared_weak_count **)(v31 + 144);
  *(_OWORD *)(v31 + 136) = v32;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
  if (*((_QWORD *)&v78 + 1))
  {
    v37 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  Phase::Geometry::System::GetCurrentState(*(Phase::Geometry::System **)(a1 + 8), &v78);
  std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100](v4 + 192 * a3 + 152, &v78);
  v39 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
  if (*((_QWORD *)&v78 + 1))
  {
    v40 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v42 = v4 + 192 * a3;
  v45 = *(_QWORD *)(v42 + 168);
  v44 = (uint64_t *)(v42 + 168);
  v43 = v45;
  v46 = (const std::string *)*(v44 - 17);
  v47 = (const std::string *)*(v44 - 16);
  v74 = (const std::string **)(v44 - 16);
  v48 = v44 + 2;
  v49 = (char *)v47 - (char *)v46;
  if (0xAAAAAAAAAAAAAAABLL * ((v44[2] - v45) >> 5) < ((char *)v47 - (char *)v46) >> 5)
  {
    if ((unint64_t)v49 >= 0x5555555555555541)
      std::vector<Phase::SpatialModeler::Graph>::__throw_length_error[abi:ne180100]();
    v50 = *(_QWORD *)(v4 + 192 * a3 + 176);
    v81 = v44 + 2;
    v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphNode>>(v49 >> 5);
    *((_QWORD *)&v78 + 1) = &v51[32 * ((v50 - v43) >> 5)];
    v79 = (char *)*((_QWORD *)&v78 + 1);
    *(_QWORD *)&v78 = v51;
    v80 = (__int128 *)&v51[96 * v52];
    std::vector<Phase::SpatialModeler::GraphNode>::__swap_out_circular_buffer(v44, &v78);
    std::__split_buffer<Phase::SpatialModeler::GraphNode>::~__split_buffer((uint64_t)&v78);
    v46 = (const std::string *)*(v44 - 17);
    v47 = *v74;
  }
  if (v46 != v47)
  {
    v53 = 0;
    v54 = (uint64_t *)(v4 + 192 * a3 + 176);
    do
    {
      v55 = *v54;
      if ((unint64_t)*v54 >= *v48)
      {
        v57 = 0xAAAAAAAAAAAAAAABLL * ((v55 - *v44) >> 5);
        v58 = v57 + 1;
        if (v57 + 1 > 0x2AAAAAAAAAAAAAALL)
          std::vector<Phase::SpatialModeler::Graph>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((*v48 - *v44) >> 5) > v58)
          v58 = 0x5555555555555556 * ((*v48 - *v44) >> 5);
        if (0xAAAAAAAAAAAAAAABLL * ((*v48 - *v44) >> 5) >= 0x155555555555555)
          v59 = 0x2AAAAAAAAAAAAAALL;
        else
          v59 = v58;
        v81 = v44 + 2;
        v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphNode>>(v59);
        v61 = &v60[96 * v57];
        *(_QWORD *)&v78 = v60;
        *((_QWORD *)&v78 + 1) = v61;
        v80 = (__int128 *)&v60[96 * v62];
        *(_QWORD *)v61 = a2;
        *((_QWORD *)v61 + 1) = a3;
        *((_QWORD *)v61 + 2) = v53;
        *((_QWORD *)v61 + 11) = 0;
        *(_OWORD *)(v61 + 24) = 0u;
        *(_OWORD *)(v61 + 40) = 0u;
        *((_QWORD *)v61 + 7) = 0;
        v79 = v61 + 96;
        std::vector<Phase::SpatialModeler::GraphNode>::__swap_out_circular_buffer(v44, &v78);
        v56 = *v54;
        std::__split_buffer<Phase::SpatialModeler::GraphNode>::~__split_buffer((uint64_t)&v78);
      }
      else
      {
        *(_QWORD *)v55 = a2;
        *(_QWORD *)(v55 + 8) = a3;
        *(_QWORD *)(v55 + 16) = v53;
        *(_QWORD *)(v55 + 88) = 0;
        *(_OWORD *)(v55 + 24) = 0u;
        *(_OWORD *)(v55 + 40) = 0u;
        *(_QWORD *)(v55 + 56) = 0;
        v56 = v55 + 96;
        *v54 = v55 + 96;
      }
      *v54 = v56;
      v63 = *v74;
      std::string::operator=((std::string *)(v56 - 72), v46);
      *(_QWORD *)(v56 - 48) = v46[1].__r_.__value_.__l.__data_;
      data_low = LODWORD(v46[1].__r_.__value_.__l.__data_);
      if (data_low == 0xFFFFFFFFLL)
      {
        v65 = operator new(0x30uLL);
        *v65 = &off_24D581518;
        v65[1] = Phase::SpatialModeler::RunCommandsOnGraphNode;
        v65[2] = Phase::SpatialModeler::Scheduler::RunFullModelerQueries;
        v65[3] = 0;
        v65[4] = a1;
        *((_WORD *)v65 + 20) = 257;
      }
      else
      {
        v66 = v46 == (const std::string *)&v63[-2].__r_.__value_.__r.__words[2];
        if ((data_low & 2) != 0)
          v67 = Phase::SpatialModeler::Scheduler::RunSceneQueries;
        else
          v67 = Phase::SpatialModeler::Scheduler::RunPartialModelerQueries;
        v80 = 0;
        v65 = operator new(0x30uLL);
        *v65 = &off_24D581560;
        v65[1] = Phase::SpatialModeler::RunCommandsOnGraphNode;
        v65[2] = v67;
        v65[3] = 0;
        v65[4] = a1;
        *((_BYTE *)v65 + 40) = data_low & 1;
        *((_BYTE *)v65 + 41) = v66;
      }
      v80 = (__int128 *)v65;
      v68 = *(_QWORD **)(v56 - 8);
      *(_QWORD *)(v56 - 8) = 0;
      if (v68 == (_QWORD *)(v56 - 32))
      {
        v68 = (_QWORD *)(v56 - 32);
        v69 = 4;
      }
      else
      {
        if (!v68)
          goto LABEL_62;
        v69 = 5;
      }
      (*(void (**)(void))(*v68 + 8 * v69))();
LABEL_62:
      if (v80)
      {
        if (v80 != &v78)
        {
          *(_QWORD *)(v56 - 8) = v80;
          goto LABEL_72;
        }
        *(_QWORD *)(v56 - 8) = v56 - 32;
        (*(void (**)(__int128 *, uint64_t))(*(_QWORD *)v80 + 24))(v80, v56 - 32);
      }
      else
      {
        *(_QWORD *)(v56 - 8) = 0;
      }
      v70 = v80;
      if (v80 == &v78)
      {
        v70 = &v78;
        v71 = 4;
        goto LABEL_71;
      }
      if (v80)
      {
        v71 = 5;
LABEL_71:
        (*(void (**)(void))(*(_QWORD *)v70 + 8 * v71))();
      }
LABEL_72:
      ++v53;
      v46 = (const std::string *)((char *)v46 + 32);
    }
    while (v46 != v47);
  }
  return v73 > a3;
}

void sub_2166CC0A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _QWORD *v15;
  uint64_t v16;

  *v15 = v16;
  _Unwind_Resume(exception_object);
}

uint64_t **Phase::SpatialModeler::Scheduler::RunFullModelerQueries(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unsigned int v25;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[4];
  __int128 v30;
  unsigned int v31;

  v2 = *a2;
  v28 = (uint64_t *)a2[7];
  v3 = v28;
  a2[7] = 0;
  if (!v3)
    return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v28, 0);
  v6 = a1 + 3;
  v7 = (unsigned __int8 *)(v2 + 25);
LABEL_3:
  v8 = atomic_load(v7);
  v9 = v28;
  if ((v8 & 1) != 0)
  {
    v28 = (uint64_t *)a2[7];
    a2[7] = (uint64_t)v9;
    return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v28, 0);
  }
  v27 = (uint64_t *)v28[10];
  v28[10] = 0;
  v10 = *v9;
  while (2)
  {
    v11 = atomic_load((unsigned int *)v10);
    if (v11 == 6)
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*a1 + 72))(*a1, v10);
      atomic_store(0, (unsigned int *)(v10 + 104));
      atomic_store(5u, (unsigned int *)v10);
      v22 = *(_QWORD *)(v10 + 32);
      if (v22)
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v22 + 48))(v22, v10);
      goto LABEL_33;
    }
    v31 = 0;
    (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t))(*(_QWORD *)*a1 + 64))(v29, *a1, v10, v9[1]);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>>((uint64_t)&v30, (uint64_t)v29);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v29);
    if (v31 == -1)
      v12 = -1;
    else
      v12 = v31;
    switch(v12)
    {
      case 1:
        atomic_store(0, (unsigned int *)(v10 + 104));
        v25 = 3;
        goto LABEL_40;
      case 2:
        if (v31 != 2)
          std::__throw_bad_variant_access[abi:ne180100]();
        *(_OWORD *)(v10 + 48) = v30;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v23 = *(_QWORD *)(v10 + 32);
        if (v23)
          goto LABEL_31;
        goto LABEL_32;
      case 3:
        if (v31 != 3)
          std::__throw_bad_variant_access[abi:ne180100]();
        v13 = *(_QWORD *)(v10 + 64);
        if (v13)
        {
          v15 = (uint64_t *)*((_QWORD *)&v30 + 1);
          v14 = (uint64_t *)v30;
          if (((*((_QWORD *)&v30 + 1) - (_QWORD)v30) & 0x7FFFFFFF8) != 0)
          {
            v16 = (_QWORD *)v30;
            if ((_QWORD)v30 == *((_QWORD *)&v30 + 1))
              goto LABEL_27;
            while (*v16)
            {
              if (++v16 == *((_QWORD **)&v30 + 1))
              {
                do
                  Phase::Geometry::SceneQueryScheduler::RunQuery(a1[1] + 2280, v13, *v14++);
                while (v14 != v15);
                goto LABEL_27;
              }
            }
            *(_QWORD *)(v10 + 48) = 1;
            *(_QWORD *)(v10 + 56) = v6;
            atomic_store(0, (unsigned int *)(v10 + 104));
            atomic_store(4u, (unsigned int *)v10);
            v23 = *(_QWORD *)(v10 + 32);
            if (!v23)
              goto LABEL_32;
          }
          else
          {
            *(_QWORD *)(v10 + 48) = 1;
            *(_QWORD *)(v10 + 56) = v6;
            atomic_store(0, (unsigned int *)(v10 + 104));
            atomic_store(4u, (unsigned int *)v10);
            v23 = *(_QWORD *)(v10 + 32);
            if (!v23)
              goto LABEL_32;
          }
        }
        else
        {
          *(_QWORD *)(v10 + 48) = 8;
          *(_QWORD *)(v10 + 56) = v6;
          atomic_store(0, (unsigned int *)(v10 + 104));
          atomic_store(4u, (unsigned int *)v10);
          v23 = *(_QWORD *)(v10 + 32);
          if (!v23)
            goto LABEL_32;
        }
        goto LABEL_31;
      case 4:
        if (v31 != 4)
          std::__throw_bad_variant_access[abi:ne180100]();
        v20 = v30;
        if ((_QWORD)v30)
        {
          v9[9] = v30;
          v21 = atomic_load((unsigned int *)(v10 + 104));
          if (!*(_DWORD *)(v20 + 64))
          {
            *(_DWORD *)(v20 + 64) = v21;
            goto LABEL_27;
          }
        }
        *(_QWORD *)(v10 + 48) = 1;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v23 = *(_QWORD *)(v10 + 32);
        if (v23)
          goto LABEL_31;
        goto LABEL_32;
      case 5:
        if (v31 != 5)
          std::__throw_bad_variant_access[abi:ne180100]();
        v17 = (_QWORD *)v30;
        if ((_QWORD)v30 == v9[9])
        {
          *(_DWORD *)(v30 + 64) = 0;
          v18 = (void *)v17[9];
          v19 = (void *)v17[10];
          v17[10] = 0;
          v17[11] = 0;
          v17[9] = 0;
          v9[9] = 0;
          if (v19 != v18)
            std::terminate();
          if (v18)
            operator delete(v18);
LABEL_27:
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v30);
          continue;
        }
        *(_QWORD *)(v10 + 48) = 12;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v23 = *(_QWORD *)(v10 + 32);
        if (v23)
LABEL_31:
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v23 + 48))(v23, v10);
LABEL_32:
        std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v30);
LABEL_33:
        v24 = v27;
        v27 = v28;
        v28 = v24;
        std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v27, 0);
        if (v28)
          goto LABEL_3;
        return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v28, 0);
      default:
        *(_QWORD *)(v10 + 48) = 1;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        v25 = 4;
LABEL_40:
        atomic_store(v25, (unsigned int *)v10);
        v23 = *(_QWORD *)(v10 + 32);
        if (v23)
          goto LABEL_31;
        goto LABEL_32;
    }
  }
}

void sub_2166CC51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  __cxa_end_catch();
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&a15);
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a9, 0);
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a10, 0);
  _Unwind_Resume(a1);
}

uint64_t **Phase::SpatialModeler::Scheduler::RunPartialModelerQueries(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  _QWORD *i;
  uint64_t v20;
  uint64_t NextStage;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  unsigned int v30;
  unsigned int *v31;
  unint64_t v32;
  _DWORD *v33;
  unsigned int *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned int v42;
  uint64_t *v43;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD v47[4];
  __int128 v48;
  uint64_t v49;
  unsigned int v50;

  v2 = *a2;
  v46 = (uint64_t *)a2[7];
  v3 = v46;
  a2[7] = 0;
  if (!v3)
    return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v46, 0);
  v6 = a1 + 3;
  v7 = (unsigned __int8 *)(v2 + 25);
LABEL_3:
  v8 = atomic_load(v7);
  v9 = v46;
  if ((v8 & 1) != 0)
  {
    v46 = (uint64_t *)a2[7];
    a2[7] = (uint64_t)v9;
    return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v46, 0);
  }
  v45 = (uint64_t *)v46[10];
  v46[10] = 0;
  v10 = *v9;
  while (2)
  {
    v11 = atomic_load((unsigned int *)v10);
    if (v11 == 6)
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*a1 + 72))(*a1, v10);
      atomic_store(0, (unsigned int *)(v10 + 104));
      atomic_store(5u, (unsigned int *)v10);
      v17 = *(_QWORD *)(v10 + 32);
      if (v17)
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v17 + 48))(v17, v10);
      goto LABEL_69;
    }
    v50 = 0;
    (*(void (**)(_QWORD *__return_ptr, _QWORD, uint64_t, uint64_t))(*(_QWORD *)*a1 + 64))(v47, *a1, v10, v9[1]);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>>((uint64_t)&v48, (uint64_t)v47);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v47);
    if (v50 == -1)
      v12 = -1;
    else
      v12 = v50;
    switch(v12)
    {
      case 1:
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(3u, (unsigned int *)v10);
        goto LABEL_34;
      case 2:
        if (v50 != 2)
          std::__throw_bad_variant_access[abi:ne180100]();
        *(_OWORD *)(v10 + 48) = v48;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v24 = *(_QWORD *)(v10 + 32);
        if (v24)
          goto LABEL_67;
        goto LABEL_68;
      case 3:
        if (v50 != 3)
          std::__throw_bad_variant_access[abi:ne180100]();
        if (!*(_QWORD *)(v10 + 64))
        {
          *(_QWORD *)(v10 + 48) = 8;
          *(_QWORD *)(v10 + 56) = v6;
          atomic_store(0, (unsigned int *)(v10 + 104));
          atomic_store(4u, (unsigned int *)v10);
          v24 = *(_QWORD *)(v10 + 32);
          if (!v24)
            goto LABEL_68;
          goto LABEL_67;
        }
        v18 = v48;
        if (((*((_QWORD *)&v48 + 1) - (_QWORD)v48) & 0x7FFFFFFF8) != 0)
        {
          for (i = (_QWORD *)v48; i != *((_QWORD **)&v48 + 1); ++i)
          {
            if (!*i)
            {
              *(_QWORD *)(v10 + 48) = 1;
              *(_QWORD *)(v10 + 56) = v6;
              atomic_store(0, (unsigned int *)(v10 + 104));
              atomic_store(4u, (unsigned int *)v10);
              v24 = *(_QWORD *)(v10 + 32);
              if (!v24)
                goto LABEL_68;
              goto LABEL_67;
            }
          }
          v48 = *((_OWORD *)v9 + 3);
          *((_OWORD *)v9 + 3) = v18;
          v20 = v49;
          v49 = v9[8];
          v9[8] = v20;
          NextStage = Phase::SpatialModeler::Scheduler::GetNextStage((uint64_t)a2, 1);
          if (NextStage)
          {
            v22 = v46;
            v23 = (uint64_t *)v46[10];
            v46[10] = *(_QWORD *)(NextStage + 56);
            *(_QWORD *)(NextStage + 56) = v22;
            v46 = v23;
            goto LABEL_68;
          }
          v40 = 11;
        }
        else
        {
          v40 = 1;
        }
        *(_QWORD *)(v10 + 48) = v40;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v24 = *(_QWORD *)(v10 + 32);
        if (!v24)
          goto LABEL_68;
        goto LABEL_67;
      case 4:
        if (v50 != 4)
          std::__throw_bad_variant_access[abi:ne180100]();
        v13 = v48;
        if ((_QWORD)v48)
        {
          v9[9] = v48;
          v14 = atomic_load((unsigned int *)(v10 + 104));
          if (*(_DWORD *)(v13 + 64))
          {
            v26 = Phase::SpatialModeler::Scheduler::GetNextStage((uint64_t)a2, 3);
            if (v26)
            {
              v27 = v46;
              v28 = (uint64_t *)v46[10];
              v46[10] = *(_QWORD *)(v26 + 56);
              *(_QWORD *)(v26 + 56) = v27;
              v46 = v28;
              v29 = (_QWORD *)v48;
              v30 = atomic_load((unsigned int *)(v10 + 104));
              v31 = (unsigned int *)v29[10];
              v32 = v29[11];
              if ((unint64_t)v31 >= v32)
              {
                v34 = *(unsigned int **)(v48 + 72);
                v35 = v31 - v34;
                if ((unint64_t)(v35 + 1) >> 62)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v36 = v32 - (_QWORD)v34;
                v37 = (uint64_t)(v32 - (_QWORD)v34) >> 1;
                if (v37 <= v35 + 1)
                  v37 = v35 + 1;
                if (v36 >= 0x7FFFFFFFFFFFFFFCLL)
                  v38 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v38 = v37;
                if (v38)
                {
                  v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v48 + 88, v38);
                  v34 = (unsigned int *)v29[9];
                  v31 = (unsigned int *)v29[10];
                }
                else
                {
                  v39 = 0;
                }
                v41 = (unsigned int *)&v39[4 * v35];
                *v41 = v30;
                v33 = v41 + 1;
                while (v31 != v34)
                {
                  v42 = *--v31;
                  *--v41 = v42;
                }
                v29[9] = v41;
                v29[10] = v33;
                v29[11] = &v39[4 * v38];
                if (v34)
                  operator delete(v34);
              }
              else
              {
                *v31 = v30;
                v33 = v31 + 1;
              }
              v29[10] = v33;
              goto LABEL_68;
            }
            v25 = 11;
            goto LABEL_45;
          }
          *(_DWORD *)(v13 + 64) = v14;
LABEL_18:
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v48);
          continue;
        }
        v25 = 1;
LABEL_45:
        *(_QWORD *)(v10 + 48) = v25;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
        v24 = *(_QWORD *)(v10 + 32);
        if (v24)
LABEL_67:
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v24 + 48))(v24, v10);
LABEL_68:
        std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v48);
LABEL_69:
        v43 = v45;
        v45 = v46;
        v46 = v43;
        std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v45, 0);
        if (v46)
          goto LABEL_3;
        return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v46, 0);
      case 5:
        if (v50 != 5)
          std::__throw_bad_variant_access[abi:ne180100]();
        v15 = (_QWORD *)v48;
        if ((_QWORD)v48 != v9[9])
        {
          *(_QWORD *)(v10 + 48) = 12;
          *(_QWORD *)(v10 + 56) = v6;
          atomic_store(0, (unsigned int *)(v10 + 104));
          atomic_store(4u, (unsigned int *)v10);
          v24 = *(_QWORD *)(v10 + 32);
          if (v24)
            goto LABEL_67;
          goto LABEL_68;
        }
        *(_DWORD *)(v48 + 64) = 0;
        v16 = (void *)v15[9];
        v15[10] = 0;
        v15[11] = 0;
        v15[9] = 0;
        v9[9] = 0;
        if (v16)
          operator delete(v16);
        goto LABEL_18;
      default:
        *(_QWORD *)(v10 + 48) = 1;
        *(_QWORD *)(v10 + 56) = v6;
        atomic_store(0, (unsigned int *)(v10 + 104));
        atomic_store(4u, (unsigned int *)v10);
LABEL_34:
        v24 = *(_QWORD *)(v10 + 32);
        if (v24)
          goto LABEL_67;
        goto LABEL_68;
    }
  }
}

void sub_2166CCABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  __cxa_end_catch();
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,Phase::SpatialModeler::ReturnSuccess,Phase::SpatialModeler::ReturnError,Phase::SpatialModeler::WaitOnSceneQueries,Phase::SpatialModeler::ClaimOrWaitOnToken,Phase::SpatialModeler::ReleaseToken>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&a15);
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a9, 0);
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a10, 0);
  _Unwind_Resume(a1);
}

uint64_t **Phase::SpatialModeler::Scheduler::RunSceneQueries(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t NextStage;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v22;
  uint64_t *v23;

  v2 = *a2;
  v23 = (uint64_t *)a2[7];
  v3 = v23;
  a2[7] = 0;
  if (v3)
  {
    v6 = a1 + 24;
    v7 = (unsigned __int8 *)(v2 + 25);
    while (1)
    {
      v8 = atomic_load(v7);
      v9 = v23;
      if ((v8 & 1) != 0)
        break;
      v22 = (uint64_t *)v23[10];
      v23[10] = 0;
      v10 = (uint64_t *)v9[6];
      v11 = (uint64_t *)v9[7];
      if (v10 != v11)
      {
        v12 = *(_QWORD *)(*v9 + 64);
        do
          Phase::Geometry::SceneQueryScheduler::RunQuery(*(_QWORD *)(a1 + 8) + 2280, v12, *v10++);
        while (v10 != v11);
      }
      NextStage = Phase::SpatialModeler::Scheduler::GetNextStage((uint64_t)a2, 2);
      if (NextStage)
      {
        v14 = v23;
        v15 = (uint64_t *)v23[10];
        v23[10] = *(_QWORD *)(NextStage + 56);
        *(_QWORD *)(NextStage + 56) = v14;
        v23 = v15;
      }
      else
      {
        v16 = v9[9];
        if (v16)
        {
          *(_DWORD *)(v16 + 64) = 0;
          v17 = *(void **)(v16 + 72);
          *(_QWORD *)(v16 + 80) = 0;
          *(_QWORD *)(v16 + 88) = 0;
          *(_QWORD *)(v16 + 72) = 0;
          if (v17)
            operator delete(v17);
          v9[9] = 0;
        }
        v18 = *v9;
        *(_QWORD *)(v18 + 48) = 11;
        *(_QWORD *)(v18 + 56) = v6;
        atomic_store(0, (unsigned int *)(v18 + 104));
        atomic_store(4u, (unsigned int *)v18);
        v19 = *(_QWORD *)(v18 + 32);
        if (v19)
          (*(void (**)(uint64_t))(*(_QWORD *)v19 + 48))(v19);
      }
      v20 = v22;
      v22 = v23;
      v23 = v20;
      std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v22, 0);
      if (!v23)
        return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v23, 0);
    }
    v23 = (uint64_t *)a2[7];
    a2[7] = (uint64_t)v9;
  }
  return std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&v23, 0);
}

void sub_2166CCC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10)
{
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a9, 0);
  std::unique_ptr<Phase::SpatialModeler::ActiveQuery>::reset[abi:ne180100](&a10, 0);
  _Unwind_Resume(a1);
}

void Phase::SpatialModeler::RunCommandsOnGraphNode(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, unsigned __int8 **a6)
{
  void (*v8)(_QWORD *, unsigned __int8 **);
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  char v27;
  int v28;
  const char *v29;
  char v30;
  const char *v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  _BYTE buf[18];
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _QWORD *v44;
  uint64_t v45;

  v8 = (void (*)(_QWORD *, unsigned __int8 **))a1;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = *a6;
  v9 = a6[1];
  v11 = *(_QWORD *)*a6;
  v12 = v11 + 192 * (_QWORD)v9;
  v13 = (_QWORD *)(v12 + 64);
  if (*(_QWORD *)(v12 + 64))
  {
    atomic_store(1u, v10 + 24);
    Phase::SortedCommandQueue<Phase::SpatialModeler::PriorityQueue,Phase::SpatialModeler::PriorityQueueCommandType,std::variant<std::monostate,Phase::SpatialModeler::PriorityQueueEntry,Phase::UniqueObjectId,Phase::SpatialModeler::PriorityQueueClusterIndexUpdate,Phase::SpatialModeler::PriorityQueueGlobals>>::ExecuteCommands((unint64_t *)(*v13 + 216));
    if (a4)
    {
      v16 = *(unint64_t **)(v11 + 192 * (_QWORD)v9 + 136);
      if (!v16)
        std::terminate();
      v17 = v16[2];
      do
        v18 = __ldaxr(v16);
      while (__stlxr(v17, v16));
      v16[2] = v18;
      if (v18 && !*(_BYTE *)(v18 + 24))
      {
        std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100](v11 + 192 * (_QWORD)v9 + 152, (__int128 *)v18);
        v19 = v16[2];
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100](v19, (__int128 *)buf);
        v20 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        *(_BYTE *)(v19 + 24) = 1;
      }
      v23 = *(_QWORD *)(*v13 + 112);
      if (v23)
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v23 + 48))(v23, *v13, v12);
    }
    v24 = (_QWORD *)(a3 + (a2 >> 1));
    if ((a2 & 1) != 0)
      v8 = *(void (**)(_QWORD *, unsigned __int8 **))(*v24 + v8);
    v8(v24, a6);
    if (a5)
    {
      v25 = *(_QWORD *)(*v13 + 144);
      if (v25)
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v25 + 48))(v25, *v13, v12);
    }
    atomic_store(0, v10 + 24);
  }
  else
  {
    if (a2)
      v26 = (a2 & 1 | a1) == 0;
    else
      v26 = 1;
    v27 = v26;
    if ((uint64_t **(*)(_QWORD *, uint64_t *))a1 == Phase::SpatialModeler::Scheduler::RunFullModelerQueries
      && (v27 & 1) != 0)
    {
      v28 = a5;
      v29 = "RunFullModelerQueries";
    }
    else
    {
      v28 = a5;
      if ((uint64_t **(*)(_QWORD *, uint64_t *))a1 == Phase::SpatialModeler::Scheduler::RunPartialModelerQueries)
        v30 = v27;
      else
        v30 = 0;
      if (((a1 == (_QWORD)Phase::SpatialModeler::Scheduler::RunSceneQueries) & v27) != 0)
        v31 = "RunSceneQueries";
      else
        v31 = "Unknown";
      if ((v30 & 1) != 0)
        v29 = "RunPartialModelerQueries";
      else
        v29 = v31;
    }
    v32 = v11 + 192 * (_QWORD)v9;
    v33 = (_QWORD *)(v32 + 8);
    if (*(char *)(v32 + 31) < 0)
      v33 = (_QWORD *)*v33;
    v34 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 224);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "SpatialModelerScheduler.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 95;
      v37 = 2080;
      v38 = v29;
      v39 = 1024;
      v40 = a4;
      v41 = 1024;
      v42 = v28;
      v43 = 2080;
      v44 = v33;
      _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d RunCommandsOnGraphNode (Function:%s, isFirstNode:%i, isFinalNode:%i): Graph (%s) has no Priority Queue.", buf, 0x32u);
    }
  }
}

uint64_t Phase::SpatialModeler::Scheduler::GetNextStage(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = **(_QWORD **)a1 + 192 * *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(v2 + 168);
  v4 = 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v2 + 176) - v3) >> 5);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 == v4)
    return 0;
  v6 = 3 * v5;
  result = v3 + 32 * v6;
  v8 = 96 * v4 - 32 * v6;
  while ((*(_QWORD *)(result + 48) & (1 << a2)) == 0)
  {
    result += 96;
    v8 -= 96;
    if (!v8)
      return 0;
  }
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*,Phase::SpatialModeler::GraphDescriptionNode*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  std::string *v8;
  _QWORD v10[3];
  char v11;
  std::string *v12;
  std::string *v13;

  v4 = this;
  v12 = this;
  v13 = this;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  v11 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v8 = v13;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        v8 = v4;
      }
      v4[1].__r_.__value_.__r.__words[0] = *((_QWORD *)v6 + 3);
      v6 += 2;
      v4 = (std::string *)((char *)v8 + 32);
      v13 = (std::string *)((char *)v8 + 32);
    }
    while (v6 != a3);
  }
  v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_2166CD0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>,Phase::SpatialModeler::GraphDescriptionNode*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t i;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 8);
    for (i = **(_QWORD **)(a1 + 16); i != v3; i -= 32)
    {
      if (*(char *)(i - 9) < 0)
        operator delete(*(void **)(i - 32));
    }
  }
  return a1;
}

std::string *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,Phase::SpatialModeler::GraphDescriptionNode *,0>(std::string *__str, std::string *a2, std::string *this)
{
  std::string *v5;

  if (__str != a2)
  {
    v5 = __str;
    do
    {
      std::string::operator=(this, v5);
      this[1].__r_.__value_.__r.__words[0] = v5[1].__r_.__value_.__r.__words[0];
      this = (std::string *)((char *)this + 32);
      v5 = (std::string *)((char *)v5 + 32);
    }
    while (v5 != a2);
  }
  return this;
}

void std::vector<Phase::SpatialModeler::Graph>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

uint64_t std::vector<Phase::SpatialModeler::Graph>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Phase::SpatialModeler::Graph>,std::reverse_iterator<Phase::SpatialModeler::Graph*>,std::reverse_iterator<Phase::SpatialModeler::Graph*>,std::reverse_iterator<Phase::SpatialModeler::Graph*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::Graph>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x155555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(192 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Phase::SpatialModeler::Graph>,std::reverse_iterator<Phase::SpatialModeler::Graph*>,std::reverse_iterator<Phase::SpatialModeler::Graph*>,std::reverse_iterator<Phase::SpatialModeler::Graph*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (a3 != a5)
  {
    v11 = 0;
    do
    {
      v12 = a7 + v11;
      v13 = a3 + v11;
      *(_QWORD *)(v12 - 192) = *(_QWORD *)(a3 + v11 - 192);
      v14 = *(_OWORD *)(a3 + v11 - 184);
      *(_QWORD *)(v12 - 168) = *(_QWORD *)(a3 + v11 - 168);
      *(_OWORD *)(v12 - 184) = v14;
      *(_QWORD *)(v13 - 176) = 0;
      *(_QWORD *)(v13 - 168) = 0;
      *(_QWORD *)(v13 - 184) = 0;
      *(_QWORD *)(v12 - 160) = 0;
      *(_QWORD *)(v12 - 152) = 0;
      *(_QWORD *)(v12 - 144) = 0;
      *(_OWORD *)(v12 - 160) = *(_OWORD *)(a3 + v11 - 160);
      *(_QWORD *)(v12 - 144) = *(_QWORD *)(a3 + v11 - 144);
      *(_QWORD *)(v13 - 160) = 0;
      *(_QWORD *)(v13 - 152) = 0;
      *(_QWORD *)(v13 - 144) = 0;
      *(_OWORD *)(v12 - 136) = *(_OWORD *)(a3 + v11 - 136);
      std::__function::__value_func<void ()(Phase::SpatialModeler::Graph &)>::__value_func[abi:ne180100](a7 + v11 - 120, a3 + v11 - 120);
      std::__function::__value_func<void ()(Phase::SpatialModeler::Graph &)>::__value_func[abi:ne180100](a7 + v11 - 88, a3 + v11 - 88);
      *(_OWORD *)(v12 - 56) = *(_OWORD *)(a3 + v11 - 56);
      *(_QWORD *)(v13 - 56) = 0;
      *(_QWORD *)(v13 - 48) = 0;
      *(_OWORD *)(v12 - 40) = *(_OWORD *)(a3 + v11 - 40);
      *(_QWORD *)(v13 - 40) = 0;
      *(_QWORD *)(v13 - 32) = 0;
      *(_QWORD *)(v12 - 24) = 0;
      *(_QWORD *)(v12 - 16) = 0;
      *(_QWORD *)(v12 - 8) = 0;
      *(_OWORD *)(v12 - 24) = *(_OWORD *)(a3 + v11 - 24);
      *(_QWORD *)(v12 - 8) = *(_QWORD *)(a3 + v11 - 8);
      *(_QWORD *)(v13 - 24) = 0;
      *(_QWORD *)(v13 - 16) = 0;
      *(_QWORD *)(v13 - 8) = 0;
      v11 -= 192;
    }
    while (a3 + v11 != a5);
  }
  return a6;
}

uint64_t std::__function::__value_func<void ()(Phase::SpatialModeler::Graph &)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

void **std::__split_buffer<Phase::SpatialModeler::Graph>::~__split_buffer(void **a1)
{
  std::__split_buffer<Phase::SpatialModeler::Graph>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<Phase::SpatialModeler::Graph>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 192;
    std::allocator<Phase::SpatialModeler::Graph>::destroy[abi:ne180100](v4, i - 192);
  }
}

uint64_t std::vector<Phase::SpatialModeler::Graph>::__emplace_back_slow_path<Phase::SpatialModeler::GraphSequence &>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void *v14[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 6);
  v5 = v4 + 1;
  if (v4 + 1 > 0x155555555555555)
    std::vector<Phase::SpatialModeler::Graph>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 6);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0xAAAAAAAAAAAAAALL)
    v9 = 0x155555555555555;
  else
    v9 = v5;
  v14[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::Graph>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[192 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[192 * v9];
  *(_QWORD *)v11 = a2;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *((_QWORD *)v11 + 7) = -1;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 12) = 0;
  *((_OWORD *)v11 + 8) = 0u;
  *((_OWORD *)v11 + 9) = 0u;
  *((_OWORD *)v11 + 10) = 0u;
  *((_OWORD *)v11 + 11) = 0u;
  v14[2] = v11 + 192;
  std::vector<Phase::SpatialModeler::Graph>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<Phase::SpatialModeler::Graph>::~__split_buffer(v14);
  return v12;
}

void sub_2166CD540(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<Phase::SpatialModeler::Graph>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<Phase::SpatialModeler::GraphNode>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  if (v4 != *result)
  {
    v7 = 0;
    v8 = result[1];
    while (1)
    {
      v9 = v6 + v7;
      v10 = v4 + v7;
      v11 = *(_OWORD *)(v4 + v7 - 96);
      *(_QWORD *)(v9 - 80) = *(_QWORD *)(v4 + v7 - 80);
      *(_OWORD *)(v9 - 96) = v11;
      v12 = *(_OWORD *)(v4 + v7 - 72);
      *(_QWORD *)(v9 - 56) = *(_QWORD *)(v4 + v7 - 56);
      *(_OWORD *)(v9 - 72) = v12;
      *(_QWORD *)(v10 - 64) = 0;
      *(_QWORD *)(v10 - 56) = 0;
      *(_QWORD *)(v10 - 72) = 0;
      *(_QWORD *)(v9 - 48) = *(_QWORD *)(v4 + v7 - 48);
      v13 = *(_QWORD *)(v4 + v7 - 40);
      *(_QWORD *)(v10 - 40) = 0;
      *(_QWORD *)(v9 - 40) = v13;
      v14 = *(_QWORD *)(v4 + v7 - 8);
      if (v14)
      {
        if (v10 - 32 == v14)
        {
          *(_QWORD *)(v9 - 8) = v9 - 32;
          result = (uint64_t *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v10 - 8) + 24))(*(_QWORD *)(v10 - 8));
          goto LABEL_9;
        }
        v15 = (_QWORD *)(v8 - 8);
        *(_QWORD *)(v9 - 8) = v14;
      }
      else
      {
        v15 = (_QWORD *)(v9 - 8);
      }
      *v15 = 0;
LABEL_9:
      v8 -= 96;
      v7 -= 96;
      if (v4 + v7 == v5)
      {
        v6 += v7;
        break;
      }
    }
  }
  a2[1] = v6;
  v16 = *v3;
  *v3 = v6;
  a2[1] = v16;
  v17 = v3[1];
  v3[1] = a2[2];
  a2[2] = v17;
  v18 = v3[2];
  v3[2] = a2[3];
  a2[3] = v18;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphNode>>(unint64_t a1)
{
  if (a1 >= 0x2AAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(96 * a1);
}

uint64_t std::__split_buffer<Phase::SpatialModeler::GraphNode>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 16) = i - 96;
    std::allocator<Phase::SpatialModeler::GraphNode>::destroy[abi:ne180100](v4, i - 96);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_24D581518;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24D581518;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a2);
}

void std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_24D581560;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24D581560;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (*)(void (Phase::SpatialModeler::Scheduler::*)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL,BOOL,Phase::SpatialModeler::GraphNode &),void (Phase::SpatialModeler::Scheduler::* const&)(Phase::SpatialModeler::GraphNode &),Phase::SpatialModeler::Scheduler*,BOOL const&,BOOL const&,std::placeholders::__ph<1> const&>>,void ()(Phase::SpatialModeler::GraphNode &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a2);
}

Phase::Controller::SpeechDetector::SpeechDetectorImpl *std::unique_ptr<Phase::Controller::SpeechDetector::SpeechDetectorImpl>::reset[abi:ne180100](Phase::Controller::SpeechDetector::SpeechDetectorImpl **a1, Phase::Controller::SpeechDetector::SpeechDetectorImpl *a2)
{
  Phase::Controller::SpeechDetector::SpeechDetectorImpl *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Phase::Controller::SpeechDetector::SpeechDetectorImpl::~SpeechDetectorImpl(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

uint64_t Phase::Controller::SpeechDetector::SpeechDetectorImpl::ProcessAndGetLatest(float *a1, _DWORD *a2, float *a3)
{
  unint64_t v6;
  _QWORD *v7;
  int SpeechProbabilityHardValue;
  uint64_t result;
  float v10;
  float v11;

  if (*a2)
  {
    v6 = 0;
    v7 = a2 + 4;
    while (!Phase::Controller::Vad_Process(*(_QWORD *)a1, *v7, *((_DWORD *)v7 - 1) >> 2))
    {
      ++v6;
      v7 += 2;
      if (v6 >= *a2)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v11 = 0.0;
    SpeechProbabilityHardValue = Phase::Controller::Vad_GetSpeechProbabilityHardValue(*(_QWORD *)a1, &v11);
    result = 0;
    if (SpeechProbabilityHardValue)
      return result;
    v10 = v11;
    *a3 = v11;
    if (a1[2] != v10)
    {
      a1[2] = v10;
      return 1;
    }
  }
  return 0;
}

void Phase::Controller::SpeechDetector::SpeechDetectorImpl::~SpeechDetectorImpl(Phase::Controller::SpeechDetector::SpeechDetectorImpl *this)
{
  uint64_t v2;
  Phase::Logger *v3;
  int v4;
  NSObject *v5;
  Phase::Logger *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  Phase::Controller::SpeechDetector::SpeechDetectorImpl *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)this;
  if (v2)
  {
    v10 = 0;
    off_254E449A8(v2, &v10);
    if (v10)
    {
      v3 = (Phase::Logger *)off_254E449B0(*(_QWORD *)this);
      v4 = (int)v3;
      if ((_DWORD)v3)
      {
        v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 912));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v12 = "SpeechDetector.mm";
          v13 = 1024;
          v14 = 118;
          v15 = 1024;
          LODWORD(v16) = v4;
          _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to uninitialize VAD Speech Detector, err = %d", buf, 0x18u);
        }
      }
    }
    v6 = (Phase::Logger *)off_254E449B8(*(_QWORD *)this);
    v7 = (int)v6;
    if ((_DWORD)v6)
    {
      v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 912));
      v6 = (Phase::Logger *)os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v6)
      {
        *(_DWORD *)buf = 136315650;
        v12 = "SpeechDetector.mm";
        v13 = 1024;
        v14 = 126;
        v15 = 1024;
        LODWORD(v16) = v7;
        _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to destroy VAD Speech Detector, err = %d", buf, 0x18u);
      }
    }
    *(_QWORD *)this = 0;
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 912));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "SpeechDetector.mm";
      v13 = 1024;
      v14 = 131;
      v15 = 2048;
      v16 = this;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed Speech Detector %p.", buf, 0x1Cu);
    }
  }
}

void sub_2166CDB84(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t *Phase::DspLayer::SpringGain::GetNewRegistryEntry(Phase::DspLayer::SpringGain *this)
{
  char *v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v6[2];
  char v7;
  void *__p[2];
  char v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (char *)malloc_type_malloc(0xA8uLL, 0x1050040B063AAFAuLL);
  *(_QWORD *)v1 = "Duration";
  *((_QWORD *)v1 + 1) = 0x500000000;
  *(_QWORD *)(v1 + 20) = 0x100000000;
  *((_DWORD *)v1 + 7) = 3;
  *((_OWORD *)v1 + 2) = xmmword_21673AF40;
  *((_QWORD *)v1 + 6) = 0x3F91111120000000;
  *((_QWORD *)v1 + 7) = "Target";
  *((_QWORD *)v1 + 8) = 0x500000001;
  *(_QWORD *)(v1 + 76) = 0x100000000;
  *((_DWORD *)v1 + 21) = 3;
  *(_OWORD *)(v1 + 88) = xmmword_2166F7470;
  *((_QWORD *)v1 + 13) = 0x3FF0000000000000;
  *((_QWORD *)v1 + 14) = "Damping Constant";
  *((_QWORD *)v1 + 15) = 0x500000002;
  *(_QWORD *)(v1 + 132) = 0x100000000;
  *((_DWORD *)v1 + 35) = 3;
  *((_OWORD *)v1 + 9) = xmmword_21673A730;
  *((_QWORD *)v1 + 20) = 0x3FF0000000000000;
  v2 = (uint64_t *)operator new();
  v10[0] = &off_24D5816A0;
  v11 = v10;
  Phase::Controller::VoicePoolEntry::VoicePoolEntry((uint64_t)v2, "SpringGain", 3, (uint64_t)v1, (uint64_t)v10);
  v3 = v11;
  if (v11 == v10)
  {
    v4 = 4;
    v3 = v10;
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  std::string::basic_string[abi:ne180100]<0>(__p, "Input");
  Phase::Controller::VoicePoolEntry::AddInput(v2, (__int128 *)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(v6, "Output");
  Phase::Controller::VoicePoolEntry::AddOutput(v2, (__int128 *)v6);
  if (v7 < 0)
    operator delete(v6[0]);
  return v2;
}

void sub_2166CDD74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Phase::DspLayer::SpringGain::~SpringGain(Phase::DspLayer::SpringGain *this)
{
  Phase::DspLayer::VoicePool::~VoicePool(this);
  JUMPOUT(0x2199F9D70);
}

void `anonymous namespace'::SpringGainSlice::~SpringGainSlice(_anonymous_namespace_::SpringGainSlice *this)
{
  JUMPOUT(0x2199F9D70);
}

double `anonymous namespace'::SpringGainSlice::Reset(int32x4_t *this, Phase::DspLayer::VoiceEngine *a2)
{
  uint64_t v3;
  uint64_t v9;
  double result;
  int32x4_t v11;
  __int128 v12;
  uint64_t v13;

  v3 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  __asm { FMOV            V1.4S, #1.0 }
  this[1] = vdupq_n_s32(0x3C888889u);
  this[2] = _Q1;
  this[3] = _Q1;
  this[4] = 0u;
  this[261] = 0u;
  this[523] = 0u;
  this[524] = 0u;
  v11 = _Q1;
  v12 = xmmword_2166F7490;
  do
  {
    this[523].i32[*(int *)((char *)&v11 + v3 * 4 + 16)] = v11.i32[v3];
    ++v3;
  }
  while (v3 != 4);
  v9 = 0;
  v12 = xmmword_2166F7490;
  v11 = 0uLL;
  do
  {
    this[524].i32[*(int *)((char *)&v11 + v9 * 4 + 16)] = v11.i32[v9];
    ++v9;
  }
  while (v9 != 4);
  (*(void (**)(int32x4_t *, Phase::DspLayer::VoiceEngine *))(this->i64[0] + 48))(this, a2);
  result = 0.0;
  this[526] = 0u;
  this[525] = 0u;
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::Reset(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _DWORD *v7;
  uint64_t result;

  v7 = (_DWORD *)(a1 + 4 * a3);
  v7[4] = 1015580809;
  v7[8] = 1065353216;
  v7[12] = 1065353216;
  v7[16] = 0;
  v7[1044] = 0;
  v7[2092] = 1065353216;
  v7[2096] = 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  *(_QWORD *)(a1 + 8 * a3 + 8400) = a4;
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::GetParameter(_anonymous_namespace_::SpringGainSlice *this, unsigned int a2)
{
  if (a2 > 2)
    return 9;
  else
    return 0;
}

uint64_t `anonymous namespace'::SpringGainSlice::SetParameter(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3, double a4)
{
  uint64_t result;
  float v6;
  float v7;
  float v8;

  if (a2 == 2)
  {
    result = 0;
    v7 = a4;
    *((float *)this + a3 + 12) = v7;
  }
  else if (a2 == 1)
  {
    result = 0;
    v8 = a4;
    *((float *)this + a3 + 8) = v8;
  }
  else if (a2)
  {
    return 9;
  }
  else
  {
    result = 0;
    v6 = a4;
    *((float *)this + a3 + 4) = v6;
  }
  return result;
}

__n128 `anonymous namespace'::SpringGainSlice::UpdateParameters(uint64_t a1)
{
  float32x4_t v2;
  __n128 result;
  __n128 v4;
  float32x4_t v5;
  float32x4_t v6;
  __int128 v7;

  v7 = *(_OWORD *)(a1 + 32);
  v2 = vdivq_f32((float32x4_t)vdupq_n_s32(0x40C90FDBu), *(float32x4_t *)(a1 + 16));
  v5 = vmulq_f32(v2, vaddq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 48)));
  v6 = vmulq_f32(v2, v2);
  v4 = *(__n128 *)(a1 + 4176);
  memcpy((void *)(a1 + 4192), (const void *)(a1 + 64), 0x1010uLL);
  *(float32x4_t *)(a1 + 8304) = v6;
  *(_OWORD *)(a1 + 8320) = v7;
  *(float32x4_t *)(a1 + 8336) = v5;
  result = v4;
  *(__n128 *)(a1 + 8352) = v4;
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::UpdateParameters(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  float v4;
  unsigned int v5;
  float v6;
  float v7;
  float v8;
  unsigned int v9;
  unsigned int *v10;
  uint64_t v11;
  _DWORD *v12;

  v3 = result + 4 * a3;
  v4 = *(float *)(v3 + 16);
  v5 = *(_DWORD *)(v3 + 32);
  if (v4 >= 0.001)
  {
    v6 = 6.2832 / v4;
    v7 = v6 * v6;
    v8 = v6 * (float)(*(float *)(v3 + 48) + *(float *)(v3 + 48));
    *(float *)(v3 + 8304) = v7;
    *(float *)(v3 + 8336) = v8;
  }
  else
  {
    *(_DWORD *)(v3 + 8384) = 0;
    *(_DWORD *)(v3 + 8368) = v5;
  }
  v9 = *(_DWORD *)(v3 + 4176);
  v10 = (unsigned int *)(result + 4 * a3);
  v11 = v10[16];
  v10[1048] = v11;
  if ((int)v11 >= 1)
  {
    v12 = (_DWORD *)(result + 4 * a3);
    do
    {
      v12[1052] = v12[20];
      v12[1056] = v12[24];
      v12 += 8;
      --v11;
    }
    while (v11);
  }
  v10[2080] = v5;
  v10[2088] = v9;
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::Run(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  float v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  int64x2_t v8;
  uint64_t v9;
  float32x4_t *v10;
  float32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  unint64_t v16;
  float32x4_t v17;
  int8x16_t v18;

  v4 = *(float *)(a2 + 8);
  v5 = *(float32x4_t *)(result + 8368);
  v6 = vmlaq_n_f32(*(float32x4_t *)(result + 8384), vmlaq_f32(vmulq_f32(*(float32x4_t *)(result + 8384), vnegq_f32(*(float32x4_t *)(result + 8336))), vsubq_f32(*(float32x4_t *)(result + 8320), v5), *(float32x4_t *)(result + 8304)), v4);
  v7 = (int32x4_t)vandq_s8(*(int8x16_t *)(result + 4192), (int8x16_t)vcgtq_s32(vdupq_n_s32(a4), (int32x4_t)xmmword_2166F76B0));
  v8 = (int64x2_t)vcgtzq_s32(v7);
  if (vorrq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0])
  {
    v9 = *(_QWORD *)(a2 + 56);
    v10 = (float32x4_t *)(result + 4224);
    v11 = 0uLL;
    v12 = 0uLL;
    v13.i64[0] = 0x100000001;
    v13.i64[1] = 0x100000001;
    do
    {
      v14.i32[0] = *(_DWORD *)(v9 + 4 * v10[-1].i32[0]);
      v14.i32[1] = *(_DWORD *)(v9 + 4 * v10[-1].i32[1]);
      v14.i32[2] = *(_DWORD *)(v9 + 4 * v10[-1].i32[2]);
      v14.i32[3] = *(_DWORD *)(v9 + 4 * v10[-1].i32[3]);
      v11 = vmlaq_f32(v11, (float32x4_t)vandq_s8((int8x16_t)v8, v14), *v10);
      v12 = vaddq_s32(v12, v13);
      v8 = (int64x2_t)vcgtq_s32(v7, v12);
      v10 += 2;
    }
    while (vorrq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0]);
  }
  else
  {
    v11 = 0uLL;
  }
  v15 = vmlaq_n_f32(v5, v6, v4);
  HIDWORD(v16) = a4 - 1;
  LODWORD(v16) = a4 - 1;
  v17 = vmulq_f32(v15, v11);
  v18 = vandq_s8((int8x16_t)v17, vorrq_s8((int8x16_t)vcltzq_f32(v17), (int8x16_t)vcgezq_f32(v17)));
  switch((v16 >> 1))
  {
    case 0u:
      goto LABEL_10;
    case 1u:
      goto LABEL_9;
    case 3u:
      goto LABEL_8;
    case 7u:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8364)) = v18.i32[3];
LABEL_8:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8360)) = v18.i32[2];
LABEL_9:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8356)) = v18.i32[1];
LABEL_10:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8352)) = v18.i32[0];
      break;
    default:
      break;
  }
  *(float32x4_t *)(result + 8368) = v15;
  *(float32x4_t *)(result + 8384) = v6;
  return result;
}

float `anonymous namespace'::SpringGainSlice::CopyVoiceState(_anonymous_namespace_::SpringGainSlice *this, Phase::DspLayer::VoicePoolSlice *a2, unsigned int a3, unsigned int a4)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  int *v8;
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  _DWORD *v13;
  int *v14;
  int v15;
  char *v16;
  char *v17;
  float result;

  v4 = (_DWORD *)((char *)a2 + 4 * (int)a3);
  v5 = (_DWORD *)((char *)this + 4 * (int)a4);
  v5[4] = v4[4];
  v5[8] = v4[8];
  v5[12] = v4[12];
  v6 = v4[16];
  v5[16] = v6;
  if ((int)v6 >= 1)
  {
    v7 = (_DWORD *)((char *)this + 4 * (int)a4 + 96);
    v8 = (int *)((char *)a2 + 4 * (int)a3 + 96);
    do
    {
      *(v7 - 4) = *(v8 - 4);
      v9 = *v8;
      v8 += 8;
      *v7 = v9;
      v7 += 8;
      --v6;
    }
    while (v6);
  }
  v10 = (_DWORD *)((char *)this + 4 * (int)a4);
  v11 = (_DWORD *)((char *)a2 + 4 * (int)a3);
  v12 = v11[1048];
  v10[1048] = v12;
  if ((int)v12 >= 1)
  {
    v13 = v10 + 1056;
    v14 = v11 + 1056;
    do
    {
      *(v13 - 4) = *(v14 - 4);
      v15 = *v14;
      v14 += 8;
      *v13 = v15;
      v13 += 8;
      --v12;
    }
    while (v12);
  }
  v10[1044] = v11[1044];
  v10[2076] = v11[2076];
  v10[2080] = v11[2080];
  v10[2084] = v11[2084];
  v10[2088] = v11[2088];
  if (a3 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 507, "fromLane >= 0 && fromLane < PHASE_SIMD_WIDTH");
  if (a4 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 508, "toLane >= 0 && toLane < PHASE_SIMD_WIDTH");
  v16 = (char *)a2 + 4 * a3;
  v17 = (char *)this + 4 * a4;
  *((_DWORD *)v17 + 2092) = *((_DWORD *)v16 + 2092);
  result = *((float *)v16 + 2096);
  *((float *)v17 + 2096) = result;
  *((_QWORD *)this + (int)a4 + 1050) = *((_QWORD *)a2 + (int)a3 + 1050);
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::AddInput(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  char *v7;
  uint64_t v8;
  char *v9;

  if (a2)
    return 8;
  v7 = (char *)this + 64;
  v8 = *((int *)this + a3 + 16);
  if ((int)v8 > 127)
    return 6;
  result = 0;
  v9 = (char *)this + 32 * v8 + 4 * a3;
  *((_DWORD *)v9 + 20) = a4;
  *((float *)v9 + 24) = a5;
  *(_DWORD *)&v7[4 * a3] = v8 + 1;
  return result;
}

uint64_t `anonymous namespace'::SpringGainSlice::RemoveInput(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3, int a4)
{
  if (a2)
    return 8;
  else
    return Phase::DspLayer::VoiceConnectionList<128>::RemoveConnection((uint64_t)this + 64, a3, a4);
}

uint64_t `anonymous namespace'::SpringGainSlice::SetInputGain(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  float *i;

  if (a2)
    return 8;
  v6 = *((unsigned int *)this + a3 + 16);
  if ((int)v6 < 1)
    return 7;
  v7 = 0;
  for (i = (float *)((char *)this + 4 * a3 + 96); *((_DWORD *)i - 4) != a4; i += 8)
  {
    if (v6 == ++v7)
      return 7;
  }
  if ((v7 & 0x80000000) != 0)
    return 7;
  result = 0;
  *i = a5;
  return result;
}

void `anonymous namespace'::SpringGainSlice::GetInputs(_anonymous_namespace_::SpringGainSlice *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (a2)
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    Phase::DspLayer::VoiceConnectionList<128>::GetConnections((uint64_t)this + 64, a3, (char **)a4);
  }
}

uint64_t `anonymous namespace'::SpringGainSlice::ClearInputs(_anonymous_namespace_::SpringGainSlice *this, int a2)
{
  *((_DWORD *)this + a2 + 16) = 0;
  return 0;
}

uint64_t `anonymous namespace'::SpringGainSlice::GetMaximumInputConnectionCount(_anonymous_namespace_::SpringGainSlice *this, int a2)
{
  return (a2 == 0) << 7;
}

unint64_t `anonymous namespace'::SpringGainSlice::GetOutput(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3)
{
  if (a2)
    return 0xFFFFFFFF00000008;
  else
    return (unint64_t)*((unsigned int *)this + a3 + 1044) << 32;
}

uint64_t `anonymous namespace'::SpringGainSlice::SetOutput(_anonymous_namespace_::SpringGainSlice *this, int a2, int a3, int a4)
{
  uint64_t result;

  if (a2)
    return 8;
  result = 0;
  *((_DWORD *)this + a3 + 1044) = a4;
  return result;
}

void std::__function::__func<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *std::__function::__func<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24D5816A0;
  return result;
}

void std::__function::__func<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24D5816A0;
}

uint64_t std::__function::__func<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SpringGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::operator()(uint64_t a1, Phase::DspLayer::VoiceEngine **a2, int *a3)
{
  Phase::DspLayer::VoiceEngine *v3;
  int v4;
  uint64_t v5;
  int v6;
  Phase::DspLayer::VoiceEngine *v7;
  int32x4_t *v8;

  v3 = *a2;
  v4 = *a3;
  v5 = operator new();
  Phase::DspLayer::VoicePool::VoicePool((Phase::DspLayer::VoicePool *)v5, "SpringGain", v3, v4, 8432);
  *(_QWORD *)v5 = &off_24D5815A8;
  if (*(int *)(v5 + 40) >= 1)
  {
    v6 = 0;
    do
    {
      v7 = *(Phase::DspLayer::VoiceEngine **)(v5 + 32);
      v8 = (int32x4_t *)(*(_QWORD *)(v5 + 24) + *(int *)(v5 + 16) * (uint64_t)v6);
      v8->i64[0] = (uint64_t)&off_24D5815C8;
      v8->i64[1] = 0;
      bzero(&v8[4], 0x1010uLL);
      bzero(&v8[262], 0x1010uLL);
      ++v6;
    }
    while (v6 < *(_DWORD *)(v5 + 40));
  }
  return v5;
}

void sub_2166CE680(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199F9D70](v1, 0x10F1C408EBD29CELL);
  _Unwind_Resume(a1);
}

uint64_t Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>::~Matrix(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 248);
  if (v2)
  {
    *(_QWORD *)(a1 + 256) = v2;
    operator delete(v2);
  }
  std::__tree<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::__map_value_compare<std::pair<Phase::DspLayer::VoicePool *,long long>,std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::less<std::pair<Phase::DspLayer::VoicePool *,long long>>,true>,std::allocator<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>>>::destroy(*(_QWORD **)(a1 + 224));
  std::__tree<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::__map_value_compare<std::pair<Phase::DspLayer::VoicePool *,long long>,std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::less<std::pair<Phase::DspLayer::VoicePool *,long long>>,true>,std::allocator<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>>>::destroy(*(_QWORD **)(a1 + 176));
  std::__tree<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::__map_value_compare<std::pair<Phase::DspLayer::VoicePool *,long long>,std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::less<std::pair<Phase::DspLayer::VoicePool *,long long>>,true>,std::allocator<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>>>::destroy(*(_QWORD **)(a1 + 128));
  std::__tree<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::__map_value_compare<std::pair<Phase::DspLayer::VoicePool *,long long>,std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::less<std::pair<Phase::DspLayer::VoicePool *,long long>>,true>,std::allocator<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>>>::destroy(*(_QWORD **)(a1 + 72));
  std::__tree<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::__map_value_compare<std::pair<Phase::DspLayer::VoicePool *,long long>,std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>,std::less<std::pair<Phase::DspLayer::VoicePool *,long long>>,true>,std::allocator<std::__value_type<std::pair<Phase::DspLayer::VoicePool *,long long>,Phase::Controller::DVM::VoiceNode *>>>::destroy(*(_QWORD **)(a1 + 24));
  return a1;
}

void std::default_delete<Phase::Controller::StatisticsDatabase::Implementation>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (a2)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>>>::~__hash_table((uint64_t)(a2 + 1));

    JUMPOUT(0x2199F9D70);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      Phase::SampledMatrix::Matrix<double,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<int>,Phase::SampledMatrix::Dimension<double>,Phase::SampledMatrix::Dimension<float>,Phase::SampledMatrix::Dimension<int>>::~Matrix((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t Phase::Controller::StreamedSoundAssetInfo::InitWithURL(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, double a6, double a7, uint64_t a8, uint64_t a9)
{
  id v16;
  id v17;
  _BOOL8 v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  Phase::Logger *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = Phase::Controller::SoundAssetInfo::BaseInit(a1, 1, a2, a3, (_QWORD *)a9, a7);
  if (v18)
  {
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v18)
                                                                                        + 816)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 16);
      objc_msgSend(v16, "description");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315906;
      v47 = "StreamedSoundAssetInfo.mm";
      v48 = 1024;
      v49 = 43;
      v50 = 2048;
      v51 = v20;
      v52 = 2080;
      v53 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d StreamedSoundAssetInfo::InitWithURL for assetId %llu url: %s", buf, 0x26u);

    }
    if (v16)
    {
      *(_DWORD *)(a1 + 32) = 1;
      v41 = 0;
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:commonFormat:interleaved:error:", v16, 1, 0, &v41);
      v23 = v41;
      v24 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v22;

      if (v23)
      {
        v25 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = 0;

      }
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v16, "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        a9 = Phase::Controller::StreamedSoundAssetInfo::Initialize(a1, a3, objc_msgSend(v26, "UTF8String"), v17, a9, a6);

        if ((_DWORD)a9)
        {
          *(_DWORD *)(a1 + 32) = 4;
          a9 = 1;
        }
        goto LABEL_21;
      }
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "description");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("[AVAudioFile initForReading] failed on file '%@' with error '%@'"), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v35)
                                                                                          + 816)));
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = *(_QWORD *)(a1 + 16);
        v38 = objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v47 = "StreamedSoundAssetInfo.mm";
        v48 = 1024;
        v49 = 67;
        v50 = 2048;
        v51 = v37;
        v52 = 2080;
        v53 = v38;
        _os_log_impl(&dword_2164CC000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
      }

      if (a9)
      {
        v42 = *MEMORY[0x24BDD0FC8];
        v43 = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v39);
        *(_QWORD *)a9 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File URL was nil"));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v23)
                                                                                          + 816)));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 16);
        v29 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v47 = "StreamedSoundAssetInfo.mm";
        v48 = 1024;
        v49 = 47;
        v50 = 2048;
        v51 = v28;
        v52 = 2080;
        v53 = v29;
        _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
      }

      if (!a9)
        goto LABEL_21;
      v44 = *MEMORY[0x24BDD0FC8];
      v45 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920805, v30);
      *(_QWORD *)a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    a9 = 0;
LABEL_21:

    goto LABEL_22;
  }
  a9 = 0;
LABEL_22:

  return a9;
}

void sub_2166CEC80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamedSoundAssetInfo::Initialize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6)
{
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int16 v26;
  void *v27;
  int v28;
  void *v29;
  _BYTE *v30;
  unsigned __int16 v31;
  void *v32;
  Phase::Logger *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE *v40;
  Phase::Logger *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  Phase::Logger *v69;
  NSObject *v70;
  uint64_t v71;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  _BYTE buf[12];
  __int16 v87;
  int v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v73 = a4;
  objc_msgSend(*(id *)(a1 + 48), "processingFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "channelCount") == 1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "processingFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "channelCount") <= 1)
    {

      std::terminate();
    }
    objc_msgSend(*(id *)(a1 + 48), "processingFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isInterleaved");

    if (v14)
      goto LABEL_61;
  }
  objc_msgSend(*(id *)(a1 + 48), "processingFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "commonFormat");

  if (v16 != 1)
    goto LABEL_61;
  if (a6 > 0.0)
  {
    v17 = a2 == 0;
    if (v73)
    {
      v18 = v73;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "fileFormat");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "channelLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(a1 + 48);
      if (!v23)
      {
        objc_msgSend(v24, "fileFormat");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "channelCount") == 1)
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "fileFormat");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "channelCount");

          if (v47 != 2)
          {
            v67 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 48), "processingFormat");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "stringWithFormat:", CFSTR("Cannot synthesize audio channel layout for audio file '%s' with channel count %d."), a3, objc_msgSend(v68, "channelCount"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v70 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v69)
                                                                                                + 816)));
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = *(_QWORD *)(a1 + 16);
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
              v87 = 1024;
              v88 = 388;
              v89 = 2048;
              v90 = v71;
              v91 = 2080;
              v92 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
              _os_log_impl(&dword_2164CC000, v70, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
            }

            if (!a5)
            {
              v18 = 0;
              goto LABEL_58;
            }
            v78 = *MEMORY[0x24BDD0FC8];
            v79 = v21;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            goto LABEL_57;
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "fileFormat");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "channelCount");

        v50 = objc_alloc(MEMORY[0x24BDB17E8]);
        if (v49 == 1)
          v51 = 6553601;
        else
          v51 = 6619138;
        v18 = (id)objc_msgSend(v50, "initWithLayoutTag:", v51);
LABEL_41:
        if (v18)
        {
          *(_DWORD *)(a1 + 36) = objc_msgSend(v18, "layoutTag");
          v52 = objc_alloc(MEMORY[0x24BDB1818]);
          objc_msgSend(*(id *)(a1 + 48), "processingFormat");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "commonFormat");
          objc_msgSend(*(id *)(a1 + 48), "processingFormat");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "sampleRate");
          v57 = v56;
          objc_msgSend(*(id *)(a1 + 48), "processingFormat");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v52, "initWithCommonFormat:sampleRate:interleaved:channelLayout:", v54, objc_msgSend(v58, "isInterleaved"), v18, v57);
          v60 = *(void **)(a1 + 56);
          *(_QWORD *)(a1 + 56) = v59;

          if (*(_QWORD *)(a1 + 56))
          {
            v61 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:interleaved:channelLayout:", 1, 0, v18, a6);
            v62 = *(void **)(a1 + 64);
            *(_QWORD *)(a1 + 64) = v61;

            if (*(_QWORD *)(a1 + 64))
            {
              a5 = 1;
              goto LABEL_59;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[AVAudioFormat initWithCommonFormat] failed on file '%s', for output format"), a3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v21)
                                                                                                + 816)));
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = *(_QWORD *)(a1 + 16);
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
              v87 = 1024;
              v88 = 419;
              v89 = 2048;
              v90 = v66;
              v91 = 2080;
              v92 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
              _os_log_impl(&dword_2164CC000, v65, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
            }

            if (!a5)
              goto LABEL_58;
            v74 = *MEMORY[0x24BDD0FC8];
            v75 = v21;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[AVAudioFormat initWithCommonFormat] failed on file '%s', for input format"), a3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v21)
                                                                                                + 816)));
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              v64 = *(_QWORD *)(a1 + 16);
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
              v87 = 1024;
              v88 = 405;
              v89 = 2048;
              v90 = v64;
              v91 = 2080;
              v92 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
              _os_log_impl(&dword_2164CC000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
            }

            if (!a5)
              goto LABEL_58;
            v76 = *MEMORY[0x24BDD0FC8];
            v77 = v21;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
LABEL_57:
          *(_QWORD *)a5 = v38;

          goto LABEL_58;
        }
LABEL_61:
        std::terminate();
      }
      objc_msgSend(v24, "fileFormat");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "channelLayout");
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((Phase::Controller::StreamRenderer::SupportsInputLayout(v18, 2 * v17) & 1) == 0)
    {
      v39 = (void *)MEMORY[0x24BDD17C8];
      Phase::ChannelLayout::GetStringFromLayoutTag((Phase::ChannelLayout *)objc_msgSend(v18, "layoutTag"), buf);
      if ((v90 & 0x80000000) == 0)
        v40 = buf;
      else
        v40 = *(_BYTE **)buf;
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Unsupported channel layout '%s' on audio file '%s'!"), v40, a3);
      v41 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
      v21 = v41;
      if (SBYTE3(v90) < 0)
        operator delete(*(void **)buf);
      v42 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v41)
                                                                                          + 816)));
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(_QWORD *)(a1 + 16);
        v44 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
        v87 = 1024;
        v88 = 363;
        v89 = 2048;
        v90 = v43;
        v91 = 2080;
        v92 = v44;
        _os_log_impl(&dword_2164CC000, v42, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
      }

      if (!a5)
        goto LABEL_58;
      v82 = *MEMORY[0x24BDD0FC8];
      v83 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
    v26 = objc_msgSend(v18, "layoutTag");
    objc_msgSend(*(id *)(a1 + 48), "processingFormat");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "channelCount");

    if (v26 != v28)
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      v30 = buf;
      Phase::ChannelLayout::GetStringFromLayoutTag((Phase::ChannelLayout *)objc_msgSend(v18, "layoutTag"), buf);
      if ((v90 & 0x80000000) != 0)
        v30 = *(_BYTE **)buf;
      v31 = objc_msgSend(v18, "layoutTag");
      objc_msgSend(*(id *)(a1 + 48), "processingFormat");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Channel layout '%s' on audio file '%s' has mismatched channel count [layout: %d, file: %d]!"), v30, a3, v31, objc_msgSend(v32, "channelCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (SBYTE3(v90) < 0)
        operator delete(*(void **)buf);
      v34 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v33)
                                                                                          + 816)));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = *(_QWORD *)(a1 + 16);
        v36 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
        v87 = 1024;
        v88 = 374;
        v89 = 2048;
        v90 = v35;
        v91 = 2080;
        v92 = v36;
        _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
      }

      if (!a5)
        goto LABEL_58;
      v80 = *MEMORY[0x24BDD0FC8];
      v81 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid sample rate %f for audio file '%s'!"), *(_QWORD *)&a6, a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v18)
                                                                                      + 816)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = *(_QWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
    v87 = 1024;
    v88 = 339;
    v89 = 2048;
    v90 = v20;
    v91 = 2080;
    v92 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
  }

  if (a5)
  {
    v84 = *MEMORY[0x24BDD0FC8];
    v85 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v21);
    *(_QWORD *)a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

    a5 = 0;
  }
LABEL_59:

  return a5;
}

void sub_2166CF820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamedSoundAssetInfo::InitWithData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, AudioFileTypeID a5, void *a6, double a7, double a8, uint64_t a9, _QWORD *a10)
{
  id v18;
  id v19;
  _BOOL8 v20;
  NSObject *v21;
  uint64_t v22;
  Phase::Controller::InMemoryAudioFile *v23;
  id **v24;
  OSStatus v25;
  id v26;
  void *v27;
  int v28;
  _BYTE *v29;
  uint64_t v30;
  void *v31;
  _BYTE *v32;
  void *v33;
  Phase::Logger *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  Phase::Logger *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  _BYTE *v52;
  uint64_t v53;
  void *v54;
  _BYTE *v55;
  void *v56;
  Phase::Logger *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _BYTE *v62;
  void *v63;
  _BYTE *v64;
  Phase::Logger *v65;
  Phase::Logger *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  ExtAudioFileRef outExtAudioFile;
  uint64_t v73;
  Phase::Logger *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  Phase::Logger *v80;
  _BYTE buf[12];
  __int16 v82;
  int v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  v19 = a6;
  v20 = Phase::Controller::SoundAssetInfo::BaseInit(a1, 1, a2, a3, a10, a8);
  if (!v20)
    goto LABEL_23;
  v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v20) + 816));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
    v82 = 1024;
    v83 = 100;
    v84 = 2048;
    v85 = v22;
    _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d StreamedSoundAssetInfo::InitWithData for assetId %llu", buf, 0x1Cu);
  }
  *(_DWORD *)(a1 + 32) = 1;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NSData was nil"));
    v40 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v41 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v40)
                                                                                        + 816)));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = *(_QWORD *)(a1 + 16);
      v43 = -[Phase::Logger UTF8String](objc_retainAutorelease(v40), "UTF8String");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
      v82 = 1024;
      v83 = 106;
      v84 = 2048;
      v85 = v42;
      v86 = 2080;
      v87 = v43;
      _os_log_impl(&dword_2164CC000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
    }

    if (a10)
    {
      v79 = *MEMORY[0x24BDD0FC8];
      v80 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920805, v44);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_23;
  }
  v23 = (Phase::Controller::InMemoryAudioFile *)operator new();
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = 0;
  v24 = (id **)(a1 + 72);
  std::unique_ptr<Phase::Controller::InMemoryAudioFile>::reset[abi:ne180100]((Phase::Controller::InMemoryAudioFile **)(a1 + 72), v23);
  if ((Phase::Controller::InMemoryAudioFile::Init(*(_QWORD *)(a1 + 72), v18, a5, *(_QWORD *)(a1 + 16), a10) & 1) == 0)
  {
LABEL_23:
    v39 = 0;
    goto LABEL_24;
  }
  outExtAudioFile = 0;
  v25 = ExtAudioFileWrapAudioFileID((AudioFileID)(*v24)[1], 0, &outExtAudioFile);
  if (!v25)
  {
    if (!outExtAudioFile)
      std::terminate();
    v46 = objc_alloc(MEMORY[0x24BDB1810]);
    v71 = 0;
    v47 = objc_msgSend(v46, "initForReadingFromExtAudioFile:error:", outExtAudioFile, &v71);
    v26 = v71;
    v48 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v47;

    v49 = *(void **)(a1 + 48);
    if (v26)
    {
      *(_QWORD *)(a1 + 48) = 0;

      if (!*(_QWORD *)(a1 + 48))
      {
        v50 = (void *)MEMORY[0x24BDD17C8];
        Phase::Controller::InMemoryAudioFile::Description(*v24, buf);
        v51 = SBYTE3(v85);
        v52 = *(_BYTE **)buf;
        objc_msgSend(v26, "description");
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)v53;
        v55 = buf;
        if (v51 < 0)
          v55 = v52;
        objc_msgSend(v50, "stringWithFormat:", CFSTR("[AVAudioFile initForReading] failed on file '%s' with error '%@'"), v55, v53);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (SBYTE3(v85) < 0)
          operator delete(*(void **)buf);
        v58 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v57)
                                                                                            + 816)));
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = *(_QWORD *)(a1 + 16);
          v60 = objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
          v82 = 1024;
          v83 = 154;
          v84 = 2048;
          v85 = v59;
          v86 = 2080;
          v87 = v60;
          _os_log_impl(&dword_2164CC000, v58, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
        }

        if (a10)
        {
          v75 = *MEMORY[0x24BDD0FC8];
          v76 = v56;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v61);
          *a10 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_16;
      }
    }
    else if (!v49)
    {
      v63 = (void *)MEMORY[0x24BDD17C8];
      Phase::Controller::InMemoryAudioFile::Description(*v24, buf);
      if ((v85 & 0x80000000) == 0)
        v64 = buf;
      else
        v64 = *(_BYTE **)buf;
      objc_msgSend(v63, "stringWithFormat:", CFSTR("[AVAudioFile initForReading] failed on file '%s'"), v64);
      v65 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (SBYTE3(v85) < 0)
        operator delete(*(void **)buf);
      v67 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v65)
                                                                                          + 816)));
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = *(_QWORD *)(a1 + 16);
        v69 = -[Phase::Logger UTF8String](objc_retainAutorelease(v66), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
        v82 = 1024;
        v83 = 160;
        v84 = 2048;
        v85 = v68;
        v86 = 2080;
        v87 = v69;
        _os_log_impl(&dword_2164CC000, v67, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
      }

      if (a10)
      {
        v73 = *MEMORY[0x24BDD0FC8];
        v74 = v66;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v70);
        *a10 = (id)objc_claimAutoreleasedReturnValue();

      }
      v26 = 0;
      goto LABEL_16;
    }
    Phase::Controller::InMemoryAudioFile::Description(*v24, buf);
    if ((v85 & 0x80000000) == 0)
      v62 = buf;
    else
      v62 = *(_BYTE **)buf;
    v39 = Phase::Controller::StreamedSoundAssetInfo::Initialize(a1, a3, (uint64_t)v62, v19, (uint64_t)a10, a7);
    if (SBYTE3(v85) < 0)
      operator delete(*(void **)buf);
    if ((_DWORD)v39)
    {
      *(_DWORD *)(a1 + 32) = 4;
      v39 = 1;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v25, 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDD17C8];
  Phase::Controller::InMemoryAudioFile::Description(*v24, buf);
  v28 = SBYTE3(v85);
  v29 = *(_BYTE **)buf;
  objc_msgSend(v26, "description");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  v32 = buf;
  if (v28 < 0)
    v32 = v29;
  objc_msgSend(v27, "stringWithFormat:", CFSTR("ExtAudioFileWrapAudioFileID() failed to wrap audio file data '%s' with error '%@'."), v32, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (SBYTE3(v85) < 0)
    operator delete(*(void **)buf);
  v35 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v34)
                                                                                      + 816)));
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = *(_QWORD *)(a1 + 16);
    v37 = objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "StreamedSoundAssetInfo.mm";
    v82 = 1024;
    v83 = 131;
    v84 = 2048;
    v85 = v36;
    v86 = 2080;
    v87 = v37;
    _os_log_impl(&dword_2164CC000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundAssetError for assetId %llu: %s", buf, 0x26u);
  }

  if (a10)
  {
    v77 = *MEMORY[0x24BDD0FC8];
    v78 = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v38);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:
  v39 = 0;
LABEL_17:

LABEL_24:
  return v39;
}

void sub_2166D0250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void Phase::Controller::StreamedSoundAssetInfo::~StreamedSoundAssetInfo(Phase::Controller::StreamedSoundAssetInfo *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;

  std::unique_ptr<Phase::Controller::InMemoryAudioFile>::reset[abi:ne180100]((Phase::Controller::InMemoryAudioFile **)this + 9, 0);
  std::unique_ptr<Phase::Controller::InMemoryAudioFile>::reset[abi:ne180100]((Phase::Controller::InMemoryAudioFile **)this + 9, 0);

}

{
  Phase::Controller::StreamedSoundAssetInfo::~StreamedSoundAssetInfo(this);
  JUMPOUT(0x2199F9D70);
}

Phase::Controller::InMemoryAudioFile *std::unique_ptr<Phase::Controller::InMemoryAudioFile>::reset[abi:ne180100](Phase::Controller::InMemoryAudioFile **a1, Phase::Controller::InMemoryAudioFile *a2)
{
  Phase::Controller::InMemoryAudioFile *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Phase::Controller::InMemoryAudioFile::~InMemoryAudioFile(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

uint64_t Phase::Controller::StreamedSoundAssetInfo::SizeInBytes(Phase::Controller::StreamedSoundAssetInfo *this)
{
  return 0;
}

void Phase::Controller::StreamedSoundAssetInfo::CreateStreamRenderer(Phase::Controller::StreamedSoundAssetInfo *this@<X0>, NSString *a2@<X2>, unsigned int a3@<W1>, unsigned int a4@<W3>, uint64_t *a5@<X8>)
{
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Phase::Logger *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  if (!a3 || (v10 = v9) == 0)
    std::terminate();
  if (*((_QWORD *)this + 7) && *((_QWORD *)this + 8))
  {
    v11 = *((_QWORD *)this + 3);
    v12 = operator new();
    v13 = v12;
    if (v11)
      v14 = a4;
    else
      v14 = a4 | 2;
    v15 = (Phase::Logger *)Phase::Controller::StreamRenderer::StreamRenderer(v12, *((void **)this + 7), *((void **)this + 8), a3, v14);
    if (*(_QWORD *)(v13 + 48))
    {
      if (*((_QWORD *)this + 3) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.audio.PHASE"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLForResource:withExtension:subdirectory:", v10, CFSTR("aupreset"), CFSTR("AUPresets/AULoudnessNormalizer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = Phase::Controller::StreamRenderer::SetPreset(v13, 0, v17, *((double *)this + 5));
        if ((v18 & 1) == 0)
        {
          v29 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v18)
                                                                                              + 816)));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "description");
            v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136315650;
            v32 = "StreamedSoundAssetInfo.mm";
            v33 = 1024;
            v34 = 240;
            v35 = 2080;
            v36 = objc_msgSend(v30, "UTF8String");
            _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to load preset '%s' for stream renderer!", buf, 0x1Cu);

          }
          *a5 = 0;

          goto LABEL_25;
        }

      }
      v19 = Phase::Controller::StreamRenderer::Prepare((Phase::Controller::StreamRenderer *)v13);
      if (v19 && *(_QWORD *)(v13 + 48) && *(_BYTE *)(v13 + 136))
      {
        *a5 = v13;
        goto LABEL_26;
      }
      v24 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v19) + 816));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "StreamedSoundAssetInfo.mm";
        v33 = 1024;
        v34 = 249;
        _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to prepare stream renderer!", buf, 0x12u);
      }
    }
    else
    {
      v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15)
                                                                                          + 816)));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*((id *)this + 7), "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = objc_msgSend(v26, "UTF8String");
        objc_msgSend(*((id *)this + 8), "description");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136316162;
        v32 = "StreamedSoundAssetInfo.mm";
        v33 = 1024;
        v34 = 224;
        v35 = 2080;
        v36 = v27;
        v37 = 2080;
        v38 = objc_msgSend(v28, "UTF8String");
        v39 = 1024;
        v40 = a3;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: could not create stream renderer: inputFormat %s, outputFormat %s, maxFrameCount %u!", buf, 0x2Cu);

      }
    }
    *a5 = 0;
LABEL_25:
    Phase::Controller::StreamRenderer::~StreamRenderer((Phase::Controller::StreamRenderer *)v13);
    MEMORY[0x2199F9D70]();
    goto LABEL_26;
  }
  v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v9)
                                                                                      + 816)));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*((id *)this + 7), "description");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "UTF8String");
    objc_msgSend(*((id *)this + 8), "description");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315906;
    v32 = "StreamedSoundAssetInfo.mm";
    v33 = 1024;
    v34 = 200;
    v35 = 2080;
    v36 = v22;
    v37 = 2080;
    v38 = objc_msgSend(v23, "UTF8String");
    _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream formats, inputFormat %s, outputFormat %s!", buf, 0x26u);

  }
  *a5 = 0;
LABEL_26:

}

void sub_2166D08E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<Phase::Controller::StreamRenderer>::reset[abi:ne180100]((Phase::Controller::StreamRenderer **)va, 0);
  _Unwind_Resume(a1);
}

BOOL Phase::Controller::StreamedSoundAssetInfo::ScheduleFile(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  if (!a2)
    std::terminate();
  v13 = v12;
  v14 = Phase::Controller::StreamRenderer::ScheduleFile(a2, *(void **)(a1 + 48), v11, a4, a5, v12);
  v15 = v14;
  if (!v14)
  {
    v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v14)
                                                                                        + 816)));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "description");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = 136315906;
      v21 = "StreamedSoundAssetInfo.mm";
      v22 = 1024;
      v23 = 274;
      v24 = 2048;
      v25 = a2;
      v26 = 2080;
      v27 = objc_msgSend(v18, "UTF8String");
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d stream renderer@%p: failed to schedule audio file '%s' for rendering!", (uint8_t *)&v20, 0x26u);

    }
  }

  return v15;
}

void sub_2166D0B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

BOOL Phase::Controller::StreamedSoundAssetInfo::ScheduleSegment(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  if (!a2)
    std::terminate();
  v15 = v14;
  v16 = Phase::Controller::StreamRenderer::ScheduleSegment(a2, *(void **)(a1 + 48), v13, a4, a5, a6, v14);
  v17 = v16;
  if (!v16)
  {
    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v16)
                                                                                        + 816)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "url");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = 136315906;
      v23 = "StreamedSoundAssetInfo.mm";
      v24 = 1024;
      v25 = 304;
      v26 = 2048;
      v27 = a2;
      v28 = 2080;
      v29 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d stream renderer@%p: failed to schedule audio file '%s' for rendering!", (uint8_t *)&v22, 0x26u);

    }
  }

  return v17;
}

void sub_2166D0D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

double Phase::Controller::StreamedSoundAssetInfo::GetFileLengthInSeconds(id *this)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_msgSend(this[6], "length");
  objc_msgSend(this[6], "fileFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleRate");
  v5 = (double)v2 / v4;

  return v5;
}

void sub_2166D0D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::SoundAssetInfo::AsResidentSoundAssetInfo(Phase::Controller::SoundAssetInfo *this)
{
  return 0;
}

uint64_t Phase::Controller::StreamRenderer::StreamRenderer(uint64_t a1, void *a2, void *a3, unsigned int a4, unsigned int a5, uint64_t a6, void *a7, __int128 *a8)
{
  id v14;
  id v15;
  uint64_t i;
  uint64_t v17;
  id *v18;
  id v19;
  uint64_t v20;
  void **v21;
  Phase::Logger *v22;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  Phase::Logger *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char v50;
  Phase::Logger *v51;
  Phase::Logger *v52;
  char v53;
  char *v54;
  __int128 v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  _OWORD *v59;
  _QWORD *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  _QWORD *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  _BYTE *v73;
  unint64_t *v74;
  unint64_t v75;
  char *v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  unint64_t *v84;
  unint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  unint64_t *v88;
  unint64_t v89;
  uint64_t v90;
  id v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  NSObject *v110;
  id v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  void *v117;
  Phase::Logger *v118;
  unint64_t v119;
  uint64_t v120;
  id v121;
  void *v122;
  Phase::Logger *v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  char v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  uint64_t v134;
  void *v135;
  __int128 v136;
  uint64_t v137;
  _QWORD *v138;
  Phase::Logger *v139;
  NSObject *v140;
  NSObject *v141;
  NSObject *v142;
  void *v143;
  uint64_t v145;
  uint64_t v146;
  Phase::Logger *v147;
  id *location;
  void *v150;
  id v151;
  id v152;
  __int128 v153;
  int v154;
  _QWORD v155[4];
  id v156;
  uint64_t v157;
  std::__shared_weak_count *v158;
  _BYTE *v159;
  std::__shared_weak_count *v160;
  char *v161;
  std::__shared_weak_count *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  std::__shared_weak_count *v166;
  _BYTE *v167;
  std::__shared_weak_count *v168;
  id v169;
  char v170;
  _BYTE buf[28];
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  unsigned int v177;
  __int16 v178;
  int v179;
  __int16 v180;
  uint64_t v181;
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  v14 = a2;
  v15 = a3;
  v151 = a7;
  for (i = 0; i != 48; i += 24)
  {
    v17 = a1 + i;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
  }
  *(_OWORD *)(a1 + 48) = 0u;
  v18 = (id *)(a1 + 48);
  *(_OWORD *)(a1 + 64) = 0u;
  location = (id *)(a1 + 64);
  *(_OWORD *)(a1 + 80) = 0u;
  v152 = v14;
  *(_QWORD *)(a1 + 96) = v152;
  v19 = v15;
  *(_QWORD *)(a1 + 104) = v19;
  *(_DWORD *)(a1 + 112) = a5;
  v150 = v19;
  objc_msgSend(v19, "sampleRate");
  *(_OWORD *)(a1 + 168) = 0u;
  *(_QWORD *)(a1 + 120) = v20;
  *(_QWORD *)(a1 + 128) = a6;
  *(_WORD *)(a1 + 136) = 0;
  v21 = (void **)(a1 + 208);
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_WORD *)(a1 + 216) = 0;
  v22 = (Phase::Logger *)caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)(a1 + 220));
  *(_BYTE *)(a1 + 224) = 0;
  *(_BYTE *)(a1 + 288) = 0;
  *(_BYTE *)(a1 + 376) = 0;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 384) = xmmword_2166F7500;
  *(_DWORD *)(a1 + 400) = 0;
  Phase::Logger::GetInstance(v22);
  objc_msgSend(v19, "sampleRate");
  v24 = v23;
  objc_msgSend(v152, "sampleRate");
  v26 = vcvtmd_u64_f64(v24 * (double)a4 / v25);
  *(_DWORD *)(a1 + 200) = v26;
  if (v26 < a5 && v26 != 0)
  {
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v19, *(unsigned int *)(a1 + 200));
    v29 = *(void **)(a1 + 184);
    *(_QWORD *)(a1 + 184) = v28;

    objc_msgSend(*(id *)(a1 + 184), "setFrameLength:", *(unsigned int *)(a1 + 200));
    v30 = objc_msgSend(*(id *)(a1 + 184), "mutableAudioBufferList");
    *(_QWORD *)(a1 + 192) = v30;
    *(_DWORD *)(a1 + 204) = *(_DWORD *)(a1 + 200);
    if (!v30
      || !*(_DWORD *)v30
      || !*(_QWORD *)(v30 + 16)
      || objc_msgSend(v152, "isInterleaved") && objc_msgSend(v152, "channelCount") != 1)
    {
      goto LABEL_133;
    }
    if (objc_msgSend(v19, "isInterleaved") && objc_msgSend(v19, "channelCount") != 1
      || *(_DWORD *)(*(_QWORD *)(a1 + 192) + 12) != 4 * *(unsigned int *)(a1 + 200))
    {
      goto LABEL_133;
    }
  }
  v31 = dispatch_queue_create("Phase.StreamRenderer", 0);

  v32 = *v21;
  *v21 = v31;

  applesauce::dispatch::v1::queue::operator*((id *)(a1 + 208));
  v33 = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v33, v34);

  if (v151)
  {
    v36 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v35)
                                                                                        + 384)));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 96), "description");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v38 = objc_msgSend(v37, "UTF8String");
      objc_msgSend(*(id *)(a1 + 104), "description");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = objc_msgSend(v39, "UTF8String");
      v41 = *(_DWORD *)(a1 + 112);
      v42 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = "StreamRenderer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 199;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a1;
      v172 = 2080;
      v173 = v38;
      v174 = 2080;
      v175 = v40;
      v176 = 1024;
      v177 = a4;
      v178 = 1024;
      v179 = v41;
      v180 = 2048;
      v181 = v42;
      _os_log_impl(&dword_2164CC000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p: initializing render block with buffer format %s, output format %s, in max #frames %d, out max #frames %d, config options 0x%lx", buf, 0x46u);

    }
  }
  if (!*(_DWORD *)(a1 + 112))
    goto LABEL_133;
  v43 = objc_opt_new();
  v44 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v43;

  v45 = 200;
  if (!*(_QWORD *)(a1 + 192))
    v45 = 112;
  v46 = *(unsigned int *)(a1 + v45);
  v47 = ~*(_DWORD *)(a1 + 128) & 1;
  v48 = *(void **)(a1 + 48);
  v49 = *(_QWORD *)(a1 + 104);
  v169 = 0;
  v50 = objc_msgSend(v48, "enableManualRenderingMode:format:maximumFrameCount:error:", v47, v49, v46, &v169);
  v51 = (Phase::Logger *)v169;
  v52 = v51;
  if (v51)
    v53 = 0;
  else
    v53 = v50;
  if ((v53 & 1) == 0)
  {
    v110 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v51)
                                                                                         + 384)));
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 104), "description");
      v111 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v112 = objc_msgSend(v111, "UTF8String");
      -[Phase::Logger description](v52, "description");
      v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v114 = objc_msgSend(v113, "UTF8String");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "StreamRenderer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 229;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a1;
      v172 = 2080;
      v173 = v112;
      v174 = 2080;
      v175 = v114;
      _os_log_impl(&dword_2164CC000, v110, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: could not configure AVAE in ManualRenderingModeRealtime with format %s, err = %s", buf, 0x30u);

    }
    goto LABEL_94;
  }
  v54 = (char *)operator new(0x58uLL);
  *((_QWORD *)v54 + 1) = 0;
  *((_QWORD *)v54 + 2) = 0;
  *(_QWORD *)v54 = &off_24D5818F0;
  v55 = 0uLL;
  *(_OWORD *)(v54 + 40) = 0u;
  *(_OWORD *)(v54 + 56) = 0u;
  *(_OWORD *)(v54 + 72) = 0u;
  *(_OWORD *)(v54 + 24) = 0u;
  v56 = *(std::__shared_weak_count **)(a1 + 312);
  *(_QWORD *)(a1 + 304) = v54 + 24;
  *(_QWORD *)(a1 + 312) = v54;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v58 = __ldaxr(p_shared_owners);
    while (__stlxr(v58 - 1, p_shared_owners));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
      v55 = 0uLL;
    }
  }
  v59 = *(_OWORD **)(a1 + 304);
  v59[2] = v55;
  v59[3] = v55;
  *v59 = v55;
  v59[1] = v55;
  v60 = operator new(0x20uLL);
  v60[1] = 0;
  v60[2] = 0;
  *v60 = &off_24D581928;
  v60[3] = 0;
  v61 = *(std::__shared_weak_count **)(a1 + 328);
  *(_QWORD *)(a1 + 320) = v60 + 3;
  *(_QWORD *)(a1 + 328) = v60;
  if (v61)
  {
    v62 = (unint64_t *)&v61->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  v64 = operator new(0x20uLL);
  v64[1] = 0;
  v64[2] = 0;
  *v64 = &off_24D581960;
  *((_DWORD *)v64 + 6) = 0;
  v65 = *(std::__shared_weak_count **)(a1 + 176);
  *(_QWORD *)(a1 + 168) = v64 + 3;
  *(_QWORD *)(a1 + 176) = v64;
  if (v65)
  {
    v66 = (unint64_t *)&v65->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  if (v151)
  {
    v147 = v52;
    v68 = *(_QWORD *)(a1 + 304);
    v69 = *(std::__shared_weak_count **)(a1 + 312);
    *(_QWORD *)buf = v68;
    *(_QWORD *)&buf[8] = v69;
    if (v69)
    {
      v70 = (unint64_t *)&v69->__shared_owners_;
      do
        v71 = __ldxr(v70);
      while (__stxr(v71 + 1, v70));
    }
    v145 = v47;
    v73 = *(_BYTE **)(a1 + 320);
    v72 = *(std::__shared_weak_count **)(a1 + 328);
    v167 = v73;
    v168 = v72;
    if (v72)
    {
      v74 = (unint64_t *)&v72->__shared_owners_;
      do
        v75 = __ldxr(v74);
      while (__stxr(v75 + 1, v74));
    }
    v76 = *(char **)(a1 + 168);
    v77 = *(std::__shared_weak_count **)(a1 + 176);
    v165 = v76;
    v166 = v77;
    if (v77)
    {
      v78 = (unint64_t *)&v77->__shared_owners_;
      do
        v79 = __ldxr(v78);
      while (__stxr(v79 + 1, v78));
    }
    objc_msgSend(*(id *)(a1 + 104), "sampleRate", v145);
    if (v80 == 0.0)
      goto LABEL_133;
    objc_msgSend(*(id *)(a1 + 104), "sampleRate");
    v82 = v81;
    v83 = objc_alloc(MEMORY[0x24BDB1878]);
    v155[0] = MEMORY[0x24BDAC760];
    v155[1] = 3321888768;
    v155[2] = ___ZN5Phase10Controller14StreamRendererC2EP13AVAudioFormatS3_jjNSt3__16bitsetILm8EEEU13block_pointerFiPbPK14AudioTimeStampjP15AudioBufferListENS4_8optionalINS1_29AudioIssueDetectorInformationEEE_block_invoke;
    v155[3] = &unk_24D581718;
    v157 = v68;
    v158 = v69;
    if (v69)
    {
      v84 = (unint64_t *)&v69->__shared_owners_;
      do
        v85 = __ldxr(v84);
      while (__stxr(v85 + 1, v84));
    }
    v159 = v73;
    v160 = v72;
    if (v72)
    {
      v86 = (unint64_t *)&v72->__shared_owners_;
      do
        v87 = __ldxr(v86);
      while (__stxr(v87 + 1, v86));
    }
    v161 = v76;
    v162 = v77;
    if (v77)
    {
      v88 = (unint64_t *)&v77->__shared_owners_;
      do
        v89 = __ldxr(v88);
      while (__stxr(v89 + 1, v88));
    }
    v163 = v82;
    v164 = a1;
    v156 = v151;
    v90 = objc_msgSend(v83, "initWithFormat:renderBlock:", v152, v155);
    v91 = *location;
    *location = (id)v90;

    v47 = v146;
    v52 = v147;

    v92 = v162;
    if (v162)
    {
      v93 = (unint64_t *)&v162->__shared_owners_;
      do
        v94 = __ldaxr(v93);
      while (__stlxr(v94 - 1, v93));
      if (!v94)
      {
        ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
        std::__shared_weak_count::__release_weak(v92);
      }
    }
    v95 = v160;
    if (v160)
    {
      v96 = (unint64_t *)&v160->__shared_owners_;
      do
        v97 = __ldaxr(v96);
      while (__stlxr(v97 - 1, v96));
      if (!v97)
      {
        ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
        std::__shared_weak_count::__release_weak(v95);
      }
    }
    v98 = v158;
    if (v158)
    {
      v99 = (unint64_t *)&v158->__shared_owners_;
      do
        v100 = __ldaxr(v99);
      while (__stlxr(v100 - 1, v99));
      if (!v100)
      {
        ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
        std::__shared_weak_count::__release_weak(v98);
      }
    }
    v101 = v166;
    if (v166)
    {
      v102 = (unint64_t *)&v166->__shared_owners_;
      do
        v103 = __ldaxr(v102);
      while (__stlxr(v103 - 1, v102));
      if (!v103)
      {
        ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
        std::__shared_weak_count::__release_weak(v101);
      }
    }
    v104 = v168;
    if (v168)
    {
      v105 = (unint64_t *)&v168->__shared_owners_;
      do
        v106 = __ldaxr(v105);
      while (__stlxr(v106 - 1, v105));
      if (!v106)
      {
        ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
        std::__shared_weak_count::__release_weak(v104);
      }
    }
    v107 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v108 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v109 = __ldaxr(v108);
      while (__stlxr(v109 - 1, v108));
      if (!v109)
      {
        ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
        std::__shared_weak_count::__release_weak(v107);
      }
    }
  }
  else
  {
    v116 = objc_opt_new();
    v117 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v116;

    objc_storeStrong(location, *(id *)(a1 + 72));
  }
  v118 = (Phase::Logger *)objc_msgSend(*v18, "attachNode:", *location);
  if ((*(_QWORD *)(a1 + 128) & 6) != 2)
  {
    v170 = 1;
    v165 = &v170;
    v119 = atomic_load(&Phase::Controller::AudioDSPRegisterInternalAudioUnits(void)::onceflag);
    if (v119 != -1)
    {
      *(_QWORD *)buf = &v165;
      v167 = buf;
      std::__call_once(&Phase::Controller::AudioDSPRegisterInternalAudioUnits(void)::onceflag, &v167, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<Phase::Controller::AudioDSPRegisterInternalAudioUnits(void)::$_0 &&>>);
    }
    if (!v170)
    {
      v140 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v118) + 384));
      if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "StreamRenderer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 336;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = a1;
        _os_log_impl(&dword_2164CC000, v140, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: could not register internal audio units!", buf, 0x1Cu);
      }
LABEL_94:
      v115 = *v18;
      *v18 = 0;
      goto LABEL_132;
    }
  }
  v115 = *(id *)(a1 + 64);
  v120 = *(_QWORD *)(a1 + 128);
  if ((v120 & 4) != 0)
  {
    v121 = objc_alloc_init(MEMORY[0x24BDB1890]);
    v122 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v121;

    if (!*(_QWORD *)(a1 + 88))
    {
      v142 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v123) + 384));
      if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "StreamRenderer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 352;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = a1;
        _os_log_impl(&dword_2164CC000, v142, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: could not instantiate DSPGraph!", buf, 0x1Cu);
      }
      v143 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

      v141 = *(NSObject **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;
      goto LABEL_131;
    }
    objc_msgSend(*v18, "attachNode:");
    objc_msgSend(*(id *)(a1 + 48), "connect:to:format:", v115, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    v124 = *(id *)(a1 + 88);

    v120 = *(_QWORD *)(a1 + 128);
    v115 = v124;
  }
  if ((v120 & 2) == 0)
  {
    v154 = 0;
    v153 = *(_OWORD *)"xfuamndllppa";
    v125 = objc_msgSend(objc_alloc(MEMORY[0x24BDB18B8]), "initWithAudioComponentDescription:", &v153);
    v126 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v125;

    if (!*(_QWORD *)(a1 + 80))
      goto LABEL_133;
    objc_msgSend(*v18, "attachNode:");
    objc_msgSend(*(id *)(a1 + 48), "connect:to:format:", v115, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96));
    v127 = *(id *)(a1 + 80);

    v115 = v127;
  }
  v128 = objc_msgSend(v150, "isEqual:", v152);
  v129 = *v18;
  if ((v128 & 1) != 0)
  {
    objc_msgSend(*v18, "outputNode");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "connect:to:format:", v115, v130, *(_QWORD *)(a1 + 96));
  }
  else
  {
    objc_msgSend(*v18, "mainMixerNode");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "connect:to:format:", v115, v131, *(_QWORD *)(a1 + 96));

    v132 = *v18;
    objc_msgSend(*v18, "mainMixerNode");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v18, "outputNode");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "connect:to:format:", v130, v133, *(_QWORD *)(a1 + 104));

  }
  objc_msgSend(*v18, "manualRenderingBlock");
  v134 = objc_claimAutoreleasedReturnValue();
  v135 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v134;

  if (!*(_QWORD *)(a1 + 56)
    || (objc_msgSend(*v18, "isInManualRenderingMode") & 1) == 0
    || objc_msgSend(*v18, "manualRenderingMode") != v47
    || *v18 && *(_BYTE *)(a1 + 136))
  {
LABEL_133:
    std::terminate();
  }
  atomic_store(0, (unint64_t *)(a1 + 336));
  atomic_store(0, (unsigned __int8 *)(a1 + 216));
  atomic_store(0, (unsigned __int8 *)(a1 + 217));
  if (!*((_BYTE *)a8 + 24))
    goto LABEL_132;
  v136 = *a8;
  *(_QWORD *)(a1 + 360) = *((_QWORD *)a8 + 2);
  *(_OWORD *)(a1 + 344) = v136;
  if (!*((_BYTE *)a8 + 24))
    std::__throw_bad_optional_access[abi:ne180100]();
  v137 = *(_QWORD *)a8;
  v138 = operator new(8uLL);
  *v138 = v137;
  *(_QWORD *)&buf[8] = v138 + 1;
  *(_QWORD *)&buf[16] = v138 + 1;
  *(_QWORD *)buf = v138;
  if (AudioIssueDetectorLibraryLoader(void)::once != -1)
    dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
  if (!AudioIssueDetectorLibraryLoader(void)::libSym)
  {
    *(_QWORD *)(a1 + 368) = 0;
LABEL_125:
    *(_QWORD *)&buf[8] = v138;
    operator delete(v138);
    v139 = *(Phase::Logger **)(a1 + 368);
    if (!v139)
      goto LABEL_126;
    goto LABEL_132;
  }
  v139 = (Phase::Logger *)AudioIssueDetectorLibraryLoader(void)::libSym(8, buf);
  v138 = *(_QWORD **)buf;
  *(_QWORD *)(a1 + 368) = v139;
  if (v138)
    goto LABEL_125;
  if (!v139)
  {
LABEL_126:
    v141 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v139)
                                                                                         + 384)));
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "StreamRenderer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 436;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a1;
      _os_log_impl(&dword_2164CC000, v141, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: failed to create AID", buf, 0x1Cu);
    }
LABEL_131:

  }
LABEL_132:

  return a1;
}

void sub_2166D1BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,char a37)
{
  id *v37;
  void *v38;
  uint64_t v39;

  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)(v37 + 40));
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](a14);

  applesauce::dispatch::v1::queue::~queue(a11);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v39);

  std::array<Phase::Controller::StreamRenderer::IOConfiguration,2ul>::~array((uint64_t)v37);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamRenderer::StreamRenderer(uint64_t a1, void *a2, void *a3, unsigned int a4, uint64_t a5)
{
  __int128 v6;
  char v7;

  LOBYTE(v6) = 0;
  v7 = 0;
  return Phase::Controller::StreamRenderer::StreamRenderer(a1, a2, a3, 0, a4, a5, 0, &v6);
}

void applesauce::dispatch::v1::queue::~queue(id *this)
{
  id v2;

  v2 = *this;
  *this = 0;

}

uint64_t ___ZN5Phase10Controller14StreamRendererC2EP13AVAudioFormatS3_jjNSt3__16bitsetILm8EEEU13block_pointerFiPbPK14AudioTimeStampjP15AudioBufferListENS4_8optionalINS1_29AudioIssueDetectorInformationEEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  double v17;
  uint64_t v18;

  v18 = 0;
  if ((*(_BYTE *)(a3 + 56) & 1) == 0)
    return 4294956433;
  v17 = *(double *)a3;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_DWORD *)(v9 + 56);
  if ((v10 & 2) != 0)
  {
    if ((v10 & 4) != 0)
      v11 = *(double *)(v9 + 16);
    else
      v11 = 1.0;
    v12 = (double)*(uint64_t *)(v9 + 8) * 0.0000000416666667;
    v13 = **(_QWORD **)(a1 + 56);
    v14 = atomic_load(*(unsigned int **)(a1 + 72));
    v18 = (uint64_t)((v12 + v11 * ((double)v13 + (double)v14) / *(double *)(a1 + 88)) * 24000000.0);
  }
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 40);
  if (v15)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v15 + 24))(v15, a4, a5, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v15 + 72))(v15, v18, (uint64_t)v17, a4);
  }
  return v5;
}

uint64_t Phase::Controller::StreamRenderer::IOConfiguration::WriteCaptureBufferList(uint64_t this, const AudioTimeStamp *a2, uint64_t a3, const AudioBufferList *a4)
{
  uint64_t v6;

  if (this)
  {
    v6 = this;
    (*(void (**)(uint64_t, uint64_t, const AudioBufferList *, _QWORD))(*(_QWORD *)this + 24))(this, a3, a4, 0);
    return (*(uint64_t (**)(uint64_t, UInt64, uint64_t, uint64_t))(*(_QWORD *)v6 + 72))(v6, a2->mHostTime, (uint64_t)a2->mSampleTime, a3);
  }
  return this;
}

_QWORD *__copy_helper_block_ea8_40c42_ZTSNSt3__110shared_ptrI14AudioTimeStampEE56c27_ZTSNSt3__110shared_ptrImEE72c40_ZTSNSt3__110shared_ptrINS_6atomicIjEEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = a2[10];
  result[9] = a2[9];
  result[10] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return result;
}

uint64_t __destroy_helper_block_ea8_40c42_ZTSNSt3__110shared_ptrI14AudioTimeStampEE56c27_ZTSNSt3__110shared_ptrImEE72c40_ZTSNSt3__110shared_ptrINS_6atomicIjEEEE(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + 40;
  v2 = a1 + 56;
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](a1 + 72);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v2);
  return std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v1);
}

uint64_t std::array<Phase::Controller::StreamRenderer::IOConfiguration,2ul>::~array(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  for (i = 0; i != -48; i -= 24)
  {
    v3 = *(_QWORD *)(a1 + i + 40);
    *(_QWORD *)(a1 + i + 40) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  }
  return a1;
}

void Phase::Controller::StreamRenderer::~StreamRenderer(Phase::Controller::StreamRenderer *this)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  _QWORD block[5];
  char *v15;
  char v16;

  v2 = (void *)*((_QWORD *)this + 6);
  if (v2 && *((_BYTE *)this + 136) && *((_BYTE *)this + 137))
  {
    v15 = (char *)this + 220;
    v16 = 1;
    caulk::pooled_semaphore_mutex::_lock((Phase::Controller::StreamRenderer *)((char *)this + 220));
    atomic_store(0, (unsigned __int8 *)this + 216);
    atomic_store(0, (unsigned __int8 *)this + 217);
    applesauce::dispatch::v1::queue::operator*((id *)this + 26);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN5Phase10Controller14StreamRenderer4StopEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v3, block);

    applesauce::dispatch::v1::queue::operator*((id *)this + 26);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, &__block_literal_global_10);

    *((_BYTE *)this + 137) = 0;
    atomic_store(0, (unint64_t *)this + 42);
    if (*((_BYTE *)this + 288))
      *((_BYTE *)this + 288) = 0;
    v5 = (_OWORD *)*((_QWORD *)this + 38);
    v5[2] = 0u;
    v5[3] = 0u;
    *v5 = 0u;
    v5[1] = 0u;
    if (*((_QWORD *)this + 6) && *((_BYTE *)this + 136) && *((_BYTE *)this + 137))
      std::terminate();
    Phase::Controller::StreamRenderer::StartStopInternalCaptures(this, 0);
    std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v15);
    v2 = (void *)*((_QWORD *)this + 6);
  }
  *((_QWORD *)this + 6) = 0;

  v6 = (void *)*((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;

  v7 = (void *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;

  v8 = (void *)*((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;

  v9 = (void *)*((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;

  Phase::Controller::StreamRenderer::StartStopInternalCaptures(this, 0);
  v10 = *((_QWORD *)this + 46);
  if (v10)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (off_254E41A20)
      off_254E41A20(v10);
    *((_QWORD *)this + 46) = 0;
  }
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)this + 320);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)this + 304);

  v11 = (void *)*((_QWORD *)this + 26);
  *((_QWORD *)this + 26) = 0;

  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)this + 168);
  for (i = 0; i != -48; i -= 24)
  {
    v13 = *(_QWORD *)((char *)this + i + 40);
    *(_QWORD *)((char *)this + i + 40) = 0;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);

  }
}

void sub_2166D2410(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  __clang_call_terminate(a1);
}

void Phase::Controller::StreamRenderer::StartStopInternalCaptures(Phase::Controller::StreamRenderer *this, char a2)
{
  BOOL v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  _QWORD *v9;
  id *v10;
  BOOL v11;
  uint64_t v12;
  Phase::Logger *v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  caulk::platform *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Phase::Logger *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  int v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  Phase::Controller::StreamRenderer *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[12];
  __int16 v46;
  int v47;
  __int16 v48;
  _QWORD *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(Phase::Logger::GetInstance(this) + 1532))
    v4 = 0;
  else
    v4 = (*((_BYTE *)this + 128) & 0x80) == 0;
  v5 = 0;
  v6 = v4 | a2 ^ 1;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = (_QWORD *)((char *)this + 24 * v5);
    *(_DWORD *)v9 = v5;
    v10 = (id *)(v9 + 1);
    v11 = (v7 & 1) == 0;
    v12 = 96;
    if (!v11)
      v12 = 104;
    objc_storeStrong(v10, *(id *)((char *)this + v12));
    if ((v6 & 1) != 0)
    {
      Phase::Controller::StreamRenderer::IOConfiguration::StopCaptures((_QWORD *)this + 3 * v5);
    }
    else
    {
      v14 = (char *)this + 24 * v5;
      v16 = *((_QWORD *)v14 + 2);
      v15 = v14 + 16;
      if (!v16)
      {
        v17 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                            + 384)));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*v10, "description");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = objc_msgSend(v18, "cStringUsingEncoding:", 4);
          *(_DWORD *)buf = 136316162;
          v36 = "StreamRenderer.mm";
          v37 = 1024;
          v38 = 1792;
          v39 = 2048;
          v40 = this;
          v41 = 1024;
          v42 = v5;
          v43 = 2080;
          v44 = v19;
          _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d bufferstream@%p: element[%d] format = %s", buf, 0x2Cu);

        }
        if ((v8 & 1) != 0)
          v20 = "out";
        else
          v20 = "in";
        v21 = (caulk::platform *)getpid();
        caulk::platform::process_name(v21);
        v22 = v45;
        if (SBYTE3(v49) < 0)
          v22 = *(const char **)v45;
        snprintf((char *)buf, 0x100uLL, "%s-%d-bufferstream@%p-%s", v22, (_DWORD)v21, this, v20);
        if (SBYTE3(v49) < 0)
          operator delete(*(void **)v45);
        v23 = objc_msgSend(*v10, "streamDescription");
        if (*(_DWORD *)(v23 + 28) && *(double *)v23 > 0.0)
        {
          Phase::Logger::CreateAudioCapturer((Phase::Logger *)buf, (const char *)v23, v45);
          v24 = *(_QWORD *)v45;
          *(_QWORD *)v45 = 0;
          v25 = *v15;
          *v15 = v24;
          if (v25)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
            v26 = *(_QWORD *)v45;
            *(_QWORD *)v45 = 0;
            if (v26)
              (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
            v24 = *v15;
          }
          if (v24)
          {
            v27 = (Phase::Logger *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v24 + 64))(v24, 10000);
            v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v27)
                                                                                                + 384)));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = *(_DWORD *)v9;
              v30 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v15 + 56))(*v15);
              *(_DWORD *)v45 = 136316162;
              *(_QWORD *)&v45[4] = "StreamRenderer.mm";
              v46 = 1024;
              v47 = 1822;
              v48 = 2048;
              v49 = v9;
              v50 = 1024;
              v51 = v29;
              v52 = 2080;
              v53 = v30;
              _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p [%d]: writing capture to %s", v45, 0x2Cu);
            }

          }
          else
          {
            v33 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0) + 384));
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = *(_DWORD *)v9;
              *(_DWORD *)v45 = 136315906;
              *(_QWORD *)&v45[4] = "StreamRenderer.mm";
              v46 = 1024;
              v47 = 1827;
              v48 = 2048;
              v49 = v9;
              v50 = 1024;
              v51 = v34;
              _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p [%d]: Error: could not create capture file!", v45, 0x22u);
            }
          }
        }
        else
        {
          v31 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)v23) + 384));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(_DWORD *)v9;
            *(_DWORD *)v45 = 136315906;
            *(_QWORD *)&v45[4] = "StreamRenderer.mm";
            v46 = 1024;
            v47 = 1813;
            v48 = 2048;
            v49 = v9;
            v50 = 1024;
            v51 = v32;
            _os_log_impl(&dword_2164CC000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p [%d]: ERROR: invalid capture format!", v45, 0x22u);
          }
          Phase::Controller::StreamRenderer::IOConfiguration::StopCaptures(v9);
        }
      }
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
}

void sub_2166D28A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamRenderer::SupportsInputLayout(void *a1, char a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  Phase::ChannelLayout *v8;
  const AudioChannelLayout *v9;

  v3 = a1;
  v4 = v3;
  if ((a2 & 2) != 0)
  {
    v8 = (Phase::ChannelLayout *)objc_msgSend(v3, "layout");
    v6 = (uint64_t)Phase::ChannelLayout::IsLayoutSupported(v8, v9);
    goto LABEL_33;
  }
  v5 = objc_msgSend(v3, "layoutTag");
  v6 = 1;
  if (v5 <= 8388615)
  {
    if (v5 > 7995397)
    {
      if (v5 <= 8126469)
      {
        if (v5 == 7995398)
          goto LABEL_33;
        v7 = 8060934;
      }
      else
      {
        if (v5 == 8126470 || v5 == 8257544)
          goto LABEL_33;
        v7 = 8323080;
      }
    }
    else if (v5 <= 7405570)
    {
      if (v5 == 6553601)
        goto LABEL_33;
      v7 = 6619138;
    }
    else
    {
      if (v5 == 7405571 || v5 == 7667717)
        goto LABEL_33;
      v7 = 7929862;
    }
  }
  else if (v5 <= 12189700)
  {
    if (v5 <= 8650755)
    {
      if (v5 == 8388616)
        goto LABEL_33;
      v7 = 8454152;
    }
    else
    {
      if (v5 == 8650756 || v5 == 8716291)
        goto LABEL_33;
      v7 = 12124164;
    }
  }
  else if (v5 > 12386311)
  {
    if (v5 == 12386312 || v5 == 12582924)
      goto LABEL_33;
    v7 = 12713992;
  }
  else
  {
    if (v5 == 12189701 || v5 == 12255238)
      goto LABEL_33;
    v7 = 12320775;
  }
  if (v5 != v7)
    v6 = 0;
LABEL_33:

  return v6;
}

void sub_2166D2AC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL Phase::Controller::StreamRenderer::Prepare(Phase::Controller::StreamRenderer *this)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  Phase::Logger *v6;
  Phase::Logger *v7;
  int v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void **v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void **v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void **v21;
  id v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  Phase::Controller::StreamRenderer *v32;
  __int16 v33;
  void **v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  char __str[150];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!*((_QWORD *)this + 6))
    return 0;
  if (*((_BYTE *)this + 136))
    return 1;
  *((_BYTE *)this + 136) = 0;
  applesauce::dispatch::v1::queue::operator*((id *)this + 26);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN5Phase10Controller14StreamRenderer7PrepareEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v3, block);

  *((_BYTE *)this + 136) = 1;
  Phase::Controller::StreamRenderer::InitializeLatencyBuffer(this, 1);
  v4 = *((_QWORD *)this + 46);
  if (v4)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (off_254E41A38)
      off_254E41A38(v4);
    snprintf(__str, 0x96uLL, "phasestream-out@%p", this);
    std::string::basic_string[abi:ne180100]<0>(__p, __str);
    v5 = *((_QWORD *)this + 46);
    v6 = (Phase::Logger *)objc_msgSend(*((id *)this + 13), "streamDescription");
    v7 = v6;
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (off_254E41A30)
    {
      v6 = (Phase::Logger *)off_254E41A30(v5, __p, 1, 1, v7, 4096);
      v8 = (int)v6;
      if (!(_DWORD)v6)
      {
        v9 = *((_QWORD *)this + 46);
        if (AudioIssueDetectorLibraryLoader(void)::once != -1)
          dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
        if (off_254E41A18)
        {
          v6 = (Phase::Logger *)off_254E41A18(v9);
          v10 = (int)v6;
          if (!(_DWORD)v6)
          {
            v11 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v6)
                                                                                                + 384)));
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              if (v25 >= 0)
                v12 = __p;
              else
                v12 = (void **)__p[0];
              objc_msgSend(*((id *)this + 13), "description");
              v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v14 = objc_msgSend(v13, "UTF8String");
              *(_DWORD *)buf = 136316162;
              v28 = "StreamRenderer.mm";
              v29 = 1024;
              v30 = 642;
              v31 = 2048;
              v32 = this;
              v33 = 2080;
              v34 = v12;
              v35 = 2080;
              v36 = v14;
              _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p: created AID node %s, format %s", buf, 0x30u);

            }
            *((_BYTE *)this + 376) = 1;
            goto LABEL_33;
          }
        }
        else
        {
          v10 = -1;
        }
        v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v6)
                                                                                            + 384)));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          if (v25 >= 0)
            v21 = __p;
          else
            v21 = (void **)__p[0];
          objc_msgSend(*((id *)this + 13), "description");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = objc_msgSend(v22, "UTF8String");
          *(_DWORD *)buf = 136316418;
          v28 = "StreamRenderer.mm";
          v29 = 1024;
          v30 = 636;
          v31 = 2048;
          v32 = this;
          v33 = 2080;
          v34 = v21;
          v35 = 2080;
          v36 = v23;
          v37 = 1024;
          v38 = v10;
          _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: failed to initialize AID node named %s with format %s, err = %d", buf, 0x36u);

        }
        v19 = *((_QWORD *)this + 46);
        if (AudioIssueDetectorLibraryLoader(void)::once != -1)
          dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
        if (!off_254E41A38)
          goto LABEL_33;
LABEL_32:
        off_254E41A38(v19);
LABEL_33:
        if (v25 < 0)
          operator delete(__p[0]);
        goto LABEL_35;
      }
    }
    else
    {
      v8 = -1;
    }
    v15 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v6)
                                                                                        + 384)));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v25 >= 0)
        v16 = __p;
      else
        v16 = (void **)__p[0];
      objc_msgSend(*((id *)this + 13), "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136316418;
      v28 = "StreamRenderer.mm";
      v29 = 1024;
      v30 = 625;
      v31 = 2048;
      v32 = this;
      v33 = 2080;
      v34 = v16;
      v35 = 2080;
      v36 = v18;
      v37 = 1024;
      v38 = v8;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: failed to set format for AID node named %s with format %s, err = %d", buf, 0x36u);

    }
    v19 = *((_QWORD *)this + 46);
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (!off_254E41A38)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_35:
  if (*((_QWORD *)this + 6))
    return *((_BYTE *)this + 136) != 0;
  return 0;
}

void sub_2166D2FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer7PrepareEv_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "prepare");
}

void Phase::Controller::StreamRenderer::InitializeLatencyBuffer(Phase::Controller::StreamRenderer *this, char a2)
{
  NSObject *v4;
  uint64_t v5;
  double v6;
  Phase::Logger *v7;
  double v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[6];
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 6) && *((_BYTE *)this + 136))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4012000000;
    v16 = __Block_byref_object_copy__13;
    v17 = __Block_byref_object_dispose__14;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    applesauce::dispatch::v1::queue::operator*((id *)this + 26);
    v4 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZNK5Phase10Controller14StreamRenderer19GetLatencyInSecondsEv_block_invoke;
    v14[3] = &unk_24D580F58;
    v14[4] = buf;
    v14[5] = this;
    dispatch_sync(v4, v14);

    v5 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 56);
    v6 = *(double *)(*(_QWORD *)&buf[8] + 48);
    _Block_object_dispose(buf, 8);
    if (v5)
    {
      objc_msgSend(*((id *)this + 13), "sampleRate");
      LODWORD(v5) = vcvtpd_u64_f64(v6 * v8);
      if ((a2 & 1) != 0 || (v9 = atomic_load((unsigned int *)this + 40), v9 != (_DWORD)v5))
      {
        if (objc_msgSend(*((id *)this + 18), "frameCapacity") < v5)
        {
          v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", *((_QWORD *)this + 13), v5);
          v11 = (void *)*((_QWORD *)this + 18);
          *((_QWORD *)this + 18) = v10;

          objc_msgSend(*((id *)this + 18), "setFrameLength:", objc_msgSend(*((id *)this + 18), "frameCapacity"));
          v12 = objc_msgSend(*((id *)this + 18), "mutableAudioBufferList");
          *((_QWORD *)this + 19) = v12;
          if (!v12 || !*(_DWORD *)v12 || !*(_QWORD *)(v12 + 16) || !*(_DWORD *)(v12 + 12))
            std::terminate();
        }
        atomic_store(v5, (unsigned int *)this + 40);
        atomic_store(0, *((unsigned int **)this + 21));
      }
    }
    else
    {
      v13 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7) + 384));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "StreamRenderer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1064;
        _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Couldn't get latency in seconds for Stream Renderer.", buf, 0x12u);
      }
    }
  }
}

void sub_2166D32A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Controller::StreamRenderer::Start(Phase::Controller::StreamRenderer *this)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t *v4;
  int v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (!*((_QWORD *)this + 6))
    return 0;
  if (*((_BYTE *)this + 136) && *((_BYTE *)this + 137))
    return 1;
  if (!Phase::Controller::StreamRenderer::Prepare(this))
    return 0;
  Phase::Controller::StreamRenderer::StartStopInternalCaptures(this, 1);
  *((_BYTE *)this + 137) = 0;
  atomic_store(0, (unint64_t *)this + 42);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  applesauce::dispatch::v1::queue::operator*((id *)this + 26);
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___ZN5Phase10Controller14StreamRenderer5StartEv_block_invoke;
  v8[3] = &unk_24D580F58;
  v8[4] = &v9;
  v8[5] = this;
  dispatch_sync(v3, v8);

  v4 = v10;
  v5 = *((unsigned __int8 *)v10 + 24);
  *((_BYTE *)this + 137) = v5;
  if (*((_BYTE *)v4 + 24) && *((_QWORD *)this + 6))
  {
    if (v5)
      v6 = *((_BYTE *)this + 136) == 0;
    else
      v6 = 1;
    v2 = !v6;
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v2;
}

void sub_2166D33E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN5Phase10Controller14StreamRenderer5StartEv_block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  char v4;
  Phase::Logger *v5;
  Phase::Logger *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(id **)(a1 + 40);
  v3 = v2[6];
  v15 = 0;
  v4 = objc_msgSend(v3, "startAndReturnError:", &v15);
  v5 = (Phase::Logger *)v15;
  v6 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v14 = v2[9];
    if (v14 && (objc_msgSend(v14, "play"), (objc_msgSend(v2[9], "isPlaying") & 1) == 0)
      || (objc_msgSend(v2[6], "isRunning") & 1) == 0
      || (objc_msgSend(v2[6], "isInManualRenderingMode") & 1) == 0)
    {
      std::terminate();
    }
  }
  else
  {
    v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v5)
                                                                                       + 384)));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2[13], "description");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "UTF8String");
      -[Phase::Logger description](v6, "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136316162;
      v17 = "StreamRenderer.mm";
      v18 = 1024;
      v19 = 688;
      v20 = 2048;
      v21 = v2;
      v22 = 2080;
      v23 = v10;
      v24 = 2080;
      v25 = v12;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: could not start stream renderer with format %s, err = %s", buf, 0x30u);

    }
    v13 = v2[6];
    v2[6] = 0;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void sub_2166D35D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamRenderer::Pause(uint64_t this)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint64_t v5;
  char v6;

  if (*(_QWORD *)(this + 48))
  {
    v1 = this;
    if (*(_BYTE *)(this + 136))
    {
      if (*(_BYTE *)(this + 137))
      {
        v5 = this + 220;
        v6 = 1;
        caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(this + 220));
        applesauce::dispatch::v1::queue::operator*((id *)(v1 + 208));
        v2 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = ___ZN5Phase10Controller14StreamRenderer5PauseEv_block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0l;
        block[4] = v1;
        dispatch_sync(v2, block);

        applesauce::dispatch::v1::queue::operator*((id *)(v1 + 208));
        v3 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v3, &__block_literal_global_5);

        *(_BYTE *)(v1 + 137) = 0;
        return std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
      }
    }
  }
  return this;
}

void sub_2166D36E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer5PauseEv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v1 + 72), "pause");
  return objc_msgSend(*(id *)(v1 + 48), "pause");
}

uint64_t ___ZN5Phase10Controller14StreamRenderer4StopEv_block_invoke(uint64_t a1)
{
  id *v1;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[9], "stop");
  objc_msgSend(v1[6], "stop");
  objc_msgSend(v1[10], "reset");
  return objc_msgSend(v1[11], "reset");
}

uint64_t Phase::Controller::StreamRenderer::Reset(uint64_t this)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _OWORD *v4;
  Phase::Logger *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(this + 48))
  {
    v1 = this;
    v14 = this + 220;
    v15 = 1;
    caulk::pooled_semaphore_mutex::_lock((caulk::pooled_semaphore_mutex *)(this + 220));
    atomic_store(0, (unsigned __int8 *)(v1 + 216));
    atomic_store(0, (unsigned __int8 *)(v1 + 217));
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    applesauce::dispatch::v1::queue::operator*((id *)(v1 + 208));
    v2 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN5Phase10Controller14StreamRenderer5ResetEv_block_invoke;
    v9[3] = &unk_24D580F58;
    v9[4] = &v10;
    v9[5] = v1;
    dispatch_sync(v2, v9);

    if (*((_BYTE *)v11 + 24))
    {
      applesauce::dispatch::v1::queue::operator*((id *)(v1 + 208));
      v3 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v3, &__block_literal_global_11);

    }
    atomic_store(0, (unint64_t *)(v1 + 336));
    if (*(_BYTE *)(v1 + 288))
      *(_BYTE *)(v1 + 288) = 0;
    v4 = *(_OWORD **)(v1 + 304);
    v4[2] = 0u;
    v4[3] = 0u;
    *v4 = 0u;
    v4[1] = 0u;
    Phase::Controller::StreamRenderer::InitializeLatencyBuffer((Phase::Controller::StreamRenderer *)v1, 1);
    *(_DWORD *)(v1 + 204) = *(_DWORD *)(v1 + 200);
    v6 = *(_QWORD *)(v1 + 368);
    if (!v6)
      goto LABEL_16;
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (off_254E41A38)
    {
      v5 = (Phase::Logger *)off_254E41A38(v6);
      v7 = (int)v5;
      if (!(_DWORD)v5)
      {
LABEL_15:
        *(_BYTE *)(v1 + 376) = 0;
LABEL_16:
        _Block_object_dispose(&v10, 8);
        return std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v14);
      }
    }
    else
    {
      v7 = -1;
    }
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v5) + 384));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "StreamRenderer.mm";
      v18 = 1024;
      v19 = 827;
      v20 = 2048;
      v21 = v1;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: failed to reset AID, err = %d", buf, 0x22u);
    }
    goto LABEL_15;
  }
  return this;
}

void sub_2166D399C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer5ResetEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(*(id *)(v2 + 72), "isPlaying");
  objc_msgSend(*(id *)(v2 + 72), "stop");
  result = objc_msgSend(*(id *)(v2 + 48), "reset");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return objc_msgSend(*(id *)(v2 + 72), "play");
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(result + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void ___ZNK5Phase10Controller14StreamRenderer19GetLatencyInSecondsEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(v2 + 64), "latency");
  v4 = v3 + 0.0;
  v5 = *(_QWORD *)(v2 + 128);
  if ((v5 & 2) == 0)
  {
    objc_msgSend(*(id *)(v2 + 80), "latency");
    v4 = v4 + v6;
    v5 = *(_QWORD *)(v2 + 128);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(*(id *)(v2 + 88), "latency");
    v4 = v4 + v7;
  }
  objc_msgSend(*(id *)(v2 + 48), "outputNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latency");
  v10 = v4 + v9;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)(v11 + 48) = v10;
  *(_BYTE *)(v11 + 56) = 1;
}

void sub_2166D3ADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::StreamRenderer::SetPreset(uint64_t a1, int a2, void *a3, double a4)
{
  Phase::Logger *v7;
  Phase::Logger *v8;
  NSObject *v9;
  NSObject *v10;
  Phase::Logger *v11;
  Phase::Logger *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  Phase::Logger *v23;
  _BYTE *v24;
  uint64_t *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t v32[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[32];
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (a2)
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7) + 384));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "StreamRenderer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1171;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a2;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d unhandled inProcessor %d", buf, 0x18u);
    }
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  if ((*(_BYTE *)(a1 + 128) & 2) != 0)
  {
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 384)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger description](v8, "description");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "StreamRenderer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1162;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempted to set a Loudness Normalizer preset file '%s' on a Stream Renderer that was instantiated without that plugin!", buf, 0x1Cu);

    }
    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__15;
  v41 = __Block_byref_object_dispose__16;
  v42 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  applesauce::dispatch::v1::queue::operator*((id *)(a1 + 208));
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN5Phase10Controller14StreamRenderer9SetPresetENS1_9ProcessorEP5NSURLd_block_invoke;
  block[3] = &unk_24D5817B0;
  v26 = a1;
  v11 = v8;
  v23 = v11;
  v24 = buf;
  v27 = a4;
  v25 = &v28;
  dispatch_sync(v10, block);

  if (*((_BYTE *)v29 + 24) && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    Phase::Controller::StreamRenderer::InitializeLatencyBuffer((Phase::Controller::StreamRenderer *)a1, 0);
    v18 = 1;
  }
  else
  {
    v13 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v12)
                                                                                        + 384)));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger description](v11, "description");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v14, "UTF8String");
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "description");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)v32 = 136315906;
      v33 = "StreamRenderer.mm";
      v34 = 1024;
      v35 = 1150;
      v36 = 2080;
      v37 = v15;
      v38 = 2080;
      v39 = v17;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d [AVAudioFile loadAudioUnitPresetAtURL] failed to load a Loudness Normalizer preset file '%s' with error '%s'!", v32, 0x26u);

    }
    v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v18;
}

void sub_2166D3E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 144), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void ___ZN5Phase10Controller14StreamRenderer9SetPresetENS1_9ProcessorEP5NSURLd_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  Phase::Logger *v7;
  double v8;
  float v9;
  NSObject *v11;
  uint64_t v12;
  Phase::Logger *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  id obj;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(v2 + 80);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "loadAudioUnitPresetAtURL:error:", v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    v8 = *(double *)(a1 + 64);
    v9 = v8;
    if (v8 < -60.0 || v8 > -3.0)
    {
      v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 384));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        v19 = "StreamRenderer.mm";
        v20 = 1024;
        v21 = 1125;
        v22 = 2048;
        v23 = v12;
        v24 = 2048;
        v25 = 0xC04E000000000000;
        v26 = 2048;
        v27 = 0xC008000000000000;
        _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d inTargetLKFS: %f is out of range for AULN [%f, %f]. Clamping.", buf, 0x30u);
      }
      v9 = fminf(fmaxf(v9, -60.0), -3.0);
    }
    v13 = (Phase::Logger *)AudioUnitSetParameter((AudioUnit)objc_msgSend(*(id *)(v2 + 80), "audioUnit"), 2u, 0, 0, v9, 0);
    v14 = (int)v13;
    if ((_DWORD)v13)
    {
      v15 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13) + 384));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 136315906;
        v19 = "StreamRenderer.mm";
        v20 = 1024;
        v21 = 1140;
        v22 = 2048;
        v23 = v16;
        v24 = 1024;
        LODWORD(v25) = v14;
        _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d [AVAudioFile loadAudioUnitPresetAtURL] failed to set Loudness Normalizer targetLKFS of value '%f' with error '%d'!", buf, 0x22u);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t Phase::Controller::StreamRenderer::ConfigureDSPGraph(Phase::Controller::StreamRenderer *this, NSURL *a2, NSURL *a3)
{
  NSURL *v5;
  NSURL *v6;
  void *v7;
  char v8;
  Phase::Logger *v9;
  Phase::Logger *v10;
  void *v11;
  char v12;
  Phase::Logger *v13;
  Phase::Logger *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  Phase::Logger *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSURL *v26;
  __int16 v27;
  Phase::Logger *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*((_QWORD *)this + 11);
  v20 = 0;
  v8 = objc_msgSend(v7, "loadDSPGraphAtURL:error:", v5, &v20);
  v9 = (Phase::Logger *)v20;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (v6)
    {
      v11 = (void *)*((_QWORD *)this + 11);
      v19 = v10;
      v12 = objc_msgSend(v11, "loadAudioUnitProcessingStripAtURL:error:", v6, &v19);
      v13 = v19;

      if ((v12 & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        v17 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v14) + 384));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v22 = "StreamRenderer.mm";
          v23 = 1024;
          v24 = 1194;
          v25 = 2112;
          v26 = v6;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to load austrip file %@: %@", buf, 0x26u);
        }
        v15 = 0;
      }
      v10 = v13;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9) + 384));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "StreamRenderer.mm";
      v23 = 1024;
      v24 = 1186;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to load dspg file %@: %@", buf, 0x26u);
    }
    v15 = 0;
  }

  return v15;
}

void sub_2166D4340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

AVAudioTime *Phase::Controller::StreamRenderer::GetScheduleTime(Phase::Controller::StreamRenderer *this, AVAudioTime *a2)
{
  AVAudioTime *v3;
  AVAudioTime *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  AVAudioTime *v13;
  _QWORD v15[7];
  int v16;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_17;
  if (-[AVAudioTime isHostTimeValid](v3, "isHostTimeValid"))
  {
    if (!*((_BYTE *)this + 288) || (*((_BYTE *)this + 280) & 3) == 0)
      goto LABEL_16;
    objc_msgSend(*((id *)this + 13), "sampleRate");
    v6 = v5;
    if (!*((_QWORD *)this + 37))
    {
      if (!*((_BYTE *)this + 288))
        std::__throw_bad_optional_access[abi:ne180100]();
      objc_msgSend(MEMORY[0x24BDB1880], "timeWithAudioTimeStamp:sampleRate:", (char *)this + 224, v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)this + 37);
      *((_QWORD *)this + 37) = v7;

      if (!objc_msgSend(*((id *)this + 37), "isHostTimeValid")
        || (objc_msgSend(*((id *)this + 37), "isSampleTimeValid") & 1) == 0)
      {
        goto LABEL_16;
      }
    }
    v16 = 2;
    v15[1] = -[AVAudioTime hostTime](v4, "hostTime");
    objc_msgSend(MEMORY[0x24BDB1880], "timeWithAudioTimeStamp:sampleRate:", v15, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extrapolateTimeFromAnchor:", *((_QWORD *)this + 37));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isSampleTimeValid") & 1) == 0)
LABEL_16:
      std::terminate();
    v11 = objc_msgSend(v10, "sampleTime");
    v12 = objc_msgSend(*((id *)this + 37), "sampleTime");
    objc_msgSend(MEMORY[0x24BDB1880], "timeWithSampleTime:atRate:", v11 - v12, v6);
    v13 = (AVAudioTime *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_18;
    goto LABEL_14;
  }
  if (!-[AVAudioTime isSampleTimeValid](v4, "isSampleTimeValid"))
  {
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v13 = v4;
LABEL_14:
  if (-[AVAudioTime isHostTimeValid](v13, "isHostTimeValid")
    || !-[AVAudioTime isSampleTimeValid](v13, "isSampleTimeValid"))
  {
    goto LABEL_16;
  }
LABEL_18:

  return v13;
}

void sub_2166D44FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL Phase::Controller::StreamRenderer::ScheduleBuffer(Phase::Controller::StreamRenderer *this, AVAudioPCMBuffer *a2, AVAudioTime *a3, unint64_t a4)
{
  return Phase::Controller::StreamRenderer::ScheduleBuffer((uint64_t)this, a2, a3, a4, 0, 0);
}

BOOL Phase::Controller::StreamRenderer::ScheduleBuffer(uint64_t a1, void *a2, void *a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  AVAudioTime *v12;
  Phase::Logger *v13;
  Phase::Logger *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v26;
  std::runtime_error *exception;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *);
  void *v31;
  id v32;
  id v33;
  Phase::Logger *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v26 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13) + 384));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "StreamRenderer.mm";
      v40 = 1024;
      v41 = 1265;
      v42 = 2048;
      v43 = a1;
      _os_log_impl(&dword_2164CC000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [pInBuffer == nil is true]: \"bufferstream@%p: nil buffer!\"", buf, 0x1Cu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "bufferstream@%p: nil buffer!");
  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
  {
    if (a5)
      std::terminate();
    Phase::Controller::StreamRenderer::GetScheduleTime((Phase::Controller::StreamRenderer *)a1, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    applesauce::dispatch::v1::queue::operator*((id *)(a1 + 208));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (a4 >> 1) & 7;
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = ___ZN5Phase10Controller14StreamRenderer14ScheduleBufferEP16AVAudioPCMBufferP11AVAudioTimem42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke;
    v31 = &unk_24D581800;
    v35 = a1;
    v34 = v14;
    v19 = v11;
    v32 = v19;
    v20 = v16;
    v33 = v20;
    v36 = v18;
    v37 = 0;
    dispatch_sync(v17, &v28);

    Phase::Controller::StreamRenderer::StartStopInternalCaptures((Phase::Controller::StreamRenderer *)a1, 1);
    v21 = objc_msgSend(v19, "frameLength", v28, v29, v30, v31);
    v22 = objc_msgSend(v19, "audioBufferList");
    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v23 + 24))(v23, v21, v22, 0);
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 72))(v23);
    }

  }
  else
  {
    v24 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13) + 384));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v39 = "StreamRenderer.mm";
      v40 = 1024;
      v41 = 1270;
      v42 = 2048;
      v43 = a1;
      v44 = 2048;
      v45 = v11;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d bufferstream@%p: uninitialized, could not schedule buffer@%p", buf, 0x26u);
    }
    if (v14)
      (*((void (**)(Phase::Logger *, uint64_t))v14 + 2))(v14, a5);
  }

  return v15 != 0;
}

void sub_2166D4850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  __cxa_free_exception(v18);

  _Unwind_Resume(a1);
}

void ___ZN5Phase10Controller14StreamRenderer14ScheduleBufferEP16AVAudioPCMBufferP11AVAudioTimem42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v1 = (void *)a1[6];
  v2 = *(void **)(a1[7] + 72);
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[8];
  if (v1)
  {
    v7 = a1[9] == 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN5Phase10Controller14StreamRenderer14ScheduleBufferEP16AVAudioPCMBufferP11AVAudioTimem42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2;
    v10[3] = &unk_24D5817D8;
    v8 = v1;
    v9 = a1[9];
    v11 = v8;
    v12 = v9;
    objc_msgSend(v2, "scheduleBuffer:atTime:options:completionCallbackType:completionHandler:", v3, v4, v5, v7, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1[7] + 72), "scheduleBuffer:atTime:options:completionHandler:", v3, v4, v5, 0);
  }
}

void sub_2166D4998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer14ScheduleBufferEP16AVAudioPCMBufferP11AVAudioTimem42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL Phase::Controller::StreamRenderer::ScheduleFile(Phase::Controller::StreamRenderer *this, AVAudioFile *a2, AVAudioTime *a3, char a4)
{
  return Phase::Controller::StreamRenderer::ScheduleFile((uint64_t)this, a2, a3, a4, 0, 0);
}

BOOL Phase::Controller::StreamRenderer::ScheduleFile(uint64_t a1, void *a2, void *a3, char a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  Phase::Logger *v13;
  Phase::Logger *v14;
  unsigned __int8 v15;
  NSObject *v16;
  AVAudioFile *v17;
  _BOOL8 v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v25;
  std::runtime_error *exception;
  _QWORD block[4];
  id v28;
  AVAudioFile *v29;
  Phase::Logger *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  AudioTimeStamp buf;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v25 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13) + 384));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.mSampleTime) = 136315650;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1332;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [pInFile == nil is true]: \"bufferstream@%p: Error: nil file!\"", (uint8_t *)&buf, 0x1Cu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "bufferstream@%p: Error: nil file!");
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (a5)
      std::terminate();
    v15 = atomic_load((unsigned __int8 *)(a1 + 216));
    if ((v15 & 1) == 0)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 1;
      applesauce::dispatch::v1::queue::operator*((id *)(a1 + 208));
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___ZN5Phase10Controller14StreamRenderer12ScheduleFileEP11AVAudioFileP11AVAudioTimeb42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke;
      block[3] = &unk_24D581828;
      v32 = a1;
      v34 = a4;
      v28 = v12;
      v30 = v14;
      v17 = (AVAudioFile *)v11;
      v33 = 0;
      v29 = v17;
      v31 = &v35;
      dispatch_sync(v16, block);

      Phase::Controller::StreamRenderer::StartStopInternalCaptures((Phase::Controller::StreamRenderer *)a1, 1);
      Phase::Controller::StreamRenderer::IOConfiguration::WriteCaptureFile((Phase::Controller::StreamRenderer::IOConfiguration *)(a1 + 24), &buf, v17, 0, -[AVAudioFile length](v17, "length"));
      v18 = *((_BYTE *)v36 + 24) != 0;

      _Block_object_dispose(&v35, 8);
      goto LABEL_14;
    }
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                        + 384)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "url");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(buf.mSampleTime) = 136315906;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1353;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      WORD2(buf.mWordClockTime) = 2080;
      *(UInt64 *)((char *)&buf.mWordClockTime + 6) = objc_msgSend(v23, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p: Warning: a looping file is previously scheduled, cannot schedule file [%s]", (uint8_t *)&buf, 0x26u);

    }
  }
  else
  {
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                        + 384)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "description");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(buf.mSampleTime) = 136315906;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1338;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      WORD2(buf.mWordClockTime) = 2080;
      *(UInt64 *)((char *)&buf.mWordClockTime + 6) = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: Error: uninitialized, could not schedule file [%s]", (uint8_t *)&buf, 0x26u);

    }
  }

  if (v14)
    (*((void (**)(Phase::Logger *, uint64_t))v14 + 2))(v14, a5);
  v18 = 0;
LABEL_14:

  return v18;
}

void sub_2166D4DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void ___ZN5Phase10Controller14StreamRenderer12ScheduleFileEP11AVAudioFileP11AVAudioTimeb42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(a1 + 80))
  {
    atomic_store(1u, (unsigned __int8 *)(v2 + 216));
    atomic_store(0, (unsigned __int8 *)(v2 + 217));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = Phase::Controller::StreamRenderer::ScheduleLoopingFile(v2, *(void **)(a1 + 40), *(void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(void **)(a1 + 48));
  }
  else
  {
    Phase::Controller::StreamRenderer::GetScheduleTime(*(Phase::Controller::StreamRenderer **)(a1 + 64), *(AVAudioTime **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(v2 + 72);
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = v7 == 0;
    if (v5)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = ___ZN5Phase10Controller14StreamRenderer12ScheduleFileEP11AVAudioFileP11AVAudioTimeb42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2;
      v11[3] = &unk_24D5817D8;
      v9 = v5;
      v10 = *(_QWORD *)(a1 + 72);
      v12 = v9;
      v13 = v10;
      objc_msgSend(v4, "scheduleFile:atTime:completionCallbackType:completionHandler:", v6, v3, v8, v11);

    }
    else
    {
      objc_msgSend(v4, "scheduleFile:atTime:completionCallbackType:completionHandler:", *(_QWORD *)(a1 + 40), v3, v7 == 0, 0);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
}

void sub_2166D4F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer12ScheduleFileEP11AVAudioFileP11AVAudioTimeb42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t Phase::Controller::StreamRenderer::ScheduleLoopingFile(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  double v11;
  double v12;
  Phase::Logger *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  Phase::Logger *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void (**v31)(void);
  unsigned __int8 v32;
  NSObject *v34;
  void *v35;
  id v36;
  std::runtime_error *exception;
  AVAudioTime *v38;
  void (**v39)(void);
  _QWORD v40[4];
  id v41;
  void (**v42)(void);
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v38 = a3;
  v39 = a5;
  if (!v9 || !*(_QWORD *)(a1 + 48))
    std::terminate();
  objc_msgSend(v9, "fileFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleRate");
  v12 = v11;

  if (v12 <= 0.0)
  {
    v34 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                        + 384)));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "fileFormat");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "description");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315906;
      v46 = "StreamRenderer.mm";
      v47 = 1024;
      v48 = 1421;
      v49 = 2048;
      v50 = a1;
      v51 = 2080;
      v52 = objc_msgSend(v36, "UTF8String");
      _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [pInFile.fileFormat.sampleRate <= 0 is true]: \"bufferstream@%p: Error: invalid file format %s!\"", buf, 0x26u);

    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "bufferstream@%p: Error: invalid file format %s!");
  }
  v14 = objc_msgSend(v9, "length");
  objc_msgSend(v9, "fileFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleRate");
  v17 = (double)v14 / v16;

  if (v17 <= 0.0)
  {
    v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                        + 384)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "url");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "description");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315906;
      v46 = "StreamRenderer.mm";
      v47 = 1024;
      v48 = 1427;
      v49 = 2048;
      v50 = a1;
      v51 = 2080;
      v52 = objc_msgSend(v30, "UTF8String");
      _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p: Warning: trying to schedule a zero length looping file [%s], no-op", buf, 0x26u);

    }
    v31 = v39;
    if (!v39)
    {
      v27 = 0;
      goto LABEL_26;
    }
    v39[2]();
  }
  else
  {
    v19 = 0;
    v20 = vcvtpd_s64_f64(3.0 / v17);
    if (v20 <= 2)
      v21 = 2;
    else
      v21 = v20;
    v22 = MEMORY[0x24BDAC760];
    while (1)
    {
      if (v19)
      {
        v23 = 0;
      }
      else
      {
        Phase::Controller::StreamRenderer::GetScheduleTime((Phase::Controller::StreamRenderer *)a1, v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = atomic_load((unsigned __int8 *)(a1 + 216));
      if ((v24 & 1) == 0)
        break;
      v25 = *(void **)(a1 + 72);
      v40[0] = v22;
      v40[1] = 3221225472;
      v40[2] = ___ZN5Phase10Controller14StreamRenderer19ScheduleLoopingFileEP11AVAudioFileP11AVAudioTime42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke;
      v40[3] = &unk_24D581878;
      v43 = a1;
      v26 = v9;
      v41 = v26;
      v44 = a4;
      v42 = v39;
      objc_msgSend(v25, "scheduleFile:atTime:completionCallbackType:completionHandler:", v26, v23, 0, v40);

      if (v21 == ++v19)
      {
        v27 = 1;
        goto LABEL_25;
      }
    }
    v32 = atomic_load((unsigned __int8 *)(a1 + 217));
    if ((v32 & 1) == 0)
    {
      if (v39)
        v39[2]();
      atomic_store(1u, (unsigned __int8 *)(a1 + 217));
    }

  }
  v27 = 0;
LABEL_25:
  v31 = v39;
LABEL_26:

  return v27;
}

void sub_2166D53C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void Phase::Controller::StreamRenderer::IOConfiguration::WriteCaptureFile(Phase::Controller::StreamRenderer::IOConfiguration *this, const AudioTimeStamp *a2, AVAudioFile *a3, uint64_t a4, uint64_t a5)
{
  AVAudioFile *v9;
  id v10;
  void *v11;
  void *v12;
  Phase::Logger *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  Phase::Logger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  Phase::Logger *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *context;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  Phase::Controller::StreamRenderer::IOConfiguration *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if ((_DWORD)a5 && *((_QWORD *)this + 2))
  {
    context = (void *)MEMORY[0x2199FA298]();
    v10 = objc_alloc(MEMORY[0x24BDB1838]);
    -[AVAudioFile processingFormat](v9, "processingFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithPCMFormat:frameCapacity:", v11, a5);

    if (!v12)
    {
      v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                          + 384)));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[AVAudioFile url](v9, "url");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315906;
        v40 = "StreamRenderer.mm";
        v41 = 1024;
        v42 = 1874;
        v43 = 2048;
        v44 = this;
        v45 = 2080;
        v46 = objc_msgSend(v26, "UTF8String");
        _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: <debug captures> error allocating buffer for file [%s]", buf, 0x26u);

      }
      goto LABEL_18;
    }
    v14 = objc_alloc(MEMORY[0x24BDB1810]);
    -[AVAudioFile url](v9, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v16 = objc_msgSend(v14, "initForReading:commonFormat:interleaved:error:", v15, 1, 0, &v38);
    v17 = v38;

    if (v17)
    {
      v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                          + 384)));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[AVAudioFile url](v9, "url");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "description");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v22 = objc_msgSend(v21, "UTF8String");
        -[NSObject localizedDescription](v17, "localizedDescription");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v23, "UTF8String");
        *(_DWORD *)buf = 136316162;
        v40 = "StreamRenderer.mm";
        v41 = 1024;
        v42 = 1889;
        v43 = 2048;
        v44 = this;
        v45 = 2080;
        v46 = v22;
        v47 = 2080;
        v48 = v24;
        _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: <debug captures> error initing file for reading [%s], Error: %s", buf, 0x30u);

      }
    }
    else if (v16)
    {
      -[NSObject setFramePosition:](v16, "setFramePosition:", a4);
      v37 = 0;
      -[AVAudioFile readIntoBuffer:error:](v9, "readIntoBuffer:error:", v12, &v37);
      v27 = (Phase::Logger *)v37;
      v17 = v27;
      if (!v27)
      {
        v27 = (Phase::Logger *)objc_msgSend(v12, "frameLength");
        if ((_DWORD)v27)
        {
          Phase::Controller::StreamRenderer::IOConfiguration::WriteCaptureBufferList(*((_QWORD *)this + 2), a2, objc_msgSend(v12, "frameLength"), (const AudioBufferList *)objc_msgSend(v12, "audioBufferList"));
          goto LABEL_18;
        }
      }
      v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v27)
                                                                                          + 384)));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[AVAudioFile url](v9, "url");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "description");
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v31 = objc_msgSend(v30, "UTF8String");
        v32 = -[NSObject code](v17, "code");
        *(_DWORD *)buf = 136316162;
        v40 = "StreamRenderer.mm";
        v41 = 1024;
        v42 = 1908;
        v43 = 2048;
        v44 = this;
        v45 = 2080;
        v46 = v31;
        v47 = 1024;
        LODWORD(v48) = v32;
        _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: <debug captures> error reading from file [%s], %d", buf, 0x2Cu);

      }
    }
    else
    {
      v17 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                          + 384)));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[AVAudioFile url](v9, "url");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "description");
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = objc_msgSend(v34, "UTF8String");
        *(_DWORD *)buf = 136315906;
        v40 = "StreamRenderer.mm";
        v41 = 1024;
        v42 = 1897;
        v43 = 2048;
        v44 = this;
        v45 = 2080;
        v46 = v35;
        _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: <debug captures> Could not create file for reading [%s]", buf, 0x26u);

      }
    }

LABEL_18:
    objc_autoreleasePoolPop(context);
  }

}

void sub_2166D5964(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *exc_bufa, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, __int16 a16, __int16 a17, __int128 a18, uint64_t a19, __int128 a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  Phase::Logger *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;

  if (a2 == 1)
  {
    v26 = (Phase::Logger *)objc_begin_catch(a1);
    v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v26)
                                                                                        + 384)));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "description");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      -[Phase::Logger name](v26, "name");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "UTF8String");
      -[Phase::Logger reason](v26, "reason");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = objc_msgSend(v33, "UTF8String");
      LODWORD(buf) = 136316418;
      *(_QWORD *)((char *)&buf + 4) = "StreamRenderer.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 1919;
      a17 = 2048;
      WORD2(a18) = 2080;
      *(_QWORD *)((char *)&a18 + 6) = v30;
      HIWORD(a18) = 2080;
      a19 = v32;
      LOWORD(a20) = 2080;
      *(_QWORD *)((char *)&a20 + 2) = v34;
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: <debug captures> exception caught reading from file [%s], Name: %s, Reason: %s", (uint8_t *)&buf, 0x3Au);

    }
    objc_end_catch();
    JUMPOUT(0x2166D58E4);
  }

  _Unwind_Resume(a1);
}

void ___ZN5Phase10Controller14StreamRenderer19ScheduleLoopingFileEP11AVAudioFileP11AVAudioTime42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = atomic_load((unsigned __int8 *)(v2 + 216));
  if ((v3 & 1) != 0)
  {
    applesauce::dispatch::v1::queue::operator*((id *)(v2 + 208));
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN5Phase10Controller14StreamRenderer19ScheduleLoopingFileEP11AVAudioFileP11AVAudioTime42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2;
    v9[3] = &unk_24D581850;
    v12 = v2;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 56);
    v10 = v7;
    v13 = v8;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v6, v9);

  }
  else
  {
    v4 = atomic_load((unsigned __int8 *)(v2 + 217));
    if ((v4 & 1) == 0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 56));
      atomic_store(1u, (unsigned __int8 *)(v2 + 217));
    }
  }
}

uint64_t ___ZN5Phase10Controller14StreamRenderer19ScheduleLoopingFileEP11AVAudioFileP11AVAudioTime42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2(_QWORD *a1)
{
  return Phase::Controller::StreamRenderer::ScheduleLoopingFile(a1[6], a1[4], 0, a1[7], a1[5]);
}

BOOL Phase::Controller::StreamRenderer::ScheduleSegment(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  Phase::Logger *v15;
  Phase::Logger *v16;
  uint64_t v17;
  NSObject *v18;
  AVAudioFile *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v24;
  std::runtime_error *exception;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  AVAudioFile *v29;
  Phase::Logger *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  AudioTimeStamp buf;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  v16 = v15;
  if (!v13)
  {
    v24 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v15) + 384));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.mSampleTime) = 136315650;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1505;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [pInFile == nil is true]: \"bufferstream@%p: nil file!\"", (uint8_t *)&buf, 0x1Cu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "bufferstream@%p: nil file!");
LABEL_19:
  }
  if (a4 < 0 || !(_DWORD)a5)
  {
    v26 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v15) + 384));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.mSampleTime) = 136316162;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1507;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      WORD2(buf.mWordClockTime) = 2048;
      *(UInt64 *)((char *)&buf.mWordClockTime + 6) = a4;
      HIWORD(buf.mSMPTETime.mCounter) = 1024;
      buf.mSMPTETime.mType = a5;
      _os_log_impl(&dword_2164CC000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [inStartFrame < 0 || inNumberOfFrames <= 0 is true]: \"bufferstream@%p: invalid frame position/count, [%lld, %u]!\"", (uint8_t *)&buf, 0x2Cu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "bufferstream@%p: invalid frame position/count, [%lld, %u]!");
    goto LABEL_19;
  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
  {
    if (a6)
      std::terminate();
    applesauce::dispatch::v1::queue::operator*((id *)(a1 + 208));
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN5Phase10Controller14StreamRenderer15ScheduleSegmentEP11AVAudioFileP11AVAudioTimexj42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke;
    block[3] = &unk_24D5818A0;
    v31 = a1;
    v28 = v14;
    v30 = v16;
    v19 = (AVAudioFile *)v13;
    v29 = v19;
    v32 = a4;
    v33 = 0;
    v34 = a5;
    dispatch_sync(v18, block);

    Phase::Controller::StreamRenderer::StartStopInternalCaptures((Phase::Controller::StreamRenderer *)a1, 1);
    Phase::Controller::StreamRenderer::IOConfiguration::WriteCaptureFile((Phase::Controller::StreamRenderer::IOConfiguration *)(a1 + 24), &buf, v19, a4, a5);

  }
  else
  {
    v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v15)
                                                                                        + 384)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "url");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "description");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(buf.mSampleTime) = 136315906;
      *(_QWORD *)((char *)&buf.mSampleTime + 4) = "StreamRenderer.mm";
      WORD2(buf.mHostTime) = 1024;
      *(_DWORD *)((char *)&buf.mHostTime + 6) = 1512;
      WORD1(buf.mRateScalar) = 2048;
      *(_QWORD *)((char *)&buf.mRateScalar + 4) = a1;
      WORD2(buf.mWordClockTime) = 2080;
      *(UInt64 *)((char *)&buf.mWordClockTime + 6) = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d bufferstream@%p: uninitialized, could not schedule file [%s]", (uint8_t *)&buf, 0x26u);

    }
    if (v16)
      (*((void (**)(Phase::Logger *, uint64_t))v16 + 2))(v16, a6);
  }

  return v17 != 0;
}

void sub_2166D609C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void ___ZN5Phase10Controller14StreamRenderer15ScheduleSegmentEP11AVAudioFileP11AVAudioTimexj42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke(uint64_t a1)
{
  Phase::Controller::StreamRenderer *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v2 = *(Phase::Controller::StreamRenderer **)(a1 + 56);
  Phase::Controller::StreamRenderer::GetScheduleTime(v2, *(AVAudioTime **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)v2 + 9);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = *(unsigned int *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v10 = v8 == 0;
  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN5Phase10Controller14StreamRenderer15ScheduleSegmentEP11AVAudioFileP11AVAudioTimexj42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2;
    v13[3] = &unk_24D5817D8;
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 72);
    v14 = v11;
    v15 = v12;
    objc_msgSend(v4, "scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:", v6, v9, v7, v3, v10, v13);

  }
  else
  {
    objc_msgSend(v4, "scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 80), v3, v8 == 0, 0);
  }

}

void sub_2166D621C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN5Phase10Controller14StreamRenderer15ScheduleSegmentEP11AVAudioFileP11AVAudioTimexj42PHASEPushStreamCompletionCallbackConditionU13block_pointerFvS6_E_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL Phase::Controller::StreamRenderer::RenderOffline(id *this, unint64_t a2, AVAudioPCMBuffer *a3)
{
  AVAudioPCMBuffer *v5;
  AVAudioPCMBuffer *v6;
  NSObject *v7;
  void *v8;
  char v9;
  Phase::Logger *v10;
  AVAudioFrameCount v11;
  vDSP_Length v12;
  unsigned int *v13;
  AudioBufferList *v14;
  _BOOL8 v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  Phase::Controller::StreamRenderer *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (((_BYTE)this[16] & 1) == 0)
  {
    v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)v5) + 384));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315650;
      v24 = "StreamRenderer.mm";
      v25 = 1024;
      v26 = 1570;
      v27 = 2048;
      v28 = (Phase::Controller::StreamRenderer *)this;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: Error: must be setup in offline mode before calling RenderOffline!", (uint8_t *)&v23, 0x1Cu);
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  -[AVAudioPCMBuffer format](v5, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", this[13]);

  if ((v9 & 1) == 0)
  {
    v17 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v10)
                                                                                        + 384)));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(this[13], "description");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = objc_msgSend(v18, "UTF8String");
      -[AVAudioPCMBuffer format](v6, "format");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "description");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = 136316162;
      v24 = "StreamRenderer.mm";
      v25 = 1024;
      v26 = 1578;
      v27 = 2048;
      v28 = (Phase::Controller::StreamRenderer *)this;
      v29 = 2080;
      v30 = v19;
      v31 = 2080;
      v32 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: Error: mismatch in the format of the buffer, expected %s, given %s", (uint8_t *)&v23, 0x30u);

    }
    goto LABEL_15;
  }
  v11 = -[AVAudioPCMBuffer frameCapacity](v6, "frameCapacity");
  if (v11 >= a2)
    v12 = a2;
  else
    v12 = v11;
  v33 = 0;
  -[AVAudioPCMBuffer setFrameLength:](v6, "setFrameLength:", -[AVAudioPCMBuffer frameCapacity](v6, "frameCapacity"));
  v13 = (unsigned int *)-[AVAudioPCMBuffer mutableAudioBufferList](v6, "mutableAudioBufferList");
  v15 = Phase::Controller::StreamRenderer::IORender((Phase::Controller::StreamRenderer *)this, &v23, v12, v13, v14);
  if (v15)
    v16 = a2;
  else
    v16 = 0;
  -[AVAudioPCMBuffer setFrameLength:](v6, "setFrameLength:", v16);
LABEL_16:

  return v15;
}

void sub_2166D64B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

BOOL Phase::Controller::StreamRenderer::IORender(Phase::Controller::StreamRenderer *this, _OWORD *a2, vDSP_Length a3, unsigned int *a4, AudioBufferList *a5)
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v25;
  uint64_t v26;
  _DWORD *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int *v31;
  uint64_t ShouldFire;
  uint64_t i;
  unsigned int *v34;
  unsigned int v35;
  unsigned int v36;
  _DWORD *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  _BOOL8 v46;
  unint64_t v47;
  void **v48;
  uint64_t v49;
  _DWORD *v50;
  int v51;
  uint64_t v52;
  _OWORD *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  float v59;
  uint64_t v61;
  _OWORD *v62;
  char *v63;
  char v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  Phase::Controller::StreamRenderer *v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (!a4 || !*a4)
    return 0;
  if (!this)
    goto LABEL_80;
  v63 = (char *)this + 220;
  v64 = caulk::pooled_semaphore_mutex::try_lock((Phase::Controller::StreamRenderer *)((char *)this + 220));
  if ((v64 & 1) == 0)
  {
    if (*a4)
    {
      v47 = 0;
      v48 = (void **)(a4 + 4);
      do
      {
        v46 = *v48 != 0;
        if (!*v48)
          break;
        bzero(*v48, *((unsigned int *)v48 - 1));
        ++v47;
        v48 += 2;
      }
      while (v47 < *a4);
    }
    else
    {
      v46 = 1;
    }
    goto LABEL_78;
  }
  if (!*((_QWORD *)this + 6) || !*((_BYTE *)this + 136) || !*((_BYTE *)this + 137))
  {
    v46 = 0;
    goto LABEL_78;
  }
  if (!*((_BYTE *)this + 288))
  {
    v9 = *a2;
    v10 = a2[1];
    v11 = a2[3];
    *((_OWORD *)this + 16) = a2[2];
    *((_OWORD *)this + 17) = v11;
    *((_OWORD *)this + 14) = v9;
    *((_OWORD *)this + 15) = v10;
    *((_BYTE *)this + 288) = 1;
  }
  v12 = (_OWORD *)*((_QWORD *)this + 38);
  v13 = *a2;
  v14 = a2[1];
  v15 = a2[3];
  v12[2] = a2[2];
  v12[3] = v15;
  *v12 = v13;
  v12[1] = v14;
  **((_QWORD **)this + 40) = 0;
  v16 = atomic_load(*((unsigned int **)this + 21));
  LODWORD(v12) = atomic_load((unsigned int *)this + 40);
  if (v16 < v12)
  {
    do
    {
      v17 = *((_QWORD *)this + 19);
      if (!v17)
        break;
      v18 = *(_DWORD *)(v17 + 12);
      v19 = atomic_load((unsigned int *)this + 40);
      v20 = atomic_load(*((unsigned int **)this + 21));
      v21 = v19 - v20;
      if (v21 >= *((_DWORD *)this + 28))
        v22 = *((_DWORD *)this + 28);
      else
        v22 = v21;
      (*(void (**)(void))(*((_QWORD *)this + 7) + 16))();
      v23 = (unsigned int *)*((_QWORD *)this + 21);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 + v22, v23));
      v25 = (unsigned int *)*((_QWORD *)this + 19);
      v26 = *v25;
      if ((_DWORD)v26)
      {
        v27 = v25 + 3;
        do
        {
          *v27 = v18;
          v27 += 4;
          --v26;
        }
        while (v26);
      }
      v28 = atomic_load(*((unsigned int **)this + 21));
      v29 = atomic_load((unsigned int *)this + 40);
    }
    while (v28 < v29);
  }
  v62 = a2;
  v30 = *a4;
  if (!(_DWORD)v30 || !*((_QWORD *)a4 + 2))
LABEL_80:
    std::terminate();
  MEMORY[0x24BDAC7A8]();
  v31 = (int *)((char *)&v61 - ((4 * v30 + 15) & 0x7FFFFFFF0));
  bzero(v31, 4 * v30);
  for (i = 0; i != v30; ++i)
  {
    v34 = &a4[i * 4];
    v35 = v34[2];
    v31[i] = v34[3];
    v34[3] = 4 * a3 * v35;
  }
  if (!(_DWORD)a3)
  {
    v46 = 1;
    goto LABEL_58;
  }
  v36 = a3;
  while (1)
  {
    v37 = (_DWORD *)*((_QWORD *)this + 24);
    if (!v37)
    {
      *(_DWORD *)buf = 0;
      ShouldFire = (*(uint64_t (**)(void))(*((_QWORD *)this + 7) + 16))();
      v36 = 0;
      goto LABEL_43;
    }
    v38 = *((_DWORD *)this + 50);
    v39 = *((_DWORD *)this + 51);
    v40 = v38 - v39;
    if (v38 <= v39)
      break;
    if (*v37 != *a4)
      goto LABEL_80;
    if (v36 >= v40)
      v41 = v40;
    else
      v41 = v36;
    if (*v37)
    {
      v42 = 0;
      v43 = 4;
      do
      {
        ShouldFire = (uint64_t)memcpy((void *)(*(_QWORD *)&a4[v43] + 4 * a3 - 4 * v36), (const void *)(*(_QWORD *)&v37[v43] + 4 * *((unsigned int *)this + 51)), 4 * v41);
        ++v42;
        v37 = (_DWORD *)*((_QWORD *)this + 24);
        v43 += 4;
      }
      while (v42 < *v37);
      v39 = *((_DWORD *)this + 51);
    }
    v36 -= v41;
    *((_DWORD *)this + 51) = v39 + v41;
    **((_QWORD **)this + 40) += v41;
LABEL_45:
    if (!v36)
    {
      v46 = 1;
      goto LABEL_57;
    }
  }
  *(_DWORD *)buf = 0;
  v44 = *v37;
  if ((_DWORD)v44)
  {
    v45 = v37 + 3;
    do
    {
      *v45 = 4 * v38;
      v45 += 4;
      --v44;
    }
    while (v44);
  }
  ShouldFire = (*(uint64_t (**)(void))(*((_QWORD *)this + 7) + 16))();
  *((_DWORD *)this + 51) = 0;
LABEL_43:
  if (ShouldFire != -1)
  {
    if (ShouldFire == 2)
      goto LABEL_80;
    goto LABEL_45;
  }
  v46 = 0;
LABEL_57:
  LODWORD(v30) = *a4;
LABEL_58:
  if ((_DWORD)v30)
  {
    v49 = v30;
    v50 = a4 + 3;
    do
    {
      v51 = *v31++;
      *v50 = v51;
      v50 += 4;
      --v49;
    }
    while (v49);
  }
  v52 = *((_QWORD *)this + 2);
  v53 = v62;
  if (v52)
  {
    (*(void (**)(_QWORD, vDSP_Length, unsigned int *, _QWORD))(*(_QWORD *)v52 + 24))(*((_QWORD *)this + 2), a3, a4, 0);
    ShouldFire = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, vDSP_Length))(*(_QWORD *)v52 + 72))(v52, *((_QWORD *)v53 + 1), (uint64_t)*(double *)v53, a3);
  }
  v54 = (unint64_t *)((char *)this + 336);
  do
    v55 = __ldaxr(v54);
  while (__stlxr(v55 + a3, v54));
  v56 = *((_QWORD *)this + 46);
  if (v56 && *((_BYTE *)this + 376))
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_32);
    if (off_254E41A40)
    {
      ShouldFire = off_254E41A40(v56, 1, 0, a4, a3, v53);
      v57 = ShouldFire;
      if (!(_DWORD)ShouldFire)
        goto LABEL_76;
    }
    else
    {
      v57 = -1;
    }
    ShouldFire = Phase::Throttle::ShouldFire((Phase::Controller::StreamRenderer *)((char *)this + 384), 0);
    if ((_DWORD)ShouldFire)
    {
      v58 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)ShouldFire) + 384));
      ShouldFire = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
      if ((_DWORD)ShouldFire)
      {
        *(_DWORD *)buf = 136315906;
        v66 = "StreamRenderer.mm";
        v67 = 1024;
        v68 = 1749;
        v69 = 2048;
        v70 = this;
        v71 = 1024;
        v72 = v57;
        _os_log_impl(&dword_2164CC000, v58, OS_LOG_TYPE_ERROR, "%25s:%-5d bufferstream@%p: failed to analyze buffer %d", buf, 0x22u);
      }
    }
  }
LABEL_76:
  if (*(_BYTE *)(Phase::Logger::GetInstance((Phase::Logger *)ShouldFire) + 1548))
  {
    v59 = *((double *)this + 15);
    Phase::Trace::PostSignalStatsTraceIfSignificant((Phase::Trace *)0x1621, *((const float **)a4 + 2), a3, v59);
  }
LABEL_78:
  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v63);
  return v46;
}

void sub_2166D6A58(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_lock<caulk::pooled_semaphore_mutex>::~unique_lock[abi:ne180100](v1 - 144);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::StreamRenderer::IOConfiguration::StopCaptures(_QWORD *this)
{
  _QWORD *v1;
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  _QWORD *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (this[2])
  {
    v1 = this;
    v2 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)this) + 384));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)v1;
      v4 = 136315906;
      v5 = "StreamRenderer.mm";
      v6 = 1024;
      v7 = 1835;
      v8 = 2048;
      v9 = v1;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_2164CC000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d bufferstream@%p [%d]: stopping capture", (uint8_t *)&v4, 0x22u);
    }
    this = (_QWORD *)v1[2];
    v1[2] = 0;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<Phase::Controller::AudioDSPRegisterInternalAudioUnits(void)::$_0 &&>>(_QWORD **a1)
{
  _BYTE **v1;
  void *v2;
  void (*v3)(void);
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (_BYTE **)**a1;
  v2 = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (v2)
  {
    v3 = (void (*)(void))dlsym(v2, "RegisterAudioUnits_Internal");
    if (v3)
    {
      v3();
      return;
    }
    v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 384));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "StreamRenderer.mm";
      v8 = 1024;
      v9 = 74;
      v5 = "%25s:%-5d Error: Unable to call RegisterAudioUnits_Internal from AudioDSP lib!";
      goto LABEL_8;
    }
  }
  else
  {
    v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 384));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "StreamRenderer.mm";
      v8 = 1024;
      v9 = 80;
      v5 = "%25s:%-5d Error: Unable to load AudioDSP lib!";
LABEL_8:
      _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x12u);
    }
  }
  **v1 = 0;
}

void std::__shared_ptr_emplace<AudioTimeStamp>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D5818F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AudioTimeStamp>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D5818F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

void std::__shared_ptr_emplace<unsigned long>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D581928;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<unsigned long>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D581928;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

void std::__shared_ptr_emplace<std::atomic<unsigned int>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D581960;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::atomic<unsigned int>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D581960;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

Phase::StringId *Phase::StringId::StringId(Phase::StringId *this, const char *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = &str_33;
  *((_BYTE *)this + 16) = 1;
  Phase::StringId::Initialize(this, a2);
  return this;
}

void *Phase::StringId::Initialize(Phase::StringId *this, const char *__s)
{
  size_t v4;

  if (__s)
    v4 = strlen(__s);
  else
    v4 = 0;
  return Phase::StringId::Initialize(this, __s, v4);
}

void *Phase::StringId::Initialize(Phase::StringId *this, const char *a2, size_t a3)
{
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  unsigned int v9;
  void *result;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  if (!a2)
  {
    v12 = -1;
    v13 = &str_33;
LABEL_9:
    v14 = 1;
    return (void *)Phase::StringId::operator=((uint64_t)this, (uint64_t)&v12);
  }
  if (!a3)
  {
    v12 = 0;
    v13 = &str_33;
    goto LABEL_9;
  }
  v6 = *(unsigned __int8 *)a2;
  if (*a2)
  {
    v7 = a2 + 1;
    v8 = 0xCBF29CE484222325;
    do
    {
      v8 = 0x100000001B3 * (v8 ^ v6);
      v9 = *(unsigned __int8 *)v7++;
      v6 = v9;
    }
    while (v9);
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)this = v8;
  v11 = malloc_type_malloc(a3 + 1, 0xE46A21D0uLL);
  result = memcpy(v11, a2, a3);
  *((_BYTE *)v11 + a3) = 0;
  *((_QWORD *)this + 1) = v11;
  *((_BYTE *)this + 16) = 0;
  return result;
}

uint64_t Phase::StringId::StringId(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  size_t v5;
  void *v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  if (!*(_BYTE *)(a2 + 16))
  {
    v4 = *(const char **)(a2 + 8);
    v5 = strlen(v4);
    v6 = malloc_type_malloc(v5 + 1, 0xE46A21D0uLL);
    memcpy(v6, v4, v5);
    *((_BYTE *)v6 + v5) = 0;
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a1;
}

uint64_t Phase::StringId::operator=(uint64_t a1, uint64_t a2)
{
  const char *v4;
  int v5;
  size_t v6;
  void *v7;

  if (!*(_BYTE *)(a1 + 16))
    free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = &str_33;
  *(_BYTE *)(a1 + 16) = 1;
  v4 = *(const char **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(unsigned __int8 *)(a2 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  if (!v5)
  {
    v6 = strlen(v4);
    v7 = malloc_type_malloc(v6 + 1, 0xE46A21D0uLL);
    memcpy(v7, v4, v6);
    *((_BYTE *)v7 + v6) = 0;
    v4 = (const char *)v7;
  }
  *(_QWORD *)(a1 + 8) = v4;
  return a1;
}

unint64_t Phase::StringPool::GetString(Phase::StringPool *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *((_QWORD *)this + 1);
  v3 = a2 % *(_QWORD *)this;
  if (*(_QWORD *)(v2 + 24 * v3) == a2)
  {
LABEL_4:
    v4 = *(unsigned int *)(v2 + 24 * v3 + 8);
    if (*((_QWORD *)this + 2) > v4)
      return *((_QWORD *)this + 3) + v4;
  }
  else
  {
    while (1)
    {
      v3 = *(unsigned int *)(v2 + 24 * v3 + 12);
      if ((_DWORD)v3 == 0x7FFFFFFF)
        break;
      if (*(_QWORD *)(v2 + 24 * v3) == a2)
        goto LABEL_4;
    }
  }
  return 0;
}

void Phase::BuildStringPool(uint64_t a1@<X0>, unint64_t **a2@<X8>)
{
  unint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unsigned int v16;
  uint64_t *v17;
  int v18;
  const char *v19;
  int v20;
  unint64_t v21;
  unsigned int v22;
  unsigned __int8 *v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;

  v4 = (unint64_t *)operator new();
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v38 = v4;
  v5 = *(uint64_t **)(a1 + 16);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while ((*((char *)v5 + 39) & 0x80000000) == 0)
    {
      v8 = *((unsigned __int8 *)v5 + 39);
      if (*((_BYTE *)v5 + 39))
        goto LABEL_5;
LABEL_6:
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_10;
    }
    v8 = v5[3];
    if (!v8)
      goto LABEL_6;
LABEL_5:
    v7 += v8 + 1;
    v4[2] = v7;
    *v4 = ++v6;
    goto LABEL_6;
  }
LABEL_10:
  v9 = operator new[]();
  v10 = v38[1];
  v38[1] = v9;
  if (v10)
    MEMORY[0x2199F9D4C](v10, 0x1050C80C058ABA2);
  v11 = operator new[]();
  v12 = v38;
  v13 = v38[3];
  v38[3] = v11;
  if (v13)
    MEMORY[0x2199F9D4C](v13, 0x1000C8077774924);
  v14 = *v12;
  if (!*v12)
    goto LABEL_49;
  v15 = (_QWORD *)(v12[1] + 8);
  v16 = 1;
  do
  {
    *(v15 - 1) = 0;
    *v15 = 0x7FFFFFFF00000000;
    v15 += 3;
    v35 = v14 > v16++;
  }
  while (v35);
  v17 = *(uint64_t **)(a1 + 16);
  v12 = v38;
  if (!v17)
  {
LABEL_49:
    *a2 = v12;
    return;
  }
  v18 = 0;
  while (1)
  {
    v19 = (const char *)(v17 + 2);
    v20 = *((char *)v17 + 39);
    if (v20 < 0)
      break;
    v21 = (unint64_t)(v17 + 2);
    if (*((_BYTE *)v17 + 39))
      goto LABEL_24;
LABEL_48:
    v17 = (uint64_t *)*v17;
    if (!v17)
      goto LABEL_49;
  }
  if (!v17[3])
    goto LABEL_48;
  v21 = *(_QWORD *)v19;
  if (*(_QWORD *)v19)
  {
LABEL_24:
    v22 = *(unsigned __int8 *)v21;
    if (!*(_BYTE *)v21)
    {
      v21 = 0;
      if ((v20 & 0x80000000) == 0)
        goto LABEL_32;
      goto LABEL_30;
    }
    v23 = (unsigned __int8 *)(v21 + 1);
    v21 = 0xCBF29CE484222325;
    do
    {
      v21 = 0x100000001B3 * (v21 ^ v22);
      v24 = *v23++;
      v22 = v24;
    }
    while (v24);
    if (v20 < 0)
LABEL_30:
      v19 = *(const char **)v19;
  }
  else
  {
    v19 = 0;
  }
LABEL_32:
  v25 = v21 % v14;
  v26 = (v21 % v14);
  v27 = v12[1];
  v28 = v27 + 24 * v26;
  if (!*(_QWORD *)v28)
    goto LABEL_41;
  v29 = 1;
  do
  {
    v30 = v27 + 24 * v26;
    v33 = *(_DWORD *)(v30 + 12);
    v31 = (unsigned int *)(v30 + 12);
    v32 = v33;
    if (v33 == 0x7FFFFFFF)
    {
      v32 = (v25 + 1) % v14;
      *v31 = v32;
    }
    v26 = v32;
    v28 = v27 + 24 * v32;
    v34 = v29++;
    if (*(_QWORD *)v28)
      v35 = v14 > v34;
    else
      v35 = 0;
    LODWORD(v25) = v32;
  }
  while (v35);
  if (v14 > v34)
  {
LABEL_41:
    *(_QWORD *)v28 = v21;
    *(_DWORD *)(v28 + 8) = v18;
    *(_QWORD *)(v28 + 16) = v12[3] + v18;
    if (*((char *)v17 + 39) < 0)
      v36 = v17[3];
    else
      v36 = *((unsigned __int8 *)v17 + 39);
    strncpy((char *)(v12[3] + v18), v19, v36 + 1);
    if (*((char *)v17 + 39) < 0)
      v37 = v17[3];
    else
      LODWORD(v37) = *((unsigned __int8 *)v17 + 39);
    v18 += v37 + 1;
    goto LABEL_48;
  }
  *a2 = 0;
  v38 = 0;
  if (v12)
    std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&v38, (uint64_t)v12);
}

void sub_2166D7520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;

  v11 = a10;
  a10 = 0;
  if (v11)
    std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&a10, v11);
  _Unwind_Resume(exception_object);
}

uint64_t *Phase::DspLayer::SubmixGain::GetNewRegistryEntry(Phase::DspLayer::SubmixGain *this)
{
  char *v1;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v11[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  void *__p[2];
  char v20;
  _QWORD v21[3];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = (char *)malloc_type_malloc(0x188uLL, 0x1050040B063AAFAuLL);
  *(_QWORD *)v1 = "Interpolation Duration";
  *((_QWORD *)v1 + 1) = 0x500000000;
  *(_QWORD *)(v1 + 20) = 0x100000000;
  *((_DWORD *)v1 + 7) = 3;
  *((_OWORD *)v1 + 2) = xmmword_21673A720;
  *((_QWORD *)v1 + 6) = 0x3F91111120000000;
  *((_QWORD *)v1 + 7) = "Session Fade Duration";
  *((_QWORD *)v1 + 8) = 0x500000001;
  *(_QWORD *)(v1 + 76) = 0x100000000;
  *((_DWORD *)v1 + 21) = 3;
  *(_OWORD *)(v1 + 88) = xmmword_21673A720;
  *((_QWORD *)v1 + 13) = 0x3FE6666660000000;
  *((_QWORD *)v1 + 14) = "Submix Gain";
  *((_QWORD *)v1 + 15) = 0x500000002;
  *(_QWORD *)(v1 + 132) = 0x100000000;
  *((_DWORD *)v1 + 35) = 3;
  *((_OWORD *)v1 + 9) = xmmword_2166F7470;
  *((_QWORD *)v1 + 20) = 0x3FF0000000000000;
  *((_QWORD *)v1 + 21) = "Session Mute";
  *((_QWORD *)v1 + 22) = 0x500000003;
  *(_QWORD *)(v1 + 188) = 0x100000000;
  *((_DWORD *)v1 + 49) = 3;
  *(_OWORD *)(v1 + 200) = xmmword_2166F7470;
  *((_QWORD *)v1 + 27) = 0x3FF0000000000000;
  *((_QWORD *)v1 + 28) = "Session Fade Start";
  *((_QWORD *)v1 + 29) = 0x500000004;
  *(_QWORD *)(v1 + 244) = 0x100000000;
  *((_DWORD *)v1 + 63) = 3;
  *((_OWORD *)v1 + 16) = xmmword_2166F7470;
  *((_QWORD *)v1 + 34) = 0x3FF0000000000000;
  *((_QWORD *)v1 + 35) = "Session Fade";
  *((_QWORD *)v1 + 36) = 0x500000005;
  *((_DWORD *)v1 + 75) = 0;
  *((_QWORD *)v1 + 38) = 0x300000001;
  *((_QWORD *)v1 + 39) = 0;
  __asm { FMOV            V2.2D, #1.0 }
  *((_OWORD *)v1 + 20) = _Q2;
  *((_QWORD *)v1 + 42) = "Session Gain";
  *((_QWORD *)v1 + 43) = 0x500000006;
  *((_DWORD *)v1 + 89) = 0;
  *((_QWORD *)v1 + 45) = 0x300000001;
  *((_OWORD *)v1 + 23) = xmmword_2166F7470;
  *((_QWORD *)v1 + 48) = 0x3FF0000000000000;
  v7 = (uint64_t *)operator new();
  v21[0] = &off_24D581A90;
  v22 = v21;
  Phase::Controller::VoicePoolEntry::VoicePoolEntry((uint64_t)v7, "SubmixGain", 7, (uint64_t)v1, (uint64_t)v21);
  v8 = v22;
  if (v22 == v21)
  {
    v9 = 4;
    v8 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  std::string::basic_string[abi:ne180100]<0>(__p, "Input");
  Phase::Controller::VoicePoolEntry::AddInput(v7, (__int128 *)__p);
  if (v20 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(v17, "Output");
  Phase::Controller::VoicePoolEntry::AddOutput(v7, (__int128 *)v17);
  if (v18 < 0)
    operator delete(v17[0]);
  std::string::basic_string[abi:ne180100]<0>(v15, "Output");
  Phase::Controller::VoicePoolEntry::AddOutput(v7, (__int128 *)v15);
  if (v16 < 0)
    operator delete(v15[0]);
  std::string::basic_string[abi:ne180100]<0>(v13, "Output");
  Phase::Controller::VoicePoolEntry::AddOutput(v7, (__int128 *)v13);
  if (v14 < 0)
    operator delete(v13[0]);
  std::string::basic_string[abi:ne180100]<0>(v11, "Output");
  Phase::Controller::VoicePoolEntry::AddOutput(v7, (__int128 *)v11);
  if (v12 < 0)
    operator delete(v11[0]);
  return v7;
}

void sub_2166D784C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Phase::DspLayer::SubmixGain::~SubmixGain(Phase::DspLayer::SubmixGain *this)
{
  Phase::DspLayer::VoicePool::~VoicePool(this);
  JUMPOUT(0x2199F9D70);
}

void `anonymous namespace'::SubmixGainSlice::~SubmixGainSlice(_anonymous_namespace_::SubmixGainSlice *this)
{
  JUMPOUT(0x2199F9D70);
}

double `anonymous namespace'::SubmixGainSlice::Reset(int32x4_t *this, Phase::DspLayer::VoiceEngine *a2)
{
  uint64_t v3;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double result;
  int32x4_t v15;
  __int128 v16;
  uint64_t v17;

  v3 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  this[1] = vdupq_n_s32(0x3C888889u);
  this[2] = vdupq_n_s32(0x3F333333u);
  __asm { FMOV            V0.4S, #1.0 }
  this[3] = _Q0;
  this[4] = _Q0;
  this[5] = _Q0;
  this[6] = _Q0;
  this[7] = _Q0;
  this[8].i64[0] = 0;
  this[8].i64[1] = 0;
  this[265] = 0u;
  this[266] = 0u;
  this[267] = 0u;
  this[268] = 0u;
  this[539] = 0u;
  this[540] = 0u;
  this[541] = 0u;
  this[542] = 0u;
  this[543] = 0u;
  this[544] = 0u;
  this[545] = 0u;
  this[546] = 0u;
  v15 = _Q0;
  v16 = xmmword_2166F7490;
  do
  {
    this[539].i32[*(int *)((char *)&v15 + v3 * 4 + 16)] = v15.i32[v3];
    ++v3;
  }
  while (v3 != 4);
  v9 = 0;
  v16 = xmmword_2166F7490;
  v15 = 0uLL;
  do
  {
    this[540].i32[*(int *)((char *)&v15 + v9 * 4 + 16)] = v15.i32[v9];
    ++v9;
  }
  while (v9 != 4);
  v10 = 0;
  v15 = _Q0;
  v16 = xmmword_2166F7490;
  do
  {
    this[541].i32[*(int *)((char *)&v15 + v10 * 4 + 16)] = v15.i32[v10];
    ++v10;
  }
  while (v10 != 4);
  v11 = 0;
  v16 = xmmword_2166F7490;
  v15 = 0uLL;
  do
  {
    this[542].i32[*(int *)((char *)&v15 + v11 * 4 + 16)] = v15.i32[v11];
    ++v11;
  }
  while (v11 != 4);
  v12 = 0;
  v15 = _Q0;
  v16 = xmmword_2166F7490;
  do
  {
    this[545].i32[*(int *)((char *)&v15 + v12 * 4 + 16)] = v15.i32[v12];
    ++v12;
  }
  while (v12 != 4);
  v13 = 0;
  v16 = xmmword_2166F7490;
  v15 = 0uLL;
  do
  {
    this[546].i32[*(int *)((char *)&v15 + v13 * 4 + 16)] = v15.i32[v13];
    ++v13;
  }
  while (v13 != 4);
  (*(void (**)(int32x4_t *, Phase::DspLayer::VoiceEngine *))(this->i64[0] + 48))(this, a2);
  result = 0.0;
  this[548] = 0u;
  this[547] = 0u;
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::Reset(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _DWORD *v7;
  uint64_t result;

  v7 = (_DWORD *)(a1 + 4 * a3);
  v7[4] = 1015580809;
  v7[8] = 1060320051;
  v7[12] = 1065353216;
  v7[16] = 1065353216;
  v7[20] = 1065353216;
  v7[24] = 1065353216;
  v7[28] = 1065353216;
  v7[32] = 0;
  v7[1060] = 0;
  v7[1064] = 0;
  v7[1068] = 0;
  v7[1072] = 0;
  v7[2172] = 0;
  v7[2176] = 0;
  v7[2156] = 1065353216;
  v7[2160] = 0;
  v7[2164] = 1065353216;
  v7[2168] = 0;
  v7[2180] = 1065353216;
  v7[2184] = 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  *(_QWORD *)(a1 + 8 * a3 + 8752) = a4;
  return result;
}

double `anonymous namespace'::SubmixGainSlice::GetParameter(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3)
{
  float *v3;
  double result;

  switch(a2)
  {
    case 0:
      v3 = (float *)((char *)this + 4 * a3 + 16);
      goto LABEL_9;
    case 1:
      v3 = (float *)((char *)this + 4 * a3 + 32);
      goto LABEL_9;
    case 2:
      v3 = (float *)((char *)this + 4 * a3 + 48);
      goto LABEL_9;
    case 3:
      v3 = (float *)((char *)this + 4 * a3 + 64);
      goto LABEL_9;
    case 4:
      v3 = (float *)((char *)this + 4 * a3 + 80);
      goto LABEL_9;
    case 5:
      v3 = (float *)((char *)this + 4 * a3 + 96);
      goto LABEL_9;
    case 6:
      v3 = (float *)((char *)this + 4 * a3 + 112);
LABEL_9:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

float `anonymous namespace'::SubmixGainSlice::SetParameter(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3, double a4)
{
  switch(a2)
  {
    case 0:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 4) = LODWORD(a4);
      break;
    case 1:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 8) = LODWORD(a4);
      break;
    case 2:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 12) = LODWORD(a4);
      break;
    case 3:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 16) = LODWORD(a4);
      break;
    case 4:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 20) = LODWORD(a4);
      break;
    case 5:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 24) = LODWORD(a4);
      break;
    case 6:
      *(float *)&a4 = a4;
      *((_DWORD *)this + a3 + 28) = LODWORD(a4);
      break;
    default:
      return *(float *)&a4;
  }
  return *(float *)&a4;
}

__n128 `anonymous namespace'::SubmixGainSlice::UpdateParameters(uint64_t a1, uint64_t a2)
{
  float32x4_t v3;
  float32x4_t v4;
  const float *v5;
  float32x4_t v6;
  __n128 result;
  __int128 v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  __int128 v12;
  __int128 v13;
  float32x4_t v14;
  __int128 v15;
  float32x4_t v16;
  __int128 v17;
  __int128 v18;
  __n128 v19;

  v3 = *(float32x4_t *)(a1 + 16);
  v4 = vdivq_f32((float32x4_t)vdupq_n_s32(0x40C90FDBu), v3);
  v10 = vmulq_f32(v4, v4);
  v11 = vdivq_f32((float32x4_t)vdupq_n_s32(0x41490FDBu), v3);
  v8 = *(_OWORD *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 4240);
  v15 = *(_OWORD *)(a1 + 4256);
  v5 = (const float *)(a2 + 8);
  v6 = vld1q_dup_f32(v5);
  v16 = vdivq_f32(v6, *(float32x4_t *)(a1 + 32));
  v17 = *(_OWORD *)(a1 + 4272);
  v9 = *(float32x4_t *)(a1 + 96);
  v14 = *(float32x4_t *)(a1 + 80);
  v18 = *(_OWORD *)(a1 + 112);
  v19 = *(__n128 *)(a1 + 4288);
  memcpy((void *)(a1 + 4304), (const void *)(a1 + 128), 0x1010uLL);
  *(float32x4_t *)(a1 + 8416) = v10;
  *(_OWORD *)(a1 + 8432) = v8;
  *(float32x4_t *)(a1 + 8448) = v11;
  *(_OWORD *)(a1 + 8464) = v13;
  *(_OWORD *)(a1 + 8480) = v12;
  *(_OWORD *)(a1 + 8496) = v15;
  *(float32x4_t *)(a1 + 8512) = v9;
  *(float32x4_t *)(a1 + 8528) = v16;
  *(_OWORD *)(a1 + 8544) = v17;
  *(float32x4_t *)(a1 + 8560) = v14;
  *(float32x4_t *)(a1 + 8576) = vsubq_f32(v9, v14);
  *(_OWORD *)(a1 + 8592) = v18;
  result = v19;
  *(__n128 *)(a1 + 8608) = v19;
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::UpdateParameters(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  float v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  float v11;
  float v12;
  float v13;
  int v14;
  float v15;
  int v16;
  uint64_t v17;
  _DWORD *v18;

  v3 = result + 4 * a3;
  v4 = *(float *)(v3 + 16);
  v5 = *(_DWORD *)(v3 + 48);
  v6 = *(_DWORD *)(v3 + 64);
  v7 = *(_DWORD *)(v3 + 112);
  if (v4 >= 0.001)
  {
    *(float *)(v3 + 8416) = (float)(6.2832 / v4) * (float)(6.2832 / v4);
    *(float *)(v3 + 8448) = 12.566 / v4;
  }
  else
  {
    *(_DWORD *)(v3 + 8640) = 0;
    *(_DWORD *)(v3 + 8624) = v5;
    *(_DWORD *)(v3 + 8672) = 0;
    *(_DWORD *)(v3 + 8656) = v6;
    *(_DWORD *)(v3 + 8736) = 0;
    *(_DWORD *)(v3 + 8720) = v7;
  }
  v8 = result + 4 * a3;
  v9 = *(_DWORD *)(v8 + 4240);
  v10 = *(_DWORD *)(v8 + 4256);
  v11 = *(float *)(v8 + 96);
  v12 = *(float *)(v8 + 32);
  v13 = *(float *)(a2 + 8);
  v14 = *(_DWORD *)(v8 + 4272);
  v15 = *(float *)(v8 + 80);
  v16 = *(_DWORD *)(v8 + 4288);
  v17 = *(unsigned int *)(v8 + 128);
  *(_DWORD *)(v8 + 4304) = v17;
  if ((int)v17 >= 1)
  {
    v18 = (_DWORD *)(result + 4 * a3);
    do
    {
      v18[1080] = v18[36];
      v18[1084] = v18[40];
      v18 += 8;
      --v17;
    }
    while (v17);
  }
  *(_DWORD *)(v8 + 8432) = v5;
  *(_DWORD *)(v8 + 8464) = v9;
  *(_DWORD *)(v8 + 8480) = v6;
  *(_DWORD *)(v8 + 8496) = v10;
  *(float *)(v8 + 8512) = v11;
  *(float *)(v8 + 8528) = v13 / v12;
  *(_DWORD *)(v8 + 8544) = v14;
  *(float *)(v8 + 8560) = v15;
  *(float *)(v8 + 8576) = v11 - v15;
  *(_DWORD *)(v8 + 8592) = v7;
  *(_DWORD *)(v8 + 8608) = v16;
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::Run(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int32x4_t v12;
  int64x2_t v13;
  uint64_t v14;
  float32x4_t *v15;
  float32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int8x16_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  int v28;
  unint64_t v29;
  int8x16_t v30;
  const float *v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int8x16_t v36;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  int8x16_t v52;

  v4 = *(float32x4_t *)(result + 8416);
  v5 = *(float32x4_t *)(result + 8640);
  v6 = *(float32x4_t *)(result + 8624);
  v9 = vsubq_f32(*(float32x4_t *)(result + 8432), v6);
  v7 = vnegq_f32(*(float32x4_t *)(result + 8448));
  v8 = vmlaq_f32(vmulq_f32(v5, v7), v9, v4);
  v9.i32[0] = *(_DWORD *)(a2 + 8);
  v10 = vmlaq_n_f32(v5, v8, v9.f32[0]);
  v11 = vmlaq_n_f32(v6, v10, v9.f32[0]);
  v12 = (int32x4_t)vandq_s8(*(int8x16_t *)(result + 4304), (int8x16_t)vcgtq_s32(vdupq_n_s32(a4), (int32x4_t)xmmword_2166F76B0));
  v13 = (int64x2_t)vcgtzq_s32(v12);
  if (vorrq_s8((int8x16_t)vdupq_laneq_s64(v13, 1), (int8x16_t)v13).u64[0])
  {
    v14 = *(_QWORD *)(a2 + 56);
    v15 = (float32x4_t *)(result + 4336);
    v16 = 0uLL;
    v17 = 0uLL;
    v18.i64[0] = 0x100000001;
    v18.i64[1] = 0x100000001;
    do
    {
      v19.i32[0] = *(_DWORD *)(v14 + 4 * v15[-1].i32[0]);
      v19.i32[1] = *(_DWORD *)(v14 + 4 * v15[-1].i32[1]);
      v19.i32[2] = *(_DWORD *)(v14 + 4 * v15[-1].i32[2]);
      v19.i32[3] = *(_DWORD *)(v14 + 4 * v15[-1].i32[3]);
      v16 = vmlaq_f32(v16, (float32x4_t)vandq_s8((int8x16_t)v13, v19), *v15);
      v17 = vaddq_s32(v17, v18);
      v13 = (int64x2_t)vcgtq_s32(v12, v17);
      v15 += 2;
    }
    while (vorrq_s8((int8x16_t)vdupq_laneq_s64(v13, 1), (int8x16_t)v13).u64[0]);
  }
  else
  {
    v16 = 0uLL;
  }
  v20 = *(float32x4_t *)(result + 8480);
  v21 = *(float32x4_t *)(result + 8512);
  v22 = *(float32x4_t *)(result + 8528);
  v23 = *(float32x4_t *)(result + 8560);
  v24 = *(float32x4_t *)(result + 8576);
  v25 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 0);
  v26 = *(float32x4_t *)(result + 8592);
  v27 = vmulq_f32(v11, v16);
  HIDWORD(v29) = a4 - 1;
  LODWORD(v29) = a4 - 1;
  v28 = v29 >> 1;
  v30 = vandq_s8((int8x16_t)v27, vorrq_s8((int8x16_t)vcltzq_f32(v27), (int8x16_t)vcgezq_f32(v27)));
  switch(v28)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 7:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8476)) = v30.i32[3];
LABEL_8:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8472)) = v30.i32[2];
LABEL_9:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8468)) = v30.i32[1];
LABEL_10:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8464)) = v30.i32[0];
      v31 = (const float *)(a2 + 8);
      v25 = vld1q_dup_f32(v31);
      break;
    default:
      break;
  }
  v32 = *(float32x4_t *)(result + 8656);
  v33 = vmlaq_f32(*(float32x4_t *)(result + 8672), v25, vmlaq_f32(vmulq_f32(*(float32x4_t *)(result + 8672), v7), vsubq_f32(v20, v32), v4));
  v34 = vmlaq_f32(v32, v25, v33);
  v35 = vmulq_f32(v27, v34);
  v36 = vandq_s8((int8x16_t)v35, vorrq_s8((int8x16_t)vcltzq_f32(v35), (int8x16_t)vcgezq_f32(v35)));
  switch(v28)
  {
    case 0:
      goto LABEL_15;
    case 1:
      goto LABEL_14;
    case 3:
      goto LABEL_13;
    case 7:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8508)) = v36.i32[3];
LABEL_13:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8504)) = v36.i32[2];
LABEL_14:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8500)) = v36.i32[1];
LABEL_15:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8496)) = v36.i32[0];
      break;
    default:
      break;
  }
  __asm { FMOV            V20.4S, #1.0 }
  v42 = (float32x4_t)vandq_s8((int8x16_t)vminnmq_f32(vaddq_f32(v22, *(float32x4_t *)(result + 8704)), _Q20), (int8x16_t)vceqq_f32(v21, *(float32x4_t *)(result + 8688)));
  v43 = vmulq_f32(v35, vmlaq_f32(v23, v24, v42));
  v44 = vandq_s8((int8x16_t)v43, vorrq_s8((int8x16_t)vcltzq_f32(v43), (int8x16_t)vcgezq_f32(v43)));
  switch(v28)
  {
    case 0:
      goto LABEL_20;
    case 1:
      goto LABEL_19;
    case 3:
      goto LABEL_18;
    case 7:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8556)) = v44.i32[3];
LABEL_18:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8552)) = v44.i32[2];
LABEL_19:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8548)) = v44.i32[1];
LABEL_20:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8544)) = v44.i32[0];
      break;
    default:
      break;
  }
  v45 = *(float32x4_t *)(result + 8736);
  v46 = *(float32x4_t *)(result + 8720);
  v47 = vmlaq_f32(vmulq_f32(v45, v7), vsubq_f32(v26, v46), v4);
  v48 = *(float *)(a2 + 8);
  v49 = vmlaq_n_f32(v45, v47, v48);
  v50 = vmlaq_n_f32(v46, v49, v48);
  v51 = vmulq_f32(v43, v50);
  v52 = vandq_s8((int8x16_t)v51, vorrq_s8((int8x16_t)vcltzq_f32(v51), (int8x16_t)vcgezq_f32(v51)));
  switch(v28)
  {
    case 0:
      goto LABEL_25;
    case 1:
      goto LABEL_24;
    case 3:
      goto LABEL_23;
    case 7:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8620)) = v52.i32[3];
LABEL_23:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8616)) = v52.i32[2];
LABEL_24:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8612)) = v52.i32[1];
LABEL_25:
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * *(int *)(result + 8608)) = v52.i32[0];
      break;
    default:
      break;
  }
  *(float32x4_t *)(result + 8624) = v11;
  *(float32x4_t *)(result + 8640) = v10;
  *(float32x4_t *)(result + 8656) = v34;
  *(float32x4_t *)(result + 8672) = v33;
  *(float32x4_t *)(result + 8688) = v21;
  *(float32x4_t *)(result + 8704) = v42;
  *(float32x4_t *)(result + 8720) = v50;
  *(float32x4_t *)(result + 8736) = v49;
  return result;
}

float `anonymous namespace'::SubmixGainSlice::CopyVoiceState(_anonymous_namespace_::SubmixGainSlice *this, Phase::DspLayer::VoicePoolSlice *a2, unsigned int a3, unsigned int a4)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  int *v8;
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  _DWORD *v13;
  int *v14;
  int v15;
  char *v16;
  char *v17;
  float result;

  v4 = (_DWORD *)((char *)a2 + 4 * (int)a3);
  v5 = (_DWORD *)((char *)this + 4 * (int)a4);
  v5[4] = v4[4];
  v5[8] = v4[8];
  v5[12] = v4[12];
  v5[16] = v4[16];
  v5[20] = v4[20];
  v5[24] = v4[24];
  v5[28] = v4[28];
  v6 = v4[32];
  v5[32] = v6;
  if ((int)v6 >= 1)
  {
    v7 = (_DWORD *)((char *)this + 4 * (int)a4 + 160);
    v8 = (int *)((char *)a2 + 4 * (int)a3 + 160);
    do
    {
      *(v7 - 4) = *(v8 - 4);
      v9 = *v8;
      v8 += 8;
      *v7 = v9;
      v7 += 8;
      --v6;
    }
    while (v6);
  }
  v10 = (_DWORD *)((char *)this + 4 * (int)a4);
  v11 = (_DWORD *)((char *)a2 + 4 * (int)a3);
  v12 = v11[1076];
  v10[1076] = v12;
  if ((int)v12 >= 1)
  {
    v13 = v10 + 1084;
    v14 = v11 + 1084;
    do
    {
      *(v13 - 4) = *(v14 - 4);
      v15 = *v14;
      v14 += 8;
      *v13 = v15;
      v13 += 8;
      --v12;
    }
    while (v12);
  }
  v10[1060] = v11[1060];
  v10[1064] = v11[1064];
  v10[1068] = v11[1068];
  v10[1072] = v11[1072];
  v10[2104] = v11[2104];
  v10[2108] = v11[2108];
  v10[2112] = v11[2112];
  v10[2116] = v11[2116];
  v10[2120] = v11[2120];
  v10[2124] = v11[2124];
  v10[2128] = v11[2128];
  v10[2132] = v11[2132];
  v10[2136] = v11[2136];
  v10[2140] = v11[2140];
  v10[2144] = v11[2144];
  v10[2148] = v11[2148];
  v10[2152] = v11[2152];
  if (a3 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 507, "fromLane >= 0 && fromLane < PHASE_SIMD_WIDTH");
  if (a4 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 508, "toLane >= 0 && toLane < PHASE_SIMD_WIDTH");
  v16 = (char *)a2 + 4 * a3;
  v17 = (char *)this + 4 * a4;
  *((_DWORD *)v17 + 2156) = *((_DWORD *)v16 + 2156);
  *((_DWORD *)v17 + 2160) = *((_DWORD *)v16 + 2160);
  *((_DWORD *)v17 + 2164) = *((_DWORD *)v16 + 2164);
  *((_DWORD *)v17 + 2168) = *((_DWORD *)v16 + 2168);
  *((_DWORD *)v17 + 2172) = *((_DWORD *)v16 + 2172);
  *((_DWORD *)v17 + 2176) = *((_DWORD *)v16 + 2176);
  *((_DWORD *)v17 + 2180) = *((_DWORD *)v16 + 2180);
  result = *((float *)v16 + 2184);
  *((float *)v17 + 2184) = result;
  *((_QWORD *)this + (int)a4 + 1094) = *((_QWORD *)a2 + (int)a3 + 1094);
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::AddInput(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  char *v7;
  uint64_t v8;
  char *v9;

  if (a2)
    return 8;
  v7 = (char *)this + 128;
  v8 = *((int *)this + a3 + 32);
  if ((int)v8 > 127)
    return 6;
  result = 0;
  v9 = (char *)this + 32 * v8 + 4 * a3;
  *((_DWORD *)v9 + 36) = a4;
  *((float *)v9 + 40) = a5;
  *(_DWORD *)&v7[4 * a3] = v8 + 1;
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::RemoveInput(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3, int a4)
{
  if (a2)
    return 8;
  else
    return Phase::DspLayer::VoiceConnectionList<128>::RemoveConnection((uint64_t)this + 128, a3, a4);
}

uint64_t `anonymous namespace'::SubmixGainSlice::SetInputGain(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  float *i;

  if (a2)
    return 8;
  v6 = *((unsigned int *)this + a3 + 32);
  if ((int)v6 < 1)
    return 7;
  v7 = 0;
  for (i = (float *)((char *)this + 4 * a3 + 160); *((_DWORD *)i - 4) != a4; i += 8)
  {
    if (v6 == ++v7)
      return 7;
  }
  if ((v7 & 0x80000000) != 0)
    return 7;
  result = 0;
  *i = a5;
  return result;
}

void `anonymous namespace'::SubmixGainSlice::GetInputs(_anonymous_namespace_::SubmixGainSlice *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (a2)
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    Phase::DspLayer::VoiceConnectionList<128>::GetConnections((uint64_t)this + 128, a3, (char **)a4);
  }
}

uint64_t `anonymous namespace'::SubmixGainSlice::ClearInputs(_anonymous_namespace_::SubmixGainSlice *this, int a2)
{
  *((_DWORD *)this + a2 + 32) = 0;
  return 0;
}

uint64_t `anonymous namespace'::SubmixGainSlice::GetMaximumInputConnectionCount(_anonymous_namespace_::SubmixGainSlice *this, int a2)
{
  return (a2 == 0) << 7;
}

unint64_t `anonymous namespace'::SubmixGainSlice::GetOutput(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3)
{
  char *v3;
  uint64_t v4;
  unint64_t result;

  switch(a2)
  {
    case 0:
      v3 = (char *)this + 4 * a3;
      v4 = 4240;
      goto LABEL_7;
    case 1:
      v3 = (char *)this + 4 * a3;
      v4 = 4256;
      goto LABEL_7;
    case 2:
      v3 = (char *)this + 4 * a3;
      v4 = 4272;
      goto LABEL_7;
    case 3:
      v3 = (char *)this + 4 * a3;
      v4 = 4288;
LABEL_7:
      result = (unint64_t)*(unsigned int *)&v3[v4] << 32;
      break;
    default:
      result = 0xFFFFFFFF00000008;
      break;
  }
  return result;
}

uint64_t `anonymous namespace'::SubmixGainSlice::SetOutput(_anonymous_namespace_::SubmixGainSlice *this, int a2, int a3, int a4)
{
  char *v4;
  uint64_t v5;
  uint64_t result;

  switch(a2)
  {
    case 0:
      v4 = (char *)this + 4 * a3;
      v5 = 4240;
      goto LABEL_7;
    case 1:
      v4 = (char *)this + 4 * a3;
      v5 = 4256;
      goto LABEL_7;
    case 2:
      v4 = (char *)this + 4 * a3;
      v5 = 4272;
      goto LABEL_7;
    case 3:
      v4 = (char *)this + 4 * a3;
      v5 = 4288;
LABEL_7:
      result = 0;
      *(_DWORD *)&v4[v5] = a4;
      break;
    default:
      result = 8;
      break;
  }
  return result;
}

void std::__function::__func<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *std::__function::__func<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24D581A90;
  return result;
}

void std::__function::__func<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24D581A90;
}

uint64_t std::__function::__func<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::SubmixGain::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::operator()(uint64_t a1, Phase::DspLayer::VoiceEngine **a2, int *a3)
{
  Phase::DspLayer::VoiceEngine *v3;
  int v4;
  uint64_t v5;
  int v6;
  Phase::DspLayer::VoiceEngine *v7;
  int32x4_t *v8;

  v3 = *a2;
  v4 = *a3;
  v5 = operator new();
  Phase::DspLayer::VoicePool::VoicePool((Phase::DspLayer::VoicePool *)v5, "SubmixGain", v3, v4, 8784);
  *(_QWORD *)v5 = &off_24D581998;
  if (*(int *)(v5 + 40) >= 1)
  {
    v6 = 0;
    do
    {
      v7 = *(Phase::DspLayer::VoiceEngine **)(v5 + 32);
      v8 = (int32x4_t *)(*(_QWORD *)(v5 + 24) + *(int *)(v5 + 16) * (uint64_t)v6);
      v8->i64[0] = (uint64_t)&off_24D5819B8;
      v8->i64[1] = 0;
      bzero(&v8[8], 0x1010uLL);
      bzero(&v8[269], 0x1010uLL);
      ++v6;
    }
    while (v6 < *(_DWORD *)(v5 + 40));
  }
  return v5;
}

void sub_2166D8794(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199F9D70](v1, 0x10F1C408EBD29CELL);
  _Unwind_Resume(a1);
}

double Phase::SpatialModeler::GetRoomDataForSpaceBlendTarget(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double result;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[2];
  uint64_t v40;
  uint64_t v41;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  v40 = 0;
  memset(v39, 0, sizeof(v39));
  v36 = 0u;
  v37 = 0u;
  v38 = 0;
  do
  {
    if (v6 <= 9)
    {
      v5 = v6 + 1;
      *((_DWORD *)&v36 + v6++) = *(_DWORD *)((char *)v39 + v4);
    }
    v4 += 4;
  }
  while (v4 != 40);
  if (v5 <= 9)
    bzero((char *)&v36 + 4 * v5, 40 - 4 * v5);
  v7 = v37;
  *(_OWORD *)(a2 + 8) = v36;
  *(_OWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 40) = v38;
  v8 = *a1;
  if (*a1 <= 0x2FB51A26436E9690)
  {
    if (v8 <= 0x2FB51626436E8FC4)
    {
      if (v8 == 0xB2F0104201709A2BLL)
      {
        v10 = 0;
        v30 = 0;
        *(int32x2_t *)a2 = vdup_n_s32(0x497423F0u);
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        v31 = 10;
        do
        {
          if (v30 <= 9)
          {
            v10 = v30 + 1;
            *((_DWORD *)&v36 + v30++) = 981668463;
          }
          --v31;
        }
        while (v31);
        goto LABEL_80;
      }
      if (v8 == 0x2FB51526436E8E12)
      {
        v16 = 0;
        v10 = 0;
        v17 = 0;
        *(_QWORD *)a2 = 0x461C4000459C4000;
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        do
        {
          if (v17 <= 9)
          {
            v10 = v17 + 1;
            *((_DWORD *)&v36 + v17++) = dword_21673B090[v16];
          }
          ++v16;
        }
        while (v16 != 10);
        goto LABEL_80;
      }
    }
    else
    {
      switch(v8)
      {
        case 0x2FB51626436E8FC5:
          v22 = 0;
          v10 = 0;
          v23 = 0;
          *(_QWORD *)a2 = 0x4416000043960000;
          v38 = 0;
          v36 = 0u;
          v37 = 0u;
          do
          {
            if (v23 <= 9)
            {
              v10 = v23 + 1;
              *((_DWORD *)&v36 + v23++) = dword_21673B0B8[v22];
            }
            ++v22;
          }
          while (v22 != 10);
          goto LABEL_80;
        case 0x2FB51726436E9178:
          v24 = 0;
          v10 = 0;
          v25 = 0;
          *(_QWORD *)a2 = 0x461C4000459C4000;
          v38 = 0;
          v36 = 0u;
          v37 = 0u;
          do
          {
            if (v25 <= 9)
            {
              v10 = v25 + 1;
              *((_DWORD *)&v36 + v25++) = dword_21673B068[v24];
            }
            ++v24;
          }
          while (v24 != 10);
          goto LABEL_80;
        case 0x2FB51926436E94DELL:
          v12 = 0;
          v10 = 0;
          v13 = 0;
          *(_QWORD *)a2 = 0x461C4000459C4000;
          v38 = 0;
          v36 = 0u;
          v37 = 0u;
          do
          {
            if (v13 <= 9)
            {
              v10 = v13 + 1;
              *((_DWORD *)&v36 + v13++) = dword_21673B018[v12];
            }
            ++v12;
          }
          while (v12 != 10);
          goto LABEL_80;
      }
    }
LABEL_76:
    v10 = 0;
    v32 = 0;
    *(_QWORD *)a2 = 0x461C4000459C4000;
    v38 = 0;
    v36 = 0u;
    v37 = 0u;
    v33 = 10;
    do
    {
      if (v32 <= 9)
      {
        v10 = v32 + 1;
        *((_DWORD *)&v36 + v32++) = 1050253722;
      }
      --v33;
    }
    while (v33);
    goto LABEL_80;
  }
  if (v8 > 0x2FB51E26436E9D5CLL)
  {
    switch(v8)
    {
      case 0x2FB8852643718239:
        v26 = 0;
        v10 = 0;
        v27 = 0;
        *(_QWORD *)a2 = 0x461C4000459C4000;
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        do
        {
          if (v27 <= 9)
          {
            v10 = v27 + 1;
            *((_DWORD *)&v36 + v27++) = dword_21673B108[v26];
          }
          ++v26;
        }
        while (v26 != 10);
        goto LABEL_80;
      case 0x2FB8832643717ED3:
        v28 = 0;
        v10 = 0;
        v29 = 0;
        *(_QWORD *)a2 = 0x4416000043960000;
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        do
        {
          if (v29 <= 9)
          {
            v10 = v29 + 1;
            *((_DWORD *)&v36 + v29++) = dword_21673B0E0[v28];
          }
          ++v28;
        }
        while (v28 != 10);
        goto LABEL_80;
      case 0x2FB51E26436E9D5DLL:
        v14 = 0;
        v10 = 0;
        v15 = 0;
        *(_QWORD *)a2 = 0x461C4000459C4000;
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        do
        {
          if (v15 <= 9)
          {
            v10 = v15 + 1;
            *((_DWORD *)&v36 + v15++) = dword_21673B0E0[v14];
          }
          ++v14;
        }
        while (v14 != 10);
        goto LABEL_80;
    }
    goto LABEL_76;
  }
  switch(v8)
  {
    case 0x2FB51A26436E9691:
      v18 = 0;
      v10 = 0;
      v19 = 0;
      *(_QWORD *)a2 = 0x461C4000459C4000;
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      do
      {
        if (v19 <= 9)
        {
          v10 = v19 + 1;
          *((_DWORD *)&v36 + v19++) = dword_21673B040[v18];
        }
        ++v18;
      }
      while (v18 != 10);
      break;
    case 0x2FB51B26436E9844:
      v20 = 0;
      v10 = 0;
      v21 = 0;
      *(_QWORD *)a2 = 0x461C4000459C4000;
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      do
      {
        if (v21 <= 9)
        {
          v10 = v21 + 1;
          *((_DWORD *)&v36 + v21++) = dword_21673AFC8[v20];
        }
        ++v20;
      }
      while (v20 != 10);
      break;
    case 0x2FB51C26436E99F7:
      v9 = 0;
      v10 = 0;
      v11 = 0;
      *(_QWORD *)a2 = 0x461C4000459C4000;
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      do
      {
        if (v11 <= 9)
        {
          v10 = v11 + 1;
          *((_DWORD *)&v36 + v11++) = dword_21673AFF0[v9];
        }
        ++v9;
      }
      while (v9 != 10);
      break;
    default:
      goto LABEL_76;
  }
LABEL_80:
  if (v10 <= 9)
    bzero((char *)&v36 + 4 * v10, 40 - 4 * v10);
  result = *(double *)&v36;
  v35 = v37;
  *(_OWORD *)(a2 + 8) = v36;
  *(_OWORD *)(a2 + 24) = v35;
  *(_QWORD *)(a2 + 40) = v38;
  return result;
}

float Phase::SpatialModeler::TailCorrection::sMaxEnergyCorrectionFactor(Phase::SpatialModeler::TailCorrection *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)qword_254E449D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(qword_254E449D0))
  {
    _MergedGlobals_22 = 1098749243;
    __cxa_guard_release(qword_254E449D0);
  }
  return *(float *)&_MergedGlobals_22;
}

BOOL Phase::SpatialModeler::TailCorrection::validConfig(Phase::SpatialModeler::TailCorrection *this, const Phase::SpatialModeler::RayTracerState *a2)
{
  _BOOL8 result;
  float *v4;

  result = 0;
  if (*((float *)this + 4878) > 0.0 && *((float *)this + 28) > 0.0 && *((float *)this + 116) > 0.0)
  {
    v4 = (float *)((char *)this + 19776);
    if (*((_DWORD *)v4 + 31))
    {
      result = 0;
      if (*((_DWORD *)v4 + 63))
      {
        if (*v4 > 0.0)
          return v4[32] > 0.0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t Phase::SpatialModeler::TailCorrection::prepareEDC(void **this, unsigned int a2)
{
  _DWORD *v2;
  float v5;
  float *v6;
  float v7;
  float *v8;
  float v9;
  unsigned int v10;
  unint64_t i;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  unsigned int v16;
  uint64_t v17;
  float v18;
  float *v19;
  unsigned int v20;
  float *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  float v25;
  float v26;
  float v27;
  uint64_t result;
  float v29;
  float v30;
  void *__p[3];

  v2 = *this;
  if (*this && v2[7] > a2)
  {
    std::vector<float>::resize((uint64_t)(this + 4), v2[6]);
    bzero(this[4], 4 * *((unsigned int *)*this + 6));
    this[10] = (void *)0xFFFFFFFFLL;
    v5 = __exp10f(-0.2);
    v6 = (float *)*this;
    if (*this)
    {
      if (*((_DWORD *)v6 + 7) > a2)
      {
        v7 = v5;
        Phase::SpatialModeler::EnergyHistogram::getTemporalEnergyEnvelope_Band((Phase::SpatialModeler::EnergyHistogram *)*this, a2, __p);
        v8 = (float *)__p[0];
        v6 = (float *)*this;
        v9 = *((float *)this + 21);
        v10 = *((_DWORD *)*this + 6);
        if (v10)
        {
          for (i = 0; i < v10; ++i)
          {
            v12 = v8[i];
            if (v12 > v9)
            {
              *((_DWORD *)this + 20) = i;
              *((float *)this + 21) = v12;
              v10 = *((_DWORD *)v6 + 6);
              v9 = v12;
            }
          }
        }
        v13 = v7 * v9;
        v14 = (int)(v10 - 1);
        while ((int)v14 > *((_DWORD *)this + 20))
        {
          v15 = v8[v14--];
          --v10;
          if (v15 >= v13)
          {
            *((_DWORD *)this + 20) = v10;
            *((float *)this + 21) = v15;
            goto LABEL_17;
          }
        }
        if (!v8)
          goto LABEL_18;
LABEL_17:
        __p[1] = v8;
        operator delete(v8);
        v6 = (float *)*this;
      }
LABEL_18:
      v16 = *((_DWORD *)this + 20);
      if ((v16 & 0x80000000) != 0)
      {
        this[10] = (void *)0xFFFFFFFFLL;
        if (!v6 || *((_DWORD *)v6 + 7) <= a2)
          return 0;
        v29 = v6[10];
        if (v6[5] <= v29)
          v16 = -1;
        else
          v16 = vcvtms_s32_f32(v29 / v6[4]);
        *((_DWORD *)this + 20) = v16;
        v30 = 1.0;
        if (v29 > 0.0)
          v30 = 1.0 / (float)((float)(v29 * 343.0) * (float)(v29 * 343.0));
        *((float *)this + 21) = v30;
        if ((v16 & 0x80000000) != 0)
          return 0;
      }
    }
    else
    {
      v16 = *((_DWORD *)this + 20);
      if ((v16 & 0x80000000) != 0)
      {
        result = 0;
        this[10] = (void *)0xFFFFFFFFLL;
        return result;
      }
      v6 = 0;
    }
    v17 = *((unsigned int *)v6 + 6);
    v18 = 0.0;
    if (!*((_BYTE *)v6 + 36))
    {
      if (!(_DWORD)v17)
        return 1;
      v19 = (float *)(*((_QWORD *)v6 + 1) + 4 * a2);
      v20 = *((_DWORD *)v6 + 6);
      do
      {
        v18 = v18 + *v19;
        v19 += *((unsigned int *)v6 + 7);
        --v20;
      }
      while (v20);
    }
    if ((_DWORD)v17)
    {
      v21 = (float *)this[4];
      v22 = *((_DWORD *)v6 + 7);
      v23 = v16;
      v24 = a2;
      v25 = v18;
      do
      {
        v26 = log10f((float)(v25 / v18) + 1.0e-15) * 10.0;
        *v21 = v26;
        if (!v23)
          *((float *)this + 22) = v26;
        v27 = 0.0;
        if (v22 > a2)
          v27 = *(float *)(*((_QWORD *)v6 + 1) + 4 * v24);
        v25 = v25 - v27;
        v24 += v22;
        --v23;
        ++v21;
        --v17;
      }
      while (v17);
    }
    return 1;
  }
  return 0;
}

uint64_t Phase::SpatialModeler::TailCorrection::validHistogramRange(Phase::SpatialModeler::TailCorrection *this, const Phase::SpatialModeler::RayTracerState *a2, int a3, float a4)
{
  unsigned int v5;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  unsigned int v13;

  v5 = *((_DWORD *)a2 + 4754) - *((_DWORD *)a2 + 16);
  if (!v5)
    return *((unsigned int *)this + 20);
  v9 = *((float *)a2 + 4878) / ((double)v5 * 3.14159265 * *((float *)a2 + 116) * *((float *)a2 + 29));
  v10 = logf(1.0 / (float)(sqrtf(v9) * 4.3429)) / 6.9;
  v11 = fabsf(logf(*((float *)a2 + 26)) * 10.0) / 60.0;
  if (v10 <= v11)
    v11 = v10;
  if (v11 < 0.0)
    v11 = 0.0;
  v12 = (int)(float)((float)(*((float *)a2 + a3 + 4976) * v11) / *((float *)a2 + 28));
  v13 = *(_DWORD *)(*(_QWORD *)this + 24);
  if (v13 <= v12)
    return v13 - 1;
  else
    return v12;
}

float Phase::SpatialModeler::TailCorrection::linearRegression(Phase::SpatialModeler::TailCorrection *this, signed int a2, double a3)
{
  signed int v3;
  unsigned int v4;
  uint32x4_t v5;
  int32x4_t v6;
  float32x4_t v7;
  float v8;
  float32x4_t v9;
  int8x16_t v10;
  int32x4_t v11;
  int8x16_t v12;
  int v13;
  float v14;
  uint64_t v15;
  float *v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  unsigned int v23;
  uint32x4_t v24;
  int32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  int8x16_t v30;
  int32x4_t v31;
  float32x4_t v32;
  int8x16_t v33;
  float result;

  v3 = *((_DWORD *)this + 20);
  if (v3 >= a2)
    return 3.4028e38;
  v4 = 0;
  LODWORD(a3) = *(_DWORD *)(*(_QWORD *)this + 16);
  v5 = (uint32x4_t)vdupq_n_s32(a2 - v3);
  v6 = vaddq_s32(vdupq_n_s32(v3), (int32x4_t)xmmword_2166F7490);
  v7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a3, 0);
  v8 = 0.0;
  v9.i64[0] = 0x3F0000003F000000;
  v9.i64[1] = 0x3F0000003F000000;
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  v11.i64[0] = 0x400000004;
  v11.i64[1] = 0x400000004;
  do
  {
    v12 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v4), (int8x16_t)xmmword_2166F7490), v5), v10, (int8x16_t)vmlaq_f32(vmulq_n_f32(vcvtq_f32_s32(v6), *(float *)&a3), v9, v7));
    v8 = (float)((float)((float)(v8 + *(float *)v12.i32) + *(float *)&v12.i32[1]) + *(float *)&v12.i32[2])
       + *(float *)&v12.i32[3];
    v4 += 4;
    v6 = vaddq_s32(v6, v11);
  }
  while (((a2 - v3 + 4) & 0xFFFFFFFC) != v4);
  v13 = a2 - v3 + 1;
  v14 = (float)v13;
  v15 = *((_QWORD *)this + 4);
  v16 = (float *)(v15 + 4 * v3);
  v17 = 0.0;
  do
  {
    v18 = *v16++;
    v17 = v17 + v18;
    --v13;
  }
  while (v13);
  v19 = 0;
  *(float *)v5.i32 = v8 / v14;
  v20 = v15 + 4 * v3;
  v21 = 0.0;
  v22 = v17 / v14;
  do
  {
    v21 = v21
        + (float)((float)((float)((float)(*(float *)&a3 * (float)(v3 + v19)) + (float)(*(float *)&a3 * 0.5))
                        - *(float *)v5.i32)
                * (float)(*(float *)(v20 + 4 * v19) - v22));
    ++v19;
  }
  while (a2 - v3 + 1 != (_DWORD)v19);
  v23 = 0;
  v24 = (uint32x4_t)vdupq_n_s32(a2 - v3);
  v25 = vaddq_s32(vdupq_n_s32(v3), (int32x4_t)xmmword_2166F7490);
  v26 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a3, 0);
  v27 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.i8, 0);
  v28 = 0.0;
  v29.i64[0] = 0x3F0000003F000000;
  v29.i64[1] = 0x3F0000003F000000;
  v30.i64[0] = 0x8000000080000000;
  v30.i64[1] = 0x8000000080000000;
  v31.i64[0] = 0x400000004;
  v31.i64[1] = 0x400000004;
  do
  {
    v32 = vsubq_f32(vmlaq_f32(vmulq_n_f32(vcvtq_f32_s32(v25), *(float *)&a3), v29, v26), v27);
    v33 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v23), (int8x16_t)xmmword_2166F7490), v24), v30, (int8x16_t)vmulq_f32(v32, v32));
    v28 = (float)((float)((float)(v28 + *(float *)v33.i32) + *(float *)&v33.i32[1]) + *(float *)&v33.i32[2])
        + *(float *)&v33.i32[3];
    v23 += 4;
    v25 = vaddq_s32(v25, v31);
  }
  while (((a2 - v3 + 4) & 0xFFFFFFFC) != v23);
  result = v21 / v28;
  if (v28 == 0.0)
    return 3.4028e38;
  return result;
}

void Phase::SpatialModeler::TailCorrection::calcExtrapolatedDecay(Phase::SpatialModeler::TailCorrection *this, unsigned int a2, float a3, float a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  float v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  void *__src[3];

  std::vector<float>::resize((uint64_t)this + 56, *(unsigned int *)(*(_QWORD *)this + 24));
  v8 = (void *)*((_QWORD *)this + 7);
  Phase::SpatialModeler::EnergyHistogram::getTemporalEnergyEnvelope_Band(*(Phase::SpatialModeler::EnergyHistogram **)this, a2, __src);
  v9 = __src[0];
  memcpy(v8, __src[0], 4 * *((int *)this + 20) + 4);
  if (v9)
  {
    __src[1] = v9;
    operator delete(v9);
  }
  v10 = *((int *)this + 20);
  v11 = *(_QWORD *)this;
  v12 = *(_DWORD *)(*(_QWORD *)this + 24);
  if ((int)v10 + 1 < v12)
  {
    v13 = *((float *)this + 21);
    v14 = *((_QWORD *)this + 7);
    v15 = *((_DWORD *)this + 20);
    v16 = v14 + 4 * v10;
    v17 = 1;
    v18 = (float)(a3 - a4) / (float)(a4 * -13.816);
    do
    {
      *(float *)(v16 + 4 * v17) = v13
                                * expf((float)-(float)(*(float *)(v11 + 16) * (float)(int)v17)/ (float)((float)(a3 / 13.816)+ (float)(v18 * (float)(*(float *)(v11 + 16) * (float)(int)v17))));
      ++v17;
    }
    while (v12 > v15 + (int)v17);
  }
}

void Phase::SpatialModeler::TailCorrection::modifyHistograms(Phase::SpatialModeler::EnergyHistogram **this, const Phase::SpatialModeler::RayTracerState *a2, unsigned int a3, int a4)
{
  float *v6;
  float32x4_t v9;
  int32x4_t v10;
  char *v11;
  Phase::SpatialModeler::EnergyHistogram *v12;
  uint64_t v13;
  int v14;
  int v15;
  float v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64x2_t v20;
  uint64_t v21;
  float32x4_t v22;
  __int32 *v23;
  __int32 *v24;
  float32x4_t v25;
  int8x16_t v26;
  int32x4_t v27;
  int32x2_t v28;
  int32x4_t v29;
  int32x2_t v30;
  int8x16_t v31;
  signed int v32;
  Phase::SpatialModeler::EnergyHistogram *v33;
  float *v34;
  float *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float __B;
  void *__p[3];

  if ((a3 & 0x80000000) == 0)
  {
    v6 = (float *)((char *)a2 + 19016);
    if (*((_DWORD *)a2 + 5007) > a3 && *((float *)a2 + a3 + 4976) > 0.0)
    {
      Phase::SpatialModeler::EnergyHistogram::getTemporalEnergyEnvelope_Band(*this, a3, __p);
      v11 = (char *)__p[0];
      v12 = this[7];
      if (a4)
      {
        v13 = *((int *)this + 20);
        v14 = *((_DWORD *)*this + 6);
        if (v14 >= (int)v13 + 3)
          v15 = v13 + 3;
        else
          v15 = *((_DWORD *)*this + 6);
        v16 = 0.0;
        if ((int)v13 < v15)
        {
          v17 = 0;
          v18 = v15 - v13;
          v19 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v20 = (uint64x2_t)vdupq_n_s64(v18 - 1);
          v21 = 4 * v13 + 8;
          v22 = (float32x4_t)xmmword_2166F7AF0;
          v23 = (__int32 *)((char *)__p[0] + v21);
          v24 = (__int32 *)((char *)v12 + v21);
          do
          {
            v25 = v22;
            v26 = (int8x16_t)vdupq_n_s64(v17);
            v27 = (int32x4_t)vcgeq_u64(v20, (uint64x2_t)vorrq_s8(v26, (int8x16_t)xmmword_2166F7AE0));
            *(int32x2_t *)v10.i8 = vmovn_s64((int64x2_t)v27);
            *(int16x4_t *)v22.f32 = vmovn_s32(v10);
            if ((v22.i8[0] & 1) != 0)
            {
              v22.i32[0] = *(v23 - 2);
              v9.i32[0] = *(v24 - 2);
            }
            v28 = (int32x2_t)vmovn_s32(v10);
            if ((v28.i8[2] & 1) != 0)
            {
              v22.i32[1] = *(v23 - 1);
              v9.i32[1] = *(v24 - 1);
            }
            v29 = (int32x4_t)vcgeq_u64(v20, (uint64x2_t)vorrq_s8(v26, (int8x16_t)xmmword_2166F7AD0));
            v30 = (int32x2_t)vmovn_s32(vmovn_hight_s64(v28, (int64x2_t)v29));
            if ((v30.i8[4] & 1) != 0)
            {
              v22.i32[2] = *v23;
              v9.i32[2] = *v24;
            }
            v10 = vmovn_hight_s64(v30, (int64x2_t)v29);
            if ((vmovn_s32(v10).i8[6] & 1) != 0)
            {
              v22.i32[3] = v23[1];
              v9.i32[3] = v24[1];
            }
            v22 = vaddq_f32(v25, vdivq_f32(v22, v9));
            v17 += 4;
            v23 += 4;
            v24 += 4;
          }
          while (v19 != v17);
          v31 = vbslq_s8((int8x16_t)vuzp1q_s32(v27, v29), (int8x16_t)v22, (int8x16_t)v25);
          v16 = (float)(vaddv_f32(*(float32x2_t *)v31.i8) + *(float *)&v31.i32[2]) + *(float *)&v31.i32[3];
        }
        __B = v16 / 3.0;
        vDSP_vsmul((const float *)v12 + v13, 1, &__B, (float *)v12 + v13, 1, (v14 - v13));
      }
      v32 = *((_DWORD *)this + 20);
      v33 = *this;
      if (v32 < *((_DWORD *)*this + 6))
      {
        v34 = (float *)&v11[4 * v32];
        v35 = (float *)((char *)v12 + 4 * v32);
        do
        {
          v36 = *((float *)a2 + 29);
          v37 = sqrtf(v6[124] / (float)(v36
                                      * (float)(*((float *)a2 + 116) * (float)((float)*(unsigned int *)v6 * 3.1416))))
              * 4.34;
          v38 = expf((float)((float)((float)((float)v32 + 0.5) * 6.9) * v36) / *((float *)a2 + a3 + 4976));
          v39 = expf((float)((float)((float)(v38 * v37) * 12.0) * 2.3026) / 10.0);
          Phase::SpatialModeler::EnergyHistogram::setEnergy((uint64_t)v33, (float)(*v34 * (float)(1.0 / (float)(v39 + 1.0)))+ (float)((float)(1.0 - (float)(1.0 / (float)(v39 + 1.0))) * *v35), a3, v32);
          v33 = *this;
          ++v32;
          ++v34;
          ++v35;
        }
        while (*((_DWORD *)*this + 6) > v32);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
}

void sub_2166D9888(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Phase::SpatialModeler::TailCorrection::modifyDirectivityHistogram(const float **this, const Phase::SpatialModeler::RayTracerState *a2, const Phase::SpatialModeler::EnergyHistogram *a3, float a4, float a5)
{
  float *v7;
  unsigned int v8;
  float v9;
  uint64_t v10;
  float v11;
  const float *v12;
  uint64_t i;
  vDSP_Length v14;
  const float *v16;
  const float *v17;
  uint64_t v18;
  float v19;
  const float *v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  uint64_t v35;
  int32x2_t v36;
  int32x4_t v37;
  float v38;
  float v39;
  float __C;
  float v41;

  v7 = (float *)((char *)a2 + 19776);
  v8 = *((_DWORD *)a2 + 4975);
  if (v8)
  {
    v9 = 0.0;
    v10 = *((unsigned int *)a2 + 4975);
    do
    {
      v11 = *v7++;
      v9 = v9 + v11;
      --v10;
    }
    while (v10);
    if (v8 >= 2)
      v9 = v9 / (float)v8;
  }
  else
  {
    v9 = 0.0;
  }
  v12 = *this;
  v38 = -1.0;
  if ((*this)[5] > v9)
    v38 = (float)(int)floorf(v9 / v12[4]);
  for (i = *((int *)this + 20); *((_DWORD *)v12 + 6) > i; ++i)
  {
    v14 = *((unsigned int *)a3 + 7);
    if (*((_DWORD *)a3 + 6) > i && *((_BYTE *)a3 + 36) == 0)
      v16 = (const float *)(*((_QWORD *)a3 + 1) + 4 * (v14 * i));
    else
      v16 = (const float *)&Phase::SpatialModeler::EnergyHistogram::s_emptyTS;
    v17 = (const float *)&Phase::SpatialModeler::EnergyHistogram::s_emptyTS;
    if (!*((_BYTE *)v12 + 36))
      v17 = (const float *)(*((_QWORD *)v12 + 1) + 4 * (*((_DWORD *)v12 + 7) * i));
    v39 = 0.0;
    __C = 0.0;
    vDSP_sve(v16, 1, &__C, v14);
    vDSP_sve(v17, 1, &v39, *((unsigned int *)*this + 7));
    if (v39 <= __C)
    {
      v12 = *this;
    }
    else
    {
      if (*((_DWORD *)*this + 28) <= i)
        v18 = 0;
      else
        v18 = *((_QWORD *)*this + 15) + 4 * (73 * i);
      v19 = v39 - __C;
      v20 = this[1];
      v41 = 0.0;
      vDSP_sve(v20, 1, &v41, 0x48uLL);
      if (v41 <= 1.1755e-38)
      {
        v30 = 0;
        v31 = 0.0;
        do
        {
          v32 = v31;
          v31 = v31 + 0.5236;
          v33 = cosf(v32);
          v34 = cosf(v31);
          v35 = 0;
          *(float *)v36.i32 = v19 * (float)((float)((float)(v33 - v34) * 0.5) / 12.0);
          v37 = vdupq_lane_s32(v36, 0);
          do
          {
            *(int32x4_t *)(v18 + v35) = v37;
            v35 += 16;
          }
          while (v35 != 48);
          ++v30;
          v18 += 48;
        }
        while (v30 != 6);
      }
      else
      {
        v21 = 0;
        v22 = fminf(fmaxf((float)(int)i / v38, 0.0), 1.0);
        v23 = (float)(v22 * 0.8) + (float)((float)(1.0 - v22) * 0.25);
        v24 = 0.0;
        do
        {
          v25 = v24;
          v24 = v24 + 0.5236;
          v26 = cosf(v25);
          v27 = cosf(v24);
          v28 = 0;
          v29 = v23 * (float)((float)((float)(v26 - v27) * 0.5) / 12.0);
          do
          {
            *(float *)(v18 + v28 * 4) = *(float *)(v18 + v28 * 4)
                                      + (float)(v19 * (float)(v29 + (float)((float)(1.0 - v23) * v20[v28])));
            ++v28;
          }
          while (v28 != 12);
          ++v21;
          v18 += 48;
          v20 += 12;
        }
        while (v21 != 6);
      }
      v12 = *this;
      *(_DWORD *)(*((_QWORD *)*this + 11) + 4 * i) = 1;
    }
  }
}

void Phase::SpatialModeler::TailCorrection::execute(uint64_t a1, Phase::SpatialModeler::TailCorrection *this, uint64_t a3, float *a4, float a5, float a6)
{
  Phase::SpatialModeler::DirectivityHistogram *v12;
  _DWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  float v18;
  __int128 v19;
  unint64_t v20;
  char *v21;
  signed int valid;
  double v23;
  float v24;
  float v25;
  float v26;
  int v27;
  uint64_t v28;
  float *v29;
  float *v30;
  float v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[32];
  void (**v40)(Phase::SpatialModeler::EnergyHistogram *__hidden);
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;

  if (*(_QWORD *)a1 && Phase::SpatialModeler::TailCorrection::validConfig(this, this))
  {
    std::vector<float>::resize(a1 + 8, 0x48uLL);
    Phase::SpatialModeler::DirectivityHistogram::getNormalizedDirectionalDistribution(*(Phase::SpatialModeler::DirectivityHistogram **)a1, *(float **)(a1 + 8), 0x48u);
    v12 = *(Phase::SpatialModeler::DirectivityHistogram **)a1;
    v40 = &off_24D57C9E0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 1065353216;
    v45 = 1;
    v46 = 0;
    v47 = 0;
    v49 = 1065353216;
    v50 = 0;
    v48 = 0;
    v51 = 1065353216;
    Phase::SpatialModeler::EnergyHistogram::operator=((void **)&v40, (uint64_t)v12);
    v13 = (_DWORD *)((char *)this + 19900);
    v14 = *((unsigned int *)this + 4975);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    memset(v39, 0, 28);
    *(_DWORD *)&v39[28] = v14;
    if ((_DWORD)v14)
      bzero(&v33, 4 * v14);
    v15 = v38;
    *((_OWORD *)a4 + 4) = v37;
    *((_OWORD *)a4 + 5) = v15;
    v16 = *(_OWORD *)&v39[16];
    *((_OWORD *)a4 + 6) = *(_OWORD *)v39;
    *((_OWORD *)a4 + 7) = v16;
    v17 = v34;
    *(_OWORD *)a4 = v33;
    *((_OWORD *)a4 + 1) = v17;
    v18 = *(float *)&v35;
    v19 = v36;
    *((_OWORD *)a4 + 2) = v35;
    *((_OWORD *)a4 + 3) = v19;
    if (*(_DWORD *)(*(_QWORD *)a1 + 28) && *v13)
    {
      v20 = 0;
      v21 = (char *)this + 19776;
      do
      {
        if ((Phase::SpatialModeler::TailCorrection::prepareEDC((void **)a1, v20) & 1) != 0)
        {
          valid = Phase::SpatialModeler::TailCorrection::validHistogramRange((Phase::SpatialModeler::TailCorrection *)a1, this, v20, v18);
          *(float *)&v23 = *(float *)(*(_QWORD *)(a1 + 32) + 4 * *(int *)(a1 + 80))
                         - *(float *)(*(_QWORD *)(a1 + 32) + 4 * valid);
          if (*(float *)&v23 < 6.0
            || (v24 = Phase::SpatialModeler::TailCorrection::linearRegression((Phase::SpatialModeler::TailCorrection *)a1, valid, v23), v24 == 3.4028e38))
          {
            Phase::SpatialModeler::TailCorrection::calcExtrapolatedDecay((Phase::SpatialModeler::TailCorrection *)a1, v20, *(float *)&v21[4 * v20], *(float *)&v21[4 * v20]);
            v27 = 0;
          }
          else
          {
            v25 = -60.0 / v24;
            a4[v20] = v25;
            v26 = *(float *)&v21[4 * v20];
            if (v25 >= v26)
              v26 = v25;
            Phase::SpatialModeler::TailCorrection::calcExtrapolatedDecay((Phase::SpatialModeler::TailCorrection *)a1, v20, v25, v26);
            v27 = 1;
          }
          Phase::SpatialModeler::TailCorrection::modifyHistograms((Phase::SpatialModeler::EnergyHistogram **)a1, this, v20, v27);
          v28 = *(unsigned int *)(a3 + 124);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          memset(v39, 0, 28);
          *(_DWORD *)&v39[28] = v28;
          if ((_DWORD)v28)
          {
            v29 = (float *)&v33;
            v30 = (float *)a3;
            do
            {
              v31 = *v30++;
              *v29++ = v31 * a6;
              --v28;
            }
            while (v28);
          }
          Phase::SpatialModeler::TailCorrection::totalEnergyCorrectionUsingPrediction((uint64_t *)a1, v20, (uint64_t)&v33, a5);
        }
      }
      while (++v20 < *(unsigned int *)(*(_QWORD *)a1 + 28) && v20 < *v13);
    }
    Phase::SpatialModeler::TailCorrection::modifyDirectivityHistogram((const float **)a1, this, (const Phase::SpatialModeler::EnergyHistogram *)&v40, v18, *(float *)&v19);
    v40 = &off_24D57C9E0;
    free(v41);
  }
}

void sub_2166D9E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  free(a26);
  _Unwind_Resume(a1);
}

void Phase::SpatialModeler::TailCorrection::totalEnergyCorrectionUsingPrediction(uint64_t *a1, unsigned int a2, uint64_t a3, float a4)
{
  uint64_t v8;
  float v9;
  int v10;
  float *v11;
  uint64_t v12;
  float v13;
  float v14;
  Phase::SpatialModeler::TailCorrection *v15;
  float v16;
  Phase::SpatialModeler::TailCorrection *v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  float v22;
  float *v23;
  uint64_t v24;
  Phase::Logger *ShouldFire;
  NSObject *v26;
  double v27;
  double v28;
  float v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = *a1;
  v9 = 0.0;
  if (!*(_BYTE *)(*a1 + 36))
  {
    v10 = *(_DWORD *)(v8 + 24);
    if (v10)
    {
      v11 = (float *)(*(_QWORD *)(v8 + 8) + 4 * a2);
      v12 = 4 * *(unsigned int *)(v8 + 28);
      do
      {
        v9 = v9 + *v11;
        v11 = (float *)((char *)v11 + v12);
        --v10;
      }
      while (v10);
    }
  }
  v13 = *(float *)(a3 + 4 * (int)a2);
  v14 = log10f(v9 / v13) * 10.0;
  v16 = Phase::SpatialModeler::TailCorrection::sMaxEnergyCorrectionFactor(v15);
  v18 = Phase::SpatialModeler::TailCorrection::sMaxEnergyCorrectionFactor(v17);
  v19 = *a1;
  if (!*(_BYTE *)(*a1 + 36))
  {
    v20 = *(unsigned int *)(v19 + 28);
    if (v20 > a2)
    {
      v21 = *(_DWORD *)(v19 + 24);
      if (v21)
      {
        v22 = fminf(fmaxf((float)((float)(v13 * a4) + (float)((float)(1.0 - a4) * v9)) / v9, 1.0 / v16), v18);
        v23 = (float *)(*(_QWORD *)(v19 + 8) + 4 * a2);
        v24 = 4 * v20;
        do
        {
          *v23 = v22 * *v23;
          v23 = (float *)((char *)v23 + v24);
          --v21;
        }
        while (v21);
      }
    }
  }
  if (fabsf(v14) > 6.0)
  {
    ShouldFire = (Phase::Logger *)Phase::Throttle::ShouldFire((Phase::Throttle *)(a1 + 12), 0);
    if ((_DWORD)ShouldFire)
    {
      v26 = **(NSObject ***)(Phase::Logger::GetInstancePtr(ShouldFire) + 1184);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v14;
        v28 = (float)(log10f(v9) * 10.0);
        v29 = log10f(*(float *)(a3 + 4 * (int)a2));
        v30 = 136316418;
        v31 = "TailCorrection.cpp";
        v32 = 1024;
        v33 = 354;
        v34 = 2048;
        v35 = v27;
        v36 = 2048;
        v37 = v28;
        v38 = 2048;
        v39 = (float)(v29 * 10.0);
        v40 = 2048;
        v41 = a4;
        _os_log_impl(&dword_2164CC000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Tail-correction energy may be inaccurate by %.2f dB. Histogram: %.2f dB, Analytical: %.2f dB. Weighting: %.2f", (uint8_t *)&v30, 0x3Au);
      }
    }
  }
}

void Phase::SpatialModeler::TailCorrection::executeTargetRt60(uint64_t a1, Phase::SpatialModeler::TailCorrection *this, uint64_t a3, uint64_t a4, float *a5, float a6, float a7)
{
  Phase::SpatialModeler::DirectivityHistogram *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  float v19;
  __int128 v20;
  unint64_t v21;
  signed int valid;
  double v23;
  float v24;
  float v25;
  int v26;
  uint64_t v27;
  float *v28;
  float *v29;
  float v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[32];
  void (**v39)(Phase::SpatialModeler::EnergyHistogram *__hidden);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;

  if (*(_QWORD *)a1 && Phase::SpatialModeler::TailCorrection::validConfig(this, this))
  {
    std::vector<float>::resize(a1 + 8, 0x48uLL);
    Phase::SpatialModeler::DirectivityHistogram::getNormalizedDirectionalDistribution(*(Phase::SpatialModeler::DirectivityHistogram **)a1, *(float **)(a1 + 8), 0x48u);
    v14 = *(Phase::SpatialModeler::DirectivityHistogram **)a1;
    v39 = &off_24D57C9E0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 1065353216;
    v44 = 1;
    v45 = 0;
    v46 = 0;
    v48 = 1065353216;
    v49 = 0;
    v47 = 0;
    v50 = 1065353216;
    Phase::SpatialModeler::EnergyHistogram::operator=((void **)&v39, (uint64_t)v14);
    v15 = *(unsigned int *)(a4 + 124);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    memset(v38, 0, 28);
    *(_DWORD *)&v38[28] = v15;
    if ((_DWORD)v15)
      bzero(&v32, 4 * v15);
    v16 = v37;
    *((_OWORD *)a5 + 4) = v36;
    *((_OWORD *)a5 + 5) = v16;
    v17 = *(_OWORD *)&v38[16];
    *((_OWORD *)a5 + 6) = *(_OWORD *)v38;
    *((_OWORD *)a5 + 7) = v17;
    v18 = v33;
    *(_OWORD *)a5 = v32;
    *((_OWORD *)a5 + 1) = v18;
    v19 = *(float *)&v34;
    v20 = v35;
    *((_OWORD *)a5 + 2) = v34;
    *((_OWORD *)a5 + 3) = v20;
    if (*(_DWORD *)(*(_QWORD *)a1 + 28) && *(_DWORD *)(a4 + 124))
    {
      v21 = 0;
      do
      {
        if ((Phase::SpatialModeler::TailCorrection::prepareEDC((void **)a1, v21) & 1) != 0)
        {
          valid = Phase::SpatialModeler::TailCorrection::validHistogramRange((Phase::SpatialModeler::TailCorrection *)a1, this, v21, v19);
          *(float *)&v23 = *(float *)(*(_QWORD *)(a1 + 32) + 4 * *(int *)(a1 + 80))
                         - *(float *)(*(_QWORD *)(a1 + 32) + 4 * valid);
          if (*(float *)&v23 < 6.0
            || (v24 = Phase::SpatialModeler::TailCorrection::linearRegression((Phase::SpatialModeler::TailCorrection *)a1, valid, v23), v24 == 3.4028e38))
          {
            Phase::SpatialModeler::TailCorrection::calcExtrapolatedDecay((Phase::SpatialModeler::TailCorrection *)a1, v21, *(float *)(a4 + 4 * v21), *(float *)(a4 + 4 * v21));
            v26 = 0;
          }
          else
          {
            v25 = -60.0 / v24;
            a5[v21] = v25;
            Phase::SpatialModeler::TailCorrection::calcExtrapolatedDecay((Phase::SpatialModeler::TailCorrection *)a1, v21, v25, *(float *)(a4 + 4 * v21));
            v26 = 1;
          }
          Phase::SpatialModeler::TailCorrection::modifyHistograms((Phase::SpatialModeler::EnergyHistogram **)a1, this, v21, v26);
          v27 = *(unsigned int *)(a3 + 124);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          memset(v38, 0, 28);
          *(_DWORD *)&v38[28] = v27;
          if ((_DWORD)v27)
          {
            v28 = (float *)&v32;
            v29 = (float *)a3;
            do
            {
              v30 = *v29++;
              *v28++ = v30 * a7;
              --v27;
            }
            while (v27);
          }
          Phase::SpatialModeler::TailCorrection::totalEnergyCorrectionUsingPrediction((uint64_t *)a1, v21, (uint64_t)&v32, a6);
        }
      }
      while (++v21 < *(unsigned int *)(*(_QWORD *)a1 + 28) && v21 < *(unsigned int *)(a4 + 124));
    }
    Phase::SpatialModeler::TailCorrection::modifyDirectivityHistogram((const float **)a1, this, (const Phase::SpatialModeler::EnergyHistogram *)&v39, v19, *(float *)&v20);
    v39 = &off_24D57C9E0;
    free(v40);
  }
}

void sub_2166DA330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  free(a26);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::TapManager::TapManager(uint64_t a1, Phase::Logger *a2, uint64_t a3, uint64_t a4)
{
  uint64_t InstancePtr;
  uint64_t v9;

  InstancePtr = Phase::Logger::GetInstancePtr((Phase::Logger *)a1);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::Commandable(a1, *(_QWORD *)(InstancePtr + 944), 1, 0x20000);
  *(_QWORD *)a1 = off_24D581AD8;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_QWORD *)(a1 + 80) = &off_24D576FB8;
  *(_QWORD *)(a1 + 104) = a1 + 80;
  *(_DWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = 850045863;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_QWORD *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 256) = 1065353216;
  *(_QWORD *)(a1 + 264) = a3;
  *(_QWORD *)(a1 + 272) = a4;
  *(_QWORD *)(a1 + 280) = 0;
  *(_QWORD *)(a1 + 288) = a2;
  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 304) = 0;
  if (!a3
    || !a4
    || !a2
    || (v9 = Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>(a2, 16),
        (*(_QWORD *)(a1 + 296) = v9) == 0))
  {
    std::terminate();
  }
  return a1;
}

void sub_2166DA454(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::~__hash_table((uint64_t)(v1 + 28));
  caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::~guarded_lookup_hash_table(v3);
  std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>>>::~__hash_table(v2);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(v1);
  _Unwind_Resume(a1);
}

void Phase::Controller::TapManager::~TapManager(Phase::Controller::TapManager *this)
{
  Phase::Controller::TapManager *v1;
  uint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  _QWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  char *v18;
  _QWORD *v19;
  unint64_t *v20;
  _OWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t *i;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t k;
  uint64_t *v35;
  void *__p[2];
  unint64_t *__pa;
  unint64_t *__p_8;
  _QWORD v39[2];

  v1 = this;
  v39[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = off_24D581AD8;
  v2 = *((_QWORD *)this + 30);
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = *(_QWORD **)(*(_QWORD *)(v2 + 32) + 16);
      v35 = (uint64_t *)v2;
      if (v7)
      {
        v8 = (_OWORD *)(v2 + 16);
        do
        {
          *(_OWORD *)__p = *v8;
          v9 = v7[2];
          if (v6 >= v5)
          {
            v10 = 0xAAAAAAAAAAAAAAABLL * ((v6 - v3) >> 3);
            v11 = v10 + 1;
            if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v5 - v3) >> 3) > v11)
              v11 = 0x5555555555555556 * ((v5 - v3) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v5 - v3) >> 3) >= 0x555555555555555)
              v12 = 0xAAAAAAAAAAAAAAALL;
            else
              v12 = v11;
            if (v12)
            {
              if (v12 > 0xAAAAAAAAAAAAAAALL)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v13 = (char *)operator new(24 * v12);
            }
            else
            {
              v13 = 0;
            }
            v14 = &v13[24 * v10];
            *(_OWORD *)v14 = *(_OWORD *)__p;
            *((_QWORD *)v14 + 2) = v9;
            if (v4 == v3)
            {
              v16 = &v13[24 * v10];
            }
            else
            {
              v15 = &v13[24 * v10];
              do
              {
                v16 = v15 - 24;
                v17 = *(_OWORD *)(v4 - 24);
                *((_QWORD *)v15 - 1) = *((_QWORD *)v4 - 1);
                *(_OWORD *)(v15 - 24) = v17;
                v4 -= 24;
                v15 -= 24;
              }
              while (v4 != v3);
            }
            v5 = &v13[24 * v12];
            v4 = v14 + 24;
            if (v3)
              operator delete(v3);
            v3 = v16;
          }
          else
          {
            *(_OWORD *)v6 = *v8;
            *((_QWORD *)v6 + 2) = v9;
            v4 = v6 + 24;
          }
          v7 = (_QWORD *)*v7;
          v6 = v4;
        }
        while (v7);
      }
      v2 = *v35;
    }
    while (*v35);
    if (v3 == v6)
    {
      v1 = this;
    }
    else
    {
      v18 = v3;
      v1 = this;
      do
      {
        Phase::Controller::TapManager::DeRegisterTapReceiver((uint64_t)this, *(_QWORD *)v18, *((_QWORD *)v18 + 1), *((_QWORD *)v18 + 2));
        v18 += 24;
      }
      while (v18 != v6);
    }
  }
  else
  {
    v3 = 0;
  }
  __pa = 0;
  __p_8 = 0;
  v39[0] = 0;
  v19 = (_QWORD *)*((_QWORD *)v1 + 7);
  if (v19)
  {
    v20 = 0;
    do
    {
      v21 = v19 + 2;
      if ((unint64_t)v20 >= v39[0])
      {
        v22 = ((char *)v20 - (char *)__pa) >> 4;
        if ((unint64_t)(v22 + 1) >> 60)
          std::vector<Phase::MetaParamValue>::__throw_length_error[abi:ne180100]();
        v23 = (uint64_t)(v39[0] - (_QWORD)__pa) >> 3;
        if (v23 <= v22 + 1)
          v23 = v22 + 1;
        if (v39[0] - (_QWORD)__pa >= 0x7FFFFFFFFFFFFFF0uLL)
          v24 = 0xFFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::UniqueObjectId>>((uint64_t)v39, v24);
        else
          v25 = 0;
        v26 = &v25[16 * v22];
        *(_OWORD *)v26 = *v21;
        v27 = __p_8;
        v28 = (unint64_t *)v26;
        if (__p_8 != __pa)
        {
          do
          {
            *((_OWORD *)v28 - 1) = *((_OWORD *)v27 - 1);
            v28 -= 2;
            v27 -= 2;
          }
          while (v27 != __pa);
          v27 = __pa;
        }
        v20 = (unint64_t *)(v26 + 16);
        __pa = v28;
        v39[0] = &v25[16 * v24];
        if (v27)
          operator delete(v27);
      }
      else
      {
        *(_OWORD *)v20 = *v21;
        v20 += 2;
      }
      __p_8 = v20;
      v19 = (_QWORD *)*v19;
    }
    while (v19);
    for (i = __pa; i != v20; i += 2)
      Phase::Controller::TapManager::RemoveTapSourceObject(v1, *i, i[1]);
  }
  if (*((_QWORD *)v1 + 31))
  {
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__deallocate_node((uint64_t)v1 + 224, *((_QWORD **)v1 + 30));
    *((_QWORD *)v1 + 30) = 0;
    v30 = *((_QWORD *)v1 + 29);
    if (v30)
    {
      for (j = 0; j != v30; ++j)
        *(_QWORD *)(*((_QWORD *)v1 + 28) + 8 * j) = 0;
    }
    *((_QWORD *)v1 + 31) = 0;
  }
  if (*((_QWORD *)v1 + 8))
  {
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>>>::__deallocate_node((_DWORD)v1 + 40, *((_QWORD **)v1 + 7));
    *((_QWORD *)v1 + 7) = 0;
    v32 = *((_QWORD *)v1 + 6);
    if (v32)
    {
      for (k = 0; k != v32; ++k)
        *(_QWORD *)(*((_QWORD *)v1 + 5) + 8 * k) = 0;
    }
    *((_QWORD *)v1 + 8) = 0;
  }
  if (__pa)
    operator delete(__pa);
  if (v3)
    operator delete(v3);
  std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::~__hash_table((uint64_t)v1 + 224);
  caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::~guarded_lookup_hash_table((uint64_t)v1 + 80);
  std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>>>::~__hash_table((uint64_t)v1 + 40);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(v1);
}

{
  Phase::Controller::TapManager::~TapManager(this);
  JUMPOUT(0x2199F9D70);
}

void sub_2166DA85C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;

  if (a2)
  {
    if (__p)
      operator delete(__p);
    if (v12)
      operator delete(v12);
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void Phase::Controller::TapManager::DeRegisterTapReceiver(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  Phase::Logger *v15;
  Phase::Logger *v16;
  NSObject *v17;
  int8x8_t v18;
  uint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  NSObject *v22;
  NSObject *v23;
  Phase::Logger *v24;
  Phase::Logger *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t SlotForKey;
  unsigned int *v31;
  unsigned int *v32;
  int v33;
  int v34;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  std::chrono::nanoseconds __ns;
  _BYTE buf[12];
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;
  UniqueObjectId v52;

  v5 = a3;
  v6 = a2;
  v51 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v42 = a2;
  *((_QWORD *)&v42 + 1) = a3;
  v8 = (uint64_t *)(a1 + 224);
  v9 = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)(a1 + 224), &v42);
  if (!v9)
  {
    v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 944));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      v45 = 1024;
      v46 = 220;
      v47 = 2048;
      v48 = v6;
      v49 = 2048;
      v50 = a4;
      _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Couldn't DeRegister receiver tapId %llu for client %lu because it doesn't exist", buf, 0x26u);
    }
    return;
  }
  v10 = v9;
  v11 = v9[4];
  v12 = operator new();
  std::unordered_map<unsigned long,unsigned long long>::unordered_map(v12, v11);
  v13 = *(_OWORD *)(v11 + 40);
  v14 = *(_OWORD *)(v11 + 56);
  *(_QWORD *)(v12 + 72) = *(_QWORD *)(v11 + 72);
  *(_OWORD *)(v12 + 56) = v14;
  *(_OWORD *)(v12 + 40) = v13;
  v41 = v12;
  v15 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>((_QWORD *)v12, a4);
  if (!v15)
  {
    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 944));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      v45 = 1024;
      v46 = 189;
      v47 = 2048;
      v48 = v6;
      v49 = 2048;
      v50 = a4;
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Couldn't DeRegister receiver tapId %llu for client %lu because it doesn't exist", buf, 0x26u);
    }
    goto LABEL_55;
  }
  v16 = v15;
  v17 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 944));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "TapManager.mm";
    v45 = 1024;
    v46 = 179;
    v47 = 2048;
    v48 = v6;
    v49 = 2048;
    v50 = a4;
    _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d DeRegistering receiver tapId %llu for client %lu", buf, 0x26u);
  }
  v18 = *(int8x8_t *)(v12 + 8);
  v19 = *(_QWORD *)v16;
  v20 = *((_QWORD *)v16 + 1);
  v21 = (uint8x8_t)vcnt_s8(v18);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    if (v20 >= *(_QWORD *)&v18)
      v20 %= *(_QWORD *)&v18;
  }
  else
  {
    v20 &= *(_QWORD *)&v18 - 1;
  }
  v24 = *(Phase::Logger **)(*(_QWORD *)v12 + 8 * v20);
  do
  {
    v25 = v24;
    v24 = *(Phase::Logger **)v24;
  }
  while (v24 != v16);
  if (v25 == (Phase::Logger *)(v12 + 16))
    goto LABEL_26;
  v26 = *((_QWORD *)v25 + 1);
  if (v21.u32[0] > 1uLL)
  {
    if (v26 >= *(_QWORD *)&v18)
      v26 %= *(_QWORD *)&v18;
  }
  else
  {
    v26 &= *(_QWORD *)&v18 - 1;
  }
  if (v26 != v20)
  {
LABEL_26:
    if (v19)
    {
      v27 = *(_QWORD *)(v19 + 8);
      if (v21.u32[0] > 1uLL)
      {
        v28 = *(_QWORD *)(v19 + 8);
        if (v27 >= *(_QWORD *)&v18)
          v28 = v27 % *(_QWORD *)&v18;
      }
      else
      {
        v28 = v27 & (*(_QWORD *)&v18 - 1);
      }
      if (v28 == v20)
        goto LABEL_30;
    }
    *(_QWORD *)(*(_QWORD *)v12 + 8 * v20) = 0;
    v19 = *(_QWORD *)v16;
  }
  if (!v19)
    goto LABEL_36;
  v27 = *(_QWORD *)(v19 + 8);
LABEL_30:
  if (v21.u32[0] > 1uLL)
  {
    if (v27 >= *(_QWORD *)&v18)
      v27 %= *(_QWORD *)&v18;
  }
  else
  {
    v27 &= *(_QWORD *)&v18 - 1;
  }
  if (v27 != v20)
  {
    *(_QWORD *)(*(_QWORD *)v12 + 8 * v27) = v25;
    v19 = *(_QWORD *)v16;
  }
LABEL_36:
  *(_QWORD *)v25 = v19;
  *(_QWORD *)v16 = 0;
  --*(_QWORD *)(v12 + 24);
  operator delete(v16);
  if (*(_QWORD *)(v12 + 24))
  {
    caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::_addOrReplace(a1 + 80, v6, v5, v12);
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__emplace_unique_key_args<Phase::UniqueObjectId,Phase::UniqueObjectId&,std::unique_ptr<Phase::Controller::TapReceiverObject>>(v8, &v42, &v42, &v41);
  }
  else
  {
    *(_QWORD *)buf = a1 + 160;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)(a1 + 160));
    v29 = atomic_load((unint64_t *)(a1 + 120));
    if (v29)
    {
      SlotForKey = caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::findSlotForKey((uint64_t *)v29, v6, v5);
      if ((SlotForKey & 1) != 0)
      {
        v32 = v31;
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v29 + 8 * HIDWORD(SlotForKey) + 16));
        if (v31)
        {
          v33 = atomic_load((unsigned int *)(a1 + 128));
          if (v33 >= 1)
          {
            do
            {
              __ns.__rep_ = 50000;
              std::this_thread::sleep_for (&__ns);
              v34 = atomic_load((unsigned int *)(a1 + 128));
            }
            while (v34 > 0);
          }
          if ((unsigned __int16)atomic_load(v32))
          {
            std::unique_lock<std::mutex>::unlock((std::unique_lock<std::mutex> *)buf);
            while ((unsigned __int16)atomic_load(v32))
            {
              __ns.__rep_ = 500000;
              std::this_thread::sleep_for (&__ns);
            }
            std::unique_lock<std::mutex>::lock((std::unique_lock<std::mutex> *)buf);
            v29 = atomic_load((unint64_t *)(a1 + 120));
          }
          caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::element_t::release(v32);
          v38 = *(_DWORD *)(a1 + 112) - 1;
          *(_DWORD *)(a1 + 112) = v38;
          if (v29)
          {
            v39 = *(_DWORD *)(v29 + 8);
            if (v39 >= 9 && 16 * v38 / v39 <= 2)
              caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::rehash((unint64_t *)(a1 + 80), v39 >> 1);
          }
        }
      }
    }
    caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::emptyReleasePool(a1 + 80);
    if (buf[8])
      std::mutex::unlock(*(std::mutex **)buf);
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::erase(v8, v10);
    v5 = *((_QWORD *)&v42 + 1);
    v6 = v42;
  }
  v52.mStorage[0] = v6;
  v52.mStorage[1] = v5;
  Phase::Controller::TapManager::CheckUnregisterTap((Phase::Controller::TapManager *)a1, v52);
  v12 = v41;
  if (v41)
  {
LABEL_55:
    v40 = std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::~__hash_table(v12);
    MEMORY[0x2199F9D70](v40, 0x10A0C40D806319BLL);
  }
}

void sub_2166DAE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14)
    std::mutex::unlock(a13);
  std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100](&a9, 0);
  _Unwind_Resume(a1);
}

uint64_t *Phase::Controller::TapManager::RemoveTapSourceObject(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  _QWORD *v4;
  uint64_t *result;
  uint64_t *v6;
  UniqueObjectId v7;

  v7.mStorage[0] = a2;
  v7.mStorage[1] = a3;
  v4 = a1 + 5;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>(a1 + 5, &v7);
  if (result)
  {
    v6 = result;
    Phase::Controller::TapManager::CheckUnregisterTap((Phase::Controller::TapManager *)a1, v7);
    return (uint64_t *)std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::Submix>>>>::erase(v4, v6);
  }
  return result;
}

_QWORD *Phase::Controller::TapManager::RegisterTapReceiver(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  Phase::Logger *v17;
  Phase::Logger *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  int8x8_t v24;
  uint8x8_t v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD *result;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  _BYTE buf[18];
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;
  UniqueObjectId v48;

  v47 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v41 = a2;
  *((_QWORD *)&v41 + 1) = a3;
  v10 = a1 + 28;
  v11 = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>(a1 + 28, &v41);
  if (!v11)
  {
    v20 = operator new();
    *(_OWORD *)v20 = 0u;
    *(_OWORD *)(v20 + 16) = 0u;
    *(_OWORD *)(v20 + 32) = 0u;
    *(_OWORD *)(v20 + 48) = 0u;
    *(_OWORD *)(v20 + 64) = 0u;
    *(_DWORD *)(v20 + 32) = 1065353216;
    v40 = v20;
    v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v20) + 944));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 145;
      v43 = 2048;
      v44 = a2;
      v45 = 2048;
      v46 = a4;
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Registering receiver tapId %llu for client %lu", buf, 0x26u);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned long long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long long>>>::__emplace_unique_key_args<unsigned long,unsigned long &,unsigned long long &>(v20, a4, a4, a5);
    v22 = 0;
    *(_QWORD *)buf = a2;
    *(_QWORD *)&buf[8] = a3;
    v23 = 0xCBF29CE484222325;
    do
      v23 = 0x100000001B3 * (v23 ^ (char)buf[v22++]);
    while (v22 != 16);
    v24 = (int8x8_t)a1[6];
    if (!*(_QWORD *)&v24)
      goto LABEL_34;
    v25 = (uint8x8_t)vcnt_s8(v24);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      v26 = v23;
      if (v23 >= *(_QWORD *)&v24)
        v26 = v23 % *(_QWORD *)&v24;
    }
    else
    {
      v26 = (*(_QWORD *)&v24 - 1) & v23;
    }
    v30 = *(_QWORD **)(a1[5] + 8 * v26);
    if (!v30 || (v31 = (_QWORD *)*v30) == 0)
    {
LABEL_34:
      v34 = 0;
      goto LABEL_35;
    }
    while (1)
    {
      v32 = v31[1];
      if (v23 == v32)
      {
        if (v31[2] == a2 && v31[3] == a3)
        {
          v36 = *(id *)(v31[4] + 16);
          v34 = v36;
          if (v36)
          {
            v37 = objc_msgSend(v36, "streamDescription");
            v38 = *(_OWORD *)v37;
            v39 = *(_OWORD *)(v37 + 16);
            *(_QWORD *)(v20 + 72) = *(_QWORD *)(v37 + 32);
            *(_OWORD *)(v20 + 56) = v39;
            *(_OWORD *)(v20 + 40) = v38;
          }
LABEL_35:
          caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::_addOrReplace((uint64_t)(a1 + 10), a2, a3, v20);
          std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__emplace_unique_key_args<Phase::UniqueObjectId,Phase::UniqueObjectId&,std::unique_ptr<Phase::Controller::TapReceiverObject>>(v10, &v41, &v41, &v40);

          if (v40)
          {
            v35 = std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::~__hash_table(v40);
            MEMORY[0x2199F9D70](v35, 0x10A0C40D806319BLL);
          }
LABEL_37:
          v48.mStorage[0] = a2;
          v48.mStorage[1] = a3;
          return Phase::Controller::TapManager::CheckRegisterTap((Phase::Controller::TapManager *)a1, v48);
        }
      }
      else
      {
        if (v25.u32[0] > 1uLL)
        {
          if (v32 >= *(_QWORD *)&v24)
            v32 %= *(_QWORD *)&v24;
        }
        else
        {
          v32 &= *(_QWORD *)&v24 - 1;
        }
        if (v32 != v26)
          goto LABEL_34;
      }
      v31 = (_QWORD *)*v31;
      if (!v31)
        goto LABEL_34;
    }
  }
  v12 = v11;
  v13 = v11[4];
  v14 = operator new();
  std::unordered_map<unsigned long,unsigned long long>::unordered_map(v14, v13);
  v15 = *(_OWORD *)(v13 + 40);
  v16 = *(_OWORD *)(v13 + 56);
  *(_QWORD *)(v14 + 72) = *(_QWORD *)(v13 + 72);
  *(_OWORD *)(v14 + 56) = v16;
  *(_OWORD *)(v14 + 40) = v15;
  v40 = v14;
  v17 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>((_QWORD *)v14, a4);
  v18 = v17;
  if (v17)
  {
    v19 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17) + 944));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 128;
      v43 = 2048;
      v44 = a4;
      v45 = 2048;
      v46 = a2;
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Not registering client receiver for client %lu: tapId %llu because it already exists.", buf, 0x26u);
    }
  }
  else
  {
    v27 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 944));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 132;
      v43 = 2048;
      v44 = a2;
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Registering receiver tapId %llu", buf, 0x1Cu);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned long long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long long>>>::__emplace_unique_key_args<unsigned long,unsigned long &,unsigned long long &>(v14, a4, a4, a5);
    caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::_addOrReplace((uint64_t)(a1 + 10), a2, a3, v14);
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::erase(v10, v12);
    std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__emplace_unique_key_args<Phase::UniqueObjectId,Phase::UniqueObjectId&,std::unique_ptr<Phase::Controller::TapReceiverObject>>(v10, &v41, &v41, &v40);
    v14 = v40;
    if (!v40)
      goto LABEL_37;
  }
  v28 = std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::~__hash_table(v14);
  result = (_QWORD *)MEMORY[0x2199F9D70](v28, 0x10A0C40D806319BLL);
  if (!v18)
    goto LABEL_37;
  return result;
}

void sub_2166DB388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::TapManager::CheckRegisterTap(Phase::Controller::TapManager *this, UniqueObjectId a2)
{
  _QWORD *result;
  UniqueObjectId v4;
  UniqueObjectId v5;

  v4 = a2;
  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 28, &v5);
  if (result)
  {
    result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v4);
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)result[4] + 24))(result[4]);
  }
  return result;
}

_QWORD *Phase::Controller::TapManager::CheckUnregisterTap(Phase::Controller::TapManager *this, UniqueObjectId a2)
{
  _QWORD *result;
  UniqueObjectId v4;
  UniqueObjectId v5;

  v4 = a2;
  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 28, &v5);
  if (!result)
  {
    result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v4);
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)result[4] + 32))(result[4]);
  }
  return result;
}

void Phase::Controller::TapManager::CreatePreSpatialTap(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void **v10;
  Phase::Logger *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UniqueObjectId *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8x8_t v29;
  _QWORD *v30;
  _QWORD *v31;
  UniqueObjectId v32;
  unint64_t v33;
  UniqueObjectId *v35;
  UniqueObjectId **v36;
  float v37;
  float v38;
  _BOOL8 v39;
  unint64_t v40;
  unint64_t v41;
  int8x8_t prime;
  void *v43;
  void *v44;
  uint64_t v45;
  UniqueObjectId *v46;
  unint64_t v47;
  uint8x8_t v48;
  unint64_t v49;
  uint8x8_t v50;
  uint64_t v51;
  UniqueObjectId *v52;
  unint64_t v53;
  _QWORD *v54;
  UniqueObjectId **v55;
  unint64_t v56;
  void *v57;
  Phase::Controller::PreSpatialTapSourceObject *v58;
  UniqueObjectId v59;
  UniqueObjectId v60;
  _BYTE buf[18];
  __int16 v62;
  _DWORD v63[7];

  *(_QWORD *)&v63[5] = *MEMORY[0x24BDAC8D0];
  v59.mStorage[0] = a2;
  v59.mStorage[1] = a3;
  v10 = (void **)(a1 + 40);
  v11 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)(a1 + 40), &v59);
  if (v11)
  {
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 944));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "TapManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 250;
      v62 = 2048;
      *(_QWORD *)v63 = v59.mStorage[0];
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Couldn't create source tapId %llu because it already exists.", buf, 0x1Cu);
    }
    return;
  }
  v60 = v59;
  v13 = operator new();
  v14 = *(_QWORD *)(a1 + 272);
  v15 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)&v63[1] = 0;
  v16 = (UniqueObjectId *)operator new(0x30uLL);
  v16->mStorage[0] = (unint64_t)&off_24D581B08;
  v16->mStorage[1] = (unint64_t)Phase::Controller::TapManager::DVMCallback;
  v16[1].mStorage[0] = 0;
  v16[1].mStorage[1] = a1;
  v16[2] = v60;
  *(_QWORD *)&v63[1] = v16;
  Phase::Controller::PreSpatialTapSourceObject::PreSpatialTapSourceObject(v13, (unint64_t *)(a1 + 280), a5, a4, v14, v15, a6, (uint64_t)buf);
  v58 = (Phase::Controller::PreSpatialTapSourceObject *)v13;
  v17 = *(_QWORD **)&v63[1];
  if (*(_BYTE **)&v63[1] == buf)
  {
    v18 = 4;
    v17 = buf;
  }
  else
  {
    if (!*(_QWORD *)&v63[1])
      goto LABEL_9;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_9:
  *(UniqueObjectId *)buf = v59;
  v19 = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)(a1 + 224), buf);
  if (v19)
  {
    v20 = v19;
    v21 = *(id *)(v13 + 16);
    v22 = objc_msgSend(v21, "streamDescription");
    v23 = v20[4];
    v24 = *(_OWORD *)v22;
    v25 = *(_OWORD *)(v22 + 16);
    *(_QWORD *)(v23 + 72) = *(_QWORD *)(v22 + 32);
    *(_OWORD *)(v23 + 56) = v25;
    *(_OWORD *)(v23 + 40) = v24;

  }
  v26 = 0;
  v27 = 0xCBF29CE484222325;
  do
    v27 = 0x100000001B3 * (v27 ^ *((char *)v59.mStorage + v26++));
  while (v26 != 16);
  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
  {
    v29 = (uint8x8_t)vcnt_s8((int8x8_t)v28);
    v29.i16[0] = vaddlv_u8(v29);
    if (v29.u32[0] > 1uLL)
    {
      v15 = v27;
      if (v27 >= v28)
        v15 = v27 % v28;
    }
    else
    {
      v15 = (v28 - 1) & v27;
    }
    v30 = (_QWORD *)*((_QWORD *)*v10 + v15);
    if (v30)
    {
      v31 = (_QWORD *)*v30;
      if (v31)
      {
        v32 = v59;
        do
        {
          v33 = v31[1];
          if (v33 == v27)
          {
            if (v31[2] == v59.mStorage[0] && v31[3] == v59.mStorage[1])
              goto LABEL_91;
          }
          else
          {
            if (v29.u32[0] > 1uLL)
            {
              if (v33 >= v28)
                v33 %= v28;
            }
            else
            {
              v33 &= v28 - 1;
            }
            if (v33 != v15)
              break;
          }
          v31 = (_QWORD *)*v31;
        }
        while (v31);
      }
    }
  }
  v35 = (UniqueObjectId *)operator new(0x28uLL);
  v36 = (UniqueObjectId **)(a1 + 56);
  v35->mStorage[0] = 0;
  v35->mStorage[1] = v27;
  v35[1] = v59;
  v58 = 0;
  v35[2].mStorage[0] = v13;
  v37 = (float)(unint64_t)(*(_QWORD *)(a1 + 64) + 1);
  v38 = *(float *)(a1 + 72);
  if (!v28 || (float)(v38 * (float)v28) < v37)
  {
    v39 = 1;
    if (v28 >= 3)
      v39 = (v28 & (v28 - 1)) != 0;
    v40 = v39 | (2 * v28);
    v41 = vcvtps_u32_f32(v37 / v38);
    if (v40 <= v41)
      prime = (int8x8_t)v41;
    else
      prime = (int8x8_t)v40;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v28 = *(_QWORD *)(a1 + 48);
    }
    if (*(_QWORD *)&prime > v28)
      goto LABEL_47;
    if (*(_QWORD *)&prime < v28)
    {
      v49 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 64) / *(float *)(a1 + 72));
      if (v28 < 3 || (v50 = (uint8x8_t)vcnt_s8((int8x8_t)v28), v50.i16[0] = vaddlv_u8(v50), v50.u32[0] > 1uLL))
      {
        v49 = std::__next_prime(v49);
      }
      else
      {
        v51 = 1 << -(char)__clz(v49 - 1);
        if (v49 >= 2)
          v49 = v51;
      }
      if (*(_QWORD *)&prime <= v49)
        prime = (int8x8_t)v49;
      if (*(_QWORD *)&prime >= v28)
      {
        v28 = *(_QWORD *)(a1 + 48);
      }
      else
      {
        if (prime)
        {
LABEL_47:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v43 = operator new(8 * *(_QWORD *)&prime);
          v44 = *v10;
          *v10 = v43;
          if (v44)
            operator delete(v44);
          v45 = 0;
          *(int8x8_t *)(a1 + 48) = prime;
          do
            *((_QWORD *)*v10 + v45++) = 0;
          while (*(_QWORD *)&prime != v45);
          v46 = *v36;
          if (*v36)
          {
            v47 = v46->mStorage[1];
            v48 = (uint8x8_t)vcnt_s8(prime);
            v48.i16[0] = vaddlv_u8(v48);
            if (v48.u32[0] > 1uLL)
            {
              if (v47 >= *(_QWORD *)&prime)
                v47 %= *(_QWORD *)&prime;
            }
            else
            {
              v47 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)*v10 + v47) = v36;
            v52 = (UniqueObjectId *)v46->mStorage[0];
            if (v46->mStorage[0])
            {
              do
              {
                v53 = v52->mStorage[1];
                if (v48.u32[0] > 1uLL)
                {
                  if (v53 >= *(_QWORD *)&prime)
                    v53 %= *(_QWORD *)&prime;
                }
                else
                {
                  v53 &= *(_QWORD *)&prime - 1;
                }
                if (v53 != v47)
                {
                  if (!*((_QWORD *)*v10 + v53))
                  {
                    *((_QWORD *)*v10 + v53) = v46;
                    goto LABEL_72;
                  }
                  v46->mStorage[0] = v52->mStorage[0];
                  v52->mStorage[0] = **((_QWORD **)*v10 + v53);
                  **((_QWORD **)*v10 + v53) = v52;
                  v52 = v46;
                }
                v53 = v47;
LABEL_72:
                v46 = v52;
                v52 = (UniqueObjectId *)v52->mStorage[0];
                v47 = v53;
              }
              while (v52);
            }
          }
          v28 = (unint64_t)prime;
          goto LABEL_76;
        }
        v57 = *v10;
        *v10 = 0;
        if (v57)
          operator delete(v57);
        v28 = 0;
        *(_QWORD *)(a1 + 48) = 0;
      }
    }
LABEL_76:
    if ((v28 & (v28 - 1)) != 0)
    {
      if (v27 >= v28)
        v15 = v27 % v28;
      else
        v15 = v27;
    }
    else
    {
      v15 = (v28 - 1) & v27;
    }
  }
  v54 = *v10;
  v55 = (UniqueObjectId **)*((_QWORD *)*v10 + v15);
  if (v55)
  {
    v35->mStorage[0] = (unint64_t)*v55;
  }
  else
  {
    v35->mStorage[0] = (unint64_t)*v36;
    *v36 = v35;
    v54[v15] = v36;
    if (!v35->mStorage[0])
      goto LABEL_90;
    v56 = *(_QWORD *)(v35->mStorage[0] + 8);
    if ((v28 & (v28 - 1)) != 0)
    {
      if (v56 >= v28)
        v56 %= v28;
    }
    else
    {
      v56 &= v28 - 1;
    }
    v55 = (UniqueObjectId **)((char *)*v10 + 8 * v56);
  }
  *v55 = v35;
LABEL_90:
  ++*(_QWORD *)(a1 + 64);
  v32 = v59;
LABEL_91:
  Phase::Controller::TapManager::CheckRegisterTap((Phase::Controller::TapManager *)a1, v32);
  if (v58)
  {
    Phase::Controller::PreSpatialTapSourceObject::~PreSpatialTapSourceObject(v58);
    MEMORY[0x2199F9D70]();
  }
}

void sub_2166DBAC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<Phase::Controller::PreSpatialTapSourceObject>::reset[abi:ne180100]((Phase::Controller::PreSpatialTapSourceObject **)va);
  _Unwind_Resume(a1);
}

uint64_t *Phase::Controller::TapManager::DVMCallback(Phase::Controller::TapManager *this, UniqueObjectId a2, float *a3, uint64_t a4)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int *v9;
  unsigned int v10;
  uint64_t *result;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  const AudioStreamBasicDescription *v15;
  unsigned int v16;
  unsigned int v17;
  AudioTimeStamp v18;
  UniqueObjectId v19;

  v6 = a2.mStorage[1];
  v7 = a2.mStorage[0];
  v9 = (unsigned int *)((char *)this + 128);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 + 1, v9));
  result = (uint64_t *)atomic_load((unint64_t *)this + 15);
  if (result)
  {
    result = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::findSlotForKey(result, a2.mStorage[0], a2.mStorage[1]);
    if (v12)
    {
      v13 = (unsigned int *)v12;
      do
        v14 = __ldaxr((unsigned int *)v12);
      while (__stlxr(v14 + 1, (unsigned int *)v12));
      v15 = *(const AudioStreamBasicDescription **)(v12 + 24);
      do
        v16 = __ldaxr(v9);
      while (__stlxr(v16 - 1, v9));
      result = (uint64_t *)*((_QWORD *)this + 37);
      if (result)
      {
        v19.mStorage[0] = v7;
        v19.mStorage[1] = v6;
        result = Phase::Controller::ClientTapRegistryProxy::IORender((Phase::Controller::ClientTapRegistryProxy *)result, v19, &v18, a4, v15 + 1, a3);
        v9 = v13;
      }
      else
      {
        v9 = (unsigned int *)v12;
      }
    }
  }
  do
    v17 = __ldaxr(v9);
  while (__stlxr(v17 - 1, v9));
  return result;
}

void sub_2166DBC48(_Unwind_Exception *a1)
{
  unsigned int *v1;
  unsigned int v2;

  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::TapManager::RegisterSubmix(Phase::Controller::TapManager *this, UniqueObjectId a2, UniqueObjectId a3)
{
  unint64_t v3;
  unint64_t v4;
  _QWORD *result;
  UniqueObjectId v6;

  v3 = a3.mStorage[1];
  v4 = a3.mStorage[0];
  v6 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v6);
  if (result)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, unint64_t, unint64_t))(*(_QWORD *)result[4] + 40))(result[4], v4, v3);
  return result;
}

_QWORD *Phase::Controller::TapManager::DeRegisterSubmix(Phase::Controller::TapManager *this, UniqueObjectId a2, UniqueObjectId a3)
{
  unint64_t v3;
  unint64_t v4;
  _QWORD *result;
  UniqueObjectId v6;

  v3 = a3.mStorage[1];
  v4 = a3.mStorage[0];
  v6 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v6);
  if (result)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, unint64_t, unint64_t))(*(_QWORD *)result[4] + 56))(result[4], v4, v3);
  return result;
}

_QWORD *Phase::Controller::TapManager::RegisterSource(Phase::Controller::TapManager *this, UniqueObjectId a2, Handle64 a3)
{
  _QWORD *result;
  UniqueObjectId v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v5);
  if (result)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)result[4] + 48))(result[4], a3.mData);
  return result;
}

_QWORD *Phase::Controller::TapManager::DeRegisterSource(Phase::Controller::TapManager *this, UniqueObjectId a2, Handle64 a3)
{
  _QWORD *result;
  UniqueObjectId v5;

  v5 = a2;
  result = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::shared_ptr<Phase::ActionTreeObject>>>>::find<Phase::UniqueObjectId>((_QWORD *)this + 5, &v5);
  if (result)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)result[4] + 64))(result[4], a3.mData);
  return result;
}

uint64_t Phase::Controller::TapManager::Update(Phase::Controller::TapManager *this)
{
  uint64_t result;
  uint64_t **i;

  result = Phase::Commandable<128,Phase::LockFreeQueueMPSC>::ExecuteCommands((uint64_t)this);
  for (i = (uint64_t **)*((_QWORD *)this + 7); i; i = (uint64_t **)*i)
    result = (*(uint64_t (**)(uint64_t *))(*i[4] + 88))(i[4]);
  return result;
}

_QWORD *Phase::Controller::TapManager::EngineStartNotify(_QWORD *this)
{
  uint64_t *v1;
  _QWORD *v2;
  __int128 v3;

  v1 = (uint64_t *)this[7];
  if (v1)
  {
    v2 = this + 28;
    do
    {
      v3 = *((_OWORD *)v1 + 1);
      this = std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::ActionTreeIOManager::BufferInfo>>>>::find<Phase::UniqueObjectId>(v2, &v3);
      if (this)
        this = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1[4] + 24))(v1[4]);
      v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
  return this;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  void **v8;

  if (!atomic_load((unsigned int *)(a1 + 48)))
  {
    v3 = atomic_load((unint64_t *)(a1 + 40));
    if (v3)
    {
      v4 = caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::~table_impl(v3);
      MEMORY[0x2199F9D70](v4, 0x1060C402CF69088);
    }
    std::mutex::~mutex((std::mutex *)(a1 + 80));
    v8 = (void **)(a1 + 56);
    std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](&v8);
    v5 = *(_QWORD **)(a1 + 24);
    if (v5 == (_QWORD *)a1)
    {
      v6 = 4;
      v5 = (_QWORD *)a1;
    }
    else
    {
      if (!v5)
        return a1;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
    return a1;
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2;
  unsigned int **v3;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2)
  {
    v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2)
        caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::element_t::release(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

void std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  uint64_t *v2;
  uint64_t *v4;
  void *v5;

  v1 = *a1;
  v2 = (uint64_t *)**a1;
  if (v2)
  {
    v4 = (uint64_t *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::~table_impl(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100](v2 + 4, 0);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::unordered_map<unsigned long,unsigned long long>::unordered_map(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  v5 = *(_QWORD **)(a2 + 16);
  if (v5)
  {
    v6 = (_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 8);
    do
    {
      v8 = v5[2];
      if (v7)
      {
        v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
        v9.i16[0] = vaddlv_u8(v9);
        if (v9.u32[0] > 1uLL)
        {
          v2 = v5[2];
          if (v7 <= v8)
            v2 = v8 % v7;
        }
        else
        {
          v2 = (v7 - 1) & v8;
        }
        v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
        if (v10)
        {
          for (i = (_QWORD *)*v10; i; i = (_QWORD *)*i)
          {
            v12 = i[1];
            if (v12 == v8)
            {
              if (i[2] == v8)
                goto LABEL_41;
            }
            else
            {
              if (v9.u32[0] > 1uLL)
              {
                if (v12 >= v7)
                  v12 %= v7;
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2)
                break;
            }
          }
        }
      }
      v13 = operator new(0x20uLL);
      *v13 = 0;
      v13[1] = v8;
      *((_OWORD *)v13 + 1) = *((_OWORD *)v5 + 1);
      v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
      v15 = *(float *)(a1 + 32);
      if (!v7 || (float)(v15 * (float)v7) < v14)
      {
        v16 = (v7 & (v7 - 1)) != 0;
        if (v7 < 3)
          v16 = 1;
        v17 = v16 | (2 * v7);
        v18 = vcvtps_u32_f32(v14 / v15);
        if (v17 <= v18)
          v19 = v18;
        else
          v19 = v17;
        std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>(a1, v19);
        v7 = *(_QWORD *)(a1 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v7 <= v8)
            v2 = v8 % v7;
          else
            v2 = v8;
        }
        else
        {
          v2 = (v7 - 1) & v8;
        }
      }
      v20 = *(_QWORD *)a1;
      v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
      if (v21)
      {
        *v13 = *v21;
      }
      else
      {
        *v13 = *v6;
        *v6 = v13;
        *(_QWORD *)(v20 + 8 * v2) = v6;
        if (!*v13)
          goto LABEL_40;
        v22 = *(_QWORD *)(*v13 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v22 >= v7)
            v22 %= v7;
        }
        else
        {
          v22 &= v7 - 1;
        }
        v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
      }
      *v21 = v13;
LABEL_40:
      ++*(_QWORD *)(a1 + 24);
LABEL_41:
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
  return a1;
}

void sub_2166DC298(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::~__hash_table(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned long long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long long>>>::__emplace_unique_key_args<unsigned long,unsigned long &,unsigned long long &>(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD *v11;
  _QWORD *i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = a2;
      if (v9 <= a2)
        v4 = a2 % v9;
    }
    else
    {
      v4 = (v9 - 1) & a2;
    }
    v11 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      for (i = (_QWORD *)*v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == a2)
        {
          if (i[2] == a2)
            return;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v4)
            break;
        }
      }
    }
  }
  v14 = operator new(0x20uLL);
  *v14 = 0;
  v14[1] = a2;
  v14[2] = a3;
  v14[3] = a4;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= a2)
        v4 = a2 % v9;
      else
        v4 = a2;
    }
    else
    {
      v4 = (v9 - 1) & a2;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *v14 = *v22;
LABEL_38:
    *v22 = v14;
    goto LABEL_39;
  }
  *v14 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*v14)
  {
    v23 = *(_QWORD *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
}

void sub_2166DC4F8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::_addOrReplace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::mutex *v8;
  uint64_t *v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t SlotForKey;
  unint64_t v16;

  v8 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  v9 = (uint64_t *)atomic_load((unint64_t *)(a1 + 40));
  v10 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v10;
  if (v9)
  {
    v11 = 16 * v10;
    v12 = *((_DWORD *)v9 + 2);
    if (v11 / v12 < 0xB)
      goto LABEL_6;
    v13 = 2 * v12;
  }
  else
  {
    v13 = 8;
  }
  v9 = caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::rehash((unint64_t *)a1, v13);
LABEL_6:
  SlotForKey = caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::findSlotForKey(v9, a2, a3);
  if ((SlotForKey & 1) != 0)
  {
    *(_QWORD *)(v14 + 24) = a4;
    --*(_DWORD *)(a1 + 32);
  }
  else
  {
    v16 = operator new();
    *(_DWORD *)v16 = 0x10000;
    *(_QWORD *)(v16 + 8) = a2;
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    atomic_store(v16, (unint64_t *)&v9[HIDWORD(SlotForKey) + 2]);
    caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::emptyReleasePool(a1);
  }
  std::mutex::unlock(v8);
}

void sub_2166DC60C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t *caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::rehash(unint64_t *a1, unsigned int a2)
{
  unint64_t *v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t SlotForKey;
  unsigned int v11;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t *v21;
  char *v22;
  unint64_t v23;
  uint64_t *v24;

  v4 = a1 + 5;
  v5 = atomic_load(a1 + 5);
  v6 = (uint64_t *)operator new(8 * (a2 - 1) + 24);
  *v6 = (uint64_t)a1;
  *((_DWORD *)v6 + 2) = a2;
  bzero(v6 + 2, 8 * a2);
  if (v5)
  {
    v7 = *(unsigned int *)(v5 + 8);
    if ((_DWORD)v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v9 = *(_QWORD *)(v5 + 8 * i + 16);
        if (v9 + 1 >= 2)
        {
          SlotForKey = caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::StreamRenderer *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl::findSlotForKey(v6, *(_QWORD *)(v9 + 8), *(_QWORD *)(v9 + 16));
          if ((SlotForKey & 1) == 0)
          {
            do
              v11 = __ldaxr((unsigned int *)v9);
            while (__stlxr(v11 + 0x10000, (unsigned int *)v9));
            atomic_store(v9, (unint64_t *)&v6[HIDWORD(SlotForKey) + 2]);
          }
        }
      }
    }
    atomic_store((unint64_t)v6, a1 + 5);
    v13 = (uint64_t *)a1[8];
    v12 = a1[9];
    if ((unint64_t)v13 >= v12)
    {
      v15 = (_QWORD *)a1[7];
      v16 = v13 - v15;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v18 = v12 - (_QWORD)v15;
      if (v18 >> 2 > v17)
        v17 = v18 >> 2;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v17;
      if (v19)
      {
        if (v19 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v20 = (char *)operator new(8 * v19);
      }
      else
      {
        v20 = 0;
      }
      v21 = (unint64_t *)&v20[8 * v16];
      v22 = &v20[8 * v19];
      *v21 = v5;
      v14 = v21 + 1;
      if (v13 == v15)
      {
        a1[7] = (unint64_t)v21;
        a1[8] = (unint64_t)v14;
        a1[9] = (unint64_t)v22;
      }
      else
      {
        do
        {
          v23 = *--v13;
          *v13 = 0;
          *--v21 = v23;
        }
        while (v13 != v15);
        v13 = (uint64_t *)a1[7];
        v24 = (uint64_t *)a1[8];
        a1[7] = (unint64_t)v21;
        a1[8] = (unint64_t)v14;
        a1[9] = (unint64_t)v22;
        while (v24 != v13)
          std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>::reset[abi:ne180100](--v24, 0);
      }
      if (v13)
        operator delete(v13);
    }
    else
    {
      *v13 = v5;
      v14 = v13 + 1;
    }
    a1[8] = (unint64_t)v14;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::emptyReleasePool(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t *v4;

  v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    v2 = result;
    v4 = *(uint64_t **)(result + 56);
    for (i = *(uint64_t **)(result + 64);
          i != v4;
          result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<Phase::UniqueObjectId,Phase::Controller::TapReceiverObject *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(Phase::UniqueObjectId)>>::table_impl>>::reset[abi:ne180100](i, 0))
    {
      --i;
    }
    *(_QWORD *)(v2 + 64) = v4;
  }
  return result;
}

void std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::erase(_QWORD *a1, uint64_t *a2)
{
  int8x8_t v3;
  uint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)a1[1];
  v4 = *a2;
  v5 = a2[1];
  v6 = (uint8x8_t)vcnt_s8(v3);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    if (v5 >= *(_QWORD *)&v3)
      v5 %= *(_QWORD *)&v3;
  }
  else
  {
    v5 &= *(_QWORD *)&v3 - 1;
  }
  v7 = *(uint64_t **)(*a1 + 8 * v5);
  do
  {
    v8 = v7;
    v7 = (uint64_t *)*v7;
  }
  while (v7 != a2);
  if (v8 != a1 + 2)
  {
    v9 = v8[1];
    if (v6.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 == v5)
    {
LABEL_20:
      if (!v4)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  if (!v4)
    goto LABEL_19;
  v10 = *(_QWORD *)(v4 + 8);
  if (v6.u32[0] > 1uLL)
  {
    if (v10 >= *(_QWORD *)&v3)
      v10 %= *(_QWORD *)&v3;
  }
  else
  {
    v10 &= *(_QWORD *)&v3 - 1;
  }
  if (v10 != v5)
  {
LABEL_19:
    *(_QWORD *)(*a1 + 8 * v5) = 0;
    v4 = *a2;
    goto LABEL_20;
  }
LABEL_21:
  v11 = *(_QWORD *)(v4 + 8);
  if (v6.u32[0] > 1uLL)
  {
    if (v11 >= *(_QWORD *)&v3)
      v11 %= *(_QWORD *)&v3;
  }
  else
  {
    v11 &= *(_QWORD *)&v3 - 1;
  }
  if (v11 != v5)
  {
    *(_QWORD *)(*a1 + 8 * v11) = v8;
    v4 = *a2;
  }
LABEL_27:
  *v8 = v4;
  *a2 = 0;
  --a1[3];
  std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100](a2 + 4, 0);
  operator delete(a2);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,void *>>>::operator()[abi:ne180100](char a1, uint64_t *__p)
{
  if (a1)
    std::unique_ptr<Phase::Controller::TapReceiverObject>::reset[abi:ne180100](__p + 4, 0);
  if (__p)
    operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::__unordered_map_hasher<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::hash<Phase::UniqueObjectId>,std::equal_to<Phase::UniqueObjectId>,true>,std::__unordered_map_equal<Phase::UniqueObjectId,std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,std::equal_to<Phase::UniqueObjectId>,std::hash<Phase::UniqueObjectId>,true>,std::allocator<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>>>::__emplace_unique_key_args<Phase::UniqueObjectId,Phase::UniqueObjectId&,std::unique_ptr<Phase::Controller::TapReceiverObject>>(uint64_t *a1, _QWORD *a2, _OWORD *a3, uint64_t *a4)
{
  unint64_t v4;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  int8x8_t prime;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint8x8_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  void *v39;

  v8 = 0;
  v9 = 0xCBF29CE484222325;
  do
    v9 = 0x100000001B3 * (v9 ^ *((char *)a2 + v8++));
  while (v8 != 16);
  v10 = a1[1];
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
    v12 = *(_QWORD **)(*a1 + 8 * v4);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2 && i[3] == a2[1])
            return;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  v16 = a1 + 2;
  v17 = operator new(0x28uLL);
  *v17 = 0;
  v17[1] = v9;
  *((_OWORD *)v17 + 1) = *a3;
  v18 = *a4;
  *a4 = 0;
  v17[4] = v18;
  v19 = (float)(unint64_t)(a1[3] + 1);
  v20 = *((float *)a1 + 8);
  if (!v10 || (float)(v20 * (float)v10) < v19)
  {
    v21 = 1;
    if (v10 >= 3)
      v21 = (v10 & (v10 - 1)) != 0;
    v22 = v21 | (2 * v10);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      prime = (int8x8_t)v23;
    else
      prime = (int8x8_t)v22;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v10 = a1[1];
    }
    if (*(_QWORD *)&prime > v10)
      goto LABEL_36;
    if (*(_QWORD *)&prime < v10)
    {
      v31 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v10 < 3 || (v32 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        v31 = std::__next_prime(v31);
      }
      else
      {
        v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2)
          v31 = v33;
      }
      if (*(_QWORD *)&prime <= v31)
        prime = (int8x8_t)v31;
      if (*(_QWORD *)&prime >= v10)
      {
        v10 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v25 = operator new(8 * *(_QWORD *)&prime);
          v26 = (void *)*a1;
          *a1 = (uint64_t)v25;
          if (v26)
            operator delete(v26);
          v27 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v27++) = 0;
          while (*(_QWORD *)&prime != v27);
          v28 = (_QWORD *)*v16;
          if (*v16)
          {
            v29 = v28[1];
            v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(_QWORD *)&prime)
                v29 %= *(_QWORD *)&prime;
            }
            else
            {
              v29 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v29) = v16;
            v34 = (_QWORD *)*v28;
            if (*v28)
            {
              do
              {
                v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(_QWORD *)&prime)
                    v35 %= *(_QWORD *)&prime;
                }
                else
                {
                  v35 &= *(_QWORD *)&prime - 1;
                }
                if (v35 != v29)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v35))
                  {
                    *(_QWORD *)(*a1 + 8 * v35) = v28;
                    goto LABEL_61;
                  }
                  *v28 = *v34;
                  *v34 = **(_QWORD **)(*a1 + 8 * v35);
                  **(_QWORD **)(*a1 + 8 * v35) = v34;
                  v34 = v28;
                }
                v35 = v29;
LABEL_61:
                v28 = v34;
                v34 = (_QWORD *)*v34;
                v29 = v35;
              }
              while (v34);
            }
          }
          v10 = (unint64_t)prime;
          goto LABEL_65;
        }
        v39 = (void *)*a1;
        *a1 = 0;
        if (v39)
          operator delete(v39);
        v10 = 0;
        a1[1] = 0;
      }
    }
LABEL_65:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v36 = *a1;
  v37 = *(_QWORD **)(*a1 + 8 * v4);
  if (v37)
  {
    *v17 = *v37;
LABEL_78:
    *v37 = v17;
    goto LABEL_79;
  }
  *v17 = *v16;
  *v16 = v17;
  *(_QWORD *)(v36 + 8 * v4) = v16;
  if (*v17)
  {
    v38 = *(_QWORD *)(*v17 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v38 >= v10)
        v38 %= v10;
    }
    else
    {
      v38 &= v10 - 1;
    }
    v37 = (_QWORD *)(*a1 + 8 * v38);
    goto LABEL_78;
  }
LABEL_79:
  ++a1[3];
}

void sub_2166DCDEC(_Unwind_Exception *a1)
{
  uint64_t *v1;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Phase::UniqueObjectId,std::unique_ptr<Phase::Controller::TapReceiverObject>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>,std::allocator<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>>,void ()(float *,unsigned long)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>,std::allocator<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>>,void ()(float *,unsigned long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_24D581B08;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 std::__function::__func<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>,std::allocator<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>>,void ()(float *,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24D581B08;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>,std::allocator<std::__bind<void (Phase::Controller::TapManager::*)(Phase::UniqueObjectId,float *,unsigned long),Phase::Controller::TapManager*,Phase::UniqueObjectId&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&>>,void ()(float *,unsigned long)>::operator()(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v5;

  v3 = a1[2];
  v4 = (uint64_t (*)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD))a1[1];
  v5 = (_QWORD *)(a1[3] + (v3 >> 1));
  if ((v3 & 1) != 0)
    v4 = *(uint64_t (**)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD))(*v5 + v4);
  return v4(v5, a1[4], a1[5], *a2, *a3);
}

Phase::Controller::PreSpatialTapSourceObject *std::unique_ptr<Phase::Controller::PreSpatialTapSourceObject>::reset[abi:ne180100](Phase::Controller::PreSpatialTapSourceObject **a1)
{
  Phase::Controller::PreSpatialTapSourceObject *result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    Phase::Controller::PreSpatialTapSourceObject::~PreSpatialTapSourceObject(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

int64x2_t *Phase::DspLayer::Tapper::GetNewRegistryEntry(Phase::DspLayer::Tapper *this)
{
  char *v1;
  int64x2_t *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v6[2];
  char v7;
  void *__p[2];
  char v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (char *)malloc_type_malloc(0x70uLL, 0x1050040B063AAFAuLL);
  *(_QWORD *)v1 = "TapId";
  *((_QWORD *)v1 + 1) = 0x500000000;
  *(_QWORD *)(v1 + 20) = 0;
  *((_DWORD *)v1 + 7) = 3;
  *((_OWORD *)v1 + 2) = xmmword_2166F7470;
  *((_QWORD *)v1 + 6) = 0;
  *((_QWORD *)v1 + 7) = "Start Position";
  *((_QWORD *)v1 + 8) = 0x500000001;
  *(_QWORD *)(v1 + 76) = 0;
  *((_DWORD *)v1 + 21) = 3;
  *(_OWORD *)(v1 + 88) = xmmword_21673B150;
  *((_QWORD *)v1 + 13) = 0;
  v2 = (int64x2_t *)operator new();
  v10[0] = &off_24D581C48;
  v11 = v10;
  Phase::Controller::VoicePoolEntry::VoicePoolEntry((uint64_t)v2, "Tapper", 2, (uint64_t)v1, (uint64_t)v10);
  v3 = v11;
  if (v11 == v10)
  {
    v4 = 4;
    v3 = v10;
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  std::string::basic_string[abi:ne180100]<0>(__p, "Input");
  Phase::Controller::VoicePoolEntry::AddInput(v2->i64, (__int128 *)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(v6, "buffer0");
  Phase::Controller::VoicePoolEntry::AddBuffer(v2, 0, (uint64_t)v6, 2, 1);
  if (v7 < 0)
    operator delete(v6[0]);
  return v2;
}

void sub_2166DD0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Phase::DspLayer::Tapper::~Tapper(Phase::DspLayer::Tapper *this)
{
  Phase::DspLayer::VoicePool::~VoicePool(this);
  JUMPOUT(0x2199F9D70);
}

void `anonymous namespace'::TapperSlice::~TapperSlice(_anonymous_namespace_::TapperSlice *this)
{
  JUMPOUT(0x2199F9D70);
}

double `anonymous namespace'::TapperSlice::Reset(_OWORD *a1)
{
  double result;

  a1[264] = 0u;
  a1[263] = 0u;
  a1[262] = 0u;
  a1[525] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  (*(void (**)(_OWORD *))(*(_QWORD *)a1 + 48))(a1);
  result = 0.0;
  a1[527] = 0u;
  a1[526] = 0u;
  return result;
}

uint64_t `anonymous namespace'::TapperSlice::Reset(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  _DWORD *v6;
  uint64_t result;

  v5 = a1 + 8 * a3;
  *(_QWORD *)(v5 + 16) = 0;
  v6 = (_DWORD *)(a1 + 4 * a3);
  v6[12] = 0;
  v6[16] = 0;
  *(_QWORD *)(a1 + 4192 + 8 * a3) = 0;
  v6[20] = 0;
  *(_DWORD *)(a1 + 4192 + 4 * a3 + 32) = 0;
  v6[2100] = 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  *(_QWORD *)(v5 + 8416) = a4;
  return result;
}

uint64_t `anonymous namespace'::TapperSlice::GetParameter(_anonymous_namespace_::TapperSlice *this, int a2)
{
  if (a2 == 1)
    return 0;
  if (a2)
    return 9;
  return 0;
}

uint64_t `anonymous namespace'::TapperSlice::SetParameter(_anonymous_namespace_::TapperSlice *this, int a2, int a3, double a4)
{
  uint64_t result;
  char *v6;
  _DWORD *v7;
  int v8;

  if (a2 == 1)
  {
    v6 = (char *)this + 4 * a3;
    v8 = *((_DWORD *)v6 + 12);
    v7 = v6 + 48;
    result = 0;
    if (v8 != (int)a4)
    {
      *v7 = (int)a4;
      *((_DWORD *)this + a3 + 16) = 1;
    }
  }
  else if (a2)
  {
    return 9;
  }
  else
  {
    result = 0;
    *((_QWORD *)this + a3 + 2) = (uint64_t)a4;
  }
  return result;
}

void *`anonymous namespace'::TapperSlice::UpdateParameters(_anonymous_namespace_::TapperSlice *this, Phase::DspLayer::VoiceEngine *a2)
{
  uint64_t v2;
  _OWORD v4[2];
  uint64_t v5;

  v2 = 0;
  v5 = *MEMORY[0x24BDAC8D0];
  *((_OWORD *)this + 522) = *((_OWORD *)this + 262);
  *((_OWORD *)this + 523) = *((_OWORD *)this + 263);
  *((_OWORD *)this + 524) = *((_OWORD *)this + 264);
  v4[0] = *((_OWORD *)this + 3);
  v4[1] = xmmword_2166F7490;
  do
  {
    *((_DWORD *)this + *(int *)((char *)&v4[1] + v2) + 2100) = *(_DWORD *)((char *)v4 + v2);
    v2 += 4;
  }
  while (v2 != 16);
  return memcpy((char *)this + 4240, (char *)this + 80, 0x1010uLL);
}

float `anonymous namespace'::TapperSlice::UpdateParameters(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _DWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float result;

  *(_QWORD *)(a1 + 8352 + 8 * a3) = *(_QWORD *)(a1 + 4192 + 8 * a3);
  *(_DWORD *)(a1 + 8352 + 4 * a3 + 32) = *(_DWORD *)(a1 + 4192 + 4 * a3 + 32);
  v3 = a1 + 4 * a3;
  v5 = *(_DWORD *)(v3 + 64);
  v4 = (_DWORD *)(v3 + 64);
  if (v5)
  {
    *(_DWORD *)(a1 + 4 * a3 + 8400) = *(_DWORD *)(a1 + 4 * a3 + 48);
    *v4 = 0;
  }
  v6 = a1 + 4 * a3;
  v7 = *(unsigned int *)(v6 + 80);
  *(_DWORD *)(v6 + 4240) = v7;
  if ((int)v7 >= 1)
  {
    do
    {
      *(_DWORD *)(v6 + 4256) = *(_DWORD *)(v6 + 96);
      result = *(float *)(v6 + 112);
      *(float *)(v6 + 4272) = result;
      v6 += 32;
      --v7;
    }
    while (v7);
  }
  return result;
}

int8x16_t `anonymous namespace'::TapperSlice::Run(int8x16_t *this, Phase::DspLayer::VoiceEngine *a2, Phase::DspLayer::VoicePool *a3, unsigned int a4)
{
  int32x4_t v5;
  int64x2_t v6;
  uint64_t v7;
  float32x4_t *v8;
  float32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  int32x4_t v13;
  unint64_t v14;
  int8x16_t v15;
  int32x4_t v16;
  const float *v17;
  int32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;
  uint64_t v26;
  char v27;
  int8x16_t result;
  _QWORD v29[2];
  int8x16_t v30;
  int32x4_t v31;
  int32x4_t v32;
  unsigned int v33[6];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = (int32x4_t)vandq_s8(this[265], (int8x16_t)vcgtq_s32(vdupq_n_s32(a4), (int32x4_t)xmmword_2166F76B0));
  v6 = (int64x2_t)vcgtzq_s32(v5);
  if (vorrq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0])
  {
    v7 = *((_QWORD *)a2 + 7);
    v8 = (float32x4_t *)&this[267];
    v9 = 0uLL;
    v10 = 0uLL;
    v11.i64[0] = 0x100000001;
    v11.i64[1] = 0x100000001;
    do
    {
      v12.i32[0] = *(_DWORD *)(v7 + 4 * v8[-1].i32[0]);
      v12.i32[1] = *(_DWORD *)(v7 + 4 * v8[-1].i32[1]);
      v12.i32[2] = *(_DWORD *)(v7 + 4 * v8[-1].i32[2]);
      v12.i32[3] = *(_DWORD *)(v7 + 4 * v8[-1].i32[3]);
      v9 = vmlaq_f32(v9, (float32x4_t)vandq_s8((int8x16_t)v6, v12), *v8);
      v10 = vaddq_s32(v10, v11);
      v6 = (int64x2_t)vcgtq_s32(v5, v10);
      v8 += 2;
    }
    while (vorrq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0]);
  }
  else
  {
    v9 = 0uLL;
  }
  v13 = (int32x4_t)this[525];
  HIDWORD(v14) = a4 - 1;
  LODWORD(v14) = a4 - 1;
  v15 = vandq_s8((int8x16_t)v9, vorrq_s8((int8x16_t)vcltzq_f32(v9), (int8x16_t)vcgezq_f32(v9)));
  switch((v14 >> 1))
  {
    case 0u:
      goto LABEL_10;
    case 1u:
      goto LABEL_9;
    case 3u:
      goto LABEL_8;
    case 7u:
      *(_DWORD *)(this[523].i64[1] + 4 * v13.i32[3]) = v15.i32[3];
LABEL_8:
      *(_DWORD *)(this[523].i64[0] + 4 * v13.i32[2]) = v15.i32[2];
LABEL_9:
      *(_DWORD *)(this[522].i64[1] + 4 * v13.i32[1]) = v15.i32[1];
LABEL_10:
      *(_DWORD *)(this[522].i64[0] + 4 * v13.i32[0]) = v15.i32[0];
      break;
    default:
      break;
  }
  v16.i64[0] = 0x100000001;
  v16.i64[1] = 0x100000001;
  v17 = (const float *)((char *)a2 + 24);
  v18 = (int32x4_t)vld1q_dup_f32(v17);
  v19 = vaddq_s32(v13, v16);
  v20 = (int8x16_t)vcgtq_s32(v18, v19);
  v21 = vbicq_s8((int8x16_t)xmmword_21673A740, v20);
  v22 = (int32x4_t)vorrq_s8(vextq_s8(v21, v21, 8uLL), v21);
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s32(v22, 3), (int8x16_t)v22).u32[0] & a4) != 0)
  {
    MEMORY[0x24BDAC7A8](this);
    v34[0] = v29;
    v29[0] = 0;
    v29[1] = 0;
    v33[0] = 1;
    v33[2] = 2;
    v31 = v24;
    v32 = v23;
    v30 = v25;
    Phase::DspLayer::VoicePool::ExternalCallbackWithMessage(v26, 0, this[526].i64, v27, v33, v34);
    v20 = v30;
    v18 = v31;
    v19 = v32;
  }
  result = (int8x16_t)vsubq_s32(v19, (int32x4_t)vbicq_s8((int8x16_t)v18, v20));
  this[525] = result;
  return result;
}

uint64_t `anonymous namespace'::TapperSlice::CopyVoiceState(uint64_t this, Phase::DspLayer::VoicePoolSlice *a2, unsigned int a3, signed int a4)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  int *v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _DWORD *v13;
  int *v14;
  int v15;

  *(_QWORD *)(this + 8 * a4 + 16) = *((_QWORD *)a2 + (int)a3 + 2);
  v4 = (_DWORD *)((char *)a2 + 4 * (int)a3);
  v5 = (_DWORD *)(this + 4 * a4);
  v5[12] = v4[12];
  v5[16] = v4[16];
  v6 = v4[20];
  v5[20] = v6;
  if ((int)v6 >= 1)
  {
    v7 = (_DWORD *)(this + 4 * a4 + 112);
    v8 = (int *)((char *)a2 + 4 * (int)a3 + 112);
    do
    {
      *(v7 - 4) = *(v8 - 4);
      v9 = *v8;
      v8 += 8;
      *v7 = v9;
      v7 += 8;
      --v6;
    }
    while (v6);
  }
  v10 = this + 4 * a4;
  v11 = (char *)a2 + 4 * (int)a3;
  v12 = *((unsigned int *)v11 + 1060);
  *(_DWORD *)(v10 + 4240) = v12;
  if ((int)v12 >= 1)
  {
    v13 = (_DWORD *)(v10 + 4272);
    v14 = (int *)(v11 + 4272);
    do
    {
      *(v13 - 4) = *(v14 - 4);
      v15 = *v14;
      v14 += 8;
      *v13 = v15;
      v13 += 8;
      --v12;
    }
    while (v12);
  }
  *(_QWORD *)(this + 4192 + 8 * a4) = *((_QWORD *)a2 + (int)a3 + 524);
  *(_QWORD *)(this + 8352 + 8 * a4) = *((_QWORD *)a2 + (int)a3 + 1044);
  *(_DWORD *)(this + 4192 + 4 * a4 + 32) = *((_DWORD *)a2 + (int)a3 + 1056);
  *(_DWORD *)(this + 8352 + 4 * a4 + 32) = *((_DWORD *)a2 + (int)a3 + 2096);
  if (a3 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 507, "fromLane >= 0 && fromLane < PHASE_SIMD_WIDTH");
  if (a4 >= 4)
    __assert_rtn("Copy", "DelaylineLinear.hpp", 508, "toLane >= 0 && toLane < PHASE_SIMD_WIDTH");
  *(_DWORD *)(this + 4 * a4 + 8400) = *((_DWORD *)a2 + a3 + 2100);
  *(_QWORD *)(this + 8 * a4 + 8416) = *((_QWORD *)a2 + (int)a3 + 1052);
  return this;
}

uint64_t `anonymous namespace'::TapperSlice::AddInput(_anonymous_namespace_::TapperSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  char *v7;
  uint64_t v8;
  char *v9;

  if (a2)
    return 8;
  v7 = (char *)this + 80;
  v8 = *((int *)this + a3 + 20);
  if ((int)v8 > 127)
    return 6;
  result = 0;
  v9 = (char *)this + 32 * v8 + 4 * a3;
  *((_DWORD *)v9 + 24) = a4;
  *((float *)v9 + 28) = a5;
  *(_DWORD *)&v7[4 * a3] = v8 + 1;
  return result;
}

uint64_t `anonymous namespace'::TapperSlice::RemoveInput(_anonymous_namespace_::TapperSlice *this, int a2, int a3, int a4)
{
  if (a2)
    return 8;
  else
    return Phase::DspLayer::VoiceConnectionList<128>::RemoveConnection((uint64_t)this + 80, a3, a4);
}

uint64_t `anonymous namespace'::TapperSlice::SetInputGain(_anonymous_namespace_::TapperSlice *this, int a2, int a3, int a4, float a5)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  float *i;

  if (a2)
    return 8;
  v6 = *((unsigned int *)this + a3 + 20);
  if ((int)v6 < 1)
    return 7;
  v7 = 0;
  for (i = (float *)((char *)this + 4 * a3 + 112); *((_DWORD *)i - 4) != a4; i += 8)
  {
    if (v6 == ++v7)
      return 7;
  }
  if ((v7 & 0x80000000) != 0)
    return 7;
  result = 0;
  *i = a5;
  return result;
}

void `anonymous namespace'::TapperSlice::GetInputs(_anonymous_namespace_::TapperSlice *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (a2)
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    Phase::DspLayer::VoiceConnectionList<128>::GetConnections((uint64_t)this + 80, a3, (char **)a4);
  }
}

uint64_t `anonymous namespace'::TapperSlice::ClearInputs(_anonymous_namespace_::TapperSlice *this, int a2)
{
  *((_DWORD *)this + a2 + 20) = 0;
  return 0;
}

uint64_t `anonymous namespace'::TapperSlice::GetMaximumInputConnectionCount(_anonymous_namespace_::TapperSlice *this, int a2)
{
  return (a2 == 0) << 7;
}

uint64_t Phase::DspLayer::VoicePoolSlice::GetOutput(Phase::DspLayer::VoicePoolSlice *this)
{
  return 0xFFFFFFFF00000008;
}

uint64_t Phase::DspLayer::VoicePoolSlice::SetOutput(Phase::DspLayer::VoicePoolSlice *this)
{
  return 8;
}

uint64_t `anonymous namespace'::TapperSlice::GetBuffer@<X0>(uint64_t this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  int v5;
  int v6;

  if (a2)
  {
    v4 = 0;
    v5 = -1;
    v6 = 10;
  }
  else
  {
    v6 = 0;
    v4 = *(_QWORD *)(this + 4192 + 8 * a3);
    v5 = *(_DWORD *)(this + 4192 + 4 * a3 + 32);
  }
  *(_DWORD *)a4 = v6;
  *(_QWORD *)(a4 + 8) = v4;
  *(_DWORD *)(a4 + 16) = v5;
  return this;
}

uint64_t `anonymous namespace'::TapperSlice::SetBuffer(_anonymous_namespace_::TapperSlice *this, int a2, int a3, void *a4, int a5)
{
  uint64_t result;

  if (a2)
    return 10;
  result = 0;
  this = (_anonymous_namespace_::TapperSlice *)((char *)this + 4192);
  *((_QWORD *)this + a3) = a4;
  *((_DWORD *)this + a3 + 8) = a5;
  return result;
}

void std::__function::__func<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *std::__function::__func<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24D581C48;
  return result;
}

void std::__function::__func<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24D581C48;
}

uint64_t std::__function::__func<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0,std::allocator<Phase::DspLayer::Tapper::GetNewRegistryEntry(void)::$_0>,Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::operator()(uint64_t a1, Phase::DspLayer::VoiceEngine **a2, int *a3)
{
  Phase::DspLayer::VoiceEngine *v3;
  int v4;
  uint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = *a3;
  v5 = operator new();
  Phase::DspLayer::VoicePool::VoicePool((Phase::DspLayer::VoicePool *)v5, "Tapper", v3, v4, 8448);
  *(_QWORD *)v5 = &off_24D581B50;
  if (*(int *)(v5 + 40) >= 1)
  {
    v6 = 0;
    v7 = 0uLL;
    do
    {
      v8 = *(_QWORD *)(v5 + 24) + *(int *)(v5 + 16) * (uint64_t)v6;
      *(_QWORD *)v8 = &off_24D581B70;
      *(_QWORD *)(v8 + 8) = 0;
      *(_OWORD *)(v8 + 8400) = v7;
      bzero((void *)(v8 + 16), 0x2090uLL);
      v9 = 0;
      *(_OWORD *)(v8 + 8352) = *(_OWORD *)(v8 + 4192);
      *(_OWORD *)(v8 + 8368) = *(_OWORD *)(v8 + 4208);
      *(_OWORD *)(v8 + 8384) = *(_OWORD *)(v8 + 4224);
      v12 = xmmword_2166F7490;
      v11[0] = 0;
      v11[1] = 0;
      do
      {
        *(_DWORD *)(v8 + 8400 + 4 * *(int *)((char *)&v11[2] + v9)) = *(_DWORD *)((char *)v11 + v9);
        v9 += 4;
      }
      while (v9 != 16);
      memcpy((void *)(v8 + 4240), (const void *)(v8 + 80), 0x1010uLL);
      v7 = 0uLL;
      *(_OWORD *)(v8 + 8416) = 0u;
      *(_OWORD *)(v8 + 8432) = 0u;
      ++v6;
    }
    while (v6 < *(_DWORD *)(v5 + 40));
  }
  return v5;
}

void sub_2166DDABC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199F9D70](v1, 0x10F1C408EBD29CELL);
  _Unwind_Resume(a1);
}

Phase::Dispatch::TapsClientCommandProcessor *Phase::Dispatch::TapsClientCommandProcessor::TapsClientCommandProcessor(Phase::Dispatch::TapsClientCommandProcessor *this, Phase::Dispatch::TapsClientInterface *a2, Phase::Controller::TaskManager *a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)Phase::Dispatch::TransactionExecutor<Phase::Dispatch::TapsServerMessageType>::TransactionExecutor((uint64_t)this);
  *v6 = &off_24D581C90;
  v6[10] = a2;
  v7 = Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>(a3, 16);
  *((_QWORD *)this + 11) = v7;
  if (!v7)
    std::terminate();
  return this;
}

void sub_2166DDB3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  Phase::Dispatch::TransactionExecutor<Phase::Dispatch::TapsServerMessageType>::~TransactionExecutor(v1);
  _Unwind_Resume(a1);
}

uint64_t Phase::Dispatch::TransactionExecutor<Phase::Dispatch::TapsServerMessageType>::TransactionExecutor(uint64_t a1)
{
  id v2;
  void *v3;

  *(_QWORD *)a1 = &off_24D57AD08;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v2;

  return a1;
}

void sub_2166DDBB8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<Phase::ActionTreeClientCommand,std::function<void ()(void const*)>>,std::__unordered_map_hasher<Phase::ActionTreeClientCommand,std::__hash_value_type<Phase::ActionTreeClientCommand,std::function<void ()(void const*)>>,std::hash<Phase::ActionTreeClientCommand>,std::equal_to<Phase::ActionTreeClientCommand>,true>,std::__unordered_map_equal<Phase::ActionTreeClientCommand,std::__hash_value_type<Phase::ActionTreeClientCommand,std::function<void ()(void const*)>>,std::equal_to<Phase::ActionTreeClientCommand>,std::hash<Phase::ActionTreeClientCommand>,true>,std::allocator<std::__hash_value_type<Phase::ActionTreeClientCommand,std::function<void ()(void const*)>>>>::~__hash_table(v2);
  _Unwind_Resume(a1);
}

Phase::Dispatch::TapsClientDirectDispatcher *Phase::Dispatch::TapsClientDirectDispatcher::TapsClientDirectDispatcher(Phase::Dispatch::TapsClientDirectDispatcher *this, Phase::Controller::TaskManager *a2)
{
  uint64_t v3;

  *(_QWORD *)this = &off_24D581CB8;
  *((_QWORD *)this + 1) = 0;
  v3 = Phase::Controller::TaskManager::GetService<Phase::Controller::TapManager>(a2, 18);
  *((_QWORD *)this + 1) = v3;
  if (!v3)
    std::terminate();
  return this;
}

uint64_t Phase::Controller::TaskManager::GetService<Phase::Controller::TapManager>(Phase::Logger *a1, int a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  NSObject *v7;
  std::logic_error *exception;
  NSObject *v9;
  std::string *v10;
  std::logic_error *v11;
  std::string __p;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  std::string *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)a1 + 6);
  if (a2 >= (unint64_t)((*((_QWORD *)a1 + 7) - v3) >> 5))
  {
    v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 448));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "TaskManager.hpp";
      v15 = 1024;
      v16 = 112;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pId < mServiceRegistry.size() is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::domain_error::domain_error[abi:ne180100](exception, "PRECONDITION: pId < mServiceRegistry.size() is false.");
  }
  v4 = *(uint64_t (**)(uint64_t))(v3 + 32 * a2);
  if (!v4)
  {
    v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1)
                                                                                       + 448)));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      Phase::GetBacktraceFrame<1ul>(&__p);
      v10 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__p
          : (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      v14 = "TaskManager.hpp";
      v15 = 1024;
      v16 = 121;
      v17 = 1024;
      v18 = a2;
      v19 = 2080;
      v20 = v10;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::domain_error) [not lService.has_value() is true]: \"No service registered for Id %i, in call \\n%s\"", buf, 0x22u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }

    v11 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::domain_error::domain_error[abi:ne180100](v11, "No service registered for Id %i, in call \n%s");
  }
  v5 = v4(3);
  if (!v5)
    std::__throw_bad_any_cast[abi:ne180100]();
  return *(_QWORD *)v5;
}

void sub_2166DDECC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2166DDFBC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_2166DDFDC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapCreatePreSpatialTap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v15;
  std::runtime_error *exception;
  BOOL v17;
  unint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 8);
  v10 = **(_QWORD **)(v9 + 8);
  v18 = 0;
  v17 = 1;
  v11 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v10, 48, &v18, &v17);
  if (!v11)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v15 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 100;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v17)
  {
    v12 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 89;
      v23 = 2048;
      v24 = v18;
      v25 = 2048;
      v26 = 48;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v11 = &off_24D581D30;
  v11[1] = v9;
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v10, 48);
  atomic_store(0, (unsigned __int8 *)(v10 + 40));
  return result;
}

void sub_2166DE204(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DE120);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapRemovePreSpatialTap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v11;
  std::runtime_error *exception;
  BOOL v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  v6 = **(_QWORD **)(v5 + 8);
  v14 = 0;
  v13 = 1;
  v7 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v6, 32, &v14, &v13);
  if (!v7)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v11 = objc_retainAutorelease(**(id **)(v6 + 48));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "CommandQueue.hpp";
      v17 = 1024;
      v18 = 100;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v13)
  {
    v8 = objc_retainAutorelease(**(id **)(v6 + 48));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "CommandQueue.hpp";
      v17 = 1024;
      v18 = 89;
      v19 = 2048;
      v20 = v14;
      v21 = 2048;
      v22 = 32;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v7 = &off_24D581D58;
  v7[1] = v5;
  v7[2] = a2;
  v7[3] = a3;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v6, 32);
  atomic_store(0, (unsigned __int8 *)(v6 + 40));
  return result;
}

void sub_2166DE458(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DE378);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSubmix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v15;
  std::runtime_error *exception;
  BOOL v17;
  unint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 8);
  v10 = **(_QWORD **)(v9 + 8);
  v18 = 0;
  v17 = 1;
  v11 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v10, 48, &v18, &v17);
  if (!v11)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v15 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 100;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v17)
  {
    v12 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 89;
      v23 = 2048;
      v24 = v18;
      v25 = 2048;
      v26 = 48;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v11 = &off_24D581D80;
  v11[1] = v9;
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v10, 48);
  atomic_store(0, (unsigned __int8 *)(v10 + 40));
  return result;
}

void sub_2166DE6C0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DE5DCLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSubmix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v15;
  std::runtime_error *exception;
  BOOL v17;
  unint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 8);
  v10 = **(_QWORD **)(v9 + 8);
  v18 = 0;
  v17 = 1;
  v11 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v10, 48, &v18, &v17);
  if (!v11)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v15 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 100;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v17)
  {
    v12 = objc_retainAutorelease(**(id **)(v10 + 48));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "CommandQueue.hpp";
      v21 = 1024;
      v22 = 89;
      v23 = 2048;
      v24 = v18;
      v25 = 2048;
      v26 = 48;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v11 = &off_24D581DA8;
  v11[1] = v9;
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v10, 48);
  atomic_store(0, (unsigned __int8 *)(v10 + 40));
  return result;
}

void sub_2166DE928(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DE844);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v13;
  std::runtime_error *exception;
  BOOL v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 8);
  v8 = **(_QWORD **)(v7 + 8);
  v16 = 0;
  v15 = 1;
  v9 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v8, 40, &v16, &v15);
  if (!v9)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v13 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 100;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v15)
  {
    v10 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 89;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = 40;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v9 = &off_24D581DD0;
  v9[1] = v7;
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v8, 40);
  atomic_store(0, (unsigned __int8 *)(v8 + 40));
  return result;
}

void sub_2166DEB8C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DEAA8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v13;
  std::runtime_error *exception;
  BOOL v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 8);
  v8 = **(_QWORD **)(v7 + 8);
  v16 = 0;
  v15 = 1;
  v9 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v8, 40, &v16, &v15);
  if (!v9)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v13 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 100;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v15)
  {
    v10 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 89;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = 40;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v9 = &off_24D581DF8;
  v9[1] = v7;
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v8, 40);
  atomic_store(0, (unsigned __int8 *)(v8 + 40));
  return result;
}

void sub_2166DEDF0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DED0CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterTapReceiver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v13;
  std::runtime_error *exception;
  BOOL v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 8);
  v8 = **(_QWORD **)(v7 + 8);
  v16 = 0;
  v15 = 1;
  v9 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v8, 40, &v16, &v15);
  if (!v9)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v13 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 100;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v15)
  {
    v10 = objc_retainAutorelease(**(id **)(v8 + 48));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "CommandQueue.hpp";
      v19 = 1024;
      v20 = 89;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = 40;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v9 = &off_24D581E20;
  v9[1] = v7;
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v8, 40);
  atomic_store(0, (unsigned __int8 *)(v8 + 40));
  return result;
}

void sub_2166DF054(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DEF70);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterTapReceiver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t result;
  Phase::Logger *InstancePtr;
  NSObject *v11;
  std::runtime_error *exception;
  BOOL v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  v6 = **(_QWORD **)(v5 + 8);
  v14 = 0;
  v13 = 1;
  v7 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v6, 32, &v14, &v13);
  if (!v7)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v11 = objc_retainAutorelease(**(id **)(v6 + 48));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "CommandQueue.hpp";
      v17 = 1024;
      v18 = 100;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\"",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v13)
  {
    v8 = objc_retainAutorelease(**(id **)(v6 + 48));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "CommandQueue.hpp";
      v17 = 1024;
      v18 = 89;
      v19 = 2048;
      v20 = v14;
      v21 = 2048;
      v22 = 32;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v7 = &off_24D581E48;
  v7[1] = v5;
  v7[2] = a2;
  v7[3] = a3;
  result = Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v6, 32);
  atomic_store(0, (unsigned __int8 *)(v6 + 40));
  return result;
}

void sub_2166DF2A8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    __cxa_free_exception(v3);
    __cxa_begin_catch(exception_object);
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::LogOverflow(v2);
    __cxa_end_catch();
    JUMPOUT(0x2166DF1C8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::Dispatch::TapsClientDirectDispatcher::GetTransactionBuffer(Phase::Dispatch::TapsClientDirectDispatcher *this)
{
  return 0;
}

void Phase::Dispatch::TapsClientDirectDispatcher::~TapsClientDirectDispatcher(Phase::Dispatch::TapsClientDirectDispatcher *this)
{
  JUMPOUT(0x2199F9D70);
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapCreatePreSpatialTap(Phase::UniqueObjectId,PHASETapBinding,PHASETapType)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapCreatePreSpatialTap(Phase::UniqueObjectId,PHASETapBinding,PHASETapType)::$_0,void>::operator()(uint64_t a1)
{
  Phase::Controller::TapManager::CreatePreSpatialTap(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRemovePreSpatialTap(Phase::UniqueObjectId)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

uint64_t *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRemovePreSpatialTap(Phase::UniqueObjectId)::$_0,void>::operator()(uint64_t a1)
{
  return Phase::Controller::TapManager::RemoveTapSourceObject(*(_QWORD **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSubmix(Phase::UniqueObjectId,Phase::UniqueObjectId)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSubmix(Phase::UniqueObjectId,Phase::UniqueObjectId)::$_0,void>::operator()(uint64_t a1)
{
  return Phase::Controller::TapManager::RegisterSubmix(*(Phase::Controller::TapManager **)(a1 + 8), *(UniqueObjectId *)(a1 + 16), *(UniqueObjectId *)(a1 + 32));
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSubmix(Phase::UniqueObjectId,Phase::UniqueObjectId)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSubmix(Phase::UniqueObjectId,Phase::UniqueObjectId)::$_0,void>::operator()(uint64_t a1)
{
  return Phase::Controller::TapManager::DeRegisterSubmix(*(Phase::Controller::TapManager **)(a1 + 8), *(UniqueObjectId *)(a1 + 16), *(UniqueObjectId *)(a1 + 32));
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSource(Phase::UniqueObjectId,Phase::Handle64)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterSource(Phase::UniqueObjectId,Phase::Handle64)::$_0,void>::operator()(uint64_t a1)
{
  Handle64 v1;

  v1.mData = *(_QWORD *)(a1 + 32);
  return Phase::Controller::TapManager::RegisterSource(*(Phase::Controller::TapManager **)(a1 + 8), *(UniqueObjectId *)(a1 + 16), v1);
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSource(Phase::UniqueObjectId,Phase::Handle64)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterSource(Phase::UniqueObjectId,Phase::Handle64)::$_0,void>::operator()(uint64_t a1)
{
  Handle64 v1;

  v1.mData = *(_QWORD *)(a1 + 32);
  return Phase::Controller::TapManager::DeRegisterSource(*(Phase::Controller::TapManager **)(a1 + 8), *(UniqueObjectId *)(a1 + 16), v1);
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterTapReceiver(Phase::UniqueObjectId,unsigned long long)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapRegisterTapReceiver(Phase::UniqueObjectId,unsigned long long)::$_0,void>::operator()(uint64_t a1)
{
  return Phase::Controller::TapManager::RegisterTapReceiver(*(uint64_t **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), 0, *(_QWORD *)(a1 + 32));
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterTapReceiver(Phase::UniqueObjectId)::$_0,void>::~LambdaFunction()
{
  JUMPOUT(0x2199F9D70);
}

void Phase::LambdaFunction<Phase::Dispatch::TapsClientDirectDispatcher::TapDeRegisterTapReceiver(Phase::UniqueObjectId)::$_0,void>::operator()(uint64_t *a1)
{
  Phase::Controller::TapManager::DeRegisterTapReceiver(a1[1], a1[2], a1[3], 0);
}

Phase::Controller::TaskManager *Phase::Controller::TaskManager::TaskManager(Phase::Controller::TaskManager *this)
{
  uint64_t InstancePtr;
  _QWORD *v3;

  InstancePtr = Phase::Logger::GetInstancePtr(this);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::Commandable((uint64_t)this, *(_QWORD *)(InstancePtr + 448), 1, 0x20000);
  *(_QWORD *)this = off_24D581E70;
  *((_QWORD *)this + 5) = Phase::JobManager::Create(0);
  std::vector<std::any>::vector((_QWORD *)this + 6, 0x20uLL);
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 15) = 0;
  v3 = operator new(0x20uLL);
  *v3 = &off_24D581EA0;
  v3[1] = Phase::Controller::TaskManager::DefaultUpdate;
  v3[2] = 0;
  v3[3] = this;
  *((_QWORD *)this + 15) = v3;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  return this;
}

void sub_2166DF528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  _QWORD *v10;
  void **v11;
  void **v12;
  uint64_t v14;

  v12 = v11;
  a10 = v12;
  std::vector<std::any>::__destroy_vector::operator()[abi:ne180100](&a10);
  v14 = v10[5];
  v10[5] = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(v10);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::TaskManager::DefaultUpdate(uint64_t this, __n128 a2)
{
  uint64_t *v2;
  uint64_t *v3;

  v2 = *(uint64_t **)(this + 72);
  v3 = *(uint64_t **)(this + 80);
  while (v2 != v3)
  {
    this = *v2;
    if (*v2)
      this = (**(uint64_t (***)(uint64_t, __n128))this)(this, a2);
    ++v2;
  }
  return this;
}

void Phase::Controller::TaskManager::~TaskManager(Phase::Controller::TaskManager **this)
{
  Phase::Controller::TaskManager *v2;
  uint64_t v3;
  Phase::Controller::TaskManager *v4;
  Phase::Controller::TaskManager *v5;
  void **v6;

  *this = (Phase::Controller::TaskManager *)off_24D581E70;
  Phase::Controller::TaskManager::StopUpdateLoop((Phase::Controller::TaskManager *)this);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)(this + 16));
  v2 = this[15];
  if (v2 == (Phase::Controller::TaskManager *)(this + 12))
  {
    v3 = 4;
    v2 = (Phase::Controller::TaskManager *)(this + 12);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  v4 = this[9];
  if (v4)
  {
    this[10] = v4;
    operator delete(v4);
  }
  v6 = (void **)(this + 6);
  std::vector<std::any>::__destroy_vector::operator()[abi:ne180100](&v6);
  v5 = this[5];
  this[5] = 0;
  if (v5)
    (*(void (**)(Phase::Controller::TaskManager *))(*(_QWORD *)v5 + 8))(v5);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(this);
}

{
  Phase::Controller::TaskManager::~TaskManager(this);
  JUMPOUT(0x2199F9D70);
}

void Phase::Controller::TaskManager::StopUpdateLoop(Phase::Controller::TaskManager *this)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  Phase::Logger *v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  Phase::Controller::TaskManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)((char *)this + 128);
  v1 = *((_QWORD *)this + 16);
  if (v1)
  {
    v4 = *((_QWORD *)this + 5);
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 17);
    v15 = v1;
    v16 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t, uint64_t *, _QWORD))(*(_QWORD *)v4 + 64))(v4, &v15, 0);
    v8 = v16;
    if (v16)
    {
      v9 = (unint64_t *)&v16->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    std::shared_ptr<Phase::Job>::reset[abi:ne180100](v2);
    *((_QWORD *)this + 18) = 0;
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 448));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "TaskManager.mm";
      v19 = 1024;
      v20 = 110;
      v21 = 2048;
      v22 = this;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d impl@%p: TaskManager: update loop stopped", buf, 0x1Cu);
    }
    v14 = (_QWORD *)*((_QWORD *)this + 9);
    v13 = (_QWORD *)*((_QWORD *)this + 10);
    while (v14 != v13)
    {
      if (*v14)
        (*(void (**)(_QWORD))(*(_QWORD *)*v14 + 8))(*v14);
      ++v14;
    }
  }
}

void sub_2166DF7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void Phase::Controller::TaskManager::ClearServiceRegistry(Phase::Controller::TaskManager *this)
{
  void *v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  Phase::Controller::TaskManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*((_QWORD *)this + 9);
  v4 = *((_QWORD *)this + 10);
  v5 = (char *)this + 72;
  v6 = v4 - (_QWORD)v3;
  v7 = (v4 - (uint64_t)v3) >> 3;
  v8 = *((_QWORD *)v5 + 2);
  if (v7 <= (v8 - (uint64_t)v3) >> 3)
  {
    if (v6 >= 8)
      bzero(v3, v6 & 0xFFFFFFFFFFFFFFF8);
    v11 = *(char **)v5;
  }
  else
  {
    if (v3)
    {
      *((_QWORD *)this + 10) = v3;
      operator delete(v3);
      v8 = 0;
      *(_QWORD *)v5 = 0;
      *((_QWORD *)v5 + 1) = 0;
      *((_QWORD *)v5 + 2) = 0;
    }
    if ((v6 & 0x8000000000000000) != 0)
      goto LABEL_21;
    v9 = v8 >> 2;
    if (v8 >> 2 <= v7)
      v9 = v7;
    v10 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v9;
    if (v10 >> 61)
LABEL_21:
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)(v5 + 16), v10);
    *(_QWORD *)v5 = v11;
    *((_QWORD *)v5 + 2) = &v11[8 * v12];
    bzero(v11, v6 & 0xFFFFFFFFFFFFFFF8);
  }
  *((_QWORD *)this + 10) = &v11[8 * v7];
  v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)this + 6);
  v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)this + 7);
  while (v13 != v14)
  {
    v3 = std::any::reset[abi:ne180100](v13);
    v13 += 4;
  }
  v15 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v3) + 448));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "TaskManager.mm";
    v18 = 1024;
    v19 = 45;
    v20 = 2048;
    v21 = this;
    _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d impl@%p: TaskManager: cleared service registry", (uint8_t *)&v16, 0x1Cu);
  }
}

_QWORD *Phase::Controller::TaskManager::SetUpdateFunction(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  NSObject *v9;
  std::logic_error *exception;
  _BYTE v11[12];
  __int16 v12;
  int v13;
  _BYTE *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 128))
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 448));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "TaskManager.mm";
      v12 = 1024;
      v13 = 61;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: !mUpdateJob is false.", v11, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: !mUpdateJob is false.");
  }
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v14 = v11;
      (*(void (**)(_QWORD *, _BYTE *))(*a2 + 24))(a2, v11);
    }
    else
    {
      v14 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
  }
  else
  {
    v14 = 0;
  }
  v4 = a1 + 96;
  if (v11 != (_BYTE *)(a1 + 96))
  {
    v5 = v14;
    v6 = *(_QWORD *)(a1 + 120);
    if (v14 == v11)
    {
      if (v6 == v4)
      {
        (*(void (**)(_BYTE *, _QWORD *))(*(_QWORD *)v11 + 24))(v11, v15);
        (*(void (**)(_BYTE *))(*(_QWORD *)v14 + 32))(v14);
        v14 = 0;
        (*(void (**)(_QWORD, _BYTE *))(**(_QWORD **)(a1 + 120) + 24))(*(_QWORD *)(a1 + 120), v11);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 120) + 32))(*(_QWORD *)(a1 + 120));
        *(_QWORD *)(a1 + 120) = 0;
        v14 = v11;
        (*(void (**)(_QWORD *, uint64_t))(v15[0] + 24))(v15, a1 + 96);
        (*(void (**)(_QWORD *))(v15[0] + 32))(v15);
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v11 + 24))(v11, a1 + 96);
        (*(void (**)(_BYTE *))(*(_QWORD *)v14 + 32))(v14);
        v14 = *(_BYTE **)(a1 + 120);
      }
      *(_QWORD *)(a1 + 120) = v4;
    }
    else if (v6 == v4)
    {
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 24))(a1 + 96, v11);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 120) + 32))(*(_QWORD *)(a1 + 120));
      *(_QWORD *)(a1 + 120) = v14;
      v14 = v11;
    }
    else
    {
      v14 = *(_BYTE **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;
    }
  }
  result = v14;
  if (v14 == v11)
  {
    v8 = 4;
    result = v11;
  }
  else
  {
    if (!v14)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

void sub_2166DFC64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::TaskManager::ResetUpdateFunction(Phase::Controller::TaskManager *this)
{
  _QWORD *v2;
  _QWORD *result;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = operator new(0x20uLL);
  *v2 = &off_24D581EA0;
  v2[1] = Phase::Controller::TaskManager::DefaultUpdate;
  v2[2] = 0;
  v2[3] = this;
  v6 = v2;
  Phase::Controller::TaskManager::SetUpdateFunction((uint64_t)this, v5);
  result = v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = v5;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void sub_2166DFD40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void Phase::Controller::TaskManager::StartUpdateLoop(Phase::Controller::TaskManager *this, double a2)
{
  char *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  __int128 v24;
  _BYTE v25[24];
  _BYTE *v26;
  _BYTE buf[12];
  __int16 v28;
  int v29;
  __int16 v30;
  Phase::Controller::TaskManager *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)this + 128;
  v5 = *((_QWORD *)this + 16);
  v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(this) + 448));
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "TaskManager.mm";
      v28 = 1024;
      v29 = 98;
      v30 = 2048;
      v31 = this;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d impl@%p: TaskManager: attempting to start update loop while already running", buf, 0x1Cu);
    }
    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "TaskManager.mm";
    v28 = 1024;
    v29 = 76;
    v30 = 2048;
    v31 = this;
    v32 = 2048;
    v33 = a2;
    _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d impl@%p: TaskManager: starting update loop with target framerate: %F1 Hz", buf, 0x26u);
  }
  *((double *)this + 18) = a2;
  v8 = *((_QWORD *)this + 5);
  std::string::basic_string[abi:ne180100]<0>(buf, "Engine-Update");
  (*(void (**)(__int128 *__return_ptr, uint64_t, _BYTE *))(*(_QWORD *)v8 + 16))(&v24, v8, buf);
  std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100]((uint64_t)v4, &v24);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (SBYTE3(v31) < 0)
    operator delete(*(void **)buf);
  v12 = *((_QWORD *)this + 16);
  *(_QWORD *)(v12 + 256) = &off_24D581EE8;
  *(_QWORD *)(v12 + 264) = Phase::Controller::TaskManager::UpdateFrame;
  *(_QWORD *)(v12 + 272) = 0;
  *(_QWORD *)(v12 + 280) = this;
  *(_QWORD *)(v12 + 288) = 0xBFF0000000000000;
  *(_BYTE *)(v12 + 383) = 1;
  atomic_store(1u, (unsigned __int8 *)(v12 + 40));
  v13 = 1.0 / a2;
  *((double *)this + 19) = (double)std::chrono::steady_clock::now().__d_.__rep_ / 1000000000.0;
  v14 = (std::__shared_weak_count *)*((_QWORD *)this + 17);
  v22 = *((_QWORD *)this + 16);
  v23 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  v26 = 0;
  Phase::JobManager::ScheduleJobWithPeriod(v8, &v22, (uint64_t)v25, v13);
  v17 = v26;
  if (v26 == v25)
  {
    v18 = 4;
    v17 = v25;
    goto LABEL_20;
  }
  if (v26)
  {
    v18 = 5;
LABEL_20:
    (*(void (**)(_QWORD *))(*v17 + 8 * v18))(v17);
  }
  v19 = v23;
  if (v23)
  {
    v20 = (unint64_t *)&v23->__shared_owners_;
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

void sub_2166E0048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, char *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  char *v22;
  char *v24;
  uint64_t v25;

  v24 = a16;
  if (a16 == v22)
  {
    v25 = 4;
    v24 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_6;
    v25 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v24 + 8 * v25))();
LABEL_6:
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::TaskManager::UpdateFrame(Phase::Controller::TaskManager *this, double a2)
{
  double v2;
  std::chrono::steady_clock::time_point v4;
  double v5;
  uint64_t v6;
  double v8;

  v2 = a2;
  if (a2 < 0.0)
  {
    v4.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    v5 = *((double *)this + 19);
    v2 = (double)v4.__d_.__rep_ / 1000000000.0 - v5;
    *((double *)this + 19) = v5 + v2;
  }
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::ExecuteCommands((uint64_t)this);
  v8 = v2;
  v6 = *((_QWORD *)this + 15);
  if (!v6)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, double *))(*(_QWORD *)v6 + 48))(v6, &v8);
}

_QWORD *std::vector<std::any>::vector(_QWORD *a1, unint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::any>::__vallocate[abi:ne180100](a1, a2);
    v4 = (_QWORD *)a1[1];
    v5 = &v4[4 * a2];
    v6 = 32 * a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4 += 4;
      v6 -= 32;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_2166E0190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::any>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::any>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void std::vector<std::any>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        std::any::reset[abi:ne180100](v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__function::__func<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>>,void ()(double)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>>,void ()(double)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24D581EA0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>>,void ()(double)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D581EA0;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (Phase::Controller::TaskManager::*)(double),Phase::Controller::TaskManager*,std::placeholders::__ph<1> const&>>,void ()(double)>::operator()(_QWORD *a1, double *a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *, double);
  _QWORD *v4;

  v2 = a1[2];
  v3 = (uint64_t (*)(_QWORD *, double))a1[1];
  v4 = (_QWORD *)(a1[3] + (v2 >> 1));
  if ((v2 & 1) != 0)
    v3 = *(uint64_t (**)(_QWORD *, double))(*v4 + v3);
  return v3(v4, *a2);
}

void Phase::Command<128>::Invoker<std::__mem_fn<void (Phase::Controller::TaskManager::*)(double)>,void,Phase::Controller::TaskManager*,double>::~Invoker()
{
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::Command<128>::Invoker<std::__mem_fn<void (Phase::Controller::TaskManager::*)(double)>,void,Phase::Controller::TaskManager*,double>::Call(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD *, double);
  _QWORD *v3;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(uint64_t (**)(_QWORD *, double))(a1 + 8);
  v3 = (_QWORD *)(*(_QWORD *)(a1 + 24) + (v1 >> 1));
  if ((v1 & 1) != 0)
    v2 = *(uint64_t (**)(_QWORD *, double))(*v3 + v2);
  return v2(v3, *(double *)(a1 + 32));
}

_DWORD *Phase::SpatialModeler::Telemetry::AddSceneObserverResults(_DWORD *result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t i;
  uint64_t j;
  uint64_t k;

  v2 = 0;
  ++result[166];
  do
  {
    v3 = *(unsigned __int8 *)(a2 + v2);
    if (*(_BYTE *)(a2 + v2))
      v4 = 1;
    else
      v4 = v2 == 18;
    ++v2;
  }
  while (!v4);
  if (v3)
  {
    v5 = 1;
  }
  else
  {
    v6 = 0;
    v7 = a2 + 19;
    do
    {
      v5 = *(unsigned __int8 *)(v7 + v6);
      if (*(_BYTE *)(v7 + v6))
        v8 = 1;
      else
        v8 = v6 == 18;
      ++v6;
    }
    while (!v8);
  }
  v9 = 0;
  result[167] += v5;
  v10 = a2 + 38;
  do
  {
    v11 = *(unsigned __int8 *)(v10 + v9);
    if (*(_BYTE *)(v10 + v9))
      v12 = 1;
    else
      v12 = v9 == 18;
    ++v9;
  }
  while (!v12);
  if (v11)
  {
    v13 = 1;
  }
  else
  {
    v14 = 0;
    v15 = a2 + 57;
    do
    {
      v13 = *(unsigned __int8 *)(v15 + v14);
      if (*(_BYTE *)(v15 + v14))
        v16 = 1;
      else
        v16 = v14 == 18;
      ++v14;
    }
    while (!v16);
  }
  v17 = 0;
  result[168] += v13;
  do
  {
    result[v17 + 175] += *(unsigned __int8 *)(a2 + v17);
    ++v17;
  }
  while (v17 != 19);
  for (i = 0; i != 19; ++i)
    result[i + 194] += *(unsigned __int8 *)(a2 + 19 + i);
  for (j = 0; j != 19; ++j)
    result[j + 213] += *(unsigned __int8 *)(v10 + j);
  for (k = 0; k != 19; ++k)
    result[k + 232] += *(unsigned __int8 *)(a2 + 57 + k);
  return result;
}

uint64_t Phase::SpatialModeler::Telemetry::Send(Phase::SpatialModeler::Telemetry *this)
{
  unsigned __int8 v2;
  uint64_t result;

  v2 = atomic_load((unsigned __int8 *)_MergedGlobals_23);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(_MergedGlobals_23))
  {
    xmmword_254E449F0 = xmmword_21673B170;
    dword_254E44A00 = 0;
    __cxa_guard_release(_MergedGlobals_23);
  }
  result = Phase::Throttle::ShouldFire((Phase::Throttle *)&xmmword_254E449F0, 0);
  if ((_DWORD)result)
  {
    analytics_send_event_lazy();
    if (*((_DWORD *)this + 31) == 10)
      analytics_send_event_lazy();
    if (*((_DWORD *)this + 63) == 10)
      analytics_send_event_lazy();
    if (*((_DWORD *)this + 95) == 10)
      analytics_send_event_lazy();
    if (*((_DWORD *)this + 127) == 10)
      analytics_send_event_lazy();
    if (*((_DWORD *)this + 159) == 10)
      analytics_send_event_lazy();
    analytics_send_event_lazy();
    analytics_send_event_lazy();
    analytics_send_event_lazy();
    analytics_send_event_lazy();
    return analytics_send_event_lazy();
  }
  return result;
}

xpc_object_t ___ZN5Phase14SpatialModeler9Telemetry4SendEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v2;
  unint64_t v3;
  uint64_t v4;
  std::string *v5;
  std::string v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = 0;
  v4 = v1 + 676;
  do
  {
    std::to_string(&v7, v3);
    if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v7;
    else
      v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
    xpc_dictionary_set_uint64(v2, (const char *)v5, *(unsigned int *)(v4 + 4 * v3));
    if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v7.__r_.__value_.__l.__data_);
    *(_DWORD *)(v4 + 4 * v3++) = 0;
  }
  while (v3 != 4);
  return v2;
}

void sub_2166E07A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

xpc_object_t ___ZN5Phase14SpatialModeler9Telemetry4SendEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_double(v2, "mean_free_path", *(float *)(v1 + 640));
  xpc_dictionary_set_double(v2, "surface_area", *(float *)(v1 + 644));
  xpc_dictionary_set_double(v2, "volume", *(float *)(v1 + 648));
  xpc_dictionary_set_uint64(v2, "rays_per_query", *(unsigned int *)(v1 + 652));
  xpc_dictionary_set_uint64(v2, "intersections_per_query", *(unsigned int *)(v1 + 656));
  LODWORD(v3) = *(_DWORD *)(v1 + 660);
  xpc_dictionary_set_double(v2, "lr_ir_build_frequency", (double)v3 / 600.0);
  *(_DWORD *)(v1 + 660) = 0;
  LODWORD(v4) = *(_DWORD *)(v1 + 664);
  xpc_dictionary_set_double(v2, "scene_observer_frequency", (double)v4 / 600.0);
  *(_DWORD *)(v1 + 664) = 0;
  LODWORD(v5) = *(_DWORD *)(v1 + 668);
  xpc_dictionary_set_double(v2, "trace_frequency", (double)v5 / 600.0);
  *(_DWORD *)(v1 + 668) = 0;
  LODWORD(v6) = *(_DWORD *)(v1 + 672);
  xpc_dictionary_set_double(v2, "building_metadata_frequency", (double)v6 / 600.0);
  *(_DWORD *)(v1 + 672) = 0;
  xpc_dictionary_set_uint64(v2, "triangle_count", *(unsigned int *)(v1 + 692));
  LODWORD(v7) = *(_DWORD *)(v1 + 696);
  xpc_dictionary_set_double(v2, "triangle_count_change_frequency", (double)v7 / 600.0);
  *(_DWORD *)(v1 + 696) = 0;
  return v2;
}

xpc_object_t ___ZZN5Phase14SpatialModeler9Telemetry4SendEvENK3__0clIPKcNS_8SubbandsIfEEEEDaT_RKT0__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  float v7;
  uint64_t v8;
  float v9;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v3 + 124))
  {
    v4 = 0;
    do
    {
      xpc_dictionary_set_double(v2, _ZZZN5Phase14SpatialModeler9Telemetry4SendEvENK3__0clIPKcNS_8SubbandsIfEEEEDaT_RKT0_E9bandNames[v4], *(float *)(v3 + 4 * v4));
      ++v4;
      v3 = *(_QWORD *)(a1 + 32);
    }
    while (v4 < *(unsigned int *)(v3 + 124));
  }
  xpc_dictionary_set_double(v2, "din", (float)((float)(*(float *)(v3 + 16) + *(float *)(v3 + 20)) * 0.5));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(v5 + 124);
  if (v6)
  {
    v7 = 0.0;
    v8 = *(unsigned int *)(v5 + 124);
    do
    {
      v9 = *(float *)v5;
      v5 += 4;
      v7 = v7 + v9;
      --v8;
    }
    while (v8);
    if (v6 >= 2)
      v7 = v7 / (float)v6;
  }
  else
  {
    v7 = 0.0;
  }
  xpc_dictionary_set_double(v2, "mean", v7);
  return v2;
}

xpc_object_t ___ZZN5Phase14SpatialModeler9Telemetry4SendEvENK3__1clIPKcNSt3__15arrayIjLm19EEEEEDaT_RT0__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = xpc_dictionary_create(0, 0, 0);
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  do
  {
    LODWORD(v3) = *(_DWORD *)(v5 + 4 * v4);
    xpc_dictionary_set_double(v2, Phase::SpatialModeler::kCauseNames[v4], (double)v3 / 600.0);
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v5 + 4 * v4++) = 0;
  }
  while (v4 != 19);
  return v2;
}

float Phase::Trace::YawFromAffine(float *a1)
{
  float v1;
  float v2;
  float result;
  double v4;
  float32x4_t v6;
  float v7;
  float v8;
  float v9;

  Phase::Matrix33From<float>(a1, &v6);
  if (fabsf(v8) >= 1.0)
  {
    v2 = v6.f32[0];
    v1 = -v6.f32[2];
  }
  else
  {
    v1 = v7;
    v2 = v9;
  }
  result = atan2f(v1, v2) * -57.296;
  v4 = fabsf(result);
  if (v4 >= 1.0e15 || v4 <= 1.0e-15)
    return 0.0;
  return result;
}

uint64_t Phase::Trace::PostDirectPathSpatialModelerOutput(Phase::Logger *a1, uint64_t a2, float *a3)
{
  uint64_t result;

  result = Phase::Logger::GetInstancePtr(a1);
  if (*(_BYTE *)(result + 1548))
  {
    Phase::Trace::YawFromAffine(a3);
    return kdebug_trace();
  }
  return result;
}

uint64_t Phase::Trace::PostSharedListenerTransformUpdate(Phase::Logger *a1, float *a2)
{
  uint64_t result;

  result = Phase::Logger::GetInstancePtr(a1);
  if (*(_BYTE *)(result + 1548))
  {
    Phase::Trace::YawFromAffine(a2);
    return kdebug_trace();
  }
  return result;
}

uint64_t Phase::Trace::PostSignalStatsTraceIfSignificant(Phase::Trace *this, const float *__A, vDSP_Length __N, float a4)
{
  unint64_t v6;
  uint64_t result;
  vDSP_Length v8;
  float v9;
  float __C;

  if (__N)
  {
    v6 = 0;
    while (fabsf(__A[v6]) <= 0.01)
    {
      if (__N == ++v6)
        return result;
    }
    if ((float)((float)v6 / a4) != -1.0)
    {
      __C = 0.0;
      vDSP_rmsqv(__A, 1, &__C, __N);
      log10f(__C);
      v9 = 0.0;
      v8 = 0;
      vDSP_maxmgvi(__A, 1, &v9, &v8, __N);
      log10f(v9);
      return kdebug_trace();
    }
  }
  return result;
}

void Phase::SpatialModeler::RaycastWithEnergyVsMesh(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  float32x2_t *v20;
  float32x2_t *v21;
  float32x2_t *v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  float *v33;
  float *v34;
  uint64_t v35;
  float v36;
  float *v37;
  float *v38;
  float v39;
  uint64_t v40;
  float v41;
  float *v42;
  float *v43;
  uint64_t v44;
  float v45;
  float *v46;
  float *v47;
  float v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  __int32 v55;
  uint64_t v56;
  float64x2_t v59;
  _OWORD v60[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _DWORD v64[8];
  uint64_t v65;
  int v66;
  float64x2_t v67;
  _OWORD v68[2];
  float64x2_t v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[28];
  float64_t v73;
  float v74;
  char v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v66 = -1;
  v4 = *a4;
  v5 = **(_QWORD **)(a4[1] + 120);
  v6 = *(_QWORD *)(*(_QWORD *)(**(_QWORD **)(v5 + 16) + 16 * *(_QWORD *)(v5 + 24)) + 8);
  v7 = a3[1].f32[0];
  v8 = a3[3].f32[0];
  v59 = vcvtq_f64_f32(*a3);
  *(double *)v60 = v7;
  *(float64x2_t *)((char *)v60 + 8) = vcvtq_f64_f32(a3[2]);
  *((double *)&v60[1] + 1) = v8;
  v9 = *(_QWORD *)(v5 + 56);
  v10 = **(_QWORD **)(v5 + 48);
  v11 = *(_QWORD **)(v10 + 16 * v9);
  if (v11[3])
  {
    v56 = v4;
    v13 = 0;
    v14 = -1.0;
    v15 = 3.4028e38;
    do
    {
      v16 = v11[1] + v11[4] * v13;
      if (*(_DWORD *)(v16 + 24) != 1)
        __assert_rtn("RaycastVsMesh", "GeoRaycastUtility.hpp", 533, "MeshTopology::Triangles == submesh.mTopology");
      v17 = *(_QWORD *)(*(_QWORD *)(**(_QWORD **)(v16 + 48) + 16 * *(_QWORD *)(v16 + 56)) + 24);
      if (v17)
      {
        v18 = 0;
        v19 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(**(_QWORD **)(v16 + 32) + 16 * *(_QWORD *)(v16 + 40)) + 8)
                             + 8);
        do
        {
          v20 = (float32x2_t *)(v6 + 12 * *(v19 - 2));
          v21 = (float32x2_t *)(v6 + 12 * *(v19 - 1));
          v22 = (float32x2_t *)(v6 + 12 * *v19);
          v67 = vcvtq_f64_f32(*v20);
          *(double *)v68 = v20[1].f32[0];
          *(float64x2_t *)((char *)v68 + 8) = vcvtq_f64_f32(*v21);
          *((double *)&v68[1] + 1) = v21[1].f32[0];
          v69 = vcvtq_f64_f32(*v22);
          *(double *)&v70 = v22[1].f32[0];
          Phase::Intersection<double>(v67.f64, v59.f64, (uint64_t)&v73);
          if (v75 && v73 < a3[3].f32[1] && v73 > a3[1].f32[1])
          {
            if (v13 >= 0x100)
              std::terminate();
            v23 = v73;
            v15 = fminf(v15, v23);
            v14 = fmaxf(v14, v23);
            v66 = ((_DWORD)v13 << 24) | v18;
          }
          v19 += 3;
          ++v18;
        }
        while (v17 != v18);
        v9 = *(_QWORD *)(v5 + 56);
        v10 = **(_QWORD **)(v5 + 48);
      }
      ++v13;
      v11 = *(_QWORD **)(v10 + 16 * v9);
    }
    while (v13 < v11[3]);
    if (v14 > v15)
    {
      v24 = **(_QWORD **)(a4[1] + 120);
      v65 = 0;
      Phase::Geometry::GetMaterials(v24, (unint64_t)&v66, 1, &v65, 1, 1);
      if (*(_DWORD *)(a1 + 88) > v65)
      {
        v25 = *(_QWORD *)(a1 + 72);
        if (*(_DWORD *)(v25 + 24 * v65 + 20) == HIDWORD(v65))
        {
          v26 = *(_QWORD *)(v25 + 24 * v65);
          if (v26)
          {
            if (*(_DWORD *)v26 == 1)
            {
              v27 = *(_QWORD *)(*(_QWORD *)(v26 + 40) + 40 * a3[5].i32[1]);
              if (v27)
              {
                v28 = (float)(v14 - v15) * *(float *)(v56 + 76);
                a3[7].f32[1] = a3[7].f32[1] + v28;
                v29 = v28 / *(float *)(v27 + 272);
                if (v29 <= 1.0)
                {
                  v40 = *(unsigned int *)(v27 + 268);
                  v67 = 0u;
                  memset(v68, 0, sizeof(v68));
                  v69 = 0u;
                  v70 = 0u;
                  v71 = 0u;
                  memset(v72, 0, sizeof(v72));
                  if ((_DWORD)v40)
                  {
                    v41 = 1.0 - (float)((float)(1.0 - v29) * (float)(1.0 - v29));
                    v42 = (float *)(v27 + 144);
                    v43 = (float *)&v67;
                    v44 = v40;
                    do
                    {
                      v45 = *v42++;
                      *v43++ = v41 * v45;
                      --v44;
                    }
                    while (v44);
                    v63 = 0u;
                    memset(v64, 0, 28);
                    v61 = 0u;
                    v62 = 0u;
                    memset(v60, 0, sizeof(v60));
                    v46 = (float *)&v59;
                    v47 = (float *)&v67;
                    v59 = 0u;
                    do
                    {
                      v48 = *v47++;
                      *v46++ = fmaxf(v48, 0.0);
                      --v40;
                    }
                    while (v40);
LABEL_36:
                    v49 = 0;
                    v50 = 0;
                    v51 = 0;
                    v73 = v59.f64[0];
                    v74 = *(float *)&v59.f64[1];
                    v67.f64[0] = 0.0;
                    LODWORD(v67.f64[1]) = 0;
                    do
                    {
                      if (v51 <= 2)
                      {
                        v50 = v51 + 1;
                        *((_DWORD *)v67.f64 + v51++) = *(_DWORD *)((char *)&v73 + v49);
                      }
                      v49 += 4;
                    }
                    while (v49 != 12);
                    if (v50 <= 2)
                      bzero((char *)&v67 + 4 * v50, 12 - 4 * v50);
                    v52 = 0;
                    v53 = 0;
                    v54 = 0;
                    v73 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v67.f64[0], a3[6]));
                    v74 = *(float *)&v67.f64[1] + a3[7].f32[0];
                    v67.f64[0] = 0.0;
                    LODWORD(v67.f64[1]) = 0;
                    do
                    {
                      if (v54 <= 2)
                      {
                        v53 = v54 + 1;
                        *((_DWORD *)v67.f64 + v54++) = *(_DWORD *)((char *)&v73 + v52);
                      }
                      v52 += 4;
                    }
                    while (v52 != 12);
                    if (v53 <= 2)
                      bzero((char *)&v67 + 4 * v53, 12 - 4 * v53);
                    v55 = LODWORD(v67.f64[1]);
                    a3[6] = *(float32x2_t *)&v67.f64[0];
                    a3[7].i32[0] = v55;
                    return;
                  }
                }
                else
                {
                  v30 = log2f(v29);
                  v31 = *(unsigned int *)(v27 + 268);
                  v67 = 0u;
                  memset(v68, 0, sizeof(v68));
                  v69 = 0u;
                  v70 = 0u;
                  v71 = 0u;
                  memset(v72, 0, sizeof(v72));
                  if ((_DWORD)v31)
                  {
                    v32 = v30 * 6.0206;
                    v33 = (float *)(v27 + 144);
                    v34 = (float *)&v67;
                    v35 = v31;
                    do
                    {
                      v36 = *v33++;
                      *v34++ = v32 + v36;
                      --v35;
                    }
                    while (v35);
                    v63 = 0u;
                    memset(v64, 0, 28);
                    v61 = 0u;
                    v62 = 0u;
                    memset(v60, 0, sizeof(v60));
                    v37 = (float *)&v59;
                    v38 = (float *)&v67;
                    v59 = 0u;
                    do
                    {
                      v39 = *v38++;
                      *v37++ = fmaxf(v39, 0.0);
                      --v31;
                    }
                    while (v31);
                    goto LABEL_36;
                  }
                }
                memset(v64, 0, sizeof(v64));
                v62 = 0uLL;
                v63 = 0uLL;
                v61 = 0uLL;
                v59 = 0uLL;
                memset(v60, 0, sizeof(v60));
                goto LABEL_36;
              }
            }
          }
        }
      }
    }
  }
}

float Phase::SpatialModeler::RaycastWithEnergyVsVoxelTree(uint64_t a1, double a2, double a3, double a4, double a5, double a6, float64x2_t a7, uint64_t a8, float32x2_t *a9, uint64_t *a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  float v29;
  float *v30;
  float *v31;
  uint64_t v32;
  float v33;
  float *v34;
  float *v35;
  float v36;
  uint64_t v37;
  float v38;
  float *v39;
  float *v40;
  uint64_t v41;
  float v42;
  float *v43;
  float *v44;
  float v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _DWORD v59[8];
  uint64_t v60;
  _QWORD v61[3];
  unsigned int v62;
  float v63;
  float v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[28];
  float32x2_t v72;
  float v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v63 = -1.0;
  v64 = 3.4028e38;
  v62 = -1;
  v61[0] = &v64;
  v61[1] = &v63;
  v61[2] = &v62;
  v11 = *a10;
  v10 = a10[1];
  v12 = **(_QWORD **)(v10 + 120);
  *(_QWORD *)&v65 = v61;
  *((_QWORD *)&v65 + 1) = v10;
  v13 = *(_QWORD *)(v12 + 48);
  v14 = **(_QWORD **)(v12 + 40);
  v15 = *(_QWORD **)(v14 + 16 * v13);
  if (v15[3])
  {
    v19 = 0;
    do
    {
      v20 = v15[1] + v15[4] * v19;
      if (*(_QWORD *)(*(_QWORD *)(**(_QWORD **)(v20 + 40) + 16 * *(_QWORD *)(v20 + 48)) + 24))
      {
        _ZN5Phase8Geometry7details21RaycastVsVoxelSubtreeILb0ERKZNS0_18RaycastVsVoxelTreeILb0ERZNS_14SpatialModeler28RaycastWithEnergyVsVoxelTreeERNS0_11SystemStateERNS0_15SceneQueryBatchERNS0_10SceneQueryERNS0_20SceneQueryShapeStateEE3__0EEvS6_RNS0_12RaycastInputERKNS0_5ShapeEOT0_EUlT_SK_T1_E_EEvS6_SG_RKNS0_12VoxelSubtreeESL_(a9, v20, (float ***)&v65, a2, a3, a4, a5, a6, a7);
        v13 = *(_QWORD *)(v12 + 48);
        v14 = **(_QWORD **)(v12 + 40);
      }
      ++v19;
      v15 = *(_QWORD **)(v14 + 16 * v13);
    }
    while (v15[3] > v19);
    *(float *)&a2 = v63;
    if (v63 > v64)
    {
      v21 = **(_QWORD **)(a10[1] + 120);
      v60 = 0;
      Phase::Geometry::GetMaterials(v21, &v62, 1, &v60, 1, 1);
      if (*(_DWORD *)(a1 + 88) > v60)
      {
        v22 = *(_QWORD *)(a1 + 72);
        if (*(_DWORD *)(v22 + 24 * v60 + 20) == HIDWORD(v60))
        {
          v23 = *(_QWORD *)(v22 + 24 * v60);
          if (v23)
          {
            if (*(_DWORD *)v23 == 1)
            {
              v24 = *(_QWORD *)(*(_QWORD *)(v23 + 40) + 40 * a9[5].i32[1]);
              if (v24)
              {
                v25 = (float)(v63 - v64) * *(float *)(v11 + 76);
                a9[7].f32[1] = a9[7].f32[1] + v25;
                v26 = v25 / *(float *)(v24 + 272);
                if (v26 <= 1.0)
                {
                  v37 = *(unsigned int *)(v24 + 268);
                  v65 = 0u;
                  v66 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  v70 = 0u;
                  memset(v71, 0, sizeof(v71));
                  if ((_DWORD)v37)
                  {
                    v38 = 1.0 - (float)((float)(1.0 - v26) * (float)(1.0 - v26));
                    v39 = (float *)(v24 + 144);
                    v40 = (float *)&v65;
                    v41 = v37;
                    do
                    {
                      v42 = *v39++;
                      *v40++ = v38 * v42;
                      --v41;
                    }
                    while (v41);
                    v58 = 0u;
                    memset(v59, 0, 28);
                    v56 = 0u;
                    v57 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v43 = (float *)&v53;
                    v44 = (float *)&v65;
                    v53 = 0u;
                    do
                    {
                      v45 = *v44++;
                      *v43++ = fmaxf(v45, 0.0);
                      --v37;
                    }
                    while (v37);
LABEL_26:
                    v46 = 0;
                    v47 = 0;
                    v48 = 0;
                    v72 = (float32x2_t)v53;
                    v73 = *((float *)&v53 + 2);
                    *(_QWORD *)&v65 = 0;
                    DWORD2(v65) = 0;
                    do
                    {
                      if (v48 <= 2)
                      {
                        v47 = v48 + 1;
                        *((_DWORD *)&v65 + v48++) = v72.i32[v46];
                      }
                      ++v46;
                    }
                    while (v46 != 3);
                    if (v47 <= 2)
                      bzero((char *)&v65 + 4 * v47, 12 - 4 * v47);
                    v49 = 0;
                    v50 = 0;
                    v51 = 0;
                    v72 = vadd_f32(*(float32x2_t *)&v65, a9[6]);
                    v73 = *((float *)&v65 + 2) + a9[7].f32[0];
                    *(_QWORD *)&v65 = 0;
                    DWORD2(v65) = 0;
                    do
                    {
                      if (v51 <= 2)
                      {
                        v50 = v51 + 1;
                        *((_DWORD *)&v65 + v51++) = v72.i32[v49];
                      }
                      ++v49;
                    }
                    while (v49 != 3);
                    if (v50 <= 2)
                      bzero((char *)&v65 + 4 * v50, 12 - 4 * v50);
                    LODWORD(a2) = DWORD2(v65);
                    a9[6] = (float32x2_t)v65;
                    a9[7].i32[0] = LODWORD(a2);
                    return *(float *)&a2;
                  }
                }
                else
                {
                  v27 = log2f(v26);
                  v28 = *(unsigned int *)(v24 + 268);
                  v65 = 0u;
                  v66 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  v70 = 0u;
                  memset(v71, 0, sizeof(v71));
                  if ((_DWORD)v28)
                  {
                    v29 = v27 * 6.0206;
                    v30 = (float *)(v24 + 144);
                    v31 = (float *)&v65;
                    v32 = v28;
                    do
                    {
                      v33 = *v30++;
                      *v31++ = v29 + v33;
                      --v32;
                    }
                    while (v32);
                    v58 = 0u;
                    memset(v59, 0, 28);
                    v56 = 0u;
                    v57 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v34 = (float *)&v53;
                    v35 = (float *)&v65;
                    v53 = 0u;
                    do
                    {
                      v36 = *v35++;
                      *v34++ = fmaxf(v36, 0.0);
                      --v28;
                    }
                    while (v28);
                    goto LABEL_26;
                  }
                }
                memset(v59, 0, sizeof(v59));
                v57 = 0uLL;
                v58 = 0uLL;
                v55 = 0uLL;
                v56 = 0uLL;
                v53 = 0uLL;
                v54 = 0uLL;
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
  }
  return *(float *)&a2;
}

void Phase::SpatialModeler::RaycastWithEnergyVsScene(uint64_t a1, uint64_t a2, float *a3, _QWORD *a4, int a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  float *v10;
  float *v11;
  float32x2_t **v12;
  unsigned int v13;
  float32x2_t **v14;
  float32x2_t *v15;
  float32x2_t **v16;
  unint64_t v17;
  __int128 *v18;
  _QWORD *i;
  _QWORD *v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  __int32 v26;
  float v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  float v31;
  uint64_t v32;
  BOOL v33;
  float v34;
  float v35;
  float32x2_t **v36;
  float32x2_t **v37;
  float *v38;
  uint64_t v40;
  _QWORD v41[2];
  __int128 v42;
  _BYTE v43[12];
  float v44;
  __int128 v45;
  __int128 v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  float32x2_t v52;
  float v53;
  __int32 v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v52 = 0;
    v53 = 0.0;
    *(_QWORD *)&v42 = 0;
    DWORD2(v42) = 0;
    do
    {
      if (v8 <= 2)
      {
        v7 = v8 + 1;
        *(_DWORD *)&v43[4 * v8++ - 16] = v52.i32[v6];
      }
      ++v6;
    }
    while (v6 != 3);
    if (v7 <= 2)
    {
      v9 = a2;
      v10 = a3;
      bzero(&v43[4 * v7 - 16], 12 - 4 * v7);
      a2 = v9;
      a3 = v10;
    }
    HIDWORD(v42) = 0;
    a3[16] = 0.0;
    *((_OWORD *)a3 + 3) = v42;
  }
  v11 = a3 + 8;
  v48 = *((_QWORD *)a3 + 4);
  v49 = *((_DWORD *)a3 + 10);
  v12 = *(float32x2_t ***)(a1 + 120);
  v13 = *(_DWORD *)(a1 + 136);
  v14 = &v12[3 * v13];
  if (v13)
  {
    v15 = *v12;
    if (!*v12)
    {
      v16 = v12 + 3;
      while (1)
      {
        v12 = v16;
        if (v16 >= v14)
          break;
        v16 += 3;
        v15 = *v12;
        if (*v12)
          goto LABEL_17;
      }
      v15 = 0;
    }
LABEL_17:
    v17 = (unint64_t)v14;
  }
  else
  {
    v15 = 0;
    v17 = *(_QWORD *)(a1 + 120);
  }
  if (v12 != v14)
  {
    v18 = (__int128 *)(a3 + 12);
    v37 = v14;
    v38 = a3;
    v40 = a2;
    do
    {
      if (v15)
      {
        if (v15->i32[0] == 4 && (v15[18].i32[0] & *(_DWORD *)(a2 + 72)) != 0)
        {
          v20 = (_QWORD *)v15[15];
          for (i = (_QWORD *)v15[16]; v20 != i; ++v20)
          {
            if (*(_DWORD *)(a1 + 112) > *v20)
            {
              v21 = *(_QWORD *)(a1 + 96);
              if (*(_DWORD *)(v21 + 24 * *v20 + 20) == HIDWORD(*v20))
              {
                v22 = *(unsigned int **)(v21 + 24 * *v20);
                if (v22)
                {
                  if ((v22[4] & *(_DWORD *)(a2 + 72)) != 0)
                  {
                    v23 = *a4 + 32 * *v22;
                    v25 = *(_QWORD *)(v23 + 24);
                    v24 = (_QWORD *)(v23 + 24);
                    if (v25)
                    {
                      v41[0] = v15;
                      v41[1] = v22;
                      v42 = *(_OWORD *)a3;
                      *(float *)v43 = a3[4];
                      *(_QWORD *)&v43[4] = *(_QWORD *)(a3 + 5);
                      v44 = a3[7];
                      v45 = *(_OWORD *)v11;
                      v46 = *v18;
                      v47 = *((_DWORD *)v18 + 4);
                      Phase::TransformPositionByInverse<float>(v15 + 6, (float32x2_t *)&v42, (float *)&v52);
                      *(float32x2_t *)&v42 = v52;
                      *((float *)&v42 + 2) = v53;
                      v26 = v15[7].i32[1];
                      v27 = -v15[7].f32[0];
                      v52 = vneg_f32(v15[6]);
                      v53 = v27;
                      v54 = v26;
                      Phase::operator*<float>((float *)&v52, (float *)v43, (float *)&v50);
                      v28 = 0;
                      v29 = 0;
                      v30 = 0;
                      *(_QWORD *)v43 = v50;
                      v31 = 1.0 / v15[9].f32[1];
                      *((float *)&v42 + 3) = *((float *)&v42 + 3) * v31;
                      *(_DWORD *)&v43[8] = v51;
                      v44 = v31 * v44;
                      v50 = 0;
                      v51 = 0;
                      v52 = 0;
                      v53 = 0.0;
                      do
                      {
                        if (v30 <= 2)
                        {
                          v29 = v30 + 1;
                          v52.i32[v30++] = *(_DWORD *)((char *)&v50 + v28);
                        }
                        v28 += 4;
                      }
                      while (v28 != 12);
                      if (v29 <= 2)
                        bzero((char *)&v52 + 4 * v29, 12 - 4 * v29);
                      *(float32x2_t *)&v46 = v52;
                      *((_QWORD *)&v46 + 1) = LODWORD(v53);
                      if (!*v24)
                        std::__throw_bad_function_call[abi:ne180100]();
                      (*(void (**)(_QWORD, uint64_t, uint64_t, __int128 *, _QWORD *))(*(_QWORD *)*v24 + 48))(*v24, a1, v40, &v42, v41);
                      v32 = 0;
                      v14 = v37;
                      a3 = v38;
                      v38[15] = *((float *)&v46 + 3) + v38[15];
                      v33 = 1;
                      do
                      {
                        while (1)
                        {
                          v34 = *((float *)&v46 + v32) + *((float *)v18 + v32);
                          *((float *)v18 + v32) = v34;
                          if (v33)
                            break;
                          v33 = 0;
                          if (++v32 == 3)
                            goto LABEL_44;
                        }
                        v35 = v11[v32];
                        v33 = v34 > v35;
                        ++v32;
                      }
                      while (v32 != 3);
                      if (v34 > v35)
                        v38[7] = -1.0;
LABEL_44:
                      a2 = v40;
                    }
                  }
                }
              }
            }
          }
        }
      }
      if ((unint64_t)v12 < v17)
      {
        v36 = v12 + 3;
        while (1)
        {
          v12 = v36;
          if ((unint64_t)v36 >= v17)
            break;
          v36 += 3;
          v15 = *v12;
          if (*v12)
            goto LABEL_52;
        }
        v15 = 0;
      }
LABEL_52:
      ;
    }
    while (v12 != v14);
  }
  *(_QWORD *)v11 = v48;
  *((_DWORD *)v11 + 2) = v49;
}

uint64_t Phase::SpatialModeler::IterateTraceWithEnergyBatch(Phase::Logger *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  if (!*(_QWORD *)(a3 + 88))
    __assert_rtn("IterateTraceWithEnergyBatch", "TraceWithEnergy.cpp", 277, "inSceneQueryFunctionTable.mTestScene");
  std::shared_ptr<Phase::Job>::reset[abi:ne180100]((_QWORD *)(a2 + 8));
  Phase::Geometry::RunSceneQueriesOnRange(a1, a2, a3, 0, *(_DWORD *)(a2 + 96));
  Phase::SpatialModeler::CalculateFinalEnergyLoss((uint64_t)a1, a2);
  atomic_store(3u, (unsigned int *)a2);
  atomic_store(2u, (unsigned int *)(a2 + 4));
  result = *(_QWORD *)(a2 + 48);
  if (result)
  {
    v7 = a2;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v7);
  }
  return result;
}

void Phase::SpatialModeler::CalculateFinalEnergyLoss(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unsigned int v11;
  unsigned int v12;
  float v13;
  int v14;
  uint64_t v15;
  float32x2_t *v16;
  float v17;
  uint64_t v18;
  float32x2_t v19;
  float v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  float v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  float32x2_t *v32;
  __int32 v33;
  _OWORD v34[8];
  float32x2_t v35;
  float v36;
  _OWORD v37[7];
  __int128 v38;
  float32x2_t v39;
  float v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 152);
  if (*(_DWORD *)(a1 + 64) > v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (*(_DWORD *)(v4 + 24 * v3 + 20) == HIDWORD(v3))
    {
      v5 = *(_QWORD *)(v4 + 24 * *(_QWORD *)(a1 + 152));
      if (v5)
      {
        if (*(_DWORD *)v5 == 1)
        {
          v6 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 40);
          v7 = *(_OWORD *)(v6 + 224);
          v37[4] = *(_OWORD *)(v6 + 208);
          v37[5] = v7;
          v8 = *(_OWORD *)(v6 + 256);
          v37[6] = *(_OWORD *)(v6 + 240);
          v38 = v8;
          v9 = *(_OWORD *)(v6 + 160);
          v37[0] = *(_OWORD *)(v6 + 144);
          v37[1] = v9;
          v10 = *(_OWORD *)(v6 + 192);
          v37[2] = *(_OWORD *)(v6 + 176);
          v37[3] = v10;
          v11 = *(_DWORD *)(a2 + 96);
          if (v11)
          {
            v12 = 0;
            v13 = *(float *)(v6 + 272);
            v14 = HIDWORD(v38);
            v15 = 4 * HIDWORD(v38);
            do
            {
              v16 = (float32x2_t *)(*(_QWORD *)(a2 + 88) + *(_DWORD *)(a2 + 100) * v12);
              v17 = (float)(v16[3].f32[1] - v16[1].f32[1]) - v16[7].f32[1];
              if (v17 > 0.0)
              {
                memset(v34, 0, 124);
                if (v14)
                {
                  v18 = 0;
                  do
                  {
                    *(float *)((char *)v34 + v18) = v17 * *(float *)((char *)v37 + v18);
                    v18 += 4;
                  }
                  while (v15 != v18);
                  v19 = *(float32x2_t *)&v34[0];
                  v20 = *((float *)v34 + 2);
                }
                else
                {
                  v19 = 0;
                  v20 = 0.0;
                }
                v21 = 0;
                v22 = 0;
                v23 = 0;
                v39 = v19;
                v40 = v20;
                v35 = 0;
                v36 = 0.0;
                do
                {
                  if (v23 <= 2)
                  {
                    v22 = v23 + 1;
                    v35.i32[v23++] = v39.i32[v21];
                  }
                  ++v21;
                }
                while (v21 != 3);
                if (v22 <= 2)
                  bzero((char *)&v35 + 4 * v22, 12 - 4 * v22);
                v24 = 0;
                v25 = 0;
                v26 = 0;
                v39 = vadd_f32(v35, v16[6]);
                v40 = v36 + v16[7].f32[0];
                v35 = 0;
                v36 = 0.0;
                do
                {
                  if (v26 <= 2)
                  {
                    v25 = v26 + 1;
                    v35.i32[v26++] = v39.i32[v24];
                  }
                  ++v24;
                }
                while (v24 != 3);
                if (v25 <= 2)
                  bzero((char *)&v35 + 4 * v25, 12 - 4 * v25);
                v27 = v36;
                v16[6] = v35;
                v16[7].f32[0] = v27;
                v16[8].f32[0] = v17 / v13;
                v11 = *(_DWORD *)(a2 + 96);
              }
              ++v12;
            }
            while (v12 < v11);
          }
        }
      }
    }
  }
  if (*(_DWORD *)(a2 + 96))
  {
    v28 = 0;
    do
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = (float32x2_t *)(*(_QWORD *)(a2 + 88) + *(_DWORD *)(a2 + 100) * v28);
      *(float32x2_t *)&v37[0] = vminnm_f32(v32[6], v32[4]);
      DWORD2(v37[0]) = fminf(v32[7].f32[0], v32[5].f32[0]);
      *(_QWORD *)&v34[0] = 0;
      DWORD2(v34[0]) = 0;
      do
      {
        if (v31 <= 2)
        {
          v30 = v31 + 1;
          *((_DWORD *)v34 + v31++) = *(_DWORD *)((char *)v37 + v29);
        }
        v29 += 4;
      }
      while (v29 != 12);
      if (v30 <= 2)
        bzero((char *)v34 + 4 * v30, 12 - 4 * v30);
      v33 = DWORD2(v34[0]);
      v32[6] = *(float32x2_t *)&v34[0];
      v32[7].i32[0] = v33;
      ++v28;
    }
    while (v28 < *(_DWORD *)(a2 + 96));
  }
}

void Phase::SpatialModeler::RunTraceWithEnergyBatchAsync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  int v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  BOOL v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  void *__p[2];
  char v46;
  __int128 v47;

  if (!*(_QWORD *)(a3 + 88))
    __assert_rtn("IterateBatchAsync", "GeoSceneQueryUtility.hpp", 85, "inSceneQueryFunctionTable.mTestScene");
  v6 = *(unsigned __int8 *)(a2 + 80);
  if (v6 <= 0xC0)
    v7 = v6 > 0x3F;
  else
    v7 = 2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 1016) + 2416);
  std::string::basic_string[abi:ne180100]<0>(__p, "GeoBatch");
  (*(void (**)(__int128 *__return_ptr, uint64_t, void **))(*(_QWORD *)v8 + 16))(&v47, v8, __p);
  std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100](a2 + 8, &v47);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
  if (*((_QWORD *)&v47 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v46 < 0)
    operator delete(__p[0]);
  v12 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v12 + 256) = &off_24D582078;
  *(_QWORD *)(v12 + 264) = Phase::SpatialModeler::CompleteTraceWithEnergyBatch;
  *(_QWORD *)(v12 + 272) = a1;
  *(_QWORD *)(v12 + 280) = a2;
  *(_BYTE *)(v12 + 383) = 1;
  atomic_store(1u, (unsigned __int8 *)(v12 + 40));
  v13 = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(v13 + 524) = v7;
  atomic_store(1u, (unsigned __int8 *)(v13 + 40));
  v14 = *(_DWORD *)(a2 + 96);
  if (v14)
  {
    v15 = 0;
    v16 = v14 >> 4;
    v17 = *(_DWORD *)(a2 + 96) & 0xF;
    do
    {
      v18 = v15;
      v19 = v17 <= 0;
      if (v17 <= 0)
        v17 = 0;
      else
        --v17;
      if (v19)
        v15 += v16;
      else
        v15 += v16 + 1;
      std::string::basic_string[abi:ne180100]<0>(__p, "GeoTestScene");
      (*(void (**)(__int128 *__return_ptr, uint64_t, void **))(*(_QWORD *)v8 + 16))(&v47, v8, __p);
      if (v46 < 0)
        operator delete(__p[0]);
      v20 = v47;
      *(_QWORD *)(v47 + 256) = &off_24D57D3D0;
      *(_QWORD *)(v20 + 264) = Phase::Geometry::RunSceneQueriesOnRange;
      *(_QWORD *)(v20 + 272) = a1;
      *(_QWORD *)(v20 + 280) = a2;
      *(_QWORD *)(v20 + 288) = a3;
      *(_DWORD *)(v20 + 296) = v18;
      *(_DWORD *)(v20 + 300) = v15;
      *(_BYTE *)(v20 + 383) = 1;
      atomic_store(1u, (unsigned __int8 *)(v20 + 40));
      *(_DWORD *)(v20 + 524) = v7;
      atomic_store(1u, (unsigned __int8 *)(v20 + 40));
      v21 = *(std::__shared_weak_count **)(a2 + 16);
      v43 = *(_QWORD *)(a2 + 8);
      v44 = v21;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldxr(p_shared_owners);
        while (__stxr(v23 + 1, p_shared_owners));
      }
      v41 = v20;
      v42 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
      if (*((_QWORD *)&v47 + 1))
      {
        v24 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v8 + 24))(v8, &v43, &v41);
      v26 = v42;
      if (v42)
      {
        v27 = (unint64_t *)&v42->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v29 = v44;
      if (v44)
      {
        v30 = (unint64_t *)&v44->__shared_owners_;
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      v32 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
      if (*((_QWORD *)&v47 + 1))
      {
        v33 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
    }
    while (v15 < *(_DWORD *)(a2 + 96));
  }
  v35 = *(void **)(a2 + 8);
  v36 = *(std::__shared_weak_count **)(a2 + 16);
  __p[0] = v35;
  __p[1] = v36;
  if (v36)
  {
    v37 = (unint64_t *)&v36->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  Phase::JobManager::RunJobAsync(v8, (uint64_t *)__p);
  if (v36)
  {
    v39 = (unint64_t *)&v36->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
}

void sub_2166E21DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21)
{
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v24;

  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Phase::SpatialModeler::TraceWithEnergyQuery::RegisterQuery(Phase::SpatialModeler::TraceWithEnergyQuery *this, Phase::Geometry::System *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (***v6)();
  uint64_t v7;
  uint64_t (***v8)();
  uint64_t v9;
  uint64_t (***v10)();
  uint64_t v11;
  uint64_t (***v12)();
  uint64_t v13;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t (**v17)();
  void *v18;
  uint64_t (***v19)();
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)((char *)this + 2288);
  v17 = &off_24D57D8A8;
  v18 = Phase::SpatialModeler::IterateTraceWithEnergyBatch;
  v19 = &v17;
  v15[0] = &off_24D57D8A8;
  v15[1] = Phase::SpatialModeler::RunTraceWithEnergyBatchAsync;
  v16 = v15;
  v3 = Phase::Geometry::SceneQueryTypeRegistry::RegisterNewType((_QWORD *)this + 286, (uint64_t)&v17, (uint64_t)v15);
  v4 = v16;
  if (v16 == v15)
  {
    v5 = 4;
    v4 = v15;
  }
  else
  {
    if (!v16)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v6 = v19;
  if (v19 == &v17)
  {
    v7 = 4;
    v6 = &v17;
  }
  else
  {
    if (!v19)
      goto LABEL_11;
    v7 = 5;
  }
  (*v6)[v7]();
LABEL_11:
  v17 = &off_24D57D8F0;
  v18 = Phase::SpatialModeler::RaycastWithEnergyVsScene;
  v19 = &v17;
  Phase::Geometry::SceneQueryTypeRegistry::CustomizeType((uint64_t)v2, v3, (uint64_t)&v17);
  v8 = v19;
  if (v19 == &v17)
  {
    v9 = 4;
    v8 = &v17;
  }
  else
  {
    if (!v19)
      goto LABEL_16;
    v9 = 5;
  }
  (*v8)[v9]();
LABEL_16:
  v17 = &off_24D57D938;
  v18 = Phase::SpatialModeler::RaycastWithEnergyVsMesh;
  v19 = &v17;
  Phase::Geometry::SceneQueryTypeRegistry::CustomizeType(v2, v3, 1u, (uint64_t)&v17);
  v10 = v19;
  if (v19 == &v17)
  {
    v11 = 4;
    v10 = &v17;
  }
  else
  {
    if (!v19)
      goto LABEL_21;
    v11 = 5;
  }
  (*v10)[v11]();
LABEL_21:
  v17 = &off_24D57D938;
  v18 = Phase::SpatialModeler::RaycastWithEnergyVsVoxelTree;
  v19 = &v17;
  Phase::Geometry::SceneQueryTypeRegistry::CustomizeType(v2, v3, 2u, (uint64_t)&v17);
  v12 = v19;
  if (v19 == &v17)
  {
    v13 = 4;
    v12 = &v17;
    goto LABEL_25;
  }
  if (v19)
  {
    v13 = 5;
LABEL_25:
    (*v12)[v13]();
  }
  return v3;
}

void sub_2166E24D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void _ZN5Phase8Geometry7details21RaycastVsVoxelSubtreeILb0ERKZNS0_18RaycastVsVoxelTreeILb0ERZNS_14SpatialModeler28RaycastWithEnergyVsVoxelTreeERNS0_11SystemStateERNS0_15SceneQueryBatchERNS0_10SceneQueryERNS0_20SceneQueryShapeStateEE3__0EEvS6_RNS0_12RaycastInputERKNS0_5ShapeEOT0_EUlT_SK_T1_E_EEvS6_SG_RKNS0_12VoxelSubtreeESL_(float32x2_t *a1, uint64_t a2, float ***a3, double a4, double a5, double a6, double a7, double a8, float64x2_t a9)
{
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  unint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  double v26;
  double v27;
  _QWORD *v29;
  uint64_t v30;
  float **v31;
  float v32;
  float v33;
  size_t v34;
  char *v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  int8x16_t v45;
  double v46;
  float64x2_t v47;
  double v48;
  float32x2_t *v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  int32x4_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int32x4_t v59;
  int64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  int64x2_t v63;
  int32x4_t v64;
  unint64_t v65;
  float64x2_t v66;
  float64x2_t v67;
  uint64_t v68;
  int8x16_t v69;
  uint64_t v70;
  float32x2_t *v71;
  int v72;
  char *v73;
  int8x16_t v74;
  int8x16_t v75;
  int64x2_t v76;
  double v77;
  unint64_t *v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  int32x4_t v82;
  unsigned __int128 v83;
  int32x4_t v84;
  uint32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int64x2_t v88;
  float64x2_t v89;
  double v90;
  int v91;
  int8x16_t v92;
  int8x16_t v93;
  int8x16_t v94;
  int32x4_t v95;
  float64x2_t v96;
  float64x2_t v97;
  const float *v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  unsigned __int8 v102;
  uint8x8_t v103;
  __int32 v104;
  float64x2_t v105;
  int32x4_t v106;
  int32x4_t v107;
  unint64_t *v108;
  unint64_t v109;
  int32x4_t v110;
  unsigned __int128 v111;
  int32x4_t v112;
  int64x2_t v113;
  float64x2_t v114;
  float **v115;
  float v116;
  float v117;
  int32x4_t v118;
  int8x16_t v119;
  int32x4_t v120;
  int8x16_t v121;
  uint32x4_t v122;
  float64x2_t v123;
  float64x2_t v124;
  NSObject *v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  int8x16_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  uint8_t buf[4];
  const char *v139;
  __int16 v140;
  int v141;
  __int16 v142;
  int v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v12 = vcvtq_f64_f32(*a1);
  v10.f64[0] = a1[1].f32[0];
  v13 = vcvtq_f64_f32(a1[2]);
  v9.f64[0] = a1[3].f32[0];
  __asm { FMOV            V16.2D, #1.0 }
  v19 = vminnmq_f64(vmaxnmq_f64(vdivq_f64(_Q16, v13), (float64x2_t)vdupq_n_s64(0xC1EFFFFFFFE00000)), (float64x2_t)vdupq_n_s64(0x41EFFFFFFFE00000uLL));
  v20 = vminnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmaxnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vdivq_f64(_Q16, v9), (float64x2_t)xmmword_2166F8490), (float64x2_t)xmmword_2166F84A0);
  v11.f64[0] = *(float *)(a2 + 8);
  a9.f64[0] = *(float *)(a2 + 20);
  v21 = vmulq_f64(v19, vsubq_f64(vcvtq_f64_f32(*(float32x2_t *)a2), v12));
  v22 = *(_OWORD *)&vmulq_f64(v20, vsubq_f64(v11, v10));
  v23 = vmulq_f64(v19, vsubq_f64(vcvtq_f64_f32(*(float32x2_t *)(a2 + 12)), v12));
  *(_QWORD *)&v20.f64[0] = *(_OWORD *)&vmulq_f64(v20, vsubq_f64(a9, v10));
  *(_QWORD *)&v24.f64[0] = *(_OWORD *)&vminnmq_f64((float64x2_t)v22, (float64x2_t)*(unint64_t *)&v20.f64[0]);
  v24.f64[1] = a1[1].f32[1];
  *(_QWORD *)&v25.f64[0] = *(_OWORD *)&vmaxnmq_f64((float64x2_t)v22, (float64x2_t)*(unint64_t *)&v20.f64[0]);
  v25.f64[1] = a1[3].f32[1];
  v26 = vpmaxq_f64(vmaxnmq_f64(vminnmq_f64(v21, v23), v24));
  v27 = vpminq_f64(vminnmq_f64(vmaxnmq_f64(v21, v23), v25));
  if (v26 <= v27)
  {
    if (v26 >= 0.0 || (v26 = 0.0, v27 > 0.0))
    {
      v29 = *(_QWORD **)(**(_QWORD **)(a2 + 40) + 16 * *(_QWORD *)(a2 + 48));
      v30 = v29[3];
      if ((_DWORD)v30 == 1)
      {
        v31 = *a3;
        v32 = v26;
        ***a3 = fminf(***a3, v32);
        v33 = v27;
        *v31[1] = fmaxf(*v31[1], v33);
        *v31[2] = 0.0;
        return;
      }
      if ((int)v30 <= 32)
      {
        v133 = (float64x2_t)xmmword_2166F84A0;
        v134 = (float64x2_t)xmmword_2166F8490;
        v130 = vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL);
        MEMORY[0x24BDAC7A8](a1);
        v35 = (char *)&v126 - v34;
        v136 = v37;
        v137 = v36;
        v135 = v38;
        v131 = v40;
        v132 = v39;
        v126 = v41;
        v127 = v42;
        v128 = v43;
        v129 = v44;
        bzero((char *)&v126 - v34, v34);
        v47.f64[1] = v135.f64[1];
        v46 = v136.f64[0];
        v48 = v137.f64[0];
        v49 = (float32x2_t *)v29[1];
        v50.f64[0] = v49[3].f32[0];
        v51 = vdivq_f64(v135, vcvtq_f64_f32(v49[2]));
        v52 = vdivq_f64(v135, v50);
        v53.f64[0] = v131.f64[0];
        *(_QWORD *)&v53.f64[1] = v130.i64[0];
        v54.f64[0] = 1073741820.0;
        v55 = (float64x2_t)vdupq_n_s64(0x41CFFFFFFF800000uLL);
        v56 = (int32x4_t)vcvtq_s64_f64(vmulq_f64(vminnmq_f64(vmaxnmq_f64(vmulq_f64(vsubq_f64(vmlaq_n_f64(v126, v53, v137.f64[0]), v129), v51), (float64x2_t)0), v135), v55));
        v57 = (int32x4_t)vcvtq_s64_f64(vmulq_f64(vminnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmaxnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmulq_f64(vsubq_f64(vmlaq_f64(v127, v137, v132), v128), v52), (float64x2_t)0), (float64x2_t)xmmword_2166F7480), v54));
        v58 = (int32x4_t)vcvtq_s64_f64(vmulq_f64(vminnmq_f64(vmaxnmq_f64(vmulq_f64(vsubq_f64(vmlaq_n_f64(v126, v53, v136.f64[0]), v129), v51), (float64x2_t)0), v135), v55));
        v59 = (int32x4_t)vcvtq_s64_f64(vmulq_f64(vminnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmaxnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmulq_f64(vsubq_f64(vmlaq_f64(v127, v136, v132), v128), v52), (float64x2_t)0), (float64x2_t)xmmword_2166F7480), v54));
        *(int32x2_t *)&v53.f64[0] = vsub_s32(vmovn_s64((int64x2_t)v58), vmovn_s64((int64x2_t)v56));
        v60.i64[0] = SLODWORD(v53.f64[0]);
        v60.i64[1] = SHIDWORD(v53.f64[0]);
        v61 = vcvtq_f64_s64(v60);
        *(int32x2_t *)&v50.f64[0] = vsub_s32(vmovn_s64((int64x2_t)v59), vmovn_s64((int64x2_t)v57));
        v60.i64[0] = SLODWORD(v50.f64[0]);
        v60.i64[1] = SHIDWORD(v50.f64[0]);
        v62 = vcvtq_f64_s64(v60);
        v63 = vceqzq_f64(v61);
        if ((vandq_s8(vandq_s8((int8x16_t)vdupq_laneq_s64(v63, 1), (int8x16_t)v63), (int8x16_t)vceqzq_f64(v62)).u64[0] & 0x8000000000000000) != 0)
        {
          *(_QWORD *)&v51.f64[1] = vextq_s8((int8x16_t)v51, (int8x16_t)v51, 8uLL).u64[0];
          v62 = vmulq_f64(vmulq_f64(v132, v52), v54);
          v61 = vmulq_f64(vmulq_f64(v131, v51), v55);
        }
        v64 = vuzp1q_s32(v56, v57);
        v65 = vextq_s8((int8x16_t)v61, (int8x16_t)v61, 8uLL).u64[0];
        v66 = vminnmq_f64(vmaxnmq_f64(vdivq_f64(v135, v61), (float64x2_t)vdupq_n_s64(0xC1EFFFFFFFE00000)), (float64x2_t)vdupq_n_s64(0x41EFFFFFFFE00000uLL));
        v67 = vminnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vmaxnmq_f64((float64x2_t)(unint64_t)*(_OWORD *)&vdivq_f64(v135, v62), v134), v133);
        if ((int)v30 >= 1)
        {
          v68 = 0;
          v69 = (int8x16_t)vcltzq_s32(vsubq_s32(vuzp1q_s32(v58, v59), v64));
          v70 = v29[4];
          v71 = v49 + 8;
          v72 = 30;
          do
          {
            v73 = &v35[v68];
            v74 = (int8x16_t)vdupq_n_s32(1 << v72);
            *((_DWORD *)v73 + 52) = v72;
            *((int8x16_t *)v73 + 3) = vorrq_s8(v74, v69);
            v75 = vorrq_s8(vandq_s8((int8x16_t)vdupq_n_s32(-(1 << v72)), v69), vbicq_s8(v74, v69));
            v76.i64[0] = v75.i32[2];
            v76.i64[1] = v75.i32[3];
            *((float64x2_t *)v73 + 9) = vmulq_f64(v67, vcvtq_f64_s64(v76));
            v76.i64[0] = v75.i32[0];
            v76.i64[1] = v75.i32[1];
            *((int8x16_t *)v73 + 7) = v75;
            *((float64x2_t *)v73 + 8) = vmulq_f64(v66, vcvtq_f64_s64(v76));
            *((_QWORD *)v73 + 27) = *(_QWORD *)(*(_QWORD *)(**(_QWORD **)&v71[-1] + 16 * *(_QWORD *)v71) + 8);
            v68 += 224;
            v71 = (float32x2_t *)((char *)v71 + v70);
            v72 -= 2;
          }
          while (224 * v30 != v68);
        }
        v77 = v46 - v48;
        v78 = (unint64_t *)*((_QWORD *)v35 + 27);
        v80 = *v78;
        v79 = v78[1];
        *((_QWORD *)v35 + 28) = v80;
        v81 = v35 + 224;
        v82 = vdupq_n_s32(*((_DWORD *)v81 + 52));
        LODWORD(v54.f64[0]) = *((_DWORD *)v81 + 52);
        v83 = *(_OWORD *)&vshlq_s32(v64, vnegq_s32(v82)) & __PAIR128__(0xFFFFFFFCFFFFFFFCLL, 0xFFFFFFFCFFFFFFFCLL);
        v84.i64[0] = 0x400000004;
        v84.i64[1] = 0x400000004;
        *((uint32x4_t *)v81 + 1) = vshlq_u32((uint32x4_t)v83, (uint32x4_t)v82);
        *((uint32x4_t *)v81 + 2) = vshlq_u32((uint32x4_t)vaddq_s32((int32x4_t)v83, v84), (uint32x4_t)v82);
        v85.i64[0] = -1;
        v85.i64[1] = -1;
        v86 = vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vshlq_u32(v85, (uint32x4_t)v54), 0), (int8x16_t)v64), *((int32x4_t *)v81 + 3));
        v87 = vsubq_s32(v86, v64);
        v88.i64[0] = v87.i32[2];
        v88.i64[1] = v87.i32[3];
        v89 = vcvtq_f64_s64(v88);
        v88.i64[0] = v87.i32[0];
        v88.i64[1] = v87.i32[1];
        *((float64x2_t *)v81 + 5) = vmulq_f64(v66, vcvtq_f64_s64(v88));
        *((float64x2_t *)v81 + 6) = vmulq_f64(v67, v89);
        *((int32x4_t *)v81 + 4) = v86;
        *((_DWORD *)v81 + 2) = v79;
        v90 = 0.0;
        v91 = 1;
        v92.i64[0] = 0x100000001;
        v92.i64[1] = 0x100000001;
        v93.i64[0] = 0x800000008;
        v93.i64[1] = 0x800000008;
        *(_QWORD *)&v61.f64[1] = v65;
        v94 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
        v95 = v64;
        while (1)
        {
          v96 = *((float64x2_t *)v81 + 5);
          v97 = *((float64x2_t *)v81 + 6);
          v47.f64[0] = fmin(fmin(v96.f64[0], v97.f64[0]), *((double *)v81 + 11));
          v98 = (const float *)(v81 + 208);
          v99 = (int32x4_t)vld1q_dup_f32(v98);
          v100 = vshlq_s32(v95, vnegq_s32(v99));
          v101 = (int32x4_t)vshlq_u32((uint32x4_t)vorrq_s8(vandq_s8((int8x16_t)vshlq_n_s32(v100, 2uLL), v93), vandq_s8((int8x16_t)v100, v92)), (uint32x4_t)xmmword_2166F84B0);
          v102 = vorrq_s8(vorrq_s8((int8x16_t)vdupq_lane_s32(*(int32x2_t *)v101.i8, 1), (int8x16_t)vdupq_laneq_s32(v101, 2)), (int8x16_t)v101).u8[0];
          if (((v80 >> v102) & 1) == 0)
            goto LABEL_17;
          v103 = (uint8x8_t)vcnt_s8((int8x8_t)(v80 & ~(-1 << v102)));
          v103.i16[0] = vaddlv_u8(v103);
          v104 = *((_DWORD *)v81 + 2) + v103.i32[0];
          if ((_DWORD)v30 - 1 == v91)
          {
            v115 = *a3;
            v116 = v48 + v77 * v90;
            ***a3 = fminf(***a3, v116);
            v117 = v48 + v77 * v47.f64[0];
            *v115[1] = fmaxf(*v115[1], v117);
            *(_DWORD *)v115[2] = v104;
LABEL_17:
            if (v47.f64[0] >= 1.0)
              return;
            v118 = (int32x4_t)vceqq_f64(*((float64x2_t *)v81 + 6), v47);
            v119 = *((int8x16_t *)v81 + 4);
            v120 = (int32x4_t)vceqq_f64(*((float64x2_t *)v81 + 5), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v47.f64[0], 0));
            v121 = (int8x16_t)vuzp1q_s32(v120, v118);
            *((int32x4_t *)v81 + 10) = v120;
            *((int32x4_t *)v81 + 11) = v118;
            *((int8x16_t *)v81 + 12) = v121;
            v95 = (int32x4_t)vbslq_s8(v121, v119, (int8x16_t)vaddq_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vmulq_n_f64(v61, v47.f64[0])), (int32x4_t)vcvtq_s64_f64(vmulq_f64(v62, v47))), v64));
            while (1)
            {
              v122 = (uint32x4_t)vorrq_s8((int8x16_t)vcgeq_s32(v95, *((int32x4_t *)v81 + 2)), (int8x16_t)vcgtq_s32(*((int32x4_t *)v81 + 1), v95));
              v122.i32[3] = v122.i32[2];
              if ((vmaxvq_u32(v122) & 0x80000000) == 0)
                break;
              if (v91 < 2)
                return;
              --v91;
              v81 -= 224;
            }
            v45.i64[0] = 0x8000000000000000;
            v123 = vaddq_f64(*((float64x2_t *)v81 + 6), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64((int64x2_t)*((unint64_t *)v81 + 22)), *((int8x16_t *)v81 + 9), v45));
            v124 = vaddq_f64(*((float64x2_t *)v81 + 5), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(*((int64x2_t *)v81 + 10)), *((int8x16_t *)v81 + 8), v94));
            *((int8x16_t *)v81 + 4) = vbslq_s8(*((int8x16_t *)v81 + 12), (int8x16_t)vaddq_s32(*((int32x4_t *)v81 + 7), *((int32x4_t *)v81 + 4)), *((int8x16_t *)v81 + 4));
            *((float64x2_t *)v81 + 5) = v124;
            *((float64x2_t *)v81 + 6) = v123;
            v80 = *(_QWORD *)v81;
            v90 = v47.f64[0];
          }
          else
          {
            v105 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v47.f64[0], 0);
            v106 = (int32x4_t)vceqq_f64(v97, v47);
            v107 = (int32x4_t)vceqq_f64(v96, v105);
            *((int32x4_t *)v81 + 10) = v107;
            *((int32x4_t *)v81 + 11) = v106;
            *((int32x4_t *)v81 + 12) = vuzp1q_s32(v107, v106);
            v108 = (unint64_t *)(*((_QWORD *)v81 + 27) + 16 * v104);
            v80 = *v108;
            v109 = v108[1];
            *((_QWORD *)v81 + 28) = v80;
            v81 += 224;
            ++v91;
            v110 = vdupq_n_s32(*((_DWORD *)v81 + 52));
            v107.i32[0] = *((_DWORD *)v81 + 52);
            v111 = *(_OWORD *)&vshlq_s32(v95, vnegq_s32(v110)) & __PAIR128__(0xFFFFFFFCFFFFFFFCLL, 0xFFFFFFFCFFFFFFFCLL);
            *((uint32x4_t *)v81 + 1) = vshlq_u32((uint32x4_t)v111, (uint32x4_t)v110);
            *((uint32x4_t *)v81 + 2) = vshlq_u32((uint32x4_t)vaddq_s32((int32x4_t)v111, v84), (uint32x4_t)v110);
            v47 = (float64x2_t)vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vshlq_u32(v85, (uint32x4_t)v107), 0), (int8x16_t)v95), *((int32x4_t *)v81 + 3));
            v112 = vsubq_s32((int32x4_t)v47, v64);
            v113.i64[0] = v112.i32[2];
            v113.i64[1] = v112.i32[3];
            v114 = vcvtq_f64_s64(v113);
            v113.i64[0] = v112.i32[0];
            v113.i64[1] = v112.i32[1];
            *((float64x2_t *)v81 + 5) = vmulq_f64(v66, vcvtq_f64_s64(v113));
            *((float64x2_t *)v81 + 6) = vmulq_f64(v67, v114);
            *((float64x2_t *)v81 + 4) = v47;
            *((_DWORD *)v81 + 2) = v109;
          }
        }
      }
      v125 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 416);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v139 = "GeoRaycastUtility.hpp";
        v140 = 1024;
        v141 = 477;
        v142 = 1024;
        v143 = v30;
        _os_log_impl(&dword_2164CC000, v125, OS_LOG_TYPE_ERROR, "%25s:%-5d Excessive level count (%d) in voxel tree: resolution has an invalid numerical value.", buf, 0x18u);
      }
    }
  }
}

uint64_t Phase::SpatialModeler::CompleteTraceWithEnergyBatch(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v3 = result;
  v4 = (unsigned int *)(a2 + 4);
  do
  {
    v5 = __ldaxr(v4);
    if (v5 != 1)
    {
      __clrex();
      return result;
    }
  }
  while (__stlxr(2u, v4));
  std::shared_ptr<Phase::Job>::reset[abi:ne180100]((_QWORD *)(a2 + 8));
  v6 = atomic_load((unsigned int *)a2);
  if (v6 != 5)
  {
    if (v6 == 2)
    {
      Phase::SpatialModeler::CalculateFinalEnergyLoss(v3, a2);
      v7 = 3;
    }
    else
    {
      v7 = 5;
    }
    atomic_store(v7, (unsigned int *)a2);
  }
  atomic_store(4u, (unsigned int *)(a2 + 4));
  result = *(_QWORD *)(a2 + 48);
  if (result)
  {
    v8 = a2;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v8);
  }
  return result;
}

void Phase::Command<128>::Invoker<void (*)(Phase::Geometry::SystemState *,Phase::Geometry::SceneQueryBatch *),void,Phase::Geometry::SystemState *,Phase::Geometry::SceneQueryBatch *>::~Invoker()
{
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::Command<128>::Invoker<void (*)(Phase::Geometry::SystemState *,Phase::Geometry::SceneQueryBatch *),void,Phase::Geometry::SystemState *,Phase::Geometry::SceneQueryBatch *>::Call(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

BOOL Phase::SpatialModeler::TRAP::IsExpectedInputSubbandCount(uint64_t a1, uint64_t a2)
{
  int v2;
  _BOOL8 result;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 124);
  if (v2 == 10)
    return 1;
  if (!v2)
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)(a1 + 124) = 10;
    return 1;
  }
  v6 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 1184);
  result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v7 = *(_DWORD *)(a1 + 124);
    v8 = 136316162;
    v9 = "TRAPCommon.cpp";
    v10 = 1024;
    v11 = 34;
    v12 = 2080;
    v13 = a2;
    v14 = 1024;
    v15 = v7;
    v16 = 1024;
    v17 = 10;
    _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d CheckInputDataSubbandCount: subband count of %s is %d. Only %d or 0 are supported", (uint8_t *)&v8, 0x28u);
    return 0;
  }
  return result;
}

char *Phase::SpatialModeler::TRAP::CleanInputReverbTime(char *this, float *a2)
{
  char *v2;
  float v3;

  v2 = this;
  v3 = *(float *)this;
  if ((*(_DWORD *)this & 0x7FFFFFFFu) > 0x7F7FFFFF
    || (this = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)this), v3 < *((float *)this + 100)))
  {
    this = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)this);
    *(_DWORD *)v2 = *((_DWORD *)this + 100);
  }
  return this;
}

float Phase::SpatialModeler::TRAP::CleanInputReverbTimeAndConfidence(Phase::SpatialModeler::TRAP *this, float *a2, float *a3)
{
  float v5;
  int v6;
  float *v7;
  float v8;
  float result;

  v5 = *(float *)this;
  v6 = *(_DWORD *)this & 0x7FFFFFFF;
  v7 = (float *)Phase::SpatialModeler::TRAP::TP(this);
  v8 = v7[100];
  if (v6 >= 2139095040)
  {
    *(float *)this = v8;
    *a2 = 0.0;
  }
  else if (v5 < v8)
  {
    *(_DWORD *)this = *((_DWORD *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v7) + 100);
  }
  result = fminf(fmaxf(*a2, 0.0), 1.0);
  *a2 = result;
  return result;
}

void Phase::SpatialModeler::TRAP::MixMultibandValuesAndConfidences(uint64_t a1, float32x2_t *a2, float (*a3)(float), float (*a4)(float), float (*a5)(float, float, float, float), float (*a6)(float), float (*a7)(float))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  int32x2_t v39;
  uint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float *v54;
  uint64_t v55;
  float (*v56)(float);
  float (*v57)(float);
  _OWORD v58[8];
  _OWORD v59[9];

  v57 = a4;
  v13 = 0;
  memset(v59, 0, 124);
  do
  {
    *(float *)((char *)v59 + v13) = a3(*(float *)(a1 + v13));
    v13 += 4;
  }
  while (v13 != 40);
  v14 = 0;
  memset(v58, 0, 124);
  do
  {
    *(float *)((char *)v58 + v14) = a3(*(float *)(a1 + 256 + v14));
    v14 += 4;
  }
  while (v14 != 40);
  v15 = 0;
  *a2 = 0;
  a2[1] = 0;
  a2[3].i32[0] = 0;
  a2[2] = 0;
  v16 = (_DWORD *)(a1 + 512);
  *(_OWORD *)(a1 + 620) = 0u;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 576) = 0u;
  *(_OWORD *)(a1 + 528) = 0u;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 512) = 0u;
  *(_OWORD *)(a1 + 640) = 0u;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_OWORD *)(a1 + 688) = 0u;
  *(_OWORD *)(a1 + 704) = 0u;
  *(_OWORD *)(a1 + 720) = 0u;
  *(_OWORD *)(a1 + 736) = 0u;
  *(_OWORD *)(a1 + 748) = 0u;
  *(_DWORD *)(a1 + 636) = 10;
  *(_DWORD *)(a1 + 764) = 10;
  *(_OWORD *)(a1 + 876) = 0u;
  *(_OWORD *)(a1 + 848) = 0u;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_DWORD *)(a1 + 892) = 10;
  v17 = 0.0;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *(_OWORD *)(a1 + 768) = 0u;
  v18 = 0.0;
  do
  {
    v19 = *(float *)((char *)v59 + v15);
    v20 = *(float *)((char *)v58 + v15);
    v21 = (float *)(a1 + v15);
    v22 = a5(v19, v20, *(float *)(a1 + v15 + 128), *(float *)(a1 + v15 + 384));
    v21[192] = v22;
    v23 = *(float *)(a1 + v15 + 128);
    v24 = *(float *)(a1 + v15 + 384);
    v21[160] = (float)(v22 * v24) + (float)((float)(1.0 - v22) * v23);
    if (v15)
    {
      v25 = *(float *)((char *)&v58[7] + v15 + 12);
      v26 = *(float *)((char *)&v57 + v15 + 4);
      v27 = a5((float)(v19 + v25) * 0.5, (float)(v20 + v26) * 0.5, sqrtf(v23 * v21[31]), sqrtf(v24 * v21[95]));
      v21[128] = v21[127]
               + (float)((float)((float)(v20 - v26) * v27) + (float)((float)(1.0 - v27) * (float)(v19 - v25)));
    }
    else
    {
      *v16 = 0;
    }
    v28 = a6(v21[32]);
    v29 = fmaxf(v28, fmaxf(v28, 0.00000011921) * 0.00000011921);
    v30 = a7(v21[96]);
    v31 = v29 * fmaxf(v30, fmaxf(v30, 0.00000011921) * 0.00000011921);
    v17 = v17 + v31;
    v32 = a2->f32[1];
    v33 = a2->f32[0] + (float)(v31 * v19);
    a2->f32[0] = v33;
    v34 = v32 + (float)(v31 * v21[32]);
    v35 = a2[1].f32[1];
    v36 = a2[1].f32[0] + (float)(v31 * v20);
    a2->f32[1] = v34;
    a2[1].f32[0] = v36;
    v37 = v35 + (float)(v31 * v21[96]);
    a2[1].f32[1] = v37;
    v18 = v18 + (float)(v31 * *(float *)(a1 + v15 + 512));
    v15 += 4;
  }
  while (v15 != 40);
  a2->f32[0] = v33 / v17;
  a2->f32[1] = v34 / v17;
  a2[1].f32[0] = v36 / v17;
  a2[1].f32[1] = v37 / v17;
  v38 = ((float (*)(void))a5)();
  a2[3].f32[0] = v38;
  v39 = (int32x2_t)vmla_n_f32(vmul_n_f32(a2[1], v38), *a2, 1.0 - v38);
  a2[2] = (float32x2_t)v39;
  v40 = *(unsigned int *)(a1 + 636);
  if ((_DWORD)v40)
  {
    *(float *)v39.i32 = *(float *)v39.i32 - (float)(v18 / v17);
    if ((_DWORD)v40 == 10)
    {
      v50 = (float32x4_t)vdupq_lane_s32(v39, 0);
      v51 = vaddq_f32(v50, *(float32x4_t *)(a1 + 512));
      v52 = vaddq_f32(v50, *(float32x4_t *)(a1 + 528));
      v53 = vaddq_f32(v50, *(float32x4_t *)(a1 + 544));
      *(float32x4_t *)(a1 + 512) = v51;
      *(float32x4_t *)(a1 + 528) = v52;
      *(float32x4_t *)(a1 + 544) = v53;
    }
    else if ((_DWORD)v40 == 31)
    {
      v41 = (float32x4_t)vdupq_lane_s32(v39, 0);
      v42 = vaddq_f32(v41, *(float32x4_t *)(a1 + 528));
      v43 = vaddq_f32(v41, *(float32x4_t *)(a1 + 512));
      v44 = vaddq_f32(v41, *(float32x4_t *)(a1 + 560));
      v45 = vaddq_f32(v41, *(float32x4_t *)(a1 + 544));
      v46 = vaddq_f32(v41, *(float32x4_t *)(a1 + 592));
      v47 = vaddq_f32(v41, *(float32x4_t *)(a1 + 576));
      v48 = vaddq_f32(v41, *(float32x4_t *)(a1 + 608));
      v49 = vaddq_f32(v41, *(float32x4_t *)(a1 + 624));
      v49.i32[3] = HIDWORD(*(_OWORD *)(a1 + 624));
      *(float32x4_t *)(a1 + 512) = v43;
      *(float32x4_t *)(a1 + 528) = v42;
      *(float32x4_t *)(a1 + 544) = v45;
      *(float32x4_t *)(a1 + 560) = v44;
      *(float32x4_t *)(a1 + 576) = v47;
      *(float32x4_t *)(a1 + 592) = v46;
      *(float32x4_t *)(a1 + 608) = v48;
      *(float32x4_t *)(a1 + 624) = v49;
    }
    else
    {
      v54 = (float *)(a1 + 512);
      do
      {
        *v54 = *(float *)v39.i32 + *v54;
        ++v54;
        --v40;
      }
      while (v40);
    }
  }
  v55 = 0;
  v56 = v57;
  do
  {
    *(float *)&v16[v55] = v56(*(float *)&v16[v55]);
    ++v55;
  }
  while (v55 != 10);
  a2->f32[0] = v56(a2->f32[0]);
  a2[1].f32[0] = v56(a2[1].f32[0]);
  a2[2].f32[0] = v56(a2[2].f32[0]);
}

char *Phase::SpatialModeler::TRAP::CalculateSeatbeltReverbTimeAndConfidenceFromMFP(Phase::SpatialModeler::TRAP *a1, uint64_t a2, float a3)
{
  char *v6;
  float v7;
  char *result;
  uint64_t v9;
  float v10;

  v6 = Phase::SpatialModeler::TRAP::TP(a1);
  v7 = *((float *)v6 + 118);
  result = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v6);
  v9 = 0;
  v10 = fminf(fmaxf(a3, v7), *((float *)result + 119));
  *((_DWORD *)a1 + 31) = 10;
  *(_DWORD *)(a2 + 124) = 10;
  do
  {
    *(float *)((char *)a1 + v9 * 4) = *(float *)&__const__ZN5Phase14SpatialModeler4TRAP47CalculateSeatbeltReverbTimeAndConfidenceFromMFPEfRNS_8SubbandsIfEES4__kCCoef[v9]
                                    + (float)((float)(*(float *)&__const__ZN5Phase14SpatialModeler4TRAP47CalculateSeatbeltReverbTimeAndConfidenceFromMFPEfRNS_8SubbandsIfEES4__kBCoef[v9]
                                                    + (float)(*(float *)&__const__ZN5Phase14SpatialModeler4TRAP47CalculateSeatbeltReverbTimeAndConfidenceFromMFPEfRNS_8SubbandsIfEES4__kACoef[v9]
                                                            * v10))
                                            * v10);
    result = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)result);
    *(_DWORD *)(a2 + v9 * 4) = *((_DWORD *)result + 111);
    ++v9;
  }
  while (v9 != 10);
  return result;
}

float Phase::SpatialModeler::TRAP::CalculateRoomChangeConfidence(Phase::SpatialModeler::TRAP *this, float a2)
{
  float *v3;
  float v4;
  float *v5;
  float v6;
  char *v7;
  float v8;
  Phase::SpatialModeler::TRAP *v9;
  float *v10;
  float v11;

  v3 = (float *)Phase::SpatialModeler::TRAP::TP(this);
  v4 = v3[120];
  v5 = (float *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v3);
  v6 = fminf(fmaxf((float)(a2 - v4) / (float)(v5[121] - v4), 0.0), 1.0);
  v7 = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v5);
  v8 = powf(v6, *((float *)v7 + 122));
  v10 = (float *)Phase::SpatialModeler::TRAP::TP(v9);
  v11 = v10[122];
  return v8
       * (float)((float)(*((float *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v10) + 122) + 1.0)
               - (float)(v11 * v6));
}

float Phase::SpatialModeler::TRAP::CalculateAcousticAndVisualMix(Phase::SpatialModeler::TRAP *this, float a2, float a3, float a4, float a5)
{
  char *v7;
  float v8;
  Phase::SpatialModeler::TRAP *v9;
  char *v10;

  v7 = Phase::SpatialModeler::TRAP::TP(this);
  v8 = powf(a4, *((float *)v7 + 109)) + 1.1755e-38;
  v10 = Phase::SpatialModeler::TRAP::TP(v9);
  return fmaxf(1.0 - (float)(v8 / (float)(powf(a5, *((float *)v10 + 110)) + 1.1755e-38)), 0.0);
}

float Phase::SpatialModeler::TRAP::CalculateSeatbeltAndAcousticVisualMix(Phase::SpatialModeler::TRAP *this, float a2, int8x16_t a3, float a4, float a5)
{
  float result;
  float v7;
  char *v8;
  int8x16_t v9;
  int8x16_t v10;
  Phase::SpatialModeler::TRAP *v11;
  int8x16_t v12;

  result = 1.0;
  if (a2 < *(float *)a3.i32)
  {
    *(float *)a3.i32 = a4 - a5;
    v12 = a3;
    if ((float)(a4 - a5) < 0.0)
      v7 = -(float)(a4 - a5);
    else
      v7 = a4 - a5;
    v8 = Phase::SpatialModeler::TRAP::TP(this);
    *(float *)v9.i32 = powf(v7, *((float *)v8 + 116));
    v10.i64[0] = 0x8000000080000000;
    v10.i64[1] = 0x8000000080000000;
    return 1.0
         - fminf((float)(*(float *)vbslq_s8(v10, v9, v12).i32 * 0.5) + 0.5, *((float *)Phase::SpatialModeler::TRAP::TP(v11) + 117));
  }
  return result;
}

float Phase::SpatialModeler::TRAP::CalculateRateLimitingConfidenceWithRoomChange(Phase::SpatialModeler::TRAP *this, float a2, float a3)
{
  char *v5;
  float v6;
  Phase::SpatialModeler::TRAP *v7;
  float *v8;
  float v9;
  char *v10;
  float v11;
  Phase::SpatialModeler::TRAP *v12;

  v5 = Phase::SpatialModeler::TRAP::TP(this);
  v6 = powf(a3, *((float *)v5 + 124));
  v8 = (float *)Phase::SpatialModeler::TRAP::TP(v7);
  v9 = fmaxf(a2, v8[104]);
  v10 = Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v8);
  v11 = powf(v9, *((float *)v10 + 103));
  return (float)(v6 * *((float *)Phase::SpatialModeler::TRAP::TP(v12) + 125)) + (float)((float)(1.0 - v6) * v11);
}

char *Phase::SpatialModeler::TRAP::TP(Phase::SpatialModeler::TRAP *this)
{
  unsigned __int8 v1;
  uint64_t InstancePtr;
  Phase::Logger *v3;
  NSObject *v4;
  _BOOL8 v5;
  double v6;
  Phase::Logger *v7;
  NSObject *v8;
  _BOOL8 v9;
  double v10;
  Phase::Logger *v11;
  NSObject *v12;
  _BOOL8 v13;
  double v14;
  Phase::Logger *v15;
  NSObject *v16;
  _BOOL8 v17;
  double v18;
  Phase::Logger *v19;
  NSObject *v20;
  _BOOL8 v21;
  double v22;
  const void **v23;
  const void **v24;
  const void **v25;
  Phase::Logger *v26;
  NSObject *v27;
  _BOOL8 v28;
  double v29;
  Phase::Logger *v30;
  NSObject *v31;
  _BOOL8 v32;
  double v33;
  Phase::Logger *v34;
  NSObject *v35;
  _BOOL8 v36;
  double v37;
  Phase::Logger *v38;
  NSObject *v39;
  _BOOL8 v40;
  double v41;
  Phase::Logger *v42;
  NSObject *v43;
  _BOOL8 v44;
  double v45;
  Phase::Logger *v46;
  NSObject *v47;
  _BOOL8 v48;
  double v49;
  Phase::Logger *v50;
  NSObject *v51;
  _BOOL8 v52;
  double v53;
  Phase::Logger *v54;
  NSObject *v55;
  _BOOL8 v56;
  double v57;
  Phase::Logger *v58;
  NSObject *v59;
  _BOOL8 v60;
  double v61;
  Phase::Logger *v62;
  NSObject *v63;
  _BOOL8 v64;
  double v65;
  Phase::Logger *v66;
  NSObject *v67;
  _BOOL8 v68;
  double v69;
  Phase::Logger *v70;
  NSObject *v71;
  _BOOL8 v72;
  double v73;
  Phase::Logger *v74;
  NSObject *v75;
  _BOOL8 v76;
  double v77;
  Phase::Logger *v78;
  NSObject *v79;
  _BOOL8 v80;
  double v81;
  Phase::Logger *v82;
  NSObject *v83;
  _BOOL8 v84;
  double v85;
  Phase::Logger *v86;
  NSObject *v87;
  _BOOL8 v88;
  double v89;
  Phase::Logger *v90;
  NSObject *v91;
  _BOOL8 v92;
  double v93;
  Phase::Logger *v94;
  NSObject *v95;
  _BOOL8 v96;
  double v97;
  Phase::Logger *v98;
  NSObject *v99;
  _BOOL8 v100;
  double v101;
  Phase::Logger *v102;
  NSObject *v103;
  _BOOL8 v104;
  double v105;
  Phase::Logger *v106;
  NSObject *v107;
  _BOOL8 v108;
  double v109;
  Phase::Logger *v110;
  NSObject *v111;
  _BOOL8 v112;
  double v113;
  Phase::Logger *v114;
  NSObject *v115;
  const char *v116;
  int v117;
  Phase::Logger *v118;
  NSObject *v119;
  _BOOL8 v120;
  double v121;
  Phase::Logger *v122;
  NSObject *v123;
  double v124;
  Phase::Logger *v125;
  NSObject *v126;
  double v127;
  int v129;
  const char *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  const char *v134;
  __int16 v135;
  double v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v1 = atomic_load((unsigned __int8 *)_MergedGlobals_24);
  if ((v1 & 1) == 0)
  {
    this = (Phase::SpatialModeler::TRAP *)__cxa_guard_acquire(_MergedGlobals_24);
    if ((_DWORD)this)
    {
      Phase::SpatialModeler::TRAP::TuningParameters::TuningParameters(this);
      __cxa_guard_release(_MergedGlobals_24);
    }
  }
  if (!byte_254E44A20)
  {
    byte_254E44A20 = 1;
    InstancePtr = Phase::Logger::GetInstancePtr(this);
    v3 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)InstancePtr);
    v4 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v3) + 1184);
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      v6 = *(float *)(InstancePtr + 1232);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "minimum_reverb_time";
      v135 = 2048;
      v136 = v6;
      _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    LODWORD(xmmword_254E44BB0) = *(_DWORD *)(InstancePtr + 1232);
    v7 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v5);
    v8 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v7) + 1184);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      v10 = *(float *)(InstancePtr + 1236);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "maximum_reverb_time";
      v135 = 2048;
      v136 = v10;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD1(xmmword_254E44BB0) = *(_DWORD *)(InstancePtr + 1236);
    v11 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v9);
    v12 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v11) + 1184);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      v14 = *(float *)(InstancePtr + 1240);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "smoothing_in_seconds_per_jnd";
      v135 = 2048;
      v136 = v14;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD2(xmmword_254E44BB0) = *(_DWORD *)(InstancePtr + 1240);
    v15 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v13);
    v16 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v15) + 1184);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      v18 = *(float *)(InstancePtr + 1244);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "low_confidence_convergence_slowing_exponent";
      v135 = 2048;
      v136 = v18;
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    HIDWORD(xmmword_254E44BB0) = *(_DWORD *)(InstancePtr + 1244);
    v19 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v17);
    v20 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v19) + 1184);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      v22 = *(float *)(InstancePtr + 1248);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "minimum_convergence_confidence";
      v135 = 2048;
      v136 = v22;
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BC0 = *(_DWORD *)(InstancePtr + 1248);
    Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v21);
    v23 = Phase::SpatialModeler::TRAP::TP(void)::$_0::operator()<std::vector<float>,std::array<float,31ul>>((const void **)(InstancePtr + 1256), &unk_254E44A30, (uint64_t)"acoustic_confidence_multipliers");
    Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v23);
    v24 = Phase::SpatialModeler::TRAP::TP(void)::$_0::operator()<std::vector<float>,std::array<float,31ul>>((const void **)(InstancePtr + 1280), &unk_254E44AB0, (uint64_t)"default_curated_from_scene_reverb_time");
    Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v24);
    v25 = Phase::SpatialModeler::TRAP::TP(void)::$_0::operator()<std::vector<float>,std::array<float,31ul>>((const void **)(InstancePtr + 1304), &unk_254E44B30, (uint64_t)"default_curated_from_scene_confidence");
    v26 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v25);
    v27 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v26) + 1184);
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      v29 = *(float *)(InstancePtr + 1328);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "acoustic_high_confidence_weight_exponent";
      v135 = 2048;
      v136 = v29;
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BC4 = *(_DWORD *)(InstancePtr + 1328);
    v30 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v28);
    v31 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v30) + 1184);
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v32)
    {
      v33 = *(float *)(InstancePtr + 1332);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "visual_high_confidence_weight_exponent";
      v135 = 2048;
      v136 = v33;
      _os_log_impl(&dword_2164CC000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BC8 = *(_DWORD *)(InstancePtr + 1332);
    v34 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v32);
    v35 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v34) + 1184);
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      v37 = *(float *)(InstancePtr + 1336);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "seatbelt_high_confidence_weight_exponent";
      v135 = 2048;
      v136 = v37;
      _os_log_impl(&dword_2164CC000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BCC = *(_DWORD *)(InstancePtr + 1336);
    v38 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v36);
    v39 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v38) + 1184);
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v40)
    {
      v41 = *(float *)(InstancePtr + 1340);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "visual_acoustic_high_confidence_weight_exponent";
      v135 = 2048;
      v136 = v41;
      _os_log_impl(&dword_2164CC000, v39, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    LODWORD(xmmword_254E44BD0) = *(_DWORD *)(InstancePtr + 1340);
    v42 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v40);
    v43 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v42) + 1184);
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      v45 = *(float *)(InstancePtr + 1344);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "acoustic_mix_confidence_reduction_exponent";
      v135 = 2048;
      v136 = v45;
      _os_log_impl(&dword_2164CC000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD1(xmmword_254E44BD0) = *(_DWORD *)(InstancePtr + 1344);
    v46 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v44);
    v47 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v46) + 1184);
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    if (v48)
    {
      v49 = *(float *)(InstancePtr + 1348);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "visual_mix_confidence_reduction_exponent";
      v135 = 2048;
      v136 = v49;
      _os_log_impl(&dword_2164CC000, v47, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD2(xmmword_254E44BD0) = *(_DWORD *)(InstancePtr + 1348);
    v50 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v48);
    v51 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v50) + 1184);
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
    if (v52)
    {
      v53 = *(float *)(InstancePtr + 1352);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "broadband_seatbelt_confidence";
      v135 = 2048;
      v136 = v53;
      _os_log_impl(&dword_2164CC000, v51, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    HIDWORD(xmmword_254E44BD0) = *(_DWORD *)(InstancePtr + 1352);
    v54 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v52);
    v55 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v54) + 1184);
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    if (v56)
    {
      v57 = *(float *)(InstancePtr + 1356);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "broadband_visual_confidence";
      v135 = 2048;
      v136 = v57;
      _os_log_impl(&dword_2164CC000, v55, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BE0 = *(_DWORD *)(InstancePtr + 1356);
    v58 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v56);
    v59 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v58) + 1184);
    v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
    if (v60)
    {
      v61 = *(float *)(InstancePtr + 1360);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "seatbelt_to_initial_reverb_time_multiplier";
      v135 = 2048;
      v136 = v61;
      _os_log_impl(&dword_2164CC000, v59, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BE4 = *(_DWORD *)(InstancePtr + 1360);
    v62 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v60);
    v63 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v62) + 1184);
    v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    if (v64)
    {
      v65 = *(float *)(InstancePtr + 1364);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "broadband_seatbelt_initial_confidence";
      v135 = 2048;
      v136 = v65;
      _os_log_impl(&dword_2164CC000, v63, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BE8 = *(_DWORD *)(InstancePtr + 1364);
    v66 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v64);
    v67 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v66) + 1184);
    v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v68)
    {
      v69 = *(float *)(InstancePtr + 1368);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "seatbelt_reverb_time_multiplier";
      v135 = 2048;
      v136 = v69;
      _os_log_impl(&dword_2164CC000, v67, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44BEC = *(_DWORD *)(InstancePtr + 1368);
    v70 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v68);
    v71 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v70) + 1184);
    v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
    if (v72)
    {
      v73 = *(float *)(InstancePtr + 1372);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "seatbelt_confidence_exponent";
      v135 = 2048;
      v136 = v73;
      _os_log_impl(&dword_2164CC000, v71, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    LODWORD(xmmword_254E44BF0) = *(_DWORD *)(InstancePtr + 1372);
    v74 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v72);
    v75 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v74) + 1184);
    v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
    if (v76)
    {
      v77 = *(float *)(InstancePtr + 1376);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "seatbelt_maximum_mix";
      v135 = 2048;
      v136 = v77;
      _os_log_impl(&dword_2164CC000, v75, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD1(xmmword_254E44BF0) = *(_DWORD *)(InstancePtr + 1376);
    v78 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v76);
    v79 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v78) + 1184);
    v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
    if (v80)
    {
      v81 = *(float *)(InstancePtr + 1380);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "lower_seatbelt_mean_free_path_limit";
      v135 = 2048;
      v136 = v81;
      _os_log_impl(&dword_2164CC000, v79, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    DWORD2(xmmword_254E44BF0) = *(_DWORD *)(InstancePtr + 1380);
    v82 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v80);
    v83 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v82) + 1184);
    v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
    if (v84)
    {
      v85 = *(float *)(InstancePtr + 1384);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "upper_seatbelt_mean_free_path_limit";
      v135 = 2048;
      v136 = v85;
      _os_log_impl(&dword_2164CC000, v83, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    HIDWORD(xmmword_254E44BF0) = *(_DWORD *)(InstancePtr + 1384);
    v86 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v84);
    v87 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v86) + 1184);
    v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    if (v88)
    {
      v89 = *(float *)(InstancePtr + 1388);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_probability_min";
      v135 = 2048;
      v136 = v89;
      _os_log_impl(&dword_2164CC000, v87, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C00 = *(_DWORD *)(InstancePtr + 1388);
    v90 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v88);
    v91 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v90) + 1184);
    v92 = os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT);
    if (v92)
    {
      v93 = *(float *)(InstancePtr + 1392);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_probability_max";
      v135 = 2048;
      v136 = v93;
      _os_log_impl(&dword_2164CC000, v91, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C04 = *(_DWORD *)(InstancePtr + 1392);
    v94 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v92);
    v95 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v94) + 1184);
    v96 = os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
    if (v96)
    {
      v97 = *(float *)(InstancePtr + 1396);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_confidence_exponent";
      v135 = 2048;
      v136 = v97;
      _os_log_impl(&dword_2164CC000, v95, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C08 = *(_DWORD *)(InstancePtr + 1396);
    v98 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v96);
    v99 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v98) + 1184);
    v100 = os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT);
    if (v100)
    {
      v101 = *(float *)(InstancePtr + 1400);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_acoustic_confidence_exponent";
      v135 = 2048;
      v136 = v101;
      _os_log_impl(&dword_2164CC000, v99, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C0C = *(_DWORD *)(InstancePtr + 1400);
    v102 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v100);
    v103 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v102) + 1184);
    v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
    if (v104)
    {
      v105 = *(float *)(InstancePtr + 1404);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_rate_confidence_exponent";
      v135 = 2048;
      v136 = v105;
      _os_log_impl(&dword_2164CC000, v103, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    LODWORD(qword_254E44C10) = *(_DWORD *)(InstancePtr + 1404);
    v106 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v104);
    v107 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v106) + 1184);
    v108 = os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT);
    if (v108)
    {
      v109 = *(float *)(InstancePtr + 1408);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "room_change_rate_confidence_max";
      v135 = 2048;
      v136 = v109;
      _os_log_impl(&dword_2164CC000, v107, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    HIDWORD(qword_254E44C10) = *(_DWORD *)(InstancePtr + 1408);
    v110 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v108);
    v111 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v110) + 1184);
    v112 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
    if (v112)
    {
      v113 = *(float *)(InstancePtr + 1412);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "minimum_seatbelt_initial_confidence";
      v135 = 2048;
      v136 = v113;
      _os_log_impl(&dword_2164CC000, v111, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C18 = *(_DWORD *)(InstancePtr + 1412);
    v114 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v112);
    if (*(_BYTE *)(InstancePtr + 1416))
    {
      v115 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v114) + 1184);
      v114 = (Phase::Logger *)os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v114)
      {
        *(double *)&v116 = COERCE_DOUBLE("true");
        v117 = *(unsigned __int8 *)(InstancePtr + 1416);
        v130 = "TRAPParameters.cpp";
        v129 = 136315906;
        if (!v117)
          *(double *)&v116 = COERCE_DOUBLE("false");
        v131 = 1024;
        v132 = 42;
        v133 = 2080;
        v134 = "enable_soft_limiting";
        v135 = 2080;
        v136 = *(double *)&v116;
        _os_log_impl(&dword_2164CC000, v115, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %s", (uint8_t *)&v129, 0x26u);
      }
      byte_254E44C1C = *(_BYTE *)(InstancePtr + 1416);
    }
    v118 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP(v114);
    v119 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v118) + 1184);
    v120 = os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);
    if (v120)
    {
      v121 = *(float *)(InstancePtr + 1420);
      v129 = 136315906;
      v130 = "TRAPParameters.cpp";
      v131 = 1024;
      v132 = 34;
      v133 = 2080;
      v134 = "maximum_log_rate_in_hz";
      v135 = 2048;
      v136 = v121;
      _os_log_impl(&dword_2164CC000, v119, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %f", (uint8_t *)&v129, 0x26u);
    }
    dword_254E44C20 = *(_DWORD *)(InstancePtr + 1420);
    v122 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v120);
    if (*(_QWORD *)(InstancePtr + 1424))
    {
      v123 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v122) + 1184);
      v122 = (Phase::Logger *)os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v122)
      {
        v124 = *(double *)(InstancePtr + 1424);
        v129 = 136315906;
        v130 = "TRAPParameters.cpp";
        v131 = 1024;
        v132 = 64;
        v133 = 2080;
        v134 = "simulation_in_file_pathname";
        v135 = 2080;
        v136 = v124;
        _os_log_impl(&dword_2164CC000, v123, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %s", (uint8_t *)&v129, 0x26u);
      }
      *(_QWORD *)&xmmword_254E44C28 = *(_QWORD *)(InstancePtr + 1424);
    }
    v125 = (Phase::Logger *)Phase::SpatialModeler::TRAP::TP(v122);
    if (*(_QWORD *)(InstancePtr + 1432))
    {
      v126 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v125) + 1184);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        v127 = *(double *)(InstancePtr + 1432);
        v129 = 136315906;
        v130 = "TRAPParameters.cpp";
        v131 = 1024;
        v132 = 64;
        v133 = 2080;
        v134 = "simulation_out_file_pathname";
        v135 = 2080;
        v136 = v127;
        _os_log_impl(&dword_2164CC000, v126, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %s", (uint8_t *)&v129, 0x26u);
      }
      *((_QWORD *)&xmmword_254E44C28 + 1) = *(_QWORD *)(InstancePtr + 1432);
    }
  }
  return &byte_254E44A20;
}

void sub_2166E4C14(_Unwind_Exception *a1)
{
  __cxa_guard_abort(_MergedGlobals_24);
  _Unwind_Resume(a1);
}

double Phase::SpatialModeler::TRAP::TuningParameters::TuningParameters(Phase::SpatialModeler::TRAP::TuningParameters *this)
{
  double result;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  byte_254E44A20 = 0;
  v2 = xmmword_21673B280;
  v3 = unk_21673B290;
  v4 = 0;
  Phase::Subbands<float>::Subbands((uint64_t)&unk_254E44A30, &v2, 10);
  v2 = xmmword_21673B2A8;
  v3 = unk_21673B2B8;
  v4 = 0x3E99999A3E99999ALL;
  Phase::Subbands<float>::Subbands((uint64_t)&unk_254E44AB0, &v2, 10);
  v2 = xmmword_21673B2D0;
  v3 = unk_21673B2E0;
  v4 = 0x3F8000003F800000;
  Phase::Subbands<float>::Subbands((uint64_t)&unk_254E44B30, &v2, 10);
  xmmword_254E44BB0 = xmmword_21673B220;
  *(_OWORD *)&dword_254E44BC0 = xmmword_21673B230;
  xmmword_254E44BD0 = xmmword_21673B240;
  *(_OWORD *)&dword_254E44BE0 = xmmword_21673B250;
  xmmword_254E44BF0 = xmmword_21673B260;
  *(_OWORD *)&dword_254E44C00 = xmmword_21673B270;
  qword_254E44C10 = 0x40C000003F800000;
  dword_254E44C18 = 1050253722;
  byte_254E44C1C = 1;
  dword_254E44C20 = 1056964608;
  result = 0.0;
  xmmword_254E44C28 = 0u;
  return result;
}

const void **Phase::SpatialModeler::TRAP::TP(void)::$_0::operator()<std::vector<float>,std::array<float,31ul>>(const void **result, void *a2, uint64_t a3)
{
  const void **v5;
  Phase::Logger *v6;
  unint64_t v7;
  NSObject *v8;
  void **v9;
  _BYTE *v10;
  uint64_t v11;
  void *__p;
  char v13;
  _QWORD v14[2];
  _QWORD v15[11];
  char v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void **v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (*result != result[1])
  {
    v5 = result;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
    v6 = (Phase::Logger *)std::ostream::operator<<();
    if ((unint64_t)((_BYTE *)v5[1] - (_BYTE *)*v5) >= 5)
    {
      v7 = 1;
      do
      {
        buf[0] = 44;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)buf, 1);
        v6 = (Phase::Logger *)std::ostream::operator<<();
        ++v7;
      }
      while (v7 < ((_BYTE *)v5[1] - (_BYTE *)*v5) >> 2);
    }
    v8 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v6) + 1184);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      std::stringbuf::str();
      v9 = v13 >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 136315906;
      v19 = "TRAPParameters.cpp";
      v20 = 1024;
      v21 = 56;
      v22 = 2080;
      v23 = a3;
      v24 = 2080;
      v25 = v9;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ReadTuningParametersFromDefaults changed phase_are_process_rt60_%s to %s", buf, 0x26u);
      if (v13 < 0)
        operator delete(__p);
    }
    v10 = v5[1];
    if (v10 != *v5)
      memmove(a2, *v5, v10 - (_BYTE *)*v5);
    v14[0] = *MEMORY[0x24BEDB7F0];
    v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v15[0] = v11;
    v15[1] = MEMORY[0x24BEDB848] + 16;
    if (v16 < 0)
      operator delete((void *)v15[9]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    return (const void **)MEMORY[0x2199F9CD4](&v17);
  }
  return result;
}

void sub_2166E4F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

Phase::DspLayer::UPConvolver *Phase::DspLayer::UPConvolver::UPConvolver(Phase::DspLayer::UPConvolver *this, int a2, int a3, int a4)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  *(_QWORD *)this = &off_24D5820A0;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a4;
  v6 = 2 * a2;
  if (a3 % a2 <= 0)
    v7 = 0;
  else
    v7 = a2;
  v8 = v7 + a3 / a2 * a2;
  *((_DWORD *)this + 4) = v6;
  *((_DWORD *)this + 5) = v8;
  v9 = v8 / a2;
  v10 = v6 + 8;
  *((_DWORD *)this + 6) = v9;
  *((_DWORD *)this + 7) = v10;
  v11 = v9 * v10;
  *((_DWORD *)this + 8) = a2 + 4;
  *((_DWORD *)this + 9) = v11;
  *((_DWORD *)this + 10) = 0;
  *((_QWORD *)this + 6) = malloc_type_malloc(4 * v11 * a4, 0x100004052888210uLL);
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 11) = Phase::DspLayer::IConvolver::GetFftFwd(this, *((_DWORD *)this + 4));
  *((_QWORD *)this + 12) = Phase::DspLayer::IConvolver::GetFftInv(this, *((_DWORD *)this + 4));
  *((_QWORD *)this + 7) = malloc_type_malloc(4 * *((int *)this + 9), 0x100004052888210uLL);
  *((_QWORD *)this + 8) = malloc_type_malloc(4 * *((int *)this + 2), 0x100004052888210uLL);
  v12 = *((_DWORD *)this + 9);
  *((_DWORD *)this + 18) = a2;
  *((_DWORD *)this + 19) = v12;
  (*(void (**)(Phase::DspLayer::UPConvolver *))(*(_QWORD *)this + 32))(this);
  return this;
}

void Phase::DspLayer::UPConvolver::~UPConvolver(void **this)
{
  *this = &off_24D5820A0;
  free(this[6]);
  free(this[7]);
  free(this[8]);
}

{
  Phase::DspLayer::UPConvolver::~UPConvolver(this);
  JUMPOUT(0x2199F9D70);
}

void Phase::DspLayer::UPConvolver::Reset(Phase::DspLayer::UPConvolver *this)
{
  *((_DWORD *)this + 10) = 0;
  *((_DWORD *)this + 20) = 0;
  vDSP_vclr(*((float **)this + 6), 1, *((int *)this + 9) * (uint64_t)*((int *)this + 3));
  vDSP_vclr(*((float **)this + 7), 1, *((int *)this + 9));
  vDSP_vclr(*((float **)this + 8), 1, *((int *)this + 2));
}

uint64_t Phase::DspLayer::UPConvolver::SetFilter(Phase::DspLayer::UPConvolver *this, int a2, float *a3, int a4)
{
  uint64_t result;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  vDSP_Length v13;
  float *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  DSPComplex *v20;
  vDSP_Length v21;
  DSPComplex *v22;
  uint64_t v23;
  size_t v24;
  __n128 v25;
  uint64_t v26;
  unint64_t v27;
  float *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  vDSP_Length __I;
  float __C;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0 || *((_DWORD *)this + 3) <= a2)
    return 2;
  if (a4 < 1 || (*(int (**)(Phase::DspLayer::UPConvolver *))(*(_QWORD *)this + 48))(this) < a4)
    return 1;
  v9 = *((_DWORD *)this + 2);
  v10 = a4 / v9;
  if (a4 % v9)
    v11 = v10 + 1;
  else
    v11 = v10;
  *((_DWORD *)this + 10) = v11 * *((_DWORD *)this + 7);
  v12 = *((_QWORD *)this + 6);
  v13 = *((int *)this + 9);
  v30 = (v13 * a2);
  v31 = v12;
  v14 = (float *)(v12 + 4 * (int)v30);
  vDSP_vclr(v14, 1, v13);
  v16 = *((_DWORD *)this + 2);
  if (v16 <= a4)
  {
    LODWORD(v18) = 0;
    v17 = 0;
    do
    {
      __C = 0.0;
      __I = 0;
      vDSP_maxvi(&a3[v17], 1, &__C, &__I, v16);
      if (__C > 0.000015849)
      {
        Phase::DspLayer::UPConvolver::fftFwd(this, (DSPComplex *)&a3[v17], &v14[(int)v18]);
        v14[(int)v18 - 1 + *((int *)this + 8)] = 1.1755e-38;
      }
      v16 = *((_DWORD *)this + 2);
      v17 += v16;
      v18 = *((int *)this + 7) + (uint64_t)(int)v18;
    }
    while (v17 <= a4 - v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  v19 = a4 - v17;
  if (a4 > v17)
  {
    if (v16 <= 4096)
    {
      v21 = v16;
      MEMORY[0x24BDAC7A8](v15);
      v20 = (DSPComplex *)((char *)&v29 - v23);
      bzero((char *)&v29 - v23, v24);
      v22 = 0;
    }
    else
    {
      v20 = (DSPComplex *)operator new[]();
      v21 = *((int *)this + 2);
      v22 = v20;
    }
    vDSP_vclr((float *)v20, 1, v21);
    memcpy(v20, &a3[v17], 4 * v19);
    __C = 0.0;
    __I = 0;
    vDSP_maxvi((const float *)v20, 1, &__C, &__I, *((int *)this + 2));
    v25.n128_f32[0] = __C;
    if (__C > 0.000015849)
    {
      Phase::DspLayer::UPConvolver::fftFwd(this, v20, &v14[v18]);
      v14[v18 - 1 + *((int *)this + 8)] = 1.1755e-38;
    }
    if (v22)
      MEMORY[0x2199F9D4C](v22, 0x1000C8052888210, v25);
  }
  if ((int)v11 >= 1)
  {
    v26 = *((int *)this + 7);
    v27 = v11 + 1;
    v28 = (float *)(4 * (v11 - 1) * v26 + 4 * *((int *)this + 8) + 4 * (int)v30 + v31 - 4);
    while (*v28 != 1.1755e-38)
    {
      result = 0;
      *((_DWORD *)this + 10) -= v26;
      --v27;
      v28 -= v26;
      if (v27 <= 1)
        return result;
    }
  }
  return 0;
}

void sub_2166E5494(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x2199F9D4C](v1, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

void Phase::DspLayer::UPConvolver::fftFwd(Phase::DspLayer::UPConvolver *this, DSPComplex *__C, float *a3)
{
  int v5;
  int v6;
  float *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  vDSP_Length v12;
  float *v13;
  DSPSplitComplex v14;

  v5 = *((_DWORD *)this + 2) + (*((int *)this + 2) < 0);
  v6 = *((_DWORD *)this + 2) / 2;
  v7 = &a3[*((int *)this + 8)];
  v14.realp = a3;
  v14.imagp = v7;
  vDSP_ctoz(__C, 2, &v14, 1, (uint64_t)v5 >> 1);
  v8 = *((_DWORD *)this + 7);
  v9 = *((_DWORD *)this + 2);
  v10 = __OFSUB__(v8, v9);
  v11 = v8 - v9;
  if (v11 < 0 != v10)
    ++v11;
  v12 = (uint64_t)v11 >> 1;
  vDSP_vclr(&v14.realp[v6], 1, v12);
  vDSP_vclr(&v14.imagp[v6], 1, v12);
  v13 = &a3[*((int *)this + 8)];
  vDSP_DFT_Execute(*((const vDSP_DFT_SetupStruct **)this + 11), a3, v13, a3, v13);
  a3[*((_DWORD *)this + 4) / 2] = *v13;
  *v13 = 0.0;
}

void Phase::DspLayer::UPConvolver::Process(Phase::DspLayer::UPConvolver *this, const DSPComplex *a2, float **a3)
{
  DSPComplex *v6;
  uint64_t v7;
  float *v8;
  int v9;
  int v10;
  float *v11;
  vDSP_Length v12;
  float *v13;
  float *imagp;
  void *v15;
  size_t v16;
  int v17;
  DSPComplex *v18;
  uint64_t v19;
  vDSP_Length v20;
  float *v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  vDSP_Length v26;
  int v27;
  int v28;
  vDSP_Length v29;
  vDSP_Length v30;
  uint64_t v31;
  DSPSplitComplex __B;
  DSPSplitComplex __A;
  DSPSplitComplex __Z;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = *((_QWORD *)this + 7);
  v6 = (DSPComplex *)*((_QWORD *)this + 8);
  v8 = (float *)(v7 + 4 * *((int *)this + 20));
  v9 = *((_DWORD *)this + 2) + (*((int *)this + 2) < 0);
  v10 = *((_DWORD *)this + 2) / 2;
  v11 = &v8[*((int *)this + 8)];
  __Z.realp = v8;
  __Z.imagp = v11;
  v12 = (uint64_t)v9 >> 1;
  vDSP_ctoz(v6, 2, &__Z, 1, v12);
  __Z.realp += v10;
  __Z.imagp += v10;
  vDSP_ctoz(a2, 2, &__Z, 1, v12);
  v13 = &v8[*((int *)this + 8)];
  __Z.realp = v8;
  __Z.imagp = v13;
  vDSP_DFT_Execute(*((const vDSP_DFT_SetupStruct **)this + 11), v8, v13, v8, v13);
  imagp = __Z.imagp;
  __Z.realp[*((_DWORD *)this + 4) / 2] = *__Z.imagp;
  *imagp = 0.0;
  v15 = memcpy(v6, a2, 4 * *((int *)this + 2));
  MEMORY[0x24BDAC7A8](v15);
  v18 = (DSPComplex *)((char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*((int *)this + 3) >= 1)
  {
    bzero((char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
    v19 = 0;
    do
    {
      v20 = *((int *)this + 8);
      v21 = (float *)(*((_QWORD *)this + 6) + 4 * *((_DWORD *)this + 9) * (int)v19);
      v22 = *((int *)this + 20);
      __Z.realp = (float *)v18;
      __Z.imagp = (float *)v18 + v20;
      __A.realp = v21;
      __A.imagp = &v21[v20];
      __B.realp = (float *)(v7 + 4 * v22);
      __B.imagp = &__B.realp[v20];
      if (*(__A.imagp - 1) == 1.1755e-38)
        vDSP_zvmul(&__A, 1, &__B, 1, &__Z, 1, v20, 1);
      else
        vDSP_vclr((float *)v18, 1, *((int *)this + 7));
      v23 = *((_DWORD *)this + 7);
      v24 = v22 - v23;
      if ((int)v22 - v23 < 0)
      {
        v25 = *((_DWORD *)this + 7);
      }
      else
      {
        v25 = *((_DWORD *)this + 7);
        do
        {
          if (v25 >= *((_DWORD *)this + 10))
            break;
          v26 = *((int *)this + 8);
          __A.realp = &v21[v25];
          __A.imagp = &__A.realp[v26];
          __B.realp = (float *)(v7 + 4 * v24);
          __B.imagp = &__B.realp[v26];
          if (*(__A.imagp - 1) == 1.1755e-38)
          {
            vDSP_zvma(&__A, 1, &__B, 1, &__Z, 1, &__Z, 1, v26);
            v23 = *((_DWORD *)this + 7);
          }
          v25 += v23;
          v24 -= v23;
        }
        while (v24 >= 0);
      }
      v27 = *((_DWORD *)this + 10);
      if (v25 < v27)
      {
        v28 = *((_DWORD *)this + 9) + v24;
        do
        {
          v29 = *((int *)this + 8);
          __A.realp = &v21[v25];
          __A.imagp = &__A.realp[v29];
          __B.realp = (float *)(v7 + 4 * v28);
          __B.imagp = &__B.realp[v29];
          if (*(__A.imagp - 1) == 1.1755e-38)
          {
            vDSP_zvma(&__A, 1, &__B, 1, &__Z, 1, &__Z, 1, v29);
            v23 = *((_DWORD *)this + 7);
            v27 = *((_DWORD *)this + 10);
          }
          v25 += v23;
          v28 -= v23;
        }
        while (v25 < v27);
      }
      Phase::DspLayer::UPConvolver::fftInv((const vDSP_DFT_SetupStruct **)this, (const float *)v18, v18);
      v30 = *((int *)this + 2);
      *(float *)&__A.realp = 0.125 / (float)(int)v30;
      vDSP_vsmul((const float *)v18 + v30, 1, (const float *)&__A, a3[v19++], 1, v30);
    }
    while (v19 < *((int *)this + 3));
    v17 = *((_DWORD *)this + 7);
  }
  *((_DWORD *)this + 20) = (*((_DWORD *)this + 20) + v17) % *((_DWORD *)this + 9);
}

void Phase::DspLayer::UPConvolver::fftInv(const vDSP_DFT_SetupStruct **this, const float *a2, DSPComplex *a3)
{
  uint64_t v6;
  float *v7;
  size_t v8;
  char *v9;
  float *v10;
  uint64_t v11;
  DSPSplitComplex __Z;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *((int *)this + 8);
  v7 = (float *)&a2[v6];
  MEMORY[0x24BDAC7A8](this);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
  v10 = (float *)&v9[4 * v6];
  *v7 = a2[*((_DWORD *)this + 4) / 2];
  vDSP_DFT_Execute(this[12], a2, v7, (float *)v9, v10);
  __Z.realp = (float *)v9;
  __Z.imagp = v10;
  vDSP_ztoc(&__Z, 1, a3, 2, (uint64_t)(*((_DWORD *)this + 4) + (*((int *)this + 4) < 0)) >> 1);
}

uint64_t Phase::DspLayer::UPConvolver::GetFilterState(Phase::DspLayer::UPConvolver *this)
{
  return (uint64_t)this + 56;
}

uint64_t Phase::DspLayer::UPConvolver::GetBlockSize(Phase::DspLayer::UPConvolver *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t Phase::DspLayer::UPConvolver::GetFilterLength(Phase::DspLayer::UPConvolver *this)
{
  return (*((_DWORD *)this + 2) * (*((_DWORD *)this + 10) / *((_DWORD *)this + 7)));
}

uint64_t Phase::DspLayer::UPConvolver::GetMaxFilterLength(Phase::DspLayer::UPConvolver *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t Phase::DspLayer::UPConvolver::GetNumOutputChannels(Phase::DspLayer::UPConvolver *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t Phase::DspLayer::UPConvolver::GetNumPartitions(Phase::DspLayer::UPConvolver *this)
{
  return 1;
}

uint64_t Phase::DspLayer::UPConvolver::CopyStates(Phase::DspLayer::UPConvolver *this, Phase::DspLayer::IConvolver *a2)
{
  int v4;
  uint64_t v5;

  v4 = (*(uint64_t (**)(Phase::DspLayer::IConvolver *))(*(_QWORD *)a2 + 72))(a2);
  if ((*(unsigned int (**)(Phase::DspLayer::UPConvolver *))(*(_QWORD *)this + 72))(this) != v4)
    return 0;
  v5 = (*(uint64_t (**)(Phase::DspLayer::IConvolver *))(*(_QWORD *)a2 + 88))(a2);
  return Phase::DspLayer::IConvolver::FilterState::Copy((uint64_t)this + 56, v5);
}

_QWORD *Phase::Controller::VbapSpatializer::VbapSpatializer(_QWORD *a1, __int128 *a2, uint64_t a3)
{
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, "VBAP");
  Phase::Controller::Spatializer::Spatializer((uint64_t)a1, a2, a3, (__int128 *)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  *a1 = &off_24D582120;
  return a1;
}

void sub_2166E5B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Phase::Controller::VbapSpatializer::~VbapSpatializer(void **this)
{
  Phase::Controller::Spatializer::~Spatializer(this);
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::Controller::VbapSpatializer::Initialize(std::__shared_weak_count **this)
{
  std::__shared_weak_count *v2;
  Phase::Controller::VbapEncoder *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_24D5821D8;
  v3 = Phase::Controller::VbapEncoder::VbapEncoder((Phase::Controller::VbapEncoder *)&v2[1], (const Phase::Controller::VbapSpatializer *)this);
  v4 = this[7];
  this[6] = (std::__shared_weak_count *)v3;
  this[7] = v2;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return ((uint64_t (*)(std::__shared_weak_count *))this[6]->__on_zero_shared)(this[6]);
}

void sub_2166E5C2C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::VbapSpatializer::OutputChannelLayoutChanged(char **a1, char **a2)
{
  char *v4;
  uint64_t v5;
  char **v6;
  Phase::Controller::VbapEncoder *v7;
  char *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *__p;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a1[3];
  v5 = (uint64_t)a1[4];
  v6 = a1 + 3;
  __p = 0;
  v14 = 0;
  v15 = 0;
  std::vector<char>::__init_with_size[abi:ne180100]<char *,char *>(&__p, v4, v5, v5 - (_QWORD)v4);
  if (v6 != a2)
    std::vector<char>::__assign_with_size[abi:ne180100]<char *,char *>(v6, *a2, a2[1], a2[1] - *a2);
  v7 = (Phase::Controller::VbapEncoder *)operator new();
  Phase::Controller::VbapEncoder::VbapEncoder(v7, (const Phase::Controller::VbapSpatializer *)a1);
  (*(void (**)(Phase::Controller::VbapEncoder *))(*(_QWORD *)v7 + 16))(v7);
  v8 = (char *)operator new();
  *(_QWORD *)v8 = &off_24D582210;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *((_QWORD *)v8 + 3) = v7;
  v9 = (std::__shared_weak_count *)a1[7];
  a1[6] = (char *)v7;
  a1[7] = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  return 1;
}

void sub_2166E5D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_2166E5DF8()
{
  JUMPOUT(0x2166E5E00);
}

void sub_2166E5EB8()
{
  __cxa_end_catch();
  JUMPOUT(0x2166E5DB0);
}

void sub_2166E5ECC(void *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  JUMPOUT(0x2166E5DF0);
}

Phase::Controller::VbapEncoder *Phase::Controller::VbapEncoder::VbapEncoder(Phase::Controller::VbapEncoder *this, const Phase::Controller::VbapSpatializer *a2)
{
  char **v3;
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  __int32 v7;
  uint8x8_t v8;
  float *v9;
  float *v10;
  float *v11;
  float v12;
  float *v13;
  float *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  float *v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  AudioDSP::Core::VBAP *v31;
  NSObject *v33;
  std::logic_error *exception;
  AudioDSP::Core::VBAP **v35;
  void *v36;
  char *v37;
  char *v38;
  void *__p;
  float *v40;
  float *v41;
  void *v42;
  float *v43;
  void **v44;
  uint8_t buf[4];
  _QWORD v46[9];

  *(_QWORD *)((char *)&v46[7] + 4) = *MEMORY[0x24BDAC8D0];
  *((_WORD *)this + 4) = 1;
  *((_QWORD *)this + 2) = a2;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_QWORD *)this = &off_24D582158;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = -1;
  *((_QWORD *)this + 10) = 0;
  v35 = (AudioDSP::Core::VBAP **)((char *)this + 80);
  v5 = (_DWORD *)*((_QWORD *)a2 + 3);
  v3 = (char **)((char *)a2 + 24);
  v4 = v5;
  v6 = *v5;
  if (*v5 == 0x10000)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v4[1]);
    v8.i16[0] = vaddlv_u8(v8);
    v7 = v8.i32[0];
  }
  else if (v6)
  {
    v7 = (unsigned __int16)v6;
  }
  else
  {
    v7 = v4[2];
  }
  *((_DWORD *)this + 18) = v7;
  Phase::ChannelLayout::GetChannelLayoutChannelDescriptions(v3, (uint64_t *)&v42);
  __p = 0;
  v40 = 0;
  v41 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v10 = (float *)v42;
  v11 = v43;
  if (v42 != v43)
  {
    do
    {
      if (*(_DWORD *)v10 == 4 || *(_DWORD *)v10 == 37)
      {
        --*((_DWORD *)this + 18);
      }
      else
      {
        v12 = (float)(v10[2] - (float)(floorf(v10[2] / 360.0) * 360.0)) + 0.0;
        if (v12 >= 360.0)
          v12 = nextafterf(360.0, 0.0);
        v13 = v40;
        if (v40 >= v41)
        {
          v9 = (float *)__p;
          v15 = ((char *)v40 - (_BYTE *)__p) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v41 - (_BYTE *)__p;
          if (((char *)v41 - (_BYTE *)__p) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v41, v18);
            v9 = (float *)__p;
            v13 = v40;
          }
          else
          {
            v19 = 0;
          }
          v20 = (float *)&v19[4 * v15];
          *v20 = v12;
          v14 = v20 + 1;
          while (v13 != v9)
          {
            v21 = *((_DWORD *)v13-- - 1);
            *((_DWORD *)v20-- - 1) = v21;
          }
          __p = v20;
          v40 = v14;
          v41 = (float *)&v19[4 * v18];
          if (v9)
            operator delete(v9);
        }
        else
        {
          *v40 = v12;
          v14 = v13 + 1;
        }
        v40 = v14;
        v22 = v37;
        if (v37 >= v38)
        {
          v9 = (float *)v36;
          v24 = (v37 - (_BYTE *)v36) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v26 = v38 - (_BYTE *)v36;
          if ((v38 - (_BYTE *)v36) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v38, v27);
            v9 = (float *)v36;
            v22 = v37;
          }
          else
          {
            v28 = 0;
          }
          v29 = &v28[4 * v24];
          *(float *)v29 = v10[3];
          v23 = v29 + 4;
          while (v22 != (char *)v9)
          {
            v30 = *((_DWORD *)v22 - 1);
            v22 -= 4;
            *((_DWORD *)v29 - 1) = v30;
            v29 -= 4;
          }
          v36 = v29;
          v37 = v23;
          v38 = &v28[4 * v27];
          if (v9)
            operator delete(v9);
        }
        else
        {
          *(float *)v37 = v10[3];
          v23 = v22 + 4;
        }
        v37 = v23;
        if (*((float *)v23 - 1) != fminf(fmaxf(*((float *)v23 - 1), -90.0), 90.0))
        {
          v33 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v9) + 576));
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v46[0] = "VbapSpatializer.mm";
            LOWORD(v46[1]) = 1024;
            *(_DWORD *)((char *)&v46[1] + 2) = 58;
            _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [elevations.back() != Clamp(elevations.back(), -90.f, 90.f) is true]: \"VBAP encoder init: Invalid elevation angle in channel description!\"", buf, 0x12u);
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "VBAP encoder init: Invalid elevation angle in channel description!");
          exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
        }
      }
      v10 += 5;
    }
    while (v10 != v11);
  }
  *(_DWORD *)buf = 1;
  memset((char *)v46 + 4, 0, 48);
  v31 = (AudioDSP::Core::VBAP *)operator new();
  MEMORY[0x2199F986C](v31, &__p, &v36, buf);
  std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](v35, v31);
  v44 = (void **)((char *)&v46[3] + 4);
  std::vector<std::list<int>>::__destroy_vector::operator()[abi:ne180100](&v44);
  if (*(_QWORD *)((char *)v46 + 4))
  {
    *(_QWORD *)((char *)&v46[1] + 4) = *(_QWORD *)((char *)v46 + 4);
    operator delete(*(void **)((char *)v46 + 4));
  }
  if (v36)
  {
    v37 = (char *)v36;
    operator delete(v36);
  }
  if (__p)
  {
    v40 = (float *)__p;
    operator delete(__p);
  }
  if (v42)
  {
    v43 = (float *)v42;
    operator delete(v42);
  }
  return this;
}

void sub_2166E6350(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Phase::Controller::SpatializerFilterHandle *a10, AudioDSP::Core::VBAP **a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 buf)
{
  uint64_t v23;
  Phase::Logger *v26;
  NSObject *v27;
  std::logic_error *exception;

  MEMORY[0x2199F9D70](v23, 0x20C4093837F09);
  AudioDSP::Core::VBAP::InitParameters::~InitParameters((AudioDSP::Core::VBAP::InitParameters *)&buf);
  if (a2 == 1)
  {
    v26 = (Phase::Logger *)__cxa_begin_catch(a1);
    v27 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v26) + 576));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "VbapSpatializer.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 75;
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"VBAP encoder init: invalid output channel layout!\"", (uint8_t *)&buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "VBAP encoder init: invalid output channel layout!");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
  }
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](a11, 0);
  Phase::Controller::SpatializerFilterHandle::~SpatializerFilterHandle(a10);
  _Unwind_Resume(a1);
}

void sub_2166E6444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Phase::Controller::SpatializerFilterHandle *a10, AudioDSP::Core::VBAP **a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  __cxa_end_catch();
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](a11, 0);
  Phase::Controller::SpatializerFilterHandle::~SpatializerFilterHandle(a10);
  _Unwind_Resume(a1);
}

void sub_2166E6464(void *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  JUMPOUT(0x2166E64E4);
}

void sub_2166E6474()
{
  JUMPOUT(0x2166E64D0);
}

void sub_2166E647C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, Phase::Controller::SpatializerFilterHandle *a10, AudioDSP::Core::VBAP **a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;

  __cxa_free_exception(v19);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](a11, 0);
  Phase::Controller::SpatializerFilterHandle::~SpatializerFilterHandle(a10);
  _Unwind_Resume(a1);
}

void sub_2166E648C()
{
  JUMPOUT(0x2166E64A0);
}

void AudioDSP::Core::VBAP::InitParameters::~InitParameters(AudioDSP::Core::VBAP::InitParameters *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 32);
  std::vector<std::list<int>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void Phase::Controller::VbapEncoder::~VbapEncoder(AudioDSP::Core::VBAP **this)
{
  Phase::Controller::VbapEncoder::~VbapEncoder(this);
  JUMPOUT(0x2199F9D70);
}

{
  char *v2;

  *this = (AudioDSP::Core::VBAP *)&off_24D582158;
  v2 = (char *)(this + 7);
  std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](this + 10, 0);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)(this + 5));
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)(this + 3));
}

void Phase::Controller::VbapEncoder::Initialize(Phase::Controller::VbapEncoder *this)
{
  const Phase::Controller::Spatializer *v2;
  unsigned int v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  __int128 v27;
  __int128 v28;
  unsigned int v29;
  const Phase::Controller::SpatializerEncoder *v30;
  const Phase::Controller::Spatializer *v31;

  v2 = (const Phase::Controller::Spatializer *)*((_QWORD *)this + 2);
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v3 = (*(uint64_t (**)(Phase::Controller::VbapEncoder *, __int128 *))(*(_QWORD *)this + 56))(this, &v22);
  v30 = this;
  v31 = v2;
  v29 = v3;
  std::allocate_shared[abi:ne180100]<Phase::Controller::SpatializerFilterDatabase,std::allocator<Phase::Controller::SpatializerFilterDatabase>,Phase::Controller::Spatializer const*&,Phase::Controller::SpatializerEncoder const*&,unsigned int &,void>(&v31, &v30, &v29, &v25);
  v27 = 0u;
  v28 = 0u;
  std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100]((_QWORD *)this + 3, &v25);
  std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100]((_QWORD *)this + 5, (uint64_t *)&v27);
  std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100]((_QWORD *)this + 7, (uint64_t *)&v28);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
  if (*((_QWORD *)&v28 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
  if (*((_QWORD *)&v22 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
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

void sub_2166E674C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  Phase::Controller::SpatializerFilterHandle::~SpatializerFilterHandle((Phase::Controller::SpatializerFilterHandle *)&a9);
  _Unwind_Resume(a1);
}

BOOL Phase::Controller::VbapEncoder::GetFiltersAndDelays(Phase::Controller::VbapEncoder *this, float a2, float a3, float a4, unsigned int a5, float **a6, float *a7)
{
  int v14;
  int v15;
  uint64_t v16;
  float **v17;
  uint64_t v18;
  unint64_t v19;
  __double2 v20;
  __double2 v21;
  float v22;
  float v23;
  float sinval;
  int v25;
  void *v26;
  int *v28;
  int v29;
  int v30;
  _DWORD *v31;
  _DWORD v33[3];
  void *__p[3];

  v14 = (*(uint64_t (**)(Phase::Controller::VbapEncoder *))(*(_QWORD *)this + 48))(this);
  v15 = v14;
  v16 = v14;
  if (v14 >= 1)
  {
    v17 = a6;
    v18 = v14;
    do
    {
      vDSP_vclr(*v17++, 1, a5);
      --v18;
    }
    while (v18);
  }
  vDSP_vclr(a7, 1, v15);
  Phase::Controller::SpatializerEncoder::VerifyCoordinateRanges(this, a2, a3, a4);
  v19 = *((int *)this + 18);
  v33[0] = 0;
  std::vector<float>::vector(__p, v19, v33);
  v20 = __sincos_stret((float)((float)(a2 + -90.0) * 0.017453));
  v21 = __sincos_stret((float)(a3 * 0.017453));
  v22 = v21.__cosval * v20.__cosval;
  v23 = v21.__sinval * v20.__cosval;
  sinval = v20.__sinval;
  *(float *)v33 = v22;
  *(float *)&v33[1] = v23;
  *(float *)&v33[2] = sinval;
  v25 = AudioDSP::Core::VBAP::calculateVBAPGains();
  v26 = __p[0];
  if (v15 >= 1 && v25 == 0)
  {
    v28 = (int *)__p[0];
    do
    {
      v29 = *v28++;
      v30 = v29;
      v31 = *a6++;
      *v31 = v30;
      --v16;
    }
    while (v16);
  }
  else if (!__p[0])
  {
    return v25 == 0;
  }
  __p[1] = v26;
  operator delete(v26);
  return v25 == 0;
}

void sub_2166E68E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *Phase::Controller::VbapEncoder::GetDescription@<X0>(Phase::Controller::VbapEncoder *this@<X0>, _QWORD *a2@<X8>)
{
  char __str[256];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "<Encoder Type: Vbap, Filter Length: %d, Output Channel Count: %d>", *(_DWORD *)(*((_QWORD *)this + 3) + 8), *((_DWORD *)this + 18));
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

uint64_t Phase::Controller::VbapEncoder::GetOutputChannelCount(Phase::Controller::VbapEncoder *this)
{
  return *((unsigned int *)this + 18);
}

unint64_t Phase::Controller::VbapEncoder::GetNearestFilter(Phase::Controller::SpatializerFilterDatabase **this, const Phase::Controller::SpatializerFilterHandle *a2, float a3, float a4, void *a5)
{
  NSObject *v9;
  std::logic_error *exception;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)this) + 576));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "VbapSpatializer.mm";
      v13 = 1024;
      v14 = 147;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: nullptr == pInWorkBuffer is false.", (uint8_t *)&v11, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "PRECONDITION: nullptr == pInWorkBuffer is false.");
  }
  Phase::Controller::SpatializerEncoder::VerifyCoordinateRanges((Phase::Logger *)this, a3, a4, 0.0);
  return Phase::Controller::SpatializerFilterDatabase::GetNearestFilter(this[3], a3, a4);
}

void sub_2166E6AAC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

AudioDSP::Core::VBAP *std::unique_ptr<AudioDSP::Core::VBAP>::reset[abi:ne180100](AudioDSP::Core::VBAP **a1, AudioDSP::Core::VBAP *a2)
{
  AudioDSP::Core::VBAP *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    AudioDSP::Core::VBAP::~VBAP(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

void std::vector<std::list<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  uint64_t *v2;
  uint64_t *v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  v1 = *a1;
  v2 = (uint64_t *)**a1;
  if (v2)
  {
    v4 = (uint64_t *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 3;
        if (*(v4 - 1))
        {
          v8 = *(v4 - 3);
          v7 = (uint64_t *)*(v4 - 2);
          v9 = *v7;
          *(_QWORD *)(v9 + 8) = *(_QWORD *)(v8 + 8);
          **(_QWORD **)(v8 + 8) = v9;
          *(v4 - 1) = 0;
          if (v7 != v6)
          {
            do
            {
              v10 = (uint64_t *)v7[1];
              operator delete(v7);
              v7 = v10;
            }
            while (v10 != v6);
          }
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<Phase::Controller::VbapEncoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D5821D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Phase::Controller::VbapEncoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D5821D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

uint64_t std::__shared_ptr_emplace<Phase::Controller::VbapEncoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_pointer<Phase::Controller::VbapEncoder *,std::shared_ptr<Phase::Controller::SpatializerEncoder>::__shared_ptr_default_delete<Phase::Controller::SpatializerEncoder,Phase::Controller::VbapEncoder>,std::allocator<Phase::Controller::VbapEncoder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

uint64_t std::__shared_ptr_pointer<Phase::Controller::VbapEncoder *,std::shared_ptr<Phase::Controller::SpatializerEncoder>::__shared_ptr_default_delete<Phase::Controller::SpatializerEncoder,Phase::Controller::VbapEncoder>,std::allocator<Phase::Controller::VbapEncoder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t Phase::VirtualAllocator::ReserveAddressSpace(Phase::VirtualAllocator *this)
{
  size_t v1;
  void *v2;
  uint64_t v3;
  Phase::Logger *v4;
  NSObject *v6;
  int v7;
  std::logic_error *exception;
  NSObject *v9;
  int v10;
  std::logic_error *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  size_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD)this << *MEMORY[0x24BDB03C0];
  v2 = mmap(0, v1, 0, 4098, -1, 0);
  if (v2 == (void *)-1)
  {
    v6 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)0xFFFFFFFFFFFFFFFFLL) + 112);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      v12 = 136316162;
      v13 = "VirtualAllocator.cpp";
      v14 = 1024;
      v15 = 45;
      v16 = 2048;
      v17 = v1;
      v18 = 2048;
      v19 = -1;
      v20 = 1024;
      v21 = v7;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [pBaseAddress == MAP_FAILED is true]: \"mmap() failed to map %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v12, 0x2Cu);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "mmap() failed to map %zu bytes from address space %p (errno: %d)\n");
  }
  v3 = (uint64_t)v2;
  v4 = (Phase::Logger *)msync(v2, v1, 18);
  if ((_DWORD)v4 == -1)
  {
    v9 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v4) + 112);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *__error();
      v12 = 136316162;
      v13 = "VirtualAllocator.cpp";
      v14 = 1024;
      v15 = 49;
      v16 = 2048;
      v17 = v1;
      v18 = 2048;
      v19 = v3;
      v20 = 1024;
      v21 = v10;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [result == -1 is true]: \"msync() failed to sync %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v12, 0x2Cu);
    }
    v11 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v11, "msync() failed to sync %zu bytes from address space %p (errno: %d)\n");
  }
  return v3;
}

void sub_2166E6ED8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

Phase::Logger *Phase::VirtualAllocator::ReleaseAddressSpace(Phase::VirtualAllocator *this, const void *a2)
{
  size_t v3;
  Phase::Logger *v4;
  Phase::Logger *result;
  NSObject *v6;
  Phase::VirtualAllocator *v7;
  std::logic_error *exception;
  NSObject *v9;
  int v10;
  std::logic_error *v11;
  NSObject *v12;
  int v13;
  std::logic_error *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  Phase::VirtualAllocator *v20;
  __int16 v21;
  Phase::VirtualAllocator *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((*MEMORY[0x24BDB03B8] & (unint64_t)this) != 0)
  {
    v6 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 112);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (Phase::VirtualAllocator *)*MEMORY[0x24BDB03C8];
      v15 = 136315906;
      v16 = "VirtualAllocator.cpp";
      v17 = 1024;
      v18 = 59;
      v19 = 2048;
      v20 = this;
      v21 = 2048;
      v22 = v7;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [(((uintptr_t) pInBaseAddress) & vm_page_mask) != 0 is true]: \"base address %p must be aligned to the page size %lu!)\\n\"", (uint8_t *)&v15, 0x26u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "base address %p must be aligned to the page size %lu!)\n");
  }
  v3 = (_QWORD)a2 << *MEMORY[0x24BDB03C0];
  v4 = (Phase::Logger *)msync(this, v3, 16);
  if ((_DWORD)v4 == -1)
  {
    v9 = **(NSObject ***)(Phase::Logger::GetInstancePtr(v4) + 112);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *__error();
      v15 = 136316162;
      v16 = "VirtualAllocator.cpp";
      v17 = 1024;
      v18 = 65;
      v19 = 2048;
      v20 = (Phase::VirtualAllocator *)v3;
      v21 = 2048;
      v22 = this;
      v23 = 1024;
      v24 = v10;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [result == -1 is true]: \"msync() failed to unsync %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v15, 0x2Cu);
    }
    v11 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v11, "msync() failed to unsync %zu bytes from address space %p (errno: %d)\n");
  }
  result = (Phase::Logger *)munmap(this, v3);
  if ((_DWORD)result == -1)
  {
    v12 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 112);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      v15 = 136316162;
      v16 = "VirtualAllocator.cpp";
      v17 = 1024;
      v18 = 69;
      v19 = 2048;
      v20 = (Phase::VirtualAllocator *)v3;
      v21 = 2048;
      v22 = this;
      v23 = 1024;
      v24 = v13;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [result == -1 is true]: \"munmap() failed to unmap %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v15, 0x2Cu);
    }
    v14 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v14, "munmap() failed to unmap %zu bytes from address space %p (errno: %d)\n");
  }
  return result;
}

void sub_2166E71DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

Phase::Logger *Phase::VirtualAllocator::CommitPages(Phase::VirtualAllocator *this, void *a2)
{
  size_t v3;
  void *v4;
  uint64_t v5;
  Phase::Logger *result;
  NSObject *v7;
  uint64_t v8;
  std::logic_error *exception;
  NSObject *v10;
  int v11;
  std::logic_error *v12;
  NSObject *v13;
  int v14;
  std::logic_error *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  Phase::VirtualAllocator *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((*MEMORY[0x24BDB03B8] & (unint64_t)this) != 0)
  {
    v7 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 112);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *MEMORY[0x24BDB03C8];
      v16 = 136315906;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 78;
      v20 = 2048;
      v21 = this;
      v22 = 2048;
      v23 = v8;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [(((uintptr_t) pInBaseAddress) & vm_page_mask) != 0 is true]: \"base address %p must be aligned to the page size %lu!)\\n\"", (uint8_t *)&v16, 0x26u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "base address %p must be aligned to the page size %lu!)\n");
  }
  v3 = (_QWORD)a2 << *MEMORY[0x24BDB03C0];
  v4 = mmap(this, v3, 3, 4113, -1, 0);
  if (v4 == (void *)-1)
  {
    v10 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)0xFFFFFFFFFFFFFFFFLL) + 112);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      v16 = 136316162;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 84;
      v20 = 2048;
      v21 = (Phase::VirtualAllocator *)v3;
      v22 = 2048;
      v23 = -1;
      v24 = 1024;
      v25 = v11;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [pBaseAddress == MAP_FAILED is true]: \"mmap() failed to map %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v16, 0x2Cu);
    }
    v12 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v12, "mmap() failed to map %zu bytes from address space %p (errno: %d)\n");
  }
  v5 = (uint64_t)v4;
  result = (Phase::Logger *)msync(v4, v3, 18);
  if ((_DWORD)result == -1)
  {
    v13 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 112);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      v16 = 136316162;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 88;
      v20 = 2048;
      v21 = (Phase::VirtualAllocator *)v3;
      v22 = 2048;
      v23 = v5;
      v24 = 1024;
      v25 = v14;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [result == -1 is true]: \"msync() failed to sync %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v16, 0x2Cu);
    }
    v15 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v15, "msync() failed to sync %zu bytes from address space %p (errno: %d)\n");
  }
  return result;
}

void sub_2166E74F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

Phase::Logger *Phase::VirtualAllocator::DecommitPages(Phase::VirtualAllocator *this, const void *a2)
{
  size_t v3;
  void *v4;
  uint64_t v5;
  Phase::Logger *result;
  NSObject *v7;
  uint64_t v8;
  std::logic_error *exception;
  NSObject *v10;
  int v11;
  std::logic_error *v12;
  NSObject *v13;
  int v14;
  std::logic_error *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  Phase::VirtualAllocator *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((*MEMORY[0x24BDB03B8] & (unint64_t)this) != 0)
  {
    v7 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 112);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *MEMORY[0x24BDB03C8];
      v16 = 136315906;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 99;
      v20 = 2048;
      v21 = this;
      v22 = 2048;
      v23 = v8;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [(((uintptr_t) pInBaseAddress) & vm_page_mask) != 0 is true]: \"base address %p must be aligned to the page size %lu!)\\n\"", (uint8_t *)&v16, 0x26u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "base address %p must be aligned to the page size %lu!)\n");
  }
  v3 = (_QWORD)a2 << *MEMORY[0x24BDB03C0];
  v4 = mmap(this, v3, 0, 4114, -1, 0);
  if (v4 == (void *)-1)
  {
    v10 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)0xFFFFFFFFFFFFFFFFLL) + 112);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      v16 = 136316162;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 105;
      v20 = 2048;
      v21 = (Phase::VirtualAllocator *)v3;
      v22 = 2048;
      v23 = -1;
      v24 = 1024;
      v25 = v11;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [pBaseAddress == MAP_FAILED is true]: \"mmap() failed to map %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v16, 0x2Cu);
    }
    v12 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v12, "mmap() failed to map %zu bytes from address space %p (errno: %d)\n");
  }
  v5 = (uint64_t)v4;
  result = (Phase::Logger *)msync(v4, v3, 18);
  if ((_DWORD)result == -1)
  {
    v13 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 112);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      v16 = 136316162;
      v17 = "VirtualAllocator.cpp";
      v18 = 1024;
      v19 = 109;
      v20 = 2048;
      v21 = (Phase::VirtualAllocator *)v3;
      v22 = 2048;
      v23 = v5;
      v24 = 1024;
      v25 = v14;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::logic_error) [result == -1 is true]: \"msync() failed to sync %zu bytes from address space %p (errno: %d)\\n\"", (uint8_t *)&v16, 0x2Cu);
    }
    v15 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v15, "msync() failed to sync %zu bytes from address space %p (errno: %d)\n");
  }
  return result;
}

void sub_2166E7814(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::VoiceBufferExchange::AllocateVoiceBuffer@<X0>(int a1@<W1>, uint64_t *a2@<X8>)
{
  void *v5;
  uint64_t v6;
  _QWORD *result;

  v5 = malloc_type_malloc(4 * a1, 0x100004052888210uLL);
  v6 = operator new();
  *(_QWORD *)v6 = v5;
  *(_DWORD *)(v6 + 8) = a1;
  *(_BYTE *)(v6 + 12) = 1;
  *a2 = v6;
  result = (_QWORD *)operator new();
  *result = &off_24D582248;
  result[1] = 0;
  result[2] = 0;
  result[3] = v6;
  a2[1] = (uint64_t)result;
  return result;
}

void sub_2166E78D8(void *a1)
{
  void **v1;

  __cxa_begin_catch(a1);
  free(*v1);
  *v1 = 0;
  MEMORY[0x2199F9D70](v1, 0x1080C4020793F04);
  __cxa_rethrow();
}

void sub_2166E7908(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void Phase::Controller::VoiceBufferExchange::CommitVoiceBuffer(uint64_t a1, uint64_t *a2)
{
  unsigned int *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v2 = (unsigned int *)(a1 + 8);
  v3 = a2[1];
  v9 = *a2;
  v10 = (std::__shared_weak_count *)v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  caulk::concurrent::multi_buffer<std::shared_ptr<Phase::DspLayer::VoiceBuffer>,3>::write(v2, &v9);
  v6 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_2166E79A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t caulk::concurrent::multi_buffer<std::shared_ptr<Phase::DspLayer::VoiceBuffer>,3>::write(unsigned int *a1, uint64_t *a2)
{
  unsigned int v4;
  unsigned int i;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v11;

  v11 = 0;
  if (a1[1] == 3)
    v4 = 0;
  else
    v4 = a1[1];
  for (i = atomic_load(a1); v4 == (unsigned __int16)i || v4 == HIWORD(i); i = atomic_load(a1))
  {
    caulk::concurrent::details::spinloop::spin((uint64_t)&v11);
    if (v4 == 2)
      v4 = 0;
    else
      ++v4;
  }
  std::optional<std::shared_ptr<Phase::DspLayer::VoiceBuffer>>::operator=[abi:ne180100]<std::shared_ptr<Phase::DspLayer::VoiceBuffer>&,void>((uint64_t)&a1[6 * v4 + 2], a2);
  do
  {
    v7 = __ldaxr(a1);
    if (v7 != i)
    {
      __clrex();
      while (1)
      {
        v8 = __ldaxr(a1);
        if (v8 != v7)
          break;
        if (!__stlxr((unsigned __int16)v7 | (v4 << 16), a1))
        {
          v9 = 1;
LABEL_22:
          v7 = v8;
          if (v9)
            goto LABEL_23;
        }
      }
      v9 = 0;
      __clrex();
      goto LABEL_22;
    }
  }
  while (__stlxr((unsigned __int16)i | ((unsigned __int16)v4 << 16), a1));
LABEL_23:
  a1[1] = v4 + 1;
  return (uint64_t)&a1[6 * v4 + 2];
}

void Phase::Controller::VoiceBufferExchange::PrepareVoiceBufferParameterForSubmission(Phase::Controller::VoiceBufferExchange *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  unsigned int v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (uint64_t *)caulk::concurrent::multi_buffer<std::shared_ptr<Phase::DspLayer::VoiceBuffer>,3>::read_if ((unsigned int *)this + 2);
  if (v4)
  {
    v5 = *(_DWORD *)this;
    v6 = *v4;
    v7 = (std::__shared_weak_count *)v4[1];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      *(_DWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = v6;
      *(_QWORD *)(a2 + 16) = v7;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      *(_BYTE *)(a2 + 24) = 1;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    else
    {
      *(_DWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = v6;
      *(_QWORD *)(a2 + 16) = 0;
      *(_BYTE *)(a2 + 24) = 1;
    }
  }
  else
  {
    *(_DWORD *)a2 = 0x7FFFFFFF;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_BYTE *)(a2 + 24) = 0;
  }
}

uint64_t caulk::concurrent::multi_buffer<std::shared_ptr<Phase::DspLayer::VoiceBuffer>,3>::read_if (unsigned int *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t result;
  unsigned int *v5;

  v1 = atomic_load(a1);
  v2 = HIWORD(v1);
  if (HIWORD(v1) == 0xFFFF)
  {
    LOWORD(v3) = v1;
  }
  else
  {
    do
    {
      while (1)
      {
        v3 = __ldaxr(a1);
        if (v3 != v1)
          break;
        if (!__stlxr(v2 | 0xFFFF0000, a1))
          goto LABEL_9;
      }
      __clrex();
      v2 = HIWORD(v3);
      v1 = v3;
    }
    while (HIWORD(v3) != 0xFFFF);
  }
  v2 = (unsigned __int16)v3;
  if ((unsigned __int16)v3 == 0xFFFF)
    return 0;
LABEL_9:
  v5 = &a1[6 * v2];
  if (*((_BYTE *)v5 + 24))
    return (uint64_t)(v5 + 2);
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

void std::__shared_ptr_pointer<Phase::DspLayer::VoiceBuffer *,Phase::Controller::VoiceBufferExchange::AllocateVoiceBuffer(int)::$_0,std::allocator<Phase::DspLayer::VoiceBuffer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

void std::__shared_ptr_pointer<Phase::DspLayer::VoiceBuffer *,Phase::Controller::VoiceBufferExchange::AllocateVoiceBuffer(int)::$_0,std::allocator<Phase::DspLayer::VoiceBuffer>>::__on_zero_shared(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 24);
  free(*v1);
  *v1 = 0;
  JUMPOUT(0x2199F9D70);
}

uint64_t std::optional<std::shared_ptr<Phase::DspLayer::VoiceBuffer>>::operator=[abi:ne180100]<std::shared_ptr<Phase::DspLayer::VoiceBuffer>&,void>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  if (*(_BYTE *)(a1 + 16))
  {
    std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100]((_QWORD *)a1, a2);
  }
  else
  {
    v3 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v3;
    if (v3)
    {
      v4 = (unint64_t *)(v3 + 8);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
    *(_BYTE *)(a1 + 16) = 1;
  }
  return a1;
}

uint64_t Phase::Controller::VoiceBufferExchangeManager::VoiceBufferExchangeManager(uint64_t a1, int **a2)
{
  int *v3;
  int *v4;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  v3 = *a2;
  v4 = a2[1];
  while (v3 != v4)
  {
    std::__hash_table<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>>>::__emplace_unique_key_args<int,int const&,int const&>(a1, v3, v3, v3);
    ++v3;
  }
  return a1;
}

void sub_2166E7D48(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::VoiceBufferExchangeManager::GetManagedVoiceBuffer@<X0>(Phase::Controller::VoiceBufferExchangeManager *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  NSObject *v8;
  std::runtime_error *exception;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!std::__hash_table<std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::__unordered_map_hasher<Phase::Controller::IR::IRBuilder::Processor,std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::hash<Phase::Controller::IR::IRBuilder::Processor>,std::equal_to<Phase::Controller::IR::IRBuilder::Processor>,true>,std::__unordered_map_equal<Phase::Controller::IR::IRBuilder::Processor,std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::equal_to<Phase::Controller::IR::IRBuilder::Processor>,std::hash<Phase::Controller::IR::IRBuilder::Processor>,true>,std::allocator<std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>>>::find<Phase::Controller::IR::IRBuilder::Processor>(this, a2))
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 512));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "VoiceBufferExchangeManager.mm";
      v12 = 1024;
      v13 = 33;
      v14 = 1024;
      v15 = a2;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Parameter %d not managed by VoiceBufferExchangeManager. \\n\"", (uint8_t *)&v10, 0x18u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter %d not managed by VoiceBufferExchangeManager. \n");
  }
  return Phase::Controller::VoiceBufferExchange::AllocateVoiceBuffer(a3, a4);
}

void sub_2166E7E78(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void Phase::Controller::VoiceBufferExchangeManager::CommitVoiceBuffer(_QWORD *a1, int a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  std::runtime_error *exception;
  uint64_t v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = std::__hash_table<std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::__unordered_map_hasher<Phase::Controller::IR::IRBuilder::Processor,std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::hash<Phase::Controller::IR::IRBuilder::Processor>,std::equal_to<Phase::Controller::IR::IRBuilder::Processor>,true>,std::__unordered_map_equal<Phase::Controller::IR::IRBuilder::Processor,std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>,std::equal_to<Phase::Controller::IR::IRBuilder::Processor>,std::hash<Phase::Controller::IR::IRBuilder::Processor>,true>,std::allocator<std::__hash_value_type<Phase::Controller::IR::IRBuilder::Processor,std::unordered_map<Phase::Controller::IR::IRBuilder::Method,Phase::Controller::IR::IRBuilderBase *>>>>::find<Phase::Controller::IR::IRBuilder::Processor>(a1, a2);
  if (!v5)
  {
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 512));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "VoiceBufferExchangeManager.mm";
      v17 = 1024;
      v18 = 48;
      v19 = 1024;
      v20 = a2;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Parameter %d not managed by VoiceBufferExchangeManager. \\n\"", buf, 0x18u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter %d not managed by VoiceBufferExchangeManager. \n");
  }
  v6 = (uint64_t)(v5 + 3);
  v7 = (std::__shared_weak_count *)a3[1];
  v14[0] = *a3;
  v14[1] = (uint64_t)v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  Phase::Controller::VoiceBufferExchange::CommitVoiceBuffer(v6, v14);
  if (v7)
  {
    v10 = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_2166E801C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void Phase::Controller::VoiceBufferExchangeManager::GetPreparedVoiceBufferParameters(Phase::Controller::VoiceBufferExchangeManager *this@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  char v24;
  _QWORD v25[5];

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2)
  {
    while (1)
    {
      Phase::Controller::VoiceBufferExchange::PrepareVoiceBufferParameterForSubmission((Phase::Controller::VoiceBufferExchange *)(v2 + 3), (uint64_t)&v21);
      v4 = v22;
      if (v22)
        break;
      v7 = v23;
      if (v23)
        goto LABEL_24;
LABEL_28:
      v2 = (_QWORD *)*v2;
      if (!v2)
        return;
    }
    v5 = a2[1];
    v6 = a2[2];
    if (v5 >= v6)
    {
      v11 = (uint64_t)(v5 - *a2) >> 5;
      v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 59)
        std::vector<Phase::Controller::VoiceBufferParameter>::__throw_length_error[abi:ne180100]();
      v13 = v6 - *a2;
      if (v13 >> 4 > v12)
        v12 = v13 >> 4;
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0)
        v14 = 0x7FFFFFFFFFFFFFFLL;
      else
        v14 = v12;
      v25[4] = a2 + 2;
      if (v14)
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::SpatialModeler::GraphDescriptionNode>>((uint64_t)(a2 + 2), v14);
      else
        v15 = 0;
      v16 = &v15[32 * v11];
      v25[0] = v15;
      v25[1] = v16;
      v25[3] = &v15[32 * v14];
      *(_DWORD *)v16 = v21;
      *((_QWORD *)v16 + 1) = v4;
      v7 = v23;
      *((_QWORD *)v16 + 2) = v23;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
      }
      v16[24] = v24;
      v25[2] = v16 + 32;
      std::vector<Phase::Controller::VoiceBufferParameter>::__swap_out_circular_buffer(a2, v25);
      v10 = a2[1];
      std::__split_buffer<Phase::Controller::VoiceBufferParameter>::~__split_buffer((uint64_t)v25);
    }
    else
    {
      *(_DWORD *)v5 = v21;
      *(_QWORD *)(v5 + 8) = v4;
      v7 = v23;
      *(_QWORD *)(v5 + 16) = v23;
      if (v7)
      {
        v8 = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      *(_BYTE *)(v5 + 24) = v24;
      v10 = v5 + 32;
    }
    a2[1] = v10;
    if (!v7)
      goto LABEL_28;
LABEL_24:
    v19 = (unint64_t *)&v7->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    goto LABEL_28;
  }
}

void sub_2166E8208(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v2);
  std::vector<Phase::Controller::VoiceBufferParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>>>::__emplace_unique_key_args<int,int const&,int const&>(uint64_t a1, int *a2, int *a3, int *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  int v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  int8x8_t prime;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint8x8_t v29;
  unint64_t v30;
  uint8x8_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  void *v38;
  _QWORD v39[2];
  char v40;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  v12 = *a3;
  v13 = *a4;
  v14 = (_QWORD *)(a1 + 16);
  v15 = operator new(0x70uLL);
  v16 = 0;
  v39[0] = v15;
  v39[1] = a1 + 16;
  *v15 = 0;
  v15[1] = v6;
  *((_DWORD *)v15 + 4) = v12;
  *((_DWORD *)v15 + 6) = v13;
  v15[4] = 0xFFFFFFFFLL;
  do
  {
    v17 = (char *)&v15[v16];
    v17[40] = 0;
    v17[56] = 0;
    v16 += 3;
  }
  while (v16 != 9);
  v40 = 1;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v7 || (float)(v19 * (float)v7) < v18)
  {
    v20 = 1;
    if (v7 >= 3)
      v20 = (v7 & (v7 - 1)) != 0;
    v21 = v20 | (2 * v7);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      prime = (int8x8_t)v22;
    else
      prime = (int8x8_t)v21;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v7 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v7)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v7)
    {
      v30 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (v31 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
      {
        v30 = std::__next_prime(v30);
      }
      else
      {
        v32 = 1 << -(char)__clz(v30 - 1);
        if (v30 >= 2)
          v30 = v32;
      }
      if (*(_QWORD *)&prime <= v30)
        prime = (int8x8_t)v30;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v24 = operator new(8 * *(_QWORD *)&prime);
          v25 = *(void **)a1;
          *(_QWORD *)a1 = v24;
          if (v25)
            operator delete(v25);
          v26 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v26++) = 0;
          while (*(_QWORD *)&prime != v26);
          v27 = (_QWORD *)*v14;
          if (*v14)
          {
            v28 = v27[1];
            v29 = (uint8x8_t)vcnt_s8(prime);
            v29.i16[0] = vaddlv_u8(v29);
            if (v29.u32[0] > 1uLL)
            {
              if (v28 >= *(_QWORD *)&prime)
                v28 %= *(_QWORD *)&prime;
            }
            else
            {
              v28 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v14;
            v33 = (_QWORD *)*v27;
            if (*v27)
            {
              do
              {
                v34 = v33[1];
                if (v29.u32[0] > 1uLL)
                {
                  if (v34 >= *(_QWORD *)&prime)
                    v34 %= *(_QWORD *)&prime;
                }
                else
                {
                  v34 &= *(_QWORD *)&prime - 1;
                }
                if (v34 != v28)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v34))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v34) = v27;
                    goto LABEL_57;
                  }
                  *v27 = *v33;
                  *v33 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v34);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v34) = v33;
                  v33 = v27;
                }
                v34 = v28;
LABEL_57:
                v27 = v33;
                v33 = (_QWORD *)*v33;
                v28 = v34;
              }
              while (v33);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_61;
        }
        v38 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v38)
          operator delete(v38);
        v7 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_61:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v35 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  i = (uint64_t *)v39[0];
  if (v35)
  {
    *(_QWORD *)v39[0] = *v35;
LABEL_74:
    *v35 = i;
    goto LABEL_75;
  }
  *(_QWORD *)v39[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v14;
  if (*i)
  {
    v36 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v36 >= v7)
        v36 %= v7;
    }
    else
    {
      v36 &= v7 - 1;
    }
    v35 = (_QWORD *)(*(_QWORD *)a1 + 8 * v36);
    goto LABEL_74;
  }
LABEL_75:
  v39[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>>>>::reset[abi:ne180100]((uint64_t)v39);
  return i;
}

void sub_2166E8674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,Phase::Controller::VoiceBufferExchange>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  _BYTE *v1;
  uint64_t i;

  v1 = *(_BYTE **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      for (i = 0; i != -72; i -= 24)
      {
        if (v1[i + 104])
          std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&v1[i + 88]);
      }
    }
    operator delete(v1);
  }
}

uint64_t Phase::DspLayer::VoiceEngine::VoiceEngine(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  uint64_t i;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 1065353216;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 256;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 136), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 136) = v3;
  }
  for (i = 0; i != 73728; i += 72)
  {
    v5 = (_QWORD *)(a1 + i);
    v5[156] = 0;
    v5[149] = 0;
    v5[151] = 0;
    v5[150] = 0;
  }
  bzero((void *)(a1 + 168), 0x12404uLL);
  *(_QWORD *)(a1 + 160) = a1 + 1192;
  v6 = (_QWORD *)(a1 + 1264);
  v7 = 1023;
  do
  {
    *(v6 - 8) = v6;
    *v6 = v6 - 9;
    v6 += 9;
    --v7;
  }
  while (v7);
  *(_QWORD *)(a1 + 74848) = a1 + 74776;
  *(_QWORD *)(a1 + 74928) = 0;
  *(_QWORD *)(a1 + 74936) = 0;
  v8 = malloc_type_malloc(0x2EE00uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 74944) = v8;
  *(_QWORD *)(a1 + 74928) = DefaultVoiceEngineCallback;
  *(_QWORD *)(a1 + 64) = 0;
  bzero(v8, 0x2EE00uLL);
  return a1;
}

void sub_2166E8824(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 32);
  if (v3)
  {
    *(_QWORD *)(v1 + 40) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void Phase::DspLayer::VoiceEngine::~VoiceEngine(Phase::DspLayer::VoiceEngine *this)
{
  uint64_t v2;
  Phase::DspLayer::VoiceEngine *v3;
  uint64_t v4;
  void *v5;

  *((_QWORD *)this + 9366) = DefaultVoiceEngineCallback;
  *((_QWORD *)this + 9367) = 0;
  free(*((void **)this + 9368));
  free(*((void **)this + 7));
  v2 = 73728;
  do
  {
    v3 = *(Phase::DspLayer::VoiceEngine **)((char *)this + v2 + 1176);
    if ((Phase::DspLayer::VoiceEngine *)((char *)this + v2 + 1152) == v3)
    {
      v3 = (Phase::DspLayer::VoiceEngine *)((char *)this + v2 + 1152);
      v4 = 4;
    }
    else
    {
      if (!v3)
        goto LABEL_7;
      v4 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_7:
    v2 -= 72;
  }
  while (v2);
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  v5 = (void *)*((_QWORD *)this + 4);
  if (v5)
  {
    *((_QWORD *)this + 5) = v5;
    operator delete(v5);
  }
}

void Phase::DspLayer::VoiceEngine::Configure(uint64_t a1, _DWORD *a2)
{
  _DWORD *v2;
  double v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a2;
  v4 = *(double *)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(float *)&v4 = 1.0 / v4;
  *(_DWORD *)(a1 + 8) = LODWORD(v4);
  std::vector<Phase::DspLayer::VoicePool *>::reserve((void **)(a1 + 32), (int)a2[2]);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 32);
  Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::Clear(a1 + 160);
  v5 = (v2[3] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 112) = v5;
  v6 = (v2[5] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 116) = v6;
  v7 = (v2[6] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 120) = v7;
  v8 = (v2[4] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 124) = v8;
  v9 = (v2[7] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 128) = v9;
  v10 = (v2[8] + 3) & 0xFFFFFFFC;
  *(_DWORD *)(a1 + 132) = v10;
  LODWORD(v2) = v6 + v5 + v7 + v8 + v9 + v10;
  free(*(void **)(a1 + 56));
  v11 = 4 * (int)v2;
  v12 = malloc_type_malloc(v11, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 56) = v12;
  bzero(v12, v11);
  v13 = 0;
  v14 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 64) = v14;
  v15 = a1 + 72;
  do
  {
    v14 += 4 * *(int *)(v15 + 4 * v13 + 40);
    *(_QWORD *)(v15 + 8 * v13++) = v14;
  }
  while (v13 != 5);
}

void std::vector<Phase::DspLayer::VoicePool *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<Phase::DspLayer::VoicePool *>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::Clear(uint64_t result)
{
  uint64_t i;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  for (i = 0; i != 128; ++i)
  {
    v2 = result + 8 * i;
    v5 = *(_QWORD *)(v2 + 8);
    v3 = (_QWORD *)(v2 + 8);
    v4 = v5;
    if (v5)
    {
      v6 = v4;
      do
      {
        v7 = v6;
        v6 = *(_QWORD *)(v6 + 8);
      }
      while (v6);
      v8 = *(_QWORD **)result;
      *(_QWORD *)(v7 + 8) = *(_QWORD *)result;
      if (v8)
        *v8 = v7;
      *(_QWORD *)result = v4;
    }
    *v3 = 0;
  }
  *(_DWORD *)(result + 74760) = 0;
  return result;
}

uint64_t Phase::DspLayer::VoiceEngine::AddPool(Phase::DspLayer::VoiceEngine *this, Phase::DspLayer::VoicePool *a2, uint64_t a3)
{
  uint64_t v5;
  char **v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  Phase::DspLayer::VoicePool *v23;

  v23 = a2;
  if ((a3 & 0x80000000) != 0)
  {
    v8 = (_QWORD *)*((_QWORD *)this + 5);
  }
  else
  {
    v5 = a3;
    v7 = *((_QWORD *)this + 4);
    v8 = (_QWORD *)*((_QWORD *)this + 5);
    v6 = (char **)((char *)this + 32);
    if ((int)(((unint64_t)v8 - v7) >> 3) > (int)a3)
    {
      std::vector<Phase::DspLayer::VoicePool *>::insert(v6, (char *)(v7 + 8 * a3), (char *)&v23);
      return v5;
    }
  }
  v9 = *((_QWORD *)this + 6);
  if ((unint64_t)v8 >= v9)
  {
    v11 = *((_QWORD *)this + 4);
    v12 = ((uint64_t)v8 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<Phase::DspLayer::VoicePool *>::__throw_length_error[abi:ne180100]();
    v13 = v9 - v11;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)this + 48, v15);
    else
      v16 = 0;
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    *(_QWORD *)v17 = a2;
    v10 = v17 + 8;
    v20 = (char *)*((_QWORD *)this + 4);
    v19 = (char *)*((_QWORD *)this + 5);
    if (v19 != v20)
    {
      do
      {
        v21 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *((_QWORD *)v17 - 1) = v21;
        v17 -= 8;
      }
      while (v19 != v20);
      v19 = (char *)*((_QWORD *)this + 4);
    }
    *((_QWORD *)this + 4) = v17;
    *((_QWORD *)this + 5) = v10;
    *((_QWORD *)this + 6) = v18;
    if (v19)
      operator delete(v19);
  }
  else
  {
    *v8 = a2;
    v10 = v8 + 1;
  }
  *((_QWORD *)this + 5) = v10;
  return (((unint64_t)v10 - *((_QWORD *)this + 4)) >> 3) - 1;
}

char *std::vector<Phase::DspLayer::VoicePool *>::insert(char **a1, char *a2, char *a3)
{
  char *v3;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  int64_t v33;
  char *v34;
  size_t v35;
  char *v36;
  char *v37;

  v3 = a3;
  v6 = *a1;
  v5 = a1[1];
  v7 = a2 - *a1;
  v8 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF8];
  v10 = (uint64_t)(a1 + 2);
  v9 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v9)
  {
    v15 = ((v5 - v6) >> 3) + 1;
    if (v15 >> 61)
      std::vector<Phase::DspLayer::VoicePool *>::__throw_length_error[abi:ne180100]();
    v17 = v7 >> 3;
    v18 = v9 - (_QWORD)v6;
    if (v18 >> 2 > v15)
      v15 = v18 >> 2;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
      v19 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v19 = v15;
    if (v19)
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)(a1 + 2), v19);
    else
      v20 = 0;
    v21 = &v20[8 * v17];
    v22 = &v20[8 * v19];
    if (v17 == v19)
    {
      if (v7 < 1)
      {
        if (v6 == a2)
          v24 = 1;
        else
          v24 = v7 >> 2;
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>(v10, v24);
        v21 = &v25[8 * (v24 >> 2)];
        v22 = &v25[8 * v26];
        if (v20)
        {
          v27 = &v25[8 * v26];
          operator delete(v20);
          v22 = v27;
        }
      }
      else
      {
        v23 = v17 + 2;
        if (v17 >= -1)
          v23 = v17 + 1;
        v21 -= 8 * (v23 >> 1);
      }
    }
    *(_QWORD *)v21 = *(_QWORD *)v3;
    v28 = *a1;
    v29 = v21;
    if (*a1 != v8)
    {
      v30 = v8;
      v29 = v21;
      do
      {
        v31 = *((_QWORD *)v30 - 1);
        v30 -= 8;
        *((_QWORD *)v29 - 1) = v31;
        v29 -= 8;
      }
      while (v30 != v28);
    }
    v32 = a1[1];
    v33 = v32 - v8;
    if (v32 != v8)
    {
      v34 = v8;
      v35 = v32 - v8;
      v36 = v22;
      memmove(v21 + 8, v34, v35);
      v22 = v36;
    }
    v37 = *a1;
    *a1 = v29;
    a1[1] = &v21[v33 + 8];
    a1[2] = v22;
    if (v37)
      operator delete(v37);
    return v21;
  }
  else if (v8 == v5)
  {
    *(_QWORD *)v8 = *(_QWORD *)a3;
    a1[1] = v8 + 8;
  }
  else
  {
    v11 = v8 + 8;
    v12 = v5 - 8;
    v13 = a1[1];
    while (v12 < v5)
    {
      v14 = *(_QWORD *)v12;
      v12 += 8;
      *(_QWORD *)v13 = v14;
      v13 += 8;
    }
    a1[1] = v13;
    if (v5 != v11)
      memmove(&v5[-8 * ((v5 - v11) >> 3)], v8, v5 - v11);
    if (v8 <= v3)
      v3 += 8 * (a1[1] > v3);
    *(_QWORD *)v8 = *(_QWORD *)v3;
  }
  return v8;
}

void sub_2166E8E94(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

BOOL Phase::DspLayer::VoiceEngine::RemovePool(uint64_t a1, uint64_t a2)
{
  char *v3;
  char *v4;

  v3 = *(char **)(a1 + 32);
  v4 = *(char **)(a1 + 40);
  if (v3 != v4)
  {
    while (*(_QWORD *)v3 != a2)
    {
      v3 += 8;
      if (v3 == v4)
      {
        v3 = *(char **)(a1 + 40);
        break;
      }
    }
  }
  if (v3 != v4)
  {
    if (v4 != v3 + 8)
      memmove(v3, v3 + 8, v4 - (v3 + 8));
    *(_QWORD *)(a1 + 40) = v4 - 8;
  }
  return v3 != v4;
}

uint64_t Phase::DspLayer::VoiceEngine::Run(uint64_t **this)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;

  result = Phase::DspLayer::VoiceEngine::ExecuteActions((Phase::DspLayer::VoiceEngine *)this);
  v3 = this[4];
  v4 = this[5];
  while (v3 != v4)
  {
    v5 = *v3++;
    result = Phase::DspLayer::VoicePool::Run(v5);
  }
  this[2] = (uint64_t *)((char *)this[2] + 1);
  ++*((_DWORD *)this + 7);
  return result;
}

uint64_t Phase::DspLayer::VoiceEngine::ExecuteActions(Phase::DspLayer::VoiceEngine *this)
{
  char *v2;
  uint64_t *v3;
  uint64_t i;

  v2 = (char *)this + 160;
  v3 = Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::PopAtTime((uint64_t)this + 160, *((_QWORD *)this + 2));
  for (i = 0;
        v3;
        v3 = Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::PopAtTime((uint64_t)v2, *((_QWORD *)this + 2)))
  {
    std::function<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator()((uint64_t)(v3 + 1), (uint64_t)this, *((_QWORD *)this + 2), v3[5]);
    i = (i + 1);
  }
  return i;
}

uint64_t Phase::DspLayer::VoiceEngine::ScheduleAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)(a1 + 16) + a3;
  v6 = v11;
  v7 = v12;
  std::__function::__value_func<void ()(Phase::MessageWriteBuffer &,Phase::MessageWriteBuffer &,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v12, a2);
  v14 = a4;
  v8 = Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::ScheduleEvent(a1 + 160, v11, &v11);
  if (v13 == v12)
  {
    v9 = 4;
  }
  else
  {
    if (!v13)
      goto LABEL_6;
    v9 = 5;
    v7 = v13;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v9))(v7);
LABEL_6:
  if (v8)
    return v6;
  else
    return -1;
}

void sub_2166E90B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  _QWORD *v14;
  uint64_t v16;

  if (a14 == v14)
  {
    v16 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v16 = 5;
    v14 = a14;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::ScheduleEvent(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::ScheduleEvent(a1, a2);
  v5 = v4;
  if (v4)
  {
    *v4 = *a3;
    std::function<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator=(v4 + 1, (uint64_t)(a3 + 1));
    v5[5] = a3[5];
  }
  return v5 != 0;
}

uint64_t *Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::PopAtTime(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *(uint64_t **)(a1 + 8 * (a2 & 0x7F) + 8);
  if (!v2)
    return 0;
  while (1)
  {
    v3 = v2[2];
    if (v3 >= a2)
      break;
    v2 = (uint64_t *)v2[1];
    if (!v2)
      return 0;
  }
  if (v3 != a2)
    return 0;
  Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::RemoveNode(a1, v2);
  return v2 + 3;
}

uint64_t std::function<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = a2;
  v6 = a4;
  v7 = a3;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *))(*(_QWORD *)v4 + 48))(v4, &v8, &v7, &v6);
}

void std::vector<Phase::DspLayer::VoicePool *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

_QWORD *Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::ScheduleEvent(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;

  v2 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    v3 = (_QWORD *)v2[1];
    *(_QWORD *)a1 = v3;
    if (v3)
      *v3 = 0;
    *v2 = 0;
    v2[1] = 0;
    v2[2] = a2;
    v4 = a1 + 8 * (a2 & 0x7F);
    v7 = *(_QWORD **)(v4 + 8);
    v6 = (_QWORD *)(v4 + 8);
    v5 = v7;
    if (v7)
    {
      if (v5[2] <= a2)
      {
        while (1)
        {
          v9 = v5;
          v5 = (_QWORD *)v5[1];
          if (!v5)
            break;
          if (v5[2] > a2)
          {
            *v5 = v2;
            *v2 = v9;
            v2[1] = v5;
            v9[1] = v2;
            goto LABEL_8;
          }
        }
        v9[1] = v2;
        *v2 = v9;
        goto LABEL_8;
      }
      v2[1] = v5;
      *v5 = v2;
    }
    *v6 = v2;
LABEL_8:
    ++*(_DWORD *)(a1 + 74760);
    return v2 + 3;
  }
  return 0;
}

_QWORD *std::function<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(Phase::MessageWriteBuffer &,Phase::MessageWriteBuffer &,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

_QWORD *std::__function::__value_func<void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2166E9494(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t Phase::CalendarQueue<128,1024,Phase::DspLayer::VoiceEngine::Action>::RemoveNode(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t **v4;

  v2 = *a2;
  if (!*a2)
    v2 = result + 8 * (a2[2] & 0x7F);
  *(_QWORD *)(v2 + 8) = a2[1];
  v3 = (uint64_t *)a2[1];
  if (v3)
    *v3 = *a2;
  v4 = *(uint64_t ***)result;
  *a2 = 0;
  a2[1] = (uint64_t)v4;
  if (v4)
    *v4 = a2;
  *(_QWORD *)result = a2;
  --*(_DWORD *)(result + 74760);
  return result;
}

Phase::DspLayer::VoiceMap *Phase::DspLayer::VoiceMap::VoiceMap(Phase::DspLayer::VoiceMap *this, int a2, int a3)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a2 - 1;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  v5 = 1;
  do
  {
    v4 |= v4 >> v5;
    v6 = v5 >= 0x10;
    v5 *= 2;
  }
  while (!v6);
  v7 = v4 + 1;
  *((_DWORD *)this + 3) = v7;
  v8 = a3 - 1;
  v9 = 1;
  do
  {
    v8 |= v8 >> v9;
    v6 = v9 >= 0x10;
    v9 *= 2;
  }
  while (!v6);
  v10 = v7 / (int)(v8 + 1);
  if (v10 <= 2)
    v10 = 2;
  *((_DWORD *)this + 2) = v10;
  *(_DWORD *)this = v10 - 1;
  *((_QWORD *)this + 2) = malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
  *((_QWORD *)this + 3) = malloc_type_malloc(24 * *((int *)this + 3), 0x102004062D53EE8uLL);
  bzero(*((void **)this + 2), 8 * *((int *)this + 2));
  v11 = *((unsigned int *)this + 3);
  if ((int)v11 >= 1)
  {
    v12 = (_QWORD *)(*((_QWORD *)this + 3) + 16);
    do
    {
      *(v12 - 1) = 0;
      *v12 = -1;
      *(v12 - 2) = 0;
      v12 += 3;
      --v11;
    }
    while (v11);
  }
  return this;
}

uint64_t Phase::DspLayer::VoiceMap::Put(Phase::DspLayer::VoiceMap *this, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _DWORD *v11;
  int v12;
  int v13;
  int v14;

  if ((a3 & 0x80000000) != 0)
    return 0;
  v3 = *((_DWORD *)this + 3);
  if (v3 <= (int)a3)
    return 0;
  v4 = *((_QWORD *)this + 3);
  v5 = (_QWORD *)(v4 + 24 * a3);
  v6 = v5 + 2;
  if (v5[2] != -1 || *v5)
    return 0;
  v8 = (_QWORD *)(*((_QWORD *)this + 2) + 8 * (int)(*(_DWORD *)this & a2));
  v9 = (_QWORD *)*v8;
  if (*v8)
  {
    v10 = (_QWORD *)*v8;
    do
    {
      if (v10[2] == a2)
      {
        if (-1431655765 * (((unint64_t)v10 - v4) >> 3) != a3)
        {
          *v6 = a2;
          *(_OWORD *)v5 = *(_OWORD *)v10;
          if (*v10)
            *(_QWORD *)(*v10 + 8) = v5;
          if (v10[1])
            v8 = (_QWORD *)v10[1];
          *v8 = v5;
          v10[1] = 0;
          v10[2] = -1;
          *v10 = 0;
        }
        return 1;
      }
      v10 = (_QWORD *)*v10;
    }
    while (v10);
    v13 = *((_DWORD *)this + 1);
    v11 = (_DWORD *)((char *)this + 4);
    v12 = v13;
    if (v13 >= v3)
      return 0;
    *v6 = a2;
    *(_QWORD *)(v4 + 24 * a3 + 8) = 0;
    *v5 = v9;
    v9[1] = v5;
  }
  else
  {
    v14 = *((_DWORD *)this + 1);
    v11 = (_DWORD *)((char *)this + 4);
    v12 = v14;
    if (v14 >= v3)
      return 0;
    *v6 = a2;
    *v5 = 0;
    v5[1] = 0;
  }
  *v8 = v5;
  *v11 = v12 + 1;
  return 1;
}

BOOL Phase::DspLayer::VoiceMap::Remove(Phase::DspLayer::VoiceMap *this, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = (_QWORD *)(*((_QWORD *)this + 2) + 8 * (int)(*(_DWORD *)this & a2));
  while (1)
  {
    v2 = (_QWORD *)*v2;
    if (!v2)
      break;
    if (v2[2] == a2)
    {
      v4 = (_QWORD *)*v2;
      v3 = (_QWORD *)v2[1];
      if (v3)
        *v3 = v4;
      else
        *(_QWORD *)(*((_QWORD *)this + 2) + 8 * (int)(*(_DWORD *)this & a2)) = v4;
      if (*v2)
        *(_QWORD *)(*v2 + 8) = v3;
      v2[1] = 0;
      v2[2] = -1;
      *v2 = 0;
      --*((_DWORD *)this + 1);
      return v2 != 0;
    }
  }
  return v2 != 0;
}

uint64_t Phase::DspLayer::VoiceMap::Move(Phase::DspLayer::VoiceMap *this, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if ((a2 & 0x80000000) != 0)
    return 0;
  if (*((_DWORD *)this + 3) <= (signed int)a2)
    return 0;
  v3 = *(_QWORD *)(*((_QWORD *)this + 3) + 24 * a2 + 16);
  if (v3 < 0)
    return 0;
  else
    return Phase::DspLayer::VoiceMap::Put(this, v3, a3);
}

Phase::DspLayer::VoicePool *Phase::DspLayer::VoicePool::VoicePool(Phase::DspLayer::VoicePool *this, const char *a2, Phase::DspLayer::VoiceEngine *a3, int a4, int a5)
{
  unsigned int v8;
  signed int v9;
  int v10;

  *(_QWORD *)this = &off_24D582280;
  *((_DWORD *)this + 2) = (a4 + 3) & 0xFFFFFFFC;
  *((_DWORD *)this + 3) = 0;
  v8 = (a5 + 15) & 0xFFFFFFF0;
  v9 = v8 + v8 * ((a4 + 3) >> 2);
  *((_DWORD *)this + 4) = v8;
  *((_DWORD *)this + 5) = v9;
  *((_QWORD *)this + 3) = malloc_type_malloc(v9, 0x4221994CuLL);
  *((_QWORD *)this + 4) = a3;
  v10 = *((_DWORD *)this + 2) + 4;
  *((_DWORD *)this + 10) = *((_DWORD *)this + 5) / *((_DWORD *)this + 4);
  *((_DWORD *)this + 11) = v10;
  *((_QWORD *)this + 6) = a2;
  Phase::DspLayer::VoiceMap::VoiceMap((Phase::DspLayer::VoicePool *)((char *)this + 56), v10, 4);
  bzero(*((void **)this + 3), *((int *)this + 5));
  return this;
}

void Phase::DspLayer::VoicePool::~VoicePool(Phase::DspLayer::VoicePool *this)
{
  int v2;
  void (***v3)(_QWORD);

  *(_QWORD *)this = &off_24D582280;
  if (*((int *)this + 10) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = (void (***)(_QWORD))(*((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)v2);
      (**v3)(v3);
      ++v2;
    }
    while (v2 < *((_DWORD *)this + 10));
  }
  free(*((void **)this + 3));
  free(*((void **)this + 9));
  free(*((void **)this + 10));
}

{
  Phase::DspLayer::VoicePool::~VoicePool(this);
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::DspLayer::VoicePool::ExternalCallbackWithMessage(uint64_t result, uint64_t a2, uint64_t *a3, char a4, unsigned int *a5, _QWORD *a6)
{
  uint64_t *v8;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v8 = a3;
  v10 = result;
  switch(a4 & 0xF)
  {
    case 1:
      v11 = 0;
      goto LABEL_26;
    case 2:
      v8 = a3 + 1;
      goto LABEL_5;
    case 3:
      v12 = *(_QWORD *)(result + 32);
      v8 = a3 + 1;
      v13 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v12 + 74928))(*(_QWORD *)(v12 + 74936), v12, v10, v13, a2, a5);
LABEL_5:
      v11 = 1;
      goto LABEL_26;
    case 4:
      goto LABEL_10;
    case 5:
      v14 = *(_QWORD *)(result + 32);
      v8 = a3 + 2;
      v15 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v14 + 74928))(*(_QWORD *)(v14 + 74936), v14, v10, v15, a2, a5);
      goto LABEL_11;
    case 6:
      v16 = *(_QWORD *)(result + 32);
      v17 = v16 + 74928;
      goto LABEL_9;
    case 7:
      v18 = *(_QWORD *)(result + 32);
      v19 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v18 + 74928))(*(_QWORD *)(v18 + 74936), v18, v10, v19, a2, a5);
      v16 = *(_QWORD *)(v10 + 32);
      v17 = v16 + 74928;
LABEL_9:
      v20 = v8[1];
      Phase::DspLayer::VoicePool::SetMessageArguments(1u, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v17)(*(_QWORD *)(v17 + 8), v16, v10, v20, a2, a5);
LABEL_10:
      v8 += 2;
LABEL_11:
      v11 = 2;
      goto LABEL_26;
    case 8:
      goto LABEL_24;
    case 9:
      v21 = *(_QWORD *)(result + 32);
      v8 = a3 + 3;
      v22 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v21 + 74928))(*(_QWORD *)(v21 + 74936), v21, v10, v22, a2, a5);
      goto LABEL_25;
    case 0xA:
      v23 = *(_QWORD *)(result + 32);
      v24 = v23 + 74928;
      goto LABEL_15;
    case 0xB:
      v25 = *(_QWORD *)(result + 32);
      v26 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v25 + 74928))(*(_QWORD *)(v25 + 74936), v25, v10, v26, a2, a5);
      v23 = *(_QWORD *)(v10 + 32);
      v24 = v23 + 74928;
LABEL_15:
      v27 = v8[1];
      v28 = 1;
      goto LABEL_23;
    case 0xC:
      v23 = *(_QWORD *)(result + 32);
      v24 = v23 + 74928;
      goto LABEL_22;
    case 0xD:
      v29 = *(_QWORD *)(result + 32);
      v30 = v29 + 74928;
      v31 = *a3;
      v32 = 0;
      goto LABEL_21;
    case 0xE:
      v29 = *(_QWORD *)(result + 32);
      goto LABEL_20;
    case 0xF:
      v33 = *(_QWORD *)(result + 32);
      v34 = *a3;
      Phase::DspLayer::VoicePool::SetMessageArguments(0, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v33 + 74928))(*(_QWORD *)(v33 + 74936), v33, v10, v34, a2, a5);
      v29 = *(_QWORD *)(v10 + 32);
LABEL_20:
      v30 = v29 + 74928;
      v31 = v8[1];
      v32 = 1;
LABEL_21:
      Phase::DspLayer::VoicePool::SetMessageArguments(v32, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v30)(*(_QWORD *)(v30 + 8), v29, v10, v31, a2, a5);
      v23 = *(_QWORD *)(v10 + 32);
      v24 = v23 + 74928;
LABEL_22:
      v27 = v8[2];
      v28 = 2;
LABEL_23:
      Phase::DspLayer::VoicePool::SetMessageArguments(v28, a5, a6);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v24)(*(_QWORD *)(v24 + 8), v23, v10, v27, a2, a5);
LABEL_24:
      v8 += 3;
LABEL_25:
      v11 = 3;
LABEL_26:
      v35 = *(_QWORD *)(v10 + 32);
      v36 = *v8;
      Phase::DspLayer::VoicePool::SetMessageArguments(v11, a5, a6);
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(v35 + 74928))(*(_QWORD *)(v35 + 74936), v35, v10, v36, a2, a5);
      break;
    default:
      return result;
  }
  return result;
}

unsigned int *Phase::DspLayer::VoicePool::SetMessageArguments(unsigned int a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t v3;
  _DWORD *v4;
  _QWORD *v5;
  int v6;

  v3 = *a2;
  if ((int)v3 >= 1)
  {
    v4 = a2 + 4;
    v5 = a3;
    do
    {
      v6 = *(v4 - 2);
      switch(v6)
      {
        case 1:
          *v4 = *(_DWORD *)(*v5 + 4 * a1);
          break;
        case 2:
          *v4 = *(_DWORD *)(*v5 + 4 * a1);
          break;
        case 3:
          *(_QWORD *)v4 = a3[a1];
          break;
        default:
          *v4 = 0;
          break;
      }
      v4 += 4;
      ++v5;
      --v3;
    }
    while (v3);
  }
  return a2;
}

uint64_t Phase::DspLayer::VoicePool::Run(uint64_t this)
{
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v1 = *(_DWORD *)(this + 12);
  if (v1 >= 1)
  {
    v2 = this;
    if (v1 < 5)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v4 = *(_DWORD *)(this + 12);
      do
      {
        v5 = *(_QWORD *)(v2 + 24) + *(int *)(v2 + 16) * (uint64_t)v3;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v5 + 64))(v5, *(_QWORD *)(v2 + 32), v2, 15);
        ++v3;
        LOBYTE(v1) = v4 - 4;
        v6 = v4 > 8;
        v4 -= 4;
      }
      while (v6);
    }
    v7 = *(_QWORD *)(v2 + 24) + *(int *)(v2 + 16) * (uint64_t)v3;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v7 + 64))(v7, *(_QWORD *)(v2 + 32), v2, ~(-1 << v1));
  }
  return this;
}

uint64_t Phase::DspLayer::VoicePool::Play(Phase::DspLayer::VoicePool *this, uint64_t a2)
{
  Phase::DspLayer::VoiceMap *v4;
  _QWORD *v5;
  signed int v6;
  int v7;
  uint64_t v9;
  signed int v10;
  uint64_t v11;

  v4 = (Phase::DspLayer::VoicePool *)((char *)this + 56);
  v5 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  do
  {
    v5 = (_QWORD *)*v5;
    if (!v5)
    {
      v7 = *((_DWORD *)this + 3);
      goto LABEL_8;
    }
  }
  while (v5[2] != a2);
  v6 = -1431655765 * (((unint64_t)v5 - *((_QWORD *)this + 10)) >> 3);
  v7 = *((_DWORD *)this + 3);
  if (v6 < 0)
  {
LABEL_8:
    if (v7 + 4 >= *((_DWORD *)this + 11))
      return 1;
    *((_DWORD *)this + 3) = v7 + 1;
    v9 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v7 >> 2);
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v9 + 24))(v9, *((_QWORD *)this + 4), v7 & 3, a2);
    Phase::DspLayer::VoiceMap::Put(v4, a2, v7);
    (*(void (**)(uint64_t, _QWORD, Phase::DspLayer::VoicePool *, _QWORD))(*(_QWORD *)v9 + 72))(v9, *((_QWORD *)this + 4), this, v7 & 3);
    return 0;
  }
  if (v7 > v6)
    return 4;
  if (*((_DWORD *)this + 11) <= v6)
  {
    *((_DWORD *)this + 3) = v7 + 1;
    Phase::DspLayer::VoicePool::CopyVoiceState(this, v6, v7);
    v10 = *((_DWORD *)this + 11);
    if (v10 != v6)
    {
      Phase::DspLayer::VoicePool::CopyVoiceState(this, v10, v6);
      v6 = *((_DWORD *)this + 11);
    }
    *((_DWORD *)this + 11) = v6 + 1;
    v11 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v7 >> 2);
    (*(void (**)(uint64_t, _QWORD, Phase::DspLayer::VoicePool *, _QWORD))(*(_QWORD *)v11 + 88))(v11, *((_QWORD *)this + 4), this, v7 & 3);
    return 0;
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::CopyVoiceState(Phase::DspLayer::VoicePool *this, signed int a2, signed int a3)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*((_QWORD *)this + 3)
                                                                     + *((_DWORD *)this + 4) * (a3 >> 2))
                                                         + 104))(*((_QWORD *)this + 3) + *((_DWORD *)this + 4) * (a3 >> 2), *((_QWORD *)this + 3) + *((_DWORD *)this + 4) * (a2 >> 2), a2 & 3, a3 & 3);
  return Phase::DspLayer::VoiceMap::Move((Phase::DspLayer::VoicePool *)((char *)this + 56), a2, a3);
}

uint64_t Phase::DspLayer::VoicePool::Stop(Phase::DspLayer::VoicePool *this, uint64_t a2)
{
  Phase::DspLayer::VoiceMap *v3;
  int v4;
  _QWORD *v5;
  signed int v6;
  uint64_t v7;
  signed int v8;
  signed int v9;

  v4 = *((_DWORD *)this + 14);
  v3 = (Phase::DspLayer::VoicePool *)((char *)this + 56);
  v5 = (_QWORD *)(*((_QWORD *)v3 + 2) + 8 * (int)(v4 & a2));
  while (1)
  {
    v5 = (_QWORD *)*v5;
    if (!v5)
      break;
    if (v5[2] == a2)
    {
      v6 = -1431655765 * (((unint64_t)v5 - *((_QWORD *)this + 10)) >> 3);
      goto LABEL_6;
    }
  }
  v6 = -1;
LABEL_6:
  if (!Phase::DspLayer::VoiceMap::Remove(v3, a2))
    return 2;
  v7 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v6 >> 2);
  (*(void (**)(uint64_t, _QWORD, Phase::DspLayer::VoicePool *, _QWORD))(*(_QWORD *)v7 + 96))(v7, *((_QWORD *)this + 4), this, v6 & 3);
  v8 = *((_DWORD *)this + 3);
  if (v8 <= v6)
  {
    v9 = *((_DWORD *)this + 11);
    if (v9 <= v6)
    {
      *((_DWORD *)this + 11) = v9 + 1;
      goto LABEL_12;
    }
    return 2;
  }
  v9 = v8 - 1;
  *((_DWORD *)this + 3) = v8 - 1;
LABEL_12:
  if (v6 != v9)
    Phase::DspLayer::VoicePool::CopyVoiceState(this, v9, v6);
  return 0;
}

uint64_t Phase::DspLayer::VoicePool::Pause(Phase::DspLayer::VoicePool *this, uint64_t a2)
{
  _QWORD *v3;
  signed int v4;
  signed int v5;
  signed int v6;
  int v7;
  signed int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  do
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      return 2;
  }
  while (v3[2] != a2);
  v4 = -1431655765 * (((unint64_t)v3 - *((_QWORD *)this + 10)) >> 3);
  if (v4 < 0)
    return 2;
  v5 = *((_DWORD *)this + 11);
  if (v5 <= v4)
    return 5;
  v6 = v5 - 1;
  *((_DWORD *)this + 11) = v5 - 1;
  v7 = *((_DWORD *)this + 4);
  v8 = *((_DWORD *)this + 3) - 1;
  *((_DWORD *)this + 3) = v8;
  v9 = *((_QWORD *)this + 4);
  v10 = *((_QWORD *)this + 3) + v7 * (uint64_t)(v4 >> 2);
  (*(void (**)(uint64_t, uint64_t, Phase::DspLayer::VoicePool *, _QWORD))(*(_QWORD *)v10 + 80))(v10, v9, this, v4 & 3);
  Phase::DspLayer::VoicePool::CopyVoiceState(this, v4, v6);
  if (v8 != v4)
    Phase::DspLayer::VoicePool::CopyVoiceState(this, v8, v4);
  return 0;
}

uint64_t Phase::DspLayer::VoicePool::SetParameter(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3, __n128 a4)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    if (v4[2] == a2)
    {
      v5 = -1431655765 * (((unint64_t)v4 - *((_QWORD *)this + 10)) >> 3);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v5 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, __n128))(*(_QWORD *)v6 + 40))(v6, a3, v5 & 3, a4);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::AddInput(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3, __n128 a4)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    if (v4[2] == a2)
    {
      v5 = -1431655765 * (((unint64_t)v4 - *((_QWORD *)this + 10)) >> 3);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v5 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, __n128))(*(_QWORD *)v6 + 120))(v6, a3, v5 & 3, a4);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::SetInputGain(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3, __n128 a4)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    if (v4[2] == a2)
    {
      v5 = -1431655765 * (((unint64_t)v4 - *((_QWORD *)this + 10)) >> 3);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v5 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, __n128))(*(_QWORD *)v6 + 136))(v6, a3, v5 & 3, a4);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::RemoveInput(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      break;
    if (v3[2] == a2)
    {
      v4 = -1431655765 * (((unint64_t)v3 - *((_QWORD *)this + 10)) >> 3);
      if ((v4 & 0x80000000) == 0)
      {
        v5 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v4 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 128))(v5, a3, v4 & 3);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::ClearInputs(Phase::DspLayer::VoicePool *this, uint64_t a2)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;

  v2 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v2 = (_QWORD *)*v2;
    if (!v2)
      break;
    if (v2[2] == a2)
    {
      v3 = -1431655765 * (((unint64_t)v2 - *((_QWORD *)this + 10)) >> 3);
      if ((v3 & 0x80000000) == 0)
      {
        v4 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v3 >> 2);
        return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 152))(v4, v3 & 3);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::ClearInputsFromAllVoices(uint64_t this)
{
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v1 = this;
  v2 = *(_DWORD *)(this + 12);
  if (v2 >= 1)
  {
    v3 = 0;
    v4 = (v2 + 3) >> 2;
    do
    {
      v5 = 0;
      v6 = *(_QWORD *)(v1 + 24) + *(int *)(v1 + 16) * (uint64_t)v3;
      do
      {
        this = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 152))(v6, v5);
        v5 = (v5 + 1);
      }
      while ((_DWORD)v5 != 4);
      ++v3;
    }
    while (v3 != v4);
  }
  v7 = *(_DWORD *)(v1 + 40);
  v8 = *(_DWORD *)(v1 + 8) - *(_DWORD *)(v1 + 44);
  v9 = v8 + 7;
  v10 = v8 + 10;
  if (v9 >= 0)
    v10 = v9;
  v11 = v7 - (v10 >> 2);
  if (v11 < v7)
  {
    do
    {
      v12 = 0;
      v13 = *(_QWORD *)(v1 + 24) + *(int *)(v1 + 16) * (uint64_t)v11;
      do
      {
        this = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 152))(v13, v12);
        v12 = (v12 + 1);
      }
      while ((_DWORD)v12 != 4);
      ++v11;
    }
    while (v11 < *(_DWORD *)(v1 + 40));
  }
  return this;
}

uint64_t Phase::DspLayer::VoicePool::SetOutput(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      break;
    if (v3[2] == a2)
    {
      v4 = -1431655765 * (((unint64_t)v3 - *((_QWORD *)this + 10)) >> 3);
      if ((v4 & 0x80000000) == 0)
      {
        v5 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v4 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 176))(v5, a3, v4 & 3);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::GetBuffer@<X0>(uint64_t this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (_QWORD *)(*(_QWORD *)(this + 72) + 8 * (int)(*(_DWORD *)(this + 56) & a2));
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    if (v4[2] == a2)
    {
      v5 = -1431655765 * (((unint64_t)v4 - *(_QWORD *)(this + 80)) >> 3);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *(_QWORD *)(this + 24) + *(int *)(this + 16) * (uint64_t)(v5 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v6 + 184))(v6, a3, v5 & 3);
      }
      break;
    }
  }
  *(_DWORD *)a4 = 10;
  *(_QWORD *)(a4 + 8) = 0;
  *(_DWORD *)(a4 + 16) = -1;
  return this;
}

uint64_t Phase::DspLayer::VoicePool::SetBuffer(Phase::DspLayer::VoicePool *this, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    if (v4[2] == a2)
    {
      v5 = -1431655765 * (((unint64_t)v4 - *((_QWORD *)this + 10)) >> 3);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v5 >> 2);
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, void *))(*(_QWORD *)v6 + 192))(v6, a3, v5 & 3, a4);
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::DspLayer::VoicePool::UpdateParameters(Phase::DspLayer::VoicePool *this, uint64_t a2)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)(*((_QWORD *)this + 9) + 8 * (int)(*((_DWORD *)this + 14) & a2));
  while (1)
  {
    v2 = (_QWORD *)*v2;
    if (!v2)
      break;
    if (v2[2] == a2)
    {
      v3 = -1431655765 * (((unint64_t)v2 - *((_QWORD *)this + 10)) >> 3);
      if ((v3 & 0x80000000) == 0)
      {
        v4 = *((_QWORD *)this + 4);
        v5 = *((_QWORD *)this + 3) + *((int *)this + 4) * (uint64_t)(v3 >> 2);
        (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 56))(v5, v4, v3 & 3);
        return 0;
      }
      return 2;
    }
  }
  return 2;
}

uint64_t Phase::Controller::VoicePoolEntry::VoicePoolEntry(uint64_t a1, char *a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;

  std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  if (a2 && (v10 = *a2, *a2))
  {
    v11 = (unsigned __int8 *)(a2 + 1);
    v12 = 0xCBF29CE484222325;
    do
    {
      v12 = 0x100000001B3 * (v12 ^ v10);
      v13 = *v11++;
      v10 = v13;
    }
    while (v13);
  }
  else
  {
    v12 = 0;
  }
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 96) = 0;
  std::__function::__value_func<void ()(Phase::MessageWriteBuffer &,Phase::MessageWriteBuffer &,unsigned long)>::__value_func[abi:ne180100](a1 + 104, a5);
  *(_QWORD *)(a1 + 136) = a4;
  *(_DWORD *)(a1 + 144) = a3;
  return a1;
}

void sub_2166EA6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;

  a10 = (void **)(v10 + 80);
  std::vector<Phase::Controller::VoicePoolBufferEntry>::__destroy_vector::operator()[abi:ne180100](&a10);
  a10 = (void **)(v10 + 56);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  if (*(char *)(v10 + 23) < 0)
    operator delete(*(void **)v10);
  _Unwind_Resume(a1);
}

void Phase::Controller::VoicePoolEntry::~VoicePoolEntry(void **this)
{
  Phase::Controller::VoicePoolEntry *v2;
  uint64_t v3;
  void **v4;

  free(this[17]);
  v2 = (Phase::Controller::VoicePoolEntry *)this[16];
  if (v2 == (Phase::Controller::VoicePoolEntry *)(this + 13))
  {
    v3 = 4;
    v2 = (Phase::Controller::VoicePoolEntry *)(this + 13);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  v4 = this + 10;
  std::vector<Phase::Controller::VoicePoolBufferEntry>::__destroy_vector::operator()[abi:ne180100](&v4);
  v4 = this + 7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  v4 = this + 4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

uint64_t Phase::Controller::VoicePoolEntry::AddInput(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 4;
  v4 = a1[5];
  if (v4 >= a1[6])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[5] = result;
  return result;
}

uint64_t Phase::Controller::VoicePoolEntry::AddOutput(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 7;
  v4 = a1[8];
  if (v4 >= a1[9])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[8] = result;
  return result;
}

void Phase::Controller::VoicePoolEntry::AddBuffer(int64x2_t *a1, int a2, uint64_t a3, int a4, int a5)
{
  int64x2_t *v7;
  int v8;
  std::string __p;
  int v10;
  int v11;

  v7 = a1 + 5;
  v8 = a2;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v10 = a4;
  v11 = a5;
  std::vector<Phase::Controller::VoicePoolBufferEntry>::emplace_back<Phase::Controller::VoicePoolBufferEntry>(v7, (uint64_t)&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2166EA8C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<Phase::Controller::VoicePoolBufferEntry>::emplace_back<Phase::Controller::VoicePoolBufferEntry>(int64x2_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  int64x2_t v22;
  uint64_t v23;
  uint64_t v25;
  int64x2_t v26;
  uint64_t v27;
  int64x2_t *v28;

  v4 = a1[1].u64[0];
  v5 = a1->u64[1];
  if (v5 >= v4)
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v5 - a1->i64[0]) >> 3);
    v9 = v8 + 1;
    if (v8 + 1 > 0x666666666666666)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v4 - a1->i64[0]) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x333333333333333)
      v9 = 0x666666666666666;
    v28 = a1 + 1;
    if (v9 > 0x666666666666666)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v11 = 5 * v9;
    v12 = (char *)operator new(40 * v9);
    v13 = &v12[40 * v8];
    *(_DWORD *)v13 = *(_DWORD *)a2;
    *(_OWORD *)(v13 + 8) = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v14 = *(_QWORD *)(a2 + 24);
    v15 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a2 + 24) = 0;
    *((_QWORD *)v13 + 3) = v14;
    *((_QWORD *)v13 + 4) = v15;
    v7 = v13 + 40;
    v17 = a1->i64[0];
    v16 = a1->u64[1];
    if (v16 == a1->i64[0])
    {
      v22 = vdupq_n_s64(v16);
    }
    else
    {
      v18 = 0;
      do
      {
        v19 = &v13[v18];
        v20 = v16 + v18;
        *((_DWORD *)v19 - 10) = *(_DWORD *)(v16 + v18 - 40);
        v21 = *(_OWORD *)(v16 + v18 - 32);
        *((_QWORD *)v19 - 2) = *(_QWORD *)(v16 + v18 - 16);
        *((_OWORD *)v19 - 2) = v21;
        *(_QWORD *)(v20 - 24) = 0;
        *(_QWORD *)(v20 - 16) = 0;
        *(_QWORD *)(v20 - 32) = 0;
        *((_QWORD *)v19 - 1) = *(_QWORD *)(v16 + v18 - 8);
        v18 -= 40;
      }
      while (v16 + v18 != v17);
      v22 = *a1;
      v13 += v18;
    }
    a1->i64[0] = (uint64_t)v13;
    a1->i64[1] = (uint64_t)v7;
    v26 = v22;
    v23 = a1[1].i64[0];
    a1[1].i64[0] = (uint64_t)&v12[8 * v11];
    v27 = v23;
    v25 = v22.i64[0];
    std::__split_buffer<Phase::Controller::VoicePoolBufferEntry>::~__split_buffer((uint64_t)&v25);
  }
  else
  {
    *(_DWORD *)v5 = *(_DWORD *)a2;
    v6 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(v5 + 24) = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(v5 + 8) = v6;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
    v7 = (char *)(v5 + 40);
  }
  a1->i64[1] = (uint64_t)v7;
  return v7 - 40;
}

uint64_t Phase::Controller::VoicePoolEntry::GetParameter(Phase::Controller::VoicePoolEntry *this, int a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *((unsigned int *)this + 36);
  if ((int)v2 <= a2)
    return 0;
  result = *((_QWORD *)this + 17);
  if (*(_DWORD *)(result + 56 * a2 + 8) == a2)
  {
    result += 56 * a2;
    return result;
  }
  if ((int)v2 < 1)
    return 0;
  while (*(_DWORD *)(result + 8) != a2)
  {
    result += 56;
    if (!--v2)
      return 0;
  }
  return result;
}

void Phase::Controller::VoicePoolEntry::GetIdsOfParameterOfClass(uint64_t a1@<X0>, int a2@<W1>, char **a3@<X8>)
{
  int v4;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_DWORD *)(a1 + 144);
  if (v4 >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = a3 + 2;
    do
    {
      v10 = *(_QWORD *)(a1 + 136);
      if (*(_DWORD *)(v10 + 56 * v8 + 12) == a2)
      {
        v11 = *(_DWORD *)(v10 + 56 * v8 + 8);
        if ((unint64_t)v7 >= *v9)
        {
          v13 = *a3;
          v14 = (v7 - *a3) >> 2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v16 = *v9 - (_QWORD)v13;
          if (v16 >> 1 > v15)
            v15 = v16 >> 1;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a3 + 2), v17);
            v13 = *a3;
            v7 = a3[1];
          }
          else
          {
            v18 = 0;
          }
          v19 = &v18[4 * v14];
          *(_DWORD *)v19 = v11;
          v12 = v19 + 4;
          while (v7 != v13)
          {
            v20 = *((_DWORD *)v7 - 1);
            v7 -= 4;
            *((_DWORD *)v19 - 1) = v20;
            v19 -= 4;
          }
          *a3 = v19;
          a3[1] = v12;
          a3[2] = &v18[4 * v17];
          if (v13)
            operator delete(v13);
        }
        else
        {
          *(_DWORD *)v7 = v11;
          v12 = v7 + 4;
        }
        a3[1] = v12;
        v4 = *(_DWORD *)(a1 + 144);
        v7 = v12;
      }
      ++v8;
    }
    while (v8 < v4);
  }
}

void sub_2166EAC28(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void Phase::Controller::VoicePoolEntry::GetInputBufferIds(Phase::Controller::VoicePoolEntry *this@<X0>, char **a2@<X8>)
{
  _DWORD *v2;
  _DWORD *v3;
  char *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  int v15;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_DWORD *)*((_QWORD *)this + 10);
  v3 = (_DWORD *)*((_QWORD *)this + 11);
  if (v2 != v3)
  {
    v5 = 0;
    v6 = a2 + 2;
    do
    {
      if (v2[8] == 3)
      {
        if ((unint64_t)v5 >= *v6)
        {
          v8 = *a2;
          v9 = (v5 - *a2) >> 2;
          v10 = v9 + 1;
          if ((unint64_t)(v9 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v11 = *v6 - (_QWORD)v8;
          if (v11 >> 1 > v10)
            v10 = v11 >> 1;
          if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
            v12 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v12 = v10;
          if (v12)
          {
            v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v6, v12);
            v8 = *a2;
            v5 = a2[1];
          }
          else
          {
            v13 = 0;
          }
          v14 = &v13[4 * v9];
          *(_DWORD *)v14 = *v2;
          v7 = v14 + 4;
          while (v5 != v8)
          {
            v15 = *((_DWORD *)v5 - 1);
            v5 -= 4;
            *((_DWORD *)v14 - 1) = v15;
            v14 -= 4;
          }
          *a2 = v14;
          a2[1] = v7;
          a2[2] = &v13[4 * v12];
          if (v8)
            operator delete(v8);
        }
        else
        {
          *(_DWORD *)v5 = *v2;
          v7 = v5 + 4;
        }
        a2[1] = v7;
        v5 = v7;
      }
      v2 += 10;
    }
    while (v2 != v3);
  }
}

void sub_2166EAD6C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void Phase::Controller::VoicePoolEntry::GetOutputBufferIds(Phase::Controller::VoicePoolEntry *this@<X0>, char **a2@<X8>)
{
  _DWORD *v2;
  _DWORD *v3;
  char *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  int v15;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_DWORD *)*((_QWORD *)this + 10);
  v3 = (_DWORD *)*((_QWORD *)this + 11);
  if (v2 != v3)
  {
    v5 = 0;
    v6 = a2 + 2;
    do
    {
      if (v2[8] == 2)
      {
        if ((unint64_t)v5 >= *v6)
        {
          v8 = *a2;
          v9 = (v5 - *a2) >> 2;
          v10 = v9 + 1;
          if ((unint64_t)(v9 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v11 = *v6 - (_QWORD)v8;
          if (v11 >> 1 > v10)
            v10 = v11 >> 1;
          if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
            v12 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v12 = v10;
          if (v12)
          {
            v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v6, v12);
            v8 = *a2;
            v5 = a2[1];
          }
          else
          {
            v13 = 0;
          }
          v14 = &v13[4 * v9];
          *(_DWORD *)v14 = *v2;
          v7 = v14 + 4;
          while (v5 != v8)
          {
            v15 = *((_DWORD *)v5 - 1);
            v5 -= 4;
            *((_DWORD *)v14 - 1) = v15;
            v14 -= 4;
          }
          *a2 = v14;
          a2[1] = v7;
          a2[2] = &v13[4 * v12];
          if (v8)
            operator delete(v8);
        }
        else
        {
          *(_DWORD *)v5 = *v2;
          v7 = v5 + 4;
        }
        a2[1] = v7;
        v5 = v7;
      }
      v2 += 10;
    }
    while (v2 != v3);
  }
}

void sub_2166EAEB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::function<Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;

  v6 = a2;
  v5 = a3;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

void std::vector<Phase::Controller::VoicePoolBufferEntry>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<Phase::Controller::VoicePoolBufferEntry>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<Phase::Controller::VoicePoolBufferEntry>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 40)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_2166EAFF0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<Phase::Controller::VoicePoolBufferEntry>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 40;
      *(_QWORD *)(a1 + 16) = v2 - 40;
      if (*(char *)(v2 - 9) < 0)
      {
        operator delete(*(void **)(v2 - 32));
        v4 = *(_QWORD *)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

Phase::Controller::VoicePoolRegistry *Phase::Controller::VoicePoolRegistry::VoicePoolRegistry(Phase::Controller::VoicePoolRegistry *this)
{
  uint64_t InstancePtr;
  Phase::DspLayer::Add8 *v3;
  uint64_t *NewRegistryEntry;
  void **v5;
  uint64_t *v6;
  void **v7;
  int64x2_t *v8;
  void **v9;
  uint64_t *v10;
  void **v11;
  uint64_t *v12;
  void **v13;
  uint64_t *v14;
  void **v15;
  uint64_t *v16;
  void **v17;
  uint64_t *v18;
  void **v19;
  uint64_t *v20;
  void **v21;
  uint64_t *v22;
  void **v23;
  uint64_t *v24;
  void **v25;
  uint64_t *v26;
  void **v27;
  uint64_t *v28;
  void **v29;
  uint64_t *v30;
  void **v31;
  uint64_t *v32;
  void **v33;
  int64x2_t *v34;
  void **v35;
  int64x2_t *v36;
  void **v37;
  int64x2_t *v38;
  void **v39;
  uint64_t *v40;
  void **v41;
  uint64_t *v42;
  void **v43;
  int64x2_t *v44;
  Phase::DspLayer::ConvolverVoicePool *v45;
  uint64_t *v46;

  InstancePtr = Phase::Logger::GetInstancePtr(this);
  v3 = (Phase::DspLayer::Add8 *)Phase::Commandable<128,Phase::LockFreeQueueMPSC>::Commandable((uint64_t)this, *(_QWORD *)(InstancePtr + 128), 1, 0x20000);
  *(_QWORD *)this = off_24D5822A0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  NewRegistryEntry = Phase::DspLayer::Add8::GetNewRegistryEntry(v3);
  v5 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)NewRegistryEntry);
  v6 = Phase::DspLayer::GainControl::GetNewRegistryEntry((Phase::DspLayer::GainControl *)v5);
  v7 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v6);
  v8 = Phase::DspLayer::IRBuilderStereo3BandShelving::GetNewRegistryEntry((Phase::DspLayer::IRBuilderStereo3BandShelving *)v7);
  v9 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v8);
  v10 = Phase::DspLayer::DelayStep::GetNewRegistryEntry((Phase::DspLayer::DelayStep *)v9);
  v11 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v10);
  v12 = Phase::DspLayer::DelayLinear::GetNewRegistryEntry((Phase::DspLayer::DelayLinear *)v11);
  v13 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v12);
  v14 = Phase::DspLayer::DelayHermite3rdOrder4Point::GetNewRegistryEntry((Phase::DspLayer::DelayHermite3rdOrder4Point *)v13);
  v15 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v14);
  v16 = Phase::DspLayer::DelayHermite3rdOrder6Point::GetNewRegistryEntry((Phase::DspLayer::DelayHermite3rdOrder6Point *)v15);
  v17 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v16);
  v18 = Phase::DspLayer::DelayLagrange3rdOrder3Point::GetNewRegistryEntry((Phase::DspLayer::DelayLagrange3rdOrder3Point *)v17);
  v19 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v18);
  v20 = Phase::DspLayer::DelayLagrange5thOrder6Point::GetNewRegistryEntry((Phase::DspLayer::DelayLagrange5thOrder6Point *)v19);
  v21 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v20);
  v22 = Phase::DspLayer::LinearFade::GetNewRegistryEntry((Phase::DspLayer::LinearFade *)v21);
  v23 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v22);
  v24 = Phase::DspLayer::MatrixMixer1x2::GetNewRegistryEntry((Phase::DspLayer::MatrixMixer1x2 *)v23);
  v25 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v24);
  v26 = Phase::DspLayer::MatrixMixer1x6::GetNewRegistryEntry((Phase::DspLayer::MatrixMixer1x6 *)v25);
  v27 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v26);
  v28 = Phase::DspLayer::MatrixMixer1x8::GetNewRegistryEntry((Phase::DspLayer::MatrixMixer1x8 *)v27);
  v29 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v28);
  v30 = Phase::DspLayer::MatrixMixer1x12::GetNewRegistryEntry((Phase::DspLayer::MatrixMixer1x12 *)v29);
  v31 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v30);
  v32 = Phase::DspLayer::NullMixer::GetNewRegistryEntry((Phase::DspLayer::NullMixer *)v31);
  v33 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v32);
  v34 = Phase::DspLayer::PullStreamSampler::GetNewRegistryEntry((Phase::DspLayer::PullStreamSampler *)v33);
  v35 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v34);
  v36 = Phase::DspLayer::PushStreamSampler::GetNewRegistryEntry((Phase::DspLayer::PushStreamSampler *)v35);
  v37 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v36);
  v38 = Phase::DspLayer::ResidentSampler::GetNewRegistryEntry((Phase::DspLayer::ResidentSampler *)v37);
  v39 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v38);
  v40 = Phase::DspLayer::SpringGain::GetNewRegistryEntry((Phase::DspLayer::SpringGain *)v39);
  v41 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v40);
  v42 = Phase::DspLayer::SubmixGain::GetNewRegistryEntry((Phase::DspLayer::SubmixGain *)v41);
  v43 = Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v42);
  v44 = Phase::DspLayer::Tapper::GetNewRegistryEntry((Phase::DspLayer::Tapper *)v43);
  Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v44);
  v45 = 0;
  do
  {
    v46 = Phase::DspLayer::ConvolverVoicePool::GetNewRegistryEntry(v45);
    Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(this, (const Phase::Controller::VoicePoolEntry *)v46);
    v45 = (Phase::DspLayer::ConvolverVoicePool *)((_DWORD)v45 + 1);
  }
  while ((_DWORD)v45 != 12);
  return this;
}

void sub_2166EB230(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::~__hash_table(v2);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(v1);
  _Unwind_Resume(a1);
}

void **Phase::Controller::VoicePoolRegistry::AddVoicePoolEntry(Phase::Controller::VoicePoolRegistry *this, const Phase::Controller::VoicePoolEntry *a2)
{
  void ***v3;
  _QWORD *v5;

  v5 = (_QWORD *)((char *)a2 + 24);
  v3 = (void ***)std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t *)this + 5, (unint64_t *)a2 + 3, (uint64_t)&std::piecewise_construct, &v5);
  return std::unique_ptr<Phase::Controller::VoicePoolEntry const>::reset[abi:ne180100](v3 + 3, (void **)a2);
}

void sub_2166EB2A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<Phase::Controller::VoicePoolEntry const>::reset[abi:ne180100]((void ***)va, 0);
  _Unwind_Resume(a1);
}

void Phase::Controller::VoicePoolRegistry::~VoicePoolRegistry(Phase::Controller::VoicePoolRegistry *this)
{
  *(_QWORD *)this = off_24D5822A0;
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::~__hash_table((uint64_t)this + 40);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(this);
}

{
  *(_QWORD *)this = off_24D5822A0;
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::~__hash_table((uint64_t)this + 40);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable(this);
  JUMPOUT(0x2199F9D70);
}

_QWORD *Phase::Controller::VoicePoolRegistry::CreateVoicePoolInstance(Phase::Controller::VoicePoolRegistry *this, unint64_t a2, Phase::DspLayer::VoiceEngine *a3, int a4)
{
  _QWORD *result;
  unint64_t v7;

  v7 = a2;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((_QWORD *)this + 5, &v7);
  if (result)
    return (_QWORD *)std::function<Phase::DspLayer::VoicePool * ()(Phase::DspLayer::VoiceEngine *,int)>::operator()(result[3] + 104, (uint64_t)a3, a4);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::__deallocate_node(a1, *(void ****)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::__deallocate_node(uint64_t a1, void ***a2)
{
  void ***v2;
  void **v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = *v2;
      std::unique_ptr<Phase::Controller::VoicePoolEntry const>::reset[abi:ne180100](v2 + 3, 0);
      operator delete(v2);
      v2 = (void ***)v3;
    }
    while (v3);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t *a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  void *v35;

  v7 = *a2;
  v8 = a1[1];
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = a1 + 2;
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  v14 = (float)(unint64_t)(a1[3] + 1);
  v15 = *((float *)a1 + 8);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v8 = a1[1];
    }
    if (*(_QWORD *)&prime > v8)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v8)
    {
      v26 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v8 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v8)
      {
        v8 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = (void *)*a1;
          *a1 = (uint64_t)v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = (_QWORD *)*v13;
          if (*v13)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v24) = v13;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v30))
                  {
                    *(_QWORD *)(*a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*a1 + 8 * v30);
                  **(_QWORD **)(*a1 + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v8 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = (void *)*a1;
        *a1 = 0;
        if (v35)
          operator delete(v35);
        v8 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v31 = *a1;
  v32 = *(_QWORD **)(*a1 + 8 * v4);
  if (v32)
  {
    *i = *v32;
LABEL_72:
    *v32 = i;
    goto LABEL_73;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v31 + 8 * v4) = v13;
  if (*i)
  {
    v33 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v33 >= v8)
        v33 %= v8;
    }
    else
    {
      v33 &= v8 - 1;
    }
    v32 = (_QWORD *)(*a1 + 8 * v33);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_2166EB7E0(_Unwind_Exception *a1)
{
  void ***v1;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::Controller::VoicePoolEntry const>>,void *>>>::operator()[abi:ne180100](char a1, void ***__p)
{
  if (a1)
    std::unique_ptr<Phase::Controller::VoicePoolEntry const>::reset[abi:ne180100](__p + 3, 0);
  if (__p)
    operator delete(__p);
}

void **std::unique_ptr<Phase::Controller::VoicePoolEntry const>::reset[abi:ne180100](void ***a1, void **a2)
{
  void **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Phase::Controller::VoicePoolEntry::~VoicePoolEntry(result);
    JUMPOUT(0x2199F9D70);
  }
  return result;
}

uint64_t Phase::Controller::DVM::WaterProcedure::WaterProcedure(uint64_t a1, uint64_t *a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  Phase::DspLayer::RainImpulse *v9;
  Phase::DspLayer::VoiceEngine **v10;
  Phase::DspLayer::NullMixer *v11;
  _QWORD v13[2];
  int v14;
  _BYTE v15[12];
  int v16;
  void *__p[2];
  char v18;

  *(_QWORD *)a1 = &off_24D5822D0;
  *(_QWORD *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 16) = xmmword_21673B310;
  *(_OWORD *)(a1 + 32) = xmmword_21673B320;
  *(_OWORD *)(a1 + 48) = xmmword_21673B330;
  *(_QWORD *)(a1 + 64) = 0x43FA00003F800000;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_DWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 132) = a3;
  *(_QWORD *)(a1 + 136) = a4;
  *(_QWORD *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 144) = xmmword_2166F7320;
  *(_OWORD *)(a1 + 168) = xmmword_21673B340;
  *(_QWORD *)(a1 + 184) = 1065353216;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_BYTE *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  v7 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, "WaterProcedure");
  Phase::DspLayer::VoiceEngine::VoiceEngine(v7, (__int128 *)__p);
  *(_QWORD *)(a1 + 80) = v7;
  if (v18 < 0)
  {
    operator delete(__p[0]);
    v7 = *(_QWORD *)(a1 + 80);
  }
  *(_QWORD *)&v15[4] = 0;
  v16 = 0;
  v8 = *a2;
  v14 = 1;
  *(_QWORD *)v15 = (2 * a3);
  v13[0] = v8;
  v13[1] = 0x100000003;
  Phase::DspLayer::VoiceEngine::Configure(v7, v13);
  v9 = (Phase::DspLayer::RainImpulse *)operator new();
  Phase::DspLayer::RainImpulse::RainImpulse(v9, *(Phase::DspLayer::VoiceEngine **)(a1 + 80), a3);
  *(_QWORD *)(a1 + 88) = v9;
  v10 = (Phase::DspLayer::VoiceEngine **)operator new();
  Phase::DspLayer::RainBubble::RainBubble(v10, *(Phase::DspLayer::VoiceEngine **)(a1 + 80), a3);
  *(_QWORD *)(a1 + 96) = v10;
  v11 = (Phase::DspLayer::NullMixer *)operator new();
  Phase::DspLayer::NullMixer::NullMixer(v11, *(Phase::DspLayer::VoiceEngine **)(a1 + 80), 1);
  *(_QWORD *)(a1 + 104) = v11;
  Phase::DspLayer::VoiceEngine::AddPool(*(Phase::DspLayer::VoiceEngine **)(a1 + 80), *(Phase::DspLayer::VoicePool **)(a1 + 88), 0xFFFFFFFFLL);
  Phase::DspLayer::VoiceEngine::AddPool(*(Phase::DspLayer::VoiceEngine **)(a1 + 80), *(Phase::DspLayer::VoicePool **)(a1 + 96), 0xFFFFFFFFLL);
  Phase::DspLayer::VoiceEngine::AddPool(*(Phase::DspLayer::VoiceEngine **)(a1 + 80), *(Phase::DspLayer::VoicePool **)(a1 + 104), 0xFFFFFFFFLL);
  Phase::DspLayer::VoicePool::Play(*(Phase::DspLayer::VoicePool **)(a1 + 104), 0);
  Phase::DspLayer::VoicePool::SetOutput(*(Phase::DspLayer::VoicePool **)(a1 + 104), 0, 0);
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 124) = 0;
  *(_QWORD *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 188) = 0x3F80000000000000;
  *(_BYTE *)(a1 + 200) = 0;
  *(_DWORD *)(a1 + 184) = 1065353216;
  *(_QWORD *)(a1 + 176) = 1065353216;
  return a1;
}

void sub_2166EBAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;

  MEMORY[0x2199F9D70](v19, 0x10F1C408EBD29CELL);
  _Unwind_Resume(a1);
}

void Phase::Controller::DVM::WaterProcedure::~WaterProcedure(Phase::Controller::DVM::WaterProcedure *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Phase::DspLayer::VoiceEngine *v5;

  *(_QWORD *)this = &off_24D5822D0;
  Phase::DspLayer::VoiceEngine::RemovePool(*((_QWORD *)this + 10), *((_QWORD *)this + 11));
  Phase::DspLayer::VoiceEngine::RemovePool(*((_QWORD *)this + 10), *((_QWORD *)this + 12));
  Phase::DspLayer::VoiceEngine::RemovePool(*((_QWORD *)this + 10), *((_QWORD *)this + 13));
  v2 = *((_QWORD *)this + 11);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 12);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 13);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (Phase::DspLayer::VoiceEngine *)*((_QWORD *)this + 10);
  if (v5)
  {
    Phase::DspLayer::VoiceEngine::~VoiceEngine(v5);
    MEMORY[0x2199F9D70]();
  }
}

{
  Phase::Controller::DVM::WaterProcedure::~WaterProcedure(this);
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::Controller::DVM::WaterProcedure::GetNumOutputs(Phase::Controller::DVM::WaterProcedure *this)
{
  return 1;
}

uint64_t Phase::Controller::DVM::WaterProcedure::GetChannelsForBus(uint64_t a1, int a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * a2 + 64);
}

uint64_t Phase::Controller::DVM::WaterProcedure::SetParameter(Phase::Controller::DVM::WaterProcedure *this, int a2, float a3)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      result = 0;
      *((float *)this + 4) = a3;
      break;
    case 1:
      result = 0;
      *((float *)this + 5) = a3;
      break;
    case 2:
      result = 0;
      *((float *)this + 6) = a3;
      break;
    case 3:
      result = 0;
      *((float *)this + 7) = a3;
      break;
    case 4:
      result = 0;
      *((float *)this + 8) = a3;
      break;
    case 5:
      result = 0;
      *((float *)this + 9) = a3;
      break;
    case 6:
      result = 0;
      *((float *)this + 10) = a3;
      break;
    case 7:
      result = 0;
      *((float *)this + 11) = a3;
      break;
    case 8:
      result = 0;
      *((float *)this + 12) = a3;
      break;
    case 9:
      result = 0;
      *((float *)this + 13) = a3;
      break;
    case 10:
      result = 0;
      *((float *)this + 14) = a3;
      break;
    case 11:
      result = 0;
      *((float *)this + 15) = a3;
      break;
    case 12:
      result = 0;
      *((float *)this + 16) = a3;
      break;
    case 13:
      result = 0;
      *((float *)this + 17) = a3;
      break;
    case 14:
      result = 0;
      *((float *)this + 18) = a3;
      break;
    default:
      result = 9;
      break;
  }
  return result;
}

uint64_t Phase::Controller::DVM::WaterProcedure::SetOutput(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t result;

  if (a2)
    return 8;
  result = 0;
  *(_DWORD *)(a1 + 116) = a3;
  *(_DWORD *)(a1 + 120) = a4;
  return result;
}

double Phase::Controller::DVM::WaterProcedure::UpdateParameters(Phase::Controller::DVM::WaterProcedure *this)
{
  float v1;
  double result;

  v1 = 1000.0 / *((float *)this + 5);
  *((float *)this + 42) = (float)(unint64_t)*((float *)this + 4);
  *((float *)this + 43) = v1;
  result = *(double *)((char *)this + 116);
  *(double *)((char *)this + 124) = result;
  return result;
}

uint64_t Phase::Controller::DVM::WaterProcedure::Run(Phase::Controller::DVM::WaterProcedure *this)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  __n128 v9;
  float v10;
  float v11;
  __n128 v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  __n128 v24;
  float v25;
  __n128 v26;
  unint64_t v27;
  double *v28;
  float v29;
  _QWORD *v30;
  uint64_t v31;
  double *v32;
  int v33;
  int v34;
  _DWORD *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  float v39;
  float v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;
  float v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t result;
  float *v49;
  float v50;
  _BYTE v51[24];
  _BYTE *v52;
  _QWORD v53[3];
  _QWORD *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 10);
  if (*(_QWORD *)(v2 + 16) == *((_QWORD *)this + 26))
  {
    v3 = *((_QWORD *)this + 19);
    v4 = *((_QWORD *)this + 18) ^ (*((_QWORD *)this + 18) << 23);
    v5 = (v3 >> 26) ^ (v4 >> 17) ^ v3 ^ v4;
    *((_QWORD *)this + 18) = v3;
    *((_QWORD *)this + 19) = v5;
    v6 = logf((float)((float)(v5 + v3) * -5.421e-20) + 1.0);
    v7 = *((float *)this + 43);
    v8 = *((float *)this + 6);
    if (Phase::DspLayer::VoicePool::Play(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54)))goto LABEL_22;
    v10 = fmaxf(fminf((float)-v6 / v7, v8 / 1000.0), 0.0001);
    v11 = v10 / sqrtf((float)(v10 * 0.5) * 45244.0);
    v9.n128_f64[0] = v11;
    Phase::DspLayer::VoicePool::SetParameter(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54), 0, v9);
    v12.n128_f64[0] = *((float *)this + 7);
    Phase::DspLayer::VoicePool::SetParameter(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54), 1, v12);
    v13 = *((float *)this + 47);
    v14 = *((float *)this + 48);
    if (*((_BYTE *)this + 200))
    {
      *((_BYTE *)this + 200) = 0;
      v15 = *((float *)this + 49);
    }
    else
    {
      v16 = *((_QWORD *)this + 18);
      v17 = *((_QWORD *)this + 19);
      do
      {
        do
        {
          v16 ^= (v17 >> 26) ^ ((v16 ^ (v16 << 23)) >> 17) ^ v17 ^ (v16 << 23);
          v18 = (float)(v16 + v17) * 5.421e-20;
          v17 ^= ((v17 ^ (v17 << 23)) >> 17) ^ (v16 >> 26) ^ (v17 << 23) ^ v16;
          v19 = (float)(v18 * 2.0) + -1.0;
          v20 = (float)((float)((float)(v17 + v16) * 5.421e-20) * 2.0) + -1.0;
          v21 = (float)(v20 * v20) + (float)(v19 * v19);
        }
        while (v21 > 1.0);
      }
      while (v21 == 0.0);
      *((_QWORD *)this + 18) = v16;
      *((_QWORD *)this + 19) = v17;
      v22 = sqrtf((float)(logf((float)(v20 * v20) + (float)(v19 * v19)) * -2.0) / v21);
      *((float *)this + 49) = v20 * v22;
      *((_BYTE *)this + 200) = 1;
      v15 = v19 * v22;
    }
    v23 = v13 + (float)(v15 * v14);
    v24.n128_f32[0] = powf(v10 / (float)(*((float *)this + 6) / 1000.0), *((float *)this + 8));
    if (v23 < 0.0)
      v25 = -v24.n128_f32[0];
    else
      v25 = v24.n128_f32[0];
    v24.n128_f64[0] = (float)(v25 * *((float *)this + 9));
    Phase::DspLayer::VoicePool::SetParameter(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54), 2, v24);
    Phase::DspLayer::VoicePool::SetOutput(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54), 0);
    v26.n128_u32[0] = 1.0;
    Phase::DspLayer::VoicePool::AddInput(*((Phase::DspLayer::VoicePool **)this + 13), 0, 0, v26);
    Phase::DspLayer::VoicePool::UpdateParameters(*((Phase::DspLayer::VoicePool **)this + 11), *((int *)this + 54));
    Phase::DspLayer::VoicePool::UpdateParameters(*((Phase::DspLayer::VoicePool **)this + 13), 0);
    v27 = *((unsigned int *)this + 54) | ((unint64_t)*((unsigned int *)this + 28) << 32);
    v53[0] = &off_24D582320;
    v53[1] = v27;
    v53[2] = this;
    v54 = v53;
    v28 = (double *)*((_QWORD *)this + 10);
    v29 = *v28;
    Phase::DspLayer::VoiceEngine::ScheduleAction((uint64_t)v28, (uint64_t)v53, vcvtps_u32_f32(v11 * v29), *((_QWORD *)this + 11));
    v30 = v54;
    if (v54 == v53)
    {
      v31 = 4;
      v30 = v53;
    }
    else
    {
      if (!v54)
      {
LABEL_17:
        v32 = (double *)*((_QWORD *)this + 10);
        v33 = *((_DWORD *)this + 54);
        v34 = *((_DWORD *)this + 28);
        v35 = operator new(0x28uLL);
        *(_QWORD *)v35 = &off_24D582368;
        v35[2] = v33;
        v35[3] = v34 + 1;
        *((_QWORD *)v35 + 2) = this;
        *((float *)v35 + 6) = v10;
        *((float *)v35 + 7) = v25;
        *((float *)v35 + 8) = v11;
        v52 = v35;
        v36 = *((_QWORD *)this + 19);
        v37 = *((_QWORD *)this + 18) ^ (*((_QWORD *)this + 18) << 23);
        v38 = (v36 >> 26) ^ (v37 >> 17) ^ v36 ^ v37;
        *((_QWORD *)this + 18) = v36;
        *((_QWORD *)this + 19) = v38;
        v39 = logf((float)((float)(v38 + v36) * -5.421e-20) + 1.0);
        v40 = *v32;
        Phase::DspLayer::VoiceEngine::ScheduleAction((uint64_t)v32, (uint64_t)v51, vcvtps_u32_f32((float)(v11 * (float)(1.0 - (float)(v39 / *((float *)this + 44)))) * v40), *((_QWORD *)this + 12));
        v41 = v52;
        if (v52 == v51)
        {
          v42 = 4;
          v41 = v51;
          goto LABEL_21;
        }
        if (v52)
        {
          v42 = 5;
LABEL_21:
          (*(void (**)(void))(*v41 + 8 * v42))();
        }
LABEL_22:
        v43 = *((_DWORD *)this + 33);
        *((_DWORD *)this + 28) = (*((_DWORD *)this + 28) + 2) % (2 * v43);
        v2 = *((_QWORD *)this + 10);
        v44 = *(double *)v2;
        v45 = *((_QWORD *)this + 19);
        v46 = *((_QWORD *)this + 18) ^ (*((_QWORD *)this + 18) << 23);
        v47 = (v45 >> 26) ^ (v46 >> 17) ^ v45 ^ v46;
        *((_QWORD *)this + 18) = v45;
        *((_QWORD *)this + 19) = v47;
        *((_QWORD *)this + 26) = (unint64_t)(float)((float)*((unint64_t *)this + 26)
                                                         + (float)(unint64_t)fmaxf(ceilf((float)((float)-logf((float)((float)(v47 + v45) * -5.421e-20) + 1.0)/ *((float *)this + 42))* v44), 1.0));
        *((_DWORD *)this + 54) = (*((_DWORD *)this + 54) + 1) % v43;
        goto LABEL_23;
      }
      v31 = 5;
    }
    (*(void (**)(void))(*v30 + 8 * v31))();
    goto LABEL_17;
  }
LABEL_23:
  result = Phase::DspLayer::VoiceEngine::Run((uint64_t **)v2);
  v49 = *(float **)(*((_QWORD *)this + 10) + 64);
  v50 = *((float *)this + 14) * *v49;
  *v49 = v50;
  *(float *)(*(_QWORD *)(*((_QWORD *)this + 1) + 8 * *((int *)this + 31) + 64) + 4 * *((int *)this + 32)) = v50;
  return result;
}

void sub_2166EC22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a13;
  if (a13 == v17)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24D582320;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D582320;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_0>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, Phase::DspLayer::VoicePool **a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 16);
  Phase::DspLayer::VoicePool::Stop(*a4, *(int *)(a1 + 8));
  Phase::DspLayer::VoicePool::RemoveInput(*(Phase::DspLayer::VoicePool **)(v4 + 104), 0, 0);
  return Phase::DspLayer::VoicePool::UpdateParameters(*(Phase::DspLayer::VoicePool **)(v4 + 104), 0);
}

void std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x28uLL);
  *(_QWORD *)v2 = &off_24D582368;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D582368;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

_QWORD *std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1,std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, Phase::DspLayer::VoicePool **a4)
{
  Phase::DspLayer::VoicePool *v5;
  uint64_t v6;
  _QWORD *result;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  double *v14;
  int v15;
  int v16;
  _DWORD *v17;
  float v18;
  uint64_t v19;
  _BYTE v20[24];
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = *a4;
  v6 = *(_QWORD *)(a1 + 16);
  result = (_QWORD *)Phase::DspLayer::VoicePool::Play(*(Phase::DspLayer::VoicePool **)(v6 + 96), *(int *)(a1 + 8));
  if (!(_DWORD)result)
  {
    v8.n128_f64[0] = (float)(*(float *)(a1 + 24) * 0.5);
    Phase::DspLayer::VoicePool::SetParameter(v5, *(int *)(a1 + 8), 0, v8);
    v9.n128_f64[0] = (float)(fabsf(*(float *)(a1 + 28)) * *(float *)(v6 + 48));
    Phase::DspLayer::VoicePool::SetParameter(v5, *(int *)(a1 + 8), 3, v9);
    v10.n128_f64[0] = *(float *)(v6 + 40);
    Phase::DspLayer::VoicePool::SetParameter(v5, *(int *)(a1 + 8), 2, v10);
    v11.n128_f64[0] = *(float *)(v6 + 44);
    Phase::DspLayer::VoicePool::SetParameter(v5, *(int *)(a1 + 8), 1, v11);
    v12.n128_f64[0] = (float)(*(float *)(a1 + 32) * 50.0);
    Phase::DspLayer::VoicePool::SetParameter(v5, *(int *)(a1 + 8), 4, v12);
    Phase::DspLayer::VoicePool::SetOutput(v5, *(int *)(a1 + 8), 0);
    v13.n128_u32[0] = 1.0;
    Phase::DspLayer::VoicePool::AddInput(*(Phase::DspLayer::VoicePool **)(v6 + 104), 0, 0, v13);
    Phase::DspLayer::VoicePool::UpdateParameters(v5, *(int *)(a1 + 8));
    Phase::DspLayer::VoicePool::UpdateParameters(*(Phase::DspLayer::VoicePool **)(v6 + 104), 0);
    v14 = *(double **)(v6 + 80);
    v15 = *(_DWORD *)(a1 + 8);
    v16 = *(_DWORD *)(a1 + 12);
    v17 = operator new(0x20uLL);
    *(_QWORD *)v17 = &off_24D5823B0;
    v17[2] = v15;
    *((_QWORD *)v17 + 2) = v6;
    v17[6] = v16;
    v21 = v17;
    v18 = *v14;
    Phase::DspLayer::VoiceEngine::ScheduleAction((uint64_t)v14, (uint64_t)v20, vcvtps_u32_f32((float)(*(float *)(a1 + 32) * 50.0) * v18), (uint64_t)v5);
    result = v21;
    if (v21 == v20)
    {
      v19 = 4;
      result = v20;
    }
    else
    {
      if (!v21)
        return result;
      v19 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v19))();
  }
  return result;
}

void sub_2166EC5F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1},std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1}>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1},std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1}>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24D5823B0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1},std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1}>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D5823B0;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1},std::allocator<Phase::Controller::DVM::WaterProcedure::Run(unsigned long long)::$_1::operator() const(Phase::DspLayer::VoiceEngine *,long long,void *)::{lambda(Phase::DspLayer::VoiceEngine *,long long,void *)#1}>,void ()(Phase::DspLayer::VoiceEngine *,long long,void *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, Phase::DspLayer::VoicePool **a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 16);
  Phase::DspLayer::VoicePool::Stop(*a4, *(int *)(a1 + 8));
  Phase::DspLayer::VoicePool::RemoveInput(*(Phase::DspLayer::VoicePool **)(v4 + 104), 0, 0);
  return Phase::DspLayer::VoicePool::UpdateParameters(*(Phase::DspLayer::VoicePool **)(v4 + 104), 0);
}

void Phase::SpatialModeler::CombineMetadataScaled_EnergyDomain(uint64_t a1, uint64_t a2, uint64_t a3, char a4, float a5, float a6)
{
  int v6;
  uint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float *v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  _DWORD *v42;
  float *v43;
  float *v44;
  uint64_t i;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float *v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  _DWORD *v62;
  float *v63;
  float *v64;
  uint64_t j;
  float v66;
  uint64_t v68;
  uint64_t v69;
  _BYTE buf[36];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[6];

  v73[4] = *MEMORY[0x24BDAC8D0];
  v6 = *(_DWORD *)(a1 + 204);
  if (v6 != *(_DWORD *)(a2 + 204))
  {
    v14 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 1184);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "XfadeDirectionalMetadata.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 27;
    v15 = "%25s:%-5d CombineMetadataScaled: mDirectionType mismatch.";
LABEL_18:
    _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x12u);
    return;
  }
  *(_DWORD *)(a3 + 204) = v6;
  v12 = *(uint64_t **)(a1 + 104);
  if (v12)
    v13 = v12[1];
  else
    v13 = 0;
  v16 = *(uint64_t **)(a2 + 104);
  if (v16)
    v17 = v16[1];
  else
    v17 = 0;
  if (v13 <= v17)
    v18 = v17;
  else
    v18 = v13;
  if (!v18)
  {
    v14 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 1184);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "XfadeDirectionalMetadata.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 36;
    v15 = "%25s:%-5d CombineMetadataScaled: Called with both empty metadata.";
    goto LABEL_18;
  }
  if (v12)
    v19 = *v12;
  else
    v19 = 0;
  if (v16)
    v20 = *v16;
  else
    v20 = 0;
  v68 = 4;
  v69 = v20 + v19;
  *(_QWORD *)buf = &v69;
  *(_QWORD *)&buf[8] = &v68;
  Phase::details::AllocArray<Phase::Vector<float,3ul>,std::unique_ptr<Phase::Vector<float,3ul> [],std::function<void ()(void *)>> Phase::details::AllocArray<Phase::Vector<float,3ul>>(unsigned long,unsigned long)::{lambda(void)#1} const&,std::unique_ptr<Phase::Vector<float,3ul> [],std::function<void ()(void *)>> Phase::details::AllocArray<Phase::Vector<float,3ul>>(unsigned long,unsigned long)::{lambda(Phase::Vector<float,3ul>*)#1} const&>(v20 + v19, (uint64_t)buf, &v72);
  v21 = v72;
  v72 = 0;
  *(_QWORD *)buf = v21;
  std::__function::__value_func<void ()(void *)>::__value_func[abi:ne180100]((uint64_t)&buf[8], (uint64_t)v73);
  v71 = v20 + v19;
  std::unique_ptr<Phase::Vector<float,3ul> [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100](&v72);
  std::unique_ptr<Phase::Vector<float,3ul> [],std::function<void ()(void *)>>::operator=[abi:ne180100]((uint64_t *)(a3 + 8), (uint64_t *)buf);
  *(_QWORD *)(a3 + 48) = v71;
  std::unique_ptr<Phase::Vector<float,3ul> [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100]((uint64_t *)buf);
  v68 = 4;
  v69 = v20 + v19;
  *(_QWORD *)buf = &v69;
  *(_QWORD *)&buf[8] = &v68;
  Phase::details::AllocArray<float,std::unique_ptr<float [],std::function<void ()(void *)>> Phase::details::AllocArray<float>(unsigned long,unsigned long)::{lambda(void)#1} const&,std::unique_ptr<float [],std::function<void ()(void *)>> Phase::details::AllocArray<float>(unsigned long,unsigned long)::{lambda(float*)#1} const&>(v20 + v19, (uint64_t)buf, &v72);
  v22 = v72;
  v72 = 0;
  *(_QWORD *)buf = v22;
  std::__function::__value_func<void ()(void *)>::__value_func[abi:ne180100]((uint64_t)&buf[8], (uint64_t)v73);
  v71 = v20 + v19;
  std::unique_ptr<float [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100](&v72);
  v23 = (uint64_t *)(a3 + 56);
  std::unique_ptr<float [],std::function<void ()(void *)>>::operator=[abi:ne180100]((uint64_t *)(a3 + 56), (uint64_t *)buf);
  *(_QWORD *)(a3 + 96) = v71;
  std::unique_ptr<float [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100]((uint64_t *)buf);
  Phase::AllocPackedSubbandArray<float>(v20 + v19, v18, (void **)buf);
  v24 = a3 + 104;
  std::unique_ptr<Phase::PackedSubbandArray<float>,std::function<void ()(void *)>>::operator=[abi:ne180100]((uint64_t *)(a3 + 104), (uint64_t *)buf);
  std::unique_ptr<Phase::PackedSubbandArray<float>,std::function<void ()(void *)>>::~unique_ptr[abi:ne180100]((uint64_t *)buf);
  v68 = 1;
  v69 = v20 + v19;
  *(_QWORD *)buf = &v69;
  *(_QWORD *)&buf[8] = &v68;
  Phase::details::AllocArray<BOOL,std::unique_ptr<BOOL [],std::function<void ()(void *)>> Phase::details::AllocArray<BOOL>(unsigned long,unsigned long)::{lambda(void)#1} const&,std::unique_ptr<BOOL [],std::function<void ()(void *)>> Phase::details::AllocArray<BOOL>(unsigned long,unsigned long)::{lambda(BOOL*)#1} const&>(v20 + v19, (uint64_t)buf, &v72);
  v25 = v72;
  v72 = 0;
  *(_QWORD *)buf = v25;
  std::__function::__value_func<void ()(void *)>::__value_func[abi:ne180100]((uint64_t)&buf[8], (uint64_t)v73);
  v71 = v20 + v19;
  std::unique_ptr<BOOL [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100](&v72);
  v26 = (uint64_t *)(a3 + 144);
  std::unique_ptr<BOOL [],std::function<void ()(void *)>>::operator=[abi:ne180100]((uint64_t *)(a3 + 144), (uint64_t *)buf);
  *(_QWORD *)(a3 + 184) = v71;
  std::unique_ptr<BOOL [],std::function<void ()(void *)>>::~unique_ptr[abi:ne180100]((uint64_t *)buf);
  v27 = a4;
  if (v19)
  {
    v28 = 0;
    v29 = *(_QWORD *)(a1 + 8);
    v30 = *(_QWORD *)(a3 + 8);
    v31 = *(_QWORD *)(a1 + 56);
    v32 = *v23;
    v33 = *(_QWORD *)(a1 + 104);
    v34 = (float *)(v33 + 16);
    v35 = *(_QWORD *)(v33 + 8);
    v36 = *(_QWORD *)v24 + 16;
    v37 = sqrtf(a5);
    v38 = *(_QWORD *)(a1 + 144);
    v39 = *v26;
    v40 = 4 * *(_QWORD *)(*(_QWORD *)v24 + 8);
    do
    {
      v41 = (_DWORD *)(v29 + 12 * v28);
      v42 = (_DWORD *)(v30 + 12 * v28);
      *v42 = *v41;
      v42[1] = v41[1];
      v42[2] = v41[2];
      *(_DWORD *)(v32 + 4 * v28) = *(_DWORD *)(v31 + 4 * v28);
      v43 = v34;
      v44 = (float *)v36;
      for (i = v35; i; --i)
      {
        v46 = *v43++;
        *v44++ = v37 * v46;
      }
      *(_BYTE *)(v39 + v28) = *(_BYTE *)(v38 + v28);
      ++v28;
      v36 += v40;
      v34 += v35;
    }
    while (v28 != v19);
  }
  if (v20)
  {
    v47 = 0;
    v48 = *(_QWORD *)(a2 + 8);
    v49 = *(_QWORD *)(a3 + 8);
    v50 = *(_QWORD *)(a2 + 56);
    v51 = *v23;
    v52 = *(_QWORD *)(a2 + 104);
    v53 = (float *)(v52 + 16);
    v54 = *(_QWORD *)(v52 + 8);
    v55 = *(_QWORD *)(*(_QWORD *)v24 + 8);
    v56 = sqrtf(a6);
    v57 = *(_QWORD *)(a2 + 144);
    v58 = *v26;
    v59 = *(_QWORD *)v24 + 4 * v19 * v55 + 16;
    v60 = 4 * v55;
    do
    {
      v61 = (_DWORD *)(v48 + 12 * v47);
      v62 = (_DWORD *)(v49 + 12 * (v47 + v19));
      *v62 = *v61;
      v62[1] = v61[1];
      v62[2] = v61[2];
      *(_DWORD *)(v51 + 4 * (v47 + v19)) = *(_DWORD *)(v50 + 4 * v47);
      v63 = v53;
      v64 = (float *)v59;
      for (j = v54; j; --j)
      {
        v66 = *v63++;
        *v64++ = v56 * v66;
      }
      *(_BYTE *)(v58 + v47 + v19) = *(_BYTE *)(v57 + v47);
      ++v47;
      v59 += v60;
      v53 += v54;
    }
    while (v47 != v20);
  }
  if ((a4 & 1) != 0)
  {
    Phase::SpatialModeler::SortMetadataByDelay<float>(a3);
    v27 = a4;
  }
  *(_BYTE *)(a3 + 201) = v27;
}

void Phase::SpatialModeler::XfadeDirectionalMetadata(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, float a4@<S0>, float a5@<S1>)
{
  *(_DWORD *)a3 = 3;
  *(_BYTE *)(a3 + 4) = 1;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 204) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 96) = 0;
  *(_QWORD *)(a3 + 104) = 0;
  *(_QWORD *)(a3 + 88) = 0;
  *(_QWORD *)(a3 + 136) = 0;
  *(_QWORD *)(a3 + 144) = 0;
  *(_QWORD *)(a3 + 184) = 0;
  *(_QWORD *)(a3 + 192) = 0;
  *(_QWORD *)(a3 + 176) = 0;
  *(_WORD *)(a3 + 200) = 0;
  if (a4 == 0.0 && a5 == 1.0)
    goto LABEL_6;
  if (a4 == 1.0 && a5 == 0.0)
  {
    a2 = a1;
LABEL_6:
    Phase::SpatialModeler::CopyMetadata<float>(a2, a3);
    return;
  }
  Phase::SpatialModeler::CombineMetadataScaled_EnergyDomain(a1, a2, a3, 1, a4, a5);
}

void sub_2166ECC74(_Unwind_Exception *a1)
{
  uint64_t *v1;

  Phase::SpatialModeler::DirectionalMetadataOutput<float>::~DirectionalMetadataOutput(v1);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::XTCBinauralSpatializer::XTCBinauralSpatializer(_QWORD *a1, __int128 *a2, uint64_t a3)
{
  std::vector<char>::pointer begin;
  void *__p[2];
  char v9;
  std::vector<char> v10;

  LOBYTE(__p[0]) = 0;
  std::vector<char>::vector(&v10, 0x20uLL, (const std::vector<char>::value_type *)__p);
  begin = v10.__begin_;
  *(_QWORD *)v10.__begin_ = 6619138;
  *((_DWORD *)begin + 2) = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "XTCBinaural");
  Phase::Controller::Spatializer::Spatializer((uint64_t)a1, a2, (uint64_t)&v10, (__int128 *)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  if (v10.__begin_)
  {
    v10.__end_ = v10.__begin_;
    operator delete(v10.__begin_);
  }
  *a1 = &off_24D5823F8;
  IR::IRDataAttributes::IRDataAttributes((uint64_t)(a1 + 12), a3);
  return a1;
}

void sub_2166ECD44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16)
{
  if (a14 < 0)
    operator delete(__p);
  if (a15)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void Phase::Controller::XTCBinauralSpatializer::~XTCBinauralSpatializer(void **this)
{
  *this = &off_24D5823F8;
  IR::IRDataAttributes::~IRDataAttributes((IR::IRDataAttributes *)(this + 12));
  Phase::Controller::Spatializer::~Spatializer(this);
}

{
  *this = &off_24D5823F8;
  IR::IRDataAttributes::~IRDataAttributes((IR::IRDataAttributes *)(this + 12));
  Phase::Controller::Spatializer::~Spatializer(this);
  JUMPOUT(0x2199F9D70);
}

uint64_t Phase::Controller::XTCBinauralSpatializer::Initialize(Phase::Controller::XTCBinauralSpatializer *this)
{
  char *v2;
  _QWORD *v3;
  Phase::Logger *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v9;
  std::logic_error *exception;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (char *)this + 96;
  v3 = operator new(0x240uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = &off_24D582488;
  v3[3] = &off_24D5824C0;
  *((_WORD *)v3 + 16) = 1;
  *((_OWORD *)v3 + 3) = 0u;
  v3[5] = this;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 8) = 0u;
  *((_OWORD *)v3 + 9) = 0u;
  *((_OWORD *)v3 + 10) = 0u;
  *((_OWORD *)v3 + 11) = 0u;
  *((_OWORD *)v3 + 12) = 0u;
  *((_OWORD *)v3 + 13) = 0u;
  *((_OWORD *)v3 + 14) = 0u;
  *((_OWORD *)v3 + 15) = 0u;
  *((_OWORD *)v3 + 16) = 0u;
  *((_OWORD *)v3 + 17) = 0u;
  *((_OWORD *)v3 + 18) = 0u;
  *((_OWORD *)v3 + 19) = 0u;
  *((_OWORD *)v3 + 20) = 0u;
  *((_OWORD *)v3 + 21) = 0u;
  *((_OWORD *)v3 + 22) = 0u;
  *((_OWORD *)v3 + 23) = 0u;
  *((_OWORD *)v3 + 24) = 0u;
  *((_OWORD *)v3 + 25) = 0u;
  v4 = (Phase::Logger *)IR::IRDataAttributes::IRDataAttributes((uint64_t)(v3 + 52), (uint64_t)v2);
  v3[71] = 0;
  if (!*((_QWORD *)this + 12))
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 576));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "XTCBinauralSpatializer.mm";
      v14 = 1024;
      v15 = 37;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: inIrDataAttributes.fileURL.is_valid() is false.", (uint8_t *)&v12, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: inIrDataAttributes.fileURL.is_valid() is false.");
LABEL_15:
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B0] + 16);
  }
  if (*((float *)this + 26) <= 0.0)
  {
    v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 576));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "XTCBinauralSpatializer.mm";
      v14 = 1024;
      v15 = 38;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: inIrDataAttributes.sampleRate > 0 is false.", (uint8_t *)&v12, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: inIrDataAttributes.sampleRate > 0 is false.");
    goto LABEL_15;
  }
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 7);
  *((_QWORD *)this + 6) = v3 + 3;
  *((_QWORD *)this + 7) = v3;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 6) + 16))(*((_QWORD *)this + 6));
}

void sub_2166ED068(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  IR::IRDataAttributes *v3;
  void *v4;
  uint64_t v6;
  void *v7;

  __cxa_free_exception(v4);
  std::unique_ptr<Phase::Controller::HrirAsset>::reset[abi:ne180100]((uint64_t **)(v1 + 568), 0);
  IR::IRDataAttributes::~IRDataAttributes(v3);
  v6 = 336;
  do
  {
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v1 + v6 + 48);
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v1 + v6 + 32);
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v1 + v6 + 16);
    v6 -= 48;
  }
  while (v6);
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100](v2);
  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)v1);
  operator delete(v7);
  _Unwind_Resume(a1);
}

BOOL Phase::Controller::XTCBinauralSpatializer::SetDeviceOrientation(uint64_t a1, unsigned int a2)
{
  return Phase::Controller::XTCBinauralEncoder::SetDeviceOrientation(*(_QWORD *)(a1 + 48), a2);
}

BOOL Phase::Controller::XTCBinauralEncoder::SetDeviceOrientation(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  char v4;
  int v5;
  unsigned int v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  Phase::Logger *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int v13;
  NSObject *v14;
  int v15;
  void **v16;
  void **v17;
  void **v18;
  const char *v19;
  NSObject *v21;
  std::runtime_error *exception;
  void *__p[2];
  char v24;
  void *v25[2];
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void **v32;
  __int16 v33;
  void **v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v2 = a2;
  v37 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48 * a2 + 40))
  {
    v4 = 0;
  }
  else
  {
    v6 = a2 - 1;
    if ((a2 & 1) != 0)
      v6 = a2 + 1;
    if (a2)
      v2 = v6;
    else
      v2 = 0;
    if (*(_QWORD *)(a1 + 48 * v2 + 40))
    {
      v5 = 0;
      v4 = 1;
      goto LABEL_11;
    }
    if (*(_QWORD *)(a1 + 184) || *(_QWORD *)(a1 + 232))
    {
      v4 = 0;
      v2 = 3;
    }
    else
    {
      if (!*(_QWORD *)(a1 + 40))
      {
        v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 576));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "XTCBinauralSpatializer.mm";
          v29 = 1024;
          v30 = 377;
          _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"[XTCBinauralSpatializer] No valid HRIR filter database for current orientation.\"", buf, 0x12u);
        }
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "[XTCBinauralSpatializer] No valid HRIR filter database for current orientation.");
      }
      v4 = 0;
      v2 = 0;
    }
  }
  v5 = 1;
LABEL_11:
  v7 = operator new(0x28uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = &off_24D582430;
  *((_BYTE *)v7 + 32) = v4;
  v8 = a1 + 48 * v2;
  v9 = *(std::__shared_weak_count **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v7;
  v7[3] = &off_24D582468;
  v10 = (Phase::Logger *)(v7 + 3);
  *(_QWORD *)(v8 + 72) = v10;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v13 = *(_DWORD *)(a1 + 388);
  if (v2 != v13)
  {
    v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10)
                                                                                        + 576)));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a1 + 40))(v25, a1);
      v15 = v26;
      v16 = (void **)v25[0];
      Phase::Device::GetOrientationString((uint64_t)__p);
      v17 = v25;
      if (v15 < 0)
        v17 = v16;
      if (v24 >= 0)
        v18 = __p;
      else
        v18 = (void **)__p[0];
      *(_DWORD *)buf = 136316162;
      v28 = "XTCBinauralSpatializer.mm";
      v19 = " with flipped channels";
      v29 = 1024;
      v30 = 340;
      v31 = 2080;
      if (v5)
        v19 = "";
      v32 = v17;
      v33 = 2080;
      v34 = v18;
      v35 = 2080;
      v36 = v19;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d [XTCBinauralSpatializer] %s Using XTC HRIR for orientation %s%s.", buf, 0x30u);
      if (v24 < 0)
        operator delete(__p[0]);
      if (v26 < 0)
        operator delete(v25[0]);
    }

    *(_DWORD *)(a1 + 388) = v2;
  }
  return v2 != v13;
}

void sub_2166ED404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  __cxa_free_exception(v17);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder::FilterMetadata>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D582430;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder::FilterMetadata>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D582430;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

uint64_t std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder::FilterMetadata>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void Phase::Controller::XTCBinauralEncoder::FilterMetadata::~FilterMetadata(Phase::Controller::XTCBinauralEncoder::FilterMetadata *this)
{
  JUMPOUT(0x2199F9D70);
}

void std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D582488;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D582488;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199F9D70);
}

uint64_t std::__shared_ptr_emplace<Phase::Controller::XTCBinauralEncoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void Phase::Controller::XTCBinauralEncoder::~XTCBinauralEncoder(uint64_t **this)
{
  Phase::Controller::XTCBinauralEncoder::~XTCBinauralEncoder(this);
  JUMPOUT(0x2199F9D70);
}

{
  uint64_t i;

  *this = (uint64_t *)&off_24D5824C0;
  std::unique_ptr<Phase::Controller::HrirAsset>::reset[abi:ne180100](this + 68, 0);
  IR::IRDataAttributes::~IRDataAttributes((IR::IRDataAttributes *)(this + 49));
  for (i = 0; i != -42; i -= 6)
  {
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&this[i + 45]);
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&this[i + 43]);
    std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&this[i + 41]);
  }
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)(this + 3));
}

void Phase::Controller::XTCBinauralEncoder::Initialize(IR::IRData **this)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  float v5;
  float v6;
  int v7;
  int8x8_t v8;
  uint8x8_t v9;
  int v10;
  int v11;
  Phase::Logger *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  __int128 *v23;
  uint64_t CoordinateTree;
  uint64_t i;
  float *v26;
  unint64_t v27;
  int v28;
  IR::IRData **v29;
  int **v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  const Phase::Controller::SpatializerEncoder *v44;
  const Phase::Controller::SpatializerEncoder *v45;
  const Phase::Controller::SpatializerEncoder *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  Phase::Logger *v53;
  NSObject *v54;
  int v55;
  void **v56;
  void **v57;
  void *v58;
  void *v59;
  Phase::Logger *v60;
  NSObject *v61;
  _BYTE *v62;
  unsigned int v63;
  std::__shared_weak_count *v64;
  unint64_t *p_shared_owners;
  unint64_t v66;
  NSObject *v67;
  std::logic_error *exception;
  NSObject *v69;
  std::runtime_error *v70;
  void *v71;
  char v72;
  void *v73[2];
  char v74;
  const Phase::Controller::SpatializerEncoder *v75;
  const Phase::Controller::SpatializerEncoder *v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  CFTypeRef cf;
  _BYTE buf[18];
  __int16 v83;
  void **v84;
  __int16 v85;
  void *v86;
  void *__p[4];
  _OWORD v88[3];
  void *v89;
  char v90;
  _QWORD v91[20];

  v91[19] = *MEMORY[0x24BDAC8D0];
  IR::IRDataLoader::instance((IR::IRDataLoader *)this);
  cf = 0;
  memset(__p, 0, 24);
  IR::IRDataLoader::load();
  std::shared_ptr<Phase::Controller::BinauralEncoder::FilterSwapInfo>::operator=[abi:ne180100]((uint64_t)(this + 3), &v78);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
  if (*((_QWORD *)&v78 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (cf)
    CFRelease(cf);
  *((_DWORD *)this + 94) = IR::IRData::getFilterLength(this[3]);
  IR::IRData::getMaxDelay(this[3]);
  v6 = v5 + (float)*((int *)this + 94);
  v7 = (int)v6;
  *((float *)this + 95) = v5;
  v8.i32[0] = (int)v6;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.i32[0] != 1)
  {
    v10 = SLODWORD(v6) >> 23;
    if ((LODWORD(v6) & 0x7FFFFF) != 0)
      LOBYTE(v10) = v10 + 1;
    v7 = (int)(float)(1 << (v10 - 127));
  }
  *((_DWORD *)this + 96) = v7;
  if (IR::IRData::getNumDimensions(this[3]) > 2)
  {
    CoordinateTree = IR::IRData::getCoordinateTree(this[3]);
    if ((_DWORD)v78 != 5)
      std::terminate();
    for (i = 0; i != 7; ++i)
    {
      v26 = (float *)*((_QWORD *)&v78 + 1);
      if (v79 != *((_QWORD *)&v78 + 1))
      {
        v27 = (v79 - *((_QWORD *)&v78 + 1)) >> 2;
        if (v27 <= 1)
          v27 = 1;
        while (*v26 != (float)(int)i)
        {
          ++v26;
          if (!--v27)
            goto LABEL_62;
        }
        *((_DWORD *)this + 97) = i;
        v28 = *((_DWORD *)this + 96);
        *(_QWORD *)buf = this[2];
        v75 = 0;
        LODWORD(v73[0]) = v28;
        std::allocate_shared[abi:ne180100]<Phase::Controller::SpatializerFilterDatabase,std::allocator<Phase::Controller::SpatializerFilterDatabase>,Phase::Controller::Spatializer const*&,Phase::Controller::SpatializerEncoder const*&,unsigned int &,void>((const Phase::Controller::Spatializer **)buf, &v75, (unsigned int *)v73, __p);
        *(_OWORD *)&__p[2] = 0u;
        v88[0] = 0u;
        v29 = &this[6 * i];
        v30 = (int **)(v29 + 5);
        std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](v29 + 5, (uint64_t *)__p);
        std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](v29 + 7, (uint64_t *)&__p[2]);
        CoordinateTree = (uint64_t)std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](v29 + 9, (uint64_t *)v88);
        v31 = (std::__shared_weak_count *)*((_QWORD *)&v88[0] + 1);
        if (*((_QWORD *)&v88[0] + 1))
        {
          v32 = (unint64_t *)(*((_QWORD *)&v88[0] + 1) + 8);
          do
            v33 = __ldaxr(v32);
          while (__stlxr(v33 - 1, v32));
          if (!v33)
          {
            ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
            std::__shared_weak_count::__release_weak(v31);
          }
        }
        v34 = (std::__shared_weak_count *)__p[3];
        if (__p[3])
        {
          v35 = (unint64_t *)((char *)__p[3] + 8);
          do
            v36 = __ldaxr(v35);
          while (__stlxr(v36 - 1, v35));
          if (!v36)
          {
            ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
            std::__shared_weak_count::__release_weak(v34);
          }
        }
        v37 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          v38 = (unint64_t *)((char *)__p[1] + 8);
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
            std::__shared_weak_count::__release_weak(v37);
          }
        }
        if (**v30 <= 0)
        {
          v67 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)CoordinateTree)
                                                           + 576));
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            LODWORD(__p[0]) = 136315394;
            *(void **)((char *)__p + 4) = "XTCBinauralSpatializer.mm";
            WORD2(__p[1]) = 1024;
            *(_DWORD *)((char *)&__p[1] + 6) = 85;
            _os_log_impl(&dword_2164CC000, v67, OS_LOG_TYPE_ERROR, "%25s:%-5d POSTCONDITION: mFilterDatabases[lOrientation]->GetCoordinateCount() > 0 is false.", (uint8_t *)__p, 0x12u);
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "POSTCONDITION: mFilterDatabases[lOrientation]->GetCoordinateCount() > 0 is false.");
        }
        *((_DWORD *)this + 97) = 0;
      }
LABEL_62:
      ;
    }
    v40 = 0;
    v41 = 0;
    v75 = (const Phase::Controller::SpatializerEncoder *)&v75;
    v76 = (const Phase::Controller::SpatializerEncoder *)&v75;
    v77 = 0;
    v42 = 5;
    do
    {
      if (this[v42])
        goto LABEL_70;
      v43 = v41 - 1;
      if ((v41 & 1) != 0)
        v43 = v41 + 1;
      if (!v41)
        v43 = 0;
      if (this[6 * v43 + 5])
      {
LABEL_70:
        Phase::Device::GetOrientationString((uint64_t)__p);
        CoordinateTree = (uint64_t)operator new(0x28uLL);
        *(_OWORD *)(CoordinateTree + 16) = *(_OWORD *)__p;
        *(void **)(CoordinateTree + 32) = __p[2];
        v44 = v75;
        *(_QWORD *)CoordinateTree = v75;
        *(_QWORD *)(CoordinateTree + 8) = &v75;
        *((_QWORD *)v44 + 1) = CoordinateTree;
        v40 = v77 + 1;
        v75 = (const Phase::Controller::SpatializerEncoder *)CoordinateTree;
        ++v77;
      }
      ++v41;
      v42 += 6;
    }
    while (v41 != 7);
    if (v40)
    {
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__p);
      v46 = v75;
      v45 = v76;
      *(_QWORD *)buf = &__p[2];
      *(_QWORD *)&buf[8] = ", ";
      if (v76 != v75)
      {
        do
        {
          std::ostream_iterator<std::string,char,std::char_traits<char>>::operator=[abi:ne180100]((uint64_t)buf, (uint64_t)v45 + 16);
          v45 = (const Phase::Controller::SpatializerEncoder *)*((_QWORD *)v45 + 1);
        }
        while (v45 != v46);
        v45 = v75;
      }
      v49 = *((_QWORD *)v45 + 2);
      v48 = (char *)v45 + 16;
      v47 = v49;
      v50 = v48[23];
      if (v50 >= 0)
        v51 = (uint64_t)v48;
      else
        v51 = v47;
      if (v50 >= 0)
        v52 = v48[23];
      else
        v52 = *((_QWORD *)v48 + 1);
      v53 = (Phase::Logger *)std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p[2], v51, v52);
      v54 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v53)
                                                                                          + 576)));
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        (*((void (**)(void **__return_ptr, IR::IRData **))*this + 5))(v73, this);
        v55 = v74;
        v56 = (void **)v73[0];
        std::stringbuf::str();
        v57 = v73;
        if (v55 < 0)
          v57 = v56;
        if (v72 >= 0)
          v58 = &v71;
        else
          v58 = v71;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "XTCBinauralSpatializer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 115;
        v83 = 2080;
        v84 = v57;
        v85 = 2080;
        v86 = v58;
        _os_log_impl(&dword_2164CC000, v54, OS_LOG_TYPE_INFO, "%25s:%-5d [XTCBinauralSpatializer] %s Initialized with supported orientations { %s }", buf, 0x26u);
        if (v72 < 0)
          operator delete(v71);
        if (v74 < 0)
          operator delete(v73[0]);
      }

      __p[0] = *(void **)MEMORY[0x24BEDB7F0];
      v59 = *(void **)(MEMORY[0x24BEDB7F0] + 72);
      *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(MEMORY[0x24BEDB7F0] + 64);
      __p[2] = v59;
      __p[3] = (void *)(MEMORY[0x24BEDB848] + 16);
      if (v90 < 0)
        operator delete(v89);
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      v60 = (Phase::Logger *)MEMORY[0x2199F9CD4](v91);
    }
    else
    {
      v61 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)CoordinateTree)
                                                                                          + 576)));
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        (*((void (**)(_BYTE *__return_ptr, IR::IRData **))*this + 5))(buf, this);
        v62 = SBYTE3(v84) >= 0 ? buf : *(_BYTE **)buf;
        LODWORD(__p[0]) = 136315650;
        *(void **)((char *)__p + 4) = "XTCBinauralSpatializer.mm";
        WORD2(__p[1]) = 1024;
        *(_DWORD *)((char *)&__p[1] + 6) = 121;
        WORD1(__p[2]) = 2080;
        *(void **)((char *)&__p[2] + 4) = v62;
        _os_log_impl(&dword_2164CC000, v61, OS_LOG_TYPE_ERROR, "%25s:%-5d [XTCBinauralSpatializer] %s Initialize: IR asset has orientation dimension but no valid data.", (uint8_t *)__p, 0x1Cu);
        if (SBYTE3(v84) < 0)
          operator delete(*(void **)buf);
      }

    }
    if (!this[23] && !this[29])
    {
      v69 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v60) + 576));
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p[0]) = 136315394;
        *(void **)((char *)__p + 4) = "XTCBinauralSpatializer.mm";
        WORD2(__p[1]) = 1024;
        *(_DWORD *)((char *)&__p[1] + 6) = 126;
        _os_log_impl(&dword_2164CC000, v69, OS_LOG_TYPE_ERROR, "%25s:%-5d POSTCONDITION: IsDeviceOrientationSupported(static_cast<CAOrientation>(kDefaultDeviceOrientation)) is false.", (uint8_t *)__p, 0x12u);
      }
      v70 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v70, "POSTCONDITION: IsDeviceOrientationSupported(static_cast<CAOrientation>(kDefaultDeviceOrientation)) is false.");
    }
    std::__list_imp<std::string>::clear(&v75);
    __p[0] = &v80;
    std::vector<IR::IRCoordinateTree>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    if (*((_QWORD *)&v78 + 1))
    {
      v79 = *((_QWORD *)&v78 + 1);
      operator delete(*((void **)&v78 + 1));
    }
  }
  else
  {
    v11 = *((_DWORD *)this + 96);
    *(_QWORD *)&v78 = this[2];
    *(_QWORD *)buf = 0;
    LODWORD(v75) = v11;
    std::allocate_shared[abi:ne180100]<Phase::Controller::SpatializerFilterDatabase,std::allocator<Phase::Controller::SpatializerFilterDatabase>,Phase::Controller::Spatializer const*&,Phase::Controller::SpatializerEncoder const*&,unsigned int &,void>((const Phase::Controller::Spatializer **)&v78, (const Phase::Controller::SpatializerEncoder **)buf, (unsigned int *)&v75, __p);
    *(_OWORD *)&__p[2] = 0u;
    v88[0] = 0u;
    std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](this + 5, (uint64_t *)__p);
    std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](this + 7, (uint64_t *)&__p[2]);
    v12 = (Phase::Logger *)std::shared_ptr<Phase::Controller::SpatializerFilterDatabase>::operator=[abi:ne180100](this + 9, (uint64_t *)v88);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v88[0] + 1);
    if (*((_QWORD *)&v88[0] + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v88[0] + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = (std::__shared_weak_count *)__p[3];
    if (__p[3])
    {
      v17 = (unint64_t *)((char *)__p[3] + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v19 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v20 = (unint64_t *)((char *)__p[1] + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12)
                                                                                        + 576)));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      (*((void (**)(__int128 *__return_ptr, IR::IRData **))*this + 5))(&v78, this);
      v23 = v79 >= 0 ? &v78 : (__int128 *)v78;
      LODWORD(__p[0]) = 136315650;
      *(void **)((char *)__p + 4) = "XTCBinauralSpatializer.mm";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 65;
      WORD1(__p[2]) = 2080;
      *(void **)((char *)&__p[2] + 4) = v23;
      _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_INFO, "%25s:%-5d [XTCBinauralSpatializer] %s Initialized with no orientation information.", (uint8_t *)__p, 0x1Cu);
      if (SHIBYTE(v79) < 0)
        operator delete((void *)v78);
    }

  }
  v63 = CAGetDeviceOrientation();
  Phase::Controller::XTCBinauralEncoder::SetDeviceOrientation((uint64_t)this, v63);
  v64 = (std::__shared_weak_count *)this[4];
  this[3] = 0;
  this[4] = 0;
  if (v64)
  {
    p_shared_owners = (unint64_t *)&v64->__shared_owners_;
    do
      v66 = __ldaxr(p_shared_owners);
    while (__stlxr(v66 - 1, p_shared_owners));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
}

void sub_2166EDEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  std::__list_imp<std::string>::clear(&a19);
  IR::IRCoordinateTree::~IRCoordinateTree((IR::IRCoordinateTree *)&a22);
  _Unwind_Resume(a1);
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetFiltersAndDelays(IR::IRData **this, float a2, float a3, float a4, unsigned int a5, float **a6, float *a7)
{
  unsigned int FilterLength;
  uint64_t v11;
  unint64_t i;
  NSObject *v14;
  std::logic_error *exception;
  void *__p;
  void *v17;
  _QWORD v18[3];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!this[3])
  {
    v14 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)this) + 576));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "XTCBinauralSpatializer.mm";
      v21 = 1024;
      v22 = 210;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: nullptr != mIRData.get() is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: nullptr != mIRData.get() is false.");
  }
  Phase::Controller::SpatializerEncoder::VerifyCoordinateRanges((Phase::Logger *)this, a2, a3, a4);
  IR::IRCoordinates::IRCoordinates((IR::IRCoordinates *)buf);
  IR::IRCoordinates::set();
  IR::IRCoordinates::set();
  if (IR::IRData::getNumDimensions(this[3]) >= 3)
    IR::IRCoordinates::set();
  if (IR::IRData::getNumFiltersPerSpatialPoint(this[3]) != 2)
    std::terminate();
  FilterLength = IR::IRData::getFilterLength(this[3]);
  std::vector<float>::vector(&__p, FilterLength);
  std::vector<std::vector<float>>::vector(v18, 2uLL, (uint64_t)&__p);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  std::vector<float>::vector(&__p, 2uLL);
  IR::IRData::getInterpolatedTimeDomainCoeffs();
  v11 = 0;
  for (i = 0; (uint64_t)i < (*((int (**)(IR::IRData **))*this + 6))(this); ++i)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18[1] - v18[0]) >> 3) <= i)
      std::vector<std::vector<float>>::__throw_out_of_range[abi:ne180100]();
    memcpy(a6[i], *(const void **)(v18[0] + v11), 4 * *((int *)this + 94));
    a7[i] = *((float *)__p + i);
    v11 += 24;
  }
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  __p = v18;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return 1;
}

void sub_2166EE264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12)
{
  void *v12;

  __cxa_free_exception(v12);
  _Unwind_Resume(a1);
}

_QWORD *Phase::Controller::XTCBinauralEncoder::AcquireFilters@<X0>(Phase::Controller::XTCBinauralEncoder *this@<X0>, _QWORD *a2@<X8>)
{
  return Phase::Controller::SpatializerFilterHandle::SpatializerFilterHandle(a2, (Phase::Controller::XTCBinauralEncoder *)((char *)this + 48 * *((unsigned int *)this + 97) + 40));
}

_QWORD *Phase::Controller::XTCBinauralEncoder::GetDescription@<X0>(Phase::Controller::XTCBinauralEncoder *this@<X0>, _QWORD *a2@<X8>)
{
  int v3;
  int v4;
  void **v5;
  void *__p[2];
  char v8;
  char __str[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *((_DWORD *)this + 94);
  v4 = (*(uint64_t (**)(Phase::Controller::XTCBinauralEncoder *))(*(_QWORD *)this + 48))(this);
  Phase::Device::GetOrientationString((uint64_t)__p);
  if (v8 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  snprintf(__str, 0x100uLL, "<Encoder Type: XTCBinaural, Filter Length: %d, Output Channel Count: %d, Device Orientation: %s>", v3, v4, (const char *)v5);
  if (v8 < 0)
    operator delete(__p[0]);
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetOutputChannelCount(Phase::Controller::XTCBinauralEncoder *this)
{
  return 2;
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetFilterLengthInSamples(Phase::Controller::XTCBinauralEncoder *this, const Phase::Controller::SpatializerFilterHandle *a2)
{
  return *((unsigned int *)this + 94);
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetTotalFilterLengthInSamples(Phase::Controller::XTCBinauralEncoder *this, const Phase::Controller::SpatializerFilterHandle *a2)
{
  return *((unsigned int *)this + 96);
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetCoordinateCount(Phase::Controller::XTCBinauralEncoder *this, const Phase::Controller::SpatializerFilterHandle *a2)
{
  uint64_t result;
  uint64_t i;
  _DWORD *v5;

  result = 0;
  for (i = 40; i != 376; i += 48)
  {
    v5 = *(_DWORD **)((char *)this + i);
    if (v5)
      result = (*v5 + result);
  }
  return result;
}

uint64_t Phase::Controller::XTCBinauralEncoder::GetWorkBufferSizeInBytes(Phase::Controller::XTCBinauralEncoder *this, const Phase::Controller::SpatializerFilterHandle *a2)
{
  int v3;

  if (!*(_BYTE *)(*((_QWORD *)a2 + 4) + 8))
    return 0;
  v3 = (*(uint64_t (**)(Phase::Controller::XTCBinauralEncoder *))(*(_QWORD *)this + 56))(this);
  return 4
       * v3
       * (*(unsigned int (**)(Phase::Controller::XTCBinauralEncoder *))(*(_QWORD *)this + 48))(this);
}

char *Phase::Controller::XTCBinauralEncoder::GetNearestFilter(Phase::Controller::XTCBinauralEncoder *this, Phase::Controller::SpatializerFilterDatabase **a2, float a3, float a4, char *a5)
{
  Phase::Logger *v10;
  Phase::Logger *v11;
  float v12;
  unint64_t NearestFilter;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v19;
  std::logic_error *exception;
  NSObject *v21;
  std::logic_error *v22;
  NSObject *v23;
  std::logic_error *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!*a2)
  {
    v19 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(this) + 576));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315394;
      v26 = "XTCBinauralSpatializer.mm";
      v27 = 1024;
      v28 = 290;
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: inHandle is false.", (uint8_t *)&v25, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "PRECONDITION: inHandle is false.");
  }
  v10 = Phase::Controller::SpatializerEncoder::VerifyCoordinateRanges(this, a3, a4, 0.0);
  if (!*((_BYTE *)a2[4] + 8))
    return (char *)Phase::Controller::SpatializerFilterDatabase::GetNearestFilter(*a2, a3, a4);
  if (!a5)
  {
    v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 576));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315394;
      v26 = "XTCBinauralSpatializer.mm";
      v27 = 1024;
      v28 = 301;
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: nullptr != pInWorkBuffer is false.", (uint8_t *)&v25, 0x12u);
    }
    v22 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](v22, "PRECONDITION: nullptr != pInWorkBuffer is false.");
  }
  v11 = (Phase::Logger *)(*(uint64_t (**)(Phase::Controller::XTCBinauralEncoder *))(*(_QWORD *)this + 48))(this);
  if ((_DWORD)v11 != 2)
  {
    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 576));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315394;
      v26 = "XTCBinauralSpatializer.mm";
      v27 = 1024;
      v28 = 302;
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: 2 == GetOutputChannelCount() is false.", (uint8_t *)&v25, 0x12u);
    }
    v24 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v24, "PRECONDITION: 2 == GetOutputChannelCount() is false.");
  }
  v12 = 0.0;
  if (a4 > 0.0)
    v12 = 360.0 - a4;
  NearestFilter = Phase::Controller::SpatializerFilterDatabase::GetNearestFilter(*a2, a3, v12);
  v14 = (*(uint64_t (**)(Phase::Controller::XTCBinauralEncoder *, Phase::Controller::SpatializerFilterDatabase **))(*(_QWORD *)this + 56))(this, a2);
  if (v14)
  {
    v15 = 0;
    v16 = v14;
    do
    {
      v17 = &a5[v15];
      *(_DWORD *)v17 = *(_DWORD *)(NearestFilter + v15 + 4);
      *((_DWORD *)v17 + 1) = *(_DWORD *)(NearestFilter + v15);
      v15 += 8;
      --v16;
    }
    while (v16);
  }
  return a5;
}

void sub_2166EE78C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void IR::IRCoordinateTree::~IRCoordinateTree(IR::IRCoordinateTree *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 32);
  std::vector<IR::IRCoordinateTree>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

uint64_t std::ostream_iterator<std::string,char,std::char_traits<char>>::operator=[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, a2, v5);
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = strlen(*(const char **)(a1 + 8));
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)a1, v6, v7);
  }
  return a1;
}

void std::__list_imp<std::string>::clear(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  if (a1[2])
  {
    v3 = *a1;
    v2 = a1[1];
    v4 = *(_QWORD **)v2;
    v4[1] = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v3 + 8) = v4;
    a1[2] = 0;
    while ((_QWORD *)v2 != a1)
    {
      v5 = *(_QWORD *)(v2 + 8);
      std::__list_imp<std::string>::__delete_node[abi:ne180100]<>((int)a1, (void **)v2);
      v2 = v5;
    }
  }
}

void std::__list_imp<std::string>::__delete_node[abi:ne180100]<>(int a1, void **__p)
{
  if (*((char *)__p + 39) < 0)
    operator delete(__p[2]);
  operator delete(__p);
}

void std::vector<IR::IRCoordinateTree>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (uint64_t)v4 - 24;
      do
      {
        v9 = v6;
        std::vector<IR::IRCoordinateTree>::__destroy_vector::operator()[abi:ne180100](&v9);
        v7 = *(void **)(v6 - 24);
        if (v7)
        {
          *(_QWORD *)(v6 - 16) = v7;
          operator delete(v7);
        }
        v8 = (void *)(v6 - 32);
        v6 -= 56;
      }
      while (v8 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

Phase::Zeppelin::HorizontalSliceDatabaseContext *Phase::Zeppelin::HorizontalSliceDatabaseContext::HorizontalSliceDatabaseContext(Phase::Zeppelin::HorizontalSliceDatabaseContext *this)
{
  uint64_t DefaultThirdOctaveBandCenterFrequencies;

  *(_DWORD *)this = 181;
  DefaultThirdOctaveBandCenterFrequencies = Phase::Zeppelin::AcousticsUtils::GetDefaultThirdOctaveBandCenterFrequencies(this);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 1) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((_QWORD *)this + 1, *(const void **)DefaultThirdOctaveBandCenterFrequencies, *(_QWORD *)(DefaultThirdOctaveBandCenterFrequencies + 8), (uint64_t)(*(_QWORD *)(DefaultThirdOctaveBandCenterFrequencies + 8)- *(_QWORD *)DefaultThirdOctaveBandCenterFrequencies) >> 2);
  return this;
}

Phase::Zeppelin::HorizontalSliceDatabaseContext *Phase::Zeppelin::HorizontalSliceDatabaseContext::HorizontalSliceDatabaseContext(Phase::Zeppelin::HorizontalSliceDatabaseContext *this, int a2, const float *a3, unint64_t a4)
{
  char *v5;
  void *v6;
  float *v7;
  float *v8;
  NSObject *v10;
  std::logic_error *exception;
  NSObject *v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)this = a2;
  *((_QWORD *)this + 1) = 0;
  v5 = (char *)this + 8;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  if (!a4 || !a2 || !a3)
  {
    v12 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 928);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ZeppelinContexts.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 46;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(!SphereSampling::IsDatabaseContextValid(inNumAngles, kNumElevation, pInCenterFrequenciesArr, inCenterFrequenciesArrLength)) is true]: ErrorDescriptions::kErrDescr_invalidHorizontalSliceDatabaseDefinition", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_invalidHorizontalSliceDatabaseDefinition);
LABEL_14:
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
  }
  memset(buf, 0, sizeof(buf));
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(buf, a3, (uint64_t)&a3[a4], a4);
  v6 = *(void **)v5;
  if (*(_QWORD *)v5)
  {
    *((_QWORD *)this + 2) = v6;
    operator delete(v6);
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    *((_QWORD *)v5 + 2) = 0;
  }
  v7 = *(float **)buf;
  *((_QWORD *)this + 1) = *(_QWORD *)buf;
  v8 = *(float **)&buf[8];
  *((_OWORD *)this + 1) = *(_OWORD *)&buf[8];
  while (v7 != v8)
  {
    if (*v7 <= 0.0)
    {
      v10 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)v6) + 928);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "ZeppelinContexts.cpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 53;
        _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(!AcousticsUtils::AreCenterFrequenciesValid(mCenterFrequencies)) is true]: ErrorDescriptions::kErrDescr_invalidCenterFrequencies", buf, 0x12u);
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_invalidCenterFrequencies);
      goto LABEL_14;
    }
    ++v7;
  }
  return this;
}

void sub_2166EEC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  void *v11;
  void *v13;

  __cxa_free_exception(v11);
  v13 = *a10;
  if (*a10)
  {
    *(_QWORD *)(v10 + 16) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(a1);
}

uint64_t Phase::Zeppelin::ScsRadiationContext::ScsRadiationContext(uint64_t result, unsigned int a2, int a3, double a4, double a5)
{
  NSObject *v5;
  std::logic_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(double *)result = a4;
  *(double *)(result + 8) = a5;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  if (a2 > 0xC || a5 > 3.14159265 || a4 <= 0.0 || a5 <= 0.0)
  {
    v5 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)result) + 928);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "ZeppelinContexts.cpp";
      v9 = 1024;
      v10 = 275;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(!ScsRadiationContext::IsValid(mSphereRadius, mCapHalfAngleRad, mNumberOfExpansionTerms)) is true]: ErrorDescriptions::kErrDescr_invalidScsDefinition", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_invalidScsDefinition);
  }
  return result;
}

void sub_2166EEDC8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

float *Phase::Zeppelin::PropagationMediumContext::PropagationMediumContext(float *this, float a2, float a3)
{
  NSObject *v3;
  std::logic_error *exception;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *this = a2;
  this[1] = a3;
  if (a2 <= 0.0 || a3 <= 0.0)
  {
    v3 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)this) + 928);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "ZeppelinContexts.cpp";
      v7 = 1024;
      v8 = 364;
      _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(!PropagationMediumContext::IsValid(mSpeedOfSound, mMediumDensity)) is true]: ErrorDescriptions::kErrDescr_invalidPropagationMedium", (uint8_t *)&v5, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_invalidPropagationMedium);
  }
  return this;
}

void sub_2166EEEE0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void Phase::Zeppelin::SCSRadiationPrecomputedData::~SCSRadiationPrecomputedData(Phase::Zeppelin::SCSRadiationPrecomputedData *this)
{
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;

  v4 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (_QWORD *)((char *)this + 8);
  v3 = v4;
  *v2 = 0;
  if (v4)
    std::default_delete<Phase::Zeppelin::SCSRadiationSphereSamplingDependentPrecomputedData>::operator()[abi:ne180100]((uint64_t)v2, v3);
  std::unique_ptr<Phase::Zeppelin::SCSRadiationSphereSamplingIndependentPrecomputedData>::reset[abi:ne180100]((Phase::Zeppelin::SCSRadiationSphereSamplingIndependentPrecomputedData **)this, 0);
}

void Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::Populate(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v7;
  unsigned int v8;
  float v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  int v18;
  float v19;

  v3 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (v3)
  {
    v7 = 0;
    v8 = 0;
    v9 = *(float *)(a1 + 28);
    v10 = v3 >> 2;
    v11 = *(unsigned int *)(a1 + 24);
    do
    {
      v12 = *(_DWORD *)(*(_QWORD *)a1 + 4 * v7);
      v13 = 1.0;
      if (a3)
      {
        v14 = *(_QWORD *)(a2 + 24);
        v19 = 0.0;
        v18 = v12;
        if (!v14)
          goto LABEL_12;
        v13 = (*(double (**)(uint64_t, float *, int *))(*(_QWORD *)v14 + 48))(v14, &v19, &v18);
      }
      if ((_DWORD)v11)
      {
        v15 = 0;
        while (1)
        {
          v16 = *(_QWORD *)(a2 + 24);
          v17 = (float)(v9 * (float)v15) * 0.0174532925;
          v18 = v12;
          v19 = v17;
          if (!v16)
            break;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v15++) + 8 * v7) = (*(double (**)(uint64_t, float *, int *))(*(_QWORD *)v16 + 48))(v16, &v19, &v18)/ v13;
          if (v11 == v15)
            goto LABEL_10;
        }
LABEL_12:
        std::__throw_bad_function_call[abi:ne180100]();
      }
LABEL_10:
      v7 = ++v8;
    }
    while (v10 > v8);
  }
}

Phase::Logger *Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Logger *a1, uint64_t a2, uint64_t a3, float *a4, uint64_t a5)
{
  char *v10;
  int v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  Phase::Zeppelin::SCSRadiationSphereSamplingIndependentPrecomputedData *v22;
  NSObject *v24;
  std::logic_error *exception;
  void *v26;
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  Phase::Zeppelin::SCSRadiationSphereSamplingIndependentPrecomputedData *v32;
  uint64_t *v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[24];
  _BYTE *v40;
  _BYTE buf[12];
  __int16 v42;
  int v43;
  _BYTE *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  if (!a2 || !a3 || !a4 || !a5)
  {
    v24 = **(NSObject ***)(Phase::Logger::GetInstancePtr(a1) + 928);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ZeppelinContexts.cpp";
      v42 = 1024;
      v43 = 597;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(nullptr == pInHorSlcDbContext || nullptr == pInScsRadiationCtx || nullptr == pInPropagationMediumCtx || nullptr == pInNormalizationCtx) is true]: ErrorDescriptions::kErrDescr_nullPtr", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_nullPtr);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
  }
  v34 = 0;
  v35 = 0;
  v36 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v34, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 2);
  Phase::Zeppelin::SCSRadiationPrecomputedData::SCSRadiationPrecomputedData((uint64_t **)&v32, &v34, *(_DWORD *)a2, a3, a4, a5);
  v30 = 0;
  v29 = 0uLL;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v29, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 2);
  *(_QWORD *)&v31 = a3;
  *((_QWORD *)&v31 + 1) = &v32;
  v44 = 0;
  v10 = (char *)operator new(0x30uLL);
  *(_QWORD *)v10 = &off_24D582588;
  *(_OWORD *)(v10 + 8) = v29;
  *((_QWORD *)v10 + 3) = v30;
  v29 = 0uLL;
  v30 = 0;
  *((_OWORD *)v10 + 2) = v31;
  v44 = v10;
  v11 = *(_DWORD *)a2;
  __p[0] = 0;
  __p[1] = 0;
  v12 = *(const void **)(a2 + 8);
  v13 = *(_QWORD *)(a2 + 16);
  v28 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, v12, v13, (v13 - (uint64_t)v12) >> 2);
  v14 = operator new();
  v26 = __p[0];
  v37 = *(_OWORD *)__p;
  v38 = v28;
  __p[1] = 0;
  v28 = 0;
  __p[0] = 0;
  Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::NDimEquiangularHalfCircleData(v14, v11, (uint64_t)&v37);
  if (v26)
    operator delete(v26);
  std::unique_ptr<Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>>::reset[abi:ne180100]((uint64_t *)a1, v14);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v15 = *(_QWORD *)a1;
  v16 = (uint64_t)v44;
  if (!v44)
    goto LABEL_12;
  if (v44 != buf)
  {
    v16 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v44 + 16))(v44);
LABEL_12:
    v40 = (_BYTE *)v16;
    goto LABEL_14;
  }
  v40 = v39;
  (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)buf + 24))(buf, v39);
LABEL_14:
  Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::Populate(v15, (uint64_t)v39, 1);
  v17 = v40;
  if (v40 == v39)
  {
    v18 = 4;
    v17 = v39;
  }
  else
  {
    if (!v40)
      goto LABEL_19;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_19:
  v19 = v44;
  if (v44 == buf)
  {
    v20 = 4;
    v19 = buf;
  }
  else
  {
    if (!v44)
      goto LABEL_24;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_24:
  v21 = v33;
  v33 = 0;
  if (v21)
    std::default_delete<Phase::Zeppelin::SCSRadiationSphereSamplingDependentPrecomputedData>::operator()[abi:ne180100]((uint64_t)&v33, v21);
  v22 = v32;
  v32 = 0;
  if (v22)
  {
    Phase::Zeppelin::SCSRadiationSphereSamplingIndependentPrecomputedData::~SCSRadiationSphereSamplingIndependentPrecomputedData(v22);
    MEMORY[0x2199F9D70]();
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  return a1;
}

void sub_2166EF3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,void *__p,uint64_t a22)
{
  uint64_t *v22;

  std::unique_ptr<Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>>::reset[abi:ne180100](v22, 0);
  _Unwind_Resume(a1);
}

uint64_t Phase::Zeppelin::HorizontalSliceDatabase::GenerateDatabaseForNewFrequencyResolution@<X0>(Phase::Zeppelin::HorizontalSliceDatabase *this@<X0>, float *a2@<X1>, unint64_t a3@<X2>, Phase::Zeppelin::AcousticsUtils **a4@<X8>)
{
  Phase::Zeppelin::AcousticsUtils *v7;
  uint64_t DefaultThirdOctaveBandCenterFrequencies;
  uint64_t v9;
  uint64_t v10;
  double **v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  float *v15;
  float *v16;
  uint64_t v17;
  double *v18;
  float v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const void *v25;
  float *v26;
  float *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double *v32;
  double *v33;
  int64_t v34;
  double *v35;
  double v36;
  double v37;
  double *v38;
  double v39;
  double v40;
  uint64_t v41;
  double *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  double v49;
  double v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double *v58;
  double *v59;
  double *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  double *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t *v75;
  uint64_t v76;
  double *v77;
  double v78;
  double *v79;
  double v80;
  double v81;
  double *v82;
  unint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double *v89;
  double *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  double *v96;
  uint64_t v97;
  double *v98;
  double v99;
  int v101;
  const char *v102;
  NSObject *v103;
  std::logic_error *exception;
  NSObject *v105;
  std::logic_error *v106;
  uint64_t *v107;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  _BYTE *v117;
  void *__p;
  void *v119;
  uint64_t v120;
  void *v121;
  double *v122;
  uint64_t v123;
  void *v124;
  double *v125;
  uint64_t v126;
  void *v127;
  _BYTE *v128;
  uint64_t v129;
  void *v130;
  double *v131;
  double *v132;
  void *v133;
  char *v134;
  char *v135;
  double *v136;
  double *v137;
  double *v138;
  double *v139[3];
  double **v140;
  uint8_t buf[24];
  uint8_t *v142;
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v103 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 928);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ZeppelinContexts.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 667;
      _os_log_impl(&dword_2164CC000, v103, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(nullptr == pInNewCenterFrequenciesArr) is true]: ErrorDescriptions::kErrDescr_nullPtr", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_nullPtr);
  }
  if (!a3)
  {
    v105 = **(NSObject ***)(Phase::Logger::GetInstancePtr(this) + 928);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ZeppelinContexts.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 673;
      _os_log_impl(&dword_2164CC000, v105, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"HorizontalSliceDatabase: The passed frequencies array length is smaller than or equal to zero.\"", buf, 0x12u);
    }
    v106 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](v106, "HorizontalSliceDatabase: The passed frequencies array length is smaller than or equal to zero.");
  }
  v7 = (Phase::Zeppelin::AcousticsUtils *)operator new();
  *(_QWORD *)v7 = 0;
  DefaultThirdOctaveBandCenterFrequencies = Phase::Zeppelin::AcousticsUtils::GetDefaultThirdOctaveBandCenterFrequencies(v7);
  v9 = operator new();
  memset(buf, 0, sizeof(buf));
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, *(const void **)DefaultThirdOctaveBandCenterFrequencies, *(_QWORD *)(DefaultThirdOctaveBandCenterFrequencies + 8), (uint64_t)(*(_QWORD *)(DefaultThirdOctaveBandCenterFrequencies + 8)- *(_QWORD *)DefaultThirdOctaveBandCenterFrequencies) >> 2);
  Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::NDimEquiangularHalfCircleData(v9, 181, (uint64_t)buf);
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  std::unique_ptr<Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>>::reset[abi:ne180100]((uint64_t *)v7, v9);
  v142 = buf;
  v10 = *(_QWORD *)v7;
  v140 = v139;
  *(_QWORD *)buf = &off_24D582540;
  v139[0] = (double *)&off_24D582540;
  Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::Populate(v10, (uint64_t)v139, 0);
  v11 = v140;
  if (v140 == v139)
  {
    v12 = 4;
    v11 = v139;
  }
  else
  {
    if (!v140)
      goto LABEL_10;
    v12 = 5;
  }
  (*(void (**)(void))&(*v11)[v12])();
LABEL_10:
  v13 = v142;
  if (v142 == buf)
  {
    v14 = 4;
    v13 = buf;
  }
  else
  {
    if (!v142)
      goto LABEL_15;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
LABEL_15:
  *a4 = v7;
  v111 = *(_QWORD *)this;
  v127 = 0;
  v128 = 0;
  v129 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v127, a2, (uint64_t)&a2[a3], a3);
  v107 = (uint64_t *)v7;
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<float const*,float const*>((char *)&v124, a2, &a2[a3], a3);
  v15 = *(float **)v111;
  v16 = *(float **)(v111 + 8);
  v121 = 0;
  v122 = 0;
  v123 = 0;
  if (v16 != v15)
  {
    std::vector<Phase::FrequencyBand<float>>::__vallocate[abi:ne180100](&v121, v16 - v15);
    v17 = 0;
    v18 = v122;
    do
    {
      v19 = *v15++;
      v18[v17++] = v19;
    }
    while (v15 != v16);
    v122 = &v18[v17];
  }
  v20 = operator new();
  v21 = *(_DWORD *)(v111 + 24);
  memset(buf, 0, sizeof(buf));
  v109 = v20;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, v127, (uint64_t)v128, (v128 - (_BYTE *)v127) >> 2);
  Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::NDimEquiangularHalfCircleData(v20, v21, (uint64_t)buf);
  v115 = v20;
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v22 = (uint64_t)(*(_QWORD *)(v111 + 8) - *(_QWORD *)v111) >> 2;
  *(_QWORD *)buf = 0;
  std::vector<double>::vector(&__p, v22, buf);
  v23 = (uint64_t)(*(_QWORD *)(v20 + 8) - *(_QWORD *)v20) >> 2;
  *(_QWORD *)buf = 0;
  std::vector<double>::vector(&v116, v23, buf);
  std::vector<double>::reserve(&__p, (uint64_t)(*(_QWORD *)(v111 + 8) - *(_QWORD *)v111) >> 2);
  std::vector<double>::reserve(&v116, (uint64_t)(*(_QWORD *)(v20 + 8) - *(_QWORD *)v20) >> 2);
  if (*(_DWORD *)(v20 + 24))
  {
    v24 = 0;
    while (1)
    {
      v25 = *(const void **)(*(_QWORD *)(v111 + 32) + 8 * v24);
      v27 = *(float **)v111;
      v26 = *(float **)(v111 + 8);
      memset(buf, 0, sizeof(buf));
      v28 = (char *)v26 - (char *)v27;
      if (v26 == v27)
      {
        v30 = 0;
      }
      else
      {
        std::vector<Phase::FrequencyBand<float>>::__vallocate[abi:ne180100](buf, v28 >> 2);
        v29 = *(_QWORD *)&buf[8];
        memmove(*(void **)&buf[8], v25, 2 * v28);
        v30 = (void *)(v29 + 8 * (v28 >> 2));
        *(_QWORD *)&buf[8] = v30;
      }
      if (__p)
      {
        v119 = __p;
        operator delete(__p);
        v30 = *(void **)&buf[8];
      }
      v31 = *(_QWORD *)buf;
      __p = *(void **)buf;
      v119 = v30;
      v120 = *(_QWORD *)&buf[16];
      v32 = (double *)v124;
      v33 = v125;
      v113 = (double *)v116;
      v34 = (char *)v122 - (_BYTE *)v121;
      if (v122 != v121)
        break;
LABEL_33:
      if (v124 != v125)
      {
        v38 = (double *)((char *)v124 + 8);
        do
        {
          if (v38 == v125)
            goto LABEL_38;
          v40 = *(v38 - 1);
          v39 = *v38++;
        }
        while (v39 >= v40);
        v101 = 263;
        v102 = "std::is_sorted(inOutputFrequenciesFirst, inOutputFrequenciesLast)";
        goto LABEL_144;
      }
LABEL_38:
      Phase::GetBandsFromCenterFrequencies<std::__wrap_iter<double const*>,double>((double **)buf, (double *)v121, v122);
      Phase::GetBandsFromCenterFrequencies<std::__wrap_iter<double const*>,double>(v139, v32, v33);
      v41 = (char *)v33 - (char *)v32;
      v136 = 0;
      v137 = 0;
      v138 = 0;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v130 = 0;
      v131 = 0;
      v132 = 0;
      if ((char *)v33 - (char *)v32 > 0)
      {
        v110 = v24;
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v45 = 0;
        v46 = v41 >> 3;
        v47 = v34 >> 3;
        v114 = (v34 >> 3) - 1;
        if (v46 <= 1)
          v46 = 1;
        v112 = v46;
        do
        {
          v48 = &v139[0][2 * v45];
          v49 = *v48;
          v50 = v48[1];
          v137 = v136;
          v134 = v43;
          v131 = v42;
          if (v44 < v47)
          {
            v51 = (double *)(*(_QWORD *)buf + 16 * v44);
            v52 = *v51;
            v53 = v51[1];
            if (v50 < v53)
              v53 = v50;
            if (v52 >= v49)
              v54 = *v51;
            else
              v54 = v49;
            v55 = fmax(v53 - v54, 0.0);
            v56 = v50;
            v57 = v44;
            if (v55 == 0.0)
            {
LABEL_89:
              v44 -= v52 != v56;
            }
            else
            {
              while (1)
              {
                v58 = v137;
                if (v137 >= v138)
                {
                  v60 = v136;
                  v61 = v137 - v136;
                  v62 = v61 + 1;
                  if ((unint64_t)(v61 + 1) >> 61)
                    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                  v63 = (char *)v138 - (char *)v136;
                  if (((char *)v138 - (char *)v136) >> 2 > v62)
                    v62 = v63 >> 2;
                  if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
                    v64 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v64 = v62;
                  if (v64)
                  {
                    v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v138, v64);
                    v60 = v136;
                    v58 = v137;
                  }
                  else
                  {
                    v65 = 0;
                  }
                  v66 = (double *)&v65[8 * v61];
                  *v66 = v55;
                  v59 = v66 + 1;
                  while (v58 != v60)
                  {
                    v67 = *((_QWORD *)v58-- - 1);
                    *((_QWORD *)v66-- - 1) = v67;
                  }
                  v136 = v66;
                  v137 = v59;
                  v138 = (double *)&v65[8 * v64];
                  if (v60)
                    operator delete(v60);
                }
                else
                {
                  *v137 = v55;
                  v59 = v58 + 1;
                }
                v137 = v59;
                v68 = v134;
                if (v134 >= v135)
                {
                  v69 = (char *)v133;
                  v70 = (v134 - (_BYTE *)v133) >> 3;
                  v71 = v70 + 1;
                  if ((unint64_t)(v70 + 1) >> 61)
                    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                  v72 = v135 - (_BYTE *)v133;
                  if ((v135 - (_BYTE *)v133) >> 2 > v71)
                    v71 = v72 >> 2;
                  if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
                    v73 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v73 = v71;
                  if (v73)
                  {
                    v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v135, v73);
                    v69 = (char *)v133;
                    v68 = v134;
                  }
                  else
                  {
                    v74 = 0;
                  }
                  v75 = (uint64_t *)&v74[8 * v70];
                  *v75 = v44;
                  v43 = (char *)(v75 + 1);
                  while (v68 != v69)
                  {
                    v76 = *((_QWORD *)v68 - 1);
                    v68 -= 8;
                    *--v75 = v76;
                  }
                  v133 = v75;
                  v134 = v43;
                  v135 = &v74[8 * v73];
                  if (v69)
                    operator delete(v69);
                }
                else
                {
                  *(_QWORD *)v134 = v44;
                  v43 = v68 + 8;
                }
                v134 = v43;
                if (v44 == v114)
                  v57 = v44;
                if (++v44 == v47)
                  break;
                v77 = (double *)(*(_QWORD *)buf + 16 * v44);
                v52 = *v77;
                v78 = v77[1];
                v79 = &v139[0][2 * v45];
                v80 = *v79;
                v56 = v79[1];
                if (v56 < v78)
                  v78 = v79[1];
                if (v52 >= v80)
                  v80 = v52;
                v55 = fmax(v78 - v80, 0.0);
                if (v55 == 0.0)
                  goto LABEL_89;
              }
              v44 = v57;
            }
          }
          v81 = 0.0;
          v82 = v131;
          if (v43 == v133)
          {
            v89 = v131;
            v85 = 0.0;
          }
          else
          {
            v83 = 0;
            v84 = v50 - v49;
            v85 = 0.0;
            v43 = (char *)v133;
            do
            {
              v86 = v136[v83] / v84;
              v87 = *(double *)(v31 + 8 * *(_QWORD *)&v43[8 * v83]);
              v88 = v86 * (v87 * v87);
              if (v82 >= v132)
              {
                v90 = (double *)v130;
                v91 = ((char *)v82 - (_BYTE *)v130) >> 3;
                v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 61)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v93 = (char *)v132 - (_BYTE *)v130;
                if (((char *)v132 - (_BYTE *)v130) >> 2 > v92)
                  v92 = v93 >> 2;
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF8)
                  v94 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v94 = v92;
                if (v94)
                {
                  v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v132, v94);
                  v90 = (double *)v130;
                  v82 = v131;
                }
                else
                {
                  v95 = 0;
                }
                v96 = (double *)&v95[8 * v91];
                *v96 = v88;
                v89 = v96 + 1;
                while (v82 != v90)
                {
                  v97 = *((_QWORD *)v82-- - 1);
                  *((_QWORD *)v96-- - 1) = v97;
                }
                v130 = v96;
                v131 = v89;
                v132 = (double *)&v95[8 * v94];
                if (v90)
                  operator delete(v90);
              }
              else
              {
                *v82 = v88;
                v89 = v82 + 1;
              }
              v131 = v89;
              v85 = v85 + v86;
              ++v83;
              v43 = (char *)v133;
              v82 = v89;
            }
            while (v83 < (v134 - (_BYTE *)v133) >> 3);
          }
          v42 = (double *)v130;
          if (v130 != v89)
          {
            v81 = 0.0;
            v98 = (double *)v130;
            do
            {
              v99 = *v98++;
              v81 = v81 + v99;
            }
            while (v98 != v89);
          }
          v113[v45++] = sqrt(v81 / v85);
        }
        while (v45 != v112);
        v20 = v109;
        v24 = v110;
        if (v42)
        {
          v131 = v42;
          operator delete(v42);
          v43 = (char *)v133;
        }
        if (v43)
        {
          v134 = v43;
          operator delete(v43);
        }
      }
      if (v136)
      {
        v137 = v136;
        operator delete(v136);
      }
      if (v139[0])
      {
        v139[1] = v139[0];
        operator delete(v139[0]);
      }
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      if (v117 != v116)
        memmove(*(void **)(*(_QWORD *)(v20 + 32) + 8 * v24), v116, v117 - (_BYTE *)v116);
      if (++v24 >= (unint64_t)*(unsigned int *)(v20 + 24))
        goto LABEL_130;
    }
    v35 = (double *)((char *)v121 + 8);
    do
    {
      if (v35 == v122)
        goto LABEL_33;
      v37 = *(v35 - 1);
      v36 = *v35++;
    }
    while (v36 >= v37);
    v101 = 262;
    v102 = "std::is_sorted(inFrequenciesFirst, inFrequenciesLast)";
LABEL_144:
    __assert_rtn("GetValuesFromFrequencyResponse", "FrequencyResponse.hpp", v101, v102);
  }
LABEL_130:
  if (v116)
  {
    v117 = v116;
    operator delete(v116);
  }
  if (__p)
  {
    v119 = __p;
    operator delete(__p);
  }
  if (v121)
  {
    v122 = (double *)v121;
    operator delete(v121);
  }
  if (v124)
  {
    v125 = (double *)v124;
    operator delete(v124);
  }
  if (v127)
  {
    v128 = v127;
    operator delete(v127);
  }
  return std::unique_ptr<Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>>::reset[abi:ne180100](v107, v115);
}

void sub_2166EFF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40)
{
  void *v40;

  __cxa_free_exception(v40);
  _Unwind_Resume(a1);
}

uint64_t Phase::Zeppelin::SphereSampling::NDimEquiangularHalfCircleData<float,double>::NDimEquiangularHalfCircleData(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v5;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((_QWORD *)a1, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 24) = a2;
  *(float *)(a1 + 28) = 180.0 / (float)(a2 - 1);
  *(_QWORD *)(a1 + 32) = operator new[]();
  if (*(_DWORD *)(a1 + 24))
  {
    v5 = 0;
    do
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v5++) = operator new[]();
    while (v5 < *(unsigned int *)(a1 + 24));
  }
  return a1;
}

void sub_2166F0240(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0>,double ()(float,float)>::~__func()
{
  JUMPOUT(0x2199F9D70);
}

_QWORD *std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0>,double ()(float,float)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24D582540;
  return result;
}

void std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0>,double ()(float,float)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24D582540;
}

double std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(void)::$_0>,double ()(float,float)>::operator()()
{
  return 1.0;
}

_QWORD *std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::~__func(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24D582588;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::~__func(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24D582588;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x2199F9D70);
}

_QWORD *std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x30uLL);
  *v2 = &off_24D582588;
  v2[2] = 0;
  v2[3] = 0;
  v2[1] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v2 + 1, *(const void **)(a1 + 8), *(_QWORD *)(a1 + 16), (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 2);
  *((_OWORD *)v2 + 2) = *(_OWORD *)(a1 + 32);
  return v2;
}

void sub_2166F039C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::__clone(uint64_t a1, __n128 *a2)
{
  __n128 result;

  a2->n128_u64[0] = (unint64_t)&off_24D582588;
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2->n128_u64[1] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&a2->n128_u64[1], *(const void **)(a1 + 8), *(_QWORD *)(a1 + 16), (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 2);
  result = *(__n128 *)(a1 + 32);
  a2[2] = result;
  return result;
}

void std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::destroy(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::destroy_deallocate(_QWORD *__p)
{
  void *v2;

  v2 = (void *)__p[1];
  if (v2)
  {
    __p[2] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

double std::__function::__func<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0,std::allocator<Phase::Zeppelin::HorizontalSliceDatabase::HorizontalSliceDatabase(Phase::Zeppelin::HorizontalSliceDatabaseContext const*,Phase::Zeppelin::ScsRadiationContext *,Phase::Zeppelin::PropagationMediumContext const*,Phase::Zeppelin::NormalizationContext const*)::$_0>,double ()(float,float)>::operator()(uint64_t a1, float *a2, float *a3)
{
  float *v3;
  float *v4;
  float *v5;
  double v6;
  long double v7;
  NSObject *v9;
  std::logic_error *exception;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(float **)(a1 + 8);
  v4 = *(float **)(a1 + 16);
  if (v3 == v4)
  {
    v5 = *(float **)(a1 + 8);
  }
  else
  {
    v5 = *(float **)(a1 + 8);
    while (*v5 != *a3)
    {
      if (++v5 == v4)
      {
        v5 = *(float **)(a1 + 16);
        break;
      }
    }
  }
  if (v5 == v4)
  {
    v9 = **(NSObject ***)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 928);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "ZeppelinContexts.cpp";
      v13 = 1024;
      v14 = 616;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [(it == centerFreqs.end()) is true]: ErrorDescriptions::kErrDescr_nonexistingFrequency", (uint8_t *)&v11, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, (const char *)Phase::Zeppelin::ErrorDescriptions::kErrDescr_nonexistingFrequency);
  }
  v6 = Phase::Zeppelin::SCSRadiationModel::ComputeDirectionalResponse(*(Phase::Logger **)(a1 + 32), *(Phase::Zeppelin::SCSRadiationSphereSamplingDependentPrecomputedData ***)(a1 + 40), (unint64_t)((char *)v5 - (char *)v3) >> 2, *a2);
  return hypot(v6, v7);
}

void sub_2166F0588(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

Phase::Logger *Phase::GetBandsFromCenterFrequencies<std::__wrap_iter<double const*>,double>(double **a1, double *a2, double *a3)
{
  uint64_t v6;
  int64_t v7;
  Phase::Logger *result;
  double *v9;
  double *v10;
  float *v11;
  float v12;
  _BOOL4 v13;
  BOOL v14;
  double *v15;
  float *v16;
  float v17;
  _BOOL4 v18;
  BOOL v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  double *v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  std::logic_error *exception;
  NSObject *v32;
  double v33;
  NSObject *v34;
  double v35;
  NSObject *v36;
  double v37;
  double v38;
  _BYTE v39[18];
  __int16 v40;
  double v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3 - (char *)a2;
  v7 = a3 - a2;
  *(_QWORD *)v39 = 0;
  *(_QWORD *)&v39[8] = 0;
  result = (Phase::Logger *)std::vector<Phase::FrequencyBand<double>>::vector(a1, v7, v39);
  v9 = *a1;
  **a1 = 10.0;
  if (v7 == 31)
  {
    if (a2 == a3)
    {
      v13 = 0;
      v18 = 1;
    }
    else
    {
      v15 = a2 + 1;
      v16 = (float *)&Phase::sThirdOctaveBandFrequencies;
      do
      {
        v17 = *v16++;
        v18 = *(v15 - 1) == v17;
        v19 = *(v15 - 1) != v17 || v15 == a3;
        ++v15;
      }
      while (!v19);
      v13 = 0;
    }
  }
  else
  {
    if (v7 != 10)
    {
      v13 = 0;
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
    if (a2 != a3)
    {
      v10 = a2 + 1;
      v11 = (float *)&Phase::sOctaveBandFrequencies;
      do
      {
        v12 = *v11++;
        v13 = *(v10 - 1) == v12;
        v14 = *(v10 - 1) != v12 || v10 == a3;
        ++v10;
      }
      while (!v14);
      goto LABEL_20;
    }
    v18 = 0;
    v13 = 1;
  }
LABEL_21:
  if (v6 >= 1)
  {
    v20 = 0;
    v21 = v7 - 1;
    if (v7 <= 1)
      v22 = 1;
    else
      v22 = v7;
    v23 = v9 + 2;
    v24 = a2;
    do
    {
      v25 = *v24;
      if (v13)
      {
        v26 = fmin(v25 + v25 / 1.41421356 * 0.5, 22000.0);
        v27 = 20.3630682;
      }
      else if (v18)
      {
        v26 = fmin(v25 + v25 / 4.24264069 * 0.5, 22000.0);
        v27 = 17.6429774;
      }
      else
      {
        if ((*(_QWORD *)&v25 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        {
          v29 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 1136);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = *v24;
            *(_DWORD *)v39 = 136315650;
            *(_QWORD *)&v39[4] = "FrequencyResponse.hpp";
            *(_WORD *)&v39[12] = 1024;
            *(_DWORD *)&v39[14] = 99;
            v40 = 2048;
            v41 = v30;
            _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [!std::isfinite(inFrequenciesFirst[i]) is true]: \"GetBandsFromCenterFrequencies: bad center frequency: %fHz\"", v39, 0x1Cu);
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "GetBandsFromCenterFrequencies: bad center frequency: %fHz");
LABEL_56:
          exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
        }
        if (v25 < 10.0)
        {
          v34 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 1136);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = *v24;
            *(_DWORD *)v39 = 136315906;
            *(_QWORD *)&v39[4] = "FrequencyResponse.hpp";
            *(_WORD *)&v39[12] = 1024;
            *(_DWORD *)&v39[14] = 103;
            v40 = 2048;
            v41 = v35;
            v42 = 2048;
            v43 = 0x4024000000000000;
            _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [inFrequenciesFirst[i] < lowestSupportedFreqInHz is true]: \"GetBandsFromCenterFrequencies: center frequency: %fHz cannot be below lowest supported frequency: %fHz\"", v39, 0x26u);
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "GetBandsFromCenterFrequencies: center frequency: %fHz cannot be below lowest supported frequency: %fHz");
          goto LABEL_56;
        }
        if (v25 > 22000.0)
        {
          v32 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 1136);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = *v24;
            *(_DWORD *)v39 = 136315906;
            *(_QWORD *)&v39[4] = "FrequencyResponse.hpp";
            *(_WORD *)&v39[12] = 1024;
            *(_DWORD *)&v39[14] = 107;
            v40 = 2048;
            v41 = v33;
            v42 = 2048;
            v43 = 0x40D57C0000000000;
            _os_log_impl(&dword_2164CC000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [inFrequenciesFirst[i] > highestSupportedFreqInHz is true]: \"GetBandsFromCenterFrequencies: center frequency: %fHz cannot be above highest supported frequency: %fHz\"", v39, 0x26u);
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "GetBandsFromCenterFrequencies: center frequency: %fHz cannot be above highest supported frequency: %fHz");
          goto LABEL_56;
        }
        if (v20)
        {
          v28 = (v20 - 1);
          if (a2[v28] >= v25)
          {
            v36 = **(NSObject ***)(Phase::Logger::GetInstancePtr(result) + 1136);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = a2[v28];
              v38 = *v24;
              *(_DWORD *)v39 = 136315906;
              *(_QWORD *)&v39[4] = "FrequencyResponse.hpp";
              *(_WORD *)&v39[12] = 1024;
              *(_DWORD *)&v39[14] = 111;
              v40 = 2048;
              v41 = v37;
              v42 = 2048;
              v43 = *(_QWORD *)&v38;
              _os_log_impl(&dword_2164CC000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument) [i > 0 && inFrequenciesFirst[i - 1] >= inFrequenciesFirst[i] is true]: \"GetBandsFromCenterFrequencies: center frequencies are not in ascending order. %fHz is before %fHz\"", v39, 0x26u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "GetBandsFromCenterFrequencies: center frequencies are not in ascending order. %fHz is before %fHz");
            goto LABEL_56;
          }
        }
        v27 = 10.0;
        if (v21 <= v20)
          v26 = 22000.0;
        else
          v26 = v25 * sqrt(v24[1] / v25);
      }
      *(v23 - 1) = v26;
      *v9 = v27;
      if (v21 > v20)
        *v23 = v26;
      ++v20;
      ++v24;
      v23 += 2;
    }
    while (v22 != v20);
  }
  return result;
}

void sub_2166F0A80(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  __cxa_free_exception(v2);
  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

uint64_t ATThreadSafeHeadTrackerGetSharedInstance()
{
  return MEMORY[0x24BDB66A0]();
}

uint64_t ATThreadSafeHeadTrackerPredictLatestTransform()
{
  return MEMORY[0x24BDB66A8]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x24BDB67A8](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x24BDB67B8](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x24BDB67C8](inComponent, outInstance);
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x24BDB6830](inAudioFile);
}

OSStatus AudioFileOpenWithCallbacks(void *inClientData, AudioFile_ReadProc inReadFunc, AudioFile_WriteProc inWriteFunc, AudioFile_GetSizeProc inGetSizeFunc, AudioFile_SetSizeProc inSetSizeFunc, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x24BDB6888](inClientData, inReadFunc, inWriteFunc, inGetSizeFunc, inSetSizeFunc, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB68A8](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x24BDB68B0](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6A10](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6A38](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x24BDB6A48](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

uint64_t CACentralStateDumpUnregisterSubsystem()
{
  return MEMORY[0x24BDB6A60]();
}

uint64_t CAGetDeviceOrientation()
{
  return MEMORY[0x24BDB6A70]();
}

uint64_t CARegisterDeviceOrientation()
{
  return MEMORY[0x24BDB6A78]();
}

uint64_t CAReportingClientSendSingleMessage()
{
  return MEMORY[0x24BED2F38]();
}

uint64_t CAUnregisterDeviceOrientation()
{
  return MEMORY[0x24BDB6A88]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

uint64_t CFStringCreateWithCAOrientation()
{
  return MEMORY[0x24BDB6A98]();
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x24BDBC790](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC830](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC850](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BDB6B30](inFileID, inForWriting, outExtAudioFile);
}

uint64_t ExtendedAudioBufferList_Create()
{
  return MEMORY[0x24BDB6B48]();
}

uint64_t ExtendedAudioBufferList_Destroy()
{
  return MEMORY[0x24BDB6B50]();
}

uint64_t ExtendedAudioBufferList_Prepare()
{
  return MEMORY[0x24BDB6B58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x24BED84D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t IR::IRDataLoader::getPersonalizedHRTFStatus(IR::IRDataLoader *this)
{
  return MEMORY[0x24BED2E60](this);
}

uint64_t IR::IRDataLoader::rebuildPersonalizedHRTFCache(IR::IRDataLoader *this)
{
  return MEMORY[0x24BED2E68](this);
}

uint64_t IR::IRDataLoader::checkIfPersonalizedHRTFIsAllowed(IR::IRDataLoader *this)
{
  return MEMORY[0x24BED2E70](this);
}

uint64_t IR::IRDataLoader::addPersonalizedHRTFListenerCallback()
{
  return MEMORY[0x24BED2E78]();
}

uint64_t IR::IRDataLoader::removePersonalizedHRTFListenerCallback()
{
  return MEMORY[0x24BED2E80]();
}

uint64_t IR::IRDataLoader::load()
{
  return MEMORY[0x24BED2E88]();
}

uint64_t IR::IRDataLoader::instance(IR::IRDataLoader *this)
{
  return MEMORY[0x24BED2E90](this);
}

uint64_t IR::IRCoordinates::set()
{
  return MEMORY[0x24BED2E98]();
}

uint64_t IR::IRCoordinates::IRCoordinates(IR::IRCoordinates *this)
{
  return MEMORY[0x24BED2EA0](this);
}

uint64_t IR::getPresetDataAttributes()
{
  return MEMORY[0x24BED2EA8]();
}

uint64_t IR::IRData::getCoordinateTree(IR::IRData *this)
{
  return MEMORY[0x24BED2EB0](this);
}

uint64_t caulk::concurrent::messenger::enqueue()
{
  return MEMORY[0x24BEC6DB8]();
}

uint64_t caulk::deferred_logger::create_message(caulk::deferred_logger *this, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEC6DD8](this, a2, a3);
}

uint64_t caulk::deferred_logger::create_v(caulk::deferred_logger *this, void *a2)
{
  return MEMORY[0x24BEC6DE0](this, a2);
}

uint64_t caulk::pooled_semaphore_mutex::_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DE8](this);
}

uint64_t caulk::pooled_semaphore_mutex::_unlock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DF0](this);
}

uint64_t caulk::pooled_semaphore_mutex::try_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DF8](this);
}

uint64_t caulk::pooled_semaphore_mutex::pooled_semaphore_mutex(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6E00](this);
}

uint64_t caulk::alloc::global_page_cache::instance(caulk::alloc::global_page_cache *this)
{
  return MEMORY[0x24BEC6EA0](this);
}

uint64_t caulk::alloc::details::caching_page_allocator_base::deallocate()
{
  return MEMORY[0x24BEC6EB0]();
}

uint64_t caulk::alloc::details::caching_page_allocator_base::allocate(caulk::alloc::details::caching_page_allocator_base *this)
{
  return MEMORY[0x24BEC6EB8](this);
}

uint64_t caulk::platform::process_name(caulk::platform *this)
{
  return MEMORY[0x24BEC6F00](this);
}

uint64_t AudioDSP::Core::VBAP::calculateVBAPGains()
{
  return MEMORY[0x24BED2ED0]();
}

uint64_t AudioDSP::Core::VBAP::VBAP()
{
  return MEMORY[0x24BED2ED8]();
}

void AudioDSP::Core::VBAP::~VBAP(AudioDSP::Core::VBAP *this)
{
  MEMORY[0x24BED2EE0](this);
}

uint64_t IR::IRData::getMaxDelay(IR::IRData *this)
{
  return MEMORY[0x24BED2EE8](this);
}

uint64_t IR::IRData::getFilterLength(IR::IRData *this)
{
  return MEMORY[0x24BED2F00](this);
}

uint64_t IR::IRData::getNumDimensions(IR::IRData *this)
{
  return MEMORY[0x24BED2F08](this);
}

uint64_t IR::IRData::getIRDataAttributes(IR::IRData *this)
{
  return MEMORY[0x24BED2F10](this);
}

uint64_t IR::IRData::getNumFiltersPerSpatialPoint(IR::IRData *this)
{
  return MEMORY[0x24BED2F20](this);
}

uint64_t IR::IRData::getInterpolatedTimeDomainCoeffs()
{
  return MEMORY[0x24BED2F30]();
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x24BEDA988](retstr, this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAA90](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAA98](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  MEMORY[0x24BEDAAC8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x24BEDABD8](__ns);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x24BEDABE0](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE98]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB018]();
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x24BEDB028](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB088](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB090](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x24BEDB0A0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB0A8](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B8]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB148](this);
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB150](this);
}

BOOL std::__shared_mutex_base::try_lock_shared(std::__shared_mutex_base *this)
{
  return MEMORY[0x24BEDB158](this);
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB160](this);
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
  MEMORY[0x24BEDB168](this);
}

BOOL std::__shared_mutex_base::try_lock(std::__shared_mutex_base *this)
{
  return MEMORY[0x24BEDB170](this);
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x24BEDB178](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
  MEMORY[0x24BEDB4F0](this);
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
  MEMORY[0x24BEDB4F8](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB618](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x24BEDB648](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  MEMORY[0x24BEDB658](this);
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
  MEMORY[0x24BEDB670](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24D576240();
}

void operator delete(void *__p)
{
  off_24D576248(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_24D576250(__p, a2);
}

uint64_t operator delete()
{
  return off_24D576258();
}

uint64_t operator new[]()
{
  return off_24D576260();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D576268(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24D576270(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_24D576278(__sz, a2);
}

uint64_t operator new()
{
  return off_24D576280();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x24BEDB938](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x24BDACB98]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x24BDACBA0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACCD8]((__n128)x);
  return result;
}

simd_float4 _simd_exp10_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACD28]((__n128)x);
  return result;
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACD48]((__n128)x);
  return result;
}

simd_float4 _simd_log10_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACD98]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 result;

  MEMORY[0x24BDACE10]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACE38]((__n128)x);
  return result;
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACE88]((__n128)x);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
  MEMORY[0x24BDADD28](block, queue, notification_block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x24BDAEA38](*(_QWORD *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

long double logb(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAE8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
  MEMORY[0x24BDAEEC0](__b, __pattern8, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x24BDAEFB8](a2, a1);
  return result;
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFE0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

float nextafterf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF118](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

long double scalbn(long double __x, int __y)
{
  long double result;

  MEMORY[0x24BDAFC38](*(_QWORD *)&__y, __x);
  return result;
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFEE0](__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
  MEMORY[0x24BDB3110](__Setup);
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
  MEMORY[0x24BDB3118](__Setup, __Ir, __Ii, __Or, __Oi);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x24BDB3128](__Previous, __Length, *(_QWORD *)&__Direction);
}

void vDSP_biquad(const vDSP_biquad_SetupStruct *__Setup, float *__Delay, const float *__X, vDSP_Stride __IX, float *__Y, vDSP_Stride __IY, vDSP_Length __N)
{
  MEMORY[0x24BDB3130](__Setup, __Delay, __X, __IX, __Y, __IY, __N);
}

void vDSP_biquadD(const vDSP_biquad_SetupStructD *__Setup, double *__Delay, const double *__X, vDSP_Stride __IX, double *__Y, vDSP_Stride __IY, vDSP_Length __N)
{
  MEMORY[0x24BDB3138](__Setup, __Delay, __X, __IX, __Y, __IY, __N);
}

vDSP_biquad_Setup vDSP_biquad_CreateSetup(const double *__Coefficients, vDSP_Length __M)
{
  return (vDSP_biquad_Setup)MEMORY[0x24BDB3140](__Coefficients, __M);
}

vDSP_biquad_SetupD vDSP_biquad_CreateSetupD(const double *__Coefficients, vDSP_Length __M)
{
  return (vDSP_biquad_SetupD)MEMORY[0x24BDB3148](__Coefficients, __M);
}

void vDSP_biquad_DestroySetup(vDSP_biquad_Setup __setup)
{
  MEMORY[0x24BDB3150](__setup);
}

void vDSP_biquad_DestroySetupD(vDSP_biquad_SetupD __setup)
{
  MEMORY[0x24BDB3158](__setup);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x24BDB31A8](__C, __IC, __Z, __IZ, __N);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxmgvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3218](__A, __IA, __C, __I, __N);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3220](__A, __IA, __C, __N);
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3230](__A, __IA, __C, __I, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3258](__A, __IA, __C, __N);
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32C0](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32F0](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB32F8](__A, __IA, __C, __IC, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3308](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3330](__C, __IC, __N);
}

void vDSP_vclrD(double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3338](__C, __IC, __N);
}

void vDSP_vdpsp(const double *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3360](__A, __IA, __C, __IC, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3368](__A, __C, __IC, __N);
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3398](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33A8](__A, __IA, __C, __IC, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vrampmul(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3468](__I, __IS, __Start, __Step, __O, __OS, __N);
}

void vDSP_vrampmul2(const float *__I0, const float *__I1, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O0, float *__O1, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3470](__I0, __I1, __IS, __Start, __Step, __O0, __O1, __OS);
}

void vDSP_vrampmuladd(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3478](__I, __IS, __Start, __Step, __O, __OS, __N);
}

void vDSP_vrampmuladd2(const float *__I0, const float *__I1, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O0, float *__O1, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3480](__I0, __I1, __IS, __Start, __Step, __O0, __O1, __OS);
}

void vDSP_vrvrs(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3490](__C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34D8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3598](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB35B8](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x24BDB35D0](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void vvcosf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B18](a1, a2, a3);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B30](a1, a2, a3);
}

void vvlogf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B58](a1, a2, a3);
}

void vvsinf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B80](a1, a2, a3);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x24BDB0518](__s, *(_QWORD *)&__c, __n);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

