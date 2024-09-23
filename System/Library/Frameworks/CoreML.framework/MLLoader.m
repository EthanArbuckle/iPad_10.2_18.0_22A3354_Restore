@implementation MLLoader

+ (id)_loadWithModelLoaderFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v28;
  id v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  id *v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v8 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v31 = 0;
  v29 = 0;
  v30 = 0;
  v14 = +[MLArchivingUtils parseModelArchive:modelType:compilerVersion:modelVersion:error:](MLArchivingUtils, "parseModelArchive:modelType:compilerVersion:modelVersion:error:", a3, &v31, &v30, &v29, a7);
  v15 = v30;
  v16 = v29;
  if (v14)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModelType:", v17);

      objc_msgSend(v15, "versionNumberString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCompilerVersion:", v18);

      objc_msgSend(v16, "versionNumberString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModelVersion:", v19);

    }
    +[MLModelTypeRegistry sharedInstance](MLModelTypeRegistry, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "classesForLoadingModelType:configuration:isUpdatable:isEncrypted:", v31, v12, v8, (*(uint64_t (**)(_QWORD))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(a1, "_loadModelFromArchive:configuration:modelVersion:compilerVersion:loaderEvent:useUpdatableModelLoaders:loadingClasses:error:", a3, v12, v16, v15, v13, v8, v21, a7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = v22;
        a7 = v23;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      v23 = 0;
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = MLModelType_Name(v31);
        *(_DWORD *)buf = 136315138;
        v35 = v28;
        _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "No known class for loading model type %s", buf, 0xCu);
      }

      if (!a7)
        goto LABEL_15;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No known class for loading model type %s"), MLModelType_Name(v31));
      v23 = (id *)objc_claimAutoreleasedReturnValue();
      v33 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v26);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    a7 = 0;
    goto LABEL_14;
  }
  a7 = 0;
LABEL_16:

  return a7;
}

+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  id v27;
  std::string *p_buf;
  void *v29;
  void *v30;
  void *v31;
  uint64_t hasNestedArchive;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  std::string::size_type v36;
  std::string::size_type v37;
  os_signpost_id_t spid;
  id v40;
  id v41;
  int v42;
  void *__p[2];
  char v44;
  std::string buf;
  uint64_t v46;
  uint64_t v47;

  v8 = a6;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "extractAndSetModelDetailsFromArchive:", a3);
  objc_msgSend(a1, "_conformConfiguration:usingModelArchive:", v12, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "parentModelName");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelDisplayName");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v15, "allowsInstrumentation");
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v16);

  if (v42)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_19C486000, v18, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MLModel_Load", "Model-name:%{public}sParent-model-name:%{public}s", (uint8_t *)&buf, 0x16u);
    }

  }
  v19 = mach_absolute_time();
  objc_msgSend(a1, "_findCodedObjectURLInModelArchive:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    +[MLLoader _unarchiveCodedModelObjectAtURL:error:](MLLoader, "_unarchiveCodedModelObjectAtURL:error:", v20, a7);
  else
    objc_msgSend(a1, "_loadWithModelLoaderFromArchive:configuration:loaderEvent:useUpdatableModelLoaders:error:", a3, v15, v14, v8, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0C99E98];
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = *(_QWORD *)a3;
    if (*(char *)(*(_QWORD *)a3 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)(v24 + 8), *(_QWORD *)(v24 + 16));
    }
    else
    {
      v25 = *(_OWORD *)(v24 + 8);
      buf.__r_.__value_.__r.__words[2] = *(_QWORD *)(v24 + 24);
      *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v25;
    }
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(v23, "stringWithUTF8String:", p_buf);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURLWithPath:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    objc_msgSend(v21, "modelDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setModelURL:", v30);

    std::string::basic_string[abi:ne180100]<0>(__p, "updateParameters");
    hasNestedArchive = IArchive::hasNestedArchive(a3, __p);
    if (v44 < 0)
      operator delete(__p[0]);
    objc_msgSend(v21, "modelDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIsUpdatable:", hasNestedArchive);

    objc_msgSend(v21, "enableInstrumentsTracingIfNeeded");
    v26 = objc_msgSend(v21, "signpostID");
    if (v14)
      objc_msgSend(a1, "_populateLoaderAndPredictionEvent:model:configuration:loadTimeDuration:", v14, v21, v15, mach_absolute_time() - v19);
    v27 = v21;

  }
  else
  {
    v26 = 0;
    v27 = 0;
  }

  if (v42)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v36 = objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
      v37 = objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446722;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v36;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v37;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
      v46 = v26;
      _os_signpost_emit_with_name_impl(&dword_19C486000, v35, OS_SIGNPOST_INTERVAL_END, spid, "MLModel_Load", "Model-name:%{public}sParent-model-name:%{public}sModel-id:%llu", (uint8_t *)&buf, 0x20u);
    }

  }
  return v27;
}

+ (void)_populateLoaderAndPredictionEvent:(id)a3 model:(id)a4 configuration:(id)a5 loadTimeDuration:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  mach_timebase_info info;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "computeUnits"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setComputeUnits:", v11);

  objc_msgSend(v8, "modelName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "modelDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modelURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByDeletingPathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setModelName:", v16);

  }
  objc_msgSend(v9, "modelDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "modelDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "modelOriginNumberFromUserDefinedDictionary:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setModelOrigin:", v25);

  }
  mach_timebase_info(&info);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", ((unint64_t)(info.numer / info.denom) + 999999) / 0xF4240);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModelLoadTime:", v26);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBundleIdentifier:", v28);
  objc_msgSend(v8, "setFirstPartyExecutable:", &unk_1E3DA21A0);
  if (objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.")))
    objc_msgSend(v8, "setFirstPartyExecutable:", &unk_1E3DA2188);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "processName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProcessName:", v30);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "modelName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionEvent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setModelName:", v31);

    objc_msgSend(v8, "firstPartyExecutable");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionEvent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFirstPartyExecutable:", v33);

    objc_msgSend(v8, "modelType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setModelType:", v35);

    objc_msgSend(v8, "bundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionEvent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBundleIdentifier:", v37);

  }
}

+ (id)_conformConfiguration:(id)a3 usingModelArchive:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  std::string *p_p;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  std::string __p;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = *(_QWORD *)a4;
  if (*(char *)(*(_QWORD *)a4 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v8 + 8), *(_QWORD *)(v8 + 16));
  }
  else
  {
    v9 = *(_OWORD *)(v8 + 8);
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v8 + 24);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v7, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "allowsInstrumentation");
  v14 = objc_retainAutorelease(v12);
  objc_msgSend(v6, "setAllowsInstrumentation:", MLLoggingAllowsInstrumentation(v13, (const char *)objc_msgSend(v14, "fileSystemRepresentation")));
  objc_msgSend(v6, "modelDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)a4 + 56))(*(_QWORD *)a4) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unnamed_Model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "URLByDeletingPathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "setModelDisplayName:", v16);

  }
  return v6;
}

+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loaderEvent:(id)a7 useUpdatableModelLoaders:(BOOL)a8 loadingClasses:(id)a9 error:(id *)a10
{
  __CFString *v10;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  objc_class *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  std::string *v27;
  const __CFString *v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  std::string *p_buf;
  id v43;
  uint64_t v44;
  id obj;
  _BOOL4 v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  std::string v57;
  std::string buf;
  const __CFString *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _BYTE v69[128];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;

  v46 = a8;
  v79 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  v48 = a5;
  v49 = a6;
  v50 = a7;
  v43 = a9;
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)a3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)a3 + 32));
  std::istream::tellg();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v43;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (!v16)
  {

    v22 = 0;
    v17 = 0;
    goto LABEL_52;
  }
  v17 = 0;
  v18 = *(_QWORD *)v54;
  v44 = *MEMORY[0x1E0CB3388];
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v54 != v18)
        objc_enumerationMutation(obj);
      v20 = *(objc_class **)(*((_QWORD *)&v53 + 1) + 8 * i);

      IArchive::rewind((uint64_t)a3);
      (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)a3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)a3 + 32));
      v66 = v76;
      v67 = v77;
      v68 = v78;
      v62 = v72;
      v63 = v73;
      v64 = v74;
      v65 = v75;
      v60 = v70;
      v61 = v71;
      std::istream::seekg();
      if (v46)
      {
        v52 = 0;
        v21 = (id *)&v52;
        objc_msgSend(a1, "_loadUpdatableModelWithClass:fromArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", v20, a3, v48, v49, v47, &v52);
      }
      else
      {
        v51 = 0;
        v21 = (id *)&v51;
        objc_msgSend(a1, "_loadModelWithClass:fromArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", v20, a3, v48, v49, v47, &v51);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v21;
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "predictionTypeForKTrace"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setModelEngineType:", v36);

        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          NSStringFromClass(v20);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = *(_QWORD *)a3;
          if (*(char *)(*(_QWORD *)a3 + 31) < 0)
          {
            std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)(v39 + 8), *(_QWORD *)(v39 + 16));
          }
          else
          {
            v40 = *(_OWORD *)(v39 + 8);
            buf.__r_.__value_.__r.__words[2] = *(_QWORD *)(v39 + 24);
            *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v40;
          }
          p_buf = &buf;
          if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
          LODWORD(v57.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)v57.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v57.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v57.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_buf;
          _os_log_impl(&dword_19C486000, v37, OS_LOG_TYPE_INFO, "%@ class has successfully loaded the model at %s.", (uint8_t *)&v57, 0x16u);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);

        }
        goto LABEL_49;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        NSStringFromClass(v20);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)a3;
        if (*(char *)(*(_QWORD *)a3 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v57, *(const std::string::value_type **)(v25 + 8), *(_QWORD *)(v25 + 16));
        }
        else
        {
          v26 = *(_OWORD *)(v25 + 8);
          v57.__r_.__value_.__r.__words[2] = *(_QWORD *)(v25 + 24);
          *(_OWORD *)&v57.__r_.__value_.__l.__data_ = v26;
        }
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v27 = &v57;
        else
          v27 = (std::string *)v57.__r_.__value_.__r.__words[0];
        if (v17)
        {
          objc_msgSend(v17, "localizedDescription");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v28 = v10;
        }
        else
        {
          v28 = CFSTR("Unknown Failure");
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v24;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v27;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
        v59 = v28;
        _os_log_impl(&dword_19C486000, v23, OS_LOG_TYPE_INFO, "%@ class was unable to load the model at %s with error: %@; The model loader is going to use another class.",
          (uint8_t *)&buf,
          0x20u);
        if (v17)

        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v57.__r_.__value_.__l.__data_);

      }
      if (v17)
        v29 = v50 != 0;
      else
        v29 = 0;
      if (v29)
      {
        objc_msgSend(v17, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.CoreML"));

        if (v31)
        {
          if (objc_msgSend(v17, "code") == 70)
          {
            objc_msgSend(v17, "userInfo");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v44);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v33, "code"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setModelProgramValidationError:", v34);
          }
          else
          {
            if (objc_msgSend(v17, "code") != 71)
              continue;
            objc_msgSend(v17, "userInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v44);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v33, "code"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setModelProgramParsingError:", v34);
          }

        }
      }
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    if (v16)
      continue;
    break;
  }
  v22 = 0;
LABEL_49:

  if (a10 && v17)
  {
    v17 = objc_retainAutorelease(v17);
    *a10 = v17;
  }
LABEL_52:

  return v22;
}

+ (id)_loadModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  MLDelegateModel *v24;
  id v25;
  MLDelegateModel *v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v15, "functionName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (objc_class *)objc_opt_class();

    if (v17 != a3)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
      }

      if (a8)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v21);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_26;
    }
  }
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE438F20))
  {
    v22 = a3;
    -[objc_class loadModelFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](v22, "loadModelFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a4, v13, v14, v15, a8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_26;
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[MLDelegateModel initWithEngine:error:]([MLDelegateModel alloc], "initWithEngine:error:", v23, a8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v33;
          _os_log_error_impl(&dword_19C486000, v27, OS_LOG_TYPE_ERROR, "Logic error: engine is not a MLModel, but it is %@.", buf, 0xCu);

        }
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Logic error: engine is not a MLModel, but it is %@."), v30);

        v26 = 0;
        goto LABEL_23;
      }
      v24 = v23;
    }
    v26 = v24;
LABEL_23:

    goto LABEL_27;
  }
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE436810))
  {
    +[MLModelIOUtils loadFromModelSpecificationInArchive:withClass:versionInfo:configuration:error:](MLModelIOUtils, "loadFromModelSpecificationInArchive:withClass:versionInfo:configuration:error:", a4, a3, v13, v15, a8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      goto LABEL_12;
    if (!a8 || *a8)
      goto LABEL_26;
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to load model"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a8)
    {
LABEL_26:
      v26 = 0;
      goto LABEL_27;
    }
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Loading class must conform to serializable protocols"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 0;
  *a8 = v25;
LABEL_27:

  return v26;
}

+ (id)loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLLoaderEvent *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MLLoaderEvent);
  v18 = 0;
  objc_msgSend(a1, "_loadModelFromAssetAtURL:configuration:loaderEvent:error:", v8, v9, v10, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    -[MLLoaderEvent setModelLoadError:](v10, "setModelLoadError:", &unk_1E3DA21B8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLLoaderEvent setModelLoadError:](v10, "setModelLoadError:", v15);

  }
  +[MLReporter reporter](MLReporter, "reporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMetric:", v10);

  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v11;
}

+ (id)_loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 loaderEvent:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *__p[2];
  char v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  char *v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (+[MLLoader checkAssetPath:error:](MLLoader, "checkAssetPath:error:", v10, a6))
  {
    v25 = 0;
    v13 = objc_msgSend(a1, "_createDecryptSessionForModelAtURL:configuration:decryptSession:loaderEvent:error:", v10, v11, &v25, v12, a6);
    v14 = v25;
    if ((v13 & 1) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
      IArchive::IArchive(&v22, (uint64_t)__p, 0);
      if (v21 < 0)
        operator delete(__p[0]);
      objc_msgSend(a1, "_loadModelFromArchive:configuration:loaderEvent:useUpdatableModelLoaders:error:", &v22, v11, v12, 0, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v24);
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
      objc_msgSend(v15, "setDecryptSession:", v14);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)checkAssetPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
    {
      v17 = 0;
      v7 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v17);
      v8 = v17;
      if (a4)
        v9 = v7;
      else
        v9 = 1;
      if ((v9 & 1) == 0)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v8, CFSTR("Invalid URL for .mlmodel."));
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_17;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "URL is not a file:// URL: %@", buf, 0xCu);
    }

    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL is not a file:// URL: %@"), v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "nil value for URL", buf, 2u);
  }

  if (!a4)
    goto LABEL_18;
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v22 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nil value for URL"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v12);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  v7 = 0;
LABEL_17:

LABEL_19:
  return v7;
}

+ (BOOL)_createDecryptSessionForModelAtURL:(id)a3 configuration:(id)a4 decryptSession:(id *)a5 loaderEvent:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = +[MLKeyManager isModelEncrypted:](MLKeyManager, "isModelEncrypted:", v11);
  v15 = v14;
  if (v13)
  {
    if (v14)
      v16 = &unk_1E3DA2188;
    else
      v16 = &unk_1E3DA21A0;
    objc_msgSend(v13, "setModelIsEncrypted:", v16);
  }
  if (v15 && (objc_msgSend(v12, "usePreloadedKey") & 1) == 0)
  {
    +[MLKeyManager decryptSessionForModelAtURL:error:](MLKeyManager, "decryptSessionForModelAtURL:error:", v11, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v17 = v18 != 0;
    if (v18)
      *a5 = objc_retainAutorelease(v18);

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

+ (id)_findCodedObjectURLInModelArchive:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLArchivingUtils codedObjectURLFromInputArchiver:](MLArchivingUtils, "codedObjectURLFromInputArchiver:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  if (v7)
    v8 = v5;
  else
    v8 = 0;

  return v8;
}

+ (id)loadModelFromAssetAtURL:(id)a3 error:(id *)a4
{
  id v5;
  MLModelConfiguration *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(MLModelConfiguration);
  +[MLLoader loadModelFromAssetAtURL:configuration:error:](MLLoader, "loadModelFromAssetAtURL:configuration:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadModelAssetDescriptionFromAssetAtURL:(id)a3 error:(id *)a4
{
  id v6;
  MLModelConfiguration *v7;
  char v8;
  id v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *__p[2];
  char v16;
  id v17;
  uint64_t buf;
  std::__shared_weak_count *v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (+[MLLoader checkAssetPath:error:](MLLoader, "checkAssetPath:error:", v6, a4))
  {
    v7 = objc_alloc_init(MLModelConfiguration);
    v17 = 0;
    v8 = objc_msgSend(a1, "_createDecryptSessionForModelAtURL:configuration:decryptSession:loaderEvent:error:", v6, v7, &v17, 0, a4);
    v9 = v17;
    if ((v8 & 1) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"));
      IArchive::IArchive(&buf, (uint64_t)__p, 0);
      if (v16 < 0)
        operator delete(__p[0]);
      objc_msgSend(a1, "loadModelAssetDescriptionFromArchive:error:", &buf, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v20);
      v11 = v19;
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)loadModelAssetDescriptionFromArchive:(void *)a3 error:(id *)a4
{
  _QWORD *v4;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v18;
  id v19;
  id v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v19 = 0;
  v20 = 0;
  v7 = +[MLArchivingUtils parseModelArchive:modelType:compilerVersion:modelVersion:error:](MLArchivingUtils, "parseModelArchive:modelType:compilerVersion:modelVersion:error:", a3, &v21, &v20, &v19, a4);
  v8 = v20;
  v9 = v19;
  if (v7)
  {
    +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelTypeRegistry sharedInstance](MLModelTypeRegistry, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classesForLoadingModelType:configuration:isUpdatable:isEncrypted:", v21, v10, 0, (*(uint64_t (**)(_QWORD))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(a1, "_loadModelAssetDescriptionFromArchive:configuration:modelVersion:compilerVersion:loadingClasses:error:", a3, v10, v9, v8, v12, v4);
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v18 = MLModelType_Name(v21);
        *(_DWORD *)buf = 136315138;
        v25 = v18;
        _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "No known class for loading model type %s", buf, 0xCu);
      }

      if (v4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No known class for loading model type %s"), MLModelType_Name(v21));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v16);
        *v4 = (id)objc_claimAutoreleasedReturnValue();

        v4 = 0;
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)loadUpdatableModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  char v20;
  uint8_t buf[4];
  _BYTE v22[12];
  char *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(a1, "checkAssetPath:error:", v8, a5) & 1) == 0)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  if (+[MLKeyManager isModelEncrypted:](MLKeyManager, "isModelEncrypted:", v8))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v22 = v8;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Updating encrypted model %@ is not supported.", buf, 0xCu);
    }

    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating encrypted model %@ is not supported."), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 9, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"));
  IArchive::IArchive((uint64_t *)buf, (uint64_t)__p, 0);
  if (v20 < 0)
    operator delete(__p[0]);
  objc_msgSend(a1, "loadUpdatableModelFromArchive:configuration:error:", buf, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v23);
  v16 = *(std::__shared_weak_count **)&v22[4];
  if (*(_QWORD *)&v22[4])
  {
    v17 = (unint64_t *)(*(_QWORD *)&v22[4] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_8:

  return v14;
}

+ (id)_unarchiveCodedModelObjectAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 2, &v28);
  v7 = v28;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;

    if (v11)
    {
      v13 = v11;
      v7 = v12;
      a4 = v13;
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v5;
        v36 = 2112;
        v37 = v26;
        _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Failed to unarchive model at %@ with error: %@", buf, 0x16u);

      }
      if (a4)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "localizedDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to unarchive model at %@ with error: %@"), v5, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v23);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        a4 = 0;
      }
      else
      {
        v13 = 0;
      }
      v7 = v12;
    }
    goto LABEL_14;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v5;
    v36 = 2112;
    v37 = v25;
    _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Failed to open coded model at %@ with error: %@", buf, 0x16u);

  }
  if (a4)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Failed to open coded model at %@ with error: %@"), v5, v10);
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_14:

  }
  return a4;
}

+ (id)_loadUpdatableModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  void *v17;
  MLDelegateUpdatableModel *v18;
  NSObject *v19;
  void *v20;
  MLDelegateUpdatableModel *v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE43B770) & 1) != 0)
  {
    v16 = a3;
    -[objc_class loadModelFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](v16, "loadModelFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a4, v13, v14, v15, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v21 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[MLDelegateUpdatableModel initWithEngine:error:]([MLDelegateUpdatableModel alloc], "initWithEngine:error:", v17, a8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v27;
          _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "Logic error: engine is not a MLModel, but it is %@.", buf, 0xCu);

        }
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Logic error: engine is not a MLModel, but it is %@."), v25);

        v21 = 0;
        goto LABEL_16;
      }
      v18 = v17;
      v17 = v18;
    }
    v21 = v18;
LABEL_16:

LABEL_18:
    goto LABEL_19;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Selected model loader does not support updatable models.", buf, 2u);
  }

  if (a8)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selected model loader does not support updatable models."));
    v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v17);
    v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

+ (id)loadModelFromArchive:(void *)a3 error:(id *)a4
{
  MLModelConfiguration *v6;
  void *v7;

  v6 = objc_alloc_init(MLModelConfiguration);
  +[MLLoader loadModelFromArchive:configuration:error:](MLLoader, "loadModelFromArchive:configuration:error:", a3, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  MLLoaderEvent *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v17;

  v8 = a4;
  v9 = objc_alloc_init(MLLoaderEvent);
  v17 = 0;
  objc_msgSend(a1, "_loadModelFromArchive:configuration:loaderEvent:useUpdatableModelLoaders:error:", a3, v8, v9, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (v13)
  {
    -[MLLoaderEvent setModelLoadError:](v9, "setModelLoadError:", &unk_1E3DA21B8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLLoaderEvent setModelLoadError:](v9, "setModelLoadError:", v14);

  }
  +[MLReporter reporter](MLReporter, "reporter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logMetric:", v9);

  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v10;
}

+ (id)loadUpdatableModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "_loadModelFromArchive:configuration:loaderEvent:useUpdatableModelLoaders:error:", a3, a4, 0, 1, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_loadModelAssetDescriptionFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loadingClasses:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  MLModelAssetDescription *v20;
  void *v21;
  MLModelAssetDescription *v22;
  void *v23;
  id v25;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v29 = a4;
  v30 = a5;
  v12 = a6;
  v13 = a7;
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)a3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)a3 + 32));
  std::istream::tellg();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v14)
  {
    v25 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);

        IArchive::rewind((uint64_t)a3);
        (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)a3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)a3 + 32));
        v43 = v53;
        v44 = v54;
        v45 = v55;
        v39 = v49;
        v40 = v50;
        v41 = v51;
        v42 = v52;
        v37 = v47;
        v38 = v48;
        std::istream::seekg();
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EE438DD8, v25))
        {
          v19 = v18;
          v32 = 0;
          objc_msgSend(v19, "loadModelAssetDescriptionFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v30, v12, v29, &v32);
          v20 = (MLModelAssetDescription *)objc_claimAutoreleasedReturnValue();
          v15 = v32;

          if (v20)
            goto LABEL_15;
        }
        else
        {
          v31 = 0;
          objc_msgSend(a1, "_loadModelWithClass:fromArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", v18, a3, v30, v12, v29, &v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v31;
          if (v21)
          {
            v22 = [MLModelAssetDescription alloc];
            objc_msgSend(v21, "modelDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[MLModelAssetDescription initWithRawModelDescription:](v22, "initWithRawModelDescription:", v23);

            goto LABEL_15;
          }
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      if (v14)
        continue;
      break;
    }
    v20 = 0;
LABEL_15:

    if (a8 && v15)
    {
      v15 = objc_retainAutorelease(v15);
      *a8 = v15;
    }
  }
  else
  {

    v20 = 0;
    v15 = 0;
  }

  return v20;
}

@end
