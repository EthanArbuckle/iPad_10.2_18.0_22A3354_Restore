@implementation BWVisionInferenceContext

- (BWVisionInferenceContext)init
{
  BWVisionInferenceContext *v2;
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWVisionInferenceContext;
  v2 = -[BWVisionInferenceContext init](&v5, sel_init);
  if (v2)
  {
    do
      v3 = __ldaxr((unsigned int *)&numberOfOutstandingContexts);
    while (__stlxr(v3 + 1, (unsigned int *)&numberOfOutstandingContexts));
    if (!v3)
      BWVNSetRequestConcurrentTasksProcessingTimeout(4000000000);
  }
  return v2;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  unsigned int v3;
  unsigned int v4;
  objc_super v5;

  do
  {
    v3 = __ldaxr((unsigned int *)&numberOfOutstandingContexts);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, (unsigned int *)&numberOfOutstandingContexts));
  if (!v4)
  {
    objc_msgSend((id)getVNSequenceRequestHandlerClass(), "forcedCleanup");
    BWVNSetRequestConcurrentTasksProcessingTimeout(0);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWVisionInferenceContext;
  -[BWVisionInferenceContext dealloc](&v5, sel_dealloc);
}

- (BOOL)isPrepared
{
  return self->_sequenceRequestHandler != 0;
}

- (int)prepareForInference
{
  VNSequenceRequestHandler *v3;

  if (-[BWVisionInferenceContext isPrepared](self, "isPrepared"))
    return 0;
  v3 = (VNSequenceRequestHandler *)objc_alloc_init((Class)getVNSequenceRequestHandlerClass());
  self->_sequenceRequestHandler = v3;
  if (v3)
    return 0;
  else
    return -31702;
}

- (VNSequenceRequestHandler)sequenceRequestHandler
{
  return self->_sequenceRequestHandler;
}

@end
