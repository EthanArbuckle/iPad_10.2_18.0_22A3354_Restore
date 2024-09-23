@implementation SFSharedAccountsGroupInvitationCell

- (SFSharedAccountsGroupInvitationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFSharedAccountsGroupInvitationCell *v4;
  SFSharedAccountsGroupInvitationCell *v5;
  SFSharedAccountsGroupInvitationCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFSharedAccountsGroupInvitationCell;
  v4 = -[SFAccountManagerPlatterWithDeclineButtonCell initWithStyle:reuseIdentifier:iconSize:iconLeadingSpace:iconTrailingSpace:](&v8, sel_initWithStyle_reuseIdentifier_iconSize_iconLeadingSpace_iconTrailingSpace_, a3, a4, 13, 11, 36.0, 36.0);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)configureWithGroup:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFSharedAccountsGroupInvitationCell *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_group, a3);
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ownerParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupMemberDataForGroupParticipants:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92610], "invitationDescriptionForOwner:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "avatarImageForGroupMember:diameter:", v10, 36.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    v16 = v14;
    v17 = v11;
    v18 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderCellTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderCellImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    v16 = v13;
    v17 = v11;
    v18 = v14;
  }
  -[SFAccountManagerPlatterWithDeclineButtonCell setTitle:subtitle:icon:shouldShowDeclineButton:](v15, "setTitle:subtitle:icon:shouldShowDeclineButton:", v16, v17, v18, 1);

}

+ (unint64_t)contentInset
{
  return 60;
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
