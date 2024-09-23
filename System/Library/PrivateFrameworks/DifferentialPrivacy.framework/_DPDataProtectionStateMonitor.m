@implementation _DPDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return (id)*MEMORY[0x1E0CB2AB0];
}

+ (id)dataProtectionClassC
{
  return (id)*MEMORY[0x1E0CB2AC0];
}

+ (id)dataProtectionClassD
{
  return (id)*MEMORY[0x1E0CB2AE0];
}

- (_DPDataProtectionStateMonitor)init
{
  _DPDataProtectionStateMonitor *v2;
  uint64_t v3;
  _DPDataProtectionMaster *master;
  NSUUID *handlerUUID;
  id changeHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DPDataProtectionStateMonitor;
  v2 = -[_DPDataProtectionStateMonitor init](&v8, sel_init);
  if (v2)
  {
    +[_DPDataProtectionMaster sharedInstance](_DPDataProtectionMaster, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    master = v2->_master;
    v2->_master = (_DPDataProtectionMaster *)v3;

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
  _DPDataProtectionMaster *master;
  objc_super v5;

  changeHandler = self->_changeHandler;
  self->_changeHandler = 0;

  master = self->_master;
  self->_master = 0;

  v5.receiver = self;
  v5.super_class = (Class)_DPDataProtectionStateMonitor;
  -[_DPDataProtectionStateMonitor dealloc](&v5, sel_dealloc);
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
    -[_DPDataProtectionMaster deregisterStateChangeHandler:](self->_master, "deregisterStateChangeHandler:");
    v4 = v9;
  }
  if (v4)
  {
    -[_DPDataProtectionMaster registerStateChangeHandler:](self->_master, "registerStateChangeHandler:", v4);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    v4 = v9;
  }
  v7 = (void *)MEMORY[0x1D8256D34](v4);
  changeHandler = self->_changeHandler;
  self->_changeHandler = v7;

}

- (id)changeHandler
{
  return (id)MEMORY[0x1D8256D34](self->_changeHandler, a2);
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_DPDataProtectionMaster isDataAvailableFor:](self->_master, "isDataAvailableFor:", a3);
}

- (_DPDataProtectionMaster)master
{
  return self->_master;
}

- (NSUUID)handlerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_master, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
