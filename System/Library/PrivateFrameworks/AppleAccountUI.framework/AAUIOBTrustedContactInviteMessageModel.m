@implementation AAUIOBTrustedContactInviteMessageModel

- (AAUIOBTrustedContactInviteMessageModel)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AAUIOBTrustedContactInviteMessageModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AAUIMessageBubbleView *v18;
  UIView *contentView;
  objc_super v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CFACD8];
  objc_msgSend(v4, "recipientHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactInfoForHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFACD8], "firstNameForLocalContactInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)AAUIOBTrustedContactInviteMessageModel;
  v9 = -[AAUIOBTrustedContactInviteMessageModel init](&v21, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "detailText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBTrustedContactInviteMessageModel setDetailText:](v9, "setDetailText:", v12);

    objc_msgSend(v4, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBTrustedContactInviteMessageModel setTitle:](v9, "setTitle:", v13);

    objc_msgSend(v4, "primaryButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBTrustedContactInviteMessageModel setPrimaryButton:](v9, "setPrimaryButton:", v14);

    objc_msgSend(v4, "secondaryButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBTrustedContactInviteMessageModel setSecondaryButton:](v9, "setSecondaryButton:", v15);

    objc_msgSend(v4, "recipientHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBTrustedContactInviteMessageModel setRecipientHandle:](v9, "setRecipientHandle:", v16);

    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F0321C10))
    {
      objc_msgSend(v4, "bubbleText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v18 = -[AAUIMessageBubbleView initWithText:]([AAUIMessageBubbleView alloc], "initWithText:", v17);
    contentView = v9->_contentView;
    v9->_contentView = &v18->super;

    v9->_contentViewLayout = 2;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AAOBTrustedContactInviteMessageModel imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel helpLinkURL](self, "helpLinkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel helpLinkTitle](self, "helpLinkTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel ownerHandle](self, "ownerHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBTrustedContactInviteMessageModel recipientHandle](self, "recipientHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\n"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
