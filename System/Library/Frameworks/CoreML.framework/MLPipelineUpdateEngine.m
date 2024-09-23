@implementation MLPipelineUpdateEngine

- (id)initFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  MLModelAssetDescription *v15;
  MLModelAssetDescription *v16;
  void *v17;
  char hasNestedArchive;
  char v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  std::string *v28;
  __int128 v29;
  char *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  vector<unsigned long long, std::allocator<unsigned long long>> *p_updatableModelIndicies;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v43;
  unint64_t *begin;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  char v59;
  MLPipelineUpdateEngine *v60;
  void *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  MLModelAssetDescription *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  objc_super v71;
  id v72;
  void *v73[2];
  std::string::size_type v74;
  char *v75;
  std::string v76;
  void *__p;
  std::__shared_weak_count *v78;
  _BYTE v79[8];
  char *v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  std::__shared_weak_count *v84;
  _BYTE v85[8];
  char *v86;
  objc_super v87;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[MLModelAssetDescription initWithCompiledModelArchive:error:]([MLModelAssetDescription alloc], "initWithCompiledModelArchive:error:", a3, a7);
  v16 = v15;
  if (!v15)
    goto LABEL_65;
  -[MLModelAssetDescription defaultModelDescription](v15, "defaultModelDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87.receiver = self;
  v87.super_class = (Class)MLPipelineUpdateEngine;
  self = -[MLPipeline initModelFromMetadataAndArchive:versionInfo:description:configuration:error:](&v87, sel_initModelFromMetadataAndArchive_versionInfo_description_configuration_error_, a3, v12, v17, v14, a7);

  if (!self)
    goto LABEL_67;
  std::string::basic_string[abi:ne180100]<0>(&v83, "updateParameters");
  hasNestedArchive = IArchive::hasNestedArchive(a3, &v83);
  v19 = hasNestedArchive;
  if ((v85[7] & 0x80000000) != 0)
  {
    operator delete(v83);
    if ((v19 & 1) != 0)
    {
LABEL_5:
      v67 = v13;
      v68 = v12;
      v66 = v16;
      std::string::basic_string[abi:ne180100]<0>(&__p, "updateParameters");
      v20 = IArchive::nestedArchive(a3, (uint64_t)&__p);
      if ((v79[7] & 0x80000000) != 0)
        operator delete(__p);
      v21 = (std::__shared_weak_count *)*((_QWORD *)v20 + 1);
      v83 = *(void **)v20;
      v84 = v21;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldxr(p_shared_owners);
        while (__stxr(v23 + 1, p_shared_owners));
      }
      std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v85, (_QWORD *)v20 + 2);
      v82 = 0;
      operator>>((uint64_t)&v83);
      v70 = (void *)objc_msgSend(v14, "copy");
      if (v82)
      {
        v24 = 0;
        v69 = v14;
        while (1)
        {
          v81 = 0;
          operator>>((uint64_t)&v83);
          v25 = v81;
          -[MLPipeline models](self, "models");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v25 >= v27)
            break;
          std::to_string(&v76, v25);
          v28 = std::string::insert(&v76, 0, "model");
          v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v74 = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)v73 = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = IArchive::nestedArchive(a3, (uint64_t)v73);
          v31 = (std::__shared_weak_count *)*((_QWORD *)v30 + 1);
          __p = *(void **)v30;
          v78 = v31;
          if (v31)
          {
            v32 = (unint64_t *)&v31->__shared_owners_;
            do
              v33 = __ldxr(v32);
            while (__stxr(v33 + 1, v32));
          }
          std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v79, (_QWORD *)v30 + 2);
          if (SHIBYTE(v74) < 0)
            operator delete(v73[0]);
          if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v76.__r_.__value_.__l.__data_);
          _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)v73, (const IArchive *)&__p);
          IArchive::rewind((uint64_t)v73);
          -[MLPipeline modelNames](self, "modelNames");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "parameters");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterUtils deScopeParameters:byDeletingPrefixingScope:](MLParameterUtils, "deScopeParameters:byDeletingPrefixingScope:", v36, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setParameters:", v37);

          v72 = 0;
          +[MLLoader loadUpdatableModelFromArchive:configuration:error:](MLLoader, "loadUpdatableModelFromArchive:configuration:error:", v73, v70, &v72);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v72;
          if (v38)
          {
            -[MLPipeline replaceModelAtIndex:with:](self, "replaceModelAtIndex:with:", v25, v38);
            p_updatableModelIndicies = &self->_updatableModelIndicies;
            end = self->_updatableModelIndicies.__end_;
            value = self->_updatableModelIndicies.__end_cap_.__value_;
            if (end >= value)
            {
              begin = p_updatableModelIndicies->__begin_;
              v45 = end - p_updatableModelIndicies->__begin_;
              v46 = v45 + 1;
              if ((unint64_t)(v45 + 1) >> 61)
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              v47 = (char *)value - (char *)begin;
              if (v47 >> 2 > v46)
                v46 = v47 >> 2;
              v48 = (unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8;
              v49 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v48)
                v49 = v46;
              if (v49)
              {
                v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v49);
                begin = p_updatableModelIndicies->__begin_;
                end = self->_updatableModelIndicies.__end_;
              }
              else
              {
                v50 = 0;
              }
              v51 = (unint64_t *)(v49 + 8 * v45);
              *v51 = v25;
              v43 = v51 + 1;
              while (end != begin)
              {
                v52 = *--end;
                *--v51 = v52;
              }
              p_updatableModelIndicies->__begin_ = v51;
              self->_updatableModelIndicies.__end_ = v43;
              self->_updatableModelIndicies.__end_cap_.__value_ = (unint64_t *)(v49 + 8 * v50);
              if (begin)
                operator delete(begin);
            }
            else
            {
              *end = v25;
              v43 = end + 1;
            }
            self->_updatableModelIndicies.__end_ = v43;
            v14 = v69;
          }
          else if (a7)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v39, CFSTR("Failed to load updatable sub-model at %lu"), v25);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }

          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v75);
          v53 = (std::__shared_weak_count *)v73[1];
          if (v73[1])
          {
            v54 = (unint64_t *)((char *)v73[1] + 8);
            do
              v55 = __ldaxr(v54);
            while (__stlxr(v55 - 1, v54));
            if (!v55)
            {
              ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
              std::__shared_weak_count::__release_weak(v53);
            }
          }
          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v80);
          v56 = v78;
          if (v78)
          {
            v57 = (unint64_t *)&v78->__shared_owners_;
            do
              v58 = __ldaxr(v57);
            while (__stlxr(v58 - 1, v57));
            if (!v58)
            {
              ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
              std::__shared_weak_count::__release_weak(v56);
            }
          }

          if (!v38)
          {
            v59 = 1;
            v13 = v67;
            v12 = v68;
            v16 = v66;
            goto LABEL_59;
          }
          if (++v24 >= v82)
            goto LABEL_51;
        }
        v13 = v67;
        v12 = v68;
        v16 = v66;
        v61 = v70;
        if (a7)
        {
          +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Updatable model index is out of range."));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        v59 = 1;
      }
      else
      {
LABEL_51:
        v71.receiver = self;
        v71.super_class = (Class)MLPipelineUpdateEngine;
        v13 = v67;
        v12 = v68;
        v16 = v66;
        -[MLPipeline updateParameterDescriptionsByKeyBasedOnSubModel](&v71, sel_updateParameterDescriptionsByKeyBasedOnSubModel);
        v59 = 0;
LABEL_59:
        v61 = v70;
      }

      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v86);
      v62 = v84;
      if (!v84)
        goto LABEL_64;
      v63 = (unint64_t *)&v84->__shared_owners_;
      do
        v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
        if ((v59 & 1) != 0)
          goto LABEL_65;
      }
      else
      {
LABEL_64:
        if ((v59 & 1) != 0)
          goto LABEL_65;
      }
LABEL_67:
      self = self;
      v60 = self;
      goto LABEL_68;
    }
  }
  else if ((hasNestedArchive & 1) != 0)
  {
    goto LABEL_5;
  }
  if (!a7)
  {
LABEL_65:
    v60 = 0;
    goto LABEL_68;
  }
  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Pipeline is not marked as updatable to perform update."));
  v60 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

  return v60;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  unint64_t *begin;
  unint64_t *end;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[MLPipelineUpdateEngine setProgressHandlers:](self, "setProgressHandlers:", v12);
  -[MLPipelineUpdateEngine setDispatchQueue:](self, "setDispatchQueue:", v6);
  begin = self->_updatableModelIndicies.__begin_;
  end = self->_updatableModelIndicies.__end_;
  while (begin != end)
  {
    v9 = *begin;
    -[MLPipeline models](self, "models");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUpdateProgressHandlers:dispatchQueue:", v12, v6);

    ++begin;
  }

}

- (void)updateModelWithData:(id)a3
{
  id v4;
  void *v5;
  vector<unsigned long long, std::allocator<unsigned long long>> *p_updatableModelIndicies;
  unint64_t *begin;
  unint64_t *end;
  unint64_t *v9;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  v4 = a3;
  v5 = v4;
  p_updatableModelIndicies = &self->_updatableModelIndicies;
  begin = self->_updatableModelIndicies.__begin_;
  end = self->_updatableModelIndicies.__end_;
  v9 = begin + 1;
  if (begin != end && v9 != end)
  {
    v11 = *begin;
    v12 = begin + 1;
    do
    {
      v14 = *v12++;
      v13 = v14;
      v15 = v11 >= v14;
      if (v11 <= v14)
        v11 = v13;
      if (!v15)
        begin = v9;
      v9 = v12;
    }
    while (v12 != end);
  }
  v16 = 0;
  v17 = 0;
  v18 = *begin;
  v31 = v4;
  while (1)
  {
    v20 = p_updatableModelIndicies->__begin_;
    v19 = self->_updatableModelIndicies.__end_;
    if (p_updatableModelIndicies->__begin_ != v19)
    {
      while (*v20 != v17)
      {
        if (++v20 == v19)
        {
          v20 = self->_updatableModelIndicies.__end_;
          break;
        }
      }
    }
    if (v20 != v19)
    {
      -[MLPipeline models](self, "models");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateModelWithData:", v5);

    }
    if (v17 == v18)
      goto LABEL_21;
    -[MLPipeline models](self, "models");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v16;
    objc_msgSend(v24, "predictionsFromBatch:error:", v5, &v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v33;

    if (v26)
      break;
    v32 = 0;
    +[MLBatchProviderUtils lazyBatchWithFeaturesInBatch:addedToBatch:error:](MLBatchProviderUtils, "lazyBatchWithFeaturesInBatch:addedToBatch:error:", v25, v5, &v32);
    v27 = objc_claimAutoreleasedReturnValue();
    v16 = v32;

    v5 = (void *)v27;
LABEL_21:
    if (++v17 > v18)
      goto LABEL_24;
  }
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v26, CFSTR("Failed to carry forward results for model %llu in pipeline"), v17, v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLPipelineUpdateEngine progressHandlers](self, "progressHandlers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLPipelineUpdateEngine dispatchQueue](self, "dispatchQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dispatchTrainingCompletionHandlerWithError:onQueue:", v28, v30);

  v16 = v26;
LABEL_24:

}

- (void)resumeUpdate
{
  unint64_t *begin;
  unint64_t *i;
  unint64_t v5;
  void *v6;
  void *v7;

  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    v5 = *begin;
    -[MLPipeline models](self, "models");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeUpdate");

  }
}

- (void)resumeUpdateWithParameters:(id)a3
{
  unint64_t *begin;
  unint64_t *i;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    v6 = *begin;
    -[MLPipeline modelNames](self, "modelNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLParameterUtils deScopeParameters:byDeletingPrefixingScope:](MLParameterUtils, "deScopeParameters:byDeletingPrefixingScope:", v12, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLPipeline models](self, "models");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resumeUpdateWithParameters:", v9);

  }
}

- (void)cancelUpdate
{
  unint64_t *begin;
  unint64_t *i;
  unint64_t v5;
  void *v6;
  void *v7;

  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    v5 = *begin;
    -[MLPipeline models](self, "models");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelUpdate");

  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t *begin;
  unint64_t *end;
  unint64_t *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  MLPipelineUpdateEngine *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  id v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  objc_super v28;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)MLPipelineUpdateEngine;
  if (-[MLPipeline writeToURL:error:](&v28, sel_writeToURL_error_, v6, a4))
  {
    v7 = 0x1E0CB3000uLL;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_retainAutorelease(v6);
    objc_msgSend(v8, "stringWithUTF8String:", objc_msgSend(v25, "fileSystemRepresentation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    begin = self->_updatableModelIndicies.__begin_;
    end = self->_updatableModelIndicies.__end_;
    if (begin == end)
    {
      v20 = 1;
    }
    else
    {
      v23 = v6;
      v24 = a4;
      v11 = begin + 1;
      do
      {
        v12 = *(v11 - 1);
        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("model%llu"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v7;
        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("%@/%@"), v26, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeItemAtPath:error:", v15, 0);
        objc_msgSend(v25, "URLByAppendingPathComponent:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self;
        -[MLPipeline models](self, "models");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "writeToURL:error:", v16, v24);

        if (v11 == end)
          v21 = 0;
        else
          v21 = v20;
        ++v11;
        self = v17;
        v7 = v14;
      }
      while ((v21 & 1) != 0);
      v6 = v23;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLPipelineUpdateEngine;
  -[MLPipeline parameterValueForKey:error:](&v5, sel_parameterValueForKey_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (vector<unsigned)updatableModelIndicies
{
  vector<unsigned long long, std::allocator<unsigned long long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_updatableModelIndicies, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProgressHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  vector<unsigned long long, std::allocator<unsigned long long>> *p_updatableModelIndicies;
  unint64_t *begin;

  p_updatableModelIndicies = &self->_updatableModelIndicies;
  begin = self->_updatableModelIndicies.__begin_;
  if (begin)
  {
    p_updatableModelIndicies->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[MLPipelineUpdateEngine initFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:]([MLPipelineUpdateEngine alloc], "initFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v11, v12, v13, a7);

  return v14;
}

@end
