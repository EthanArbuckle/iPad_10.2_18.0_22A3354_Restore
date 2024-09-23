@implementation SFSharedAccountsGroupInvitationMessageComposeViewController

- (SFSharedAccountsGroupInvitationMessageComposeViewController)initWithGroup:(id)a3 participantsToInvite:(id)a4
{
  id v6;
  id v7;
  SFSharedAccountsGroupInvitationMessageComposeViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  SFSharedAccountsGroupInvitationMessageComposeViewController *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SFSharedAccountsGroupInvitationMessageComposeViewController;
  v8 = -[SFSharedAccountsGroupInvitationMessageComposeViewController init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_70);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupInvitationMessageComposeViewController setRecipients:](v8, "setRecipients:", v9);

    WBSOngoingSharingInvitationFallbackURL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CC11F0]);
    v12 = (void *)MEMORY[0x1E0D8AAA0];
    v13 = *MEMORY[0x1E0D8B260];
    objc_msgSend(v6, "groupID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceSpecifierEncodedKey:value:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUrlParameters:", v15);

    objc_msgSend(v6, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGroupName:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v17, "setURL:", v10);
    objc_msgSend(v17, "setSpecialization:", v11);
    objc_msgSend(v17, "dataRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupInvitationMessageComposeViewController addRichLinkData:withWebpageURL:](v8, "addRichLinkData:withWebpageURL:", v18, v10);

    -[SFSharedAccountsGroupInvitationMessageComposeViewController _setCanEditRecipients:](v8, "_setCanEditRecipients:", 0);
    v19 = v8;

  }
  return v8;
}

id __98__SFSharedAccountsGroupInvitationMessageComposeViewController_initWithGroup_participantsToInvite___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isCurrentUser") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "handle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
