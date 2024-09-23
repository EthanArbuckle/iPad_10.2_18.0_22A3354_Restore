@implementation MLIdentity

- (MLIdentity)init
{
  MLModelConfiguration *v3;
  MLIdentity *v4;
  objc_super v6;

  v3 = objc_alloc_init(MLModelConfiguration);
  v6.receiver = self;
  v6.super_class = (Class)MLIdentity;
  v4 = -[MLModel initWithConfiguration:](&v6, sel_initWithConfiguration_, v3);

  return v4;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MLPredictionEvent *v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  id v13;
  _QWORD aBlock[6];
  id v16[7];

  v7 = a3;
  v8 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v9 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v16, v9, 20, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v8, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MLIdentity_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v13 = v7;
  v12[2](v12);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v16);
  return v13;
}

uint64_t __51__MLIdentity_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(_MLModelSpecification *)a3 configuration:(id)a4 error:(id *)a5
{
  return objc_alloc_init(MLIdentity);
}

@end
