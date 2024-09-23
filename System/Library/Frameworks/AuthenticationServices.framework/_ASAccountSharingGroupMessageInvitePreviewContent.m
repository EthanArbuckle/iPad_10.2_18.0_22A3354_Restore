@implementation _ASAccountSharingGroupMessageInvitePreviewContent

+ (NSString)headerImageName
{
  return (NSString *)CFSTR("message.and.message.fill");
}

+ (UIImage)headerImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithHierarchicalColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 48.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("message.and.message.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v8;
}

+ (id)headerTitleForInvitedGroupMemberData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1
    && (objc_msgSend(v3, "objectAtIndexedSubscript:", 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "contactDisplayName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)headerSubtitleForInvitedGroupMemberData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "count"))
  {
    case 1:
      v6 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v9 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v7, v8, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      v11 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v10, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:

      break;
    default:
      objc_msgSend(a1, "_genericHeaderSubtitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v5;
}

+ (id)_genericHeaderSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (NSString)sendMessageButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)notNowButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)cancelButtonTitle
{
  return (NSString *)_WBSLocalizedString();
}

@end
