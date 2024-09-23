@implementation MLBayesianProbitRegression

- (void)saveModelToSpecification:(id *)a3
{
  uint64_t v5;
  void *v6;
  BayesianProbitRegression *ptr;
  std::__shared_weak_count *v8;
  CoreML::Specification::Model *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double v15;
  uint64_t v16;
  uint64_t *v17;
  google::protobuf::internal::RepeatedPtrFieldBase *v18;
  int v19;
  unsigned int v20;
  unint64_t v21;
  __n128 *v22;
  __n128 *v23;
  __n128 *v24;
  unsigned int v25;
  unint64_t *v26;
  __n128 *v27;
  CoreML::Specification::BayesianProbitRegressor_FeatureWeight *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t *v31;
  unsigned int v32;
  _DWORD *v33;
  uint64_t *v34;
  unint64_t v35;
  CoreML::Specification::BayesianProbitRegressor_FeatureValueWeight *v36;
  double *v37;
  double v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t *v41;
  unint64_t v42;
  CoreML::Specification::Model *v43;
  __int128 **v44;
  uint64_t v45;
  NSString *regressionInputFeatureName;
  NSString *optimismInputFeatureName;
  NSString *samplingScaleInputFeatureName;
  NSString *samplingTruncationInputFeatureName;
  NSString *meanOutputFeatureName;
  NSString *varianceOutputFeatureName;
  NSString *pessimisticProbabilityOutputFeatureName;
  NSString *sampledProbabilityOutputFeatureName;
  std::logic_error *exception;
  std::__shared_weak_count *v56;
  __n128 __p;
  uint64_t v58;

  v5 = operator new();
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::Model **)v5);
  -[MLModel modelDescription](self, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[MLModelDescriptionUtils saveModelDescription:toSpecification:error:](MLModelDescriptionUtils, "saveModelDescription:toSpecification:error:", v6, v5, a3);

  if ((a3 & 1) == 0)
    goto LABEL_48;
  ptr = self->_model.__ptr_;
  v9 = *(CoreML::Specification::Model **)v5;
  v8 = *(std::__shared_weak_count **)(v5 + 8);
  v56 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12 = operator new();
  CoreML::Specification::BayesianProbitRegressor::BayesianProbitRegressor((CoreML::Specification::BayesianProbitRegressor *)v12);
  if (*((_DWORD *)v9 + 11) == 304)
  {
    v13 = *((_QWORD *)v9 + 4);
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    *((_DWORD *)v9 + 11) = 0;
  }
  CoreML::Specification::Model::clear_Type((uint64_t)v9);
  *((_DWORD *)v9 + 11) = 304;
  *((_QWORD *)v9 + 4) = v12;
  *(_DWORD *)(v12 + 112) = *(_QWORD *)ptr;
  v14 = (double *)operator new();
  CoreML::Specification::BayesianProbitRegressor_Gaussian::BayesianProbitRegressor_Gaussian((CoreML::Specification::BayesianProbitRegressor_Gaussian *)v14);
  v15 = *((double *)ptr + 6);
  v14[2] = *((double *)ptr + 7) / v15;
  v14[3] = v15;
  v16 = *(_QWORD *)(v12 + 104);
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  *(_QWORD *)(v12 + 104) = v14;
  __p.n128_u64[1] = 0;
  v58 = 0;
  __p.n128_u64[0] = (unint64_t)&__p.n128_u64[1];
  v17 = (uint64_t *)*((_QWORD *)ptr + 3);
  if (v17)
  {
    v18 = (google::protobuf::internal::RepeatedPtrFieldBase *)(v12 + 16);
    do
    {
      v19 = *((_DWORD *)v17 + 4);
      v20 = *((_DWORD *)v17 + 5);
      v21 = __p.n128_u64[1];
      if (!__p.n128_u64[1])
        goto LABEL_23;
      v22 = (__n128 *)&__p.n128_i8[8];
      do
      {
        v23 = (__n128 *)v21;
        v24 = v22;
        v25 = *(_DWORD *)(v21 + 32);
        v26 = (unint64_t *)(v21 + 8);
        if (v25 >= v20)
        {
          v26 = (unint64_t *)v23;
          v22 = v23;
        }
        v21 = *v26;
      }
      while (v21);
      if (v22 != (__n128 *)&__p.n128_i8[8] && (v25 >= v20 ? (v27 = v23) : (v27 = v24), v27[2].n128_u32[0] <= v20))
      {
        if (v25 < v20)
          v23 = v24;
        v35 = v23[2].n128_u64[1];
      }
      else
      {
LABEL_23:
        v28 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::BayesianProbitRegressor_FeatureWeight>::TypeHandler>(v18);
        v29 = __p.n128_u64[1];
        v30 = &__p.n128_u64[1];
        v31 = &__p.n128_u64[1];
        if (__p.n128_u64[1])
        {
          do
          {
            while (1)
            {
              v31 = (unint64_t *)v29;
              v32 = *(_DWORD *)(v29 + 32);
              if (v32 <= v20)
                break;
              v29 = *v31;
              v30 = v31;
              if (!*v31)
                goto LABEL_30;
            }
            if (v32 >= v20)
            {
              exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::logic_error::logic_error(exception, "an error occurred when trying to create specification for BayesianProbitRegression");
              __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
            }
            v29 = v31[1];
          }
          while (v29);
          v30 = v31 + 1;
        }
LABEL_30:
        v33 = operator new(0x30uLL);
        v33[8] = v20;
        *((_QWORD *)v33 + 5) = v28;
        *(_QWORD *)v33 = 0;
        *((_QWORD *)v33 + 1) = 0;
        *((_QWORD *)v33 + 2) = v31;
        *v30 = (unint64_t)v33;
        v34 = (uint64_t *)v33;
        if (*(_QWORD *)__p.n128_u64[0])
        {
          __p.n128_u64[0] = *(_QWORD *)__p.n128_u64[0];
          v34 = (uint64_t *)*v30;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)__p.n128_u64[1], v34);
        ++v58;
        v35 = *((_QWORD *)v33 + 5);
        *(_DWORD *)(v35 + 40) = v20;
      }
      v36 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::BayesianProbitRegressor_FeatureValueWeight>::TypeHandler>((google::protobuf::internal::RepeatedPtrFieldBase *)(v35 + 16));
      *((_DWORD *)v36 + 6) = v19;
      v37 = (double *)operator new();
      CoreML::Specification::BayesianProbitRegressor_Gaussian::BayesianProbitRegressor_Gaussian((CoreML::Specification::BayesianProbitRegressor_Gaussian *)v37);
      v38 = *((double *)v17 + 3);
      v37[2] = *((double *)v17 + 4) / v38;
      v37[3] = v38;
      v39 = *((_QWORD *)v36 + 2);
      if (v39)
        (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
      *((_QWORD *)v36 + 2) = v37;
      v17 = (uint64_t *)*v17;
    }
    while (v17);
    v40 = (_QWORD *)__p.n128_u64[1];
    v8 = v56;
  }
  else
  {
    v40 = 0;
  }
  std::__tree<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::__map_value_compare<CoreML::TreeEnsembleBase::BranchMode,std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::less<CoreML::TreeEnsembleBase::BranchMode>,true>,std::allocator<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>>>::destroy(v40);
  if (v8)
  {
    v41 = (unint64_t *)&v8->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v43 = *(CoreML::Specification::Model **)v5;
  if (*(_DWORD *)(*(_QWORD *)v5 + 44) == 304)
  {
    v44 = (__int128 **)*((_QWORD *)v43 + 4);
    if (!v44)
    {
LABEL_48:
      v45 = std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](v5);
      MEMORY[0x1A1AD6260](v45, 0x20C40A4A59CD2);
      return 0;
    }
  }
  else
  {
    CoreML::Specification::Model::clear_Type(*(_QWORD *)v5);
    *((_DWORD *)v43 + 11) = 304;
    v44 = (__int128 **)operator new();
    CoreML::Specification::BayesianProbitRegressor::BayesianProbitRegressor((CoreML::Specification::BayesianProbitRegressor *)v44);
    *((_QWORD *)v43 + 4) = v44;
  }
  regressionInputFeatureName = self->_regressionInputFeatureName;
  if (regressionInputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](regressionInputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 5, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  optimismInputFeatureName = self->_optimismInputFeatureName;
  if (optimismInputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](optimismInputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 6, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  samplingScaleInputFeatureName = self->_samplingScaleInputFeatureName;
  if (samplingScaleInputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](samplingScaleInputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 7, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  samplingTruncationInputFeatureName = self->_samplingTruncationInputFeatureName;
  if (samplingTruncationInputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](samplingTruncationInputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 8, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  meanOutputFeatureName = self->_meanOutputFeatureName;
  if (meanOutputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](meanOutputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 9, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  varianceOutputFeatureName = self->_varianceOutputFeatureName;
  if (varianceOutputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](varianceOutputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 10, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  pessimisticProbabilityOutputFeatureName = self->_pessimisticProbabilityOutputFeatureName;
  if (pessimisticProbabilityOutputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](pessimisticProbabilityOutputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 11, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  sampledProbabilityOutputFeatureName = self->_sampledProbabilityOutputFeatureName;
  if (sampledProbabilityOutputFeatureName)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](sampledProbabilityOutputFeatureName, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena(v44 + 12, &__p);
    if (SHIBYTE(v58) < 0)
      operator delete((void *)__p.n128_u64[0]);
  }
  return (void *)v5;
}

- (BOOL)setInputFeatureName:(id *)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[MLBayesianProbitRegression setFeatureName:to:descriptions:](MLBayesianProbitRegression, "setFeatureName:to:descriptions:", a3, v6, v8);

  return (char)a3;
}

- (BOOL)setOutputFeatureName:(id *)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[MLBayesianProbitRegression setFeatureName:to:descriptions:](MLBayesianProbitRegression, "setFeatureName:to:descriptions:", a3, v6, v8);

  return (char)a3;
}

- (BOOL)setFeatureCount:(unint64_t)a3
{
  BayesianProbitRegression *ptr;
  unint64_t v4;

  ptr = self->_model.__ptr_;
  v4 = *(_QWORD *)ptr;
  if (*(_QWORD *)ptr < a3)
    *(_QWORD *)ptr = a3;
  return v4 <= a3;
}

- (unint64_t)FeatureCount
{
  return *(_QWORD *)self->_model.__ptr_;
}

- (MLBayesianProbitRegression)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  _QWORD *v9;
  CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  CoreML::Specification::Model *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t *v19;
  MLBayesianProbitRegression *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  double v41;
  double v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t **v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  id v58;
  __int128 v59;
  uint64_t ***v60;
  std::__shared_weak_count *v61;
  objc_super v62;

  v8 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 304)
  {
    v62.receiver = self;
    v62.super_class = (Class)MLBayesianProbitRegression;
    v9 = -[MLRegressor initDescriptionOnlyWithSpecification:configuration:error:](&v62, sel_initDescriptionOnlyWithSpecification_configuration_error_, a3, v8, a5);
    if (v9)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v60, *(const CoreML::Specification::Model **)a3);
      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML24BayesianProbitRegression24BayesianProbitRegressionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v59);
      v10 = (CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto *)std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)(v9 + 10), &v59);
      v11 = (std::__shared_weak_count *)*((_QWORD *)&v59 + 1);
      if (*((_QWORD *)&v59 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      v14 = v9[10];
      v15 = (CoreML::Specification::Model *)v60;
      v16 = v61;
      if (v61)
      {
        p_shared_owners = (unint64_t *)&v61->__shared_owners_;
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
      }
      v58 = v8;
      if (*((_DWORD *)v15 + 11) == 304)
      {
        v19 = (uint64_t *)*((_QWORD *)v15 + 4);
      }
      else
      {
        CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto::InitDefaults(v10);
        v19 = &CoreML::Specification::_BayesianProbitRegressor_default_instance_;
      }
      *(_QWORD *)v14 = *((unsigned int *)v19 + 28);
      v21 = v19[4];
      if (v21)
        v22 = (uint64_t *)(v21 + 8);
      else
        v22 = 0;
      v23 = *((int *)v19 + 6);
      if ((_DWORD)v23)
      {
        v24 = 0;
        v25 = 8 * v23;
        do
        {
          v26 = *v22++;
          v24 += *(int *)(v26 + 24);
          v25 -= 8;
        }
        while (v25);
        v27 = (float)v24;
      }
      else
      {
        v27 = 0.0;
      }
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>(v14 + 8, vcvtps_u32_f32(v27 / *(float *)(v14 + 40)));
      v29 = v19[4];
      if (v29)
        v30 = v29 + 8;
      else
        v30 = 0;
      v31 = *((int *)v19 + 6);
      if ((_DWORD)v31)
      {
        v32 = v30 + 8 * v31;
        do
        {
          v33 = *(_QWORD *)v30;
          v34 = *(_QWORD *)(*(_QWORD *)v30 + 32);
          if (v34)
            v35 = v34 + 8;
          else
            v35 = 0;
          v36 = *(int *)(v33 + 24);
          if ((_DWORD)v36)
          {
            v37 = (unint64_t)*(unsigned int *)(v33 + 40) << 32;
            v38 = 8 * v36;
            do
            {
              v39 = *(uint64_t **)(*(_QWORD *)v35 + 16);
              if (!v39)
                v39 = &CoreML::Specification::_BayesianProbitRegressor_Gaussian_default_instance_;
              CoreML::BayesianProbitRegression::BayesianProbitRegression::setWeight((CoreML::BayesianProbitRegression::BayesianProbitRegression *)v14, v37 | *(unsigned int *)(*(_QWORD *)v35 + 24), *((double *)v39 + 2), *((double *)v39 + 3));
              v35 += 8;
              v38 -= 8;
            }
            while (v38);
          }
          v30 += 8;
        }
        while (v30 != v32);
      }
      v40 = (uint64_t *)v19[13];
      if (!v40)
        v40 = &CoreML::Specification::_BayesianProbitRegressor_Gaussian_default_instance_;
      v41 = *((double *)v40 + 3);
      v42 = *((double *)v40 + 2) * v41;
      *(double *)(v14 + 48) = v41;
      *(double *)(v14 + 56) = v42;
      *(double *)(v14 + 80) = v42 / v41;
      v8 = v58;
      if (v16)
      {
        v43 = (unint64_t *)&v16->__shared_owners_;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      if (*((_DWORD *)v60 + 11) == 304)
      {
        v45 = v60[4];
      }
      else
      {
        CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto::InitDefaults(v28);
        v45 = (uint64_t **)&CoreML::Specification::_BayesianProbitRegressor_default_instance_;
      }
      getString(v45[5]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputFeatureName:to:", v9 + 12, v46);

      getString(v45[6]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputFeatureName:to:", v9 + 13, v47);

      getString(v45[7]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputFeatureName:to:", v9 + 18, v48);

      getString(v45[8]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputFeatureName:to:", v9 + 19, v49);

      getString(v45[9]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOutputFeatureName:to:", v9 + 14, v50);

      getString(v45[10]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOutputFeatureName:to:", v9 + 15, v51);

      getString(v45[11]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOutputFeatureName:to:", v9 + 16, v52);

      getString(v45[12]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOutputFeatureName:to:", v9 + 17, v53);

      v54 = v61;
      if (v61)
      {
        v55 = (unint64_t *)&v61->__shared_owners_;
        do
          v56 = __ldaxr(v55);
        while (__stlxr(v56 - 1, v55));
        if (!v56)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
    }
    self = v9;
    v20 = self;
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Interface type is not a Bayesian Online Probit Regressor"));
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5 regressionInputName:(id)a6 optimismInputName:(id)a7 samplingScaleInputName:(id)a8 samplingTruncationInputName:(id)a9 meanOutputName:(id)a10 varianceOutputName:(id)a11 pessimisticProbabilityOutputName:(id)a12 sampledProbabilityOutputName:(id)a13
{
  id v18;
  id v19;
  MLBayesianProbitRegression *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MLBayesianProbitRegression *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  CoreML::BayesianProbitRegression::BayesianProbitRegression *ptr;
  double v30;
  MLBayesianProbitRegression *v31;
  unint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  objc_super v40;

  v18 = a3;
  v19 = a5;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v20 = self;
  v35 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  if (+[MLBayesianProbitRegression validateModelDescription:](MLBayesianProbitRegression, "validateModelDescription:", v18))
  {
    v40.receiver = self;
    v40.super_class = (Class)MLBayesianProbitRegression;
    v25 = -[MLModel initWithDescription:](&v40, sel_initWithDescription_, v18);
    if (v25)
    {
      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML24BayesianProbitRegression24BayesianProbitRegressionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v39);
      std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)&v25->_model, &v39);
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
      if (*((_QWORD *)&v39 + 1))
      {
        v27 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      ptr = (CoreML::BayesianProbitRegression::BayesianProbitRegression *)v25->_model.__ptr_;
      objc_msgSend(v19, "doubleValue", a4);
      CoreML::BayesianProbitRegression::BayesianProbitRegression::initializeFeatures(ptr, v34, v30);
      -[MLBayesianProbitRegression setInputFeatureName:to:](v25, "setInputFeatureName:to:", &v25->_regressionInputFeatureName, v38);
      -[MLBayesianProbitRegression setInputFeatureName:to:](v25, "setInputFeatureName:to:", &v25->_optimismInputFeatureName, v37);
      -[MLBayesianProbitRegression setInputFeatureName:to:](v25, "setInputFeatureName:to:", &v25->_samplingScaleInputFeatureName, v36);
      -[MLBayesianProbitRegression setInputFeatureName:to:](v25, "setInputFeatureName:to:", &v25->_samplingTruncationInputFeatureName, v35);
      -[MLBayesianProbitRegression setOutputFeatureName:to:](v25, "setOutputFeatureName:to:", &v25->_meanOutputFeatureName, v21);
      -[MLBayesianProbitRegression setOutputFeatureName:to:](v25, "setOutputFeatureName:to:", &v25->_varianceOutputFeatureName, v22);
      -[MLBayesianProbitRegression setOutputFeatureName:to:](v25, "setOutputFeatureName:to:", &v25->_pessimisticProbabilityOutputFeatureName, v23);
      -[MLBayesianProbitRegression setOutputFeatureName:to:](v25, "setOutputFeatureName:to:", &v25->_sampledProbabilityOutputFeatureName, v24);
    }
    v20 = v25;
    v31 = v20;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5
{
  return -[MLBayesianProbitRegression initWithDescription:numberOfFeatures:priorMean:regressionInputName:optimismInputName:samplingScaleInputName:samplingTruncationInputName:meanOutputName:varianceOutputName:pessimisticProbabilityOutputName:sampledProbabilityOutputName:](self, "initWithDescription:numberOfFeatures:priorMean:regressionInputName:optimismInputName:samplingScaleInputName:samplingTruncationInputName:meanOutputName:varianceOutputName:pessimisticProbabilityOutputName:sampledProbabilityOutputName:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (id)getArrayFeatureValue:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "featureNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v4);
      objc_msgSend(v3, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "type") == 5)
        break;

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (shared_ptr<CoreML::BayesianProbitRegression::FeatureValues>)getOneHotFeatureValues:(id)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  FeatureValues *v33;
  __shared_weak_count *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  std::logic_error *exception;
  void *v40;
  void *v41;
  id v42;
  shared_ptr<CoreML::BayesianProbitRegression::FeatureValues> result;

  v7 = v4;
  v8 = a3;
  v42 = v8;
  if (self->_regressionInputFeatureName)
  {
    objc_msgSend(v8, "featureValueForName:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[MLBayesianProbitRegression getArrayFeatureValue:](self, "getArrayFeatureValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v12)
  {
    v9 = v10;
LABEL_8:
    if (objc_msgSend(v9, "type") == 5)
    {
      objc_msgSend(v9, "multiArrayValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "dataType") == 131104)
      {
        objc_msgSend(v9, "multiArrayValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16 == 1)
        {
          objc_msgSend(v9, "multiArrayValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "shape");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") == 1)
          {
            objc_msgSend(v9, "multiArrayValue");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "shape");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndex:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "intValue");
            v22 = *(_QWORD *)self->_model.__ptr_;

            if (v22 == v21)
            {
              objc_msgSend(v9, "multiArrayValue");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "shape");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "count");
              objc_msgSend(v9, "multiArrayValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "shape");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectAtIndex:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "intValue");
              objc_msgSend(v9, "multiArrayValue");
              v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v30 = objc_msgSend(v29, "bytes");
              v31 = operator new(0x30uLL);
              v31[1] = 0;
              v31[2] = 0;
              *v31 = &off_1E3D5BD80;
              v31[3] = v30;
              *((_DWORD *)v31 + 8) = v28;
              v31[5] = v24;
              if (v24 != 1)
              {
                exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
                std::logic_error::logic_error(exception, "sparse features not yet supported");
                exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
                __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
              }
              *v7 = v31 + 3;
              v7[1] = v31;

              goto LABEL_20;
            }
          }
          else
          {

          }
          objc_msgSend(v9, "multiArrayValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "shape");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndex:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "intValue");

          if (a4)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("incorrect number of features: expected %d but got %d"), *(_QWORD *)self->_model.__ptr_, v38);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      else
      {

      }
    }
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("require feature type of MLMultiArray with one of Int32 values"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      *a4 = v32;
    }
LABEL_19:
    *v7 = 0;
    v7[1] = 0;
LABEL_20:
    v10 = v9;
    goto LABEL_21;
  }
  if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("no features"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  *v7 = 0;
  v7[1] = 0;
LABEL_21:

  result.var1 = v34;
  result.var0 = v33;
  return result;
}

- (id)createRegressorResult:(Prediction *)a3
{
  MLMultiArray *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MLDictionaryFeatureProvider *v12;
  void *v13;

  v5 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", &unk_1E3DA2AF8, 65600, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiArray setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", v6, 0);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_meanOutputFeatureName)
  {
    +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", a3->var0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, self->_meanOutputFeatureName);

  }
  if (self->_varianceOutputFeatureName)
  {
    +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", a3->var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, self->_varianceOutputFeatureName);

  }
  if (self->_pessimisticProbabilityOutputFeatureName)
  {
    +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", a3->var3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, self->_pessimisticProbabilityOutputFeatureName);

  }
  if (self->_sampledProbabilityOutputFeatureName)
  {
    +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", a3->var4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, self->_sampledProbabilityOutputFeatureName);

  }
  v12 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v7);
  +[MLRegressorResult resultWithValue:additionalFeatures:](MLRegressorResult, "resultWithValue:additionalFeatures:", v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)getFeatureValue:(id)a3 forName:(id)a4 withType:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a3, "featureValueForName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0.0;
  if (v6 && objc_msgSend(v6, "type") == a5)
  {
    objc_msgSend(v7, "doubleValue");
    v8 = v9;
  }

  return v8;
}

- (double)getOptimism:(id)a3
{
  double result;

  -[MLBayesianProbitRegression getFeatureValue:forName:withType:](self, "getFeatureValue:forName:withType:", a3, self->_optimismInputFeatureName, 2);
  return result;
}

- (double)getSamplingScale:(id)a3
{
  double result;

  -[MLBayesianProbitRegression getFeatureValue:forName:withType:](self, "getFeatureValue:forName:withType:", a3, self->_samplingScaleInputFeatureName, 2);
  return result;
}

- (double)getSamplingTruncation:(id)a3
{
  double result;

  -[MLBayesianProbitRegression getFeatureValue:forName:withType:](self, "getFeatureValue:forName:withType:", a3, self->_samplingTruncationInputFeatureName, 2);
  return result;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BayesianProbitRegression *ptr;
  pthread_rwlock_t *v21;
  double *v22;
  double *v23;
  CoreML::BayesianProbitRegression::Gaussian *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  uint32_t v38;
  uint32_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CoreML::BayesianProbitRegression::Gaussian *v45;
  double v46;
  double v48;
  double v49;
  uint64_t v50;
  CoreML::BayesianProbitRegression::Gaussian *v51;
  uint64_t v52;
  void *v53;
  std::__shared_weak_count *v59;
  unint64_t *p_shared_owners;
  unint64_t v61;
  double v63;
  double v64;
  double v65;
  double v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  _QWORD aBlock[6];
  id v73[7];
  double v74;
  double __C;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;

  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v73, v10, 25, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLBayesianProbitRegression_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLBayesianProbitRegression getOneHotFeatureValues:error:](self, "getOneHotFeatureValues:error:", v8, a5);
  if (v70)
  {
    -[MLBayesianProbitRegression getOptimism:](self, "getOptimism:", v8);
    v15 = v14;
    -[MLBayesianProbitRegression getSamplingScale:](self, "getSamplingScale:", v8);
    v17 = v16;
    -[MLBayesianProbitRegression getSamplingTruncation:](self, "getSamplingTruncation:", v8);
    v19 = v18;
    v68 = 0u;
    v69 = 0u;
    v67 = 0u;
    ptr = self->_model.__ptr_;
    v21 = (pthread_rwlock_t *)((char *)ptr + 88);
    pthread_rwlock_rdlock((pthread_rwlock_t *)((char *)ptr + 88));
    if (*(_QWORD *)ptr == *(_DWORD *)(v70 + 8))
    {
      v79 = 0;
      v80 = 0;
      v81 = 0;
      v76 = 0;
      v77 = 0;
      v78 = 0;
      CoreML::BayesianProbitRegression::BayesianProbitRegression::GetGaussiansAndBias((uint64_t)ptr, v70, 0, (uint64_t)&v79, (uint64_t)&v76);
      __C = 0.0;
      v74 = 0.0;
      v22 = v79;
      vDSP_sveD(v79, 1, &__C, (v80 - (uint64_t)v79) >> 3);
      v23 = v76;
      vDSP_sveD(v76, 1, &v74, (v77 - (uint64_t)v76) >> 3);
      v25 = v74;
      v26 = sqrt(v74 + (double)*(_QWORD *)ptr);
      v27 = 1.0 / v26;
      if (v17 > 0.0 || (v28 = 0.5, v29 = v74, v19 > 0.0))
      {
        v64 = 1.0 / v26;
        v65 = v15;
        v30 = 0;
        if (v17 <= 0.0)
          v31 = 1.0;
        else
          v31 = v17;
        v63 = v74;
        v32 = __C;
        v33 = sqrt(v31 * v31 * v74);
        v34 = v19 > 0.0;
        v35 = __C + v33 * v19;
        if (v19 <= 0.0)
          v36 = -1.79769313e308;
        else
          v36 = __C - v33 * v19;
        if (v34)
          v37 = v35;
        else
          v37 = 1.79769313e308;
        v66 = v37;
        while (1)
        {
          do
          {
            v38 = arc4random();
            v39 = arc4random();
            v40 = ((double)v38 + (double)v38) / 4294967300.0 + -1.0;
            v41 = ((double)v39 + (double)v39) / 4294967300.0 + -1.0;
            v42 = v41 * v41;
            v43 = v42 + v40 * v40;
          }
          while (v43 == 0.0 || v43 > 1.0);
          v46 = v32 + v40 * sqrt(log(v42 + v40 * v40) * -2.0 / v43) * v33;
          if (v46 >= v36 && v46 <= v66)
            break;
          if (++v30 == 20)
          {
            v45 = (CoreML::BayesianProbitRegression::Gaussian *)arc4random();
            v46 = v36 + (double)v45 / 4294967300.0 * (v66 - v36);
            break;
          }
        }
        v27 = v64;
        CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v45, v64 * v46);
        v28 = v48;
        v29 = v74;
        v15 = v65;
        v25 = v63;
      }
      v49 = __C;
      CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v24, v27 * (__C + v15 * sqrt(v25)));
      *((_QWORD *)&v68 + 1) = v50;
      CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v51, v27 * v49);
      *(double *)&v67 = v49;
      *((double *)&v67 + 1) = v29;
      *(_QWORD *)&v68 = v52;
      *(double *)&v69 = v28;
      BYTE8(v69) = 1;
      if (v23)
        operator delete(v23);
      if (v22)
        operator delete(v22);
    }
    else
    {
      __asm { FMOV            V1.2D, #0.5 }
      v67 = xmmword_19CB39950;
      v68 = _Q1;
      *(_QWORD *)&v69 = 0x3FE0000000000000;
      BYTE8(v69) = 0;
    }
    pthread_rwlock_unlock(v21);
    -[MLBayesianProbitRegression createRegressorResult:](self, "createRegressorResult:", &v67);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = 0;
  }
  v59 = v71;
  if (v71)
  {
    p_shared_owners = (unint64_t *)&v71->__shared_owners_;
    do
      v61 = __ldaxr(p_shared_owners);
    while (__stlxr(v61 - 1, p_shared_owners));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v73);
  return v53;
}

- (BOOL)convertOutputFeatureToPredictionValues:(id)a3 event:(BOOL *)a4 importance:(double *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v8, "featureNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "type");
          if (v17 == 1)
          {
            *a4 = objc_msgSend(v16, "int64Value") != 0;
            ++v12;
          }
          else
          {
            if (v17 != 2)
            {
              if (a6)
              {
                +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("invalid prediction feature type"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_22;
            }
            objc_msgSend(v16, "doubleValue");
            *(_QWORD *)a5 = v18;
            ++v11;
          }
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }

    if (v12 == 1 && v11 < 2)
    {
      v19 = 1;
      goto LABEL_23;
    }
  }
  else
  {

  }
  if (a6)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("invalid prediction features"));
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v19 = 0;
  }
LABEL_23:

  return v19;
}

- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 options:(id)a5 error:(id *)a6
{
  return -[MLBayesianProbitRegression updateModelFromFeatures:toTarget:error:](self, "updateModelFromFeatures:toTarget:error:", a3, a4, a6);
}

- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 error:(id *)a5
{
  id v8;
  BayesianProbitRegression *ptr;
  uint64_t v10;
  int v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  double v16;
  double *v17;
  vDSP_Length v18;
  double *v19;
  CoreML::BayesianProbitRegression::Gaussian *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  double v44;
  unsigned __int8 v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  double v48;
  double __C;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  void *__p;
  _BYTE *v57;
  uint64_t v58;

  v8 = a4;
  -[MLBayesianProbitRegression getOneHotFeatureValues:error:](self, "getOneHotFeatureValues:error:", a3, a5);
  if (!v46)
    goto LABEL_28;
  v45 = 0;
  v44 = 1.0;
  if (!-[MLBayesianProbitRegression convertOutputFeatureToPredictionValues:event:importance:error:](self, "convertOutputFeatureToPredictionValues:event:importance:error:", v8, &v45, &v44, a5))goto LABEL_28;
  ptr = self->_model.__ptr_;
  v10 = v46;
  v11 = v45;
  v12 = v44;
  pthread_rwlock_wrlock((pthread_rwlock_t *)((char *)ptr + 88));
  v13 = *(unsigned int *)(v10 + 8);
  v14 = *(_QWORD *)ptr;
  if (*(_QWORD *)ptr == v13)
  {
    __p = 0;
    v57 = 0;
    v58 = 0;
    if (1.0 - v12 >= 0.5 && 1.0 - v12 <= 1.0)
      v16 = 1.0 - v12;
    else
      v16 = 1.0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 0;
    CoreML::BayesianProbitRegression::BayesianProbitRegression::GetGaussiansAndBias((uint64_t)ptr, v10, (uint64_t)&__p, (uint64_t)&v53, (uint64_t)&v50);
    v48 = 0.0;
    __C = 0.0;
    v17 = v53;
    v18 = (v54 - (uint64_t)v53) >> 3;
    vDSP_sveD(v53, 1, &__C, v18);
    v19 = v50;
    vDSP_sveD(v50, 1, &v48, (v51 - (uint64_t)v50) >> 3);
    v21 = v48 + (double)*(_QWORD *)ptr;
    v22 = sqrt(v21);
    v23 = 1.0 / v22;
    if (v11)
      v24 = 1.0;
    else
      v24 = -1.0;
    v25 = v24 * __C;
    v26 = v24 * __C * v23;
    CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v20, v26);
    v28 = -(v25 * v23);
    if (v27 >= 1.0e-300)
    {
      v30 = exp(v26 * v28 * 0.5) / 2.50662827 / v27;
      v29 = v16 * (v24 * v30) / v22;
    }
    else
    {
      v29 = v16 * (v24 * v28) / v22;
      v30 = v28;
    }
    if (v30 == v28)
      v31 = 1.0;
    else
      v31 = v30 * (v30 + v26);
    v32 = v16 * v31 / v21;
    v33 = __p;
    if (v57 != __p)
    {
      v34 = 0;
      do
      {
        CoreML::BayesianProbitRegression::BayesianProbitRegression::setWeight((CoreML::BayesianProbitRegression::BayesianProbitRegression *)ptr, v33[v34], v17[v34] + v19[v34] * v29, 1.0 / (v19[v34] * (1.0 - v19[v34] * v32)));
        ++v34;
        v33 = __p;
      }
      while (v34 < (v57 - (_BYTE *)__p) >> 3);
    }
    v35 = 8 * v18 - 8;
    v36 = *(double *)((char *)v19 + v35);
    v37 = *(double *)((char *)v17 + v35) + v36 * v29;
    v38 = 1.0 / (v36 * (1.0 - v36 * v32));
    *((double *)ptr + 6) = v38;
    *((double *)ptr + 7) = v37 * v38;
    operator delete(v19);
    operator delete(v17);
    if (__p)
    {
      v57 = __p;
      operator delete(__p);
    }
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)((char *)ptr + 88));
  if (v14 != v13)
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("updateModelFromFeatures failed"));
      v39 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_28:
    v39 = 0;
    goto LABEL_29;
  }
  v39 = 1;
LABEL_29:
  v40 = v47;
  if (v47)
  {
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      v42 = __ldaxr(p_shared_owners);
    while (__stlxr(v42 - 1, p_shared_owners));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  MLBayesianProbitRegression *v4;
  MLBayesianProbitRegression *v5;
  BOOL v6;

  v4 = (MLBayesianProbitRegression *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MLBayesianProbitRegression isEqualToBopr:](self, "isEqualToBopr:", v5);

  return v6;
}

- (shared_ptr<CoreML::BayesianProbitRegression::BayesianProbitRegression>)model
{
  BayesianProbitRegression **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<CoreML::BayesianProbitRegression::BayesianProbitRegression> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (BayesianProbitRegression *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BayesianProbitRegression *)self;
  return result;
}

- (BOOL)isEqualToBopr:(id)a3
{
  MLBayesianProbitRegression *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  double *v15;
  unint64_t v16;
  double *v17;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v4 = (MLBayesianProbitRegression *)a3;
  if (self == v4)
    goto LABEL_16;
  -[MLModel modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel modelDescription](v4, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_34;
  -[MLBayesianProbitRegression model](self, "model");
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
      if (v4)
        goto LABEL_8;
LABEL_14:
      v10 = 0;
      goto LABEL_15;
    }
  }
  if (!v4)
    goto LABEL_14;
LABEL_8:
  -[MLBayesianProbitRegression model](v4, "model");
  v10 = v20;
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
LABEL_15:
  if (!(v10 | v20))
  {
LABEL_16:
    v13 = 1;
    goto LABEL_35;
  }
  v13 = 0;
  if (v10 && v20)
  {
    v14 = *(double *)(v10 + 48) == *(double *)(v20 + 48) && *(double *)(v10 + 56) == *(double *)(v20 + 56);
    if (v14 && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v20 + 32))
    {
      v15 = (double *)(v10 + 24);
      do
      {
        v15 = *(double **)v15;
        v13 = v15 == 0;
        if (!v15)
          break;
        v16 = *((_QWORD *)v15 + 2);
        v17 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,CoreML::BayesianProbitRegression::SuperHasher,CoreML::BayesianProbitRegression::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,CoreML::BayesianProbitRegression::SuperHasher,CoreML::BayesianProbitRegression::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>>>::find<unsigned long long>((_QWORD *)(v20 + 8), v16);
        if (!v17 || v16 != *((_QWORD *)v17 + 2))
          goto LABEL_34;
        v13 = 0;
      }
      while (v15[3] == v17[3] && v15[4] == v17[4]);
      goto LABEL_35;
    }
LABEL_34:
    v13 = 0;
  }
LABEL_35:

  return v13;
}

- (void)reset
{
  CoreML::BayesianProbitRegression::BayesianProbitRegression::initializeFeatures((CoreML::BayesianProbitRegression::BayesianProbitRegression *)self->_model.__ptr_, *(_QWORD *)self->_model.__ptr_, *((double *)self->_model.__ptr_ + 10));
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_samplingTruncationInputFeatureName, 0);
  objc_storeStrong((id *)&self->_samplingScaleInputFeatureName, 0);
  objc_storeStrong((id *)&self->_sampledProbabilityOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_pessimisticProbabilityOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_varianceOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_meanOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_optimismInputFeatureName, 0);
  objc_storeStrong((id *)&self->_regressionInputFeatureName, 0);
  cntrl = self->_model.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

uint64_t __52__MLBayesianProbitRegression_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)modelWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  MLModelConfiguration *v6;
  void *v7;

  +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MLModelConfiguration);
    objc_msgSend(v5, "modelWithConfiguration:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecification:configuration:error:", a3, v8, a5);

  return v9;
}

+ (BOOL)setFeatureName:(id *)a3 to:(id)a4 descriptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8
    && (objc_msgSend(v9, "objectForKey:", v8), v11 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v11,
                                               !v11))
  {
    v12 = 0;
  }
  else
  {
    objc_storeStrong(a3, a4);
    v12 = 1;
  }

  return v12;
}

+ (BOOL)validateModelDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "outputDescriptionsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictedFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "type") == 2;
  else
    v7 = 0;

  return v7;
}

@end
