@implementation CNMeCardSharingOnboardingAudienceViewController

- (CNMeCardSharingOnboardingAudienceViewController)initWithSelectedSharingAudience:(unint64_t)a3
{
  void *v5;
  CNMeCardSharingOnboardingAudienceViewController *v6;
  CNMeCardSharingAudienceDataSource *v7;
  CNMeCardSharingAudienceDataSource *sharingAudienceDataSource;
  CNMeCardSharingOnboardingAudienceViewController *v9;
  objc_super v11;

  objc_msgSend((id)objc_opt_class(), "headerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  v6 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v11, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v5, 0, 0, 0);

  if (v6)
  {
    v7 = -[CNMeCardSharingAudienceDataSource initWithSelectedSharingAudience:]([CNMeCardSharingAudienceDataSource alloc], "initWithSelectedSharingAudience:", a3);
    sharingAudienceDataSource = v6->_sharingAudienceDataSource;
    v6->_sharingAudienceDataSource = v7;

    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  -[CNMeCardSharingOnboardingAudienceViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMeCardSharingOnboardingAudienceViewController;
  -[CNMeCardSharingOnboardingViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)handleConfirmButtonTapped
{
  id v3;

  -[CNMeCardSharingOnboardingAudienceViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meCardSharingOnboardingAudienceViewControllerDidFinish:withSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[CNMeCardSharingAudienceDataSource numberOfItems](self->_sharingAudienceDataSource, "numberOfItems", a3, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[CNMeCardSharingAudienceDataSource sectionHeaderLabel](self->_sharingAudienceDataSource, "sectionHeaderLabel", a3, a4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return -[CNMeCardSharingAudienceDataSource sectionFooterLabel](self->_sharingAudienceDataSource, "sectionFooterLabel", a3, a4);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;

  v5 = a4;
  v6 = -[CNMeCardSharingAudienceDataSource selectedIndex](self->_sharingAudienceDataSource, "selectedIndex");
  if (v6 == objc_msgSend(v5, "row"))
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  CNMeCardSharingAudienceDataSource *sharingAudienceDataSource;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sharingAudienceDataSource = self->_sharingAudienceDataSource;
  v9 = objc_msgSend(v6, "row");

  -[CNMeCardSharingAudienceDataSource itemForIndex:](sharingAudienceDataSource, "itemForIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v7, "setSelectionStyle:", 0);
  objc_msgSend(v10, "accessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "accessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessoryView:", v14);

  }
  else
  {
    objc_msgSend(v7, "setAccessoryView:", 0);
  }
  if (objc_msgSend(v10, "isSelected"))
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v7, "setAccessoryType:", v15);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = -[CNMeCardSharingAudienceDataSource selectedIndex](self->_sharingAudienceDataSource, "selectedIndex");
  -[CNMeCardSharingAudienceDataSource didSelectItemAtIndex:](self->_sharingAudienceDataSource, "didSelectItemAtIndex:", objc_msgSend(v6, "row"));
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v6);
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 0);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:withRowAnimation:", v9, 0);

  }
}

- (CNMeCardSharingOnboardingAudienceViewControllerDelegate)delegate
{
  return (CNMeCardSharingOnboardingAudienceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setSharingAudienceDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, a3);
}

- (CNMeCardSharingOnboardingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)headerText
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_ONBOARDING_CHOOSE_SHARING_AUDIENCE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
