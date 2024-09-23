@implementation AMSBagPersistenceMetricsTracker

- (void).cxx_destruct
{
  swift_release();
}

+ (id)trackerForCachedValuesCallWithRequestedValueCount:(int64_t)a3 cachedValueCount:(int64_t)a4 cachedBagWasExpired:(BOOL)a5
{
  swift_getObjCClassMetadata();
  return static BagPersistenceMetricsTracker.trackerForCachedValuesCall(requestedValueCount:cachedValueCount:cachedBagWasExpired:)(a3, a4, a5);
}

- (AMSBagPersistenceMetricsTracker)init
{
  BagPersistenceMetricsTracker.init()();
}

+ (void)trackCachedValuesUnavailableWithRequestedValueCount:(int64_t)a3
{
  swift_getObjCClassMetadata();
  static BagPersistenceMetricsTracker.trackCachedValuesUnavailable(requestedValueCount:)(a3);
}

@end
