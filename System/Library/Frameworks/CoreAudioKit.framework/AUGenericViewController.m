@implementation AUGenericViewController

- (AUGenericViewController)init
{
  AUGenericViewController *v2;
  _TtC12CoreAudioKit21AUGenericViewInternal *v3;
  _TtC12CoreAudioKit21AUGenericViewInternal *genericView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUGenericViewController;
  v2 = -[AUGenericViewController init](&v6, sel_init);
  v3 = -[AUGenericViewInternal initWithFrame:]([_TtC12CoreAudioKit21AUGenericViewInternal alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  genericView = v2->_genericView;
  v2->_genericView = v3;

  -[AUGenericViewInternal setAutoresizingMask:](v2->_genericView, "setAutoresizingMask:", 18);
  -[AUGenericViewInternal setOwningController:](v2->_genericView, "setOwningController:", v2);
  return v2;
}

- (void)genericViewNotificationMessageReceived:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("param.address"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("param.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    -[AUAudioUnit parameterTree](self->_auAudioUnit, "parameterTree");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameterWithAddress:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[AUGenericViewInternal paramObserverToken](self->_genericView, "paramObserverToken");
    LODWORD(v13) = v9;
    objc_msgSend(v11, "setValue:originator:atHostTime:eventType:", v12, 0, 0, v13);

    v4 = v14;
  }

}

- (void)genericViewBeginGestureMessageReceived:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("param.address"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("param.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    -[AUAudioUnit parameterTree](self->_auAudioUnit, "parameterTree");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameterWithAddress:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[AUGenericViewInternal paramObserverToken](self->_genericView, "paramObserverToken");
    LODWORD(v13) = v9;
    objc_msgSend(v11, "setValue:originator:atHostTime:eventType:", v12, 0, 1, v13);

    v4 = v14;
  }

}

- (void)genericViewEndGestureMessageReceived:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("param.address"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("param.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    -[AUAudioUnit parameterTree](self->_auAudioUnit, "parameterTree");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameterWithAddress:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[AUGenericViewInternal paramObserverToken](self->_genericView, "paramObserverToken");
    LODWORD(v13) = v9;
    objc_msgSend(v11, "setValue:originator:atHostTime:eventType:", v12, 0, 2, v13);

    v4 = v14;
  }

}

- (void)setAuAudioUnit:(AUAudioUnit *)auAudioUnit
{
  AUAudioUnit *v4;
  AUAudioUnit *v5;

  v4 = auAudioUnit;
  -[AUGenericViewInternal setAuAudioUnit:](self->_genericView, "setAuAudioUnit:", v4);
  v5 = self->_auAudioUnit;
  self->_auAudioUnit = v4;

}

- (id)getAuAudioUnit
{
  return self->_auAudioUnit;
}

- (void)setAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE0A830], "auAudioUnitForAudioUnit:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AUGenericViewController setAuAudioUnit:](self, "setAuAudioUnit:", v4);

}

- (void)addGestureObservers
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_genericViewNotificationMessageReceived_, genericViewNotificationMessageName, self->_genericView);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_genericViewBeginGestureMessageReceived_, genericViewNotificationBeginGestureName, self->_genericView);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_genericViewEndGestureMessageReceived_, genericViewNotificationEndGestureName, self->_genericView);

}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AUGenericViewController;
  -[AUGenericViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[AUGenericViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AUGenericViewController genericView](self, "genericView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[AUGenericViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUGenericViewController genericView](self, "genericView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[AUGenericViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUGenericViewController;
  -[AUGenericViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AUGenericViewController;
  -[AUGenericViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AUGenericViewController addGestureObservers](self, "addGestureObservers");
}

- (AUAudioUnit)auAudioUnit
{
  return self->_auAudioUnit;
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)genericView
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)objc_getProperty(self, a2, 976, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericView, 0);
  objc_storeStrong((id *)&self->_auAudioUnit, 0);
}

@end
