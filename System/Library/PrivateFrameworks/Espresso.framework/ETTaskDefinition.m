@implementation ETTaskDefinition

- (shared_ptr<Espresso::abstract_context>)context_for_runtime_platform:(id *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t runtimePlatform;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  __int128 v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  _QWORD v34[2];
  shared_ptr<Espresso::abstract_context> result;

  v4 = v3;
  v34[1] = *MEMORY[0x1E0C80C00];
  v30 = 0uLL;
  runtimePlatform = self->runtimePlatform;
  if (runtimePlatform == 2 || runtimePlatform == 4)
  {
    v26 = 50000;
    Espresso::abstract_engine_factory::shared(&v31);
    Espresso::abstract_engine_factory::engine_for_platform(v31, &v26, &v27);
    v7 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    Espresso::select_metal_device((Espresso *)0xFFFFFFFFLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::allocate_shared[abi:ne180100]<Espresso::MPSEngine::context,std::allocator<Espresso::MPSEngine::context>,std::shared_ptr<Espresso::abstract_engine>,objc_object  {objcproto9MTLDevice}* {__strong},void>((uint64_t *)&v29, &v27, v10);
    v11 = v29;
    v29 = 0uLL;
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    v30 = v11;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = v28;
    if (v28)
    {
      v19 = (unint64_t *)&v28->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = v30;
    *(_BYTE *)(v30 + 56) = 1;
    self = (ETTaskDefinition *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 96))(v21);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    goto LABEL_32;
  }
  if (runtimePlatform != 3)
  {
    LODWORD(v29) = 100;
    Espresso::create_context((int *)&v29, &v31);
    v21 = v31;
    v22 = v32;
LABEL_32:
    *v4 = v21;
    v4[1] = (uint64_t)v22;
    goto LABEL_33;
  }
  if (a3)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("Unimplemented: unable to load updatable model w/ context: ANE");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  *v4 = 0;
  v4[1] = 0;
LABEL_33:
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

- (void)reloadOnRuntimePlatform:(id *)a3
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
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
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;

  -[ETTaskDefinition context_for_runtime_platform:](self, "context_for_runtime_platform:", a3);
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  Espresso::reload_network_on_context(&v24, &v28, self->precision, &v26);
  -[ETTaskDefinition setTrainingGraphNetPtr:](self, "setTrainingGraphNetPtr:", &v26);
  v4 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = v25;
  if (v25)
  {
    v8 = (unint64_t *)&v25->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  Espresso::reload_network_on_context(&v24, &v28, self->precision, &v22);
  -[ETTaskDefinition setInferenceGraphNetPtr:](self, "setInferenceGraphNetPtr:", &v22);
  v10 = v23;
  if (v23)
  {
    v11 = (unint64_t *)&v23->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v25;
  if (v25)
  {
    v14 = (unint64_t *)&v25->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  update_layer_index(&v24, (uint64_t)&self->inference_layer_index);
  v16 = v25;
  if (v25)
  {
    v17 = (unint64_t *)&v25->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  -[ETTaskDefinition shareWeights](self, "shareWeights");
  v19 = v29;
  if (v29)
  {
    v20 = (unint64_t *)&v29->__shared_owners_;
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

- (void)shareWeights
{
  void *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *i;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  -[ETVariablesDefinition layerNames](self->varsDef, "layerNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)())v24->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v6 = *(uint64_t **)(v23 + 32);
    for (i = *(uint64_t **)(v23 + 40); v6 != i; v6 += 2)
    {
      v9 = *v6;
      v8 = (std::__shared_weak_count *)v6[1];
      if (v8)
      {
        v10 = (unint64_t *)&v8->__shared_owners_;
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      -[ETVariablesDefinition layerNames](self->varsDef, "layerNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9 + 16;
      if (*(char *)(v9 + 39) < 0)
        v13 = *(_QWORD *)(v9 + 16);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "containsObject:", v14);

      if ((v15 & 1) == 0)
      {
        v16 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::find<std::string>(&self->inference_layer_index.__table_.__bucket_list_.__ptr_.__value_, v9 + 16);
        if (v16)
        {
          -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 16))(v9, *(_QWORD *)(v21 + 32) + 16 * v16[5]);
          if (v22)
          {
            v17 = (unint64_t *)&v22->__shared_owners_;
            do
              v18 = __ldaxr(v17);
            while (__stlxr(v18 - 1, v17));
            if (!v18)
            {
              ((void (*)())v22->__on_zero_shared)();
              std::__shared_weak_count::__release_weak(v22);
            }
          }
        }
      }
      if (v8)
      {
        v19 = (unint64_t *)&v8->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
  }
}

- (void)setupShapes:(void *)a3 forBlobs:(id)a4 withError:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void **v11;
  void *v12;
  BOOL v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  char *v21;
  __int128 v22;
  id obj;
  void **v24;
  std::__shared_weak_count *v25;
  _OWORD v26[2];
  uint64_t v27;
  void *__p;
  _BYTE *v29;
  void *v30[2];
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void **v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        std::string::basic_string[abi:ne180100]<0>(v30, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i)), "UTF8String"));
        if (v31 >= 0)
          v11 = v30;
        else
          v11 = (void **)v30[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Queried tensor '%s' not found in network"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v13 = find_or_create_error<std::string,std::shared_ptr<Espresso::abstract_blob_container>>((_QWORD *)(*(_QWORD *)&v26[0] + 136), (unsigned __int8 *)v30, a5, v12);
        v14 = (std::__shared_weak_count *)*((_QWORD *)&v26[0] + 1);
        if (*((_QWORD *)&v26[0] + 1))
        {
          v15 = (unint64_t *)(*((_QWORD *)&v26[0] + 1) + 8);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }

        if (!v13)
        {
          if (v31 < 0)
            operator delete(v30[0]);
          goto LABEL_31;
        }
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v36 = v30;
        v17 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v24 + 17), (unsigned __int8 *)v30, (__int128 **)&v36);
        Espresso::abstract_blob_container::shape((char *)v26, *((_QWORD *)v17 + 5));
        v18 = v25;
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v20 = __ldaxr(p_shared_owners);
          while (__stlxr(v20 - 1, p_shared_owners));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
        }
        v24 = v30;
        v21 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a3, (unsigned __int8 *)v30, (__int128 **)&v24);
        v22 = v26[1];
        *(_OWORD *)(v21 + 40) = v26[0];
        *(_OWORD *)(v21 + 56) = v22;
        *((_QWORD *)v21 + 9) = v27;
        if (v21 + 40 != (char *)v26)
          std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v21 + 80, (char *)__p, (uint64_t)v29, (v29 - (_BYTE *)__p) >> 2);
        if (__p)
        {
          v29 = __p;
          operator delete(__p);
        }
        if (v31 < 0)
          operator delete(v30[0]);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_31:

}

- (void)setupInputOutputShapes:(id *)a3
{
  char *data;
  id v6;
  uint64_t v7;
  int64_t var0;
  unint64_t size;
  id v10;
  id v11;
  id v12;
  id v13;

  data = self->optimizer_control_name.__r_.__value_.var0.__l.__data_;
  v13 = 0;
  -[ETTaskDefinition setupShapes:forBlobs:withError:](self, "setupShapes:forBlobs:withError:", &self->infInputBlobShapes.__table_.__p3_, data, &v13);
  v6 = v13;
  if (v6)
    goto LABEL_5;
  v7 = *((_QWORD *)&self->optimizer_control_name.__r_.__value_.var0.__l + 2);
  v12 = 0;
  -[ETTaskDefinition setupShapes:forBlobs:withError:](self, "setupShapes:forBlobs:withError:", &self->trainInputBlobShapes.__table_.__p3_, v7, &v12);
  v6 = v12;
  if (v6)
    goto LABEL_5;
  var0 = self->gradient_control_name.var0;
  v11 = 0;
  -[ETTaskDefinition setupShapes:forBlobs:withError:](self, "setupShapes:forBlobs:withError:", &self->optimizer_control_name.__r_.var0, var0, &v11);
  v6 = v11;
  if (v6
    || (size = self->optimizer_control_name.__r_.__value_.var0.__l.__size_,
        v10 = 0,
        -[ETTaskDefinition setupShapes:forBlobs:withError:](self, "setupShapes:forBlobs:withError:", &self->trainOutputNames, size, &v10), (v6 = v10) != 0))
  {
LABEL_5:
    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
    }
  }

}

- (void)checkShapes:(const void *)a3 withSample:(const void *)a4 withError:(id *)a5
{
  unint64_t v5;
  id v7;
  void *v8;
  void *v9;
  char *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  unsigned __int8 *v15;
  BOOL v16;
  _BOOL4 v17;
  unsigned __int8 *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  int8x16_t v23;
  unint64_t v24;
  int v25;
  __int32 v26;
  _BOOL4 v27;
  int v28;
  unint64_t v29;
  void *v30;
  int v31;
  std::string::size_type v32;
  std::string *v33;
  std::string *p_p;
  void *v35;
  void *v36;
  void *v37;
  unint64_t *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int32x4_t v43;
  std::string __p;
  std::string v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  int v52;
  int8x16_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = *((_QWORD *)a3 + 3);
  if (v5 <= *((_QWORD *)a4 + 3))
  {
    v11 = (char *)a3 + 16;
    v42 = *MEMORY[0x1E0CB2D50];
    v12 = 0x1E0CB3000uLL;
    while (1)
    {
      v11 = *(char **)v11;
      if (!v11)
        return;
      v13 = v11 + 16;
      v14 = v11 + 16;
      if (v11[39] < 0)
        v14 = *(char **)v13;
      objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("tensor of name %s not provided by data provider"), v14);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v15 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a4, (unsigned __int8 *)v11 + 16);
      if (v15)
        v16 = 1;
      else
        v16 = a5 == 0;
      if (!v16)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v51[0] = v42;
        v53.i64[0] = (uint64_t)v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, v51, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v41);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_51;
      }
      v17 = v15 != 0;

      if (!v17)
        return;
      v18 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a4, (unsigned __int8 *)v11 + 16);
      if (!v18)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      v19 = *((_QWORD *)v18 + 5);
      v20 = (std::__shared_weak_count *)*((_QWORD *)v18 + 6);
      v47 = v19;
      v48 = v20;
      if (v20)
      {
        p_shared_owners = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldxr(p_shared_owners);
        while (__stxr(v22 + 1, p_shared_owners));
      }
      v43 = *(int32x4_t *)(v19 + 8);
      v23 = (int8x16_t)vrev64q_s32(v43);
      v53 = vextq_s8(v23, v23, 8uLL);
      v54 = 0x400000000;
      Espresso::layer_nd_shape::layer_nd_shape((uint64_t)v51, (const Espresso::layer_shape *)(v11 + 40), 0);
      if (v52 == 4)
        break;
      if (a5)
        goto LABEL_30;
LABEL_41:
      v28 = 1;
      if (!v20)
        goto LABEL_46;
LABEL_42:
      v38 = (unint64_t *)&v20->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
        if (v28)
          return;
      }
      else
      {
LABEL_46:
        if (v28)
          return;
      }
    }
    if (LODWORD(v51[0]) == v43.i32[3])
    {
      v24 = 0;
      while (v52 - 1 != v24)
      {
        v25 = *((_DWORD *)v51 + v24 + 1);
        v26 = v53.i32[++v24];
        if (v25 != v26)
          goto LABEL_27;
      }
      v24 = v52;
LABEL_27:
      v27 = v24 >= v52;
    }
    else
    {
      v27 = 0;
    }
    v28 = !v27;
    if (!a5 || v27)
      goto LABEL_42;
LABEL_30:
    if (v11[39] < 0)
      v13 = *(char **)v13;
    v29 = v12;
    v30 = *(void **)(v12 + 2368);
    Espresso::layer_nd_shape::repr(&v46, (uint64_t)v51);
    v31 = SHIBYTE(v46.__r_.__value_.__r.__words[2]);
    v32 = v46.__r_.__value_.__r.__words[0];
    Espresso::layer_nd_shape::repr(&__p, (uint64_t)&v53);
    v33 = &v46;
    if (v31 < 0)
      v33 = (std::string *)v32;
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v30, "stringWithFormat:", CFSTR("inconsistent shape of tensor %s between tensor in network and tensor provided by data loader: %s vs %s"), v13, v33, p_p);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v46.__r_.__value_.__l.__data_);
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v49 = v42;
    v50 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v37);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_41;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("number tensors from data provider == %lu < number of requested tensors == %lu"), *((_QWORD *)a4 + 3), v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_51:
  }
}

- (id)description
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t j;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  unint64_t k;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  unint64_t *v39;
  unint64_t v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  unint64_t i;
  id v58;
  _OWORD v59[2];
  __int128 v60;
  void **v61[2];

  v58 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v58, "appendFormat:", CFSTR("Training Graph:\n"));
  for (i = 0; ; ++i)
  {
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v2 = (std::__shared_weak_count *)*((_QWORD *)&v59[0] + 1);
    v4 = *(_QWORD *)(*(_QWORD *)&v59[0] + 32);
    v3 = *(_QWORD *)(*(_QWORD *)&v59[0] + 40);
    if (*((_QWORD *)&v59[0] + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v59[0] + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
    if ((v3 - v4) >> 4 <= i)
      break;
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v7 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&v59[0] + 32) + 16 * i);
    v60 = v7;
    if (*((_QWORD *)&v7 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v59[0] + 1);
    if (*((_QWORD *)&v59[0] + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v59[0] + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    for (j = 0; ; ++j)
    {
      v14 = v60;
      Espresso::layer_data::shapes((Espresso::layer_data *)v59, *(uint64_t **)(v60 + 80), *(uint64_t **)(v60 + 88));
      v15 = *((_QWORD *)&v59[0] + 1) - *(_QWORD *)&v59[0];
      v61[0] = (void **)v59;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](v61);
      if (j >= v15 >> 6)
        break;
      v16 = *(_OWORD *)(*(_QWORD *)(v14 + 80) + 16 * j);
      v59[0] = v16;
      v17 = v16;
      if (*((_QWORD *)&v16 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
        do
          v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
      }
      v20 = (_QWORD *)(v14 + 16);
      if (*(char *)(v14 + 39) < 0)
        v20 = (_QWORD *)*v20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(unsigned int *)(v17 + 8);
      v23 = *(unsigned int *)(v17 + 12);
      v25 = *(unsigned int *)(v17 + 16);
      v24 = *(unsigned int *)(v17 + 20);
      v27 = *(unsigned int *)(v17 + 24);
      v26 = *(unsigned int *)(v17 + 28);
      v28 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v17 + 24))(v17);
      objc_msgSend(v58, "appendFormat:", CFSTR("Src[%d]: %@ (layer[%d]) [w:%d,h:%d,k:%d,n:%d,seq:%d,rank:%d,platform:%d,computePath:%d]... \t\tdata at 0: %f\n"), j, v21, i, v22, v23, v25, v24, v27, v26, v28, (*(uint64_t (**)(_QWORD))(*(_QWORD *)v17 + 32))(v17), **(float **)(*(_QWORD *)(v17 + 160) + 24));

      if (*((_QWORD *)&v17 + 1))
      {
        v29 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v17 + 1) + 16))(*((_QWORD *)&v17 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v17 + 1));
        }
      }
    }
    v31 = (_QWORD *)(v14 + 16);
    if (*(char *)(v14 + 39) < 0)
      v31 = (_QWORD *)*v31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (_QWORD *)(v14 + 40);
    if (*(char *)(v14 + 63) < 0)
      v33 = (_QWORD *)*v33;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "appendFormat:", CFSTR("%@: layer[%d], kernel type: %@, layerPlatform: %d, layerComputePlatform: %d\n"), v32, i, v34, *(unsigned int *)(v14 + 8), *(unsigned int *)(v14 + 12));

    for (k = 0; ; ++k)
    {
      Espresso::layer_data::shapes((Espresso::layer_data *)v59, *(uint64_t **)(v14 + 104), *(uint64_t **)(v14 + 112));
      v36 = *((_QWORD *)&v59[0] + 1) - *(_QWORD *)&v59[0];
      v61[0] = (void **)v59;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](v61);
      if (k >= v36 >> 6)
        break;
      v37 = *(_OWORD *)(*(_QWORD *)(v14 + 104) + 16 * k);
      v59[0] = v37;
      v38 = v37;
      if (*((_QWORD *)&v37 + 1))
      {
        v39 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
        do
          v40 = __ldxr(v39);
        while (__stxr(v40 + 1, v39));
      }
      v41 = (_QWORD *)(v14 + 16);
      if (*(char *)(v14 + 39) < 0)
        v41 = (_QWORD *)*v41;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(unsigned int *)(v38 + 8);
      v44 = *(unsigned int *)(v38 + 12);
      v46 = *(unsigned int *)(v38 + 16);
      v45 = *(unsigned int *)(v38 + 20);
      v48 = *(unsigned int *)(v38 + 24);
      v47 = *(unsigned int *)(v38 + 28);
      v49 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v38 + 24))(v38);
      objc_msgSend(v58, "appendFormat:", CFSTR("Dst[%d]: %@ (layer[%d]) [w:%d,h:%d,k:%d,n:%d,seq:%d,rank:%d,platform:%d,computePath:%d]... \t\tdata at 0: %f\n"), k, v42, i, v43, v44, v46, v45, v48, v47, v49, (*(uint64_t (**)(_QWORD))(*(_QWORD *)v38 + 32))(v38), **(float **)(*(_QWORD *)(v38 + 160) + 24));

      if (*((_QWORD *)&v38 + 1))
      {
        v50 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
        do
          v51 = __ldaxr(v50);
        while (__stlxr(v51 - 1, v50));
        if (!v51)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v38 + 1) + 16))(*((_QWORD *)&v38 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v38 + 1));
        }
      }
      v14 = v60;
    }
    objc_msgSend(v58, "appendFormat:", CFSTR("\n"));
    v52 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
    if (*((_QWORD *)&v60 + 1))
    {
      v53 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
  }
  return v58;
}

- (ETTaskDefinition)initWithModelDefinition:(id)a3 lossDefinition:(id)a4 variablesDefinition:(id)a5 optimizerDefinition:(id)a6 forPlatform:(unint64_t)a7 error:(id *)a8
{
  void *v12;
  void *v13;
  void *v14;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  ETTaskDefinition *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  ETTaskDefinition *v33;
  void *v34;
  id v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  void *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t i;
  std::__shared_weak_count *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  int v64;
  _QWORD *v65;
  uint64_t v66;
  BOOL v67;
  int v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  int v74;
  uint64_t *v75;
  int v76;
  _BOOL4 v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  _BOOL4 v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void **v97;
  unint64_t *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t *v101;
  unint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  void (***v109)(uint64_t *__return_ptr, _QWORD);
  unint64_t *v110;
  unint64_t v111;
  void *v112;
  void *v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  _QWORD *v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  void *v124;
  _QWORD *v125;
  _QWORD *v126;
  void *v127;
  id v128;
  std::__shared_weak_count *v129;
  unint64_t *v130;
  unint64_t v131;
  std::__shared_weak_count *v132;
  unint64_t *v133;
  unint64_t v134;
  void *v135;
  BOOL v136;
  uint64_t shared_owners;
  uint64_t shared_weak_owners;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  int v144;
  void *v145;
  uint64_t j;
  id v147;
  int v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint8x8_t v152;
  unint64_t v153;
  void **v154;
  char *v155;
  unint64_t v156;
  float v157;
  _BOOL8 v158;
  unint64_t v159;
  unint64_t v160;
  size_t v161;
  uint64_t v162;
  _QWORD *v163;
  unint64_t v164;
  uint64_t v165;
  __int128 v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  uint64_t *v170;
  int v171;
  uint64_t *v172;
  int v173;
  unint64_t *v175;
  unint64_t v176;
  ETTaskDefinition *v177;
  void *v178;
  void *v179;
  uint64_t **k;
  uint64_t *v181;
  unint64_t v182;
  std::__shared_weak_count *v183;
  unint64_t *v184;
  unint64_t v185;
  char *v186;
  std::__shared_weak_count *v187;
  unint64_t *v188;
  unint64_t v189;
  _QWORD *v190;
  std::__shared_weak_count *v191;
  unint64_t *v192;
  unint64_t v193;
  unsigned __int8 *v194;
  unsigned __int8 *v195;
  _QWORD *v196;
  unsigned __int8 *v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  unint64_t batchSize;
  char *v202;
  void *v203;
  _QWORD *v204;
  unsigned __int8 *v205;
  unsigned __int8 *v206;
  std::__shared_weak_count *v207;
  unint64_t *v208;
  unint64_t v209;
  std::__shared_weak_count *v210;
  unint64_t *v211;
  unint64_t v212;
  std::__shared_weak_count *v213;
  unint64_t *v214;
  unint64_t v215;
  int precision;
  unint64_t *v217;
  unint64_t v218;
  std::__shared_weak_count *v219;
  unint64_t *v220;
  unint64_t v221;
  id v222;
  void *v223;
  void *v224;
  std::__shared_weak_count *v225;
  unint64_t *v226;
  unint64_t v227;
  uint64_t *p_inferenceModel;
  uint64_t v229;
  uint64_t v230;
  id v231;
  unsigned __int8 *v232;
  ETTaskDefinition *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  id v239;
  id v240;
  id v241;
  id v242;
  size_t v243;
  std::string *p_sz;
  __int128 *v245;
  char *v246;
  std::__shared_weak_count *size;
  unint64_t *v248;
  unint64_t v249;
  unint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  __int128 v254;
  uint64_t v255;
  __int128 v256;
  uint64_t m;
  uint64_t n;
  std::__shared_weak_count *v259;
  unint64_t *v260;
  unint64_t v261;
  void *v262;
  __int128 v263;
  char *v264;
  std::__shared_weak_count *v265;
  unint64_t *v266;
  unint64_t v267;
  std::__shared_weak_count *v268;
  unint64_t *v269;
  unint64_t v270;
  std::__shared_weak_count *v271;
  unint64_t *v272;
  unint64_t v273;
  std::__shared_weak_count *v274;
  unint64_t *v275;
  unint64_t v276;
  std::__shared_weak_count *v277;
  unint64_t *v278;
  unint64_t v279;
  std::__shared_weak_count *v280;
  unint64_t *v281;
  unint64_t v282;
  void *v283;
  void *v284;
  float v285;
  float v286;
  void *v287;
  void *v288;
  float v289;
  float v290;
  void *v291;
  void *v292;
  float v293;
  float v294;
  void *v295;
  void *v296;
  float v297;
  float v298;
  ETTaskDefinition *v299;
  void *v300;
  void *v301;
  float v302;
  float v303;
  void *v304;
  void *v305;
  float v306;
  float v307;
  uint64_t *v308;
  unint64_t v309;
  Espresso::net *v310;
  std::__shared_weak_count *v311;
  unint64_t *v312;
  unint64_t v313;
  std::__shared_weak_count *v314;
  unint64_t *v315;
  unint64_t v316;
  _QWORD *v317;
  std::__shared_weak_count *v318;
  unint64_t *v319;
  unint64_t v320;
  _QWORD *v321;
  _QWORD *v322;
  _QWORD *v323;
  void *v324;
  _QWORD *v325;
  _QWORD *v326;
  void *v327;
  id v328;
  void *v329;
  id v330;
  void *v331;
  id v332;
  std::__shared_weak_count *v333;
  unint64_t *v334;
  unint64_t v335;
  std::__shared_weak_count *v336;
  unint64_t *v337;
  unint64_t v338;
  std::__shared_weak_count *v339;
  unint64_t *v340;
  unint64_t v341;
  std::__shared_weak_count *v342;
  unint64_t *v343;
  unint64_t v344;
  void *v345;
  std::__shared_weak_count *v346;
  unint64_t *v347;
  unint64_t v348;
  std::__shared_weak_count *v349;
  uint64_t *v350;
  unint64_t v351;
  std::__shared_weak_count *v352;
  unint64_t *v353;
  unint64_t v354;
  unint64_t *v355;
  std::__shared_weak_count *v356;
  unint64_t *v357;
  unint64_t v358;
  uint64_t p_size;
  uint64_t p_var0;
  uint64_t p_training_control_name;
  id v363;
  id v364;
  id v366;
  id v368;
  id v369;
  id v370;
  id obj;
  int v372;
  ETTaskDefinition *v373;
  _Unwind_Exception *exception_object;
  _Unwind_Exception *exception_objecta;
  id v376;
  id v377;
  uint64_t v378[2];
  uint64_t v379[3];
  std::__shared_weak_count *v380;
  std::string::size_type v381[3];
  uint64_t v382;
  std::__shared_weak_count *v383;
  uint64_t v384[3];
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  std::__shared_weak_count *v389;
  uint64_t v390[3];
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  std::__shared_weak_count *v395;
  uint64_t v396[3];
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  std::__shared_weak_count *v401;
  uint64_t v402[3];
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406[2];
  char v407;
  void *v408[2];
  char v409;
  uint64_t v410;
  std::__shared_weak_count *v411;
  std::string __s;
  uint64_t v413;
  unint64_t v414;
  char v415;
  __int128 v416;
  uint64_t v417;
  char v418;
  uint64_t v419;
  std::string v420;
  int v421;
  uint64_t v422;
  std::string v423;
  _OWORD v424[2];
  uint64_t v425;
  void *v426;
  void *v427;
  uint64_t v428;
  void *v429;
  char v430;
  std::string *v431;
  std::string *v432;
  std::string *v433;
  std::string *v434;
  std::string *v435;
  std::string *v436;
  std::string *v437;
  std::string *v438;
  std::string *v439;
  std::string *v440;
  std::string *v441;
  std::string *v442;
  std::string *v443;
  std::string *v444;
  std::string *v445;
  std::string *v446;
  std::string *v447;
  std::string *v448;
  std::string *v449;
  std::string *v450;
  void **p_data;
  std::string *v452;
  std::string *v453;
  std::string *v454;
  std::string *v455;
  std::string *v456;
  std::string *v457;
  void *v458;
  _BYTE *v459;
  char *v460;
  std::string v461;
  std::string v462;
  uint64_t v463;
  int v464;
  int v465;
  unint64_t v466;
  uint64_t v467;
  uint64_t v468;
  void *v469;
  void *v470;
  uint64_t v471;
  void *v472;
  char v473;
  std::string __sz;
  __int128 v475;
  uint64_t v476;
  uint64_t v477[2];
  uint64_t v478[2];
  uint64_t v479;
  std::__shared_weak_count *v480;
  void *v481[2];
  uint64_t *v482[2];
  int v483;
  void *v484;
  char v485;
  uint64_t v486;
  std::__shared_weak_count *v487;
  std::__shared_weak_count *v488;
  std::__shared_weak_count *v489;
  uint64_t v490;
  Espresso *v491;
  std::__shared_weak_count *v492;
  uint64_t v493;
  std::__shared_weak_count *v494;
  char v495[8];
  char *v496;
  char *v497[3];
  char **v498;
  char *v499[2];
  std::__shared_weak_count *v500;
  std::__shared_weak_count *v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  uint64_t v506;
  int v507[2];
  uint64_t v508;
  void *v509[2];
  __int128 v510;
  int v511;
  __int128 v512;
  __int128 v513;
  float v514;
  uint64_t v515;
  std::__shared_weak_count *v516;
  uint64_t v517;
  std::__shared_weak_count *v518;
  std::__shared_weak_count *v519;
  std::__shared_weak_count *v520;
  std::__shared_weak_count *v521;
  uint64_t v522[3];
  uint64_t v523;
  char v524;
  id v525;
  id v526;
  _QWORD v527[5];
  std::__shared_weak_count *v528;
  uint64_t v529;
  std::__shared_weak_count *v530;
  uint64_t v531;
  std::__shared_weak_count *v532;
  uint64_t v533;
  std::__shared_weak_count *v534;
  uint64_t v535;
  std::__shared_weak_count *v536;
  uint64_t v537;
  uint64_t v538;
  objc_super v539;
  void **v540;
  uint64_t v541;
  const __CFString *v542;
  void *__p[2];
  _BYTE v544[24];
  void *v545;
  __int128 v546[14];
  void *v547;
  char v548;
  uint64_t v549;
  void *v550;
  uint64_t v551;
  void *v552;
  std::string v553;
  __int128 v554;
  _QWORD v555[2];
  _BYTE v556[128];
  uint64_t v557;
  const __CFString *v558;
  uint64_t v559;
  const __CFString *v560;
  uint64_t v561;
  const __CFString *v562;
  uint64_t v563;
  _QWORD v564[4];

  v564[1] = *MEMORY[0x1E0C80C00];
  v369 = a3;
  v368 = a4;
  v366 = a5;
  v370 = a6;
  v539.receiver = self;
  v539.super_class = (Class)ETTaskDefinition;
  v373 = -[ETTaskDefinition init](&v539, sel_init);

  if (!v373)
  {
LABEL_25:
    v33 = 0;
    goto LABEL_616;
  }
  -[ETTaskDefinition setInferenceModel:](v373, "setInferenceModel:", v369);
  -[ETTaskDefinition setOptimizer:](v373, "setOptimizer:", v370);
  objc_storeStrong((id *)&v373->varsDef, a5);
  objc_msgSend(v370, "optimizationParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("batchSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v373->batchSize = objc_msgSend(v13, "unsignedIntegerValue");

  if (!v373->batchSize)
  {
    if (a8)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v563 = *MEMORY[0x1E0CB2D50];
      v564[0] = CFSTR("Batch size can't be 0/");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v564, &v563, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v32);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  v373->runtimePlatform = a7;
  p_training_control_name = (uint64_t)&v373->training_control_name;
  MEMORY[0x19401C808]();
  p_var0 = (uint64_t)&v373->training_control_name.__r_.var0;
  MEMORY[0x19401C808]();
  p_size = (uint64_t)&v373->gradient_control_name.__r_.__value_.var0.__l.__size_;
  MEMORY[0x19401C808]();
  LODWORD(__p[0]) = 80000;
  Espresso::create_context((int *)__p, &v537);
  (*(void (**)(uint64_t))(*(_QWORD *)v537 + 96))(v537);
  v373->precision = 0;
  objc_msgSend(v369, "modelURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v15, "UTF8String"));
  Espresso::load_network((uint64_t)__p, &v537, v373->precision, 0, &v535);
  -[ETTaskDefinition setInferenceGraphNetPtr:](v373, "setInferenceGraphNetPtr:", &v535);
  v16 = v536;
  if (v536)
  {
    p_shared_owners = (unint64_t *)&v536->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if ((v544[7] & 0x80000000) != 0)
    operator delete(__p[0]);

  -[ETTaskDefinition inferenceGraphNetPtr](v373, "inferenceGraphNetPtr");
  v19 = __p[0];
  v20 = (std::__shared_weak_count *)__p[1];
  if (!__p[1])
    goto LABEL_14;
  v21 = (unint64_t *)((char *)__p[1] + 8);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    if (v19)
    {
LABEL_15:
      objc_msgSend(v369, "modelURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".espresso.net"), CFSTR("_updatable.espresso.net"));
      v363 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "fileExistsAtPath:", v363);

      if (v26)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v363), "UTF8String"));
        v27 = v373;
        Espresso::load_network((uint64_t)__p, &v537, v373->precision, 0, &v533);
        -[ETTaskDefinition setTrainingGraphNetPtr:](v373, "setTrainingGraphNetPtr:", &v533);
        v28 = v534;
        if (v534)
        {
          v29 = (unint64_t *)&v534->__shared_owners_;
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 - 1, v29));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
            std::__shared_weak_count::__release_weak(v28);
          }
        }
        if ((v544[7] & 0x80000000) != 0)
          operator delete(__p[0]);
      }
      else
      {
        objc_msgSend(v369, "modelURL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "path");
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v35, "UTF8String"));
        Espresso::load_network((uint64_t)__p, &v537, v373->precision, 0, &v531);
        -[ETTaskDefinition setTrainingGraphNetPtr:](v373, "setTrainingGraphNetPtr:", &v531);
        v36 = v532;
        if (v532)
        {
          v37 = (unint64_t *)&v532->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        if ((v544[7] & 0x80000000) != 0)
          operator delete(__p[0]);

        v27 = v373;
      }
      -[ETTaskDefinition trainingGraphNetPtr](v27, "trainingGraphNetPtr");
      v39 = __p[0];
      v40 = (std::__shared_weak_count *)__p[1];
      if (!__p[1])
        goto LABEL_38;
      v41 = (unint64_t *)((char *)__p[1] + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
        if (v39)
        {
LABEL_39:
          -[ETTaskDefinition inferenceGraphNetPtr](v27, "inferenceGraphNetPtr");
          update_layer_index((uint64_t *)__p, (uint64_t)&v27->inference_layer_index);
          v43 = (std::__shared_weak_count *)__p[1];
          if (__p[1])
          {
            v44 = (unint64_t *)((char *)__p[1] + 8);
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
          -[ETTaskDefinition shareWeights](v27, "shareWeights");
          v372 = v26;
          -[ETTaskDefinition trainingGraphNetPtr](v27, "trainingGraphNetPtr");
          v46 = (std::__shared_weak_count *)__p[1];
          v48 = *((_QWORD *)__p[0] + 4);
          v47 = *((_QWORD *)__p[0] + 5);
          if (__p[1])
          {
            v49 = (unint64_t *)((char *)__p[1] + 8);
            do
              v50 = __ldaxr(v49);
            while (__stlxr(v50 - 1, v49));
            if (!v50)
            {
              ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
              std::__shared_weak_count::__release_weak(v46);
            }
          }
          -[ETTaskDefinition trainingGraphNetPtr](v27, "trainingGraphNetPtr");
          v51 = (v47 - v48) >> 4;
          v52 = (std::__shared_weak_count *)__p[1];
          v53 = (uint64_t)(*((_QWORD *)__p[0] + 5) - *((_QWORD *)__p[0] + 4)) >> 4;
          if (__p[1])
          {
            v54 = (unint64_t *)((char *)__p[1] + 8);
            do
              v55 = __ldaxr(v54);
            while (__stlxr(v55 - 1, v54));
            if (!v55)
            {
              ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
              std::__shared_weak_count::__release_weak(v52);
            }
          }
          exception_object = (_Unwind_Exception *)&v373->varsDef;
          for (i = 0; ; ++i)
          {
            -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
            v57 = (std::__shared_weak_count *)__p[1];
            v59 = *((_QWORD *)__p[0] + 4);
            v58 = *((_QWORD *)__p[0] + 5);
            if (__p[1])
            {
              v60 = (unint64_t *)((char *)__p[1] + 8);
              do
                v61 = __ldaxr(v60);
              while (__stlxr(v61 - 1, v60));
              if (!v61)
              {
                ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
                std::__shared_weak_count::__release_weak(v57);
              }
            }
            if (i >= (v58 - v59) >> 4)
              break;
            -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
            v62 = *(_QWORD *)(*((_QWORD *)__p[0] + 4) + 16 * i);
            v63 = (_QWORD *)(v62 + 16);
            v64 = *(char *)(v62 + 39);
            if (v64 < 0)
            {
              if (*(_QWORD *)(v62 + 24) != 11)
              {
LABEL_72:
                v68 = 0;
                goto LABEL_73;
              }
              v63 = (_QWORD *)*v63;
            }
            else if (v64 != 11)
            {
              goto LABEL_72;
            }
            v65 = (_QWORD *)*v63;
            v66 = *(_QWORD *)((char *)v63 + 3);
            v67 = v65 == (_QWORD *)0x6E696172745F7369 && v66 == 0x676E696E69617274;
            v68 = v67;
LABEL_73:
            v69 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v70 = (unint64_t *)((char *)__p[1] + 8);
              do
                v71 = __ldaxr(v70);
              while (__stlxr(v71 - 1, v70));
              if (!v71)
              {
                ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
                std::__shared_weak_count::__release_weak(v69);
              }
            }
            if (v68)
              v51 = i;
            -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
            v72 = *(_QWORD *)(*((_QWORD *)__p[0] + 4) + 16 * i);
            v73 = (uint64_t *)(v72 + 16);
            v74 = *(char *)(v72 + 39);
            if (v74 < 0)
            {
              if (*(_QWORD *)(v72 + 24) != 12)
              {
LABEL_91:
                v78 = 0;
                goto LABEL_92;
              }
              v73 = (uint64_t *)*v73;
            }
            else if (v74 != 12)
            {
              goto LABEL_91;
            }
            v75 = (uint64_t *)*v73;
            v76 = *((_DWORD *)v73 + 2);
            v78 = v75 == (uint64_t *)0x696172745F646E65 && v76 == 1735289198;
LABEL_92:
            v79 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v80 = (unint64_t *)((char *)__p[1] + 8);
              do
                v81 = __ldaxr(v80);
              while (__stlxr(v81 - 1, v80));
              if (!v81)
              {
                ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
                std::__shared_weak_count::__release_weak(v79);
              }
            }
            if (v78)
              v53 = i;
          }
          v82 = (unint64_t)v373;
          -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
          v83 = (std::__shared_weak_count *)__p[1];
          v84 = (uint64_t)(*((_QWORD *)__p[0] + 5) - *((_QWORD *)__p[0] + 4)) >> 4;
          if (__p[1])
          {
            v85 = (unint64_t *)((char *)__p[1] + 8);
            do
              v86 = __ldaxr(v85);
            while (__stlxr(v86 - 1, v85));
            if (!v86)
            {
              ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
              std::__shared_weak_count::__release_weak(v83);
            }
          }
          if (!((v84 != v51 < v53) & (__PAIR128__(v84, v51) >= v53)))
          {
LABEL_172:
            v524 = 1;
            -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
            Espresso::gradient_builder::gradient_builder((uint64_t)&v519, &v517, &v524);
            v129 = v518;
            if (v518)
            {
              v130 = (unint64_t *)&v518->__shared_owners_;
              do
                v131 = __ldaxr(v130);
              while (__stlxr(v131 - 1, v130));
              if (!v131)
              {
                ((void (*)(std::__shared_weak_count *))v129->__on_zero_shared)(v129);
                std::__shared_weak_count::__release_weak(v129);
              }
            }
            Espresso::gradient_builder::preprocess_network(&v519, &v515);
            v132 = v516;
            if (v516)
            {
              v133 = (unint64_t *)&v516->__shared_owners_;
              do
                v134 = __ldaxr(v133);
              while (__stlxr(v134 - 1, v133));
              if (!v134)
              {
                ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
                std::__shared_weak_count::__release_weak(v132);
              }
            }
            v513 = 0u;
            v512 = 0u;
            v514 = 1.0;
            v510 = 0u;
            *(_OWORD *)v509 = 0u;
            v511 = 1065353216;
            *(_QWORD *)v507 = 0;
            v506 = 0;
            v508 = 0;
            objc_msgSend((id)exception_object->exception_class, "layerNames");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = v135 == 0;

            if (v136)
            {
              v177 = v373;
              Espresso::gradient_builder::net_training_transform((Espresso::gradient_builder *)&v519, (uint64_t)__p);
              v511 = *(_DWORD *)&v544[16];
              std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,void *> *>>(v509, *(uint64_t **)v544);
              std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(*(_QWORD **)v544);
              goto LABEL_268;
            }
            shared_owners = v519[1].__shared_owners_;
            shared_weak_owners = v519[1].__shared_weak_owners_;
            *(_OWORD *)v544 = 0u;
            *(_OWORD *)__p = 0u;
            *(_DWORD *)&v544[16] = 1065353216;
            v139 = shared_weak_owners - shared_owners;
            if (shared_weak_owners != shared_owners)
            {
              v140 = 0;
              v141 = 0;
              do
              {
                v481[0] = (void *)(*(_QWORD *)(shared_owners + v140) + 16);
                *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v481[0], (uint64_t)&std::piecewise_construct, (__int128 **)v481)+ 10) = v141++;
                shared_owners = v519[1].__shared_owners_;
                v140 += 16;
              }
              while (v141 < (v519[1].__shared_weak_owners_ - shared_owners) >> 4);
            }
            v505 = 0u;
            v504 = 0u;
            v503 = 0u;
            v502 = 0u;
            objc_msgSend((id)exception_object->exception_class, "layerNames");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v142 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v502, v556, 16);
            v143 = v139 >> 4;
            if (v142)
            {
              exception_objecta = *(_Unwind_Exception **)v503;
              v144 = -1;
              v145 = obj;
              while (1)
              {
                for (j = 0; j != v142; ++j)
                {
                  if (*(_Unwind_Exception **)v503 != exception_objecta)
                    objc_enumerationMutation(v145);
                  v147 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v502 + 1) + 8 * j));
                  std::string::basic_string[abi:ne180100]<0>(v481, (char *)objc_msgSend(v147, "UTF8String"));
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)v481;
                  v148 = *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v481, (uint64_t)&std::piecewise_construct, (__int128 **)&v553)+ 10);
                  if (v148 < (int)v143)
                    LODWORD(v143) = v148;
                  if (v148 > v144)
                    v144 = v148;
                  std::string::basic_string[abi:ne180100]<0>(&v553, (char *)objc_msgSend(objc_retainAutorelease(v147), "UTF8String"));
                  v149 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v553);
                  v150 = v149;
                  v151 = *((_QWORD *)&v512 + 1);
                  if (*((_QWORD *)&v512 + 1))
                  {
                    v152 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v512 + 8));
                    v152.i16[0] = vaddlv_u8(v152);
                    v153 = v152.u32[0];
                    if (v152.u32[0] > 1uLL)
                    {
                      v82 = v149;
                      if (v149 >= *((_QWORD *)&v512 + 1))
                        v82 = v149 % *((_QWORD *)&v512 + 1);
                    }
                    else
                    {
                      v82 = (*((_QWORD *)&v512 + 1) - 1) & v149;
                    }
                    v154 = *(void ***)(v512 + 8 * v82);
                    if (v154)
                    {
                      v155 = (char *)*v154;
                      if (*v154)
                      {
                        while (1)
                        {
                          v156 = *((_QWORD *)v155 + 1);
                          if (v156 == v150)
                          {
                            if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v155 + 16, (unsigned __int8 *)&v553))
                            {
                              v145 = obj;
                              goto LABEL_234;
                            }
                          }
                          else
                          {
                            if (v153 > 1)
                            {
                              if (v156 >= v151)
                                v156 %= v151;
                            }
                            else
                            {
                              v156 &= v151 - 1;
                            }
                            if (v156 != v82)
                            {
LABEL_211:
                              v145 = obj;
                              break;
                            }
                          }
                          v155 = *(char **)v155;
                          if (!v155)
                            goto LABEL_211;
                        }
                      }
                    }
                  }
                  v155 = (char *)operator new(0x30uLL);
                  *(_QWORD *)v155 = 0;
                  *((_QWORD *)v155 + 1) = v150;
                  *(std::string *)(v155 + 16) = v553;
                  memset(&v553, 0, sizeof(v553));
                  v155[40] = 0;
                  v157 = (float)(unint64_t)(*((_QWORD *)&v513 + 1) + 1);
                  if (!v151 || (float)(v514 * (float)v151) < v157)
                  {
                    v158 = (v151 & (v151 - 1)) != 0;
                    if (v151 < 3)
                      v158 = 1;
                    v159 = v158 | (2 * v151);
                    v160 = vcvtps_u32_f32(v157 / v514);
                    if (v159 <= v160)
                      v161 = v160;
                    else
                      v161 = v159;
                    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__rehash<true>((uint64_t)&v512, v161);
                    v151 = *((_QWORD *)&v512 + 1);
                    if ((*((_QWORD *)&v512 + 1) & (*((_QWORD *)&v512 + 1) - 1)) != 0)
                    {
                      if (v150 >= *((_QWORD *)&v512 + 1))
                        v82 = v150 % *((_QWORD *)&v512 + 1);
                      else
                        v82 = v150;
                    }
                    else
                    {
                      v82 = (*((_QWORD *)&v512 + 1) - 1) & v150;
                    }
                  }
                  v162 = v512;
                  v163 = *(_QWORD **)(v512 + 8 * v82);
                  if (v163)
                  {
                    *(_QWORD *)v155 = *v163;
LABEL_232:
                    *v163 = v155;
                    goto LABEL_233;
                  }
                  *(_QWORD *)v155 = v513;
                  *(_QWORD *)&v513 = v155;
                  *(_QWORD *)(v162 + 8 * v82) = &v513;
                  if (*(_QWORD *)v155)
                  {
                    v164 = *(_QWORD *)(*(_QWORD *)v155 + 8);
                    if ((v151 & (v151 - 1)) != 0)
                    {
                      if (v164 >= v151)
                        v164 %= v151;
                    }
                    else
                    {
                      v164 &= v151 - 1;
                    }
                    v163 = (_QWORD *)(v512 + 8 * v164);
                    goto LABEL_232;
                  }
LABEL_233:
                  ++*((_QWORD *)&v513 + 1);
LABEL_234:
                  v155[40] = 1;
                  if (SHIBYTE(v553.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v553.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v482[0]) < 0)
                    operator delete(v481[0]);
                }
                v142 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v502, v556, 16);
                if (!v142)
                {

                  goto LABEL_241;
                }
              }
            }

            if ((v143 & 0x80000000) == 0)
            {
LABEL_265:
              Espresso::gradient_builder::net_training_transform((uint64_t)&v519, &v512, (uint64_t)v481);
              v511 = v483;
              v177 = v373;
              std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,void *> *>>(v509, v482[0]);
              std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(v482[0]);
              v178 = v481[0];
              v481[0] = 0;
              if (v178)
                operator delete(v178);
              std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__deallocate_node(*(void ***)v544);
LABEL_268:
              v179 = __p[0];
              __p[0] = 0;
              if (v179)
                operator delete(v179);
              for (k = (uint64_t **)v510; k; k = (uint64_t **)*k)
                std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((void **)&v506, *(uint64_t *)v507, (std::string *)k[5], (std::string *)k[6], 0xAAAAAAAAAAAAAAABLL * (k[6] - k[5]));
              v500 = v519;
              v501 = v520;
              if (v520)
              {
                v181 = &v520->__shared_owners_;
                do
                  v182 = __ldxr((unint64_t *)v181);
                while (__stxr(v182 + 1, (unint64_t *)v181));
              }
              -[ETTaskDefinition setTrainingGraphNetPtr:](v177, "setTrainingGraphNetPtr:", &v500);
              v183 = v501;
              if (v501)
              {
                v184 = (unint64_t *)&v501->__shared_owners_;
                do
                  v185 = __ldaxr(v184);
                while (__stlxr(v185 - 1, v184));
                if (!v185)
                {
                  ((void (*)(std::__shared_weak_count *))v183->__on_zero_shared)(v183);
                  std::__shared_weak_count::__release_weak(v183);
                }
              }
              v499[1] = 0;
              v499[0] = 0;
              v498 = v499;
              -[ETTaskDefinition trainingGraphNetPtr](v177, "trainingGraphNetPtr");
              v186 = (char *)__p[0];
              v187 = (std::__shared_weak_count *)__p[1];
              if (__p[1])
              {
                v188 = (unint64_t *)((char *)__p[1] + 8);
                do
                  v189 = __ldaxr(v188);
                while (__stlxr(v189 - 1, v188));
                if (!v189)
                {
                  ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
                  std::__shared_weak_count::__release_weak(v187);
                }
              }
              -[ETTaskDefinition trainingGraphNetPtr](v177, "trainingGraphNetPtr");
              v190 = __p[0];
              v191 = (std::__shared_weak_count *)__p[1];
              if (__p[1])
              {
                v192 = (unint64_t *)((char *)__p[1] + 8);
                do
                  v193 = __ldaxr(v192);
                while (__stlxr(v193 - 1, v192));
                if (!v193)
                {
                  ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
                  std::__shared_weak_count::__release_weak(v191);
                }
              }
              v194 = (unsigned __int8 *)v190[29];
              v195 = (unsigned __int8 *)(v190 + 30);
              if (v194 != v195)
              {
                v196 = v186 + 136;
                do
                {
                  v197 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v196, v194 + 32);
                  if (!v197)
                    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
                  v198 = *((_QWORD *)v197 + 5);
                  v199 = *(_QWORD *)(v198 + 8);
                  v200 = *(_DWORD *)(v198 + 16);
                  batchSize = v177->batchSize;
                  v481[0] = v194 + 32;
                  v202 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v498, (_QWORD *)v194 + 4, (__int128 **)v481);
                  *((_QWORD *)v202 + 7) = v199;
                  *((_DWORD *)v202 + 16) = v200;
                  *((_DWORD *)v202 + 17) = batchSize;
                  *((_QWORD *)v202 + 9) = 0xFFFFFFFF00000001;
                  *((_QWORD *)v202 + 10) = 0;
                  *((_QWORD *)v202 + 11) = 0;
                  v204 = v202 + 96;
                  v203 = (void *)*((_QWORD *)v202 + 12);
                  if (v203)
                  {
                    *((_QWORD *)v202 + 13) = v203;
                    operator delete(v203);
                    *v204 = 0;
                    v204[1] = 0;
                    v204[2] = 0;
                  }
                  *v204 = 0;
                  v204[1] = 0;
                  v204[2] = 0;
                  v205 = (unsigned __int8 *)*((_QWORD *)v194 + 1);
                  if (v205)
                  {
                    do
                    {
                      v206 = v205;
                      v205 = *(unsigned __int8 **)v205;
                    }
                    while (v205);
                  }
                  else
                  {
                    do
                    {
                      v206 = (unsigned __int8 *)*((_QWORD *)v194 + 2);
                      v67 = *(_QWORD *)v206 == (_QWORD)v194;
                      v194 = v206;
                    }
                    while (!v67);
                  }
                  v194 = v206;
                }
                while (v206 != v195);
              }
              -[ETTaskDefinition trainingGraphNetPtr](v177, "trainingGraphNetPtr");
              Espresso::compute_network_shape_starting_from_data_shapes(&v493, (uint64_t)&v498, (uint64_t)v495);
              v207 = v494;
              if (v494)
              {
                v208 = (unint64_t *)&v494->__shared_owners_;
                do
                  v209 = __ldaxr(v208);
                while (__stlxr(v209 - 1, v208));
                if (!v209)
                {
                  ((void (*)(std::__shared_weak_count *))v207->__on_zero_shared)(v207);
                  std::__shared_weak_count::__release_weak(v207);
                }
              }
              -[ETTaskDefinition trainingGraphNetPtr](v177, "trainingGraphNetPtr");
              Espresso::shape_network_recursive(v491, (Espresso::net *)v495, 0, 0);
              v210 = v492;
              if (v492)
              {
                v211 = (unint64_t *)&v492->__shared_owners_;
                do
                  v212 = __ldaxr(v211);
                while (__stlxr(v212 - 1, v211));
                if (!v212)
                {
                  ((void (*)(std::__shared_weak_count *))v210->__on_zero_shared)(v210);
                  std::__shared_weak_count::__release_weak(v210);
                }
              }
              -[ETTaskDefinition trainingGraphNetPtr](v177, "trainingGraphNetPtr");
              v213 = (std::__shared_weak_count *)v538;
              v478[0] = v537;
              v478[1] = v538;
              if (v538)
              {
                v214 = (unint64_t *)(v538 + 8);
                do
                  v215 = __ldxr(v214);
                while (__stxr(v215 + 1, v214));
              }
              precision = v177->precision;
              v477[1] = 0;
              v477[0] = 0;
              Espresso::sequential_builder::sequential_builder((uint64_t)v481, &v479, v478, precision, v477);
              if (v213)
              {
                v217 = (unint64_t *)&v213->__shared_owners_;
                do
                  v218 = __ldaxr(v217);
                while (__stlxr(v218 - 1, v217));
                if (!v218)
                {
                  ((void (*)(std::__shared_weak_count *))v213->__on_zero_shared)(v213);
                  std::__shared_weak_count::__release_weak(v213);
                }
              }
              v219 = v480;
              if (v480)
              {
                v220 = (unint64_t *)&v480->__shared_owners_;
                do
                  v221 = __ldaxr(v220);
                while (__stlxr(v221 - 1, v220));
                if (!v221)
                {
                  ((void (*)(std::__shared_weak_count *))v219->__on_zero_shared)(v219);
                  std::__shared_weak_count::__release_weak(v219);
                }
              }
              objc_msgSend(v368, "lossOutputName");
              v222 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              std::string::basic_string[abi:ne180100]<0>(&v475, (char *)objc_msgSend(v222, "UTF8String"));

              v223 = (void *)MEMORY[0x1E0C99DE8];
              -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
              objc_msgSend(v223, "arrayWithCapacity:", *((_QWORD *)__p[0] + 34));
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              v225 = (std::__shared_weak_count *)__p[1];
              if (__p[1])
              {
                v226 = (unint64_t *)((char *)__p[1] + 8);
                do
                  v227 = __ldaxr(v226);
                while (__stlxr(v227 - 1, v226));
                if (!v227)
                {
                  ((void (*)(std::__shared_weak_count *))v225->__on_zero_shared)(v225);
                  std::__shared_weak_count::__release_weak(v225);
                }
              }
              p_inferenceModel = (uint64_t *)&v373->_inferenceModel;
              Espresso::mark_block_start((uint64_t *)&v373->_inferenceModel, p_training_control_name, 1);
              v229 = objc_msgSend(v368, "mode");
              switch(v229)
              {
                case 1:
                  objc_msgSend(v368, "inputName");
                  v241 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(&v416, (char *)objc_msgSend(v241, "UTF8String"));

                  objc_msgSend(v368, "targetInputName");
                  v242 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(&__s, (char *)objc_msgSend(v242, "UTF8String"));

                  if (v417 >= 0)
                    v243 = HIBYTE(v417);
                  else
                    v243 = *((_QWORD *)&v416 + 1);
                  std::string::basic_string[abi:ne180100]((uint64_t)&__sz, v243 + 17);
                  if ((__sz.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    p_sz = &__sz;
                  else
                    p_sz = (std::string *)__sz.__r_.__value_.__r.__words[0];
                  v233 = v373;
                  if (v243)
                  {
                    if (v417 >= 0)
                      v245 = &v416;
                    else
                      v245 = (__int128 *)v416;
                    memmove(p_sz, v245, v243);
                  }
                  strcpy((char *)p_sz + v243, "_auxiliary_output");
                  *(_OWORD *)&v420.__r_.__value_.__l.__data_ = xmmword_191A93370;
                  v420.__r_.__value_.__r.__words[2] = 1;
                  v421 = 257;
                  -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
                  v461.__r_.__value_.__r.__words[0] = (std::string::size_type)&v416;
                  v246 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v553.__r_.__value_.__r.__words[0] + 136, (unsigned __int8 *)&v416, (__int128 **)&v461);
                  Espresso::abstract_blob_container::shape((char *)__p, *((_QWORD *)v246 + 5));
                  HIDWORD(v420.__r_.__value_.__r.__words[0]) = __p[1];
                  if (v545)
                  {
                    *(_QWORD *)&v546[0] = v545;
                    operator delete(v545);
                  }
                  size = (std::__shared_weak_count *)v553.__r_.__value_.__l.__size_;
                  if (v553.__r_.__value_.__l.__size_)
                  {
                    v248 = (unint64_t *)(v553.__r_.__value_.__l.__size_ + 8);
                    do
                      v249 = __ldaxr(v248);
                    while (__stlxr(v249 - 1, v248));
                    if (!v249)
                    {
                      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
                      std::__shared_weak_count::__release_weak(size);
                    }
                  }
                  v250 = v373->batchSize;
                  v467 = 0;
                  v468 = 0;
                  v463 = 0x100000001;
                  v464 = 1;
                  v465 = v250;
                  v466 = 0xFFFFFFFF00000001;
                  v471 = 0;
                  v469 = 0;
                  v470 = 0;
                  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                    std::string::__init_copy_ctor_external(&v462, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
                  else
                    v462 = __s;
                  Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)v481, (char *)&v463, (std::string::size_type)&v462, (uint64_t)&v472);
                  if (v473 < 0)
                    operator delete(v472);
                  if (SHIBYTE(v462.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v462.__r_.__value_.__l.__data_);
                  if (v469)
                  {
                    v470 = v469;
                    operator delete(v469);
                  }
                  std::string::basic_string[abi:ne180100]<0>(&v461, "softmax");
                  std::string::basic_string[abi:ne180100]<0>(&v458, "s");
                  if (SHIBYTE(v417) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)__p, (const std::string::value_type *)v416, *((std::string::size_type *)&v416 + 1));
                  }
                  else
                  {
                    *(_OWORD *)__p = v416;
                    *(_QWORD *)v544 = v417;
                  }
                  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)&v544[8], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    *(_OWORD *)&v544[8] = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
                    v545 = (void *)__s.__r_.__value_.__r.__words[2];
                  }
                  v456 = 0;
                  v455 = 0;
                  v457 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v455;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v455 = (std::string *)operator new(0x30uLL);
                  v456 = v455;
                  v457 = v455 + 2;
                  v456 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v457, (__int128 *)__p, v546, v455);
                  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                    std::string::__init_copy_ctor_external(&v553, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
                  else
                    v553 = __sz;
                  if (SHIBYTE(v476) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)&v554, (const std::string::value_type *)v475, *((std::string::size_type *)&v475 + 1));
                  }
                  else
                  {
                    v554 = v475;
                    v555[0] = v476;
                  }
                  v453 = 0;
                  v452 = 0;
                  v454 = 0;
                  v449 = (std::string *)&v452;
                  LOBYTE(v450) = 0;
                  v452 = (std::string *)operator new(0x30uLL);
                  v453 = v452;
                  v454 = v452 + 2;
                  v453 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v454, (__int128 *)&v553, (__int128 *)&v555[1], v452);
                  Espresso::sequential_builder::add<Espresso::softmax_params>((uint64_t *)&v446, (uint64_t *)v481, (uint64_t)&v461, (uint64_t)&v458, (uint64_t)&v420, (uint64_t)v455, (uint64_t)v456, (uint64_t *)&v452);
                  v449 = (std::string *)&v452;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v449);
                  for (m = 0; m != -6; m -= 3)
                  {
                    if (SHIBYTE(v555[m]) < 0)
                      operator delete(*(void **)((char *)&v553 + m * 8 + 24));
                  }
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v455;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v553);
                  for (n = 0; n != -48; n -= 24)
                  {
                    if (*((char *)&v545 + n + 7) < 0)
                      operator delete(*(void **)&v544[n + 8]);
                  }
                  if (SHIBYTE(v460) < 0)
                    operator delete(v458);
                  if (SHIBYTE(v461.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v461.__r_.__value_.__l.__data_);
                  v259 = (std::__shared_weak_count *)v447;
                  if (v447)
                  {
                    v260 = &v447->__r_.__value_.__l.__size_;
                    do
                      v261 = __ldaxr(v260);
                    while (__stlxr(v261 - 1, v260));
                    if (!v261)
                    {
                      ((void (*)(std::__shared_weak_count *))v259->__on_zero_shared)(v259);
                      std::__shared_weak_count::__release_weak(v259);
                    }
                  }
                  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__sz.__r_.__value_.__l.__data_);
                  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__s.__r_.__value_.__l.__data_);
                  if ((SHIBYTE(v417) & 0x80000000) == 0)
                    goto LABEL_495;
                  v262 = (void *)v416;
                  break;
                case 2:
                  objc_msgSend(v368, "inputName");
                  v239 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(&__sz, (char *)objc_msgSend(v239, "UTF8String"));

                  objc_msgSend(v368, "targetInputName");
                  v240 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(&v461, (char *)objc_msgSend(v240, "UTF8String"));

                  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                  {
                    v233 = v373;
                    std::string::__init_copy_ctor_external((std::string *)__p, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    *(_OWORD *)__p = *(_OWORD *)&__sz.__r_.__value_.__l.__data_;
                    *(_QWORD *)v544 = *((_QWORD *)&__sz.__r_.__value_.__l + 2);
                    v233 = v373;
                  }
                  v459 = 0;
                  v458 = 0;
                  v460 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v458;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v458 = operator new(0x18uLL);
                  v459 = v458;
                  v460 = (char *)v458 + 24;
                  v459 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v460, (__int128 *)__p, (__int128 *)&v544[8], (std::string *)v458);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int1");
                  v450 = 0;
                  v449 = 0;
                  p_data = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v449;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v449 = (std::string *)operator new(0x18uLL);
                  v450 = v449;
                  p_data = (void **)&v449[1].__r_.__value_.__l.__data_;
                  v450 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&p_data, (__int128 *)__p, (__int128 *)&v544[8], v449);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v449->__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)__p, v449->__r_.__value_.__l.__data_, v449->__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    v254 = *(_OWORD *)&v449->__r_.__value_.__l.__data_;
                    *(_QWORD *)v544 = *((_QWORD *)&v449->__r_.__value_.__l + 2);
                    *(_OWORD *)__p = v254;
                  }
                  if (SHIBYTE(v461.__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)&v544[8], v461.__r_.__value_.__l.__data_, v461.__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    *(_OWORD *)&v544[8] = *(_OWORD *)&v461.__r_.__value_.__l.__data_;
                    v545 = (void *)v461.__r_.__value_.__r.__words[2];
                  }
                  v447 = 0;
                  v446 = 0;
                  v448 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v446;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v446 = (std::string *)operator new(0x30uLL);
                  v447 = v446;
                  v448 = v446 + 2;
                  v255 = 0;
                  v447 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v448, (__int128 *)__p, v546, v446);
                  do
                  {
                    if (*((char *)&v545 + v255 + 7) < 0)
                      operator delete(*(void **)&v544[v255 + 8]);
                    v255 -= 24;
                  }
                  while (v255 != -48);
                  std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int2");
                  v444 = 0;
                  v443 = 0;
                  v445 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v443;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v443 = (std::string *)operator new(0x18uLL);
                  v444 = v443;
                  v445 = v443 + 1;
                  v444 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v445, (__int128 *)__p, (__int128 *)&v544[8], v443);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v443->__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)__p, v443->__r_.__value_.__l.__data_, v443->__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    v256 = *(_OWORD *)&v443->__r_.__value_.__l.__data_;
                    *(_QWORD *)v544 = *((_QWORD *)&v443->__r_.__value_.__l + 2);
                    *(_OWORD *)__p = v256;
                  }
                  v441 = 0;
                  v440 = 0;
                  v442 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v440;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v440 = (std::string *)operator new(0x18uLL);
                  v441 = v440;
                  v442 = v440 + 1;
                  v441 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v442, (__int128 *)__p, (__int128 *)&v544[8], v440);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int3");
                  v438 = 0;
                  v437 = 0;
                  v439 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v437;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v437 = (std::string *)operator new(0x18uLL);
                  v438 = v437;
                  v439 = v437 + 1;
                  v438 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v439, (__int128 *)__p, (__int128 *)&v544[8], v437);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v437->__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)__p, v437->__r_.__value_.__l.__data_, v437->__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    v263 = *(_OWORD *)&v437->__r_.__value_.__l.__data_;
                    *(_QWORD *)v544 = *((_QWORD *)&v437->__r_.__value_.__l + 2);
                    *(_OWORD *)__p = v263;
                  }
                  v435 = 0;
                  v434 = 0;
                  v436 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v434;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v434 = (std::string *)operator new(0x18uLL);
                  v435 = v434;
                  v436 = v434 + 1;
                  v435 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v436, (__int128 *)__p, (__int128 *)&v544[8], v434);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v476) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)__p, (const std::string::value_type *)v475, *((std::string::size_type *)&v475 + 1));
                  }
                  else
                  {
                    *(_OWORD *)__p = v475;
                    *(_QWORD *)v544 = v476;
                  }
                  v432 = 0;
                  v431 = 0;
                  v433 = 0;
                  v553.__r_.__value_.__r.__words[0] = (std::string::size_type)&v431;
                  v553.__r_.__value_.__s.__data_[8] = 0;
                  v431 = (std::string *)operator new(0x18uLL);
                  v432 = v431;
                  v433 = v431 + 1;
                  v432 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v433, (__int128 *)__p, (__int128 *)&v544[8], v431);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);
                  -[ETTaskDefinition trainingGraphNetPtr](v233, "trainingGraphNetPtr");
                  v420.__r_.__value_.__r.__words[0] = (std::string::size_type)&__sz;
                  v264 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v553.__r_.__value_.__r.__words[0] + 136, (unsigned __int8 *)&__sz, (__int128 **)&v420);
                  Espresso::abstract_blob_container::shape((char *)__p, *((_QWORD *)v264 + 5));
                  v265 = (std::__shared_weak_count *)v553.__r_.__value_.__l.__size_;
                  if (v553.__r_.__value_.__l.__size_)
                  {
                    v266 = (unint64_t *)(v553.__r_.__value_.__l.__size_ + 8);
                    do
                      v267 = __ldaxr(v266);
                    while (__stlxr(v267 - 1, v266));
                    if (!v267)
                    {
                      ((void (*)(std::__shared_weak_count *))v265->__on_zero_shared)(v265);
                      std::__shared_weak_count::__release_weak(v265);
                    }
                  }
                  v424[0] = *(_OWORD *)__p;
                  v424[1] = *(_OWORD *)v544;
                  v425 = *(_QWORD *)&v544[16];
                  v426 = 0;
                  v428 = 0;
                  v427 = 0;
                  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v426, v545, *(uint64_t *)&v546[0], (uint64_t)(*(_QWORD *)&v546[0] - (_QWORD)v545) >> 2);
                  if (SHIBYTE(v461.__r_.__value_.__r.__words[2]) < 0)
                    std::string::__init_copy_ctor_external(&v423, v461.__r_.__value_.__l.__data_, v461.__r_.__value_.__l.__size_);
                  else
                    v423 = v461;
                  Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)v481, (char *)v424, (std::string::size_type)&v423, (uint64_t)&v429);
                  if (v430 < 0)
                    operator delete(v429);
                  if (SHIBYTE(v423.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v423.__r_.__value_.__l.__data_);
                  if (v426)
                  {
                    v427 = v426;
                    operator delete(v426);
                  }
                  v553.__r_.__value_.__r.__words[2] = 897988541;
                  LOBYTE(v554) = 0;
                  *(_QWORD *)((char *)v555 + 4) = 0;
                  v553.__r_.__value_.__r.__words[0] = 1;
                  v553.__r_.__value_.__l.__size_ = 3212836864;
                  v420.__r_.__value_.__r.__words[2] = 897988541;
                  LOBYTE(v421) = 0;
                  v422 = 0;
                  v417 = 897988541;
                  v418 = 0;
                  v419 = 0;
                  v420.__r_.__value_.__l.__size_ = 1065353216;
                  v420.__r_.__value_.__r.__words[0] = 0;
                  *(_QWORD *)&v416 = 13;
                  *((_QWORD *)&v416 + 1) = 0x40000000;
                  v413 = 0;
                  v414 = 0xFFFFFFFF00000000;
                  v415 = 0;
                  __s.__r_.__value_.__r.__words[0] = 0x358637BD00000001;
                  *(_OWORD *)&__s.__r_.__value_.__r.__words[1] = 0x10000001FuLL;
                  std::string::basic_string[abi:ne180100]<0>(v408, "elementwise");
                  std::string::basic_string[abi:ne180100]<0>(v406, "_l2/mse-sub");
                  v403 = 0;
                  v404 = 0;
                  v405 = 0;
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v403, (uint64_t)v458, (uint64_t)v459, 0xAAAAAAAAAAAAAAABLL * ((v459 - (_BYTE *)v458) >> 3));
                  memset(v402, 0, sizeof(v402));
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v402, (uint64_t)v449, (uint64_t)v450, 0xAAAAAAAAAAAAAAABLL * (((char *)v450 - (char *)v449) >> 3));
                  Espresso::sequential_builder::add<Espresso::elementwise_params>(&v410, (uint64_t *)v481, (uint64_t)v408, (uint64_t)v406, (uint64_t)&v553, v403, v404, v402);
                  v268 = v411;
                  if (v411)
                  {
                    v269 = (unint64_t *)&v411->__shared_owners_;
                    do
                      v270 = __ldaxr(v269);
                    while (__stlxr(v270 - 1, v269));
                    if (!v270)
                    {
                      ((void (*)(std::__shared_weak_count *))v268->__on_zero_shared)(v268);
                      std::__shared_weak_count::__release_weak(v268);
                    }
                  }
                  v540 = (void **)v402;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  v540 = (void **)&v403;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  if (v407 < 0)
                    operator delete(v406[0]);
                  if (v409 < 0)
                    operator delete(v408[0]);
                  std::string::basic_string[abi:ne180100]<0>(v408, "elementwise");
                  std::string::basic_string[abi:ne180100]<0>(v406, "_l2/mse-add");
                  v397 = 0;
                  v398 = 0;
                  v399 = 0;
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v397, (uint64_t)v446, (uint64_t)v447, 0xAAAAAAAAAAAAAAABLL * (((char *)v447 - (char *)v446) >> 3));
                  memset(v396, 0, sizeof(v396));
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v396, (uint64_t)v443, (uint64_t)v444, 0xAAAAAAAAAAAAAAABLL * (((char *)v444 - (char *)v443) >> 3));
                  Espresso::sequential_builder::add<Espresso::elementwise_params>(&v400, (uint64_t *)v481, (uint64_t)v408, (uint64_t)v406, (uint64_t)&v420, v397, v398, v396);
                  v271 = v401;
                  if (v401)
                  {
                    v272 = (unint64_t *)&v401->__shared_owners_;
                    do
                      v273 = __ldaxr(v272);
                    while (__stlxr(v273 - 1, v272));
                    if (!v273)
                    {
                      ((void (*)(std::__shared_weak_count *))v271->__on_zero_shared)(v271);
                      std::__shared_weak_count::__release_weak(v271);
                    }
                  }
                  v540 = (void **)v396;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  v540 = (void **)&v397;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  if (v407 < 0)
                    operator delete(v406[0]);
                  if (v409 < 0)
                    operator delete(v408[0]);
                  std::string::basic_string[abi:ne180100]<0>(v408, "elementwise");
                  std::string::basic_string[abi:ne180100]<0>(v406, "_l2/mse-pow");
                  v391 = 0;
                  v392 = 0;
                  v393 = 0;
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v391, (uint64_t)v440, (uint64_t)v441, 0xAAAAAAAAAAAAAAABLL * (((char *)v441 - (char *)v440) >> 3));
                  memset(v390, 0, sizeof(v390));
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v390, (uint64_t)v437, (uint64_t)v438, 0xAAAAAAAAAAAAAAABLL * (((char *)v438 - (char *)v437) >> 3));
                  Espresso::sequential_builder::add<Espresso::elementwise_params>(&v394, (uint64_t *)v481, (uint64_t)v408, (uint64_t)v406, (uint64_t)&v416, v391, v392, v390);
                  v274 = v395;
                  if (v395)
                  {
                    v275 = (unint64_t *)&v395->__shared_owners_;
                    do
                      v276 = __ldaxr(v275);
                    while (__stlxr(v276 - 1, v275));
                    if (!v276)
                    {
                      ((void (*)(std::__shared_weak_count *))v274->__on_zero_shared)(v274);
                      std::__shared_weak_count::__release_weak(v274);
                    }
                  }
                  v540 = (void **)v390;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  v540 = (void **)&v391;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  if (v407 < 0)
                    operator delete(v406[0]);
                  if (v409 < 0)
                    operator delete(v408[0]);
                  std::string::basic_string[abi:ne180100]<0>(v408, "reduce");
                  std::string::basic_string[abi:ne180100]<0>(v406, "_l2/mse-reduce");
                  v385 = 0;
                  v386 = 0;
                  v387 = 0;
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v385, (uint64_t)v434, (uint64_t)v435, 0xAAAAAAAAAAAAAAABLL * (((char *)v435 - (char *)v434) >> 3));
                  memset(v384, 0, sizeof(v384));
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v384, (uint64_t)v431, (uint64_t)v432, 0xAAAAAAAAAAAAAAABLL * (((char *)v432 - (char *)v431) >> 3));
                  Espresso::sequential_builder::add<Espresso::reduce_params_t>(&v388, (uint64_t *)v481, (uint64_t)v408, (uint64_t)v406, (uint64_t)&__s, v385, v386, v384);
                  v277 = v389;
                  if (v389)
                  {
                    v278 = (unint64_t *)&v389->__shared_owners_;
                    do
                      v279 = __ldaxr(v278);
                    while (__stlxr(v279 - 1, v278));
                    if (!v279)
                    {
                      ((void (*)(std::__shared_weak_count *))v277->__on_zero_shared)(v277);
                      std::__shared_weak_count::__release_weak(v277);
                    }
                  }
                  v540 = (void **)v384;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  v540 = (void **)&v385;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v540);
                  if (v407 < 0)
                    operator delete(v406[0]);
                  if (v409 < 0)
                    operator delete(v408[0]);
                  if (v545)
                  {
                    *(_QWORD *)&v546[0] = v545;
                    operator delete(v545);
                  }
                  __p[0] = &v431;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v434;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v437;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v440;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v443;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v446;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v449;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  __p[0] = &v458;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                  if (SHIBYTE(v461.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v461.__r_.__value_.__l.__data_);
                  if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_495;
                  v262 = (void *)__sz.__r_.__value_.__r.__words[0];
                  break;
                case 3:
                  v230 = v486;
                  objc_msgSend(v368, "lossOutputName");
                  v231 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v231, "UTF8String"));
                  v232 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((_QWORD *)(v230 + 136), (unsigned __int8 *)__p);
                  if ((v544[7] & 0x80000000) != 0)
                    operator delete(__p[0]);

                  v233 = v373;
                  if (!v232)
                  {
                    if (a8)
                    {
                      v234 = (void *)MEMORY[0x1E0CB35C8];
                      v551 = *MEMORY[0x1E0CB2D50];
                      v235 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v368, "lossOutputName");
                      v236 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v235, "stringWithFormat:", CFSTR("loss name %@ does not exist"), v236);
                      v237 = (void *)objc_claimAutoreleasedReturnValue();
                      v552 = v237;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v552, &v551, 1);
                      v238 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v234, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v238);
                      *a8 = (id)objc_claimAutoreleasedReturnValue();

                    }
LABEL_361:
                    v33 = 0;
LABEL_564:

                    if (SHIBYTE(v476) < 0)
                      operator delete((void *)v475);
                    std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v490);
                    v333 = v489;
                    if (v489)
                    {
                      v334 = (unint64_t *)&v489->__shared_owners_;
                      do
                        v335 = __ldaxr(v334);
                      while (__stlxr(v335 - 1, v334));
                      if (!v335)
                      {
                        ((void (*)(std::__shared_weak_count *))v333->__on_zero_shared)(v333);
                        std::__shared_weak_count::__release_weak(v333);
                      }
                    }
                    v336 = v488;
                    if (v488)
                    {
                      v337 = (unint64_t *)&v488->__shared_owners_;
                      do
                        v338 = __ldaxr(v337);
                      while (__stlxr(v338 - 1, v337));
                      if (!v338)
                      {
                        ((void (*)(std::__shared_weak_count *))v336->__on_zero_shared)(v336);
                        std::__shared_weak_count::__release_weak(v336);
                      }
                    }
                    v339 = v487;
                    if (v487)
                    {
                      v340 = (unint64_t *)&v487->__shared_owners_;
                      do
                        v341 = __ldaxr(v340);
                      while (__stlxr(v341 - 1, v340));
                      if (!v341)
                      {
                        ((void (*)(std::__shared_weak_count *))v339->__on_zero_shared)(v339);
                        std::__shared_weak_count::__release_weak(v339);
                      }
                    }
                    if (v485 < 0)
                      operator delete(v484);
                    std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v482, v482[1]);
                    v342 = (std::__shared_weak_count *)v481[1];
                    if (v481[1])
                    {
                      v343 = (unint64_t *)((char *)v481[1] + 8);
                      do
                        v344 = __ldaxr(v343);
                      while (__stlxr(v344 - 1, v343));
                      if (!v344)
                      {
                        ((void (*)(std::__shared_weak_count *))v342->__on_zero_shared)(v342);
                        std::__shared_weak_count::__release_weak(v342);
                      }
                    }
                    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v497, v497[1]);
                    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v495, v496);
                    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v498, v499[0]);
                    __p[0] = &v506;
                    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                    std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node((_QWORD *)v510);
                    v345 = v509[0];
                    v509[0] = 0;
                    if (v345)
                      operator delete(v345);
                    std::__hash_table<std::__hash_value_type<std::string,Espresso::training_transform_options>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::training_transform_options>>>::~__hash_table((uint64_t)&v512);
                    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v523);
                    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v522, v522[1]);
                    v346 = v521;
                    if (v521)
                    {
                      v347 = (unint64_t *)&v521->__shared_owners_;
                      do
                        v348 = __ldaxr(v347);
                      while (__stlxr(v348 - 1, v347));
                      if (!v348)
                      {
                        ((void (*)(std::__shared_weak_count *))v346->__on_zero_shared)(v346);
                        std::__shared_weak_count::__release_weak(v346);
                      }
                    }
                    v349 = v520;
                    if (!v520)
                      goto LABEL_610;
                    v350 = &v520->__shared_owners_;
                    do
                      v351 = __ldaxr((unint64_t *)v350);
                    while (__stlxr(v351 - 1, (unint64_t *)v350));
                    goto LABEL_598;
                  }
LABEL_495:
                  Espresso::sequential_builder::build_from_shapes((uint64_t)v481, (uint64_t)v481[0], 1, &v382);
                  v280 = v383;
                  if (v383)
                  {
                    v281 = (unint64_t *)&v383->__shared_owners_;
                    do
                      v282 = __ldaxr(v281);
                    while (__stlxr(v282 - 1, v281));
                    if (!v282)
                    {
                      ((void (*)(std::__shared_weak_count *))v280->__on_zero_shared)(v280);
                      std::__shared_weak_count::__release_weak(v280);
                    }
                  }
                  if (a7 == 4)
                    Espresso::mark_block_start(p_inferenceModel, p_var0, 1);
                  memset(&v553, 0, sizeof(v553));
                  memset(v381, 0, sizeof(v381));
                  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v381, v506, *(uint64_t *)v507, 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)v507 - v506) >> 3));
                  Espresso::gradient_builder::build_gradient((uint64_t *)&v519, &v475, v381, (uint64_t)__p);
                  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v553);
                  *(_OWORD *)&v553.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
                  v553.__r_.__value_.__r.__words[2] = *(_QWORD *)v544;
                  *(_QWORD *)v544 = 0;
                  __p[1] = 0;
                  __p[0] = 0;
                  v420.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v420);
                  v420.__r_.__value_.__r.__words[0] = (std::string::size_type)v381;
                  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v420);
                  if (a7 == 4)
                  {
                    Espresso::mark_block_end(p_inferenceModel, p_var0);
                    Espresso::guard_block_with_if (*p_inferenceModel, p_var0);
                    Espresso::mark_block_start(p_inferenceModel, p_size, 1);
                  }
                  if (objc_msgSend(v370, "type"))
                  {
                    if (objc_msgSend(v370, "type") != 1)
                    {
                      if (!a8)
                      {
                        v33 = 0;
                        goto LABEL_563;
                      }
                      v331 = (void *)MEMORY[0x1E0CB35C8];
                      v541 = *MEMORY[0x1E0CB2D50];
                      v542 = CFSTR("Invalid optimizer type, optimizer must be of type SGD or Adam");
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v542, &v541, 1);
                      v329 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v331, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v329);
                      v330 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_554;
                    }
                    -[ETTaskDefinition trainingGraphNetPtr](v233, "trainingGraphNetPtr");
                    objc_msgSend(v370, "optimizationParameters");
                    v283 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v283, "objectForKeyedSubscript:", CFSTR("learningRate"));
                    v284 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v284, "floatValue");
                    v286 = v285;
                    objc_msgSend(v370, "optimizationParameters");
                    v287 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v287, "objectForKeyedSubscript:", CFSTR("beta1"));
                    v288 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v288, "floatValue");
                    v290 = v289;
                    objc_msgSend(v370, "optimizationParameters");
                    v291 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("beta2"));
                    v292 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v292, "floatValue");
                    v294 = v293;
                    objc_msgSend(v370, "optimizationParameters");
                    v295 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v295, "objectForKeyedSubscript:", CFSTR("epsilon"));
                    v296 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v296, "floatValue");
                    v298 = v297;
                    std::string::basic_string[abi:ne180100]<0>(&v420, (char *)objc_msgSend(CFSTR("learningRate"), "UTF8String"));
                    Espresso::adam_optimizer_builder::adam_optimizer_builder((uint64_t)__p, v379[0], (std::__shared_weak_count *)v379[1], (uint64_t)&v506, (uint64_t)&v553, &v420, v286, v290, v294, v298);
                    if (SHIBYTE(v420.__r_.__value_.__r.__words[2]) < 0)
                      operator delete(v420.__r_.__value_.__l.__data_);

                    std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)v379);
                    Espresso::adam_optimizer_builder::build_single_layer_optimizer((Espresso::adam_optimizer_builder *)__p);
                    Espresso::adam_optimizer_builder::~adam_optimizer_builder(__p);
                    v299 = v373;
                  }
                  else
                  {
                    -[ETTaskDefinition trainingGraphNetPtr](v233, "trainingGraphNetPtr");
                    objc_msgSend(v370, "optimizationParameters");
                    v300 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v300, "objectForKeyedSubscript:", CFSTR("learningRate"));
                    v301 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v301, "floatValue");
                    v303 = v302;
                    objc_msgSend(v370, "optimizationParameters");
                    v304 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v304, "objectForKeyedSubscript:", CFSTR("momentum"));
                    v305 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v305, "floatValue");
                    v307 = v306;
                    std::string::basic_string[abi:ne180100]<0>(&v420, (char *)objc_msgSend(CFSTR("learningRate"), "UTF8String"));
                    Espresso::sgd_optimizer_builder::sgd_optimizer_builder((uint64_t)__p, v379[2], v380, (uint64_t)&v506, (uint64_t)&v553, &v420, v303, v307);
                    if (SHIBYTE(v420.__r_.__value_.__r.__words[2]) < 0)
                      operator delete(v420.__r_.__value_.__l.__data_);

                    v299 = v373;
                    if (v380)
                    {
                      v308 = &v380->__shared_owners_;
                      do
                        v309 = __ldaxr((unint64_t *)v308);
                      while (__stlxr(v309 - 1, (unint64_t *)v308));
                      if (!v309)
                      {
                        ((void (*)(std::__shared_weak_count *))v380->__on_zero_shared)(v380);
                        std::__shared_weak_count::__release_weak(v380);
                      }
                    }
                    Espresso::sgd_optimizer_builder::build_single_layer_optimizer((Espresso::sgd_optimizer_builder *)__p);
                    __p[0] = off_1E2D8C368;
                    if (v548 < 0)
                      operator delete(v547);
                    Espresso::optimizer_builder::~optimizer_builder(__p);
                  }
                  if (a7 == 4)
                  {
                    Espresso::mark_block_end(p_inferenceModel, p_size);
                    Espresso::guard_block_with_if (*p_inferenceModel, p_size);
                  }
                  Espresso::mark_block_end(p_inferenceModel, p_training_control_name);
                  Espresso::guard_block_with_if (*p_inferenceModel, p_training_control_name);
                  -[ETTaskDefinition trainingGraphNetPtr](v299, "trainingGraphNetPtr");
                  Espresso::pass_constant_if_conditions::hint_fallback_constant_ifs_from_metal((Espresso::pass_constant_if_conditions *)__p[0], v310);
                  v311 = (std::__shared_weak_count *)__p[1];
                  if (__p[1])
                  {
                    v312 = (unint64_t *)((char *)__p[1] + 8);
                    do
                      v313 = __ldaxr(v312);
                    while (__stlxr(v313 - 1, v312));
                    if (!v313)
                    {
                      ((void (*)(std::__shared_weak_count *))v311->__on_zero_shared)(v311);
                      std::__shared_weak_count::__release_weak(v311);
                    }
                  }
                  -[ETTaskDefinition trainingGraphNetPtr](v299, "trainingGraphNetPtr");
                  v378[0] = 0;
                  v378[1] = 0;
                  Espresso::net::setup_script((uint64_t)__p[0], v378, 0);
                  v314 = (std::__shared_weak_count *)__p[1];
                  if (__p[1])
                  {
                    v315 = (unint64_t *)((char *)__p[1] + 8);
                    do
                      v316 = __ldaxr(v315);
                    while (__stlxr(v316 - 1, v315));
                    if (!v316)
                    {
                      ((void (*)(std::__shared_weak_count *))v314->__on_zero_shared)(v314);
                      std::__shared_weak_count::__release_weak(v314);
                    }
                  }
                  -[ETTaskDefinition inferenceGraphNetPtr](v299, "inferenceGraphNetPtr");
                  v317 = __p[0];
                  v318 = (std::__shared_weak_count *)__p[1];
                  if (__p[1])
                  {
                    v319 = (unint64_t *)((char *)__p[1] + 8);
                    do
                      v320 = __ldaxr(v319);
                    while (__stlxr(v320 - 1, v319));
                    if (!v320)
                    {
                      ((void (*)(std::__shared_weak_count *))v318->__on_zero_shared)(v318);
                      std::__shared_weak_count::__release_weak(v318);
                    }
                  }
                  v321 = (_QWORD *)v317[32];
                  v322 = v317 + 33;
                  if (v321 != v322)
                  {
                    do
                    {
                      v323 = v321 + 4;
                      if (*((char *)v321 + 55) < 0)
                        v323 = (_QWORD *)*v323;
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v323);
                      v324 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v224, "addObject:", v324);

                      v325 = (_QWORD *)v321[1];
                      if (v325)
                      {
                        do
                        {
                          v326 = v325;
                          v325 = (_QWORD *)*v325;
                        }
                        while (v325);
                      }
                      else
                      {
                        do
                        {
                          v326 = (_QWORD *)v321[2];
                          v67 = *v326 == (_QWORD)v321;
                          v321 = v326;
                        }
                        while (!v67);
                      }
                      v321 = v326;
                    }
                    while (v326 != v322);
                  }
                  objc_msgSend(v368, "lossOutputName");
                  v327 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v224, "addObject:", v327);

                  objc_storeStrong((id *)&v373->optimizer_control_name, v224);
                  objc_storeStrong((id *)&v373->optimizer_control_name.__r_.__value_.var0.__l + 2, v373->optimizer_control_name.__r_.__value_.var0.__l.__data_);
                  v377 = 0;
                  -[ETTaskDefinition setupInputOutputShapes:](v373, "setupInputOutputShapes:", &v377);
                  v328 = v377;
                  if (v328)
                  {
                    v329 = v328;
                    if (a8)
                    {
                      v330 = objc_retainAutorelease(v328);
LABEL_553:
                      v329 = v330;
LABEL_554:
                      v33 = 0;
                      *a8 = v330;
LABEL_562:

LABEL_563:
                      __p[0] = &v553;
                      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                      goto LABEL_564;
                    }
                  }
                  else
                  {
                    v376 = 0;
                    -[ETTaskDefinition reloadOnRuntimePlatform:](v373, "reloadOnRuntimePlatform:", &v376);
                    v332 = v376;
                    v329 = v332;
                    if (!v332)
                    {
                      v33 = v373;
                      goto LABEL_562;
                    }
                    if (a8)
                    {
                      v330 = objc_retainAutorelease(v332);
                      goto LABEL_553;
                    }
                  }
                  v33 = 0;
                  goto LABEL_562;
                default:
                  if (a8)
                  {
                    v251 = (void *)MEMORY[0x1E0CB35C8];
                    v549 = *MEMORY[0x1E0CB2D50];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("loss type not supported: %d"), objc_msgSend(v368, "mode"));
                    v252 = (void *)objc_claimAutoreleasedReturnValue();
                    v550 = v252;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v550, &v549, 1);
                    v253 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v251, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v253);
                    *a8 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  goto LABEL_361;
              }
              operator delete(v262);
              goto LABEL_495;
            }
            v144 = -1;
LABEL_241:
            v165 = (int)v143;
            while (1)
            {
              v166 = *(_OWORD *)(v519[1].__shared_owners_ + 16 * v165);
              *(_OWORD *)v481 = v166;
              v167 = (std::__shared_weak_count *)*((_QWORD *)&v166 + 1);
              if (*((_QWORD *)&v166 + 1))
              {
                v168 = (unint64_t *)(*((_QWORD *)&v166 + 1) + 8);
                do
                  v169 = __ldxr(v168);
                while (__stxr(v169 + 1, v168));
              }
              v170 = (uint64_t *)(v166 + 40);
              v171 = *(char *)(v166 + 63);
              if (v171 < 0)
              {
                if (*(_QWORD *)(v166 + 48) == 9)
                {
                  v170 = (uint64_t *)*v170;
LABEL_250:
                  v172 = (uint64_t *)*v170;
                  v173 = *((unsigned __int8 *)v170 + 8);
                  if (v172 == (uint64_t *)0x726F6E6863746162 && v173 == 109)
                  {
                    v553.__r_.__value_.__r.__words[0] = v166 + 16;
                    std::__hash_table<std::__hash_value_type<std::string,Espresso::training_transform_options>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::training_transform_options>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v512, (unsigned __int8 *)(v166 + 16), (__int128 **)&v553)[40] = 1;
                  }
                }
              }
              else if (v171 == 9)
              {
                goto LABEL_250;
              }
              if (v167)
              {
                v175 = (unint64_t *)&v167->__shared_owners_;
                do
                  v176 = __ldaxr(v175);
                while (__stlxr(v176 - 1, v175));
                if (!v176)
                {
                  ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
                  std::__shared_weak_count::__release_weak(v167);
                }
              }
              if (v144 + 1 == (_DWORD)++v165)
                goto LABEL_265;
            }
          }
          if (v51 == v53)
          {
            v87 = 0;
            v88 = v372;
          }
          else
          {
            -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
            v88 = v372;
            v92 = (std::__shared_weak_count *)__p[1];
            v87 = *((_QWORD *)__p[0] + 5) != *((_QWORD *)__p[0] + 4);
            if (__p[1])
            {
              v93 = (unint64_t *)((char *)__p[1] + 8);
              do
                v94 = __ldaxr(v93);
              while (__stlxr(v94 - 1, v93));
              if (!v94)
              {
                ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
                std::__shared_weak_count::__release_weak(v92);
              }
            }
          }
          if (!v87 && ((v88 ^ 1) & 1) == 0)
          {
            if (a8)
            {
              v95 = (void *)MEMORY[0x1E0CB35C8];
              v557 = *MEMORY[0x1E0CB2D50];
              v558 = CFSTR("Found Espresso network (model_updatable.espresso.net) has no training graph");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v558, &v557, 1);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v96);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_125:
            v33 = 0;
LABEL_610:

            goto LABEL_611;
          }
          if ((v88 & v87) != 1)
            goto LABEL_172;
          -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
          std::string::basic_string[abi:ne180100]<0>(__p, "globals_container_net");
          v553.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
          v97 = (void **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v519[41], (unsigned __int8 *)__p, (__int128 **)&v553);
          v98 = (unint64_t *)v97[6];
          v481[0] = v97[5];
          v481[1] = v98;
          if (v98)
          {
            v99 = v98 + 1;
            do
              v100 = __ldxr(v99);
            while (__stxr(v100 + 1, v99));
          }
          if ((v544[7] & 0x80000000) != 0)
            operator delete(__p[0]);
          if (v520)
          {
            v101 = &v520->__shared_owners_;
            do
              v102 = __ldaxr((unint64_t *)v101);
            while (__stlxr(v102 - 1, (unint64_t *)v101));
            if (!v102)
            {
              ((void (*)(std::__shared_weak_count *))v520->__on_zero_shared)(v520);
              std::__shared_weak_count::__release_weak(v520);
            }
          }
          v530 = 0;
          v529 = 0;
          -[ETTaskDefinition trainingGraphNetPtr](v373, "trainingGraphNetPtr");
          Espresso::net::setup_script((uint64_t)v481[0], &v529, *(unsigned int *)(**((_QWORD **)__p[0] + 4) + 12));
          v103 = (std::__shared_weak_count *)__p[1];
          if (__p[1])
          {
            v104 = (unint64_t *)((char *)__p[1] + 8);
            do
              v105 = __ldaxr(v104);
            while (__stlxr(v105 - 1, v104));
            if (!v105)
            {
              ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
              std::__shared_weak_count::__release_weak(v103);
            }
          }
          v106 = v530;
          if (v530)
          {
            v107 = (unint64_t *)&v530->__shared_owners_;
            do
              v108 = __ldaxr(v107);
            while (__stlxr(v108 - 1, v107));
            if (!v108)
            {
              ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
              std::__shared_weak_count::__release_weak(v106);
            }
          }
          v109 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)v481[0] + 2);
          v527[0] = MEMORY[0x1E0C809B0];
          v527[1] = 3321888768;
          v527[2] = __117__ETTaskDefinition_initWithModelDefinition_lossDefinition_variablesDefinition_optimizerDefinition_forPlatform_error___block_invoke;
          v527[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
          v527[4] = v481[0];
          v528 = (std::__shared_weak_count *)v481[1];
          if (v481[1])
          {
            v110 = (unint64_t *)((char *)v481[1] + 8);
            do
              v111 = __ldxr(v110);
            while (__stxr(v111 + 1, v110));
          }
          Espresso::abstract_context::compute_batch_sync(v109, v527);
          v112 = (void *)MEMORY[0x1E0C99DE8];
          -[ETTaskDefinition inferenceGraphNetPtr](v373, "inferenceGraphNetPtr");
          objc_msgSend(v112, "arrayWithCapacity:", *((_QWORD *)__p[0] + 34));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = (std::__shared_weak_count *)__p[1];
          if (__p[1])
          {
            v115 = (unint64_t *)((char *)__p[1] + 8);
            do
              v116 = __ldaxr(v115);
            while (__stlxr(v116 - 1, v115));
            if (!v116)
            {
              ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
              std::__shared_weak_count::__release_weak(v114);
            }
          }
          -[ETTaskDefinition inferenceGraphNetPtr](v373, "inferenceGraphNetPtr");
          v117 = __p[0];
          v118 = (std::__shared_weak_count *)__p[1];
          if (__p[1])
          {
            v119 = (unint64_t *)((char *)__p[1] + 8);
            do
              v120 = __ldaxr(v119);
            while (__stlxr(v120 - 1, v119));
            if (!v120)
            {
              ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
              std::__shared_weak_count::__release_weak(v118);
            }
          }
          v121 = (_QWORD *)v117[32];
          v122 = v117 + 33;
          if (v121 != v122)
          {
            do
            {
              v123 = v121 + 4;
              if (*((char *)v121 + 55) < 0)
                v123 = (_QWORD *)*v123;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v123);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "addObject:", v124);

              v125 = (_QWORD *)v121[1];
              if (v125)
              {
                do
                {
                  v126 = v125;
                  v125 = (_QWORD *)*v125;
                }
                while (v125);
              }
              else
              {
                do
                {
                  v126 = (_QWORD *)v121[2];
                  v67 = *v126 == (_QWORD)v121;
                  v121 = v126;
                }
                while (!v67);
              }
              v121 = v126;
            }
            while (v126 != v122);
          }
          objc_msgSend(v368, "lossOutputName");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v127);

          objc_storeStrong((id *)&v373->optimizer_control_name, v113);
          objc_storeStrong((id *)&v373->optimizer_control_name.__r_.__value_.var0.__l + 2, v373->optimizer_control_name.__r_.__value_.var0.__l.__data_);
          v526 = 0;
          -[ETTaskDefinition setupInputOutputShapes:](v373, "setupInputOutputShapes:", &v526);
          v128 = v526;
          if (v128)
          {
            if (a8)
              goto LABEL_559;
          }
          else
          {
            v525 = 0;
            -[ETTaskDefinition reloadOnRuntimePlatform:](v373, "reloadOnRuntimePlatform:", &v525);
            v128 = v525;
            if (!v128)
            {
              v33 = v373;
              v128 = 0;
LABEL_601:

              v352 = v528;
              if (v528)
              {
                v353 = (unint64_t *)&v528->__shared_owners_;
                do
                  v354 = __ldaxr(v353);
                while (__stlxr(v354 - 1, v353));
                if (!v354)
                {
                  ((void (*)(std::__shared_weak_count *))v352->__on_zero_shared)(v352);
                  std::__shared_weak_count::__release_weak(v352);
                }
              }
              v349 = (std::__shared_weak_count *)v481[1];
              if (!v481[1])
                goto LABEL_610;
              v355 = (unint64_t *)((char *)v481[1] + 8);
              do
                v351 = __ldaxr(v355);
              while (__stlxr(v351 - 1, v355));
LABEL_598:
              if (!v351)
              {
                ((void (*)(std::__shared_weak_count *))v349->__on_zero_shared)(v349);
                std::__shared_weak_count::__release_weak(v349);
              }
              goto LABEL_610;
            }
            if (a8)
            {
LABEL_559:
              v128 = objc_retainAutorelease(v128);
              v33 = 0;
              *a8 = v128;
              goto LABEL_601;
            }
          }
          v33 = 0;
          goto LABEL_601;
        }
      }
      else
      {
LABEL_38:
        if (v39)
          goto LABEL_39;
      }
      if (a8)
      {
        v90 = (void *)MEMORY[0x1E0CB35C8];
        v559 = *MEMORY[0x1E0CB2D50];
        v560 = CFSTR("No network made from call to load_network");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v560, &v559, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v91);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_125;
    }
  }
  else
  {
LABEL_14:
    if (v19)
      goto LABEL_15;
  }
  if (a8)
  {
    v89 = (void *)MEMORY[0x1E0CB35C8];
    v561 = *MEMORY[0x1E0CB2D50];
    v562 = CFSTR("No network made from call to load_network");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v562, &v561, 1);
    v364 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1);
    v33 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
LABEL_611:
  v356 = (std::__shared_weak_count *)v538;
  if (v538)
  {
    v357 = (unint64_t *)(v538 + 8);
    do
      v358 = __ldaxr(v357);
    while (__stlxr(v358 - 1, v357));
    if (!v358)
    {
      ((void (*)(std::__shared_weak_count *))v356->__on_zero_shared)(v356);
      std::__shared_weak_count::__release_weak(v356);
    }
  }
LABEL_616:

  return v33;
}

- (ETTaskDefinition)initWithTrainingModelDefinition:(id)a3 forPlatform:(unint64_t)a4 error:(id *)a5
{
  id v8;
  ETTaskDefinition *v9;
  ETTaskDefinition *v10;
  void *v11;
  void *v12;
  ETTaskDefinition *v13;
  void *v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  void *var0;
  uint64_t v26;
  char *data;
  uint64_t v28;
  void *size;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  id v43;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_training_control_name;
  void *v45;
  BOOL v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  id v50;
  void *p_p;
  int8x8_t *v52;
  _QWORD *v53;
  unint64_t v54;
  int8x8_t v55;
  unint64_t v56;
  uint8x8_t v57;
  unint64_t v58;
  unint64_t v59;
  unsigned __int8 **v60;
  unsigned __int8 *i;
  unint64_t v62;
  void *v63;
  void *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  __int128 *v68;
  id v69;
  _QWORD *v70;
  std::__shared_weak_count *v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  void (***v75)(uint64_t *__return_ptr, _QWORD);
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  BOOL v81;
  void *v82;
  _QWORD v83[4];
  _QWORD v84[2];
  uint64_t v85[2];
  void *v86;
  std::__shared_weak_count *v87;
  char v88;
  void *__p;
  std::__shared_weak_count *v90;
  char v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  objc_super v99;
  void **v100;
  __int128 *v101[2];
  _QWORD *v102;
  std::__shared_weak_count *v103;
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v99.receiver = self;
  v99.super_class = (Class)ETTaskDefinition;
  v9 = -[ETTaskDefinition init](&v99, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  -[ETTaskDefinition setInferenceModel:](v9, "setInferenceModel:", v8);
  if (v10->runtimePlatform == 4)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v106 = *MEMORY[0x1E0CB2D50];
      v107[0] = CFSTR("MultiGPU not supported yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_5;
  }
  v10->runtimePlatform = a4;
  -[ETTaskDefinition context_for_runtime_platform:](v10, "context_for_runtime_platform:", a5);
  if (v97)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v97 + 96))(v97);
    v10->precision = 0;
    objc_msgSend(v8, "modelURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v16, "UTF8String"));
    Espresso::load_network((uint64_t)&__p, &v97, v10->precision, 0, &v95);
    -[ETTaskDefinition setTrainingGraphNetPtr:](v10, "setTrainingGraphNetPtr:", &v95);
    v17 = v96;
    if (v96)
    {
      p_shared_owners = (unint64_t *)&v96->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (v91 < 0)
      operator delete(__p);

    -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
    v21 = __p;
    v20 = v90;
    if (v90)
    {
      v22 = (unint64_t *)&v90->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    if (v21)
    {
      objc_msgSend(v8, "inputs");
      v24 = objc_claimAutoreleasedReturnValue();
      var0 = (void *)v10->gradient_control_name.var0;
      v10->gradient_control_name.var0 = v24;

      objc_msgSend(v8, "outputs");
      v26 = objc_claimAutoreleasedReturnValue();
      data = v10->optimizer_control_name.__r_.__value_.var0.__l.__data_;
      v10->optimizer_control_name.__r_.__value_.var0.__l.__data_ = (char *)v26;

      objc_msgSend(v8, "trainingInputs");
      v28 = objc_claimAutoreleasedReturnValue();
      size = (void *)v10->optimizer_control_name.__r_.__value_.var0.__l.__size_;
      v10->optimizer_control_name.__r_.__value_.var0.__l.__size_ = v28;

      objc_msgSend(v8, "trainingOutputs");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)*((_QWORD *)&v10->optimizer_control_name.__r_.__value_.var0.__l + 2);
      *((_QWORD *)&v10->optimizer_control_name.__r_.__value_.var0.__l + 2) = v30;

      v94 = 0;
      -[ETTaskDefinition setupInputOutputShapes:](v10, "setupInputOutputShapes:", &v94);
      v32 = v94;
      if (v32)
      {
        v33 = v32;
        if (a5)
        {
          v34 = objc_retainAutorelease(v32);
          v33 = v34;
LABEL_26:
          v13 = 0;
          *a5 = v34;
LABEL_87:

          goto LABEL_88;
        }
      }
      else
      {
        -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
        v36 = v102;
        objc_msgSend(v8, "inputs");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(&v86, (char *)objc_msgSend(v38, "UTF8String"));
        v101[0] = (__int128 *)&v86;
        v39 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v36 + 17), (unsigned __int8 *)&v86, v101);
        Espresso::abstract_blob_container::shape((char *)&__p, v39[5]);
        v10->batchSize = SHIDWORD(v90);
        if (v92)
        {
          v93 = v92;
          operator delete(v92);
        }
        if (v88 < 0)
          operator delete(v86);

        v40 = v103;
        if (v103)
        {
          v41 = (unint64_t *)&v103->__shared_owners_;
          do
            v42 = __ldaxr(v41);
          while (__stlxr(v42 - 1, v41));
          if (!v42)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
        }
        objc_msgSend(v8, "isTrainingGlobalName");
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        MEMORY[0x19401C808](&v10->training_control_name, objc_msgSend(v43, "UTF8String"));

        p_training_control_name = &v10->training_control_name;
        if (*((char *)&v10->training_control_name.__r_.__value_.var0.__l + 23) < 0)
          p_training_control_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v10->training_control_name.__r_.__value_.var0.__l.__data_;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("training control variable '%s' not found"), p_training_control_name);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
        v46 = find_or_create_error<std::string,std::shared_ptr<Espresso::abstract_blob_container>>((_QWORD *)__p + 17, (unsigned __int8 *)&v10->training_control_name, a5, v45);
        v47 = v90;
        if (v90)
        {
          v48 = (unint64_t *)&v90->__shared_owners_;
          do
            v49 = __ldaxr(v48);
          while (__stlxr(v49 - 1, v48));
          if (!v49)
          {
            ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
            std::__shared_weak_count::__release_weak(v47);
          }
        }

        if (v46)
        {
          objc_msgSend(v8, "initializer");
          v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v50, "UTF8String"));

          p_p = &__p;
          if (v91 < 0)
            p_p = __p;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initializer '%s' not found"), p_p);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
          v52 = (int8x8_t *)v86;
          v53 = v82;
          v54 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
          v55 = v52[124];
          if (v55)
          {
            v56 = v54;
            v57 = (uint8x8_t)vcnt_s8(v55);
            v57.i16[0] = vaddlv_u8(v57);
            v58 = v57.u32[0];
            if (v57.u32[0] > 1uLL)
            {
              v59 = v54;
              if (v54 >= *(_QWORD *)&v55)
                v59 = v54 % *(_QWORD *)&v55;
            }
            else
            {
              v59 = (*(_QWORD *)&v55 - 1) & v54;
            }
            v60 = *(unsigned __int8 ***)(*(_QWORD *)&v52[123] + 8 * v59);
            if (v60)
            {
              for (i = *v60; i; i = *(unsigned __int8 **)i)
              {
                v62 = *((_QWORD *)i + 1);
                if (v56 == v62)
                {
                  if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)&__p))
                  {
                    v81 = i != 0;
                    goto LABEL_68;
                  }
                }
                else
                {
                  if (v58 > 1)
                  {
                    if (v62 >= *(_QWORD *)&v55)
                      v62 %= *(_QWORD *)&v55;
                  }
                  else
                  {
                    v62 &= *(_QWORD *)&v55 - 1;
                  }
                  if (v62 != v59)
                    break;
                }
              }
            }
          }
          if (a5)
          {
            v63 = (void *)MEMORY[0x1E0CB35C8];
            v101[0] = *(__int128 **)MEMORY[0x1E0CB2D50];
            v102 = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, v101, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v64);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          v81 = 0;
LABEL_68:

          v65 = v87;
          if (v87)
          {
            v66 = (unint64_t *)&v87->__shared_owners_;
            do
              v67 = __ldaxr(v66);
            while (__stlxr(v67 - 1, v66));
            if (!v67)
            {
              ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
              std::__shared_weak_count::__release_weak(v65);
            }
          }

          if (v81)
          {
            -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
            v68 = v101[0];
            objc_msgSend(v8, "initializer");
            v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:ne180100]<0>(&v86, (char *)objc_msgSend(v69, "UTF8String"));
            v100 = &v86;
            v70 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v68 + 984, (unsigned __int8 *)&v86, (__int128 **)&v100);
            v72 = v70[5];
            v71 = (std::__shared_weak_count *)v70[6];
            v102 = (_QWORD *)v72;
            v103 = v71;
            if (v71)
            {
              v73 = (unint64_t *)&v71->__shared_owners_;
              do
                v74 = __ldxr(v73);
              while (__stxr(v74 + 1, v73));
            }
            if (v88 < 0)
              operator delete(v86);

            std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)v101);
            v85[0] = 0;
            v85[1] = 0;
            -[ETTaskDefinition trainingGraphNetPtr](v10, "trainingGraphNetPtr");
            Espresso::net::setup_script(v72, v85, *(unsigned int *)(**((_QWORD **)v86 + 4) + 12));
            std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&v86);
            std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)v85);
            v75 = (void (***)(uint64_t *__return_ptr, _QWORD))v102[2];
            v83[0] = MEMORY[0x1E0C809B0];
            v83[1] = 3321888768;
            v83[2] = __70__ETTaskDefinition_initWithTrainingModelDefinition_forPlatform_error___block_invoke;
            v83[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
            v84[0] = v102;
            v84[1] = v103;
            if (v103)
            {
              v76 = (unint64_t *)&v103->__shared_owners_;
              do
                v77 = __ldxr(v76);
              while (__stxr(v77 + 1, v76));
            }
            Espresso::abstract_context::compute_batch_sync(v75, v83);
            v13 = v10;
            std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)v84);
            std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&v102);
          }
          else
          {
            v13 = 0;
          }
          if (v91 < 0)
            operator delete(__p);
          v33 = 0;
          goto LABEL_87;
        }
        v33 = 0;
      }
      v13 = 0;
      goto LABEL_87;
    }
    if (a5)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v104 = *MEMORY[0x1E0CB2D50];
      v105 = CFSTR("No network made from call to load_network");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  v13 = 0;
LABEL_88:
  v78 = v98;
  if (v98)
  {
    v79 = (unint64_t *)&v98->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
LABEL_6:

  return v13;
}

- (id)namesVectorToFoundationArray:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  if (a3->__end_ != a3->__begin_)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v6;
      v5 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3) > v6);
  }
  return v4;
}

- (id)doInferenceOnData:(id)a3 error:(id *)a4
{
  uint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _ETBufferDataSource *v13;
  _QWORD *v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  unint64_t batchSize;
  unint64_t v19;
  unint64_t v20;
  unint64_t i;
  char *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void (***v29)(uint64_t *__return_ptr, _QWORD);
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  uint64_t j;
  char *v39;
  float *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  size_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  _ETBufferDataSource *v53;
  void *v54;
  void *v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  id *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[6];
  void *v74[5];
  id v75;
  void *__p;
  std::__shared_weak_count *v77;
  _QWORD *v78;
  void *v79[2];
  __int128 v80;
  int v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  uint64_t (*v86)(uint64_t);
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  int v90;
  __int128 v91;
  uint64_t v92[2];
  uint64_t v93;
  uint64_t v94;
  void **p_p;
  _BYTE v96[160];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  Espresso::net::get_global(&v93, v82, (unsigned __int8 *)&self->training_control_name);
  if (v83)
  {
    p_shared_owners = &v83->__shared_owners_;
    do
      v7 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v7 - 1, (unint64_t *)p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  v8 = (std::__shared_weak_count *)v94;
  v92[0] = v93;
  v92[1] = v94;
  if (v94)
  {
    v9 = (unint64_t *)(v94 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  Espresso::fill_bc(v92, 0.0);
  if (v8)
  {
    v11 = (unint64_t *)&v8->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v13 = -[_ETBufferDataSource initWithBlobShapes:numberOfDataPoints:batchSize:error:]([_ETBufferDataSource alloc], "initWithBlobShapes:numberOfDataPoints:batchSize:error:", &self->infInputBlobShapes.__table_.__p3_, objc_msgSend(v65, "numberOfDataPoints"), self->batchSize, 0);
  if (v13)
  {
    v91 = 0uLL;
    v14 = operator new(0x30uLL);
    v14[1] = 0;
    v14[2] = 0;
    *v14 = &off_1E2DBDFF8;
    v15 = v65;
    v14[3] = &off_1E2D99670;
    *((_BYTE *)v14 + 32) = 0;
    v14[5] = v15;
    *(_QWORD *)&v16 = v14 + 3;
    *((_QWORD *)&v16 + 1) = v14;
    v91 = v16;
    v17 = objc_msgSend(v15, "numberOfDataPoints");
    v64 = a4;
    batchSize = self->batchSize;
    v19 = objc_msgSend(v15, "numberOfDataPoints");
    v20 = self->batchSize;
    v82 = 0;
    v83 = (std::__shared_weak_count *)&v82;
    v84 = 0x5812000000;
    v85 = __Block_byref_object_copy__739;
    v86 = __Block_byref_object_dispose__740;
    v87 = 0u;
    v88 = 0u;
    v89 = 0;
    v90 = 1065353216;
    for (i = self->trainInputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_; i; i = *(_QWORD *)i)
    {
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,4>,std::allocator<Espresso::blob<float,4>>,int &,int &,int &,int &,void>(v79, *(_DWORD *)(i + 40), *(_DWORD *)(i + 44), *(_DWORD *)(i + 48), *(_DWORD *)(i + 56) * *(_DWORD *)(i + 52));
      __p = (void *)(i + 16);
      v22 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v83[2], (unsigned __int8 *)(i + 16), (__int128 **)&__p);
      std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v22 + 40), (__int128 *)v79);
      v23 = (std::__shared_weak_count *)v79[1];
      if (v79[1])
      {
        v24 = (unint64_t *)((char *)v79[1] + 8);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
    v67 = (v17 - 1) / batchSize;
    if (v67 == -1)
    {
LABEL_64:
      v53 = v13;
    }
    else
    {
      v26 = 0;
      v66 = (v19 % v20);
      v68 = (uint64_t)((v19 % v20) << 32) >> 30;
      while (1)
      {
        *(_OWORD *)v79 = 0u;
        v80 = 0u;
        v81 = 1065353216;
        (*(void (**)(void **__return_ptr, _QWORD, uint64_t, unint64_t))(*(_QWORD *)v91 + 8))(&__p, v91, v26, self->batchSize);
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__move_assign((uint64_t)v79, (uint64_t *)&__p);
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v78);
        v27 = __p;
        __p = 0;
        if (v27)
          operator delete(v27);
        v75 = 0;
        -[ETTaskDefinition checkShapes:withSample:withError:](self, "checkShapes:withSample:withError:", &self->optimizer_control_name.__r_.var0, v79, &v75);
        v28 = v75;
        if (v28)
          break;
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v29 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)__p + 2);
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3321888768;
        v73[2] = __44__ETTaskDefinition_doInferenceOnData_error___block_invoke;
        v73[3] = &unk_1E2DC44F0;
        std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v74, (uint64_t)v79);
        v73[4] = self;
        v73[5] = &v82;
        Espresso::abstract_context::compute_batch_sync(v29, v73);
        v30 = v77;
        if (v77)
        {
          v31 = (unint64_t *)&v77->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v33 = self->optimizer_control_name.__r_.__value_.var0.__l.__data_;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v96, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v70;
          v36 = v26 != v67 || v66 == 0;
          v37 = !v36;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v70 != v35)
                objc_enumerationMutation(v33);
              std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j)), "UTF8String"));
              p_p = &__p;
              v39 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v83[2], (unsigned __int8 *)&__p, (__int128 **)&p_p);
              v40 = -[_ETBufferDataSource dataAtIndex:key:](v13, "dataAtIndex:key:", self->batchSize * v26, &__p);
              v41 = *((_QWORD *)v39 + 5);
              if (v37)
              {
                v42 = 0;
                v43 = *(int *)(v41 + 8);
                v44 = v43;
                do
                {
                  v44 *= *(int *)(v41 + 12 + v42);
                  v42 += 4;
                }
                while (v42 != 12);
                if (v44 == 1)
                {
                  *v40 = **(float **)(v41 + 24);
                  goto LABEL_54;
                }
                for (k = 0; k != 12; k += 4)
                  v43 *= *(int *)(v41 + 12 + k);
                v46 = *(const void **)(v41 + 24);
                v49 = v68 * (v43 / self->batchSize);
              }
              else
              {
                v45 = 0;
                v46 = *(const void **)(v41 + 24);
                v47 = *(int *)(v41 + 8);
                v48 = v41 + 12;
                do
                {
                  v47 *= *(int *)(v48 + v45);
                  v45 += 4;
                }
                while (v45 != 12);
                v49 = 4 * v47;
              }
              memcpy(v40, v46, v49);
LABEL_54:
              if (SHIBYTE(v78) < 0)
                operator delete(__p);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v96, 16);
          }
          while (v34);
        }

        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v74[2]);
        v51 = v74[0];
        v74[0] = 0;
        if (v51)
          operator delete(v51);
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v80);
        v52 = v79[0];
        v79[0] = 0;
        if (v52)
          operator delete(v52);
        v36 = v26++ == v67;
        if (v36)
          goto LABEL_64;
      }
      v54 = v28;
      if (v64)
        *v64 = objc_retainAutorelease(v28);

      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v80);
      v55 = v79[0];
      v79[0] = 0;
      if (v55)
        operator delete(v55);
      v53 = 0;
    }
    _Block_object_dispose(&v82, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(*((_QWORD **)&v88 + 1));
    v56 = (void *)*((_QWORD *)&v87 + 1);
    *((_QWORD *)&v87 + 1) = 0;
    if (v56)
      operator delete(v56);
    v57 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
    if (*((_QWORD *)&v91 + 1))
    {
      v58 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
  }
  else
  {
    v53 = 0;
  }

  v60 = (std::__shared_weak_count *)v94;
  if (v94)
  {
    v61 = (unint64_t *)(v94 + 8);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }

  return v53;
}

- (BOOL)privateDoTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6
{
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  id v26;
  __int128 v27;
  unint64_t value;
  char *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t batchSize;
  _ETBufferDataSource *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  int v41;
  void (***v42)(uint64_t *__return_ptr, _QWORD);
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _QWORD *j;
  float *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  unint64_t *v54;
  uint64_t v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t (**v61)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v72;
  uint64_t (**v73)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  char v81;
  void *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  void *v87;
  id v88;
  BOOL v89;
  void *context;
  uint64_t v92;
  id v93;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_training_control_name;
  id v95;
  id *v96;
  unint64_t v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  uint64_t v100;
  std::__shared_weak_count *v101;
  _QWORD v102[6];
  void *v103[5];
  id v104;
  void *__p;
  std::__shared_weak_count *v106;
  _QWORD *v107;
  __int128 v108;
  __int128 v109;
  int v110;
  uint64_t v111;
  std::__shared_weak_count *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  uint64_t (*v115)(uint64_t);
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  int i;
  __int128 v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  uint64_t v123;
  std::__shared_weak_count *v124;
  uint64_t v125;
  std::__shared_weak_count *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v95 = a5;
  v9 = MEMORY[0x19401D4A4]();
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  p_training_control_name = &self->training_control_name;
  Espresso::net::get_global(&v125, v111, (unsigned __int8 *)&self->training_control_name);
  v87 = (void *)v9;
  Espresso::fill_bc(&v125, 1.0);
  v10 = v126;
  if (v126)
  {
    p_shared_owners = (unint64_t *)&v126->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v112)
  {
    v13 = &v112->__shared_owners_;
    do
      v14 = __ldaxr((unint64_t *)v13);
    while (__stlxr(v14 - 1, (unint64_t *)v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
      std::__shared_weak_count::__release_weak(v112);
    }
  }
  if (self->runtimePlatform == 4)
  {
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    Espresso::net::get_global(&v123, v111, (unsigned __int8 *)&self->training_control_name.__r_.var0);
    Espresso::fill_bc(&v123, 1.0);
    v15 = v124;
    if (v124)
    {
      v16 = (unint64_t *)&v124->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (v112)
    {
      v18 = &v112->__shared_owners_;
      do
        v19 = __ldaxr((unint64_t *)v18);
      while (__stlxr(v19 - 1, (unint64_t *)v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
        std::__shared_weak_count::__release_weak(v112);
      }
    }
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    Espresso::net::get_global(&v121, v111, (unsigned __int8 *)&self->gradient_control_name.__r_.__value_.var0.__s.__data_[8]);
    Espresso::fill_bc(&v121, 1.0);
    v20 = v122;
    if (v122)
    {
      v21 = (unint64_t *)&v122->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    if (v112)
    {
      v23 = &v112->__shared_owners_;
      do
        v24 = __ldaxr((unint64_t *)v23);
      while (__stlxr(v24 - 1, (unint64_t *)v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
        std::__shared_weak_count::__release_weak(v112);
      }
    }
  }
  v120 = 0uLL;
  v96 = a6;
  v25 = operator new(0x30uLL);
  v25[1] = 0;
  v25[2] = 0;
  *v25 = &off_1E2DBDFF8;
  v26 = v88;
  *((_BYTE *)v25 + 32) = 0;
  v25[3] = &off_1E2D99670;
  v93 = v26;
  v25[5] = v26;
  *(_QWORD *)&v27 = v25 + 3;
  *((_QWORD *)&v27 + 1) = v25;
  v120 = v27;
  value = self->infOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  v111 = 0;
  v112 = (std::__shared_weak_count *)&v111;
  v113 = 0x5812000000;
  v114 = __Block_byref_object_copy__739;
  v115 = __Block_byref_object_dispose__740;
  v116 = 0u;
  v117 = 0u;
  v118 = 0;
  for (i = 1065353216; value; value = *(_QWORD *)value)
  {
    std::allocate_shared[abi:ne180100]<Espresso::blob<float,4>,std::allocator<Espresso::blob<float,4>>,int &,int &,int &,int &,void>(&v108, *(_DWORD *)(value + 40), *(_DWORD *)(value + 44), *(_DWORD *)(value + 48), *(_DWORD *)(value + 56) * *(_DWORD *)(value + 52));
    __p = (void *)(value + 16);
    v29 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v112[2], (unsigned __int8 *)(value + 16), (__int128 **)&__p);
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v29 + 40), &v108);
    v30 = (std::__shared_weak_count *)*((_QWORD *)&v108 + 1);
    if (*((_QWORD *)&v108 + 1))
    {
      v31 = (unint64_t *)(*((_QWORD *)&v108 + 1) + 8);
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
  }
  if (a4)
  {
    v89 = 0;
    v92 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x19401D4A4]();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v93, "prepareForEpoch");
      v33 = objc_msgSend(v93, "numberOfDataPoints");
      batchSize = self->batchSize;
      v97 = (v33 - 1) / batchSize;
      v35 = -[_ETBufferDataSource initWithBlobShapes:numberOfDataPoints:batchSize:error:]([_ETBufferDataSource alloc], "initWithBlobShapes:numberOfDataPoints:batchSize:error:", &self->trainInputBlobShapes.__table_.__p3_, (v97 + 1) * batchSize, batchSize, 0);
      if (v97 == -1)
      {
LABEL_87:
        objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Epoch"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v72
          || (objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Epoch")),
              v73 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
              v74 = ((uint64_t (**)(_QWORD, uint64_t, _ETBufferDataSource *, ETTaskDefinition *))v73)[2](v73, v92, v35, self), v73, v72, (v74 & 1) != 0))
        {
          -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
          Espresso::net::get_global(&v98, v108, (unsigned __int8 *)p_training_control_name);
          Espresso::fill_bc(&v98, 1.0);
          v75 = v99;
          if (v99)
          {
            v76 = (unint64_t *)&v99->__shared_owners_;
            do
              v77 = __ldaxr(v76);
            while (__stlxr(v77 - 1, v76));
            if (!v77)
            {
              ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
              std::__shared_weak_count::__release_weak(v75);
            }
          }
          v78 = (std::__shared_weak_count *)*((_QWORD *)&v108 + 1);
          if (*((_QWORD *)&v108 + 1))
          {
            v79 = (unint64_t *)(*((_QWORD *)&v108 + 1) + 8);
            do
              v80 = __ldaxr(v79);
            while (__stlxr(v80 - 1, v79));
            if (!v80)
            {
              ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
              std::__shared_weak_count::__release_weak(v78);
            }
          }
          v81 = 1;
          goto LABEL_101;
        }
      }
      else
      {
        v36 = 0;
        while (1)
        {
          v37 = (void *)MEMORY[0x19401D4A4]();
          v108 = 0u;
          v109 = 0u;
          v110 = 1065353216;
          (*(void (**)(void **__return_ptr, _QWORD, uint64_t, unint64_t))(*(_QWORD *)v120 + 8))(&__p, v120, v36, self->batchSize);
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__move_assign((uint64_t)&v108, (uint64_t *)&__p);
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v107);
          v38 = __p;
          __p = 0;
          if (v38)
            operator delete(v38);
          v104 = 0;
          -[ETTaskDefinition checkShapes:withSample:withError:](self, "checkShapes:withSample:withError:", &self->trainOutputNames, &v108, &v104);
          v39 = v104;
          v40 = v104;
          if (v40)
          {
            if (v96)
              objc_storeStrong(v96, v39);
            v41 = 1;
          }
          else
          {
            -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
            v42 = (void (***)(uint64_t *__return_ptr, _QWORD))*((_QWORD *)__p + 2);
            v102[0] = MEMORY[0x1E0C809B0];
            v102[1] = 3321888768;
            v102[2] = __81__ETTaskDefinition_privateDoTrainingOnData_forNumberOfEpochs_withCallback_error___block_invoke;
            v102[3] = &unk_1E2DC44F0;
            std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v103, (uint64_t)&v108);
            v102[4] = self;
            v102[5] = &v111;
            Espresso::abstract_context::compute_batch_sync(v42, v102);
            v43 = v106;
            if (v106)
            {
              v44 = (unint64_t *)&v106->__shared_owners_;
              do
                v45 = __ldaxr(v44);
              while (__stlxr(v45 - 1, v44));
              if (!v45)
              {
                ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                std::__shared_weak_count::__release_weak(v43);
              }
            }
            for (j = (_QWORD *)v112[2].__shared_weak_owners_; j; j = (_QWORD *)*j)
            {
              v47 = -[_ETBufferDataSource dataAtIndex:key:](v35, "dataAtIndex:key:", self->batchSize * v36, j + 2);
              v48 = 0;
              v49 = j[5];
              v50 = *(_DWORD *)(v49 + 8);
              v51 = v49 + 12;
              do
              {
                v50 *= *(_DWORD *)(v51 + v48);
                v48 += 4;
              }
              while (v48 != 12);
              v52 = (std::__shared_weak_count *)operator new(0x60uLL);
              v53 = 0;
              v52->__shared_owners_ = 0;
              v54 = (unint64_t *)&v52->__shared_owners_;
              v52->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBECA8;
              v52->__shared_weak_owners_ = 0;
              v52[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DA11F0;
              *(_OWORD *)&v52[2].__shared_weak_owners_ = 0u;
              *(_OWORD *)&v52[3].__shared_owners_ = 0u;
              LODWORD(v52[1].__shared_owners_) = v50;
              *(uint64_t *)((char *)&v52[1].__shared_owners_ + 4) = 0x100000001;
              HIDWORD(v52[1].__shared_weak_owners_) = 1;
              v52[2].__vftable = (std::__shared_weak_count_vtbl *)v47;
              LOBYTE(v52[2].__shared_owners_) = 0;
              v55 = j[5];
              v56 = *(const void **)(v55 + 24);
              v57 = *(int *)(v55 + 8);
              v58 = v55 + 12;
              do
              {
                v57 *= *(int *)(v58 + v53);
                v53 += 4;
              }
              while (v53 != 12);
              memcpy(v47, v56, 4 * v57);
              do
                v59 = __ldaxr(v54);
              while (__stlxr(v59 - 1, v54));
              if (!v59)
              {
                ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
                std::__shared_weak_count::__release_weak(v52);
              }
            }
            objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Batch"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v60
              && (objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Batch")),
                  v61 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
                  v62 = ((uint64_t (**)(_QWORD, uint64_t, _ETBufferDataSource *, ETTaskDefinition *))v61)[2](v61, v36, v35, self), v61, v60, (v62 & 1) == 0))
            {
              v41 = 1;
            }
            else
            {
              -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
              Espresso::net::get_global(&v100, (uint64_t)__p, (unsigned __int8 *)p_training_control_name);
              Espresso::fill_bc(&v100, 1.0);
              v63 = v101;
              if (v101)
              {
                v64 = (unint64_t *)&v101->__shared_owners_;
                do
                  v65 = __ldaxr(v64);
                while (__stlxr(v65 - 1, v64));
                if (!v65)
                {
                  ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
                  std::__shared_weak_count::__release_weak(v63);
                }
              }
              v66 = v106;
              if (v106)
              {
                v67 = (unint64_t *)&v106->__shared_owners_;
                do
                  v68 = __ldaxr(v67);
                while (__stlxr(v68 - 1, v67));
                if (!v68)
                {
                  ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
                  std::__shared_weak_count::__release_weak(v66);
                }
              }
              v41 = 0;
            }
            std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v103[2]);
            v69 = v103[0];
            v103[0] = 0;
            if (v69)
              operator delete(v69);
          }

          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((_QWORD *)v109);
          v70 = (void *)v108;
          *(_QWORD *)&v108 = 0;
          if (v70)
            operator delete(v70);
          objc_autoreleasePoolPop(v37);
          if (v41)
            break;
          if (v36++ == v97)
            goto LABEL_87;
        }
      }
      v81 = 0;
LABEL_101:

      objc_autoreleasePoolPop(context);
      if ((v81 & 1) != 0)
      {
        v89 = ++v92 >= a4;
        if (v92 != a4)
          continue;
      }
      goto LABEL_105;
    }
  }
  v89 = 1;
LABEL_105:
  _Block_object_dispose(&v111, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(*((_QWORD **)&v117 + 1));
  v82 = (void *)*((_QWORD *)&v116 + 1);
  *((_QWORD *)&v116 + 1) = 0;
  if (v82)
    operator delete(v82);
  v83 = (std::__shared_weak_count *)*((_QWORD *)&v120 + 1);
  if (*((_QWORD *)&v120 + 1))
  {
    v84 = (unint64_t *)(*((_QWORD *)&v120 + 1) + 8);
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  objc_autoreleasePoolPop(v87);

  return v89;
}

- (BOOL)doTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6
{
  BOOL v7;
  id v8;
  id v10;

  v10 = 0;
  v7 = -[ETTaskDefinition privateDoTrainingOnData:forNumberOfEpochs:withCallback:error:](self, "privateDoTrainingOnData:forNumberOfEpochs:withCallback:error:", a3, a4, a5, &v10);
  v8 = v10;
  if (a6 && v10)
  {
    *a6 = objc_retainAutorelease(v10);
    v8 = v10;
  }

  return v7;
}

- (BOOL)saveNetwork:(id)a3 inplace:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t *p_shared_owners;
  unint64_t v10;
  BOOL v11;
  BOOL v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  _QWORD *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  unint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const void **v61;
  unsigned __int8 *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  uint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  void *v71;
  id v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  void *v82[2];
  char v83;
  void *v84[2];
  char v85;
  std::string v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  void *v89[2];
  char v90;
  void *v91[2];
  char v92;
  std::string v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  void *__p;
  std::__shared_weak_count *v97;
  char v98;
  uint64_t v99;
  std::__shared_weak_count *v100;
  uint64_t v101;
  std::__shared_weak_count *v102;
  unsigned __int8 *v103;
  std::__shared_weak_count *v104;
  uint64_t v105;
  void *v106[2];
  char v107;
  void *v108[2];
  char v109;
  std::string __str;
  uint64_t v111;
  std::__shared_weak_count *v112;
  _BYTE v113[8];
  std::__shared_weak_count *v114;
  void **p_p;
  _QWORD v116[3];
  _QWORD *v117;
  uint64_t v118;
  _QWORD v119[2];

  v6 = a4;
  v119[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  if (!v104)
    goto LABEL_5;
  p_shared_owners = &v104->__shared_owners_;
  do
    v10 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v10 - 1, (unint64_t *)p_shared_owners));
  if (v10)
  {
LABEL_5:
    if (v103)
      goto LABEL_6;
LABEL_27:
    if (!a5)
      goto LABEL_134;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v118 = *MEMORY[0x1E0CB2D50];
    v119[0] = CFSTR("Use saveTrainingNetwork for ETTaskDefinition created by initWithTrainingModelDefinition");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
  std::__shared_weak_count::__release_weak(v104);
  if (!v103)
    goto LABEL_27;
LABEL_6:
  if (!v6)
    goto LABEL_23;
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  v11 = -[ETTaskDefinition setInferenceNetworkWeights:error:](self, "setInferenceNetworkWeights:error:", v113, a5);
  v12 = v11;
  v13 = v114;
  if (v114)
  {
    v14 = (unint64_t *)&v114->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
      if (v12)
        goto LABEL_12;
LABEL_29:
      LOBYTE(a5) = 0;
      goto LABEL_134;
    }
  }
  if (!v11)
    goto LABEL_29;
LABEL_12:
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v108, "");
  std::string::basic_string[abi:ne180100]<0>(v106, "");
  Espresso::dump_network(&v111, &__str, (uint64_t)v108, (uint64_t)v106);
  if (v107 < 0)
    operator delete(v106[0]);
  if (v109 < 0)
    operator delete(v108[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v16 = v112;
  if (v112)
  {
    v17 = (unint64_t *)&v112->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_23:
  v103 = 0;
  v104 = 0;
  v105 = 0;
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v116[0] = &off_1E2DAEAB8;
  v116[1] = &v103;
  v117 = v116;
  Espresso::net::apply_to_all_globals(__p, v116);
  v19 = v117;
  if (v117 == v116)
  {
    v20 = 4;
    v19 = v116;
    goto LABEL_31;
  }
  if (v117)
  {
    v20 = 5;
LABEL_31:
    (*(void (**)(void))(*v19 + 8 * v20))();
  }
  if (v97)
  {
    v23 = &v97->__shared_owners_;
    do
      v24 = __ldaxr((unint64_t *)v23);
    while (__stlxr(v24 - 1, (unint64_t *)v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
      std::__shared_weak_count::__release_weak(v97);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  Espresso::build_variable_loader(&v101, (uint64_t *)&__p, &v103);
  v25 = v97;
  if (v97)
  {
    v26 = &v97->__shared_owners_;
    do
      v27 = __ldaxr((unint64_t *)v26);
    while (__stlxr(v27 - 1, (unint64_t *)v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v28 = v99;
  std::string::basic_string[abi:ne180100]<0>(&__p, "globals_container_net");
  p_p = &__p;
  v29 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v28 + 984, (unsigned __int8 *)&__p, (__int128 **)&p_p);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](v29 + 5, v101, (uint64_t)v102);
  if (v98 < 0)
    operator delete(__p);
  v30 = v100;
  if (v100)
  {
    v31 = (unint64_t *)&v100->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v33 = v99;
  std::string::basic_string[abi:ne180100]<0>(&__p, "training");
  p_p = &__p;
  v34 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v33 + 472), &__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_p);
  MEMORY[0x19401C808]((char *)v34 + 56, "1");
  if (v98 < 0)
    operator delete(__p);
  v35 = v100;
  if (v100)
  {
    v36 = (unint64_t *)&v100->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  v39 = __p;
  v38 = v97;
  if (v97)
  {
    v40 = &v97->__shared_owners_;
    do
      v41 = __ldaxr((unint64_t *)v40);
    while (__stlxr(v41 - 1, (unint64_t *)v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v42 = v39[4];
  v43 = v39[5];
LABEL_62:
  if (v42 != v43)
  {
    v44 = *(std::__shared_weak_count **)(v42 + 8);
    __p = *(void **)v42;
    v97 = v44;
    if (v44)
    {
      v45 = (unint64_t *)&v44->__shared_owners_;
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v48 = v99;
    v47 = v100;
    if (v100)
    {
      v49 = (unint64_t *)&v100->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    v51 = *(uint64_t **)(v48 + 32);
    v52 = *(uint64_t **)(v48 + 40);
    while (1)
    {
      if (v51 == v52)
      {
        v65 = v97;
        if (v97)
        {
          v66 = &v97->__shared_owners_;
          do
            v67 = __ldaxr((unint64_t *)v66);
          while (__stlxr(v67 - 1, (unint64_t *)v66));
          if (!v67)
          {
            ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
            std::__shared_weak_count::__release_weak(v65);
          }
        }
        v42 += 16;
        goto LABEL_62;
      }
      v54 = *v51;
      v53 = (std::__shared_weak_count *)v51[1];
      v99 = *v51;
      v100 = v53;
      if (v53)
      {
        v55 = (unint64_t *)&v53->__shared_owners_;
        do
          v56 = __ldxr(v55);
        while (__stxr(v56 + 1, v55));
      }
      v57 = *((unsigned __int8 *)__p + 39);
      if ((v57 & 0x80u) == 0)
        v58 = *((unsigned __int8 *)__p + 39);
      else
        v58 = *((_QWORD *)__p + 3);
      v59 = *(unsigned __int8 *)(v54 + 39);
      v60 = (char)v59;
      if ((v59 & 0x80u) != 0)
        v59 = *(_QWORD *)(v54 + 24);
      if (v58 == v59)
      {
        v61 = (const void **)((char *)__p + 16);
        if (v60 >= 0)
          v62 = (unsigned __int8 *)(v54 + 16);
        else
          v62 = *(unsigned __int8 **)(v54 + 16);
        if ((v57 & 0x80) != 0)
        {
          if (memcmp(*v61, v62, *((_QWORD *)__p + 3)))
            goto LABEL_92;
LABEL_91:
          (*(void (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v54 + 24))(v54, v62);
          goto LABEL_92;
        }
        if (!*((_BYTE *)__p + 39))
          goto LABEL_91;
        while (*(unsigned __int8 *)v61 == *v62)
        {
          v61 = (const void **)((char *)v61 + 1);
          ++v62;
          if (!--v57)
            goto LABEL_91;
        }
      }
LABEL_92:
      if (v53)
      {
        v63 = (unint64_t *)&v53->__shared_owners_;
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
          std::__shared_weak_count::__release_weak(v53);
        }
      }
      v51 += 2;
    }
  }
  -[ETTaskDefinition inferenceGraphNetPtr](self, "inferenceGraphNetPtr");
  a5 = (id *)objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v93, (char *)objc_msgSend(a5, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v91, "");
  std::string::basic_string[abi:ne180100]<0>(v89, "");
  Espresso::dump_network(&v94, &v93, (uint64_t)v91, (uint64_t)v89);
  if (v90 < 0)
    operator delete(v89[0]);
  if (v92 < 0)
    operator delete(v91[0]);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v93.__r_.__value_.__l.__data_);
  v68 = v95;
  if (v95)
  {
    v69 = (unint64_t *)&v95->__shared_owners_;
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  objc_msgSend(a5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".espresso.net"), CFSTR("_updatable.espresso.net"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v72 = objc_retainAutorelease(v71);
  std::string::basic_string[abi:ne180100]<0>(&v86, (char *)objc_msgSend(v72, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v84, "");
  std::string::basic_string[abi:ne180100]<0>(v82, "");
  Espresso::dump_network(&v87, &v86, (uint64_t)v84, (uint64_t)v82);
  if (v83 < 0)
    operator delete(v82[0]);
  if (v85 < 0)
    operator delete(v84[0]);
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v86.__r_.__value_.__l.__data_);
  v73 = v88;
  if (v88)
  {
    v74 = (unint64_t *)&v88->__shared_owners_;
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v76, "fileExistsAtPath:", a5);

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a5) = objc_msgSend(v77, "fileExistsAtPath:", v72);

  }
  -[ETTaskDefinition shareWeights](self, "shareWeights");

  v78 = v102;
  if (v102)
  {
    v79 = (unint64_t *)&v102->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  __p = &v103;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
LABEL_134:

  return (char)a5;
}

- (BOOL)saveTrainingNetwork:(id)a3 checkpoint:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *v28[2];
  char v29;
  void *v30[2];
  char v31;
  std::string __str;
  uint64_t v33;
  std::__shared_weak_count *v34;
  void *__p;
  std::__shared_weak_count *v36;
  char v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unsigned __int8 *v42[3];
  void **p_p;
  _QWORD v44[3];
  _QWORD *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  memset(v42, 0, sizeof(v42));
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v44[0] = &off_1E2DAEB10;
  v44[1] = v42;
  v45 = v44;
  Espresso::net::apply_to_all_globals(__p, v44);
  v9 = v45;
  if (v45 == v44)
  {
    v10 = 4;
    v9 = v44;
    goto LABEL_5;
  }
  if (v45)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  if (v36)
  {
    p_shared_owners = &v36->__shared_owners_;
    do
      v12 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  Espresso::build_variable_loader(&v40, (uint64_t *)&__p, v42);
  v13 = v36;
  if (v36)
  {
    v14 = &v36->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)v14);
    while (__stlxr(v15 - 1, (unint64_t *)v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v16 = v38;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  p_p = &__p;
  v17 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v16 + 984, (unsigned __int8 *)&__p, (__int128 **)&p_p);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](v17 + 5, v40, (uint64_t)v41);
  if (v37 < 0)
    operator delete(__p);
  v18 = v39;
  if (v39)
  {
    v19 = (unint64_t *)&v39->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v30, "");
  std::string::basic_string[abi:ne180100]<0>(v28, "");
  Espresso::dump_network(&v33, &__str, (uint64_t)v30, (uint64_t)v28);
  if (v29 < 0)
    operator delete(v28[0]);
  if (v31 < 0)
    operator delete(v30[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v21 = v34;
  if (v34)
  {
    v22 = (unint64_t *)&v34->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v41;
  if (v41)
  {
    v25 = (unint64_t *)&v41->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  __p = v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return 1;
}

- (BOOL)setInferenceNetworkWeights:(shared_ptr<Espresso:(id *)a4 :net>)a3 error:
{
  __shared_weak_count *cntrl;
  net *ptr;
  unint64_t *v7;
  unint64_t v8;
  char *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const struct __class_type_info *v14;
  __int128 v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  const struct __class_type_info *v25;
  void *v26;
  void *v27;
  std::__shared_weak_count *size;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  __int128 v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  const void *v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD *v50;
  void *v51;
  char v52;
  int v53;
  const void *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  const void *v60;
  void *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  __int128 v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  const void *v84;
  void *v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  __int128 v97;
  void *v98;
  void *v99;
  std::string::size_type v100;
  unint64_t *v101;
  unint64_t v102;
  uint64_t v103;
  const void *v104;
  void *v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  std::__shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  std::__shared_weak_count *v115;
  unint64_t *v116;
  unint64_t v117;
  unint64_t *v118;
  unint64_t v119;
  void *v120;
  unint64_t *v121;
  unint64_t v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  unint64_t *v129;
  unint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  std::__shared_weak_count *v134;
  unint64_t *v135;
  unint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  __int128 v139;
  std::__shared_weak_count *v140;
  unint64_t *v141;
  unint64_t v142;
  std::__shared_weak_count *v143;
  unint64_t *v144;
  unint64_t v145;
  std::__shared_weak_count *v146;
  unint64_t *v147;
  unint64_t v148;
  unint64_t *v149;
  unint64_t v150;
  void *v151;
  unint64_t *v152;
  unint64_t v153;
  std::__shared_weak_count *v154;
  unint64_t *v155;
  unint64_t v156;
  std::__shared_weak_count *v157;
  unint64_t *v158;
  unint64_t v159;
  std::__shared_weak_count *v160;
  unint64_t *v161;
  unint64_t v162;
  unint64_t *v163;
  unint64_t v164;
  std::__shared_weak_count *v165;
  unint64_t *v166;
  unint64_t v167;
  void *v168;
  void *v169;
  std::__shared_weak_count *v170;
  unint64_t *v171;
  unint64_t v172;
  unint64_t v173;
  std::__shared_weak_count *v174;
  unint64_t *v175;
  unint64_t v176;
  std::__shared_weak_count *v177;
  unint64_t *v178;
  unint64_t v179;
  std::__shared_weak_count *v180;
  unint64_t *v181;
  unint64_t v182;
  unint64_t *v183;
  unint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  void *v189;
  unint64_t *v190;
  unint64_t v191;
  std::__shared_weak_count *v192;
  unint64_t *v193;
  unint64_t v194;
  std::__shared_weak_count *v195;
  unint64_t *v196;
  unint64_t v197;
  std::__shared_weak_count *v198;
  unint64_t *v199;
  unint64_t v200;
  unint64_t *v201;
  unint64_t v202;
  _QWORD *v203;
  uint64_t v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  unint64_t *v207;
  unint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  __int128 v211;
  std::__shared_weak_count *v212;
  unint64_t *v213;
  unint64_t v214;
  std::__shared_weak_count *v215;
  unint64_t *v216;
  unint64_t v217;
  std::__shared_weak_count *v218;
  unint64_t *v219;
  unint64_t v220;
  unint64_t *v221;
  unint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  void *v227;
  unint64_t *v228;
  unint64_t v229;
  std::__shared_weak_count *v230;
  unint64_t *v231;
  unint64_t v232;
  std::__shared_weak_count *v233;
  unint64_t *v234;
  unint64_t v235;
  std::__shared_weak_count *v236;
  unint64_t *v237;
  unint64_t v238;
  unint64_t *v239;
  unint64_t v240;
  unint64_t *v241;
  std::__shared_weak_count *v242;
  unint64_t *v243;
  unint64_t v244;
  std::__shared_weak_count *v245;
  unint64_t *v246;
  unint64_t v247;
  _QWORD *v248;
  uint64_t v249;
  uint64_t v250;
  std::__shared_weak_count *v251;
  unint64_t *v252;
  unint64_t v253;
  uint64_t v254;
  unint64_t *v255;
  unint64_t v256;
  void *v257;
  void *v258;
  std::__shared_weak_count *v259;
  unint64_t *v260;
  unint64_t v261;
  unsigned __int8 *v262;
  unint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const void *v267;
  uint64_t *v268;
  std::__shared_weak_count *v269;
  unint64_t *v270;
  unint64_t v271;
  std::__shared_weak_count *v272;
  unint64_t *v273;
  unint64_t v274;
  uint64_t *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  int v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  unint64_t *v284;
  unint64_t v285;
  std::__shared_weak_count *v286;
  unint64_t *v287;
  unint64_t v288;
  std::__shared_weak_count *v289;
  unint64_t *v290;
  unint64_t v291;
  std::__shared_weak_count *v292;
  unint64_t *v293;
  unint64_t v294;
  std::__shared_weak_count *v295;
  unint64_t *v296;
  unint64_t v297;
  std::__shared_weak_count *v298;
  unint64_t *v299;
  unint64_t v300;
  uint64_t v301;
  std::__shared_weak_count *v302;
  unint64_t *v303;
  unint64_t v304;
  char *v306;
  _QWORD *v307;
  uint64_t v308;
  uint64_t v309;
  std::__shared_weak_count *v310;
  uint64_t v311;
  std::__shared_weak_count *v312;
  uint64_t *v313;
  std::__shared_weak_count *v314;
  __int128 v315;
  uint64_t *v316;
  std::__shared_weak_count *v317;
  __int128 v318;
  uint64_t *v319;
  std::__shared_weak_count *v320;
  unint64_t *v321;
  std::__shared_weak_count *v322;
  __int128 v323;
  uint64_t *v324;
  std::__shared_weak_count *v325;
  __int128 v326;
  unint64_t *v327;
  std::__shared_weak_count *v328;
  std::string v329;
  void *v330;
  std::__shared_weak_count *v331;
  uint64_t v332;
  __int128 v333;
  uint64_t v334;
  const __CFString *v335;
  uint64_t v336;
  const __CFString *v337;
  uint64_t v338;
  const __CFString *v339;
  std::string v340;
  __int128 v341;
  uint64_t v342;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v342 = *MEMORY[0x1E0C80C00];
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr", a3.__ptr_, a3.__cntrl_, a4);
  Espresso::run_pass_on_network<Espresso::pass_blob_name_indexing>((uint64_t)v329.__r_.__value_.__l.__data_);
  if (v329.__r_.__value_.__l.__size_)
  {
    v7 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v329.__r_.__value_.__l.__size_ + 16))(v329.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v329.__r_.__value_.__l.__size_);
    }
  }
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v9 = (char *)Espresso::net::get_analysis<Espresso::pass_blob_name_indexing_result>((uint64_t)v329.__r_.__value_.__l.__data_);
  if (v329.__r_.__value_.__l.__size_)
  {
    v10 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v329.__r_.__value_.__l.__size_ + 16))(v329.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v329.__r_.__value_.__l.__size_);
    }
  }
  v12 = *(_QWORD *)(*(_QWORD *)ptr + 32);
  if (*(_QWORD *)(*(_QWORD *)ptr + 40) == v12)
    return 1;
  v13 = 0;
  v306 = v9;
  v307 = v9 + 16;
  v308 = *MEMORY[0x1E0CB2D50];
  while (1)
  {
    v15 = *(_OWORD *)(v12 + 16 * v13);
    v333 = v15;
    if (*((_QWORD *)&v15 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    v18 = (uint64_t *)(v15 + 16);
    v19 = v15 + 16;
    if (*(char *)(v15 + 39) < 0)
      v19 = *v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing inference layer %s"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v21 = (_QWORD *)(v329.__r_.__value_.__r.__words[0] + 928);
    v22 = v20;
    v23 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::find<std::string>(v21, (uint64_t)v18);
    v24 = v23;
    v25 = v14;
    if (cntrl && !v23)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)&v341 = v308;
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v340, &v341, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v27);
      *(_QWORD *)cntrl = (id)objc_claimAutoreleasedReturnValue();

    }
    size = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
    if (v329.__r_.__value_.__l.__size_)
    {
      v29 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }

    if (!v24)
    {
      v53 = 1;
      goto LABEL_355;
    }
    v332 = 0;
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v340.__r_.__value_.__r.__words[0] = v333 + 16;
    v31 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 928, v333 + 16, (uint64_t)&std::piecewise_construct, (__int128 **)&v340)[5];
    v32 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
    if (v329.__r_.__value_.__l.__size_)
    {
      v33 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v332 = v31;
    -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
    v35 = *(_OWORD *)(*(_QWORD *)(v329.__r_.__value_.__r.__words[0] + 32) + 16 * v332);
    v341 = v35;
    if (*((_QWORD *)&v35 + 1))
    {
      v36 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
      do
        v37 = __ldxr(v36);
      while (__stxr(v37 + 1, v36));
    }
    v38 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
    if (v329.__r_.__value_.__l.__size_)
    {
      v39 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    v41 = v341;
    v42 = *(const void **)(v341 + 64);
    if (!v42
    {
      goto LABEL_349;
    }
    v43 = *(std::__shared_weak_count **)(v41 + 72);
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v45 = __ldxr(p_shared_owners);
      while (__stxr(v45 + 1, p_shared_owners));
      do
        v46 = __ldaxr(p_shared_owners);
      while (__stlxr(v46 - 1, p_shared_owners));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    -[ETVariablesDefinition layerNames](self->varsDef, "layerNames");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      -[ETVariablesDefinition layerNames](self->varsDef, "layerNames");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v341;
      v50 = (_QWORD *)(v341 + 16);
      if (*(char *)(v341 + 39) < 0)
        v50 = (_QWORD *)*v50;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v48, "containsObject:", v51);

      if ((v52 & 1) == 0)
      {
        v53 = 4;
        v14 = v25;
        goto LABEL_350;
      }
    }
    else
    {
      v49 = v341;
    }
    v54 = *(const void **)(v49 + 64);
    if (!v54)
    {
      *(_OWORD *)&v340.__r_.__value_.__l.__data_ = 0uLL;
LABEL_70:
      if (cntrl)
      {
        v65 = (void *)MEMORY[0x1E0CB35C8];
        v334 = v308;
        v335 = CFSTR("Currently only supports networks where only inner product and convolution layers have weights");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v335, &v334, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v66);
        *(_QWORD *)cntrl = (id)objc_claimAutoreleasedReturnValue();

      }
      v53 = 1;
LABEL_73:
      v14 = v25;
      goto LABEL_74;
    }
    {
      v55 = *(std::__shared_weak_count **)(v49 + 72);
      v14 = v25;
      if (v55)
      {
        v56 = (unint64_t *)&v55->__shared_owners_;
        do
          v57 = __ldxr(v56);
        while (__stxr(v57 + 1, v56));
        do
          v58 = __ldaxr(v56);
        while (__stlxr(v58 - 1, v56));
        if (!v58)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      v59 = v333;
      v60 = *(const void **)(v333 + 64);
      if (v60
      {
        v62 = *(std::__shared_weak_count **)(v59 + 72);
        v330 = v61;
        v331 = v62;
        if (v62)
        {
          v63 = (unint64_t *)&v62->__shared_owners_;
          do
            v64 = __ldxr(v63);
          while (__stxr(v64 + 1, v63));
        }
      }
      else
      {
        v330 = 0;
        v331 = 0;
      }
      -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)&v332;
      v70 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v340);
      v72 = v70[3];
      v71 = v70[4];
      v73 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
      if (v329.__r_.__value_.__l.__size_)
      {
        v74 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
        do
          v75 = __ldaxr(v74);
        while (__stlxr(v75 - 1, v74));
        if (!v75)
        {
          ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
          std::__shared_weak_count::__release_weak(v73);
        }
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v71 - v72) >> 3) >= 2)
      {
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v76 = (uint64_t *)v327;
        Espresso::get_layer_parameter_name((const void **)(v341 + 16), 1, &v340);
        v77 = Espresso::net::loaded_global_name(v76, (uint64_t)&v340);
        if (*(char *)(v77 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)v77, *(_QWORD *)(v77 + 8));
        }
        else
        {
          v78 = *(_OWORD *)v77;
          v329.__r_.__value_.__r.__words[2] = *(_QWORD *)(v77 + 16);
          *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v78;
        }
        if (SHIBYTE(v340.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v340.__r_.__value_.__l.__data_);
        v109 = v328;
        if (v328)
        {
          v110 = (unint64_t *)&v328->__shared_owners_;
          do
            v111 = __ldaxr(v110);
          while (__stlxr(v111 - 1, v110));
          if (!v111)
          {
            ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
            std::__shared_weak_count::__release_weak(v109);
          }
        }
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        Espresso::net::get_global(&v340, (uint64_t)v327, (unsigned __int8 *)&v329);
        v112 = v328;
        if (v328)
        {
          v113 = (unint64_t *)&v328->__shared_owners_;
          do
            v114 = __ldaxr(v113);
          while (__stlxr(v114 - 1, v113));
          if (!v114)
          {
            ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
            std::__shared_weak_count::__release_weak(v112);
          }
        }
        v115 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        if (v340.__r_.__value_.__r.__words[0])
        {
          v326 = *(_OWORD *)&v340.__r_.__value_.__l.__data_;
          if (v340.__r_.__value_.__l.__size_)
          {
            v116 = (unint64_t *)(v340.__r_.__value_.__l.__size_ + 8);
            do
              v117 = __ldxr(v116);
            while (__stxr(v117 + 1, v116));
          }
          Espresso::sync_copy_to_host(&v327, &v326);
          if (v115)
          {
            v118 = (unint64_t *)&v115->__shared_owners_;
            do
              v119 = __ldaxr(v118);
            while (__stlxr(v119 - 1, v118));
            if (!v119)
            {
              ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
              std::__shared_weak_count::__release_weak(v115);
            }
          }
          v120 = v330;
          v324 = (uint64_t *)v327;
          v325 = v328;
          if (v328)
          {
            v121 = (unint64_t *)&v328->__shared_owners_;
            do
              v122 = __ldxr(v121);
            while (__stxr(v122 + 1, v121));
          }
          (*(void (**)(void *, uint64_t **))(*(_QWORD *)v120 + 400))(v120, &v324);
          v123 = v325;
          if (v325)
          {
            v124 = (unint64_t *)&v325->__shared_owners_;
            do
              v125 = __ldaxr(v124);
            while (__stlxr(v125 - 1, v124));
            if (!v125)
            {
              ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
              std::__shared_weak_count::__release_weak(v123);
            }
          }
          v126 = v328;
          if (v328)
          {
            v127 = (unint64_t *)&v328->__shared_owners_;
            do
              v128 = __ldaxr(v127);
            while (__stlxr(v128 - 1, v127));
            if (!v128)
            {
              ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
              std::__shared_weak_count::__release_weak(v126);
            }
          }
          v115 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        }
        if (v115)
        {
          v129 = (unint64_t *)&v115->__shared_owners_;
          do
            v130 = __ldaxr(v129);
          while (__stlxr(v130 - 1, v129));
          if (!v130)
          {
            ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
            std::__shared_weak_count::__release_weak(v115);
          }
        }
        if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v329.__r_.__value_.__l.__data_);
      }
      -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)&v332;
      v131 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v340);
      v133 = v131[3];
      v132 = v131[4];
      v134 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
      if (v329.__r_.__value_.__l.__size_)
      {
        v135 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
        do
          v136 = __ldaxr(v135);
        while (__stlxr(v136 - 1, v135));
        if (!v136)
        {
          ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
          std::__shared_weak_count::__release_weak(v134);
        }
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v132 - v133) >> 3) >= 3)
      {
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v137 = (uint64_t *)v327;
        Espresso::get_layer_parameter_name((const void **)(v341 + 16), 2, &v340);
        v138 = Espresso::net::loaded_global_name(v137, (uint64_t)&v340);
        if (*(char *)(v138 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)v138, *(_QWORD *)(v138 + 8));
        }
        else
        {
          v139 = *(_OWORD *)v138;
          v329.__r_.__value_.__r.__words[2] = *(_QWORD *)(v138 + 16);
          *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v139;
        }
        if (SHIBYTE(v340.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v340.__r_.__value_.__l.__data_);
        v140 = v328;
        if (v328)
        {
          v141 = (unint64_t *)&v328->__shared_owners_;
          do
            v142 = __ldaxr(v141);
          while (__stlxr(v142 - 1, v141));
          if (!v142)
          {
            ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
            std::__shared_weak_count::__release_weak(v140);
          }
        }
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        Espresso::net::get_global(&v340, (uint64_t)v327, (unsigned __int8 *)&v329);
        v143 = v328;
        if (v328)
        {
          v144 = (unint64_t *)&v328->__shared_owners_;
          do
            v145 = __ldaxr(v144);
          while (__stlxr(v145 - 1, v144));
          if (!v145)
          {
            ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
            std::__shared_weak_count::__release_weak(v143);
          }
        }
        v146 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        if (v340.__r_.__value_.__r.__words[0])
        {
          v323 = *(_OWORD *)&v340.__r_.__value_.__l.__data_;
          if (v340.__r_.__value_.__l.__size_)
          {
            v147 = (unint64_t *)(v340.__r_.__value_.__l.__size_ + 8);
            do
              v148 = __ldxr(v147);
            while (__stxr(v148 + 1, v147));
          }
          Espresso::sync_copy_to_host(&v327, &v323);
          if (v146)
          {
            v149 = (unint64_t *)&v146->__shared_owners_;
            do
              v150 = __ldaxr(v149);
            while (__stlxr(v150 - 1, v149));
            if (!v150)
            {
              ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
              std::__shared_weak_count::__release_weak(v146);
            }
          }
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,void>(&v321, *((_DWORD *)v327 + 4));
          v151 = v330;
          v319 = (uint64_t *)v321;
          v320 = v322;
          if (v322)
          {
            v152 = (unint64_t *)&v322->__shared_owners_;
            do
              v153 = __ldxr(v152);
            while (__stxr(v153 + 1, v152));
          }
          (*(void (**)(void *, uint64_t **))(*(_QWORD *)v151 + 392))(v151, &v319);
          v154 = v320;
          if (v320)
          {
            v155 = (unint64_t *)&v320->__shared_owners_;
            do
              v156 = __ldaxr(v155);
            while (__stlxr(v156 - 1, v155));
            if (!v156)
            {
              ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
              std::__shared_weak_count::__release_weak(v154);
            }
          }
          v157 = v322;
          if (v322)
          {
            v158 = (unint64_t *)&v322->__shared_owners_;
            do
              v159 = __ldaxr(v158);
            while (__stlxr(v159 - 1, v158));
            if (!v159)
            {
              ((void (*)(std::__shared_weak_count *))v157->__on_zero_shared)(v157);
              std::__shared_weak_count::__release_weak(v157);
            }
          }
          v160 = v328;
          if (v328)
          {
            v161 = (unint64_t *)&v328->__shared_owners_;
            do
              v162 = __ldaxr(v161);
            while (__stlxr(v162 - 1, v161));
            if (!v162)
            {
              ((void (*)(std::__shared_weak_count *))v160->__on_zero_shared)(v160);
              std::__shared_weak_count::__release_weak(v160);
            }
          }
          v146 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        }
        if (v146)
        {
          v163 = (unint64_t *)&v146->__shared_owners_;
          do
            v164 = __ldaxr(v163);
          while (__stlxr(v164 - 1, v163));
          if (!v164)
          {
            ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
            std::__shared_weak_count::__release_weak(v146);
          }
        }
        if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v329.__r_.__value_.__l.__data_);
      }
      v165 = v331;
      if (!v331)
        goto LABEL_349;
      v166 = (unint64_t *)&v331->__shared_owners_;
      do
        v167 = __ldaxr(v166);
      while (__stlxr(v167 - 1, v166));
LABEL_347:
      if (!v167)
      {
        ((void (*)(std::__shared_weak_count *))v165->__on_zero_shared)(v165);
        std::__shared_weak_count::__release_weak(v165);
      }
LABEL_349:
      v53 = 0;
      goto LABEL_350;
    }
    {
      v79 = *(std::__shared_weak_count **)(v49 + 72);
      v14 = v25;
      if (v79)
      {
        v80 = (unint64_t *)&v79->__shared_owners_;
        do
          v81 = __ldxr(v80);
        while (__stxr(v81 + 1, v80));
        do
          v82 = __ldaxr(v80);
        while (__stlxr(v82 - 1, v80));
        if (!v82)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
      v83 = v333;
      v84 = *(const void **)(v333 + 64);
      if (v84
      {
        v86 = *(std::__shared_weak_count **)(v83 + 72);
        v330 = v85;
        v331 = v86;
        if (v86)
        {
          v87 = (unint64_t *)&v86->__shared_owners_;
          do
            v88 = __ldxr(v87);
          while (__stxr(v88 + 1, v87));
        }
      }
      else
      {
        v330 = 0;
        v331 = 0;
      }
      -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)&v332;
      v89 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v340);
      v91 = v89[3];
      v90 = v89[4];
      v92 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
      if (v329.__r_.__value_.__l.__size_)
      {
        v93 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
        do
          v94 = __ldaxr(v93);
        while (__stlxr(v94 - 1, v93));
        if (!v94)
        {
          ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
          std::__shared_weak_count::__release_weak(v92);
        }
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v90 - v91) >> 3) >= 2)
      {
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v95 = (uint64_t *)v327;
        Espresso::get_layer_parameter_name((const void **)(v341 + 16), 1, &v340);
        v96 = Espresso::net::loaded_global_name(v95, (uint64_t)&v340);
        if (*(char *)(v96 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)v96, *(_QWORD *)(v96 + 8));
        }
        else
        {
          v97 = *(_OWORD *)v96;
          v329.__r_.__value_.__r.__words[2] = *(_QWORD *)(v96 + 16);
          *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v97;
        }
        if (SHIBYTE(v340.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v340.__r_.__value_.__l.__data_);
        v174 = v328;
        if (v328)
        {
          v175 = (unint64_t *)&v328->__shared_owners_;
          do
            v176 = __ldaxr(v175);
          while (__stlxr(v176 - 1, v175));
          if (!v176)
          {
            ((void (*)(std::__shared_weak_count *))v174->__on_zero_shared)(v174);
            std::__shared_weak_count::__release_weak(v174);
          }
        }
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        Espresso::net::get_global(&v340, (uint64_t)v327, (unsigned __int8 *)&v329);
        v177 = v328;
        if (v328)
        {
          v178 = (unint64_t *)&v328->__shared_owners_;
          do
            v179 = __ldaxr(v178);
          while (__stlxr(v179 - 1, v178));
          if (!v179)
          {
            ((void (*)(std::__shared_weak_count *))v177->__on_zero_shared)(v177);
            std::__shared_weak_count::__release_weak(v177);
          }
        }
        v180 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        if (v340.__r_.__value_.__r.__words[0])
        {
          v318 = *(_OWORD *)&v340.__r_.__value_.__l.__data_;
          if (v340.__r_.__value_.__l.__size_)
          {
            v181 = (unint64_t *)(v340.__r_.__value_.__l.__size_ + 8);
            do
              v182 = __ldxr(v181);
            while (__stxr(v182 + 1, v181));
          }
          Espresso::sync_copy_to_host(&v327, &v318);
          if (v180)
          {
            v183 = (unint64_t *)&v180->__shared_owners_;
            do
              v184 = __ldaxr(v183);
            while (__stlxr(v184 - 1, v183));
            if (!v184)
            {
              ((void (*)(std::__shared_weak_count *))v180->__on_zero_shared)(v180);
              std::__shared_weak_count::__release_weak(v180);
            }
          }
          v185 = (uint64_t *)v327;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,void>(&v321, *((_DWORD *)v327 + 2), *((_DWORD *)v327 + 3));
          v186 = 0;
          v187 = (uint64_t *)v321;
          v188 = *((int *)v185 + 2);
          do
          {
            v188 *= *(int *)((char *)v185 + v186 + 12);
            v186 += 4;
          }
          while (v186 != 12);
          memcpy((void *)v321[2], (const void *)v185[3], 4 * v188);
          v189 = v330;
          v316 = v187;
          v317 = v322;
          if (v322)
          {
            v190 = (unint64_t *)&v322->__shared_owners_;
            do
              v191 = __ldxr(v190);
            while (__stxr(v191 + 1, v190));
          }
          (*(void (**)(void *, uint64_t **))(*(_QWORD *)v189 + 400))(v189, &v316);
          v192 = v317;
          if (v317)
          {
            v193 = (unint64_t *)&v317->__shared_owners_;
            do
              v194 = __ldaxr(v193);
            while (__stlxr(v194 - 1, v193));
            if (!v194)
            {
              ((void (*)(std::__shared_weak_count *))v192->__on_zero_shared)(v192);
              std::__shared_weak_count::__release_weak(v192);
            }
          }
          v195 = v322;
          if (v322)
          {
            v196 = (unint64_t *)&v322->__shared_owners_;
            do
              v197 = __ldaxr(v196);
            while (__stlxr(v197 - 1, v196));
            if (!v197)
            {
              ((void (*)(std::__shared_weak_count *))v195->__on_zero_shared)(v195);
              std::__shared_weak_count::__release_weak(v195);
            }
          }
          v198 = v328;
          if (v328)
          {
            v199 = (unint64_t *)&v328->__shared_owners_;
            do
              v200 = __ldaxr(v199);
            while (__stlxr(v200 - 1, v199));
            if (!v200)
            {
              ((void (*)(std::__shared_weak_count *))v198->__on_zero_shared)(v198);
              std::__shared_weak_count::__release_weak(v198);
            }
          }
          v180 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        }
        if (v180)
        {
          v201 = (unint64_t *)&v180->__shared_owners_;
          do
            v202 = __ldaxr(v201);
          while (__stlxr(v202 - 1, v201));
          if (!v202)
          {
            ((void (*)(std::__shared_weak_count *))v180->__on_zero_shared)(v180);
            std::__shared_weak_count::__release_weak(v180);
          }
        }
        if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v329.__r_.__value_.__l.__data_);
      }
      -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)&v332;
      v203 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v340);
      v205 = v203[3];
      v204 = v203[4];
      v206 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
      if (v329.__r_.__value_.__l.__size_)
      {
        v207 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
        do
          v208 = __ldaxr(v207);
        while (__stlxr(v208 - 1, v207));
        if (!v208)
        {
          ((void (*)(std::__shared_weak_count *))v206->__on_zero_shared)(v206);
          std::__shared_weak_count::__release_weak(v206);
        }
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v204 - v205) >> 3) >= 3)
      {
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v209 = (uint64_t *)v327;
        Espresso::get_layer_parameter_name((const void **)(v341 + 16), 2, &v340);
        v210 = Espresso::net::loaded_global_name(v209, (uint64_t)&v340);
        if (*(char *)(v210 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)v210, *(_QWORD *)(v210 + 8));
        }
        else
        {
          v211 = *(_OWORD *)v210;
          v329.__r_.__value_.__r.__words[2] = *(_QWORD *)(v210 + 16);
          *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v211;
        }
        if (SHIBYTE(v340.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v340.__r_.__value_.__l.__data_);
        v212 = v328;
        if (v328)
        {
          v213 = (unint64_t *)&v328->__shared_owners_;
          do
            v214 = __ldaxr(v213);
          while (__stlxr(v214 - 1, v213));
          if (!v214)
          {
            ((void (*)(std::__shared_weak_count *))v212->__on_zero_shared)(v212);
            std::__shared_weak_count::__release_weak(v212);
          }
        }
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        Espresso::net::get_global(&v340, (uint64_t)v327, (unsigned __int8 *)&v329);
        v215 = v328;
        if (v328)
        {
          v216 = (unint64_t *)&v328->__shared_owners_;
          do
            v217 = __ldaxr(v216);
          while (__stlxr(v217 - 1, v216));
          if (!v217)
          {
            ((void (*)(std::__shared_weak_count *))v215->__on_zero_shared)(v215);
            std::__shared_weak_count::__release_weak(v215);
          }
        }
        v218 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        if (v340.__r_.__value_.__r.__words[0])
        {
          v315 = *(_OWORD *)&v340.__r_.__value_.__l.__data_;
          if (v340.__r_.__value_.__l.__size_)
          {
            v219 = (unint64_t *)(v340.__r_.__value_.__l.__size_ + 8);
            do
              v220 = __ldxr(v219);
            while (__stxr(v220 + 1, v219));
          }
          Espresso::sync_copy_to_host(&v327, &v315);
          if (v218)
          {
            v221 = (unint64_t *)&v218->__shared_owners_;
            do
              v222 = __ldaxr(v221);
            while (__stlxr(v222 - 1, v221));
            if (!v222)
            {
              ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
              std::__shared_weak_count::__release_weak(v218);
            }
          }
          v223 = (uint64_t *)v327;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,void>(&v321, *((_DWORD *)v327 + 4));
          v224 = 0;
          v225 = (uint64_t *)v321;
          v226 = *((int *)v223 + 2);
          do
          {
            v226 *= *(int *)((char *)v223 + v224 + 12);
            v224 += 4;
          }
          while (v224 != 12);
          memcpy((void *)v321[2], (const void *)v223[3], 4 * v226);
          v227 = v330;
          v313 = v225;
          v314 = v322;
          if (v322)
          {
            v228 = (unint64_t *)&v322->__shared_owners_;
            do
              v229 = __ldxr(v228);
            while (__stxr(v229 + 1, v228));
          }
          (*(void (**)(void *, uint64_t **))(*(_QWORD *)v227 + 392))(v227, &v313);
          v230 = v314;
          if (v314)
          {
            v231 = (unint64_t *)&v314->__shared_owners_;
            do
              v232 = __ldaxr(v231);
            while (__stlxr(v232 - 1, v231));
            if (!v232)
            {
              ((void (*)(std::__shared_weak_count *))v230->__on_zero_shared)(v230);
              std::__shared_weak_count::__release_weak(v230);
            }
          }
          v233 = v322;
          if (v322)
          {
            v234 = (unint64_t *)&v322->__shared_owners_;
            do
              v235 = __ldaxr(v234);
            while (__stlxr(v235 - 1, v234));
            if (!v235)
            {
              ((void (*)(std::__shared_weak_count *))v233->__on_zero_shared)(v233);
              std::__shared_weak_count::__release_weak(v233);
            }
          }
          v236 = v328;
          if (v328)
          {
            v237 = (unint64_t *)&v328->__shared_owners_;
            do
              v238 = __ldaxr(v237);
            while (__stlxr(v238 - 1, v237));
            if (!v238)
            {
              ((void (*)(std::__shared_weak_count *))v236->__on_zero_shared)(v236);
              std::__shared_weak_count::__release_weak(v236);
            }
          }
          v218 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
        }
        if (v218)
        {
          v239 = (unint64_t *)&v218->__shared_owners_;
          do
            v240 = __ldaxr(v239);
          while (__stlxr(v240 - 1, v239));
          if (!v240)
          {
            ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
            std::__shared_weak_count::__release_weak(v218);
          }
        }
        if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v329.__r_.__value_.__l.__data_);
      }
      v165 = v331;
      if (!v331)
        goto LABEL_349;
      v241 = (unint64_t *)&v331->__shared_owners_;
      do
        v167 = __ldaxr(v241);
      while (__stlxr(v167 - 1, v241));
      goto LABEL_347;
    }
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)(v49 + 72);
      v340.__r_.__value_.__r.__words[0] = (std::string::size_type)v98;
      v340.__r_.__value_.__l.__size_ = v100;
      if (v100)
      {
        v101 = (unint64_t *)(v100 + 8);
        do
          v102 = __ldxr(v101);
        while (__stxr(v102 + 1, v101));
      }
      v103 = v333;
      v104 = *(const void **)(v333 + 64);
      v14 = v25;
      if (v104
      {
        v106 = *(std::__shared_weak_count **)(v103 + 72);
        v330 = v105;
        v331 = v106;
        if (v106)
        {
          v107 = (unint64_t *)&v106->__shared_owners_;
          do
            v108 = __ldxr(v107);
          while (__stxr(v108 + 1, v107));
        }
      }
      else
      {
        v330 = 0;
        v331 = 0;
      }
      if (*(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v99 + 384))(v99) + 4))
      {
        if (cntrl)
        {
          v168 = (void *)MEMORY[0x1E0CB35C8];
          v338 = v308;
          v339 = CFSTR("training batchnorm is not supported");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v339, &v338, 1);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v169);
          *(_QWORD *)cntrl = (id)objc_claimAutoreleasedReturnValue();

LABEL_382:
          v53 = 1;
          v14 = v25;
LABEL_438:
          v298 = v331;
          if (v331)
          {
            v299 = (unint64_t *)&v331->__shared_owners_;
            do
              v300 = __ldaxr(v299);
            while (__stlxr(v300 - 1, v299));
            if (!v300)
            {
              ((void (*)(std::__shared_weak_count *))v298->__on_zero_shared)(v298);
              std::__shared_weak_count::__release_weak(v298);
            }
          }
          goto LABEL_74;
        }
      }
      else
      {
        -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
        v327 = (unint64_t *)&v332;
        v248 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v329.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v327);
        v250 = v248[3];
        v249 = v248[4];
        v251 = (std::__shared_weak_count *)v329.__r_.__value_.__l.__size_;
        if (v329.__r_.__value_.__l.__size_)
        {
          v252 = (unint64_t *)(v329.__r_.__value_.__l.__size_ + 8);
          do
            v253 = __ldaxr(v252);
          while (__stlxr(v253 - 1, v252));
          if (!v253)
          {
            ((void (*)(std::__shared_weak_count *))v251->__on_zero_shared)(v251);
            std::__shared_weak_count::__release_weak(v251);
          }
        }
        if (v249 - v250 == 48)
        {
          -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
          v321 = (unint64_t *)&v332;
          v254 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t)(v327 + 7), (unint64_t *)&v332, (uint64_t)&std::piecewise_construct, (uint64_t **)&v321)[3];
          if (*(char *)(v254 + 47) < 0)
            std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)(v254 + 24), *(_QWORD *)(v254 + 32));
          else
            v329 = *(std::string *)(v254 + 24);
          v259 = v328;
          if (v328)
          {
            v260 = (unint64_t *)&v328->__shared_owners_;
            do
              v261 = __ldaxr(v260);
            while (__stlxr(v261 - 1, v260));
            if (!v261)
            {
              ((void (*)(std::__shared_weak_count *))v259->__on_zero_shared)(v259);
              std::__shared_weak_count::__release_weak(v259);
            }
          }
          v262 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v307, (unsigned __int8 *)&v329);
          if (!v262)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v263 = *((int *)v262 + 10);
          v264 = *((_QWORD *)v306 + 19);
          if (v263 >= (*((_QWORD *)v306 + 20) - v264) >> 3)
            std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]();
          v265 = *(_QWORD *)(v264 + 8 * v263);
          -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
          v266 = *(_QWORD *)(v321[4] + 16 * v265);
          v267 = *(const void **)(v266 + 64);
          if (v267
          {
            v269 = *(std::__shared_weak_count **)(v266 + 72);
            v327 = (unint64_t *)v268;
            v328 = v269;
            if (v269)
            {
              v270 = (unint64_t *)&v269->__shared_owners_;
              do
                v271 = __ldxr(v270);
              while (__stxr(v271 + 1, v270));
            }
          }
          else
          {
            v327 = 0;
            v328 = 0;
          }
          v272 = v322;
          if (v322)
          {
            v273 = (unint64_t *)&v322->__shared_owners_;
            do
              v274 = __ldaxr(v273);
            while (__stlxr(v274 - 1, v273));
            if (!v274)
            {
              ((void (*)(std::__shared_weak_count *))v272->__on_zero_shared)(v272);
              std::__shared_weak_count::__release_weak(v272);
            }
          }
          v275 = (uint64_t *)v327;
          if (v327)
          {
            v276 = v327[43];
            if (v276 && !(*(unsigned int (**)(uint64_t))(*(_QWORD *)v276 + 32))(v276))
            {
              v301 = v275[43];
              v277 = *(_QWORD *)(v301 + 160);
              v302 = *(std::__shared_weak_count **)(v301 + 168);
              v321 = (unint64_t *)v277;
              v322 = v302;
              if (v302)
              {
                v303 = (unint64_t *)&v302->__shared_owners_;
                do
                  v304 = __ldxr(v303);
                while (__stxr(v304 + 1, v303));
              }
            }
            else
            {
              v277 = 0;
              v321 = 0;
              v322 = 0;
            }
            v278 = 0;
            v279 = *(_DWORD *)(v277 + 8);
            do
            {
              v279 *= *(_DWORD *)(v277 + 12 + v278);
              v278 += 4;
            }
            while (v278 != 12);
            std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,unsigned long,void>(&v311, v279);
            v280 = 0;
            v281 = v311;
            v282 = *(int *)(v277 + 8);
            do
            {
              v282 *= *(int *)(v277 + 12 + v280);
              v280 += 4;
            }
            while (v280 != 12);
            memcpy(*(void **)(v311 + 16), *(const void **)(v277 + 24), 4 * v282);
            v283 = v330;
            v309 = v281;
            v310 = v312;
            if (v312)
            {
              v284 = (unint64_t *)&v312->__shared_owners_;
              do
                v285 = __ldxr(v284);
              while (__stxr(v285 + 1, v284));
            }
            (*(void (**)(void *, uint64_t *))(*(_QWORD *)v283 + 392))(v283, &v309);
            v286 = v310;
            if (v310)
            {
              v287 = (unint64_t *)&v310->__shared_owners_;
              do
                v288 = __ldaxr(v287);
              while (__stlxr(v288 - 1, v287));
              if (!v288)
              {
                ((void (*)(std::__shared_weak_count *))v286->__on_zero_shared)(v286);
                std::__shared_weak_count::__release_weak(v286);
              }
            }
            v289 = v312;
            if (v312)
            {
              v290 = (unint64_t *)&v312->__shared_owners_;
              do
                v291 = __ldaxr(v290);
              while (__stlxr(v291 - 1, v290));
              if (!v291)
              {
                ((void (*)(std::__shared_weak_count *))v289->__on_zero_shared)(v289);
                std::__shared_weak_count::__release_weak(v289);
              }
            }
            v292 = v322;
            if (v322)
            {
              v293 = (unint64_t *)&v322->__shared_owners_;
              do
                v294 = __ldaxr(v293);
              while (__stlxr(v294 - 1, v293));
              if (!v294)
              {
                ((void (*)(std::__shared_weak_count *))v292->__on_zero_shared)(v292);
                std::__shared_weak_count::__release_weak(v292);
              }
            }
          }
          v295 = v328;
          if (v328)
          {
            v296 = (unint64_t *)&v328->__shared_owners_;
            do
              v297 = __ldaxr(v296);
            while (__stlxr(v297 - 1, v296));
            if (!v297)
            {
              ((void (*)(std::__shared_weak_count *))v295->__on_zero_shared)(v295);
              std::__shared_weak_count::__release_weak(v295);
            }
          }
          if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v329.__r_.__value_.__l.__data_);
          v53 = 0;
          goto LABEL_438;
        }
        if (cntrl)
        {
          v257 = (void *)MEMORY[0x1E0CB35C8];
          v336 = v308;
          v337 = CFSTR("number of batchnorm inputs != 2");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v337, &v336, 1);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v258);
          *(_QWORD *)cntrl = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_382;
        }
      }
      v53 = 1;
      goto LABEL_438;
    }
    *(_OWORD *)&v340.__r_.__value_.__l.__data_ = 0uLL;
    {
      v170 = *(std::__shared_weak_count **)(v49 + 72);
      if (!v170)
        goto LABEL_379;
      v171 = (unint64_t *)&v170->__shared_owners_;
      v14 = v25;
      do
        v172 = __ldxr(v171);
      while (__stxr(v172 + 1, v171));
      do
        v173 = __ldaxr(v171);
      while (__stlxr(v173 - 1, v171));
    }
    else
    {
      v170 = *(std::__shared_weak_count **)(v49 + 72);
      if (!v170)
      {
LABEL_379:
        v53 = 4;
        goto LABEL_73;
      }
      v255 = (unint64_t *)&v170->__shared_owners_;
      v14 = v25;
      do
        v256 = __ldxr(v255);
      while (__stxr(v256 + 1, v255));
      do
        v173 = __ldaxr(v255);
      while (__stlxr(v173 - 1, v255));
    }
    if (!v173)
    {
      ((void (*)(std::__shared_weak_count *))v170->__on_zero_shared)(v170);
      std::__shared_weak_count::__release_weak(v170);
    }
    v53 = 4;
    v67 = (std::__shared_weak_count *)v340.__r_.__value_.__l.__size_;
    if (!v340.__r_.__value_.__l.__size_)
      goto LABEL_78;
LABEL_74:
    v68 = (unint64_t *)(v340.__r_.__value_.__l.__size_ + 8);
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
      if (!v53)
        goto LABEL_349;
    }
    else
    {
LABEL_78:
      if (!v53)
        goto LABEL_349;
    }
LABEL_350:
    v242 = (std::__shared_weak_count *)*((_QWORD *)&v341 + 1);
    if (*((_QWORD *)&v341 + 1))
    {
      v243 = (unint64_t *)(*((_QWORD *)&v341 + 1) + 8);
      do
        v244 = __ldaxr(v243);
      while (__stlxr(v244 - 1, v243));
      if (!v244)
      {
        ((void (*)(std::__shared_weak_count *))v242->__on_zero_shared)(v242);
        std::__shared_weak_count::__release_weak(v242);
      }
    }
LABEL_355:
    v245 = (std::__shared_weak_count *)*((_QWORD *)&v333 + 1);
    if (*((_QWORD *)&v333 + 1))
    {
      v246 = (unint64_t *)(*((_QWORD *)&v333 + 1) + 8);
      do
        v247 = __ldaxr(v246);
      while (__stlxr(v247 - 1, v246));
      if (!v247)
      {
        ((void (*)(std::__shared_weak_count *))v245->__on_zero_shared)(v245);
        std::__shared_weak_count::__release_weak(v245);
      }
    }
    if ((v53 | 4) != 4)
      return 0;
    ++v13;
    v12 = *(_QWORD *)(*(_QWORD *)ptr + 32);
    if (v13 >= (*(_QWORD *)(*(_QWORD *)ptr + 40) - v12) >> 4)
      return 1;
  }
}

- (BOOL)setWeightsOfInferenceNetworkLoadedFrom:(id)a3 AndSaveTo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  __int128 v12;
  unint64_t *v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  id v20;
  int v21;
  __int128 v22;
  int64_t size;
  std::string *p_str;
  char *v25;
  _BOOL4 v26;
  int64_t v27;
  std::string *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  BOOL v32;
  std::string *v33;
  BOOL v35;
  int v36;
  int v37;
  std::string *v38;
  std::string::size_type v39;
  int v40;
  std::string::size_type v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  id v57;
  void *v58[2];
  char v59;
  void *v60[2];
  char v61;
  std::string v62;
  __int128 v63;
  std::string v64;
  std::string v65;
  __int128 v66;
  std::string v67;
  std::string __p;
  std::string v69;
  __int128 v70;
  std::string __str;
  __int128 v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  _BYTE v75[17];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  LODWORD(__str.__r_.__value_.__l.__data_) = 80000;
  Espresso::create_context((int *)&__str, &v73);
  self->precision = 0;
  v72 = 0uLL;
  v10 = objc_retainAutorelease(v8);
  v11 = std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v10, "UTF8String"));
  Espresso::load_network((uint64_t)v11, &v73, self->precision, 0, (uint64_t *)&v69);
  v12 = *(_OWORD *)&v69.__r_.__value_.__l.__data_;
  *(_OWORD *)&v69.__r_.__value_.__l.__data_ = 0uLL;
  v72 = v12;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v70 = v12;
  if (*((_QWORD *)&v12 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = -[ETTaskDefinition setInferenceNetworkWeights:error:](self, "setInferenceNetworkWeights:error:", &v70, a5);
  v16 = v15;
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
  if (!*((_QWORD *)&v70 + 1))
    goto LABEL_10;
  v18 = (unint64_t *)(*((_QWORD *)&v70 + 1) + 8);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (v19)
  {
LABEL_10:
    if (v15)
      goto LABEL_11;
LABEL_29:
    v32 = 0;
    goto LABEL_103;
  }
  ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
  std::__shared_weak_count::__release_weak(v17);
  if (!v16)
    goto LABEL_29;
LABEL_11:
  v20 = objc_retainAutorelease(v9);
  v57 = v10;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v20, "UTF8String"));
  v21 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
  v22 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  else
    size = __str.__r_.__value_.__l.__size_;
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_str = &__str;
  else
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  v25 = (char *)p_str + size;
  if (size < 4)
  {
    v26 = size == 3;
LABEL_27:
    v31 = (char *)p_str + size;
    goto LABEL_38;
  }
  v27 = size;
  v28 = p_str;
  do
  {
    v29 = (char *)memchr(v28, 46, v27 - 3);
    if (!v29)
      break;
    if (*(_DWORD *)v29 == 1852400174)
      goto LABEL_24;
    v28 = (std::string *)(v29 + 1);
    v27 = v25 - (char *)v28;
  }
  while (v25 - (char *)v28 > 3);
  v29 = (char *)p_str + size;
LABEL_24:
  v30 = v29 - (char *)p_str;
  if (v29 == v25)
    v30 = -1;
  v26 = v30 == size - 4;
  if (size < 5)
    goto LABEL_27;
  v33 = p_str;
  do
  {
    v31 = (char *)memchr(v33, 46, size - 4);
    if (!v31)
      break;
    if (*(_DWORD *)v31 == 1852400174 && v31[4] == 58)
      goto LABEL_38;
    v33 = (std::string *)(v31 + 1);
    size = v25 - (char *)v33;
  }
  while (v25 - (char *)v33 > 4);
  v31 = v25;
LABEL_38:
  v35 = v31 == v25 || v31 - (char *)p_str == -1;
  v36 = !v35;
  v37 = !v35 || v26;
  if (v21 < 0)
    std::string::__init_copy_ctor_external(&v69, (const std::string::value_type *)v22, *((std::string::size_type *)&v22 + 1));
  else
    v69 = __str;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (v36)
  {
    v38 = &__str;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v38 = (std::string *)__str.__r_.__value_.__r.__words[0];
    v39 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v39 = __str.__r_.__value_.__l.__size_;
    while (v39)
    {
      v40 = v38->__r_.__value_.__s.__data_[--v39];
      if (v40 == 58)
      {
        v41 = v39;
        goto LABEL_59;
      }
    }
    v41 = -1;
LABEL_59:
    std::string::basic_string(&v67, &__str, 0, v41, (std::allocator<char> *)v75);
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v69.__r_.__value_.__l.__data_);
    v69 = v67;
    std::string::basic_string(&v67, &__str, v41 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v75);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v67;
  }
  if (v37)
  {
    v42 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
    v66 = v72;
    if (*((_QWORD *)&v72 + 1))
    {
      v43 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
    }
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v65, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
    else
      v65 = v69;
    v10 = v57;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v64, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v64 = __p;
    Espresso::dump_network_binserializer((uint64_t *)&v66, (const char *)&v65, (const void **)&v64.__r_.__value_.__l.__data_);
    if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v64.__r_.__value_.__l.__data_);
    if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v65.__r_.__value_.__l.__data_);
    if (!v42)
      goto LABEL_96;
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v48 = __ldaxr(p_shared_owners);
    while (__stlxr(v48 - 1, p_shared_owners));
  }
  else
  {
    v42 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
    v63 = v72;
    if (*((_QWORD *)&v72 + 1))
    {
      v45 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    v10 = v57;
    std::string::basic_string[abi:ne180100]<0>(&v62, (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v60, "");
    std::string::basic_string[abi:ne180100]<0>(v58, "");
    Espresso::dump_network((uint64_t *)&v63, &v62, (uint64_t)v60, (uint64_t)v58);
    if (v59 < 0)
      operator delete(v58[0]);
    if (v61 < 0)
      operator delete(v60[0]);
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    if (!v42)
      goto LABEL_96;
    v47 = (unint64_t *)&v42->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
  }
  if (!v48)
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
LABEL_96:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v69.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v32 = 1;
LABEL_103:
  v50 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
  if (*((_QWORD *)&v72 + 1))
  {
    v51 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  v53 = v74;
  if (v74)
  {
    v54 = (unint64_t *)&v74->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }

  return v32;
}

- (ETTaskState)taskState
{
  ETTaskState *v3;
  ETTaskState *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = [ETTaskState alloc];
  -[ETTaskDefinition trainingGraphNetPtr](self, "trainingGraphNetPtr");
  v4 = -[ETTaskState initWithNetwork:](v3, "initWithNetwork:", &v9);
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (unint64_t)dataTypeForParameterOfType:(unint64_t)a3 fromLayerNamed:(id)a4
{
  return 2;
}

- (id)getParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  _QWORD *v15;
  size_t v16;
  _BOOL4 v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  const std::string *v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::string *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::string __p;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  std::string v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[ETTaskDefinition taskState](self, "taskState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v46 = 0;
  v47 = 0;
  if (!v7)
    goto LABEL_9;
LABEL_2:
  objc_msgSend(v7, "networkPointer");
  v9 = (uint64_t)(*(_QWORD *)(v45.__r_.__value_.__r.__words[0] + 40) - *(_QWORD *)(v45.__r_.__value_.__r.__words[0] + 32)) >> 4;
  if (v45.__r_.__value_.__l.__size_)
  {
    v10 = (unint64_t *)(v45.__r_.__value_.__l.__size_ + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v45.__r_.__value_.__l.__size_ + 16))(v45.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v45.__r_.__value_.__l.__size_);
    }
  }
  if (v8 >= v9)
  {
    if (v46)
    {
      memset(&v45, 0, sizeof(v45));
      objc_msgSend(v7, "networkPointer");
      if (a3 == 1)
        v23 = 1;
      else
        v23 = 2;
      v24 = v43;
      v25 = v46;
      goto LABEL_42;
    }
    goto LABEL_54;
  }
  do
  {
    -[ETTaskDefinition taskState](self, "taskState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "networkPointer");
    v13 = *(_QWORD *)(*(_QWORD *)(v45.__r_.__value_.__r.__words[0] + 32) + 16 * v8);
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v15 = (_QWORD *)(v13 + 16);
    v16 = strlen(v14);
    if (*(char *)(v13 + 39) < 0)
    {
      if (v16 != *(_QWORD *)(v13 + 24))
      {
LABEL_17:
        v17 = 0;
        goto LABEL_18;
      }
      if (v16 == -1)
        std::string::__throw_out_of_range[abi:ne180100]();
      v15 = (_QWORD *)*v15;
    }
    else if (v16 != *(unsigned __int8 *)(v13 + 39))
    {
      goto LABEL_17;
    }
    v17 = memcmp(v15, v14, v16) == 0;
LABEL_18:
    if (v45.__r_.__value_.__l.__size_)
    {
      v18 = (unint64_t *)(v45.__r_.__value_.__l.__size_ + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v45.__r_.__value_.__l.__size_ + 16))(v45.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v45.__r_.__value_.__l.__size_);
      }
    }

    if (v17)
    {
      -[ETTaskDefinition taskState](self, "taskState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "networkPointer");
      std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v46, *(_QWORD *)(*(_QWORD *)(v45.__r_.__value_.__r.__words[0] + 32) + 16 * v8), *(_QWORD *)(*(_QWORD *)(v45.__r_.__value_.__r.__words[0] + 32) + 16 * v8 + 8));
      if (v45.__r_.__value_.__l.__size_)
      {
        v21 = (unint64_t *)(v45.__r_.__value_.__l.__size_ + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          (*(void (**)(std::string::size_type))(*(_QWORD *)v45.__r_.__value_.__l.__size_ + 16))(v45.__r_.__value_.__l.__size_);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v45.__r_.__value_.__l.__size_);
        }
      }

    }
    ++v8;
    if (v7)
      goto LABEL_2;
LABEL_9:
    ;
  }
  while (v8 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  v25 = v46;
  if (!v46)
  {
LABEL_54:
    if (a5)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find layer named: %@"), v6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v35);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = 0;
    goto LABEL_57;
  }
  v24 = 0;
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = 0uLL;
  if (a3 == 1)
    v23 = 1;
  else
    v23 = 2;
  v45.__r_.__value_.__r.__words[2] = 0;
  v43 = 0;
  v44 = 0;
LABEL_42:
  Espresso::get_layer_parameter_name((const void **)(v25 + 16), v23, &__p);
  v26 = (const std::string *)Espresso::net::loaded_global_name(v24, (uint64_t)&__p);
  std::string::operator=(&v45, v26);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v27 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v29 = __ldaxr(p_shared_owners);
    while (__stlxr(v29 - 1, p_shared_owners));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v30 = &v45;
  else
    v30 = (std::string *)v45.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTaskDefinition getTensorNamed:](self, "getTensorNamed:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
LABEL_57:
  v36 = v47;
  if (v47)
  {
    v37 = (unint64_t *)&v47->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  return v32;
}

- (BOOL)setParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 withValue:(id)a5 error:(id *)a6
{
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  _QWORD *v17;
  size_t v18;
  _BOOL4 v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  const void *v26;
  void *v27;
  void *v28;
  std::__shared_weak_count *size;
  unint64_t *p_shared_owners;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  uint64_t v40;
  char *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  _QWORD *v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::string *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  id v75;
  id v76;
  std::string __p;
  _QWORD *v78;
  std::__shared_weak_count *v79;
  std::string v80;
  char *v81;
  std::__shared_weak_count *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v76 = a4;
  v75 = a5;
  -[ETTaskDefinition taskState](self, "taskState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v83 = 0;
  v84 = 0;
  if (!v9)
    goto LABEL_9;
LABEL_2:
  objc_msgSend(v9, "networkPointer");
  v11 = (uint64_t)(*(_QWORD *)(v80.__r_.__value_.__r.__words[0] + 40) - *(_QWORD *)(v80.__r_.__value_.__r.__words[0] + 32)) >> 4;
  if (v80.__r_.__value_.__l.__size_)
  {
    v12 = (unint64_t *)(v80.__r_.__value_.__l.__size_ + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v80.__r_.__value_.__l.__size_ + 16))(v80.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v80.__r_.__value_.__l.__size_);
    }
  }
  if (v10 < v11)
  {
    do
    {
      -[ETTaskDefinition taskState](self, "taskState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkPointer");
      v15 = *(_QWORD *)(*(_QWORD *)(v80.__r_.__value_.__r.__words[0] + 32) + 16 * v10);
      v16 = (const char *)objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
      v17 = (_QWORD *)(v15 + 16);
      v18 = strlen(v16);
      if (*(char *)(v15 + 39) < 0)
      {
        if (v18 != *(_QWORD *)(v15 + 24))
        {
LABEL_17:
          v19 = 0;
          goto LABEL_18;
        }
        if (v18 == -1)
          std::string::__throw_out_of_range[abi:ne180100]();
        v17 = (_QWORD *)*v17;
      }
      else if (v18 != *(unsigned __int8 *)(v15 + 39))
      {
        goto LABEL_17;
      }
      v19 = memcmp(v17, v16, v18) == 0;
LABEL_18:
      if (v80.__r_.__value_.__l.__size_)
      {
        v20 = (unint64_t *)(v80.__r_.__value_.__l.__size_ + 8);
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          (*(void (**)(std::string::size_type))(*(_QWORD *)v80.__r_.__value_.__l.__size_ + 16))(v80.__r_.__value_.__l.__size_);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v80.__r_.__value_.__l.__size_);
        }
      }

      if (v19)
      {
        -[ETTaskDefinition taskState](self, "taskState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "networkPointer");
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v83, *(_QWORD *)(*(_QWORD *)(v80.__r_.__value_.__r.__words[0] + 32) + 16 * v10), *(_QWORD *)(*(_QWORD *)(v80.__r_.__value_.__r.__words[0] + 32) + 16 * v10 + 8));
        if (v80.__r_.__value_.__l.__size_)
        {
          v23 = (unint64_t *)(v80.__r_.__value_.__l.__size_ + 8);
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 - 1, v23));
          if (!v24)
          {
            (*(void (**)(std::string::size_type))(*(_QWORD *)v80.__r_.__value_.__l.__size_ + 16))(v80.__r_.__value_.__l.__size_);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v80.__r_.__value_.__l.__size_);
          }
        }

      }
      ++v10;
      if (v9)
        goto LABEL_2;
LABEL_9:
      ;
    }
    while (v10 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  }
  v25 = v83;
  if (!v83)
  {
    if (a6)
    {
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v89 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find layer named: %@"), v76);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v52);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_65;
  }
  if (a3 == 3)
  {
    v26 = *(const void **)(v83 + 64);
    if (v26)
    {
      if (v27)
      {
        v28 = v27;
        size = *(std::__shared_weak_count **)(v25 + 72);
        v80.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
        v80.__r_.__value_.__l.__size_ = (std::string::size_type)size;
        if (size)
        {
          p_shared_owners = (unint64_t *)&size->__shared_owners_;
          do
            v31 = __ldxr(p_shared_owners);
          while (__stxr(v31 + 1, p_shared_owners));
        }
        objc_msgSend(v75, "shape");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count") == 1)
        {
          objc_msgSend(v75, "shape");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0xAAAAAAAAAAAAAAABLL * objc_msgSend(v34, "integerValue") + 0x2AAAAAAAAAAAAAAALL < 0x5555555555555555;

          if (v35)
          {
            objc_msgSend(v75, "shape");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "integerValue");

            v39 = v38 % 3;
            *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v28 + 384))(v28) + 8) = v38 % 3;
            v40 = objc_msgSend(v75, "dataPointer");
            v41 = (char *)operator new(0x58uLL);
            *((_QWORD *)v41 + 1) = 0;
            v42 = (unint64_t *)(v41 + 8);
            *((_QWORD *)v41 + 2) = 0;
            *((_QWORD *)v41 + 3) = &off_1E2DA1190;
            *(_QWORD *)v41 = &off_1E2DBEC00;
            *(_OWORD *)(v41 + 56) = 0u;
            *(_OWORD *)(v41 + 72) = 0u;
            *((_DWORD *)v41 + 8) = 3 * v39;
            *((_QWORD *)v41 + 5) = v40;
            v41[48] = 0;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)(v41 + 24);
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)v41;
            v81 = v41 + 24;
            v82 = (std::__shared_weak_count *)v41;
            do
              v43 = __ldxr(v42);
            while (__stxr(v43 + 1, v42));
            (*(void (**)(void *, char **))(*(_QWORD *)v28 + 392))(v28, &v81);
            v44 = v82;
            if (v82)
            {
              v45 = (unint64_t *)&v82->__shared_owners_;
              do
                v46 = __ldaxr(v45);
              while (__stlxr(v46 - 1, v45));
              if (!v46)
              {
                ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
                std::__shared_weak_count::__release_weak(v44);
              }
            }
            if (__p.__r_.__value_.__l.__size_)
            {
              v47 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
              do
                v48 = __ldaxr(v47);
              while (__stlxr(v48 - 1, v47));
              if (!v48)
              {
                (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
                std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
              }
            }
            v49 = 1;
            size = (std::__shared_weak_count *)v80.__r_.__value_.__l.__size_;
LABEL_86:
            if (size)
            {
              v68 = (unint64_t *)&size->__shared_owners_;
              do
                v69 = __ldaxr(v68);
              while (__stlxr(v69 - 1, v68));
              if (!v69)
              {
                ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
                std::__shared_weak_count::__release_weak(size);
              }
            }
            goto LABEL_91;
          }
        }
        else
        {

        }
        if (a6)
        {
          v66 = (void *)MEMORY[0x1E0CB35C8];
          v87 = *MEMORY[0x1E0CB2D50];
          v88 = CFSTR("kETLayerParameterTypeSparseWeightsCOO has to have rank 1 and its length must be a multiple of 3");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v67);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v49 = 0;
        goto LABEL_86;
      }
    }
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = 0uLL;
    if (a6)
    {
      v55 = (_QWORD *)(v25 + 40);
      if (*(char *)(v25 + 63) < 0)
        v55 = (_QWORD *)*v55;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to set sparse weights for non-sparse layer %@ with type %s"), v76, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v85 = *MEMORY[0x1E0CB2D50];
      v86 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v58);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_65:
    v49 = 0;
    goto LABEL_91;
  }
  if (a3 == 1)
    v53 = 1;
  else
    v53 = 2;
  if (v9)
  {
    objc_msgSend(v9, "networkPointer");
    v54 = v78;
    v25 = v83;
  }
  else
  {
    v54 = 0;
    v78 = 0;
    v79 = 0;
  }
  Espresso::get_layer_parameter_name((const void **)(v25 + 16), v53, &__p);
  v59 = Espresso::net::loaded_global_name(v54, (uint64_t)&__p);
  if (*(char *)(v59 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v80, *(const std::string::value_type **)v59, *(_QWORD *)(v59 + 8));
  }
  else
  {
    v60 = *(_OWORD *)v59;
    v80.__r_.__value_.__r.__words[2] = *(_QWORD *)(v59 + 16);
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v60;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v61 = v79;
  if (v79)
  {
    v62 = (unint64_t *)&v79->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v64 = &v80;
  else
    v64 = (std::string *)v80.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[ETTaskDefinition setTensorNamed:withValue:error:](self, "setTensorNamed:withValue:error:", v65, v75, a6);

  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v80.__r_.__value_.__l.__data_);
LABEL_91:
  v70 = v84;
  if (v84)
  {
    v71 = (unint64_t *)&v84->__shared_owners_;
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }

  return v49;
}

- (BOOL)setTensorNamed:(id)a3 withValue:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  ETDataTensor *v18;
  unint64_t *v19;
  unint64_t v20;
  ETDataTensor *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  void *v65;
  void *v66;
  uint64_t v67[3];
  std::__shared_weak_count *v68;
  void *__p;
  _BYTE v70[25];
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  std::__shared_weak_count *v75;
  std::__shared_weak_count *v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  ETDataTensor *v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ETTaskDefinition taskState](self, "taskState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "networkPointer");
    v12 = (uint64_t)v75;
  }
  else
  {
    v12 = 0;
    v75 = 0;
    v76 = 0;
  }
  v13 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v13, "UTF8String"));
  Espresso::net::get_global(&v77, v12, (unsigned __int8 *)&__p);
  if ((v70[15] & 0x80000000) != 0)
    operator delete(__p);
  v14 = v76;
  if (v76)
  {
    p_shared_owners = (unint64_t *)&v76->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v77;
  if (v77)
  {
    if (objc_msgSend(v9, "type") == 2)
    {
      v18 = [ETDataTensor alloc];
      v73 = v17;
      v74 = v78;
      if (v78)
      {
        v19 = (unint64_t *)&v78->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      v21 = -[ETDataTensor initWithBlobContainer:](v18, "initWithBlobContainer:", &v73);
      v22 = v74;
      if (v74)
      {
        v23 = (unint64_t *)&v74->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      -[ETDataTensor shape](v21, "shape");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shape");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if ((v27 & 1) != 0)
      {
        -[ETDataTensor strides](v21, "strides");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "strides");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

        if ((v30 & 1) != 0)
        {
          v31 = objc_msgSend(v9, "dataPointer");
          __p = &off_1E2DA11F0;
          v71 = 0u;
          v72 = 0u;
          *(_OWORD *)v70 = xmmword_191A8AA80;
          *(_QWORD *)&v70[16] = v31;
          v70[24] = 0;
          v32 = (std::__shared_weak_count *)operator new(0x60uLL);
          *(_OWORD *)&v32->__shared_owners_ = 0u;
          v33 = (unint64_t *)&v32->__shared_owners_;
          v32->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBECA8;
          v32[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DA11F0;
          *(_OWORD *)&v32[1].__shared_owners_ = *(_OWORD *)v70;
          *(_OWORD *)((char *)&v32[1].__shared_weak_owners_ + 1) = *(_OWORD *)&v70[9];
          *(_OWORD *)&v32[2].__shared_weak_owners_ = 0u;
          *(_OWORD *)&v32[3].__shared_owners_ = 0u;
          v75 = v32 + 1;
          v76 = v32;
          v34 = v77;
          v35 = v78;
          v67[2] = v77;
          v68 = v78;
          if (v78)
          {
            v36 = (unint64_t *)&v78->__shared_owners_;
            do
              v37 = __ldxr(v36);
            while (__stxr(v37 + 1, v36));
          }
          v67[0] = (uint64_t)&v32[1];
          v67[1] = (uint64_t)v32;
          do
            v38 = __ldxr(v33);
          while (__stxr(v38 + 1, v33));
          Espresso::sync_copy_from_host(v34, v35, v67);
          do
            v39 = __ldaxr(v33);
          while (__stlxr(v39 - 1, v33));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
          v40 = v68;
          if (v68)
          {
            v41 = (unint64_t *)&v68->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          v43 = v76;
          if (v76)
          {
            v44 = (unint64_t *)&v76->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
          v46 = 1;
          goto LABEL_53;
        }
        if (a5)
        {
          v56 = (void *)MEMORY[0x1E0CB35C8];
          v79 = *MEMORY[0x1E0CB2D50];
          v57 = (void *)MEMORY[0x1E0CB3940];
          -[ETDataTensor shape](v21, "shape");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shape");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("Trying to set tensor %@ failed, provided tensor must have strides: %@ (found: %@)."), v13, v66, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v59;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v60);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (a5)
      {
        v51 = (void *)MEMORY[0x1E0CB35C8];
        v81 = *MEMORY[0x1E0CB2D50];
        v52 = (void *)MEMORY[0x1E0CB3940];
        -[ETDataTensor shape](v21, "shape");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "shape");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", CFSTR("Trying to set tensor %@ failed, provided tensor must be of shape: %@, (found: %@)."), v13, v65, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v55);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_52:
      v46 = 0;
LABEL_53:

      goto LABEL_54;
    }
    if (a5)
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v83 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to set tensor %@ failed, tensor must be of type: kETDataTypeFloat32."), v13);
      v21 = (ETDataTensor *)objc_claimAutoreleasedReturnValue();
      v84 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v50);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_52;
    }
  }
  else if (a5)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v85 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to set tensor named %@, no variable tensor with that name found."), v13);
    v21 = (ETDataTensor *)objc_claimAutoreleasedReturnValue();
    v86[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_52;
  }
  v46 = 0;
LABEL_54:
  v61 = v78;
  if (v78)
  {
    v62 = (unint64_t *)&v78->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }

  return v46;
}

- (id)getTensorNamed:(id)a3 directBind:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  ETDataTensor *v19;
  unint64_t *v20;
  unint64_t v21;
  ETDataTensor *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void *__p[2];
  char v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  void **v38;

  v4 = a4;
  v6 = a3;
  -[ETTaskDefinition taskState](self, "taskState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "networkPointer");
    v9 = v34;
  }
  else
  {
    v9 = 0;
    v34 = 0;
    v35 = 0;
  }
  v10 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  Espresso::net::get_global(&v36, v9, (unsigned __int8 *)__p);
  if (v33 < 0)
    operator delete(__p[0]);
  v11 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v36)
    goto LABEL_23;
  if (v8)
  {
    objc_msgSend(v8, "networkPointer");
    v14 = v34;
  }
  else
  {
    v14 = 0;
    v34 = 0;
    v35 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  v38 = __p;
  v15 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14 + 136, (unsigned __int8 *)__p, (__int128 **)&v38);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v36, v15[5], v15[6]);
  if (v33 < 0)
    operator delete(__p[0]);
  v16 = v35;
  if (v35)
  {
    v17 = (unint64_t *)&v35->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (v36)
  {
LABEL_23:
    v19 = [ETDataTensor alloc];
    v30 = v36;
    v31 = v37;
    if (v37)
    {
      v20 = (unint64_t *)&v37->__shared_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v22 = -[ETDataTensor initWithBlobContainer:directBind:](v19, "initWithBlobContainer:directBind:", &v30, v4);
    v23 = v31;
    if (v31)
    {
      v24 = (unint64_t *)&v31->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }
  else
  {
    v22 = 0;
  }
  v26 = v37;
  if (v37)
  {
    v27 = (unint64_t *)&v37->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

  return v22;
}

- (id)getTensorNamed:(id)a3
{
  -[ETTaskDefinition getTensorNamed:directBind:](self, "getTensorNamed:directBind:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)platformForLayerNamed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD *v14;
  size_t v15;
  _BOOL4 v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  unsigned int (***v22)(_QWORD);
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ETTaskDefinition taskState](self, "taskState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v34 = 0;
  v35 = 0;
  if (!v6)
    goto LABEL_9;
LABEL_2:
  objc_msgSend(v6, "networkPointer");
  v8 = (uint64_t)(*(_QWORD *)(v32 + 40) - *(_QWORD *)(v32 + 32)) >> 4;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v33->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (v7 < v8)
  {
    do
    {
      -[ETTaskDefinition taskState](self, "taskState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "networkPointer");
      v12 = *(_QWORD *)(*(_QWORD *)(v32 + 32) + 16 * v7);
      v13 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v14 = (_QWORD *)(v12 + 16);
      v15 = strlen(v13);
      if (*(char *)(v12 + 39) < 0)
      {
        if (v15 != *(_QWORD *)(v12 + 24))
        {
LABEL_17:
          v16 = 0;
          goto LABEL_18;
        }
        if (v15 == -1)
          std::string::__throw_out_of_range[abi:ne180100]();
        v14 = (_QWORD *)*v14;
      }
      else if (v15 != *(unsigned __int8 *)(v12 + 39))
      {
        goto LABEL_17;
      }
      v16 = memcmp(v14, v13, v15) == 0;
LABEL_18:
      if (v33)
      {
        v17 = (unint64_t *)&v33->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)())v33->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v33);
        }
      }

      if (v16)
      {
        -[ETTaskDefinition taskState](self, "taskState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "networkPointer");
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v34, *(_QWORD *)(*(_QWORD *)(v32 + 32) + 16 * v7), *(_QWORD *)(*(_QWORD *)(v32 + 32) + 16 * v7 + 8));
        if (v33)
        {
          v20 = (unint64_t *)&v33->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)())v33->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v33);
          }
        }

      }
      ++v7;
      if (v6)
        goto LABEL_2;
LABEL_9:
      ;
    }
    while (v7 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  }
  if (v34)
  {
    v22 = *(unsigned int (****)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v34 + 64) + 8) + 8);
    v23 = (**v22)(v22) == 0;
  }
  else
  {
    if (a4)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find layer named: %@"), v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = 0;
  }
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

  return v23;
}

- (ETModelDefinition)inferenceModel
{
  return *(ETModelDefinition **)&self->infOutputBlobShapes.__table_.__p3_.__value_;
}

- (void)setInferenceModel:(id)a3
{
  objc_storeStrong((id *)&self->infOutputBlobShapes.__table_.__p3_, a3);
}

- (ETOptimizerDefinition)optimizer
{
  return (ETOptimizerDefinition *)self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value_;
}

- (void)setOptimizer:(id)a3
{
  objc_storeStrong((id *)&self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value_, a3);
}

- (unint64_t)platform
{
  return self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
}

- (void)setPlatform:(unint64_t)a3
{
  self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = a3;
}

- (void)setTaskState:(id)a3
{
  objc_storeStrong(&self->trainOutputBlobShapes.__table_.__p1_.__value_.__next_, a3);
}

- (shared_ptr<Espresso::net>)inferenceGraphNetPtr
{
  void *v2;
  net *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::net> result;

  objc_copyCppObjectAtomic(v2, &self->trainOutputBlobShapes.__table_.__p2_, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setInferenceGraphNetPtr:(shared_ptr<Espresso::net>)a3
{
  objc_copyCppObjectAtomic(&self->trainOutputBlobShapes.__table_.__p2_, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (shared_ptr<Espresso::net>)trainingGraphNetPtr
{
  void *v2;
  net *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::net> result;

  objc_copyCppObjectAtomic(v2, &self->_inferenceModel, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setTrainingGraphNetPtr:(shared_ptr<Espresso::net>)a3
{
  objc_copyCppObjectAtomic(&self->_inferenceModel, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_inferenceModel);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->trainOutputBlobShapes.__table_.__p2_);
  objc_storeStrong(&self->trainOutputBlobShapes.__table_.__p1_.__value_.__next_, 0);
  objc_storeStrong((id *)&self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->infOutputBlobShapes.__table_.__p3_, 0);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->trainInputBlobShapes.__table_.__p3_);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->infInputBlobShapes.__table_.__p3_);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->trainOutputNames);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->optimizer_control_name.__r_.var0);
  objc_storeStrong((id *)&self->optimizer_control_name.__r_.__value_.var0.__l + 2, 0);
  objc_storeStrong((id *)&self->optimizer_control_name.__r_.__value_.var0.__l.__size_, 0);
  objc_storeStrong((id *)&self->optimizer_control_name, 0);
  objc_storeStrong((id *)&self->gradient_control_name.var0, 0);
  if (*((char *)&self->gradient_control_name.__r_.var1 + 3) < 0)
    operator delete((void *)self->gradient_control_name.__r_.__value_.var0.__l.__size_);
  if (self->gradient_control_name.__r_.__value_.var0.__s.__data_[7] < 0)
    operator delete(*(void **)&self->training_control_name.__r_.var0);
  if (*((char *)&self->training_control_name.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->training_control_name.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->varsDef, 0);
  std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)&self->inference_layer_index);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_QWORD *)self + 18) = 0;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_DWORD *)self + 74) = 1065353216;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_DWORD *)self + 84) = 1065353216;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  return self;
}

- (void)saveTrainingNetwork:checkpoint:error:
{
}

- (_QWORD)saveTrainingNetwork:checkpoint:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2DAEB10;
  result[1] = v3;
  return result;
}

- (uint64_t)saveTrainingNetwork:checkpoint:error:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z57-[ETTaskDefinition saveTrainingNetwork:checkpoint:error:]E3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (std::string)saveTrainingNetwork:checkpoint:error:
{
  uint64_t v2;
  std::string *v3;
  std::string *result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(std::string **)(v2 + 8);
  if ((unint64_t)v3 >= *(_QWORD *)(v2 + 16))
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v2, (uint64_t)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(v2, a2);
    result = v3 + 1;
  }
  *(_QWORD *)(v2 + 8) = result;
  return result;
}

- (void)saveNetwork:inplace:error:
{
}

- (_QWORD)saveNetwork:inplace:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2DAEAB8;
  result[1] = v3;
  return result;
}

- (uint64_t)saveNetwork:inplace:error:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z46-[ETTaskDefinition saveNetwork:inplace:error:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (std::string)saveNetwork:inplace:error:
{
  uint64_t v2;
  std::string *v3;
  std::string *result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(std::string **)(v2 + 8);
  if ((unint64_t)v3 >= *(_QWORD *)(v2 + 16))
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v2, (uint64_t)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(v2, a2);
    result = v3 + 1;
  }
  *(_QWORD *)(v2 + 8) = result;
  return result;
}

void __81__ETTaskDefinition_privateDoTrainingOnData_forNumberOfEpochs_withCallback_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  _QWORD *i;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  void **v17;
  char *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void **v34;
  char *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void *__p;
  std::__shared_weak_count *v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void **v49;
  std::__shared_weak_count *v50;
  void **p_p;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  for (i = (_QWORD *)a1[8]; i; i = (_QWORD *)*i)
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      objc_msgSend(v5, "trainingGraphNetPtr");
      v6 = __p;
    }
    else
    {
      v6 = 0;
      __p = 0;
      v43 = 0;
    }
    v7 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v6 + 232, i + 2);
    v8 = (void *)a1[4];
    if (v8)
    {
      objc_msgSend(v8, "trainingGraphNetPtr");
      v9 = v50;
      v10 = (uint64_t)(v49 + 30);
      if (v50)
      {
        p_shared_owners = (unint64_t *)&v50->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    else
    {
      v10 = 240;
    }
    v13 = v43;
    if (v43)
    {
      v14 = (unint64_t *)&v43->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if ((_QWORD *)v10 != v7)
    {
      Espresso::blob<float,4>::copy(&__p, i[5]);
      v16 = (void *)a1[4];
      if (v16)
      {
        objc_msgSend(v16, "trainingGraphNetPtr");
        v17 = v49;
      }
      else
      {
        v17 = 0;
        v49 = 0;
        v50 = 0;
      }
      p_p = (void **)(i + 2);
      v18 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v17 + 17), (unsigned __int8 *)i + 16, (__int128 **)&p_p);
      (*(void (**)(_QWORD, _QWORD *, void **))(**((_QWORD **)v18 + 5) + 48))(*((_QWORD *)v18 + 5), a2, &__p);
      v19 = v50;
      if (v50)
      {
        v20 = (unint64_t *)&v50->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
      v22 = v43;
      if (v43)
      {
        v23 = (unint64_t *)&v43->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
  }
  v25 = (void *)a1[4];
  if (v25)
  {
    objc_msgSend(v25, "trainingGraphNetPtr");
    v25 = __p;
  }
  else
  {
    __p = 0;
    v43 = 0;
  }
  Espresso::net::__forward((uint64_t)v25, a2, 0, 0xFFFFFFFFLL);
  v26 = v43;
  if (v43)
  {
    v27 = (unint64_t *)&v43->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v29 = *(id *)(a1[4] + 176);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v46;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v29);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v32)), "UTF8String"));
        v33 = (void *)a1[4];
        if (v33)
        {
          objc_msgSend(v33, "trainingGraphNetPtr");
          v34 = v49;
        }
        else
        {
          v34 = 0;
          v49 = 0;
          v50 = 0;
        }
        p_p = &__p;
        v35 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v34 + 17), (unsigned __int8 *)&__p, (__int128 **)&p_p);
        v36 = v50;
        if (v50)
        {
          v37 = (unint64_t *)&v50->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        v39 = *((_QWORD *)v35 + 5);
        v40 = *(_QWORD *)(a1[5] + 8) + 48;
        v49 = &__p;
        v41 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v40, (unsigned __int8 *)&__p, (__int128 **)&v49);
        (*(void (**)(uint64_t, _QWORD *, char *))(*(_QWORD *)v39 + 40))(v39, a2, v41 + 40);
        if (v44 < 0)
          operator delete(__p);
        ++v32;
      }
      while (v32 != v30);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v30);
  }

}

void __44__ETTaskDefinition_doInferenceOnData_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  _QWORD *i;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  void **v17;
  char *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void **v34;
  char *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void *__p;
  std::__shared_weak_count *v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void **v49;
  std::__shared_weak_count *v50;
  void **p_p;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  for (i = (_QWORD *)a1[8]; i; i = (_QWORD *)*i)
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      objc_msgSend(v5, "trainingGraphNetPtr");
      v6 = __p;
    }
    else
    {
      v6 = 0;
      __p = 0;
      v43 = 0;
    }
    v7 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v6 + 232, i + 2);
    v8 = (void *)a1[4];
    if (v8)
    {
      objc_msgSend(v8, "trainingGraphNetPtr");
      v9 = v50;
      v10 = (uint64_t)(v49 + 30);
      if (v50)
      {
        p_shared_owners = (unint64_t *)&v50->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    else
    {
      v10 = 240;
    }
    v13 = v43;
    if (v43)
    {
      v14 = (unint64_t *)&v43->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if ((_QWORD *)v10 != v7)
    {
      Espresso::blob<float,4>::copy(&__p, i[5]);
      v16 = (void *)a1[4];
      if (v16)
      {
        objc_msgSend(v16, "trainingGraphNetPtr");
        v17 = v49;
      }
      else
      {
        v17 = 0;
        v49 = 0;
        v50 = 0;
      }
      p_p = (void **)(i + 2);
      v18 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v17 + 17), (unsigned __int8 *)i + 16, (__int128 **)&p_p);
      (*(void (**)(_QWORD, _QWORD *, void **))(**((_QWORD **)v18 + 5) + 48))(*((_QWORD *)v18 + 5), a2, &__p);
      v19 = v50;
      if (v50)
      {
        v20 = (unint64_t *)&v50->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
      v22 = v43;
      if (v43)
      {
        v23 = (unint64_t *)&v43->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
  }
  v25 = (void *)a1[4];
  if (v25)
  {
    objc_msgSend(v25, "trainingGraphNetPtr");
    v25 = __p;
  }
  else
  {
    __p = 0;
    v43 = 0;
  }
  Espresso::net::__forward((uint64_t)v25, a2, 0, 0xFFFFFFFFLL);
  v26 = v43;
  if (v43)
  {
    v27 = (unint64_t *)&v43->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v29 = *(id *)(a1[4] + 160);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v46;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v29);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v32)), "UTF8String"));
        v33 = (void *)a1[4];
        if (v33)
        {
          objc_msgSend(v33, "trainingGraphNetPtr");
          v34 = v49;
        }
        else
        {
          v34 = 0;
          v49 = 0;
          v50 = 0;
        }
        p_p = &__p;
        v35 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v34 + 17), (unsigned __int8 *)&__p, (__int128 **)&p_p);
        v36 = v50;
        if (v50)
        {
          v37 = (unint64_t *)&v50->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        v39 = *((_QWORD *)v35 + 5);
        v40 = *(_QWORD *)(a1[5] + 8) + 48;
        v49 = &__p;
        v41 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v40, (unsigned __int8 *)&__p, (__int128 **)&v49);
        (*(void (**)(uint64_t, _QWORD *, char *))(*(_QWORD *)v39 + 40))(v39, a2, v41 + 40);
        if (v44 < 0)
          operator delete(__p);
        ++v32;
      }
      while (v32 != v30);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v30);
  }

}

void __70__ETTaskDefinition_initWithTrainingModelDefinition_forPlatform_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(a1 + 32), a2, 0, 0xFFFFFFFFLL);
}

void __117__ETTaskDefinition_initWithModelDefinition_lossDefinition_variablesDefinition_optimizerDefinition_forPlatform_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  Espresso::net::__forward(*(_QWORD *)(a1 + 32), a2, 0, 0xFFFFFFFFLL);
}

@end
