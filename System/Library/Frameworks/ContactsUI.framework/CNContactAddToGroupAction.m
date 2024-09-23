@implementation CNContactAddToGroupAction

+ (id)os_log
{
  if (os_log_cn_once_token_1_10267 != -1)
    dispatch_once(&os_log_cn_once_token_1_10267, &__block_literal_global_10268);
  return (id)os_log_cn_once_object_1_10269;
}

void __35__CNContactAddToGroupAction_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactAddToGroupAction");
  v1 = (void *)os_log_cn_once_object_1_10269;
  os_log_cn_once_object_1_10269 = (uint64_t)v0;

}

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  CNContactGroupPickerViewController *v6;
  void *v7;
  void *v8;
  CNContactGroupPickerViewController *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  -[CNContactAddToGroupAction contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactAddToGroupAction setSelectedGroup:](self, "setSelectedGroup:", 0);
    v6 = [CNContactGroupPickerViewController alloc];
    -[CNContactAddToGroupAction contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAddToGroupAction sourceAccountExternalIdentifiers](self, "sourceAccountExternalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNContactGroupPickerViewController initWithContactStore:sourceAccountExternalIdentifiers:](v6, "initWithContactStore:sourceAccountExternalIdentifiers:", v7, v8);

    -[CNContactGroupPickerViewController setDelegate:](v9, "setDelegate:", self);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
    -[CNContactAddToGroupAction setGroupPickerNavigationViewController:](self, "setGroupPickerNavigationViewController:", v10);
    -[CNContactAction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "action:presentViewController:sender:", self, v10, v4);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "add to group action requires a contact store", v13, 2u);
    }

  }
}

- (void)setContactParentGroups:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contactParentGroups, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_contactParentGroups, a3);
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_5_10332);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAddToGroupAction setContactParentGroupIdentifiers:](self, "setContactParentGroupIdentifiers:", v5);

  }
}

- (CNManagedConfiguration)managedConfiguration
{
  CNManagedConfiguration *managedConfiguration;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CNManagedConfiguration *v8;
  CNManagedConfiguration *v9;

  managedConfiguration = self->_managedConfiguration;
  if (!managedConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D13AA8]);
    objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CNManagedConfiguration *)objc_msgSend(v6, "initWithBundleIdentifier:managedProfileConnection:", v5, v7);
    v9 = self->_managedConfiguration;
    self->_managedConfiguration = v8;

    managedConfiguration = self->_managedConfiguration;
  }
  return managedConfiguration;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  CNUIGroupsAndContainersSaveManager *groupsAndContainersSaveManager;
  CNUIGroupsAndContainersSaveManager *v4;
  void *v5;
  CNUIGroupsAndContainersSaveManager *v6;
  CNUIGroupsAndContainersSaveManager *v7;

  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    v4 = [CNUIGroupsAndContainersSaveManager alloc];
    -[CNContactAddToGroupAction contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:](v4, "initWithContactStore:", v5);
    v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }
  return groupsAndContainersSaveManager;
}

- (id)sourceAccountExternalIdentifiers
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactAddToGroupAction managedConfiguration](self, "managedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceHasManagementRestrictions");

  if (v4)
  {
    -[CNContactAddToGroupAction groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAction contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentAccountExternalIdentifiersForContact:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)groupPicker:(id)a3 shouldEnableGroupWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[CNContactAddToGroupAction contactParentGroupIdentifiers](self, "contactParentGroupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7 ^ 1;
}

- (void)groupPicker:(id)a3 didSelectGroup:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[CNContactAddToGroupAction setSelectedGroup:](self, "setSelectedGroup:", a4);
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAddToGroupAction groupPickerNavigationViewController](self, "groupPickerNavigationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);

}

- (void)groupPickerDidCancel:(id)a3
{
  void *v4;
  id v5;

  -[CNContactAction delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAddToGroupAction groupPickerNavigationViewController](self, "groupPickerNavigationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:dismissViewController:sender:", self, v4, self);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6
{
  return 0;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSArray)contactParentGroups
{
  return self->_contactParentGroups;
}

- (CNGroup)selectedGroup
{
  return self->_selectedGroup;
}

- (void)setSelectedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGroup, a3);
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSArray)contactParentGroupIdentifiers
{
  return self->_contactParentGroupIdentifiers;
}

- (void)setContactParentGroupIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contactParentGroupIdentifiers, a3);
}

- (UINavigationController)groupPickerNavigationViewController
{
  return self->_groupPickerNavigationViewController;
}

- (void)setGroupPickerNavigationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_groupPickerNavigationViewController, a3);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_groupPickerNavigationViewController, 0);
  objc_storeStrong((id *)&self->_contactParentGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedGroup, 0);
  objc_storeStrong((id *)&self->_contactParentGroups, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __52__CNContactAddToGroupAction_setContactParentGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
