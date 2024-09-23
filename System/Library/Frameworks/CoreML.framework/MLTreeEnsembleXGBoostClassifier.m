@implementation MLTreeEnsembleXGBoostClassifier

- (MLTreeEnsembleXGBoostClassifier)initWithDescription:(id)a3 configuration:(id)a4 indexToStringLabelArray:()vector<std:(std:(vector<long)long :(std:(id)a7 :(id *)a8 allocator<long long>> *)a6 allocator<std::string>> *)a5 :string indexToIntLabelArray:modelURL:error:
{
  id v14;
  id v15;
  id v16;
  MLTreeEnsembleXGBoostClassifier *v17;
  MLTreeEnsembleXGBoostClassifier *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  NSArray *labelsForDataPoints;
  NSArray *v23;
  MLTreeEnsembleXGBoostClassifier *v24;
  void *v25;
  void *__p;
  void *v28;
  uint64_t v29;
  std::string v30;
  id v31;
  objc_super v32;
  std::string *v33;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MLTreeEnsembleXGBoostClassifier;
  v17 = -[MLModel initWithDescription:configuration:](&v32, sel_initWithDescription_configuration_, v14, v15);
  v18 = v17;
  if (v17)
  {
    v31 = 0;
    v19 = -[MLTreeEnsembleXGBoostClassifier initializeAndvalidateObjectiveAndNumClassesWithConfiguration:error:](v17, "initializeAndvalidateObjectiveAndNumClassesWithConfiguration:error:", v15, &v31);
    v20 = v31;
    if (v19)
    {
      memset(&v30, 0, sizeof(v30));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v30, (__int128 *)a5->__begin_, (__int128 *)a5->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a5->__end_ - (char *)a5->__begin_) >> 3));
      __p = 0;
      v28 = 0;
      v29 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, a6->__begin_, (uint64_t)a6->__end_, a6->__end_ - a6->__begin_);
      -[MLTreeEnsembleXGBoostClassifier loadLabelsWithStringLabels:intLabels:](v18, "loadLabelsWithStringLabels:intLabels:", &v30, &__p);
      v21 = objc_claimAutoreleasedReturnValue();
      labelsForDataPoints = v18->_labelsForDataPoints;
      v18->_labelsForDataPoints = (NSArray *)v21;

      if (__p)
      {
        v28 = __p;
        operator delete(__p);
      }
      v33 = &v30;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
      v23 = v18->_labelsForDataPoints;
      if (v23 && -[NSArray count](v23, "count"))
      {
        objc_storeStrong((id *)&v18->_modelURL, a7);
        if (-[MLTreeEnsembleXGBoostClassifier initializeBoosterIfOneExists](v18, "initializeBoosterIfOneExists"))
        {
          v24 = v18;
LABEL_20:

          goto LABEL_21;
        }
        if (a8)
        {
          +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot load the trained model."));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
LABEL_19:
        v24 = 0;
        goto LABEL_20;
      }
      if (!a8)
        goto LABEL_19;
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in initalizing labels."));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a8)
        goto LABEL_19;
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v20, CFSTR("Invalid objective and/or numClasses."));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_18:
    v24 = 0;
    *a8 = v25;
    goto LABEL_20;
  }
  if (a8)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in initalizing the classifier."));
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
LABEL_21:

  return v24;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  id v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unint64_t *v20;
  const float **v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  float *v28;
  float *v29;
  void *__p;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];
  id v35[7];

  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v35, v10, 29, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MLTreeEnsembleXGBoostClassifier_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"))
  {
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Prediction failed since the tree was not trained with any data point."));
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_19;
  }
  v27 = 0;
  -[MLTreeEnsembleXGBoostClassifier xgBoostDataFormatFromFeatureProvider:error:](self, "xgBoostDataFormatFromFeatureProvider:error:", v8, &v27);
  v14 = v27;
  if (!v14)
  {
    v26 = 0;
    softLink_XGDMatrixCreateFromMat(v28, v32, v33, v15, &v26);
    v24 = 0;
    v25 = 0;
    v18 = -[MLTreeEnsembleXGBoostClassifier booster](self, "booster");
    v22 = softLink_XGBoosterPredict(v18, v26, (uint64_t)&v25, (uint64_t)&v24, v19, v20, v21);
    softLink_XGDMatrixFree(v26);
    if (v22 != -1)
    {
      -[MLTreeEnsembleXGBoostClassifier featureProviderFromXGboostResults:length:error:](self, "featureProviderFromXGboostResults:length:error:", v24, v25, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Prediction failed."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  if (!a5)
    goto LABEL_13;
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v14, CFSTR("Prediction failed since data could not be transformed properly."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v17 = 0;
  *a5 = v16;
LABEL_14:
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }

LABEL_19:
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v35);
  return v17;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostClassifier predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  id v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t *v19;
  const float **v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  float *v27;
  float *v28;
  void *__p;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLTreeEnsembleXGBoostClassifier_predictionsFromBatch_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"))
  {
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Prediction failed since the tree was not trained with any data point."));
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_19;
  }
  v26 = 0;
  -[MLTreeEnsembleXGBoostClassifier xgBoostDataFormatFromBatchProvider:needLabels:error:](self, "xgBoostDataFormatFromBatchProvider:needLabels:error:", v8, 0, &v26);
  v13 = v26;
  if (!v13)
  {
    v25 = 0;
    softLink_XGDMatrixCreateFromMat(v27, v31, v32, v14, &v25);
    v23 = 0;
    v24 = 0;
    v17 = -[MLTreeEnsembleXGBoostClassifier booster](self, "booster");
    v21 = softLink_XGBoosterPredict(v17, v25, (uint64_t)&v24, (uint64_t)&v23, v18, v19, v20);
    softLink_XGDMatrixFree(v25);
    if (v21 != -1)
    {
      -[MLTreeEnsembleXGBoostClassifier batchProviderFromXGboostResults:length:error:](self, "batchProviderFromXGboostResults:length:error:", v23, v24, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Prediction failed."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  if (!a5)
    goto LABEL_13;
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v13, CFSTR("Prediction failed since data could not be transformed properly."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v16 = 0;
  *a5 = v15;
LABEL_14:
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }

LABEL_19:
  v12[2](v12);

  return v16;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostClassifier predictionsFromBatch:options:error:](self, "predictionsFromBatch:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromFeatureProvider:(SEL)a3 error:(id)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  float *begin;
  MLMultiArray *v22;
  void *v23;
  void *v24;
  MLMultiArray *v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  $4C320686E39F107BF64A17E17E3DD7CB *result;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33 = a4;
  -[MLModel modelDescription](self, "modelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->var1.__end_ = 0u;
  *(_OWORD *)&retstr->var0.__begin_ = 0u;
  retstr->var2 = 1;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "featureValueForName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "type") == 5)
  {
    objc_msgSend(v12, "multiArrayValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      if (a5)
      {
        objc_msgSend(v9, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Missing MLMultiArrayValue for feature named %@"), v30);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_20;
    }
    v15 = objc_msgSend(v13, "count");
    retstr->var3 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v14, "shape");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue") == v15;

      if (v20)
      {
        std::vector<float>::resize((char **)retstr, v15);
        begin = retstr->var0.__begin_;
        v22 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v22, "initWithDataPointer:shape:dataType:strides:deallocator:error:", begin, v24, 65568, &unk_1E3DA29C0, 0, 0);

        v26 = objc_msgSend(v14, "copyIntoMultiArray:error:", v25, a5);
        if (a5)
          v27 = v26;
        else
          v27 = 1;
        if ((v27 & 1) != 0)
          goto LABEL_18;
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to convert training data to the right format"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        *a5 = v28;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    if (!a5)
    {
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    objc_msgSend(v14, "shape");
    v25 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Shape of training data point %i MLMultiArray is %@, expected %@"), 0, v25, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (a5)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Input data other than MLFeatureTypeMultiArray is not supported for training."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return result;
}

- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromBatchProvider:(SEL)a3 needLabels:(id)a4 error:(BOOL)a5
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  id v17;
  $4C320686E39F107BF64A17E17E3DD7CB *result;
  id v19;

  v7 = a5;
  v10 = a4;
  *(_OWORD *)&retstr->var0.__begin_ = 0u;
  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->var1.__end_ = 0u;
  retstr->var2 = objc_msgSend(v10, "count");
  std::vector<float>::resize((char **)&retstr->var1, objc_msgSend(v10, "count"));
  -[MLModel modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    for (i = 0; i < objc_msgSend(v10, "count"); ++i)
    {
      v16 = (void *)MEMORY[0x1A1AD6ED8]();
      v19 = 0;
      -[MLTreeEnsembleXGBoostClassifier populateXGBoostDataFormat:trainingData:dataIndex:inputName:needLabels:error:](self, "populateXGBoostDataFormat:trainingData:dataIndex:inputName:needLabels:error:", retstr, v10, i, v14, v7, &v19);
      v17 = v19;
      objc_autoreleasePoolPop(v16);
      if (a6)
        *a6 = objc_retainAutorelease(v17);

    }
  }
  else if (a6)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Missing input name for Tree Ensemble Classifier."));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return result;
}

- (void)populateXGBoostDataFormat:(void *)a3 trainingData:(id)a4 dataIndex:(int64_t)a5 inputName:(id)a6 needLabels:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  MLMultiArray *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t i;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  MLMultiArray *v50;
  void *v51;
  MLTreeEnsembleXGBoostClassifier *v52;
  void *v53;
  id v54;
  void *v56;
  id v57;
  void *v58;
  _QWORD v59[2];

  v9 = a7;
  v59[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v56 = v13;
  objc_msgSend(v13, "featuresAtIndex:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "featureValueForName:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (objc_msgSend(v16, "type") == 5)
    {
      objc_msgSend(v16, "multiArrayValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        if (!a8)
        {
LABEL_45:

          goto LABEL_46;
        }
        v54 = 0;
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Missing MLMultiArrayValue for feature named %@"), v14);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
        v17 = v54;
        goto LABEL_45;
      }
      v52 = self;
      v54 = v17;
      v18 = objc_msgSend(v17, "count");
      *((_QWORD *)a3 + 7) = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "shape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count") == 1)
      {
        objc_msgSend(v54, "shape");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndex:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue") == v18;

        if (v23)
        {
          v24 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
          std::vector<float>::resize((char **)a3, v18 + (v24 >> 2));
          v25 = *(_QWORD *)a3;
          v26 = [MLMultiArray alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v26, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v25 + 4 * (v24 >> 2), v28, 65568, &unk_1E3DA29D8, 0, 0);

          v57 = 0;
          LOBYTE(v24) = objc_msgSend(v54, "copyIntoMultiArray:error:", v50, &v57);
          v29 = v57;
          if ((v24 & 1) == 0)
          {
            if (a8)
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v29, CFSTR("Failed to convert training data to the right format."));
              *a8 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_41;
          }
          if (!v9)
          {
LABEL_41:

LABEL_43:
            goto LABEL_44;
          }
          v47 = v29;
          -[MLModel modelDescription](v52, "modelDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "predictedFeatureName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v56, "featuresAtIndex:", a5);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "featureValueForName:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = v49;
          if (!v49)
          {
            if (a8)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Data provided in input is missing feature value for training input: %@"), v48);
              v41 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_38;
            }
            goto LABEL_40;
          }
          if (objc_msgSend(v49, "type") == 3)
          {
            for (i = 0; ; ++i)
            {
              -[MLTreeEnsembleXGBoostClassifier labelsForDataPoints](v52, "labelsForDataPoints");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = i < objc_msgSend(v34, "count");

              if (!v35)
                break;
              objc_msgSend(v49, "stringValue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLTreeEnsembleXGBoostClassifier labelsForDataPoints](v52, "labelsForDataPoints");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectAtIndexedSubscript:", i);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v36, "isEqualToString:", v38);

              if (v39)
                goto LABEL_35;
            }
          }
          else
          {
            if (objc_msgSend(v49, "type") != 1)
            {
              if (a8)
              {
                +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Label must be of type MLFeatureTypeString or MLFeatureTypeInt64"));
                v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
                *a8 = v41;
LABEL_39:
                v32 = v49;
              }
LABEL_40:

              v29 = v47;
              goto LABEL_41;
            }
            i = 0;
            *(float *)(*((_QWORD *)a3 + 3) + 4 * a5) = (float)objc_msgSend(v49, "int64Value");
            while (1)
            {
              -[MLTreeEnsembleXGBoostClassifier labelsForDataPoints](v52, "labelsForDataPoints");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = i < objc_msgSend(v42, "count");

              if (!v43)
                break;
              v44 = objc_msgSend(v49, "int64Value");
              -[MLTreeEnsembleXGBoostClassifier labelsForDataPoints](v52, "labelsForDataPoints");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectAtIndexedSubscript:", i);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v44) = v44 == objc_msgSend(v46, "intValue");

              if ((_DWORD)v44)
              {
LABEL_35:
                *(float *)(*((_QWORD *)a3 + 3) + 4 * a5) = (float)i;
                goto LABEL_39;
              }
              ++i;
            }
          }
          v32 = v49;
          if (a8)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Label %@ not found for data index: %ld."), v49, a5);
            v41 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
          goto LABEL_40;
        }
      }
      else
      {

      }
      if (a8)
      {
        objc_msgSend(v54, "shape");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Shape of training data point %li MLMultiArray is %@, expected %@"), a5, v51, v53);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_43;
    }
    if (a8)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Input data other than MLFeatureTypeMultiArray is not supported for training."));
      v40 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else if (a8)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Received nil MLFeatureProvider for index %ld from training data MLBatchProvider for training input: %@"), a5, v14);
    v40 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    *a8 = v40;
  }
LABEL_46:

}

- (id)batchProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  id v7;
  MLArrayBatchProvider *v8;
  id v10;

  v10 = 0;
  -[MLTreeEnsembleXGBoostClassifier featureProviderArrayFromXGBoostResult:length:error:](self, "featureProviderArrayFromXGBoostResult:length:error:", a3, a4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v6);
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v7, CFSTR("Cannot create MLBatchProvider."));
    v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)featureProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  -[MLTreeEnsembleXGBoostClassifier featureProviderArrayFromXGBoostResult:length:error:](self, "featureProviderArrayFromXGBoostResult:length:error:", a3, a4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v7, CFSTR("Cannot create MLFeatureProvider."));
    v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)featureProviderArrayFromXGBoostResult:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  float v13;
  double *v14;
  uint64_t v15;
  double *v16;
  double v17;
  void *v18;
  int v19;
  double *v20;
  unint64_t v21;
  unint64_t i;
  double v23;
  double *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double *v34;
  MLProbabilityDictionary *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v43;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostClassifier labelsForDataPoints](self, "labelsForDataPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:", v8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
LABEL_46:
    v10 = v7;
    v39 = v7;
    goto LABEL_51;
  }
  v9 = 0;
  v10 = v7;
  while (1)
  {
    -[MLTreeEnsembleXGBoostClassifier objective](self, "objective");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("binary:logistic"));

    if (v12)
    {
      v13 = a3[v9];
      v14 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(1uLL);
      v16 = v14;
      *v14 = (float)(1.0 - v13);
      v17 = v13;
      if (v15 < 2)
      {
        v31 = 2;
        if ((unint64_t)((8 * v15) >> 2) > 2)
          v31 = (8 * v15) >> 2;
        if ((unint64_t)(8 * v15) >= 0x7FFFFFFFFFFFFFF8)
          v32 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v32 = v31;
        if (v32)
          v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v32);
        v33 = 0;
        *(double *)(v32 + 8) = v17;
        do
        {
          *(double *)(v32 + v33 * 8) = v16[v33];
          --v33;
        }
        while (v33 != -1);
        v34 = (double *)v32;
        operator delete(v16);
        v16 = v34;
        v7 = v10;
      }
      else
      {
        v14[1] = v17;
      }
      goto LABEL_37;
    }
    -[MLTreeEnsembleXGBoostClassifier objective](self, "objective");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("multi:softprob"));

    if (!v19)
      break;
    v16 = 0;
    v20 = 0;
    v21 = 0;
    for (i = 0; i < -[MLTreeEnsembleXGBoostClassifier numClasses](self, "numClasses"); ++i)
    {
      v23 = a3[i + v9];
      if ((unint64_t)v20 >= v21)
      {
        v25 = v20 - v16;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v21 - (_QWORD)v16) >> 2 > v26)
          v26 = (uint64_t)(v21 - (_QWORD)v16) >> 2;
        if (v21 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v27 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v27 = v26;
        if (v27)
          v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v27);
        else
          v28 = 0;
        v29 = (double *)(v27 + 8 * v25);
        *v29 = v23;
        v24 = v29 + 1;
        while (v20 != v16)
        {
          v30 = *((_QWORD *)v20-- - 1);
          *((_QWORD *)v29-- - 1) = v30;
        }
        v21 = v27 + 8 * v28;
        if (v16)
          operator delete(v16);
        v16 = v29;
      }
      else
      {
        *v20 = v23;
        v24 = v20 + 1;
      }
      v20 = v24;
      v7 = v10;
    }
LABEL_37:
    v35 = -[MLProbabilityDictionary initWithSharedKeySet:probabilities:]([MLProbabilityDictionary alloc], "initWithSharedKeySet:probabilities:", v43, v16);
    -[MLProbabilityDictionary classLabelOfMaxProbability](v35, "classLabelOfMaxProbability");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostClassifier packageOutputWithPredictedLabel:classProbabilities:](self, "packageOutputWithPredictedLabel:classProbabilities:", v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v7, "addObject:", v37);
      v38 = 0;
    }
    else
    {
      if (a5)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Data processing failed."));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v38 = 1;
    }

    if (v16)
      operator delete(v16);
    if (v38)
      goto LABEL_50;
    v9 = -[MLTreeEnsembleXGBoostClassifier numClasses](self, "numClasses") + v9;
    v7 = v10;
    if (v9 >= a4)
      goto LABEL_46;
  }
  if (a5)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Current objective not supported. Supported objectives are multi:softprob and binary:logistic."));
    v39 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  v10 = v7;
LABEL_50:
  v39 = 0;
LABEL_51:

  return v39;
}

- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4
{
  id v6;
  id v7;
  MLDictionaryFeatureProvider *v8;
  MLDictionaryFeatureProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = [MLDictionaryFeatureProvider alloc];
  v9 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:](v8, "initWithFeatureValueDictionary:", MEMORY[0x1E0C9AA70]);
  +[MLClassifierResult resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:](MLClassifierResult, "resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:", v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModel modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictedFeatureName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MLModel modelDescription](self, "modelDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputDescriptionsByName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](self, "modelDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predictedFeatureName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  -[MLModel modelDescription](self, "modelDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predictedProbabilitiesName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[MLModel modelDescription](self, "modelDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "outputDescriptionsByName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](self, "modelDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predictedProbabilitiesName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v10, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)initializeBoosterIfOneExists
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL result;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v16 = 0;
  -[NSURL lastPathComponent](self->_modelURL, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mlmodelc"), CFSTR(".xgboost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL path](self->_modelURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "fileExistsAtPath:", v6))
    goto LABEL_10;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = getXGBoosterCreateSymbolLoc(void)::ptr;
  v20 = getXGBoosterCreateSymbolLoc(void)::ptr;
  if (!getXGBoosterCreateSymbolLoc(void)::ptr)
  {
    v9 = (void *)XGBoostFrameworkLibrary();
    v8 = dlsym(v9, "XGBoosterCreate");
    v18[3] = (uint64_t)v8;
    getXGBoosterCreateSymbolLoc(void)::ptr = v8;
  }
  _Block_object_dispose(&v17, 8);
  if (v8)
  {
    ((void (*)(_QWORD, _QWORD, void **))v8)(0, 0, &v16);
    v10 = v16;
    v11 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v12 = getXGBoosterLoadModelSymbolLoc(void)::ptr;
    v20 = getXGBoosterLoadModelSymbolLoc(void)::ptr;
    if (!getXGBoosterLoadModelSymbolLoc(void)::ptr)
    {
      v13 = (void *)XGBoostFrameworkLibrary();
      v12 = dlsym(v13, "XGBoosterLoadModel");
      v18[3] = (uint64_t)v12;
      getXGBoosterLoadModelSymbolLoc(void)::ptr = v12;
    }
    _Block_object_dispose(&v17, 8);
    if (v12)
    {
      if (((unsigned int (*)(void *, uint64_t))v12)(v10, v11) == -1)
      {
        softLink_XGBoosterFree(v16);
        v14 = 0;
        goto LABEL_11;
      }
      self->_booster = v16;
LABEL_10:
      v14 = 1;
LABEL_11:

      return v14;
    }
    dlerror();
    result = abort_report_np();
  }
  else
  {
    dlerror();
    result = abort_report_np();
  }
  __break(1u);
  return result;
}

- (id)loadLabelsWithStringLabels:()vector<std:(std:(vector<long)long :(std::allocator<long long>> *)a4 allocator<std::string>> *)a3 :string intLabels:
{
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  char *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (-[NSString isEqualToString:](self->_objective, "isEqualToString:", CFSTR("binary:logistic")))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = v9;
      if (a3->__end_ == a3->__begin_)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4->__begin_[v8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);
      }
      else
      {
        v11 = (char *)a3->__begin_ + 24 * v8;
        if (v11[23] < 0)
          v11 = *(char **)v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);
      }

      v9 = 0;
      v8 = 1;
    }
    while ((v10 & 1) != 0);
  }
  else if (self->_numClasses)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      if (a3->__end_ == a3->__begin_)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4->__begin_[v14]);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

      ++v14;
      v13 += 24;
    }
    while (v14 < self->_numClasses);
  }
  return v7;
}

- (BOOL)initializeAndvalidateObjectiveAndNumClassesWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  objc_msgSend(v6, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey numClasses](MLParameterKey, "numClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if (v10)
  {
    objc_msgSend(v6, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey objective](MLParameterKey, "objective");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("binary:logistic"));
      if (v10 == 1)
        v15 = 0;
      else
        v15 = v14;
      if (v15 != 1)
      {
        self->_numClasses = v10;
        objc_storeStrong((id *)&self->_objective, v13);
        v17 = 1;
        goto LABEL_16;
      }
      if (a4)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Objective and number of classes does not match. numClasses for 'binary:logistic' must be defined as 1."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v17 = 0;
        *a4 = v16;
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (a4)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("objective parameter must be provided."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v17 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("numClasses parameter must be provided."));
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_17:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"))
    softLink_XGBoosterFree(-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"));
  v3.receiver = self;
  v3.super_class = (Class)MLTreeEnsembleXGBoostClassifier;
  -[MLTreeEnsembleXGBoostClassifier dealloc](&v3, sel_dealloc);
}

- (NSArray)labelsForDataPoints
{
  return self->_labelsForDataPoints;
}

- (void)setLabelsForDataPoints:(id)a3
{
  objc_storeStrong((id *)&self->_labelsForDataPoints, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSString)objective
{
  return self->_objective;
}

- (void)setObjective:(id)a3
{
  objc_storeStrong((id *)&self->_objective, a3);
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (void)booster
{
  return self->_booster;
}

- (void)setBooster:(void *)a3
{
  self->_booster = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objective, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_labelsForDataPoints, 0);
}

uint64_t __70__MLTreeEnsembleXGBoostClassifier_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __72__MLTreeEnsembleXGBoostClassifier_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

@end
