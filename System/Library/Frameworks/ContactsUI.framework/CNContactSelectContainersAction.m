@implementation CNContactSelectContainersAction

- (void)performActionWithContainerContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactContainerPickerViewController *v7;
  CNContactContainerPickerViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[CNContactSelectContainersAction setContainerContext:](self, "setContainerContext:", v4);
  objc_msgSend(v4, "selectedContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cn_map:", &__block_literal_global_48878);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactSelectContainersAction containerPicker](self, "containerPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactSelectContainersAction containerPicker](self, "containerPicker");
    v7 = (CNContactContainerPickerViewController *)objc_claimAutoreleasedReturnValue();
    -[CNContactContainerPickerViewController setSelectedContainerIdentifiers:](v7, "setSelectedContainerIdentifiers:", v15);
  }
  else
  {
    v8 = [CNContactContainerPickerViewController alloc];
    -[CNContactAction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactViewCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactContainerPickerViewController initWithContactViewCache:selectedContainerIdentifiers:](v8, "initWithContactViewCache:selectedContainerIdentifiers:", v10, v15);

    -[CNContactContainerPickerViewController setDelegate:](v7, "setDelegate:", self);
    -[CNContactSelectContainersAction setContainerPicker:](self, "setContainerPicker:", v7);
  }

  v11 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[CNContactSelectContainersAction containerPicker](self, "containerPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRootViewController:", v12);

  -[CNContactAction delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "action:presentViewController:sender:", self, v13, self);

}

- (void)cleanupForDismissal
{
  -[CNContactSelectContainersAction setContainerContext:](self, "setContainerContext:", 0);
}

- (void)containerPicker:(id)a3 didFinishWithPickedContainers:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactSelectContainersAction containerContext](self, "containerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
        {
          -[CNContactSelectContainersAction containerContext](self, "containerContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeContainer:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        -[CNContactSelectContainersAction containerContext](self, "containerContext", (_QWORD)v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addContainer:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

  -[CNContactAction delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSelectContainersAction containerPicker](self, "containerPicker");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "navigationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "action:dismissViewController:sender:", self, v25, self);

  -[CNContactSelectContainersAction cleanupForDismissal](self, "cleanupForDismissal");
  -[CNContactAction delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actionDidFinish:", self);

}

- (BOOL)containerPicker:(id)a3 shouldAllowDeselectionOfContainerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  -[CNContactSelectContainersAction containerContext](self, "containerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__CNContactSelectContainersAction_containerPicker_shouldAllowDeselectionOfContainerWithIdentifier___block_invoke;
  v12[3] = &unk_1E2050200;
  v13 = v5;
  v9 = v5;
  v10 = objc_msgSend(v8, "_cn_any:", v12) ^ 1;

  return v10;
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setContainerPicker:(id)a3
{
  objc_storeStrong((id *)&self->_containerPicker, a3);
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (void)setContainerContext:(id)a3
{
  objc_storeStrong((id *)&self->_containerContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
}

uint64_t __99__CNContactSelectContainersAction_containerPicker_shouldAllowDeselectionOfContainerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __69__CNContactSelectContainersAction_performActionWithContainerContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
