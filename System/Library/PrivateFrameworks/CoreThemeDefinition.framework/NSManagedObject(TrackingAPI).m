@implementation NSManagedObject(TrackingAPI)

+ (uint64_t)isTracked
{
  return objc_msgSend(a1, "instancesRespondToSelector:", sel_dateOfLastChange);
}

@end
