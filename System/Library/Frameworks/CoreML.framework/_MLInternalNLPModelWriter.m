@implementation _MLInternalNLPModelWriter

+ (BOOL)saveCustomWordTaggingModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CoreML::Specification::Model *v15;
  CoreML::Specification::ModelDescription *v16;
  __int128 **v17;
  CoreML::Specification::FeatureDescription *v18;
  id v19;
  uint64_t v20;
  CoreML::Specification::StringFeatureType *v21;
  uint64_t v22;
  CoreML::Specification::FeatureDescription *v23;
  uint64_t v24;
  uint64_t v25;
  CoreML::Specification::StringFeatureType *v26;
  CoreML::Specification::SequenceFeatureType *v27;
  CoreML::Specification::SizeRange *v28;
  CoreML::Specification::SequenceFeatureType *v29;
  CoreML::Specification::SizeRange *v30;
  CoreML::Specification::FeatureDescription *v31;
  uint64_t v32;
  uint64_t v33;
  CoreML::Specification::Int64FeatureType *v34;
  CoreML::Specification::SequenceFeatureType *v35;
  CoreML::Specification::SizeRange *v36;
  CoreML::Specification::SequenceFeatureType *v37;
  CoreML::Specification::SizeRange *v38;
  CoreML::Specification::FeatureDescription *v39;
  uint64_t v40;
  uint64_t v41;
  CoreML::Specification::Int64FeatureType *v42;
  CoreML::Specification::SequenceFeatureType *v43;
  CoreML::Specification::SizeRange *v44;
  CoreML::Specification::SequenceFeatureType *v45;
  CoreML::Specification::SizeRange *v46;
  CoreML::Specification::Model *v47;
  __int128 **v48;
  id v49;
  void *v50;
  size_t v51;
  google::protobuf::Arena **v52;
  CoreML::Specification::CustomModel_CustomModelParamValue *v53;
  CoreML::Specification::Model *v54;
  id v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  unsigned __int32 v59;
  unint64_t *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  void *v65;
  char v66;
  __n128 __dst;
  char v68;
  char v69;
  __n128 __p;
  __int128 *v71;
  int v72;
  CoreML::Specification::Model *v73;
  std::__shared_weak_count *v74;
  _QWORD v75[2];
  std::__shared_weak_count *v76;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v73, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v15 = v73;
  *((_DWORD *)v73 + 6) = 9;
  v16 = (CoreML::Specification::ModelDescription *)*((_QWORD *)v15 + 2);
  if (!v16)
  {
    v16 = (CoreML::Specification::ModelDescription *)operator new();
    CoreML::Specification::ModelDescription::ModelDescription(v16);
    *((_QWORD *)v15 + 2) = v16;
  }
  v17 = (__int128 **)*((_QWORD *)v16 + 20);
  if (!v17)
  {
    v17 = (__int128 **)operator new();
    CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)v17);
    *((_QWORD *)v16 + 20) = v17;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "A model for tagging words constructed in memory");
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v17 + 6, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v18 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v16 + 16);
  v19 = objc_retainAutorelease(v13);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v19, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v18 + 2, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Input text");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v18 + 3, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v20 = *((_QWORD *)v18 + 4);
  if (!v20)
  {
    v20 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v20);
    *((_QWORD *)v18 + 4) = v20;
  }
  if (*(_DWORD *)(v20 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v20);
    *(_DWORD *)(v20 + 36) = 3;
    v21 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v21);
    *(_QWORD *)(v20 + 24) = v21;
  }
  v22 = (uint64_t)v16 + 40;
  v23 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v22);
  std::string::basic_string[abi:ne180100]<0>(&__p, "labels");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v23 + 2, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output labels");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v23 + 3, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v24 = *((_QWORD *)v23 + 4);
  if (!v24)
  {
    v24 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v24);
    *((_QWORD *)v23 + 4) = v24;
  }
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v25 = *(_QWORD *)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v25 = operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v25);
    *(_QWORD *)(v24 + 24) = v25;
    if (*(_DWORD *)(v24 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v24);
      *(_DWORD *)(v24 + 36) = 7;
      v25 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v25);
      *(_QWORD *)(v24 + 24) = v25;
    }
  }
  if (*(_DWORD *)(v25 + 36) != 3)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v25);
    *(_DWORD *)(v25 + 36) = 3;
    v26 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v26);
    *(_QWORD *)(v25 + 24) = v26;
  }
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v27 = *(CoreML::Specification::SequenceFeatureType **)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v27 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v27);
    *(_QWORD *)(v24 + 24) = v27;
  }
  v28 = (CoreML::Specification::SizeRange *)*((_QWORD *)v27 + 2);
  if (!v28)
  {
    v28 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v28);
    *((_QWORD *)v27 + 2) = v28;
  }
  *((_QWORD *)v28 + 2) = 0;
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v29 = *(CoreML::Specification::SequenceFeatureType **)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v29 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v29);
    *(_QWORD *)(v24 + 24) = v29;
  }
  v30 = (CoreML::Specification::SizeRange *)*((_QWORD *)v29 + 2);
  if (!v30)
  {
    v30 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v30);
    *((_QWORD *)v29 + 2) = v30;
  }
  *((_QWORD *)v30 + 3) = 10000;
  v31 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v22);
  std::string::basic_string[abi:ne180100]<0>(&__p, "locations");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v31 + 2, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output locations");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v31 + 3, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v32 = *((_QWORD *)v31 + 4);
  if (!v32)
  {
    v32 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v32);
    *((_QWORD *)v31 + 4) = v32;
  }
  if (*(_DWORD *)(v32 + 36) == 7)
  {
    v33 = *(_QWORD *)(v32 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v32);
    *(_DWORD *)(v32 + 36) = 7;
    v33 = operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v33);
    *(_QWORD *)(v32 + 24) = v33;
    if (*(_DWORD *)(v32 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v32);
      *(_DWORD *)(v32 + 36) = 7;
      v33 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v33);
      *(_QWORD *)(v32 + 24) = v33;
    }
  }
  if (*(_DWORD *)(v33 + 36) != 1)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v33);
    *(_DWORD *)(v33 + 36) = 1;
    v34 = (CoreML::Specification::Int64FeatureType *)operator new();
    CoreML::Specification::Int64FeatureType::Int64FeatureType(v34);
    *(_QWORD *)(v33 + 24) = v34;
  }
  if (*(_DWORD *)(v32 + 36) == 7)
  {
    v35 = *(CoreML::Specification::SequenceFeatureType **)(v32 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v32);
    *(_DWORD *)(v32 + 36) = 7;
    v35 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v35);
    *(_QWORD *)(v32 + 24) = v35;
  }
  v36 = (CoreML::Specification::SizeRange *)*((_QWORD *)v35 + 2);
  if (!v36)
  {
    v36 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v36);
    *((_QWORD *)v35 + 2) = v36;
  }
  *((_QWORD *)v36 + 2) = 0;
  if (*(_DWORD *)(v32 + 36) == 7)
  {
    v37 = *(CoreML::Specification::SequenceFeatureType **)(v32 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v32);
    *(_DWORD *)(v32 + 36) = 7;
    v37 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v37);
    *(_QWORD *)(v32 + 24) = v37;
  }
  v38 = (CoreML::Specification::SizeRange *)*((_QWORD *)v37 + 2);
  if (!v38)
  {
    v38 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v38);
    *((_QWORD *)v37 + 2) = v38;
  }
  *((_QWORD *)v38 + 3) = 10000;
  v39 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v22);
  std::string::basic_string[abi:ne180100]<0>(&__p, "lengths");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v39 + 2, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output lengths");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v39 + 3, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v40 = *((_QWORD *)v39 + 4);
  if (!v40)
  {
    v40 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v40);
    *((_QWORD *)v39 + 4) = v40;
  }
  if (*(_DWORD *)(v40 + 36) == 7)
  {
    v41 = *(_QWORD *)(v40 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v40);
    *(_DWORD *)(v40 + 36) = 7;
    v41 = operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v41);
    *(_QWORD *)(v40 + 24) = v41;
    if (*(_DWORD *)(v40 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v40);
      *(_DWORD *)(v40 + 36) = 7;
      v41 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v41);
      *(_QWORD *)(v40 + 24) = v41;
    }
  }
  if (*(_DWORD *)(v41 + 36) != 1)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v41);
    *(_DWORD *)(v41 + 36) = 1;
    v42 = (CoreML::Specification::Int64FeatureType *)operator new();
    CoreML::Specification::Int64FeatureType::Int64FeatureType(v42);
    *(_QWORD *)(v41 + 24) = v42;
  }
  if (*(_DWORD *)(v40 + 36) == 7)
  {
    v43 = *(CoreML::Specification::SequenceFeatureType **)(v40 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v40);
    *(_DWORD *)(v40 + 36) = 7;
    v43 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v43);
    *(_QWORD *)(v40 + 24) = v43;
  }
  v44 = (CoreML::Specification::SizeRange *)*((_QWORD *)v43 + 2);
  if (!v44)
  {
    v44 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v44);
    *((_QWORD *)v43 + 2) = v44;
  }
  *((_QWORD *)v44 + 2) = 0;
  if (*(_DWORD *)(v40 + 36) == 7)
  {
    v45 = *(CoreML::Specification::SequenceFeatureType **)(v40 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v40);
    *(_DWORD *)(v40 + 36) = 7;
    v45 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v45);
    *(_QWORD *)(v40 + 24) = v45;
  }
  v46 = (CoreML::Specification::SizeRange *)*((_QWORD *)v45 + 2);
  if (!v46)
  {
    v46 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v46);
    *((_QWORD *)v45 + 2) = v46;
  }
  *((_QWORD *)v46 + 3) = 10000;
  v47 = v73;
  if (*((_DWORD *)v73 + 11) == 555)
  {
    v48 = (__int128 **)*((_QWORD *)v73 + 4);
  }
  else
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v73);
    *((_DWORD *)v47 + 11) = 555;
    v48 = (__int128 **)operator new();
    CoreML::Specification::CustomModel::CustomModel((CoreML::Specification::CustomModel *)v48);
    *((_QWORD *)v47 + 4) = v48;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("_MLNLPWordTaggingModel"), "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v48 + 6, &__p);
  if (SHIBYTE(v71) < 0)
    operator delete((void *)__p.n128_u64[0]);
  CoreML::Specification::CustomModel_CustomModelParamValue::CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  v49 = objc_retainAutorelease(v12);
  v50 = (void *)objc_msgSend(v49, "bytes");
  v51 = objc_msgSend(v49, "length");
  if (v72 != 60)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&__p);
    v72 = 60;
    v71 = &google::protobuf::internal::fixed_address_empty_string;
  }
  std::string::basic_string[abi:ne180100](&__dst, v50, v51);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v71, &__dst);
  if (v68 < 0)
    operator delete((void *)__dst.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__dst, "modelData");
  v52 = google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::operator[]((uint64_t)(v48 + 3), (uint64_t)&__dst);
  v53 = (CoreML::Specification::CustomModel_CustomModelParamValue *)v52;
  if (&__p != (__n128 *)v52)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)v52);
    CoreML::Specification::CustomModel_CustomModelParamValue::MergeFrom(v53, (const CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  }
  if (v68 < 0)
    operator delete((void *)__dst.n128_u64[0]);
  v54 = v73;
  v55 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:ne180100]<0>(&v65, (char *)objc_msgSend(v55, "fileSystemRepresentation"));
  CoreML::Model::Model((CoreML::Model *)v75, v54);
  CoreML::Model::save((uint64_t)&__dst, (uint64_t)v75);
  v75[0] = &off_1E3D597D0;
  v56 = v76;
  if (v76)
  {
    p_shared_owners = (unint64_t *)&v76->__shared_owners_;
    do
      v58 = __ldaxr(p_shared_owners);
    while (__stlxr(v58 - 1, p_shared_owners));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  if (v66 < 0)
    operator delete(v65);
  v59 = __dst.n128_u32[0] & 0xFFFFFFEF;
  if (a7 && v59)
  {
    v60 = &__dst.n128_u64[1];
    if (v69 < 0)
      v60 = (unint64_t *)__dst.n128_u64[1];
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to save model to %@. %s"), v55, v60);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v69 < 0)
    operator delete((void *)__dst.n128_u64[1]);
  CoreML::Specification::CustomModel_CustomModelParamValue::~CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  v61 = v74;
  if (v74)
  {
    v62 = (unint64_t *)&v74->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }

  return v59 == 0;
}

+ (BOOL)saveCustomSentenceClassifierModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7
{
  id v10;
  id v11;
  id v12;
  CoreML::Specification::Model *v13;
  CoreML::Specification::ModelDescription *v14;
  __int128 **v15;
  CoreML::Specification::FeatureDescription *v16;
  id v17;
  uint64_t v18;
  CoreML::Specification::StringFeatureType *v19;
  CoreML::Specification::FeatureDescription *v20;
  uint64_t v21;
  CoreML::Specification::StringFeatureType *v22;
  CoreML::Specification::Model *v23;
  __int128 **v24;
  id v25;
  void *v26;
  size_t v27;
  google::protobuf::Arena **v28;
  CoreML::Specification::CustomModel_CustomModelParamValue *v29;
  CoreML::Specification::Model *v30;
  id v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  unsigned __int32 v35;
  unint64_t *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  void *v41;
  char v42;
  __n128 __dst;
  char v44;
  char v45;
  __n128 __p;
  __int128 *v47;
  int v48;
  CoreML::Specification::Model *v49;
  std::__shared_weak_count *v50;
  _QWORD v51[2];
  std::__shared_weak_count *v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v49, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v13 = v49;
  *((_DWORD *)v49 + 6) = 9;
  v14 = (CoreML::Specification::ModelDescription *)*((_QWORD *)v13 + 2);
  if (!v14)
  {
    v14 = (CoreML::Specification::ModelDescription *)operator new();
    CoreML::Specification::ModelDescription::ModelDescription(v14);
    *((_QWORD *)v13 + 2) = v14;
  }
  v15 = (__int128 **)*((_QWORD *)v14 + 20);
  if (!v15)
  {
    v15 = (__int128 **)operator new();
    CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)v15);
    *((_QWORD *)v14 + 20) = v15;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "A model for classifying sentences constructed in memory");
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v15 + 6, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v16 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v14 + 16);
  v17 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v16 + 2, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Input sentence");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v16 + 3, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v18 = *((_QWORD *)v16 + 4);
  if (!v18)
  {
    v18 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v18);
    *((_QWORD *)v16 + 4) = v18;
  }
  if (*(_DWORD *)(v18 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v18);
    *(_DWORD *)(v18 + 36) = 3;
    v19 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v19);
    *(_QWORD *)(v18 + 24) = v19;
  }
  v20 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v14 + 40);
  std::string::basic_string[abi:ne180100]<0>(&__p, "label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v20 + 2, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v20 + 3, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  v21 = *((_QWORD *)v20 + 4);
  if (!v21)
  {
    v21 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v21);
    *((_QWORD *)v20 + 4) = v21;
  }
  if (*(_DWORD *)(v21 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v21);
    *(_DWORD *)(v21 + 36) = 3;
    v22 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v22);
    *(_QWORD *)(v21 + 24) = v22;
  }
  v23 = v49;
  if (*((_DWORD *)v49 + 11) == 555)
  {
    v24 = (__int128 **)*((_QWORD *)v49 + 4);
  }
  else
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v49);
    *((_DWORD *)v23 + 11) = 555;
    v24 = (__int128 **)operator new();
    CoreML::Specification::CustomModel::CustomModel((CoreML::Specification::CustomModel *)v24);
    *((_QWORD *)v23 + 4) = v24;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("_MLNLPSentenceClassifierModel"), "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v24 + 6, &__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p.n128_u64[0]);
  CoreML::Specification::CustomModel_CustomModelParamValue::CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  v25 = objc_retainAutorelease(v11);
  v26 = (void *)objc_msgSend(v25, "bytes");
  v27 = objc_msgSend(v25, "length");
  if (v48 != 60)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&__p);
    v48 = 60;
    v47 = &google::protobuf::internal::fixed_address_empty_string;
  }
  std::string::basic_string[abi:ne180100](&__dst, v26, v27);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v47, &__dst);
  if (v44 < 0)
    operator delete((void *)__dst.n128_u64[0]);
  std::string::basic_string[abi:ne180100]<0>(&__dst, "modelData");
  v28 = google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::operator[]((uint64_t)(v24 + 3), (uint64_t)&__dst);
  v29 = (CoreML::Specification::CustomModel_CustomModelParamValue *)v28;
  if (&__p != (__n128 *)v28)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)v28);
    CoreML::Specification::CustomModel_CustomModelParamValue::MergeFrom(v29, (const CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  }
  if (v44 < 0)
    operator delete((void *)__dst.n128_u64[0]);
  v30 = v49;
  v31 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(&v41, (char *)objc_msgSend(v31, "fileSystemRepresentation"));
  CoreML::Model::Model((CoreML::Model *)v51, v30);
  CoreML::Model::save((uint64_t)&__dst, (uint64_t)v51);
  v51[0] = &off_1E3D597D0;
  v32 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v42 < 0)
    operator delete(v41);
  v35 = __dst.n128_u32[0] & 0xFFFFFFEF;
  if (a7 && v35)
  {
    v36 = &__dst.n128_u64[1];
    if (v45 < 0)
      v36 = (unint64_t *)__dst.n128_u64[1];
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to save model to %@. %s"), v31, v36);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v45 < 0)
    operator delete((void *)__dst.n128_u64[1]);
  CoreML::Specification::CustomModel_CustomModelParamValue::~CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  v37 = v50;
  if (v50)
  {
    v38 = (unint64_t *)&v50->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

  return v35 == 0;
}

@end
