@implementation CABTMIDICentralViewController

- (CABTMIDICentralViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  return -[CABTMIDICentralViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[CABTMIDICentralViewController cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController viewDidLoad](&v14, sel_viewDidLoad);
  self->previousLeftItem = (UIBarButtonItem *)(id)objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "leftBarButtonItem");
  self->previousRightItem = (UIBarButtonItem *)(id)objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "rightBarButtonItem");
  self->connectionManager = -[AMSBTLEConnectionManager initWithUIController:]([AMSBTLEConnectionManager alloc], "initWithUIController:", self);
  -[CABTMIDICentralViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("parentViewController"), 0, 0);
  self->peripheralList = -[AMSBTLEConnectionManager peripheralList](self->connectionManager, "peripheralList");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = *MEMORY[0x24BEBDF88];
  v5 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke;
  v13[3] = &unk_24CF54E00;
  v13[4] = self;
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, self, v5, v13);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = *MEMORY[0x24BEBE010];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_2;
  v12[3] = &unk_24CF54E00;
  v12[4] = self;
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, self, objc_msgSend(MEMORY[0x24BDD1710], "mainQueue"), v12);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = *MEMORY[0x24BEBE088];
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_3;
  v11[3] = &unk_24CF54E00;
  v11[4] = self;
  objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, self, objc_msgSend(MEMORY[0x24BDD1710], "mainQueue"), v11);
  self->didRegisterObserver = 1;
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "startScan");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "startTimer");
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "stopScan");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "killTimer");
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "reloadData");
}

- (void)cleanup
{
  if (!self->didCleanup)
  {
    objc_sync_enter(self);
    -[NSTimer invalidate](self->connectionTimer, "invalidate");
    self->connectionTimer = 0;
    objc_sync_exit(self);
    -[AMSBTLEConnectionManager killTimer](self->connectionManager, "killTimer");
    -[AMSBTLEConnectionManager stopScan](self->connectionManager, "stopScan");

    self->connectionManager = 0;
    self->peripheralList = 0;
    if (self->didRegisterObserver)
    {
      -[CABTMIDICentralViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("parentViewController"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
      self->didRegisterObserver = 0;
    }

    self->didCleanup = 1;
  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
  if (-[CABTMIDICentralViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view"), "window"))
    {
      -[CABTMIDICentralViewController cleanup](self, "cleanup");
      -[CABTMIDICentralViewController setView:](self, "setView:", 0);
    }
  }
}

- (void)loadView
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "applicationFrame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 1);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setAllowsSelection:", 1);
  objc_msgSend(v4, "setAllowsMultipleSelectionDuringEditing:", 1);
  -[CABTMIDICentralViewController setView:](self, "setView:", v4);
  self->didCleanup = 0;
  self->didRegisterObserver = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8;

  v8 = objc_msgSend(CFSTR("parentViewController"), "isEqualToString:", a3, a4, a5, a6);
  if (a4 == self && v8 && !objc_msgSend(a4, "parentViewController"))
    objc_msgSend(a4, "cleanup");
}

- (void)updatePeripheralTable
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CABTMIDICentralViewController_updatePeripheralTable__block_invoke;
  block[3] = &unk_24CF54EF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __54__CABTMIDICentralViewController_updatePeripheralTable__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "reloadData");
  return objc_msgSend(*(id *)(a1 + 32), "updateButtonsToMatchTableState");
}

- (unint64_t)peripheralCount
{
  return -[NSMutableArray count](self->peripheralList, "count");
}

- (id)peripheralAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->peripheralList, "objectAtIndexedSubscript:", a3);
}

- (id)title
{
  return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("Ext Devs"), (uint64_t)CFSTR("External Bluetooth Devices"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount", a3, a4);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("Ext Devs"), (uint64_t)CFSTR("External Bluetooth Devices"));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.audio.CoreAudioKit"), a4), "localizedStringForKey:value:table:", CFSTR("%lu device(s) found"), &stru_24CF57660, CFSTR("AMS"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v5, -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  CACentralTableViewCell *v7;
  id v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  UIActivityIndicatorView *v12;
  void *v13;
  uint64_t v14;
  _QWORD block[5];

  if (-[CABTMIDICentralViewController peripheralCount](self, "peripheralCount"))
  {
    v7 = (CACentralTableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
    v8 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a4, "row"));
    if (!v7)
      v7 = -[CACentralTableViewCell initWithStyle:reuseIdentifier:]([CACentralTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    v9 = objc_msgSend(v8, "isOnline");
    v10 = objc_msgSend(v8, "isAvailable");
    -[UILabel setText:](-[CACentralTableViewCell deviceNameLabel](v7, "deviceNameLabel"), "setText:", objc_msgSend(v8, "name"));
    -[UILabel setEnabled:](-[CACentralTableViewCell connectionStatusLabel](v7, "connectionStatusLabel"), "setEnabled:", v10);
    -[UILabel setEnabled:](-[CACentralTableViewCell deviceNameLabel](v7, "deviceNameLabel"), "setEnabled:", v10);
    if (-[UILabel isEnabled](-[CACentralTableViewCell deviceNameLabel](v7, "deviceNameLabel"), "isEnabled"))
    {
      if (v9)
        v11 = CFSTR("Connected");
      else
        v11 = CFSTR("Not Connected");
      -[UILabel setText:](-[CACentralTableViewCell connectionStatusLabel](v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString((uint64_t)v11, (uint64_t)v11));
      -[UILabel setEnabled:](-[CACentralTableViewCell inputLabel](v7, "inputLabel"), "setEnabled:", objc_msgSend(v8, "inputAvailable"));
      v14 = objc_msgSend(v8, "outputAvailable");
    }
    else
    {
      -[UILabel setText:](-[CACentralTableViewCell connectionStatusLabel](v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Offline"), (uint64_t)CFSTR("Offline")));
      -[UILabel setEnabled:](-[CACentralTableViewCell inputLabel](v7, "inputLabel"), "setEnabled:", 0);
      v14 = 0;
    }
    -[UILabel setEnabled:](-[CACentralTableViewCell outputLabel](v7, "outputLabel"), "setEnabled:", v14);
    -[CACentralTableViewCell stopIndicator](v7, "stopIndicator");
    -[CACentralTableViewCell setNeedsUpdateConstraints](v7, "setNeedsUpdateConstraints");
    -[CACentralTableViewCell updateConstraintsIfNeeded](v7, "updateConstraintsIfNeeded");
  }
  else
  {
    v7 = (CACentralTableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("NoItems"));
    if (!v7)
    {
      v7 = (CACentralTableViewCell *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("NoItems"));
      v12 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
      self->indicator = v12;
      -[UIActivityIndicatorView setTag:](v12, "setTag:", 1);
      -[UIActivityIndicatorView setAutoresizingMask:](self->indicator, "setAutoresizingMask:", 33);
      -[UIActivityIndicatorView setFrame:](self->indicator, "setFrame:", 0.0, 0.0, 24.0, 24.0);
      -[UIActivityIndicatorView setHidesWhenStopped:](self->indicator, "setHidesWhenStopped:", 0);
      -[UIActivityIndicatorView setHidden:](self->indicator, "setHidden:", 0);
      -[CACentralTableViewCell setAccessoryView:](v7, "setAccessoryView:", self->indicator);

    }
    v13 = (void *)-[CACentralTableViewCell textLabel](v7, "textLabel");
    objc_msgSend(v13, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Searching"), (uint64_t)CFSTR("Searching for Bluetooth LE MIDI Devices...")));
    objc_msgSend(v13, "setEnabled:", 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CABTMIDICentralViewController_tableView_cellForRowAtIndexPath___block_invoke;
    block[3] = &unk_24CF54EF0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  return v7;
}

uint64_t __65__CABTMIDICentralViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "startAnimating");
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)priv_getBTLELocalizedString((uint64_t)CFSTR("Forget"), (uint64_t)CFSTR("Forget"));
}

- (void)viewWillAppear:(BOOL)a3
{
  NSTimer *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CABTMIDICentralViewController updatePeripheralTable](self, "updatePeripheralTable");
  if (!self->connectionTimer)
  {
    v4 = (NSTimer *)objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_centralTimerFired_, 0, 1, 5.0);
    self->connectionTimer = v4;
    -[NSTimer setTolerance:](v4, "setTolerance:", 0.150000006);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    objc_msgSend(v5, "addTimer:forMode:", self->connectionTimer, *MEMORY[0x24BDBCB80]);
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  unint64_t v6;

  v6 = -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount", a3);
  if (v6)
  {
    if (self->inEditingMode)
      LOBYTE(v6) = 1;
    else
      LOBYTE(v6) = objc_msgSend(-[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a4, "row")), "isAvailable");
  }
  return v6;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  self->inEditingMode = a3;
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController setEditing:animated:](&v5, sel_setEditing_animated_);
  -[CABTMIDICentralViewController updateButtonsToMatchTableState](self, "updateButtonsToMatchTableState");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v7;
  id v8;
  int v9;
  int v10;

  v7 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if ((objc_msgSend(v7, "isEditing") & 1) == 0 && !self->inEditingMode)
  {
    v8 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a4, "row"));
    if ((objc_msgSend(v8, "isOnline") & 1) != 0)
    {
      v9 = objc_msgSend(v8, "disconnect");
      if (v7)
      {
        if (v9)
        {
          objc_msgSend((id)objc_msgSend(v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("dis..."), (uint64_t)CFSTR("Disconnecting...")));
          objc_msgSend(v7, "startIndicator");
        }
      }
    }
    else
    {
      v10 = objc_msgSend(v8, "connect");
      if (v7 && v10)
      {
        objc_msgSend(v7, "startIndicator");
        objc_msgSend((id)objc_msgSend(v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("con..."), (uint64_t)CFSTR("Connecting...")));
      }
    }
    objc_msgSend(a3, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
    -[CABTMIDICentralViewController updateButtonsToMatchTableState](self, "updateButtonsToMatchTableState");
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount", a3, a4) != 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;

  if (a4 == 1)
  {
    v6 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a5, "row", a3));
    v7 = MIDISetupRemoveDevice(objc_msgSend(MEMORY[0x24BDBFBE8], "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", objc_msgSend(v6, "uuid"), 0, 1));
    if ((_DWORD)v7)
      NSLog(CFSTR("error removing device %@: %d"), objc_msgSend(v6, "uuid"), v7);
    else
      -[CABTMIDICentralViewController updatePeripheralTable](self, "updatePeripheralTable");
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  unint64_t v6;

  v6 = -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount", a3);
  if (v6)
  {
    if (self->inEditingMode)
      LOBYTE(v6) = 1;
    else
      LOBYTE(v6) = objc_msgSend(-[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a4, "row")), "isAvailable") ^ 1;
  }
  return v6;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CABTMIDICentralViewController cleanup](self, "cleanup");
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)centralTimerFired:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CABTMIDICentralViewController_centralTimerFired___block_invoke;
  block[3] = &unk_24CF54EF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_BYTE *__51__CABTMIDICentralViewController_centralTimerFired___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[1040])
    return (_BYTE *)objc_msgSend((id)objc_msgSend(result, "view"), "reloadData");
  return result;
}

- (void)updateButtonsToMatchTableState
{
  NSMutableArray *peripheralList;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  UIBarButtonItem *cancelButton;
  UIBarButtonItem *forgetButton;
  UIBarButtonItem *editButton;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[CABTMIDICentralViewController navigationItem](self, "navigationItem"))
  {
    if (!-[CABTMIDICentralViewController peripheralCount](self, "peripheralCount"))
      goto LABEL_16;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    peripheralList = self->peripheralList;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peripheralList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v4)
      goto LABEL_16;
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(peripheralList);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isAvailable") ^ 1;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peripheralList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
    if (v6)
    {
      if (objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view"), "isEditing"))
      {
        cancelButton = self->cancelButton;
        if (!cancelButton)
        {
          cancelButton = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAction_);
          self->cancelButton = cancelButton;
        }
        objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", cancelButton);
        forgetButton = self->forgetButton;
        if (!forgetButton)
        {
          forgetButton = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", priv_getBTLELocalizedString((uint64_t)CFSTR("Forget"), (uint64_t)CFSTR("Forget")), 0, self, sel_forgetAction_);
          self->forgetButton = forgetButton;
        }
        goto LABEL_18;
      }
      editButton = self->editButton;
      if (!editButton)
      {
        editButton = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editAction_);
        self->editButton = editButton;
      }
    }
    else
    {
LABEL_16:
      editButton = self->previousRightItem;
    }
    objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", editButton);
    forgetButton = self->previousLeftItem;
LABEL_18:
    objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", forgetButton);
  }
}

- (void)editAction:(id)a3
{
  -[CABTMIDICentralViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)cancelAction:(id)a3
{
  -[CABTMIDICentralViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)forgetAction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view", a3), "indexPathsForSelectedRows");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "row"));
        v10 = MIDISetupRemoveDevice(objc_msgSend(MEMORY[0x24BDBFBE8], "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", objc_msgSend(v9, "uuid"), 0, 1));
        if ((_DWORD)v10)
          NSLog(CFSTR("error removing device %@: %d"), objc_msgSend(v9, "uuid"), v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v4, "count"))
    -[CABTMIDICentralViewController updatePeripheralTable](self, "updatePeripheralTable");
  -[CABTMIDICentralViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

@end
