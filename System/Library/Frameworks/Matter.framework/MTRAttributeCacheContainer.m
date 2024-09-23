@implementation MTRAttributeCacheContainer

- (MTRAttributeCacheContainer)init
{
  MTRAttributeCacheContainer *v2;
  MTRClusterStateCacheContainer *v3;
  MTRClusterStateCacheContainer *realContainer;
  MTRAttributeCacheContainer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRAttributeCacheContainer;
  v2 = -[MTRAttributeCacheContainer init](&v7, sel_init);
  if (v2
    && (v3 = objc_alloc_init(MTRClusterStateCacheContainer),
        realContainer = v2->_realContainer,
        v2->_realContainer = v3,
        realContainer,
        !v2->_realContainer))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)readAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
  NSNumber *v12;
  NSNumber *v13;
  NSObject *v14;
  MTRDeviceResponseHandler v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSNumber *v20;

  v20 = endpointId;
  v12 = clusterId;
  v13 = attributeId;
  v14 = clientQueue;
  v15 = completion;
  objc_msgSend_realContainer(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_queue_completion_(v18, v19, (uint64_t)v20, v12, v13, v14, v15);

}

- (MTRClusterStateCacheContainer)realContainer
{
  return self->_realContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realContainer, 0);
}

@end
