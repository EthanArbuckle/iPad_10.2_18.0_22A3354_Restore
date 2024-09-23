@implementation ULBGRepeatingSystemTaskRequest

- (ULBGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 interval:(double)a4 minDurationBetweenInstances:(double)a5
{
  ULBGRepeatingSystemTaskRequest *v7;
  ULBGRepeatingSystemTaskRequest *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ULBGRepeatingSystemTaskRequest;
  v7 = -[ULBGSystemTaskRequest initWithIdentifier:](&v10, sel_initWithIdentifier_, a3);
  v8 = v7;
  if (v7)
  {
    -[ULBGRepeatingSystemTaskRequest setInterval:](v7, "setInterval:", a4);
    -[ULBGRepeatingSystemTaskRequest setMinDurationBetweenInstances:](v8, "setMinDurationBetweenInstances:", a5);
  }
  return v8;
}

- (id)createRequestFromSelf
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE0B718]);
  -[ULBGSystemTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  -[ULBGRepeatingSystemTaskRequest interval](self, "interval");
  objc_msgSend(v5, "setInterval:");
  -[ULBGRepeatingSystemTaskRequest minDurationBetweenInstances](self, "minDurationBetweenInstances");
  objc_msgSend(v5, "setMinDurationBetweenInstances:");
  objc_msgSend(v5, "setPriority:", -[ULBGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v5, "setRequiresProtectionClass:", -[ULBGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v5, "setResourceIntensive:", -[ULBGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v5, "setResources:", -[ULBGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v5, "setRequiresBuddyComplete:", -[ULBGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v5, "setRequiresUserInactivity:", -[ULBGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v5, "setPostInstall:", -[ULBGSystemTaskRequest postInstall](self, "postInstall"));
  return v5;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

+ (id)learningULBGRepeatingSystemTaskRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  ULBGRepeatingSystemTaskRequest *v8;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULLearningInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = objc_msgSend(&unk_2511EE410, "intValue");
  v7 = v6;

  v8 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.learning"), (double)v7, (double)v7 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v8, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v8, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v8, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v8, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v8, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v8, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v8, "setPostInstall:", 0);
  return v8;
}

+ (id)maintenanceULBGRepeatingSystemTaskRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  ULBGRepeatingSystemTaskRequest *v8;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULMaintenanceInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = objc_msgSend(&unk_2511EE410, "intValue");
  v7 = v6;

  v8 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.maintenance"), (double)v7, (double)v7 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v8, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v8, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v8, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v8, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v8, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v8, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v8, "setPostInstall:", 0);
  return v8;
}

+ (id)routineStateAnalyzerULBGRepeatingSystemTaskRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  ULBGRepeatingSystemTaskRequest *v8;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULRoutineStateRefreshInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = objc_msgSend(&unk_2511EE410, "intValue");
  v7 = v6;

  v8 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.routineStateAnalyzerExecute"), (double)v7, (double)v7 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v8, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v8, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v8, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v8, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v8, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v8, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v8, "setPostInstall:", 0);
  return v8;
}

+ (id)analyticsULBGRepeatingSystemTaskRequest
{
  double v2;
  ULBGRepeatingSystemTaskRequest *v3;

  v2 = (double)ULSettings::get<ULSettings::AnalyticsInterval>();
  v3 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.analytics"), v2, v2 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v3, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v3, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v3, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v3, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v3, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v3, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v3, "setPostInstall:", 0);
  return v3;
}

+ (id)wifiAnalyzerULBGRepeatingSystemTaskRequest
{
  double v2;
  ULBGRepeatingSystemTaskRequest *v3;

  v2 = (double)ULSettings::get<ULSettings::AnalyticsInterval>();
  v3 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.wifiAnalyzer"), v2, v2 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v3, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v3, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v3, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v3, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v3, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v3, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v3, "setPostInstall:", 0);
  return v3;
}

+ (id)exportBackupULBGRepeatingSystemTaskRequest
{
  ULBGRepeatingSystemTaskRequest *v2;

  v2 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.exportiCloudBackup"), 86400.0, 69120.0);
  -[ULBGSystemTaskRequest setPriority:](v2, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v2, "setRequiresProtectionClass:", 1);
  -[ULBGSystemTaskRequest setResourceIntensive:](v2, "setResourceIntensive:", 0);
  -[ULBGSystemTaskRequest setResources:](v2, "setResources:", 0);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v2, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v2, "setRequiresUserInactivity:", 0);
  -[ULBGSystemTaskRequest setPostInstall:](v2, "setPostInstall:", 0);
  return v2;
}

@end
