@implementation DYEAGLDebugPlaybackEngine

- (DYEAGLDebugPlaybackEngine)initWithCaptureStore:(id)a3
{
  id v4;
  uint64_t v5;
  DYEAGLDebugPlaybackEngine *v6;
  uint64_t v7;
  NSMutableIndexSet *disabledFunctions;
  double v9;
  double v10;
  DYEAGLDebugPlaybackEngine *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DYEAGLDebugPlaybackEngine;
  v6 = -[DYEAGLDebugPlaybackEngine initWithCaptureStore:](&v13, "initWithCaptureStore:", v4);
  if (v6)
  {
    v7 = objc_opt_new(NSMutableIndexSet, v5);
    disabledFunctions = v6->_disabledFunctions;
    v6->_disabledFunctions = (NSMutableIndexSet *)v7;

    LODWORD(v9) = 1.0;
    -[DYEAGLDebugPlaybackEngine setWireframeLineWidth:](v6, "setWireframeLineWidth:", v9);
    LODWORD(v10) = 1.0;
    -[DYEAGLDebugPlaybackEngine setTessellationWireframeLineWidth:](v6, "setTessellationWireframeLineWidth:", v10);
    -[DYEAGLDebugPlaybackEngine setWireframeLineColor:](v6, "setWireframeLineColor:", 16711935);
    v6->_enableDrawCallPresent = 1;
    -[DYEAGLDebugPlaybackEngine setEnableWireframePresent:](v6, "setEnableWireframePresent:", 1);
    v11 = v6;
  }

  return v6;
}

- (id)playbackOptions
{
  return 0;
}

- (DYEAGLDebugPlaybackEngineDelegate)strongDelegate
{
  return (DYEAGLDebugPlaybackEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)newFunctionPlayer
{
  DYEAGLDebugFunctionPlayer *v3;
  void *v4;
  DYEAGLDebugFunctionPlayer *v5;

  v3 = [DYEAGLDebugFunctionPlayer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine captureStore](self, "captureStore"));
  v5 = -[DYEAGLDebugFunctionPlayer initWithCaptureStore:](v3, "initWithCaptureStore:", v4);

  -[DYEAGLFunctionPlayer setLayerManager:](v5, "setLayerManager:", self);
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  uint64_t v3;
  char v5;
  id v6;
  id v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  v5 = objc_opt_respondsToSelector(v6, "performPlaybackLoopIterationPreCaptureActions:");

  if ((v5 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    objc_msgSend(v7, "performPlaybackLoopIterationPreCaptureActions:", v3);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    objc_msgSend(v8, "shouldReturn");

  }
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  uint64_t v3;
  char v5;
  id v6;
  id v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  v5 = objc_opt_respondsToSelector(v6, "performPlaybackLoopIterationPostCaptureActions:");

  if ((v5 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    objc_msgSend(v7, "performPlaybackLoopIterationPostCaptureActions:", v3);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    objc_msgSend(v8, "shouldReturn");

  }
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "shouldPerformPlaybackLoopIteration:");

  if ((v6 & 1) == 0)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  v8 = objc_msgSend(v7, "shouldPerformPlaybackLoopIteration:", v3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  v10 = objc_msgSend(v9, "shouldReturn");

  if ((v10 & 1) == 0)
    return 1;
  return v8;
}

- (NSMutableIndexSet)disabledFunctions
{
  return self->_disabledFunctions;
}

- (BOOL)enableDrawCallPresent
{
  return self->_enableDrawCallPresent;
}

- (void)setEnableDrawCallPresent:(BOOL)a3
{
  self->_enableDrawCallPresent = a3;
}

- (DYEAGLDebugPlaybackEngineDelegate)delegate
{
  return (DYEAGLDebugPlaybackEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unsigned)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(unsigned int)a3
{
  self->_playbackMode = a3;
}

- (unsigned)executedDrawCallCount
{
  return self->_executedDrawCallCount;
}

- (void)setExecutedDrawCallCount:(unsigned int)a3
{
  self->_executedDrawCallCount = a3;
}

- (unsigned)wireframeLineColor
{
  return self->_wireframeLineColor;
}

- (void)setWireframeLineColor:(unsigned int)a3
{
  self->_wireframeLineColor = a3;
}

- (float)wireframeLineWidth
{
  return self->_wireframeLineWidth;
}

- (void)setWireframeLineWidth:(float)a3
{
  self->_wireframeLineWidth = a3;
}

- (float)tessellationWireframeLineWidth
{
  return self->_tessellationWireframeLineWidth;
}

- (void)setTessellationWireframeLineWidth:(float)a3
{
  self->_tessellationWireframeLineWidth = a3;
}

- (BOOL)enableWireframePresent
{
  return self->_enableWireframePresent;
}

- (void)setEnableWireframePresent:(BOOL)a3
{
  self->_enableWireframePresent = a3;
}

- (BOOL)enableOutlinePresent
{
  return self->_enableOutlinePresent;
}

- (void)setEnableOutlinePresent:(BOOL)a3
{
  self->_enableOutlinePresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disabledFunctions, 0);
}

@end
