@implementation HSPCFaceRecognitionViewController

- (HSPCFaceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCFaceRecognitionViewController *v9;
  HSPCFaceRecognitionViewController *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HSPCFaceRecognitionViewController;
  v9 = -[HSPCFaceRecognitionViewController init](&v31, "init");
  v10 = v9;
  if (v9)
  {
    v9->_isPreloaded = 0;
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString(CFSTR("HUProximityCardFaceRecognitionCard"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCFaceRecognitionViewController setTitle:](v10, "setTitle:", v12);

    v13 = -[HSPCFaceRecognitionViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    objc_initWeak(&location, v10);
    v15 = objc_alloc((Class)PRXFeature);
    v16 = HULocalizedString(CFSTR("HUServiceDetailsCameraFaceRecognitionDisplayTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = HULocalizedString(CFSTR("HUProximityCardFaceRecognitionCardFeatureIdentifyPeopleSubtitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000FF88;
    v27[3] = &unk_1000A1400;
    objc_copyWeak(&v29, &location);
    v21 = v14;
    v28 = v21;
    v22 = objc_msgSend(v15, "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", v17, v19, 0, v20, v27);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "personManagerSettings"));
    v24 = objc_msgSend(v23, "isFaceClassificationEnabled");

    objc_msgSend(v22, "setOn:", v24);
    v25 = -[HSPCFaceRecognitionViewController addFeature:](v10, "addFeature:", v22);
    -[HSPCFaceRecognitionViewController setIdentifyPeopleFeature:](v10, "setIdentifyPeopleFeature:", v22);
    -[HSPCFaceRecognitionViewController setIsPreloaded:](v10, "setIsPreloaded:", 1);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7FC0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCFaceRecognitionViewController;
  -[HSPCFaceRecognitionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFaceRecognitionViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setSeparatorStyle:", 0);

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

- (BOOL)isPreloaded
{
  return self->_isPreloaded;
}

- (void)setIsPreloaded:(BOOL)a3
{
  self->_isPreloaded = a3;
}

- (PRXFeature)identifyPeopleFeature
{
  return self->_identifyPeopleFeature;
}

- (void)setIdentifyPeopleFeature:(id)a3
{
  objc_storeStrong((id *)&self->_identifyPeopleFeature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyPeopleFeature, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
