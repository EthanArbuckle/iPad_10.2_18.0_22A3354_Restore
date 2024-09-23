@implementation APClientInfoUI

- (id)keyboards
{
  void *v3;
  NSArray *v4;
  NSArray *userKeyboards;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "normalizedEnabledInputModeIdentifiers");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    userKeyboards = self->_userKeyboards;
    self->_userKeyboards = v4;

    return self->_userKeyboards;
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_227BEF098;
    v10[3] = &unk_24F05BBD0;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
    v7 = self->_userKeyboards;
    if (v7)
      v8 = v7;
    else
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v9 = v8;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    return v9;
  }
}

- (void)orientationChanged:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  APClientInfoUI *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "orientation");
    if ((unint64_t)(v7 - 1) >= 4)
      v8 = -1;
    else
      v8 = v7 - 1;

  }
  else
  {
    v8 = -1;
  }
  v9 = self;
  objc_sync_enter(v9);
  -[APClientInfo setOrientation:](v9, "setOrientation:", v8);
  objc_sync_exit(v9);

  -[APClientInfo updateActiveClientInfo](v9, "updateActiveClientInfo");
}

- (APClientInfoUI)init
{
  APClientInfoUI *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APClientInfoUI;
  v2 = -[APClientInfoUI init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[APClientInfo setInterfaceIdiom:](v2, "setInterfaceIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));

    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[APClientInfo setScale:](v2, "setScale:", v6);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;

    -[APClientInfo setScreenWidth:](v2, "setScreenWidth:", (uint64_t)v9);
    -[APClientInfo setScreenHeight:](v2, "setScreenHeight:", (uint64_t)v11);
    -[APClientInfoUI orientationChanged:](v2, "orientationChanged:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_orientationChanged_, *MEMORY[0x24BDF76D8], 0);

    -[APClientInfo updateActiveClientInfo](v2, "updateActiveClientInfo");
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_253DA4DC8 != -1)
    dispatch_once(&qword_253DA4DC8, &unk_24F05BBA8);
  return (id)qword_253DA4DD0;
}

- (id)initForTesting
{
  return (id)MEMORY[0x24BEDD108](self, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)APClientInfoUI;
  -[APClientInfoUI dealloc](&v4, sel_dealloc);
}

- (NSArray)userKeyboards
{
  return self->_userKeyboards;
}

- (void)setUserKeyboards:(id)a3
{
  objc_storeStrong((id *)&self->_userKeyboards, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyboards, 0);
}

@end
