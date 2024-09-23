@implementation MPCPlayerCommandDialogAction

- (MPCPlayerCommandDialogAction)initWithMPAction:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  MPCPlayerCommandDialogAction *v9;
  MPCPlayerCommandDialogAction *v10;
  uint64_t v11;
  MPCMediaRemoteController *controller;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPCPlayerCommandDialogAction;
  v9 = -[MPCPlayerCommandDialogAction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_msgSend(v8, "controller");
    v11 = objc_claimAutoreleasedReturnValue();
    controller = v10->_controller;
    v10->_controller = (MPCMediaRemoteController *)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPRemoteCommandHandlerDialogAction title](self->_action, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandHandlerDialogAction type](self->_action, "type");
  NSStringFromMPRemoteCommandHandlerDialogActionType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerCommandDialogAction commandRequest](self, "commandRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title=\"%@\" type=%@ commandRequest=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)type
{
  int64_t result;

  result = -[MPRemoteCommandHandlerDialogAction type](self->_action, "type");
  if (result != 2)
    return result == 1;
  return result;
}

- (NSString)localizedTitle
{
  return (NSString *)-[MPRemoteCommandHandlerDialogAction title](self->_action, "title");
}

- (id)commandRequest
{
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MPCMediaRemoteController *controller;
  void *v11;
  void *v12;
  MPCPlayerCommandRequest *v13;

  -[MPRemoteCommandHandlerDialogAction event](self->_action, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [MPCPlayerCommandRequest alloc];
    -[MPRemoteCommandHandlerDialogAction event](self->_action, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mediaRemoteCommandType");
    -[MPRemoteCommandHandlerDialogAction event](self->_action, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaRemoteOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    controller = self->_controller;
    -[MPRemoteCommandHandlerDialogAction title](self->_action, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("DialogAction:%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", v6, v8, controller, v12);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
