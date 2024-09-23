@implementation CABTMIDILocalPeripheralViewController

- (CABTMIDILocalPeripheralViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CABTMIDILocalPeripheralViewController *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CABTMIDILocalPeripheralViewController;
  v4 = -[CABTMIDILocalPeripheralViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    v5 = gPeripheralNotificationClient == 0;
  else
    v5 = 0;
  if (v5)
    MIDIClientCreate(&stru_24CF57660, (MIDINotifyProc)AdvertisingNotifyProc, v4, (MIDIClientRef *)&gPeripheralNotificationClient);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CABTMIDILocalPeripheralViewController cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDILocalPeripheralViewController;
  -[CABTMIDILocalPeripheralViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CABTMIDILocalPeripheralViewController;
  -[CABTMIDILocalPeripheralViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = *MEMORY[0x24BEBE088];
  v5 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__CABTMIDILocalPeripheralViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_24CF54E00;
  v6[4] = self;
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, self, v5, v6);
}

uint64_t __52__CABTMIDILocalPeripheralViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "reloadData");
}

- (void)loadView
{
  id v3;
  void *v4;
  NSTimer *v5;
  void *v6;
  void *v7;
  void *v8;

  self->advertisingManager = objc_alloc_init(AMSBTLEAdvertisementManager);
  self->theServiceName = (NSString *)-[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName");
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "applicationFrame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 1);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setAllowsSelection:", 0);
  objc_msgSend(v4, "setRowHeight:", *MEMORY[0x24BEBE770]);
  objc_msgSend(v4, "setEstimatedRowHeight:", 44.0);
  -[CABTMIDILocalPeripheralViewController setView:](self, "setView:", v4);
  self->advertiseTimeout = -1;
  self->fullRefreshCounter = 0;
  v5 = (NSTimer *)(id)objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_advertiseTimerFired_, 0, 1, 1.0);
  self->advertiseTimer = v5;
  -[NSTimer setTolerance:](v5, "setTolerance:", 0.150000006);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(v6, "addTimer:forMode:", self->advertiseTimer, *MEMORY[0x24BDBCB80]);
  -[CABTMIDILocalPeripheralViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("parentViewController"), 0, 0);
  self->advertising = -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising");
  -[CABTMIDILocalPeripheralViewController updateAdvertiseUI](self, "updateAdvertiseUI");
  objc_msgSend(v4, "reloadData");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_activateController_, *MEMORY[0x24BEBDF88], 0);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_deactivateController_, *MEMORY[0x24BEBE010], 0);
  self->didCleanup = 0;
}

- (void)stopTimers
{
  NSTimer *advertiseTimer;
  NSTimer *messageTimer;

  advertiseTimer = self->advertiseTimer;
  if (advertiseTimer)
  {
    -[NSTimer invalidate](advertiseTimer, "invalidate");

    self->advertiseTimer = 0;
  }
  messageTimer = self->messageTimer;
  if (messageTimer)
  {
    -[NSTimer invalidate](messageTimer, "invalidate");

    self->messageTimer = 0;
  }
}

- (void)cleanup
{
  if (!self->didCleanup)
  {
    -[CABTMIDILocalPeripheralViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("parentViewController"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
    -[CABTMIDILocalPeripheralViewController stopTimers](self, "stopTimers");

    if (gPeripheralNotificationClient)
    {
      MIDIClientDispose(gPeripheralNotificationClient);
      gPeripheralNotificationClient = 0;
    }
    self->didCleanup = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8;

  v8 = objc_msgSend(CFSTR("parentViewController"), "isEqualToString:", a3, a4, a5, a6);
  if (a4 == self && v8 && !objc_msgSend(a4, "parentViewController"))
    objc_msgSend(a4, "cleanup");
}

- (void)activateController:(id)a3
{
  NSTimer *v4;
  void *v5;

  self->advertiseTimeout = 10;
  v4 = (NSTimer *)(id)objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_advertiseTimerFired_, 0, 1, 1.0);
  self->advertiseTimer = v4;
  -[NSTimer setTolerance:](v4, "setTolerance:", 0.150000006);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(v5, "addTimer:forMode:", self->advertiseTimer, *MEMORY[0x24BDBCB80]);
  if (self->advertising)
    -[CABTMIDILocalPeripheralViewController advertiseServiceWithName:completionBlock:error:](self, "advertiseServiceWithName:completionBlock:error:", -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName"), &__block_literal_global, 0);
}

- (void)deactivateController:(id)a3
{
  -[CABTMIDILocalPeripheralViewController stopTimers](self, "stopTimers", a3);
  -[CABTMIDILocalPeripheralViewController stopAdvertisingServiceWithCompletionBlock:error:](self, "stopAdvertisingServiceWithCompletionBlock:error:", &__block_literal_global_35, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CABTMIDILocalPeripheralViewController cleanup](self, "cleanup");
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDILocalPeripheralViewController;
  -[CABTMIDILocalPeripheralViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)updateAdvertiseUI
{
  int v3;
  _BOOL4 v4;
  void *v5;
  uint64_t BTLELocalizedString;
  id v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral");
  v4 = -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising");
  self->advertising = v4;
  if (v3)
  {
    if (v4)
      -[CABTMIDILocalPeripheralViewController stopAdvertisingServiceWithCompletionBlock:error:](self, "stopAdvertisingServiceWithCompletionBlock:error:", &__block_literal_global_48, 0);
    v5 = (void *)MEMORY[0x24BDD17C8];
    BTLELocalizedString = priv_getBTLELocalizedString((uint64_t)CFSTR("Connected to %@"), (uint64_t)CFSTR("Connected to %@. Advertising disabled."));
    v7 = (id)objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheralName");
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    if (v4)
    {
      v8 = CFSTR("Serv Reg as %@");
      v9 = CFSTR("Now discoverable as %@");
    }
    else
    {
      v8 = CFSTR("Advertise as %@");
      v9 = CFSTR("Select Advertise to be discoverable as %@");
    }
    BTLELocalizedString = priv_getBTLELocalizedString((uint64_t)v8, (uint64_t)v9);
    v7 = -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName");
  }
  -[CABTMIDILocalPeripheralViewController setStatusString:animateIndicator:isError:](self, "setStatusString:animateIndicator:isError:", objc_msgSend(v5, "stringWithFormat:", BTLELocalizedString, v7), 0, 0);
}

- (id)title
{
  return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("Local MIDI Service"), (uint64_t)CFSTR("Local MIDI Service"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return a4 == 1;
  else
    return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
    return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("stat"), (uint64_t)CFSTR("Status"));
  if (a4)
    return 0;
  return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("Settings"), (uint64_t)CFSTR("Peripheral Settings"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  UIActivityIndicatorView *v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v14;
  UIActivityIndicatorView *indicator;
  id v16;
  void *v17;
  uint64_t v18;
  NSDictionary *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  UITextField *serviceNameField;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  if (v6)
  {
    v7 = (id)v6;
    if (!objc_msgSend(a4, "section"))
    {
      if (objc_msgSend(a4, "row"))
      {
        if (self->advertiseTimeout == -1)
          objc_msgSend((id)objc_msgSend(v7, "accessoryView"), "setOn:", -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising"));
        objc_msgSend((id)objc_msgSend(v7, "accessoryView"), "setEnabled:", objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral") == 0);
      }
      else
      {
        -[UITextField setText:](self->serviceNameField, "setText:", -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName"));
      }
    }
    if (objc_msgSend(a4, "section") == 1)
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "contentView"), "viewWithTag:", 5), "setText:", -[CABTMIDILocalPeripheralViewController statusString](self, "statusString"));
  }
  else
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    if (objc_msgSend(a4, "section"))
    {
      v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
      self->indicator = v8;
      -[UIActivityIndicatorView setTag:](v8, "setTag:", 1);
      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->indicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityIndicatorView setFrame:](self->indicator, "setFrame:", 0.0, 0.0, 24.0, 24.0);
      -[UIActivityIndicatorView setHidesWhenStopped:](self->indicator, "setHidesWhenStopped:", 0);
      -[UIActivityIndicatorView setHidden:](self->indicator, "setHidden:", 1);
      LODWORD(v9) = 1148846080;
      -[UIActivityIndicatorView setContentHuggingPriority:forAxis:](self->indicator, "setContentHuggingPriority:forAxis:", 0, v9);
      LODWORD(v10) = 1148846080;
      -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](self->indicator, "setContentCompressionResistancePriority:forAxis:", 0, v10);
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, 100.0, 15.0);
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v11, "setNumberOfLines:", 0);
      objc_msgSend(v11, "setText:", -[CABTMIDILocalPeripheralViewController statusString](self, "statusString"));
      objc_msgSend(v11, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]));
      objc_msgSend(v11, "setEnabled:", 0);
      LODWORD(v12) = 1148829696;
      objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);
      LODWORD(v13) = 1148846080;
      objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v13);
      objc_msgSend(v11, "setTag:", 5);
      v14 = objc_alloc(MEMORY[0x24BEBD978]);
      indicator = self->indicator;
      v33[0] = v11;
      v33[1] = indicator;
      v16 = (id)objc_msgSend(v14, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2));
      objc_msgSend(v16, "setAxis:", 0);
      v17 = v16;
      v18 = 0;
    }
    else
    {
      if (objc_msgSend(a4, "row"))
      {
        objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Advertise"), (uint64_t)CFSTR("Advertise MIDI Service")));
        v22 = objc_alloc(MEMORY[0x24BEBD9B8]);
        v23 = (void *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        objc_msgSend(v23, "setOn:", -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising"));
        objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_advertiseServiceSwitchToggled_, 4096);
        objc_msgSend(v23, "setEnabled:", objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral") == 0);
        objc_msgSend(v7, "setAccessoryView:", v23);
        return v7;
      }
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, 100.0, 15.0);
      objc_msgSend(v25, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("name"), (uint64_t)CFSTR("Name")));
      objc_msgSend(v25, "setEnabled:", 0);
      objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v26) = 1132134400;
      objc_msgSend(v25, "setContentHuggingPriority:forAxis:", 0, v26);
      LODWORD(v27) = 1132134400;
      objc_msgSend(v25, "setContentHuggingPriority:forAxis:", 1, v27);
      LODWORD(v28) = 1144766464;
      objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v28);
      self->serviceNameField = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
      -[UITextField setText:](self->serviceNameField, "setText:", -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName"));
      -[UITextField setClearButtonMode:](self->serviceNameField, "setClearButtonMode:", 3);
      -[UITextField setPlaceholder:](self->serviceNameField, "setPlaceholder:", priv_getBTLELocalizedString((uint64_t)CFSTR("Serv Name"), (uint64_t)CFSTR("Service Name")));
      -[UITextField setDelegate:](self->serviceNameField, "setDelegate:", self);
      -[UITextField setFont:](self->serviceNameField, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]));
      -[UITextField addTarget:action:forControlEvents:](self->serviceNameField, "addTarget:action:forControlEvents:", self, sel_textFieldDone_, 0x80000);
      -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->serviceNameField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v29) = 1144750080;
      -[UITextField setContentCompressionResistancePriority:forAxis:](self->serviceNameField, "setContentCompressionResistancePriority:forAxis:", 0, v29);
      LODWORD(v30) = 1132068864;
      -[UITextField setContentHuggingPriority:forAxis:](self->serviceNameField, "setContentHuggingPriority:forAxis:", 0, v30);
      v31 = objc_alloc(MEMORY[0x24BEBD978]);
      serviceNameField = self->serviceNameField;
      v34[0] = v25;
      v34[1] = serviceNameField;
      v16 = (id)objc_msgSend(v31, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2));
      objc_msgSend(v16, "setAxis:", 0);
      v17 = v16;
      v18 = 2;
    }
    objc_msgSend(v17, "setAlignment:", v18);
    objc_msgSend(v16, "setSpacing:", 8.0);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_msgSend(v7, "contentView"), "addSubview:", v16);
    v19 = _NSDictionaryOfVariableBindings(CFSTR("stack"), v16, 0);
    v20 = (void *)objc_msgSend(v7, "contentView");
    objc_msgSend(v20, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[stack]-|"), 0, 0, v19));
    v21 = (void *)objc_msgSend(v7, "contentView");
    objc_msgSend(v21, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[stack]-|"), 0, 0, v19));
  }
  return v7;
}

- (void)textFieldDone:(id)a3
{
  NSString *v4;

  objc_msgSend(a3, "resignFirstResponder");
  if (-[NSString isEqualToString:](-[UITextField text](self->serviceNameField, "text"), "isEqualToString:", &stru_24CF57660))
  {
    -[UITextField setText:](self->serviceNameField, "setText:", -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName"));
  }
  else
  {
    v4 = -[UITextField text](self->serviceNameField, "text");
    self->theServiceName = v4;
    -[CABTMIDILocalPeripheralViewController changeServiceNameTo:completionBlock:error:](self, "changeServiceNameTo:completionBlock:error:", v4, &__block_literal_global_96, 0);
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_msgSend(a3, "setBorderStyle:", 3);
}

- (void)textFieldDidEndEditing:(id)a3
{
  objc_msgSend(a3, "setBorderStyle:", 0);
}

- (void)setStatusString:(id)a3 animateIndicator:(BOOL)a4 isError:(BOOL)a5
{
  _BOOL4 v5;
  NSTimer *messageTimer;
  NSTimer *v10;
  NSTimer *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  v5 = a5;

  self->statusString = (NSString *)a3;
  self->isErrorMessage = v5;
  if (v5)
  {
    messageTimer = self->messageTimer;
    if (messageTimer)
    {
      -[NSTimer setFireDate:](messageTimer, "setFireDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 10.0));
    }
    else
    {
      v10 = (NSTimer *)objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_messageTimerFired_, 0, 0, 10.0);
      self->messageTimer = v10;
      -[NSTimer setTolerance:](v10, "setTolerance:", 0.5);
      v11 = self->messageTimer;
      v12 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      objc_msgSend(v12, "addTimer:forMode:", self->messageTimer, *MEMORY[0x24BDBCB80]);
    }
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__CABTMIDILocalPeripheralViewController_setStatusString_animateIndicator_isError___block_invoke;
  v13[3] = &unk_24CF54EC8;
  v14 = a4;
  v13[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);
}

uint64_t __82__CABTMIDILocalPeripheralViewController_setStatusString_animateIndicator_isError___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  if (v2)
  {
    objc_msgSend(v3, "setHidden:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "startAnimating");
  }
  else
  {
    objc_msgSend(v3, "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "stopAnimating");
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "reloadData");
}

- (id)statusString
{
  id result;

  result = self->statusString;
  if (!result)
  {
    result = (id)priv_getBTLELocalizedString((uint64_t)CFSTR("rdy"), (uint64_t)CFSTR("Ready"));
    self->statusString = (NSString *)result;
  }
  return result;
}

- (void)advertiseServiceSwitchToggled:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;

  v7 = 0;
  self->advertiseTimeout = 10;
  objc_msgSend(a3, "setEnabled:", 0);
  self->advertising = -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising");
  if (objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral"))
  {
    -[CABTMIDILocalPeripheralViewController setStatusString:animateIndicator:isError:](self, "setStatusString:animateIndicator:isError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", priv_getBTLELocalizedString((uint64_t)CFSTR("Disconnecting %@"), (uint64_t)CFSTR("Disconnecting from %@...")), objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheralName")), 1, 0);
    if (-[CABTMIDILocalPeripheralViewController disconnectLocalPeripheral](self, "disconnectLocalPeripheral"))
      return;
    goto LABEL_3;
  }
  if (!self->advertising)
  {
    v4 = -[CABTMIDILocalPeripheralViewController advertisedServiceName](self, "advertisedServiceName");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke;
    v6[3] = &unk_24CF54EF0;
    v6[4] = self;
    if (-[CABTMIDILocalPeripheralViewController advertiseServiceWithName:completionBlock:error:](self, "advertiseServiceWithName:completionBlock:error:", v4, v6, &v7))
    {
      return;
    }
    goto LABEL_3;
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke_2;
  v5[3] = &unk_24CF54EF0;
  v5[4] = self;
  if (!-[CABTMIDILocalPeripheralViewController stopAdvertisingServiceWithCompletionBlock:error:](self, "stopAdvertisingServiceWithCompletionBlock:error:", v5, &v7))LABEL_3:-[CABTMIDILocalPeripheralViewController updateAdvertiseUI](self, "updateAdvertiseUI");
}

uint64_t __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusString:animateIndicator:isError:", priv_getBTLELocalizedString((uint64_t)CFSTR("starting"), (uint64_t)CFSTR("Registering Service...")), 1, 0);
}

uint64_t __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusString:animateIndicator:isError:", priv_getBTLELocalizedString((uint64_t)CFSTR("stopping"), (uint64_t)CFSTR("Stopping Service...")), 1, 0);
}

- (id)advertisedServiceName
{
  MIDIObjectRef v2;
  id v3;
  void *v4;
  CFStringRef str;

  v2 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
  str = 0;
  if (!v2)
    return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("My Service"), (uint64_t)CFSTR("Local Bluetooth"));
  MIDIObjectGetStringProperty(v2, CFSTR("Bluetooth Advertising Name"), &str);
  if (!str)
    return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("My Service"), (uint64_t)CFSTR("Local Bluetooth"));
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (void *)objc_msgSend(v3, "initWithString:", str);
  CFRelease(str);
  return v4;
}

- (BOOL)advertiseServiceWithName:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  -[CABTMIDILocalPeripheralViewController changeServiceNameTo:completionBlock:error:](self, "changeServiceNameTo:completionBlock:error:", a3, &__block_literal_global_122, a5);
  -[AMSBTLEAdvertisementManager advertiseMIDIService](self->advertisingManager, "advertiseMIDIService");
  (*((void (**)(id))a4 + 2))(a4);
  return 1;
}

- (BOOL)stopAdvertisingServiceWithCompletionBlock:(id)a3 error:(id *)a4
{
  -[AMSBTLEAdvertisementManager stopAdvertisingMIDIService](self->advertisingManager, "stopAdvertisingMIDIService", a3, a4);
  (*((void (**)(id))a3 + 2))(a3);
  return 1;
}

- (BOOL)changeServiceNameTo:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  MIDIObjectRef v9;

  v9 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
  if (!v9)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreMIDI"), -10842, 0);
    goto LABEL_7;
  }
  if (!-[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising"))
  {
    MIDIObjectSetStringProperty(v9, CFSTR("Bluetooth Advertising Name"), (CFStringRef)a3);
LABEL_7:
    (*((void (**)(id))a4 + 2))(a4);
    return v9 != 0;
  }
  -[AMSBTLEAdvertisementManager stopAdvertisingMIDIService](self->advertisingManager, "stopAdvertisingMIDIService");
  MIDIObjectSetStringProperty(v9, CFSTR("Bluetooth Advertising Name"), (CFStringRef)a3);
  (*((void (**)(id))a4 + 2))(a4);
  -[AMSBTLEAdvertisementManager advertiseMIDIService](self->advertisingManager, "advertiseMIDIService");
  return v9 != 0;
}

- (BOOL)disconnectLocalPeripheral
{
  MIDIObjectRef v2;
  MIDIObjectRef v3;
  BOOL v4;
  CFStringRef str;

  v2 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
  v3 = objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral");
  str = 0;
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    MIDIObjectGetStringProperty(v3, CFSTR("BLE MIDI Device UUID"), &str);
    if (str)
    {
      MIDIObjectSetStringProperty(v2, CFSTR("disconnect device"), str);
      CFRelease(str);
    }
  }
  return v2 != 0;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CABTMIDILocalPeripheralViewController;
  -[CABTMIDILocalPeripheralViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)advertiseTimerFired:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CABTMIDILocalPeripheralViewController_advertiseTimerFired___block_invoke;
  block[3] = &unk_24CF54EF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__CABTMIDILocalPeripheralViewController_advertiseTimerFired___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BYTE *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *BTLELocalizedString;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isAdvertising");
  result = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(result + 992) == v2)
  {
    v4 = *(_QWORD *)(result + 1016);
    if (v4 >= 1)
    {
      *(_QWORD *)(result + 1016) = v4 - 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      v6 = objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral");
      v7 = *(_BYTE **)(a1 + 32);
      if (v6)
      {
        v8 = CFSTR("disconnectErr");
        v9 = CFSTR("There has been an error disconnecting.");
      }
      else
      {
        if (!v7[992])
        {
          BTLELocalizedString = &stru_24CF57660;
          v11 = *(void **)(a1 + 32);
          v12 = 0;
          goto LABEL_12;
        }
        v8 = CFSTR("stopErr");
        v9 = CFSTR("There has been an error stopping the service");
      }
      BTLELocalizedString = (const __CFString *)priv_getBTLELocalizedString((uint64_t)v8, (uint64_t)v9);
      v11 = v7;
      v12 = 1;
LABEL_12:
      result = objc_msgSend(v11, "setStatusString:animateIndicator:isError:", BTLELocalizedString, 0, v12);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016) = -1;
    }
  }
  else
  {
    result = objc_msgSend((id)result, "updateAdvertiseUI");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016) = -1;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(uint64_t *)(v5 + 1016) >= 1)
      *(_QWORD *)(v5 + 1016) = -1;
  }
LABEL_13:
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(v13 + 1024);
  if (v14 < 15)
  {
    *(_QWORD *)(v13 + 1024) = v14 + 1;
  }
  else
  {
    *(_QWORD *)(v13 + 1024) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "updateAdvertiseUI");
  }
  return result;
}

- (void)messageTimerFired:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CABTMIDILocalPeripheralViewController_messageTimerFired___block_invoke;
  block[3] = &unk_24CF54EF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__CABTMIDILocalPeripheralViewController_messageTimerFired___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "stopAnimating");
  return objc_msgSend(*(id *)(a1 + 32), "updateAdvertiseUI");
}

@end
