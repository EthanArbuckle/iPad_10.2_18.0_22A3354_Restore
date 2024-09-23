@implementation CNContactListDeleteContactAction

- (CNContactListDeleteContactAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5 recentsManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNContactListDeleteContactAction *v15;
  CNContactListDeleteContactAction *v16;
  CNContactListDeleteContactAction *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNContactListDeleteContactAction;
  v15 = -[CNContactListDeleteContactAction init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contact, a3);
    objc_storeStrong((id *)&v16->_contactStore, a4);
    objc_storeStrong((id *)&v16->_containerIdentifier, a5);
    objc_storeStrong((id *)&v16->_recentsManager, a6);
    v17 = v16;
  }

  return v16;
}

- (BOOL)executeDeleteAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListDeleteContactAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "deleteContact:", v5);
  -[CNContactListDeleteContactAction contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v6, "executeSaveRequest:error:", v3, &v15);
  v8 = v15;

  if ((v7 & 1) != 0)
  {
    -[CNContactListDeleteContactAction recentsManager](self, "recentsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recentContactsMatchingAllPropertiesOfContact:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__CNContactListDeleteContactAction_executeDeleteAction__block_invoke;
    v13[3] = &unk_1E204BDA8;
    v14 = v9;
    v11 = v9;
    -[NSObject addSuccessBlock:](v10, "addSuccessBlock:", v13);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to delete contact: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)undoDeleteAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListDeleteContactAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[CNContactListDeleteContactAction containerIdentifier](self, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addContact:toContainerWithIdentifier:", v5, v6);

  -[CNContactListDeleteContactAction contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "executeSaveRequest:error:", v3, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to undo delete contact action: %@", buf, 0xCu);
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

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (void)setRecentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_recentsManager, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

uint64_t __55__CNContactListDeleteContactAction_executeDeleteAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecents:completionHandler:", a2, 0);
}

+ (id)log
{
  if (log_cn_once_token_1_22421 != -1)
    dispatch_once(&log_cn_once_token_1_22421, &__block_literal_global_22422);
  return (id)log_cn_once_object_1_22423;
}

void __39__CNContactListDeleteContactAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIListDeleteContactAction");
  v1 = (void *)log_cn_once_object_1_22423;
  log_cn_once_object_1_22423 = (uint64_t)v0;

}

@end
