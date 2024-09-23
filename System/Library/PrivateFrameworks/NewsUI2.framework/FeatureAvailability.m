@implementation FeatureAvailability

- (BOOL)puzzlesEnabled
{
  unsigned __int8 v2;

  swift_retain();
  if ((sub_1D5FBAFA0() & 1) != 0)
    v2 = sub_1D5E8F1B8();
  else
    v2 = 0;
  swift_release();
  return v2 & 1;
}

- (BOOL)useOfflineMode
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D5F4F734);
}

- (_TtC16NewsSubscription26PaidBundleViaOfferSettings)paidBundleViaOfferAvailability
{
  id v2;
  void *v3;

  swift_retain();
  sub_1D5FBAF84();
  sub_1D5FBAEDC();
  sub_1D5FBAF30();
  sub_1D5FBAF68();
  sub_1D5FBAF14();
  sub_1D5FBAEF8();
  sub_1D5FBAF4C();
  sub_1D5FBAEC0();
  v2 = objc_allocWithZone((Class)sub_1D6E1BBFC());
  v3 = (void *)sub_1D6E1BBF0();
  swift_release();
  return (_TtC16NewsSubscription26PaidBundleViaOfferSettings *)v3;
}

- (BOOL)narrativeAudio
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D5F4F7BC);
}

- (void)addWithObserver:(id)a3
{
  sub_1D5E701B4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))FeatureAvailability.add(observer:));
}

- (BOOL)appleMagazineContent
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D5EAB8B4);
}

- (BOOL)interstellarEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277144);
}

- (BOOL)allowSharingAlways
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277538);
}

- (BOOL)useNewsArticleSearch
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277194);
}

- (BOOL)searchFeaturedStoriesEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277478);
}

- (BOOL)useFasterSearch
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277280);
}

- (BOOL)allowInAppMessages
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D627745C);
}

- (BOOL)useContinueReading
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D627736C);
}

- (BOOL)puzzlesGameCenterEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277730);
}

- (BOOL)sportsNativeAdsEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277714);
}

- (BOOL)allowCIPBestOffer
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D627774C);
}

- (BOOL)allowPaidBundleViaOffer
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277768);
}

- (BOOL)allowSIWAOnMac
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277784);
}

- (BOOL)useFineGrainedNewsletterManagement
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62777A0);
}

- (BOOL)improvedBlockingBehaviorEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D5E84F8C);
}

- (BOOL)useFeedDifferentiationMode
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277A14);
}

- (BOOL)useFeedDensityMode
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277A30);
}

- (BOOL)articleLinkBehaviorImprovementsEnabled
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D627788C);
}

- (BOOL)useNewReportConcern
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62775DC);
}

- (BOOL)useMoreToReadEOA
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62775F0);
}

- (BOOL)useMoreFromIssueEOA
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D627760C);
}

- (BOOL)useMultipleNativeAds
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277628);
}

- (BOOL)dimNonSubscriberContentOffline
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62779D0);
}

- (BOOL)enableSponsoredSuperfeeds
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62779BC);
}

- (BOOL)overrideSponsoredSuperfeedEligibility
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D62779EC);
}

- (BOOL)overrideSponsoredBannerBundleEligibility
{
  return sub_1D5F4F6C8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1D6277A00);
}

- (void)removeWithObserver:(id)a3
{
  sub_1D5E701B4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))FeatureAvailability.remove(observer:));
}

@end
