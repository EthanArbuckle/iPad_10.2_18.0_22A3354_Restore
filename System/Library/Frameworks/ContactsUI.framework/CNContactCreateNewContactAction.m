@implementation CNContactCreateNewContactAction

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
  void *v13;
  id v14;

  v4 = a3;
  -[CNContactAction contact](self, "contact");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContactStore:", v8);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "loadView");
  -[CNContactAction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:prepareChildContactViewController:sender:", self, v10, self);

  -[CNContactCreateNewContactAction setCreatedContact:](self, "setCreatedContact:", 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_cnui_applyContactStyle");

  -[CNContactAction delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "action:presentViewController:sender:", self, v11, v4);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v6 = a4;
  v7 = a3;
  -[CNContactCreateNewContactAction setCreatedContact:](self, "setCreatedContact:", v6);
  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactViewCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactAction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "action:dismissViewController:sender:", self, v12, 0);
  -[CNContactAction contact](self, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isSuggestedMe");

  if ((_DWORD)v11)
  {
    v20 = 0;
    objc_msgSend(v10, "setMeContact:error:", v6, &v20);
    v14 = v20;
    v15 = v14;
    if (v14)
      NSLog(CFSTR("Error setting me card %@"), v14);

  }
  -[CNContactAction delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v6)
  {
    objc_msgSend(v16, "actionWasCanceled:", self);
    goto LABEL_9;
  }
  objc_msgSend(v16, "actionDidFinish:", self);

  -[CNContactAction contact](self, "contact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSuggested");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C971F8], "sharedNotifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didSaveChangesSuccessfully:fromContactStore:requestIdentifier:", 1, v10, 0);
LABEL_9:

  }
}

- (CNContact)createdContact
{
  return self->_createdContact;
}

- (void)setCreatedContact:(id)a3
{
  objc_storeStrong((id *)&self->_createdContact, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_createdContact, 0);
}

@end
