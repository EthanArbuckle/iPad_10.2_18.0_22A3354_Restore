@implementation DYEAGLOverridingPlaybackEngine

- (DYEAGLOverridingPlaybackEngine)initWithCaptureStore:(id)a3 experimentResultsGenerator:(id)a4
{
  id v6;
  id v7;
  DYEAGLOverridingPlaybackEngine *v8;
  DYEAGLOverridingPlaybackEngine *v9;
  id *p_experimentResultsGenerator;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  DYEAGLOverridingPlaybackEngine *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DYEAGLOverridingPlaybackEngine;
  v8 = -[DYEAGLOverridingPlaybackEngine initWithCaptureStore:](&v17, "initWithCaptureStore:", v6);
  v9 = v8;
  if (v8)
  {
    p_experimentResultsGenerator = (id *)&v8->_experimentResultsGenerator;
    objc_storeStrong((id *)&v8->_experimentResultsGenerator, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLPlaybackEngine eaglPlayer](v9, "eaglPlayer"));
    objc_msgSend(*p_experimentResultsGenerator, "setFunctionPlayer:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_experimentResultsGenerator, "experiment"));
    v13 = objc_msgSend(v12, "warmupCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_experimentResultsGenerator, "experiment"));
    -[DYEAGLOverridingPlaybackEngine setLoopCount:](v9, "setLoopCount:", objc_msgSend(v14, "repeatCount") + v13);

    v15 = v9;
  }

  return v9;
}

- (id)newFunctionPlayer
{
  DYEAGLOverridingFunctionPlayer *v3;
  void *v4;
  DYEAGLOverridingFunctionPlayer *v5;

  v3 = [DYEAGLOverridingFunctionPlayer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLOverridingPlaybackEngine captureStore](self, "captureStore"));
  v5 = -[DYEAGLOverridingFunctionPlayer initWithCaptureStore:](v3, "initWithCaptureStore:", v4);

  -[DYEAGLFunctionPlayer setLayerManager:](v5, "setLayerManager:", self);
  return v5;
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  -[DYGLExperimentResultsGenerator beginIteration:](self->_experimentResultsGenerator, "beginIteration:", *(_QWORD *)&a3);
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  -[DYGLExperimentResultsGenerator endIteration](self->_experimentResultsGenerator, "endIteration", *(_QWORD *)&a3);
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return -[DYGLExperimentResultsGenerator isDone](self->_experimentResultsGenerator, "isDone", *(_QWORD *)&a3) ^ 1;
}

- (DYGLExperimentResultsGenerator)experimentResultsGenerator
{
  return self->_experimentResultsGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentResultsGenerator, 0);
}

@end
