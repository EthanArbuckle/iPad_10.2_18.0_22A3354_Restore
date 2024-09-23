@implementation CPSBannerSource

- (CPSBannerSource)initWithBundleIdentifier:(id)a3 delegate:(id)a4 applicationStateMonitor:(id)a5
{
  CPSBannerSource *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  BNBannerSource *v8;
  BNBannerSource *bannerKitSource;
  char v10;
  CPSBannerSource *v12;
  id v15;
  objc_super v16;
  id v17;
  id v18;
  id location[2];
  CPSBannerSource *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v5 = v20;
  v20 = 0;
  v16.receiver = v5;
  v16.super_class = (Class)CPSBannerSource;
  v20 = -[CPSBannerSource init](&v16, sel_init);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v18);
    objc_storeStrong((id *)&v20->_applicationStateMonitor, v17);
    -[CPSApplicationStateMonitor addApplicationStateObserver:](v20->_applicationStateMonitor, "addApplicationStateObserver:", v20);
    v6 = objc_msgSend(location[0], "copy");
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v6;

    v15 = CPSRequesterIdentifierForBundleIdentifier(v20->_bundleIdentifier);
    v8 = (BNBannerSource *)(id)objc_msgSend(MEMORY[0x24BE0BA20], "bannerSourceForDestination:forRequesterIdentifier:", 1, v15);
    bannerKitSource = v20->_bannerKitSource;
    v20->_bannerKitSource = v8;

    v10 = objc_msgSend(v17, "isApplicationActive");
    v20->_active = v10 & 1;
    objc_storeStrong(&v15, 0);
  }
  v12 = v20;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v12;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[CPSBannerSource _flushQueue](self, "_flushQueue");
  }
}

- (void)invalidate
{
  BNBannerSource *v2;

  v2 = -[CPSBannerSource bannerKitSource](self, "bannerKitSource");
  -[BNBannerSource invalidate](v2, "invalidate");

}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSBannerSource *v11;
  BOOL v12;
  BOOL v13;
  id location[2];
  CPSBannerSource *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __59__CPSBannerSource_applicationStateMonitor_didBecomeActive___block_invoke;
  v10 = &unk_24E26FF88;
  v11 = v15;
  v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __59__CPSBannerSource_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (void)postBannerForManeuver:(id)a3 travelEstimates:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  CPSBannerSource *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSBannerSource *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__CPSBannerSource_postBannerForManeuver_travelEstimates___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = v14;
  v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSBannerSource_postBannerForManeuver_travelEstimates___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  CPSBannerItem *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  char v25;
  id location;
  CPSBannerItem *v27;
  char v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  id v38[3];
  uint8_t v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v38[2] = a1;
  v38[1] = a1;
  v24 = (id)objc_msgSend(a1[4], "applicationStateMonitor");
  v25 = objc_msgSend(v24, "isApplicationActive");

  if ((v25 & 1) == 0)
  {
    v22 = (id)objc_msgSend(a1[5], "distanceRemaining");
    v36 = 0;
    v34 = 0;
    if (v22)
    {
      v21 = v22;
    }
    else
    {
      v37 = (id)objc_msgSend(a1[6], "initialTravelEstimates");
      v36 = 1;
      v35 = (id)objc_msgSend(v37, "distanceRemaining");
      v34 = 1;
      v21 = v35;
    }
    v38[0] = v21;
    if ((v34 & 1) != 0)

    if ((v36 & 1) != 0)
    v33 = 0;
    v32 = 0;
    v31 = 0;
    v20 = (id)objc_msgSend(a1[6], "notificationAttributedInstructionVariants");

    if (v20)
    {
      v1 = (id)objc_msgSend(a1[6], "notificationAttributedInstructionVariants");
      v2 = v31;
      v31 = v1;

    }
    else
    {
      v19 = (id)objc_msgSend(a1[6], "notificationInstructionVariants");

      if (v19)
      {
        v3 = (id)objc_msgSend(a1[6], "notificationInstructionVariants");
        v4 = v32;
        v32 = v3;

      }
      else
      {
        v18 = (id)objc_msgSend(a1[6], "attributedInstructionVariants");

        if (v18)
        {
          v5 = (id)objc_msgSend(a1[6], "attributedInstructionVariants");
          v6 = v31;
          v31 = v5;
        }
        else
        {
          v7 = (id)objc_msgSend(a1[6], "instructionVariants");
          v6 = v32;
          v32 = v7;
        }

      }
    }
    if (v38[0])
    {
      v16 = (void *)MEMORY[0x24BDBCE30];
      v17 = CPSFormattedDistanceWithMediumUnit(v38[0]);
      v8 = (id)objc_msgSend(v16, "arrayWithObjects:", 0);
      v9 = v33;
      v33 = v8;

    }
    v15 = (id)objc_msgSend(a1[6], "notificationSymbolImageSet");
    v28 = 0;
    if (v15)
    {
      v14 = v15;
    }
    else
    {
      v29 = (id)objc_msgSend(a1[6], "symbolSet");
      v28 = 1;
      v14 = v29;
    }
    v30 = v14;
    if ((v28 & 1) != 0)

    v11 = [CPSBannerItem alloc];
    v13 = (id)objc_msgSend(a1[6], "identifier");
    v12 = (id)objc_msgSend(a1[4], "bundleIdentifier");
    LOBYTE(v10) = 1;
    v27 = -[CPSBannerItem initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:](v11, "initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:", v13, v10);

    location = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v39, (uint64_t)a1[6]);
      _os_log_impl(&dword_21E389000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Enqueuing #banner item for maneuver: %{public}@", v39, 0xCu);
    }
    objc_storeStrong(&location, 0);
    objc_msgSend(a1[4], "_enqueueBannerItem:", v27);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(v38, 0);
  }
}

- (void)postBannerForNavigationAlert:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  CPSBannerSource *v10;
  id location[2];
  CPSBannerSource *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__CPSBannerSource_postBannerForNavigationAlert___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__CPSBannerSource_postBannerForNavigationAlert___block_invoke(id *a1)
{
  uint64_t v1;
  CPSBannerItem *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location;
  id v10[3];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10[2] = a1;
  v10[1] = a1;
  v3 = [CPSBannerItem alloc];
  v8 = (id)objc_msgSend(a1[4], "identifier");
  v7 = (id)objc_msgSend(a1[5], "bundleIdentifier");
  v6 = (id)objc_msgSend(a1[4], "titleVariants");
  v5 = (id)objc_msgSend(a1[4], "subtitleVariants");
  v4 = (id)objc_msgSend(a1[4], "imageSet");
  LOBYTE(v1) = 0;
  v10[0] = -[CPSBannerItem initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:](v3, "initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:", v8, v7, v6, v5, 0, v1);

  location = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v11, (uint64_t)a1[4]);
    _os_log_impl(&dword_21E389000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Enqueuing #banner item for navigation alert: %{public}@", v11, 0xCu);
  }
  objc_storeStrong(&location, 0);
  objc_msgSend(a1[5], "_enqueueBannerItem:", v10[0]);
  objc_storeStrong(v10, 0);
}

- (void)bannerViewController:(id)a3 requestsDismissalWithReason:(id)a4
{
  CPSBannerViewController *v4;
  BOOL v6;
  id v7;
  id location[2];
  CPSBannerSource *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v4 = -[CPSBannerSource presentedBannerViewController](v9, "presentedBannerViewController");
  v6 = v4 != location[0];

  if (!v6)
    -[CPSBannerSource _revokePresentedBannerWithReason:](v9, "_revokePresentedBannerWithReason:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerTappedWithIdentifier:(id)a3
{
  CPBannerDelegate *v3;
  CPBannerDelegate *v4;
  char v5;
  id location[2];
  CPSBannerSource *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSBannerSource delegate](v7, "delegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBannerSource delegate](v7, "delegate");
    -[CPBannerDelegate bannerTappedWithIdentifier:](v3, "bannerTappedWithIdentifier:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerDidAppearWithIdentifier:(id)a3
{
  CPBannerDelegate *v3;
  CPSBannerSource *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSBannerItem *v9;
  CPSBannerViewController *v10;
  BOOL v11;
  CPBannerDelegate *v12;
  char v13;
  id location[2];
  CPSBannerSource *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = -[CPSBannerSource delegate](v15, "delegate");
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v10 = -[CPSBannerSource presentedBannerViewController](v15, "presentedBannerViewController");
    v9 = -[CPSBannerViewController bannerItem](v10, "bannerItem");
    v11 = -[CPSBannerItem isManeuverItem](v9, "isManeuverItem");

    if (v11)
    {
      v4 = v15;
      v8 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("maps:/car/instrumentcluster/instructioncard"));
      v16[0] = v8;
      v7 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("maps:/car/instrumentcluster/map"));
      v16[1] = v7;
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("maps:/car/instrumentcluster"));
      v16[2] = v6;
      v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
      -[CPSBannerSource sendSuggestUI:](v4, "sendSuggestUI:");

    }
    v3 = -[CPSBannerSource delegate](v15, "delegate");
    -[CPBannerDelegate bannerDidAppearWithIdentifier:](v3, "bannerDidAppearWithIdentifier:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerDidDisappearWithIdentifier:(id)a3
{
  CPBannerDelegate *v3;
  CPBannerDelegate *v4;
  char v5;
  NSString *v6;
  CPSBannerItem *v7;
  CPSBannerViewController *v8;
  CPSBannerSource *v9;
  id v10;
  id v11;
  id v12;
  CPSBannerItem *v13;
  CPSBannerViewController *v14;
  BOOL v15;
  NSUUID *v16;
  CPSBannerItem *v17;
  CPSBannerViewController *v18;
  char v19;
  id v20;
  id location[2];
  CPSBannerSource *v22;
  uint8_t v23[24];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = -[CPSBannerSource presentedBannerViewController](v22, "presentedBannerViewController");
  v17 = -[CPSBannerViewController bannerItem](v18, "bannerItem");
  v16 = -[CPSBannerItem identifier](v17, "identifier");
  v19 = -[NSUUID isEqual:](v16, "isEqual:", location[0]);

  if ((v19 & 1) != 0)
  {
    v14 = -[CPSBannerSource presentedBannerViewController](v22, "presentedBannerViewController");
    v13 = -[CPSBannerViewController bannerItem](v14, "bannerItem");
    v15 = -[CPSBannerItem isManeuverItem](v13, "isManeuverItem");

    if (v15)
    {
      v9 = v22;
      v12 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("maps:/car/instrumentcluster/map"));
      v24[0] = v12;
      v11 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("maps:/car/instrumentcluster"));
      v24[1] = v11;
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
      -[CPSBannerSource sendSuggestUI:](v9, "sendSuggestUI:");

    }
    v20 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[CPSBannerSource presentedBannerViewController](v22, "presentedBannerViewController");
      v7 = -[CPSBannerViewController bannerItem](v8, "bannerItem");
      v6 = -[CPSBannerItem bundleIdentifier](v7, "bundleIdentifier");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v23, (uint64_t)v6, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%{public}@ #banner item (%{public}@) did disappear", v23, 0x16u);

    }
    objc_storeStrong(&v20, 0);
    -[CPSBannerSource setPresentedBannerViewController:](v22, "setPresentedBannerViewController:", 0);
  }
  v4 = -[CPSBannerSource delegate](v22, "delegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBannerSource delegate](v22, "delegate");
    -[CPBannerDelegate bannerDidDisappearWithIdentifier:](v3, "bannerDidDisappearWithIdentifier:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)sendSuggestUI:(id)a3
{
  CPBannerDelegate *v3;
  CPBannerDelegate *v4;
  char v5;
  id location[2];
  CPSBannerSource *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSBannerSource delegate](v7, "delegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBannerSource delegate](v7, "delegate");
    -[CPBannerDelegate sendSuggestUI:](v3, "sendSuggestUI:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)_setBannerRateLimitEnabled:(BOOL)a3 bundleIdentifier:(id)a4
{
  dispatch_time_t when;
  NSObject *queue;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CPSBannerSource *v12;
  id v13;
  os_log_type_t v14;
  id v15;
  os_log_type_t v16;
  id v17;
  int v18;
  id location;
  BOOL v20;
  SEL v21;
  CPSBannerSource *v22;
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v6 = v20;
  if (v6 == -[CPSBannerSource isRateLimited](v22, "isRateLimited"))
  {
    v18 = 1;
  }
  else
  {
    -[CPSBannerSource setRateLimited:](v22, "setRateLimited:", v20);
    if (v20)
    {
      v15 = CarPlaySupportGeneralLogging();
      v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)location);
        _os_log_impl(&dword_21E389000, (os_log_t)v15, v14, "%{public}@ #banner rate limit enabled", v23, 0xCu);
      }
      objc_storeStrong(&v15, 0);
      when = dispatch_time(0, 1000000000);
      queue = MEMORY[0x24BDAC9B8];
      v7 = MEMORY[0x24BDAC760];
      v8 = -1073741824;
      v9 = 0;
      v10 = __63__CPSBannerSource__setBannerRateLimitEnabled_bundleIdentifier___block_invoke;
      v11 = &unk_24E26EF28;
      v12 = v22;
      v13 = location;
      dispatch_after(when, queue, &v7);

      objc_storeStrong(&v13, 0);
      objc_storeStrong((id *)&v12, 0);
    }
    else
    {
      v17 = CarPlaySupportGeneralLogging();
      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v24, (uint64_t)location);
        _os_log_impl(&dword_21E389000, (os_log_t)v17, v16, "%{public}@ #banner rate limit disabled", v24, 0xCu);
      }
      objc_storeStrong(&v17, 0);
    }
    v18 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __63__CPSBannerSource__setBannerRateLimitEnabled_bundleIdentifier___block_invoke(uint64_t a1)
{
  os_log_t oslog[3];
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  objc_msgSend(*(id *)(a1 + 32), "_setBannerRateLimitEnabled:bundleIdentifier:", 0, *(_QWORD *)(a1 + 40));
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v3, *(_QWORD *)(a1 + 40));
    _os_log_impl(&dword_21E389000, oslog[0], OS_LOG_TYPE_DEFAULT, "%{public}@ #banner rate limit disabled", v3, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)_enqueueBannerItem:(id)a3
{
  CPSBannerSource *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSUUID *v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CPSBannerViewController *v16;
  CPSBannerSource *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CPSBannerItem *v22;
  CPSBannerViewController *v23;
  id v24;
  id v25;
  char v26;
  CPSBannerViewController *v27;
  id v28;
  id v29;
  CPSApplicationStateMonitor *v30;
  BOOL v31;
  os_log_t v32;
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t v38;
  int v39;
  os_log_type_t v40;
  os_log_t oslog;
  id v42;
  char v43;
  os_log_type_t v44;
  id v45;
  id location[2];
  CPSBannerSource *v47;
  uint8_t v48[32];
  uint8_t v49[32];
  uint8_t v50[32];
  uint8_t v51[32];
  uint8_t v52[32];
  uint8_t v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = -[CPSBannerSource applicationStateMonitor](v47, "applicationStateMonitor");
  v31 = -[CPSApplicationStateMonitor isApplicationActive](v30, "isApplicationActive");

  if (v31)
  {
    v45 = CarPlaySupportGeneralLogging();
    v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (id)objc_msgSend(location[0], "bundleIdentifier");
      v28 = (id)objc_msgSend(location[0], "identifier");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v53, (uint64_t)v29, (uint64_t)v28);
      _os_log_impl(&dword_21E389000, (os_log_t)v45, v44, "%{public}@ is frontmost, not enqueuing #banner item (%{public}@)", v53, 0x16u);

    }
    objc_storeStrong(&v45, 0);
LABEL_29:
    v39 = 0;
    goto LABEL_30;
  }
  v43 = 1;
  v27 = -[CPSBannerSource presentedBannerViewController](v47, "presentedBannerViewController");

  if (!v27)
  {
LABEL_19:
    v10 = (id)objc_msgSend(location[0], "identifier");
    v9 = -[CPSBannerSource lastUserDismissedIdentifier](v47, "lastUserDismissedIdentifier");
    v11 = objc_msgSend(v10, "isEqual:");

    if ((v11 & 1) != 0)
      v43 = 0;
    if ((v43 & 1) != 0)
    {
      if (-[CPSBannerSource isRateLimited](v47, "isRateLimited"))
      {
        v34 = (os_log_t)CarPlaySupportGeneralLogging();
        v33 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (id)objc_msgSend(location[0], "bundleIdentifier");
          v7 = (id)objc_msgSend(location[0], "identifier");
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v49, (uint64_t)v8, (uint64_t)v7);
          _os_log_impl(&dword_21E389000, v34, v33, "%{public}@ is background but rate limited, not enqueuing #banner item (%{public}@)", v49, 0x16u);

        }
        objc_storeStrong((id *)&v34, 0);
      }
      else
      {
        v32 = (os_log_t)CarPlaySupportGeneralLogging();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v6 = (id)objc_msgSend(location[0], "bundleIdentifier");
          v5 = (id)objc_msgSend(location[0], "identifier");
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v48, (uint64_t)v6, (uint64_t)v5);
          _os_log_impl(&dword_21E389000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ is not frontmost, enqueuing #banner item (%{public}@)", v48, 0x16u);

        }
        objc_storeStrong((id *)&v32, 0);
        -[CPSBannerSource _postBannerRequestForBannerItem:](v47, "_postBannerRequestForBannerItem:", location[0]);
        v3 = v47;
        v4 = (id)objc_msgSend(location[0], "bundleIdentifier");
        -[CPSBannerSource _setBannerRateLimitEnabled:bundleIdentifier:](v3, "_setBannerRateLimitEnabled:bundleIdentifier:", 1);

      }
    }
    goto LABEL_29;
  }
  v21 = (void *)objc_opt_class();
  v23 = -[CPSBannerSource presentedBannerViewController](v47, "presentedBannerViewController");
  v22 = -[CPSBannerViewController bannerItem](v23, "bannerItem");
  v42 = CPSSafeCast_24(v21, v22);

  v25 = (id)objc_msgSend(v42, "identifier");
  v24 = (id)objc_msgSend(location[0], "identifier");
  v26 = objc_msgSend(v25, "isEqual:");

  if ((v26 & 1) == 0)
  {
    v36 = (os_log_t)CarPlaySupportGeneralLogging();
    v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (id)objc_msgSend(location[0], "bundleIdentifier");
      v12 = (id)objc_msgSend(v42, "identifier");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v50, (uint64_t)v13, (uint64_t)v12);
      _os_log_impl(&dword_21E389000, v36, v35, "%{public}@ is background, revoking presented #banner (%{public}@)", v50, 0x16u);

    }
    objc_storeStrong((id *)&v36, 0);
    -[CPSBannerSource _revokePresentedBannerWithReason:](v47, "_revokePresentedBannerWithReason:", CFSTR("BannerReplaced"));
    goto LABEL_17;
  }
  if (!-[CPSBannerSource isRateLimited](v47, "isRateLimited"))
  {
    v43 = 0;
    v16 = -[CPSBannerSource presentedBannerViewController](v47, "presentedBannerViewController");
    -[CPSBannerViewController updateBannerWithBannerItem:](v16, "updateBannerWithBannerItem:", location[0]);

    v17 = v47;
    v18 = (id)objc_msgSend(location[0], "bundleIdentifier");
    -[CPSBannerSource _setBannerRateLimitEnabled:bundleIdentifier:](v17, "_setBannerRateLimitEnabled:bundleIdentifier:", 1);

    -[CPSBannerSource _resetDismissTimer](v47, "_resetDismissTimer");
    v38 = (os_log_t)CarPlaySupportGeneralLogging();
    v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (id)objc_msgSend(location[0], "bundleIdentifier");
      v14 = (id)objc_msgSend(location[0], "identifier");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v51, (uint64_t)v15, (uint64_t)v14);
      _os_log_impl(&dword_21E389000, v38, v37, "%{public}@ is background, #banner item (%{public}@)is being updated", v51, 0x16u);

    }
    objc_storeStrong((id *)&v38, 0);
LABEL_17:
    v39 = 0;
    goto LABEL_18;
  }
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (id)objc_msgSend(location[0], "bundleIdentifier");
    v19 = (id)objc_msgSend(location[0], "identifier");
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v52, (uint64_t)v20, (uint64_t)v19);
    _os_log_impl(&dword_21E389000, oslog, v40, "%{public}@ is background but rate limited, not updating #banner item (%{public}@)", v52, 0x16u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v39 = 1;
LABEL_18:
  objc_storeStrong(&v42, 0);
  if (!v39)
    goto LABEL_19;
LABEL_30:
  objc_storeStrong(location, 0);
}

- (void)_postBannerRequestForBannerItem:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  BNBannerSource *v11;
  char v12;
  id v13;
  BNBannerSource *v14;
  os_log_t v15;
  os_log_type_t v16;
  os_log_t oslog;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21[3];
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  CPSBannerSource *v31;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  v14 = -[CPSBannerSource bannerKitSource](v31, "bannerKitSource");
  v27 = 0;
  v13 = (id)-[BNBannerSource layoutDescriptionWithError:](v14, "layoutDescriptionWithError:", &v27);
  objc_storeStrong(&v29, v27);
  v28 = v13;

  if (v28)
  {
    v26 = -[CPSBannerViewController initWithBannerItem:]([CPSBannerViewController alloc], "initWithBannerItem:", location[0]);
    objc_msgSend(v26, "setDelegate:", v31);
    objc_msgSend(v28, "presentationSize");
    v22 = v3;
    v23 = v4;
    objc_msgSend(v28, "containerSize");
    v21[1] = v5;
    v21[2] = v6;
    objc_msgSend(v26, "preferredContentSizeWithPresentationSize:containerSize:", v22, v23, *(double *)&v5, *(double *)&v6);
    v24 = v7;
    v25 = v8;
    objc_msgSend(v26, "setPreferredContentSize:", v7, v8);
    -[CPSBannerSource setPresentedBannerViewController:](v31, "setPresentedBannerViewController:", v26);
    v21[0] = 0;
    v11 = -[CPSBannerSource bannerKitSource](v31, "bannerKitSource");
    v20 = 0;
    v12 = -[BNBannerSource postPresentable:options:userInfo:error:](v11, "postPresentable:options:userInfo:error:", v26, 1, 0, &v20);
    objc_storeStrong(v21, v20);

    if ((v12 & 1) != 0)
    {
      v19 = CarPlaySupportGeneralLogging();
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (id)objc_msgSend(location[0], "bundleIdentifier");
        v9 = (id)objc_msgSend(location[0], "identifier");
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v34, (uint64_t)v10, (uint64_t)v9);
        _os_log_impl(&dword_21E389000, (os_log_t)v19, v18, "%{public}@ Posted request for #banner item (%{public}@)", v34, 0x16u);

      }
      objc_storeStrong(&v19, 0);
      -[CPSBannerSource _resetDismissTimer](v31, "_resetDismissTimer");
    }
    else
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v33, (uint64_t)v21[0]);
        _os_log_error_impl(&dword_21E389000, oslog, v16, "Error attempting to post request for #banner item: %{public}@", v33, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(v21, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v15 = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v32, (uint64_t)v29);
      _os_log_error_impl(&dword_21E389000, v15, OS_LOG_TYPE_ERROR, "Error requesting layout description from #banner source: %{public}@", v32, 0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_revokePresentedBannerWithReason:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  BNBannerSource *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t oslog;
  os_log_type_t v15;
  id v16[2];
  os_log_type_t v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  CPSBannerSource *v22;
  uint8_t v23[16];
  uint8_t v24[32];
  uint8_t v25[40];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  v19 = -[CPSBannerSource presentedBannerViewController](v22, "presentedBannerViewController");
  v18 = CarPlaySupportGeneralLogging();
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (id)objc_msgSend(v19, "bannerItem");
    v12 = (id)objc_msgSend(v13, "bundleIdentifier");
    v11 = (id)objc_msgSend(v19, "bannerItem");
    v10 = (id)objc_msgSend(v11, "identifier");
    __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v25, (uint64_t)v12, (uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v18, v17, "%{public}@ Revoking presentable for #banner item (%{public}@) with reason: %{public}@", v25, 0x20u);

  }
  objc_storeStrong(&v18, 0);
  v8 = -[CPSBannerSource bannerKitSource](v22, "bannerKitSource");
  v7 = (id)objc_msgSend(v19, "requestIdentifier");
  v16[1] = 0;
  v9 = -[BNBannerSource revokePresentableWithRequestIdentifier:animated:reason:userInfo:error:](v8, "revokePresentableWithRequestIdentifier:animated:reason:userInfo:error:");
  objc_storeStrong(&v20, 0);

  if ((v9 & 1) != 0)
  {
    v16[0] = CarPlaySupportGeneralLogging();
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16[0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (id)objc_msgSend(v19, "bannerItem");
      v5 = (id)objc_msgSend(v6, "bundleIdentifier");
      v4 = (id)objc_msgSend(v19, "bannerItem");
      v3 = (id)objc_msgSend(v4, "identifier");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v24, (uint64_t)v5, (uint64_t)v3);
      _os_log_impl(&dword_21E389000, (os_log_t)v16[0], v15, "%{public}@ Revoked presentable for #banner item (%{public}@)", v24, 0x16u);

    }
    objc_storeStrong(v16, 0);
  }
  else
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v20);
      _os_log_error_impl(&dword_21E389000, oslog, OS_LOG_TYPE_ERROR, "Error attempting to revoke presentable for #banner item: %{public}@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_flushQueue
{
  NSObject *v2;
  os_log_type_t v3;
  BNBannerSource *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  uint8_t v9[7];
  os_log_type_t v10;
  id v11;
  id v12;
  id v13;
  uint8_t v14[7];
  char v15;
  id location[2];
  CPSBannerSource *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v15 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_debug_impl(&dword_21E389000, log, type, "Flushing banner queue", v14, 2u);
  }
  objc_storeStrong(location, 0);
  v13 = 0;
  v4 = -[CPSBannerSource bannerKitSource](v17, "bannerKitSource");
  v12 = 0;
  v5 = (id)-[BNBannerSource revokeAllPresentablesWithReason:userInfo:error:](v4, "revokeAllPresentablesWithReason:userInfo:error:", CFSTR("FlushQueue"), 0, &v12);
  objc_storeStrong(&v13, v12);

  if (v5)
  {
    v11 = CarPlaySupportGeneralLogging();
    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      v2 = v11;
      v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_impl(&dword_21E389000, v2, v3, "Flushed #banner source", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v8 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v18, (uint64_t)v13);
      _os_log_error_impl(&dword_21E389000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "Error flushing #banner source: %{public}@", v18, 0xCu);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(&v13, 0);
}

- (void)_resetDismissTimer
{
  NSTimer *v2;
  id v3;

  v2 = -[CPSBannerSource dimissTimer](self, "dimissTimer");
  -[NSTimer invalidate](v2, "invalidate");

  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__dismissTimerFired_, 0, 0, 10.0);
  -[CPSBannerSource setDimissTimer:](self, "setDimissTimer:");

}

- (void)_dismissTimerFired:(id)a3
{
  CPSBannerViewController *v3;
  id location[2];
  CPSBannerSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSBannerSource presentedBannerViewController](v5, "presentedBannerViewController");

  if (v3)
    -[CPSBannerSource _revokePresentedBannerWithReason:](v5, "_revokePresentedBannerWithReason:", CFSTR("BannerExpired"));
  objc_storeStrong(location, 0);
}

- (void)_resetLastUserDismissedIdentifierTimer
{
  NSTimer *v2;
  id v3;

  v2 = -[CPSBannerSource lastUserDismissedIdentifierResetTimer](self, "lastUserDismissedIdentifierResetTimer");
  -[NSTimer invalidate](v2, "invalidate");

  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__resetLastUserDismissedIdentifierTimerFired_, 0, 0, 30.0);
  -[CPSBannerSource setLastUserDismissedIdentifierResetTimer:](self, "setLastUserDismissedIdentifierResetTimer:");

}

- (void)_resetLastUserDismissedIdentifierTimerFired:(id)a3
{
  id location[2];
  CPSBannerSource *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSBannerSource setLastUserDismissedIdentifier:](v4, "setLastUserDismissedIdentifier:", 0);
  objc_storeStrong(location, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CPBannerDelegate)delegate
{
  return (CPBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (BNBannerSource)bannerKitSource
{
  return self->_bannerKitSource;
}

- (void)setBannerKitSource:(id)a3
{
  objc_storeStrong((id *)&self->_bannerKitSource, a3);
}

- (CPSBannerViewController)presentedBannerViewController
{
  return self->_presentedBannerViewController;
}

- (void)setPresentedBannerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedBannerViewController, a3);
}

- (NSTimer)dimissTimer
{
  return self->_dimissTimer;
}

- (void)setDimissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dimissTimer, a3);
}

- (BOOL)isRateLimited
{
  return self->_rateLimited;
}

- (void)setRateLimited:(BOOL)a3
{
  self->_rateLimited = a3;
}

- (NSUUID)lastUserDismissedIdentifier
{
  return self->_lastUserDismissedIdentifier;
}

- (void)setLastUserDismissedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserDismissedIdentifier, a3);
}

- (NSTimer)lastUserDismissedIdentifierResetTimer
{
  return self->_lastUserDismissedIdentifierResetTimer;
}

- (void)setLastUserDismissedIdentifierResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserDismissedIdentifierResetTimer, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserDismissedIdentifierResetTimer, 0);
  objc_storeStrong((id *)&self->_lastUserDismissedIdentifier, 0);
  objc_storeStrong((id *)&self->_dimissTimer, 0);
  objc_storeStrong((id *)&self->_presentedBannerViewController, 0);
  objc_storeStrong((id *)&self->_bannerKitSource, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
