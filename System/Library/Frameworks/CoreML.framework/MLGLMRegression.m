@implementation MLGLMRegression

- (MLGLMRegression)initWithLRSpec:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  char *v9;
  char *v10;
  CoreML::Specification::protobuf_GLMRegressor_2eproto *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t *v51;
  id v52;
  char *v53;
  uint64_t *v54;
  __int128 v55;
  unint64_t v56;
  objc_super v57;

  v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)MLGLMRegression;
  v9 = -[MLRegressor initDescriptionOnlyWithSpecification:configuration:error:](&v57, sel_initDescriptionOnlyWithSpecification_configuration_error_, a3, v8, a5);
  if (v9)
  {
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v55, *(const CoreML::Specification::Model **)a3);
    v10 = v9 + 136;
    v11 = (CoreML::Specification::protobuf_GLMRegressor_2eproto *)std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)(v9 + 136), &v55);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
    if (*((_QWORD *)&v55 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (*(_DWORD *)(*(_QWORD *)v10 + 44) == 300)
    {
      v15 = *(uint64_t **)(*(_QWORD *)v10 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_GLMRegressor_2eproto::InitDefaults(v11);
      v15 = &CoreML::Specification::_GLMRegressor_default_instance_;
    }
    v52 = v8;
    v53 = v9;
    v16 = v15[6];
    if (v16)
      v17 = (_QWORD *)(v16 + 8);
    else
      v17 = 0;
    if (v16)
      v18 = v16 + 8 + 8 * *((int *)v15 + 10);
    else
      v18 = 0;
    if (v17 != (_QWORD *)v18)
    {
      v19 = v9 + 80;
      v20 = (_QWORD *)*((_QWORD *)v9 + 11);
      do
      {
        v21 = *((_QWORD *)v19 + 2);
        if ((unint64_t)v20 >= v21)
        {
          v23 = *(_QWORD **)v19;
          v24 = ((uint64_t)v20 - *(_QWORD *)v19) >> 3;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v26 = v21 - (_QWORD)v23;
          if (v26 >> 2 > v25)
            v25 = v26 >> 2;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
            v27 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v27);
            v23 = *(_QWORD **)v19;
            v20 = (_QWORD *)*((_QWORD *)v19 + 1);
          }
          else
          {
            v28 = 0;
          }
          v29 = (_QWORD *)(v27 + 8 * v24);
          *v29 = *v17;
          v22 = v29 + 1;
          while (v20 != v23)
          {
            v30 = *--v20;
            *--v29 = v30;
          }
          *(_QWORD *)v19 = v29;
          *((_QWORD *)v19 + 1) = v22;
          *((_QWORD *)v19 + 2) = v27 + 8 * v28;
          if (v23)
            operator delete(v23);
        }
        else
        {
          *v20 = *v17;
          v22 = v20 + 1;
        }
        *((_QWORD *)v19 + 1) = v22;
        ++v17;
        v20 = v22;
      }
      while (v17 != (_QWORD *)v18);
    }
    v31 = v15[4];
    if (v31)
      v32 = (uint64_t *)(v31 + 8);
    else
      v32 = 0;
    v51 = v15;
    v33 = *((int *)v15 + 6);
    v9 = v53;
    if ((_DWORD)v33)
    {
      v54 = &v32[v33];
      do
      {
        v34 = *v32;
        v55 = 0uLL;
        v56 = 0;
        v35 = *(_QWORD *)(v34 + 24);
        if (v35)
          v36 = (_QWORD *)(v35 + 8);
        else
          v36 = 0;
        if (v35)
          v37 = v35 + 8 + 8 * *(int *)(v34 + 16);
        else
          v37 = 0;
        if (v36 == (_QWORD *)v37)
        {
          v38 = 0;
        }
        else
        {
          v38 = 0;
          v39 = 0;
          v40 = 0;
          do
          {
            if ((unint64_t)v40 >= v39)
            {
              v42 = (v40 - v38) >> 3;
              v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 61)
              {
                v56 = v39;
                *(_QWORD *)&v55 = v38;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v39 - (_QWORD)v38) >> 2 > v43)
                v43 = (uint64_t)(v39 - (_QWORD)v38) >> 2;
              if (v39 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
                v44 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v44 = v43;
              if (v44)
                v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v44);
              else
                v45 = 0;
              v46 = (char *)(v44 + 8 * v42);
              *(_QWORD *)v46 = *v36;
              v41 = v46 + 8;
              while (v40 != v38)
              {
                v47 = *((_QWORD *)v40 - 1);
                v40 -= 8;
                *((_QWORD *)v46 - 1) = v47;
                v46 -= 8;
              }
              v39 = v44 + 8 * v45;
              *((_QWORD *)&v55 + 1) = v41;
              if (v38)
                operator delete(v38);
              v38 = v46;
            }
            else
            {
              *(_QWORD *)v40 = *v36;
              v41 = v40 + 8;
            }
            *((_QWORD *)&v55 + 1) = v41;
            ++v36;
            v40 = v41;
          }
          while (v36 != (_QWORD *)v37);
          v56 = v39;
          *(_QWORD *)&v55 = v38;
          v9 = v53;
        }
        v48 = *((_QWORD *)v9 + 14);
        if (v48 >= *((_QWORD *)v9 + 15))
        {
          v49 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>((uint64_t *)v9 + 13, (uint64_t)&v55);
        }
        else
        {
          std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)(v9 + 104), (uint64_t)&v55);
          v49 = v48 + 24;
        }
        *((_QWORD *)v9 + 14) = v49;
        if (v38)
        {
          *((_QWORD *)&v55 + 1) = v38;
          operator delete(v38);
        }
        ++v32;
      }
      while (v32 != v54);
    }
    v8 = v52;
    *((_DWORD *)v9 + 32) = *((_DWORD *)v51 + 15);
  }

  return (MLGLMRegression *)v9;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  MLPredictionEvent *v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *begin;
  uint64_t v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  int postEvalTransForm;
  double v25;
  double v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  void *v34;
  _QWORD aBlock[6];
  id v36[8];

  v33 = a3;
  v8 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v9 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v36, v9, 23, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v8, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MLGLMRegression_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->intercept.__end_ - self->intercept.__begin_);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel modelDescription](self, "modelDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputFeatureNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v33, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  begin = self->weights.__begin_;
  if (v17 == (uint64_t)(begin[1] - *begin) >> 3)
  {
    if (self->weights.__end_ != begin)
    {
      v19 = 0;
      v20 = 1;
      do
      {
        v21 = self->intercept.__begin_[v19];
        objc_msgSend(objc_retainAutorelease(v16), "bytes");
        cblas_ddot_NEWLAPACK();
        v23 = v21 + v22;
        postEvalTransForm = self->postEvalTransForm;
        if (postEvalTransForm == 2)
        {
          v23 = (erf(v23 / 1.41421356) + 1.0) * 0.5;
        }
        else if (postEvalTransForm == 1)
        {
          v25 = exp(-fabs(v23));
          if (v23 >= 0.0)
            v26 = 1.0;
          else
            v26 = v25;
          v23 = v26 / (v25 + 1.0);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:atIndexedSubscript:", v27, v19);

        v19 = v20;
      }
      while (0xAAAAAAAAAAAAAAABLL * (((char *)self->weights.__end_ - (char *)self->weights.__begin_) >> 3) > v20++);
    }
    +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLRegressorResult resultWithValue:](MLRegressorResult, "resultWithValue:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a5)
    {
      v30 = 0;
      goto LABEL_16;
    }
    v31 = objc_msgSend(v16, "count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (uint64_t)(*((_QWORD *)self->weights.__begin_ + 1) - *(_QWORD *)self->weights.__begin_) >> 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %d expected length %@"), v31, v29);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  v12[2](v12);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v36);
  return v30;
}

- (void).cxx_destruct
{
  double *begin;
  vector<std::vector<double>, std::allocator<std::vector<double>>> *p_weights;

  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->m_spec);
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
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  return self;
}

uint64_t __41__MLGLMRegression_regress_options_error___block_invoke()
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
