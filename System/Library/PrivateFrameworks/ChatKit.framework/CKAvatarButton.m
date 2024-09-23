@implementation CKAvatarButton

- (CKAvatarButton)initWithPrimaryAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CKAvatarButton *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CNAvatarView *avatarView;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CEA3A8];
  v5 = a3;
  objc_msgSend(v4, "borderlessButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarButton buttonWithConfiguration:primaryAction:](CKAvatarButton, "buttonWithConfiguration:primaryAction:", v6, v5);
  v7 = (CKAvatarButton *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C97468]);
    objc_msgSend(MEMORY[0x1E0C97480], "defaultSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithSettings:", v9);
    avatarView = v7->_avatarView;
    v7->_avatarView = (CNAvatarView *)v10;

    -[CNAvatarView setUserInteractionEnabled:](v7->_avatarView, "setUserInteractionEnabled:", 0);
    -[CKAvatarButton addSubview:](v7, "addSubview:", v7->_avatarView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__handleConversationChange_, *MEMORY[0x1E0D35308], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__handleConversationChange_, *MEMORY[0x1E0D352F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__handleConversationChange_, *MEMORY[0x1E0D35418], 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKAvatarButton;
  -[CKAvatarButton layoutSubviews](&v17, sel_layoutSubviews);
  -[CKAvatarButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAvatarButton avatarView](self, "avatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKAvatarButton avatarView](self, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13 * 0.5;
  -[CKAvatarButton configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "background");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v14);

}

- (void)updateWithConversation:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_storeStrong((id *)&self->_conversation, a3);
  v5 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v16, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarButton avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "updateViewWithGroupIdentity:", v6);

  v9 = objc_msgSend(v16, "isBusinessConversation");
  -[CKAvatarButton avatarView](self, "avatarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStyle:", v9);

  -[CKAvatarButton setToolTip:](self, "setToolTip:", 0);
  -[CKAvatarButton conversation](self, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasDisplayName");
  -[CKAvatarButton conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
    objc_msgSend(v13, "displayName");
  else
    objc_msgSend(v13, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarButton setToolTip:](self, "setToolTip:", v15);

}

- (void)_handleConversationChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarButton conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    -[CKAvatarButton conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarButton updateWithConversation:](self, "updateWithConversation:", v9);

  }
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
