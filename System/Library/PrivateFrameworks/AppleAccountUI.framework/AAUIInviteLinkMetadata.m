@implementation AAUIInviteLinkMetadata

- (AAUIInviteLinkMetadata)initWithContext:(id)a3
{
  id v5;
  AAUIInviteLinkMetadata *v6;
  AAUIInviteLinkMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIInviteLinkMetadata;
  v6 = -[AAUIInviteLinkMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (LPLinkMetadata)bubbleMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[AAUIInviteLinkMetadata context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[AAUIInviteLinkMetadata image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  -[AAUIInviteLinkMetadata context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSummary:", v8);

  -[AAUIInviteLinkMetadata context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inviteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalURL:", v10);

  -[AAUIInviteLinkMetadata context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inviteURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0CC1240]);
  -[AAUIInviteLinkMetadata context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v15);

  -[AAUIInviteLinkMetadata context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle:", v17);

  -[AAUIInviteLinkMetadata context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAction:", v19);

  objc_msgSend(v3, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v20);

  -[AAUIInviteLinkMetadata icon](self, "icon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIcon:", v21);

  -[AAUIInviteLinkMetadata context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "secondaryTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKind:", v23);

  objc_msgSend(v3, "setSpecialization:", v13);
  return (LPLinkMetadata *)v3;
}

- (AAMessagesInviteContext)context
{
  return self->_context;
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
