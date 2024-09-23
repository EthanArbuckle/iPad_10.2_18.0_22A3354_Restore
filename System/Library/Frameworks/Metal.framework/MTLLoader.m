@implementation MTLLoader

+ (uint64_t)canonicalURL:(uint64_t)a1
{
  void *v3;
  uint64_t v4;

  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", a2, 0);
  v4 = objc_msgSend(v3, "standardizedURL");

  return v4;
}

- (id)loadLibrariesWithDevice:(_MTLFunction *)a3 function:(void *)a4 insertLibraries:(uint64_t)a5 options:(id *)a6 error:
{
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  void **v21;

  if (!a1)
    return 0;
  v12 = (void *)MEMORY[0x186DAC640]();
  v17[0] = *(_QWORD *)(a1 + 8);
  v17[1] = a2;
  v18 = 0u;
  v19 = 0u;
  memset(v20, 0, 25);
  LoaderContext::setInsertLibraries(v17, a4);
  if (LoaderContext::load((LoaderContext *)v17, a3, a5, a6))
  {
    v13 = LoaderContext::finish((LoaderContext *)v17, a5, a6);
    if (!a6)
      goto LABEL_9;
  }
  else
  {
    v13 = 0;
    if (!a6)
    {
LABEL_9:
      v21 = (void **)v20;
      std::vector<std::unique_ptr<LoaderContext::Image>>::__destroy_vector::operator()[abi:ne180100](&v21);
      objc_autoreleasePoolPop(v12);
      return v13;
    }
  }
  if (v13)
    goto LABEL_9;
  v14 = *a6;
  v21 = (void **)v20;
  std::vector<std::unique_ptr<LoaderContext::Image>>::__destroy_vector::operator()[abi:ne180100](&v21);
  objc_autoreleasePoolPop(v12);
  v15 = *a6;
  return 0;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

- (MTLLoader)init
{
  MTLLoader *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLoader;
  v2 = -[MTLLoader init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MTLLoader device cache queue", 0);
    v2->_claimQueue = (OS_dispatch_queue *)v3;
    if (v3)
    {
      if (getGlobalState(void)::_loaderGlobalsOnce != -1)
        dispatch_once(&getGlobalState(void)::_loaderGlobalsOnce, &__block_literal_global_132);
      v2->_global = (void *)getGlobalState(void)::_loaderGlobalState;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

+ (BOOL)ReadHashTable:(unint64_t)a3 begin:(unsigned int)a4 end:(unsigned int)a5 hashList:(void *)a6 reader:(id)a7 errorHandler:(id)a8 handler:(id)a9
{
  unsigned int *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  void *v24;
  void *v25;
  char *v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  _OWORD *v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  __int128 v40;
  uint64_t v41;
  _DWORD *v42;
  _QWORD *v43;
  char *v44;
  __int128 v45;
  uint64_t v46;
  char *v47;
  __int128 v48;
  uint64_t v49;
  char *v50;
  __int128 v51;
  _DWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t v63;
  _QWORD *v64;
  unsigned int (**v66)(id, uint64_t);

  v14 = (unsigned int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a7 + 2))(a7, a3, 8);
  if (!v14 && !(*((unsigned int (**)(id, _QWORD))a8 + 2))(a8, 0))
    return 0;
  v15 = *v14;
  if ((_DWORD)v15)
  {
    v16 = a3 + 8;
    v17 = (*((uint64_t (**)(id, unint64_t, uint64_t))a7 + 2))(a7, a3 + 8, v15 << 7);
    if (v17 || (*((unsigned int (**)(id, uint64_t))a8 + 2))(a8, 1))
    {
      v66 = (unsigned int (**)(id, uint64_t))a8;
      if (a5 | a4)
        v18 = a5;
      else
        v18 = v15;
      if (v18 > a4)
      {
        v19 = 0;
        v63 = (v15 << 7) + v16;
        v64 = (char *)a6 + 16;
        v20 = a4;
        while (1)
        {
          v21 = v17 + (v20 << 7);
          v22 = (uint64_t *)*((_QWORD *)a6 + 1);
          if ((*(_DWORD *)(v21 + 108) & 0x3FFFFFFF) != 0)
          {
            v23 = (char *)malloc_type_malloc(96 * (((uint64_t)v22 - *(_QWORD *)a6) >> 3) + 96, 0x1000040E0EAB150uLL);
            v24 = malloc_type_malloc(12 * ((uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3) + 12, 0x100004052888210uLL);
            v25 = v24;
            v26 = *(char **)a6;
            if (*((_QWORD *)a6 + 1) == *(_QWORD *)a6)
            {
              v28 = 0;
            }
            else
            {
              v27 = 0;
              v28 = 0;
              v29 = 1;
              do
              {
                v30 = *(_OWORD **)&v26[8 * v27];
                v31 = &v23[32 * v28];
                v32 = v30[1];
                *(_OWORD *)v31 = *v30;
                *((_OWORD *)v31 + 1) = v32;
                v33 = v28 + 1;
                v34 = &v23[32 * v33];
                v35 = *(_QWORD *)(*(_QWORD *)a6 + 8 * v27);
                v36 = *(_OWORD *)(v35 + 48);
                *(_OWORD *)v34 = *(_OWORD *)(v35 + 32);
                *((_OWORD *)v34 + 1) = v36;
                v37 = v28 + 2;
                v38 = *(_QWORD *)(*(_QWORD *)a6 + 8 * v27);
                v39 = &v23[32 * v37];
                v40 = *(_OWORD *)(v38 + 80);
                *(_OWORD *)v39 = *(_OWORD *)(v38 + 64);
                *((_OWORD *)v39 + 1) = v40;
                v26 = *(char **)a6;
                v41 = *((_QWORD *)a6 + 1);
                v42 = *(_DWORD **)(*(_QWORD *)a6 + 8 * v27);
                *((_DWORD *)v24 + v28) = v42[24];
                *((_DWORD *)v24 + v33) = v42[25];
                *((_DWORD *)v24 + v37) = v42[26];
                v28 += v42[27] >> 30;
                v27 = v29++;
              }
              while (v27 < (v41 - (uint64_t)v26) >> 3);
            }
            v44 = &v23[32 * v28];
            v45 = *(_OWORD *)(v21 + 16);
            *(_OWORD *)v44 = *(_OWORD *)v21;
            *((_OWORD *)v44 + 1) = v45;
            v46 = v28 + 1;
            v47 = &v23[32 * v46];
            v48 = *(_OWORD *)(v21 + 48);
            *(_OWORD *)v47 = *(_OWORD *)(v21 + 32);
            *((_OWORD *)v47 + 1) = v48;
            v49 = v28 + 2;
            v50 = &v23[32 * v49];
            v51 = *(_OWORD *)(v21 + 80);
            *(_OWORD *)v50 = *(_OWORD *)(v21 + 64);
            *((_OWORD *)v50 + 1) = v51;
            v52 = (_DWORD *)(v17 + (v20 << 7));
            *((_DWORD *)v24 + v28) = v52[24];
            *((_DWORD *)v24 + v46) = v52[25];
            *((_DWORD *)v24 + v49) = v52[26];
            (*((void (**)(id, char *, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a9 + 2))(a9, v23, v24, v28 + (*(_DWORD *)(v21 + 108) >> 30), v52[28], v52[29], v52[30], v52[31]);
            free(v23);
            free(v25);
          }
          else
          {
            if ((unint64_t)v22 >= *v64)
            {
              v53 = ((uint64_t)v22 - *(_QWORD *)a6) >> 3;
              if ((unint64_t)(v53 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v54 = *v64 - *(_QWORD *)a6;
              v55 = v54 >> 2;
              if (v54 >> 2 <= (unint64_t)(v53 + 1))
                v55 = v53 + 1;
              if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8)
                v56 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v56 = v55;
              if (v56)
                v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)v64, v56);
              else
                v57 = 0;
              v58 = (uint64_t *)&v57[8 * v53];
              *v58 = v21;
              v43 = v58 + 1;
              v60 = *(char **)a6;
              v59 = (char *)*((_QWORD *)a6 + 1);
              if (v59 != *(char **)a6)
              {
                do
                {
                  v61 = *((_QWORD *)v59 - 1);
                  v59 -= 8;
                  *--v58 = v61;
                }
                while (v59 != v60);
                v59 = *(char **)a6;
              }
              *(_QWORD *)a6 = v58;
              *((_QWORD *)a6 + 1) = v43;
              *((_QWORD *)a6 + 2) = &v57[8 * v56];
              if (v59)
                operator delete(v59);
            }
            else
            {
              *v22 = v21;
              v43 = v22 + 1;
            }
            *((_QWORD *)a6 + 1) = v43;
            if ((objc_msgSend(a1, "ReadHashTable:begin:end:hashList:reader:errorHandler:handler:", v63, *(unsigned int *)(v17 + (v20 << 7) + 112), *(unsigned int *)(v17 + (v20 << 7) + 116), a6, a7, v66, a9) & 1) == 0)
            {
              *((_QWORD *)a6 + 1) -= 8;
              if (!v66[2](v66, 1))
                return v19;
            }
            *((_QWORD *)a6 + 1) -= 8;
          }
          v19 = ++v20 >= v18;
          if (v20 == v18)
            return v19;
        }
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

+ (BOOL)isAIRHeaderExtLoadCommand:(const void *)a3 headerOffset:(unint64_t *)a4 headerSize:(unint64_t *)a5 headerSection:(unsigned int *)a6
{
  return isAIRHeaderExtensionCommand((const load_command *)a3, a4, a5, a6);
}

+ (BOOL)deserializeHashesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8
{
  _BOOL4 v10;
  uint64_t v12;
  _QWORD *v13;
  int *v14;
  int v15;
  BOOL v16;

  v10 = a5;
  v12 = (*((uint64_t (**)(id, unint64_t, unint64_t))a6 + 2))(a6, a3, a4);
  v13 = (_QWORD *)v12;
  if (!v10)
  {
    if (v12 || (*((unsigned int (**)(id, _QWORD))a7 + 2))(a7, 0))
    {
      v14 = (int *)(v13 + 1);
      goto LABEL_8;
    }
    return 0;
  }
  if (!v12 && !(*((unsigned int (**)(id, _QWORD))a7 + 2))(a7, 0))
    return 0;
  v14 = (int *)v13 + 17;
  v13 += 5;
LABEL_8:
  v15 = *v14;
  if (*v13)
    v16 = v15 == 0;
  else
    v16 = 1;
  if (!v16)
    return objc_msgSend(a1, "ReadHashTable:begin:end:hashList:reader:errorHandler:handler:", a8);
  (*((void (**)(id, uint64_t))a7 + 2))(a7, 3);
  return 1;
}

+ (BOOL)deserializeObjectFromAIRNTHeaderAtSection:(id *)a3 reader:(id)a4 errorHandler:(id)a5 handler:(id)a6
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (**v24)(id, _QWORD, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void (**v35)(id, uint64_t);
  char v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  dev_t *v42;
  uint64_t v43;
  const char **v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  _QWORD *v48;
  const char *v49;
  dev_t v50;
  stat *v51;
  char v52;
  unint64_t st_gid;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  _QWORD *v60;
  const char *v61;
  int v62;
  int v63;
  ssize_t v64;
  int v65;
  BOOL v66;
  unint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  dev_t *v79;
  uint64_t v80;
  dev_t v81;
  uint64_t v82;
  dev_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v87;
  uint64_t (**v88)(id, _QWORD, uint64_t);
  int v89;
  void (**v90)(id, stat *);
  BOOL v91;
  dev_t *v92;
  unsigned int v93;
  unsigned int v94;
  uint64_t v95;
  void (**v96)(id, uint64_t);
  uint64_t v97;
  unsigned int v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  stat v103;
  int v104[4];

  if (!a3->var1)
  {
    if (!a3[3].var1)
      goto LABEL_17;
    v28 = (*((uint64_t (**)(id, unint64_t))a4 + 2))(a4, a3[3].var0);
    if (!v28)
      goto LABEL_17;
    v94 = *(_DWORD *)(v28 + 8);
    v95 = *(_QWORD *)v28;
    v29 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[8].var0, a3[8].var1);
    if (!v29)
      goto LABEL_17;
    v100 = *(_QWORD *)v29;
    v98 = *(_DWORD *)(v29 + 8);
    v30 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[2].var0, a3[2].var1);
    if (!v30)
      goto LABEL_17;
    v12 = *(_QWORD *)v30;
    v14 = *(_DWORD *)(v30 + 8);
    v31 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[7].var0, a3[7].var1);
    if (!v31)
      goto LABEL_17;
    v96 = (void (**)(id, uint64_t))a5;
    v16 = *v31;
    v15 = v31[1];
    v32 = (*((uint64_t (**)(id, unint64_t, unint64_t))a4 + 2))(a4, a3[1].var0, a3[1].var1);
    if (!v32)
      goto LABEL_17;
    v18 = *(_QWORD *)v32;
    v20 = *(_DWORD *)(v32 + 8);
    if (a3[4].var1)
    {
      v33 = (*((uint64_t (**)(id, unint64_t))a4 + 2))(a4, a3[4].var0);
      if (!v33)
        goto LABEL_17;
      v90 = (void (**)(id, stat *))a6;
      v101 = *(_QWORD *)v33;
      v11 = *(_DWORD *)(v33 + 8);
    }
    else
    {
      v90 = (void (**)(id, stat *))a6;
      v101 = 0;
      v11 = 0;
    }
    v13 = v94;
    v17 = v100;
    v19 = v98;
    goto LABEL_4;
  }
  v10 = (*((uint64_t (**)(id, unint64_t))a4 + 2))(a4, a3->var0);
  if (!v10)
  {
LABEL_17:
    v34 = 0;
    return v34 & 1;
  }
  v90 = (void (**)(id, stat *))a6;
  v101 = 0;
  v11 = 0;
  v12 = *(_QWORD *)(v10 + 16);
  v95 = *(_QWORD *)(v10 + 24);
  v96 = (void (**)(id, uint64_t))a5;
  v14 = *(_DWORD *)(v10 + 56);
  v13 = *(_DWORD *)(v10 + 60);
  v16 = *(_QWORD *)(v10 + 80);
  v15 = *(_QWORD *)(v10 + 88);
  v17 = *(_QWORD *)v10;
  v18 = *(_QWORD *)(v10 + 8);
  v19 = *(_DWORD *)(v10 + 48);
  v20 = *(_DWORD *)(v10 + 52);
LABEL_4:
  v93 = v13;
  if (!v13)
  {
    v21 = v19;
    v96[2](v96, 3);
    v19 = v21;
  }
  v22 = (*((uint64_t (**)(id, uint64_t, uint64_t))a4 + 2))(a4, v17, 40 * v19);
  v23 = v12;
  v24 = (uint64_t (**)(id, _QWORD, uint64_t))a4;
  v25 = (*((uint64_t (**)(id, uint64_t, uint64_t))a4 + 2))(a4, v23, 56 * v14);
  v26 = (*((uint64_t (**)(id, uint64_t, uint64_t))a4 + 2))(a4, v18, 40 * v20);
  v27 = (*((uint64_t (**)(id, uint64_t, uint64_t))a4 + 2))(a4, v16, v15);
  if (v11)
    v97 = v24[2](v24, v101, 24 * v11);
  else
    v97 = 0;
  v35 = v96;
  v36 = v93;
  if (!v93)
  {
    v37 = 1;
    goto LABEL_80;
  }
  v37 = 0;
  v38 = 0;
  v87 = v25;
  v88 = v24;
  while (1)
  {
    v39 = v24[2](v24, v95, 36);
    if (!v39 && !((unsigned int (*)(_QWORD, uint64_t))v35[2])(v35, 5))
      break;
    v40 = *(_DWORD *)(v25 + 56 * *(unsigned int *)(v39 + 4) + 48);
    if ((v40 & 0x20) != 0)
    {
      memset(&v103, 0, 80);
      memset(&v103.st_birthtimespec.tv_nsec, 0, 24);
      LODWORD(v103.st_birthtimespec.tv_sec) = v40;
      v90[2](v90, &v103);
      MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)&v103);
      v36 = 1;
      goto LABEL_80;
    }
    v41 = operator new();
    v42 = (dev_t *)v39;
    v43 = v41;
    *(_QWORD *)(v41 + 88) = 0;
    v44 = (const char **)(v41 + 88);
    *(_DWORD *)(v41 + 80) = 0;
    *(_OWORD *)(v41 + 48) = 0u;
    *(_OWORD *)(v41 + 64) = 0u;
    *(_OWORD *)(v41 + 16) = 0u;
    *(_OWORD *)(v41 + 32) = 0u;
    *(_OWORD *)v41 = 0u;
    *(_QWORD *)(v41 + 96) = 0;
    *(_QWORD *)(v41 + 104) = 0;
    v92 = v42;
    v45 = v42[1];
    v46 = v25 + 56 * v45;
    v47 = *(_DWORD *)(v46 + 48);
    *(_DWORD *)(v41 + 80) = v47;
    v48 = (_QWORD *)(v46 + 32);
    if ((v47 & 1) != 0)
    {
      v49 = (const char *)(v27 + *(unsigned int *)v48);
      *v44 = v49;
      if (stat(v49, &v103) < 0 && !((unsigned int (*)(_QWORD, uint64_t))v35[2])(v35, 7))
      {
        MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)v43);
        MEMORY[0x186DABFBC]();
        break;
      }
      *(_QWORD *)(v43 + 24) = 0;
      *(_QWORD *)(v43 + 32) = 0;
    }
    else
    {
      *(_QWORD *)(v41 + 24) = *v48;
      *(_QWORD *)(v41 + 32) = *(_QWORD *)(v25 + 56 * v45 + 40);
    }
    if ((((uint64_t (*)(_QWORD, uint64_t))v35[2])(v35, 8) & 1) != 0)
      v99 = 1;
    else
      v99 = ((uint64_t (*)(_QWORD, uint64_t))v35[2])(v35, 9);
    v89 = v38;
    v91 = v37;
    v50 = v92[8];
    memset(&v103, 0, 24);
    if ((v50 & 4) == 0)
    {
      v103.st_dev = *v92;
      v103.st_gid = 536870915;
      v51 = &v103;
      v52 = v99;
      while (1)
      {
LABEL_35:
        st_gid = v51->st_gid;
        if (st_gid >> 29)
        {
          v54 = 0;
          v102 = st_gid >> 29;
          while (1)
          {
            v55 = (_QWORD *)operator new();
            v56 = v55;
            v57 = v26 + 40 * *((unsigned int *)&v51->st_dev + v54);
            v55[3] = v57;
            v58 = *(_DWORD *)(v57 + 32);
            v59 = v22 + 40 * v58;
            v60 = (_QWORD *)(v59 + 16);
            if ((*(_BYTE *)(v59 + 32) & 1) != 0)
            {
              v61 = (const char *)(v27 + *(unsigned int *)v60);
              v56[2] = v61;
              if ((v52 & 1) == 0)
              {
                v62 = open(v61, 0);
                if (v62 < 0
                  || ((v63 = v62, v64 = read(v62, v104, 8uLL), v65 = v104[0], close(v63), v64 != 8)
                    ? (v66 = v65 == 1112298573)
                    : (v66 = 1),
                      !v66))
                {
                  MEMORY[0x186DABFBC](v56, 0x1070C40E40EFFFALL);
                  MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)v43);
                  MEMORY[0x186DABFBC]();
                  v36 = 0;
                  v37 = v91;
                  goto LABEL_80;
                }
                v52 = v99;
              }
              *v56 = 0;
              v56[1] = 0;
            }
            else
            {
              *v55 = *v60;
              v55[1] = *(_QWORD *)(v22 + 40 * v58 + 24);
            }
            *((_BYTE *)v56 + 32) = ((v51->st_gid >> v54) & 0x2000000) == 0;
            v68 = *(_QWORD **)(v43 + 8);
            v67 = *(_QWORD *)(v43 + 16);
            if ((unint64_t)v68 >= v67)
            {
              v70 = ((uint64_t)v68 - *(_QWORD *)v43) >> 3;
              if ((unint64_t)(v70 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v71 = v67 - *(_QWORD *)v43;
              v72 = v71 >> 2;
              if (v71 >> 2 <= (unint64_t)(v70 + 1))
                v72 = v70 + 1;
              if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
                v73 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v73 = v72;
              if (v73)
                v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(v43 + 16, v73);
              else
                v74 = 0;
              v75 = &v74[8 * v70];
              *(_QWORD *)v75 = v56;
              v69 = v75 + 8;
              v77 = *(char **)v43;
              v76 = *(char **)(v43 + 8);
              if (v76 != *(char **)v43)
              {
                do
                {
                  v78 = *((_QWORD *)v76 - 1);
                  v76 -= 8;
                  *((_QWORD *)v75 - 1) = v78;
                  v75 -= 8;
                }
                while (v76 != v77);
                v76 = *(char **)v43;
              }
              *(_QWORD *)v43 = v75;
              *(_QWORD *)(v43 + 8) = v69;
              *(_QWORD *)(v43 + 16) = &v74[8 * v73];
              if (v76)
                operator delete(v76);
            }
            else
            {
              *v68 = v56;
              v69 = v68 + 1;
            }
            *(_QWORD *)(v43 + 8) = v69;
            if (++v54 == v102)
            {
              LODWORD(st_gid) = v51->st_gid;
              break;
            }
          }
        }
        if ((st_gid & 4) == 0)
          break;
        v51 = (stat *)(v97 + 24 * v51->st_uid);
      }
      v79 = v92;
      v50 = v92[8];
      goto LABEL_70;
    }
    v51 = (stat *)(v97 + 24 * *v92);
    v52 = v99;
    if ((v51->st_gid & 0xE0000004) != 0)
      goto LABEL_35;
    v79 = v92;
LABEL_70:
    v80 = v79[6];
    v35 = v96;
    v25 = v87;
    v24 = v88;
    if ((v50 & 1) != 0)
    {
      v81 = 0;
      *(_QWORD *)(v43 + 96) = v27 + v80;
      *(_DWORD *)(v43 + 64) = 0;
    }
    else
    {
      *(_DWORD *)(v43 + 64) = v80;
      v81 = v79[7];
    }
    *(_DWORD *)(v43 + 68) = v81;
    v82 = v79[4];
    if ((v50 & 2) != 0)
    {
      v83 = 0;
      *(_QWORD *)(v43 + 104) = v27 + v82;
      *(_DWORD *)(v43 + 72) = 0;
    }
    else
    {
      *(_DWORD *)(v43 + 72) = v82;
      v83 = v79[5];
    }
    v95 += 36;
    *(_DWORD *)(v43 + 76) = v83;
    v84 = *((_QWORD *)v79 + 1);
    *(_QWORD *)&v85 = v84;
    *((_QWORD *)&v85 + 1) = HIDWORD(v84);
    *(_OWORD *)(v43 + 40) = v85;
    v90[2](v90, (stat *)v43);
    v36 = 0;
    v38 = v89 + 1;
    v37 = v89 + 1 >= v93;
    if (v89 + 1 == v93)
      goto LABEL_80;
  }
  v36 = 0;
LABEL_80:
  v34 = v37 | v36;
  return v34 & 1;
}

+ (BOOL)deserializePipelinesFromAIRNTHeaderAtOffset:(unint64_t)a3 headerSize:(unint64_t)a4 singleHeaderExpected:(BOOL)a5 reader:(id)a6 errorHandler:(id)a7 handler:(id)a8
{
  _BOOL4 v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  _DWORD *v23;
  uint64_t v24;

  v11 = a5;
  v12 = (*((uint64_t (**)(id, unint64_t, unint64_t))a6 + 2))(a6, a3, a4);
  v13 = (_QWORD *)v12;
  if (v11)
  {
    if (v12 || (v14 = (*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 10)) != 0)
    {
      v15 = (unsigned int *)(v13 + 8);
      v13 += 4;
LABEL_8:
      v16 = *v15;
      v17 = (*((uint64_t (**)(id, _QWORD, uint64_t))a6 + 2))(a6, *v13, 4 * v16);
      if (!(_DWORD)v16)
      {
LABEL_20:
        LOBYTE(v14) = 1;
        return v14;
      }
      v18 = (int *)v17;
      while (1)
      {
        v19 = operator new();
        v20 = v19;
        v21 = *v18;
        *(_DWORD *)v19 = *v18;
        *(_DWORD *)(v19 + 8) = -1;
        v22 = (_DWORD *)(v19 + 8);
        *(_DWORD *)(v19 + 16) = -1;
        *(_DWORD *)(v19 + 24) = -1;
        *(_BYTE *)(v19 + 32) = 8;
        switch(v21)
        {
          case 0:
            *v22 = v18[1];
            v23 = v18 + 2;
            v22 = (_DWORD *)(v19 + 16);
            v24 = 12;
            goto LABEL_16;
          case 1:
          case 2:
            v23 = v18 + 1;
            v24 = 8;
            goto LABEL_16;
          case 3:
            v23 = v18 + 1;
            *(_DWORD *)(v19 + 16) = v18[2];
            *(_DWORD *)(v19 + 24) = v18[3];
            v24 = 16;
LABEL_16:
            *v22 = *v23;
            v18 = (int *)((char *)v18 + v24);
            goto LABEL_17;
          default:
            if (((*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 11) & 1) == 0)
            {
              LOBYTE(v14) = 0;
              return v14;
            }
LABEL_17:
            if (((*((uint64_t (**)(id, uint64_t))a8 + 2))(a8, v20) & 1) == 0)
            {
              v14 = (*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 12);
              if (!v14)
                return v14;
            }
            LODWORD(v16) = v16 - 1;
            if (!(_DWORD)v16)
              goto LABEL_20;
            break;
        }
      }
    }
  }
  else if (v12 || (v14 = (*((uint64_t (**)(id, uint64_t))a7 + 2))(a7, 10)) != 0)
  {
    v15 = (unsigned int *)(v13 + 1);
    goto LABEL_8;
  }
  return v14;
}

- (void)dealloc
{
  NSObject *claimQueue;
  objc_super v4;

  claimQueue = self->_claimQueue;
  if (claimQueue)
    dispatch_release(claimQueue);
  v4.receiver = self;
  v4.super_class = (Class)MTLLoader;
  -[MTLLoader dealloc](&v4, sel_dealloc);
}

- (uint64_t)loadFileWithURL:(NSError *)a3 error:(NSString *)a4 errorDomain:(uint64_t)a5 invalidFileErrorCode:
{
  uint64_t v7;
  id v8;

  if (a1)
  {
    if (a2)
      return LoaderGlobalState::loadFile(*(LoaderGlobalState **)(a1 + 8), a2, a3, a4, a5);
    if (a3)
    {
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is nil"), *MEMORY[0x1E0CB2D50]);
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a3 = (NSError *)(id)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1100, v7);
    }
  }
  return 0;
}

- (void)releaseLoadedFile:(uint64_t)a1
{
  if (a1)
    LoaderGlobalState::releaseFile(*(LoaderGlobalState **)(a1 + 8), a2);
}

- (uint64_t)associateLoadedFile:(uint64_t)a3 withObject:
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MTLLoader_associateLoadedFile_withObject___block_invoke;
  v6[3] = &unk_1E0FE3ED0;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = &v7;
  dispatch_sync(v3, v6);
  v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

_QWORD *__44__MTLLoader_associateLoadedFile_withObject___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = a1 + 5;
  result = std::__hash_table<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::__unordered_map_hasher<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::hash<MTLFunctionStitchingFunctionNode *>,std::equal_to<MTLFunctionStitchingFunctionNode *>,true>,std::__unordered_map_equal<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::equal_to<MTLFunctionStitchingFunctionNode *>,std::hash<MTLFunctionStitchingFunctionNode *>,true>,std::allocator<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>>>::find<MTLFunctionStitchingFunctionNode *>((_QWORD *)(a1[4] + 24), a1 + 5);
  if (result)
  {
    result = (id)result[3];
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  }
  else
  {
    v4 = a1[6];
    if (v4)
    {
      v5 = a1[4] + 24;
      *(_QWORD *)&v6 = *v2;
      *((_QWORD *)&v6 + 1) = v4;
      return std::__hash_table<std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::__unordered_map_hasher<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::hash<MTLLoadedFile *>,std::equal_to<MTLLoadedFile *>,true>,std::__unordered_map_equal<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::equal_to<MTLLoadedFile *>,std::hash<MTLLoadedFile *>,true>,std::allocator<std::__hash_value_type<MTLLoadedFile *,objc_object *>>>::__emplace_unique_key_args<MTLLoadedFile *,std::pair<MTLLoadedFile *,objc_object *>>(v5, &v6, &v6);
    }
  }
  return result;
}

- (void)disassociateLoadedFile:(uint64_t)a1 withObject:(MTLLoadedFile *)a2
{
  _QWORD *v3;
  uint64_t *v4;
  MTLLoadedFile *v5;

  v5 = a2;
  if (a1)
  {
    v3 = (_QWORD *)(a1 + 24);
    v4 = std::__hash_table<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::__unordered_map_hasher<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::hash<MTLFunctionStitchingFunctionNode *>,std::equal_to<MTLFunctionStitchingFunctionNode *>,true>,std::__unordered_map_equal<MTLFunctionStitchingFunctionNode *,std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>,std::equal_to<MTLFunctionStitchingFunctionNode *>,std::hash<MTLFunctionStitchingFunctionNode *>,true>,std::allocator<std::__hash_value_type<MTLFunctionStitchingFunctionNode *,unsigned long>>>::find<MTLFunctionStitchingFunctionNode *>((_QWORD *)(a1 + 24), &v5);
    std::__hash_table<std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::__unordered_map_hasher<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::hash<MTLLoadedFile *>,std::equal_to<MTLLoadedFile *>,true>,std::__unordered_map_equal<MTLLoadedFile *,std::__hash_value_type<MTLLoadedFile *,objc_object *>,std::equal_to<MTLLoadedFile *>,std::hash<MTLLoadedFile *>,true>,std::allocator<std::__hash_value_type<MTLLoadedFile *,objc_object *>>>::erase(v3, v4);
    LoaderGlobalState::releaseFile(*(LoaderGlobalState **)(a1 + 8), v5);
  }
}

- (void)executeBlockForLoadedFile:(int)a3 withAssociatedObject:(dispatch_block_t)block block:
{
  if (a1)
    dispatch_sync(*(dispatch_queue_t *)(a1 + 16), block);
}

+ (unint64_t)sliceIDForDevice:(_QWORD *)a3 legacyDriverVersion:(_DWORD *)a4 airntDriverVersion:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;

  v7 = objc_opt_self();
  v8 = (void *)MEMORY[0x186DAC640](v7);
  v13 = (void *)objc_msgSend(a2, "targetDeviceArchitecture");
  if (v13)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  MTLReportFailure(0, "+[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]", 685, (uint64_t)CFSTR("Target device architecture is nil"), v9, v10, v11, v12, v17);
  if (a3)
LABEL_3:
    *a3 = objc_msgSend(v13, "driverVersion");
LABEL_4:
  if (a4)
    *a4 = objc_msgSend(v13, "versionCombined");
  v14 = objc_msgSend(v13, "cpuType");
  v15 = objc_msgSend(v13, "subType");
  objc_autoreleasePoolPop(v8);
  return v14 | (unint64_t)(v15 << 32);
}

+ (unint64_t)sliceIDForDevice:(_QWORD *)a3 andDriverVersion:
{
  objc_opt_self();
  return +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a2, a3, 0);
}

+ (uint64_t)sliceIDForDescriptors
{
  objc_opt_self();
  return -1;
}

+ (uint64_t)sliceIDForAIR:(uint64_t)a1
{
  uint64_t v3;
  int v4;

  v3 = 16777239;
  objc_opt_self();
  if (a2)
  {
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 120))(a2);
    return (mapAirVersionToMachOSubType(v4) << 32) | 0x1000017;
  }
  return v3;
}

+ (uint64_t)sliceIDForAIRVersion:(uint64_t)a1
{
  objc_opt_self();
  return (mapAirVersionToMachOSubType(a2) << 32) | 0x1000017;
}

+ (_DWORD)readMachOHeader:(uint64_t)a3 type:
{
  _DWORD *v5;
  _DWORD *v6;

  objc_opt_self();
  v5 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, 0, 32);
  v6 = v5;
  if (a3)
  {
    if ((validateMachHeader(v5, 6) & 1) != 0 || validateMachHeader(v6, 14))
      return v6;
    return 0;
  }
  if ((validateMachHeader(v5, 2) & 1) == 0 && (validateMachHeader(v6, 13) & 1) == 0)
    return 0;
  return v6;
}

+ (uint64_t)readLoadCommands:(unsigned int)a3 ncmds:(uint64_t)a4 sizeofcmds:(uint64_t)a5 handler:
{
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  unsigned int v15;
  _BOOL4 v16;
  uint64_t v17;
  unsigned int v18;

  objc_opt_self();
  result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, 32, a4);
  if (result)
  {
    v10 = a3 != 0;
    if (a3)
    {
      v11 = result;
      v12 = 0;
      v13 = (_DWORD *)result;
      v14 = a4;
      do
      {
        if (v14 < 8)
          return 0;
        v15 = v13[1];
        if (v14 < v15)
          return 0;
        if (*v13 == 49)
        {
          (*(void (**)(uint64_t, _DWORD *, uint64_t, uint64_t))(a5 + 16))(a5, v13, v12, v14);
          v15 = v13[1];
        }
        v13 = (_DWORD *)((char *)v13 + v15);
        v14 = v14 - v15;
        v12 = (v12 + 1);
      }
      while (a3 != (_DWORD)v12);
      if (a4 >= 8)
      {
        v17 = 0;
        v10 = 1;
        while (1)
        {
          v18 = *(_DWORD *)(v11 + 4);
          if (a4 < v18)
            break;
          if ((v10 & 1) != 0)
          {
            v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(a5, v11, v17, a4);
            v18 = *(_DWORD *)(v11 + 4);
          }
          else
          {
            v10 = 0;
          }
          v17 = (v17 + 1);
          v16 = v17 >= a3;
          if (v17 < a3)
          {
            v11 += v18;
            a4 = a4 - v18;
            if (a4 > 7)
              continue;
          }
          return v16 & v10;
        }
      }
      v16 = 0;
    }
    else
    {
      v16 = 1;
    }
    return v16 & v10;
  }
  return result;
}

+ (BOOL)airNTMachOEmpty:(uint64_t)a3 type:
{
  _DWORD *v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  objc_opt_self();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v5 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a2, a3);
  if (!v5)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v6 = v5[4];
  v7 = v5[5];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3812000000;
  v19 = __Block_byref_object_copy__49;
  v20 = __Block_byref_object_dispose__50;
  v21 = 0;
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __34__MTLLoader_airNTMachOEmpty_type___block_invoke;
  v15[3] = &unk_1E0FE3EF8;
  v15[4] = &v16;
  v15[5] = &v23;
  if (+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a2, v6, v7, (uint64_t)v15)&& *((_BYTE *)v24 + 24))
  {
    v8 = (_QWORD *)v17[6];
    if (v8[1])
    {
      v9 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *v8);
      if (v9)
      {
        v10 = *(_DWORD *)(v9 + 60);
LABEL_11:
        v11 = v10 == 0;
        goto LABEL_13;
      }
    }
    else if (v8[10])
    {
      v12 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, v8[9]);
      if (v12)
      {
        v10 = *(_DWORD *)(v12 + 8);
        goto LABEL_11;
      }
    }
  }
  v11 = 0;
LABEL_13:
  _Block_object_dispose(&v16, 8);
  v13 = v22;
  v22 = 0;
  if (v13)
    MEMORY[0x186DABFA4](v13, 0x1000C800CE834B2);
LABEL_15:
  _Block_object_dispose(&v23, 8);
  return v11;
}

uint64_t __34__MTLLoader_airNTMachOEmpty_type___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;
  uint64_t v11;

  if (*a2 == 49)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48))
    {
      v4 = operator new[]();
      *(_OWORD *)v4 = 0u;
      *(_OWORD *)(v4 + 16) = 0u;
      *(_OWORD *)(v4 + 32) = 0u;
      *(_OWORD *)(v4 + 48) = 0u;
      *(_OWORD *)(v4 + 64) = 0u;
      *(_OWORD *)(v4 + 80) = 0u;
      *(_OWORD *)(v4 + 96) = 0u;
      *(_OWORD *)(v4 + 112) = 0u;
      *(_OWORD *)(v4 + 128) = 0u;
      *(_OWORD *)(v4 + 144) = 0u;
      *(_OWORD *)(v4 + 160) = 0u;
      *(_OWORD *)(v4 + 176) = 0u;
      *(_OWORD *)(v4 + 192) = 0u;
      *(_QWORD *)(v4 + 208) = 0;
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(_QWORD *)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v4;
      if (v6)
        MEMORY[0x186DABFA4](v6, 0x1000C800CE834B2);
    }
    v10 = 0uLL;
    v11 = 0;
    if (+[MTLLoader isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:](MTLLoader, "isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:", a2, &v10, (char *)&v10 + 8, &v11))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 24 * v11;
      v8 = v10;
      *(_QWORD *)(v7 + 16) = v11;
      *(_OWORD *)v7 = v8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return 1;
}

+ (BOOL)machOConformsToAIRNTFormat:(uint64_t)a3 type:
{
  _DWORD *v5;
  unsigned int v6;
  uint64_t v7;
  _BOOL8 v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  objc_opt_self();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a2, a3);
  v8 = v5
    && (v6 = v5[4],
        v7 = v5[5],
        v10[0] = MEMORY[0x1E0C809B0],
        v10[1] = 3221225472,
        v10[2] = __45__MTLLoader_machOConformsToAIRNTFormat_type___block_invoke,
        v10[3] = &unk_1E0FE3F20,
        v10[4] = &v11,
        +[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a2, v6, v7, (uint64_t)v10))&& *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __45__MTLLoader_machOConformsToAIRNTFormat_type___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v4 = 0;
  if (+[MTLLoader isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:](MTLLoader, "isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:", a2, &v6, &v5, &v4))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

+ (uint64_t)deserializeMachOWrapperWithType:(uint64_t)a3 payloadHandler:(uint64_t)a4 reader:
{
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _OWORD *v20;
  uint64_t *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  void *v32;
  int v33;
  uint64_t v34;
  unsigned int v35;
  size_t v36;
  id v37;
  void *v38;
  id *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  _QWORD v47[5];
  CC_SHA256_CTX c;
  _QWORD v49[19];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  uint64_t (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[3];
  int v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  __n128 (*v94)(__n128 *, __n128 *);
  uint64_t (*v95)();
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  __n128 (*v103)(__n128 *, __n128 *);
  uint64_t (*v104)();
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned __int8 md[8];
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  __n128 (*v114)(uint64_t, uint64_t);
  uint64_t (*v115)();
  const char *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = +[MTLLoader readMachOHeader:type:]((uint64_t)MTLLoader, a4, a2);
  if (!v7)
    return 0;
  v45 = v7[5];
  v46 = v7[4];
  v43 = *(_QWORD *)(v7 + 1);
  v44 = a3;
  v100 = 0;
  v101 = &v100;
  v102 = 0x4812000000;
  v103 = __Block_byref_object_copy__52;
  v104 = __Block_byref_object_dispose__53;
  v105 = &unk_182827312;
  v106 = 0;
  v108 = 0;
  v107 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x4812000000;
  v94 = __Block_byref_object_copy__52;
  v95 = __Block_byref_object_dispose__53;
  v96 = &unk_182827312;
  v97 = 0;
  v99 = 0;
  v98 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0xA012000000;
  v114 = __Block_byref_object_copy__56;
  v115 = __Block_byref_object_dispose__57;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 1;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = v7[5] + 32;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3812000000;
  v53 = __Block_byref_object_copy__49;
  v54 = __Block_byref_object_dispose__50;
  v55 = 0;
  v56 = 0;
  *(_QWORD *)&v121 = objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke;
  v49[3] = &unk_1E0FE3F48;
  v49[6] = v69;
  v49[7] = &v91;
  v49[8] = &v57;
  v49[9] = &v111;
  v49[10] = &v65;
  v49[11] = &v61;
  v49[12] = &v87;
  v49[13] = &v79;
  v49[4] = a4;
  v49[5] = &v100;
  v49[14] = &v75;
  v49[15] = &v83;
  v49[16] = &v71;
  v49[17] = &v50;
  v49[18] = a2;
  if ((+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a4, v46, v45, (uint64_t)v49) & 1) == 0|| a2 == 1 && !v112[13]|| !*((_BYTE *)v66 + 24)|| !v101[6])
  {
    goto LABEL_44;
  }
  if (*((_BYTE *)v62 + 24))
  {
    v9 = *(_QWORD *)(v51[6] + 8);
    v10 = 16;
    do
    {
      v11 = v51[6];
      if (v9 || *(_DWORD *)(v11 + v10) == 3)
      {
        v47[0] = v8;
        v47[1] = 3221225472;
        v47[2] = __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_3;
        v47[3] = &unk_1E0FE3F90;
        v47[4] = &v111;
        v12 = +[MTLLoader deserializeObjectFromAIRNTHeaderAtSection:reader:errorHandler:handler:](MTLLoader, "deserializeObjectFromAIRNTHeaderAtSection:reader:errorHandler:handler:", v11, a4, &__block_literal_global_14, v47);
        if (v9)
          goto LABEL_30;
      }
      else
      {
        v12 = 1;
      }
      if (!v12)
        break;
      v19 = v10 == 208;
      v10 += 24;
    }
    while (!v19);
    goto LABEL_30;
  }
  if (v72[3])
  {
    v14 = v58[3] - 56;
    v15 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, 56, v14);
    if (!v15)
      goto LABEL_44;
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, v15, v14);
    CC_SHA256_Final(md, &c);
    v16 = (uint64_t *)v72[3];
    v18 = *v16;
    v17 = v16[1];
    v19 = *(_QWORD *)md == v18 && v110 == v17;
    if (!v19)
      goto LABEL_44;
    *((_BYTE *)v112 + 88) = 1;
  }
  if (v92[6])
  {
    if ((unint64_t)v92[7] >= 0x20)
    {
      v20 = (_OWORD *)(*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
      if (v20)
      {
        v21 = v112;
        v22 = v20[1];
        *(_OWORD *)(v112 + 7) = *v20;
        *(_OWORD *)(v21 + 9) = v22;
LABEL_30:
        v23 = objc_opt_new();
        v112[16] = v23;
        v24 = objc_opt_new();
        v112[17] = v24;
        v25 = objc_opt_new();
        v26 = v112;
        v112[15] = v25;
        v27 = v88;
        if (*((_DWORD *)v88 + 6))
        {
          v28 = 0;
          v29 = 0;
          do
          {
            v30 = v80[3];
            v31 = (unsigned int *)(v30 + v28);
            if ((*(_BYTE *)(v30 + v28 + 4) & 1) != 0)
            {
              v32 = (void *)v25;
              if ((*(_BYTE *)(v30 + v28 + 4) & 0xE) == 0
                || (*(_BYTE *)(v30 + v28 + 4) & 0xE) == 0xE
                && ((v33 = *(unsigned __int8 *)(v30 + v28 + 5), v32 = (void *)v23, *((_DWORD *)v101 + 16) == v33)
                 || (v32 = (void *)v24, *((_DWORD *)v92 + 16) == v33)))
              {
                v34 = *v31;
                v35 = *((_DWORD *)v84 + 6);
                if (v35 <= v34)
                  goto LABEL_44;
                v36 = strnlen((const char *)(v76[3] + v34), v35 - v34);
                v37 = objc_alloc(MEMORY[0x1E0CB3940]);
                v38 = (void *)objc_msgSend(v37, "initWithBytes:length:encoding:", v76[3] + v34, v36, 4);
                objc_msgSend(v32, "addObject:", v38);

                v27 = v88;
              }
            }
            ++v29;
            v28 += 16;
          }
          while (v29 < *((unsigned int *)v27 + 6));
          v26 = v112;
        }
        v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))(v44 + 16))(v44, v43, v26 + 6, v101[6], v101[7], v58[3]);
        v39 = (id *)v112;
        v40 = v112[6];
        if (v40)
          dispatch_release(v40);

        goto LABEL_45;
      }
    }
  }
LABEL_44:
  v13 = 0;
LABEL_45:
  _Block_object_dispose(&v50, 8);
  v41 = v56;
  v56 = 0;
  if (v41)
    MEMORY[0x186DABFA4](v41, 0x1000C800CE834B2);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v100, 8);
  return v13;
}

size_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke(_QWORD *a1, uint64_t a2, int a3, unsigned int a4)
{
  size_t result;
  int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  int v17;
  unsigned int *v18;
  unsigned int v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _OWORD *v25;
  uint64_t v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  int v40;
  int v41;
  __int128 v42;
  uint64_t v43;
  unsigned int v44;

  result = 0;
  v7 = *(_DWORD *)a2;
  if (*(int *)a2 <= 26)
  {
    if (v7 <= 11)
    {
      if (v7 == 2)
      {
        if (*(_DWORD *)(a2 + 4) == 24)
        {
          *(_DWORD *)(*(_QWORD *)(a1[12] + 8) + 24) = *(_DWORD *)(a2 + 12);
          *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = (*(uint64_t (**)(void))(a1[4] + 16))();
          *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = (*(uint64_t (**)(void))(a1[4] + 16))();
          *(_DWORD *)(*(_QWORD *)(a1[15] + 8) + 24) = *(_DWORD *)(a2 + 20);
          if (*(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24))
          {
            if (*(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24))
              return 1;
          }
        }
      }
      else
      {
        if (v7 != 11)
          return result;
        if (a1[18] == 1 && *(_DWORD *)(a2 + 4) == 80)
          return 1;
      }
      return 0;
    }
    if ((v7 - 12) < 2)
    {
      if (a4 < 0x18)
        return 0;
      result = 0;
      v8 = *(unsigned int *)(a2 + 8);
      if (v8 >= 0x18)
      {
        v9 = *(_DWORD *)(a2 + 4);
        if (v9 > v8)
        {
          v10 = a2 + v8;
          result = strnlen((const char *)(a2 + v8), v9 - v8);
          if (result)
          {
            v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v10, result, 4);
            v12 = *(_QWORD *)(a1[9] + 8);
            if (*(_DWORD *)a2 != 13)
            {
              objc_msgSend(*(id *)(v12 + 112), "addObject:", v11);
              return 1;
            }
            if (!*(_QWORD *)(v12 + 104))
            {
              *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 104) = v11;
              return 1;
            }
            return 0;
          }
        }
      }
      return result;
    }
    if (v7 != 25)
      return result;
    if (a4 < 0x48)
      return 0;
    v19 = *(_DWORD *)(a2 + 64);
    if (80 * (unint64_t)v19 + 72 > a4)
      return 0;
    v20 = (_QWORD *)(a2 + 8);
    v41 = strcmp("__TEXT", (const char *)(a2 + 8));
    v40 = strcmp("__DATA", (const char *)(a2 + 8));
    if (v19)
    {
      v21 = 0;
      v22 = a2 + 72;
      do
      {
        v23 = v22 + 80 * v21;
        v24 = *(_QWORD *)(v23 + 16) == *v20 && *(_QWORD *)(v23 + 24) == *(_QWORD *)(a2 + 16);
        if (v24)
        {
          if (!strcmp((const char *)(v22 + 80 * v21), "__text"))
          {
            v28 = 1;
          }
          else
          {
            v25 = operator new(0x38uLL);
            v26 = 0;
            *v25 = xmmword_1E0FE4178;
            v25[1] = *(_OWORD *)&off_1E0FE4188;
            v25[2] = xmmword_1E0FE4198;
            *((_QWORD *)v25 + 6) = "__object";
            do
            {
              v27 = strncmp((const char *)(v22 + 80 * v21), *(const char **)((char *)v25 + v26), 0x10uLL);
              v28 = v27 == 0;
              if (!v27)
                break;
              v24 = v26 == 48;
              v26 += 8;
            }
            while (!v24);
            operator delete(v25);
          }
          if (!v41 && v28)
          {
            v29 = *(_QWORD *)(a1[5] + 8);
            if (*(_QWORD *)(v29 + 48))
              return 0;
            v30 = v22 + 80 * v21;
            *(_QWORD *)(v29 + 48) = *(unsigned int *)(v30 + 48);
            *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 56) = *(_QWORD *)(v30 + 40);
            *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 64) = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          }
          if (!v40 && !strcmp("__data", (const char *)(v22 + 80 * v21)))
          {
            v31 = *(_QWORD *)(a1[7] + 8);
            if (*(_QWORD *)(v31 + 48))
              return 0;
            v32 = v22 + 80 * v21;
            *(_QWORD *)(v31 + 48) = *(unsigned int *)(v32 + 48);
            *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 56) = *(_QWORD *)(v32 + 40);
            *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 64) = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          }
        }
        ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        ++v21;
      }
      while (v21 < *(unsigned int *)(a2 + 64));
    }
    v33 = *(_QWORD *)(a1[8] + 8);
    v34 = *(_QWORD *)(v33 + 24);
    if (v34 <= *(_QWORD *)(a2 + 48) + *(_QWORD *)(a2 + 40))
      v34 = *(_QWORD *)(a2 + 48) + *(_QWORD *)(a2 + 40);
LABEL_64:
    *(_QWORD *)(v33 + 24) = v34;
    return 1;
  }
  if (v7 > 48)
  {
    if (v7 == 49)
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1[17] + 8) + 48))
      {
        v35 = operator new[]();
        *(_OWORD *)v35 = 0u;
        *(_OWORD *)(v35 + 16) = 0u;
        *(_OWORD *)(v35 + 32) = 0u;
        *(_OWORD *)(v35 + 48) = 0u;
        *(_OWORD *)(v35 + 64) = 0u;
        *(_OWORD *)(v35 + 80) = 0u;
        *(_OWORD *)(v35 + 96) = 0u;
        *(_OWORD *)(v35 + 112) = 0u;
        *(_OWORD *)(v35 + 128) = 0u;
        *(_OWORD *)(v35 + 144) = 0u;
        *(_OWORD *)(v35 + 160) = 0u;
        *(_OWORD *)(v35 + 176) = 0u;
        *(_OWORD *)(v35 + 192) = 0u;
        *(_QWORD *)(v35 + 208) = 0;
        v36 = *(_QWORD *)(a1[17] + 8);
        v37 = *(_QWORD *)(v36 + 48);
        *(_QWORD *)(v36 + 48) = v35;
        if (v37)
          MEMORY[0x186DABFA4](v37, 0x1000C800CE834B2);
      }
      v42 = 0uLL;
      v43 = 0;
      if (+[MTLLoader isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:](MTLLoader, "isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:", a2, &v42, (char *)&v42 + 8, &v43))
      {
        v38 = *(_QWORD *)(*(_QWORD *)(a1[17] + 8) + 48) + 24 * v43;
        v39 = v42;
        *(_QWORD *)(v38 + 16) = v43;
        *(_OWORD *)v38 = v39;
        *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 89) = 1;
      }
      return 1;
    }
    if (v7 != 50)
      return result;
    v14 = *(unsigned int *)(a2 + 4);
    if (v14 < 0x18)
      return 0;
    v44 = 0;
    v15 = *(unsigned int *)(a2 + 20);
    if (8 * v15 + 24 != v14)
      return 0;
    if (!(_DWORD)v15)
    {
      v13 = 0;
LABEL_82:
      *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 96) = v13;
      *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
      return 1;
    }
    v16 = (unsigned int *)(a2 + 28);
    while (1)
    {
      v17 = *(v16 - 1);
      if (v17 == 1026)
        break;
      if (v17 == 1027)
      {
        v18 = &v44;
LABEL_28:
        *v18 = *v16;
      }
      v16 += 2;
      if (!--v15)
      {
        v13 = v44;
        goto LABEL_82;
      }
    }
    v18 = (unsigned int *)&v42;
    goto LABEL_28;
  }
  if (v7 != 27)
  {
    if (v7 != 42)
      return result;
    if (*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
      return 1;
    if (*(_DWORD *)(a2 + 4) == 16 && !*(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24))
    {
      v13 = *(_QWORD *)(a2 + 8);
      goto LABEL_82;
    }
    return 0;
  }
  if (a4 < 0x18)
    return 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
    return 1;
  if (*(_DWORD *)(a2 + 4) != 24)
    return 0;
  result = 0;
  if (!a3)
  {
    v33 = *(_QWORD *)(a1[16] + 8);
    if (!*(_QWORD *)(v33 + 24))
    {
      v34 = a2 + 8;
      goto LABEL_64;
    }
  }
  return result;
}

uint64_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_2()
{
  return 0;
}

uint64_t __67__MTLLoader_deserializeMachOWrapperWithType_payloadHandler_reader___block_invoke_3(uint64_t a1, MTLAirNTObject *this)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = **(uint64_t ***)this;
  v5 = *v3;
  v4 = v3[1];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144) = v5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 152) = v4;
  MTLAirNTObject::~MTLAirNTObject(this);
  MEMORY[0x186DABFBC](this, 0x10D0C40EB84C869);
  return 1;
}

+ (_DWORD)deserializeAIRNTToolsVersionForSlice:(uint64_t)a3 sliceOffset:(uint64_t)a4 version:(uint64_t)a5 reader:
{
  _DWORD *result;
  int v8;
  BOOL v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD v17[5];

  objc_opt_self();
  result = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a5 + 16))(a5, 0, 32);
  if (result)
  {
    if (*result == -17958193
      && ((v8 = result[1], (v8 - 16777235) <= 4) ? (v9 = v8 == 16777238) : (v9 = 1),
          v9 ? (v10 = v8 == -1) : (v10 = 1),
          v10
       && ((v11 = result[3], v12 = v11 > 0xE, v13 = (1 << v11) & 0x6144, !v12) ? (v14 = v13 == 0) : (v14 = 1), !v14)))
    {
      v15 = result[4];
      v16 = result[5];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__MTLLoader_deserializeAIRNTToolsVersionForSlice_sliceOffset_version_reader___block_invoke;
      v17[3] = &__block_descriptor_40_e32_B24__0r__load_command_II_8I16I20l;
      v17[4] = a4;
      return (_DWORD *)+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a5, v15, v16, (uint64_t)v17);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __77__MTLLoader_deserializeAIRNTToolsVersionForSlice_sliceOffset_version_reader___block_invoke(uint64_t a1, int32x2_t *a2)
{
  uint64_t v2;
  int32x2_t *v3;
  uint64_t v4;
  int32x2_t *v5;
  int32x2_t *v6;
  __int32 *i;
  int v8;
  int32x2_t *v9;

  if (a2->i32[0] != 50)
    return 1;
  v2 = a2->u32[1];
  if (v2 >= 0x18)
  {
    v3 = *(int32x2_t **)(a1 + 32);
    *v3 = vrev64_s32(a2[1]);
    v4 = a2[2].u32[1];
    v3[1].i32[0] = a2[2].i32[0];
    if (8 * v4 + 24 == v2)
    {
      if ((_DWORD)v4)
      {
        v5 = v3 + 2;
        v6 = (int32x2_t *)((char *)v3 + 12);
        for (i = (__int32 *)&a2[3] + 1; ; i += 2)
        {
          v8 = *(i - 1);
          v9 = v6;
          if (v8 == 1026)
            goto LABEL_9;
          if (v8 == 1027)
            break;
LABEL_10:
          if (!--v4)
            return 1;
        }
        v9 = v5;
LABEL_9:
        v9->i32[0] = *i;
        goto LABEL_10;
      }
      return 1;
    }
  }
  return 0;
}

+ (uint64_t)deserializeMachOContainerWithHandlerInternal:(int)a3 expectAIRNTFormat:(uint64_t)a4 objectHandler:(uint64_t)a5 pipelineHandler:(uint64_t)a6 errorHandler:(uint64_t)a7 reader:
{
  _DWORD *v13;
  uint64_t v14;
  BOOL v15;
  int v17;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BOOL4 v32;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  BOOL v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  _OWORD *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  unsigned int *v55;
  unsigned int *v56;
  uint64_t v57;
  uint64_t *v58;
  unint64_t v59;
  unint64_t v60;
  const char *v61;
  unsigned int v62;
  size_t v63;
  unsigned int v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  char v72;
  int v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  int v82;
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  int v86;
  int v87;
  _QWORD v88[16];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  _QWORD v101[3];
  int v102;
  _QWORD v103[10];
  int v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  uint64_t (*v109)(uint64_t);
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[3];
  char v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  __n128 (*v121)(__n128 *, __n128 *);
  uint64_t (*v122)();
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  __n128 (*v130)(__n128 *, __n128 *);
  uint64_t (*v131)();
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  __n128 (*v143)(__n128 *, __n128 *);
  uint64_t (*v144)();
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  _BYTE v149[32];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v13 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a7 + 16))(a7, 0, 32);
  if (!v13 || *v13 != -17958193)
    goto LABEL_56;
  v14 = v13[1];
  v15 = (v14 - 16777235) > 4 || (_DWORD)v14 == 16777238;
  if (v15 && (_DWORD)v14 != -1)
    goto LABEL_56;
  v17 = v13[3];
  v78 = v13[2];
  if (v17 != 2 && v17 != 8)
  {
    if (v17 != 13)
    {
LABEL_56:
      LOBYTE(a3) = 0;
      return a3 & 1;
    }
    if (!a3)
      return a3 & 1;
  }
  v19 = v13[4];
  v20 = v13[5];
  v140 = 0;
  v141 = &v140;
  v142 = 0x4812000000;
  v143 = __Block_byref_object_copy__52;
  v144 = __Block_byref_object_dispose__53;
  v145 = &unk_182827312;
  v146 = 0;
  v147 = 0;
  v148 = 0;
  v136 = 0;
  v137 = &v136;
  v138 = 0x2020000000;
  v139 = 0;
  v127 = 0;
  v128 = &v127;
  v129 = 0x4812000000;
  v130 = __Block_byref_object_copy__52;
  v131 = __Block_byref_object_dispose__53;
  v132 = &unk_182827312;
  v133 = 0;
  v135 = 0;
  v134 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x4812000000;
  v121 = __Block_byref_object_copy__52;
  v122 = __Block_byref_object_dispose__53;
  v123 = &unk_182827312;
  v124 = 0;
  v126 = 0;
  v125 = 0;
  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x2020000000;
  v113 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3812000000;
  v108 = __Block_byref_object_copy__49;
  v109 = __Block_byref_object_dispose__50;
  v111 = 0;
  v110 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x5812000000;
  v103[3] = __Block_byref_object_copy__71;
  v103[4] = __Block_byref_object_dispose__72;
  memset(&v103[5], 0, 40);
  v104 = 1065353216;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x2020000000;
  v102 = 1;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = v20 + 32;
  v21 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke;
  v88[3] = &unk_1E0FE3FD8;
  v88[4] = v101;
  v88[5] = v103;
  v88[6] = &v140;
  v88[7] = &v136;
  v88[8] = &v89;
  v88[9] = &v105;
  v88[10] = v112;
  v88[11] = &v97;
  v88[12] = &v93;
  v88[13] = &v114;
  v88[14] = &v127;
  v88[15] = &v118;
  if ((+[MTLLoader readLoadCommands:ncmds:sizeofcmds:handler:]((uint64_t)MTLLoader, a7, v19, v20, (uint64_t)v88) & 1) == 0)goto LABEL_128;
  if (a3)
  {
    v76 = a2;
    v22 = 0;
    a3 = 1;
    v23 = *(_QWORD *)(v106[6] + 8);
    while (1)
    {
      v24 = (uint64_t *)v106[6];
      if (v23)
      {
        if ((a3 & 1) == 0)
          goto LABEL_128;
        v25 = v24 + 1;
      }
      else
      {
        v26 = v24[v22 + 2];
        v27 = (v26 != 6) & a3;
        if (v26 != 6 || ((a3 ^ 1) & 1) != 0)
          goto LABEL_29;
        v25 = &v24[v22 + 1];
        v24 = (uint64_t *)((char *)v24 + v22 * 8);
      }
      v28 = *v24;
      v29 = *v25;
      v85[0] = v21;
      v85[1] = 3221225472;
      v85[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_2;
      v85[3] = &unk_1E0FE4000;
      v85[4] = v76;
      v86 = v14;
      v87 = v78;
      v27 = +[MTLLoader deserializeHashesFromAIRNTHeaderAtOffset:headerSize:singleHeaderExpected:reader:errorHandler:handler:](MTLLoader, "deserializeHashesFromAIRNTHeaderAtOffset:headerSize:singleHeaderExpected:reader:errorHandler:handler:", v28, v29, v23 != 0, a7, a6, v85);
      if (v23)
      {
        if (!v27)
          goto LABEL_128;
        v24 = (uint64_t *)v106[6];
        goto LABEL_36;
      }
      v24 = (uint64_t *)v106[6];
      v26 = v24[v22 + 2];
LABEL_29:
      if (v26 == 3)
        v30 = 0;
      else
        v30 = v27;
      if (v26 != 3 || v27 == 0)
        goto LABEL_40;
LABEL_36:
      v84[0] = v21;
      v84[1] = 3221225472;
      v84[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_3;
      v84[3] = &unk_1E0FE4028;
      v84[4] = a4;
      v32 = +[MTLLoader deserializeObjectFromAIRNTHeaderAtSection:reader:errorHandler:handler:](MTLLoader, "deserializeObjectFromAIRNTHeaderAtSection:reader:errorHandler:handler:", v24, a7, a6, v84);
      v30 = v32;
      if (!v23)
      {
        v24 = (uint64_t *)v106[6];
        v26 = v24[v22 + 2];
LABEL_40:
        if (v26 == 5)
          a3 = 0;
        else
          a3 = v30;
        if (v26 != 5 || v30 == 0)
          goto LABEL_48;
        goto LABEL_47;
      }
      if (!v32)
        goto LABEL_128;
      v24 = (uint64_t *)v106[6];
LABEL_47:
      v34 = &v24[v22];
      v35 = v24[v22];
      v36 = v34[1];
      v83[0] = v21;
      v83[1] = 3221225472;
      v83[2] = __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_4;
      v83[3] = &unk_1E0FE4050;
      v83[4] = a5;
      a3 = +[MTLLoader deserializePipelinesFromAIRNTHeaderAtOffset:headerSize:singleHeaderExpected:reader:errorHandler:handler:](MTLLoader, "deserializePipelinesFromAIRNTHeaderAtOffset:headerSize:singleHeaderExpected:reader:errorHandler:handler:", v35, v36, v23 != 0, a7, a6, v83);
LABEL_48:
      if (!v23)
      {
        if (a3)
        {
          v15 = v22 == 24;
          v22 += 3;
          if (!v15)
            continue;
        }
      }
      goto LABEL_129;
    }
  }
  v82 = 1027;
  if (v17 != 2 || !*((_BYTE *)v98 + 24))
  {
    if (v141[6])
    {
      if (v128[6])
        v39 = v128[7] != 0;
      else
        v39 = 0;
      if (v119[6])
        v40 = v119[7] != 0;
      else
        v40 = 0;
      if ((_DWORD)v14 != -1)
        v39 = 1;
      if (!v39 && !v40)
      {
        v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int *, _QWORD))(a2 + 16))(a2, (v78 << 32) | 0xFFFFFFFFLL, v94[3], 1, &+[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]::dummy, &v82, 0);
        goto LABEL_73;
      }
      if (*((_BYTE *)v98 + 24))
      {
        v41 = *((unsigned int *)v115 + 6);
        if ((_DWORD)v41)
        {
          v79 = 0;
          v80 = 0;
          v81 = 0;
          std::vector<nlist_64>::reserve((void **)&v79, v41);
          v42 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a7 + 16))(a7, v128[6], v128[7]);
          if (!v42)
            goto LABEL_132;
          v77 = a2;
          if (*((_DWORD *)v115 + 6))
          {
            v43 = 0;
            v44 = v80;
            do
            {
              v45 = (_OWORD *)(v42 + 16 * v43);
              if (v44 >= v81)
              {
                v46 = (v44 - v79) >> 4;
                if ((unint64_t)(v46 + 1) >> 60)
                  std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                v47 = (v81 - v79) >> 3;
                if (v47 <= v46 + 1)
                  v47 = v46 + 1;
                if ((unint64_t)(v81 - v79) >= 0x7FFFFFFFFFFFFFF0)
                  v48 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v48 = v47;
                if (v48)
                  v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)&v81, v48);
                else
                  v49 = 0;
                v50 = &v49[16 * v46];
                *(_OWORD *)v50 = *v45;
                v52 = v79;
                v51 = v80;
                v53 = v50;
                if (v80 != v79)
                {
                  do
                  {
                    *((_OWORD *)v53 - 1) = *((_OWORD *)v51 - 1);
                    v53 -= 16;
                    v51 -= 16;
                  }
                  while (v51 != v52);
                  v51 = v79;
                }
                v44 = v50 + 16;
                v79 = v53;
                v80 = v50 + 16;
                v81 = &v49[16 * v48];
                if (v51)
                  operator delete(v51);
              }
              else
              {
                *(_OWORD *)v44 = *v45;
                v44 += 16;
              }
              v80 = v44;
              ++v43;
            }
            while (v43 < *((unsigned int *)v115 + 6));
          }
          v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a7 + 16))(a7, v119[6], v119[7]);
          if (v54)
          {
            v56 = (unsigned int *)v79;
            v55 = (unsigned int *)v80;
            LOBYTE(a3) = 1;
            if (v79 != v80)
            {
              v57 = v14 | (v78 << 32);
              while (1)
              {
                if ((~*((unsigned __int8 *)v56 + 4) & 0xE) == 0)
                {
                  v58 = v141;
                  if (*((_DWORD *)v141 + 16) == *((unsigned __int8 *)v56 + 5))
                  {
                    v59 = *v56;
                    v60 = v119[7];
                    if (v60 <= v59)
                      goto LABEL_132;
                    v61 = (const char *)(v54 + v59);
                    v62 = v60 - v59;
                    v63 = v62 >= 0x41 ? 65 : v62;
                    v64 = strnlen(v61, v63);
                    if ((v64 & 1) != 0)
                      goto LABEL_132;
                    v65 = v64 >> 1;
                    if (v64 < 2)
                      goto LABEL_107;
                    v67 = 0;
                    v68 = v65 <= 1 ? 1 : v64 >> 1;
                    do
                    {
                      v69 = 0;
                      v70 = 0;
                      v71 = 1;
                      do
                      {
                        v72 = v71;
                        v73 = v61[v69];
                        v74 = v73 - 48;
                        if ((v73 - 48) >= 0xA)
                        {
                          if ((v73 - 65) > 5)
                          {
                            if ((v73 - 97) > 5)
                              goto LABEL_132;
                            v74 = v73 - 87;
                          }
                          else
                          {
                            v74 = v73 - 55;
                          }
                        }
                        v71 = 0;
                        v70 = v74 + 16 * v70;
                        ++v69;
                      }
                      while ((v72 & 1) != 0);
                      v149[v67++] = v70;
                      v61 += 2;
                    }
                    while (v67 != v68);
                    if (v64 <= 0x3F)
                    {
LABEL_107:
                      v66 = 31 - v65;
                      if (v65 > 0x1F)
                        v66 = 0;
                      bzero(&v149[v65], v66 + 1);
                    }
                    if ((a3 & 1) != 0)
                      LOBYTE(a3) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, int *, unint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v77 + 16))(v77, v57, v94[3], 1, v149, &v82, v65, *((_QWORD *)v56 + 1) - v137[3] + v58[6], 0, 0, 0);
                    else
                      LOBYTE(a3) = 0;
                  }
                }
                v56 += 4;
                if (v56 == v55)
                  goto LABEL_133;
              }
            }
          }
          else
          {
LABEL_132:
            LOBYTE(a3) = 0;
LABEL_133:
            v56 = (unsigned int *)v79;
          }
          if (v56)
          {
            v80 = (char *)v56;
            operator delete(v56);
          }
          goto LABEL_129;
        }
      }
    }
LABEL_128:
    LOBYTE(a3) = 0;
    goto LABEL_129;
  }
  v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, v14 | (v78 << 32), v94[3], 1, &+[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]::dummy, &v82, 0, 0, v90[3], 0, 0);
LABEL_73:
  LOBYTE(a3) = v38;
LABEL_129:
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v103[6]);
  _Block_object_dispose(&v105, 8);
  v75 = v111;
  v111 = 0;
  if (v75)
    MEMORY[0x186DABFA4](v75, 0x1000C800CE834B2);
  _Block_object_dispose(v112, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v140, 8);
  return a3 & 1;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *i;
  int v10;
  uint64_t **v11;
  unsigned int v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  _OWORD *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  int v38;
  int v39;
  __int128 v40;
  uint64_t v41;
  __int128 *v42;

  v6 = *(_DWORD *)a2;
  if (*(int *)a2 <= 41)
  {
    if (v6 == 2)
    {
      if (*(_DWORD *)(a2 + 4) != 24)
        return 0;
      *(_DWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = *(_DWORD *)(a2 + 12);
      *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 48) = *(unsigned int *)(a2 + 8);
      *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 56) = 16 * *(unsigned int *)(*(_QWORD *)(a1[13] + 8) + 24);
      if (*(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 56) + *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 48) > *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
        return 0;
      *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 48) = *(unsigned int *)(a2 + 16);
      *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 56) = *(unsigned int *)(a2 + 20);
      if (*(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 56) + *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 48) > *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
        return 0;
    }
    else if (v6 == 25)
    {
      if (a4 < 0x48)
        return 0;
      v12 = *(_DWORD *)(a2 + 64);
      if (80 * (unint64_t)v12 + 72 > a4)
        return 0;
      v13 = (_QWORD *)(a2 + 8);
      v39 = strcmp("__DATA", (const char *)(a2 + 8));
      v38 = strcmp("__TEXT", (const char *)(a2 + 8));
      if (v12)
      {
        v14 = 0;
        v15 = a2 + 72;
        do
        {
          v16 = v15 + 80 * v14;
          v17 = *(_QWORD *)(v16 + 16) == *v13 && *(_QWORD *)(v16 + 24) == *(_QWORD *)(a2 + 16);
          if (v17)
          {
            v18 = operator new(0x38uLL);
            v19 = 0;
            *v18 = xmmword_1E0FE4178;
            v18[1] = *(_OWORD *)&off_1E0FE4188;
            v18[2] = xmmword_1E0FE4198;
            *((_QWORD *)v18 + 6) = "__object";
            do
            {
              v20 = strncmp((const char *)v16, *(const char **)((char *)v18 + v19), 0x10uLL);
              if (!v20)
                break;
              v17 = v19 == 48;
              v19 += 8;
            }
            while (!v17);
            operator delete(v18);
            if (!(v20 | v38))
            {
              v21 = v15 + 80 * v14;
              v22 = *(unsigned int *)(v21 + 48);
              v23 = *(_QWORD *)(v21 + 40);
              *(_QWORD *)&v40 = v22;
              *((_QWORD *)&v40 + 1) = v23;
              v41 = 0;
              v24 = a1[5];
              LODWORD(v41) = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
              v25 = *(_QWORD *)(v24 + 8) + 48;
              v42 = &v40;
              v26 = std::__hash_table<std::__hash_value_type<unsigned long long,SectionData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SectionData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SectionData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SectionData>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v25, (unint64_t *)&v40, (uint64_t)&std::piecewise_construct, (uint64_t **)&v42);
              *(_OWORD *)(v26 + 3) = v40;
              v26[5] = v41;
            }
            if (!v39 && !strcmp("__data", (const char *)v16))
            {
              v27 = *(_QWORD *)(a1[6] + 8);
              if (*(_QWORD *)(v27 + 48))
                return 0;
              v28 = v15 + 80 * v14;
              *(_QWORD *)(v27 + 48) = *(unsigned int *)(v28 + 48);
              *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(v28 + 32);
              *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 56) = *(_QWORD *)(v28 + 40);
              *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 64) = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
            }
          }
          ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
          ++v14;
        }
        while (v14 < *(unsigned int *)(a2 + 64));
      }
      v29 = *(_QWORD *)(a1[8] + 8);
      v30 = *(_QWORD *)(v29 + 24);
      if (v30 <= *(_QWORD *)(a2 + 48) + *(_QWORD *)(a2 + 40))
        v30 = *(_QWORD *)(a2 + 48) + *(_QWORD *)(a2 + 40);
      *(_QWORD *)(v29 + 24) = v30;
    }
    return 1;
  }
  if (v6 == 42)
  {
    if (*(_DWORD *)(a2 + 4) != 16 || *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
      return 0;
    *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 24) = *(_QWORD *)(a2 + 8);
    v31 = a1[11];
LABEL_49:
    *(_BYTE *)(*(_QWORD *)(v31 + 8) + 24) = 1;
    return 1;
  }
  if (v6 == 49)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 48))
    {
      v32 = operator new[]();
      *(_OWORD *)v32 = 0u;
      *(_OWORD *)(v32 + 16) = 0u;
      *(_OWORD *)(v32 + 32) = 0u;
      *(_OWORD *)(v32 + 48) = 0u;
      *(_OWORD *)(v32 + 64) = 0u;
      *(_OWORD *)(v32 + 80) = 0u;
      *(_OWORD *)(v32 + 96) = 0u;
      *(_OWORD *)(v32 + 112) = 0u;
      *(_OWORD *)(v32 + 128) = 0u;
      *(_OWORD *)(v32 + 144) = 0u;
      *(_OWORD *)(v32 + 160) = 0u;
      *(_OWORD *)(v32 + 176) = 0u;
      *(_OWORD *)(v32 + 192) = 0u;
      *(_QWORD *)(v32 + 208) = 0;
      v33 = *(_QWORD *)(a1[9] + 8);
      v34 = *(_QWORD *)(v33 + 48);
      *(_QWORD *)(v33 + 48) = v32;
      if (v34)
        MEMORY[0x186DABFA4](v34, 0x1000C800CE834B2);
    }
    v40 = 0uLL;
    v41 = 0;
    if (!+[MTLLoader isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:](MTLLoader, "isAIRHeaderExtLoadCommand:headerOffset:headerSize:headerSection:", a2, &v40, (char *)&v40 + 8, &v41))return 1;
    v35 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 48) + 24 * v41;
    v36 = v40;
    *(_QWORD *)(v35 + 16) = v41;
    *(_OWORD *)v35 = v36;
    v31 = a1[10];
    goto LABEL_49;
  }
  if (v6 != 50)
    return 1;
  v7 = *(unsigned int *)(a2 + 4);
  if (v7 >= 0x18)
  {
    v8 = *(unsigned int *)(a2 + 20);
    if (8 * v8 + 24 == v7)
    {
      if ((_DWORD)v8)
      {
        for (i = (_DWORD *)(a2 + 28); ; i += 2)
        {
          v10 = *(i - 1);
          if (v10 == 1026)
            break;
          if (v10 == 1027)
          {
            v11 = (uint64_t **)&v42;
LABEL_13:
            *(_DWORD *)v11 = *i;
          }
          if (!--v8)
            return 1;
        }
        v11 = (uint64_t **)&v40;
        goto LABEL_13;
      }
      return 1;
    }
  }
  return 0;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, a4, a2, a3, 32, a5, a6, a7, a8);
  else
    return 0;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __126__MTLLoader_deserializeMachOContainerWithHandlerInternal_expectAIRNTFormat_objectHandler_pipelineHandler_errorHandler_reader___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (uint64_t)deserializeMachOContainerWithHandler:(uint64_t)a3 reader:
{
  _QWORD v6[5];

  objc_opt_self();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke;
  v6[3] = &unk_1E0FE4078;
  v6[4] = a2;
  return +[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v6, 0, 0, 0, (uint64_t)&__block_literal_global_76, a3);
}

uint64_t __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 <= 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return 0;
}

uint64_t __57__MTLLoader_deserializeMachOContainerWithHandler_reader___block_invoke_2()
{
  return 0;
}

+ (uint64_t)deserializeAirntMachOContainerWithHandler:(uint64_t)a3 objectHandler:(uint64_t)a4 pipelineHandler:(uint64_t)a5 errorHandler:(uint64_t)a6 reader:
{
  _QWORD v12[5];

  objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__MTLLoader_deserializeAirntMachOContainerWithHandler_objectHandler_pipelineHandler_errorHandler_reader___block_invoke;
  v12[3] = &unk_1E0FE4078;
  v12[4] = a2;
  return +[MTLLoader deserializeMachOContainerWithHandlerInternal:expectAIRNTFormat:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v12, 1, a3, a4, a5, a6);
}

uint64_t __105__MTLLoader_deserializeAirntMachOContainerWithHandler_objectHandler_pipelineHandler_errorHandler_reader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  if (a7 == 32)
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  else
    return 0;
}

+ (uint64_t)deserializeUniversalBinaryHeaderWithHandler:(uint64_t)a3 reader:(uint64_t)a4 bytes:
{
  uint64_t result;
  int *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int i;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;

  objc_opt_self();
  result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, 0, 8);
  if (!result)
    return result;
  v8 = (int *)result;
  result = 0;
  v9 = *v8;
  if (*v8 > -17958194)
  {
    if (v9 == -17958193)
    {
      v16 = *(_QWORD *)((*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, 0, 28) + 4);
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, v16, 0, a4);
    }
    if (v9 != 1112298573)
      return result;
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, 16777239, 0, a4);
    return 1;
  }
  v10 = v8[1];
  v11 = bswap32(v10);
  if ((v9 + 1095041334) < 2)
  {
    if (v10)
    {
      for (i = 8; ; i += 20)
      {
        result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, i, 20);
        if (!result)
          break;
        v13 = *(_DWORD *)(result + 12);
        if (!v13)
          return 0;
        (*(void (**)(uint64_t, unint64_t, _QWORD, _QWORD))(a2 + 16))(a2, bswap64(*(unsigned int *)(result + 4) | ((unint64_t)*(unsigned int *)result << 32)), bswap32(*(_DWORD *)(result + 8)), bswap32(v13));
        if (!--v11)
          return 1;
      }
      return result;
    }
    return 1;
  }
  if (v9 != -1078264118)
    return result;
  if (!v10)
    return 1;
  v14 = 8;
  do
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, v14, 32);
    if (!result)
      break;
    v15 = *(_QWORD *)(result + 16);
    if (!v15)
      return 0;
    (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(a2 + 16))(a2, bswap64(*(unsigned int *)(result + 4) | ((unint64_t)*(unsigned int *)result << 32)), bswap64(*(_QWORD *)(result + 8)), bswap64(v15));
    v14 += 32;
    result = 1;
    --v11;
  }
  while (v11);
  return result;
}

+ (uint64_t)serializeMachOWrapperWithType:(uint64_t)a3 slice:(uint64_t)a4 payload:(_QWORD *)a5 writer:
{
  void *v8;
  unsigned int v9;
  char *v10;
  unint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  char *v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int v26;
  int v27;
  int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  int v34;
  int v35;
  int v36;
  char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  int v43;
  int v44;
  int v45;
  char *v46;
  uint64_t v47;
  size_t size;
  int v49;
  int v50;
  int v51;
  uint64_t *p_src;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  size_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int v62;
  int v63;
  int v64;
  size_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  int v72;
  _QWORD *v73;
  NSObject *v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v80;
  int v81;
  void *obj;
  void *obja;
  uint64_t objb;
  _QWORD applier[5];
  _QWORD v86[2];
  _QWORD v87[3];
  std::vector<char>::value_type __x[8];
  std::vector<char>::value_type *v89;
  uint64_t v90;
  __n128 (*v91)(uint64_t, uint64_t);
  uint64_t (*v92)();
  void *v93;
  CC_SHA256_CTX v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE *v107;
  void *__dst;
  _BYTE *v109;
  void *__p;
  void *v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  std::vector<char> v117;
  __int128 md;
  uint64_t __src;
  __int128 v120;
  _QWORD v121[4];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  int64_t v125;
  size_t v126;
  int v127;
  __int128 v128;
  __int128 v129;
  int v130;
  __int128 v131;
  uint64_t v132;
  size_t v133;
  size_t v134;
  size_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  char *v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  int v156;
  int v157;
  int v158;
  uint64_t v159;
  __int128 v160;
  int v161;
  int v162;
  uint64_t v163;
  __int128 v164;
  __int128 v165;
  uint64_t v166;
  _DWORD v167[7];
  uint64_t v168;
  int v169;
  __int128 v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  memset(&v117, 0, sizeof(v117));
  if (a2 == 1)
  {
    v8 = *(void **)(a4 + 56);
    v9 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);
    LODWORD(__src) = 13;
    HIDWORD(__src) = (v9 & 0xFFFFFFF8) + 32;
    v120 = xmmword_182819F60;
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, (char *)&__src, (char *)v121, 24);
    v10 = (char *)objc_msgSend(v8, "UTF8String");
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, v10, &v10[v9], v9);
    v11 = (LODWORD(v117.__end_) - LODWORD(v117.__begin_) + 8) & 0xFFFFFFF8;
    __x[0] = 0;
    if (v11 <= v117.__end_ - v117.__begin_)
    {
      if (v11 < v117.__end_ - v117.__begin_)
        v117.__end_ = &v117.__begin_[v11];
    }
    else
    {
      std::vector<char>::__append(&v117, v11 - (v117.__end_ - v117.__begin_), __x);
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v13 = *(void **)(a4 + 64);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v174, 16);
  v81 = v12;
  v77 = a3;
  v80 = a4;
  if (v14)
  {
    v15 = *(_QWORD *)v114;
    do
    {
      v16 = 0;
      v81 += v14;
      do
      {
        if (*(_QWORD *)v114 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v16);
        v18 = objc_msgSend(v17, "lengthOfBytesUsingEncoding:", 4);
        LODWORD(__src) = 12;
        HIDWORD(__src) = (v18 & 0xFFFFFFF8) + 32;
        v120 = xmmword_182819F60;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, (char *)&__src, (char *)v121, 24);
        v19 = (char *)objc_msgSend(v17, "UTF8String");
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v117, v117.__end_, v19, &v19[v18], v18);
        v20 = (LODWORD(v117.__end_) - LODWORD(v117.__begin_) + 8) & 0xFFFFFFF8;
        __x[0] = 0;
        if (v20 <= v117.__end_ - v117.__begin_)
        {
          if (v20 < v117.__end_ - v117.__begin_)
            v117.__end_ = &v117.__begin_[v20];
        }
        else
        {
          std::vector<char>::__append(&v117, v20 - (v117.__end_ - v117.__begin_), __x);
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v174, 16);
    }
    while (v14);
  }
  v111 = 0;
  __p = 0;
  v112 = 0;
  v107 = 0;
  __dst = 0;
  v109 = 0;
  v21 = operator new(1uLL);
  v78 = a2;
  *v21 = 32;
  __dst = v21 + 1;
  v109 = v21 + 1;
  v107 = v21;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = *(void **)(v80 + 80);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v173, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v104 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        v26 = objc_msgSend(v25, "lengthOfBytesUsingEncoding:", 4);
        v27 = (int)__dst;
        v28 = (int)v107;
        v29 = (char *)objc_msgSend(v25, "UTF8String");
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v29, &v29[v26 + 1], (v26 + 1));
        LODWORD(__src) = v27 - v28;
        HIDWORD(__src) = 1179919;
        *(_QWORD *)&v120 = 0x100000000;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v173, 16);
    }
    while (v22);
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obja = *(void **)(v80 + 88);
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v172, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v100 != v31)
          objc_enumerationMutation(obja);
        v33 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
        v34 = objc_msgSend(v33, "lengthOfBytesUsingEncoding:", 4);
        v35 = (int)__dst;
        v36 = (int)v107;
        v37 = (char *)objc_msgSend(v33, "UTF8String");
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v37, &v37[v34 + 1], (v34 + 1));
        LODWORD(__src) = v35 - v36;
        HIDWORD(__src) = 1180175;
        *(_QWORD *)&v120 = 0x200000000;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v172, 16);
    }
    while (v30);
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v38 = *(void **)(v80 + 72);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v171, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v96;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v96 != v40)
          objc_enumerationMutation(v38);
        v42 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
        v43 = objc_msgSend(v42, "lengthOfBytesUsingEncoding:", 4);
        v44 = (int)__dst;
        v45 = (int)v107;
        v46 = (char *)objc_msgSend(v42, "UTF8String");
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v107, (char *)__dst, v46, &v46[v43 + 1], (v43 + 1));
        LODWORD(__src) = v44 - v45;
        HIDWORD(__src) = 1;
        *(_QWORD *)&v120 = 0;
        std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&__p, (char *)v111, (char *)&__src, (char *)&v120 + 8, 16);
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v171, 16);
    }
    while (v39);
  }
  v47 = v80;
  size = dispatch_data_get_size(*(dispatch_data_t *)v80);
  v49 = objc_msgSend(*(id *)(v80 + 80), "count");
  v50 = objc_msgSend(*(id *)(v80 + 88), "count");
  v51 = objc_msgSend(*(id *)(v80 + 72), "count");
  p_src = &__src;
  v53 = *(unsigned __int8 *)(v80 + 40);
  v54 = 552;
  if (!*(_BYTE *)(v80 + 40))
    v54 = 528;
  v55 = -80;
  if (v78 == 1)
    v55 = 0;
  objb = v54 + v55;
  v56 = v117.__end_ - v117.__begin_ + v54 + v55;
  v57 = v56 + size;
  v58 = ((_DWORD)v56 + (_DWORD)size + 39) & 0xFFFFFFF8;
  v59 = v107;
  if ((unint64_t)(v58 + (_BYTE *)v111 - (_BYTE *)__p + (_BYTE *)__dst - v107) >> 32)
  {
    v60 = 0;
    if (!v107)
      goto LABEL_47;
    goto LABEL_46;
  }
  v167[0] = -17958193;
  v167[1] = v77;
  if (v78 == 1)
    v62 = 6;
  else
    v62 = 1;
  if (v78 == 1)
    v63 = 6;
  else
    v63 = 5;
  if (v78 == 1)
    v64 = 1048580;
  else
    v64 = 260;
  if (!v78)
    v62 = 2;
  v167[2] = HIDWORD(v77);
  v167[3] = v62;
  v167[4] = v63 + v81 + v53;
  v167[5] = v56 - 32;
  v167[6] = v64;
  v168 = 0x1B00000000;
  v169 = 24;
  v170 = 0uLL;
  __src = 0x9800000019;
  v120 = *(_OWORD *)"__TEXT";
  v121[0] = 0x100000000;
  v121[1] = v56 + size;
  v121[2] = 0;
  v121[3] = v56 + size;
  v122 = xmmword_182819F70;
  v123 = *(_OWORD *)"__text";
  v124 = *(_OWORD *)"__TEXT";
  v125 = v56 + 0x100000000;
  v126 = size;
  v128 = xmmword_182819F80;
  v129 = xmmword_182819F90;
  v127 = v56;
  v130 = 152;
  v131 = *(_OWORD *)"__DATA";
  v65 = v58 - v57;
  v132 = 0x200000000;
  v133 = v58 - v57;
  v134 = v56 + size;
  v135 = v58 - v57;
  v136 = xmmword_182819FA0;
  v137 = *(_OWORD *)"__data";
  v138 = *(_OWORD *)"__DATA";
  v139 = xmmword_182819FB0;
  v140 = v56 + size;
  v142 = 0;
  v141 = 0;
  v143 = 0;
  v144 = 0;
  v145 = 0x4800000019;
  v146 = *(_OWORD *)"__LINKEDIT";
  v147 = 0x300000000;
  v148 = (char *)((_BYTE *)v111 - (_BYTE *)__p + (_BYTE *)__dst - v107);
  v149 = ((_DWORD)v56 + (_DWORD)size + 39) & 0xFFFFFFF8;
  v150 = v148;
  v151 = xmmword_182819FC0;
  v152 = 0x100000002ALL;
  v153 = *(_QWORD *)(v80 + 48);
  v154 = 0x1800000002;
  v155 = (v56 + size + 39) & 0xFFFFFFF8;
  v156 = v51 + v50 + v49;
  v157 = v58 + (_DWORD)v111 - (_DWORD)__p;
  v158 = (_DWORD)__dst - (_DWORD)v107;
  v165 = 0u;
  v164 = 0u;
  v163 = 0;
  v160 = 0u;
  v166 = 0;
  v159 = 0x500000000BLL;
  HIDWORD(v160) = v50 + v49;
  v161 = v50 + v49;
  v162 = v51;
  *(_QWORD *)__x = 0;
  v89 = __x;
  v90 = 0x9812000000;
  v91 = __Block_byref_object_copy__82;
  v92 = __Block_byref_object_dispose__83;
  v93 = &unk_182827312;
  if (v53)
    CC_SHA256_Init(&v94);
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v87[0] = __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke;
  v87[1] = &unk_1E0FE40C0;
  v66 = v65 - 32;
  v67 = 1;
  v87[2] = __x;
  LOBYTE(v60) = 1;
  while (1)
  {
    while (1)
    {
      v68 = v67;
      if ((v67 & 1) == 0)
        break;
      v67 = 0;
      if (*(_BYTE *)(v47 + 40))
      {
        v69 = 0;
        v70 = -56;
        v71 = v86;
        if ((v60 & 1) == 0)
          goto LABEL_69;
        goto LABEL_77;
      }
    }
    if (*(_BYTE *)(v47 + 40))
      v69 = 56;
    else
      v69 = 32;
    if (*(_BYTE *)(v47 + 40))
      v70 = -56;
    else
      v70 = -32;
    v71 = a5;
    if ((v60 & 1) == 0)
    {
LABEL_69:
      v72 = 0;
      goto LABEL_87;
    }
LABEL_77:
    if ((v68 & 1) != 0)
      v73 = v87;
    else
      v73 = a5 + 2;
    v72 = ((uint64_t (*)(_QWORD *, _DWORD *, uint64_t, uint64_t *))*v73)(v71, v167, v69, p_src);
    if (v72)
    {
      v72 = ((uint64_t (*)(_QWORD *, uint64_t *, uint64_t))*v73)(v71, &__src, v70 + objb);
      if (v72)
      {
        v72 = ((uint64_t (*)(_QWORD *, std::vector<char>::pointer, _QWORD))*v73)(v71, v117.__begin_, (LODWORD(v117.__end_) - LODWORD(v117.__begin_)));
        if (v72)
        {
          v47 = v80;
          v74 = *(NSObject **)v80;
          applier[0] = MEMORY[0x1E0C809B0];
          applier[1] = 3221225472;
          applier[2] = __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke_2;
          applier[3] = &unk_1E0FE40E8;
          applier[4] = v71;
          v72 = dispatch_data_apply(v74, applier);
          if (v72)
            v72 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))*v73)(v71, v80 + 8, 32);
          if (!v66)
            goto LABEL_93;
          goto LABEL_88;
        }
      }
    }
LABEL_87:
    v47 = v80;
    if (!v66)
      goto LABEL_93;
LABEL_88:
    if (!v72)
      break;
    v75 = (v68 & 1) != 0 ? v87 : a5 + 2;
    v72 = ((uint64_t (*)(_QWORD *, void *, uint64_t))*v75)(v71, &+[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]::kPadding, v66);
LABEL_93:
    if (!v72)
      break;
    v76 = (v68 & 1) != 0 ? v87 : a5 + 2;
    if (!((unsigned int (*)(_QWORD *, void *, int64_t))*v76)(v71, __p, (_BYTE *)v111 - (_BYTE *)__p))
      break;
    v60 = ((uint64_t (*)(_QWORD *, _BYTE *, int64_t))*v76)(v71, v107, (_BYTE *)__dst - v107);
    if ((v68 & 1) == 0)
      goto LABEL_102;
LABEL_101:
    CC_SHA256_Final((unsigned __int8 *)&md, (CC_SHA256_CTX *)(v89 + 48));
    v67 = 0;
    v170 = md;
  }
  v60 = 0;
  if ((v68 & 1) != 0)
    goto LABEL_101;
LABEL_102:
  _Block_object_dispose(__x, 8);
  v59 = v107;
  if (v107)
  {
LABEL_46:
    __dst = v59;
    operator delete(v59);
  }
LABEL_47:
  if (__p)
  {
    v111 = __p;
    operator delete(__p);
  }
  if (v117.__begin_)
  {
    v117.__end_ = v117.__begin_;
    operator delete(v117.__begin_);
  }
  return v60;
}

uint64_t __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), a2, a3);
  return 1;
}

uint64_t __64__MTLLoader_serializeMachOWrapperWithType_slice_payload_writer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (uint64_t)serializeMachOContainerWithSlice:(uint64_t)a3 payload:(unsigned int)a4 count:(_QWORD *)a5 writer:
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::vector<char>::pointer begin;
  std::vector<char>::pointer v39;
  uint64_t v40;
  std::vector<char>::pointer v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unsigned __int8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD v64[6];
  uint64_t __src;
  uint64_t *p_src;
  _QWORD v67[2];
  _QWORD v68[5];
  std::vector<char> v69;
  std::vector<char> v70;
  void *__p;
  char *v72;
  char *v73;
  uint64_t v74;
  _BYTE v75[28];
  int v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  int64_t v98;
  __int128 v99;
  uint64_t v100;
  unsigned int v101;
  unsigned int v102;
  int v103;
  int v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = 0;
  if (!a3 || !a4)
    return v9;
  if (((a2 - 16777235) > 4 || (_DWORD)a2 == 16777238) && (_DWORD)a2 != -1)
    return 0;
  v62 = a5;
  if (a4 == 1)
    return +[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, a2, a3, a5);
  __p = 0;
  v72 = 0;
  v61 = a4;
  v11 = a4;
  v73 = 0;
  std::vector<MTLSerializer::ObjectRef>::reserve(&__p, a4);
  v12 = 0;
  v63 = a2;
  v60 = HIDWORD(a2);
  v13 = v72;
  do
  {
    v14 = a3 + 112 * v12;
    if (v13 >= v73)
    {
      v15 = (v13 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v15 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v16 = (v73 - (_BYTE *)__p) >> 2;
      if (v16 <= v15 + 1)
        v16 = v15 + 1;
      if ((unint64_t)(v73 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      if (v17)
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v73, v17);
      else
        v18 = 0;
      v19 = &v18[8 * v15];
      *(_QWORD *)v19 = v14;
      v13 = v19 + 8;
      v21 = (char *)__p;
      v20 = v72;
      if (v72 != __p)
      {
        do
        {
          v22 = *((_QWORD *)v20 - 1);
          v20 -= 8;
          *((_QWORD *)v19 - 1) = v22;
          v19 -= 8;
        }
        while (v20 != v21);
        v20 = (char *)__p;
      }
      __p = v19;
      v72 = v13;
      v73 = &v18[8 * v17];
      if (v20)
        operator delete(v20);
    }
    else
    {
      *(_QWORD *)v13 = v14;
      v13 += 8;
    }
    v72 = v13;
    ++v12;
  }
  while (v12 != a4);
  v23 = 126 - 2 * __clz((v13 - (_BYTE *)__p) >> 3);
  if (v13 == __p)
    v24 = 0;
  else
    v24 = v23;
  std::__introsort<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**,false>((unint64_t **)__p, (unint64_t **)v13, v24, 1);
  v25 = 0;
  v26 = 0;
  v27 = (char *)__p;
  v28 = *(_QWORD *)__p;
  v29 = *(_QWORD *)(*(_QWORD *)__p + 48);
  while (v25 != a4 - 1)
  {
    ++v25;
    v30 = *((_QWORD *)__p + v25);
    v31 = v28 + 8;
    v32 = v28 + 40;
    v33 = 8;
    while (*(unsigned __int8 *)(v28 + v33) == *(unsigned __int8 *)(v30 + v33))
    {
      if (++v33 == 40)
        goto LABEL_36;
    }
    v32 = v28 + v33;
LABEL_36:
    v34 = v32 - v31;
    if (v32 - v31 != 32)
    {
      if (v26 <= v34 + 1)
        v26 = v34 + 1;
      v28 = *((_QWORD *)__p + v25);
      if (*(_QWORD *)(v30 + 48) == v29)
        continue;
    }
    v9 = 0;
    if (__p)
      goto LABEL_76;
    return v9;
  }
  if (v26 + 1 < 0x20)
    v35 = v26 + 1;
  else
    v35 = 32;
  memset(&v70, 0, sizeof(v70));
  v36 = (2 * (_DWORD)v35) | 1u;
  std::vector<unsigned char>::__append(&v70, a4 * (unint64_t)v36 + 1);
  v37 = 0;
  begin = v70.__begin_;
  *v70.__begin_ = 32;
  v39 = begin + 2;
  do
  {
    if ((_DWORD)v35)
    {
      v40 = 0;
      v41 = v39;
      do
      {
        v42 = *(unsigned __int8 *)(*((_QWORD *)__p + v37) + v40 + 8);
        *(v41 - 1) = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kHex[v42 >> 4];
        *v41 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kHex[v42 & 0xF];
        v41 += 2;
        ++v40;
      }
      while (v35 != v40);
    }
    ++v37;
    v39 += v36;
  }
  while (v37 != a4);
  memset(&v69, 0, sizeof(v69));
  std::vector<unsigned char>::reserve(&v69, 16 * a4);
  v59 = 16 * a4;
  v43 = 0;
  v44 = 8 * a4;
  v45 = 1;
  v46 = 296;
  do
  {
    v74 = 0;
    *(_QWORD *)v75 = &v74;
    *(_QWORD *)&v75[8] = 0x2020000000;
    *(_QWORD *)&v75[16] = 0;
    v47 = *(_QWORD *)((char *)__p + v43);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke;
    v68[3] = &unk_1E0FE40C0;
    v68[4] = &v74;
    if ((+[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, v63, v47, v68) & 1) == 0)
    {
      _Block_object_dispose(&v74, 8);
      goto LABEL_68;
    }
    __src = v45 | 0x2011E00000000;
    p_src = (uint64_t *)(v46 + 4294967000);
    std::vector<char>::__insert_with_size[abi:ne180100]<char const*,char const*>((uint64_t)&v69, v69.__end_, (char *)&__src, (char *)v67, 16);
    v48 = *(_DWORD *)(*(_QWORD *)v75 + 24) + v46;
    _Block_object_dispose(&v74, 8);
    v46 = (v48 + 7) & 0xFFFFFFF8;
    v43 += 8;
    v45 += v36;
  }
  while (v44 != v43);
  if ((unint64_t)(v70.__end_ - v70.__begin_ + v46 + v59) >> 32)
  {
LABEL_68:
    v9 = 0;
    goto LABEL_71;
  }
  LODWORD(v74) = -17958193;
  HIDWORD(v74) = v63;
  *(_OWORD *)&v75[4] = xmmword_182819FD0;
  *(_QWORD *)&v75[20] = 0x1900000000;
  *(_DWORD *)v75 = v60;
  v76 = 152;
  v77 = *(_OWORD *)"__DATA";
  v78 = 0x100000000;
  v79 = (v48 + 7) & 0xFFFFFFF8;
  v80 = 0;
  v81 = v79;
  v82 = xmmword_182819FE0;
  v83 = *(_OWORD *)"__data";
  v84 = *(_OWORD *)"__DATA";
  v85 = 0x100000000;
  v86 = v46 - 296;
  v87 = 0x300000128;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0x100000002ALL;
  v92 = v29;
  v93 = 0x4800000019;
  v94 = *(_OWORD *)"__LINKEDIT";
  v95 = 0x200000000;
  v96 = v70.__end_ - v70.__begin_ + v59;
  v97 = v79;
  v98 = v96;
  v99 = xmmword_182819FC0;
  v100 = 0x1800000002;
  v101 = (v48 + 7) & 0xFFFFFFF8;
  v102 = v61;
  v103 = v46 + v59;
  v104 = LODWORD(v70.__end_) - LODWORD(v70.__begin_);
  v49 = ((uint64_t (*)(_QWORD *, uint64_t *, uint64_t))v62[2])(v62, &v74, 296);
  v50 = 0;
  __src = 0;
  p_src = &__src;
  v67[0] = 0x2020000000;
  v51 = 296;
  v67[1] = 296;
  v52 = 8 * v11;
  v53 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v54 = ((_DWORD)v51 + 7) & 0xFFFFFFF8;
    v56 = v54 - v51;
    v55 = v54 == v51;
    v57 = (v54 == v51) & v49;
    if (!v55 && (v49 & 1) != 0)
      v57 = ((uint64_t (*)(_QWORD *, void *, uint64_t))v62[2])(v62, &+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::kPadding, v56);
    if (v52 == v50)
      break;
    p_src[3] = v54;
    if (v57)
    {
      v58 = *(_QWORD *)((char *)__p + v50);
      v64[0] = v53;
      v64[1] = 3221225472;
      v64[2] = __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke_3;
      v64[3] = &unk_1E0FE4110;
      v64[4] = v62;
      v64[5] = &__src;
      v49 = +[MTLLoader serializeMachOWrapperWithType:slice:payload:writer:]((uint64_t)MTLLoader, 0, v63, v58, v64);
      v54 = p_src[3];
    }
    else
    {
      v49 = 0;
    }
    v50 += 8;
    v51 = v54;
  }
  if (v57
    && ((unsigned int (*)(_QWORD *, std::vector<char>::pointer, int64_t))v62[2])(v62, v69.__begin_, v69.__end_ - v69.__begin_))
  {
    v9 = ((uint64_t (*)(_QWORD *, std::vector<char>::pointer, int64_t))v62[2])(v62, v70.__begin_, v70.__end_ - v70.__begin_);
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&__src, 8);
LABEL_71:
  if (v69.__begin_)
  {
    v69.__end_ = v69.__begin_;
    operator delete(v69.__begin_);
  }
  if (v70.__begin_)
  {
    v70.__end_ = v70.__begin_;
    operator delete(v70.__begin_);
  }
  v27 = (char *)__p;
  if (__p)
  {
LABEL_76:
    v72 = v27;
    operator delete(v27);
  }
  return v9;
}

uint64_t __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a3;
  return 1;
}

uint64_t __67__MTLLoader_serializeMachOContainerWithSlice_payload_count_writer___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (uint64_t)serializeUniversalBinaryHeaderWithSlice:(_DWORD *)a3 offset:(_DWORD *)a4 length:(unsigned int)a5 count:(uint64_t)a6 writer:
{
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  _DWORD *v15;
  _DWORD *i;
  unsigned int v17;
  int v20;
  _BOOL4 v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  _DWORD v25[5];
  _DWORD v26[2];

  objc_opt_self();
  if (a5)
  {
    if (a5 == 1)
      return 1;
    v26[0] = -1095041334;
    v26[1] = bswap32(a5);
    LODWORD(result) = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a6 + 16))(a6, v26, 8);
    v12 = a5;
    v13 = 20 * a5 + 8;
    v14 = (unsigned int *)(a2 + 4);
    v15 = a4;
    for (i = a3; ; i += 2)
    {
      v17 = *(v14 - 1);
      if ((v17 - 16777235 > 4 || v17 == 16777238) && v17 != -1)
        return 0;
      v20 = (a3 == 0) & result;
      if (a3 && ((result ^ 1) & 1) == 0)
        v20 = i[1] == 0;
      if (a4)
        v21 = 0;
      else
        v21 = v20;
      if (a4 && v20)
        v21 = v15[1] == 0;
      v22 = bswap32(*v14);
      v25[0] = bswap32(v17);
      v25[1] = v22;
      v23 = a3 ? *i : 0;
      v25[2] = bswap32(v23);
      v24 = a4 ? *v15 : 0;
      v25[3] = bswap32(v24);
      v25[4] = 50331648;
      if (a3)
      {
        if (*(_QWORD *)i < v13)
          return 0;
      }
      if (a4 && !*(_QWORD *)v15)
        return 0;
      if (a3)
      {
        if ((*(_QWORD *)i & 7) != 0)
          LOBYTE(v21) = 0;
        if (!v21)
        {
          result = 0;
          if ((*(_QWORD *)i & 7) != 0)
            return result;
          goto LABEL_41;
        }
      }
      else if (!v21)
      {
        result = 0;
        goto LABEL_41;
      }
      result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a6 + 16))(a6, v25, 20);
LABEL_41:
      v14 += 2;
      v15 += 2;
      if (!--v12)
        return result;
    }
  }
  return 0;
}

+ (uint64_t)serializePaddingForOffset:(uint64_t)a3 writer:
{
  unsigned int v5;

  objc_opt_self();
  v5 = (a2 + 7) & 0xFFFFFFF8;
  if (v5 == a2)
    return 1;
  else
    return (*(uint64_t (**)(uint64_t, void *, _QWORD))(a3 + 16))(a3, &+[MTLLoader serializePaddingForOffset:writer:]::kPadding, v5 - a2);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_claims);
}

+ (unint64_t)serializeMachOContainerWithSlice:(unint64_t *)result payload:(unint64_t *)a2 count:(uint64_t)a3 writer:(char)a4
{
  unint64_t **v7;
  unint64_t **v8;
  unint64_t **v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t **v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t **v25;
  unint64_t **v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  unint64_t *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  unint64_t *v37;
  unint64_t **v38;
  unint64_t **v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  unint64_t **v48;
  BOOL v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  unint64_t **v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  unint64_t *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  int v63;
  unint64_t **v64;
  unint64_t *v65;
  unint64_t *v66;
  unint64_t v67;
  unint64_t v68;
  int v69;
  unint64_t *v70;
  unint64_t *v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t v74;
  int v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t v78;
  int v79;
  unint64_t **v80;
  unint64_t *v81;
  unint64_t *v82;
  unint64_t v83;
  unint64_t v84;
  int v85;
  unint64_t **v86;
  unint64_t **v87;
  unint64_t **v88;
  unint64_t *v89;
  unint64_t *v90;
  unint64_t v91;
  unint64_t v92;
  int v93;
  unint64_t **v94;
  BOOL v96;
  uint64_t v97;
  unint64_t **v98;
  unint64_t *v99;
  unint64_t *v100;
  unint64_t v101;
  unint64_t v102;
  int v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  int v107;
  unint64_t **v108;
  int64_t v109;
  int64_t v110;
  int64_t v111;
  uint64_t v112;
  unint64_t **v113;
  unint64_t *v114;
  unint64_t *v115;
  unint64_t v116;
  unint64_t v117;
  int v118;
  unint64_t *v119;
  unint64_t v120;
  unint64_t v121;
  int v122;
  unint64_t *v123;
  uint64_t v124;
  unint64_t *v125;
  unint64_t v126;
  unint64_t v127;
  int v128;
  unint64_t v129;
  unint64_t v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t *v134;
  unint64_t **v135;
  unint64_t **v136;
  unint64_t **v137;
  unint64_t *v138;
  unint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  int v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t **v147;
  unint64_t *v148;
  unint64_t *v149;
  unint64_t v150;
  unint64_t v151;
  int v152;
  unint64_t **v153;
  unint64_t v154;
  unint64_t v155;
  int v156;
  unint64_t *v158;
  unint64_t *v159;
  unint64_t v160;
  unint64_t v161;
  int v162;
  unint64_t *v163;
  unint64_t *v164;
  unint64_t v165;
  unint64_t v166;
  int v167;
  unint64_t **v168;
  unint64_t v169;
  unint64_t v170;
  int v171;
  unint64_t *v172;
  unint64_t v173;
  unint64_t v174;
  int v175;
  unint64_t *v176;
  unint64_t v177;
  unint64_t v178;
  int v179;

  v7 = result;
LABEL_2:
  v8 = a2 - 1;
  v9 = v7;
  while (2)
  {
    v7 = v9;
    v10 = (char *)a2 - (char *)v9;
    v11 = a2 - v9;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v81 = *(a2 - 1);
        v82 = *v9;
        v83 = bswap64(v81[1]);
        v84 = bswap64((*v9)[1]);
        if (v83 == v84
          && (v83 = bswap64(v81[2]), v84 = bswap64(v82[2]), v83 == v84)
          && (v83 = bswap64(v81[3]), v84 = bswap64(v82[3]), v83 == v84)
          && (v83 = bswap64(v81[4]), v84 = bswap64(v82[4]), v83 == v84))
        {
          v85 = 0;
        }
        else if (v83 < v84)
        {
          v85 = -1;
        }
        else
        {
          v85 = 1;
        }
        if (v85 < 0)
        {
          *v9 = v81;
          *(a2 - 1) = v82;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        v86 = v9 + 1;
        v87 = v9 + 2;
        v88 = v9 + 3;
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v9, v9 + 1, v9 + 2, v9 + 3);
        v89 = *(a2 - 1);
        v90 = v9[3];
        v91 = bswap64(v89[1]);
        v92 = bswap64(v90[1]);
        if (v91 == v92
          && (v91 = bswap64(v89[2]), v92 = bswap64(v90[2]), v91 == v92)
          && (v91 = bswap64(v89[3]), v92 = bswap64(v90[3]), v91 == v92)
          && (v91 = bswap64(v89[4]), v92 = bswap64(v90[4]), v91 == v92))
        {
          v93 = 0;
        }
        else if (v91 < v92)
        {
          v93 = -1;
        }
        else
        {
          v93 = 1;
        }
        if (v93 < 0)
        {
          *v88 = v89;
          *(a2 - 1) = v90;
          v158 = *v88;
          v159 = *v87;
          v160 = bswap64((*v88)[1]);
          v161 = bswap64((*v87)[1]);
          if (v160 != v161)
            goto LABEL_313;
          v160 = bswap64(v158[2]);
          v161 = bswap64(v159[2]);
          if (v160 == v161
            && (v160 = bswap64(v158[3]), v161 = bswap64(v159[3]), v160 == v161)
            && (v160 = bswap64(v158[4]), v161 = bswap64(v159[4]), v160 == v161))
          {
            v162 = 0;
          }
          else
          {
LABEL_313:
            v162 = v160 < v161 ? -1 : 1;
          }
          if (v162 < 0)
          {
            *v87 = v158;
            *v88 = v159;
            v172 = *v86;
            v173 = bswap64(v158[1]);
            v174 = bswap64((*v86)[1]);
            if (v173 != v174)
              goto LABEL_322;
            v173 = bswap64(v158[2]);
            v174 = bswap64(v172[2]);
            if (v173 == v174
              && (v173 = bswap64(v158[3]), v174 = bswap64(v172[3]), v173 == v174)
              && (v173 = bswap64(v158[4]), v174 = bswap64(v172[4]), v173 == v174))
            {
              v175 = 0;
            }
            else
            {
LABEL_322:
              v175 = v173 < v174 ? -1 : 1;
            }
            if (v175 < 0)
            {
              v9[1] = v158;
              v9[2] = v172;
              v176 = *v9;
              v177 = bswap64(v158[1]);
              v178 = bswap64((*v9)[1]);
              if (v177 != v178)
                goto LABEL_331;
              v177 = bswap64(v158[2]);
              v178 = bswap64(v176[2]);
              if (v177 == v178
                && (v177 = bswap64(v158[3]), v178 = bswap64(v176[3]), v177 == v178)
                && (v177 = bswap64(v158[4]), v178 = bswap64(v176[4]), v177 == v178))
              {
                v179 = 0;
              }
              else
              {
LABEL_331:
                v179 = v177 < v178 ? -1 : 1;
              }
              if (v179 < 0)
              {
                *v9 = v158;
                v9[1] = v176;
              }
            }
          }
        }
        return result;
      default:
        if (v10 <= 191)
        {
          v94 = v9 + 1;
          v96 = v9 == a2 || v94 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v96)
            {
              v97 = 0;
              v98 = v9;
              do
              {
                v100 = *v98;
                v99 = v98[1];
                v98 = v94;
                v101 = bswap64(v99[1]);
                v102 = bswap64(v100[1]);
                if (v101 != v102
                  || (v101 = bswap64(v99[2]), v102 = bswap64(v100[2]), v101 != v102)
                  || (v101 = bswap64(v99[3]), v102 = bswap64(v100[3]), v101 != v102)
                  || (v101 = bswap64(v99[4]), v102 = bswap64(v100[4]), v101 != v102))
                {
                  v103 = v101 < v102 ? -1 : 1;
                  if (v103 < 0)
                  {
                    v104 = v97;
                    while (1)
                    {
                      *(unint64_t **)((char *)v9 + v104 + 8) = v100;
                      if (!v104)
                        break;
                      v100 = *(unint64_t **)((char *)v9 + v104 - 8);
                      v105 = bswap64(v99[1]);
                      v106 = bswap64(v100[1]);
                      if (v105 == v106
                        && (v105 = bswap64(v99[2]), v106 = bswap64(v100[2]), v105 == v106)
                        && (v105 = bswap64(v99[3]), v106 = bswap64(v100[3]), v105 == v106)
                        && (v105 = bswap64(v99[4]), v106 = bswap64(v100[4]), v105 == v106))
                      {
                        v107 = 0;
                      }
                      else if (v105 < v106)
                      {
                        v107 = -1;
                      }
                      else
                      {
                        v107 = 1;
                      }
                      v104 -= 8;
                      if ((v107 & 0x80000000) == 0)
                      {
                        v108 = (unint64_t **)((char *)v9 + v104 + 8);
                        goto LABEL_187;
                      }
                    }
                    v108 = v9;
LABEL_187:
                    *v108 = v99;
                  }
                }
                v94 = v98 + 1;
                v97 += 8;
              }
              while (v98 + 1 != a2);
            }
          }
          else if (!v96)
          {
            do
            {
              v164 = *v7;
              v163 = v7[1];
              v7 = v94;
              v165 = bswap64(v163[1]);
              v166 = bswap64(v164[1]);
              if (v165 != v166
                || (v165 = bswap64(v163[2]), v166 = bswap64(v164[2]), v165 != v166)
                || (v165 = bswap64(v163[3]), v166 = bswap64(v164[3]), v165 != v166)
                || (v165 = bswap64(v163[4]), v166 = bswap64(v164[4]), v165 != v166))
              {
                v167 = v165 < v166 ? -1 : 1;
                if (v167 < 0)
                {
                  v168 = v94;
                  do
                  {
                    *v168 = v164;
                    v164 = *(v168 - 2);
                    v169 = bswap64(v163[1]);
                    v170 = bswap64(v164[1]);
                    if (v169 == v170
                      && (v169 = bswap64(v163[2]), v170 = bswap64(v164[2]), v169 == v170)
                      && (v169 = bswap64(v163[3]), v170 = bswap64(v164[3]), v169 == v170)
                      && (v169 = bswap64(v163[4]), v170 = bswap64(v164[4]), v169 == v170))
                    {
                      v171 = 0;
                    }
                    else if (v169 < v170)
                    {
                      v171 = -1;
                    }
                    else
                    {
                      v171 = 1;
                    }
                    --v168;
                  }
                  while (v171 < 0);
                  *v168 = v163;
                }
              }
              v94 = v7 + 1;
            }
            while (v7 + 1 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v9 != a2)
          {
            v109 = (v11 - 2) >> 1;
            v110 = v109;
            do
            {
              v111 = v110;
              if (v109 >= v110)
              {
                v112 = (2 * v110) | 1;
                v113 = &v9[v112];
                v114 = *v113;
                if (2 * v111 + 2 < (uint64_t)v11)
                {
                  v115 = v113[1];
                  v116 = bswap64(v114[1]);
                  v117 = bswap64(v115[1]);
                  if (v116 != v117)
                    goto LABEL_199;
                  v116 = bswap64(v114[2]);
                  v117 = bswap64(v115[2]);
                  if (v116 == v117
                    && (v116 = bswap64(v114[3]), v117 = bswap64(v115[3]), v116 == v117)
                    && (v116 = bswap64(v114[4]), v117 = bswap64(v115[4]), v116 == v117))
                  {
                    v118 = 0;
                  }
                  else
                  {
LABEL_199:
                    v118 = v116 < v117 ? -1 : 1;
                  }
                  if (v118 < 0)
                  {
                    v114 = v113[1];
                    ++v113;
                    v112 = 2 * v111 + 2;
                  }
                }
                result = &v9[v111];
                v119 = *result;
                v120 = bswap64(v114[1]);
                v121 = bswap64((*result)[1]);
                if (v120 == v121
                  && (v120 = bswap64(v114[2]), v121 = bswap64(v119[2]), v120 == v121)
                  && (v120 = bswap64(v114[3]), v121 = bswap64(v119[3]), v120 == v121)
                  && (v120 = bswap64(v114[4]), v121 = bswap64(v119[4]), v120 == v121)
                  || (v120 < v121 ? (v122 = -1) : (v122 = 1), (v122 & 0x80000000) == 0))
                {
                  do
                  {
                    v123 = (unint64_t *)v113;
                    *result = v114;
                    if (v109 < v112)
                      break;
                    v124 = (2 * v112) | 1;
                    v113 = &v9[v124];
                    v112 = 2 * v112 + 2;
                    v114 = *v113;
                    if (v112 >= (uint64_t)v11)
                    {
                      v112 = v124;
                    }
                    else
                    {
                      v125 = v113[1];
                      v126 = bswap64(v114[1]);
                      v127 = bswap64(v125[1]);
                      if (v126 != v127)
                        goto LABEL_220;
                      v126 = bswap64(v114[2]);
                      v127 = bswap64(v125[2]);
                      if (v126 == v127
                        && (v126 = bswap64(v114[3]), v127 = bswap64(v125[3]), v126 == v127)
                        && (v126 = bswap64(v114[4]), v127 = bswap64(v125[4]), v126 == v127))
                      {
                        v128 = 0;
                      }
                      else
                      {
LABEL_220:
                        v128 = v126 < v127 ? -1 : 1;
                      }
                      if (v128 >= 0)
                      {
                        v112 = v124;
                      }
                      else
                      {
                        v114 = v113[1];
                        ++v113;
                      }
                    }
                    v129 = bswap64(v114[1]);
                    v130 = bswap64(v119[1]);
                    if (v129 != v130)
                      goto LABEL_231;
                    v129 = bswap64(v114[2]);
                    v130 = bswap64(v119[2]);
                    if (v129 == v130
                      && (v129 = bswap64(v114[3]), v130 = bswap64(v119[3]), v129 == v130)
                      && (v129 = bswap64(v114[4]), v130 = bswap64(v119[4]), v129 == v130))
                    {
                      v131 = 0;
                    }
                    else
                    {
LABEL_231:
                      v131 = v129 < v130 ? -1 : 1;
                    }
                    result = (unint64_t **)v123;
                  }
                  while ((v131 & 0x80000000) == 0);
                  *v123 = (unint64_t)v119;
                }
              }
              v110 = v111 - 1;
            }
            while (v111);
            v132 = (unint64_t)v10 >> 3;
            do
            {
              v133 = 0;
              v134 = *v9;
              v135 = v9;
              do
              {
                v136 = &v135[v133];
                v139 = v136[1];
                v137 = v136 + 1;
                v138 = v139;
                v140 = (2 * v133) | 1;
                v141 = 2 * v133 + 2;
                if (v141 < v132)
                {
                  result = (unint64_t **)v137[1];
                  v142 = bswap64(v138[1]);
                  v143 = bswap64((unint64_t)result[1]);
                  if (v142 != v143)
                    goto LABEL_245;
                  v142 = bswap64(v138[2]);
                  v143 = bswap64((unint64_t)result[2]);
                  if (v142 == v143
                    && (v142 = bswap64(v138[3]), v143 = bswap64((unint64_t)result[3]), v142 == v143)
                    && (v142 = bswap64(v138[4]), v143 = bswap64((unint64_t)result[4]), v142 == v143))
                  {
                    v144 = 0;
                  }
                  else
                  {
LABEL_245:
                    v144 = v142 < v143 ? -1 : 1;
                  }
                  if (v144 < 0)
                  {
                    v138 = v137[1];
                    ++v137;
                    v140 = v141;
                  }
                }
                *v135 = v138;
                v135 = v137;
                v133 = v140;
              }
              while (v140 <= (uint64_t)((unint64_t)(v132 - 2) >> 1));
              if (v137 == --a2)
              {
                *v137 = v134;
              }
              else
              {
                *v137 = *a2;
                *a2 = v134;
                v145 = (char *)v137 - (char *)v9 + 8;
                if (v145 >= 9)
                {
                  v146 = (((unint64_t)v145 >> 3) - 2) >> 1;
                  v147 = &v9[v146];
                  v148 = *v147;
                  v149 = *v137;
                  v150 = bswap64((*v147)[1]);
                  v151 = bswap64((*v137)[1]);
                  if (v150 != v151
                    || (v150 = bswap64(v148[2]), v151 = bswap64(v149[2]), v150 != v151)
                    || (v150 = bswap64(v148[3]), v151 = bswap64(v149[3]), v150 != v151)
                    || (v150 = bswap64(v148[4]), v151 = bswap64(v149[4]), v150 != v151))
                  {
                    v152 = v150 < v151 ? -1 : 1;
                    if (v152 < 0)
                    {
                      do
                      {
                        v153 = v147;
                        *v137 = v148;
                        if (!v146)
                          break;
                        v146 = (v146 - 1) >> 1;
                        v147 = &v9[v146];
                        v148 = *v147;
                        v154 = bswap64((*v147)[1]);
                        v155 = bswap64(v149[1]);
                        if (v154 != v155)
                          goto LABEL_269;
                        v154 = bswap64(v148[2]);
                        v155 = bswap64(v149[2]);
                        if (v154 == v155
                          && (v154 = bswap64(v148[3]), v155 = bswap64(v149[3]), v154 == v155)
                          && (v154 = bswap64(v148[4]), v155 = bswap64(v149[4]), v154 == v155))
                        {
                          v156 = 0;
                        }
                        else
                        {
LABEL_269:
                          v156 = v154 < v155 ? -1 : 1;
                        }
                        v137 = v153;
                      }
                      while (v156 < 0);
                      *v153 = v149;
                    }
                  }
                }
              }
            }
            while (v132-- > 2);
          }
          return result;
        }
        v12 = v11 >> 1;
        v13 = &v9[v11 >> 1];
        if ((unint64_t)v10 < 0x401)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(&v7[v11 >> 1], v7, a2 - 1);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v7, &v7[v11 >> 1], a2 - 1);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v7 + 1, v13 - 1, a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v7 + 2, &v7[v12 + 1], a2 - 3);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v13 - 1, v13, &v7[v12 + 1]);
          v14 = *v7;
          *v7 = *v13;
          *v13 = v14;
        }
        --a3;
        v15 = *v7;
        if ((a4 & 1) == 0)
        {
          v16 = *(v7 - 1);
          v17 = bswap64(v16[1]);
          v18 = bswap64(v15[1]);
          if (v17 != v18)
            goto LABEL_15;
          v17 = bswap64(v16[2]);
          v18 = bswap64(v15[2]);
          if (v17 == v18
            && (v17 = bswap64(v16[3]), v18 = bswap64(v15[3]), v17 == v18)
            && (v17 = bswap64(v16[4]), v18 = bswap64(v15[4]), v17 == v18))
          {
            v19 = 0;
          }
          else
          {
LABEL_15:
            v19 = v17 < v18 ? -1 : 1;
          }
          if ((v19 & 0x80000000) == 0)
          {
            v50 = *v8;
            v51 = bswap64(v15[1]);
            v52 = bswap64((*v8)[1]);
            if (v51 == v52
              && (v51 = bswap64(v15[2]), v52 = bswap64(v50[2]), v51 == v52)
              && (v51 = bswap64(v15[3]), v52 = bswap64(v50[3]), v51 == v52)
              && (v51 = bswap64(v15[4]), v52 = bswap64(v50[4]), v51 == v52))
            {
              v53 = 0;
            }
            else if (v51 < v52)
            {
              v53 = -1;
            }
            else
            {
              v53 = 1;
            }
            if (v53 < 0)
            {
              v9 = v7;
              do
              {
                v60 = v9[1];
                ++v9;
                v59 = v60;
                v61 = bswap64(v15[1]);
                v62 = bswap64(v60[1]);
                if (v61 == v62
                  && (v61 = bswap64(v15[2]), v62 = bswap64(v59[2]), v61 == v62)
                  && (v61 = bswap64(v15[3]), v62 = bswap64(v59[3]), v61 == v62)
                  && (v61 = bswap64(v15[4]), v62 = bswap64(v59[4]), v61 == v62))
                {
                  v63 = 0;
                }
                else if (v61 < v62)
                {
                  v63 = -1;
                }
                else
                {
                  v63 = 1;
                }
              }
              while ((v63 & 0x80000000) == 0);
            }
            else
            {
              v54 = v7 + 1;
              do
              {
                v9 = v54;
                if (v54 >= a2)
                  break;
                v55 = *v54;
                v56 = bswap64(v15[1]);
                v57 = bswap64((*v9)[1]);
                if (v56 != v57)
                  goto LABEL_94;
                v56 = bswap64(v15[2]);
                v57 = bswap64(v55[2]);
                if (v56 == v57
                  && (v56 = bswap64(v15[3]), v57 = bswap64(v55[3]), v56 == v57)
                  && (v56 = bswap64(v15[4]), v57 = bswap64(v55[4]), v56 == v57))
                {
                  v58 = 0;
                }
                else
                {
LABEL_94:
                  v58 = v56 < v57 ? -1 : 1;
                }
                v54 = v9 + 1;
              }
              while ((v58 & 0x80000000) == 0);
            }
            v64 = a2;
            if (v9 < a2)
            {
              v64 = a2;
              do
              {
                v66 = *--v64;
                v65 = v66;
                v67 = bswap64(v15[1]);
                v68 = bswap64(v66[1]);
                if (v67 == v68)
                {
                  v67 = bswap64(v15[2]);
                  v68 = bswap64(v65[2]);
                  if (v67 == v68)
                  {
                    v67 = bswap64(v15[3]);
                    v68 = bswap64(v65[3]);
                    if (v67 == v68)
                    {
                      v67 = bswap64(v15[4]);
                      v68 = bswap64(v65[4]);
                      if (v67 == v68)
                        break;
                    }
                  }
                }
                v69 = v67 < v68 ? -1 : 1;
              }
              while (v69 < 0);
            }
            if (v9 < v64)
            {
              v70 = *v9;
              v71 = *v64;
              do
              {
                *v9 = v71;
                *v64 = v70;
                do
                {
                  do
                  {
                    v72 = v9[1];
                    ++v9;
                    v70 = v72;
                    v73 = bswap64(v15[1]);
                    v74 = bswap64(v72[1]);
                    if (v73 != v74)
                      break;
                    v73 = bswap64(v15[2]);
                    v74 = bswap64(v70[2]);
                    if (v73 != v74)
                      break;
                    v73 = bswap64(v15[3]);
                    v74 = bswap64(v70[3]);
                    if (v73 != v74)
                      break;
                    v73 = bswap64(v15[4]);
                    v74 = bswap64(v70[4]);
                  }
                  while (v73 == v74);
                  if (v73 < v74)
                    v75 = -1;
                  else
                    v75 = 1;
                }
                while ((v75 & 0x80000000) == 0);
                do
                {
                  v76 = *--v64;
                  v71 = v76;
                  v77 = bswap64(v15[1]);
                  v78 = bswap64(v76[1]);
                  if (v77 == v78)
                  {
                    v77 = bswap64(v15[2]);
                    v78 = bswap64(v71[2]);
                    if (v77 == v78)
                    {
                      v77 = bswap64(v15[3]);
                      v78 = bswap64(v71[3]);
                      if (v77 == v78)
                      {
                        v77 = bswap64(v15[4]);
                        v78 = bswap64(v71[4]);
                        if (v77 == v78)
                          break;
                      }
                    }
                  }
                  v79 = v77 < v78 ? -1 : 1;
                }
                while (v79 < 0);
              }
              while (v9 < v64);
            }
            v80 = v9 - 1;
            if (v9 - 1 != v7)
              *v7 = *v80;
            a4 = 0;
            *v80 = v15;
            continue;
          }
        }
        v20 = 0;
        do
        {
          v21 = v7[v20 + 1];
          v22 = bswap64(v21[1]);
          v23 = bswap64(v15[1]);
          if (v22 == v23
            && (v22 = bswap64(v21[2]), v23 = bswap64(v15[2]), v22 == v23)
            && (v22 = bswap64(v21[3]), v23 = bswap64(v15[3]), v22 == v23)
            && (v22 = bswap64(v21[4]), v23 = bswap64(v15[4]), v22 == v23))
          {
            v24 = 0;
          }
          else if (v22 < v23)
          {
            v24 = -1;
          }
          else
          {
            v24 = 1;
          }
          ++v20;
        }
        while (v24 < 0);
        v25 = &v7[v20];
        v26 = a2;
        if (v20 == 1)
        {
          v26 = a2;
          do
          {
            if (v25 >= v26)
              break;
            v33 = *--v26;
            v32 = v33;
            v34 = bswap64(v33[1]);
            v35 = bswap64(v15[1]);
            if (v34 != v35)
              goto LABEL_46;
            v34 = bswap64(v32[2]);
            v35 = bswap64(v15[2]);
            if (v34 == v35
              && (v34 = bswap64(v32[3]), v35 = bswap64(v15[3]), v34 == v35)
              && (v34 = bswap64(v32[4]), v35 = bswap64(v15[4]), v34 == v35))
            {
              v36 = 0;
            }
            else
            {
LABEL_46:
              v36 = v34 < v35 ? -1 : 1;
            }
          }
          while ((v36 & 0x80000000) == 0);
        }
        else
        {
          do
          {
            do
            {
              v28 = *--v26;
              v27 = v28;
              v29 = bswap64(v28[1]);
              v30 = bswap64(v15[1]);
              if (v29 != v30)
                break;
              v29 = bswap64(v27[2]);
              v30 = bswap64(v15[2]);
              if (v29 != v30)
                break;
              v29 = bswap64(v27[3]);
              v30 = bswap64(v15[3]);
              if (v29 != v30)
                break;
              v29 = bswap64(v27[4]);
              v30 = bswap64(v15[4]);
            }
            while (v29 == v30);
            if (v29 < v30)
              v31 = -1;
            else
              v31 = 1;
          }
          while ((v31 & 0x80000000) == 0);
        }
        if (v25 >= v26)
        {
          v48 = v25 - 1;
        }
        else
        {
          v37 = *v26;
          v38 = v25;
          v39 = v26;
          do
          {
            *v38 = v37;
            *v39 = v21;
            do
            {
              v40 = v38[1];
              ++v38;
              v21 = v40;
              v41 = bswap64(v40[1]);
              v42 = bswap64(v15[1]);
              if (v41 == v42)
              {
                v41 = bswap64(v21[2]);
                v42 = bswap64(v15[2]);
                if (v41 == v42)
                {
                  v41 = bswap64(v21[3]);
                  v42 = bswap64(v15[3]);
                  if (v41 == v42)
                  {
                    v41 = bswap64(v21[4]);
                    v42 = bswap64(v15[4]);
                    if (v41 == v42)
                      break;
                  }
                }
              }
              v43 = v41 < v42 ? -1 : 1;
            }
            while (v43 < 0);
            do
            {
              do
              {
                v44 = *--v39;
                v37 = v44;
                v45 = bswap64(v44[1]);
                v46 = bswap64(v15[1]);
                if (v45 != v46)
                  break;
                v45 = bswap64(v37[2]);
                v46 = bswap64(v15[2]);
                if (v45 != v46)
                  break;
                v45 = bswap64(v37[3]);
                v46 = bswap64(v15[3]);
                if (v45 != v46)
                  break;
                v45 = bswap64(v37[4]);
                v46 = bswap64(v15[4]);
              }
              while (v45 == v46);
              if (v45 < v46)
                v47 = -1;
              else
                v47 = 1;
            }
            while ((v47 & 0x80000000) == 0);
          }
          while (v38 < v39);
          v48 = v38 - 1;
        }
        if (v48 != v7)
          *v7 = *v48;
        *v48 = v15;
        if (v25 < v26)
        {
LABEL_77:
          result = (unint64_t **)std::__introsort<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**,false>(v7, v48, a3, a4 & 1);
          a4 = 0;
          v9 = v48 + 1;
          continue;
        }
        v49 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v7, v48);
        v9 = v48 + 1;
        result = (unint64_t **)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]::$_2 &,MTLLoaderMachOPayload const**>(v48 + 1, a2);
        if (!(_DWORD)result)
        {
          if (v49)
            continue;
          goto LABEL_77;
        }
        a2 = v48;
        if (!v49)
          goto LABEL_2;
        return result;
    }
  }
}

@end
