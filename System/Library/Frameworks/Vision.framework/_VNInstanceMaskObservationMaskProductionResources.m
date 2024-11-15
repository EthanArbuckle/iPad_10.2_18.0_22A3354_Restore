@implementation _VNInstanceMaskObservationMaskProductionResources

- (void)dealloc
{
  NSObject *completionSemaphore;
  objc_super v4;

  completionSemaphore = self->_completionSemaphore;
  if (completionSemaphore)
    dispatch_semaphore_signal(completionSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)_VNInstanceMaskObservationMaskProductionResources;
  -[_VNInstanceMaskObservationMaskProductionResources dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_semaphore)completionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 8, 1);
}

- (VNMetalContext)metalContext
{
  return (VNMetalContext *)objc_getProperty(self, a2, 16, 1);
}

- (VNBGRBilinearUpsampler)bilinearUpsampler
{
  return (VNBGRBilinearUpsampler *)objc_getProperty(self, a2, 24, 1);
}

- (MTLComputePipelineState)applyMaskComputeState
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 32, 1);
}

- (MTLComputePipelineState)cropCopyingComputeState
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropCopyingComputeState, 0);
  objc_storeStrong((id *)&self->_applyMaskComputeState, 0);
  objc_storeStrong((id *)&self->_bilinearUpsampler, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
}

@end
