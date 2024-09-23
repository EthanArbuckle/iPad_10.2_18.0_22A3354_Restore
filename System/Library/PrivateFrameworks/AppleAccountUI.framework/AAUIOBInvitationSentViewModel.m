@implementation AAUIOBInvitationSentViewModel

- (AAUIOBInvitationSentViewModel)initWithType:(int64_t)a3 recipientHandle:(id)a4
{
  AAUIOBInvitationSentViewModel *v4;
  AAUIOBInvitationSentViewModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIOBInvitationSentViewModel;
  v4 = -[AAOBInvitationSentModel initWithType:recipientHandle:](&v7, sel_initWithType_recipientHandle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AAUIOBInvitationSentViewModel _setupAAUIOBWelcomeControllerProtocolProperties](v4, "_setupAAUIOBWelcomeControllerProtocolProperties");
  return v5;
}

- (AAUIOBInvitationSentViewModel)initWithModel:(id)a3
{
  id v4;
  AAUIOBInvitationSentViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUIOBInvitationSentViewModel;
  v5 = -[AAUIOBInvitationSentViewModel init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "detailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBInvitationSentModel setDetailText:](v5, "setDetailText:", v6);

    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBInvitationSentModel setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBInvitationSentModel setPrimaryButton:](v5, "setPrimaryButton:", v8);

    objc_msgSend(v4, "secondaryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBInvitationSentModel setSecondaryButton:](v5, "setSecondaryButton:", v9);

    objc_msgSend(v4, "recipientHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBInvitationSentModel setRecipientHandle:](v5, "setRecipientHandle:", v10);

    -[AAUIOBInvitationSentViewModel _setupAAUIOBWelcomeControllerProtocolProperties](v5, "_setupAAUIOBWelcomeControllerProtocolProperties");
  }

  return v5;
}

- (void)_setupAAUIOBWelcomeControllerProtocolProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CFACD8];
  -[AAOBInvitationSentModel recipientHandle](self, "recipientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactInfoForHandle:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[AAOBInvitationSentModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel setDetailText:](self, "setDetailText:", v8);

  self->_contentViewLayout = 2;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
