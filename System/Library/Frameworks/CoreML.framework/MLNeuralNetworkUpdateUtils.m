@implementation MLNeuralNetworkUpdateUtils

+ (BOOL)loadUpdateParameters:(void *)a3 fromCompiledArchive:(void *)a4 error:(id *)a5
{
  char hasNestedArchive;
  char v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  void *v17[2];
  char v18;
  _QWORD v19[3];
  char v20;
  void *__p;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void (***v25)(google::protobuf::io::IstreamInputStream *__hidden);
  int v26[4];
  uint64_t v27;
  uint64_t v28;
  int v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(google::protobuf::io::IstreamInputStream *__hidden);
  void (**v34)(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *__hidden);
  uint64_t v35;
  _QWORD v36[2];
  __int16 v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  std::string::basic_string[abi:ne180100]<0>(&v33, "updateParameters");
  hasNestedArchive = IArchive::hasNestedArchive(a4, &v33);
  v9 = hasNestedArchive;
  if (SHIBYTE(v35) < 0)
  {
    operator delete(v33);
    if ((v9 & 1) != 0)
      goto LABEL_3;
LABEL_8:
    if (!a5)
      return 0;
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to unarchive update parameters. Model should be re-compiled."));
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    return v15;
  }
  if ((hasNestedArchive & 1) == 0)
    goto LABEL_8;
LABEL_3:
  std::string::basic_string[abi:ne180100]<0>(v17, "NetworkUpdateParameters");
  std::string::basic_string[abi:ne180100]<0>(&v33, "updateParameters");
  v10 = IArchive::nestedArchive(a4, (uint64_t)&v33);
  if (SHIBYTE(v35) < 0)
    operator delete(v33);
  v11 = IArchive::nestedArchive(v10, (uint64_t)v17);
  v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v11 + 32) + 16))(*(_QWORD *)(*(_QWORD *)v11 + 32));
  v33 = &off_1E3D598A0;
  v34 = &off_1E3D59870;
  v35 = v12;
  v36[0] = &off_1E3D59950;
  v36[1] = &v34;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v41 = 0;
  v40 = 0x2000;
  v23 = 0;
  v24 = 0;
  v25 = &v33;
  *(_QWORD *)v26 = 0;
  *(_QWORD *)((char *)&v26[1] + 2) = 0;
  v27 = 0x7FFFFFFFLL;
  v28 = 0x647FFFFFFFLL;
  v29 = 100;
  v30 = 1;
  v31 = 0;
  v32 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v23);
  LODWORD(v28) = 0x7FFFFFFF;
  v13 = v24 + SHIDWORD(v27);
  v24 = v13;
  v14 = v26[0] - v27;
  if (v26[0] <= (int)v27)
    v14 = 0;
  else
    v24 = v13 - v14;
  HIDWORD(v27) = v14;
  if ((google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)a3, (google::protobuf::io::CodedInputStream *)&v23) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v19[0] = 5;
    std::operator+<char>();
    if (v22 < 0)
      operator delete(__p);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v23);
  v33 = &off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v36);
  if (v18 < 0)
    operator delete(v17[0]);
  v15 = (v19[0] & 0xFFFFFFEF) == 0;
  if (a5 && (v19[0] & 0xFFFFFFEF) != 0)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to unarchive update parameters."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v20 < 0)
    operator delete((void *)v19[1]);
  return v15;
}

+ (id)loadParameterDescriptionsAndContainerFromUpdateParameters:(const void *)a3 modelDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  const CoreML::Specification::Optimizer *v20;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v21;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v22;
  uint64_t *v23;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v24;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v31;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v32;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  void *v37;
  void *v38;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v39;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v40;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  void *v45;
  void *v46;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v47;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v48;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  void *v53;
  void *v54;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v55;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v56;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  void *v61;
  void *v62;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v63;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v64;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  void *v69;
  void *v70;
  uint64_t *v71;
  uint64_t *v72;
  void *v73;
  void *v74;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v75;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v76;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  void *v81;
  void *v82;
  void *v83;
  _BYTE v85[16];
  uint64_t *v86;
  int v87;

  v5 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((_QWORD *)a3 + 6))
  {
    +[MLParameterKey epochs](MLParameterKey, "epochs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)a3 + 6))
      v9 = (uint64_t *)*((_QWORD *)a3 + 6);
    else
      v9 = &CoreML::Specification::_Int64Parameter_default_instance_;
    +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  +[MLParameterKey epochs](MLParameterKey, "epochs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((_QWORD *)a3 + 7))
  {
    +[MLParameterKey shuffle](MLParameterKey, "shuffle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)a3 + 7))
      v13 = (uint64_t *)*((_QWORD *)a3 + 7);
    else
      v13 = &CoreML::Specification::_BoolParameter_default_instance_;
    +[MLParameterDescription parameterDescriptionForKey:BOOLParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:BOOLParameterSpec:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

  }
  +[MLParameterKey shuffle](MLParameterKey, "shuffle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v15);

  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((_QWORD *)a3 + 8))
  {
    +[MLParameterKey seed](MLParameterKey, "seed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)a3 + 8))
      v17 = (uint64_t *)*((_QWORD *)a3 + 8);
    else
      v17 = &CoreML::Specification::_Int64Parameter_default_instance_;
    +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v18);

  }
  +[MLParameterKey seed](MLParameterKey, "seed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v19);

  if (*((_QWORD *)a3 + 5))
    v20 = (const CoreML::Specification::Optimizer *)*((_QWORD *)a3 + 5);
  else
    v20 = (const CoreML::Specification::Optimizer *)&CoreML::Specification::_Optimizer_default_instance_;
  CoreML::Specification::Optimizer::Optimizer((CoreML::Specification::Optimizer *)v85, v20);
  if (v87 == 10)
  {
    if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[2])
    {
      +[MLParameterKey learningRate](MLParameterKey, "learningRate");
      v24 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v87 == 10)
      {
        v26 = v86;
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v24);
        v26 = &CoreML::Specification::_SGDOptimizer_default_instance_;
      }
      v35 = (uint64_t *)v26[2];
      if (v35)
        v36 = v35;
      else
        v36 = &CoreML::Specification::_DoubleParameter_default_instance_;
      +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v25, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v37);

    }
    +[MLParameterKey learningRate](MLParameterKey, "learningRate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v38);

    if (v87 == 10)
    {
      if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[3])
      {
        +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
        v40 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v87 == 10)
        {
          v42 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v40);
          v42 = &CoreML::Specification::_SGDOptimizer_default_instance_;
        }
        v51 = (uint64_t *)v42[3];
        if (v51)
          v52 = v51;
        else
          v52 = &CoreML::Specification::_Int64Parameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v41, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v53);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v39);
    }
    +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v54);

    if (v87 == 10)
    {
      if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[4])
      {
        +[MLParameterKey momentum](MLParameterKey, "momentum");
        v56 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v87 == 10)
        {
          v58 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v56);
          v58 = &CoreML::Specification::_SGDOptimizer_default_instance_;
        }
        v67 = (uint64_t *)v58[4];
        if (v67)
          v68 = v67;
        else
          v68 = &CoreML::Specification::_DoubleParameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v57, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v69);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v55);
    }
    +[MLParameterKey momentum](MLParameterKey, "momentum");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v70);
    goto LABEL_110;
  }
  if (v87 == 11)
  {
    if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[2])
    {
      +[MLParameterKey learningRate](MLParameterKey, "learningRate");
      v21 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v87 == 11)
      {
        v23 = v86;
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v21);
        v23 = &CoreML::Specification::_AdamOptimizer_default_instance_;
      }
      v27 = (uint64_t *)v23[2];
      if (v27)
        v28 = v27;
      else
        v28 = &CoreML::Specification::_DoubleParameter_default_instance_;
      +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v22, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v29);

    }
    +[MLParameterKey learningRate](MLParameterKey, "learningRate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v30);

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[3])
      {
        +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
        v32 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v87 == 11)
        {
          v34 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v32);
          v34 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v43 = (uint64_t *)v34[3];
        if (v43)
          v44 = v43;
        else
          v44 = &CoreML::Specification::_Int64Parameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v33, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v45);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v31);
    }
    +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v46);

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[4])
      {
        +[MLParameterKey beta1](MLParameterKey, "beta1");
        v48 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v87 == 11)
        {
          v50 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v48);
          v50 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v59 = (uint64_t *)v50[4];
        if (v59)
          v60 = v59;
        else
          v60 = &CoreML::Specification::_DoubleParameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v49, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v61);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v47);
    }
    +[MLParameterKey beta1](MLParameterKey, "beta1");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v62);

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[5])
      {
        +[MLParameterKey beta2](MLParameterKey, "beta2");
        v64 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v65 = v64;
        if (v87 == 11)
        {
          v66 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v64);
          v66 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v71 = (uint64_t *)v66[5];
        if (v71)
          v72 = v71;
        else
          v72 = &CoreML::Specification::_DoubleParameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v65, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v73);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v63);
    }
    +[MLParameterKey beta2](MLParameterKey, "beta2");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v74);

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[6])
      {
        +[MLParameterKey eps](MLParameterKey, "eps");
        v76 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v77 = v76;
        if (v87 == 11)
        {
          v78 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v76);
          v78 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v79 = (uint64_t *)v78[6];
        if (v79)
          v80 = v79;
        else
          v80 = &CoreML::Specification::_DoubleParameter_default_instance_;
        +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v77, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v81);

      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v75);
    }
    +[MLParameterKey eps](MLParameterKey, "eps");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v70);
LABEL_110:

  }
  +[MLParameterUtils appendParameterDescriptions:toModelDescription:](MLParameterUtils, "appendParameterDescriptions:toModelDescription:", v7, v5);
  objc_msgSend(v5, "parameterDescriptionsByKey");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterContainer parameterContainerFor:descriptions:](MLParameterContainer, "parameterContainerFor:descriptions:", v6, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  CoreML::Specification::Optimizer::~Optimizer((CoreML::Specification::Optimizer *)v85);
  return v83;
}

+ (id)createClassLabelToIndexMapWith:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7 + v9, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 += v9;
    }
    while (v6);
  }

  return v4;
}

@end
