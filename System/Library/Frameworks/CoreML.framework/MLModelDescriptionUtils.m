@implementation MLModelDescriptionUtils

+ (void)createMetaData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  google::protobuf::Arena **v37;
  __int128 **v39;
  __int128 **v40;
  void *v41[2];
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  std::string __p;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = (__int128 **)operator new();
  CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)v39);
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v39 + 8, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  objc_msgSend(v4, "metadata", v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    objc_msgSend(v4, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v13, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v40 + 9, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  objc_msgSend(v4, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    objc_msgSend(v4, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v40 + 7, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  objc_msgSend(v4, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    objc_msgSend(v4, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v23, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v40 + 6, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  objc_msgSend(v4, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    objc_msgSend(v4, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v29, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "description");
            v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v36 = (char *)objc_msgSend(v3, "UTF8String");
          }
          else
          {
            v36 = (char *)&unk_19CB39696;
          }
          std::string::basic_string[abi:ne180100]<0>(&__p, v36);
          if (v35)

          std::string::basic_string[abi:ne180100]<0>(v41, (char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
          v37 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v40 + 3), (uint64_t)v41);
          std::string::operator=((std::string *)v37, &__p);
          if (v42 < 0)
            operator delete(v41[0]);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v30);
    }

  }
  return v40;
}

+ (void)getImageFeatureTypeFromConstraint:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;

  v3 = a3;
  if (v3)
  {
    v4 = operator new();
    CoreML::Specification::ImageFeatureType::ImageFeatureType((CoreML::Specification::ImageFeatureType *)v4);
    *(_QWORD *)(v4 + 16) = objc_msgSend(v3, "pixelsWide");
    *(_QWORD *)(v4 + 24) = objc_msgSend(v3, "pixelsHigh");
    if (objc_msgSend(v3, "pixelFormatType") == 1278226488)
      v5 = 10;
    else
      v5 = 30;
    *(_DWORD *)(v4 + 32) = v5;
  }
  else
  {
    v4 = 0;
  }

  return (void *)v4;
}

+ (void)getArrayFeatureTypeFromConstraint:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  int v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = operator new();
    CoreML::Specification::ArrayFeatureType::ArrayFeatureType((CoreML::Specification::ArrayFeatureType *)v4);
    *(_DWORD *)(v4 + 36) = objc_msgSend(v3, "dataType");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "shape", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntValue");
          v10 = *(_DWORD *)(v4 + 16);
          if (v10 == *(_DWORD *)(v4 + 20))
          {
            google::protobuf::RepeatedField<double>::Reserve((unsigned int *)(v4 + 16), v10 + 1);
            v10 = *(_DWORD *)(v4 + 16);
          }
          v11 = *(_QWORD *)(v4 + 24);
          *(_DWORD *)(v4 + 16) = v10 + 1;
          *(_QWORD *)(v11 + 8 * v10 + 8) = v9;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return (void *)v4;
}

+ (void)getStateFeatureTypeFromConstraint:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned int v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = operator new();
    CoreML::Specification::StateFeatureType::StateFeatureType((CoreML::Specification::StateFeatureType *)v4);
    v5 = operator new();
    CoreML::Specification::ArrayFeatureType::ArrayFeatureType((CoreML::Specification::ArrayFeatureType *)v5);
    if (*(_DWORD *)(v4 + 28) == 1)
    {
      v6 = *(_QWORD *)(v4 + 16);
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    }
    *(_DWORD *)(v4 + 28) = 1;
    *(_QWORD *)(v4 + 16) = v5;
    *(_DWORD *)(v5 + 36) = objc_msgSend(v3, "dataType");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "shape", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedIntValue");
          v12 = *(_DWORD *)(v5 + 16);
          if (v12 == *(_DWORD *)(v5 + 20))
          {
            google::protobuf::RepeatedField<double>::Reserve((unsigned int *)(v5 + 16), v12 + 1);
            v12 = *(_DWORD *)(v5 + 16);
          }
          v13 = *(_QWORD *)(v5 + 24);
          *(_DWORD *)(v5 + 16) = v12 + 1;
          *(_QWORD *)(v13 + 8 * v12 + 8) = v11;
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v4 = 0;
  }

  return (void *)v4;
}

+ (void)getDictionaryFeatureTypeFromConstraint:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  CoreML::Specification::Int64FeatureType *v8;
  int v9;

  v5 = a3;
  v6 = operator new();
  CoreML::Specification::DictionaryFeatureType::DictionaryFeatureType((CoreML::Specification::DictionaryFeatureType *)v6);
  if (v5)
  {
    v7 = objc_msgSend(v5, "keyType");
    if (v7 <= 8)
    {
      if (((1 << v7) & 0x1F5) != 0)
      {
        if (a4)
        {
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Unsupported key type for dictionary feature"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
        v6 = 0;
      }
      else
      {
        if (v7 == 1)
        {
          v8 = (CoreML::Specification::Int64FeatureType *)operator new();
          CoreML::Specification::Int64FeatureType::Int64FeatureType(v8);
          CoreML::Specification::MILSpec::Dimension::clear_dimension(v6);
          v9 = 1;
        }
        else
        {
          v8 = (CoreML::Specification::Int64FeatureType *)operator new();
          CoreML::Specification::StringFeatureType::StringFeatureType(v8);
          CoreML::Specification::MILSpec::Dimension::clear_dimension(v6);
          v9 = 2;
        }
        *(_DWORD *)(v6 + 28) = v9;
        *(_QWORD *)(v6 + 16) = v8;
      }
    }
  }

  return (void *)v6;
}

+ (void)getSequenceFeatureTypeFromConstraint:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  CoreML::Specification::Int64FeatureType *v9;
  int v10;

  v5 = a3;
  v6 = operator new();
  CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v6);
  if (v5)
  {
    objc_msgSend(v5, "valueDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 <= 8)
    {
      if (((1 << v8) & 0x1F5) != 0)
      {
        if (a4)
        {
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Unsupported sequence type"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
        v6 = 0;
      }
      else
      {
        v9 = (CoreML::Specification::Int64FeatureType *)operator new();
        if (v8 == 1)
        {
          CoreML::Specification::Int64FeatureType::Int64FeatureType(v9);
          CoreML::Specification::SequenceFeatureType::clear_Type(v6);
          v10 = 1;
        }
        else
        {
          CoreML::Specification::StringFeatureType::StringFeatureType(v9);
          CoreML::Specification::SequenceFeatureType::clear_Type(v6);
          v10 = 3;
        }
        *(_DWORD *)(v6 + 36) = v10;
        *(_QWORD *)(v6 + 24) = v9;
      }
    }
  }

  return (void *)v6;
}

+ (void)createFeatureTypeFromFeatureDescription:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  CoreML::Specification::Int64FeatureType *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v5 = a3;
  v6 = operator new();
  CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v6);
  switch(objc_msgSend(v5, "type"))
  {
    case 1:
      v7 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::Int64FeatureType::Int64FeatureType(v7);
      CoreML::Specification::FeatureType::clear_Type(v6);
      v8 = 1;
      goto LABEL_5;
    case 2:
      v7 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::DoubleFeatureType::DoubleFeatureType(v7);
      CoreML::Specification::FeatureType::clear_Type(v6);
      v8 = 2;
      goto LABEL_5;
    case 3:
      v7 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::StringFeatureType::StringFeatureType(v7);
      CoreML::Specification::FeatureType::clear_Type(v6);
      v8 = 3;
LABEL_5:
      *(_DWORD *)(v6 + 36) = v8;
      *(_QWORD *)(v6 + 24) = v7;
      goto LABEL_18;
    case 4:
      objc_msgSend(v5, "imageConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[MLModelDescriptionUtils getImageFeatureTypeFromConstraint:](MLModelDescriptionUtils, "getImageFeatureTypeFromConstraint:", v9);
      CoreML::Specification::FeatureType::clear_Type(v6);
      if (!v10)
        goto LABEL_17;
      v11 = 4;
      break;
    case 5:
      objc_msgSend(v5, "multiArrayConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[MLModelDescriptionUtils getArrayFeatureTypeFromConstraint:](MLModelDescriptionUtils, "getArrayFeatureTypeFromConstraint:", v9);
      CoreML::Specification::FeatureType::clear_Type(v6);
      if (!v10)
        goto LABEL_17;
      v11 = 5;
      break;
    case 6:
      objc_msgSend(v5, "dictionaryConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[MLModelDescriptionUtils getDictionaryFeatureTypeFromConstraint:error:](MLModelDescriptionUtils, "getDictionaryFeatureTypeFromConstraint:error:", v9, a4);
      CoreML::Specification::FeatureType::clear_Type(v6);
      if (!v10)
        goto LABEL_17;
      v11 = 6;
      break;
    case 7:
      objc_msgSend(v5, "sequenceConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[MLModelDescriptionUtils getSequenceFeatureTypeFromConstraint:error:](MLModelDescriptionUtils, "getSequenceFeatureTypeFromConstraint:error:", v9, a4);
      CoreML::Specification::FeatureType::clear_Type(v6);
      if (!v10)
        goto LABEL_17;
      v11 = 7;
      break;
    case 8:
      objc_msgSend(v5, "multiArrayConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[MLModelDescriptionUtils getStateFeatureTypeFromConstraint:](MLModelDescriptionUtils, "getStateFeatureTypeFromConstraint:", v9);
      CoreML::Specification::FeatureType::clear_Type(v6);
      if (!v10)
        goto LABEL_17;
      v11 = 8;
      break;
    default:
      goto LABEL_18;
  }
  *(_DWORD *)(v6 + 36) = v11;
  *(_QWORD *)(v6 + 24) = v10;
LABEL_17:

LABEL_18:
  *(_BYTE *)(v6 + 16) = objc_msgSend(v5, "isOptional");

  return (void *)v6;
}

+ (void)copyFeatureDescriptionFrom:(id)a3 to:(void *)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __n128 __p;
  char v13;

  v7 = a3;
  if (a4)
  {
    CoreML::Specification::FeatureDescription::Clear((CoreML::Specification::FeatureDescription *)a4);
    objc_msgSend(v7, "name");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a4 + 2, &__p);
    if (v13 < 0)
      operator delete((void *)__p.n128_u64[0]);

    objc_msgSend(v7, "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v9, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)a4 + 3, &__p);
    if (v13 < 0)
      operator delete((void *)__p.n128_u64[0]);

    v10 = +[MLModelDescriptionUtils createFeatureTypeFromFeatureDescription:error:](MLModelDescriptionUtils, "createFeatureTypeFromFeatureDescription:error:", v7, a5);
    v11 = *((_QWORD *)a4 + 4);
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    *((_QWORD *)a4 + 4) = v10;
  }

}

+ (void)createModelDescription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  CoreML::Specification::FeatureDescription **v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CoreML::Specification::FeatureDescription **v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  CoreML::Specification::ModelDescription *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = (CoreML::Specification::ModelDescription *)operator new();
  CoreML::Specification::ModelDescription::ModelDescription(v36);
  v7 = +[MLModelDescriptionUtils createMetaData:](MLModelDescriptionUtils, "createMetaData:", v6);
  v8 = *((_QWORD *)v36 + 20);
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  *((_QWORD *)v36 + 20) = v7;
  objc_msgSend(v6, "predictedFeatureName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (_QWORD *)operator new();
    objc_msgSend(v6, "predictedFeatureName");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v10, (char *)objc_msgSend(v11, "UTF8String"));
    v12 = *((_QWORD *)v36 + 17);
    if ((__int128 *)v12 != &google::protobuf::internal::fixed_address_empty_string && v12)
    {
      if (*(char *)(v12 + 23) < 0)
        operator delete(*(void **)v12);
      MEMORY[0x1A1AD6260](v12, 0x1012C40EC159624);
    }
    *((_QWORD *)v36 + 17) = v10;

  }
  objc_msgSend(v6, "predictedProbabilitiesName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (_QWORD *)operator new();
    objc_msgSend(v6, "predictedProbabilitiesName");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v14, (char *)objc_msgSend(v15, "UTF8String"));
    v16 = *((_QWORD *)v36 + 18);
    if ((__int128 *)v16 != &google::protobuf::internal::fixed_address_empty_string && v16)
    {
      if (*(char *)(v16 + 23) < 0)
        operator delete(*(void **)v16);
      MEMORY[0x1A1AD6260](v16, 0x1012C40EC159624);
    }
    *((_QWORD *)v36 + 18) = v14;

  }
  v17 = *((unsigned int *)v36 + 6);
  if ((int)v17 >= 1)
  {
    v18 = (CoreML::Specification::FeatureDescription **)(*((_QWORD *)v36 + 4) + 8);
    do
    {
      CoreML::Specification::FeatureDescription::Clear(*v18++);
      --v17;
    }
    while (v17);
    *((_DWORD *)v36 + 6) = 0;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v6, "inputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v19);
        v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v6, "inputDescriptionsByName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "copyFeatureDescriptionFrom:to:error:", v25, google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v36 + 16), a4);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v20);
  }

  v26 = *((unsigned int *)v36 + 12);
  if ((int)v26 >= 1)
  {
    v27 = (CoreML::Specification::FeatureDescription **)(*((_QWORD *)v36 + 7) + 8);
    do
    {
      CoreML::Specification::FeatureDescription::Clear(*v27++);
      --v26;
    }
    while (v26);
    *((_DWORD *)v36 + 12) = 0;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v6, "outputDescriptionsByName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v6, "outputDescriptionsByName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLModelDescriptionUtils copyFeatureDescriptionFrom:to:error:](MLModelDescriptionUtils, "copyFeatureDescriptionFrom:to:error:", v34, google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v36 + 40), a4);
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v29);
  }

  return v36;
}

+ (BOOL)saveModelDescription:(id)a3 toSpecification:(void *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  id v17;

  v7 = a3;
  v8 = *(_QWORD *)a4;
  v9 = *(_QWORD *)(*(_QWORD *)a4 + 16);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  *(_QWORD *)(v8 + 16) = 0;
  v17 = 0;
  v10 = +[MLModelDescriptionUtils createModelDescription:error:](MLModelDescriptionUtils, "createModelDescription:error:", v7, &v17);
  v11 = v17;
  v12 = v11;
  if (v10)
  {
    v13 = *(_QWORD *)(v8 + 16);
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    *(_QWORD *)(v8 + 16) = v10;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    v14 = v12 == 0;
  }
  else if (a5)
  {
    if (v11)
    {
      v15 = objc_retainAutorelease(v11);
    }
    else
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Could not save MLModelDescription to MLModelSpecification"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = 0;
    *a5 = v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)validateAllFeatureDescriptions:(id)a3 hasAnyFeatureTypeIn:(id)a4 minimalCount:(unint64_t)a5 maximumCount:(unint64_t)a6 debugLabel:(id)a7 error:(id *)a8
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  id v35;
  id obj;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v39 = a4;
  v34 = v12;
  v35 = a7;
  v13 = objc_msgSend(v12, "count");
  v14 = v13;
  if (v13 < a5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v51 = v35;
      v52 = 2048;
      v53 = a5;
      v54 = 2048;
      v55 = v14;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "%{public}@: There must be at least %tu features, but there is only %tu.", buf, 0x20u);
    }

    if (a8)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@: There must be at least %tu features, but there is only %tu."), v35, a5, v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v18 = 0;
      *a8 = v16;
      goto LABEL_35;
    }
    goto LABEL_12;
  }
  if (v13 > a6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v51 = v35;
      v52 = 2048;
      v53 = a6;
      v54 = 2048;
      v55 = v14;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "%{public}@: There must be at most %tu features, but there is %tu.", buf, 0x20u);
    }

    if (a8)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@: There must be at most %tu features, but there is %tu."), v35, a6, v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v18 = 0;
    goto LABEL_35;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v12;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v19)
  {
    v38 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "type"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v39, "containsObject:", v22);

        if ((v23 & 1) == 0)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v39, "count"));
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v25 = v39;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v41 != v27)
                  objc_enumerationMutation(v25);
                +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "integerValue"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v29);

              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v26);
          }

          objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v21, "type"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v51 = v35;
            v52 = 2114;
            v53 = (unint64_t)v30;
            v54 = 2114;
            v55 = (unint64_t)v31;
            _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "%{public}@: The feature type must be one of {%{public}@}, but it is %{public}@.", buf, 0x20u);
          }

          if (a8)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@: The feature type must be one of {%@}, but it is %@."), v35, v30, v31);
            *a8 = (id)objc_claimAutoreleasedReturnValue();

            v18 = 0;
            goto LABEL_34;
          }

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v19)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_34:

LABEL_35:
  return v18;
}

@end
