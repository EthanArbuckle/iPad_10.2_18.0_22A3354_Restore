@implementation MLModelIOUtils

+ (id)descriptionFromProto:(const void *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *((int *)a3 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureDescriptionsFromProto:", a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)populateConstraintsForFeatureDescription:(const void *)a3
{
  double v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  MLSequenceConstraint *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = &CoreML::Specification::_FeatureType_default_instance_;
  if (*((_QWORD *)a3 + 4))
    v4 = (uint64_t *)*((_QWORD *)a3 + 4);
  switch(*((_DWORD *)v4 + 9))
  {
    case 4:
      +[MLModelIOUtils populateConstraintsForImageFeatureDescription:](MLModelIOUtils, "populateConstraintsForImageFeatureDescription:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 5:
      v8 = 0;
      v9 = v4[3];
      v10 = *(_DWORD *)(v9 + 36);
      v11 = 65600;
      if (v10 > 65599)
      {
        if (v10 == 65600)
        {
          v31 = 0.0;
          if (*(_DWORD *)(v9 + 64) == 61)
            v31 = *(double *)(v9 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v12 = objc_claimAutoreleasedReturnValue();
          v11 = 65600;
        }
        else
        {
          if (v10 != 131104)
            goto LABEL_43;
          if (*(_DWORD *)(v9 + 64) == 41)
            v28 = *(unsigned int *)(v9 + 48);
          else
            v28 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
          v12 = objc_claimAutoreleasedReturnValue();
          v11 = 131104;
        }
        goto LABEL_42;
      }
      if (v10 != 65552)
      {
        if (v10 != 65568)
          goto LABEL_43;
        LODWORD(v3) = 0;
        if (*(_DWORD *)(v9 + 64) == 51)
          LODWORD(v3) = *(_DWORD *)(v9 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
        v12 = objc_claimAutoreleasedReturnValue();
        v11 = 65568;
LABEL_42:
        v8 = (void *)v12;
        goto LABEL_43;
      }
      LODWORD(v3) = 0;
      if (*(_DWORD *)(v9 + 64) == 51)
        LODWORD(v3) = *(_DWORD *)(v9 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 65552;
LABEL_43:
      +[MLModelIOUtils populateConstraintsForArrayFeatureType:dataType:constraintClass:defaultOptionalValue:](MLModelIOUtils, "populateConstraintsForArrayFeatureType:dataType:constraintClass:defaultOptionalValue:", v9, v11, objc_opt_class(), v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      return v32;
    case 6:
      v13 = *(_DWORD *)(v4[3] + 28);
      if (v13 == 2)
      {
        +[MLDictionaryConstraint constraintWithStringKeys](MLDictionaryConstraint, "constraintWithStringKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        return v30;
      }
      else if (v13 == 1)
      {
        +[MLDictionaryConstraint constraintWithInt64Keys](MLDictionaryConstraint, "constraintWithInt64Keys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        return v15;
      }
      else
      {
        return 0;
      }
    case 7:
      v17 = v4[3];
      if (*(_QWORD *)(v17 + 16))
        v18 = *(uint64_t **)(v17 + 16);
      else
        v18 = &CoreML::Specification::_SizeRange_default_instance_;
      v19 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:](MLModelIOUtils, "rangeFromAllowedSizeRangeProtoMessage:", v18);
      v21 = v20;
      v22 = *(_DWORD *)(v17 + 36);
      v23 = 3;
      if (v22 != 3)
        v23 = 0;
      if (v22 == 1)
        v24 = 1;
      else
        v24 = v23;
      +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", CFSTR("values"), v24, 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MLSequenceConstraint initWithValueDescription:countRange:]([MLSequenceConstraint alloc], "initWithValueDescription:countRange:", v25, v19, v21);
      v35[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      return v27;
    case 8:
      v6 = v4[3];
      if (*(_DWORD *)(v6 + 28) == 1)
      {
        v7 = *(uint64_t **)(v6 + 16);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)a1);
        v7 = &CoreML::Specification::_ArrayFeatureType_default_instance_;
      }
      +[MLModelIOUtils populateConstraintsForArrayFeatureType:dataType:constraintClass:defaultOptionalValue:](MLModelIOUtils, "populateConstraintsForArrayFeatureType:dataType:constraintClass:defaultOptionalValue:", v7, 65552, objc_opt_class(), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    default:
      return 0;
  }
}

+ (id)deserializeVersionInfoFromArchive:(void *)a3 error:(id *)a4
{
  std::string *p_p;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  std::string __p;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;
  v11 = 0;
  v12 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_19CB39696);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = &stru_1E3D68DC8;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", v13, v12, v11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v8;
}

+ (id)deserializeMetadataAndInterfaceFromArchive:(void *)a3 error:(id *)a4
{
  MLModelDescription *v6;
  MLModel *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CoreML::Specification::ModelDescription *v12;
  std::__shared_weak_count *v13;

  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if (+[MLModelIOUtils deserializeInterfaceFormat:archive:error:](MLModelIOUtils, "deserializeInterfaceFormat:archive:error:", &v12, a3, a4))
  {
    v6 = -[MLModelDescription initWithModelDescriptionSpecification:error:]([MLModelDescription alloc], "initWithModelDescriptionSpecification:error:", &v12, a4);
    v7 = -[MLModel initWithDescription:]([MLModel alloc], "initWithDescription:", v6);

  }
  else
  {
    v7 = 0;
  }
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

+ (id)orderedFeatureNamesFromInterface:(void *)a3 forInput:(BOOL)a4
{
  uint64_t v4;

  v4 = 40;
  if (a4)
    v4 = 16;
  objc_msgSend(a1, "orderedNamesFromProto:", *(_QWORD *)a3 + v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)orderedNamesFromProto:(const void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  v5 = *((_QWORD *)a3 + 2);
  if (v5)
    v6 = v5 + 8;
  else
    v6 = 0;
  v7 = *((int *)a3 + 2);
  if ((_DWORD)v7)
  {
    v8 = 8 * v7;
    do
    {
      v9 = *(uint64_t **)(*(_QWORD *)v6 + 16);
      if (*((char *)v9 + 23) < 0)
        v9 = (uint64_t *)*v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      v6 += 8;
      v8 -= 8;
    }
    while (v8);
  }
  return v4;
}

+ (id)trainingInputDescriptionFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "descriptionFromProto:", *(_QWORD *)a3 + 112);
}

+ (id)outputDescriptionFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "descriptionFromProto:", *(_QWORD *)a3 + 40);
}

+ (id)inputDescriptionFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "descriptionFromProto:", *(_QWORD *)a3 + 16);
}

+ (BOOL)deserializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  google::protobuf::MessageLite *v15;
  std::string *v16;
  std::string::size_type size;
  uint64_t v18;
  int v19;
  BOOL v20;
  void *p_p;
  uint64_t v22;
  uint64_t v24;
  void *__p;
  char v26;
  __int128 v27;
  _QWORD v28[11];
  char v29;
  uint64_t v30;
  std::string v31;
  void *v32;
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
  _QWORD v45[2];
  _QWORD v46[2];
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;

  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::ModelDescription **)&v27);
  v8 = v27;
  v27 = 0uLL;
  v9 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  *(_OWORD *)a3 = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = *(google::protobuf::MessageLite **)a3;
  memset(&v31, 0, sizeof(v31));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v27);
  operator>>((uint64_t)a4, &v31);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &v31;
  else
    v16 = (std::string *)v31.__r_.__value_.__r.__words[0];
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
  else
    size = v31.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)v16, size);
  v44 = &off_1E3D598A0;
  v45[0] = &off_1E3D59870;
  v45[1] = &v27;
  v46[0] = &off_1E3D59950;
  v46[1] = v45;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v51 = 0;
  v50 = 0x2000;
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
  v18 = v35 + SHIDWORD(v38);
  v35 = v18;
  v19 = v37[0] - v38;
  if (v37[0] <= (int)v38)
    v19 = 0;
  else
    v35 = v18 - v19;
  HIDWORD(v38) = v19;
  if ((google::protobuf::MessageLite::ParseFromCodedStream(v15, (google::protobuf::io::CodedInputStream *)&v34) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)&v24);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v32, "unable to deserialize object");
    v24 = 5;
    std::operator+<char>();
    if (v33 < 0)
      operator delete(v32);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v34);
  v44 = &off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v46);
  v20 = (v24 & 0xFFFFFFEF) == 0;
  if (a5 && (v24 & 0xFFFFFFEF) != 0)
  {
    p_p = &__p;
    if (v26 < 0)
      p_p = __p;
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%s"), p_p);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v26 < 0)
    operator delete(__p);
  *(_QWORD *)&v27 = *MEMORY[0x1E0DE4F50];
  v22 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)&v28[-2] + *(_QWORD *)(v27 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v28[0] = v22;
  v28[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v29 < 0)
    operator delete((void *)v28[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A1AD61C4](&v30);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  return v20;
}

+ (id)loadFromModelSpecificationInArchive:(void *)a3 withClass:(Class)a4 versionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  void *v21;
  char v22;
  _BYTE v23[48];
  void *__p;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void (***v28)(google::protobuf::io::IstreamInputStream *__hidden);
  int v29[4];
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(google::protobuf::io::IstreamInputStream *__hidden);
  _QWORD v37[2];
  _QWORD v38[2];
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;

  v10 = a6;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v23);
  v11 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)a3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)a3 + 32));
  v36 = &off_1E3D598A0;
  v37[0] = &off_1E3D59870;
  v37[1] = v11;
  v38[0] = &off_1E3D59950;
  v38[1] = v37;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v43 = 0;
  v42 = 0x2000;
  v26 = 0;
  v27 = 0;
  v28 = &v36;
  *(_QWORD *)v29 = 0;
  *(_QWORD *)((char *)&v29[1] + 2) = 0;
  v30 = 0x7FFFFFFFLL;
  v31 = 0x647FFFFFFFLL;
  v32 = 100;
  v33 = 1;
  v34 = 0;
  v35 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v26);
  LODWORD(v31) = 0x7FFFFFFF;
  v12 = v27 + SHIDWORD(v30);
  v27 = v12;
  v13 = v29[0] - v30;
  if (v29[0] <= (int)v30)
    v13 = 0;
  else
    v27 = v12 - v13;
  HIDWORD(v30) = v13;
  if ((google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v23, (google::protobuf::io::CodedInputStream *)&v26) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)&v20);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v20 = 5;
    std::operator+<char>();
    if (v25 < 0)
      operator delete(__p);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v26);
  v36 = &off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v38);
  if ((v20 & 0xFFFFFFEF) != 0)
  {
    if (a7)
    {
      v14 = &v21;
      if (v22 < 0)
        v14 = v21;
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%s"), v14);
      v15 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&v36, (const CoreML::Specification::Model *)v23);
    -[objc_class loadModelFromSpecification:configuration:error:](a4, "loadModelFromSpecification:configuration:error:", &v36, v10, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (std::__shared_weak_count *)v37[0];
    if (v37[0])
    {
      v17 = (unint64_t *)(v37[0] + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  if (v22 < 0)
    operator delete(v21);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v23);

  return v15;
}

+ (id)versionForSerializedSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("spec"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serializeSpecification:(void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  google::protobuf::MessageLite *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  char v14;
  void *__p;
  char v16;
  void (**v17)(google::protobuf::io::OstreamOutputStream *__hidden);
  _QWORD v18[4];
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = *(google::protobuf::MessageLite **)a3;
  v8 = (*(uint64_t (**)(_QWORD, SEL))(**((_QWORD **)a4 + 1) + 56))(*((_QWORD *)a4 + 1), a2);
  v17 = &off_1E3D59908;
  v18[0] = &off_1E3D598E0;
  v18[1] = v8;
  v18[2] = &off_1E3D59990;
  v18[3] = v18;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0x2000;
  if ((google::protobuf::MessageLite::SerializeToZeroCopyStream(v7, (google::protobuf::io::ZeroCopyOutputStream *)&v17) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)&v12);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to serialize object");
    v12 = 4;
    std::operator+<char>();
    if (v16 < 0)
      operator delete(__p);
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v17);
  if ((v12 & 0xFFFFFFEF) != 0)
  {
    if (a5)
    {
      v9 = &v13;
      if (v14 < 0)
        v9 = v13;
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%s"), v9);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v14 < 0)
    operator delete(v13);
  return v10;
}

+ (BOOL)serializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  google::protobuf::MessageLite *v7;
  BOOL v8;
  void *p_p;
  uint64_t v10;
  uint64_t v12;
  void *__p;
  char v14;
  _QWORD v15[2];
  _QWORD v16[11];
  char v17;
  uint64_t v18;
  void *v19;
  char v20;
  void (**v21)(google::protobuf::io::OstreamOutputStream *__hidden);
  void (**v22)(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *__hidden);
  _QWORD *v23;
  void (**v24)(google::protobuf::io::CopyingOutputStreamAdaptor *__hidden);
  void (***v25)(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *__hidden);
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v7 = *(google::protobuf::MessageLite **)a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  v21 = &off_1E3D59908;
  v22 = &off_1E3D598E0;
  v23 = v16;
  v24 = &off_1E3D59990;
  v25 = &v22;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0x2000;
  if ((google::protobuf::MessageLite::SerializeToZeroCopyStream(v7, (google::protobuf::io::ZeroCopyOutputStream *)&v21) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)&v12);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "unable to serialize object");
    v12 = 4;
    std::operator+<char>();
    if (v20 < 0)
      operator delete(v19);
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v21);
  v8 = (v12 & 0xFFFFFFEF) == 0;
  if ((v12 & 0xFFFFFFEF) != 0)
  {
    if (a5)
    {
      p_p = &__p;
      if (v14 < 0)
        p_p = __p;
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%s"), p_p);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    std::stringbuf::str();
    operator<<((uint64_t)a4, (uint64_t *)&v21);
    if (SHIBYTE(v23) < 0)
      operator delete(v21);
  }
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F50];
  v10 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v16[0] = v10;
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A1AD61C4](&v18);
  return v8;
}

+ (_NSRange)rangeFromAllowedSizeRangeProtoMessage:(const void *)a3
{
  unint64_t v3;
  NSUInteger v4;
  BOOL v5;
  unint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (*((_QWORD *)a3 + 2) >= 0x7FFFFFFFFFFFFFFFuLL)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = *((_QWORD *)a3 + 2);
  if (*((_QWORD *)a3 + 3) < 0x7FFFFFFFFFFFFFFFuLL)
    v3 = *((_QWORD *)a3 + 3);
  v5 = v3 >= v4;
  v6 = v3 - v4;
  if (v5)
    v7 = v6 + 1;
  else
    v7 = 0;
  result.length = v7;
  result.location = v4;
  return result;
}

+ (id)populateConstraintsForImageFeatureDescription:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MLImageSize *v11;
  MLImageSizeConstraint *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  uint64_t *v16;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v17;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  void *v22;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v23;
  uint64_t v24;
  unint64_t i;
  uint64_t *v26;
  MLImageSize *inited;
  MLImageSize *v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  MLImageSize *v33;
  NSObject *v34;
  NSObject *v35;
  MLImageSizeConstraint *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  MLImageSizeConstraint *v44;
  NSObject *v45;
  NSObject *v46;
  MLImageSize *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  MLImageSizeConstraint *v52;
  uint8_t buf[8];
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)*((_QWORD *)a3 + 4);
  if (!v3)
    v3 = &CoreML::Specification::_FeatureType_default_instance_;
  if (*((_DWORD *)v3 + 9) == 4)
  {
    v4 = (uint64_t *)v3[3];
  }
  else
  {
    CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)a1);
    v4 = &CoreML::Specification::_ImageFeatureType_default_instance_;
  }
  v5 = *((_DWORD *)v4 + 8);
  v6 = 30;
  v7 = 40;
  if (v5 != 40)
    v7 = 0;
  if (v5 != 30)
    v6 = v7;
  v8 = 10;
  v9 = 20;
  if (v5 != 20)
    v9 = 0;
  if (v5 != 10)
    v8 = v9;
  if (v5 <= 29)
    v10 = v8;
  else
    v10 = v6;
  v51 = v10;
  v11 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", v4[2], v4[3]);
  v12 = [MLImageSizeConstraint alloc];
  v55[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[MLImageSizeConstraint initWithEnumeratedImageSizes:](v12, "initWithEnumeratedImageSizes:", v13);

  if (-[MLImageSize pixelsWide](v11, "pixelsWide"))
    v14 = -[MLImageSize pixelsHigh](v11, "pixelsHigh") != 0;
  else
    v14 = 0;
  v15 = *((_DWORD *)v4 + 13);
  switch(v15)
  {
    case 0:
      if (v14)
        break;
      v22 = v52;
      v52 = -[MLImageSizeConstraint initUnspecified]([MLImageSizeConstraint alloc], "initUnspecified");
      goto LABEL_68;
    case 21:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_claimAutoreleasedReturnValue();
      v22 = v23;
      v24 = 0;
      for (i = 0; ; ++i)
      {
        if (*((_DWORD *)v4 + 13) == 21)
        {
          v26 = (uint64_t *)v4[5];
        }
        else
        {
          CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v23);
          v26 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
        }
        if (i >= *((int *)v26 + 6))
          break;
        inited = [MLImageSize alloc];
        v28 = inited;
        v29 = *((_DWORD *)v4 + 13);
        if (v29 == 21)
        {
          v30 = (uint64_t *)v4[5];
        }
        else
        {
          inited = (MLImageSize *)CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          v29 = *((_DWORD *)v4 + 13);
          v30 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
        }
        v31 = *(_QWORD *)(*(_QWORD *)(v30[4] + (v24 >> 29) + 8) + 16);
        if (v29 == 21)
        {
          v32 = (uint64_t *)v4[5];
        }
        else
        {
          CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
          v32 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
        }
        v33 = -[MLImageSize initWithPixelsWide:pixelsHigh:](v28, "initWithPixelsWide:pixelsHigh:", v31, *(_QWORD *)(*(_QWORD *)(v32[4] + 8 * (v24 >> 32) + 8) + 24));
        objc_msgSend(v22, "addObject:", v33);

        v24 += 0x100000000;
      }
      if (!objc_msgSend(v22, "count"))
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v34, OS_LOG_TYPE_ERROR, "Image descripition included empty set of enumerated sizes", buf, 2u);
        }

        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v35, OS_LOG_TYPE_ERROR, "Using the default size", buf, 2u);
        }

        objc_msgSend(v22, "addObject:", v11);
      }
      v36 = -[MLImageSizeConstraint initWithEnumeratedImageSizes:]([MLImageSizeConstraint alloc], "initWithEnumeratedImageSizes:", v22);

      v52 = v36;
      if (!v14)
        goto LABEL_55;
      if (!-[MLImageSizeConstraint isAllowedImageSize:error:](v36, "isAllowedImageSize:error:", v11, 0))
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v37, OS_LOG_TYPE_ERROR, "Image descripition width and height and are not valid according to the enumerated sizes", buf, 2u);
        }

        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, "Changing default height and width to be the first enumerated size", buf, 2u);
        }

LABEL_55:
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v39 = objc_claimAutoreleasedReturnValue();

        v11 = (MLImageSize *)v39;
      }
LABEL_68:

      break;
    case 31:
      if (*(_QWORD *)(v4[5] + 16))
        v16 = *(uint64_t **)(v4[5] + 16);
      else
        v16 = &CoreML::Specification::_SizeRange_default_instance_;
      v17 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)+[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:](MLModelIOUtils, "rangeFromAllowedSizeRangeProtoMessage:", v16);
      v18 = v17;
      v20 = v19;
      if (*((_DWORD *)v4 + 13) == 31)
      {
        v21 = (uint64_t *)v4[5];
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v17);
        v21 = &CoreML::Specification::_ImageFeatureType_ImageSizeRange_default_instance_;
      }
      v40 = (uint64_t *)v21[3];
      if (v40)
        v41 = v40;
      else
        v41 = &CoreML::Specification::_SizeRange_default_instance_;
      v42 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:](MLModelIOUtils, "rangeFromAllowedSizeRangeProtoMessage:", v41);
      v44 = -[MLImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:]([MLImageSizeConstraint alloc], "initWithPixelsWideRange:pixelsHighRange:", v18, v20, v42, v43);

      v52 = v44;
      if (!v14)
      {
LABEL_67:
        v47 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", v18, v42);
        v22 = v11;
        v11 = v47;
        goto LABEL_68;
      }
      if (!-[MLImageSizeConstraint isAllowedImageSize:error:](v44, "isAllowedImageSize:error:", v11, 0))
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v45, OS_LOG_TYPE_ERROR, "Image descripition width and height and are not valid according to the specified flexible ranges", buf, 2u);
        }

        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19C486000, v46, OS_LOG_TYPE_ERROR, "Changing default height and width to minimum size in range", buf, 2u);
        }

        goto LABEL_67;
      }
      break;
  }
  +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:", -[MLImageSize pixelsWide](v11, "pixelsWide"), -[MLImageSize pixelsHigh](v11, "pixelsHigh"), v51, v52);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

+ (id)populateConstraintsForImageFeatureDescriptionElement:(void *)a3
{
  return (id)objc_msgSend(a1, "populateConstraintsForImageFeatureDescription:", *(_QWORD *)a3);
}

+ (id)populateConstraintsForArrayFeatureType:(const void *)a3 dataType:(int64_t)a4 constraintClass:(Class)a5 defaultOptionalValue:(id)a6
{
  void *v6;
  void *v10;
  int v11;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v12;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v13;
  uint64_t *v14;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v15;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  MLMultiArrayShapeConstraint *v25;
  void *v26;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int64_t v44;
  objc_class *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v46 = a6;
  CoreML::numericArrayToObjC<google::protobuf::RepeatedField<long long>,long long>((int *)a3 + 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *((_DWORD *)a3 + 15);
  if (v11)
  {
    if (v11 == 21)
    {
      v15 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_alloc(MEMORY[0x1E0C99DE8]);
      v16 = v15;
      if (*((_DWORD *)a3 + 15) == 21)
      {
        v17 = (uint64_t *)*((_QWORD *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v15);
        v17 = &CoreML::Specification::_ArrayFeatureType_EnumeratedShapes_default_instance_;
      }
      v34 = -[CoreML::Specification::protobuf_FeatureTypes_2eproto initWithCapacity:](v16, "initWithCapacity:", *((int *)v17 + 6));
      v13 = v34;
      if (*((_DWORD *)a3 + 15) == 21)
      {
        v35 = (uint64_t *)*((_QWORD *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v34);
        v35 = &CoreML::Specification::_ArrayFeatureType_EnumeratedShapes_default_instance_;
      }
      v36 = v35[4];
      if (v36)
        v37 = v36 + 8;
      else
        v37 = 0;
      v38 = *((int *)v35 + 6);
      if ((_DWORD)v38)
      {
        v39 = 8 * v38;
        do
        {
          CoreML::numericArrayToObjC<google::protobuf::RepeatedField<long long>,long long>((int *)(*(_QWORD *)v37 + 16));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreML::Specification::protobuf_FeatureTypes_2eproto addObject:](v13, "addObject:", v40);

          v37 += 8;
          v39 -= 8;
        }
        while (v39);
      }
      v25 = -[MLMultiArrayShapeConstraint initWithEnumeratedShapes:]([MLMultiArrayShapeConstraint alloc], "initWithEnumeratedShapes:", v13);
      if (!objc_msgSend(v10, "count"))
      {
        -[CoreML::Specification::protobuf_FeatureTypes_2eproto objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "copy");

        v10 = (void *)v42;
      }
      v32 = (void *)objc_msgSend([a5 alloc], "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v10, a4, v25, v46);
      v54[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11 != 31)
        goto LABEL_42;
      v44 = a4;
      v45 = a5;
      v12 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = v12;
      if (*((_DWORD *)a3 + 15) == 31)
      {
        v14 = (uint64_t *)*((_QWORD *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v12);
        v14 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
      }
      v18 = v14[4];
      if (v18)
        v19 = (_QWORD *)(v18 + 8);
      else
        v19 = 0;
      v20 = *((int *)v14 + 6);
      if ((_DWORD)v20)
      {
        v21 = 8 * v20;
        do
        {
          v22 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:](MLModelIOUtils, "rangeFromAllowedSizeRangeProtoMessage:", *v19);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreML::Specification::protobuf_FeatureTypes_2eproto addObject:](v13, "addObject:", v24);

          ++v19;
          v21 -= 8;
        }
        while (v21);
      }
      v25 = -[MLMultiArrayShapeConstraint initWithSizeRangeForDimension:]([MLMultiArrayShapeConstraint alloc], "initWithSizeRangeForDimension:", v13);
      if (!objc_msgSend(v10, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[CoreML::Specification::protobuf_FeatureTypes_2eproto count](v13, "count"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v27 = v13;
        v28 = -[CoreML::Specification::protobuf_FeatureTypes_2eproto countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v48;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v48 != v29)
                objc_enumerationMutation(v27);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v30), "rangeValue"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v31);

              ++v30;
            }
            while (v28 != v30);
            v28 = -[CoreML::Specification::protobuf_FeatureTypes_2eproto countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          }
          while (v28);
        }

        v10 = v26;
      }
      v32 = (void *)objc_msgSend([v45 alloc], "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v10, v44, v25, v46);
      v52 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v33;

  }
  else
  {
    v13 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_msgSend([a5 alloc], "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v10, a4, 0, v46);
    v51 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_42:
  return v6;
}

+ (id)featureDescriptionsFromProto:(const void *)a3
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((int *)a3 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *((_QWORD *)a3 + 2);
  if (v6)
    v7 = (_QWORD *)(v6 + 8);
  else
    v7 = 0;
  v8 = *((int *)a3 + 2);
  if ((_DWORD)v8)
  {
    v9 = 8 * v8;
    do
    {
      v10 = *v7;
      objc_msgSend(a1, "populateConstraintsForFeatureDescription:", *v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(uint64_t **)(v10 + 32);
      if (!v12)
        v12 = &CoreML::Specification::_FeatureType_default_instance_;
      v13 = *(uint64_t **)(v10 + 16);
      if (*((char *)v13 + 23) < 0)
        v13 = (uint64_t *)*v13;
      v14 = *((unsigned int *)v12 + 9);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(uint64_t **)(v10 + 32);
      if (!v16)
        v16 = &CoreML::Specification::_FeatureType_default_instance_;
      +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", v15, v14, *((unsigned __int8 *)v16 + 16), v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v17);

      ++v7;
      v9 -= 8;
    }
    while (v9);
  }
  return v5;
}

+ (BOOL)serializeVersionInfo:(id)a3 archive:(void *)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  void *__p[2];
  uint64_t v11;

  v6 = a3;
  operator<<((uint64_t)a4, objc_msgSend(v6, "majorVersion"));
  operator<<((uint64_t)a4, objc_msgSend(v6, "minorVersion"));
  operator<<((uint64_t)a4, objc_msgSend(v6, "patchVersion"));
  __p[0] = 0;
  __p[1] = 0;
  v11 = 0;
  objc_msgSend(v6, "variantString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "variantString");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1A1AD5EAC](__p, objc_msgSend(v8, "UTF8String"));

  }
  operator<<((uint64_t)a4, (uint64_t *)__p);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);

  return 1;
}

+ (BOOL)serializeMetadataAndInterfaceFromSpecification:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  const CoreML::Specification::ModelDescription *v7;
  BOOL v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v7 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v13, v7);
  v8 = +[MLModelIOUtils serializeInterfaceFormat:archive:error:](MLModelIOUtils, "serializeInterfaceFormat:archive:error:", &v13, a4, a5);
  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v8;
}

+ (id)stateDescriptionFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "descriptionFromProto:", *(_QWORD *)a3 + 64);
}

+ (id)orderedInputFeatureNamesFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "orderedNamesFromProto:", *(_QWORD *)a3 + 16);
}

+ (id)orderedOutputFeatureNamesFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "orderedNamesFromProto:", *(_QWORD *)a3 + 40);
}

+ (id)orderedStateFeatureNamesFromInterface:(void *)a3
{
  return (id)objc_msgSend(a1, "orderedNamesFromProto:", *(_QWORD *)a3 + 64);
}

+ (id)specificationURLFromModelAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  MPL::detail::ModelPackageImpl *v23[2];
  char v24;
  __int128 __p;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v24);

  if ((v8 & 1) != 0)
  {
    v9 = v5;
    if (v24)
    {
      v10 = objc_retainAutorelease(v5);
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "fileSystemRepresentation"));
      MPL::ModelPackage::ModelPackage(v23, (char *)&__p, 0, 1);
      if (v26 < 0)
        operator delete((void *)__p);
      v11 = (void *)MEMORY[0x1E0C99E98];
      v12 = (void *)MEMORY[0x1E0CB3940];
      MPL::ModelPackage::getRootModel(v23, &__p);
      v13 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)__p);
      if (*(char *)(v13 + 23) >= 0)
        v14 = v13;
      else
        v14 = *(_QWORD *)v13;
      objc_msgSend(v12, "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fileURLWithPath:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
      if (*((_QWORD *)&__p + 1))
      {
        v17 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      MPL::ModelPackage::~ModelPackage((MPL::ModelPackage *)v23);
    }
    v19 = v9;
    v20 = v19;
  }
  else
  {
    if (a4)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model does not exist at %@"), v5);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 138412290;
      *(_QWORD *)((char *)&__p + 4) = v5;
      _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "Model does not exist at %@", (uint8_t *)&__p, 0xCu);
    }

    v20 = 0;
    v19 = v5;
  }

  return v20;
}

+ (id)functionDescriptionsFromDescriptionSpecification:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  MLModelDescription *v19;
  id v21;

  v4 = *(_QWORD *)a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(*(_QWORD *)a3 + 96));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(v4 + 104);
  if (v5)
    v6 = (uint64_t *)(v5 + 8);
  else
    v6 = 0;
  v7 = *(int *)(v4 + 96);
  if ((_DWORD)v7)
  {
    for (i = 8 * v7; i; i -= 8)
    {
      v9 = *v6;
      v10 = *(uint64_t **)(*v6 + 88);
      if (*((char *)v10 + 23) < 0)
        v10 = (uint64_t *)*v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "featureDescriptionsFromProto:", v9 + 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "featureDescriptionsFromProto:", v9 + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "featureDescriptionsFromProto:", v9 + 64);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(uint64_t **)(v9 + 96);
      if (*((char *)v15 + 23) < 0)
      {
        if (v15[1])
        {
          v15 = (uint64_t *)*v15;
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      else if (*((_BYTE *)v15 + 23))
      {
        goto LABEL_13;
      }
      v16 = 0;
LABEL_15:
      v17 = *(uint64_t **)(v9 + 104);
      if (*((char *)v17 + 23) < 0)
      {
        if (!v17[1])
        {
LABEL_21:
          v18 = 0;
          goto LABEL_22;
        }
        v17 = (uint64_t *)*v17;
      }
      else if (!*((_BYTE *)v17 + 23))
      {
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v19 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionName:]([MLModelDescription alloc], "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionName:", v12, v13, v14, v16, v18, v11);
      objc_msgSend(v21, "addObject:", v19);

      ++v6;
    }
  }
  return v21;
}

+ (id)defaultFunctionNameFromDescriptionSpecification:(void *)a3
{
  uint64_t *v3;
  void *v4;

  if (!*(_DWORD *)(*(_QWORD *)a3 + 96))
    goto LABEL_8;
  v3 = *(uint64_t **)(*(_QWORD *)a3 + 152);
  if (*((char *)v3 + 23) < 0)
  {
    if (!v3[1])
    {
LABEL_8:
      v4 = 0;
      return v4;
    }
    v3 = (uint64_t *)*v3;
  }
  else if (!*((_BYTE *)v3 + 23))
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
