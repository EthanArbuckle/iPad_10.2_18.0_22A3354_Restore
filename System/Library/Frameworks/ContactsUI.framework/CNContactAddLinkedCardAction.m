@implementation CNContactAddLinkedCardAction

- (void)performActionWithSender:(id)a3
{
  id v4;
  CNContactPickerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setDelegate:](v5, "setDelegate:", self);
  -[CNContactPickerViewController setMode:](v5, "setMode:", 2);
  -[CNContactPickerViewController setAutocloses:](v5, "setAutocloses:", 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  -[CNContactAction contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "isUnified");

  v10 = (uint64_t *)MEMORY[0x1E0C966E8];
  if ((_DWORD)v8)
  {
    -[CNContactAction contact](self, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "linkedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKeyPath:", *v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v13);

  }
  -[CNContactAddLinkedCardAction editingLinkedContacts](self, "editingLinkedContacts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CNContactAddLinkedCardAction editingLinkedContacts](self, "editingLinkedContacts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v10;
    objc_msgSend(v15, "valueForKeyPath:", *v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v17);

  }
  else
  {
    v16 = *v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT %K IN $IDENTIFIERS"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("IDENTIFIERS");
  objc_msgSend(v6, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithSubstitutionVariables:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPredicateForEnablingContact:](v5, "setPredicateForEnablingContact:", v21);

  -[CNContactAction contact](self, "contact");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController scrollToClosestContactMatching:](v5, "scrollToClosestContactMatching:", v22);

  -[CNContactAddLinkedCardAction setContactPicker:](self, "setContactPicker:", v5);
  -[CNContactAddLinkedCardAction setChosenContact:](self, "setChosenContact:", 0);
  -[CNContactAction delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "action:presentViewController:sender:", self, v5, v4);

}

- (void)peoplePickerLinkButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactAddLinkedCardAction selectedContact](self, "selectedContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddLinkedCardAction setChosenContact:](self, "setChosenContact:", v3);

  -[CNContactAction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAddLinkedCardAction contactPicker](self, "contactPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action:dismissViewController:sender:", self, v5, self);

}

- (void)contactPickerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactAction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWasCanceled:", self);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAddLinkedCardAction contactPicker](self, "contactPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action:dismissViewController:sender:", self, v5, self);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  CNContactContentViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactContentViewController *v14;

  -[CNContactAddLinkedCardAction setSelectedContact:](self, "setSelectedContact:", a4);
  v5 = [CNContactContentViewController alloc];
  -[CNContactAddLinkedCardAction selectedContact](self, "selectedContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactContentViewController initWithContact:](v5, "initWithContact:", v6);

  -[CNContactContentViewController setAllowsActions:](v14, "setAllowsActions:", 0);
  -[CNContactContentViewController setAllowsEditing:](v14, "setAllowsEditing:", 0);
  -[CNContactContentViewController setAllowsConferencing:](v14, "setAllowsConferencing:", 0);
  -[CNContactContentViewController setContactDelegate:](v14, "setContactDelegate:", self);
  -[CNContactAddLinkedCardAction contactPicker](self, "contactPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v14, 1);

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LINK_BAR_BUTTON_ITEM_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, sel_peoplePickerLinkButtonTapped);

  -[CNContactContentViewController navigationItem](v14, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:animated:", v12, 0);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6
{
  return 0;
}

- (CNContact)chosenContact
{
  return self->_chosenContact;
}

- (void)setChosenContact:(id)a3
{
  objc_storeStrong((id *)&self->_chosenContact, a3);
}

- (NSArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (void)setEditingLinkedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_editingLinkedContacts, a3);
}

- (CNContactPickerViewController)contactPicker
{
  return self->_contactPicker;
}

- (void)setContactPicker:(id)a3
{
  objc_storeStrong((id *)&self->_contactPicker, a3);
}

- (CNContact)selectedContact
{
  return self->_selectedContact;
}

- (void)setSelectedContact:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_chosenContact, 0);
}

@end
