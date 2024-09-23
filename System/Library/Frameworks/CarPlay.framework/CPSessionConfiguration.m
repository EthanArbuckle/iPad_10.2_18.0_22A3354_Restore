@implementation CPSessionConfiguration

- (CPSessionConfiguration)initWithDelegate:(id)delegate
{
  id v4;
  CPSessionConfiguration *v5;
  CPSessionConfiguration *v6;
  CARSessionStatus *v7;
  CARSessionStatus *currentStatus;
  objc_super v10;

  v4 = delegate;
  v10.receiver = self;
  v10.super_class = (Class)CPSessionConfiguration;
  v5 = -[CPSessionConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x24BE15240]);
    currentStatus = v6->_currentStatus;
    v6->_currentStatus = v7;

    -[CARSessionStatus addSessionObserver:](v6->_currentStatus, "addSessionObserver:", v6);
    -[CPSessionConfiguration setupConfiguration](v6, "setupConfiguration");
  }

  return v6;
}

- (CPSessionConfiguration)initWithDelegate:(id)a3 templateEnvironment:(id)a4
{
  id v6;
  id v7;
  CPSessionConfiguration *v8;
  CPSessionConfiguration *v9;
  uint64_t v10;
  CARSessionStatus *currentStatus;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSessionConfiguration;
  v8 = -[CPSessionConfiguration init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    -[CPSessionConfiguration setTemplateEnvironment:](v9, "setTemplateEnvironment:", v7);
    objc_msgSend(v7, "sessionStatus");
    v10 = objc_claimAutoreleasedReturnValue();
    currentStatus = v9->_currentStatus;
    v9->_currentStatus = (CARSessionStatus *)v10;

    -[CARSessionStatus addSessionObserver:](v9->_currentStatus, "addSessionObserver:", v9);
    -[CPSessionConfiguration setupConfiguration](v9, "setupConfiguration");
  }

  return v9;
}

- (void)setupConfiguration
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__limitedUIDidChange_, *MEMORY[0x24BE151B8], 0);

  +[CPTemplateApplicationScene activeTemplateScene](CPTemplateApplicationScene, "activeTemplateScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSessionConfiguration _updateContentStyleWithScene:](self, "_updateContentStyleWithScene:", v5);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__contentStyleUpdated_, CFSTR("CPTemplateApplicationSceneContentStyleUpdated"), 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CARSessionStatus removeSessionObserver:](self->_currentStatus, "removeSessionObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE151B8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CPTemplateApplicationSceneContentStyleUpdated"), 0);

  v5.receiver = self;
  v5.super_class = (Class)CPSessionConfiguration;
  -[CPSessionConfiguration dealloc](&v5, sel_dealloc);
}

- (void)sessionDidConnect:(id)a3
{
  -[CPSessionConfiguration _limitedUIDidChange:](self, "_limitedUIDidChange:", 0);
}

- (void)_updateLimitedUIStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CPSessionConfiguration currentStatus](self, "currentStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "limitUserInterfaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v6, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSessionConfiguration setLimitedUserInterfaces:](self, "setLimitedUserInterfaces:", -[CPSessionConfiguration convertLimitableUserInterfaces:](self, "convertLimitableUserInterfaces:", objc_msgSend(v5, "limitableUserInterfaces")));

  }
  else
  {
    -[CPSessionConfiguration setLimitedUserInterfaces:](self, "setLimitedUserInterfaces:", 0);
  }

}

- (void)_limitedUIDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CPSessionConfiguration__limitedUIDidChange___block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__CPSessionConfiguration__limitedUIDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "limitedUserInterfaces");
  objc_msgSend(*(id *)(a1 + 32), "_updateLimitedUIStatus");
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "limitedUserInterfaces"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionConfiguration:limitedUserInterfacesChanged:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "limitedUserInterfaces"));

    }
  }
}

- (unint64_t)convertLimitableUserInterfaces:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  char v9;
  char HasAudioEntitlement;

  -[CPSessionConfiguration templateEnvironment](self, "templateEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HasAudioEntitlement = CPCurrentProcessHasAudioEntitlement();
    v8 = a3 & 1;
    if ((HasAudioEntitlement & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 1;
    return v8 | (a3 >> v9) & 2;
  }
  -[CPSessionConfiguration templateEnvironment](self, "templateEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasAudioEntitlement");

  v8 = a3 & 1;
  if ((v7 & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2;
  return v8 | (a3 >> v9) & 2;
}

- (void)_updateContentStyleWithScene:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "contentStyle") == 2)
    v4 = 2;
  else
    v4 = 1;
  -[CPSessionConfiguration setContentStyle:](self, "setContentStyle:", v4);
}

- (void)_contentStyleUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__CPSessionConfiguration__contentStyleUpdated___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __47__CPSessionConfiguration__contentStyleUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "contentStyle");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateContentStyleWithScene:", v4);

  if (v2 != objc_msgSend(*(id *)(a1 + 32), "contentStyle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sessionConfiguration:contentStyleChanged:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "contentStyle"));

    }
  }
}

- (CPLimitableUserInterface)limitedUserInterfaces
{
  return self->_limitedUserInterfaces;
}

- (void)setLimitedUserInterfaces:(unint64_t)a3
{
  self->_limitedUserInterfaces = a3;
}

- (CPContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (void)setContentStyle:(unint64_t)a3
{
  self->_contentStyle = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (CARSessionStatus)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
  objc_storeStrong((id *)&self->_currentStatus, a3);
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return (CPSTemplateEnvironment *)objc_loadWeakRetained((id *)&self->_templateEnvironment);
}

- (void)setTemplateEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_templateEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateEnvironment);
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
