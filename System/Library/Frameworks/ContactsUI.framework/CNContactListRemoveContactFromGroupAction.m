@implementation CNContactListRemoveContactFromGroupAction

- (CNContactListRemoveContactFromGroupAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNContactListRemoveContactFromGroupAction *v12;
  CNContactListRemoveContactFromGroupAction *v13;
  CNContactListRemoveContactFromGroupAction *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactListRemoveContactFromGroupAction;
  v12 = -[CNContactListRemoveContactFromGroupAction init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_contactStore, a4);
    objc_storeStrong((id *)&v13->_containerIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)executeRemoveFromGroupAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListRemoveContactFromGroupAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[CNContactListRemoveContactFromGroupAction group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListRemoveContactFromGroupAction contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "removeContactFromGroups:inStore:request:", v7, v8, v3);

  if ((v9 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to remove contact from group", v12, 2u);
    }

  }
  return v9;
}

- (void)undoRemoveFromGroupAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListRemoveContactFromGroupAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[CNContactListRemoveContactFromGroupAction group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListRemoveContactFromGroupAction contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "addContactToGroups:inStore:request:", v7, v8, v3);

  if ((v9 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to undo remove contact from group", v11, 2u);
    }

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (id)log
{
  if (log_cn_once_token_1_13267 != -1)
    dispatch_once(&log_cn_once_token_1_13267, &__block_literal_global_13268);
  return (id)log_cn_once_object_1_13269;
}

void __48__CNContactListRemoveContactFromGroupAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIContactListRemoveFromGroupAction");
  v1 = (void *)log_cn_once_object_1_13269;
  log_cn_once_object_1_13269 = (uint64_t)v0;

}

@end
