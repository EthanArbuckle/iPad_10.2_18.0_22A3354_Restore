@implementation CALNDefaultTravelAdvisoryAuthority

+ (CALNDefaultTravelAdvisoryAuthority)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CALNDefaultTravelAdvisoryAuthority_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (CALNDefaultTravelAdvisoryAuthority *)(id)sharedInstance_sharedInstance_0;
}

void __52__CALNDefaultTravelAdvisoryAuthority_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (double)minimumAllowableTravelTime
{
  double result;

  objc_msgSend(MEMORY[0x24BDC7568], "minimumAllowableTravelTime");
  return result;
}

- (double)maximumAllowableTravelTime
{
  double result;

  objc_msgSend(MEMORY[0x24BDC7568], "maximumAllowableTravelTime");
  return result;
}

- (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BE14870];
  v5 = a3;
  -[CALNDefaultTravelAdvisoryAuthority minimumAllowableTravelTime](self, "minimumAllowableTravelTime");
  LOBYTE(self) = objc_msgSend(v4, "doesHypothesisSatisfyMinimumAllowableTravelTime:minimumAllowableTravelTime:", v5);

  return (char)self;
}

- (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3
{
  return objc_msgSend(MEMORY[0x24BDC7568], "travelStateIndicatesTravelingTowardDestination:", a3);
}

@end
