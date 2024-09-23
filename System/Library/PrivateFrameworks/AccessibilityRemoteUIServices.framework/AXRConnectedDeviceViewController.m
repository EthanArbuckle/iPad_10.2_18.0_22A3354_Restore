@implementation AXRConnectedDeviceViewController

- (AXRConnectedDeviceViewController)initWithRemoteDevice:(id)a3
{
  id v4;
  AXRConnectedDeviceViewController *v5;
  AXRConnectedDeviceViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXRConnectedDeviceViewController;
  v5 = -[AXRConnectedDeviceViewController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXRConnectedDeviceViewController setActiveDevice:](v5, "setActiveDevice:", v4);
    -[AXRConnectedDeviceViewController activeDevice](v6, "activeDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConnectionDelegate:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnect");

  -[AXRConnectedDeviceViewController setActiveDevice:](self, "setActiveDevice:", 0);
  -[AXRConnectedDeviceViewController eventProcessor](self, "eventProcessor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endHandlingHIDEventsForReason:", CFSTR("AXRemoteDeviceConnection"));

  -[AXRConnectedDeviceViewController eventProcessor](self, "eventProcessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanup");

  v6.receiver = self;
  v6.super_class = (Class)AXRConnectedDeviceViewController;
  -[AXRConnectedDeviceViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  AXRActionsCollectionView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  AXRActionsCollectionView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  AXRVoiceOverTouchPadView *v39;
  void *v40;
  AXRVoiceOverTouchPadView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *v59;
  NSArray *remoteActionsToShow;
  NSObject *v61;
  NSObject *v62;
  OS_dispatch_queue *v63;
  OS_dispatch_queue *eventSenderQueue;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  id location;
  objc_super v94;
  void *v95;
  _QWORD v96[4];
  _QWORD v97[5];

  v97[3] = *MEMORY[0x24BDAC8D0];
  v94.receiver = self;
  v94.super_class = (Class)AXRConnectedDeviceViewController;
  -[AXRConnectedDeviceViewController viewDidLoad](&v94, sel_viewDidLoad);
  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController setTitle:](self, "setTitle:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BDF6908]);
  -[AXRConnectedDeviceViewController setCollectionViewFlowLayout:](self, "setCollectionViewFlowLayout:", v7);

  v8 = [AXRActionsCollectionView alloc];
  -[AXRConnectedDeviceViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[AXRConnectedDeviceViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AXRActionsCollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v18, v11, v13, v15, v17);
  -[AXRConnectedDeviceViewController setActionsCollectionView:](self, "setActionsCollectionView:", v19);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDataSource:", self);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBounces:", 0);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setScrollEnabled:", 0);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CellReuseIdentifier"));

  -[AXRConnectedDeviceViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  v73 = (void *)MEMORY[0x24BDD1628];
  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v81;
  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v29;
  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "activateConstraints:", v36);

  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "contextType") == 1)
  {
    v38 = _AXSVoiceOverTouchEnabled() == 0;

    if (!v38)
    {
      v39 = [AXRVoiceOverTouchPadView alloc];
      -[AXRConnectedDeviceViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      v41 = -[AXRVoiceOverTouchPadView initWithFrame:](v39, "initWithFrame:");

      -[AXRVoiceOverTouchPadView setDelegate:](v41, "setDelegate:", self);
      objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRVoiceOverTouchPadView setBackgroundColor:](v41, "setBackgroundColor:", v42);

      -[AXRVoiceOverTouchPadView _setContinuousCornerRadius:](v41, "_setContinuousCornerRadius:", 42.0);
      -[AXRVoiceOverTouchPadView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AXRVoiceOverTouchPadView setAutoresizingMask:](v41, "setAutoresizingMask:", 18);
      -[AXRConnectedDeviceViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "insertSubview:belowSubview:", v41, v44);

      v69 = (void *)MEMORY[0x24BDD1628];
      -[AXRVoiceOverTouchPadView leadingAnchor](v41, "leadingAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRConnectedDeviceViewController view](self, "view");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "safeAreaLayoutGuide");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "leadingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToAnchor:constant:", v45, 8.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v46;
      -[AXRVoiceOverTouchPadView trailingAnchor](v41, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRConnectedDeviceViewController view](self, "view");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "safeAreaLayoutGuide");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "trailingAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:constant:", v80, -8.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v78;
      -[AXRVoiceOverTouchPadView topAnchor](v41, "topAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRConnectedDeviceViewController view](self, "view");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "safeAreaLayoutGuide");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "topAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 12.0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2] = v70;
      -[AXRVoiceOverTouchPadView bottomAnchor](v41, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, -12.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v96[3] = v51;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "activateConstraints:", v52);

      v53 = 0;
      v54 = 3;
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v55, "contextType");

  v56 = (void *)MEMORY[0x24BDD1628];
  -[AXRConnectedDeviceViewController actionsCollectionView](self, "actionsCollectionView");
  v41 = (AXRVoiceOverTouchPadView *)objc_claimAutoreleasedReturnValue();
  -[AXRVoiceOverTouchPadView topAnchor](v41, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRConnectedDeviceViewController view](self, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "safeAreaLayoutGuide");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v45, 16.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activateConstraints:", v47);
  v54 = 8;
LABEL_6:

  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "remoteActionsForPreferredContextType:", v53);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54 > objc_msgSend(v58, "count"))
    v54 = objc_msgSend(v58, "count");
  objc_msgSend(v58, "subarrayWithRange:", 0, v54);
  v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
  remoteActionsToShow = self->_remoteActionsToShow;
  self->_remoteActionsToShow = v59;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v61 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v61, QOS_CLASS_USER_INTERACTIVE, 0);
  v62 = objc_claimAutoreleasedReturnValue();

  v63 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AXRemoteUIServices.EventSenderQueue", v62);
  eventSenderQueue = self->_eventSenderQueue;
  self->_eventSenderQueue = v63;

  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00618]), "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:", CFSTR("com.apple.AXRemoteUIServices.EventProcessor"), 70, 0, 30);
  -[AXRConnectedDeviceViewController setEventProcessor:](self, "setEventProcessor:", v65);

  -[AXRConnectedDeviceViewController eventProcessor](self, "eventProcessor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setHIDEventFilterMask:", 40);

  objc_initWeak(&location, self);
  v91[0] = MEMORY[0x24BDAC760];
  v91[1] = 3221225472;
  v91[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke;
  v91[3] = &unk_24F4F6C88;
  objc_copyWeak(&v92, &location);
  -[AXRConnectedDeviceViewController eventProcessor](self, "eventProcessor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setHIDEventHandler:", v91);

  -[AXRConnectedDeviceViewController eventProcessor](self, "eventProcessor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "beginHandlingHIDEventsForReason:", CFSTR("AXRemoteDeviceConnection"));

  objc_destroyWeak(&v92);
  objc_destroyWeak(&location);

}

uint64_t __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  _QWORD *v29;

  v3 = a2;
  if (objc_msgSend(v3, "senderID") != 0x8000000817319372)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = WeakRetained;
    if (!WeakRetained)
      goto LABEL_5;
    objc_msgSend(WeakRetained, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
    if (objc_msgSend(v3, "type") == 5000
      && (objc_msgSend(v3, "accessibilityData"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "page"),
          v9,
          v10 == 2))
    {
      objc_msgSend(v3, "accessibilityData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "usage");

      if (v12 == 2)
      {
        v25 = MEMORY[0x24BDAC760];
        v26 = 3221225472;
        v27 = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_2;
        v28 = &unk_24F4F6C10;
        v29 = v6;
        AXPerformBlockAsynchronouslyOnMainThread();
LABEL_14:
        v4 = 1;
        goto LABEL_6;
      }
      objc_msgSend(v6, "activeDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "customizedRemoteActionForHandGestureEventUsage:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && !objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDFF628]))
      {
        v16 = v6[121];
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_3;
        v20[3] = &unk_24F4F6C38;
        v21 = v15;
        v22 = v6;
        v24 = v12;
        v23 = v3;
        v17 = v15;
        dispatch_async(v16, v20);

        goto LABEL_14;
      }

    }
    else if (objc_msgSend(v3, "type") == 1100)
    {
      v13 = v6[121];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_4;
      block[3] = &unk_24F4F6C60;
      block[4] = v6;
      v19 = v3;
      dispatch_async(v13, block);

      goto LABEL_14;
    }
LABEL_5:
    v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

uint64_t __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  _QWORD v29[5];

  v29[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceType");
  AXRLocalizedStringForRemoteActionWithDeviceType();
  v3 = objc_claimAutoreleasedReturnValue();

  AXLocalizedStringForHandGestureEventUsage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE005D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  objc_msgSend(v5, "presentBannerWithTitle:message:duration:", v3, v4, 1.0);

  objc_msgSend(*(id *)(a1 + 40), "activeDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = *MEMORY[0x24BDFF638];
  v6 = *(_QWORD *)(a1 + 32);
  v26 = *MEMORY[0x24BDFF620];
  v27 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  v28[1] = *MEMORY[0x24BDFF5C8];
  v7 = *MEMORY[0x24BDFF5D0];
  v24[0] = *MEMORY[0x24BDFF5D8];
  v24[1] = v7;
  v25[0] = v3;
  v25[1] = v4;
  v24[2] = *MEMORY[0x24BDFF5C0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v9;
  v28[2] = *MEMORY[0x24BDFF6F0];
  v22[0] = *MEMORY[0x24BDFF6E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v22[1] = *MEMORY[0x24BDFF700];
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 48), "accessibilityData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventValue1");
  objc_msgSend(v11, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  v22[2] = *MEMORY[0x24BDFF6F8];
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 48), "accessibilityData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventValue2");
  objc_msgSend(v14, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendPayload:withEventID:", v18, *MEMORY[0x24BDFF5B8]);

}

void __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDFF720];
  v6 = *MEMORY[0x24BDFF718];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "scrollAmount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendPayload:withEventID:", v5, *MEMORY[0x24BDFF5B8]);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXRConnectedDeviceViewController;
  -[AXRConnectedDeviceViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[AXRConnectedDeviceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5 + -80.0;

  -[AXRConnectedDeviceViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSectionInset:", 16.0, 16.0, 16.0, 16.0);

  -[AXRConnectedDeviceViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumInteritemSpacing:", 16.0);

  -[AXRConnectedDeviceViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemSize:", v6 * 0.25, v6 * 0.25);

  -[AXRConnectedDeviceViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateLayout");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_moreButtonPressed
{
  AXRDeviceActionsViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AXRDeviceActionsViewController *v8;

  v3 = [AXRDeviceActionsViewController alloc];
  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXRDeviceActionsViewController initWithRemoteDevice:delegate:](v3, "initWithRemoteDevice:delegate:", v4, self);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__dismissCurrentPresentedViewController);
  -[AXRDeviceActionsViewController navigationItem](v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v8);
  -[AXRConnectedDeviceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, &__block_literal_global_0);

}

- (void)_dismissCurrentPresentedViewController
{
  id v2;

  -[AXRConnectedDeviceViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_performDeviceRemoteAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *eventSenderQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  eventSenderQueue = self->_eventSenderQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__AXRConnectedDeviceViewController__performDeviceRemoteAction___block_invoke;
  v9[3] = &unk_24F4F6C60;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(eventSenderQueue, v9);

}

void __63__AXRConnectedDeviceViewController__performDeviceRemoteAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDFF638];
  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *MEMORY[0x24BDFF620];
  v6 = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendPayload:withEventID:", v4, *MEMORY[0x24BDFF5B8]);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_msgSend(v10, "item");
  -[AXRConnectedDeviceViewController remoteActionsToShow](self, "remoteActionsToShow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    -[AXRConnectedDeviceViewController _moreButtonPressed](self, "_moreButtonPressed");
  }
  else
  {
    -[AXRConnectedDeviceViewController remoteActionsToShow](self, "remoteActionsToShow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRConnectedDeviceViewController _performDeviceRemoteAction:](self, "_performDeviceRemoteAction:", v9);
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AXRConnectedDeviceViewController remoteActionsToShow](self, "remoteActionsToShow", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 1;

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");
  -[AXRConnectedDeviceViewController remoteActionsToShow](self, "remoteActionsToShow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 == v10)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ellipsis.circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXRLocalizedStringForKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:title:", v11, v12);
  }
  else
  {
    -[AXRConnectedDeviceViewController remoteActionsToShow](self, "remoteActionsToShow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXRUIImageForRemoteActionWithDeviceType(v11, objc_msgSend(v14, "deviceType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRConnectedDeviceViewController activeDevice](self, "activeDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceType");
    AXRLocalizedStringForRemoteActionWithDeviceType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:title:", v12, v16);

  }
  return v7;
}

- (void)remoteDeviceDidUnexpectedlyDisconnect:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__AXRConnectedDeviceViewController_remoteDeviceDidUnexpectedlyDisconnect___block_invoke;
  v6[3] = &unk_24F4F6C10;
  v7 = v4;
  v5 = v4;
  -[AXRConnectedDeviceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __74__AXRConnectedDeviceViewController_remoteDeviceDidUnexpectedlyDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE005D0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXRLocalizedStringForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentBannerWithTitle:message:duration:", v2, v3, 3.0);

}

- (void)actionsViewController:(id)a3 selectedAction:(id)a4
{
  -[AXRConnectedDeviceViewController _performDeviceRemoteAction:](self, "_performDeviceRemoteAction:", a4);
}

- (void)voiceOverTouchPadView:(id)a3 didReceiveCommand:(id)a4
{
  id v5;
  NSObject *eventSenderQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  eventSenderQueue = self->_eventSenderQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__AXRConnectedDeviceViewController_voiceOverTouchPadView_didReceiveCommand___block_invoke;
  v8[3] = &unk_24F4F6C60;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(eventSenderQueue, v8);

}

void __76__AXRConnectedDeviceViewController_voiceOverTouchPadView_didReceiveCommand___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activeDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDFF730];
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x24BDFF728];
  v7 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendPayload:withEventID:", v5, *MEMORY[0x24BDFF5B8]);

}

- (AXRemoteDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_eventProcessor, a3);
}

- (AXRActionsCollectionView)actionsCollectionView
{
  return self->_actionsCollectionView;
}

- (void)setActionsCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsCollectionView, a3);
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, a3);
}

- (NSArray)remoteActionsToShow
{
  return self->_remoteActionsToShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteActionsToShow, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_actionsCollectionView, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_eventSenderQueue, 0);
}

@end
