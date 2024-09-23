@implementation MLCustomModelWrapper

- (MLCustomModelWrapper)initWithModelDescription:(id)a3 customModel:(id)a4 configuration:(id)a5
{
  id v9;
  MLCustomModelWrapper *v10;
  MLCustomModelWrapper *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLCustomModelWrapper;
  v10 = -[MLModel initWithDescription:configuration:](&v13, sel_initWithDescription_configuration_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_customModel, a4);

  return v11;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  void *v11;
  id v13[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v13, v10, 0, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  -[MLCustomModel predictionFromFeatures:options:error:](self->_customModel, "predictionFromFeatures:options:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v13);

  return v11;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  objc_super v15;
  _QWORD aBlock[6];

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
    v10 = -[MLModel signpostID](self, "signpostID");
    v11 = objc_msgSend(v9, "parentSignpostID");
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MLCustomModelWrapper_predictionsFromBatch_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_48_e5_v8__0l;
    aBlock[4] = v10;
    aBlock[5] = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[MLCustomModel predictionsFromBatch:options:error:](self->_customModel, "predictionsFromBatch:options:error:", v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MLCustomModelWrapper;
    -[MLModel predictionsFromBatch:options:error:](&v15, sel_predictionsFromBatch_options_error_, v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (MLCustomModel)customModel
{
  return (MLCustomModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCustomModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customModel, 0);
}

uint64_t __59__MLCustomModelWrapper_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

@end
