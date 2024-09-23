@implementation CNContactAddNewFieldAction

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactPropertyGroupPickerViewController *v13;

  v4 = a3;
  v13 = objc_alloc_init(CNContactPropertyGroupPickerViewController);
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADD_MORE_PROPERTIES_NAV_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController setTitle:](v13, "setTitle:", v6);

  -[CNContactAddNewFieldAction prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController setProhibitedPropertyKeys:](v13, "setProhibitedPropertyKeys:", v7);

  -[CNContactAddNewFieldAction groupPickerDelegate](self, "groupPickerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController setGroupPickerDelegate:](v13, "setGroupPickerDelegate:", v8);

  -[CNContactAction contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController setContact:](v13, "setContact:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cnui_applyContactStyle");

  -[CNContactAction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action:presentViewController:sender:", self, v10, v4);

}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (CNContactGroupPickerDelegate)groupPickerDelegate
{
  return (CNContactGroupPickerDelegate *)objc_loadWeakRetained((id *)&self->_groupPickerDelegate);
}

- (void)setGroupPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_groupPickerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupPickerDelegate);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

@end
