@implementation GEOSharedNavETAInfo(MSPExtras)

- (uint64_t)mspDescription
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(a1, "waypointIndex");
  objc_msgSend(a1, "remainingTime");
  v5 = (int)(v4 / 60.0);
  objc_msgSend(a1, "remainingDistance");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("[%lu] remaining (%d min, %d km)"), v3, v5, (int)(v6 / 1000.0));
}

@end
