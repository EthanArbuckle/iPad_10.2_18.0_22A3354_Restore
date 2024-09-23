@implementation ETTask

- (ETTask)init
{
  ETTask *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETTask;
  v2 = -[ETTask init](&v4, sel_init);
  -[ETTask setDumpData:](v2, "setDumpData:", 0);
  return v2;
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5
{
  return -[ETTask initWithModelDef:optimizerDef:extractor:needWeightsInitialization:](self, "initWithModelDef:optimizerDef:extractor:needWeightsInitialization:", a3, a4, a5, 1);
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  ETTask *v13;
  void *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  ETTask *v27;
  unint64_t v28;
  ETTask *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v37;
  std::__shared_weak_count *v38;
  _BYTE v39[8];
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  uint64_t v42[3];
  uint64_t v43;
  char v44;
  uint64_t v45;
  std::__shared_weak_count *v46;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (ETTask *)objc_opt_new();

  -[ETTask setExtractor:](v13, "setExtractor:", v12);
  -[ETTask setModel:](v13, "setModel:", v10);
  -[ETTask setOptimizer:](v13, "setOptimizer:", v11);
  if (v6)
  {
    -[ETTask model](v13, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "network");
    }
    else
    {
      v45 = 0;
      v46 = 0;
    }
    Espresso::trainer::initialize_weights((uint64_t)&v45);
    v16 = v46;
    if (v46)
    {
      p_shared_owners = (unint64_t *)&v46->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

  }
  v44 = 1;
  -[ETTask model](v13, "model");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "network");
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  Espresso::gradient_builder::gradient_builder((uint64_t)v39, &v37, &v44);
  v21 = v38;
  if (v38)
  {
    v22 = (unint64_t *)&v38->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  v24 = v40;
  if (v40)
  {
    v25 = (unint64_t *)&v40->__shared_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
    v27 = v13;
    do
      v28 = __ldaxr(v25);
    while (__stlxr(v28 - 1, v25));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  else
  {
    v29 = v13;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v43);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v42, v42[1]);
  v30 = v41;
  if (v41)
  {
    v31 = (unint64_t *)&v41->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = v40;
  if (v40)
  {
    v34 = (unint64_t *)&v40->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  return v13;
}

- (vector<std::string,)reinitializeVariables
{
  ETTask *v3;
  vector<std::string, std::allocator<std::string>> *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  std::string *end;
  __int128 v15;
  std::string *v16;
  uint64_t v17;
  net *ptr;
  uint64_t *v19;
  uint64_t *v20;
  unsigned __int8 v21;
  void **v22;
  unint64_t v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const void **v28;
  void **v29;
  const void *v30;
  int *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  double v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unsigned int v65;
  unsigned int v66;
  BOOL v67;
  unsigned int v68;
  int v69;
  double v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  void *v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  int v90;
  int v91;
  unint64_t *v92;
  unint64_t v93;
  uint64_t v94;
  vector<std::string, std::allocator<std::string>> *result;
  void **v96;
  void **v97;
  ETTask *v98;
  void *v99;
  vector<std::string, std::allocator<std::string>> *v100;
  uint64_t v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  void *__p[2];
  unsigned __int8 v105;
  void *v106[2];
  int64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  std::__shared_weak_count *v113;
  uint64_t v114;
  std::__shared_weak_count *v115;
  int *v116;
  std::__shared_weak_count *v117;
  _BYTE v118[128];
  uint64_t v119;

  v3 = self;
  v4 = retstr;
  v119 = *MEMORY[0x1E0C80C00];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[ETTask model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
  if (v7)
  {
    v8 = 1991;
    v9 = *(_QWORD *)v109;
    v99 = v6;
    v100 = v4;
    v98 = v3;
    do
    {
      v10 = 0;
      v101 = v7;
      do
      {
        if (*(_QWORD *)v109 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v10);
        objc_msgSend(v11, "name", v98);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(v106, (char *)objc_msgSend(v12, "UTF8String"));

        objc_msgSend(v11, "layerName");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));

        Espresso::net::get_global(&v102, (uint64_t)v3->network.__ptr_, (unsigned __int8 *)v106);
        if (!objc_msgSend(v11, "initializationMode"))
          goto LABEL_108;
        end = (std::string *)v4->__end_;
        if (end >= v4->__end_cap_.__value_)
        {
          v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v4, (uint64_t)v106);
        }
        else
        {
          if (SHIBYTE(v107) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v4->__end_, (const std::string::value_type *)v106[0], (std::string::size_type)v106[1]);
          }
          else
          {
            v15 = *(_OWORD *)v106;
            end->__r_.__value_.__r.__words[2] = v107;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
          }
          v16 = end + 1;
          v4->__end_ = &end[1];
        }
        v4->__end_ = v16;
        if (objc_msgSend(v11, "initializationMode") != 7
          && (objc_msgSend(v11, "initializationMode") != 1 || objc_msgSend(v11, "kind") != 1))
        {
          if (objc_msgSend(v11, "initializationMode") == 3
            || objc_msgSend(v11, "initializationMode") == 1 && objc_msgSend(v11, "kind") == 2)
          {
            v36 = v102;
            (*(void (**)(int **__return_ptr, uint64_t))(*(_QWORD *)v102 + 56))(&v116, v102);
            v37 = 0;
            v38 = (uint64_t)v116;
            v39 = v116[2];
            while (1)
            {
              v40 = 12;
              v41 = v39;
              do
              {
                v41 *= *(int *)(v38 + v40);
                v40 += 4;
              }
              while (v40 != 24);
              if (v41 <= v37)
                break;
              *(_DWORD *)(*(_QWORD *)(v38 + 24) + 4 * v37++) = 0;
            }
            v42 = v103;
            v114 = v36;
            v115 = v103;
            if (v103)
            {
              p_shared_owners = (unint64_t *)&v103->__shared_owners_;
              do
                v44 = __ldxr(p_shared_owners);
              while (__stxr(v44 + 1, p_shared_owners));
            }
            v45 = v117;
            v112 = v38;
            v113 = v117;
            if (v117)
            {
              v46 = (unint64_t *)&v117->__shared_owners_;
              do
                v47 = __ldxr(v46);
              while (__stxr(v47 + 1, v46));
            }
            Espresso::sync_copy_from_host(v36, v42, &v112);
            if (v45)
            {
              v48 = (unint64_t *)&v45->__shared_owners_;
              do
                v49 = __ldaxr(v48);
              while (__stlxr(v49 - 1, v48));
              if (!v49)
              {
                ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
                std::__shared_weak_count::__release_weak(v45);
              }
            }
            v50 = v115;
            if (v115)
            {
              v51 = (unint64_t *)&v115->__shared_owners_;
              do
                v52 = __ldaxr(v51);
              while (__stlxr(v52 - 1, v51));
              if (!v52)
              {
                ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
                std::__shared_weak_count::__release_weak(v50);
              }
            }
            v53 = v117;
            if (v117)
            {
              v54 = (unint64_t *)&v117->__shared_owners_;
              do
                v55 = __ldaxr(v54);
              while (__stlxr(v55 - 1, v54));
              goto LABEL_103;
            }
          }
          else if (objc_msgSend(v11, "initializationMode") != 2)
          {
            Espresso::throw_exception_selector<Espresso::not_implemented_error,ETVariableInitializationMode>(objc_msgSend(v11, "initializationMode"));
          }
          goto LABEL_108;
        }
        v17 = v9;
        ptr = v3->network.__ptr_;
        v20 = (uint64_t *)*((_QWORD *)ptr + 4);
        v19 = (uint64_t *)*((_QWORD *)ptr + 5);
        v21 = v105;
        if (v20 == v19)
          goto LABEL_133;
        v22 = (void **)__p[0];
        if ((v105 & 0x80u) == 0)
          v23 = v105;
        else
          v23 = (unint64_t)__p[1];
        if ((v105 & 0x80u) == 0)
          v24 = __p;
        else
          v24 = (void **)__p[0];
        while (1)
        {
          v25 = *v20;
          v26 = *(unsigned __int8 *)(*v20 + 39);
          v27 = (v26 & 0x80u) == 0 ? (void *)*(unsigned __int8 *)(*v20 + 39) : *(void **)(*v20 + 24);
          if (v27 == (void *)v23)
          {
            v28 = (const void **)(v25 + 16);
            if ((v26 & 0x80) == 0)
            {
              if (!*(_BYTE *)(*v20 + 39))
                break;
              v29 = v24;
              while (*(unsigned __int8 *)v28 == *(unsigned __int8 *)v29)
              {
                v28 = (const void **)((char *)v28 + 1);
                v29 = (void **)((char *)v29 + 1);
                if (!--v26)
                  goto LABEL_34;
              }
              goto LABEL_32;
            }
            if (!memcmp(*v28, v24, *(_QWORD *)(*v20 + 24)))
              break;
          }
LABEL_32:
          v20 += 2;
          if (v20 == v19)
            goto LABEL_134;
        }
LABEL_34:
        v30 = *(const void **)(v25 + 64);
        if (!v30)
        {
          v35 = 0;
          v116 = 0;
          v117 = 0;
          v6 = v99;
          v4 = v100;
          v3 = v98;
          v7 = v101;
          v9 = v17;
          goto LABEL_70;
        }
        v3 = v98;
        v6 = v99;
        v9 = v17;
        if (!v31)
        {
          v116 = 0;
          v117 = 0;
          v35 = (uint64_t)v86;
          v7 = v101;
          if (v86)
          {
            v87 = *(std::__shared_weak_count **)(v25 + 72);
            v114 = (uint64_t)v86;
            v115 = v87;
            if (v87)
            {
              v88 = (unint64_t *)&v87->__shared_owners_;
              do
                v89 = __ldxr(v88);
              while (__stxr(v89 + 1, v88));
            }
            v90 = *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v86 + 384))(v86) + 48);
            v91 = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v35 + 384))(v35) + 52);
            v35 = v91 * (uint64_t)v90 * *(int *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v35 + 384))(v35) + 44);
            if (v87)
            {
              v92 = (unint64_t *)&v87->__shared_owners_;
              v4 = v100;
              v6 = v99;
              do
                v93 = __ldaxr(v92);
              while (__stlxr(v93 - 1, v92));
              if (!v93)
              {
                ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
                std::__shared_weak_count::__release_weak(v87);
              }
            }
            else
            {
              v4 = v100;
              v6 = v99;
            }
          }
          else
          {
            v4 = v100;
          }
LABEL_70:
          v32 = v117;
          if (!v117)
            goto LABEL_75;
LABEL_71:
          v56 = (unint64_t *)&v32->__shared_owners_;
          do
            v57 = __ldaxr(v56);
          while (__stlxr(v57 - 1, v56));
          if (!v57)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
          goto LABEL_75;
        }
        v32 = *(std::__shared_weak_count **)(v25 + 72);
        v116 = v31;
        v117 = v32;
        v7 = v101;
        if (v32)
        {
          v33 = (unint64_t *)&v32->__shared_owners_;
          do
            v34 = __ldxr(v33);
          while (__stxr(v34 + 1, v33));
        }
        v4 = v100;
        v35 = *(unsigned int *)((*(uint64_t (**)(int *))(*(_QWORD *)v31 + 384))(v31) + 4);
        if (v32)
          goto LABEL_71;
LABEL_75:
        if (!v35)
        {
          v21 = v105;
LABEL_133:
          v22 = (void **)__p[0];
LABEL_134:
          if ((v21 & 0x80u) == 0)
            v96 = __p;
          else
            v96 = v22;
          if (v107 >= 0)
            v97 = v106;
          else
            v97 = (void **)v106[0];
          Espresso::throw_exception_selector<Espresso::generic_error,char const*,char const*>("Layer %s for variable %s cannot be found", (uint64_t)v96, (uint64_t)v97);
        }
        v58 = v102;
        (*(void (**)(int **__return_ptr, uint64_t))(*(_QWORD *)v102 + 56))(&v116, v102);
        v59 = 0;
        v60 = (uint64_t)v116;
        v61 = sqrtf(3.0 / (float)(unint64_t)v35);
        v62 = v116[2];
        while (1)
        {
          v63 = 12;
          v64 = v62;
          do
          {
            v64 *= *(int *)(v60 + v63);
            v63 += 4;
          }
          while (v63 != 24);
          if (v64 <= v59)
            break;
          v65 = 48271 * (v8 % 0xADC8);
          v66 = 3399 * (v8 / 0xADC8);
          v67 = v65 >= v66;
          v68 = v65 - v66;
          if (v67)
            v69 = 0;
          else
            v69 = 0x7FFFFFFF;
          v8 = v69 + v68;
          v70 = ((float)((float)((float)(v69 + v68 - 1) * 4.6566e-10) + 0.0) + -0.5) * v61;
          *(float *)&v70 = v70 + v70;
          *(_DWORD *)(*(_QWORD *)(v60 + 24) + 4 * v59++) = LODWORD(v70);
        }
        v71 = v103;
        v114 = v58;
        v115 = v103;
        if (v103)
        {
          v72 = (unint64_t *)&v103->__shared_owners_;
          do
            v73 = __ldxr(v72);
          while (__stxr(v73 + 1, v72));
        }
        v74 = v117;
        v112 = v60;
        v113 = v117;
        if (v117)
        {
          v75 = (unint64_t *)&v117->__shared_owners_;
          do
            v76 = __ldxr(v75);
          while (__stxr(v76 + 1, v75));
        }
        Espresso::sync_copy_from_host(v58, v71, &v112);
        if (v74)
        {
          v77 = (unint64_t *)&v74->__shared_owners_;
          do
            v78 = __ldaxr(v77);
          while (__stlxr(v78 - 1, v77));
          if (!v78)
          {
            ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
            std::__shared_weak_count::__release_weak(v74);
          }
        }
        v79 = v115;
        if (v115)
        {
          v80 = (unint64_t *)&v115->__shared_owners_;
          do
            v81 = __ldaxr(v80);
          while (__stlxr(v81 - 1, v80));
          if (!v81)
          {
            ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
            std::__shared_weak_count::__release_weak(v79);
          }
        }
        v53 = v117;
        if (v117)
        {
          v82 = (unint64_t *)&v117->__shared_owners_;
          do
            v55 = __ldaxr(v82);
          while (__stlxr(v55 - 1, v82));
LABEL_103:
          if (!v55)
          {
            ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
            std::__shared_weak_count::__release_weak(v53);
          }
        }
LABEL_108:
        v83 = v103;
        if (v103)
        {
          v84 = (unint64_t *)&v103->__shared_owners_;
          do
            v85 = __ldaxr(v84);
          while (__stlxr(v85 - 1, v84));
          if (!v85)
          {
            ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
            std::__shared_weak_count::__release_weak(v83);
          }
        }
        if ((char)v105 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v107) < 0)
          operator delete(v106[0]);
        ++v10;
      }
      while (v10 != v7);
      v94 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      v7 = v94;
    }
    while (v94);
  }

  return result;
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5
{
  return -[ETTask initWithModelDef:optimizerDef:lossConfig:extractor:](self, "initWithModelDef:optimizerDef:lossConfig:extractor:", a3, a4, a5, 0);
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5 extractor:(id)a6
{
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _QWORD *v15;
  std::locale::id *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  int v22;
  char *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  const std::locale::facet *v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  BOOL v35;
  __shared_weak_count *cntrl;
  unint64_t *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  net *ptr;
  __shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  __shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t *p_shared_owners;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  void *v58;
  char *v59;
  void *v60;
  BOOL v61;
  void *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t i;
  int v69;
  int v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  int v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  std::string *v81;
  char *v82;
  int v83;
  uint64_t v84;
  char *v85;
  BOOL v86;
  std::string *p_s;
  void *v88;
  id v89;
  uint64_t v90;
  void *v91;
  BOOL v92;
  id v93;
  void *v94;
  _BOOL4 v95;
  char *v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  uint64_t j;
  uint64_t k;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  uint64_t *v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  id v109;
  void *v110;
  net *v111;
  __shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  float v115;
  float v116;
  float v117;
  float v118;
  unint64_t *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  std::__shared_weak_count *size;
  unint64_t *v125;
  unint64_t v126;
  uint64_t v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  __shared_weak_count *v131;
  unint64_t *v132;
  unint64_t v133;
  std::__shared_weak_count *v134;
  unint64_t *v135;
  unint64_t v136;
  ETTask *v137;
  std::__shared_weak_count *v138;
  unint64_t *v139;
  unint64_t v140;
  std::__shared_weak_count *v141;
  unint64_t *v142;
  unint64_t v143;
  std::__shared_weak_count *v144;
  unint64_t *v145;
  unint64_t v146;
  std::__shared_weak_count *v147;
  unint64_t *v148;
  unint64_t v149;
  std::__shared_weak_count *v150;
  unint64_t *v151;
  unint64_t v152;
  std::__shared_weak_count *v153;
  unint64_t *v154;
  unint64_t v155;
  id v157;
  id v158;
  id v159;
  uint64_t *p_network;
  id v161;
  net *v163;
  __shared_weak_count *v164;
  uint64_t v165[4];
  std::string::size_type v166[3];
  uint64_t v167;
  std::__shared_weak_count *v168;
  std::string *v169;
  std::string *v170;
  std::string *v171;
  std::string *v172;
  std::string *v173;
  std::string *v174;
  std::string v175;
  void *v176[2];
  char v177;
  uint64_t v178;
  std::__shared_weak_count *v179;
  __int128 v180;
  uint64_t v181;
  int v182;
  std::string v183;
  std::string v184;
  uint64_t v185;
  int v186;
  int v187;
  unint64_t v188;
  __int128 v189;
  __int128 v190;
  uint64_t v191;
  void *v192;
  char v193;
  std::string v194;
  _OWORD v195[2];
  uint64_t v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  char v201;
  std::string v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  std::string __s;
  uint64_t v208[2];
  uint64_t v209[2];
  net *v210;
  __shared_weak_count *v211;
  uint64_t v212;
  std::__shared_weak_count *v213;
  _QWORD *v214[7];
  char v215;
  uint64_t v216;
  std::__shared_weak_count *v217;
  std::__shared_weak_count *v218;
  std::__shared_weak_count *v219;
  _QWORD v220[10];
  uint64_t v221[2];
  char v222[8];
  char *v223;
  char *v224[3];
  char **v225;
  char *v226[2];
  uint64_t v227;
  uint64_t v228;
  __int128 v229;
  __int128 v230;
  _BYTE v231[24];
  void *v232;
  __int128 v233[13];
  uint64_t *v234;
  _QWORD *v235;
  void *v236;
  char v237;
  __int128 v238;
  uint64_t v239;
  std::string v240;
  __int128 v241;
  _BYTE v242[128];
  uint64_t v243;

  v243 = *MEMORY[0x1E0C80C00];
  v159 = a3;
  v157 = a4;
  v161 = a5;
  v158 = a6;
  LODWORD(v230) = 80000;
  Espresso::create_context((int *)&v230, &v227);
  (*(void (**)(uint64_t))(*(_QWORD *)v227 + 96))(v227);
  -[ETTask setOptimizer:](self, "setOptimizer:", v157);
  -[ETTask setModel:](self, "setModel:", v159);
  if (v158)
    -[ETTask setExtractor:](self, "setExtractor:", v158);
  objc_msgSend(v159, "gb");
  p_network = (uint64_t *)&self->network;
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->network.__ptr_, *(_QWORD *)v230, *(_QWORD *)(v230 + 8));
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v230 + 1);
  if (*((_QWORD *)&v230 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v230 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = *p_network;
  v226[1] = 0;
  v226[0] = 0;
  v225 = v226;
  v13 = *(unsigned __int8 **)(v12 + 232);
  v14 = (unsigned __int8 *)(v12 + 240);
  if (v13 != (unsigned __int8 *)(v12 + 240))
  {
    v15 = (_QWORD *)(v12 + 136);
    v16 = (std::locale::id *)MEMORY[0x1E0DE4A90];
    do
    {
      v17 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v15, v13 + 32);
      if (!v17)
        goto LABEL_253;
      v18 = *((_QWORD *)v17 + 5);
      v19 = *(_QWORD *)(v18 + 8);
      v20 = *(_DWORD *)(v18 + 16);
      -[ETTask optimizer](self, "optimizer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "batch_size");
      *(_QWORD *)&v230 = v13 + 32;
      v23 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v225, (_QWORD *)v13 + 4, (__int128 **)&v230);
      *((_QWORD *)v23 + 7) = v19;
      *((_DWORD *)v23 + 16) = v20;
      *((_DWORD *)v23 + 17) = v22;
      *((_QWORD *)v23 + 9) = 0xFFFFFFFF00000001;
      *((_QWORD *)v23 + 10) = 0;
      *((_QWORD *)v23 + 11) = 0;
      v25 = v23 + 96;
      v24 = (void *)*((_QWORD *)v23 + 12);
      if (v24)
      {
        *((_QWORD *)v23 + 13) = v24;
        operator delete(v24);
        *v25 = 0;
        v25[1] = 0;
        v25[2] = 0;
      }
      *v25 = 0;
      v25[1] = 0;
      v25[2] = 0;

      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E0DE4A60], (uint64_t)"input_blob: ", 12);
      v27 = (char)v13[55];
      v28 = v27 >= 0 ? (uint64_t)(v13 + 32) : *((_QWORD *)v13 + 4);
      v29 = v27 >= 0 ? v13[55] : *((_QWORD *)v13 + 5);
      v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v28, v29);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)", batch_size: ", 14);
      if (!std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v15, v13 + 32))LABEL_253:std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      v31 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(*v31 - 24)));
      v32 = std::locale::use_facet((const std::locale *)&v230, v16);
      ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
      std::locale::~locale((std::locale *)&v230);
      std::ostream::put();
      std::ostream::flush();
      v33 = (unsigned __int8 *)*((_QWORD *)v13 + 1);
      if (v33)
      {
        do
        {
          v34 = v33;
          v33 = *(unsigned __int8 **)v33;
        }
        while (v33);
      }
      else
      {
        do
        {
          v34 = (unsigned __int8 *)*((_QWORD *)v13 + 2);
          v35 = *(_QWORD *)v34 == (_QWORD)v13;
          v13 = v34;
        }
        while (!v35);
      }
      v13 = v34;
    }
    while (v34 != v14);
    v12 = *p_network;
  }
  cntrl = self->network.__cntrl_;
  v221[0] = v12;
  v221[1] = (uint64_t)cntrl;
  if (cntrl)
  {
    v37 = (unint64_t *)((char *)cntrl + 8);
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  Espresso::compute_network_shape_starting_from_data_shapes(v221, (uint64_t)&v225, (uint64_t)v222);
  if (cntrl)
  {
    v39 = (unint64_t *)((char *)cntrl + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  ptr = self->network.__ptr_;
  v42 = self->network.__cntrl_;
  v220[8] = ptr;
  v220[9] = v42;
  if (v42)
  {
    v43 = (unint64_t *)((char *)v42 + 8);
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }
  Espresso::shape_network_recursive((Espresso *)ptr, (Espresso::net *)v222, 0, 0);
  if (v42)
  {
    v45 = (unint64_t *)((char *)v42 + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v42 + 16))(v42);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v42);
    }
  }
  v47 = self->network.__cntrl_;
  v210 = self->network.__ptr_;
  v211 = v47;
  if (v47)
  {
    v48 = (unint64_t *)((char *)v47 + 8);
    do
      v49 = __ldxr(v48);
    while (__stxr(v49 + 1, v48));
  }
  v50 = (std::__shared_weak_count *)v228;
  v209[0] = v227;
  v209[1] = v228;
  if (v228)
  {
    v51 = (unint64_t *)(v228 + 8);
    do
      v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
  }
  v208[1] = 0;
  v208[0] = 0;
  Espresso::sequential_builder::sequential_builder((uint64_t)&v212, (uint64_t *)&v210, v209, 0, v208);
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      v54 = __ldaxr(p_shared_owners);
    while (__stlxr(v54 - 1, p_shared_owners));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  v55 = (std::__shared_weak_count *)v211;
  if (v211)
  {
    v56 = (unint64_t *)((char *)v211 + 8);
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  objc_msgSend(v161, "label_name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    objc_msgSend(v161, "label_name");
    v55 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = (char *)-[std::__shared_weak_count UTF8String](v55, "UTF8String");
  }
  else
  {
    v59 = "label";
  }
  std::string::basic_string[abi:ne180100]<0>(&__s, v59);
  if (v58)

  objc_msgSend(v161, "label_shape");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60 == 0;

  if (v61)
  {
    if (!std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((_QWORD *)(*p_network + 136), (unsigned __int8 *)&__s))
    {
      -[ETTask optimizer](self, "optimizer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = 0;
      v189 = 0u;
      v190 = 0u;
      v185 = 0x100000001;
      v186 = 1;
      v187 = objc_msgSend(v78, "batch_size");
      v188 = 0xFFFFFFFF00000001;
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v184, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        v184 = __s;
      Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v212, (char *)&v185, (std::string::size_type)&v184, (uint64_t)&v192);
      if (v193 < 0)
        operator delete(v192);
      if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v184.__r_.__value_.__l.__data_);
      if ((_QWORD)v190)
      {
        *((_QWORD *)&v190 + 1) = v190;
        operator delete((void *)v190);
      }

    }
  }
  else
  {
    v180 = 0uLL;
    v181 = 0;
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    objc_msgSend(v161, "label_shape");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v203, v242, 16);
    if (v64)
    {
      v65 = 0;
      v66 = 0;
      v67 = *(_QWORD *)v204;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v204 != v67)
            objc_enumerationMutation(v62);
          v69 = objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 8 * i), "intValue");
          v70 = v69;
          if ((unint64_t)v66 >= v65)
          {
            v71 = (v66 - v63) >> 2;
            v72 = v71 + 1;
            if ((unint64_t)(v71 + 1) >> 62)
              std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v65 - (_QWORD)v63) >> 1 > v72)
              v72 = (uint64_t)(v65 - (_QWORD)v63) >> 1;
            if (v65 - (unint64_t)v63 >= 0x7FFFFFFFFFFFFFFCLL)
              v73 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v73 = v72;
            if (v73)
              v73 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v73);
            else
              v74 = 0;
            v75 = (char *)(v73 + 4 * v71);
            *(_DWORD *)v75 = v70;
            v76 = v75 + 4;
            while (v66 != v63)
            {
              v77 = *((_DWORD *)v66 - 1);
              v66 -= 4;
              *((_DWORD *)v75 - 1) = v77;
              v75 -= 4;
            }
            v65 = v73 + 4 * v74;
            *(_QWORD *)&v180 = v75;
            *((_QWORD *)&v180 + 1) = v76;
            v181 = v65;
            if (v63)
              operator delete(v63);
            v63 = v75;
            v66 = v76;
          }
          else
          {
            *(_DWORD *)v66 = v69;
            v66 += 4;
          }
          *((_QWORD *)&v180 + 1) = v66;
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v203, v242, 16);
      }
      while (v64);
      v63 = (char *)v180;
    }
    else
    {
      v66 = 0;
    }

    memset(&v202, 0, sizeof(v202));
    v79 = v66 - v63;
    if (v66 != v63)
    {
      v80 = v79 >> 2;
      if ((unint64_t)(v79 >> 2) <= 1)
        v80 = 1;
      v81 = &v202;
      v82 = v63;
      do
      {
        v83 = *(_DWORD *)v82;
        v82 += 4;
        LODWORD(v81->__r_.__value_.__l.__data_) = v83;
        v81 = (std::string *)((char *)v81 + 4);
        --v80;
      }
      while (v80);
    }
    HIDWORD(v202.__r_.__value_.__r.__words[2]) = (unint64_t)v79 >> 2;
    Espresso::layer_nd_shape::to_canonical_5d_shape((Espresso::layer_nd_shape *)&v202, 0, (uint64_t)&v230);
    if (std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((_QWORD *)(*p_network + 136), (unsigned __int8 *)&__s))
    {
      v84 = *p_network + 136;
      v183.__r_.__value_.__r.__words[0] = (std::string::size_type)&__s;
      v85 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v84, (unsigned __int8 *)&__s, (__int128 **)&v183);
      Espresso::abstract_blob_container::shape((char *)&v238, *((_QWORD *)v85 + 5));
      v86 = Espresso::layer_shape::operator==((uint64_t)&v230, (uint64_t)&v238);
      if (v240.__r_.__value_.__r.__words[2])
      {
        *(_QWORD *)&v241 = *((_QWORD *)&v240.__r_.__value_.__l + 2);
        operator delete((void *)v240.__r_.__value_.__r.__words[2]);
      }
      if (!v86)
      {
        p_s = &__s;
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
        *(_QWORD *)&v238 = p_s;
        Espresso::throw_exception_selector<Espresso::generic_error,char const*&>("label blob of name %s already exists with inconsistant shape", &v238);
      }
    }
    else
    {
      v195[0] = v230;
      v195[1] = *(_OWORD *)v231;
      v196 = *(_QWORD *)&v231[16];
      v197 = 0;
      v199 = 0;
      v198 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v197, v232, *(uint64_t *)&v233[0], (uint64_t)(*(_QWORD *)&v233[0] - (_QWORD)v232) >> 2);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v194, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        v194 = __s;
      Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v212, (char *)v195, (std::string::size_type)&v194, (uint64_t)&v200);
      if (v201 < 0)
        operator delete(v200);
      if (SHIBYTE(v194.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v194.__r_.__value_.__l.__data_);
      if (v197)
      {
        v198 = v197;
        operator delete(v197);
      }
    }
    if (v232)
    {
      *(_QWORD *)&v233[0] = v232;
      operator delete(v232);
    }
    if (v63)
      operator delete(v63);
  }
  objc_msgSend(v161, "output_name");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    objc_msgSend(v161, "output_name");
    v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v202, (char *)objc_msgSend(v89, "UTF8String"));

  }
  else
  {
    v90 = *(_QWORD *)(v216 + 256);
    if (*(char *)(v90 + 55) < 0)
      std::string::__init_copy_ctor_external(&v202, *(const std::string::value_type **)(v90 + 32), *(_QWORD *)(v90 + 40));
    else
      v202 = *(std::string *)(v90 + 32);
  }

  memset(&v183, 0, sizeof(v183));
  objc_msgSend(v161, "loss_name");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91 == 0;

  if (!v92)
  {
    objc_msgSend(v161, "loss_name");
    v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x19401C808](&v183, objc_msgSend(v93, "UTF8String"));

  }
  if (objc_msgSend(v161, "mode") != 1)
    Espresso::throw_exception_selector<Espresso::not_implemented_error,ETLossMode>(objc_msgSend(v161, "mode"));
  objc_msgSend(v161, "loss_name");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94 == 0;

  if (v95)
    MEMORY[0x19401C808](&v183, "cross_entropy");
  v180 = xmmword_191A93370;
  v181 = 1;
  v182 = 257;
  *(_QWORD *)&v238 = &v202;
  v96 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v216 + 136, (unsigned __int8 *)&v202, (__int128 **)&v238);
  Espresso::abstract_blob_container::shape((char *)&v230, *((_QWORD *)v96 + 5));
  DWORD1(v180) = DWORD2(v230);
  if (v232)
  {
    *(_QWORD *)&v233[0] = v232;
    operator delete(v232);
  }
  std::string::basic_string[abi:ne180100]<0>(v176, "softmax");
  std::string::basic_string[abi:ne180100]<0>(&v175, "s");
  if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v230, v202.__r_.__value_.__l.__data_, v202.__r_.__value_.__l.__size_);
  }
  else
  {
    v230 = *(_OWORD *)&v202.__r_.__value_.__l.__data_;
    *(_QWORD *)v231 = *((_QWORD *)&v202.__r_.__value_.__l + 2);
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v231[8], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v231[8] = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
    v232 = (void *)__s.__r_.__value_.__r.__words[2];
  }
  v172 = 0;
  v173 = 0;
  v174 = 0;
  *(_QWORD *)&v238 = &v172;
  BYTE8(v238) = 0;
  v172 = (std::string *)operator new(0x30uLL);
  v173 = v172;
  v174 = v172 + 2;
  v173 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v174, &v230, v233, v172);
  std::string::basic_string[abi:ne180100]<0>(&v238, "prediction");
  if (SHIBYTE(v183.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v240, v183.__r_.__value_.__l.__data_, v183.__r_.__value_.__l.__size_);
  else
    v240 = v183;
  v169 = 0;
  v170 = 0;
  v171 = 0;
  *(_QWORD *)&v229 = &v169;
  BYTE8(v229) = 0;
  v169 = (std::string *)operator new(0x30uLL);
  v170 = v169;
  v171 = v169 + 2;
  v170 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v171, &v238, &v241, v169);
  Espresso::sequential_builder::add<Espresso::softmax_params>(&v178, &v212, (uint64_t)v176, (uint64_t)&v175, (uint64_t)&v180, (uint64_t)v172, (uint64_t)v173, (uint64_t *)&v169);
  v97 = v179;
  if (v179)
  {
    v98 = (unint64_t *)&v179->__shared_owners_;
    do
      v99 = __ldaxr(v98);
    while (__stlxr(v99 - 1, v98));
    if (!v99)
    {
      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
      std::__shared_weak_count::__release_weak(v97);
    }
  }
  *(_QWORD *)&v229 = &v169;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v229);
  for (j = 0; j != -6; j -= 3)
  {
    if (SHIBYTE(v240.__r_.__value_.__r.__words[j + 2]) < 0)
      operator delete(*(void **)((char *)&v240.__r_.__value_.__l.__data_ + j * 8));
  }
  *(_QWORD *)&v238 = &v172;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v238);
  for (k = 0; k != -48; k -= 24)
  {
    if (*((char *)&v232 + k + 7) < 0)
      operator delete(*(void **)&v231[k + 8]);
  }
  if (SHIBYTE(v175.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v175.__r_.__value_.__l.__data_);
  if (v177 < 0)
    operator delete(v176[0]);
  Espresso::sequential_builder::build_from_shapes((uint64_t)&v212, v212, 1, &v167);
  v102 = v168;
  if (v168)
  {
    v103 = (unint64_t *)&v168->__shared_owners_;
    do
      v104 = __ldaxr(v103);
    while (__stlxr(v104 - 1, v103));
    if (!v104)
    {
      ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
      std::__shared_weak_count::__release_weak(v102);
    }
  }
  if (self)
  {
    -[ETTask reinitializeVariables](self, "reinitializeVariables");
  }
  else
  {
    v238 = 0uLL;
    v239 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v180, "is_training");
  Espresso::mark_block_start(p_network, (uint64_t)&v180, 1);
  objc_msgSend(v159, "gb");
  v105 = (uint64_t *)v230;
  memset(v166, 0, sizeof(v166));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v166, v238, *((uint64_t *)&v238 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v238 + 1) - v238) >> 3));
  Espresso::gradient_builder::build_gradient(v105, (__int128 *)&v183, v166, (uint64_t)v176);
  v175.__r_.__value_.__r.__words[0] = (std::string::size_type)v166;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v175);
  v106 = (std::__shared_weak_count *)*((_QWORD *)&v230 + 1);
  if (*((_QWORD *)&v230 + 1))
  {
    v107 = (unint64_t *)(*((_QWORD *)&v230 + 1) + 8);
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
      std::__shared_weak_count::__release_weak(v106);
    }
  }
  v109 = v157;
  v110 = v109;
  v111 = self->network.__ptr_;
  v112 = self->network.__cntrl_;
  v165[2] = (uint64_t)v111;
  v165[3] = (uint64_t)v112;
  if (v112)
  {
    v113 = (unint64_t *)((char *)v112 + 8);
    do
      v114 = __ldxr(v113);
    while (__stxr(v114 + 1, v113));
  }
  objc_msgSend(v109, "lr");
  v116 = v115;
  objc_msgSend(v110, "momentum");
  v118 = v117;
  std::string::basic_string[abi:ne180100]<0>(&v175, "learning_rate");
  Espresso::sgd_optimizer_builder::sgd_optimizer_builder((uint64_t)&v230, (uint64_t)v111, (std::__shared_weak_count *)v112, (uint64_t)&v238, (uint64_t)v176, &v175, v116, v118);
  if (SHIBYTE(v175.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v175.__r_.__value_.__l.__data_);
  if (v112)
  {
    v119 = (unint64_t *)((char *)v112 + 8);
    do
      v120 = __ldaxr(v119);
    while (__stlxr(v120 - 1, v119));
    if (!v120)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v112 + 16))(v112);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v112);
    }
  }
  (*(void (**)(__int128 *))(v230 + 16))(&v230);
  v121 = *v234;
  if (v234[1] != *v234)
  {
    v122 = 0;
    v123 = 0;
    do
    {
      (*(void (**)(__int128 *, uint64_t, uint64_t))(v230 + 32))(&v230, v121 + v122, *v235 + v122);
      ++v123;
      v121 = *v234;
      v122 += 24;
    }
    while (v123 < 0xAAAAAAAAAAAAAAABLL * ((v234[1] - *v234) >> 3));
  }
  (*(void (**)(__int128 *))(v230 + 24))(&v230);
  Espresso::sequential_builder::build_from_shapes((uint64_t)&v230 + 8, *((uint64_t *)&v230 + 1), 1, &v175);
  size = (std::__shared_weak_count *)v175.__r_.__value_.__l.__size_;
  if (v175.__r_.__value_.__l.__size_)
  {
    v125 = (unint64_t *)(v175.__r_.__value_.__l.__size_ + 8);
    do
      v126 = __ldaxr(v125);
    while (__stlxr(v126 - 1, v125));
    if (!v126)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  Espresso::mark_block_end(p_network, (uint64_t)&v180);
  Espresso::guard_block_with_if (*p_network, (uint64_t)&v180);
  v127 = *p_network;
  v165[0] = 0;
  v165[1] = 0;
  Espresso::net::setup_script(v127, v165, 0);
  LODWORD(v229) = 0;
  Espresso::create_context((int *)&v229, &v175);
  (*(void (**)(std::string::size_type))(*(_QWORD *)v175.__r_.__value_.__l.__data_ + 96))(v175.__r_.__value_.__r.__words[0]);
  Espresso::reload_network_on_context(p_network, (uint64_t *)&v175, 0, (uint64_t *)&v229);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)p_network, &v229);
  v128 = (std::__shared_weak_count *)*((_QWORD *)&v229 + 1);
  if (*((_QWORD *)&v229 + 1))
  {
    v129 = (unint64_t *)(*((_QWORD *)&v229 + 1) + 8);
    do
      v130 = __ldaxr(v129);
    while (__stlxr(v130 - 1, v129));
    if (!v130)
    {
      ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
      std::__shared_weak_count::__release_weak(v128);
    }
  }
  v131 = self->network.__cntrl_;
  v163 = self->network.__ptr_;
  v164 = v131;
  if (v131)
  {
    v132 = (unint64_t *)((char *)v131 + 8);
    do
      v133 = __ldxr(v132);
    while (__stxr(v133 + 1, v132));
  }
  objc_msgSend(v159, "setNetwork:", &v163);
  v134 = (std::__shared_weak_count *)v164;
  if (v164)
  {
    v135 = (unint64_t *)((char *)v164 + 8);
    do
      v136 = __ldaxr(v135);
    while (__stlxr(v136 - 1, v135));
    if (!v136)
    {
      ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
      std::__shared_weak_count::__release_weak(v134);
    }
  }
  v137 = self;
  v138 = (std::__shared_weak_count *)v175.__r_.__value_.__l.__size_;
  if (v175.__r_.__value_.__l.__size_)
  {
    v139 = (unint64_t *)(v175.__r_.__value_.__l.__size_ + 8);
    do
      v140 = __ldaxr(v139);
    while (__stlxr(v140 - 1, v139));
    if (!v140)
    {
      ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
      std::__shared_weak_count::__release_weak(v138);
    }
  }
  *(_QWORD *)&v230 = off_1E2D8C368;
  if (v237 < 0)
    operator delete(v236);
  Espresso::optimizer_builder::~optimizer_builder((void **)&v230);

  *(_QWORD *)&v230 = v176;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v230);
  if (SHIBYTE(v181) < 0)
    operator delete((void *)v180);
  *(_QWORD *)&v230 = &v238;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v230);
  if (SHIBYTE(v183.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v183.__r_.__value_.__l.__data_);
  if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v202.__r_.__value_.__l.__data_);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)v220);
  v141 = v219;
  if (v219)
  {
    v142 = (unint64_t *)&v219->__shared_owners_;
    do
      v143 = __ldaxr(v142);
    while (__stlxr(v143 - 1, v142));
    if (!v143)
    {
      ((void (*)(std::__shared_weak_count *))v141->__on_zero_shared)(v141);
      std::__shared_weak_count::__release_weak(v141);
    }
  }
  v144 = v218;
  if (v218)
  {
    v145 = (unint64_t *)&v218->__shared_owners_;
    do
      v146 = __ldaxr(v145);
    while (__stlxr(v146 - 1, v145));
    if (!v146)
    {
      ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
      std::__shared_weak_count::__release_weak(v144);
    }
  }
  v147 = v217;
  if (v217)
  {
    v148 = (unint64_t *)&v217->__shared_owners_;
    do
      v149 = __ldaxr(v148);
    while (__stlxr(v149 - 1, v148));
    if (!v149)
    {
      ((void (*)(std::__shared_weak_count *))v147->__on_zero_shared)(v147);
      std::__shared_weak_count::__release_weak(v147);
    }
  }
  if (v215 < 0)
    operator delete(v214[5]);
  std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v214, v214[1]);
  v150 = v213;
  if (v213)
  {
    v151 = (unint64_t *)&v213->__shared_owners_;
    do
      v152 = __ldaxr(v151);
    while (__stlxr(v152 - 1, v151));
    if (!v152)
    {
      ((void (*)(std::__shared_weak_count *))v150->__on_zero_shared)(v150);
      std::__shared_weak_count::__release_weak(v150);
    }
  }
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v224, v224[1]);
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v222, v223);
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v225, v226[0]);
  v153 = (std::__shared_weak_count *)v228;
  if (v228)
  {
    v154 = (unint64_t *)(v228 + 8);
    do
      v155 = __ldaxr(v154);
    while (__stlxr(v155 - 1, v154));
    if (!v155)
    {
      ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
      std::__shared_weak_count::__release_weak(v153);
    }
  }

  return v137;
}

- (float)fit:(id)a3 numberOfEpochs:(int)a4 withProgress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  unint64_t v14;
  ETDataSourceWithExtractor *v15;
  void *v16;
  ETDataSourceWithExtractor *v17;
  ETDataSourceWithCache *v18;
  float v19;
  float v20;
  float v21;

  v8 = a3;
  v9 = a5;
  -[ETTask optimizer](self, "optimizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "batch_size");

  v12 = objc_msgSend(v8, "numberOfDataPoints");
  -[ETTask extractor](self, "extractor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a4 * ((v12 - 1) / (unint64_t)v11) + a4;

  if (v13)
  {
    v15 = [ETDataSourceWithExtractor alloc];
    -[ETTask extractor](self, "extractor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ETDataSourceWithExtractor initWithDataSource:extractor:](v15, "initWithDataSource:extractor:", v8, v16);

    v18 = -[ETDataSourceWithCache initWithDataSource:]([ETDataSourceWithCache alloc], "initWithDataSource:", v17);
    -[ETTask fit:numberOfBatches:withProgress:](self, "fit:numberOfBatches:withProgress:", v18, v14, v9);
    v20 = v19;

  }
  else
  {
    -[ETTask fit:numberOfBatches:withProgress:](self, "fit:numberOfBatches:withProgress:", v8, v14, v9);
    v20 = v21;
  }

  return v20;
}

- (float)fit:(id)a3 numberOfBatches:(unsigned int)a4 withProgress:(id)a5
{
  id v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 *v13;
  char *v14;
  std::__shared_weak_count *v15;
  net *ptr;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  __int128 *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  unsigned int v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  float v37;
  float v38;
  net *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  void *v47;
  double v48;
  uint64_t v49;
  float v50;
  float v51;
  uint64_t v52;
  Espresso *v53;
  const char *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  float v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  void (**v72)(id, _QWORD, void *);
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  char *v81;
  std::__shared_weak_count *v82;
  void *__p[2];
  char v84;
  _QWORD v85[2];
  __int128 *v86;
  std::__shared_weak_count *v87;
  const __CFString *v88;
  void *v89;
  _BYTE buf[12];
  __int16 v91;
  _BYTE v92[10];
  char *v93[5];

  v75 = *(_QWORD *)&a4;
  v93[3] = *(char **)MEMORY[0x1E0C80C00];
  v7 = a3;
  v72 = (void (**)(id, _QWORD, void *))a5;
  cntrl = self->network.__cntrl_;
  v85[0] = self->network.__ptr_;
  v85[1] = cntrl;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v73 = v7;
  et_data_source::et_data_source((uint64_t)buf, v7, (uint64_t)v85);
  std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(&v86, (uint64_t)buf);
  *(_QWORD *)buf = &off_1E2D4DDC0;
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v93, v93[1]);

  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  if (-[ETTask dumpData](self, "dumpData"))
  {
    v13 = v86;
    std::string::basic_string[abi:ne180100]<0>(__p, "/tmp/descriptors/train/");
    et_data_source::dump_blobs(v13, (const void **)__p);
    if (v84 < 0)
      operator delete(__p[0]);
  }
  v14 = (char *)operator new(0xB0uLL);
  v15 = (std::__shared_weak_count *)v14;
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;
  *(_QWORD *)v14 = &off_1E2DB67A8;
  ptr = self->network.__ptr_;
  v17 = self->network.__cntrl_;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v20 = v86;
  v21 = v87;
  if (v87)
  {
    p_shared_owners = (unint64_t *)&v87->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
    *((_QWORD *)v14 + 3) = 0;
    *((_QWORD *)v14 + 4) = v20;
    *((_QWORD *)v14 + 5) = v21;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }
  else
  {
    *((_QWORD *)v14 + 3) = 0;
    *((_QWORD *)v14 + 4) = v20;
    *((_QWORD *)v14 + 5) = 0;
  }
  *((_QWORD *)v14 + 6) = ptr;
  *((_QWORD *)v14 + 7) = v17;
  if (v17)
  {
    v25 = (unint64_t *)((char *)v17 + 8);
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  *((_QWORD *)v14 + 20) = 0;
  *((_OWORD *)v14 + 4) = xmmword_191A93780;
  v14[80] = 1;
  *((_QWORD *)v14 + 21) = 0;
  *(_OWORD *)(v14 + 84) = 0u;
  *(_OWORD *)(v14 + 100) = 0u;
  *(_OWORD *)(v14 + 116) = 0u;
  *(_OWORD *)(v14 + 132) = 0u;
  *((_DWORD *)v14 + 37) = 0;
  *((_QWORD *)v14 + 19) = v14 + 160;
  if (v21)
  {
    v27 = (unint64_t *)&v21->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v17)
  {
    v29 = (unint64_t *)((char *)v17 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v17 + 16))(v17);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v17);
    }
  }
  v81 = (char *)&v15[1];
  v82 = v15;
  -[ETTask optimizer](self, "optimizer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "batch_size");

  v33 = objc_msgSend(v7, "numberOfDataPoints");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSince1970");
  v36 = v35;

  v76 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[ETTask optimizer](self, "optimizer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "lr");
  v38 = v37;
  v39 = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(buf, "is_training");
  Espresso::net::get_global(&v79, (uint64_t)v39, buf);
  Espresso::fill_bc(&v79, 1.0);
  v40 = v80;
  if (v80)
  {
    v41 = (unint64_t *)&v80->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  if ((v92[9] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  if ((_DWORD)v75)
  {
    v43 = 0;
    v44 = 0;
    v45 = (v33 - 1) / (unint64_t)(int)v32 + 1;
    v46 = v81;
    do
    {
      v47 = (void *)MEMORY[0x19401D4A4]();
      Espresso::solver_sgd::step((Espresso::solver_sgd *)v46, v32);
      objc_autoreleasePoolPop(v47);
      v49 = v43 + 1;
      if (!((v43 + 1) % v45))
      {
        objc_msgSend(v74, "lr_decay_epoch");
        v51 = v50;
        v52 = *((_QWORD *)v46 + 3);
        std::string::basic_string[abi:ne180100]<0>(buf, "learning_rate");
        Espresso::net::get_global(&v77, v52, buf);
        v38 = v38 * v51;
        Espresso::fill_bc(&v77, v38);
        v55 = v78;
        if (v78)
        {
          v56 = (unint64_t *)&v78->__shared_owners_;
          do
            v57 = __ldaxr(v56);
          while (__stlxr(v57 - 1, v56));
          if (!v57)
          {
            ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
            std::__shared_weak_count::__release_weak(v55);
          }
        }
        if ((v92[9] & 0x80000000) != 0)
          operator delete(*(void **)buf);
        Espresso::espresso_os_log_subsystem(v53, v54);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v44;
          v91 = 2048;
          *(double *)v92 = v38;
          _os_log_debug_impl(&dword_190DAF000, v58, OS_LOG_TYPE_DEBUG, "Epoch:%zu. LR decay lr=%f\n", buf, 0x16u);
        }

        ++v44;
        v46 = v81;
      }
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v49, 1) <= 0x1999999999999999uLL)
        printf("\tLoss: %.4e (%.4e) (%zu/%d/%zu)\n", *((float *)v46 + 17), *((float *)v46 + 16), v43, v75, v45);
      LODWORD(v48) = *((_DWORD *)v46 + 17);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "addObject:", v59);

      ++v43;
    }
    while (v49 != v75);
  }
  else
  {
    v44 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "timeIntervalSince1970");
  v62 = v61;

  printf("%zu epochs in: %.3f s\n", v44, v62 - v36);
  v88 = CFSTR("losses");
  v89 = v76;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2](v72, v75, v63);

  v64 = *((float *)v81 + 17);
  v65 = v82;
  if (v82)
  {
    v66 = (unint64_t *)&v82->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  v68 = v87;
  if (v87)
  {
    v69 = (unint64_t *)&v87->__shared_owners_;
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }

  return v64;
}

- (id)evaluate:(id)a3
{
  id v4;
  void *v5;
  ETDataSourceWithExtractor *v6;
  void *v7;
  ETDataSourceWithExtractor *v8;
  ETDataSourceWithCache *v9;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 *v16;
  void *v17;
  net *ptr;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __int128 v25;
  unint64_t *v26;
  unint64_t v27;
  double v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  char **v35;
  void *v36;
  void **v37;
  void *v38;
  char *v39;
  char **v40;
  BOOL v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  __shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  __int128 v49;
  unint64_t *v50;
  unint64_t v51;
  void *__p[2];
  __int128 v53;
  uint64_t *v54[3];
  unsigned int v55[4];
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  __int128 v64;
  net *v65;
  __shared_weak_count *v66;
  char **v67;
  char *v68[2];
  uint64_t v69;
  std::__shared_weak_count *v70;
  uint64_t (**v71)(et_data_source *__hidden, unint64_t);
  int v72;
  _DWORD v73[12];
  __int128 v74;
  _DWORD v75[8];
  int v76;
  const void *v77[2];
  char v78;
  _QWORD v79[2];
  _QWORD v80[2];
  __int128 v81;

  v4 = a3;
  v81 = 0uLL;
  -[ETTask extractor](self, "extractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [ETDataSourceWithExtractor alloc];
    -[ETTask extractor](self, "extractor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ETDataSourceWithExtractor initWithDataSource:extractor:](v6, "initWithDataSource:extractor:", v4, v7);

    v9 = -[ETDataSourceWithCache initWithDataSource:]([ETDataSourceWithCache alloc], "initWithDataSource:", v8);
    cntrl = self->network.__cntrl_;
    v80[0] = self->network.__ptr_;
    v80[1] = cntrl;
    if (cntrl)
    {
      v11 = (unint64_t *)((char *)cntrl + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    et_data_source::et_data_source((uint64_t)&v71, v9, (uint64_t)v80);
    std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(__p, (uint64_t)&v71);
    v13 = *(_OWORD *)__p;
    *(_OWORD *)__p = 0uLL;
    v81 = v13;
    v71 = &off_1E2D4DDC0;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v73[3], *(char **)&v73[5]);

    if (cntrl)
    {
      v14 = (unint64_t *)((char *)cntrl + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }

  }
  else
  {
    v46 = self->network.__cntrl_;
    v79[0] = self->network.__ptr_;
    v79[1] = v46;
    if (v46)
    {
      v47 = (unint64_t *)((char *)v46 + 8);
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    et_data_source::et_data_source((uint64_t)&v71, v4, (uint64_t)v79);
    std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(__p, (uint64_t)&v71);
    v49 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    v81 = v49;
    v71 = &off_1E2D4DDC0;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v73[3], *(char **)&v73[5]);

    if (v46)
    {
      v50 = (unint64_t *)((char *)v46 + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v46 + 16))(v46);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v46);
      }
    }
  }
  if (-[ETTask dumpData](self, "dumpData"))
  {
    v16 = (__int128 *)v81;
    std::string::basic_string[abi:ne180100]<0>(v77, "/tmp/descriptors/test/");
    et_data_source::dump_blobs(v16, v77);
    if (v78 < 0)
      operator delete((void *)v77[0]);
  }
  v71 = 0;
  memset(v73, 0, sizeof(v73));
  v74 = 0u;
  memset(v75, 0, sizeof(v75));
  v72 = 1;
  v76 = 0;
  -[ETTask optimizer](self, "optimizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v17, "batch_size");

  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v69, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v69, 0.0);
  v19 = v70;
  if (v70)
  {
    p_shared_owners = (unint64_t *)&v70->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (SBYTE7(v53) < 0)
    operator delete(__p[0]);
  v22 = self->network.__cntrl_;
  v65 = self->network.__ptr_;
  v66 = v22;
  if (v22)
  {
    v23 = (unint64_t *)((char *)v22 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v25 = v81;
  v64 = v81;
  if (*((_QWORD *)&v81 + 1))
  {
    v26 = (unint64_t *)(*((_QWORD *)&v81 + 1) + 8);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  Espresso::validation_options::validation_options((uint64_t)v55, (uint64_t)&v71);
  memset(v54, 0, sizeof(v54));
  Espresso::run_validation(&v65, &v64, v55, v54, (uint64_t)&v67, v28);
  __p[0] = v54;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (v63 < 0)
    operator delete(v62);
  if (v61 < 0)
    operator delete(v60);
  if (v59 < 0)
    operator delete(v58);
  if (v57 < 0)
    operator delete(v56);
  if (*((_QWORD *)&v25 + 1))
  {
    v29 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v25 + 1) + 16))(*((_QWORD *)&v25 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v25 + 1));
    }
  }
  v31 = (std::__shared_weak_count *)v66;
  if (v66)
  {
    v32 = (unint64_t *)((char *)v66 + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = (void *)objc_opt_new();
  v35 = v67;
  if (v67 != v68)
  {
    do
    {
      if (*((char *)v35 + 55) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__p, v35[4], (std::string::size_type)v35[5]);
      }
      else
      {
        *(_OWORD *)__p = *((_OWORD *)v35 + 2);
        *(_QWORD *)&v53 = v35[6];
      }
      DWORD2(v53) = *((_DWORD *)v35 + 14);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(_OWORD *)__p, v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((SBYTE7(v53) & 0x80u) == 0)
        v37 = __p;
      else
        v37 = (void **)__p[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, v38);

      if (SBYTE7(v53) < 0)
        operator delete(__p[0]);
      v39 = v35[1];
      if (v39)
      {
        do
        {
          v40 = (char **)v39;
          v39 = *(char **)v39;
        }
        while (v39);
      }
      else
      {
        do
        {
          v40 = (char **)v35[2];
          v41 = *v40 == (char *)v35;
          v35 = v40;
        }
        while (!v41);
      }
      v35 = v40;
    }
    while (v40 != v68);
  }
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy(v68[0]);
  if (SHIBYTE(v76) < 0)
    operator delete(*(void **)&v75[3]);
  if (SHIBYTE(v75[2]) < 0)
    operator delete(*(void **)((char *)&v74 + 4));
  if (SBYTE3(v74) < 0)
    operator delete(*(void **)&v73[7]);
  if (SHIBYTE(v73[6]) < 0)
    operator delete(*(void **)&v73[1]);
  v42 = (std::__shared_weak_count *)*((_QWORD *)&v81 + 1);
  if (*((_QWORD *)&v81 + 1))
  {
    v43 = (unint64_t *)(*((_QWORD *)&v81 + 1) + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }

  return v34;
}

- (BOOL)runBatches:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  id v10;
  __shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  char *v23;
  char *v24;
  uint64_t v25;
  int v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  ETDataSourceBuf *v30;
  uint64_t v31;
  BOOL v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void (***v36)(uint64_t *__return_ptr, _QWORD);
  ETDataSourceBuf *v37;
  ETDataSourceBuf *v38;
  int v39;
  void *v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t (**v49)(id, _QWORD, id);
  _QWORD v50[5];
  id v51;
  ETDataSourceBuf *v52;
  void *v53[5];
  _QWORD v54[2];
  uint64_t v55;
  std::__shared_weak_count *v56;
  char **v57;
  int v58;
  void *__p;
  void *v60;
  void *v61[2];
  std::string::size_type v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char *v67;
  std::string *v68;
  unint64_t v69;
  char **v70;
  char *v71[2];
  void **v72;
  _QWORD v73[2];
  _QWORD *v74;
  char *v75[16];

  v75[13] = *(char **)MEMORY[0x1E0C80C00];
  v10 = a3;
  v47 = a5;
  v49 = (uint64_t (**)(id, _QWORD, id))a6;
  cntrl = self->network.__cntrl_;
  v54[0] = self->network.__ptr_;
  v54[1] = cntrl;
  if (cntrl)
  {
    v12 = (unint64_t *)((char *)cntrl + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  et_data_source::et_data_source((uint64_t)v73, v10, (uint64_t)v54);
  std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(&v55, (uint64_t)v73);
  v73[0] = &off_1E2D4DDC0;
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v75, v75[1]);

  if (cntrl)
  {
    v14 = (unint64_t *)((char *)cntrl + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  -[ETTask optimizer](self, "optimizer", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "batch_size");

  v18 = v47;
  v71[0] = 0;
  v71[1] = 0;
  v69 = 0;
  v70 = v71;
  v67 = 0;
  v68 = 0;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(v19);
        std::string::basic_string[abi:ne180100]<0>(v61, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i)), "UTF8String"));
        v23 = (char *)self->network.__ptr_ + 136;
        v72 = v61;
        v24 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v23, (unsigned __int8 *)v61, (__int128 **)&v72);
        Espresso::abstract_blob_container::shape((char *)&v57, *((_QWORD *)v24 + 5));
        if (v58 == (_DWORD)v17)
        {
          v25 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v57);
          v72 = v61;
          *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v70, v61, (__int128 **)&v72)+ 14) = v25 / (int)v17;
        }
        else
        {
          if (v58 != 1)
            Espresso::throw_exception_selector<Espresso::generic_error>("only support blob whose n dimension == batch size or 1");
          v26 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v57);
          v72 = v61;
          *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v70, v61, (__int128 **)&v72)+ 14) = v26;
          v27 = v68;
          if ((unint64_t)v68 >= v69)
          {
            v29 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v67, (uint64_t)v61);
          }
          else
          {
            if (SHIBYTE(v62) < 0)
            {
              std::string::__init_copy_ctor_external(v68, (const std::string::value_type *)v61[0], (std::string::size_type)v61[1]);
            }
            else
            {
              v28 = *(_OWORD *)v61;
              v68->__r_.__value_.__r.__words[2] = v62;
              *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
            }
            v29 = v27 + 1;
          }
          v68 = v29;
        }
        if (__p)
        {
          v60 = __p;
          operator delete(__p);
        }
        if (SHIBYTE(v62) < 0)
          operator delete(v61[0]);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v20);
  }

  v30 = objc_alloc_init(ETDataSourceBuf);
  -[ETDataSourceBuf setBlobs:numberOfDataPoints:nonBatches:](v30, "setBlobs:numberOfDataPoints:nonBatches:", &v70, v17, &v67);
  v57 = &v67;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v57);
  std::__tree<std::string>::destroy((uint64_t)&v70, v71[0]);

  if (a4)
  {
    v31 = 0;
    v32 = 0;
    v48 = v17;
    v33 = a4;
    v34 = v55;
    do
    {
      v35 = (void *)MEMORY[0x19401D4A4]();
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v34 + 8))(v73, v34, v31, v48);
      v36 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)self->network.__ptr_ + 2);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3321888768;
      v50[2] = __63__ETTask_runBatches_numberOfBatches_outputNames_batchCallback___block_invoke;
      v50[3] = &unk_1E2DC45F0;
      std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v53, (uint64_t)v73);
      v50[4] = self;
      v51 = v19;
      v37 = v30;
      v38 = v30;
      v52 = v38;
      Espresso::abstract_context::compute_batch_sync(v36, v50);
      v39 = v49[2](v49, v31, v38);

      v30 = v37;
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v53[2]);
      v40 = v53[0];
      v53[0] = 0;
      if (v40)
        operator delete(v40);
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v74);
      v41 = (void *)v73[0];
      v73[0] = 0;
      if (v41)
        operator delete(v41);
      objc_autoreleasePoolPop(v35);
      if (v39)
        break;
      v32 = ++v31 >= v33;
    }
    while (v33 != v31);
  }
  else
  {
    v32 = 1;
  }

  v42 = v56;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }

  return v32;
}

- (BOOL)fit:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  net *ptr;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  BOOL v17;
  void *__p[2];
  char v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v21, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v21, 1.0);
  v14 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v20 < 0)
    operator delete(__p[0]);
  v17 = -[ETTask runBatches:numberOfBatches:outputNames:batchCallback:](self, "runBatches:numberOfBatches:outputNames:batchCallback:", v10, v8, v11, v12);

  return v17;
}

- (BOOL)fit:(id)a3 numberOfEpochs:(int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  net *ptr;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  unsigned int v18;
  BOOL v19;
  void *__p[2];
  char v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v23, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v23, 1.0);
  v14 = v24;
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v22 < 0)
    operator delete(__p[0]);
  -[ETTask optimizer](self, "optimizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "batch_size");

  v19 = -[ETTask runBatches:numberOfBatches:outputNames:batchCallback:](self, "runBatches:numberOfBatches:outputNames:batchCallback:", v10, a4 + a4 * ((objc_msgSend(v10, "numberOfDataPoints") - 1) / v18), v11, v12);
  return v19;
}

- (BOOL)runInference:(id)a3 outputNames:(id)a4 batchCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  net *ptr;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  BOOL v17;
  void *__p[2];
  char v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v21, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v21, 0.0);
  v12 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v20 < 0)
    operator delete(__p[0]);
  -[ETTask optimizer](self, "optimizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "batch_size");

  v17 = -[ETTask runBatches:numberOfBatches:outputNames:batchCallback:](self, "runBatches:numberOfBatches:outputNames:batchCallback:", v8, (objc_msgSend(v8, "numberOfDataPoints") - 1) / v16 + 1, v9, v10);
  return v17;
}

- (void)saveNetwork:(id)a3
{
  -[ETTask saveNetwork:revertToInferenceMode:](self, "saveNetwork:revertToInferenceMode:", a3, 0);
}

- (void)saveNetwork:(id)a3 revertToInferenceMode:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  net *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  unint64_t *v12;
  unint64_t v13;
  void *__p[2];
  char v15;
  void *v16[2];
  char v17;
  std::string __str;
  uint64_t v19[2];

  v4 = a4;
  v6 = a3;
  if (v4)
    Espresso::net::transform_transfer_global_parameters((Espresso::net *)self->network.__ptr_);
  ptr = self->network.__ptr_;
  cntrl = self->network.__cntrl_;
  v19[0] = (uint64_t)ptr;
  v19[1] = (uint64_t)cntrl;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v11, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v16, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  Espresso::dump_network(v19, &__str, (uint64_t)v16, (uint64_t)__p);
  if (v15 < 0)
    operator delete(__p[0]);
  if (v17 < 0)
    operator delete(v16[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (cntrl)
  {
    v12 = (unint64_t *)((char *)cntrl + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }

}

- (BOOL)moveToGPU:(int)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (***v9)(uint64_t *__return_ptr, _QWORD);
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  void (***v22)(uint64_t *__return_ptr, _QWORD);
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  ETModelDef *model;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  ETModelDef *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[6];
  std::__shared_weak_count *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[2];
  uint64_t v57[2];
  ETModelDef *v58;
  std::__shared_weak_count *v59;
  char v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  void (***v63)(uint64_t *__return_ptr, _QWORD);
  uint64_t v64;

  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("/%@.espresso.net"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ETTask saveNetwork:revertToInferenceMode:](self, "saveNetwork:revertToInferenceMode:", v8, 0);
  LODWORD(v61) = 50000;
  Espresso::create_context((int *)&v61, &v58);
  if (v58
  {
    v63 = v9;
    v64 = (uint64_t)v59;
    if (v59)
    {
      p_shared_owners = (unint64_t *)&v59->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
  }
  else
  {
    v63 = 0;
    v64 = 0;
  }
  v12 = v59;
  if (v59)
  {
    v13 = (unint64_t *)&v59->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = (uint64_t)v63;
  ((void (*)(void (***)(uint64_t *__return_ptr, _QWORD)))(*v63)[12])(v63);
  *(_BYTE *)(v15 + 56) = 1;
  v16 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v58, (char *)objc_msgSend(v16, "UTF8String"));
  v17 = (std::__shared_weak_count *)v64;
  v57[0] = v15;
  v57[1] = v64;
  if (v64)
  {
    v18 = (unint64_t *)(v64 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  Espresso::load_network((uint64_t)&v58, v57, 0, 0, &v61);
  if (v17)
  {
    v20 = (unint64_t *)&v17->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v60 < 0)
    operator delete(v58);
  v56[0] = 0;
  v56[1] = 0;
  Espresso::net::setup_script(v61, v56, 0);
  v22 = v63;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3321888768;
  v52[2] = __26__ETTask_moveToGPU_error___block_invoke;
  v52[3] = &unk_1E2DC42E8;
  v52[4] = self;
  v52[5] = v63;
  v53 = (std::__shared_weak_count *)v64;
  if (v64)
  {
    v23 = (unint64_t *)(v64 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v54 = v61;
  v55 = (uint64_t)v62;
  if (v62)
  {
    v25 = (unint64_t *)&v62->__shared_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  Espresso::abstract_context::compute_batch_sync(v22, v52);
  model = self->_model;
  v50 = v61;
  v51 = (uint64_t)v62;
  if (v62)
  {
    v28 = (unint64_t *)&v62->__shared_owners_;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  -[ETModelDef setNetwork:](model, "setNetwork:", &v50);
  v30 = (std::__shared_weak_count *)v51;
  if (v51)
  {
    v31 = (unint64_t *)(v51 + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->network.__ptr_, v61, (uint64_t)v62);
  v33 = self->_model;
  if (v33)
  {
    -[ETModelDef gb](v33, "gb");
    v33 = v58;
  }
  else
  {
    v58 = 0;
    v59 = 0;
  }
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](v33, v61, (uint64_t)v62);
  v34 = v59;
  if (v59)
  {
    v35 = (unint64_t *)&v59->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = (std::__shared_weak_count *)v55;
  if (v55)
  {
    v38 = (unint64_t *)(v55 + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  v40 = v53;
  if (v53)
  {
    v41 = (unint64_t *)&v53->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  v43 = v62;
  if (v62)
  {
    v44 = (unint64_t *)&v62->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  v46 = (std::__shared_weak_count *)v64;
  if (v64)
  {
    v47 = (unint64_t *)(v64 + 8);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }

  return 1;
}

- (ETModelDef)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (ETOptimizerDef)optimizer
{
  return self->_optimizer;
}

- (void)setOptimizer:(id)a3
{
  objc_storeStrong((id *)&self->_optimizer, a3);
}

- (ETImageDescriptorExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_extractor, a3);
}

- (BOOL)dumpData
{
  return self->_dumpData;
}

- (void)setDumpData:(BOOL)a3
{
  self->_dumpData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->network);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __26__ETTask_moveToGPU_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  __int128 *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  __int128 *v20;
  void *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  std::string __p;
  uint64_t v27;
  std::__shared_weak_count *v28;
  void *v29;
  __int128 *v30;

  Espresso::net::all_globals((Espresso::net *)&v29, *(_QWORD *)(a1[4] + 8));
  v4 = v30;
  if (v30)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<Espresso::blob<float,4>>>::pair[abi:ne180100](&__p, v4 + 1);
      v5 = a1[5];
      v7 = *(_QWORD *)(v5 + 224);
      v6 = *(std::__shared_weak_count **)(v5 + 232);
      v8 = *(_QWORD *)(v7 + 8);
      v22 = v7;
      v23 = v6;
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t *, _QWORD))(*(_QWORD *)v8 + 24))(&v24, v8, &v22, 0);
      v11 = v23;
      if (v23)
      {
        v12 = (unint64_t *)&v23->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      Espresso::blobcpy(a2, &v24, &v27);
      Espresso::net::set_global(a1[7], (__int128 *)&__p, &v24);
      v14 = v25;
      if (v25)
      {
        v15 = (unint64_t *)&v25->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      v17 = v28;
      if (v28)
      {
        v18 = (unint64_t *)&v28->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v4 = *(__int128 **)v4;
    }
    while (v4);
    v20 = v30;
  }
  else
  {
    v20 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v20);
  v21 = v29;
  v29 = 0;
  if (v21)
    operator delete(v21);
}

void __63__ETTask_runBatches_numberOfBatches_outputNames_batchCallback___block_invoke(uint64_t a1, _QWORD *a2)
{
  unsigned __int8 *i;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  id obj;
  void **v23;
  std::__shared_weak_count *v24;
  void *__p;
  void *v26;
  char *v27;
  std::__shared_weak_count *v28;
  void *v29[2];
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  for (i = *(unsigned __int8 **)(a1 + 72); i; i = *(unsigned __int8 **)i)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if ((_QWORD *)(v5 + 240) != std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>(v5 + 232, (_QWORD *)i + 2))
    {
      Espresso::blob<float,4>::copy(&v23, *((_QWORD *)i + 5));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136;
      v29[0] = i + 16;
      v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v6, i + 16, (__int128 **)v29);
      (*(void (**)(_QWORD, _QWORD *, void ***))(**((_QWORD **)v7 + 5) + 48))(*((_QWORD *)v7 + 5), a2, &v23);
      v8 = v24;
      if (v24)
      {
        p_shared_owners = (unint64_t *)&v24->__shared_owners_;
        do
          v10 = __ldaxr(p_shared_owners);
        while (__stlxr(v10 - 1, p_shared_owners));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
  }
  Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2, 0, 0xFFFFFFFFLL);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 40);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j)), "UTF8String"));
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 136;
        v23 = v29;
        v15 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v14, (unsigned __int8 *)v29, (__int128 **)&v23);
        v16 = objc_msgSend(*(id *)(a1 + 48), "dataAtIndex:key:", 0, v29);
        Espresso::abstract_blob_container::shape((char *)&v23, *((_QWORD *)v15 + 5));
        v17 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v23);
        v18 = operator new(0x60uLL);
        v18[1] = 0;
        v18[2] = 0;
        *v18 = &off_1E2DBECA8;
        v18[3] = &off_1E2DA11F0;
        *((_OWORD *)v18 + 4) = 0u;
        *((_OWORD *)v18 + 5) = 0u;
        *((_DWORD *)v18 + 8) = v17;
        *(_QWORD *)((char *)v18 + 36) = 0x100000001;
        *((_DWORD *)v18 + 11) = 1;
        v18[6] = v16;
        *((_BYTE *)v18 + 56) = 0;
        v27 = (char *)(v18 + 3);
        v28 = (std::__shared_weak_count *)v18;
        if (__p)
        {
          v26 = __p;
          operator delete(__p);
        }
        (*(void (**)(_QWORD, _QWORD *, char **))(**((_QWORD **)v15 + 5) + 40))(*((_QWORD *)v15 + 5), a2, &v27);
        v19 = v28;
        if (v28)
        {
          v20 = (unint64_t *)&v28->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        if (v30 < 0)
          operator delete(v29[0]);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

}

@end
