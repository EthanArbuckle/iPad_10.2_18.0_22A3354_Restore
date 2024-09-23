@implementation DYEAGLOverridingFunctionPlayer

- (void)setEngine:(id)a3
{
  id v4;
  DYGLExperimentResultsGenerator *v5;
  DYGLExperimentResultsGenerator *experimentResultsGenerator;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer setEngine:](&v7, "setEngine:", v4);
  v5 = (DYGLExperimentResultsGenerator *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "experimentResultsGenerator"));
  experimentResultsGenerator = self->_experimentResultsGenerator;
  self->_experimentResultsGenerator = v5;

}

- (void)executeGraphicsFunction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer executeGraphicsFunction](&v3, "executeGraphicsFunction");
  -[DYGLExperimentResultsGenerator onGraphicsFunctionEnd](self->_experimentResultsGenerator, "onGraphicsFunctionEnd");
}

- (void)executePlatformFunction
{
  uint64_t v3;
  objc_super v4;

  v3 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  if (*(_DWORD *)v3 == -12271)
  {
    DYHarvestRenderbuffer(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__ctxID], **(unsigned int **)(v3 + 72));
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)DYEAGLOverridingFunctionPlayer;
    -[DYEAGLFunctionPlayer executePlatformFunction](&v4, "executePlatformFunction");
  }
  -[DYGLExperimentResultsGenerator onPlatformFunctionEnd](self->_experimentResultsGenerator, "onPlatformFunctionEnd");
}

- (void)performNewFrameActions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer performNewFrameActions](&v3, "performNewFrameActions");
  -[DYGLExperimentResultsGenerator onFrameStart](self->_experimentResultsGenerator, "onFrameStart");
}

- (void)performPostDispatchFrameBoundaryActions
{
  objc_super v3;

  -[DYGLExperimentResultsGenerator onFrameEnd](self->_experimentResultsGenerator, "onFrameEnd");
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer performPostDispatchFrameBoundaryActions](&v3, "performPostDispatchFrameBoundaryActions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentResultsGenerator, 0);
}

@end
