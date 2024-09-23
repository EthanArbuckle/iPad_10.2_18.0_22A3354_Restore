@implementation VNEspressoHelpers

+ (int)espressoEngineForComputeDevice:(id)a3
{
  unint64_t v3;
  int v4;

  v3 = +[VNComputeDeviceUtilities typeOfComputeDevice:](VNComputeDeviceUtilities, "typeOfComputeDevice:", a3);
  if (v3 == 2)
    v4 = 5;
  else
    v4 = 0;
  if (v3 == 4)
    return 10007;
  else
    return v4;
}

+ (id)pathForEspressoNetworkModelFileWithName:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "pathForEspressoResource:ofType:error:", a3, CFSTR("net"), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v8 = a3;
  v9 = a4;
  +[VNEspressoHelpers _alternatePathForEspressoResource:ofType:error:](VNEspressoHelpers, "_alternatePathForEspressoResource:ofType:error:", v8, v9, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    NSLog(CFSTR("Using alternate resource path = %@"), v10);
    v12 = v11;
  }
  else
  {
    v21 = 0;
    objc_msgSend(a1, "_locateFrameworkBundleForResourceWithName:resourceDirectory:error:", v8, &v21, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (v13)
    {
      objc_msgSend(v13, "pathForResource:ofType:inDirectory:", v8, v9, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (v15)
      {
        v16 = v15;
      }
      else if (a5)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "resourcePath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Unable to locate resource \"%@\" of type \"%@\" in %@"), v8, v9, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (id)_locateFrameworkBundleForResourceWithName:(id)a3 resourceDirectory:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v7 = a3;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a4 != 0, CFSTR("resourceDirectory must point to a valid reference"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("model_opt.espresso")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "bundlePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@/%@"), v10, CFSTR("Frameworks/LoopKitGeneratedKernels.framework/"));

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        *a4 = CFSTR("anod_v3_d3");
        v13 = v12;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      if (!a5)
      {
        v13 = 0;
        goto LABEL_11;
      }
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to locate resource bundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a5)
      {
        v13 = 0;
        goto LABEL_12;
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to locate %@"), v7);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
    *a5 = v15;
    goto LABEL_11;
  }
  VNFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = &stru_1E4549388;
  v13 = v14;
LABEL_13:

  return v13;
}

+ (id)_alternatePathForEspressoResource:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VN_ALTERNATE_MODEL_RESOURCE_PATH"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isReadableFileAtPath:", v12);

    if ((v14 & 1) == 0)
    {

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (int)espressoDeviceIDForComputeDevice:(id)a3
{
  void *v3;
  int v4;

  +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = espresso_device_id_for_metal_device();
  else
    v4 = -1;

  return v4;
}

+ (int)espressoStorageTypeForComputeDevice:(id)a3
{
  unint64_t v3;

  v3 = +[VNComputeDeviceUtilities typeOfComputeDevice:](VNComputeDeviceUtilities, "typeOfComputeDevice:", a3);
  if (v3 - 1 > 3)
    return 0;
  else
    return dword_1A15FB7E0[v3 - 1];
}

+ (id)JSONDataFromNetworkFilePath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  int v11;
  compression_algorithm v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t *v19;
  size_t v20;
  size_t v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if ((unint64_t)objc_msgSend(v7, "length") < 0x1C
      || (v8 = objc_retainAutorelease(v7), v9 = objc_msgSend(v8, "bytes"), *(_BYTE *)v9 != 112)
      || *(_BYTE *)(v9 + 1) != 98
      || *(_BYTE *)(v9 + 2) != 122)
    {
LABEL_17:
      v10 = 0;
      goto LABEL_18;
    }
    v10 = 0;
    v11 = *(char *)(v9 + 3);
    if (v11 > 119)
    {
      if (v11 == 122)
      {
        v12 = COMPRESSION_ZLIB;
      }
      else
      {
        if (v11 != 120)
          goto LABEL_18;
        v12 = COMPRESSION_LZMA;
      }
    }
    else
    {
      if (v11 != 52)
      {
        if (v11 == 101)
        {
          v12 = COMPRESSION_LZFSE;
          goto LABEL_16;
        }
LABEL_18:
        v13 = v7;
        goto LABEL_19;
      }
      v12 = COMPRESSION_LZ4;
    }
LABEL_16:
    if (bswap64(*(_QWORD *)(v9 + 12)) <= 0x80000000)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = (uint8_t *)objc_msgSend(v18, "mutableBytes");
      v20 = objc_msgSend(v18, "length");
      v13 = objc_retainAutorelease(v8);
      v21 = compression_decode_buffer(v19, v20, (const uint8_t *)(objc_msgSend(v13, "bytes") + 28), objc_msgSend(v13, "length") - 28, 0, v12);
      if (v21 == objc_msgSend(v18, "length"))
        v14 = v18;
      else
        v14 = 0;

      if (!v14)
      {
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            a4 = v15;
LABEL_26:

            goto LABEL_27;
          }
          if (!a4)
            goto LABEL_26;
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not interpret network %@"), v5);
          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v16);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        a4 = 0;
        goto LABEL_26;
      }
      v10 = v14;
      v7 = v13;
      v13 = v10;
LABEL_19:

      v14 = v10;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  a4 = 0;
LABEL_27:

  return a4;
}

+ (id)pathForEspressoResourceWithFilename:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathForEspressoResource:ofType:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)weightsFilePathForEspressoNetworkModelFilePath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(a1, "JSONDataFromNetworkFilePath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("storage"), v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v9);

      if (v11)
      {
        objc_msgSend(v6, "stringByDeletingLastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofBlobNamed:(id)a5 forNetworkModelFileWithPath:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  char *v14;
  id v15;
  std::string::size_type size;
  char v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  uint64_t v23;
  int v24;
  int v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  char **v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  BOOL v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  void *__p[2];
  char v40;
  char v41[8];
  char *v42;
  uint64_t v43;
  char *v44;
  std::string v45;
  _QWORD v46[2];
  uint64_t v47;
  _QWORD v48[20];

  v48[19] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = objc_retainAutorelease(v11);
  v14 = (char *)objc_msgSend(v13, "UTF8String");
  v15 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(&v45, (char *)objc_msgSend(v15, "UTF8String"));
  size = HIBYTE(v45.__r_.__value_.__r.__words[2]);
  v17 = HIBYTE(v45.__r_.__value_.__r.__words[2]);
  v18 = (std::string *)v45.__r_.__value_.__r.__words[0];
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v45.__r_.__value_.__l.__size_;
  else
    v18 = &v45;
  v19 = 0uLL;
  if (size)
  {
    v20 = (std::string *)((char *)v18 + size);
    v21 = v18;
    v22 = v20;
    do
    {
      if (v21->__r_.__value_.__s.__data_[0] == 46)
      {
        v23 = 1u;
        while (v23 != 13)
        {
          if ((std::string *)((char *)v21 + v23) == v20)
            goto LABEL_15;
          v24 = v21->__r_.__value_.__s.__data_[v23];
          v25 = aEspressoNet[v23++];
          if (v24 != v25)
            goto LABEL_7;
        }
        v22 = v21;
      }
LABEL_7:
      v21 = (std::string *)((char *)v21 + 1);
    }
    while (v21 != v20);
LABEL_15:
    v26 = 0;
    v27 = 4294967290;
    if (v22 != v20)
    {
      v28 = (char *)v22 - (char *)v18;
      if (v28 != -1)
      {
        std::string::replace(&v45, v28 + 10, 0xFFFFFFFFFFFFFFFFLL, "shape", 5uLL);
        std::ifstream::basic_ifstream(v46);
        std::string::basic_string[abi:ne180100]<0>(__p, "json");
        Espresso::load_network_shape();
        if (v40 < 0)
          operator delete(__p[0]);
        std::string::basic_string[abi:ne180100]<0>(__p, v14);
        v29 = (char **)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>((uint64_t)v41, __p);
        if (&v42 == v29
          && (v29 = (char **)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>((uint64_t)&v43, __p), &v44 == v29))
        {
          v32 = 0uLL;
        }
        else
        {
          v30 = v29[7];
          *(_QWORD *)&v31 = (int)v30;
          *((_QWORD *)&v31 + 1) = SHIDWORD(v30);
          v32 = v31;
        }
        v37 = v32;
        if (v40 < 0)
          operator delete(__p[0]);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v44);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v42);
        v46[0] = *MEMORY[0x1E0DE4F40];
        *(_QWORD *)((char *)v46 + *(_QWORD *)(v46[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
        MEMORY[0x1A1B0A694](&v47);
        std::istream::~istream();
        MEMORY[0x1A1B0A808](v48);
        v27 = 0;
        v26 = 1;
        v17 = HIBYTE(v45.__r_.__value_.__r.__words[2]);
        v19 = v37;
      }
    }
    if ((v17 & 0x80) == 0)
    {
LABEL_26:
      if ((v26 & 1) == 0)
        goto LABEL_27;
      goto LABEL_31;
    }
  }
  else
  {
    v26 = 0;
    v27 = 4294967290;
    if ((*((_BYTE *)&v45.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_26;
  }
  v38 = v19;
  operator delete(v45.__r_.__value_.__l.__data_);
  v19 = v38;
  if ((v26 & 1) == 0)
  {
LABEL_27:
    if (a7)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to introspect %@"), v15);
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v27, v33);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_40:
    v34 = 0;
    goto LABEL_41;
  }
LABEL_31:
  if (!(_QWORD)v19 || !*((_QWORD *)&v19 + 1))
  {
    if (a7)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("blob \"%@\" was not found in %@"), v13, v15);
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v35);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_40;
  }
  if (a3)
    *a3 = v19;
  if (a4)
    *a4 = *((_QWORD *)&v19 + 1);
  v34 = 1;
LABEL_41:

  return v34;
}

+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 memoryPoolId:(unint64_t)a10 espressoResources:(id *)a11 error:(id *)a12
{
  uint64_t v14;
  _BOOL8 v15;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;

  v14 = *(_QWORD *)&a6;
  v15 = a5;
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  LODWORD(v24) = objc_msgSend(a1, "espressoStorageTypeForComputeDevice:", v19);
  LOBYTE(v14) = objc_msgSend(a1, "createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:explicitNetworkLayersStorageType:memoryPoolId:espressoResources:error:", v18, v19, v15, v14, v20, v21, v22, v24, a10, a11, a12);

  return v14;
}

+ (BOOL)createSingleNetworkPlanFromModelPath:(id)a3 forComputeDevice:(id)a4 lowPriorityMode:(BOOL)a5 priority:(int)a6 inputBlobNames:(id)a7 outputBlobNames:(id)a8 networkConfiguration:(id)a9 explicitNetworkLayersStorageType:(int)a10 memoryPoolId:(unint64_t)a11 espressoResources:(id *)a12 error:(id *)a13
{
  id v17;
  uint64_t context;
  id v19;
  BOOL v20;
  uint64_t plan;
  uint64_t v22;
  id v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id obj;
  id obja;
  VNEspressoResources *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v51 = a4;
  v49 = a7;
  v48 = a8;
  v50 = a9;
  if (!v17 || !a12)
  {
    if (a13)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid inputs specified to inference plan builder"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v20 = 0;
      *a13 = v19;
      goto LABEL_19;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  objc_msgSend(a1, "espressoEngineForComputeDevice:", v51);
  objc_msgSend(a1, "espressoDeviceIDForComputeDevice:", v51);
  context = espresso_create_context();
  if (!context)
  {
    if (a13)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not create inference context"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  plan = espresso_create_plan();
  v22 = plan;
  if (!plan)
  {
    if (a13)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not create inference plan"));
      *a13 = (id)objc_claimAutoreleasedReturnValue();
    }
    espresso_context_destroy();
    goto LABEL_18;
  }
  v60 = 0;
  v61 = 0;
  v23 = objc_retainAutorelease(v17);
  objc_msgSend(v23, "UTF8String");
  if (espresso_plan_add_network())
  {
    if (a13)
    {
      +[VNError errorForFailedEspressoPlan:localizedDescription:](VNError, "errorForFailedEspressoPlan:localizedDescription:", v22, CFSTR("Could not create/add network to inference plan"));
      *a13 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    espresso_plan_destroy();
    espresso_context_destroy();
    goto LABEL_18;
  }
  if (v50)
  {
    v25 = objc_retainAutorelease(v50);
    objc_msgSend(v25, "UTF8String");
    v26 = espresso_network_select_configuration();
    if ((_DWORD)v26)
    {
      if (a13)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not set network configuration: %@"), v25);
        +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v26, v27);
        *a13 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
  }
  if (a11)
  {
    v28 = espresso_network_set_memory_pool_id();
    if ((_DWORD)v28)
    {
      if (a13)
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not select memory pool %llu"), a11);
        +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v28, v29);
        *a13 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_18;
    }
  }
  if (!espresso_plan_get_phase())
  {
    v43 = espresso_plan_set_priority();
    if ((_DWORD)v43)
    {
      if (!a13)
        goto LABEL_18;
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v43, CFSTR("unable to set client specified plan priority"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v47 = -[VNEspressoResources initWithModelPath:networkConfigurationName:network:plan:context:]([VNEspressoResources alloc], "initWithModelPath:networkConfigurationName:network:plan:context:", v23, v50, v60, v61, v22, context);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v49;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v57 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[VNEspressoResources network](v47, "network");
        v34 = objc_retainAutorelease(v33);
        objc_msgSend(v34, "UTF8String");
        v35 = espresso_network_declare_input();
        if ((_DWORD)v35)
        {
          if (a13)
          {
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not declare network input buffer: %@"), v34);
            +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v35, v42);
            *a13 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_57;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v30)
        continue;
      break;
    }
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obja = v48;
  v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v53;
    while (2)
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(obja);
        v39 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        -[VNEspressoResources network](v47, "network");
        v40 = objc_retainAutorelease(v39);
        objc_msgSend(v40, "UTF8String");
        v41 = espresso_network_declare_output();
        if ((_DWORD)v41)
        {
          if (a13)
          {
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not declare network output buffer: %@"), v40);
            +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v41, v44);
            *a13 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_57;
        }
      }
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v36)
        continue;
      break;
    }
  }

  -[VNEspressoResources plan](v47, "plan");
  if (espresso_plan_build())
  {
    if (a13)
    {
      +[VNError errorForFailedEspressoPlan:localizedDescription:](VNError, "errorForFailedEspressoPlan:localizedDescription:", -[VNEspressoResources plan](v47, "plan"), CFSTR("Could not build inference plan"));
      v20 = 0;
      *a13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_57:
      v20 = 0;
    }
  }
  else
  {
    *a12 = objc_retainAutorelease(v47);
    v20 = 1;
  }

LABEL_19:
  return v20;
}

+ (__CVBuffer)createCVPixelBufferWithPixelFormat:(unsigned int)a3 fromImageInEspressoBuffer:(id *)a4 error:(id *)a5
{
  __CVBuffer *v7;
  void *v8;

  if (a3 != 1278226534 || a4->var14 != 65568)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported pixel format %lu; espresso storaget type %u"),
        a3,
        a4->var14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v7 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4->var4, a4->var5, 1278226534, a5);
  if (v7
    && (+[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, a4->var4, a4->var5, 1278226534, (int *)a4->var0, v7, a5) & 1) == 0)
  {
    CVPixelBufferRelease(v7);
    return 0;
  }
  return v7;
}

+ (BOOL)renderEspressoBufferImage:(id *)a3 intoCVPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  void *v6;

  if (a3->var14 != 65568)
    return +[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, a3->var4, a3->var5, 1278226534, (int *)a3->var0, a4, a5);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported espresso storaget type %u"), a4, 65568);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (unint64_t)pixelValueSizeInBytesForBuffer:(id *)a3 error:(id *)a4
{
  int var14;
  unint64_t result;
  int v7;
  id v8;

  if (!a3)
    goto LABEL_9;
  var14 = a3->var14;
  result = 4;
  if (var14 > 131103)
  {
    if (var14 == 131104)
      return result;
    v7 = 262152;
  }
  else
  {
    if (var14 == 65568)
      return result;
    v7 = 131080;
  }
  if (var14 == v7)
    return 1;
LABEL_9:
  if (!a4)
    return 0;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unknown inference buffer type"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v8;
  return result;
}

+ (BOOL)feedForwardEspressoBufferForNetwork:(id *)a3 fromBufferWithName:(id)a4 toBufferWithName:(id)a5 firstFrame:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *__dst;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *__src;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  if (!a3)
  {
    if (a7)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("inference network cannot be nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v14 = espresso_network_bind_buffer();
  if ((_DWORD)v14)
  {
    if (a7)
    {
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v14, CFSTR("Could not bind output buffer to network"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v19 = 0;
      *a7 = v15;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  v16 = espresso_network_bind_buffer();
  if ((_DWORD)v16)
  {
    if (a7)
    {
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v16, CFSTR("Could not bind input buffer to network"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v27 != v22 || v28 != v23 || v29 != v24 || v30 != v25)
  {
    if (a7)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Could not feed-forward buffer data because of compatibility of source and destination buffers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v17 = objc_msgSend(a1, "pixelValueSizeInBytesForBuffer:error:", &__src, a7);
  if (!v17)
    goto LABEL_20;
  v18 = v27 * v17 * v28 * v29;
  if (v8)
    bzero(__dst, v18 * v30);
  else
    memcpy(__dst, __src, v18 * v30);
  v19 = 1;
LABEL_21:

  return v19;
}

@end
