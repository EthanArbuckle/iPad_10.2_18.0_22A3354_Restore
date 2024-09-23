@implementation CNLabelPickerController

- (id)initForPropertyItem:(id)a3
{
  id v4;
  CNLabelPickerController *v5;
  CNLabelPickerController *v6;
  uint64_t v7;
  NSMutableArray *labelsToDeleteOnCommit;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CNLabelPickerController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  CNLabelPickerController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v49[4];
  CNLabelPickerController *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  CNLabelPickerController *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CNPickerController initWithStyle:](self, "initWithStyle:", 1);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    labelsToDeleteOnCommit = v6->_labelsToDeleteOnCommit;
    v6->_labelsToDeleteOnCommit = (NSMutableArray *)v7;

    objc_msgSend(v4, "standardLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setBuiltinItems:](v6, "setBuiltinItems:", v9);

    objc_msgSend(v4, "extendedLabels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController builtinItems](v6, "builtinItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = objc_msgSend(v10, "count");

    v14 = MEMORY[0x1E0C809B0];
    if (v12 < v13)
    {
      -[CNPickerController setSupplementalItems:](v6, "setSupplementalItems:", v10);
      objc_msgSend(v4, "promotedExtendedLabels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController setPromotedSupplementalItems:](v6, "setPromotedSupplementalItems:", v15);

      -[CNPickerController supplementalItems](v6, "supplementalItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v14;
      v55[1] = 3221225472;
      v55[2] = __47__CNLabelPickerController_initForPropertyItem___block_invoke;
      v55[3] = &unk_1E204FDC0;
      v17 = v6;
      v56 = v17;
      objc_msgSend(v16, "_cn_filter:", v55);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController setRemainderSupplementalItems:](v17, "setRemainderSupplementalItems:", v18);

    }
    objc_msgSend(v4, "group");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "policy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "property");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "supportedLabelsForContactProperty:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setAllowsCustomItems:](v6, "setAllowsCustomItems:", v22 == 0);

    if (-[CNPickerController allowsCustomItems](v6, "allowsCustomItems"))
    {
      objc_msgSend(v4, "group");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "property");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "usedLabelsForPropertyWithKey:error:", v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      objc_msgSend(v4, "group");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "labelsInUseByGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v52 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            if ((objc_msgSend(v27, "containsObject:", v35) & 1) == 0)
              objc_msgSend(v27, "addObject:", v35);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v32);
      }

      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __47__CNLabelPickerController_initForPropertyItem___block_invoke_2;
      v49[3] = &unk_1E204C658;
      v36 = v6;
      v50 = v36;
      objc_msgSend(v27, "indexesOfObjectsPassingTest:", v49);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectsAtIndexes:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController setCustomItems:](v36, "setCustomItems:", v38);

    }
    objc_msgSend(v4, "labeledValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setSelectedItem:](v6, "setSelectedItem:", v40);

    -[CNPickerController selectedItem](v6, "selectedItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      -[CNLabelPickerController navigationItem](v6, "navigationItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "rightBarButtonItem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setEnabled:", 0);

    }
    -[CNLabelPickerController title](v6, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[CNLabelPickerController title](v6, "title");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabelPickerController navigationItem](v6, "navigationItem");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTitle:", v45);
    }
    else
    {
      CNContactsUIBundle();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("EDIT_ITEM_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabelPickerController navigationItem](v6, "navigationItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTitle:", v46);

    }
  }

  return v6;
}

- (id)titleForPickerItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", a3);
}

- (void)removeCustomItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNLabelPickerController labelsToDeleteOnCommit](self, "labelsToDeleteOnCommit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)pickedItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CNPickerController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNLabelPickerController labelsToDeleteOnCommit](self, "labelsToDeleteOnCommit", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C97338], "deleteCustomLabel:", v11);
        if ((v5 & 1) != 0)
        {
          -[CNPickerController delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "picker:didDeleteItem:", self, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (CNPropertyGroupItem)item
{
  return (CNPropertyGroupItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (NSMutableArray)labelsToDeleteOnCommit
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setLabelsToDeleteOnCommit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToDeleteOnCommit, 0);
  objc_destroyWeak((id *)&self->_item);
}

uint64_t __47__CNLabelPickerController_initForPropertyItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "promotedSupplementalItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

uint64_t __47__CNLabelPickerController_initForPropertyItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "builtinItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "supplementalItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v3) ^ 1;

  }
  return v5;
}

@end
