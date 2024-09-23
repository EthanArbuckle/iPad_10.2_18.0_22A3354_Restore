@implementation MPModelStoreBrowseResponse(NMSModelEditorialRecommendationsRequest)

- (id)nms_cachedLoadedOutput
{
  return objc_getAssociatedObject(a1, sel_nms_cachedLoadedOutput);
}

- (void)nms_setCachedLoadedOutput:()NMSModelEditorialRecommendationsRequest
{
  objc_setAssociatedObject(a1, sel_nms_cachedLoadedOutput, a3, (void *)1);
}

@end
