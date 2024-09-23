@implementation CNMeCardSharingEnabledDataSource

- (CNMeCardSharingEnabledDataSource)initWithSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  CNMeCardSharingEnabledDataSource *v4;
  CNMeCardSharingEnabledDataSource *v5;
  uint64_t v6;
  UISwitch *enabledSwitch;
  CNMeCardSharingEnabledDataSource *v8;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingEnabledDataSource;
  v4 = -[CNMeCardSharingEnabledDataSource init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sharingEnabled = v3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    enabledSwitch = v5->_enabledSwitch;
    v5->_enabledSwitch = (UISwitch *)v6;

    -[UISwitch setOn:](v5->_enabledSwitch, "setOn:", v3);
    -[UISwitch addTarget:action:forControlEvents:](v5->_enabledSwitch, "addTarget:action:forControlEvents:", v5, sel_didToggleEnabledSwitch_, 4096);
    -[CNMeCardSharingEnabledDataSource buildItems](v5, "buildItems");
    v8 = v5;
  }

  return v5;
}

- (void)setSharingEnabled:(BOOL)a3
{
  if (self->_sharingEnabled != a3)
  {
    self->_sharingEnabled = a3;
    -[UISwitch setOn:](self->_enabledSwitch, "setOn:");
  }
}

- (BOOL)supportsSelection
{
  return 0;
}

- (void)buildItems
{
  CNMeCardSharingRowItem *v3;
  void *v4;
  void *v5;
  CNMeCardSharingRowItem *v6;
  NSArray *v7;
  NSArray *items;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [CNMeCardSharingRowItem alloc];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARING_ENABLED_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNMeCardSharingRowItem initWithLabel:accessoryView:](v3, "initWithLabel:accessoryView:", v5, self->_enabledSwitch);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v7;

}

- (id)sectionHeaderLabel
{
  return 0;
}

- (id)sectionFooterLabel
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (id)itemForIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
}

- (void)didToggleEnabledSwitch:(id)a3
{
  id v4;

  self->_sharingEnabled = -[UISwitch isOn](self->_enabledSwitch, "isOn", a3);
  -[CNMeCardSharingEnabledDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingEnabledDataSource:didChangeEnabledState:", self, self->_sharingEnabled);

}

- (CNMeCardSharingEnabledDelegate)delegate
{
  return (CNMeCardSharingEnabledDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (void)setEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSwitch, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
