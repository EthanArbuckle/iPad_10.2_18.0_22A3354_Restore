@implementation MLCustomModelLoader

+ (id)parametersFromCustomModelSpec:(void *)a3 error:(id *)a4
{
  id v5;
  __int128 *v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  std::string *v20;
  std::string::size_type v21;
  id v22;
  std::string v25;
  std::string v26;
  void (**v27)(CoreML::Specification::CustomModel_CustomModelParamValue *__hidden);
  uint64_t v28;
  std::string *v29;
  int v30;
  int v31;
  unsigned __int8 *v32[3];

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v32, *((_QWORD **)a3 + 5));
  while (1)
  {
    if (!v32[0])
    {
      v22 = v5;
      goto LABEL_54;
    }
    v6 = (__int128 *)*((_QWORD *)v32[0] + 3);
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
    }
    else
    {
      v7 = *v6;
      v26.__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
      *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v7;
    }
    v27 = &off_1E3D57280;
    v28 = 0;
    v30 = 0;
    v8 = *((_QWORD *)v6 + 4);
    if ((v8 & 1) != 0)
      google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v28, v8 & 0xFFFFFFFFFFFFFFFELL);
    v31 = 0;
    v9 = *((_DWORD *)v6 + 13);
    if (v9 > 39)
    {
      switch(v9)
      {
        case '(':
          v13 = (std::string *)*((_QWORD *)v6 + 5);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v27);
          v31 = 40;
          v29 = v13;
          break;
        case '2':
          v14 = *((_BYTE *)v6 + 40);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v27);
          v31 = 50;
          LOBYTE(v29) = v14;
          break;
        case '<':
LABEL_16:
          v11 = *((_QWORD *)v6 + 5);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v27);
          v31 = v9;
          v29 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v29, v11);
          break;
        default:
          break;
      }
    }
    else
    {
      switch(v9)
      {
        case 10:
          v12 = (std::string *)*((_QWORD *)v6 + 5);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v27);
          v31 = 10;
          v29 = v12;
          break;
        case 20:
          goto LABEL_16;
        case 30:
          v10 = *((_DWORD *)v6 + 10);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v27);
          v31 = 30;
          LODWORD(v29) = v10;
          break;
      }
    }
    v15 = (v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v26
        : (std::string *)v26.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (v31 <= 39)
      break;
    switch(v31)
    {
      case '(':
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v29);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case '2':
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case '<':
        if (SHIBYTE(v29->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(&v25, v29->__r_.__value_.__l.__data_, v29->__r_.__value_.__l.__size_);
        }
        else
        {
          v19 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
          v25.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v19;
        }
        v20 = (v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v25
            : (std::string *)v25.__r_.__value_.__r.__words[0];
        v21 = (v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v25.__r_.__value_.__r.__words[2])
            : v25.__r_.__value_.__l.__size_;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v25.__r_.__value_.__l.__data_);
        break;
    }
LABEL_39:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);

    google::protobuf::MapPair<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::~MapPair((uint64_t)&v26);
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++(v32);
  }
  if (v31 > 19)
  {
    if (v31 == 20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v31 != 30)
        goto LABEL_39;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_38;
  }
  if (v31 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v29);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_38:
    v17 = (void *)v18;
    goto LABEL_39;
  }
  if (v31)
    goto LABEL_39;
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 5, CFSTR("Parameter '%@' has no value"), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  google::protobuf::MapPair<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::~MapPair((uint64_t)&v26);
  v22 = 0;
LABEL_54:

  return v22;
}

+ (id)customModelWithName:(id)a3 modelDescription:(id)a4 modelConfiguration:(id)a5 parameterDictionary:(id)a6 error:(id *)a7
{
  NSString *v11;
  id v12;
  id v13;
  id v14;
  Class v15;
  Class v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = (NSString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = NSClassFromString(v11);
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load custom model ‘%@’ which requires an Objective-C class named ‘%@’. If you have defined this class in Swift you may need to annotate it with @objc(%@) in order to make it visible to the objective-c runtime via the required name."), v11, v11, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (!a7)
      goto LABEL_13;
LABEL_12:
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 5, CFSTR("%@"), v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    v21 = 0;
    goto LABEL_16;
  }
  if ((-[objc_class conformsToProtocol:](v15, "conformsToProtocol:", &unk_1EE435650) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom model implmenetantion class named '%@' does not conform to MLCustomModel protocol"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (!a7)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (-[objc_class instancesRespondToSelector:](v16, "instancesRespondToSelector:", sel_initWithModelDescription_configuration_parameterDictionary_error_))v17 = objc_msgSend(objc_alloc(NSClassFromString(v11)), "initWithModelDescription:configuration:parameterDictionary:error:", v12, v13, v14, a7);
  else
    v17 = objc_msgSend(objc_alloc(NSClassFromString(v11)), "initWithModelDescription:parameterDictionary:error:", v12, v14, a7);
  v21 = (void *)v17;
LABEL_16:

  return v21;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  const CoreML::Specification::ModelDescription *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  MLCustomModelWrapper *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void (**v26)(CoreML::Specification::CustomModel *__hidden);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  std::string *v31;
  std::string *v32;
  int v33;
  char v34[8];
  std::__shared_weak_count *v35;

  v8 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 555)
  {
    if (*(_QWORD *)(*(_QWORD *)a3 + 16))
      v9 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
    else
      v9 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
    _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v34, v9);
    v10 = -[MLModelDescription initFromSingleFunctionModelDescriptionSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelDescriptionSpecification:", v34);
    v11 = v10;
    if (v10)
    {
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 555)
      {
        v12 = *(_QWORD **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_CustomModel_2eproto::InitDefaults((CoreML::Specification::protobuf_CustomModel_2eproto *)v10);
        v12 = &CoreML::Specification::_CustomModel_default_instance_;
      }
      v26 = &off_1E3D4CEA0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::Init((uint64_t)&v29);
      v30 = 0;
      v33 = 0;
      v14 = v12[1];
      if ((v14 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v27, v14 & 0xFFFFFFFFFFFFFFFELL);
      google::protobuf::internal::MapFieldLite<google::protobuf::internal::MapEntryLite<std::string,CoreML::Specification::CustomModel_CustomModelParamValue,(google::protobuf::internal::WireFormatLite::FieldType)9,(google::protobuf::internal::WireFormatLite::FieldType)11,0>,std::string,CoreML::Specification::CustomModel_CustomModelParamValue,(google::protobuf::internal::WireFormatLite::FieldType)9,(google::protobuf::internal::WireFormatLite::FieldType)11,0>::MergeFrom((uint64_t)&v28, (_QWORD *)v12[5]);
      v31 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v15 = v12[6];
      if (*(char *)(v15 + 23) < 0)
        v16 = *(_QWORD *)(v15 + 8);
      else
        v16 = *(unsigned __int8 *)(v15 + 23);
      if ((__int128 *)v15 != &google::protobuf::internal::fixed_address_empty_string && v16)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v31, v15);
      v32 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v17 = v12[7];
      if (*(char *)(v17 + 23) < 0)
        v18 = *(_QWORD *)(v17 + 8);
      else
        v18 = *(unsigned __int8 *)(v17 + 23);
      if ((__int128 *)v17 != &google::protobuf::internal::fixed_address_empty_string && v18)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v32, v17);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "parametersFromCustomModelSpec:error:", &v26, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(a1, "customModelWithName:modelDescription:modelConfiguration:parameterDictionary:error:", v19, v11, v8, v20, a5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          v13 = -[MLCustomModelWrapper initWithModelDescription:customModel:configuration:]([MLCustomModelWrapper alloc], "initWithModelDescription:customModel:configuration:", v11, v21, v8);
        else
          v13 = 0;

      }
      else
      {
        v13 = 0;
      }

      CoreML::Specification::CustomModel::~CustomModel((CoreML::Specification::CustomModel *)&v26);
    }
    else
    {
      v13 = 0;
    }

    v22 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a CustomModel"));
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
