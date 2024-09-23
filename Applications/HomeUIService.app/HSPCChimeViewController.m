@implementation HSPCChimeViewController

- (HSPCChimeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCChimeViewController *v9;
  HSPCChimeViewController *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PRXFeature *v19;
  PRXFeature *homePodChimeFeature;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  PRXFeature *v30;
  PRXFeature *traditionalChimeFeature;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HSPCChimeViewController;
  v9 = -[HSPCChimeViewController init](&v41, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v12 = +[HSPCChimeViewController _shouldShowHomePodChimeFeatureForHome:](HSPCChimeViewController, "_shouldShowHomePodChimeFeatureForHome:", v11);

    if (v12)
    {
      v13 = objc_alloc((Class)PRXFeature);
      v14 = HULocalizedString(CFSTR("HUProximityCardChimeCardFeatureRingChimeTitle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = HULocalizedString(CFSTR("HUProximityCardChimeCardFeatureRingChimeSubtitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v19 = (PRXFeature *)objc_msgSend(v13, "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", v15, v17, 0, v18, &stru_1000A2448);
      homePodChimeFeature = v10->_homePodChimeFeature;
      v10->_homePodChimeFeature = v19;

      -[HSPCChimeViewController setInitialHomePodChimeState:](v10, "setInitialHomePodChimeState:", -[HSPCChimeViewController isHomePodChimeEnabled](v10, "isHomePodChimeEnabled"));
      -[PRXFeature setOn:](v10->_homePodChimeFeature, "setOn:", -[HSPCChimeViewController initialHomePodChimeState](v10, "initialHomePodChimeState"));
      v21 = -[HSPCChimeViewController addFeature:](v10, "addFeature:", v10->_homePodChimeFeature);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
    v23 = +[HSPCChimeViewController _shouldShowTraditionalChimeFeatureForAccessory:](HSPCChimeViewController, "_shouldShowTraditionalChimeFeatureForAccessory:", v22);

    if (v23)
    {
      v24 = objc_alloc((Class)PRXFeature);
      v25 = HULocalizedString(CFSTR("HUCameraDoorbellChimeMuteSwitchTitle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = HULocalizedString(CFSTR("HUCameraDoorbellChimeMuteSwitchFooter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v30 = (PRXFeature *)objc_msgSend(v24, "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", v26, v28, 0, v29, &stru_1000A2468);
      traditionalChimeFeature = v10->_traditionalChimeFeature;
      v10->_traditionalChimeFeature = v30;

      -[PRXFeature setOn:](v10->_traditionalChimeFeature, "setOn:", -[HSPCChimeViewController isTraditionalChimeEnabled](v10, "isTraditionalChimeEnabled"));
      v32 = -[HSPCChimeViewController addFeature:](v10, "addFeature:", v10->_traditionalChimeFeature);
    }
    v33 = HULocalizedString(CFSTR("HUProximityCardChimeCard"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    -[HSPCChimeViewController setTitle:](v10, "setTitle:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController features](v10, "features"));
    v36 = objc_msgSend(v35, "count");

    if ((unint64_t)v36 >= 2)
    {
      v37 = HULocalizedString(CFSTR("HUProximityCardChimeCardSubtitle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      -[HSPCChimeViewController setSubtitle:](v10, "setSubtitle:", v38);

    }
    v39 = -[HSPCChimeViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController traditionalChimeFeature](self, "traditionalChimeFeature"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController traditionalChimeFeature](self, "traditionalChimeFeature"));
    -[HSPCChimeViewController setTraditionalDoorbellChime:](self, "setTraditionalDoorbellChime:", objc_msgSend(v4, "isOn"));

  }
  v5 = objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController homePodChimeFeature](self, "homePodChimeFeature"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController homePodChimeFeature](self, "homePodChimeFeature")),
        v8 = objc_msgSend(v7, "isOn"),
        v9 = -[HSPCChimeViewController initialHomePodChimeState](self, "initialHomePodChimeState"),
        v7,
        v6,
        v8 == v9))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8290));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController homePodChimeFeature](self, "homePodChimeFeature"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController setHomePodChime:](self, "setHomePodChime:", objc_msgSend(v10, "isOn")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hs_commitConfigurationFutureWithContextMessage:", CFSTR("HomePod Chime")));

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSPCChimeViewController;
  -[HSPCChimeViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController features](self, "features"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setSeparatorStyle:", 0);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController tableView](self, "tableView"));
    objc_msgSend(v6, "setTableFooterView:", v5);

  }
}

- (void)setTraditionalDoorbellChime:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController config](self, "config"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraProfile"));

  objc_msgSend(v5, "hf_updateDoorbellChime:", v3);
}

- (id)setHomePodChime:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  BOOL v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_characteristicValueManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_allHomePodsOrStereoPairs"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10002CA4C;
  v16 = &unk_1000A2490;
  v17 = v6;
  v18 = a3;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", &v13));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler", v13, v14, v15, v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v9, 1, v10));

  return v11;
}

- (BOOL)isTraditionalChimeEnabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addedAccessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCChimeViewController _muteCharacteristicForAccessory:](HSPCChimeViewController, "_muteCharacteristicForAccessory:", v3));

  v6 = objc_opt_class(NSNumber, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
  else
    LOBYTE(v10) = 0;

  return v10;
}

- (BOOL)isHomePodChimeEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCChimeViewController config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_allHomePodsOrStereoPairsThatWillChime"));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

+ (BOOL)_shouldShowHomePodChimeFeatureForHome:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_allHomePodProfileContainers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_filter:", &stru_1000A24D0));
  v5 = objc_msgSend(v4, "count");

  return v5 != 0;
}

+ (id)_muteCharacteristicForAccessory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cameraProfiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_doorbellChimeMuteCharacteristic"));
  return v5;
}

+ (BOOL)_shouldShowTraditionalChimeFeatureForAccessory:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCChimeViewController _muteCharacteristicForAccessory:](HSPCChimeViewController, "_muteCharacteristicForAccessory:", a3));
  v4 = objc_msgSend(v3, "hf_isWritable");

  return v4;
}

+ (BOOL)shouldSkipForAccessory:(id)a3 inHome:(id)a4
{
  id v5;
  unsigned int v6;

  v5 = a3;
  if (+[HSPCChimeViewController _shouldShowHomePodChimeFeatureForHome:](HSPCChimeViewController, "_shouldShowHomePodChimeFeatureForHome:", a4))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !+[HSPCChimeViewController _shouldShowTraditionalChimeFeatureForAccessory:](HSPCChimeViewController, "_shouldShowTraditionalChimeFeatureForAccessory:", v5);
  }

  return v6;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)initialHomePodChimeState
{
  return self->_initialHomePodChimeState;
}

- (void)setInitialHomePodChimeState:(BOOL)a3
{
  self->_initialHomePodChimeState = a3;
}

- (PRXFeature)homePodChimeFeature
{
  return self->_homePodChimeFeature;
}

- (void)setHomePodChimeFeature:(id)a3
{
  objc_storeStrong((id *)&self->_homePodChimeFeature, a3);
}

- (PRXFeature)traditionalChimeFeature
{
  return self->_traditionalChimeFeature;
}

- (void)setTraditionalChimeFeature:(id)a3
{
  objc_storeStrong((id *)&self->_traditionalChimeFeature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traditionalChimeFeature, 0);
  objc_storeStrong((id *)&self->_homePodChimeFeature, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
