@implementation NMSModelEditorialRecommendationsRequest

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  NMSModelEditorialRecommendationsRequestOperation *v5;
  void *v6;
  NMSModelEditorialRecommendationsRequestOperation *v7;

  v4 = a3;
  v5 = [NMSModelEditorialRecommendationsRequestOperation alloc];
  v6 = (void *)-[NMSModelEditorialRecommendationsRequest copy](self, "copy");
  v7 = -[MPStoreModelRequestOperation initWithRequest:responseHandler:](v5, "initWithRequest:responseHandler:", v6, v4);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMSModelEditorialRecommendationsRequest;
  v4 = -[MPModelStoreBrowseRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 184) = self->_nms_useCachedDataOnly;
    objc_storeStrong(v4 + 24, self->_nms_cachedLoadedOutput);
  }
  return v5;
}

- (BOOL)nms_useCachedDataOnly
{
  return self->_nms_useCachedDataOnly;
}

- (void)setNms_useCachedDataOnly:(BOOL)a3
{
  self->_nms_useCachedDataOnly = a3;
}

- (id)nms_cachedLoadedOutput
{
  return self->_nms_cachedLoadedOutput;
}

- (void)setNms_cachedLoadedOutput:(id)a3
{
  objc_storeStrong(&self->_nms_cachedLoadedOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nms_cachedLoadedOutput, 0);
}

@end
