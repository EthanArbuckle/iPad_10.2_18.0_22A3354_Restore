@implementation MPCPlayerCommandDialog

- (MPCPlayerCommandDialog)initWithMPDialog:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  MPCPlayerCommandDialog *v9;
  MPCPlayerCommandDialog *v10;
  void *v11;
  uint64_t v12;
  NSArray *actions;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCPlayerCommandDialog;
  v9 = -[MPCPlayerCommandDialog init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dialog, a3);
    -[MPRemoteCommandHandlerDialog actions](v10->_dialog, "actions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__MPCPlayerCommandDialog_initWithMPDialog_request___block_invoke;
    v15[3] = &unk_24CAB4270;
    v16 = v8;
    objc_msgSend(v11, "msv_map:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    actions = v10->_actions;
    v10->_actions = (NSArray *)v12;

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
  -[MPCPlayerCommandDialog localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerCommandDialog localizedMessage](self, "localizedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerCommandDialog actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title=\"%@\" message=\"%@\" actions=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localizedTitle
{
  return (NSString *)-[MPRemoteCommandHandlerDialog localizedTitle](self->_dialog, "localizedTitle");
}

- (NSString)localizedMessage
{
  return (NSString *)-[MPRemoteCommandHandlerDialog localizedMessage](self->_dialog, "localizedMessage");
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
}

MPCPlayerCommandDialogAction *__51__MPCPlayerCommandDialog_initWithMPDialog_request___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MPCPlayerCommandDialogAction *v4;

  v3 = a2;
  v4 = -[MPCPlayerCommandDialogAction initWithMPAction:request:]([MPCPlayerCommandDialogAction alloc], "initWithMPAction:request:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

@end
