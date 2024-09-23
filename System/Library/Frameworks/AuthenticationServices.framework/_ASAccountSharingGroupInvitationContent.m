@implementation _ASAccountSharingGroupInvitationContent

+ (id)knownSenderHeaderTitleWithGroupName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_headerImageWithSymbolNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  v4 = (void *)MEMORY[0x24BEBD4B8];
  v5 = a3;
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 48.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSString)knownSenderHeaderImageName
{
  return (NSString *)CFSTR("person.2.badge.key.fill");
}

+ (UIImage)knownSenderHeaderImage
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "knownSenderHeaderImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headerImageWithSymbolNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (id)knownSenderHeaderSubtitleForPermissionLevel:(int64_t)a3
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)unknownSenderHeaderTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderHeaderSubtitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderCellTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)unknownSenderImageName
{
  return (NSString *)CFSTR("person.crop.circle.badge.questionmark.fill");
}

+ (UIImage)unknownSenderHeaderImage
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "unknownSenderImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headerImageWithSymbolNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)unknownSenderCellImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "unknownSenderImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithHierarchicalColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (id)groupMemberListFooterTextForPermissionLevel:(int64_t)a3
{
  if (!a3)
    return 0;
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)acceptButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)cancelButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)declineButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)viewButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)invitationDescriptionForOwner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "contactDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4, v7);
  else
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (UIImage)linkPresentationBubbleIcon
{
  return (UIImage *)objc_msgSend(MEMORY[0x24BEBD640], "as_imageNamed:", CFSTR("PasswordsSharingInvite"));
}

+ (NSString)linkPresentationBubbleTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)linkPresentationBubbleSubtitleForGroupName:(id)a3 groupOwnerName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
