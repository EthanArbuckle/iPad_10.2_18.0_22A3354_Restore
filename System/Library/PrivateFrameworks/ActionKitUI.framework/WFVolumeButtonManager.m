@implementation WFVolumeButtonManager

- (WFVolumeButtonManager)initWithPressHandler:(id)a3
{
  id v5;
  WFVolumeButtonManager *v6;
  WFVolumeButtonManager *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  WFVolumeButtonManager *v12;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVolumeButtonManager.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFVolumeButtonManager;
  v6 = -[WFVolumeButtonManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WFVolumeButtonManager setPressHandler:](v6, "setPressHandler:", v5);
    v8 = _instanceCount;
    if (!_instanceCount)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWantsVolumeButtonEvents:", 1);

      v8 = _instanceCount;
    }
    _instanceCount = v8 + 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_volumeButtonPressed, *MEMORY[0x24BEBEA38], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_volumeButtonPressed, *MEMORY[0x24BEBEA30], 0);

    v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!--_instanceCount)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWantsVolumeButtonEvents:", 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)WFVolumeButtonManager;
  -[WFVolumeButtonManager dealloc](&v4, sel_dealloc);
}

- (void)volumeButtonPressed
{
  void (**v2)(void);

  -[WFVolumeButtonManager pressHandler](self, "pressHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)pressHandler
{
  return self->_pressHandler;
}

- (void)setPressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pressHandler, 0);
}

@end
