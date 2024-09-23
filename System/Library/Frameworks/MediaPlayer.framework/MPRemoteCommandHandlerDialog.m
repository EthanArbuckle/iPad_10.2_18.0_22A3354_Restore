@implementation MPRemoteCommandHandlerDialog

- (MPRemoteCommandHandlerDialog)initWithMediaRemoteType:(id)a3
{
  id v5;
  MPRemoteCommandHandlerDialog *v6;
  MPRemoteCommandHandlerDialog *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPRemoteCommandHandlerDialog;
  v6 = -[MPRemoteCommandHandlerDialog init](&v9, sel_init);
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
  -[MPRemoteCommandHandlerDialog localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandHandlerDialog localizedMessage](self, "localizedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandHandlerDialog actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title=\"%@\" message=\"%@\" actions=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRemoteType:", v5);
  return v6;
}

- (void)addAction:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "type");
  objc_msgSend(v16, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D4C628];
    objc_msgSend(v16, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "command");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mediaRemoteCommandType");
    objc_msgSend(v16, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaRemoteOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventWithCommand:options:", v9, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v4 != 2)
    v4 = v4 == 1;
  v12 = (void *)MEMORY[0x1E0D4C620];
  objc_msgSend(v16, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:type:commandEvent:", v13, v4, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v14);

}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalizedTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedTitle:", v4);

}

- (NSString)localizedMessage
{
  void *v2;
  void *v3;

  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalizedMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedMessage:", v4);

}

- (NSArray)actions
{
  void *v2;
  void *v3;
  void *v4;

  -[MPRemoteCommandHandlerDialog mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_map:", &__block_literal_global_30193);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (MRSendCommandHandlerDialog)mediaRemoteType
{
  return self->_mediaRemoteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteType, 0);
}

MPRemoteCommandHandlerDialogAction *__39__MPRemoteCommandHandlerDialog_actions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MPRemoteCommandHandlerDialogAction *v3;

  v2 = a2;
  v3 = -[MPRemoteCommandHandlerDialogAction initWithMediaRemoteType:]([MPRemoteCommandHandlerDialogAction alloc], "initWithMediaRemoteType:", v2);

  return v3;
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D4C618], "dialogWithTitle:message:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v5);

  return v6;
}

@end
