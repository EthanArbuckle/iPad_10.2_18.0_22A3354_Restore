@implementation MLLocalOutlierFactor

- (MLLocalOutlierFactor)initWithKNearestNeighborsModelAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MLModelDescription *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  vector<float, std::allocator<float>> *p_cachedKDistances;
  float *begin;
  MLNearestNeighborsIndex *v21;
  MLNearestNeighborsIndex *index;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MLParameterContainer *v29;
  MLParameterContainer *parameterContainer;
  MLParameterContainer *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  MLLocalOutlierFactor *v36;
  unint64_t numberOfNeighbors;
  void *v38;
  void *v40;
  MLModelDescription *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  __int128 v46;
  float *v47;
  objc_super v48;
  void *v49;
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v44 = v8;
  +[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameterValueForKey:error:", v11, a5);
    v12 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v12;
    if (!v12)
    {
      v36 = 0;
LABEL_25:

      goto LABEL_26;
    }
    +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", CFSTR("localOutlierFactorScore"), 2, 0, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MLModelDescription alloc];
    objc_msgSend(v10, "modelDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDescriptionsByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = CFSTR("localOutlierFactorScore");
    v51[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:metadata:](v13, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:metadata:", v15, v16, CFSTR("localOutlierFactorScore"), 0, 0);

    v17 = v9;
    if (!v9)
    {
      objc_msgSend(v10, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "copy");
    }
    v48.receiver = self;
    v48.super_class = (Class)MLLocalOutlierFactor;
    self = -[MLModel initWithDescription:configuration:](&v48, sel_initWithDescription_configuration_, v41, v17);
    if (!v9)
    {

    }
    if (!self)
      goto LABEL_16;
    self->_numberOfDimensions = objc_msgSend(v10, "numberOfDimensions");
    objc_msgSend(v10, "index");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -1082130432;
    std::vector<float>::vector(&v46, objc_msgSend(v18, "dataPointCount"), &v45);
    p_cachedKDistances = &self->_cachedKDistances;
    begin = self->_cachedKDistances.__begin_;
    if (begin)
    {
      self->_cachedKDistances.__end_ = begin;
      operator delete(begin);
      p_cachedKDistances->__begin_ = 0;
      self->_cachedKDistances.__end_ = 0;
      self->_cachedKDistances.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_cachedKDistances->__begin_ = v46;
    self->_cachedKDistances.__end_cap_.__value_ = v47;
    v46 = 0uLL;
    v47 = 0;

    objc_msgSend(v10, "index");
    v21 = (MLNearestNeighborsIndex *)objc_claimAutoreleasedReturnValue();
    index = self->_index;
    self->_index = v21;

    self->_numberOfNeighbors = objc_msgSend(v43, "unsignedIntegerValue");
    objc_msgSend(v9, "parameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Local Outlier Factor can not override numberOfNeighbors with value of class=%@."), objc_opt_class());
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      self->_numberOfNeighbors = objc_msgSend(v40, "unsignedIntegerValue");
    }
    +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "parameterDescriptionsByKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterContainer parameterContainerFor:descriptions:](MLParameterContainer, "parameterContainerFor:descriptions:", v26, v28);
    v29 = (MLParameterContainer *)objc_claimAutoreleasedReturnValue();
    parameterContainer = self->_parameterContainer;
    self->_parameterContainer = v29;

    v31 = self->_parameterContainer;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfNeighbors);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = -[MLParameterContainer setCurrentValue:forKey:error:](v31, "setCurrentValue:forKey:error:", v32, v33, a5);

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v10, "index");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "dataPointCount") > self->_numberOfNeighbors;

      if (v35)
      {

LABEL_16:
        v36 = self;
LABEL_24:

        goto LABEL_25;
      }
      if (a5)
      {
        numberOfNeighbors = self->_numberOfNeighbors;
        objc_msgSend(v10, "index");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Local Outlier Factor should have at least numberOfNeighbors(%lu) + 1 data points, but we got (%lu) data points."), numberOfNeighbors, objc_msgSend(v38, "dataPointCount"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
LABEL_23:

    v36 = 0;
    goto LABEL_24;
  }
  v36 = 0;
LABEL_26:

  return v36;
}

- (void)updateToValidDistance:(void *)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)a3;
  v4 = *((_QWORD *)a3 + 1);
  while (v3 != v4)
  {
    *(float *)(v3 + 8) = sqrtf(*(float *)(v3 + 8));
    v3 += 16;
  }
}

- (vector<std::pair<unsigned)findNearestNeighborsToQueryPoint:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(const void *)a4 pair<unsigned)long
{
  MLNearestNeighborsIndex *index;

  index = self->_index;
  if (index)
  {
    -[MLNearestNeighborsIndex findNearestNeighbors:toQueryPoint:](index, "findNearestNeighbors:toQueryPoint:", self->_numberOfNeighbors, a4);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  return (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)-[MLLocalOutlierFactor updateToValidDistance:](self, "updateToValidDistance:", retstr);
}

- (vector<std::pair<unsigned)findNearestNeighborsToIndex:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long
{
  MLNearestNeighborsIndex *index;

  index = self->_index;
  if (index)
  {
    -[MLNearestNeighborsIndex findNearestNeighbors:toIndex:](index, "findNearestNeighbors:toIndex:", self->_numberOfNeighbors, a4);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  return (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)-[MLLocalOutlierFactor updateToValidDistance:](self, "updateToValidDistance:", retstr);
}

- (float)kDistanceToIndex:(unint64_t)a3
{
  float v3;
  void *__p;
  uint64_t v8;

  v3 = self->_cachedKDistances.__begin_[a3];
  if (v3 < 0.0)
  {
    -[MLLocalOutlierFactor findNearestNeighborsToIndex:](self, "findNearestNeighborsToIndex:");
    v3 = *(float *)(v8 - 8);
    self->_cachedKDistances.__begin_[a3] = v3;
    if (__p)
      operator delete(__p);
  }
  return v3;
}

- (double)localReachabilityDensityOfNeighbors:(const void *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double v8;
  float v9;
  uint64_t v10;
  std::string *v12;
  __int128 v13;
  NSObject *v14;
  std::string *v15;
  std::logic_error *exception;
  std::string v17;
  std::string v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)a3;
  v4 = *((_QWORD *)a3 + 1);
  v6 = (v4 - *(_QWORD *)a3) >> 4;
  if (v6 != self->_numberOfNeighbors)
  {
    std::to_string(&v18, v6);
    v12 = std::string::insert(&v18, 0, "using wrong sized neighbors with size=");
    v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v18.__r_.__value_.__l.__data_);
    +[MLLogging coreChannel](MLLogging, "coreChannel", *(_OWORD *)&v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__r.__words[2]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = &v17;
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v15 = (std::string *)v17.__r_.__value_.__r.__words[0];
      LODWORD(v18.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v18.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v18, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v17);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
  }
  if (v5 == v4)
  {
    v8 = 2.22044605e-16;
    v10 = *((_QWORD *)a3 + 1);
  }
  else
  {
    v8 = 2.22044605e-16;
    do
    {
      -[MLLocalOutlierFactor kDistanceToIndex:](self, "kDistanceToIndex:", *(_QWORD *)v5);
      v8 = v8 + fmaxf(v9, *(float *)(v5 + 8));
      v5 += 16;
    }
    while (v5 != v4);
    v4 = *(_QWORD *)a3;
    v10 = *((_QWORD *)a3 + 1);
  }
  return (double)(unint64_t)((v10 - v4) >> 4) / v8;
}

- (double)localReachabilityDensityForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  void *__p[3];

  -[MLLocalOutlierFactor findNearestNeighborsToIndex:](self, "findNearestNeighborsToIndex:", a3);
  -[MLLocalOutlierFactor localReachabilityDensityOfNeighbors:](self, "localReachabilityDensityOfNeighbors:", __p);
  v5 = v4;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

- (double)localReachabilityDensityForQeuryPoint:(const void *)a3
{
  double v4;
  double v5;
  void *__p[3];

  -[MLLocalOutlierFactor findNearestNeighborsToQueryPoint:](self, "findNearestNeighborsToQueryPoint:", a3);
  -[MLLocalOutlierFactor localReachabilityDensityOfNeighbors:](self, "localReachabilityDensityOfNeighbors:", __p);
  v5 = v4;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

- (double)computeLOFForQueryPoint:(id)a3
{
  id v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  _DWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  char *v19;
  double v20;
  double v21;
  char *v22;
  double v23;
  double v24;
  char *__p;
  char *v27;
  void *v28;
  void *v29;
  unint64_t v30;

  v4 = a3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  while (v7 < objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;
    if ((unint64_t)v6 >= v5)
    {
      v12 = (char *)v28;
      v13 = (v6 - (_BYTE *)v28) >> 2;
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v5 - (_QWORD)v28) >> 1 > v14)
        v14 = (uint64_t)(v5 - (_QWORD)v28) >> 1;
      if (v5 - (unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
        v15 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v15 = v14;
      if (v15)
        v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v15);
      else
        v16 = 0;
      v17 = (_DWORD *)(v15 + 4 * v13);
      *v17 = v10;
      v11 = v17 + 1;
      while (v6 != v12)
      {
        v18 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *--v17 = v18;
      }
      v5 = v15 + 4 * v16;
      v28 = v17;
      v30 = v5;
      if (v12)
        operator delete(v12);
    }
    else
    {
      *(_DWORD *)v6 = v9;
      v11 = v6 + 4;
    }
    v29 = v11;

    ++v7;
    v6 = (char *)v11;
  }
  -[MLLocalOutlierFactor findNearestNeighborsToQueryPoint:](self, "findNearestNeighborsToQueryPoint:", &v28);
  v19 = __p;
  v20 = 0.0;
  if (__p == v27)
  {
    v22 = __p;
  }
  else
  {
    do
    {
      -[MLLocalOutlierFactor localReachabilityDensityForIndex:](self, "localReachabilityDensityForIndex:", *(_QWORD *)v19);
      v20 = v20 + v21;
      v19 += 16;
    }
    while (v19 != v27);
    v19 = __p;
    v22 = v27;
  }
  -[MLLocalOutlierFactor localReachabilityDensityForQeuryPoint:](self, "localReachabilityDensityForQeuryPoint:", &v28);
  v24 = v23;
  if (__p)
    operator delete(__p);
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }

  return v20 / (double)(unint64_t)((v22 - v19) >> 4) / v24;
}

- (id)inputMultiArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t numberOfDimensions;
  BOOL v19;
  id v20;
  void *v21;
  id v23;

  v6 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "featureValueForName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "multiArrayValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count") != 1)
      {

        goto LABEL_12;
      }
      objc_msgSend(v13, "shape");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v6;
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");
      numberOfDimensions = self->_numberOfDimensions;

      v19 = v17 == numberOfDimensions;
      v6 = v23;
      if (!v19)
      {
LABEL_12:
        if (a4)
        {
          objc_msgSend(v13, "shape");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Shape of input MLMultiArray is %@, expected [%lu]"), v21, self->_numberOfDimensions);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_14;
      }
      v20 = v13;
    }
    else
    {
      if (!a4)
      {
LABEL_14:
        v20 = 0;
        goto LABEL_15;
      }
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Invalid MLFeatureTypeMultiArray value for %@."), objc_opt_class());
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:

    goto LABEL_16;
  }
  if (a4)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Missing input name in model description for %@."), objc_opt_class());
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_16:

  return v20;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MLDictionaryFeatureProvider *v21;
  _QWORD aBlock[6];
  id v24[7];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v24, v10, 30, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLLocalOutlierFactor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLLocalOutlierFactor inputMultiArray:error:](self, "inputMultiArray:error:", v8, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MLLocalOutlierFactor computeLOFForQueryPoint:](self, "computeLOFForQueryPoint:", v14);
    v16 = v15;
    -[MLModel modelDescription](self, "modelDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predictedFeatureName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v20);
  }
  else
  {
    v21 = 0;
  }

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v24);

  return v21;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (!objc_msgSend(v6, "hasGlobalScope")
    || (-[MLParameterContainer currentParameterValues](self->_parameterContainer, "currentParameterValues"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("%@ does not have a parameter for requested key %@."), objc_opt_class(), v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  float *begin;

  objc_storeStrong((id *)&self->_parameterContainer, 0);
  begin = self->_cachedKDistances.__begin_;
  if (begin)
  {
    self->_cachedKDistances.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_index, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

uint64_t __61__MLLocalOutlierFactor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

@end
