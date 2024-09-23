@implementation MLGLMClassification

- (MLGLMClassification)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  MLGLMClassification *v9;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *classLabels;
  shared_ptr<CoreML::Specification::Model> *p_m_spec;
  CoreML::Specification::protobuf_GLMClassifier_2eproto *inited;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  CoreML::Specification::protobuf_GLMClassifier_2eproto **p_intercept;
  double *end;
  double *value;
  double *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  CoreML::Specification::protobuf_GLMClassifier_2eproto *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  void *v52;
  int v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v75;
  id v76;
  shared_ptr<CoreML::Specification::Model> *v77;
  uint64_t *v78;
  uint64_t v79;
  void *v80;
  uint64_t *v81;
  __int128 v82;
  unint64_t v83;
  objc_super v84;

  v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)MLGLMClassification;
  v76 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v9 = -[MLClassifier initWithDescription:configuration:error:](&v84, sel_initWithDescription_configuration_error_, v76, v8, a5);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    classLabels = v9->classLabels;
    v9->classLabels = v11;

    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v82, *(const CoreML::Specification::Model **)a3);
    p_m_spec = &v9->m_spec;
    inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)&v9->m_spec, &v82);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v82 + 1);
    if (*((_QWORD *)&v82 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v82 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
    {
      v18 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
    }
    else
    {
      inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
      v18 = &CoreML::Specification::_GLMClassifier_default_instance_;
    }
    v80 = v10;
    v19 = v18[6];
    if (v19)
      v20 = (_QWORD *)(v19 + 8);
    else
      v20 = 0;
    v75 = v8;
    if (v19)
      v21 = v19 + 8 + 8 * *((int *)v18 + 10);
    else
      v21 = 0;
    v81 = (uint64_t *)v9;
    if (v20 != (_QWORD *)v21)
    {
      p_intercept = (CoreML::Specification::protobuf_GLMClassifier_2eproto **)&v9->intercept;
      end = v9->intercept.__end_;
      do
      {
        value = v9->intercept.__end_cap_.__value_;
        if (end >= value)
        {
          inited = *p_intercept;
          v26 = ((char *)end - (char *)*p_intercept) >> 3;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v28 = (char *)value - (char *)inited;
          if (v28 >> 2 > v27)
            v27 = v28 >> 2;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
          {
            v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v29);
            inited = *p_intercept;
            end = v9->intercept.__end_;
          }
          else
          {
            v30 = 0;
          }
          v31 = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)(v29 + 8 * v26);
          *(_QWORD *)v31 = *v20;
          v25 = (double *)((char *)v31 + 8);
          while (end != (double *)inited)
          {
            v32 = *((_QWORD *)end-- - 1);
            *((_QWORD *)v31 - 1) = v32;
            v31 = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)((char *)v31 - 8);
          }
          *p_intercept = v31;
          v9->intercept.__end_ = v25;
          v9->intercept.__end_cap_.__value_ = (double *)(v29 + 8 * v30);
          if (inited)
            operator delete(inited);
        }
        else
        {
          *end = *(double *)v20;
          v25 = end + 1;
        }
        v9->intercept.__end_ = v25;
        ++v20;
        end = v25;
      }
      while (v20 != (_QWORD *)v21);
    }
    v33 = v18[4];
    if (v33)
      v34 = (uint64_t *)(v33 + 8);
    else
      v34 = 0;
    v35 = *((int *)v18 + 6);
    if ((_DWORD)v35)
    {
      v77 = &v9->m_spec;
      v78 = &v34[v35];
      do
      {
        v36 = *v34;
        v82 = 0uLL;
        v83 = 0;
        v37 = *(_QWORD *)(v36 + 24);
        if (v37)
          v38 = (_QWORD *)(v37 + 8);
        else
          v38 = 0;
        if (v37)
          v39 = v37 + 8 + 8 * *(int *)(v36 + 16);
        else
          v39 = 0;
        if (v38 == (_QWORD *)v39)
        {
          v40 = 0;
        }
        else
        {
          v40 = 0;
          v41 = 0;
          v42 = 0;
          do
          {
            if ((unint64_t)v42 >= v41)
            {
              v44 = (v42 - v40) >> 3;
              v45 = v44 + 1;
              if ((unint64_t)(v44 + 1) >> 61)
              {
                v83 = v41;
                *(_QWORD *)&v82 = v40;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v41 - (_QWORD)v40) >> 2 > v45)
                v45 = (uint64_t)(v41 - (_QWORD)v40) >> 2;
              if (v41 - (unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
                v46 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v46 = v45;
              if (v46)
                v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v46);
              else
                v47 = 0;
              v48 = (char *)(v46 + 8 * v44);
              *(_QWORD *)v48 = *v38;
              v43 = v48 + 8;
              while (v42 != v40)
              {
                v49 = *((_QWORD *)v42 - 1);
                v42 -= 8;
                *((_QWORD *)v48 - 1) = v49;
                v48 -= 8;
              }
              v41 = v46 + 8 * v47;
              *((_QWORD *)&v82 + 1) = v43;
              if (v40)
                operator delete(v40);
              v40 = v48;
            }
            else
            {
              *(_QWORD *)v42 = *v38;
              v43 = v42 + 8;
            }
            *((_QWORD *)&v82 + 1) = v43;
            ++v38;
            v42 = v43;
          }
          while (v38 != (_QWORD *)v39);
          v83 = v41;
          *(_QWORD *)&v82 = v40;
          p_m_spec = v77;
        }
        v9 = (MLGLMClassification *)v81;
        v50 = v81[16];
        if (v50 >= v81[17])
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v81 + 15, (uint64_t)&v82);
        }
        else
        {
          std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)(v81 + 15), (uint64_t)&v82);
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)(v50 + 24);
        }
        v81[16] = (uint64_t)inited;
        if (v40)
        {
          *((_QWORD *)&v82 + 1) = v40;
          operator delete(v40);
        }
        ++v34;
      }
      while (v34 != v78);
    }
    if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
    {
      v51 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
      v8 = v75;
      v52 = v80;
    }
    else
    {
      v8 = v75;
      v52 = v80;
      inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
      v51 = &CoreML::Specification::_GLMClassifier_default_instance_;
    }
    v53 = *((_DWORD *)v51 + 21);
    v54 = v18;
    if (v53 == 101)
    {
      v64 = 0;
      v79 = 1;
      while (1)
      {
        if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
        {
          v65 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
          v65 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v65 + 21) == 101)
        {
          v66 = (uint64_t *)v65[9];
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          v66 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        if (v64 >= *((int *)v66 + 4))
          break;
        if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
        {
          v67 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
          v67 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v67 + 21) == 101)
        {
          v68 = (uint64_t *)v67[9];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          v68 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        v69 = *(_QWORD *)(v68[3] + 8 * v64 + 8);
        v70 = (void *)v81[18];
        +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v71);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v69);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v72);

        ++v64;
      }
    }
    else
    {
      if (v53 != 100)
      {
LABEL_112:
        v9->postEvalTransForm = *((_DWORD *)v54 + 15);
        v9->classEncoding = *((_DWORD *)v54 + 16);
        -[MLModel modelDescription](v9, "modelDescription");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setClassLabels:", v52);

        goto LABEL_113;
      }
      v55 = 0;
      v79 = 3;
      while (1)
      {
        if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
        {
          v56 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
          v56 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v56 + 21) == 100)
        {
          v57 = (uint64_t *)v56[9];
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          v57 = &CoreML::Specification::_StringVector_default_instance_;
        }
        if (v55 >= *((int *)v57 + 6))
          break;
        if (*((_DWORD *)p_m_spec->__ptr_ + 11) == 400)
        {
          v58 = (uint64_t *)*((_QWORD *)p_m_spec->__ptr_ + 4);
        }
        else
        {
          inited = (CoreML::Specification::protobuf_GLMClassifier_2eproto *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults(inited);
          v58 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v58 + 21) == 100)
        {
          v59 = (uint64_t *)v58[9];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          v59 = &CoreML::Specification::_StringVector_default_instance_;
        }
        v60 = *(uint64_t **)(v59[4] + 8 * v55 + 8);
        if (*((char *)v60 + 23) < 0)
          v60 = (uint64_t *)*v60;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)v81[18];
        +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v63);

        objc_msgSend(v80, "addObject:", v61);
        ++v55;
      }
    }
    v52 = v80;
    v9 = (MLGLMClassification *)v81;
    v81[19] = v79;
    v54 = v18;
    v8 = v75;
    goto LABEL_112;
  }
LABEL_113:

  return v9;
}

- (id)classify:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *__p[3];

  v6 = a3;
  v7 = -[NSMutableArray count](self->classLabels, "count");
  std::vector<double>::vector(__p, v7);
  if (-[MLGLMClassification calculateClassProbability:input:error:](self, "calculateClassProbability:input:error:", __p[0], v6, a4))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v16 = v6;
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)__p[0] + i), v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->classType == 1)
        {
          v11 = (void *)MEMORY[0x1E0CB37E8];
          -[NSMutableArray objectAtIndexedSubscript:](self->classLabels, "objectAtIndexedSubscript:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "int64Value"));
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->classLabels, "objectAtIndexedSubscript:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringValue");
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v13);

      }
      v6 = v16;
    }
    if (self->classType == 1)
      +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v8);
    else
      +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v14;
}

- (BOOL)calculateClassProbability:(double *)a3 input:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  vector<std::vector<double>, std::allocator<std::vector<double>>> *p_weights;
  void *v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  double v18;
  double v19;
  double v21;
  double v22;
  void *v23;
  void *v24;
  BOOL v25;
  unsigned int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int i;
  double v33;
  double v34;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  double *v39;
  double v40;
  uint64_t v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double *v48;
  long double v49;

  v8 = a4;
  -[MLModel modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputFeatureNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_14:
    v25 = 0;
    goto LABEL_32;
  }
  p_weights = &self->weights;
  if (objc_msgSend(v12, "count") != (uint64_t)(*((_QWORD *)self->weights.__begin_ + 1)
                                             - *(_QWORD *)self->weights.__begin_) >> 3)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (uint64_t)(*((_QWORD *)p_weights->__begin_ + 1) - *(_QWORD *)p_weights->__begin_) >> 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %@ expected length %@"), v23, v24);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  if (-[NSMutableArray count](self->classLabels, "count") == 2 || self->classEncoding)
  {
    v14 = v12;
    v15 = 0;
  }
  else
  {
    v14 = v12;
    *a3 = 0.0;
    v15 = 1;
  }
  if (self->weights.__end_ != p_weights->__begin_)
  {
    v16 = 0;
    v17 = 1;
    do
    {
      v18 = self->intercept.__begin_[v16];
      objc_msgSend(objc_retainAutorelease(v14), "bytes");
      cblas_ddot_NEWLAPACK();
      a3[v15 - 1 + v17] = v18 + v19;
      v16 = v17;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)self->weights.__end_ - (char *)self->weights.__begin_) >> 3) > v17++);
  }
  v12 = v14;
  if (-[NSMutableArray count](self->classLabels, "count") == 2)
  {
    v21 = *a3;
    if (self->postEvalTransForm)
    {
      v22 = (erf(v21 / 1.41421356) + 1.0) * 0.5;
    }
    else
    {
      v33 = exp(-fabs(v21));
      if (v21 >= 0.0)
        v34 = 1.0;
      else
        v34 = v33;
      v22 = v34 / (v33 + 1.0);
    }
    *a3 = 1.0 - v22;
    a3[1] = v22;
  }
  else if (self->classEncoding)
  {
    v26 = 0;
    v27 = 0.0;
    while (-[NSMutableArray count](self->classLabels, "count") > (unint64_t)v26)
    {
      v28 = a3[v26];
      v29 = exp(-fabs(v28));
      if (v28 >= 0.0)
        v30 = 1.0;
      else
        v30 = v29;
      v31 = v30 / (v29 + 1.0);
      a3[v26] = v31;
      v27 = v27 + v31;
      ++v26;
    }
    for (i = 0; -[NSMutableArray count](self->classLabels, "count") > (unint64_t)i; ++i)
      a3[i] = a3[i] / v27;
  }
  else
  {
    v36 = -[NSMutableArray count](self->classLabels, "count");
    if (v36)
    {
      v37 = 8 * v36;
      v38 = a3;
      if (v36 != 1)
      {
        v39 = a3 + 1;
        v40 = *a3;
        v41 = v37 - 8;
        v38 = a3;
        v42 = a3 + 1;
        do
        {
          v43 = *v42++;
          v44 = v43;
          if (v40 < v43)
          {
            v40 = v44;
            v38 = v39;
          }
          v39 = v42;
          v41 -= 8;
        }
        while (v41);
      }
      v45 = *v38;
      v46 = 0.0;
      v47 = 8 * v36;
      v48 = a3;
      do
      {
        v49 = exp(*v48 - v45);
        *v48++ = v49;
        v46 = v46 + v49;
        v47 -= 8;
      }
      while (v47);
      do
      {
        *a3 = *a3 / v46;
        ++a3;
        v37 -= 8;
      }
      while (v37);
    }
  }
  v25 = 1;
LABEL_32:

  return v25;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  unint64_t v14;
  void *v15;
  _QWORD aBlock[6];
  id v18[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v18, v10, 27, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MLGLMClassification_classify_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v14 = objc_msgSend(v9, "classifyTopK");
  if (v14 >= -[NSMutableArray count](self->classLabels, "count"))
    -[MLGLMClassification classify:error:](self, "classify:error:", v8, a5);
  else
    -[MLGLMClassification classify:topK:error:](self, "classify:topK:error:", v8, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v18);
  return v15;
}

- (id)classify:(id)a3 topK:(unint64_t)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  double v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  double v39;
  double v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  double *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t i;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v70;
  unint64_t v71;
  void *__p;
  uint64_t *v73;
  void *v74[3];

  v8 = a3;
  v9 = -[NSMutableArray count](self->classLabels, "count");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  v71 = v10;
  v11 = -[NSMutableArray count](self->classLabels, "count");
  std::vector<double>::vector(v74, v11);
  if (!-[MLGLMClassification calculateClassProbability:input:error:](self, "calculateClassProbability:input:error:", v74[0], v8, a5))
  {
    v51 = 0;
    goto LABEL_87;
  }
  std::vector<unsigned long>::vector(&__p, v11);
  v12 = (uint64_t *)__p;
  v13 = v73;
  if (__p != v73)
  {
    v14 = 0;
    v15 = (uint64_t *)__p;
    do
      *v15++ = v14++;
    while (v15 != v13);
  }
  if (v71 >= v11)
    goto LABEL_75;
  v16 = &v12[v71];
  if (v16 == v13)
    goto LABEL_74;
  while (1)
  {
    v17 = v13 - v12;
    if (v17 < 2)
      goto LABEL_74;
    if (v17 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v12, v12 + 1, v13 - 1, (uint64_t)v74[0]);
      goto LABEL_74;
    }
    if (v17 == 2)
    {
      v52 = *(v13 - 1);
      v53 = *v12;
      if (*((double *)v74[0] + v52) > *((double *)v74[0] + *v12))
      {
        *v12 = v52;
        *(v13 - 1) = v53;
      }
      goto LABEL_74;
    }
    if ((char *)v13 - (char *)v12 <= 63)
    {
      if (v13 - 1 == v12)
        goto LABEL_74;
      v54 = (double *)v74[0];
      while (1)
      {
        v55 = v13;
        if (v12 == v13)
          goto LABEL_71;
        v56 = v12 + 1;
        if (v12 + 1 != v13)
          break;
LABEL_73:
        if (++v12 == v13 - 1)
          goto LABEL_74;
      }
      v57 = *v12;
      v55 = v12;
      v58 = v12 + 1;
      do
      {
        v60 = *v58++;
        v59 = v60;
        if (v54[v60] > v54[v57])
        {
          v57 = v59;
          v55 = v56;
        }
        v56 = v58;
      }
      while (v58 != v13);
LABEL_71:
      if (v55 != v12)
      {
        v61 = *v12;
        *v12 = *v55;
        *v55 = v61;
      }
      goto LABEL_73;
    }
    v18 = &v12[v17 >> 1];
    v19 = v13 - 1;
    v20 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v12, v18, v13 - 1, (uint64_t)v74[0]);
    v21 = *v12;
    v22 = (double *)v74[0];
    v23 = *((double *)v74[0] + *v12);
    v24 = *((double *)v74[0] + *v18);
    if (v23 <= v24)
      break;
LABEL_19:
    v29 = v12 + 1;
    if (v12 + 1 >= v19)
    {
      v32 = v12 + 1;
    }
    else
    {
      v30 = v12 + 1;
      while (1)
      {
        v31 = v22[*v18];
        do
        {
          v32 = v30;
          v34 = *v30++;
          v33 = v34;
        }
        while (v22[v34] > v31);
        do
        {
          v36 = *--v19;
          v35 = v36;
        }
        while (v22[v36] <= v31);
        if (v32 >= v19)
          break;
        *v32 = v35;
        *v19 = v33;
        ++v20;
        if (v18 == v32)
          v18 = v19;
      }
    }
    if (v32 != v18)
    {
      v37 = *v32;
      if (v22[*v18] > v22[*v32])
      {
        *v32 = *v18;
        *v18 = v37;
        ++v20;
      }
    }
    if (v32 == v16)
      goto LABEL_74;
    if (!v20)
    {
      if (v32 <= v16)
      {
        v43 = v32 + 1;
        while (v43 != v13)
        {
          v44 = v22[*v43];
          v45 = v22[*(v43++ - 1)];
          if (v44 > v45)
            goto LABEL_34;
        }
      }
      else
      {
        while (v29 != v32)
        {
          v39 = v22[*v29];
          v40 = v22[*(v29++ - 1)];
          if (v39 > v40)
            goto LABEL_34;
        }
      }
      goto LABEL_74;
    }
LABEL_34:
    if (v32 <= v16)
    {
      v38 = v32 + 1;
    }
    else
    {
      v13 = v32;
      v38 = v12;
    }
LABEL_57:
    v12 = v38;
    if (v13 == v16)
      goto LABEL_74;
  }
  v25 = v13 - 2;
  while (v25 != v12)
  {
    v26 = v25;
    v28 = *v25--;
    v27 = v28;
    if (*((double *)v74[0] + v28) > v24)
    {
      *v12 = v27;
      *v26 = v21;
      ++v20;
      v19 = v26;
      goto LABEL_19;
    }
  }
  v41 = v12 + 1;
  if (v23 > *((double *)v74[0] + *v19))
  {
LABEL_50:
    if (v41 == v19)
      goto LABEL_74;
    while (1)
    {
      v46 = v22[*v12];
      do
      {
        v38 = v41;
        v48 = *v41++;
        v47 = v48;
      }
      while (v46 <= v22[v48]);
      do
      {
        v50 = *--v19;
        v49 = v50;
      }
      while (v46 > v22[v50]);
      if (v38 >= v19)
        break;
      *v38 = v49;
      *v19 = v47;
    }
    if (v38 > v16)
      goto LABEL_74;
    goto LABEL_57;
  }
  while (v41 != v19)
  {
    v42 = *v41;
    if (v23 > *((double *)v74[0] + *v41))
    {
      *v41++ = *v19;
      *v19 = v42;
      goto LABEL_50;
    }
    ++v41;
  }
LABEL_74:
  std::vector<unsigned long>::resize(&__p, v71);
LABEL_75:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v70 = v8;
    for (i = 0; i != v71; ++i)
    {
      v64 = *((_QWORD *)__p + i);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v74[0] + v64), v70);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->classType == 1)
      {
        v66 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableArray objectAtIndexedSubscript:](self->classLabels, "objectAtIndexedSubscript:", v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "numberWithLongLong:", objc_msgSend(v67, "int64Value"));
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->classLabels, "objectAtIndexedSubscript:", v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringValue");
      }
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v65, v68);

    }
    v8 = v70;
  }
  if (self->classType == 1)
    +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v62);
  else
    +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v62);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v73 = (uint64_t *)__p;
    operator delete(__p);
  }
LABEL_87:
  if (v74[0])
  {
    v74[1] = v74[0];
    operator delete(v74[0]);
  }

  return v51;
}

- (void).cxx_destruct
{
  double *begin;
  vector<std::vector<double>, std::allocator<std::vector<double>>> *p_weights;

  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->m_spec);
  objc_storeStrong((id *)&self->classLabels, 0);
  p_weights = &self->weights;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_weights);
  begin = self->intercept.__begin_;
  if (begin)
  {
    self->intercept.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

uint64_t __46__MLGLMClassification_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecification:configuration:error:", a3, v8, a5);

  return v9;
}

@end
