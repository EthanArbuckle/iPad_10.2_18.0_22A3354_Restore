@implementation _DKDataProtectionStateMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKDataProtectionStateMonitor setChangeHandler:](self, "setChangeHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_DKDataProtectionStateMonitor;
  -[_DKDataProtectionStateMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_DKDataProtectionMonitor isDataAvailableFor:]((uint64_t)self->_main, a3);
}

- (void)setChangeHandler:(id)a3
{
  id v4;
  NSUUID *handlerUUID;
  NSUUID *v6;
  NSUUID *v7;
  id v8;

  v4 = a3;
  handlerUUID = self->_handlerUUID;
  v8 = v4;
  if (handlerUUID)
  {
    -[_DKDataProtectionMonitor deregisterStateChangeHandler:]((uint64_t)self->_main, handlerUUID);
    v4 = v8;
  }
  if (v4)
  {
    -[_DKDataProtectionMonitor registerStateChangeHandler:]((uint64_t)self->_main, v4);
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v7 = self->_handlerUUID;
    self->_handlerUUID = v6;

    v4 = v8;
  }

}

- (_DKDataProtectionStateMonitor)init
{
  _DKDataProtectionStateMonitor *v2;
  uint64_t v3;
  _DKDataProtectionMonitor *main;
  NSUUID *handlerUUID;
  id changeHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKDataProtectionStateMonitor;
  v2 = -[_DKDataProtectionStateMonitor init](&v8, sel_init);
  if (v2)
  {
    +[_DKDataProtectionMonitor sharedInstance]();
    v3 = objc_claimAutoreleasedReturnValue();
    main = v2->_main;
    v2->_main = (_DKDataProtectionMonitor *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    changeHandler = v2->_changeHandler;
    v2->_changeHandler = 0;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_main, 0);
}

- (id)changeHandler
{
  return (id)MEMORY[0x193FEEAF4](self->_changeHandler, a2);
}

@end
