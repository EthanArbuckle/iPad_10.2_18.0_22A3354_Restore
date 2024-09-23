@implementation _OSDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return (id)*MEMORY[0x24BDD0CD0];
}

+ (id)dataProtectionClassC
{
  return (id)*MEMORY[0x24BDD0CE0];
}

+ (id)dataProtectionClassD
{
  return (id)*MEMORY[0x24BDD0CF8];
}

- (_OSDataProtectionStateMonitor)init
{
  _OSDataProtectionStateMonitor *v2;
  uint64_t v3;
  _OSDataProtectionManager *manager;
  NSUUID *handlerUUID;
  id changeHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_OSDataProtectionStateMonitor;
  v2 = -[_OSDataProtectionStateMonitor init](&v8, sel_init);
  if (v2)
  {
    +[_OSDataProtectionManager sharedInstance](_OSDataProtectionManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    manager = v2->_manager;
    v2->_manager = (_OSDataProtectionManager *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    changeHandler = v2->_changeHandler;
    v2->_changeHandler = 0;

  }
  return v2;
}

- (void)dealloc
{
  id changeHandler;
  _OSDataProtectionManager *manager;
  objc_super v5;

  changeHandler = self->_changeHandler;
  self->_changeHandler = 0;

  manager = self->_manager;
  self->_manager = 0;

  v5.receiver = self;
  v5.super_class = (Class)_OSDataProtectionStateMonitor;
  -[_OSDataProtectionStateMonitor dealloc](&v5, sel_dealloc);
}

- (void)setChangeHandler:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *handlerUUID;
  void *v7;
  id changeHandler;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_handlerUUID)
  {
    -[_OSDataProtectionManager deregisterStateChangeHandler:](self->_manager, "deregisterStateChangeHandler:");
    v4 = v9;
  }
  if (v4)
  {
    -[_OSDataProtectionManager registerStateChangeHandler:](self->_manager, "registerStateChangeHandler:", v4);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    v4 = v9;
  }
  v7 = (void *)MEMORY[0x2207CDC38](v4);
  changeHandler = self->_changeHandler;
  self->_changeHandler = v7;

}

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_OSDataProtectionManager isDataAvailableFor:](self->_manager, "isDataAvailableFor:", a3);
}

- (BOOL)unnotifiedIsDataAvailableForClassC
{
  if (-[_OSDataProtectionManager deviceHasBeenUnlockedSinceBoot](self->_manager, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_OSDataProtectionManager deviceIsPasswordConfigured](self->_manager, "deviceIsPasswordConfigured");
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (_OSDataProtectionManager)manager
{
  return self->_manager;
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
