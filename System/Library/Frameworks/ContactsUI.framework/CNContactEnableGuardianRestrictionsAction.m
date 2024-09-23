@implementation CNContactEnableGuardianRestrictionsAction

- (CNContactEnableGuardianRestrictionsAction)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5
{
  id v9;
  id v10;
  CNContactEnableGuardianRestrictionsAction *v11;
  CNContactEnableGuardianRestrictionsAction *v12;
  CNContactEnableGuardianRestrictionsAction *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNContactEnableGuardianRestrictionsAction;
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
