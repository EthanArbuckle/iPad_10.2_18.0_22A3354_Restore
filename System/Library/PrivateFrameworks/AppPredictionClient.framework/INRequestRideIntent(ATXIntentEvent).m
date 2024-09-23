@implementation INRequestRideIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "pickupLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  stringWithGeohash(objc_msgSend(v6, "atx_locationHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg1:", v7);

  objc_msgSend(a1, "dropOffLocation");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  stringWithGeohash(objc_msgSend(v8, "atx_locationHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg2:", v9);

}

@end
