@implementation MLSupportVectorRegressor

- (MLSupportVectorRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11;
  MLSupportVectorRegressor *v12;
  MLSupportVectorRegressor *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLSupportVectorRegressor;
  v12 = -[MLRegressor initWithDescription:configuration:error:](&v15, sel_initWithDescription_configuration_error_, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_engine, a3);

  return v13;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD aBlock[6];
  id v25[7];

  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v25, v10, 22, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__MLSupportVectorRegressor_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModel modelDescription](self, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputFeatureNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v8, v16, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_11;
  if (-[MLSVREngine isInputSizeLowerBoundOnly](self->_engine, "isInputSizeLowerBoundOnly"))
  {
    v18 = objc_msgSend(v17, "count");
    if (v18 < (int64_t)-[MLSVREngine inputSize](self->_engine, "inputSize"))
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %d expected length of at least %d"), objc_msgSend(v17, "count"), -[MLSVREngine inputSize](self->_engine, "inputSize"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v22 = 0;
        *a5 = v19;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v20 = objc_msgSend(v17, "count");
    if (v20 != -[MLSVREngine inputSize](self->_engine, "inputSize"))
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %d expected length of %d"), objc_msgSend(v17, "count"), -[MLSVREngine inputSize](self->_engine, "inputSize"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
LABEL_11:
      v22 = 0;
      goto LABEL_12;
    }
  }
  -[MLSVREngine predict:](self->_engine, "predict:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLRegressorResult resultWithValue:](MLRegressorResult, "resultWithValue:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v25);
  return v22;
}

- (MLSVREngine)engine
{
  return (MLSVREngine *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

uint64_t __50__MLSupportVectorRegressor_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

@end
