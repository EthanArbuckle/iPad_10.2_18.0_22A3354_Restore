@implementation CNContactDisableGuardianRestrictionsAction

- (CNContactDisableGuardianRestrictionsAction)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5
{
  id v9;
  id v10;
  CNContactDisableGuardianRestrictionsAction *v11;
  CNContactDisableGuardianRestrictionsAction *v12;
  CNContactDisableGuardianRestrictionsAction *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNContactDisableGuardianRestrictionsAction;
  v11 = -[CNContactAction initWithContact:](&v15, sel_initWithContact_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    objc_storeStrong((id *)&v12->_contactStore, a5);
    v13 = v12;
  }

  return v12;
}

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALLOW_CONTACT_EDITING"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)canPerformAction
{
  void *v2;
  char v3;

  -[CNContactDisableGuardianRestrictionsAction container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGuardianRestricted");

  return v3;
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CNContactDisableGuardianRestrictionsAction container](self, "container", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setGuardianRestricted:", 0);
  v6 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v6, "setIgnoresGuardianRestrictions:", 1);
  objc_msgSend(v6, "updateContainer:", v5);
  -[CNContactDisableGuardianRestrictionsAction contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v7, "executeSaveRequest:error:", v6, &v9);

  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionDidFinish:", self);

}

- (CNContainer)container
{
  return self->_container;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
