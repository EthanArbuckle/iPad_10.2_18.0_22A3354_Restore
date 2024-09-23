@implementation CNMeCardSharingSettingsNameCell

+ (id)cellIdentifier
{
  return CFSTR("CNMeCardSharingSettingsNameTableViewCell");
}

- (void)setUpWithGivenName:(id)a3 familyName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "valueCellConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_NAME_CELL_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v10);

  -[CNMeCardSharingSettingsNameCell displayNameForGivenName:familyName:](self, "displayNameForGivenName:familyName:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSecondaryText:", v11);
  -[CNMeCardSharingSettingsNameCell setContentConfiguration:](self, "setContentConfiguration:", v12);
  -[CNMeCardSharingSettingsNameCell setAccessoryType:](self, "setAccessoryType:", 1);

}

- (id)displayNameForGivenName:(id)a3 familyName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  CNMeCardSharingContactNameProvider *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0C97360];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setGivenName:", v7);

  objc_msgSend(v8, "setFamilyName:", v6);
  v9 = -[CNMeCardSharingContactNameProvider initWithContact:]([CNMeCardSharingContactNameProvider alloc], "initWithContact:", v8);
  +[CNMeCardSharingNameFormatter formattedNameFromProvider:withFormat:](CNMeCardSharingNameFormatter, "formattedNameFromProvider:withFormat:", v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
