@implementation ZN8Espresso16pass

int *___ZN8Espresso16pass_wavernn_ane14split_to_sliceERNS_3netE_block_invoke(uint64_t a1, int64x2_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  int v13;
  uint64_t v14;
  const char *v15;
  int *result;
  uint64_t v17;
  __int128 *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  size_t v41;
  std::string *v42;
  const void *v43;
  std::string *v44;
  std::string::size_type v45;
  std::string *v46;
  __int128 v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  __int128 v54;
  char *v55;
  std::string *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *p_shared_owners;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  int v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  std::string *v76;
  std::string *v77;
  std::string *v78;
  unint64_t v79;
  std::string v80;
  std::string v81;
  std::string __str;
  std::string v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  uint64_t v86;
  std::string::size_type size;
  unint64_t v88;
  int v89;
  uint64_t v90;
  int v91;
  std::string v92;
  std::string **v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  std::string v98;
  __int128 v99;

  *(_QWORD *)&v99 = *MEMORY[0x1E0C80C00];
  v97 = 0u;
  v96 = 0u;
  v95 = 0u;
  LODWORD(v93) = a2[3].i32[2];
  v94 = 0uLL;
  v4 = a2[2].u64[1];
  if (v4 >= a2[3].i64[0])
  {
    v5 = std::vector<Espresso::net::new_layer_info>::__push_back_slow_path<Espresso::net::new_layer_info const&>(a2 + 2, (uint64_t)&v93);
  }
  else
  {
    std::allocator<Espresso::net::new_layer_info>::construct[abi:ne180100]<Espresso::net::new_layer_info,Espresso::net::new_layer_info const&>(v4, (uint64_t)&v93);
    v5 = v4 + 72;
    a2[2].i64[1] = v4 + 72;
  }
  a2[2].i64[1] = v5;
  v92.__r_.__value_.__r.__words[0] = (std::string::size_type)&v96 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
  v92.__r_.__value_.__r.__words[0] = (std::string::size_type)&v95;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v94 + 1);
  if (*((_QWORD *)&v94 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = a2[3].i32[2];
  v88 = v10;
  v92.__r_.__value_.__r.__words[0] = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v9 + 56, v10, &v88)[3];
  v11 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v9 + 136, (unsigned __int8 *)v92.__r_.__value_.__l.__data_, (__int128 **)&v92);
  Espresso::abstract_blob_container::shape((char *)&v93, *((_QWORD *)v11 + 5));
  v12 = (int)v93;
  v13 = *(_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2->i64[0] + 320))(a2->i64[0]);
  if ((_QWORD)v96)
  {
    *((_QWORD *)&v96 + 1) = v96;
    operator delete((void *)v96);
  }
  v14 = a2[1].i64[0];
  v15 = (const char *)(v14 + 16);
  v72 = v12 / v13;
  if (*(char *)(v14 + 39) < 0)
    v15 = *(const char **)v15;
  printf("%s: slice %d\n", v15, v72);
  result = (int *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2->i64[0] + 320))(a2->i64[0]);
  if (*result >= 1)
  {
    v17 = 0;
    v73 = (_QWORD *)(a1 + 40);
    v18 = &v95;
    v19 = "slice";
    v74 = a1;
    while (1)
    {
      v20 = *(_QWORD *)(a1 + 32) + 96;
      v21 = a2[3].i32[2];
      v93 = (std::string **)v21;
      v22 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v20, v21, &v93);
      if (std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v73, (unsigned __int8 *)(v22[3] + 24 * v17)))
      {
        break;
      }
      ++v17;
LABEL_98:
      result = (int *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2->i64[0] + 320))(a2->i64[0]);
      if (v17 >= *result)
        return result;
    }
    v23 = (uint64_t)v18;
    v90 = 1;
    LODWORD(v88) = 0;
    HIDWORD(v88) = v72 * v17;
    v91 = 1;
    v89 = v72 * (v17 + 1);
    Espresso::abstract_engine_factory::shared(&v83);
    v24 = v83.__r_.__value_.__r.__words[0];
    v25 = *(_QWORD *)(a1 + 32);
    std::string::basic_string[abi:ne180100]<0>(&v93, v19);
    LODWORD(__str.__r_.__value_.__l.__data_) = 0;
    LODWORD(v81.__r_.__value_.__l.__data_) = 0;
    Espresso::abstract_engine_factory::make_kernel_priv(v24, v25 + 16, (uint64_t)&v93, (uint64_t)&v88, (int *)&__str);
    if (v92.__r_.__value_.__r.__words[0]
    {
      v86 = (uint64_t)v26;
      size = v92.__r_.__value_.__l.__size_;
      if (!v92.__r_.__value_.__l.__size_)
      {
LABEL_28:
        if (SHIBYTE(v94) < 0)
          operator delete(v93);
        v32 = (std::__shared_weak_count *)v83.__r_.__value_.__l.__size_;
        if (v83.__r_.__value_.__l.__size_)
        {
          v33 = (unint64_t *)(v83.__r_.__value_.__l.__size_ + 8);
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        v36 = v86;
        v35 = size;
        v84 = v86;
        v85 = (std::__shared_weak_count *)size;
        if (size)
        {
          v37 = (unint64_t *)(size + 8);
          do
            v38 = __ldxr(v37);
          while (__stxr(v38 + 1, v37));
        }
        v39 = v19;
        std::string::basic_string[abi:ne180100]<0>(&v83, v19);
        v40 = a2[1].i64[0];
        if (*(char *)(v40 + 39) >= 0)
          v41 = *(unsigned __int8 *)(v40 + 39);
        else
          v41 = *(_QWORD *)(v40 + 24);
        std::string::basic_string[abi:ne180100]((uint64_t)&v81, v41 + 8);
        if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v42 = &v81;
        else
          v42 = (std::string *)v81.__r_.__value_.__r.__words[0];
        if (v41)
        {
          if (*(char *)(v40 + 39) >= 0)
            v43 = (const void *)(v40 + 16);
          else
            v43 = *(const void **)(v40 + 16);
          memmove(v42, v43, v41);
        }
        strcpy((char *)v42 + v41, "__slice_");
        std::to_string(&v80, v17);
        if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v44 = &v80;
        else
          v44 = (std::string *)v80.__r_.__value_.__r.__words[0];
        if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v45 = HIBYTE(v80.__r_.__value_.__r.__words[2]);
        else
          v45 = v80.__r_.__value_.__l.__size_;
        v46 = std::string::append(&v81, (const std::string::value_type *)v44, v45);
        v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
        __str.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v47;
        v46->__r_.__value_.__l.__size_ = 0;
        v46->__r_.__value_.__r.__words[2] = 0;
        v46->__r_.__value_.__r.__words[0] = 0;
        v48 = *(_QWORD *)(v74 + 32) + 56;
        v49 = a2[3].i32[2];
        v79 = v49;
        v50 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v48, v49, &v79);
        v51 = *(_QWORD *)(v74 + 32) + 96;
        v52 = a2[3].i32[2];
        v75 = v52;
        v53 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v51, v52, &v75)[3]+ 24 * v17;
        if (*(char *)(v53 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v98, *(const std::string::value_type **)v53, *(_QWORD *)(v53 + 8));
        }
        else
        {
          v54 = *(_OWORD *)v53;
          v98.__r_.__value_.__r.__words[2] = *(_QWORD *)(v53 + 16);
          *(_OWORD *)&v98.__r_.__value_.__l.__data_ = v54;
        }
        v76 = 0;
        v77 = 0;
        v78 = 0;
        v93 = &v76;
        LOBYTE(v94) = 0;
        v76 = (std::string *)operator new(0x18uLL);
        v77 = v76;
        v78 = v76 + 1;
        v77 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v78, (__int128 *)&v98, &v99, v76);
        LODWORD(v93) = 0;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v55 = (char *)operator new(0xF8uLL);
        *((_QWORD *)v55 + 1) = 0;
        *((_QWORD *)v55 + 2) = 0;
        *(_QWORD *)v55 = &off_1E2DBF0D0;
        *((_QWORD *)v55 + 3) = &off_1E2DA1A38;
        *(_OWORD *)(v55 + 56) = 0u;
        *(_OWORD *)(v55 + 72) = 0u;
        *(_OWORD *)(v55 + 104) = 0u;
        *(_OWORD *)(v55 + 120) = 0u;
        *(_OWORD *)(v55 + 136) = 0u;
        *(_OWORD *)(v55 + 152) = 0u;
        *(_OWORD *)(v55 + 40) = 0u;
        v56 = (std::string *)(v55 + 40);
        *(_OWORD *)(v55 + 88) = 0u;
        *(_OWORD *)(v55 + 161) = 0u;
        *((_OWORD *)v55 + 13) = 0u;
        *((_OWORD *)v55 + 14) = 0u;
        *((_QWORD *)v55 + 30) = 0;
        *(_QWORD *)&v94 = v55 + 24;
        *((_QWORD *)&v94 + 1) = v55;
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)v55 + 11, v36, v35);
        std::string::operator=(v56, &__str);
        v18 = (__int128 *)v23;
        std::string::operator=((std::string *)(v94 + 40), &v83);
        v57 = (***(uint64_t (****)(_QWORD))(*(_QWORD *)(v36 + 8) + 8))(*(_QWORD *)(*(_QWORD *)(v36 + 8) + 8));
        v58 = v94;
        *(_DWORD *)(v94 + 8) = v57;
        v59 = a2[1].i64[0];
        if (v59)
        {
          *(_DWORD *)(v58 + 12) = *(_DWORD *)(v59 + 12);
          if (*(char *)(v59 + 223) < 0)
            std::string::__init_copy_ctor_external(&v92, *(const std::string::value_type **)(v59 + 200), *(_QWORD *)(v59 + 208));
          else
            v92 = *(std::string *)(v59 + 200);
          std::string::operator=((std::string *)(v58 + 200), &v92);
          if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v92.__r_.__value_.__l.__data_);
        }
        else
        {
          v60 = *(_QWORD *)(a2[4].i64[0] + 32);
          if (*(_QWORD *)(a2[4].i64[0] + 40) != v60)
            *(_DWORD *)(v58 + 12) = *(_DWORD *)(*(_QWORD *)v60 + 12);
        }
        if ((_QWORD *)v23 != v50 + 3)
          std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v23, (std::string *)v50[3], (std::string *)v50[4], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v50[4] - v50[3]) >> 3));
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)&v96 + 8, v76, v77, 0xAAAAAAAAAAAAAAABLL * (((char *)v77 - (char *)v76) >> 3));
        LODWORD(v93) = a2[3].i32[2];
        v61 = a2[2].u64[1];
        if (v61 >= a2[3].i64[0])
        {
          v62 = std::vector<Espresso::net::new_layer_info>::__push_back_slow_path<Espresso::net::new_layer_info const&>(a2 + 2, (uint64_t)&v93);
        }
        else
        {
          std::allocator<Espresso::net::new_layer_info>::construct[abi:ne180100]<Espresso::net::new_layer_info,Espresso::net::new_layer_info const&>(a2[2].i64[1], (uint64_t)&v93);
          v62 = v61 + 72;
          a2[2].i64[1] = v61 + 72;
        }
        a1 = v74;
        v19 = v39;
        a2[2].i64[1] = v62;
        v92.__r_.__value_.__r.__words[0] = (std::string::size_type)&v96 + 8;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
        v92.__r_.__value_.__r.__words[0] = v23;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
        v63 = (std::__shared_weak_count *)*((_QWORD *)&v94 + 1);
        if (*((_QWORD *)&v94 + 1))
        {
          v64 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
          do
            v65 = __ldaxr(v64);
          while (__stlxr(v65 - 1, v64));
          if (!v65)
          {
            ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
            std::__shared_weak_count::__release_weak(v63);
          }
        }
        v93 = &v76;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v93);
        if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v98.__r_.__value_.__l.__data_);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
        if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v80.__r_.__value_.__l.__data_);
        if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v81.__r_.__value_.__l.__data_);
        if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v83.__r_.__value_.__l.__data_);
        v66 = v85;
        if (v85)
        {
          p_shared_owners = (unint64_t *)&v85->__shared_owners_;
          do
            v68 = __ldaxr(p_shared_owners);
          while (__stlxr(v68 - 1, p_shared_owners));
          if (!v68)
          {
            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
            std::__shared_weak_count::__release_weak(v66);
          }
        }
        v69 = (std::__shared_weak_count *)size;
        if (size)
        {
          v70 = (unint64_t *)(size + 8);
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
          }
        }
        ++v17;
        goto LABEL_98;
      }
      v27 = (unint64_t *)(v92.__r_.__value_.__l.__size_ + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    else
    {
      v86 = 0;
      size = 0;
    }
    v29 = (std::__shared_weak_count *)v92.__r_.__value_.__l.__size_;
    if (v92.__r_.__value_.__l.__size_)
    {
      v30 = (unint64_t *)(v92.__r_.__value_.__l.__size_ + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    goto LABEL_28;
  }
  return result;
}

@end
