@implementation CNContactAddToExistingContactAction

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactPickerViewController *v7;

  v4 = a3;
  v7 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setDelegate:](v7, "setDelegate:", self);
  -[CNContactPickerViewController setMode:](v7, "setMode:", 2);
  -[CNContactPickerViewController setAutocloses:](v7, "setAutocloses:", 0);
  -[CNContactPickerViewController setOnlyRealContacts:](v7, "setOnlyRealContacts:", 1);
  -[CNContactAction contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController scrollToClosestContactMatching:](v7, "scrollToClosestContactMatching:", v5);

  -[CNContactAddToExistingContactAction setChosenContact:](self, "setChosenContact:", 0);
  -[CNContactAction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action:presentViewController:sender:", self, v7, v4);

  -[CNContactAddToExistingContactAction setContactPicker:](self, "setContactPicker:", v7);
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:dismissViewController:sender:", self, v4, 0);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWasCanceled:", self);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_msgSend(a4, "mutableCopy", a3);
  -[CNContactAction contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactViewController viewControllerForUpdatingContact:withPropertiesFromContact:](CNContactViewController, "viewControllerForUpdatingContact:withPropertiesFromContact:", v12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactViewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v9);

  objc_msgSend(v6, "setDelegate:", self);
  -[CNContactAddToExistingContactAction contactPicker](self, "contactPicker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v6, 1);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (!v6)
  {
    -[CNContactAction delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAddToExistingContactAction contactPicker](self, "contactPicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "action:dismissViewController:sender:", self, v16, 0);

    -[CNContactAction delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWasCanceled:", self);
    goto LABEL_5;
  }
  -[CNContactAddToExistingContactAction setChosenContact:](self, "setChosenContact:", v6);
  -[CNContactAction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddToExistingContactAction contactPicker](self, "contactPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action:dismissViewController:sender:", self, v8, 0);

  -[CNContactAction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDidFinish:", self);

  -[CNContactAction contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isSuggested");

  if ((_DWORD)v8)
  {
    -[CNContactAction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactViewCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C971F8], "sharedNotifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didSaveChangesSuccessfully:fromContactStore:requestIdentifier:", 1, v13, 0);

LABEL_5:
  }

}

- (CNContact)chosenContact
{
  return self->_chosenContact;
}

- (void)setChosenContact:(id)a3
{
  objc_storeStrong((id *)&self->_chosenContact, a3);
}

- (CNContactPickerViewController)contactPicker
{
  return self->_contactPicker;
}

- (void)setContactPicker:(id)a3
{
  objc_storeStrong((id *)&self->_contactPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_chosenContact, 0);
}

@end
