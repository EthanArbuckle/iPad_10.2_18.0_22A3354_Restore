@implementation CALNDefaultTriggeredEventNotificationMapItemURLProvider

+ (CALNDefaultTriggeredEventNotificationMapItemURLProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CALNDefaultTriggeredEventNotificationMapItemURLProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, block);
  return (CALNDefaultTriggeredEventNotificationMapItemURLProvider *)(id)sharedInstance_sharedInstance_9;
}

void __73__CALNDefaultTriggeredEventNotificationMapItemURLProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_9;
  sharedInstance_sharedInstance_9 = (uint64_t)v1;

}

- (id)mapItemURLForOptionalEventLocation:(id)a3 hypothesis:(id)a4
{
  id v5;
  id v6;
  void *v7;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend((id)objc_opt_class(), "_mapItemURLForEventLocation:hypothesis:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_mapItemURLForEventLocation:(id)a3 hypothesis:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "routing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapItemURLLaunchOptionsForHypothesis:routing:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mapKitHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoLocation");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x24BDDB0F0];
    v20[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_urlForMapItemHandles:options:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v11)
    {
      v15 = 0;
      goto LABEL_6;
    }
    objc_msgSend(a1, "_eventLocationFromStructuredLocation:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_mapItemNameFromEventLocation:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDDB0F0];
    objc_msgSend(v6, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_urlForLocation:address:label:options:", v12, v18, v16, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:

  return v15;
}

+ (id)_eventLocationFromStructuredLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    v6 = v5;

    v4 = v6;
  }

  return v4;
}

+ (id)_mapItemNameFromEventLocation:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
}

+ (id)_mapItemURLLaunchOptionsForHypothesis:(id)a3 routing:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_directionsModeForHypothesis:routing:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapItemURLLaunchOptionsForDirectionsMode:isFromTimeToLeaveNotification:", v6, a3 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_mapItemURLLaunchOptionsForDirectionsMode:(id)a3 isFromTimeToLeaveNotification:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDDAF58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDDB208]);

  return v7;
}

+ (id)_directionsModeForHypothesis:(id)a3 routing:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (id)*MEMORY[0x24BDDAF48];
  if (v6)
  {
    objc_msgSend(a1, "_directionsModeForTransportType:", objc_msgSend(v6, "transportType"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;

    v8 = v10;
    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(a1, "_directionsModeForRouting:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

+ (id)_directionsModeForTransportType:(int)a3
{
  id v4;
  id v5;

  v4 = (id)*MEMORY[0x24BDDAF48];
  if (a3 <= 3)
  {
    v5 = **((id **)&unk_24D484EF0 + a3);

    v4 = v5;
  }
  return v4;
}

+ (id)_directionsModeForRouting:(id)a3
{
  return (id)objc_msgSend(a1, "_directionsModeForLocationRoutingMode:", objc_msgSend(MEMORY[0x24BE13FB8], "routingModeEnumForCalRouteType:", a3));
}

+ (id)_directionsModeForLocationRoutingMode:(int64_t)a3
{
  id v4;
  id v5;

  v4 = (id)*MEMORY[0x24BDDAF48];
  if ((unint64_t)(a3 - 1) <= 3)
  {
    v5 = **((id **)&unk_24D484F10 + a3 - 1);

    v4 = v5;
  }
  return v4;
}

@end
