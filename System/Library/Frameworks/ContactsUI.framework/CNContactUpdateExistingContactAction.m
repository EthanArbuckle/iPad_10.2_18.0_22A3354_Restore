@implementation CNContactUpdateExistingContactAction

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97200];
  -[CNContactUpdateExistingContactAction existingContact](self, "existingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContactsWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C97210]);
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithKeysToFetch:", v12);

  objc_msgSend(v13, "setOnlyMainStore:", 1);
  objc_msgSend(v13, "setUnifyResults:", 1);
  objc_msgSend(v13, "setPredicate:", v9);
  -[CNContactAction delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contactViewCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contactStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__58312;
  v27 = __Block_byref_object_dispose__58313;
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__CNContactUpdateExistingContactAction_performActionWithSender___block_invoke;
  v22[3] = &unk_1E204FB18;
  v22[4] = &v23;
  objc_msgSend(v16, "enumerateContactsWithFetchRequest:error:usingBlock:", v13, 0, v22);
  v17 = v24[5];
  -[CNContactAction contact](self, "contact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactViewController viewControllerForUpdatingContact:withPropertiesFromContact:](CNContactViewController, "viewControllerForUpdatingContact:withPropertiesFromContact:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setContactStore:", v16);
  objc_msgSend(v19, "setDelegate:", self);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v19);
  -[CNContactAction delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "action:presentViewController:sender:", self, v20, v4);

  _Block_object_dispose(&v23, 8);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (a4)
  {
    -[CNContactUpdateExistingContactAction setExistingContact:](self, "setExistingContact:", a4);
    -[CNContactAction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, 0);

    -[CNContactAction delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionDidFinish:", self);
  }
  else
  {
    -[CNContactAction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "action:dismissViewController:sender:", self, v6, 0);

    -[CNContactAction delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWasCanceled:", self);
  }

}

- (CNContact)existingContact
{
  return self->_existingContact;
}

- (void)setExistingContact:(id)a3
{
  objc_storeStrong((id *)&self->_existingContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingContact, 0);
}

void __64__CNContactUpdateExistingContactAction_performActionWithSender___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

@end
