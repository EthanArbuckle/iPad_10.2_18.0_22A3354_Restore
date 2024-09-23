@implementation BWEspressoInferenceContext

- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3 shareIntermediateBuffer:(BOOL)a4
{
  BWEspressoInferenceContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWEspressoInferenceContext;
  result = -[BWEspressoInferenceContext init](&v7, sel_init);
  if (result)
  {
    result->_executionTarget = a3;
    result->_shareIntermediateBuffer = a4;
  }
  return result;
}

- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3
{
  return -[BWEspressoInferenceContext initWithExecutionTarget:shareIntermediateBuffer:](self, "initWithExecutionTarget:shareIntermediateBuffer:", *(_QWORD *)&a3, 0);
}

- (int)prepareForInference
{
  unsigned int executionTarget;
  void *context;

  if (-[BWEspressoInferenceContext isPrepared](self, "isPrepared"))
    return 0;
  executionTarget = self->_executionTarget;
  if (executionTarget < 2 || executionTarget == 3)
  {
    context = (void *)espresso_create_context();
    self->_espressoContext = context;
  }
  else
  {
    context = self->_espressoContext;
  }
  if (context)
    return 0;
  else
    return -31702;
}

- (BOOL)isPrepared
{
  return self->_espressoContext != 0;
}

- (void)espressoContext
{
  return self->_espressoContext;
}

- (int)configureIntermediateBufferSharingForPlanPrebuild:(void *)a3
{
  int result;

  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  if (!self->_shareIntermediateBuffer || self->_executionTarget != 3 || !self->_rootIntermediateBufferPlan)
    return 0;
  result = espresso_plan_share_intermediate_buffer();
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
  return result;
}

- (int)configureIntermediateBufferSharingForPlanPostbuild:(void *)a3
{
  NSString *sharedBufferNetworksPath;

  if (self->_shareIntermediateBuffer && self->_executionTarget == 3 && !self->_rootIntermediateBufferPlan)
  {
    self->_rootIntermediateBufferPlan = a3;
    sharedBufferNetworksPath = self->_sharedBufferNetworksPath;
    if (sharedBufferNetworksPath)
    {
      -[NSString UTF8String](sharedBufferNetworksPath, "UTF8String");
      LODWORD(sharedBufferNetworksPath) = espresso_will_share_intermediate_buffer_with_existing_plan();
      if ((_DWORD)sharedBufferNetworksPath)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        LODWORD(sharedBufferNetworksPath) = -31702;
      }
    }
  }
  else
  {
    LODWORD(sharedBufferNetworksPath) = 0;
  }
  return (int)sharedBufferNetworksPath;
}

- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3
{
  NSString *sharedBufferNetworksPath;
  NSString *v6;
  int result;

  if (!self->_shareIntermediateBuffer || self->_executionTarget != 3)
    return 0;
  sharedBufferNetworksPath = self->_sharedBufferNetworksPath;
  if (!sharedBufferNetworksPath)
  {
LABEL_6:
    if (a3)
    {
      if (!self->_rootIntermediateBufferPlan
        || (objc_msgSend(a3, "UTF8String"), !espresso_will_share_intermediate_buffer_with_existing_plan()))
      {
        v6 = (NSString *)a3;
        result = 0;
        self->_sharedBufferNetworksPath = v6;
        return result;
      }
      goto LABEL_11;
    }
    return 0;
  }
  -[NSString UTF8String](sharedBufferNetworksPath, "UTF8String");
  if (!espresso_will_share_intermediate_buffer_with_existing_plan())
  {

    self->_sharedBufferNetworksPath = 0;
    goto LABEL_6;
  }
LABEL_11:
  fig_log_get_emitter();
  FigDebugAssert3();
  return -31702;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_espressoContext)
    espresso_context_destroy();

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceContext;
  -[BWEspressoInferenceContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> executionTarget %lu prepared %d"), objc_opt_class(), self, self->_executionTarget, -[BWEspressoInferenceContext isPrepared](self, "isPrepared"));
}

- (int)executionTarget
{
  return self->_executionTarget;
}

@end
