@implementation PUPhotosGenerativeStoryFactory

+ (id)makePhotosGenerativeStoryGMCentralizedFeedbackAlertControllerWith:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)static PhotosGenerativeStoryFactory.makePhotosGenerativeStoryGMCentralizedFeedbackAlertController(with:)(v3);

  return v4;
}

+ (id)makePhotosGenerativeStoryToastFeedbackBannerViewWithMemory:(id)a3 fromParentViewController:(id)a4
{
  id v5;
  id v6;
  char *v7;

  v5 = a3;
  v6 = a4;
  v7 = static PhotosGenerativeStoryFactory.makePhotosGenerativeStoryToastFeedbackBannerView(with:parentViewController:)(v5, v6);

  return v7;
}

+ (id)makeCentralizedFeedbackActionPerformerWithParentViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = static PhotosGenerativeStoryFactory.makeCentralizedFeedbackActionPerformer(parentViewController:)(v3);

  return v4;
}

- (PUPhotosGenerativeStoryFactory)init
{
  return (PUPhotosGenerativeStoryFactory *)PhotosGenerativeStoryFactory.init()();
}

@end
