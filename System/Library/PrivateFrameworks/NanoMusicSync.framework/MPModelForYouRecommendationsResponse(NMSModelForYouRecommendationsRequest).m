@implementation MPModelForYouRecommendationsResponse(NMSModelForYouRecommendationsRequest)

- (id)nms_cachedRecommendationsArray
{
  return objc_getAssociatedObject(a1, sel_nms_cachedRecommendationsArray);
}

- (void)nms_setCachedRecommendationsArray:()NMSModelForYouRecommendationsRequest
{
  objc_setAssociatedObject(a1, sel_nms_cachedRecommendationsArray, a3, (void *)1);
}

- (id)nms_cachedStoreItemMetadataResults
{
  return objc_getAssociatedObject(a1, sel_nms_cachedStoreItemMetadataResults);
}

- (void)nms_setCachedStoreItemMetadataResults:()NMSModelForYouRecommendationsRequest
{
  objc_setAssociatedObject(a1, sel_nms_cachedStoreItemMetadataResults, a3, (void *)1);
}

@end
