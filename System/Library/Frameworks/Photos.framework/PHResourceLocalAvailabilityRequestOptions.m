@implementation PHResourceLocalAvailabilityRequestOptions

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, treatLivePhotoAsStill:%d, dontAllowRAW:%d, includeAllAssetResources:%d, includeOriginalResourcesOnly:%d>"), objc_opt_class(), self, self->_treatLivePhotoAsStill, self->_dontAllowRAW, self->_includeAllAssetResources, self->_includeOriginalResourcesOnly);
}

- (OS_dispatch_queue)resultHandlerQueue
{
  OS_dispatch_queue *resultHandlerQueue;
  OS_dispatch_queue *v3;
  id v4;

  resultHandlerQueue = self->_resultHandlerQueue;
  if (resultHandlerQueue)
  {
    v3 = resultHandlerQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (void)setTreatLivePhotoAsStill:(BOOL)a3
{
  self->_treatLivePhotoAsStill = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (BOOL)includeAllAssetResources
{
  return self->_includeAllAssetResources;
}

- (void)setIncludeAllAssetResources:(BOOL)a3
{
  self->_includeAllAssetResources = a3;
}

- (BOOL)includeOriginalResourcesOnly
{
  return self->_includeOriginalResourcesOnly;
}

- (void)setIncludeOriginalResourcesOnly:(BOOL)a3
{
  self->_includeOriginalResourcesOnly = a3;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (BOOL)allowMissingVideoComplement
{
  return self->_allowMissingVideoComplement;
}

- (void)setAllowMissingVideoComplement:(BOOL)a3
{
  self->_allowMissingVideoComplement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
}

@end
