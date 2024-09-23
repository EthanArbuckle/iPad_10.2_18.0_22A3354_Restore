@implementation MLKNearestNeighborsClassifier

- (MLKNearestNeighborsClassifier)initWithDescription:(id)a3 configuration:(id)a4 parameters:(id)a5 dataPoints:(void *)a6 labels:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  MLKNearestNeighborsClassifier *v16;
  void *v17;
  uint64_t v18;
  NSOrderedSet *labelsSet;
  uint64_t v20;
  NSObject *defaultLabel;
  void *v22;
  uint64_t v23;
  NSString *nearestLabelsFeatureName;
  uint64_t v25;
  NSString *nearestDistancesFeatureName;
  MLNearestNeighborsSingleKdTreeIndex *v27;
  MLNearestNeighborsIndex *index;
  MLNearestNeighborsLinearIndex *v29;
  uint64_t v30;
  MLNearestNeighborsIndex *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  MLParameterContainer *parameterContainer;
  MLParameterContainer *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MLKNearestNeighborsClassifier *v43;
  id v46;
  void *__p;
  void *v48;
  uint64_t v49;
  objc_super v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v46 = a4;
  v14 = a5;
  v15 = a7;
  v50.receiver = self;
  v50.super_class = (Class)MLKNearestNeighborsClassifier;
  v16 = -[MLModel initWithDescription:](&v50, sel_initWithDescription_, v13);
  if (!v16)
    goto LABEL_15;
  v16->_numberOfDimensions = objc_msgSend(v14, "numberOfDimensions");
  if (v15)
    v17 = v15;
  else
    v17 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&v16->_labelsForDataPoints, v17);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v16->_labelsForDataPoints);
  v18 = objc_claimAutoreleasedReturnValue();
  labelsSet = v16->_labelsSet;
  v16->_labelsSet = (NSOrderedSet *)v18;

  objc_msgSend(v14, "defaultLabel");
  v20 = objc_claimAutoreleasedReturnValue();
  defaultLabel = v16->_defaultLabel;
  v16->_defaultLabel = v20;

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v15, "firstObject");
  else
    objc_msgSend(v14, "defaultLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16->_labelType = (objc_opt_isKindOfClass() & 1) == 0;
  v16->_weightingScheme = objc_msgSend(v14, "weightingScheme");
  objc_msgSend(v14, "nearestLabelsFeatureName");
  v23 = objc_claimAutoreleasedReturnValue();
  nearestLabelsFeatureName = v16->_nearestLabelsFeatureName;
  v16->_nearestLabelsFeatureName = (NSString *)v23;

  objc_msgSend(v14, "nearestDistancesFeatureName");
  v25 = objc_claimAutoreleasedReturnValue();
  nearestDistancesFeatureName = v16->_nearestDistancesFeatureName;
  v16->_nearestDistancesFeatureName = (NSString *)v25;

  v16->_indexType = objc_msgSend(v14, "indexType");
  if (objc_msgSend(v14, "indexType"))
  {
    if (objc_msgSend(v14, "indexType") != 1)
    {
      if (a8)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Index type is invalid for this model."));
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_18;
    }
    v27 = -[MLNearestNeighborsSingleKdTreeIndex initWithDataset:numberOfDimensions:leafSize:error:]([MLNearestNeighborsSingleKdTreeIndex alloc], "initWithDataset:numberOfDimensions:leafSize:error:", a6, objc_msgSend(v14, "numberOfDimensions"), objc_msgSend(v14, "leafSize"), a8);
    index = v16->_index;
    v16->_index = (MLNearestNeighborsIndex *)v27;

  }
  else
  {
    v29 = [MLNearestNeighborsLinearIndex alloc];
    __p = 0;
    v48 = 0;
    v49 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)a6, *((_QWORD *)a6 + 1), (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 2);
    v30 = -[MLNearestNeighborsLinearIndex initWithDataset:numberOfDimensions:](v29, "initWithDataset:numberOfDimensions:", &__p, objc_msgSend(v14, "numberOfDimensions"));
    v31 = v16->_index;
    v16->_index = (MLNearestNeighborsIndex *)v30;

    if (__p)
    {
      v48 = __p;
      operator delete(__p);
    }
  }
  +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "parameterDescriptionsByKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterContainer parameterContainerFor:descriptions:](MLParameterContainer, "parameterContainerFor:descriptions:", v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();
  parameterContainer = v16->_parameterContainer;
  v16->_parameterContainer = (MLParameterContainer *)v35;

  v37 = v16->_parameterContainer;
  objc_msgSend(v46, "parameters");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = -[MLParameterContainer setCurrentValue:forKey:error:](v37, "setCurrentValue:forKey:error:", v40, v41, a8);

  if ((v37 & 1) == 0)
  {
LABEL_18:

    v43 = 0;
    goto LABEL_19;
  }
  -[MLModel modelDescription](v16, "modelDescription");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClassLabels:", v15);

LABEL_15:
  v43 = v16;
LABEL_19:

  return v43;
}

- (vector<std::pair<unsigned)computeKClosestLabels:(std:(float>>> *__return_ptr)retstr :(MLKNearestNeighborsClassifier *)self allocator<std:(SEL)a3 :(id)a4 pair<unsigned)long
{
  id v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  uint64_t i;
  void *v10;
  int v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *result;
  void *__p;
  void *v31;
  unint64_t v32;

  v4 = a4;
  __p = 0;
  v31 = 0;
  v32 = 0;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;
      if ((unint64_t)v8 >= v7)
      {
        v14 = (v8 - v6) >> 2;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v7 - (_QWORD)v6) >> 1 > v15)
          v15 = (uint64_t)(v7 - (_QWORD)v6) >> 1;
        if (v7 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
          v16 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v16 = v15;
        if (v16)
          v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v16);
        else
          v17 = 0;
        v18 = (_DWORD *)(v16 + 4 * v14);
        *v18 = v12;
        v13 = v18 + 1;
        while (v8 != v6)
        {
          v19 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *--v18 = v19;
        }
        v7 = v16 + 4 * v17;
        __p = v18;
        v32 = v7;
        if (v6)
          operator delete(v6);
        v6 = (char *)v18;
      }
      else
      {
        *(_DWORD *)v8 = v11;
        v13 = v8 + 4;
      }
      v31 = v13;

      v8 = (char *)v13;
    }
  }
  -[MLKNearestNeighborsClassifier parameterContainer](self, "parameterContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentParameterValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  -[MLKNearestNeighborsClassifier index](self, "index");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "findNearestNeighbors:toQueryPoint:", v24, &__p);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }

  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }

  return result;
}

- (void)computeClassProbabilities:(id *)a3 from:(void *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double *v21;
  uint64_t v22;
  double *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double *v35;
  double *v36;
  uint64_t v37;
  MLProbabilityDictionary *v38;
  void *v39;
  void *v40;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)a4;
  v6 = *((_QWORD *)a4 + 1);
  v8 = -[MLKNearestNeighborsClassifier weightingScheme](self, "weightingScheme");
  -[MLKNearestNeighborsClassifier labelsForDataPoints](self, "labelsForDataPoints");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v11 = 0.0;
  }
  else
  {
    v9 = 0;
    if ((unint64_t)((v6 - v7) >> 4) <= 1)
      v10 = 1;
    else
      v10 = (v6 - v7) >> 4;
    v11 = 0.0;
    do
    {
      v12 = *(_QWORD *)a4;
      v13 = 1.0;
      if (v8 == 1)
        v13 = 1.0 / (float)(*(float *)(v12 + v9 + 8) + 0.000001);
      objc_msgSend(v43, "objectAtIndexedSubscript:", *(_QWORD *)(v12 + v9));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v17 = v13;
      objc_msgSend(v15, "numberWithDouble:", v18 + v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v14);

      v11 = v11 + v17;
      v9 += 16;
      --v10;
    }
    while (v10);
  }
  -[MLKNearestNeighborsClassifier labelsSet](self, "labelsSet");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v22)
  {
    v23 = 0;
    v24 = 0;
    v25 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v20);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;

        v30 = v29 / v11;
        if ((unint64_t)v23 >= v24)
        {
          v31 = v23 - v21;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v24 - (_QWORD)v21) >> 2 > v32)
            v32 = (uint64_t)(v24 - (_QWORD)v21) >> 2;
          if (v24 - (unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
            v33 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v33 = v32;
          if (v33)
            v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v33);
          else
            v34 = 0;
          v35 = (double *)(v33 + 8 * v31);
          *v35 = v30;
          v36 = v35 + 1;
          while (v23 != v21)
          {
            v37 = *((_QWORD *)v23-- - 1);
            *((_QWORD *)v35-- - 1) = v37;
          }
          v24 = v33 + 8 * v34;
          if (v21)
            operator delete(v21);
          v21 = v35;
          v23 = v36;
        }
        else
        {
          *v23++ = v30;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v22);
  }

  v38 = [MLProbabilityDictionary alloc];
  -[MLKNearestNeighborsClassifier labelsSet](self, "labelsSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = -[MLProbabilityDictionary initWithLabels:probabilities:](v38, "initWithLabels:probabilities:", v40, v21);

  if (v21)
    operator delete(v21);

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
  id v14;
  id v15;

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
    if (objc_msgSend(v11, "type") == 5)
    {
      objc_msgSend(v11, "multiArrayValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && (v14 = objc_retainAutorelease(v12), objc_msgSend(v14, "bytes")))
      {
        v15 = v14;
      }
      else if (a4)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("K Nearest Neighbor models only accept multi array input types."));
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

    }
    else if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("K Nearest Neighbor models only accept multi array input types."));
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else if (a4)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Missing input name for K Nearest Neighbor model."));
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4 nearestLabels:(id)a5 nearestDistances:(id)a6 nearestFeatureIndices:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MLDictionaryFeatureProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v38 = v13;
  v39 = v12;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  if (-[MLKNearestNeighborsClassifier labelType](self, "labelType"))
    +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v42);
  else
    +[MLSequence sequenceWithStringArray:](MLSequence, "sequenceWithStringArray:", v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("_debugNearestLabels"));

  +[MLSequence sequenceFromArray:error:](MLSequence, "sequenceFromArray:error:", v41, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("_debugNearestDistances"));

  }
  +[MLSequence sequenceFromArray:error:](MLSequence, "sequenceFromArray:error:", v40, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("_debugNearestFeatureIndices"));

  }
  v21 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v14);
  +[MLClassifierResult resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:](MLClassifierResult, "resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:", v13, v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel modelDescription](self, "modelDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predictedFeatureName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MLModel modelDescription](self, "modelDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputDescriptionsByName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](self, "modelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "predictedFeatureName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  -[MLModel modelDescription](self, "modelDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predictedProbabilitiesName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MLModel modelDescription](self, "modelDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "outputDescriptionsByName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](self, "modelDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "predictedProbabilitiesName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v22, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v29, v31);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (void)extractNearestNeighborLabels:(id *)a3 distances:(id *)a4 indices:(id *)a5 from:(vector<std:()float> :(std:(float>>> *)a6 :allocator<std::pair<unsigned)long pair<unsigned)long
{
  void *v11;
  void *v12;
  void *v13;
  _BYTE *var1;
  _BYTE *var0;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id *v25;
  id *v26;
  id *v27;
  id v28;
  id v29;

  v11 = (void *)MEMORY[0x1E0C9AA60];
  v28 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = a3;
  v26 = a4;
  v27 = a5;
  var0 = a6->var0;
  var1 = a6->var1;
  -[MLKNearestNeighborsClassifier labelsForDataPoints](self, "labelsForDataPoints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (var1 != var0)
  {
    v17 = 0;
    if ((unint64_t)((var1 - var0) >> 4) <= 1)
      v18 = 1;
    else
      v18 = (var1 - var0) >> 4;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", *(_QWORD *)((char *)a6->var0 + v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v19);
      LODWORD(v20) = *(_DWORD *)((char *)a6->var0 + v17 + 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v21);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)((char *)a6->var0 + v17));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v22);

      v17 += 16;
      --v18;
    }
    while (v18);
  }
  v29 = objc_retainAutorelease(v28);
  *v25 = v29;
  v23 = objc_retainAutorelease(v12);
  *v26 = v23;
  v24 = objc_retainAutorelease(v13);
  *v27 = v24;

}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
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
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  __int128 *v22;
  __int128 *v23;
  int64_t v24;
  _OWORD *v25;
  uint64_t v26;
  __int128 v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _OWORD *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  uint64_t v47;
  void *__p[2];
  uint64_t v49;
  _QWORD aBlock[6];
  id v51[7];
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v8 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v9 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v51, v9, 2, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v8, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLKNearestNeighborsClassifier_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLKNearestNeighborsClassifier inputMultiArray:error:](self, "inputMultiArray:error:", v38, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v13, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
      LOBYTE(v18) = v18 == -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions");

      if ((v18 & 1) != 0)
      {
        -[MLKNearestNeighborsClassifier labelsForDataPoints](self, "labelsForDataPoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count") == 0;

        if (v20)
        {
          -[MLKNearestNeighborsClassifier defaultLabel](self, "defaultLabel");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (v33)
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Error predicting class due to missing data points and default label."));
              v30 = 0;
              v21 = 0;
              v28 = 0;
              v29 = 0;
              v31 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              a5 = 0;
            }
            else
            {
              v30 = 0;
              v21 = 0;
              v28 = 0;
              v29 = 0;
              v31 = 0;
            }
            goto LABEL_25;
          }
          -[MLKNearestNeighborsClassifier defaultLabel](self, "defaultLabel");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLKNearestNeighborsClassifier defaultLabel](self, "defaultLabel");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v34;
          v54 = &unk_1E3DA1D18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          -[MLKNearestNeighborsClassifier defaultLabel](self, "defaultLabel");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v28 = (id)objc_claimAutoreleasedReturnValue();

          v29 = &unk_1E3DA28B8;
          a5 = (id *)&unk_1E3DA28A0;
        }
        else
        {
          -[MLKNearestNeighborsClassifier computeKClosestLabels:](self, "computeKClosestLabels:", v13);
          *(_OWORD *)__p = v46;
          v49 = v47;
          v45 = 0;
          -[MLKNearestNeighborsClassifier computeClassProbabilities:from:](self, "computeClassProbabilities:from:", &v45, __p);
          v21 = v45;
          v43 = 0;
          v44 = 0;
          v41 = 0;
          v42 = 0;
          v39 = 0;
          v40 = 0;
          v22 = (__int128 *)__p[0];
          v23 = (__int128 *)__p[1];
          v24 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] != __p[0])
          {
            if (v24 < 0)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v25 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v24 >> 4);
            v39 = v25;
            v40 = v25;
            v41 = &v25[v26];
            do
            {
              v27 = *v22++;
              *v25++ = v27;
            }
            while (v22 != v23);
            v40 = v25;
          }
          -[MLKNearestNeighborsClassifier extractNearestNeighborLabels:distances:indices:from:](self, "extractNearestNeighborLabels:distances:indices:from:", &v44, &v43, &v42, &v39);
          v28 = v44;
          a5 = (id *)v43;
          v29 = v42;
          if (v39)
          {
            v40 = v39;
            operator delete(v39);
          }
          objc_msgSend(v21, "classLabelOfMaxProbability");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        -[MLKNearestNeighborsClassifier packageOutputWithPredictedLabel:classProbabilities:nearestLabels:nearestDistances:nearestFeatureIndices:](self, "packageOutputWithPredictedLabel:classProbabilities:nearestLabels:nearestDistances:nearestFeatureIndices:", v30, v21, v28, a5, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    if (!a5)
    {
      v31 = 0;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v13, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Shape of input MLMultiArray is %@, expected %@"), v30, v37);
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  if (a5)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Missing MLMultiArray for MLFeatureProvider"));
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
LABEL_28:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v51);

  return v31;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MLKNearestNeighborsClassifier setProgressHandlers:](self, "setProgressHandlers:", v7);
  -[MLKNearestNeighborsClassifier setProgressHandlersDispatchQueue:](self, "setProgressHandlersDispatchQueue:", v6);

}

- (void)updateModelWithData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  MLMultiArray *v23;
  uint64_t v24;
  void *v25;
  MLMultiArray *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  MLKNearestNeighborsClassifier *v48;
  id v49;
  id v50;
  void *__p;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDescriptionsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictedFeatureName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLKNearestNeighborsClassifier setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
  __p = 0;
  v52 = 0;
  v53 = 0;
  std::vector<float>::reserve(&__p, -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions") * objc_msgSend(v47, "count"));
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MLKNearestNeighborsClassifier labelsForDataPoints](self, "labelsForDataPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  v43 = (void *)objc_msgSend(v8, "initWithArray:copyItems:", v9, 1);

  v10 = 0;
  v11 = 0;
  while (v10 < objc_msgSend(v47, "count"))
  {
    objc_msgSend(v47, "featuresAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Received nil MLFeatureProvider for index %d from training data MLBatchProvider"), v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v41);
      goto LABEL_32;
    }
    v46 = v12;
    objc_msgSend(v12, "featureValueForName:", v45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Missing MLMultiArrayValue for feature named %@"), v45);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v42);
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") != 1)
    {

LABEL_12:
      objc_msgSend(v14, "shape");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Shape of training data point %d MLMultiArray is %@, expected %@"), v10, v31, v16);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
      v26 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
      -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      -[MLMultiArray dispatchTrainingCompletionHandlerWithError:onQueue:](v26, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v27);
      v33 = 1;
      goto LABEL_22;
    }
    objc_msgSend(v14, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");
    LOBYTE(v20) = v20 == -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions");

    if ((v20 & 1) == 0)
      goto LABEL_12;
    v21 = (v52 - (_BYTE *)__p) >> 2;
    std::vector<float>::resize((char **)&__p, v21 + -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions"));
    v22 = (char *)__p;
    v23 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLKNearestNeighborsClassifier numberOfDimensions](v48, "numberOfDimensions"));
    v24 = objc_claimAutoreleasedReturnValue();
    v54 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v23, "initWithDataPointer:shape:dataType:strides:deallocator:error:", &v22[4 * v21], v25, 65568, &unk_1E3DA28D0, 0, 0);

    v50 = 0;
    LOBYTE(v24) = objc_msgSend(v14, "copyIntoMultiArray:error:", v26, &v50);
    v27 = v50;
    if ((v24 & 1) == 0)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v27, CFSTR("Failed to convert training data to the right format"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v30);
LABEL_20:
      v33 = 1;
      goto LABEL_21;
    }
    objc_msgSend(v46, "featureValueForName:", v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Missing MLFeatureValue for feature named %@"), v44);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v34);
LABEL_19:

      goto LABEL_20;
    }
    if (objc_msgSend(v28, "type") == 3)
    {
      objc_msgSend(v29, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObject:", v30);
    }
    else
    {
      if (objc_msgSend(v29, "type") != 1)
      {
        +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Label type must be one of MLFeatureTypeString or MLFeatureTypeInt64"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v34);
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v29, "int64Value"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObject:", v30);
    }
    v33 = 0;
    v32 = v11;
LABEL_21:

LABEL_22:
    if (v33)
      goto LABEL_33;
    ++v10;
    v11 = v32;
  }
  -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dispatchTrainingBeginProgressHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v36);

  if (!-[MLKNearestNeighborsClassifier continueWithUpdate](v48, "continueWithUpdate"))
  {
LABEL_27:
    -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dispatchTrainingCompletionHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v41);
    v32 = v11;
    goto LABEL_32;
  }
  -[MLKNearestNeighborsClassifier setLabelsForDataPoints:](v48, "setLabelsForDataPoints:", v43);
  v37 = (void *)MEMORY[0x1E0C99E40];
  -[MLKNearestNeighborsClassifier labelsForDataPoints](v48, "labelsForDataPoints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "orderedSetWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLKNearestNeighborsClassifier setLabelsSet:](v48, "setLabelsSet:", v39);

  -[MLKNearestNeighborsClassifier index](v48, "index");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  LODWORD(v39) = objc_msgSend(v40, "updateWithData:error:", &__p, &v49);
  v46 = v49;

  if ((_DWORD)v39)
  {

    goto LABEL_27;
  }
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v46, CFSTR("Failed to update model with training data"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLKNearestNeighborsClassifier progressHandlers](v48, "progressHandlers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLKNearestNeighborsClassifier progressHandlersDispatchQueue](v48, "progressHandlersDispatchQueue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "dispatchTrainingCompletionHandlerWithError:onQueue:", v32, v42);
LABEL_31:

LABEL_32:
LABEL_33:

  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }

}

- (void)resumeUpdate
{
  -[MLKNearestNeighborsClassifier setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (void)cancelUpdate
{
  -[MLKNearestNeighborsClassifier setContinueWithUpdate:](self, "setContinueWithUpdate:", 0);
}

- (void)resumeUpdateWithParameters:(id)a3
{
  -[MLKNearestNeighborsClassifier setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  char v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  id v22;
  id v23;
  void *__p[2];
  char v25;
  _BYTE v26[16];
  std::__shared_weak_count *v27;
  char *v28;
  id v29;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "stringWithUTF8String:", objc_msgSend(v9, "fileSystemRepresentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v10, 0);
  v29 = 0;
  v11 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v29);
  v12 = v29;
  if ((v11 & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"));
    OArchive::OArchive((uint64_t)v26, (uint64_t)__p, 0);
    if (v25 < 0)
      operator delete(__p[0]);
    operator<<((uint64_t)v26, 404);
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v13)
    {
      +[MLArchivingUtils codedObjectURLFromOutputArchiver:](MLArchivingUtils, "codedObjectURLFromOutputArchiver:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      v16 = objc_msgSend(v13, "writeToURL:options:error:", v15, 1, &v22);
      v12 = v22;

      if (a4)
        v17 = v16;
      else
        v17 = 1;
      if ((v17 & 1) == 0)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v12, CFSTR("Failed save updated model to %@"), v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v14, CFSTR("Failed archive updated model"));
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v12 = v14;
    }

    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v28);
    v18 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v12, CFSTR("Failed to create directory at %@"), v10);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!objc_msgSend(v6, "hasGlobalScope"))
    goto LABEL_3;
  -[MLKNearestNeighborsClassifier parameterContainer](self, "parameterContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentParameterValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Nearest Neighbor Classifier Model does not have a parameter for requested key %@."), v6);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("kDescription"));

  -[MLKNearestNeighborsClassifier labelsForDataPoints](self, "labelsForDataPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("kLabelsForDataPoints"));

  -[MLKNearestNeighborsClassifier defaultLabel](self, "defaultLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("kDefaultLabel"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier labelType](self, "labelType"), CFSTR("kLabelType"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier weightingScheme](self, "weightingScheme"), CFSTR("kWeightingScheme"));
  -[MLKNearestNeighborsClassifier nearestLabelsFeatureName](self, "nearestLabelsFeatureName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("kNearestLabelsFeatureName"));

  -[MLKNearestNeighborsClassifier nearestDistancesFeatureName](self, "nearestDistancesFeatureName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("kNearestDistancesFeatureName"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier numberOfDimensions](self, "numberOfDimensions"), CFSTR("kNumDimensions"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[MLKNearestNeighborsClassifier indexType](self, "indexType"), CFSTR("kIndexType"));
  -[MLKNearestNeighborsClassifier index](self, "index");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("kIndex"));

  -[MLKNearestNeighborsClassifier parameterContainer](self, "parameterContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("kParameterContainer"));

}

- (MLKNearestNeighborsClassifier)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MLKNearestNeighborsClassifier *v9;
  MLKNearestNeighborsClassifier *v10;
  uint64_t v11;
  id v12;
  _QWORD *p_labelsForDataPoints;
  void *v14;
  uint64_t v15;
  NSOrderedSet *labelsSet;
  uint64_t v17;
  id v18;
  NSObject *defaultLabel;
  uint64_t v20;
  NSString *nearestLabelsFeatureName;
  uint64_t v22;
  NSString *nearestDistancesFeatureName;
  uint64_t v24;
  uint64_t v25;
  id v26;
  MLNearestNeighborsIndex *index;
  uint64_t v28;
  MLParameterContainer *parameterContainer;
  MLKNearestNeighborsClassifier *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  _QWORD v37[16];

  v37[14] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  v37[4] = objc_opt_class();
  v37[5] = objc_opt_class();
  v37[6] = objc_opt_class();
  v37[7] = objc_opt_class();
  v37[8] = objc_opt_class();
  v37[9] = objc_opt_class();
  v37[10] = objc_opt_class();
  v37[11] = objc_opt_class();
  v37[12] = objc_opt_class();
  v37[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)MLKNearestNeighborsClassifier;
  v9 = -[MLModel initWithDescription:](&v36, sel_initWithDescription_, v8);
  v10 = v9;
  if (v9)
  {
    v9->_numberOfDimensions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNumDimensions"));
    v35 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("kLabelsForDataPoints"), &v35);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v35;
    p_labelsForDataPoints = &v9->_labelsForDataPoints;
    v14 = (void *)*p_labelsForDataPoints;
    *p_labelsForDataPoints = v11;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", *p_labelsForDataPoints);
    v15 = objc_claimAutoreleasedReturnValue();
    labelsSet = v10->_labelsSet;
    v10->_labelsSet = (NSOrderedSet *)v15;

    v34 = v12;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("kDefaultLabel"), &v34);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v34;

    defaultLabel = v10->_defaultLabel;
    v10->_defaultLabel = v17;

    v10->_labelType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kLabelType"));
    v10->_weightingScheme = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kWeightingScheme"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNearestLabelsFeatureName"));
    v20 = objc_claimAutoreleasedReturnValue();
    nearestLabelsFeatureName = v10->_nearestLabelsFeatureName;
    v10->_nearestLabelsFeatureName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNearestDistancesFeatureName"));
    v22 = objc_claimAutoreleasedReturnValue();
    nearestDistancesFeatureName = v10->_nearestDistancesFeatureName;
    v10->_nearestDistancesFeatureName = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kIndexType"));
    v10->_indexType = v24;
    if (v24 == 1)
    {
      v32 = v18;
      objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("kIndex"), &v32);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v32;

    }
    else
    {
      if (v24)
      {
        v26 = v18;
        goto LABEL_9;
      }
      v33 = v18;
      objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("kIndex"), &v33);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v33;

    }
    index = v10->_index;
    v10->_index = (MLNearestNeighborsIndex *)v25;

LABEL_9:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kParameterContainer"));
    v28 = objc_claimAutoreleasedReturnValue();
    parameterContainer = v10->_parameterContainer;
    v10->_parameterContainer = (MLParameterContainer *)v28;

    goto LABEL_10;
  }
  v26 = 0;
LABEL_10:
  v30 = v10;

  return v30;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (void)setProgressHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlers, a3);
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return self->_progressHandlersDispatchQueue;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, a3);
}

- (NSDictionary)updateParameters
{
  return self->_updateParameters;
}

- (void)setUpdateParameters:(id)a3
{
  objc_storeStrong((id *)&self->_updateParameters, a3);
}

- (BOOL)continueWithUpdate
{
  return self->_continueWithUpdate;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  self->_continueWithUpdate = a3;
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (void)setParameterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parameterContainer, a3);
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (void)setNumberOfDimensions:(unint64_t)a3
{
  self->_numberOfDimensions = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (MLNearestNeighborsIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setLabelType:(int64_t)a3
{
  self->_labelType = a3;
}

- (NSArray)labelsForDataPoints
{
  return self->_labelsForDataPoints;
}

- (void)setLabelsForDataPoints:(id)a3
{
  objc_storeStrong((id *)&self->_labelsForDataPoints, a3);
}

- (NSOrderedSet)labelsSet
{
  return self->_labelsSet;
}

- (void)setLabelsSet:(id)a3
{
  objc_storeStrong((id *)&self->_labelsSet, a3);
}

- (NSObject)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setDefaultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLabel, a3);
}

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (NSString)nearestLabelsFeatureName
{
  return self->_nearestLabelsFeatureName;
}

- (void)setNearestLabelsFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_nearestLabelsFeatureName, a3);
}

- (NSString)nearestDistancesFeatureName
{
  return self->_nearestDistancesFeatureName;
}

- (void)setNearestDistancesFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_nearestDistancesFeatureName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestDistancesFeatureName, 0);
  objc_storeStrong((id *)&self->_nearestLabelsFeatureName, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_labelsSet, 0);
  objc_storeStrong((id *)&self->_labelsForDataPoints, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

uint64_t __70__MLKNearestNeighborsClassifier_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  MLKNearestNeighborsClassifierParameters *v11;
  std::string::size_type v12;
  char *v13;
  id v14;
  std::string::size_type v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  std::string *v19;
  const __CFString *v20;
  MLKNearestNeighborsClassifier *v21;
  int hasNestedArchive;
  int v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34[2];
  char v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[5];
  int v39;
  int v40;
  int v41;
  void *v42;
  _BYTE *v43;
  uint64_t v44;
  int v45;
  void *__p;
  char v47;
  uint64_t v48;
  uint64_t v49;
  std::string *v50;
  int v51[4];
  uint64_t v52;
  uint64_t v53;
  int v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  std::string v58;
  _QWORD v59[2];
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = -[MLModelDescription initFromSingleFunctionCompiledModelArchive:error:]([MLModelDescription alloc], "initFromSingleFunctionCompiledModelArchive:error:", a3, a7);
  v11 = objc_alloc_init(MLKNearestNeighborsClassifierParameters);
  v45 = 0;
  operator>>((uint64_t)a3);
  -[MLKNearestNeighborsClassifierParameters setNumberOfDimensions:](v11, "setNumberOfDimensions:", 0);
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v58.__r_.__value_.__r.__words[0] = 0;
  operator>>((uint64_t)a3);
  std::vector<float>::resize((char **)&v42, 0);
  if (v58.__r_.__value_.__r.__words[0])
  {
    v12 = 0;
    v13 = (char *)v42;
    do
    {
      operator>>((uint64_t)a3);
      ++v12;
      v13 += 4;
    }
    while (v12 < v58.__r_.__value_.__r.__words[0]);
  }
  v48 = 0;
  operator>>((uint64_t)a3);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((_DWORD)v48 == 100)
  {
    v38[0] = 0;
    operator>>((uint64_t)a3);
LABEL_11:
    v17 = (unint64_t)v14;
    goto LABEL_13;
  }
  if ((_DWORD)v48 == 101)
  {
    v58.__r_.__value_.__r.__words[0] = 0;
    operator>>((uint64_t)a3);
    if (v58.__r_.__value_.__r.__words[0])
    {
      v15 = 0;
      do
      {
        v38[0] = 0;
        operator>>((uint64_t)a3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

        ++v15;
      }
      while (v15 < v58.__r_.__value_.__r.__words[0]);
    }
    goto LABEL_11;
  }
  v17 = 0;
LABEL_13:

  v48 = 0;
  operator>>((uint64_t)a3);
  if (v48 == 110)
  {
    memset(&v58, 0, sizeof(v58));
    operator>>((uint64_t)a3, &v58);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = &v58;
    else
      v19 = (std::string *)v58.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
    v18 = objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
  }
  else if (v48 == 111)
  {
    v58.__r_.__value_.__r.__words[0] = 0;
    operator>>((uint64_t)a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v58.__r_.__value_.__r.__words[0]);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[MLKNearestNeighborsClassifierParameters setDefaultLabel:](v11, "setDefaultLabel:", v18);
  -[MLKNearestNeighborsClassifierParameters setNearestLabelsFeatureName:](v11, "setNearestLabelsFeatureName:", 0);
  -[MLKNearestNeighborsClassifierParameters setNearestDistancesFeatureName:](v11, "setNearestDistancesFeatureName:", 0);
  v41 = 0;
  operator>>((uint64_t)a3);
  -[MLKNearestNeighborsClassifierParameters setWeightingScheme:](v11, "setWeightingScheme:", 0);
  v39 = 0;
  v40 = 0;
  operator>>((uint64_t)a3);
  -[MLKNearestNeighborsClassifierParameters setIndexType:](v11, "setIndexType:", 0);
  if (!(v17 | v18))
  {
    if (a7)
    {
      v20 = CFSTR("Unable to load class labels for k-Nearest-Neighbor model.");
LABEL_28:
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v20);
      v21 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (((v43 - (_BYTE *)v42) >> 2) % (unint64_t)v45)
  {
    if (a7)
    {
      v20 = CFSTR("Invalid k-nearest neighbor model -- the length of the data vector is not a multiple of the given dimensionality.");
      goto LABEL_28;
    }
    goto LABEL_51;
  }
  std::string::basic_string[abi:ne180100]<0>(&v58, "modelParameters");
  hasNestedArchive = IArchive::hasNestedArchive(a3, &v58);
  v23 = hasNestedArchive;
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v58.__r_.__value_.__l.__data_);
    if (!v23)
      goto LABEL_52;
  }
  else if (!hasNestedArchive)
  {
    goto LABEL_52;
  }
  CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)v38);
  std::string::basic_string[abi:ne180100]<0>(v34, "numberOfNeighbors");
  std::string::basic_string[abi:ne180100]<0>(&v58, "modelParameters");
  v24 = IArchive::nestedArchive(a3, (uint64_t)&v58);
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v58.__r_.__value_.__l.__data_);
  v25 = IArchive::nestedArchive(v24, (uint64_t)v34);
  v26 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v25 + 32) + 16))(*(_QWORD *)(*(_QWORD *)v25 + 32));
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E3D598A0;
  v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_1E3D59870;
  v58.__r_.__value_.__r.__words[2] = v26;
  v59[0] = &off_1E3D59950;
  v59[1] = &v58.__r_.__value_.__l.__size_;
  v60 = 0;
  v61 = 0;
  v62 = 0;
  v64 = 0;
  v63 = 0x2000;
  v48 = 0;
  v49 = 0;
  v50 = &v58;
  *(_QWORD *)v51 = 0;
  *(_QWORD *)((char *)&v51[1] + 2) = 0;
  v52 = 0x7FFFFFFFLL;
  v53 = 0x647FFFFFFFLL;
  v54 = 100;
  v55 = 1;
  v56 = 0;
  v57 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v48);
  LODWORD(v53) = 0x7FFFFFFF;
  v27 = v49 + SHIDWORD(v52);
  v49 = v27;
  v28 = v51[0] - v52;
  if (v51[0] <= (int)v52)
    v28 = 0;
  else
    v49 = v27 - v28;
  HIDWORD(v52) = v28;
  if ((google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v38, (google::protobuf::io::CodedInputStream *)&v48) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)v36);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v36[0] = 5;
    std::operator+<char>();
    if (v47 < 0)
      operator delete(__p);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v48);
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v59);
  if (v35 < 0)
    operator delete(v34[0]);
  v29 = v36[0] & 0xFFFFFFEF;
  if ((v36[0] & 0xFFFFFFEF) != 0)
  {
    if (a7)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to unarchive model parameters."));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[MLParameterKey numberOfNeighbors](MLParameterKey, "numberOfNeighbors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v30, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v65[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterUtils appendParameterDescriptions:toModelDescription:](MLParameterUtils, "appendParameterDescriptions:toModelDescription:", v32, v10);

  }
  if (v37 < 0)
    operator delete((void *)v36[1]);
  CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)v38);
  if (v29)
  {
LABEL_51:
    v21 = 0;
    goto LABEL_53;
  }
LABEL_52:
  v21 = -[MLKNearestNeighborsClassifier initWithDescription:configuration:parameters:dataPoints:labels:error:]([MLKNearestNeighborsClassifier alloc], "initWithDescription:configuration:parameters:dataPoints:labels:error:", v10, v9, v11, &v42, v17, a7);
LABEL_53:

  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }

  return v21;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  char *v6;
  CoreML::Specification::protobuf_NearestNeighbors_2eproto *v8;
  uint64_t *v9;
  uint64_t v11;
  CoreML::Specification::NearestNeighborsIndex *v12;
  CoreML::Specification::Int64Parameter *v13;
  int v14;
  CoreML::Specification::StringVector *v15;
  CoreML::Specification::protobuf_DataStructures_2eproto *v16;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *v17;
  CoreML::Specification::Int64Vector *v18;
  CoreML::Specification::protobuf_DataStructures_2eproto *v19;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *v20;
  int v21;
  uint64_t v22;
  std::string *v23;
  int v24;
  uint64_t *v25;
  CoreML::Specification::protobuf_NearestNeighbors_2eproto *v26;
  uint64_t *v27;
  CoreML::Specification::protobuf_NearestNeighbors_2eproto *v28;
  uint64_t v29;
  const CoreML::Specification::NearestNeighborsIndex *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const void *v37;
  unint64_t v38;
  void (**v39)(google::protobuf::io::OstreamOutputStream *__hidden);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (**v51)(google::protobuf::io::OstreamOutputStream *__hidden);
  int64_t v52;
  char *v53;
  char *v54;
  char *v55;
  int v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  int v62;
  uint64_t v63;
  size_t v64;
  uint64_t v65;
  uint64_t v66;
  CoreML::Specification::Int64Vector *v67;
  uint64_t v68;
  CoreML::Specification::Int64Vector *v69;
  uint64_t v70;
  int v71;
  CoreML::Specification::protobuf_NearestNeighbors_2eproto *v72;
  uint64_t *v73;
  int v74;
  char *v75;
  std::__shared_weak_count *v76;
  unint64_t *p_shared_owners;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  char *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  google::protobuf::MessageLite *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  void *v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  void *v94;
  char *v96;
  char *__p;
  void *v98[2];
  char v99;
  _QWORD v100[3];
  char v101;
  void *v102[2];
  std::__shared_weak_count *v103;
  char *v104[3];
  _BYTE v105[24];
  int v106;
  uint64_t v107;
  int v108;
  uint64_t *v109;
  int v110;
  void (**v111)(CoreML::Specification::KNearestNeighborsClassifier *__hidden);
  uint64_t v112;
  CoreML::Specification::NearestNeighborsIndex *v113;
  google::protobuf::MessageLite *v114;
  CoreML::Specification::Int64Vector *v115;
  std::string *v116;
  uint64_t *v117;
  int v118;
  int v119;
  unsigned int v120;
  int v121;
  void *v122;
  char v123;
  void (**v124)(google::protobuf::io::OstreamOutputStream *__hidden);
  void (**v125)(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *__hidden);
  std::__shared_weak_count *v126;
  void (**v127)(google::protobuf::io::CopyingOutputStreamAdaptor *__hidden);
  char *v128;
  __int16 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v6 = (char *)a4;
  v8 = (CoreML::Specification::protobuf_NearestNeighbors_2eproto *)+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:archive:error:](MLModelIOUtils, "serializeMetadataAndInterfaceFromSpecification:archive:error:", a3, a4, a6);
  if (!(_DWORD)v8)
    return 0;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 404)
  {
    v9 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v8);
    v9 = &CoreML::Specification::_KNearestNeighborsClassifier_default_instance_;
  }
  v111 = &off_1E3D55D20;
  v112 = 0;
  v118 = 0;
  v11 = v9[1];
  if ((v11 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v112, v11 & 0xFFFFFFFFFFFFFFFELL);
  if (v9 == &CoreML::Specification::_KNearestNeighborsClassifier_default_instance_)
  {
    v13 = 0;
    v113 = 0;
  }
  else
  {
    if (v9[2])
    {
      v12 = (CoreML::Specification::NearestNeighborsIndex *)operator new();
      CoreML::Specification::NearestNeighborsIndex::NearestNeighborsIndex(v12, (const CoreML::Specification::NearestNeighborsIndex *)v9[2]);
    }
    else
    {
      v12 = 0;
    }
    v113 = v12;
    if (v9[3])
    {
      v13 = (CoreML::Specification::Int64Parameter *)operator new();
      CoreML::Specification::Int64Parameter::Int64Parameter(v13, (const CoreML::Specification::Int64Parameter *)v9[3]);
    }
    else
    {
      v13 = 0;
    }
  }
  v114 = v13;
  v119 = 0;
  v14 = *((_DWORD *)v9 + 15);
  if (v14 == 101)
  {
    v119 = 101;
    v18 = (CoreML::Specification::Int64Vector *)operator new();
    v19 = CoreML::Specification::Int64Vector::Int64Vector(v18);
    v115 = v18;
    if (*((_DWORD *)v9 + 15) == 101)
    {
      v20 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)v9[4];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v19);
      v20 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)&CoreML::Specification::_Int64Vector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts::MergeFrom((uint64_t *)v18, v20);
  }
  else if (v14 == 100)
  {
    v119 = 100;
    v15 = (CoreML::Specification::StringVector *)operator new();
    v16 = CoreML::Specification::StringVector::StringVector(v15);
    v115 = v15;
    if (*((_DWORD *)v9 + 15) == 100)
    {
      v17 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)v9[4];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v16);
      v17 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)&CoreML::Specification::_StringVector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedStrings::MergeFrom((std::string *)v15, v17);
  }
  v120 = 0;
  v21 = *((_DWORD *)v9 + 16);
  if (v21 == 111)
  {
    v23 = (std::string *)v9[5];
    CoreML::Specification::KNearestNeighborsClassifier::clear_DefaultClassLabel((uint64_t)&v111);
    v120 = 111;
    v116 = v23;
  }
  else if (v21 == 110)
  {
    v22 = v9[5];
    CoreML::Specification::KNearestNeighborsClassifier::clear_DefaultClassLabel((uint64_t)&v111);
    v120 = 110;
    v116 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
    google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v116, v22);
  }
  v121 = 0;
  v24 = *((_DWORD *)v9 + 17);
  if (v24 != 210)
  {
    if (v24 != 200)
      goto LABEL_39;
    v121 = 200;
    v25 = (uint64_t *)operator new();
    v26 = CoreML::Specification::UniformWeighting::UniformWeighting((CoreML::Specification::UniformWeighting *)v25);
    v117 = v25;
    if (*((_DWORD *)v9 + 17) != 200)
    {
      CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v26);
      v27 = &CoreML::Specification::_UniformWeighting_default_instance_;
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  v121 = 210;
  v25 = (uint64_t *)operator new();
  v28 = CoreML::Specification::InverseDistanceWeighting::InverseDistanceWeighting((CoreML::Specification::InverseDistanceWeighting *)v25);
  v117 = v25;
  if (*((_DWORD *)v9 + 17) == 210)
  {
LABEL_35:
    v27 = (uint64_t *)v9[6];
    goto LABEL_37;
  }
  CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v28);
  v27 = &CoreML::Specification::_InverseDistanceWeighting_default_instance_;
LABEL_37:
  v29 = v27[1];
  if ((v29 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v25 + 1, v29 & 0xFFFFFFFFFFFFFFFELL);
LABEL_39:
  if (v113)
    v30 = v113;
  else
    v30 = (const CoreML::Specification::NearestNeighborsIndex *)&CoreML::Specification::_NearestNeighborsIndex_default_instance_;
  CoreML::Specification::NearestNeighborsIndex::NearestNeighborsIndex((CoreML::Specification::NearestNeighborsIndex *)v105, v30);
  operator<<((uint64_t)v6, v108);
  v94 = a3;
  if (v106 >= 1)
  {
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v96 = v6;
    while (1)
    {
      v35 = *(_QWORD *)(v107 + 8 * v34 + 8);
      v36 = *(_QWORD *)(v35 + 24);
      if (v36)
        v37 = (const void *)(v36 + 8);
      else
        v37 = 0;
      v38 = *(int *)(v35 + 16);
      v125 = 0;
      v126 = 0;
      v124 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v124, v37, (uint64_t)v37 + 4 * v38, v38);
      v39 = v124;
      if ((char *)v125 - (char *)v124 >= 1)
      {
        v40 = ((char *)v125 - (char *)v124) >> 2;
        v41 = v32 - v31;
        __p = v31;
        v42 = &v31[(v32 - v31) & 0xFFFFFFFFFFFFFFFCLL];
        if (v40 <= (v33 - v32) >> 2)
        {
          v49 = (v32 - v42) >> 2;
          if (v49 >= v40)
          {
            v51 = (void (**)(google::protobuf::io::OstreamOutputStream *__hidden))((char *)v124 + 4 * v40);
            v53 = v32;
LABEL_63:
            v54 = &v53[-4 * v40];
            v55 = v53;
            while (v54 < v32)
            {
              v56 = *(_DWORD *)v54;
              v54 += 4;
              *(_DWORD *)v55 = v56;
              v55 += 4;
            }
            v57 = &v42[4 * v40];
            if (v53 != v57)
              memmove(&v53[-4 * ((v53 - v57) >> 2)], v42, v53 - v57);
            if (v51 != v39)
              memmove(v42, v39, (char *)v51 - (char *)v39);
            v32 = v55;
            v31 = __p;
            goto LABEL_83;
          }
          v50 = v33;
          v51 = (void (**)(google::protobuf::io::OstreamOutputStream *__hidden))((char *)v124 + 4 * v49);
          v52 = (char *)v125 - (char *)v51;
          if (v125 != v51)
            memmove(v32, (char *)v124 + 4 * v49, (char *)v125 - (char *)v51);
          v53 = &v32[v52];
          if (v32 - v42 >= 1)
          {
            v33 = v50;
            goto LABEL_63;
          }
          v32 += v52;
          v33 = v50;
        }
        else
        {
          v43 = v41 >> 2;
          v44 = (v41 >> 2) + v40;
          if (v44 >> 62)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          if ((v33 - __p) >> 1 > v44)
            v44 = (v33 - __p) >> 1;
          if ((unint64_t)(v33 - __p) >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v44;
          if (v45)
          {
            v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v45);
            v48 = v47;
          }
          else
          {
            v46 = 0;
            v48 = 0;
          }
          v58 = &v46[4 * v43];
          v59 = &v58[4 * v40];
          v60 = 4 * v40;
          v61 = v58;
          do
          {
            v62 = *(_DWORD *)v39;
            v39 = (void (**)(google::protobuf::io::OstreamOutputStream *__hidden))((char *)v39 + 4);
            *(_DWORD *)v61 = v62;
            v61 += 4;
            v60 -= 4;
          }
          while (v60);
          if (v32 != __p)
          {
            v63 = 4 * v43;
            do
            {
              *(_DWORD *)&v46[v63 - 4] = *(_DWORD *)&__p[v63 - 4];
              v63 -= 4;
            }
            while (v63);
            v58 = v46;
          }
          v64 = v32 - v42;
          if (v64)
            memmove(v59, v42, v64);
          v33 = &v46[4 * v48];
          v32 = &v59[v64];
          if (__p)
            operator delete(__p);
          v31 = v58;
          v6 = v96;
        }
      }
LABEL_83:
      if (v124)
        operator delete(v124);
      if (++v34 >= v106)
        goto LABEL_89;
    }
  }
  v31 = 0;
  v32 = 0;
LABEL_89:
  operator<<((uint64_t)v6, (v32 - v31) >> 2);
  if (v32 != v31)
  {
    v65 = 0;
    if ((unint64_t)((v32 - v31) >> 2) <= 1)
      v66 = 1;
    else
      v66 = (v32 - v31) >> 2;
    do
      operator<<((uint64_t)v6, *(float *)&v31[4 * v65++]);
    while (v66 != v65);
  }
  if (v119)
  {
    if (v119 == 100)
    {
      v69 = v115;
      operator<<((uint64_t)v6, 100);
      operator<<((uint64_t)v6, *((int *)v69 + 6));
      if (*((int *)v69 + 6) >= 1)
      {
        v70 = 0;
        do
          operator<<((uint64_t)v6, *(uint64_t **)(*((_QWORD *)v69 + 4) + 8 * v70++ + 8));
        while (v70 < *((int *)v69 + 6));
      }
    }
    else if (v119 == 101)
    {
      v67 = v115;
      operator<<((uint64_t)v6, 101);
      operator<<((uint64_t)v6, *((int *)v67 + 4));
      if (*((int *)v67 + 4) >= 1)
      {
        v68 = 0;
        do
          operator<<((uint64_t)v6, *(_QWORD *)(*((_QWORD *)v67 + 3) + 8 * v68++ + 8));
        while (v68 < *((int *)v67 + 4));
      }
    }
  }
  else
  {
    operator<<((uint64_t)v6, 0);
  }
  operator<<((uint64_t)v6, v120);
  if (v120 == 110)
  {
    operator<<((uint64_t)v6, (uint64_t *)v116);
  }
  else if (v120 == 111)
  {
    operator<<((uint64_t)v6, (uint64_t)v116);
  }
  if (v121 == 200)
  {
    v71 = 0;
  }
  else
  {
    if (v121 != 210)
      goto LABEL_115;
    v71 = 1;
  }
  operator<<((uint64_t)v6, v71);
LABEL_115:
  if (v110 == 100)
  {
    v74 = 0;
LABEL_122:
    operator<<((uint64_t)v6, v74);
    goto LABEL_123;
  }
  if (v110 == 110)
  {
    v72 = (CoreML::Specification::protobuf_NearestNeighbors_2eproto *)operator<<((uint64_t)v6, 1);
    if (v110 == 110)
    {
      v73 = v109;
    }
    else
    {
      CoreML::Specification::protobuf_NearestNeighbors_2eproto::InitDefaults(v72);
      v73 = &CoreML::Specification::_SingleKdTreeIndex_default_instance_;
    }
    v74 = *((_DWORD *)v73 + 4);
    goto LABEL_122;
  }
LABEL_123:
  if (*(_BYTE *)(*(_QWORD *)v94 + 28))
  {
    std::string::basic_string[abi:ne180100]<0>(v102, "updateParameters");
    v75 = OArchive::nestedArchive(v6, (uint64_t)v102);
    if (SHIBYTE(v103) < 0)
      operator delete(v102[0]);
    (*(void (**)(_QWORD))(**((_QWORD **)v75 + 1) + 56))(*((_QWORD *)v75 + 1));
    LOBYTE(v124) = *v75;
    v76 = (std::__shared_weak_count *)*((_QWORD *)v75 + 2);
    v125 = (void (**)(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *__hidden))*((_QWORD *)v75 + 1);
    v126 = v76;
    if (v76)
    {
      p_shared_owners = (unint64_t *)&v76->__shared_owners_;
      do
        v78 = __ldxr(p_shared_owners);
      while (__stxr(v78 + 1, p_shared_owners));
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)&v127, (_QWORD *)v75 + 3);
    operator<<((uint64_t)&v124, 0);
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v128);
    v79 = v126;
    if (v126)
    {
      v80 = (unint64_t *)&v126->__shared_owners_;
      do
        v81 = __ldaxr(v80);
      while (__stlxr(v81 - 1, v80));
      if (!v81)
      {
        ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
        std::__shared_weak_count::__release_weak(v79);
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v124, "modelParameters");
  v82 = OArchive::nestedArchive(v6, (uint64_t)&v124);
  if (SHIBYTE(v126) < 0)
    operator delete(v124);
  (*(void (**)(_QWORD))(**((_QWORD **)v82 + 1) + 56))(*((_QWORD *)v82 + 1));
  LOBYTE(v102[0]) = *v82;
  v83 = (std::__shared_weak_count *)*((_QWORD *)v82 + 2);
  v102[1] = *((void **)v82 + 1);
  v103 = v83;
  if (v83)
  {
    v84 = (unint64_t *)&v83->__shared_owners_;
    do
      v85 = __ldxr(v84);
    while (__stxr(v85 + 1, v84));
  }
  std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v104, (_QWORD *)v82 + 3);
  operator<<((uint64_t)v102, 0);
  if (v114)
    v86 = v114;
  else
    v86 = (google::protobuf::MessageLite *)&CoreML::Specification::_Int64Parameter_default_instance_;
  std::string::basic_string[abi:ne180100]<0>(v98, "numberOfNeighbors");
  std::string::basic_string[abi:ne180100]<0>(&v124, "modelParameters");
  v87 = OArchive::nestedArchive(v6, (uint64_t)&v124);
  if (SHIBYTE(v126) < 0)
    operator delete(v124);
  (*(void (**)(_QWORD))(**((_QWORD **)v87 + 1) + 56))(*((_QWORD *)v87 + 1));
  v88 = OArchive::nestedArchive(v87, (uint64_t)v98);
  (*(void (**)(_QWORD))(**((_QWORD **)v88 + 1) + 56))(*((_QWORD *)v88 + 1));
  v89 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)v88 + 1) + 56))(*((_QWORD *)v88 + 1));
  v124 = &off_1E3D59908;
  v125 = &off_1E3D598E0;
  v126 = (std::__shared_weak_count *)v89;
  v127 = &off_1E3D59990;
  v128 = (char *)&v125;
  v129 = 0;
  v130 = 0;
  v131 = 0;
  v132 = 0x2000;
  if ((google::protobuf::MessageLite::SerializeToZeroCopyStream(v86, (google::protobuf::io::ZeroCopyOutputStream *)&v124) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)v100);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v122, "unable to serialize object");
    v100[0] = 4;
    std::operator+<char>();
    if (v123 < 0)
      operator delete(v122);
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v124);
  if (v99 < 0)
    operator delete(v98[0]);
  if ((v100[0] & 0xFFFFFFEF) != 0)
  {
    if (a6)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to archive model parameters."));
      v90 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = 0;
    }
  }
  else
  {
    +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", v6);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v101 < 0)
    operator delete((void *)v100[1]);
  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v104[1]);
  v91 = v103;
  if (v103)
  {
    v92 = (unint64_t *)&v103->__shared_owners_;
    do
      v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
      std::__shared_weak_count::__release_weak(v91);
    }
  }
  if (v31)
    operator delete(v31);
  CoreML::Specification::NearestNeighborsIndex::~NearestNeighborsIndex((CoreML::Specification::NearestNeighborsIndex *)v105);
  CoreML::Specification::KNearestNeighborsClassifier::~KNearestNeighborsClassifier((CoreML::Specification::KNearestNeighborsClassifier *)&v111);
  return v90;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("notreesyet"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
