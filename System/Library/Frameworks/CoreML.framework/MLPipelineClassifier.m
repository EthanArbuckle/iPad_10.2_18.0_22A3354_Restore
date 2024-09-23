@implementation MLPipelineClassifier

- (MLPipeline)pipeline
{
  return self->_engine;
}

- (MLPipelineClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  MLPipelineClassifier *v14;
  MLPipelineClassifier *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MLPipelineClassifier;
  v14 = -[MLClassifier initWithDescription:configuration:error:](&v20, sel_initWithDescription_configuration_error_, v12, v13, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    objc_msgSend(v11, "modelDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "classLabels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](v15, "modelDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClassLabels:", v17);

  }
  return v15;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v15, v10, 3, -[MLPipelineClassifier signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  -[MLPipelineClassifier engine](self, "engine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionFromFeatures:options:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MLClassifier classifierResultFromOutputFeatures:error:](self, "classifierResultFromOutputFeatures:error:", v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v15);
  return v13;
}

- (void)classify:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MLPredictionEvent *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ElapsedTimeRecorder *v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[6];
  ElapsedTimeRecorder *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3812000000;
  v24[3] = __Block_byref_object_copy__4714;
  v24[4] = __Block_byref_object_dispose__4715;
  v24[5] = 0;
  -[MLModel predictionEvent](self, "predictionEvent");
  v11 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  v12 = -[MLPipelineClassifier signpostID](self, "signpostID");
  v13 = objc_msgSend(v9, "parentSignpostID");
  v14 = -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID");
  v15 = (ElapsedTimeRecorder *)operator new();
  ElapsedTimeRecorder::ElapsedTimeRecorder(v15, v11, 3, v12, v13, v14);
  v25 = v15;

  v23 = 0;
  v16 = -[MLModel newRequestWithInputFeatures:options:error:](self, "newRequestWithInputFeatures:options:error:", v8, v9, &v23);
  v17 = v23;
  if (v16)
  {
    -[MLPipelineClassifier engine](self, "engine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__MLPipelineClassifier_classify_options_completionHandler___block_invoke;
    v20[3] = &unk_1E3D653C8;
    v20[4] = self;
    v22 = v24;
    v21 = v10;
    objc_msgSend(v18, "submitPredictionRequest:completionHandler:", v16, v20);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v17);
  }

  _Block_object_dispose(v24, 8);
  v19 = (id *)v25;
  v25 = 0;
  if (v19)
  {
    ElapsedTimeRecorder::~ElapsedTimeRecorder(v19);
    MEMORY[0x1A1AD6260]();
  }

}

- (unint64_t)signpostID
{
  void *v2;
  unint64_t v3;

  -[MLPipelineClassifier engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signpostID");

  return v3;
}

- (void)enableInstrumentsTracing
{
  id v2;

  -[MLPipelineClassifier engine](self, "engine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableInstrumentsTracing");

}

- (id)executionSchedule
{
  void *v2;
  void *v3;

  -[MLPipelineClassifier engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MLPipeline)engine
{
  return (MLPipeline *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

void __59__MLPipelineClassifier_classify_options_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)a1[4];
    v11 = v6;
    objc_msgSend(v7, "classifierResultFromOutputFeatures:error:", v5, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v11;

    v10 = (void *)v8;
    v6 = v9;
  }
  else
  {
    v10 = 0;
  }
  std::unique_ptr<ElapsedTimeRecorder>::reset[abi:ne180100]((id **)(*(_QWORD *)(a1[6] + 8) + 48));
  (*(void (**)(void))(a1[5] + 16))();

}

@end
