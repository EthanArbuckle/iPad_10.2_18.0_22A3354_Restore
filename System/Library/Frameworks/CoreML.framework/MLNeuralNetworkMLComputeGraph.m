@implementation MLNeuralNetworkMLComputeGraph

- (id)inputTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputDescriptionsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    obj = v10;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription", obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkMLComputeGraph buildMLComputeTensorDescriptorWith:featureName:batchSize:numberOfClasses:error:](self, "buildMLComputeTensorDescriptorWith:featureName:batchSize:numberOfClasses:error:", v15, v14, a3, a4, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_14;
        objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
        {
          if (a5)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to create the input tensor."));
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

LABEL_14:
          v20 = 0;
          v19 = v23;
          goto LABEL_15;
        }
        objc_msgSend(v17, "setLabel:", v14);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v14);

      }
      v10 = obj;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }

  v19 = v23;
  v20 = v23;
LABEL_15:

  return v20;
}

- (id)labelTensorMapWithBatchSize:(unint64_t)a3 numberOfClasses:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trainingInputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "inputDescriptionsByName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
        {
          -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLNeuralNetworkMLComputeGraph buildMLComputeTensorDescriptorWith:featureName:batchSize:numberOfClasses:error:](self, "buildMLComputeTensorDescriptorWith:featureName:batchSize:numberOfClasses:error:", v17, v12, a3, a4, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_16;
          objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            if (a5)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to create the input tensor."));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_16:
            v22 = 0;
            v21 = v25;
            goto LABEL_17;
          }
          objc_msgSend(v19, "setLabel:", v12);
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v12);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
        continue;
      break;
    }
  }

  v21 = v25;
  v22 = v25;
LABEL_17:

  return v22;
}

- (MLNeuralNetworkMLComputeGraph)initWithCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8
{
  id v14;
  char hasNestedArchive;
  char v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  MLNeuralNetworkMLComputeGraph *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[3];
  char v30;
  _BYTE v31[48];
  void *__p;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void (***v36)(google::protobuf::io::IstreamInputStream *__hidden);
  int v37[4];
  uint64_t v38;
  uint64_t v39;
  int v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void (**v44)(google::protobuf::io::IstreamInputStream *__hidden);
  void (**v45)(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *__hidden);
  uint64_t v46;
  _QWORD v47[2];
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;

  v14 = a4;
  std::string::basic_string[abi:ne180100]<0>(&v44, "entireSpec");
  hasNestedArchive = IArchive::hasNestedArchive(a3, &v44);
  v16 = hasNestedArchive;
  if ((SHIBYTE(v46) & 0x80000000) == 0)
  {
    if ((hasNestedArchive & 1) != 0)
      goto LABEL_3;
LABEL_8:
    if (a8)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("The model cannot be updated. Try recompiling the model as the archive does not exist."));
      v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    goto LABEL_28;
  }
  operator delete(v44);
  if ((v16 & 1) == 0)
    goto LABEL_8;
LABEL_3:
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v31);
  std::string::basic_string[abi:ne180100]<0>(&v44, "entireSpec");
  v17 = IArchive::nestedArchive(a3, (uint64_t)&v44);
  if (SHIBYTE(v46) < 0)
    operator delete(v44);
  v18 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v17 + 32) + 16))(*(_QWORD *)(*(_QWORD *)v17 + 32));
  v44 = &off_1E3D598A0;
  v45 = &off_1E3D59870;
  v46 = v18;
  v47[0] = &off_1E3D59950;
  v47[1] = &v45;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v52 = 0;
  v51 = 0x2000;
  v34 = 0;
  v35 = 0;
  v36 = &v44;
  *(_QWORD *)v37 = 0;
  *(_QWORD *)((char *)&v37[1] + 2) = 0;
  v38 = 0x7FFFFFFFLL;
  v39 = 0x647FFFFFFFLL;
  v40 = 100;
  v41 = 1;
  v42 = 0;
  v43 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v34);
  LODWORD(v39) = 0x7FFFFFFF;
  v19 = v35 + SHIDWORD(v38);
  v35 = v19;
  v20 = v37[0] - v38;
  if (v37[0] <= (int)v38)
    v20 = 0;
  else
    v35 = v19 - v20;
  HIDWORD(v38) = v20;
  if ((google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v31, (google::protobuf::io::CodedInputStream *)&v34) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)v29);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v29[0] = 5;
    std::operator+<char>();
    if (v33 < 0)
      operator delete(__p);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v34);
  v44 = &off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v47);
  if ((v29[0] & 0xFFFFFFEF) == 0)
  {
    -[MLNeuralNetworkMLComputeGraph setModelDescription:](self, "setModelDescription:", v14);
    -[MLNeuralNetworkMLComputeGraph setExecutionOptions:](self, "setExecutionOptions:", 2);
    -[MLNeuralNetworkMLComputeGraph inputTensorMapWithBatchSize:numberOfClasses:error:](self, "inputTensorMapWithBatchSize:numberOfClasses:error:", a5, a6, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeGraph setMlcInputs:](self, "setMlcInputs:", v22);

    -[MLNeuralNetworkMLComputeGraph mlcInputs](self, "mlcInputs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[MLNeuralNetworkMLComputeGraph labelTensorMapWithBatchSize:numberOfClasses:error:](self, "labelTensorMapWithBatchSize:numberOfClasses:error:", a5, a6, a8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeGraph setMlcLabels:](self, "setMlcLabels:", v24);

      -[MLNeuralNetworkMLComputeGraph mlcLabels](self, "mlcLabels");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CC1378], "deviceWithType:", -[MLNeuralNetworkMLComputeGraph mlcDeviceTypeForComputeUnit:](self, "mlcDeviceTypeForComputeUnit:", a7));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkMLComputeGraph setDevice:](self, "setDevice:", v26);

        -[MLNeuralNetworkMLComputeGraph device](self, "device");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          if (-[MLNeuralNetworkMLComputeGraph buildGraphsFor:batchSize:numberOfClasses:error:](self, "buildGraphsFor:batchSize:numberOfClasses:error:", v31, a5, a6, a8))
          {
            v21 = self;
            goto LABEL_25;
          }
        }
      }
    }
LABEL_24:
    v21 = 0;
    goto LABEL_25;
  }
  if (!a8)
    goto LABEL_24;
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to unarchive entire spec."));
  v21 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  if (v30 < 0)
    operator delete((void *)v29[1]);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v31);
LABEL_28:

  return v21;
}

- (id)lossInputsFromUpdateParams:(const void *)a3
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t *v12;
  void *v13;
  uint64_t *v14;
  void *v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = *((_QWORD *)a3 + 4);
  if (v6)
    v7 = (uint64_t *)(v6 + 8);
  else
    v7 = 0;
  v8 = *((int *)a3 + 6);
  if ((_DWORD)v8)
  {
    v9 = 8 * v8;
    do
    {
      v10 = *v7;
      v11 = *(_DWORD *)(*v7 + 36);
      if (v11 == 10)
      {
        v14 = *(uint64_t **)(*(_QWORD *)(v10 + 24) + 16);
        if (*((char *)v14 + 23) < 0)
          v14 = (uint64_t *)*v14;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        -[MLNeuralNetworkMLComputeGraph setLayerFusedToLoss:](self, "setLayerFusedToLoss:", 1);
      }
      else if (v11 == 11)
      {
        v12 = *(uint64_t **)(*(_QWORD *)(v10 + 24) + 16);
        if (*((char *)v12 + 23) < 0)
          v12 = (uint64_t *)*v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

      }
      ++v7;
      v9 -= 8;
    }
    while (v9);
  }
  return v5;
}

- (id)buildTrainingGraphFrom:(id)a3 updateParams:(const void *)a4 numberOfClasses:(unint64_t)a5 mlcTensorByName:(id)a6 error:(id *)a7
{
  uint64_t v10;
  uint64_t *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  int v24;
  MLNeuralNetworkMLComputeGraph *v25;
  uint64_t v26;
  uint64_t v27;
  CoreML::Specification::DoubleParameter *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  CoreML::Specification::DoubleParameter *v33;
  CoreML::Specification::DoubleParameter *v34;
  CoreML::Specification::DoubleParameter *v35;
  CoreML::Specification::DoubleParameter *v36;
  CoreML::Specification::Int64Parameter *v37;
  CoreML::Specification::Int64Parameter *v38;
  CoreML::Specification::DoubleParameter *v39;
  uint64_t *v40;
  double v41;
  uint64_t *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  double v61;
  uint64_t *v62;
  double v63;
  uint64_t *v64;
  uint64_t *v65;
  id v68;
  id v69;
  void *v71;
  void (**v72)(CoreML::Specification::SGDOptimizer *__hidden);
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  CoreML::Specification::DoubleParameter *v76;
  int v77;
  void *v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v69 = a6;
  v71 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v10 = *((_QWORD *)a4 + 4);
  if (v10)
    v11 = (uint64_t *)(v10 + 8);
  else
    v11 = 0;
  v12 = a4;
  v13 = *((int *)a4 + 6);
  if (!(_DWORD)v13)
  {
LABEL_16:
    if (!objc_msgSend(v71, "count"))
    {
      if (!a7)
        goto LABEL_32;
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Loss layer is not provided."));
      v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_94:
      v30 = 0;
      *a7 = v29;
      goto LABEL_95;
    }
    v23 = (uint64_t *)*((_QWORD *)v12 + 5);
    if (!v23)
      v23 = &CoreML::Specification::_Optimizer_default_instance_;
    v24 = *((_DWORD *)v23 + 7);
    if (v24 == 10)
    {
      v31 = v23[2];
      v72 = &off_1E3D4DCE0;
      v73 = 0;
      DWORD2(v75) = 0;
      v32 = *(_QWORD *)(v31 + 8);
      v25 = self;
      if ((v32 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v73, v32 & 0xFFFFFFFFFFFFFFFELL);
      if ((uint64_t *)v31 == &CoreML::Specification::_SGDOptimizer_default_instance_)
      {
        v36 = 0;
        v74 = 0uLL;
      }
      else
      {
        if (*(_QWORD *)(v31 + 16))
        {
          v33 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v33, *(const CoreML::Specification::DoubleParameter **)(v31 + 16));
        }
        else
        {
          v33 = 0;
        }
        *(_QWORD *)&v74 = v33;
        if (*(_QWORD *)(v31 + 24))
        {
          v38 = (CoreML::Specification::Int64Parameter *)operator new();
          CoreML::Specification::Int64Parameter::Int64Parameter(v38, *(const CoreML::Specification::Int64Parameter **)(v31 + 24));
        }
        else
        {
          v38 = 0;
        }
        *((_QWORD *)&v74 + 1) = v38;
        if (*(_QWORD *)(v31 + 32))
        {
          v36 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v36, *(const CoreML::Specification::DoubleParameter **)(v31 + 32));
        }
        else
        {
          v36 = 0;
        }
      }
      *(_QWORD *)&v75 = v36;
      v40 = (uint64_t *)v74;
      if (!(_QWORD)v74)
        v40 = &CoreML::Specification::_DoubleParameter_default_instance_;
      v41 = *((double *)v40 + 2);
      if (v36)
        v42 = (uint64_t *)v36;
      else
        v42 = &CoreML::Specification::_DoubleParameter_default_instance_;
      +[MLNeuralNetworkMLComputeLayer sgdOptimizerWithLearningRate:momentum:](MLNeuralNetworkMLComputeLayer, "sgdOptimizerWithLearningRate:momentum:", v41, *((double *)v42 + 2));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      CoreML::Specification::SGDOptimizer::~SGDOptimizer((CoreML::Specification::SGDOptimizer *)&v72);
      if (!v43)
        goto LABEL_90;
    }
    else
    {
      v25 = self;
      if (v24 != 11)
        goto LABEL_90;
      v26 = v23[2];
      v72 = &off_1E3D4E108;
      v73 = 0;
      v77 = 0;
      v27 = *(_QWORD *)(v26 + 8);
      if ((v27 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v73, v27 & 0xFFFFFFFFFFFFFFFELL);
      if ((uint64_t *)v26 == &CoreML::Specification::_AdamOptimizer_default_instance_)
      {
        v34 = 0;
        v35 = 0;
        v75 = 0u;
        v74 = 0u;
      }
      else
      {
        if (*(_QWORD *)(v26 + 16))
        {
          v28 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v28, *(const CoreML::Specification::DoubleParameter **)(v26 + 16));
        }
        else
        {
          v28 = 0;
        }
        *(_QWORD *)&v74 = v28;
        if (*(_QWORD *)(v26 + 24))
        {
          v37 = (CoreML::Specification::Int64Parameter *)operator new();
          CoreML::Specification::Int64Parameter::Int64Parameter(v37, *(const CoreML::Specification::Int64Parameter **)(v26 + 24));
        }
        else
        {
          v37 = 0;
        }
        *((_QWORD *)&v74 + 1) = v37;
        if (*(_QWORD *)(v26 + 32))
        {
          v39 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v39, *(const CoreML::Specification::DoubleParameter **)(v26 + 32));
        }
        else
        {
          v39 = 0;
        }
        *(_QWORD *)&v75 = v39;
        if (*(_QWORD *)(v26 + 40))
        {
          v34 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v34, *(const CoreML::Specification::DoubleParameter **)(v26 + 40));
        }
        else
        {
          v34 = 0;
        }
        *((_QWORD *)&v75 + 1) = v34;
        if (*(_QWORD *)(v26 + 48))
        {
          v35 = (CoreML::Specification::DoubleParameter *)operator new();
          CoreML::Specification::DoubleParameter::DoubleParameter(v35, *(const CoreML::Specification::DoubleParameter **)(v26 + 48));
          v34 = (CoreML::Specification::DoubleParameter *)*((_QWORD *)&v75 + 1);
        }
        else
        {
          v35 = 0;
        }
      }
      v76 = v35;
      v59 = &CoreML::Specification::_DoubleParameter_default_instance_;
      v60 = (uint64_t *)v74;
      if (!(_QWORD)v74)
        v60 = &CoreML::Specification::_DoubleParameter_default_instance_;
      v61 = *((double *)v60 + 2);
      if ((_QWORD)v75)
        v62 = (uint64_t *)v75;
      else
        v62 = &CoreML::Specification::_DoubleParameter_default_instance_;
      v63 = *((double *)v62 + 2);
      if (v34)
        v64 = (uint64_t *)v34;
      else
        v64 = &CoreML::Specification::_DoubleParameter_default_instance_;
      if (v35)
        v59 = (uint64_t *)v35;
      +[MLNeuralNetworkMLComputeLayer adamOptimizerWithLearningRate:beta1:beta2:epsilon:timeStep:](MLNeuralNetworkMLComputeLayer, "adamOptimizerWithLearningRate:beta1:beta2:epsilon:timeStep:", 1, v61, v63, *((double *)v64 + 2), *((double *)v59 + 2));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      CoreML::Specification::AdamOptimizer::~AdamOptimizer((CoreML::Specification::AdamOptimizer *)&v72);
      if (!v43)
      {
LABEL_90:
        if (!a7)
          goto LABEL_32;
        v65 = (uint64_t *)*((_QWORD *)v12 + 5);
        if (!v65)
          v65 = &CoreML::Specification::_Optimizer_default_instance_;
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("%u optimizer type is not supported."), *((unsigned int *)v65 + 7));
        v29 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_94;
      }
    }
    v44 = (void *)MEMORY[0x1E0CC1410];
    v79[0] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v45 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "graphWithGraphObjects:lossLayer:optimizer:", v45, 0, v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLNeuralNetworkMLComputeGraph fusedLayerInputName](v25, "fusedLayerInputName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v45) = v47 == 0;

    if ((v45 & 1) != 0)
    {
      objc_msgSend(v71, "allKeys");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MLNeuralNetworkMLComputeGraph fusedLayerInputName](v25, "fusedLayerInputName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v71, "allValues");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKeyedSubscript:", v48);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (id)objc_msgSend(v46, "nodeWithLayer:sources:", v51, v53);

    if (v46)
    {
      -[MLNeuralNetworkMLComputeGraph mlcInputs](v25, "mlcInputs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeGraph mlcLabels](v25, "mlcLabels");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v46, "addInputs:lossLabels:", v55, v56);

      if ((v57 & 1) != 0)
      {
        v30 = v46;
LABEL_74:

        goto LABEL_95;
      }
      if (a7)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to add training inputs to training graph"));
        v58 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      }
    }
    else if (a7)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to create a training graph."));
      v58 = (id)objc_claimAutoreleasedReturnValue();
LABEL_72:
      v30 = 0;
      *a7 = v58;
      goto LABEL_74;
    }
    v30 = 0;
    goto LABEL_74;
  }
  v14 = 8 * v13;
  while (1)
  {
    v15 = *v11;
    v16 = *(_DWORD *)(*v11 + 36);
    if (v16 != 10)
      break;
    v20 = *(uint64_t **)(*(_QWORD *)(v15 + 24) + 16);
    if (*((char *)v20 + 23) < 0)
      v20 = (uint64_t *)*v20;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC13B0], "categoricalCrossEntropyWithLossLayerParams:numberOfClasses:", v15, a5);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = (void *)v19;
    v22 = v18;
    if (!v19)
      goto LABEL_29;
    objc_msgSend(v71, "setObject:forKeyedSubscript:", v19, v18);

    ++v11;
    v14 -= 8;
    if (!v14)
      goto LABEL_16;
  }
  if (v16 == 11)
  {
    v17 = *(uint64_t **)(*(_QWORD *)(v15 + 24) + 16);
    if (*((char *)v17 + 23) < 0)
      v17 = (uint64_t *)*v17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC13B0], "meanSquaredErrorWithLossLayerParams:", v15);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v22 = 0;
LABEL_29:
  if (a7)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("%u loss layer type is not supported."), *(unsigned int *)(v15 + 36));
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_32:
  v30 = 0;
LABEL_95:

  return v30;
}

- (id)buildInferenceGraph:(id)a3 updateParams:(const void *)a4 layers:(const void *)a5 mlcTensorByName:(id)a6 outputNameToLayerMap:(id)a7 error:(id *)a8
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  uint64_t *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  id obj;
  void *v47;
  id v49;
  id v50;
  void *v51;
  void *v52;
  _BYTE v53[28];
  int v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v50 = a6;
  obj = a7;
  v49 = a7;
  v14 = (void *)MEMORY[0x1E0CC1390];
  v47 = v13;
  v55[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "graphWithGraphObjects:", v15);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[MLNeuralNetworkMLComputeGraph lossInputsFromUpdateParams:](self, "lossInputsFromUpdateParams:", a4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *((_QWORD *)a5 + 2);
    if (v16)
      v17 = (uint64_t *)(v16 + 8);
    else
      v17 = 0;
    v18 = *((int *)a5 + 2);
    if ((_DWORD)v18)
    {
      v19 = 8 * v18;
      do
      {
        v20 = *v17;
        v21 = *(_DWORD *)(*v17 + 140);
        if (v21 == 130)
        {
          CoreML::Specification::ActivationParams::ActivationParams((CoreML::Specification::ActivationParams *)v53, *(const CoreML::Specification::ActivationParams **)(v20 + 128));
          if (v54 == 40)
          {
            v32 = *(uint64_t **)(*(_QWORD *)(v20 + 56) + 8);
            if (*((char *)v32 + 23) < 0)
              v32 = (uint64_t *)*v32;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v52, "containsObject:", v33)
              && -[MLNeuralNetworkMLComputeGraph layerFusedToLoss](self, "layerFusedToLoss"))
            {
              +[MLNeuralNetworkMLComputeLayer sigmoid](MLNeuralNetworkMLComputeLayer, "sigmoid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = *(uint64_t **)(*(_QWORD *)(v20 + 32) + 8);
              if (*((char *)v35 + 23) < 0)
                v35 = (uint64_t *)*v35;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "nodeWithLayer:source:", v34, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "predictedFeatureName");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setLabel:", v40);

              objc_msgSend(v38, "label");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v34, v41);

              -[MLNeuralNetworkMLComputeGraph setClassifierOutputIsSigmoidOutput:](self, "setClassifierOutputIsSigmoidOutput:", 1);
            }

          }
          CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v53);
        }
        else if (v21 == 175)
        {
          v22 = *(uint64_t **)(*(_QWORD *)(v20 + 56) + 8);
          if (*((char *)v22 + 23) < 0)
            v22 = (uint64_t *)*v22;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "containsObject:", v23))
          {
            objc_msgSend(MEMORY[0x1E0CC13F0], "softmax");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(uint64_t **)(*(_QWORD *)(v20 + 32) + 8);
            if (*((char *)v25 + 23) < 0)
              v25 = (uint64_t *)*v25;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "nodeWithLayer:source:", v24, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            -[MLNeuralNetworkMLComputeGraph modelDescription](self, "modelDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "predictedFeatureName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setLabel:", v30);

            objc_msgSend(v28, "label");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v24, v31);

          }
        }
        ++v17;
        v19 -= 8;
      }
      while (v19);
    }
    -[MLNeuralNetworkMLComputeGraph mlcInputs](self, "mlcInputs");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v51, "addInputs:", v42);

    if ((v43 & 1) != 0)
    {
      objc_storeStrong((id *)&self->_outputNameToLayerMap, obj);
      v44 = v51;
    }
    else if (a8)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to add inputs to inference graph"));
      v44 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }

  }
  else if (a8)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to create a inference graph."));
    v44 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (BOOL)buildGraphsFor:(void *)a3 batchSize:(unint64_t)a4 numberOfClasses:(unint64_t)a5 error:(id *)a6
{
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t *v29;
  void *v30;
  uint64_t *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  void *v41;
  uint64_t *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  const void ***v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const void **v77;
  size_t v78;
  int v79;
  size_t v80;
  const void *v81;
  size_t v82;
  BOOL v83;
  void *v84;
  uint64_t *v85;
  void *v86;
  void *v87;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v88;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  BOOL v108;
  void *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  void *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t v117;
  unint64_t v119;
  uint64_t *v120;
  MLNeuralNetworkMLComputeGraph *v121;
  id *v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  _BYTE v138[28];
  int v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;

  v10 = (void *)objc_opt_new();
  -[MLNeuralNetworkMLComputeGraph setGraph:](self, "setGraph:", v10);

  v11 = *((_DWORD *)a3 + 11);
  switch(v11)
  {
    case 303:
      goto LABEL_4;
    case 403:
      v15 = *((_QWORD *)a3 + 4);
      v13 = v15 + 16;
      v14 = *(uint64_t **)(v15 + 72);
LABEL_6:
      if (v14)
        v16 = v14;
      else
        v16 = &CoreML::Specification::_NetworkUpdateParameters_default_instance_;
      goto LABEL_10;
    case 500:
LABEL_4:
      v12 = *((_QWORD *)a3 + 4);
      v13 = v12 + 16;
      v14 = *(uint64_t **)(v12 + 64);
      goto LABEL_6;
  }
  v16 = 0;
  v13 = 0;
LABEL_10:
  -[MLNeuralNetworkMLComputeGraph lossInputsFromUpdateParams:](self, "lossInputsFromUpdateParams:", v16);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[MLNeuralNetworkMLComputeGraph mlcInputs](self, "mlcInputs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)objc_msgSend(v17, "mutableCopy");

  v18 = (uint64_t *)*((_QWORD *)a3 + 2);
  if (!v18)
    v18 = &CoreML::Specification::_ModelDescription_default_instance_;
  v125 = v18;
  v131 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v119 = a5;
  v19 = *(_QWORD *)(v13 + 16);
  if (v19)
    v20 = (uint64_t *)(v19 + 8);
  else
    v20 = 0;
  v117 = v13;
  v21 = *(int *)(v13 + 8);
  if (!(_DWORD)v21)
  {
    v22 = 0;
LABEL_138:
    -[MLNeuralNetworkMLComputeGraph setLayersMap:](self, "setLayersMap:", v127);
    -[MLNeuralNetworkMLComputeGraph graph](self, "graph");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeGraph buildTrainingGraphFrom:updateParams:numberOfClasses:mlcTensorByName:error:](self, "buildTrainingGraphFrom:updateParams:numberOfClasses:mlcTensorByName:error:", v98, v16, v119, v130, a6);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeGraph setTrainingGraph:](self, "setTrainingGraph:", v99);

    if (v99)
    {
      -[MLNeuralNetworkMLComputeGraph trainingGraph](self, "trainingGraph");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeGraph device](self, "device");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v100, "compileWithOptions:device:", 0, v101);

      if ((v102 & 1) != 0)
      {
        -[MLNeuralNetworkMLComputeGraph graph](self, "graph");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkMLComputeGraph buildInferenceGraph:updateParams:layers:mlcTensorByName:outputNameToLayerMap:error:](self, "buildInferenceGraph:updateParams:layers:mlcTensorByName:outputNameToLayerMap:error:", v103, v16, v117, v130, v131, a6);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkMLComputeGraph setInferenceGraph:](self, "setInferenceGraph:", v104);

        if (v104)
        {
          -[MLNeuralNetworkMLComputeGraph inferenceGraph](self, "inferenceGraph");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLNeuralNetworkMLComputeGraph device](self, "device");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v105, "compileWithOptions:device:", 0, v106);

          if ((v107 & 1) != 0)
          {
            v108 = 1;
            goto LABEL_170;
          }
          if (a6)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to compile inference graph."));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_151;
          }
        }
      }
      else if (a6)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to compile training graph."));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_151;
      }
    }
LABEL_169:
    v108 = 0;
    goto LABEL_170;
  }
  v22 = 0;
  v122 = a6;
  v123 = &v20[v21];
  v120 = v16;
  v121 = self;
  while (1)
  {
    v23 = *v20;
    v24 = *(unsigned int *)(*v20 + 140);
    if ((int)v24 > 300)
      break;
    if ((int)v24 <= 139)
    {
      switch((_DWORD)v24)
      {
        case 0x64:
          v45 = *(_QWORD *)(v23 + 128);
          v145 = v22;
          objc_msgSend(MEMORY[0x1E0CC1370], "convolutionLayer:error:", v45, &v145);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v145;
          break;
        case 0x78:
          v38 = *(_QWORD *)(v23 + 128);
          v143 = v22;
          objc_msgSend(MEMORY[0x1E0CC13D8], "poolingLayer:error:", v38, &v143);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v143;
          break;
        case 0x82:
          CoreML::Specification::ActivationParams::ActivationParams((CoreML::Specification::ActivationParams *)v138, *(const CoreML::Specification::ActivationParams **)(v23 + 128));
          if (v139 == 10)
          {
            objc_msgSend(MEMORY[0x1E0CC1348], "relu");
            v96 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v139 != 15)
            {
              if (v139 == 40)
              {
                v29 = *(uint64_t **)(*(_QWORD *)(v23 + 56) + 8);
                if (*((char *)v29 + 23) < 0)
                  v29 = (uint64_t *)*v29;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v126, "containsObject:", v30)
                  && -[MLNeuralNetworkMLComputeGraph layerFusedToLoss](self, "layerFusedToLoss"))
                {
                  v31 = *(uint64_t **)(*(_QWORD *)(v23 + 32) + 8);
                  if (*((char *)v31 + 23) < 0)
                    v31 = (uint64_t *)*v31;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MLNeuralNetworkMLComputeGraph setFusedLayerInputName:](self, "setFusedLayerInputName:", v32);

                  CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v138);
                  goto LABEL_114;
                }
                objc_msgSend(MEMORY[0x1E0CC1348], "sigmoid");
                v26 = objc_claimAutoreleasedReturnValue();

              }
              else if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("activation: %u not supported"), *(unsigned int *)(v23 + 140));
                v26 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v26 = 0;
              }
              goto LABEL_132;
            }
            objc_msgSend(MEMORY[0x1E0CC1348], "leakyRelu");
            v96 = objc_claimAutoreleasedReturnValue();
          }
          v26 = v96;
LABEL_132:
          CoreML::Specification::ActivationParams::~ActivationParams((CoreML::Specification::ActivationParams *)v138);
          goto LABEL_66;
        default:
          goto LABEL_161;
      }
      goto LABEL_65;
    }
    if ((int)v24 <= 174)
    {
      if ((_DWORD)v24 == 140)
      {
        v36 = *(_QWORD *)(v23 + 128);
        v146 = v22;
        objc_msgSend(MEMORY[0x1E0CC1380], "innerProductLayer:error:", v36, &v146);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v146;
      }
      else
      {
        if ((_DWORD)v24 != 160)
          goto LABEL_161;
        v25 = *(_QWORD *)(v23 + 128);
        v137 = v22;
        objc_msgSend(MEMORY[0x1E0CC1358], "batchNormLayer:error:", v25, &v137);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v137;
      }
      goto LABEL_65;
    }
    if ((_DWORD)v24 != 175)
    {
      if ((_DWORD)v24 != 300)
        goto LABEL_161;
      v34 = *(_QWORD *)(v23 + 128);
      v141 = v22;
      objc_msgSend(MEMORY[0x1E0CC13E0], "reshapeLayer:batchSize:error:", v34, a4, &v141);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v141;
      goto LABEL_65;
    }
    v40 = *(uint64_t **)(*(_QWORD *)(v23 + 56) + 8);
    if (*((char *)v40 + 23) < 0)
      v40 = (uint64_t *)*v40;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v126, "containsObject:", v41) & 1) != 0)
    {
      v42 = *(uint64_t **)(*(_QWORD *)(v23 + 32) + 8);
      if (*((char *)v42 + 23) < 0)
        v42 = (uint64_t *)*v42;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeGraph setFusedLayerInputName:](self, "setFusedLayerInputName:", v43);

      goto LABEL_114;
    }
    objc_msgSend(MEMORY[0x1E0CC13F0], "softmax");
    v26 = objc_claimAutoreleasedReturnValue();

LABEL_66:
    v132 = (void *)v26;
    if (!v26)
    {
      if (!a6)
        goto LABEL_169;
      v110 = *(uint64_t **)(v23 + 112);
      if (*((char *)v110 + 23) < 0)
        v110 = (uint64_t *)*v110;
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v22, CFSTR("Layer: %s(%d) not supported."), v110, *(unsigned int *)(v23 + 140));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_151;
    }
    v47 = *(uint64_t **)(v23 + 112);
    if (*((char *)v47 + 23) < 0)
      v47 = (uint64_t *)*v47;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setObject:forKeyedSubscript:", v132, v48);

    v128 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v49 = *(_QWORD *)(v23 + 32);
    if (v49)
      v50 = v49 + 8;
    else
      v50 = 0;
    v129 = v23;
    v51 = *(int *)(v23 + 24);
    v52 = v22;
    if ((_DWORD)v51)
    {
      v53 = 8 * v51;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          break;
        objc_msgSend(v128, "addObject:", v55);

        v50 += 8;
        v53 -= 8;
        if (!v53)
          goto LABEL_76;
      }
      if (a6)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Model Layers are not in topological order."));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_135;
      }
      goto LABEL_136;
    }
LABEL_76:
    -[MLNeuralNetworkMLComputeGraph graph](self, "graph");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v129;
    objc_msgSend(v56, "nodeWithLayer:sources:disableUpdate:", v132, v128, *(_BYTE *)(v129 + 120) == 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      if (a6)
      {
        v111 = *(uint64_t **)(v129 + 112);
        if (*((char *)v111 + 23) < 0)
          v111 = (uint64_t *)*v111;
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot attach %s(%d) to the training graph."), v111, *(unsigned int *)(v129 + 140));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_135:
        *a6 = v97;
      }
LABEL_136:

      goto LABEL_169;
    }
    -[MLNeuralNetworkMLComputeGraph graph](self, "graph");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "resultTensorsForLayer:", v132);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = objc_msgSend(v60, "count");
    if (*(_DWORD *)(v129 + 48) != v61)
    {
      if (a6)
      {
        v112 = *(uint64_t **)(v129 + 112);
        if (*((char *)v112 + 23) < 0)
          v112 = (uint64_t *)*v112;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Number of Layer outputs does not match with its training layer for layer name: %@."), v113);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_136;
    }
    v124 = v20;
    if (v61 >= 1)
    {
      v62 = 0;
      v63 = v61;
      do
      {
        v64 = *(uint64_t **)(*(_QWORD *)(v129 + 56) + 8 * v62 + 8);
        if (*((char *)v64 + 23) < 0)
          v64 = (uint64_t *)*v64;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectAtIndexedSubscript:", v62);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setLabel:", v65);

        objc_msgSend(v60, "objectAtIndexedSubscript:", v62);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "setObject:forKeyedSubscript:", v67, v65);

        ++v62;
      }
      while (v63 != v62);
    }
    v68 = v125[7];
    if (v68)
      v69 = (uint64_t *)(v68 + 8);
    else
      v69 = 0;
    v70 = *((int *)v125 + 12);
    if ((_DWORD)v70)
    {
      v71 = &v69[v70];
      do
      {
        v72 = *(_QWORD *)(v57 + 56);
        if (v72)
          v73 = (const void ***)(v72 + 8);
        else
          v73 = 0;
        v74 = *(int *)(v57 + 48);
        if ((_DWORD)v74)
        {
          v75 = *v69;
          v76 = 8 * v74;
          do
          {
            v77 = *(const void ***)(v75 + 16);
            if (*((char *)v77 + 23) < 0)
            {
              v77 = (const void **)*v77;
              v78 = *(_QWORD *)(*(_QWORD *)(v75 + 16) + 8);
            }
            else
            {
              v78 = *((unsigned __int8 *)v77 + 23);
            }
            v79 = *((char *)*v73 + 23);
            if (v79 >= 0)
              v80 = *((unsigned __int8 *)*v73 + 23);
            else
              v80 = (size_t)(*v73)[1];
            if (v79 >= 0)
              v81 = *v73;
            else
              v81 = **v73;
            if (v80 >= v78)
              v82 = v78;
            else
              v82 = v80;
            v83 = !memcmp(v77, v81, v82) && v80 == v78;
            v22 = v52;
            if (v83)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v81);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "setObject:forKeyedSubscript:", v132, v84);

            }
            ++v73;
            v76 -= 8;
          }
          while (v76);
        }
        ++v69;
        v57 = v129;
      }
      while (v69 != v71);
    }

    self = v121;
    a6 = v122;
    v16 = v120;
    v20 = v124;
LABEL_114:
    if (++v20 == v123)
      goto LABEL_138;
  }
  if ((int)v24 <= 984)
  {
    switch((_DWORD)v24)
    {
      case 0x12D:
        v85 = *(uint64_t **)(*(_QWORD *)(v23 + 32) + 8);
        if (*((char *)v85 + 23) < 0)
          v85 = (uint64_t *)*v85;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)MEMORY[0x1E0CC13E0];
        objc_msgSend(v130, "objectForKeyedSubscript:", v86);
        v88 = (CoreML::Specification::protobuf_NeuralNetwork_2eproto *)objc_claimAutoreleasedReturnValue();
        v89 = v88;
        v90 = v20;
        if (*(_DWORD *)(v23 + 140) == 301)
        {
          v91 = *(uint64_t **)(v23 + 128);
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v88);
          v91 = &CoreML::Specification::_FlattenLayerParams_default_instance_;
        }
        v142 = v22;
        objc_msgSend(v87, "flattenLayerWithTensor:flattenParams:batchSize:error:", v89, v91, a4, &v142);
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = v142;

        v22 = v93;
        v20 = v90;
        goto LABEL_124;
      case 0x1A4:
        v39 = *(_QWORD *)(v23 + 128);
        v144 = v22;
        objc_msgSend(MEMORY[0x1E0CC13A0], "uniDirectionalLSTMLayer:error:", v39, &v144);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v144;
        break;
      case 0x3D4:
        v33 = *(_QWORD *)(v23 + 128);
        v135 = v22;
        objc_msgSend(MEMORY[0x1E0CC1360], "concatNDLayer:error:", v33, &v135);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v135;
        break;
      default:
        goto LABEL_161;
    }
    goto LABEL_65;
  }
  if ((int)v24 > 1139)
  {
    if ((_DWORD)v24 == 1140)
    {
      v44 = *(_QWORD *)(v23 + 128);
      v140 = v22;
      objc_msgSend(MEMORY[0x1E0CC13E0], "reshapeStaticLayer:batchSize:error:", v44, a4, &v140);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v140;
    }
    else
    {
      if ((_DWORD)v24 != 1460)
      {
LABEL_161:
        if (!a6)
          goto LABEL_169;
        v114 = *(uint64_t **)(v23 + 112);
        if (*((char *)v114 + 23) < 0)
          v114 = (uint64_t *)*v114;
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Layer: %s(%d) not supported."), v114, v24);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_151;
      }
      v35 = *(_QWORD *)(v23 + 128);
      v136 = v22;
      objc_msgSend(MEMORY[0x1E0CC1348], "clampedReluLayer:error:", v35, &v136);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v136;
    }
    goto LABEL_65;
  }
  if ((_DWORD)v24 == 985)
  {
    v37 = *(_QWORD *)(v23 + 128);
    v134 = v22;
    objc_msgSend(MEMORY[0x1E0CC1418], "transposeLayer:error:", v37, &v134);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v134;
LABEL_65:
    v46 = v27;

    v22 = v46;
    goto LABEL_66;
  }
  if ((_DWORD)v24 != 1045)
    goto LABEL_161;
  v28 = *(_DWORD *)(v23 + 24);
  if (v28 == 1)
  {
    v94 = *(_QWORD *)(v23 + 128);
    v133 = v22;
    objc_msgSend(MEMORY[0x1E0CC1380], "innerProductLayerWithBatchedMatMulParams:error:", v94, &v133);
    v92 = objc_claimAutoreleasedReturnValue();
    v95 = v133;

    v22 = v95;
LABEL_124:
    v26 = v92;
    goto LABEL_66;
  }
  if (v28 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CC13C0], "matrixMultiplicationLayerUsingParameters:", *(_QWORD *)(v23 + 128));
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_66;
  }
  if (!a6)
    goto LABEL_169;
  v115 = *(uint64_t **)(v23 + 112);
  if (*((char *)v115 + 23) < 0)
    v115 = (uint64_t *)*v115;
  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Layer: %s(%d) input size is neither 1 nor 2."), v115, 1045);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_151:
  v108 = 0;
  *a6 = v109;
LABEL_170:

  return v108;
}

- (id)buildMLComputeTensorDescriptorWith:(id)a3 featureName:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v11, "trainingInputDescriptionsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "type");
  if (v15 == 4)
  {
    objc_msgSend(v14, "imageConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "pixelsWide"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "pixelsHigh"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v27;
    v28 = (void *)MEMORY[0x1E0CB37E8];
    if (objc_msgSend(v24, "pixelType") == 10)
      v29 = 1;
    else
      v29 = 3;
    objc_msgSend(v28, "numberWithInt:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v30;
    v47[2] = v26;
    v47[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC1408], "descriptorWithShape:dataType:", v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  if (v15 != 5)
  {
    objc_msgSend(v14, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictedFeatureName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqualToString:", v34);

    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CC1408], "descriptorWithWidth:height:featureChannelCount:batchSize:", 1, 1, a6, a5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_17:
    v32 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v14, "multiArrayConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17
    || (objc_msgSend(v16, "shape"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v17,
        !v19))
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v16, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v20, "count"))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v21;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v22;
      v46[2] = &unk_1E3DA24E8;
      v46[3] = &unk_1E3DA24E8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v21;
      v45[1] = &unk_1E3DA24E8;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v22;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v21;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v22;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v37;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
      v40 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v21;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v22;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v37;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
      v40 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      v23 = (void *)v40;

      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v21;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v22;
      v42[2] = &unk_1E3DA24E8;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
      v38 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v23 = (void *)v38;
      break;
    default:
      if (a7)
      {
        objc_msgSend(v16, "shape");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Input data provided has unsupported shape %@d"), v36);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_16;
  }

LABEL_25:
  objc_msgSend(MEMORY[0x1E0CC1408], "descriptorWithShape:dataType:", v23, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  return v32;
}

- (int)mlcDeviceTypeForComputeUnit:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

- (BOOL)copyWeightsFrom:(id)a3 to:(void *)a4 error:(id *)a5
{
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  id v28;
  BOOL result;
  uint64_t v30;

  v7 = (const void *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v8 = *((_QWORD *)a4 + 5);
  if (*(char *)(v8 + 23) < 0)
    v9 = *(_QWORD *)(v8 + 8);
  else
    v9 = *(unsigned __int8 *)(v8 + 23);
  v10 = *((_QWORD *)a4 + 6);
  v11 = *(unsigned __int8 *)(v10 + 23);
  if (*(char *)(v10 + 23) < 0)
    v12 = *(_QWORD *)(v10 + 8);
  else
    v12 = *(unsigned __int8 *)(v10 + 23);
  v13 = *((_DWORD *)a4 + 4);
  v14 = *((_QWORD *)a4 + 7);
  v15 = *(unsigned __int8 *)(v14 + 23);
  if (*(char *)(v14 + 23) < 0)
    v16 = *(_QWORD *)(v14 + 8);
  else
    v16 = *(unsigned __int8 *)(v14 + 23);
  if (v13 <= 0)
    v17 = 1;
  else
    v17 = 2;
  if (v9)
    v18 = v17;
  else
    v18 = v13 > 0;
  if (v12)
    ++v18;
  if (v16)
    ++v18;
  if (v18 > 1)
    goto LABEL_21;
  if (v13 <= 0 && v18)
  {
    if ((*(_BYTE *)(v8 + 23) & 0x80) != 0)
    {
      v19 = *(_QWORD *)(v8 + 8);
      if (v19)
        goto LABEL_47;
    }
    else if (*(_BYTE *)(v8 + 23))
    {
      LODWORD(v19) = *(unsigned __int8 *)(v8 + 23);
      goto LABEL_47;
    }
    if ((v11 & 0x80) != 0)
    {
      v23 = *((_QWORD *)a4 + 8);
      v21 = v23 != 0;
      v22 = a4 != &CoreML::Specification::_WeightParams_default_instance_;
      if (a4 != &CoreML::Specification::_WeightParams_default_instance_)
      {
        v19 = *(_QWORD *)(v10 + 8);
        if (v19)
        {
          if (v23)
            goto LABEL_47;
        }
      }
    }
    else
    {
      v20 = *((_QWORD *)a4 + 8);
      v21 = v20 != 0;
      v22 = a4 != &CoreML::Specification::_WeightParams_default_instance_;
      if (a4 != &CoreML::Specification::_WeightParams_default_instance_ && *(_BYTE *)(v10 + 23) && v20)
      {
        LODWORD(v19) = *(unsigned __int8 *)(v10 + 23);
        goto LABEL_47;
      }
    }
    if ((v15 & 0x80) == 0)
    {
      if (!*(_BYTE *)(v14 + 23))
        v22 = 0;
      if (v22 && v21)
      {
        LODWORD(v19) = *(unsigned __int8 *)(v14 + 23);
        goto LABEL_47;
      }
LABEL_21:
      LODWORD(v19) = 0;
      goto LABEL_47;
    }
    v19 = *(_QWORD *)(v14 + 8);
    if (!v19)
      v22 = 0;
    if (!v22 || !v21)
      goto LABEL_21;
  }
  else if (v18)
  {
    LODWORD(v19) = 4 * v13;
  }
  else
  {
    LODWORD(v19) = 0;
  }
LABEL_47:
  if ((*(_BYTE *)(v8 + 23) & 0x80) != 0)
  {
    v24 = *(_QWORD *)(v8 + 8);
    if ((v11 & 0x80) == 0)
    {
LABEL_49:
      v25 = *(unsigned __int8 *)(v10 + 23);
      if ((v15 & 0x80) == 0)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  else
  {
    v24 = *(unsigned __int8 *)(v8 + 23);
    if ((v11 & 0x80) == 0)
      goto LABEL_49;
  }
  v25 = *(_QWORD *)(v10 + 8);
  if ((v15 & 0x80) != 0)
LABEL_50:
    v15 = *(_QWORD *)(v14 + 8);
LABEL_51:
  if (v24)
    v26 = v17;
  else
    v26 = v13 > 0;
  if (v25)
    ++v26;
  if (v15)
    v27 = v26 + 1;
  else
    v27 = v26;
  if (v27 > 1)
    goto LABEL_60;
  if (v13 <= 0 && v27)
  {
    if ((*(_BYTE *)(v8 + 23) & 0x80) != 0)
    {
      if (*(_QWORD *)(v8 + 8))
      {
LABEL_66:
        if ((__int128 *)v8 == &google::protobuf::internal::fixed_address_empty_string)
        {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena((std::string **)a4 + 5, (uint64_t)&google::protobuf::internal::fixed_address_empty_string);
          v8 = *((_QWORD *)a4 + 5);
        }
        goto LABEL_76;
      }
    }
    else if (*(_BYTE *)(v8 + 23))
    {
      goto LABEL_66;
    }
    if ((v11 & 0x80) != 0)
      v11 = *(_QWORD *)(v10 + 8);
    if (a4 == &CoreML::Specification::_WeightParams_default_instance_ || !v11 || !*((_QWORD *)a4 + 8))
      goto LABEL_60;
    v8 = *((_QWORD *)a4 + 6);
    if ((__int128 *)v10 == &google::protobuf::internal::fixed_address_empty_string)
    {
      google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena((std::string **)a4 + 6, (uint64_t)&google::protobuf::internal::fixed_address_empty_string);
      v8 = *((_QWORD *)a4 + 6);
    }
    goto LABEL_76;
  }
  if (!v27)
    goto LABEL_60;
  v30 = *((_QWORD *)a4 + 3);
  if (v30)
    v8 = v30 + 8;
  else
    v8 = 0;
LABEL_76:
  if (v8 && v7)
  {
    memcpy((void *)v8, v7, (int)v19);
    return 1;
  }
LABEL_60:
  if (!a5)
    return 0;
  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in copying updated weights from training graph"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a5 = v28;
  return result;
}

- (BOOL)saveUpdatedWeightsTo:(void *)a3 error:(id *)a4
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  CoreML::Specification::BatchedMatMulLayerParams *v17;
  void *v18;
  void *v19;
  CoreML::Specification::InnerProductLayerParams *v20;
  void *v21;
  void *v22;
  CoreML::Specification::BatchnormLayerParams *v23;
  void *v24;
  void *v25;
  void *v26;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v27;
  void *v28;
  void *v29;
  CoreML::Specification::ConvolutionLayerParams *v30;
  CoreML::Specification::WeightParams *v31;
  BOOL v32;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v33;
  uint64_t *v34;
  CoreML::Specification::WeightParams *v35;
  BOOL v36;
  void *v37;
  void *v38;
  CoreML::Specification::BatchnormLayerParams *v39;
  CoreML::Specification::WeightParams *v40;
  BOOL v41;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v42;
  uint64_t *v43;
  CoreML::Specification::LSTMWeightParams *v44;
  CoreML::Specification::WeightParams *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v50;
  void *v51;
  void *v52;
  CoreML::Specification::InnerProductLayerParams *v53;
  CoreML::Specification::ConvolutionLayerParams *v54;
  CoreML::Specification::WeightParams *v55;
  BOOL v56;
  void *v57;
  void *v58;
  CoreML::Specification::BatchnormLayerParams *v59;
  CoreML::Specification::LSTMWeightParams *v60;
  CoreML::Specification::WeightParams *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v66;
  CoreML::Specification::WeightParams *v67;
  BOOL v68;
  CoreML::Specification::BatchnormLayerParams *v69;
  CoreML::Specification::LSTMWeightParams *v70;
  CoreML::Specification::WeightParams *v71;
  BOOL v72;
  void *v73;
  void *v74;
  void *v75;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v76;
  CoreML::Specification::WeightParams *v77;
  CoreML::Specification::LSTMWeightParams *v78;
  CoreML::Specification::WeightParams *v79;
  BOOL v80;
  void *v81;
  void *v82;
  void *v83;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v84;
  CoreML::Specification::LSTMWeightParams *v85;
  CoreML::Specification::WeightParams *v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *v90;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v91;
  CoreML::Specification::LSTMWeightParams *v92;
  CoreML::Specification::WeightParams *v93;
  BOOL v94;
  void *v95;
  void *v96;
  void *v97;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v98;
  CoreML::Specification::LSTMWeightParams *v99;
  CoreML::Specification::WeightParams *v100;
  BOOL v101;
  void *v102;
  void *v103;
  void *v104;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v105;
  CoreML::Specification::LSTMWeightParams *v106;
  CoreML::Specification::WeightParams *v107;
  BOOL v108;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v109;
  uint64_t *v110;
  uint64_t *v111;
  void *v112;
  void *v113;
  void *v114;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v115;
  CoreML::Specification::WeightParams *v116;
  BOOL v117;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v118;
  uint64_t *v119;
  CoreML::Specification::LSTMWeightParams *v120;
  CoreML::Specification::WeightParams *v121;
  BOOL v122;
  void *v123;
  void *v124;
  void *v125;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v126;
  CoreML::Specification::BatchedMatMulLayerParams *v127;
  CoreML::Specification::LSTMWeightParams *v128;
  CoreML::Specification::WeightParams *v129;
  BOOL v130;
  void *v131;
  void *v132;
  void *v133;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v134;
  CoreML::Specification::LSTMWeightParams *v135;
  CoreML::Specification::WeightParams *v136;
  BOOL v137;
  void *v138;
  CoreML::Specification::UniDirectionalLSTMLayerParams *v139;
  CoreML::Specification::LSTMWeightParams *v140;
  CoreML::Specification::WeightParams *v141;
  BOOL v142;
  uint64_t v144;

  v6 = *((_DWORD *)a3 + 11);
  if (v6 == 303 || v6 == 403 || v6 == 500)
    v7 = *((_QWORD *)a3 + 4) + 16;
  else
    v7 = 0;
  if (*(int *)(v7 + 8) < 1)
    return 1;
  v8 = 0;
  v144 = v7;
  while (1)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 8 * v8 + 8);
    -[MLNeuralNetworkMLComputeGraph layersMap](self, "layersMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(uint64_t **)(v9 + 112);
    if (*((char *)v11 + 23) < 0)
      v11 = (uint64_t *)*v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_DWORD *)(v9 + 140);
    if (v14 <= 159)
      break;
    if (v14 == 160)
    {
      objc_msgSend(v13, "gamma");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 160)
      {
        v23 = *(CoreML::Specification::BatchnormLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        v23 = (CoreML::Specification::BatchnormLayerParams *)operator new();
        CoreML::Specification::BatchnormLayerParams::BatchnormLayerParams(v23);
        *(_QWORD *)(v9 + 128) = v23;
      }
      v35 = (CoreML::Specification::WeightParams *)*((_QWORD *)v23 + 2);
      if (!v35)
      {
        v35 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v35);
        *((_QWORD *)v23 + 2) = v35;
      }
      v36 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v22, v35, a4);

      if (!v36)
        goto LABEL_194;
      objc_msgSend(v13, "beta");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 160)
      {
        v39 = *(CoreML::Specification::BatchnormLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        v39 = (CoreML::Specification::BatchnormLayerParams *)operator new();
        CoreML::Specification::BatchnormLayerParams::BatchnormLayerParams(v39);
        *(_QWORD *)(v9 + 128) = v39;
      }
      v55 = (CoreML::Specification::WeightParams *)*((_QWORD *)v39 + 3);
      if (!v55)
      {
        v55 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v55);
        *((_QWORD *)v39 + 3) = v55;
      }
      v56 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v38, v55, a4);

      if (!v56)
        goto LABEL_194;
      objc_msgSend(v13, "mean");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "data");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 160)
      {
        v59 = *(CoreML::Specification::BatchnormLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        v59 = (CoreML::Specification::BatchnormLayerParams *)operator new();
        CoreML::Specification::BatchnormLayerParams::BatchnormLayerParams(v59);
        *(_QWORD *)(v9 + 128) = v59;
      }
      v67 = (CoreML::Specification::WeightParams *)*((_QWORD *)v59 + 4);
      if (!v67)
      {
        v67 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v67);
        *((_QWORD *)v59 + 4) = v67;
      }
      v68 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v58, v67, a4);

      if (!v68)
        goto LABEL_194;
      objc_msgSend(v13, "variance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "data");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 160)
      {
        v69 = *(CoreML::Specification::BatchnormLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 160;
        v69 = (CoreML::Specification::BatchnormLayerParams *)operator new();
        CoreML::Specification::BatchnormLayerParams::BatchnormLayerParams(v69);
        *(_QWORD *)(v9 + 128) = v69;
      }
      v77 = (CoreML::Specification::WeightParams *)*((_QWORD *)v69 + 5);
      if (!v77)
      {
        v77 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v77);
        *((_QWORD *)v69 + 5) = v77;
      }
LABEL_190:
      v142 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v52, v77, a4);
LABEL_191:

      if (!v142)
        goto LABEL_194;
      goto LABEL_192;
    }
    if (v14 == 420)
    {
      objc_msgSend(v13, "inputWeights");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v27 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v27 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v27);
        *(_QWORD *)(v9 + 128) = v27;
      }
      v44 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v27 + 6);
      if (!v44)
      {
        v44 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v44);
        *((_QWORD *)v27 + 6) = v44;
      }
      v45 = (CoreML::Specification::WeightParams *)*((_QWORD *)v44 + 2);
      if (!v45)
      {
        v45 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v45);
        *((_QWORD *)v44 + 2) = v45;
      }
      v46 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v26, v45, a4);

      if (!v46)
        goto LABEL_194;
      objc_msgSend(v13, "inputWeights");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "data");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v50 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v50 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v50);
        *(_QWORD *)(v9 + 128) = v50;
      }
      v60 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v50 + 6);
      if (!v60)
      {
        v60 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v60);
        *((_QWORD *)v50 + 6) = v60;
      }
      v61 = (CoreML::Specification::WeightParams *)*((_QWORD *)v60 + 3);
      if (!v61)
      {
        v61 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v61);
        *((_QWORD *)v60 + 3) = v61;
      }
      v62 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v49, v61, a4);

      if (!v62)
        goto LABEL_194;
      objc_msgSend(v13, "inputWeights");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "data");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v66 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v66 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v66);
        *(_QWORD *)(v9 + 128) = v66;
      }
      v70 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v66 + 6);
      if (!v70)
      {
        v70 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v70);
        *((_QWORD *)v66 + 6) = v70;
      }
      v71 = (CoreML::Specification::WeightParams *)*((_QWORD *)v70 + 4);
      if (!v71)
      {
        v71 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v71);
        *((_QWORD *)v70 + 4) = v71;
      }
      v72 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v65, v71, a4);

      if (!v72)
        goto LABEL_194;
      objc_msgSend(v13, "inputWeights");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectAtIndexedSubscript:", 3);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "data");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v76 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v76 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v76);
        *(_QWORD *)(v9 + 128) = v76;
      }
      v78 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v76 + 6);
      if (!v78)
      {
        v78 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v78);
        *((_QWORD *)v76 + 6) = v78;
      }
      v79 = (CoreML::Specification::WeightParams *)*((_QWORD *)v78 + 5);
      if (!v79)
      {
        v79 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v79);
        *((_QWORD *)v78 + 5) = v79;
      }
      v80 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v75, v79, a4);

      if (!v80)
        goto LABEL_194;
      objc_msgSend(v13, "hiddenWeights");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "data");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v84 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v84 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v84);
        *(_QWORD *)(v9 + 128) = v84;
      }
      v85 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v84 + 6);
      if (!v85)
      {
        v85 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v85);
        *((_QWORD *)v84 + 6) = v85;
      }
      v86 = (CoreML::Specification::WeightParams *)*((_QWORD *)v85 + 6);
      if (!v86)
      {
        v86 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v86);
        *((_QWORD *)v85 + 6) = v86;
      }
      v87 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v83, v86, a4);

      if (!v87)
        goto LABEL_194;
      objc_msgSend(v13, "hiddenWeights");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "data");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v91 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v91 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v91);
        *(_QWORD *)(v9 + 128) = v91;
      }
      v92 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v91 + 6);
      if (!v92)
      {
        v92 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v92);
        *((_QWORD *)v91 + 6) = v92;
      }
      v93 = (CoreML::Specification::WeightParams *)*((_QWORD *)v92 + 7);
      if (!v93)
      {
        v93 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v93);
        *((_QWORD *)v92 + 7) = v93;
      }
      v94 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v90, v93, a4);

      if (!v94)
        goto LABEL_194;
      objc_msgSend(v13, "hiddenWeights");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectAtIndexedSubscript:", 2);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "data");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v98 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v98 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v98);
        *(_QWORD *)(v9 + 128) = v98;
      }
      v99 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v98 + 6);
      if (!v99)
      {
        v99 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v99);
        *((_QWORD *)v98 + 6) = v99;
      }
      v100 = (CoreML::Specification::WeightParams *)*((_QWORD *)v99 + 8);
      if (!v100)
      {
        v100 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v100);
        *((_QWORD *)v99 + 8) = v100;
      }
      v101 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v97, v100, a4);

      if (!v101)
        goto LABEL_194;
      objc_msgSend(v13, "hiddenWeights");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectAtIndexedSubscript:", 3);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "data");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v105 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 420;
        v105 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
        CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v105);
        *(_QWORD *)(v9 + 128) = v105;
      }
      v106 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v105 + 6);
      if (!v106)
      {
        v106 = (CoreML::Specification::LSTMWeightParams *)operator new();
        CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v106);
        *((_QWORD *)v105 + 6) = v106;
      }
      v107 = (CoreML::Specification::WeightParams *)*((_QWORD *)v106 + 9);
      if (!v107)
      {
        v107 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v107);
        *((_QWORD *)v106 + 9) = v107;
      }
      v108 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v104, v107, a4);

      if (!v108)
        goto LABEL_194;
      if (*(_DWORD *)(v9 + 140) == 420)
      {
        v110 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v109);
        v110 = &CoreML::Specification::_UniDirectionalLSTMLayerParams_default_instance_;
      }
      v111 = (uint64_t *)v110[5];
      if (!v111)
        v111 = &CoreML::Specification::_LSTMParams_default_instance_;
      if (*((_BYTE *)v111 + 21))
      {
        objc_msgSend(v13, "biases");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "objectAtIndexedSubscript:", 0);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "data");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 420)
        {
          v115 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          v115 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
          CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v115);
          *(_QWORD *)(v9 + 128) = v115;
        }
        v120 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v115 + 6);
        if (!v120)
        {
          v120 = (CoreML::Specification::LSTMWeightParams *)operator new();
          CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v120);
          *((_QWORD *)v115 + 6) = v120;
        }
        v121 = (CoreML::Specification::WeightParams *)*((_QWORD *)v120 + 10);
        if (!v121)
        {
          v121 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v121);
          *((_QWORD *)v120 + 10) = v121;
        }
        v122 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v114, v121, a4);

        if (!v122)
          goto LABEL_194;
        objc_msgSend(v13, "biases");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "objectAtIndexedSubscript:", 1);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "data");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 420)
        {
          v126 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          v126 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
          CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v126);
          *(_QWORD *)(v9 + 128) = v126;
        }
        v128 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v126 + 6);
        if (!v128)
        {
          v128 = (CoreML::Specification::LSTMWeightParams *)operator new();
          CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v128);
          *((_QWORD *)v126 + 6) = v128;
        }
        v129 = (CoreML::Specification::WeightParams *)*((_QWORD *)v128 + 11);
        if (!v129)
        {
          v129 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v129);
          *((_QWORD *)v128 + 11) = v129;
        }
        v130 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v125, v129, a4);

        if (!v130)
          goto LABEL_194;
        objc_msgSend(v13, "biases");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "objectAtIndexedSubscript:", 2);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "data");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 420)
        {
          v134 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          v134 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
          CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v134);
          *(_QWORD *)(v9 + 128) = v134;
        }
        v135 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v134 + 6);
        if (!v135)
        {
          v135 = (CoreML::Specification::LSTMWeightParams *)operator new();
          CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v135);
          *((_QWORD *)v134 + 6) = v135;
        }
        v136 = (CoreML::Specification::WeightParams *)*((_QWORD *)v135 + 12);
        if (!v136)
        {
          v136 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v136);
          *((_QWORD *)v135 + 12) = v136;
        }
        v137 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v133, v136, a4);

        if (!v137)
          goto LABEL_194;
        objc_msgSend(v13, "biases");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "data");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 420)
        {
          v139 = *(CoreML::Specification::UniDirectionalLSTMLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 420;
          v139 = (CoreML::Specification::UniDirectionalLSTMLayerParams *)operator new();
          CoreML::Specification::UniDirectionalLSTMLayerParams::UniDirectionalLSTMLayerParams(v139);
          *(_QWORD *)(v9 + 128) = v139;
        }
        v140 = (CoreML::Specification::LSTMWeightParams *)*((_QWORD *)v139 + 6);
        if (!v140)
        {
          v140 = (CoreML::Specification::LSTMWeightParams *)operator new();
          CoreML::Specification::LSTMWeightParams::LSTMWeightParams(v140);
          *((_QWORD *)v139 + 6) = v140;
        }
        v141 = (CoreML::Specification::WeightParams *)*((_QWORD *)v140 + 13);
        if (!v141)
        {
          v141 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v141);
          *((_QWORD *)v140 + 13) = v141;
        }
        v142 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v138, v141, a4);

        goto LABEL_191;
      }
    }
    else if (v14 == 1045 && *(_DWORD *)(v9 + 24) == 1)
    {
      objc_msgSend(v13, "weights");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 1045)
      {
        v17 = *(CoreML::Specification::BatchedMatMulLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 1045;
        v17 = (CoreML::Specification::BatchedMatMulLayerParams *)operator new();
        CoreML::Specification::BatchedMatMulLayerParams::BatchedMatMulLayerParams(v17);
        *(_QWORD *)(v9 + 128) = v17;
      }
      v116 = (CoreML::Specification::WeightParams *)*((_QWORD *)v17 + 2);
      if (!v116)
      {
        v116 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v116);
        *((_QWORD *)v17 + 2) = v116;
      }
      v117 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v16, v116, a4);

      if (!v117)
        goto LABEL_194;
      if (*(_DWORD *)(v9 + 140) == 1045)
      {
        v119 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v118);
        v119 = &CoreML::Specification::_BatchedMatMulLayerParams_default_instance_;
      }
      if (*((_BYTE *)v119 + 50))
      {
        objc_msgSend(v13, "biases");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "data");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 1045)
        {
          v127 = *(CoreML::Specification::BatchedMatMulLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 1045;
          v127 = (CoreML::Specification::BatchedMatMulLayerParams *)operator new();
          CoreML::Specification::BatchedMatMulLayerParams::BatchedMatMulLayerParams(v127);
          *(_QWORD *)(v9 + 128) = v127;
        }
        v77 = (CoreML::Specification::WeightParams *)*((_QWORD *)v127 + 3);
        if (!v77)
        {
          v77 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v77);
          *((_QWORD *)v127 + 3) = v77;
        }
        goto LABEL_190;
      }
    }
LABEL_192:

    ++v8;
    v7 = v144;
    if (v8 >= *(int *)(v144 + 8))
      return 1;
  }
  if (v14 != 100)
  {
    if (v14 == 140)
    {
      objc_msgSend(v13, "weights");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(v9 + 140) == 140)
      {
        v20 = *(CoreML::Specification::InnerProductLayerParams **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
        *(_DWORD *)(v9 + 140) = 140;
        v20 = (CoreML::Specification::InnerProductLayerParams *)operator new();
        CoreML::Specification::InnerProductLayerParams::InnerProductLayerParams(v20);
        *(_QWORD *)(v9 + 128) = v20;
      }
      v31 = (CoreML::Specification::WeightParams *)*((_QWORD *)v20 + 2);
      if (!v31)
      {
        v31 = (CoreML::Specification::WeightParams *)operator new();
        CoreML::Specification::WeightParams::WeightParams(v31);
        *((_QWORD *)v20 + 2) = v31;
      }
      v32 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v19, v31, a4);

      if (!v32)
        goto LABEL_194;
      if (*(_DWORD *)(v9 + 140) == 140)
      {
        v34 = *(uint64_t **)(v9 + 128);
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v33);
        v34 = &CoreML::Specification::_InnerProductLayerParams_default_instance_;
      }
      if (*((_BYTE *)v34 + 48))
      {
        objc_msgSend(v13, "biases");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "data");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)(v9 + 140) == 140)
        {
          v53 = *(CoreML::Specification::InnerProductLayerParams **)(v9 + 128);
        }
        else
        {
          CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
          *(_DWORD *)(v9 + 140) = 140;
          v53 = (CoreML::Specification::InnerProductLayerParams *)operator new();
          CoreML::Specification::InnerProductLayerParams::InnerProductLayerParams(v53);
          *(_QWORD *)(v9 + 128) = v53;
        }
        v77 = (CoreML::Specification::WeightParams *)*((_QWORD *)v53 + 3);
        if (!v77)
        {
          v77 = (CoreML::Specification::WeightParams *)operator new();
          CoreML::Specification::WeightParams::WeightParams(v77);
          *((_QWORD *)v53 + 3) = v77;
        }
        goto LABEL_190;
      }
    }
    goto LABEL_192;
  }
  objc_msgSend(v13, "weights");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "data");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(v9 + 140) == 100)
  {
    v30 = *(CoreML::Specification::ConvolutionLayerParams **)(v9 + 128);
  }
  else
  {
    CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
    *(_DWORD *)(v9 + 140) = 100;
    v30 = (CoreML::Specification::ConvolutionLayerParams *)operator new();
    CoreML::Specification::ConvolutionLayerParams::ConvolutionLayerParams(v30);
    *(_QWORD *)(v9 + 128) = v30;
  }
  v40 = (CoreML::Specification::WeightParams *)*((_QWORD *)v30 + 14);
  if (!v40)
  {
    v40 = (CoreML::Specification::WeightParams *)operator new();
    CoreML::Specification::WeightParams::WeightParams(v40);
    *((_QWORD *)v30 + 14) = v40;
  }
  v41 = -[MLNeuralNetworkMLComputeGraph copyWeightsFrom:to:error:](self, "copyWeightsFrom:to:error:", v29, v40, a4);

  if (v41)
  {
    if (*(_DWORD *)(v9 + 140) == 100)
    {
      v43 = *(uint64_t **)(v9 + 128);
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v42);
      v43 = &CoreML::Specification::_ConvolutionLayerParams_default_instance_;
    }
    if (!*((_BYTE *)v43 + 153))
      goto LABEL_192;
    objc_msgSend(v13, "biases");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "data");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_DWORD *)(v9 + 140) == 100)
    {
      v54 = *(CoreML::Specification::ConvolutionLayerParams **)(v9 + 128);
    }
    else
    {
      CoreML::Specification::NeuralNetworkLayer::clear_layer(v9);
      *(_DWORD *)(v9 + 140) = 100;
      v54 = (CoreML::Specification::ConvolutionLayerParams *)operator new();
      CoreML::Specification::ConvolutionLayerParams::ConvolutionLayerParams(v54);
      *(_QWORD *)(v9 + 128) = v54;
    }
    v77 = (CoreML::Specification::WeightParams *)*((_QWORD *)v54 + 15);
    if (!v77)
    {
      v77 = (CoreML::Specification::WeightParams *)operator new();
      CoreML::Specification::WeightParams::WeightParams(v77);
      *((_QWORD *)v54 + 15) = v77;
    }
    goto LABEL_190;
  }
LABEL_194:

  return 0;
}

- (id)createMultiArrayFromTensor:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MLMultiArray *v12;

  v5 = a3;
  objc_msgSend(v5, "data");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");

  objc_msgSend(v5, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", v7, v9, 65568, v11, 0, a4);
  return v12;
}

- (id)getWeightsForLayerNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[MLNeuralNetworkMLComputeGraph layersMap](self, "layersMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "weights");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeGraph createMultiArrayFromTensor:error:](self, "createMultiArrayFromTensor:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 7, CFSTR("%@ layer does not contain weights"), v6);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getBiasesForLayerNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[MLNeuralNetworkMLComputeGraph layersMap](self, "layersMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "biases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeGraph createMultiArrayFromTensor:error:](self, "createMultiArrayFromTensor:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 7, CFSTR("%@ layer does not contain bias terms"), v6);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MLCGraph)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (MLCTrainingGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setTrainingGraph:(id)a3
{
  objc_storeStrong((id *)&self->_trainingGraph, a3);
}

- (MLCInferenceGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setInferenceGraph:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceGraph, a3);
}

- (NSDictionary)mlcInputs
{
  return self->_mlcInputs;
}

- (void)setMlcInputs:(id)a3
{
  objc_storeStrong((id *)&self->_mlcInputs, a3);
}

- (NSDictionary)mlcLabels
{
  return self->_mlcLabels;
}

- (void)setMlcLabels:(id)a3
{
  objc_storeStrong((id *)&self->_mlcLabels, a3);
}

- (NSDictionary)outputNameToLayerMap
{
  return self->_outputNameToLayerMap;
}

- (unint64_t)executionOptions
{
  return self->_executionOptions;
}

- (void)setExecutionOptions:(unint64_t)a3
{
  self->_executionOptions = a3;
}

- (BOOL)classifierOutputIsSigmoidOutput
{
  return self->_classifierOutputIsSigmoidOutput;
}

- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3
{
  self->_classifierOutputIsSigmoidOutput = a3;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
  objc_storeStrong((id *)&self->_modelDescription, a3);
}

- (NSDictionary)layersMap
{
  return self->_layersMap;
}

- (void)setLayersMap:(id)a3
{
  objc_storeStrong((id *)&self->_layersMap, a3);
}

- (BOOL)layerFusedToLoss
{
  return self->_layerFusedToLoss;
}

- (void)setLayerFusedToLoss:(BOOL)a3
{
  self->_layerFusedToLoss = a3;
}

- (NSString)fusedLayerInputName
{
  return self->_fusedLayerInputName;
}

- (void)setFusedLayerInputName:(id)a3
{
  objc_storeStrong((id *)&self->_fusedLayerInputName, a3);
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fusedLayerInputName, 0);
  objc_storeStrong((id *)&self->_layersMap, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_outputNameToLayerMap, 0);
  objc_storeStrong((id *)&self->_mlcLabels, 0);
  objc_storeStrong((id *)&self->_mlcInputs, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

+ (id)graphFromCompiledArchive:(void *)a3 modelDescription:(id)a4 batchSize:(unint64_t)a5 numberOfClasses:(unint64_t)a6 computeUnits:(int64_t)a7 error:(id *)a8
{
  id v13;
  MLNeuralNetworkMLComputeGraph *v14;

  v13 = a4;
  v14 = -[MLNeuralNetworkMLComputeGraph initWithCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:]([MLNeuralNetworkMLComputeGraph alloc], "initWithCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:", a3, v13, a5, a6, a7, a8);

  return v14;
}

@end
