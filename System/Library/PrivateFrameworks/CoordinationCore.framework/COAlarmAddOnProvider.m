@implementation COAlarmAddOnProvider

- (COAlarmAddOnProvider)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9;
  id v10;
  id v11;
  COAlarmAddOnProvider *v12;
  COAlarmAddOnProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmAddOnProvider;
  v12 = -[COAlarmAddOnProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alarmManager, a3);
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
  }

  return v13;
}

- (COAlarmAddOnProvider)init
{
  id v3;
  void *v4;
  void *v5;
  COAlarmAddOnProvider *v6;

  v3 = objc_alloc_init(MEMORY[0x24BE67828]);
  +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[COHomeHubAdapter sharedInstance](COHomeHubAdapter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COAlarmAddOnProvider initWithAlarmManager:homekitAdapter:hubAdapter:](self, "initWithAlarmManager:homekitAdapter:hubAdapter:", v3, v4, v5);

  return v6;
}

- (id)serviceAddOn
{
  COMeshAlarmAddOn *v3;
  void *v4;
  void *v5;
  void *v6;
  COMeshAlarmAddOn *v7;

  v3 = [COMeshAlarmAddOn alloc];
  -[COAlarmAddOnProvider alarmManager](self, "alarmManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmAddOnProvider homekit](self, "homekit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmAddOnProvider homehub](self, "homehub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COMeshAlarmAddOn initWithAlarmManager:homekitAdapter:hubAdapter:](v3, "initWithAlarmManager:homekitAdapter:hubAdapter:", v4, v5, v6);

  return v7;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
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
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end
