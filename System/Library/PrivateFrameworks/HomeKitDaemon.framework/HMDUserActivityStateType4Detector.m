@implementation HMDUserActivityStateType4Detector

- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3
{
  id v4;
  void *v5;
  HMDUserActivityStateType4Detector *v6;

  v4 = a3;
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDUserActivityStateType4Detector initWithDataSource:location:](self, "initWithDataSource:location:", v4, v5);

  return v6;
}

- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3 location:(id)a4
{
  id v7;
  HMDUserActivityStateType4Detector *v8;
  HMDUserActivityStateType4Detector *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDUserActivityStateType4Detector;
  v8 = -[HMDUserActivityStateDetector initWithDataSource:](&v11, sel_initWithDataSource_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a4);
    v9->_locationAuthorization = 0;
    v9->_state = 1;
  }

  return v9;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CLLocation *v10;
  CLLocation *homeLocation;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeLocationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  homeLocation = self->_homeLocation;
  self->_homeLocation = v10;

  -[HMDUserActivityStateType4Detector _registerForMessages](self, "_registerForMessages");
  -[HMDUserActivityStateType4Detector location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityStateType4Detector _handleLocationAuthorization:](self, "_handleLocationAuthorization:", objc_msgSend(v12, "locationAuthorized"));

  -[HMDUserActivityStateType4Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 1);
  v14 = _Block_copy(v4);

  v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    v13 = v14;
  }

}

- (void)registerForRegionUpdates
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityStateType4Detector region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HMDUserActivityStateType4Detector homeLocation](self, "homeLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x24BDBFA50]);
      objc_msgSend(v6, "coordinate");
      v9 = v8;
      v11 = v10;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v7, "initWithCenter:radius:identifier:nearbyAllowed:", v13, 0, v9, v11, 321869.0);
      -[HMDUserActivityStateType4Detector setRegion:](self, "setRegion:", v14);

      -[HMDUserActivityStateType4Detector region](self, "region");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNotifyOnExit:", 1);

      -[HMDUserActivityStateType4Detector region](self, "region");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNotifyOnEntry:", 1);

      -[HMDUserActivityStateType4Detector location](self, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserActivityStateType4Detector region](self, "region");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __61__HMDUserActivityStateType4Detector_registerForRegionUpdates__block_invoke;
      v20[3] = &unk_24E79BD80;
      v20[4] = self;
      objc_msgSend(v17, "registerForRegionUpdate:withDelegate:completionHandler:", v19, self, v20);

    }
  }

}

- (void)deregisterForRegionUpdates
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityStateType4Detector region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDUserActivityStateType4Detector location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__HMDUserActivityStateType4Detector_deregisterForRegionUpdates__block_invoke;
    v8[3] = &unk_24E79BD80;
    v8[4] = self;
    objc_msgSend(v6, "deregisterForRegionUpdate:completionHandler:", v7, v8);

    -[HMDUserActivityStateType4Detector setRegion:](self, "setRegion:", 0);
  }

}

- (void)_registerForMessages
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeLocationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleHomeLocationChangedNotification_, CFSTR("HMDLocationForHomeChanged"), v10);

}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  HMDUserActivityType4Report *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserActivityType4Report *v11;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = [HMDUserActivityType4Report alloc];
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserActivityType4Report initWithUser:state:withReason:](v7, "initWithUser:state:withReason:", v10, -[HMDUserActivityStateType4Detector state](self, "state"), a3);
  -[HMDUserActivityStateDetector setLatestReport:](self, "setLatestReport:", v11);

  -[HMDUserActivityStateDetector notifyDetectorStateChangedWithReason:](self, "notifyDetectorStateChangedWithReason:", a3);
}

- (unint64_t)_userType4StateFromRegionState:(int64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 != 2)
    v3 = 3;
  if (a3)
    return v3;
  else
    return 1;
}

- (void)_regionStateUpdated:(unint64_t)a3
{
  void *v5;
  NSObject *v6;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateType4Detector setState:](self, "setState:", a3);
  -[HMDUserActivityStateType4Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 11);
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDUserActivityStateType4Detector *v10;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__HMDUserActivityStateType4Detector__handleLocationAuthorizationChangedNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_handleLocationAuthorization:(int64_t)a3
{
  void *v5;
  NSObject *v6;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[HMDUserActivityStateType4Detector locationAuthorization](self, "locationAuthorization") != a3)
  {
    -[HMDUserActivityStateType4Detector setLocationAuthorization:](self, "setLocationAuthorization:", a3);
    if (a3 == 1)
    {
      -[HMDUserActivityStateType4Detector registerForRegionUpdates](self, "registerForRegionUpdates");
    }
    else if (a3 == 2)
    {
      -[HMDUserActivityStateType4Detector deregisterForRegionUpdates](self, "deregisterForRegionUpdates");
      -[HMDUserActivityStateType4Detector setState:](self, "setState:", 1);
      -[HMDUserActivityStateType4Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 4);
    }
  }
}

- (void)_handleHomeLocationChangedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityStateDetector dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDUserActivityStateType4Detector__handleHomeLocationChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;

  v6 = a4;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDUserActivityStateType4Detector_didDetermineState_forRegion___block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_async(v8, block);

}

- (CLLocation)homeLocation
{
  return self->_homeLocation;
}

- (void)setHomeLocation:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocation, a3);
}

- (HMDLocation)location
{
  return self->_location;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CLRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_homeLocation, 0);
}

void __65__HMDUserActivityStateType4Detector_didDetermineState_forRegion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "region");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isEqualToString:", v3);

    if (v4)
    {
      v5 = objc_msgSend(MEMORY[0x24BDBFA88], "hm_hmdRegionStateFromCLRegionState:", *(_QWORD *)(a1 + 48));
      if (v5)
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "_userType4StateFromRegionState:", v5);
        if (v6 != objc_msgSend(*(id *)(a1 + 32), "state"))
          objc_msgSend(*(id *)(a1 + 32), "_regionStateUpdated:", v6);
      }
    }
  }

}

uint64_t __76__HMDUserActivityStateType4Detector__handleHomeLocationChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeLocation:", v5);

  objc_msgSend(*(id *)(a1 + 32), "deregisterForRegionUpdates");
  return objc_msgSend(*(id *)(a1 + 32), "registerForRegionUpdates");
}

void __85__HMDUserActivityStateType4Detector__handleLocationAuthorizationChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleLocationAuthorization:", objc_msgSend(v4, "integerValue"));
    v3 = v4;
  }

}

+ (unint64_t)contributorType
{
  return 4;
}

@end
