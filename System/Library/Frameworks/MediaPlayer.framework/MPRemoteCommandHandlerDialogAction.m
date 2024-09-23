@implementation MPRemoteCommandHandlerDialogAction

- (MPRemoteCommandHandlerDialogAction)initWithMediaRemoteType:(id)a3
{
  id v5;
  MPRemoteCommandHandlerDialogAction *v6;
  MPRemoteCommandHandlerDialogAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPRemoteCommandHandlerDialogAction;
  v6 = -[MPRemoteCommandHandlerDialogAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaRemoteType, a3);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPRemoteCommandHandlerDialogAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMPRemoteCommandHandlerDialogActionType(-[MPRemoteCommandHandlerDialogAction type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandHandlerDialogAction event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title=\"%@\" type=%@ event=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MPRemoteCommandHandlerDialogAction mediaRemoteType](self, "mediaRemoteType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRemoteType:", v5);
  return v6;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[MPRemoteCommandHandlerDialogAction mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)type
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[MPRemoteCommandHandlerDialogAction mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 == 1;

  return v4;
}

- (MPRemoteCommandEvent)event
{
  void *v2;
  void *v3;
  MPRemoteCommand *v4;
  MPRemoteCommandEvent *v5;
  uint64_t v6;
  void *v7;
  MPRemoteCommandEvent *v8;

  -[MPRemoteCommandHandlerDialogAction mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[MPRemoteCommand initWithMediaRemoteCommandType:]([MPRemoteCommand alloc], "initWithMediaRemoteCommandType:", objc_msgSend(v3, "command"));
    v5 = [MPRemoteCommandEvent alloc];
    v6 = objc_msgSend(v3, "command");
    objc_msgSend(v3, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](v5, "initWithCommand:mediaRemoteType:options:", v4, v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MRSendCommandHandlerDialogAction)mediaRemoteType
{
  return self->_mediaRemoteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteType, 0);
}

+ (id)actionWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a3;
  if (a5)
  {
    v9 = a5;
    objc_msgSend(v9, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mediaRemoteCommandType");

    v12 = (void *)MEMORY[0x1E0D4C628];
    objc_msgSend(v9, "mediaRemoteOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "eventWithCommand:options:", v11, v13);
    a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4 == 2)
    v14 = 2;
  else
    v14 = a4 == 1;
  objc_msgSend(MEMORY[0x1E0D4C620], "actionWithTitle:type:commandEvent:", v8, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v15);

  return v16;
}

@end
