@implementation _OnDiskArchiveReader

- (void)copyLayerShapesToContainer:(id)a3
{
  uint64_t **v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t **v27;
  void *v28;
  void *__p[2];
  char v30;
  void **v31;

  v4 = (uint64_t **)a3;
  -[_OnDiskArchiveReader shapeJson](self, "shapeJson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("layer_shapes"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v27 = v4 + 7;
  while (1)
  {
    objc_msgSend(v4, "inputLayerNames", v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 >= v8)
      break;
    objc_msgSend(v4, "inputLayerNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
    objc_msgSend(v28, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("w"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 1, __p, (__int128 **)&v31)+ 14) = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("h"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");
    v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 4, __p, (__int128 **)&v31)+ 14) = v16;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("k"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v27, __p, (__int128 **)&v31)+ 14) = v18;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("n"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");
    v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 10, __p, (__int128 **)&v31)+ 14) = v20;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("seq"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("seq"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "intValue");
      v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 13, __p, (__int128 **)&v31)+ 14) = v23;

    }
    else
    {
      v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 13, __p, (__int128 **)&v31)+ 14) = 1;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_rank"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_rank"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intValue");
      v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 16, __p, (__int128 **)&v31)+ 14) = v26;

    }
    else
    {
      v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 16, __p, (__int128 **)&v31)+ 14) = -1;
    }

    if (v30 < 0)
      operator delete(__p[0]);

    ++v6;
  }

}

- (NSDictionary)shapeJson
{
  return self->_shapeJson;
}

- (_OnDiskArchiveReader)initWithNetJson:(id)a3 shapeJson:(id)a4 modelPath:(id)a5
{
  _OnDiskArchiveReader *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  _NNLayerInfo *v18;
  void *v19;
  _NNLayerInfo *v20;
  NSArray *layerInfos;
  id v23;
  id v24;
  id v25;
  _OnDiskArchiveReader *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v23 = a4;
  v24 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_OnDiskArchiveReader;
  v9 = -[_OnDiskArchiveReader init](&v32, sel_init);
  v26 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_netJson, a3);
    objc_storeStrong((id *)&v26->_shapeJson, a4);
    objc_storeStrong((id *)&v26->_modelPath, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("layers"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("rnn_arch")))
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("encoder_bidirectional_mode"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "integerValue") != 0;

          }
          else
          {
            v17 = 0;
          }
          v18 = [_NNLayerInfo alloc];
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bottom"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_NNLayerInfo initWithType:concatenatedInputNames:bidirectional:](v18, "initWithType:concatenatedInputNames:bidirectional:", v15, v19, v17);
          -[NSArray addObject:](v10, "addObject:", v20);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }

    layerInfos = v26->_layerInfos;
    v26->_layerInfos = v10;

  }
  return v26;
}

- (NSString)modelPath
{
  return self->_modelPath;
}

- (id)transformParams
{
  void *v2;
  void *v3;

  -[_OnDiskArchiveReader netJson](self, "netJson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("transform_params"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)netJson
{
  return self->_netJson;
}

+ (id)modelShapeFileName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "modelName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".espresso.shape"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)readerFromArchiver:(void *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  void *v18;
  void *__p[2];
  char v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  objc_msgSend(a1, "modelNetFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseCompiledNetworkBlobWithName:archive:error:", v7, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "modelShapeFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "parseCompiledNetworkBlobWithName:archive:error:", v9, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "modelNetFileName");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v12, "UTF8String"));
      IArchive::blob(&v22, *(_QWORD *)a3, (uint64_t)__p);
      v13 = (_QWORD *)(v22 + 8);
      if (*(char *)(v22 + 31) < 0)
        v13 = (_QWORD *)*v13;
      objc_msgSend(v11, "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      if (v21 < 0)
        operator delete(__p[0]);

      v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetJson:shapeJson:modelPath:", v8, v10, v14);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)modelNetFileName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "modelName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".espresso.net"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)modelName
{
  return CFSTR("model");
}

+ (id)parseCompiledNetworkBlobWithName:(id)a3 archive:(void *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  std::string *p_p;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id v20;
  std::string __p;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v7 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v7, "UTF8String"));
  IArchive::blob(&v22, *(_QWORD *)a4, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  (*(void (**)(uint64_t))(*(_QWORD *)v22 + 32))(v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v20);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v9;
        a5 = (id *)v9;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = *(_QWORD *)a4;
    if (*(char *)(*(_QWORD *)a4 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v12 + 8), *(_QWORD *)(v12 + 16));
    }
    else
    {
      v13 = *(_OWORD *)(v12 + 8);
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v12 + 24);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v11, "stringWithUTF8String:", p_p);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v10, CFSTR("Error in parsing network information from compiled model path %@."), v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    a5 = 0;
  }
LABEL_18:

  v16 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return a5;
}

- (id)loadUpdatableParams:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  MLNeuralNetworksCompileTimeParams *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v15;

  -[_OnDiskArchiveReader modelPath](self, "modelPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("model.espresso.net"), CFSTR("model_updatable.params"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isReadableFileAtPath:", v5);

  if (!v7)
  {
    v10 = 0;
LABEL_6:
    v10 = v10;
    v13 = v10;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MLNeuralNetworksCompileTimeParams alloc];
  v15 = 0;
  -[MLNeuralNetworksCompileTimeParams unarchiveUpdatableParamsAtURL:error:](v9, "unarchiveUpdatableParamsAtURL:error:", v8, &v15);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = objc_retainAutorelease(v11);
  *a3 = v12;

  v13 = 0;
LABEL_7:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeJson, 0);
  objc_storeStrong((id *)&self->_netJson, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_layerInfos, 0);
}

- (NSArray)layerInfos
{
  return self->_layerInfos;
}

@end
