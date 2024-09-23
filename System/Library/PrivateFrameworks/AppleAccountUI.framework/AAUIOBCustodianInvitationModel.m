@implementation AAUIOBCustodianInvitationModel

- (AAUIOBCustodianInvitationModel)initWithType:(int64_t)a3 initiatorsHandle:(id)a4
{
  AAUIOBCustodianInvitationModel *v4;
  AAUIOBCustodianInvitationModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIOBCustodianInvitationModel;
  v4 = -[AAOBCustodianInvitationModel initWithType:ownerHandle:](&v7, sel_initWithType_ownerHandle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AAUIOBCustodianInvitationModel _setupAAUIOBWelcomeControllerProtocolProperties](v4, "_setupAAUIOBWelcomeControllerProtocolProperties");
  return v5;
}

- (AAUIOBCustodianInvitationModel)initWithModel:(id)a3
{
  id v4;
  AAUIOBCustodianInvitationModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AAUIOBCustodianInvitationModel;
  v5 = -[AAUIOBCustodianInvitationModel init](&v16, sel_init);
  if (v5)
  {
    -[AAOBCustodianInvitationModel setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "detailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setDetailText:](v5, "setDetailText:", v6);

    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setPrimaryButton:](v5, "setPrimaryButton:", v8);

    objc_msgSend(v4, "secondaryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setSecondaryButton:](v5, "setSecondaryButton:", v9);

    objc_msgSend(v4, "ownerHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setOwnerHandle:](v5, "setOwnerHandle:", v10);

    objc_msgSend(v4, "custodianshipInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setCustodianshipInfo:](v5, "setCustodianshipInfo:", v11);

    objc_msgSend(v4, "helpLinkTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setHelpLinkTitle:](v5, "setHelpLinkTitle:", v12);

    objc_msgSend(v4, "helpLinkURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setHelpLinkURL:](v5, "setHelpLinkURL:", v13);

    objc_msgSend(v4, "imageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianInvitationModel setImageName:](v5, "setImageName:", v14);

    -[AAUIOBCustodianInvitationModel _setupAAUIOBWelcomeControllerProtocolProperties](v5, "_setupAAUIOBWelcomeControllerProtocolProperties");
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
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0CFACD8];
  -[AAOBCustodianInvitationModel ownerHandle](self, "ownerHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactInfoForHandle:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFACD8], "firstNameForLocalContactInfo:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel detailsTextWithFirstName:fullName:](self, "detailsTextWithFirstName:fullName:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel setDetailText:](self, "setDetailText:", v7);

  self->_contentViewLayout = 2;
  -[AAOBCustodianInvitationModel imageName](self, "imageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0DC3870];
    -[AAOBCustodianInvitationModel imageName](self, "imageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBCustodianInvitationModel setImage:](self, "setImage:", v13);

  }
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
  -[AAOBCustodianInvitationModel imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel helpLinkURL](self, "helpLinkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel helpLinkTitle](self, "helpLinkTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel ownerHandle](self, "ownerHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel recipientHandle](self, "recipientHandle");
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
