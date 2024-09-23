@implementation CNUIContactSaveConfiguration

- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 editingLinkedContacts:(id)a5 contactStore:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8
{
  uint64_t v9;

  BYTE1(v9) = a8;
  LOBYTE(v9) = a7;
  return -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](self, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", a3, a4, 0, a5, a6, 0, 0, 0, 0, v9);
}

- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 shadowCopyOfReadonlyContact:(id)a5 editingLinkedContacts:(id)a6 contactStore:(id)a7 parentGroup:(id)a8 parentContainer:(id)a9 containerContext:(id)a10 groupContext:(id)a11 ignoresParentalRestrictions:(BOOL)a12 saveWasAuthorized:(BOOL)a13
{
  id v20;
  CNUIContactSaveConfiguration *v21;
  CNUIContactSaveConfiguration *v22;
  CNUIContactSaveConfiguration *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)CNUIContactSaveConfiguration;
  v21 = -[CNUIContactSaveConfiguration init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_contact, a3);
    objc_storeStrong((id *)&v22->_mutableContact, a4);
    objc_storeStrong((id *)&v22->_shadowCopyOfReadonlyContact, a5);
    objc_storeStrong((id *)&v22->_editingLinkedContacts, a6);
    objc_storeStrong((id *)&v22->_contactStore, a7);
    objc_storeStrong((id *)&v22->_parentGroup, a8);
    objc_storeStrong((id *)&v22->_parentContainer, a9);
    objc_storeStrong((id *)&v22->_groupContext, a11);
    objc_storeStrong((id *)&v22->_containerContext, a10);
    v22->_ignoresParentalRestrictions = a12;
    v22->_saveWasAuthorized = a13;
    v23 = v22;
  }

  return v22;
}

- (id)copyWithEditingLinkedContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  CNUIContactSaveConfiguration *v13;
  uint64_t v15;
  void *v16;
  CNUIContactSaveConfiguration *v17;

  v4 = a3;
  v17 = [CNUIContactSaveConfiguration alloc];
  -[CNUIContactSaveConfiguration contact](self, "contact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration mutableContact](self, "mutableContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration parentGroup](self, "parentGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration parentContainer](self, "parentContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration containerContext](self, "containerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactSaveConfiguration groupContext](self, "groupContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNUIContactSaveConfiguration ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  BYTE1(v15) = -[CNUIContactSaveConfiguration saveWasAuthorized](self, "saveWasAuthorized");
  LOBYTE(v15) = v12;
  v13 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v17, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v16, v5, v6, v4, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (NSMutableArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (CNUIGroupContext)groupContext
{
  return self->_groupContext;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (BOOL)saveWasAuthorized
{
  return self->_saveWasAuthorized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContext, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
