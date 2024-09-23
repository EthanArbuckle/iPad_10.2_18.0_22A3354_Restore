@implementation MPModelRecentlyPlayedRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedItemProperties](MPModelForYouRecommendationGroupBuilder, "allSupportedItemProperties");
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedGroupProperties](MPModelForYouRecommendationGroupBuilder, "allSupportedGroupProperties");
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelRecentlyPlayedRequestOperation *v5;
  void *v6;
  MPModelRecentlyPlayedRequestOperation *v7;

  v4 = a3;
  v5 = [MPModelRecentlyPlayedRequestOperation alloc];
  v6 = (void *)-[MPModelRecentlyPlayedRequest copy](self, "copy");
  v7 = -[MPStoreModelRequestOperation initWithRequest:responseHandler:](v5, "initWithRequest:responseHandler:", v6, v4);

  return v7;
}

@end
