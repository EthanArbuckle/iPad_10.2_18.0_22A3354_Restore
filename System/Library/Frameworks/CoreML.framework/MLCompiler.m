@implementation MLCompiler

+ (id)compileSpecificationAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "absoluteString");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = MLLoggingAllowsInstrumentation(1, (const char *)objc_msgSend(v15, "UTF8String"));

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);

  if (v16)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v26 = 136446210;
      v27 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_19C486000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v26, 0xCu);
    }

  }
  objc_msgSend(a1, "_compileSpecificationAtURL:toURL:compiledModelName:overridingModelDescription:options:error:", v10, v11, v14, 0, v12, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      v26 = 136446210;
      v27 = v24;
      _os_signpost_emit_with_name_impl(&dword_19C486000, v23, OS_SIGNPOST_INTERVAL_END, v18, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v26, 0xCu);
    }

  }
  return v21;
}

+ (id)_compileSpecificationAtURL:(id)a3 toURL:(id)a4 compiledModelName:(id)a5 overridingModelDescription:(id)a6 options:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  MLCompilerEvent *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *__p[2];
  char v48;
  CoreML::Specification::Model *v49;
  std::__shared_weak_count *v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  _BYTE v54[10];
  char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v43 = a5;
  v44 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v45, "fileExistsAtPath:", v17);

  v18 = objc_alloc_init(MLCompilerEvent);
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v49);
  v19 = objc_msgSend(a1, "_loadSpecificationAtURL:to:error:", v14, &v49, a8);
  if ((v19 & 1) == 0)
  {
    v22 = 0;
LABEL_7:
    v23 = 0;
    goto LABEL_23;
  }
  if (v44)
    objc_msgSend(a1, "_updateSpecification:withModelDescription:", &v49, v44);
  if (v43)
  {
    objc_msgSend(v43, "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByDeletingPathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = objc_retainAutorelease(v21);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v22, "fileSystemRepresentation"));
  OArchive::OArchive((uint64_t)buf, (uint64_t)__p, objc_msgSend(v16, "dryRun"));
  if (v48 < 0)
    operator delete(__p[0]);
  objc_msgSend(v16, "setSpecURL:", v14);
  objc_msgSend(a1, "compileSpecification:blobMapping:toArchive:options:compilerEvent:error:", &v49, 0, buf, v16, v18, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hashSpecificationAtURL:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && (objc_msgSend(a1, "fingerprintSpecificationAtURL:toArchive:hash:error:", v14, buf, v26, a8) & 1) == 0)
  {

    v23 = 0;
  }

  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v55);
  v27 = *(std::__shared_weak_count **)&v54[2];
  if (!*(_QWORD *)&v54[2])
    goto LABEL_18;
  v28 = (unint64_t *)(*(_QWORD *)&v54[2] + 8);
  do
    v29 = __ldaxr(v28);
  while (__stlxr(v29 - 1, v28));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
    if (!v23)
      goto LABEL_23;
  }
  else
  {
LABEL_18:
    if (!v23)
      goto LABEL_23;
  }
  if (objc_msgSend(v16, "encryptModel")
    && (objc_msgSend(a1, "encryptCompiledModelAtURL:options:error:", v22, v16, a8) & 1) == 0)
  {

    goto LABEL_7;
  }
LABEL_23:
  v30 = v50;
  if (!v50)
    goto LABEL_27;
  p_shared_owners = (unint64_t *)&v50->__shared_owners_;
  do
    v32 = __ldaxr(p_shared_owners);
  while (__stlxr(v32 - 1, p_shared_owners));
  if (v32)
  {
LABEL_27:
    if (v19)
      goto LABEL_28;
LABEL_40:
    v40 = 0;
    goto LABEL_41;
  }
  ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
  std::__shared_weak_count::__release_weak(v30);
  if (!v19)
    goto LABEL_40;
LABEL_28:
  if (!v23 || objc_msgSend(v16, "containerIsCloud"))
  {
    if (v42)
      v33 = v22;
    else
      v33 = v15;
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v36 = objc_msgSend(v35, "removeItemAtURL:error:", v34, &v46);
    v37 = v46;

    if ((v36 & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v52 = v34;
        v53 = 2112;
        *(_QWORD *)v54 = v37;
        _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, "Fail to clean up path=%@, error=%@", buf, 0x16u);
      }

    }
    objc_msgSend(v23, "setOutputFiles:", 0);

  }
  +[MLReporter reporter](MLReporter, "reporter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "logMetric:", v18);

  v40 = v23;
LABEL_41:

  return v40;
}

+ (void)_updateMetadata:(void *)a3 withMetadata:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  google::protobuf::Arena **v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __n128 __p;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D46230];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D46230]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a3 + 6, &__p);
    if (v37 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  v9 = *MEMORY[0x1E0D46240];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D46240]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v12, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a3 + 7, &__p);
    if (v37 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  v13 = *MEMORY[0x1E0D46220];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D46220]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v16, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a3 + 8, &__p);
    if (v37 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  v17 = *MEMORY[0x1E0D46238];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D46238]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (!v19)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v20, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a3 + 9, &__p);
    if (v37 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D46228]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v24)
    {
      v25 = (char *)a3 + 24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", v28, (_QWORD)v32);
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(v29, "UTF8String");
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
          v31 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)v25, (uint64_t)&__p);
          MEMORY[0x1A1AD5EAC](v31, v30);
          if (v37 < 0)
            operator delete((void *)__p.n128_u64[0]);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v24);
    }

  }
}

+ (void)_updateFeatures:(void *)a3 withFeatures:(id)a4
{
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  size_t v14;
  uint64_t j;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __n128 __p;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v20 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1A1AD6ED8]();
        objc_msgSend(v7, "name");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (const char *)objc_msgSend(v9, "UTF8String");

        v11 = *((_QWORD *)a3 + 2);
        if (v11)
          v12 = (uint64_t *)(v11 + 8);
        else
          v12 = 0;
        v13 = *((int *)a3 + 2);
        if ((_DWORD)v13)
        {
          v14 = strlen(v10);
          for (j = 8 * v13; j; j -= 8)
          {
            v16 = *v12;
            v17 = *(_QWORD **)(*v12 + 16);
            if (*((char *)v17 + 23) < 0)
            {
              if (v14 != v17[1])
                goto LABEL_19;
              if (v14 == -1)
LABEL_27:
                std::string::__throw_out_of_range[abi:ne180100]();
              v17 = (_QWORD *)*v17;
            }
            else
            {
              if (v14 != *((unsigned __int8 *)v17 + 23))
                goto LABEL_19;
              if (v14 == -1)
                goto LABEL_27;
            }
            if (!memcmp(v17, v10, v14))
            {
              objc_msgSend(v7, "shortDescription");
              v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String"));
              google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v16 + 24), &__p);
              if (v26 < 0)
                operator delete((void *)__p.n128_u64[0]);

              break;
            }
LABEL_19:
            ++v12;
          }
        }
        objc_autoreleasePoolPop(v8);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }

}

+ (void)_updateSpecification:(void *)a3 withModelDescription:(id)a4
{
  id v6;
  uint64_t v7;
  CoreML::Specification::ModelDescription *v8;
  void *v9;
  CoreML::Specification::Metadata *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = *(_QWORD *)a3;
  v8 = *(CoreML::Specification::ModelDescription **)(v7 + 16);
  v14 = v6;
  if (!v8)
  {
    v8 = (CoreML::Specification::ModelDescription *)operator new();
    CoreML::Specification::ModelDescription::ModelDescription(v8);
    *(_QWORD *)(v7 + 16) = v8;
    v6 = v14;
  }
  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (CoreML::Specification::Metadata *)*((_QWORD *)v8 + 20);
    if (!v10)
    {
      v10 = (CoreML::Specification::Metadata *)operator new();
      CoreML::Specification::Metadata::Metadata(v10);
      *((_QWORD *)v8 + 20) = v10;
    }
    objc_msgSend(a1, "_updateMetadata:withMetadata:", v10, v9);
  }
  objc_msgSend(v14, "inputDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateFeatures:withFeatures:", (char *)v8 + 16, v11);

  objc_msgSend(v14, "outputDescriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateFeatures:withFeatures:", (char *)v8 + 40, v12);

  objc_msgSend(v14, "trainingInputDescriptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateFeatures:withFeatures:", (char *)v8 + 112, v13);

}

+ (BOOL)_loadSpecificationAtURL:(id)a3 to:(void *)a4 error:(id *)a5
{
  id v7;
  id v8;
  double v9;
  unsigned int v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *__p;
  char v21;
  int v22;
  void *v23;
  char v24;
  const CoreML::Specification::Model *v25[2];
  std::__shared_weak_count *v26;
  __int128 v27;
  uint64_t v28;
  _QWORD v29[20];

  v29[19] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  CoreML::Model::Model((CoreML::Model *)v25);
  v8 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
  std::ifstream::basic_ifstream(&v27);
  v9 = CoreML::Model::load((uint64_t)&v22, &v27, (uint64_t)v25);
  *(_QWORD *)&v27 = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)&v27 + *(_QWORD *)(v27 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1A1AD5F48](&v28, v9);
  std::istream::~istream();
  MEMORY[0x1A1AD61C4](v29);
  if (v21 < 0)
    operator delete(__p);
  v10 = v22 & 0xFFFFFFEF;
  if ((v22 & 0xFFFFFFEF) == 0)
  {
    _MLModelSpecification::_MLModelSpecification((_MLModelSpecification *)&v27, v25);
    std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)a4, &v27);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (!*((_QWORD *)&v27 + 1))
      goto LABEL_17;
    v15 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v14 = __ldaxr(v15);
    while (__stlxr(v14 - 1, v15));
    goto LABEL_15;
  }
  if (a5)
  {
    v11 = &v23;
    if (v24 < 0)
      v11 = v23;
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%@ Error reading protobuf spec. %s"), CFSTR("compiler error:"), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::Model **)&v27);
  std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)a4, &v27);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
LABEL_15:
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
LABEL_17:
  if (v24 < 0)
    operator delete(v23);
  v25[0] = (const CoreML::Specification::Model *)&off_1E3D597D0;
  v16 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return v10 == 0;
}

+ (BOOL)encryptCompiledModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[16];
  std::__shared_weak_count *v39;
  char *v40;
  _BYTE v41[128];
  _BYTE buf[12];
  __int16 v43;
  id v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v29 = v8;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
  OArchive::OArchive((uint64_t)v38, (uint64_t)buf, objc_msgSend(v7, "dryRun"));
  if (v45 < 0)
    operator delete(*(void **)buf);
  v37 = 0;
  +[MLCompiler contentsOfDirectoryAtURL:error:](MLCompiler, "contentsOfDirectoryAtURL:error:", v8, &v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v37;
  if (v9)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v34;
      while (2)
      {
        v14 = 0;
        v15 = v10;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
          v32 = v15;
          v17 = +[MLCompiler encryptFileAtURL:options:error:](MLCompiler, "encryptFileAtURL:options:error:", v16, v7, &v32);
          v10 = v32;

          if (!v17)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v29;
              v43 = 2112;
              v44 = v10;
              _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "Failed to encrypt %@ with error=%@", buf, 0x16u);
            }

            if (a5)
            {
              objc_msgSend(v10, "localizedDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("%@ %@"), CFSTR("compiler error:"), v22);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_26;
          }
          ++v14;
          v15 = v10;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v12)
          continue;
        break;
      }
    }

    v31 = v10;
    v18 = +[MLCompiler storeEncryptionInfoInCompiledArchive:options:error:](MLCompiler, "storeEncryptionInfoInCompiledArchive:options:error:", v38, v7, &v31);
    v19 = v31;

    if (v18)
    {
      v20 = 1;
LABEL_35:
      v10 = v19;
      goto LABEL_28;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "Failed to store encryption information in compiled model with error=%@", buf, 0xCu);
    }

    if (!a5)
    {
      v20 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v19, "localizedDescription");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("%@ %@"), CFSTR("compiler error:"), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v19;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      v43 = 2112;
      v44 = v10;
      _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Failed to list all output files with destURL=%@, error=%@", buf, 0x16u);
    }

    if (!a5)
      goto LABEL_27;
    objc_msgSend(v10, "localizedDescription");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("%@ %@"), CFSTR("compiler error:"), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:

LABEL_27:
  v20 = 0;
LABEL_28:

  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v40);
  v25 = v39;
  if (v39)
  {
    p_shared_owners = (unint64_t *)&v39->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  return v20;
}

+ (id)versionInfo
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "3400.58.3.11.1", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLVersionInfo versionInfoWithStringProgressive:](MLVersionInfo, "versionInfoWithStringProgressive:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[MLVersionInfo versionInfoWithString:](MLVersionInfo, "versionInfoWithString:", CFSTR("9999.0.1"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)encryptFileAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enc_%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iv");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[MLModelEncryptionUtils encryptFile:withKey:iv:saveToFile:error:](MLModelEncryptionUtils, "encryptFile:withKey:iv:saveToFile:error:", v7, v13, v14, v12, a5);

  if (!v15)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v35 = (uint64_t)v7;
      v36 = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to encrypt file at URL: %@, to file at URL: %@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject removeItemAtURL:error:](v16, "removeItemAtURL:error:", v7, a5) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v7;
      _os_log_error_impl(&dword_19C486000, v30, OS_LOG_TYPE_ERROR, "Failed to remove file at URL: %@", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if ((-[NSObject copyItemAtURL:toURL:error:](v16, "copyItemAtURL:toURL:error:", v12, v7, a5) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v35 = (uint64_t)v12;
      v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_19C486000, v30, OS_LOG_TYPE_ERROR, "Failed to copy file from %@ to %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if ((-[NSObject removeItemAtURL:error:](v16, "removeItemAtURL:error:", v12, a5) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v12;
      _os_log_error_impl(&dword_19C486000, v30, OS_LOG_TYPE_ERROR, "Failed to remove file at URL: %@", buf, 0xCu);
    }
LABEL_23:

    goto LABEL_33;
  }
  objc_msgSend(v8, "sinf");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("SC_Info"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[NSObject createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, a5) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sinf"), v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLByAppendingPathComponent:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "sinf");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "writeToURL:atomically:", v21, 1);

      if ((v23 & 1) != 0)
      {
        objc_msgSend(v8, "mlsinf");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
LABEL_11:

          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.mlsinf"), v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "mlsinf");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "writeToURL:atomically:", v26, 1);

        if ((v28 & 1) != 0)
        {
          v21 = (void *)v26;
          goto LABEL_11;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v26;
          _os_log_debug_impl(&dword_19C486000, v32, OS_LOG_TYPE_DEBUG, "Failed to write SINF to URL: %@", buf, 0xCu);
        }
        v21 = (void *)v26;
      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v21;
          _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "Failed to write SINF to URL: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (uint64_t)v19;
        _os_log_error_impl(&dword_19C486000, v31, OS_LOG_TYPE_ERROR, "Failed to create SC_Info at URL: %@", buf, 0xCu);
      }

    }
LABEL_33:
    v29 = 0;
    goto LABEL_34;
  }
LABEL_12:
  v29 = 1;
LABEL_34:

  return v29;
}

+ (BOOL)storeEncryptionInfoInCompiledArchive:(void *)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  const std::error_category *v16;
  const std::error_category *i;
  __int128 v18;
  std::string *v19;
  void *v20;
  _QWORD *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  std::ios_base::failure *exception;
  const std::error_category *v42;
  void *v43;
  id obj;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  std::string v51;
  std::error_code __p;
  char v53;
  uint8_t v54[128];
  uint8_t buf[4];
  _BYTE v56[20];
  char *v57[7];

  v57[4] = *(char **)MEMORY[0x1E0C80C00];
  v45 = a4;
  objc_msgSend(v45, "keyID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v45, "keyID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    if (v10)
    {
      v43 = v10;
      v46 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      std::string::basic_string[abi:ne180100]<0>(&__p, "encryptionInfo");
      v11 = OArchive::nestedArchive((char *)a3, (uint64_t)&__p);
      buf[0] = *v11;
      v12 = *((_QWORD *)v11 + 2);
      *(_QWORD *)&v56[4] = *((_QWORD *)v11 + 1);
      *(_QWORD *)&v56[12] = v12;
      if (v12)
      {
        v13 = (unint64_t *)(v12 + 8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v57, (_QWORD *)v11 + 3);
      if (v53 < 0)
        operator delete(*(void **)&__p.__val_);
      objc_msgSend(v45, "keyID");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v15, "UTF8String"));
      operator<<((uint64_t)buf, (uint64_t *)&__p.__val_);
      if (v53 < 0)
        operator delete(*(void **)&__p.__val_);

      OArchive::listFilesWritten((OArchive *)&__p, (uint64_t)buf);
      v16 = *(const std::error_category **)&__p.__val_;
      for (i = __p.__cat_; v16 != i; v16 += 3)
      {
        if (SHIBYTE(v16[2].__vftable) < 0)
        {
          std::string::__init_copy_ctor_external(&v51, (const std::string::value_type *)v16->__vftable, (std::string::size_type)v16[1].__vftable);
        }
        else
        {
          v18 = *(_OWORD *)&v16->__vftable;
          v51.__r_.__value_.__r.__words[2] = (std::string::size_type)v16[2].__vftable;
          *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v18;
        }
        if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v19 = &v51;
        else
          v19 = (std::string *)v51.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v20);

        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v51.__r_.__value_.__l.__data_);
      }
      v51.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v51);
      LODWORD(v51.__r_.__value_.__l.__data_) = objc_msgSend(v45, "usesCodeSigningIdentityForEncryption");
      (*(void (**)(_QWORD))(**(_QWORD **)&v56[4] + 56))(*(_QWORD *)&v56[4]);
      std::ostream::write();
      if (!buf[0])
      {
        v21 = (_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)&v56[4] + 56))(*(_QWORD *)&v56[4]);
        if ((*((_BYTE *)v21 + *(_QWORD *)(*v21 - 24) + 32) & 5) != 0)
        {
          exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
          v42 = std::iostream_category();
          *(_QWORD *)&__p.__val_ = 1;
          __p.__cat_ = v42;
          std::ios_base::failure::failure(exception, "Error writing to archive.", &__p);
          __cxa_throw(exception, MEMORY[0x1E0DE4E48], MEMORY[0x1E0DE4CB0]);
        }
      }
      (*(void (**)(_QWORD))(**(_QWORD **)&v56[4] + 56))(*(_QWORD *)&v56[4]);
      std::ostream::flush();
      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v57[1]);
      v22 = *(std::__shared_weak_count **)&v56[12];
      if (*(_QWORD *)&v56[12])
      {
        v23 = (unint64_t *)(*(_QWORD *)&v56[12] + 8);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v46;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (!v26)
      {
        v34 = 1;
        goto LABEL_54;
      }
      v27 = *(_QWORD *)v48;
LABEL_29:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v28));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "URLByDeletingLastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enc_%@"), v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "URLByAppendingPathComponent:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!+[MLModelEncryptionUtils addEncryptionHeaderToUnencryptedFile:saveToFile:error:](MLModelEncryptionUtils, "addEncryptionHeaderToUnencryptedFile:saveToFile:error:", v29, v33, a5))
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19C486000, v36, OS_LOG_TYPE_DEBUG, "Failed to write encryption info metadata.", buf, 2u);
          }
          goto LABEL_53;
        }
        if ((objc_msgSend(v25, "removeItemAtURL:error:", v29, a5) & 1) == 0)
          break;
        if ((objc_msgSend(v25, "copyItemAtURL:toURL:error:", v33, v29, a5) & 1) == 0)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v56 = v33;
            *(_WORD *)&v56[8] = 2112;
            *(_QWORD *)&v56[10] = v29;
            v37 = "Failed to copy file from %@ to %@";
            v38 = v36;
            v39 = 22;
            goto LABEL_60;
          }
LABEL_53:

          v34 = 0;
          goto LABEL_54;
        }
        if ((objc_msgSend(v25, "removeItemAtURL:error:", v33, a5) & 1) == 0)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v36 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            goto LABEL_53;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v56 = v33;
          v37 = "Failed to remove file at URL: %@";
LABEL_59:
          v38 = v36;
          v39 = 12;
LABEL_60:
          _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_53;
        }

        if (v26 == ++v28)
        {
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
          v34 = 1;
          if (v26)
            goto LABEL_29;
LABEL_54:

LABEL_55:
          v10 = v43;
          goto LABEL_56;
        }
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v56 = v29;
        v37 = "Failed to remove file at URL: %@";
        goto LABEL_59;
      }
      goto LABEL_53;
    }
    if (a5)
    {
      v43 = 0;
      objc_msgSend(v45, "keyID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("Specified Key ID %@ is not in UUID format."), v35);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v34 = 0;
      goto LABEL_55;
    }
    v34 = 0;
LABEL_56:

  }
  else if (a5)
  {
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("Key ID has to be specified while encrypting model."));
    v34 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id *v15;
  char v16;
  id v17;
  id v19;
  void *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__14741;
  v33 = __Block_byref_object_dispose__14742;
  v34 = 0;
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C999D0];
  v36[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __45__MLCompiler_contentsOfDirectoryAtURL_error___block_invoke;
  v28[3] = &unk_1E3D662A0;
  v28[4] = &v29;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v19, v6, 0, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v30[5];
  if (v7)
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v20;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          obj = 0;
          v23 = 0;
          v15 = v30;
          v16 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v23, v5, &obj);
          v17 = v23;
          objc_storeStrong(v15 + 5, obj);
          if ((v16 & 1) == 0)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v30[5]);

            v8 = 0;
            goto LABEL_19;
          }
          if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
            objc_msgSend(v9, "addObject:", v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
        if (v11)
          continue;
        break;
      }
    }

    v8 = v9;
LABEL_19:

  }
  _Block_object_dispose(&v29, 8);

  return v8;
}

+ (id)hashSpecificationAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  v7 = CFSTR("FailedToComputeHash");
  if (v6)
  {
    +[MLReporterUtils hashFileAt:error:](MLReporterUtils, "hashFileAt:error:", v3, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      v7 = (__CFString *)v8;
  }

  return v7;
}

+ (BOOL)fingerprintSpecificationAtURL:(id)a3 toArchive:(void *)a4 hash:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  BOOL v20;
  void *__p[2];
  char v23;
  uint64_t *v24;
  _QWORD *v25[2];
  void **v26;

  v9 = a3;
  v10 = a5;
  v25[0] = 0;
  v25[1] = 0;
  v24 = (uint64_t *)v25;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if (v13)
  {
    objc_msgSend(v9, "URLByDeletingPathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("modelName"), "UTF8String"));
      v26 = __p;
      v17 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (_OWORD **)&v26);
      MEMORY[0x1A1AD5EAC]((char *)v17 + 56, v16);
      if (v23 < 0)
        operator delete(__p[0]);
    }
    v18 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("modelHash"), "UTF8String"));
    v26 = __p;
    v19 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (_OWORD **)&v26);
    MEMORY[0x1A1AD5EAC]((char *)v19 + 56, v18);
    if (v23 < 0)
      operator delete(__p[0]);

  }
  std::string::basic_string[abi:ne180100]<0>(__p, "SpecificationDetails");
  v20 = +[MLReporterUtils archiveModelDetails:withName:toArchive:error:](MLReporterUtils, "archiveModelDetails:withName:toArchive:error:", &v24, __p, a4, a6);
  if (v23 < 0)
    operator delete(__p[0]);

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v25[0]);
  return v20;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  MLCompilerEvent *v14;
  void *v15;
  void *v16;

  v12 = a4;
  v13 = a6;
  v14 = objc_alloc_init(MLCompilerEvent);
  objc_msgSend(a1, "compileSpecification:blobMapping:toArchive:options:compilerEvent:error:", a3, v12, a5, v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLReporter reporter](MLReporter, "reporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMetric:", v14);

  return v15;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 compilerClass:(Class)a5 toArchive:(void *)a6 options:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  if (!v13)
  {
    -[objc_class compileSpecification:toArchive:options:error:](a5, "compileSpecification:toArchive:options:error:", a3, a6, v14, a8);
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[objc_class conformsToProtocol:](a5, "conformsToProtocol:", &unk_1EE438330))
  {
    -[objc_class compileSpecification:blobMapping:toArchive:options:error:](a5, "compileSpecification:blobMapping:toArchive:options:error:", a3, v13, a6, v14, a8);
    v15 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a8 = v15;
    goto LABEL_10;
  }
  v16 = *(_DWORD *)(*(_QWORD *)a3 + 44);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v16));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", buf, 0xCu);

  }
  if (a8)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v16));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification."), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v22);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    a8 = 0;
  }
LABEL_10:

  return a8;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 compilerEvent:(id)a7 error:(id *)a8
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  std::string *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const CoreML::Specification::ModelDescription *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  void *v60;
  id v61;
  void *v62;
  id v63;
  std::string *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v75;
  id v76;
  id v77[2];
  char v78[8];
  std::__shared_weak_count *v79;
  uint64_t v80;
  void *v81;
  std::string v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v72 = a4;
  v73 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0C99E98];
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = *((_QWORD *)a5 + 1);
  if (*(char *)(v16 + 55) < 0)
    std::string::__init_copy_ctor_external(&v82, *(const std::string::value_type **)(v16 + 32), *(_QWORD *)(v16 + 40));
  else
    v82 = *(std::string *)(v16 + 32);
  if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v17 = &v82;
  else
    v17 = (std::string *)v82.__r_.__value_.__r.__words[0];
  objc_msgSend(v15, "stringWithUTF8String:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByDeletingPathExtension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModelName:", v21);

  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v82.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "3400.58.3.11.1");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompilerVersion:", v22);

  objc_msgSend(v13, "compilerVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModelCompiledWithVersion:", v23);

  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v24 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v24 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v78, v24);
  v25 = -[MLModelAssetDescription initFromModelDescriptionSpecification:]([MLModelAssetDescription alloc], "initFromModelDescriptionSpecification:", v78);
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "defaultModelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v27, "metadata");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "modelOriginNumberFromUserDefinedDictionary:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModelOrigin:", v34);

    }
  }

  v35 = *(unsigned int *)(*(_QWORD *)a3 + 44);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModelType:", v36);

  operator<<((uint64_t)a5, v35);
  objc_msgSend(a1, "compiledVersionForSpecification:options:error:", a3, v73, a8);
  v77[1] = 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = +[MLModelIOUtils serializeVersionInfo:archive:error:](MLModelIOUtils, "serializeVersionInfo:archive:error:");
  v38 = 0;
  v39 = v38;
  if ((v36 & 1) != 0)
  {
    +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", *(int *)(*(_QWORD *)a3 + 24), 0, 0, &stru_1E3D68DC8);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "versionString");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setModelVersion:", v40);

    v77[0] = v39;
    LOBYTE(v40) = +[MLModelIOUtils serializeVersionInfo:archive:error:](MLModelIOUtils, "serializeVersionInfo:archive:error:", v71, a5, v77);
    v41 = v77[0];

    if ((v40 & 1) != 0)
    {
      +[MLModelTypeRegistry sharedInstance](MLModelTypeRegistry, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v42, "classForCompilingModelType:", v35);

      if (v43)
      {
        if (objc_msgSend(v43, "conformsToProtocol:", &unk_1EE4382D0))
        {
          v76 = v41;
          objc_msgSend(a1, "compileSpecification:blobMapping:compilerClass:toArchive:options:error:", a3, v72, v43, a5, v73, &v76);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v76;

          if (v44)
          {
            if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)a5 + 1) + 48))(*((_QWORD *)a5 + 1)) == 1)
            {
LABEL_43:
              v48 = v71;
              goto LABEL_44;
            }
            v45 = (void *)MEMORY[0x1E0C99E98];
            v46 = (void *)MEMORY[0x1E0CB3940];
            v47 = *((_QWORD *)a5 + 1);
            if (*(char *)(v47 + 55) < 0)
              std::string::__init_copy_ctor_external(&v82, *(const std::string::value_type **)(v47 + 32), *(_QWORD *)(v47 + 40));
            else
              v82 = *(std::string *)(v47 + 32);
            if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v64 = &v82;
            else
              v64 = (std::string *)v82.__r_.__value_.__r.__words[0];
            objc_msgSend(v46, "stringWithUTF8String:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "fileURLWithPath:", v65);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v82.__r_.__value_.__l.__data_);
            +[MLCompiler addMLProgramToCompiledModelAtURL:withCompilationMode:dryRun:oarchiveForModelCompilation:compilerEvent:error:](MLCompiler, "addMLProgramToCompiledModelAtURL:withCompilationMode:dryRun:oarchiveForModelCompilation:compilerEvent:error:", v49, objc_msgSend(v73, "mlProgramAddDuringCompilationMode"), objc_msgSend(v73, "dryRun"), a5, v13, a8);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
            {
              objc_msgSend(v44, "outputFiles");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "outputFiles");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "arrayByAddingObjectsFromArray:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setOutputFiles:", v69);

              goto LABEL_66;
            }

            v49 = v44;
            v41 = v39;
LABEL_68:
            v44 = 0;
            goto LABEL_40;
          }
          if (a8)
          {
            objc_msgSend(v39, "localizedDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@ %@"), CFSTR("compiler error:"), v60);
            *a8 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v39, "code") == 4)
            {
              v61 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(*a8, "userInfo");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)objc_msgSend(v61, "initWithDictionary:", v62);

              objc_msgSend(v49, "setValue:forKey:", v39, *MEMORY[0x1E0CB3388]);
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 4, v49);
              v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *a8 = v63;

              v44 = 0;
LABEL_66:
              v41 = v39;
              goto LABEL_40;
            }
          }
          goto LABEL_57;
        }
        if (objc_msgSend(v43, "conformsToProtocol:", &unk_1EE436810))
        {
          if (!v72)
          {
            v75 = v41;
            +[MLModelIOUtils serializeSpecification:toArchive:error:](MLModelIOUtils, "serializeSpecification:toArchive:error:", a3, a5, &v75);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v75;

            if (v44)
              goto LABEL_43;
            if (a8)
            {
              objc_msgSend(v39, "localizedDescription");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@ %@"), CFSTR("compiler error:"), v49);
              v44 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_66;
            }
LABEL_57:
            v44 = 0;
            goto LABEL_43;
          }
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v35));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v82.__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v82.__r_.__value_.__r.__words + 4) = (std::string::size_type)v70;
            _os_log_error_impl(&dword_19C486000, v51, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", (uint8_t *)&v82, 0xCu);

          }
          if (a8)
          {
            v52 = (void *)MEMORY[0x1E0CB35C8];
            v80 = *MEMORY[0x1E0CB2D50];
            v53 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v35));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringWithFormat:", CFSTR("The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification."), v49);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v54;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v55);
            *a8 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_68;
          }
LABEL_41:
          v44 = 0;
          goto LABEL_42;
        }
        if (!a8)
          goto LABEL_41;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v35));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%@ Invalid compiling class %@ for model type %@"), CFSTR("compiler error:"), v43, v49);
        v50 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a8)
          goto LABEL_41;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v35));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%@ No known class for compiling model type %@"), CFSTR("compiler error:"), v49);
        v50 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!a8)
        goto LABEL_41;
      objc_msgSend(v41, "localizedDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@ %@"), CFSTR("compiler error:"), v49);
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v44 = 0;
    *a8 = v50;
LABEL_40:

LABEL_42:
    v39 = v41;
    goto LABEL_43;
  }
  if (a8)
  {
    objc_msgSend(v38, "localizedDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@ %@"), CFSTR("compiler error:"), v48);
    v44 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  v44 = 0;
LABEL_45:

  v56 = v79;
  if (v79)
  {
    p_shared_owners = (unint64_t *)&v79->__shared_owners_;
    do
      v58 = __ldaxr(p_shared_owners);
    while (__stlxr(v58 - 1, p_shared_owners));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }

  return v44;
}

+ (id)compiledVersionForSpecificationAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  CoreML::Specification::Model *v15;
  std::__shared_weak_count *v16;

  v8 = a3;
  v9 = a4;
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v15);
  if ((objc_msgSend(a1, "_loadSpecificationAtURL:to:error:", v8, &v15, a5) & 1) != 0)
  {
    objc_msgSend(a1, "compiledVersionForSpecification:options:error:", &v15, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return v10;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = *(unsigned int *)(*(_QWORD *)a3 + 44);
  +[MLModelTypeRegistry sharedInstance](MLModelTypeRegistry, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "classForCompilingModelType:", v8);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
    {
LABEL_12:

      a5 = 0;
      goto LABEL_13;
    }
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("No known class for compiling model type %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    *a5 = v13;
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EE4382D0))
  {
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE436810))
    {
      +[MLModelIOUtils versionForSerializedSpecification:options:error:](MLModelIOUtils, "versionForSerializedSpecification:options:error:", a3, v7, a5);
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!a5)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Invalid compiling class %@ for model type %@"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v10, "compiledVersionForSpecification:options:error:", a3, v7, a5);
  v11 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  a5 = v11;
LABEL_13:

  return a5;
}

+ (id)compileModelAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  _QWORD aBlock[4];
  id v30;
  os_signpost_id_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v28 = a4;
  v11 = a5;
  objc_msgSend(v10, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingPathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "absoluteString");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = MLLoggingAllowsInstrumentation(1, (const char *)objc_msgSend(v14, "UTF8String"));

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  if (v15)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 136446210;
      v34 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_19C486000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MLModel_Compile", "Model-name:%{public}s", buf, 0xCu);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLCompiler_compileModelAtURL_toURL_options_error___block_invoke;
  aBlock[3] = &unk_1E3D662C8;
  v32 = v15;
  v31 = v17;
  v20 = v13;
  v30 = v20;
  v21 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[MLModelIOUtils specificationURLFromModelAtURL:error:](MLModelIOUtils, "specificationURLFromModelAtURL:error:", v10, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46248]), "initWithContentsOfURL:error:", v10, a6);
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "modelDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_compileSpecificationAtURL:toURL:compiledModelName:overridingModelDescription:options:error:", v22, v28, v20, v25, v11, a6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  v21[2](v21);
  return v26;
}

+ (id)addMLProgramToCompiledModelAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MLCompilerEvent *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = objc_alloc_init(MLCompilerEvent);
  objc_msgSend(a1, "fillCompilerEvent:withMetadataFromModelAt:error:", v8, v6, 0);
  +[MLReporter reporter](MLReporter, "reporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logMetric:", v8);

  if ((_DWORD)a4)
    v10 = v7;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (BOOL)canAddMLProgramToCompiledModelAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model%d"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URLByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if ((v8 & 1) == 0
        || +[MLCompiler canAddMLProgramToCompiledModelAtURL:](MLCompiler, "canAddMLProgramToCompiledModelAtURL:", v11))
      {
        break;
      }
      v9 = (v9 + 1);

    }
  }

  return v8;
}

+ (id)compiledVersionForModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[MLModelIOUtils specificationURLFromModelAtURL:error:](MLModelIOUtils, "specificationURLFromModelAtURL:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "compiledVersionForSpecificationAtURL:options:error:", v9, v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __52__MLCompiler_compileModelAtURL_toURL_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
      v6 = 136446210;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_19C486000, v3, OS_SIGNPOST_INTERVAL_END, v4, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v6, 0xCu);
    }

  }
}

BOOL __45__MLCompiler_contentsOfDirectoryAtURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

  return v5 == 0;
}

+ (id)addMLProgramToCompiledModelAtURL:(id)a3 withCompilationMode:(int)a4 dryRun:(BOOL)a5 oarchiveForModelCompilation:(void *)a6 compilerEvent:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  id v21;

  v13 = a3;
  v14 = a7;
  v15 = (void *)objc_opt_new();
  if (!a4)
  {
    objc_msgSend(v14, "setMilUpgradeStatus:", &unk_1E3DA23C8);
    goto LABEL_13;
  }
  if (a5)
  {
LABEL_13:
    v19 = v15;
    goto LABEL_14;
  }
  if (a6)
    OArchive::flush((uint64_t)a6);
  v21 = 0;
  v17 = v21;
  v18 = v17;
  if (a4 != 2 || (v16 & 1) != 0)
  {

    goto LABEL_13;
  }
  if (a8 && v17)
    *a8 = objc_retainAutorelease(v17);

  v19 = 0;
LABEL_14:

  return v19;
}

+ (BOOL)fillCompilerEvent:(id)a3 withMetadataFromModelAt:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  int hasNestedArchive;
  int v20;
  BOOL v21;
  char *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  std::string *p_p;
  std::string::size_type v28;
  std::string::size_type size;
  int v30;
  _QWORD *v33;
  void *v34;
  _OWORD *v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  _OWORD *v40;
  _QWORD *v41;
  void *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char isKindOfClass;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  void *v69[2];
  char v70;
  uint64_t *v71;
  _QWORD *v72[2];
  std::string __p;
  void *v74;
  std::__shared_weak_count *v75;
  _BYTE v76[8];
  char *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  char *v80;
  _OWORD *v81[2];

  v7 = a3;
  v8 = a4;
  +[MLCompiler versionInfo](MLCompiler, "versionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "versionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompilerVersion:", v10);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("coremldata.bin"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "fileExistsAtPath:", v13);

  if ((v14 & 1) == 0)
  {
    v21 = 0;
    goto LABEL_73;
  }
  objc_msgSend(v8, "path");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v15, "UTF8String"));
  IArchive::IArchive((uint64_t *)&v74, (uint64_t)&__p, 3);
  _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&v78, (const IArchive *)&v74);
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v77);
  v16 = v75;
  if (v75)
  {
    p_shared_owners = (unint64_t *)&v75->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  std::string::basic_string[abi:ne180100]<0>(&v74, "analytics");
  hasNestedArchive = IArchive::hasNestedArchive(&v78, &v74);
  v20 = hasNestedArchive;
  if ((v76[7] & 0x80000000) != 0)
  {
    operator delete(v74);
    if (!v20)
      goto LABEL_54;
  }
  else if (!hasNestedArchive)
  {
    goto LABEL_54;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "analytics");
  v22 = IArchive::nestedArchive(&v78, (uint64_t)&__p);
  v23 = (std::__shared_weak_count *)*((_QWORD *)v22 + 1);
  v74 = *(void **)v22;
  v75 = v23;
  if (v23)
  {
    v24 = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v76, (_QWORD *)v22 + 2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  while (1)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)v74 + 4) + 16))(*((_QWORD *)v74 + 4));
    if (std::istream::peek() == -1)
      break;
    v26 = (void *)MEMORY[0x1A1AD6ED8]();
    memset(&__p, 0, sizeof(__p));
    v72[0] = 0;
    v72[1] = 0;
    v71 = (uint64_t *)v72;
    operator>>((uint64_t)&v74, &__p);
    operator>><std::string,std::string>((uint64_t)&v74, &v71);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ != 20)
        goto LABEL_32;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) != 20)
        goto LABEL_32;
      p_p = &__p;
    }
    v28 = p_p->__r_.__value_.__r.__words[0];
    size = p_p->__r_.__value_.__l.__size_;
    v30 = p_p->__r_.__value_.__r.__words[2];
    if (v28 == 0x6369666963657053 && size == 0x7465446E6F697461 && v30 == 1936484705)
    {
      std::string::basic_string[abi:ne180100]<0>(v69, (char *)objc_msgSend(CFSTR("modelName"), "UTF8String"));
      v33 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v71, v69);
      if (v70 < 0)
        operator delete(v69[0]);
      if (v72 != v33)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        std::string::basic_string[abi:ne180100]<0>(v69, (char *)objc_msgSend(CFSTR("modelName"), "UTF8String"));
        v81[0] = v69;
        v35 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v71, v69, v81);
        v36 = (_QWORD *)v35 + 7;
        if (*((char *)v35 + 79) < 0)
          v36 = (_QWORD *)*v36;
        objc_msgSend(v34, "stringWithUTF8String:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setModelName:", v37);

        if (v70 < 0)
          operator delete(v69[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(v69, (char *)objc_msgSend(CFSTR("modelHash"), "UTF8String"));
      v38 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v71, v69);
      if (v70 < 0)
        operator delete(v69[0]);
      if (v72 != v38)
      {
        v39 = (void *)MEMORY[0x1E0CB3940];
        std::string::basic_string[abi:ne180100]<0>(v69, (char *)objc_msgSend(CFSTR("modelHash"), "UTF8String"));
        v81[0] = v69;
        v40 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v71, v69, v81);
        v41 = (_QWORD *)v40 + 7;
        if (*((char *)v40 + 79) < 0)
          v41 = (_QWORD *)*v41;
        objc_msgSend(v39, "stringWithUTF8String:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setModelHash:", v42);

        if (v70 < 0)
          operator delete(v69[0]);
      }
    }
LABEL_32:
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v72[0]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    objc_autoreleasePoolPop(v26);
  }
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v77);
  v43 = v75;
  if (v75)
  {
    v44 = (unint64_t *)&v75->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
LABEL_54:
  LODWORD(__p.__r_.__value_.__l.__data_) = 0;
  operator>>((uint64_t)&v78);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(__p.__r_.__value_.__l.__data_));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModelType:", v46);

  +[MLModelIOUtils deserializeVersionInfoFromArchive:error:](MLModelIOUtils, "deserializeVersionInfoFromArchive:error:", &v78, a5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    objc_msgSend(v47, "versionNumberString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModelCompiledWithVersion:", v49);

    +[MLModelIOUtils deserializeVersionInfoFromArchive:error:](MLModelIOUtils, "deserializeVersionInfoFromArchive:error:", &v78, a5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      objc_msgSend(v50, "versionNumberString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setModelVersion:", v52);

      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::ModelDescription **)&v74);
      v21 = +[MLModelIOUtils deserializeInterfaceFormat:archive:error:](MLModelIOUtils, "deserializeInterfaceFormat:archive:error:", &v74, &v78, a5);
      if (v21)
      {
        v53 = -[MLModelAssetDescription initFromModelDescriptionSpecification:]([MLModelAssetDescription alloc], "initFromModelDescriptionSpecification:", &v74);
        objc_msgSend(v53, "defaultModelDescription");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "metadata");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v58 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v54, "metadata");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "modelOriginNumberFromUserDefinedDictionary:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setModelOrigin:", v61);

        }
      }
      v62 = v75;
      if (v75)
      {
        v63 = (unint64_t *)&v75->__shared_owners_;
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v80);
  v65 = v79;
  if (v79)
  {
    v66 = (unint64_t *)&v79->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
LABEL_73:

  return v21;
}

@end
