@implementation AAUIInviteLinkMetadataProvider

- (AAUIInviteLinkMetadataProvider)initWithContext:(id)a3
{
  id v5;
  AAUIInviteLinkMetadataProvider *v6;
  AAUIInviteLinkMetadataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIInviteLinkMetadataProvider;
  v6 = -[AAUIInviteLinkMetadataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)loadMetadataWithImage:(id)a3 completion:(id)a4
{
  void (**v6)(id, AAUIInviteLinkMetadata *, _QWORD);
  AAUIInviteLinkMetadata *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, AAUIInviteLinkMetadata *, _QWORD))a4;
  v7 = -[AAUIInviteLinkMetadata initWithContext:]([AAUIInviteLinkMetadata alloc], "initWithContext:", self->_context);
  if (v9)
    -[AAUIInviteLinkMetadataProvider _lpImageWithImage:](self, "_lpImageWithImage:", v9);
  else
    -[AAUIInviteLinkMetadataProvider _defaultBackgroundImage](self, "_defaultBackgroundImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInviteLinkMetadata setImage:](v7, "setImage:", v8);

  v6[2](v6, v7, 0);
}

- (id)_lpImageWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CC1178];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPlatformImage:", v4);

  return v5;
}

- (id)_defaultBackgroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("message_invite_background"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIInviteLinkMetadataProvider _lpImageWithImage:](self, "_lpImageWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
