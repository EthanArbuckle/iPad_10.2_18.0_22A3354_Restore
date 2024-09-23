@implementation DYEAGLReplayControllerSupport

- (DYEAGLReplayControllerSupport)initWithCaptureStore:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  DYEAGLReplayControllerSupport *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataValueForKey:", kDYCaptureSessionGraphicsAPIMetadataKey));
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DYEAGLReplayControllerSupport;
    v7 = -[DYEAGLReplayControllerSupport init](&v9, "init");
    if (v7)
    {
      DYSetNameReservationEncoding(1);
      self = v7;
      v7 = self;
    }
    else
    {
      self = 0;
    }
  }

  return v7;
}

- (void)enableDebugWireframePresent:(BOOL)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setEnableWireframePresent:", a3);
}

- (void)setDebugWireframeLineWidth:(float)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setWireframeLineWidth:");
}

- (void)setDebugTessellationWireframeLineWidth:(float)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setTessellationWireframeLineWidth:");
}

- (void)setWireframeLineColor:(unsigned int)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setWireframeLineColor:", *(_QWORD *)&a3);
}

- (void)enableDebugDrawCallPresent:(BOOL)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setEnableDrawCallPresent:", a3);
}

- (void)enableDebugOutlinePresent:(BOOL)a3 playbackEngine:(id)a4
{
  objc_msgSend(a4, "setEnableOutlinePresent:", a3);
}

- (void)disableDebugFunctions:(id)a3 playbackEngine:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "disabledFunctions"));
  objc_msgSend(v5, "addIndexes:", v6);

}

- (void)enableDebugFunctions:(id)a3 playbackEngine:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "disabledFunctions"));
  objc_msgSend(v5, "removeIndexes:", v6);

}

- (id)createOverridingPlaybackEngineWithCaptureStore:(id)a3 experiment:(id)a4
{
  id v6;
  id v7;
  DYGLExperimentResultsGenerator *v8;
  DYEAGLOverridingPlaybackEngine *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[DYGLExperimentResultsGenerator initWithExperiment:]([DYGLExperimentResultsGenerator alloc], "initWithExperiment:", v7);
  v9 = -[DYEAGLOverridingPlaybackEngine initWithCaptureStore:experimentResultsGenerator:]([DYEAGLOverridingPlaybackEngine alloc], "initWithCaptureStore:experimentResultsGenerator:", v6, v8);
  if (!v9)
    __assert_rtn("-[DYEAGLReplayControllerSupport createOverridingPlaybackEngineWithCaptureStore:experiment:]", (const char *)&unk_224E1, 0, "playbackEngine");
  -[DYEAGLReplayControllerSupport _setupContextRemapperForPlaybackEngine:](self, "_setupContextRemapperForPlaybackEngine:", v9);

  return v9;
}

- (id)createDebugPlaybackEngineWithCaptureStore:(id)a3
{
  id v4;
  DYEAGLDebugPlaybackEngine *v5;

  v4 = a3;
  v5 = -[DYEAGLDebugPlaybackEngine initWithCaptureStore:]([DYEAGLDebugPlaybackEngine alloc], "initWithCaptureStore:", v4);
  if (!v5)
    __assert_rtn("-[DYEAGLReplayControllerSupport createDebugPlaybackEngineWithCaptureStore:]", (const char *)&unk_224E1, 0, "playbackEngine");
  -[DYEAGLReplayControllerSupport _setupContextRemapperForPlaybackEngine:](self, "_setupContextRemapperForPlaybackEngine:", v5);

  return v5;
}

- (void)endPlayback
{
  DYSetContextRemappingBlock(0, a2);
}

- (BOOL)isDebugPlaybackEngine:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(DYEAGLDebugPlaybackEngine);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)viewControllerForPlaybackEngine:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewController"));
}

- (id)experimentResultsGeneratorForPlaybackEngine:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_class(DYEAGLOverridingPlaybackEngine);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experimentResultsGenerator"));
  else
    v5 = 0;

  return v5;
}

- (void)generateThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5
{
  (*((void (**)(id, void *))a5 + 2))(a5, &__NSDictionary0__struct);
}

- (void)generateDependencyGraphThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5
{
  (*((void (**)(id, void *))a5 + 2))(a5, &__NSDictionary0__struct);
}

- (id)newShaderProfilerWithPlaybackEngine:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  DYGLShaderProfilerFunctionPlayerSupport *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(DYEAGLDebugPlaybackEngine);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = -[DYGLShaderProfilerFunctionPlayerSupport initWithDebugEAGLPlaybackEngine:payLoad:]([DYGLShaderProfilerFunctionPlayerSupport alloc], "initWithDebugEAGLPlaybackEngine:payLoad:", v8, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)startShaderProfiler:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "queryShaderStart"));
}

- (void)_setupContextRemapperForPlaybackEngine:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13928;
  v5[3] = &unk_247F8;
  v6 = a3;
  v3 = v6;
  DYSetContextRemappingBlock(v5, v4);

}

@end
