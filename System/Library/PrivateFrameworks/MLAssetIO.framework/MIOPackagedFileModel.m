@implementation MIOPackagedFileModel

- (MIOPackagedFileModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  NSURL *v5;
  NSURL *packageURL;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  MIOSpecificationFileModel *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  MIOPackagedFileModel *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  MIOMutableModelDescription *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  NSDictionary *v39;
  NSDictionary *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  NSDictionary *v46;
  NSString *v47;
  NSDictionary *v49;
  id v50;
  id v51;
  id obj;
  MIOSpecificationFileModel *v53;
  id v54;
  id v55;
  void *v57;
  void *v58[2];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  MPL::ModelPackageItemInfo *v62;
  std::__shared_weak_count *v63;
  char v64;
  void *v65[2];
  char v66;
  void *__p;
  std::__shared_weak_count *v68;
  char v69;
  MPL::ModelPackageItemInfo *v70;
  std::__shared_weak_count *v71;
  MPL::detail::ModelPackageImpl *v72[4];

  v72[2] = *(MPL::detail::ModelPackageImpl **)MEMORY[0x1E0C80C00];
  v50 = a3;
  v5 = (NSURL *)objc_msgSend(v50, "copy");
  packageURL = self->_packageURL;
  self->_packageURL = v5;

  v55 = objc_retainAutorelease(v50);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v55, "fileSystemRepresentation"));
  MPL::ModelPackage::ModelPackage(v58, (char *)&__p, 0, 1);
  if (v69 < 0)
    operator delete(__p);
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = (void *)MEMORY[0x1E0CB3940];
  MPL::ModelPackage::getRootModel((MPL::detail::ModelPackageImpl **)v58, &__p);
  v9 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)__p);
  if (*(char *)(v9 + 23) >= 0)
    v10 = v9;
  else
    v10 = *(_QWORD *)v9;
  objc_msgSend(v8, "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v11);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v68;
  if (v68)
  {
    p_shared_owners = (unint64_t *)&v68->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v58);
  v15 = -[MIOSpecificationFileModel initWithContentsOfURL:error:]([MIOSpecificationFileModel alloc], "initWithContentsOfURL:error:", v57, a4);
  v53 = v15;
  if (v15)
  {
    -[MIOSpecificationFileModel modelDescription](v15, "modelDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v16, "mutableCopy");

    v17 = v55;
    v54 = obj;
    v18 = objc_retainAutorelease(v17);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "fileSystemRepresentation"));
    MPL::ModelPackage::ModelPackage(v65, (char *)&__p, 0, 1);
    if (v69 < 0)
      operator delete(__p);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("Metadata.json"), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v58, (char *)objc_msgSend(CFSTR("com.apple.CoreML"), "UTF8String"));
    MPL::ModelPackage::findItem((MPL::detail::ModelPackageImpl **)v65, (uint64_t)&__p, (uint64_t)v58, (uint64_t **)&v62);
    if (SBYTE7(v59) < 0)
      operator delete(v58[0]);
    if (v69 < 0)
      operator delete(__p);
    if (v62)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = MPL::ModelPackageItemInfo::path(v62);
      if (*(char *)(v20 + 23) >= 0)
        v21 = v20;
      else
        v21 = *(_QWORD *)v20;
      objc_msgSend(v19, "stringWithUTF8String:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v24 = v63;
    if (v63)
    {
      v25 = (unint64_t *)&v63->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v65);
    if (v22)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v22, 1, a4);
      if (!v27)
      {

        goto LABEL_69;
      }
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v27, 0, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {

        goto LABEL_69;
      }
      objc_msgSend(v54, "setMetadata:", v28);

    }
    else
    {

    }
    v29 = v18;
    v30 = (MIOMutableModelDescription *)v54;
    v51 = objc_retainAutorelease(v29);
    std::string::basic_string[abi:ne180100]<0>(v65, (char *)objc_msgSend(v51, "fileSystemRepresentation"));
    MPL::ModelPackage::ModelPackage(v72, (char *)v65, 0, 1);
    if (v66 < 0)
      operator delete(v65[0]);
    std::string::basic_string[abi:ne180100]<0>(v65, (char *)objc_msgSend(CFSTR("FeatureDescriptions.json"), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v62, (char *)objc_msgSend(CFSTR("com.apple.CoreML"), "UTF8String"));
    MPL::ModelPackage::findItem(v72, (uint64_t)v65, (uint64_t)&v62, (uint64_t **)&v70);
    if (v64 < 0)
      operator delete(v62);
    if (v66 < 0)
      operator delete(v65[0]);
    if (v70)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = MPL::ModelPackageItemInfo::path(v70);
      if (*(char *)(v32 + 23) >= 0)
        v33 = v32;
      else
        v33 = *(_QWORD *)v32;
      objc_msgSend(v31, "stringWithUTF8String:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    v35 = v71;
    if (v71)
    {
      v36 = (unint64_t *)&v71->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v72);
    if (!v34)
    {

LABEL_65:
      objc_storeStrong((id *)&self->_modelDescription, obj);
      v23 = -[MIOPackagedFileModel initWithModel:](self, "initWithModel:", v53);
      self = v23;
LABEL_70:

      goto LABEL_71;
    }
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v34, 1, a4);
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v38, 0, a4);
      v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        v49 = v39;
        extractExternalFeatureDescriptionsFromDictionary(v39, v30, 0);
        -[NSDictionary objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("Functions"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        *(_OWORD *)v58 = 0u;
        v59 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v58, &__p, 16);
        if (v43)
        {
          v44 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v59 != v44)
                objc_enumerationMutation(v42);
              v46 = (NSDictionary *)*((_QWORD *)v58[1] + i);
              -[NSDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", CFSTR("Name"));
              v47 = (NSString *)objc_claimAutoreleasedReturnValue();
              extractExternalFeatureDescriptionsFromDictionary(v46, v30, v47);

            }
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v58, &__p, 16);
          }
          while (v43);
        }

        goto LABEL_65;
      }

    }
    else
    {

    }
LABEL_69:
    v23 = 0;
    goto LABEL_70;
  }
  v23 = 0;
LABEL_71:

  return v23;
}

- (MIOPackagedFileModel)initWithModel:(id)a3
{
  id v5;
  MIOPackagedFileModel *v6;
  MIOPackagedFileModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIOPackagedFileModel;
  v6 = -[MIOPackagedFileModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specificationFileModel, a3);

  return v7;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id obj;
  void *v81;
  MPL::ModelPackageItemInfo *v82[2];
  MPL::ModelPackageItemInfo *v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *__p;
  std::__shared_weak_count *v90;
  char v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96[2];
  char v97;
  MPL::detail::ModelPackageImpl *v98[5];

  v98[2] = *(MPL::detail::ModelPackageImpl **)MEMORY[0x1E0C80C00];
  v78 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOPackagedFileModel packageURL](self, "packageURL");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "path");
  v79 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v78, "path");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v76, "copyItemAtPath:toPath:error:", v79);
  v75 = 0;
  if ((v5 & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v77), "UTF8String"));
    MPL::ModelPackage::ModelPackage(&v92, (char *)&__p, 1u, 0);
    if (v91 < 0)
      operator delete(__p);
    v6 = (void *)MEMORY[0x1E0C99E98];
    v7 = (void *)MEMORY[0x1E0CB3940];
    MPL::ModelPackage::getRootModel((MPL::detail::ModelPackageImpl **)&v92, &__p);
    v8 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)__p);
    if (*(char *)(v8 + 23) >= 0)
      v9 = v8;
    else
      v9 = *(_QWORD *)v8;
    objc_msgSend(v7, "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v10);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v90;
    if (v90)
    {
      p_shared_owners = (unint64_t *)&v90->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)&v92);
    -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "writeToURL:error:", v73, a4);

    if ((v15 & 1) == 0)
    {
      v23 = 0;
      goto LABEL_87;
    }
    -[MIOPackagedFileModel modelDescription](self, "modelDescription");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "metadata");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v78);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "fileSystemRepresentation"));
    MPL::ModelPackage::ModelPackage(v98, (char *)&__p, 1u, 0);
    if (v91 < 0)
      operator delete(__p);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("Metadata.json"), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v92, (char *)objc_msgSend(CFSTR("com.apple.CoreML"), "UTF8String"));
    MPL::ModelPackage::findItem(v98, (uint64_t)&__p, (uint64_t)&v92, (uint64_t **)&v83);
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (v83)
    {
      v19 = MPL::ModelPackageItemInfo::path(v83);
      if (*(char *)(v19 + 23) >= 0)
        v20 = v19;
      else
        v20 = *(_QWORD *)v19;
      objc_msgSend(v18, "stringWithUTF8String:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v96, "External Metadata Overlay");
      MPL::ModelPackage::createFile(v98, (char *)&__p, (uint64_t)&v92, (uint64_t)v96, v82);
      v24 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)v82);
      if (*(char *)(v24 + 23) >= 0)
        v25 = v24;
      else
        v25 = *(_QWORD *)v24;
      objc_msgSend(v18, "stringWithUTF8String:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v82);
      if (v97 < 0)
        operator delete(v96[0]);
    }
    v26 = v84;
    if (v84)
    {
      v27 = (unint64_t *)&v84->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    if (SBYTE7(v93) < 0)
      operator delete((void *)v92);
    if (v91 < 0)
      operator delete(__p);
    MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v98);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 1, a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      if ((objc_msgSend(v29, "writeToFile:atomically:", v21, 1) & 1) != 0)
      {

        -[MIOPackagedFileModel modelDescription](self, "modelDescription");
        v72 = (id)objc_claimAutoreleasedReturnValue();
        v70 = objc_retainAutorelease(v17);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v70, "fileSystemRepresentation"));
        MPL::ModelPackage::ModelPackage(v98, (char *)&__p, 1u, 0);
        if (v91 < 0)
          operator delete(__p);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("FeatureDescriptions.json"), "UTF8String"));
        std::string::basic_string[abi:ne180100]<0>(&v92, (char *)objc_msgSend(CFSTR("com.apple.CoreML"), "UTF8String"));
        MPL::ModelPackage::findItem(v98, (uint64_t)&__p, (uint64_t)&v92, (uint64_t **)&v83);
        v31 = (void *)MEMORY[0x1E0CB3940];
        if (v83)
        {
          v32 = MPL::ModelPackageItemInfo::path(v83);
          if (*(char *)(v32 + 23) >= 0)
            v33 = v32;
          else
            v33 = *(_QWORD *)v32;
          objc_msgSend(v31, "stringWithUTF8String:", v33);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v96, "External FeatureDescription Overlay");
          MPL::ModelPackage::createFile(v98, (char *)&__p, (uint64_t)&v92, (uint64_t)v96, v82);
          v37 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)v82);
          if (*(char *)(v37 + 23) >= 0)
            v38 = v37;
          else
            v38 = *(_QWORD *)v37;
          objc_msgSend(v31, "stringWithUTF8String:", v38);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v82);
          if (v97 < 0)
            operator delete(v96[0]);
        }
        v39 = v84;
        if (v84)
        {
          v40 = (unint64_t *)&v84->__shared_owners_;
          do
            v41 = __ldaxr(v40);
          while (__stlxr(v41 - 1, v40));
          if (!v41)
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
        }
        if (SBYTE7(v93) < 0)
          operator delete((void *)v92);
        if (v91 < 0)
          operator delete(__p);
        MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v98);
        v71 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(v72, "inputDescriptions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        featureDescriptionDictionaryFromFeatureDescriptionArray(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v43);

        objc_msgSend(v72, "stateDescriptions");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        featureDescriptionDictionaryFromFeatureDescriptionArray(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v45, CFSTR("States"));

        objc_msgSend(v72, "outputDescriptions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        featureDescriptionDictionaryFromFeatureDescriptionArray(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v47, CFSTR("Outputs"));

        objc_msgSend(v72, "trainingInputDescriptions");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        featureDescriptionDictionaryFromFeatureDescriptionArray(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v49, CFSTR("TrainingInputs"));

        v81 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        objc_msgSend(v72, "functionDescriptions");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v50;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v92, &__p, 16);
        if (v51)
        {
          v52 = *(_QWORD *)v93;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v93 != v52)
                objc_enumerationMutation(obj);
              v54 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
              v55 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
              objc_msgSend(v54, "name");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, CFSTR("Name"));

              objc_msgSend(v54, "inputDescriptions");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              featureDescriptionDictionaryFromFeatureDescriptionArray(v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v58, CFSTR("Inputs"));

              objc_msgSend(v54, "stateDescriptions");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              featureDescriptionDictionaryFromFeatureDescriptionArray(v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v60, CFSTR("States"));

              objc_msgSend(v54, "outputDescriptions");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              featureDescriptionDictionaryFromFeatureDescriptionArray(v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v62, CFSTR("Outputs"));

              objc_msgSend(v81, "addObject:", v55);
            }
            v50 = obj;
            v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, &__p, 16);
          }
          while (v51);
        }

        if (objc_msgSend(v81, "count"))
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v81, CFSTR("Functions"));
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v71, 1, a4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (v63)
        {
          if ((objc_msgSend(v63, "writeToFile:atomically:", v69, 1) & 1) != 0)
          {
            v23 = 1;
LABEL_84:

            goto LABEL_85;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[MIOPackagedFileModel writeToURL:error:].cold.1();
          if (a4)
          {
            v65 = (void *)MEMORY[0x1E0CB35C8];
            v98[0] = *(MPL::detail::ModelPackageImpl **)MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write feature descriptions to external JSON file at %@"), v69);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = v66;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v98, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v67);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v23 = 0;
        goto LABEL_84;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MIOPackagedFileModel writeToURL:error:].cold.3();
      if (a4)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v87 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write metadata to external JSON file at %@"), v21);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v36);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    v23 = 0;
LABEL_85:

LABEL_87:
    goto LABEL_88;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MIOPackagedFileModel writeToURL:error:].cold.6(objc_msgSend(objc_retainAutorelease(v79), "UTF8String"), objc_msgSend(objc_retainAutorelease(v77), "UTF8String"), (uint8_t *)&__p);
  if (a4)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v85 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to copy model from %s to %s"), objc_msgSend(objc_retainAutorelease(v79), "UTF8String"), objc_msgSend(objc_retainAutorelease(v77), "UTF8String"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2);
    v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v23 = 0;
LABEL_88:

  return v23;
}

- (MIOVersionInfo)specificationVersion
{
  void *v2;
  void *v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specificationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOVersionInfo *)v3;
}

- (NSString)modelTypeName
{
  void *v2;
  void *v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)layers
{
  void *v2;
  void *v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)subModels
{
  void *v2;
  void *v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "neuralNetworkLayerHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "programOperationHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storagePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)irProgram
{
  void *v2;
  void *v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "irProgram");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MIOPackagedFileModel *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MIOPackagedFileModel *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[MIOPackagedFileModel modelDescription](self, "modelDescription"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[MIOPackagedFileModel modelDescription](v4, "modelDescription"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          v5,
          (v7 & 1) != 0))
    {
      -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOPackagedFileModel specificationFileModel](v4, "specificationFileModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MIOPackagedFileModel *v4;
  void *v5;
  void *v6;
  MIOPackagedFileModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = [MIOPackagedFileModel alloc];
  -[MIOPackagedFileModel specificationFileModel](self, "specificationFileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MIOPackagedFileModel initWithModel:](v4, "initWithModel:", v6);

  -[MIOPackagedFileModel packageURL](self, "packageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[MIOPackagedFileModel setPackageURL:](v7, "setPackageURL:", v9);

  -[MIOPackagedFileModel modelDescription](self, "modelDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[MIOPackagedFileModel setModelDescription:](v7, "setModelDescription:", v11);

  return v7;
}

- (MIOModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MIOModeling)specificationFileModel
{
  return self->_specificationFileModel;
}

- (void)setSpecificationFileModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationFileModel, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

- (void)initWithContentsOfURL:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], v2, "Failed to open the model package at %@. Error: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)initWithContentsOfURL:(uint64_t)a1 error:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], v2, "Failed to extract root model from the model package at %@. Error: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)writeToURL:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, MEMORY[0x1E0C81028], v0, "Failed to write feature descriptions to external JSON file at %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)writeToURL:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, MEMORY[0x1E0C81028], v1, "Failed to look up or create file for storing feature descriptions. Error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)writeToURL:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, MEMORY[0x1E0C81028], v0, "Failed to write metadata to external JSON file at %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)writeToURL:(uint64_t)a1 error:.cold.4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, MEMORY[0x1E0C81028], v1, "Failed to look up or create file for storing metadata. Error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)writeToURL:(uint64_t)a1 error:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], v2, "Failed to extract root from model package at %@. Error: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)writeToURL:(uint8_t *)buf error:.cold.6(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to copy model from %s to %s", buf, 0x16u);
}

@end
