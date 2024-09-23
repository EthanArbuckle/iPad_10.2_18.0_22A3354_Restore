@implementation COTimerAddOnProvider

- (COTimerAddOnProvider)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9;
  id v10;
  id v11;
  COTimerAddOnProvider *v12;
  COTimerAddOnProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)COTimerAddOnProvider;
  v12 = -[COTimerAddOnProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timerManager, a3);
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
  }

  return v13;
}

- (COTimerAddOnProvider)init
{
  id v3;
  void *v4;
  void *v5;
  COTimerAddOnProvider *v6;

  v3 = objc_alloc_init(MEMORY[0x24BE67870]);
  +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[COHomeHubAdapter sharedInstance](COHomeHubAdapter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COTimerAddOnProvider initWithTimerManager:homekitAdapter:hubAdapter:](self, "initWithTimerManager:homekitAdapter:hubAdapter:", v3, v4, v5);

  return v6;
}

- (id)serviceAddOn
{
  COMeshTimerAddOn *v3;
  void *v4;
  void *v5;
  void *v6;
  COMeshTimerAddOn *v7;

  v3 = [COMeshTimerAddOn alloc];
  -[COTimerAddOnProvider timerManager](self, "timerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COTimerAddOnProvider homekit](self, "homekit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COTimerAddOnProvider homehub](self, "homehub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COMeshTimerAddOn initWithTimerManager:homekitAdapter:hubAdapter:](v3, "initWithTimerManager:homekitAdapter:hubAdapter:", v4, v5, v6);

  return v7;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (COHomeKitAdapter)homekit
{
  return self->_homekit;
}

- (COHomeHubAdapter)homehub
{
  return self->_homehub;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end
