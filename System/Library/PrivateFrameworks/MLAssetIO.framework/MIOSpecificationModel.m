@implementation MIOSpecificationModel

- (MIOSpecificationModel)initWithSpecificationData:(id)a3 parserContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  MIOSpecificationModel *v14;
  _QWORD v16[3];
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_specificationData, a3);
  objc_storeStrong((id *)&self->_parserContext, a4);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");
  v16[0] = v12;
  v16[1] = v12 + v13;
  v16[2] = 0;
  v17 = v13;
  v18 = 0;
  v19 = 0;
  v20 = v13;
  v21 = 0x7FFFFFFF00000000;
  v22 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v23 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v24 = 1;
  v25 = 0;
  v26 = 0;
  v14 = -[MIOSpecificationModel initWithMessageStream:parserContext:error:](self, "initWithMessageStream:parserContext:error:", v16, v10, a5);
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)v16);

  return v14;
}

- (MIOSpecificationModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5
{
  id v7;
  MIOModelDescription *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  _QWORD *i;
  void *v15;
  uint64_t v16;
  MIOModelDescription *v17;
  MIOVersionInfo *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  MIOSpecificationModel *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  MIOParserContext *v35;
  int v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  int v39;
  __CFString *v40;
  int v41;
  id obj[2];
  _OWORD v43[2];
  uint64_t v44;
  objc_super v45;
  void **v46[5];

  v46[3] = *(void ***)MEMORY[0x1E0C80C00];
  v35 = (MIOParserContext *)a4;
  v45.receiver = self;
  v45.super_class = (Class)MIOSpecificationModel;
  v7 = -[MIOSpecificationModel init](&v45, sel_init);
  if (!v7)
  {
LABEL_23:
    v28 = (MIOSpecificationModel *)v7;
    goto LABEL_32;
  }
  v36 = 0;
  v40 = 0;
  v41 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  *(_OWORD *)obj = 0u;
  memset(v43, 0, sizeof(v43));
  v44 = 0;
  MIOParseModelSpecification(a3, v35, (MIOModelInfo *)&v36);
  v8 = [MIOModelDescription alloc];
  v9 = v37;
  v10 = v39;
  v11 = *(_QWORD *)&v43[0];
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v13 = (_QWORD *)*((_QWORD *)&v43[0] + 1);
  for (i = *(_QWORD **)&v43[1]; v13 != i; v13 += 5)
  {
    if (*v13)
    {
      objc_msgSend(v12, "addObject:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

    }
  }
  if (v11)
    v16 = v11;
  else
    v16 = MEMORY[0x1E0C9AA60];
  v17 = -[MIOModelDescription initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:](v8, "initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:", v9, v10 != 0, v16, v12, a5);

  if (v17)
  {
    v18 = [MIOVersionInfo alloc];
    v19 = -[MIOVersionInfo initWithMajor:minor:patch:](v18, "initWithMajor:minor:patch:", v36, 0, 0);
    v20 = (void *)*((_QWORD *)v7 + 5);
    *((_QWORD *)v7 + 5) = v19;

    if (v40)
      v21 = v40;
    else
      v21 = CFSTR("UNKNOWN");
    objc_storeStrong((id *)v7 + 6, v21);
    objc_storeStrong((id *)v7 + 9, obj[0]);
    objc_storeStrong((id *)v7 + 8, obj[1]);
    objc_storeStrong((id *)v7 + 7, v17);
    std::vector<MIOFunctionInfo>::__vdeallocate((id **)v7 + 2);
    *((_OWORD *)v7 + 1) = *(_OWORD *)((char *)v43 + 8);
    *((_QWORD *)v7 + 4) = *((_QWORD *)&v43[1] + 1);
    memset((char *)v43 + 8, 0, 24);
    v22 = v44;
    v44 = 0;
    v23 = *((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v22;
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);

    v24 = v44;
    v44 = 0;
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
    v46[0] = (void **)v43 + 1;
    std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100](v46);

    v25 = v38;
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    goto LABEL_23;
  }
  v29 = v44;
  v44 = 0;
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  v46[0] = (void **)v43 + 1;
  std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100](v46);

  v30 = v38;
  if (v38)
  {
    v31 = (unint64_t *)&v38->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v28 = 0;
LABEL_32:

  return v28;
}

- (unint64_t)_indexForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4
    || (-[MIOSpecificationModel modelDescription](self, "modelDescription"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "defaultFunctionName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    -[MIOSpecificationModel modelDescription](self, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "functionDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__MIOSpecificationModel__indexForFunctionNamed___block_invoke;
    v12[3] = &unk_1E9568C68;
    v9 = v5;
    v13 = v9;
    v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __48__MIOSpecificationModel__indexForFunctionNamed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[MIOSpecificationModel _indexForFunctionNamed:](self, "_indexForFunctionNamed:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 2);
  return v5;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[MIOSpecificationModel _indexForFunctionNamed:](self, "_indexForFunctionNamed:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 1);
  return v5;
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[MIOSpecificationModel _indexForFunctionNamed:](self, "_indexForFunctionNamed:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 3);
  return v5;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[MIOSpecificationModel _indexForFunctionNamed:](self, "_indexForFunctionNamed:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 4);
  return v5;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  char *v10;
  void *v11;
  int v12;
  int Field;
  BOOL v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  _BYTE *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  _BYTE *v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _BYTE v52[176];
  _BYTE v53[32];
  CodedInputStream v54;
  char v55[8];
  _BYTE *v56;
  int v57;
  _BYTE v58[80];
  uint64_t v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MIOSpecificationModel specificationData](self, "specificationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = open((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 1537, 420);
    google::protobuf::io::FileOutputStream::FileOutputStream((uint64_t)v58, v8, -1);
    google::protobuf::io::CodedOutputStream::CodedOutputStream((uint64_t)v55, (uint64_t)v58);
    -[MIOSpecificationModel specificationData](self, "specificationData");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (char *)objc_msgSend(v9, "bytes");
    -[MIOSpecificationModel specificationData](self, "specificationData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");
    v54.var0 = v10;
    v54.var1 = &v10[v12];
    v54.var2 = 0;
    v54.var3 = v12;
    *(_QWORD *)&v54.var4 = 0;
    *(_WORD *)&v54.var6 = 0;
    *(_QWORD *)&v54.var9 = 0x7FFFFFFF00000000;
    v54.var8 = v12;
    v54.var11 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
    v54.var12 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
    v54.var13 = 1;
    v54.var14 = 0;
    v54.var15 = 0;

    MLAssetIO::ProtoWireFormatParser::ProtoWireFormatParser((uint64_t)v53, &v54);
    while (1)
    {
      Field = MLAssetIO::ProtoWireFormatParser::nextField((MLAssetIO::ProtoWireFormatParser *)v53);
      v14 = Field == 0;
      if (!Field)
        break;
      v15 = MLAssetIO::ProtoWireFormatParser::tag((MLAssetIO::ProtoWireFormatParser *)v53);
      v16 = v15;
      if (v57 < 5)
      {
        google::protobuf::io::CodedOutputStream::WriteVarint32SlowPath((google::protobuf::io::CodedOutputStream *)v55, v15);
      }
      else
      {
        v17 = (int)v56;
        if (v15 < 0x80)
        {
          LOBYTE(v19) = v15;
          v18 = v56;
        }
        else
        {
          v18 = v56;
          do
          {
            *v18++ = v16 | 0x80;
            v19 = v16 >> 7;
            v20 = v16 >> 14;
            v16 >>= 7;
          }
          while (v20);
        }
        *v18 = v19;
        v21 = (_DWORD)v18 - v17 + 1;
        v56 += v21;
        v57 -= v21;
      }
      if (Field == 2)
      {
        CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v52, (const CoreML::Specification::ModelDescription *)-[MIOModelDescription modelDescriptionSpecification](self->_modelDescription, "modelDescriptionSpecification"));
        v22 = google::protobuf::MessageLite::ByteSize((google::protobuf::MessageLite *)v52);
        v23 = v22;
        if (v57 < 5)
        {
          google::protobuf::io::CodedOutputStream::WriteVarint32SlowPath((google::protobuf::io::CodedOutputStream *)v55, v22);
        }
        else
        {
          v24 = (int)v56;
          if (v22 < 0x80)
          {
            LOBYTE(v26) = v22;
            v25 = v56;
          }
          else
          {
            v25 = v56;
            do
            {
              *v25++ = v23 | 0x80;
              v26 = v23 >> 7;
              v27 = v23 >> 14;
              v23 >>= 7;
            }
            while (v27);
          }
          *v25 = v26;
          v28 = (_DWORD)v25 - v24 + 1;
          v56 += v28;
          v57 -= v28;
        }
        if ((google::protobuf::MessageLite::SerializeToCodedStream((google::protobuf::MessageLite *)v52, (google::protobuf::io::CodedOutputStream *)v55) & 1) == 0)
        {
          v40 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v40)
            -[MIOSpecificationModel writeToURL:error:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);
          if (a4)
          {
            v48 = (void *)MEMORY[0x1E0CB35C8];
            v59 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize ModelDescription message"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v49;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v50);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v52);
          break;
        }
        CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v52);
      }
      else
      {
        MLAssetIO::ProtoWireFormatParser::copyFieldTo((uint64_t)v53, (google::protobuf::io::CodedOutputStream *)v55);
      }
    }
    google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v54);
    google::protobuf::io::CodedOutputStream::~CodedOutputStream((google::protobuf::io::CodedOutputStream *)v55);
    google::protobuf::io::FileOutputStream::~FileOutputStream((google::protobuf::io::FileOutputStream *)v58);
  }
  else
  {
    v29 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v29)
      -[MIOSpecificationModel writeToURL:error:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    if (a4)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model instance must be initialized with an existing model file to write the content back to a file."));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
  }

  return v14;
}

- (void)irProgram
{
  return self->_irProgram.__ptr_.__value_;
}

- (BOOL)isEqual:(id)a3
{
  MIOSpecificationModel *v4;
  MIOSpecificationModel *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (MIOSpecificationModel *)a3;
  if (self == v4)
  {
    v20 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  -[MIOSpecificationModel specificationVersion](self, "specificationVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel specificationVersion](v5, "specificationVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_8;
  -[MIOSpecificationModel modelTypeName](self, "modelTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel modelTypeName](v5, "modelTypeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
    goto LABEL_8;
  -[MIOSpecificationModel modelDescription](self, "modelDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel modelDescription](v5, "modelDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
    goto LABEL_8;
  -[MIOSpecificationModel layers](self, "layers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel layers](v5, "layers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v16)
  {

    goto LABEL_14;
  }
  -[MIOSpecificationModel layers](self, "layers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel layers](v5, "layers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if ((v19 & 1) != 0)
  {
LABEL_14:
    -[MIOSpecificationModel subModels](self, "subModels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOSpecificationModel subModels](v5, "subModels");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v23)
    {
      v20 = 1;
      v23 = v22;
    }
    else
    {
      -[MIOSpecificationModel subModels](self, "subModels");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOSpecificationModel subModels](v5, "subModels");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v24, "isEqual:", v25);

    }
    goto LABEL_9;
  }
LABEL_8:
  v20 = 0;
LABEL_9:

LABEL_12:
  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIOSpecificationModel modelTypeName](self, "modelTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIOSpecificationModel modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MIOSpecificationModel *v4;
  void *v5;
  void *v6;
  MIOSpecificationModel *v7;
  id v8;
  NSObject *v9;
  MIOSpecificationModel *v10;
  void *v11;
  void *v12;
  id v14;

  v4 = [MIOSpecificationModel alloc];
  -[MIOSpecificationModel specificationData](self, "specificationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationModel parserContext](self, "parserContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = -[MIOSpecificationModel initWithSpecificationData:parserContext:error:](v4, "initWithSpecificationData:parserContext:error:", v5, v6, &v14);
  v8 = v14;

  if (v8)
  {
    +[MIOLogging coreChannel](MIOLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MIOSpecificationModel copyWithZone:].cold.1((uint64_t)self, (uint64_t)v8, v9);

    v10 = 0;
  }
  else
  {
    -[MIOSpecificationModel modelDescription](self, "modelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[MIOSpecificationModel setModelDescription:](v7, "setModelDescription:", v12);

    v10 = v7;
  }

  return v10;
}

- (MIOVersionInfo)specificationVersion
{
  return self->_specificationVersion;
}

- (NSString)modelTypeName
{
  return self->_modelTypeName;
}

- (MIOModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)layers
{
  return self->_layers;
}

- (NSArray)subModels
{
  return self->_subModels;
}

- (NSData)specificationData
{
  return self->_specificationData;
}

- (MIOParserContext)parserContext
{
  return self->_parserContext;
}

- (void).cxx_destruct
{
  IRProgram *value;
  vector<MIOFunctionInfo, std::allocator<MIOFunctionInfo>> *p_functions;

  objc_storeStrong((id *)&self->_parserContext, 0);
  objc_storeStrong((id *)&self->_specificationData, 0);
  objc_storeStrong((id *)&self->_subModels, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_modelTypeName, 0);
  objc_storeStrong((id *)&self->_specificationVersion, 0);
  p_functions = &self->_functions;
  std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_functions);
  value = self->_irProgram.__ptr_.__value_;
  self->_irProgram.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(IRProgram *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)initWithMessageStream:(uint64_t)a1 parserContext:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v2 = 136315138;
  v3 = v1;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to parse the model specification. Error: %s", (uint8_t *)&v2, 0xCu);
}

- (void)writeToURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], a3, "Model instance must be initialized with an existing model file to write the content back to a file.", a5, a6, a7, a8, 0);
}

- (void)writeToURL:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], a3, "Failed to serialize ModelDescription message", a5, a6, a7, a8, 0);
}

- (void)copyWithZone:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "Failed to clone %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end
