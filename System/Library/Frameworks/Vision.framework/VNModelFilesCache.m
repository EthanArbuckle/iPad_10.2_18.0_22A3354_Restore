@implementation VNModelFilesCache

- (VNModelFilesCache)init
{
  unsigned __int8 v3;
  uint64_t v5;

  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 40) = 850045863;
    *(_DWORD *)(v5 + 32) = 1065353216;
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)(v5 + 64) = 0u;
    *(_OWORD *)(v5 + 80) = 0u;
    *(_QWORD *)(v5 + 96) = 0;
    cvml::util::model_file_cache::instance(void)::m_cache_ = v5;
  }
  std::unique_ptr<cvml::util::model_file_cache>::reset[abi:ne180100]((uint64_t *)&self->m_impl, cvml::util::model_file_cache::instance(void)::m_cache_);
  return self;
}

- (id)load:(id)a3
{
  id v4;
  VNModelFileImpl *v5;
  model_file_cache *value;
  id v7;
  uint64_t v8;
  std::mutex *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  VNModelFileImpl *v12;
  int v14;
  void **v15;
  std::__shared_weak_count *v16;
  void **v17;
  std::__shared_weak_count *v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  int v25;
  off_t st_size;
  std::__shared_weak_count_vtbl *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint8x8_t v33;
  unint64_t v34;
  unsigned __int8 **v35;
  unint64_t v36;
  char *v37;
  _QWORD *v38;
  std::string *v39;
  float v40;
  float v41;
  _BOOL8 v42;
  unint64_t v43;
  unint64_t v44;
  int8x8_t prime;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint8x8_t v51;
  unint64_t v52;
  uint8x8_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  unsigned __int8 **v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  int v65;
  const char *v66;
  int v67;
  const char *v68;
  VNModelFileImpl *v69;
  void *__p[2];
  uint64_t v71;
  __int128 v72;
  int v73;
  std::__shared_weak_count *v74;
  std::__shared_weak_count *v75;
  stat v76;

  v4 = a3;
  v5 = [VNModelFileImpl alloc];
  value = self->m_impl.__ptr_.__value_;
  v7 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_msgSend((id)objc_opt_class(), "useFOpenForModelWithPath:", v7);
  v9 = (std::mutex *)((char *)value + 40);
  std::mutex::lock((std::mutex *)((char *)value + 40));
  v10 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(value, (unsigned __int8 *)__p);
  if (v10)
    goto LABEL_2;
  v74 = 0;
  v75 = 0;
  v14 = SHIBYTE(v71);
  v15 = (void **)__p[0];
  if ((_DWORD)v8)
  {
    v16 = (std::__shared_weak_count *)operator new(0x30uLL);
    if (v14 >= 0)
      v17 = __p;
    else
      v17 = v15;
    *(_OWORD *)&v16->__shared_owners_ = 0u;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B3E0;
    v16[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E4539FD8;
    v18 = v16 + 1;
    *(_OWORD *)&v16[1].__shared_owners_ = 0u;
    v19 = fopen((const char *)v17, "rb");
    v8 = (uint64_t)v19;
    if (!v19)
    {
      v65 = 273;
      v66 = "fopen failed";
      goto LABEL_128;
    }
    v20 = MEMORY[0x1A1B0AEBC](v19);
    if (v20 == -1)
    {
      v65 = 279;
    }
    else
    {
      v21 = v20;
      if (fseek((FILE *)v8, 0, 2))
      {
        v65 = 285;
LABEL_127:
        v66 = "fseek failed";
LABEL_128:
        syslog(3, "Error %s when executing %s in file %s:%d\n", v66, "void cvml::util::mapped_model_file_fopen::open_file(const char *)", "/Library/Caches/com.apple.xbs/Sources/Vision/VisionKitFramework/VN/algorithm_util/mapped_model_file.h", v65);
        __assert_rtn("syslog_assert_failed", "common_defines.h", 24, "false");
      }
      v22 = MEMORY[0x1A1B0AEBC](v8);
      if (v22 != -1)
      {
        v23 = v22;
        if (!fseek((FILE *)v8, v21, 0))
        {
          v16[1].__shared_owners_ = v23;
          v16[1].__shared_weak_owners_ = v8;
          goto LABEL_22;
        }
        v65 = 297;
        goto LABEL_127;
      }
      v65 = 291;
    }
    v66 = "ftell failed";
    goto LABEL_128;
  }
  v16 = (std::__shared_weak_count *)operator new(0x38uLL);
  if (v14 >= 0)
    v24 = __p;
  else
    v24 = v15;
  v16->__shared_owners_ = 0;
  v16->__shared_weak_owners_ = 0;
  v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B3A8;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E4539F90;
  v18 = v16 + 1;
  v16[1].__shared_owners_ = 0;
  LODWORD(v16[1].__shared_weak_owners_) = -1;
  v16[2].__vftable = 0;
  v25 = open((const char *)v24, 0);
  LODWORD(v16[1].__shared_weak_owners_) = v25;
  if (v25 == -1)
  {
    v67 = 166;
    v68 = "::open failed";
    goto LABEL_130;
  }
  memset(&v76, 0, sizeof(v76));
  if (fstat(v25, &v76))
  {
    v67 = 172;
LABEL_125:
    v68 = "fstat failed";
    goto LABEL_130;
  }
  st_size = v76.st_size;
  v16[1].__shared_owners_ = v76.st_size;
  if (!st_size)
  {
    v67 = 178;
    goto LABEL_125;
  }
  v27 = (std::__shared_weak_count_vtbl *)mmap(0, st_size, 1, 2, v16[1].__shared_weak_owners_, 0);
  v16[2].__vftable = v27;
  if (v27 == (std::__shared_weak_count_vtbl *)-1)
  {
    v67 = 184;
    v68 = "mmap MAP_FAILED";
LABEL_130:
    syslog(3, "Error %s when executing %s in file %s:%d\n", v68, "void cvml::util::mapped_model_file_open::open_file(const char *, BOOL)", "/Library/Caches/com.apple.xbs/Sources/Vision/VisionKitFramework/VN/algorithm_util/mapped_model_file.h", v67);
    __assert_rtn("syslog_assert_failed", "common_defines.h", 24, "false");
  }
LABEL_22:
  v69 = v5;
  v74 = v18;
  v75 = v16;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  *(_QWORD *)&v72 = v18;
  *((_QWORD *)&v72 + 1) = v16;
  do
    v29 = __ldxr(p_shared_owners);
  while (__stxr(v29 + 1, p_shared_owners));
  v73 = 0;
  v30 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
  v31 = v30;
  v32 = *((_QWORD *)value + 1);
  if (!v32)
    goto LABEL_41;
  v33 = (uint8x8_t)vcnt_s8((int8x8_t)v32);
  v33.i16[0] = vaddlv_u8(v33);
  v34 = v33.u32[0];
  if (v33.u32[0] > 1uLL)
  {
    v8 = v30;
    if (v30 >= v32)
      v8 = v30 % v32;
  }
  else
  {
    v8 = (v32 - 1) & v30;
  }
  v35 = *(unsigned __int8 ***)(*(_QWORD *)value + 8 * v8);
  if (!v35 || (v10 = *v35) == 0)
  {
LABEL_41:
    v37 = (char *)operator new(0x40uLL);
    v38 = (_QWORD *)((char *)value + 16);
    *(_QWORD *)&v76.st_dev = v37;
    v76.st_ino = (__darwin_ino64_t)value + 16;
    LOBYTE(v76.st_uid) = 0;
    *(_QWORD *)v37 = 0;
    *((_QWORD *)v37 + 1) = v31;
    v39 = (std::string *)(v37 + 16);
    if (SHIBYTE(v71) < 0)
    {
      std::string::__init_copy_ctor_external(v39, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_OWORD *)&v39->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      *((_QWORD *)v37 + 4) = v71;
    }
    *(_OWORD *)(v37 + 40) = v72;
    v72 = 0uLL;
    *((_DWORD *)v37 + 14) = 0;
    LOBYTE(v76.st_uid) = 1;
    v40 = (float)(unint64_t)(*((_QWORD *)value + 3) + 1);
    v41 = *((float *)value + 8);
    if (v32 && (float)(v41 * (float)v32) >= v40)
    {
LABEL_90:
      v57 = *(unsigned __int8 ***)(*(_QWORD *)value + 8 * v8);
      v10 = *(unsigned __int8 **)&v76.st_dev;
      if (v57)
      {
        **(_QWORD **)&v76.st_dev = *v57;
      }
      else
      {
        **(_QWORD **)&v76.st_dev = *((_QWORD *)value + 2);
        *((_QWORD *)value + 2) = v10;
        *(_QWORD *)(*(_QWORD *)value + 8 * v8) = v38;
        if (!*(_QWORD *)v10)
        {
LABEL_99:
          *(_QWORD *)&v76.st_dev = 0;
          ++*((_QWORD *)value + 3);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<std::shared_ptr<cvml::util::mapped_model_file>,int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<std::shared_ptr<cvml::util::mapped_model_file>,int>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v76);
          v5 = v69;
          goto LABEL_100;
        }
        v58 = *(_QWORD *)(*(_QWORD *)v10 + 8);
        if ((v32 & (v32 - 1)) != 0)
        {
          if (v58 >= v32)
            v58 %= v32;
        }
        else
        {
          v58 &= v32 - 1;
        }
        v57 = (unsigned __int8 **)(*(_QWORD *)value + 8 * v58);
      }
      *v57 = v10;
      goto LABEL_99;
    }
    v42 = 1;
    if (v32 >= 3)
      v42 = (v32 & (v32 - 1)) != 0;
    v43 = v42 | (2 * v32);
    v44 = vcvtps_u32_f32(v40 / v41);
    if (v43 <= v44)
      prime = (int8x8_t)v44;
    else
      prime = (int8x8_t)v43;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v32 = *((_QWORD *)value + 1);
    if (*(_QWORD *)&prime > v32)
      goto LABEL_56;
    if (*(_QWORD *)&prime < v32)
    {
      v52 = vcvtps_u32_f32((float)*((unint64_t *)value + 3) / *((float *)value + 8));
      if (v32 < 3 || (v53 = (uint8x8_t)vcnt_s8((int8x8_t)v32), v53.i16[0] = vaddlv_u8(v53), v53.u32[0] > 1uLL))
      {
        v52 = std::__next_prime(v52);
      }
      else
      {
        v54 = 1 << -(char)__clz(v52 - 1);
        if (v52 >= 2)
          v52 = v54;
      }
      if (*(_QWORD *)&prime <= v52)
        prime = (int8x8_t)v52;
      if (*(_QWORD *)&prime >= v32)
      {
        v32 = *((_QWORD *)value + 1);
      }
      else
      {
        if (prime)
        {
LABEL_56:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v46 = operator new(8 * *(_QWORD *)&prime);
          v47 = *(void **)value;
          *(_QWORD *)value = v46;
          if (v47)
            operator delete(v47);
          v48 = 0;
          *((int8x8_t *)value + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)value + 8 * v48++) = 0;
          while (*(_QWORD *)&prime != v48);
          v49 = (_QWORD *)*v38;
          if (*v38)
          {
            v50 = v49[1];
            v51 = (uint8x8_t)vcnt_s8(prime);
            v51.i16[0] = vaddlv_u8(v51);
            if (v51.u32[0] > 1uLL)
            {
              if (v50 >= *(_QWORD *)&prime)
                v50 %= *(_QWORD *)&prime;
            }
            else
            {
              v50 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)value + 8 * v50) = v38;
            v55 = (_QWORD *)*v49;
            if (*v49)
            {
              do
              {
                v56 = v55[1];
                if (v51.u32[0] > 1uLL)
                {
                  if (v56 >= *(_QWORD *)&prime)
                    v56 %= *(_QWORD *)&prime;
                }
                else
                {
                  v56 &= *(_QWORD *)&prime - 1;
                }
                if (v56 != v50)
                {
                  if (!*(_QWORD *)(*(_QWORD *)value + 8 * v56))
                  {
                    *(_QWORD *)(*(_QWORD *)value + 8 * v56) = v49;
                    goto LABEL_81;
                  }
                  *v49 = *v55;
                  *v55 = **(_QWORD **)(*(_QWORD *)value + 8 * v56);
                  **(_QWORD **)(*(_QWORD *)value + 8 * v56) = v55;
                  v55 = v49;
                }
                v56 = v50;
LABEL_81:
                v49 = v55;
                v55 = (_QWORD *)*v55;
                v50 = v56;
              }
              while (v55);
            }
          }
          v32 = (unint64_t)prime;
          goto LABEL_85;
        }
        v64 = *(void **)value;
        *(_QWORD *)value = 0;
        if (v64)
          operator delete(v64);
        v32 = 0;
        *((_QWORD *)value + 1) = 0;
      }
    }
LABEL_85:
    if ((v32 & (v32 - 1)) != 0)
    {
      if (v31 >= v32)
        v8 = v31 % v32;
      else
        v8 = v31;
    }
    else
    {
      v8 = (v32 - 1) & v31;
    }
    goto LABEL_90;
  }
  while (1)
  {
    v36 = *((_QWORD *)v10 + 1);
    if (v36 == v31)
      break;
    if (v34 > 1)
    {
      if (v36 >= v32)
        v36 %= v32;
    }
    else
    {
      v36 &= v32 - 1;
    }
    if (v36 != v8)
      goto LABEL_41;
LABEL_40:
    v10 = *(unsigned __int8 **)v10;
    if (!v10)
      goto LABEL_41;
  }
  if (!std::equal_to<std::string>::operator()[abi:ne180100](v10 + 16, (unsigned __int8 *)__p))
    goto LABEL_40;
  v62 = (unint64_t *)&v16->__shared_owners_;
  do
    v63 = __ldaxr(v62);
  while (__stlxr(v63 - 1, v62));
  v5 = v69;
  if (!v63)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
LABEL_100:
  v59 = v75;
  if (v75)
  {
    v60 = (unint64_t *)&v75->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
LABEL_2:
  ++*((_DWORD *)v10 + 14);
  v11 = *((_QWORD *)v10 + 5);
  std::mutex::unlock(v9);
  v12 = -[VNModelFileImpl initWithMappedModel:](v5, "initWithMappedModel:", v11);
  if (SHIBYTE(v71) < 0)
    operator delete(__p[0]);

  return v12;
}

- (void)unload:(id)a3
{
  id v4;
  model_file_cache *value;
  id v6;
  std::mutex *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  void *__p[2];
  char v11;

  v4 = a3;
  value = self->m_impl.__ptr_.__value_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = (std::mutex *)((char *)value + 40);
  std::mutex::lock((std::mutex *)((char *)value + 40));
  v8 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(value, (unsigned __int8 *)__p);
  if (v8)
  {
    v9 = v8;
    (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)v8 + 5) + 24))(*((_QWORD *)v8 + 5), 4);
    --*((_DWORD *)v9 + 14);
  }
  std::mutex::unlock(v7);
  if (v11 < 0)
    operator delete(__p[0]);

}

- (void)purgeAll
{
  model_file_cache *value;
  std::mutex *v3;
  int *i;
  uint64_t v5;

  value = self->m_impl.__ptr_.__value_;
  v3 = (std::mutex *)((char *)value + 40);
  std::mutex::lock((std::mutex *)((char *)value + 40));
  for (i = (int *)*((_QWORD *)value + 2); i; i = *(int **)i)
  {
    if (i[14] >= 1)
      v5 = 4;
    else
      v5 = 5;
    (*(void (**)(uint64_t, uint64_t))(**((_QWORD **)i + 5) + 24))(*((_QWORD *)i + 5), v5);
  }
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
  std::unique_ptr<cvml::util::model_file_cache>::reset[abi:ne180100]((uint64_t *)&self->m_impl, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

+ (id)sharedInstance
{
  if (+[VNModelFilesCache sharedInstance]::onceToken != -1)
    dispatch_once(&+[VNModelFilesCache sharedInstance]::onceToken, &__block_literal_global_21672);
  return (id)+[VNModelFilesCache sharedInstance]::cache;
}

+ (BOOL)useFOpenForModelWithPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(&unk_1E459E1E0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E459E1E0);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(&unk_1E459E1E0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __35__VNModelFilesCache_sharedInstance__block_invoke()
{
  VNModelFilesCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNModelFilesCache);
  v1 = (void *)+[VNModelFilesCache sharedInstance]::cache;
  +[VNModelFilesCache sharedInstance]::cache = (uint64_t)v0;

}

@end
