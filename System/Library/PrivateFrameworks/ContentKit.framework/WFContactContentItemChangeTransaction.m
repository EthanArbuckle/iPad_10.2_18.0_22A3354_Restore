@implementation WFContactContentItemChangeTransaction

- (WFContactContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v4;
  WFContactContentItemChangeTransaction *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  CNMutableContact *mutableContact;
  WFContactContentItemChangeTransaction *v14;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFContactContentItemChangeTransaction;
  v5 = -[WFContentItemChangeTransaction initWithContentItem:](&v17, sel_initWithContentItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = objc_alloc_init((Class)getCNContactStoreClass_12526());
      objc_msgSend(v6, "contactIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v9, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;

      if (v10)
      {
        v12 = objc_msgSend(v10, "mutableCopy");
        mutableContact = v5->_mutableContact;
        v5->_mutableContact = (CNMutableContact *)v12;

        v14 = v5;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v6 = (void *)getCNSaveRequestClass_softClass_12524;
  v48 = getCNSaveRequestClass_softClass_12524;
  if (!getCNSaveRequestClass_softClass_12524)
  {
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __getCNSaveRequestClass_block_invoke_12525;
    v44[3] = &unk_24C4E3118;
    v44[4] = &v45;
    __getCNSaveRequestClass_block_invoke_12525((uint64_t)v44);
    v6 = (void *)v46[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v45, 8);
  v8 = objc_alloc_init(v7);
  v37 = objc_alloc_init((Class)getCNContactStoreClass_12526());
  -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v8, "addContact:toContainerWithIdentifier:", v9, 0);
  else
    objc_msgSend(v8, "updateContact:", v9);

  -[WFContactContentItemChangeTransaction groupChangeRequest](self, "groupChangeRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[WFCNContactGroup allContactGroups](WFCNContactGroup, "allContactGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
          -[WFContentItemChangeTransaction contentItem](self, "contentItem", v35);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "contact");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "containsContact:", v17);

          if (v18)
          {
            -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "group");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "removeMember:fromGroup:", v19, v20);

          }
          -[WFContactContentItemChangeTransaction groupChangeRequest](self, "groupChangeRequest");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "containsObject:", v22);

          if (v23)
          {
            -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "group");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addMember:toGroup:", v24, v25);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v12);
    }

  }
  v39 = 0;
  v26 = objc_msgSend(v37, "executeSaveRequest:error:", v8, &v39, v35);
  v27 = v39;
  if ((v26 & 1) != 0)
  {
    +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v27;
    objc_msgSend(v37, "unifiedContactWithIdentifier:keysToFetch:error:", v30, v28, &v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v38;

    if (v31)
    {
      +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContentItem itemWithObject:](WFContactContentItem, "itemWithObject:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v36)[2](v36, v34, 0);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v36)[2](v36, 0, v32);
    }

    v27 = v32;
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v36)[2](v36, 0, v27);
  }

}

- (void)updatePhoneNumbers:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Append"));

  if (v6)
  {
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_12516);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPhoneNumbers:", v10);

LABEL_8:
    goto LABEL_9;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Remove"));

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "valueForKey:", CFSTR("normalizedPhoneNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "phoneNumbers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __60__WFContactContentItemChangeTransaction_updatePhoneNumbers___block_invoke;
    v25[3] = &unk_24C4DFD88;
    v26 = v16;
    v7 = v16;
    objc_msgSend(v18, "if_objectsPassingTest:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPhoneNumbers:", v19);

    goto LABEL_8;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("RemoveAll"));

  if (!v22)
  {
    objc_msgSend(v4, "if_map:", &__block_literal_global_12516);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPhoneNumbers:", v7);

    goto LABEL_8;
  }
  -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPhoneNumbers:", MEMORY[0x24BDBD1A8]);

LABEL_9:
}

- (void)updateEmailAddresses:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Append"));

  if (v6)
  {
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_152_12512);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEmailAddresses:", v10);

LABEL_8:
    goto LABEL_9;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Remove"));

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "valueForKey:", CFSTR("address"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __62__WFContactContentItemChangeTransaction_updateEmailAddresses___block_invoke;
    v25[3] = &unk_24C4DFD88;
    v26 = v16;
    v7 = v16;
    objc_msgSend(v18, "if_objectsPassingTest:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEmailAddresses:", v19);

    goto LABEL_8;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("RemoveAll"));

  if (!v22)
  {
    objc_msgSend(v4, "if_map:", &__block_literal_global_152_12512);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setEmailAddresses:", v7);

    goto LABEL_8;
  }
  -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEmailAddresses:", MEMORY[0x24BDBD1A8]);

LABEL_9:
}

- (void)updateStreetAddresses:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Append"));

  if (v6)
  {
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postalAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_154);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPostalAddresses:", v10);

LABEL_8:
    goto LABEL_9;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Remove"));

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "valueForKey:", CFSTR("postalAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postalAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __63__WFContactContentItemChangeTransaction_updateStreetAddresses___block_invoke;
    v25[3] = &unk_24C4DFD88;
    v26 = v16;
    v7 = v16;
    objc_msgSend(v18, "if_objectsPassingTest:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPostalAddresses:", v19);

    goto LABEL_8;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("RemoveAll"));

  if (!v22)
  {
    objc_msgSend(v4, "if_map:", &__block_literal_global_154);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPostalAddresses:", v7);

    goto LABEL_8;
  }
  -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPostalAddresses:", MEMORY[0x24BDBD1A8]);

LABEL_9:
}

- (void)updateURLs:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Append"));

  if (v6)
  {
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_156);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUrlAddresses:", v10);

LABEL_8:
    goto LABEL_9;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Remove"));

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "valueForKey:", CFSTR("absoluteString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "urlAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __52__WFContactContentItemChangeTransaction_updateURLs___block_invoke;
    v25[3] = &unk_24C4DFD88;
    v26 = v16;
    v7 = v16;
    objc_msgSend(v18, "if_objectsPassingTest:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUrlAddresses:", v19);

    goto LABEL_8;
  }
  -[WFContentItemChangeTransaction mode](self, "mode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("RemoveAll"));

  if (!v22)
  {
    objc_msgSend(v4, "if_map:", &__block_literal_global_156);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUrlAddresses:", v7);

    goto LABEL_8;
  }
  -[WFContactContentItemChangeTransaction mutableContact](self, "mutableContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUrlAddresses:", MEMORY[0x24BDBD1A8]);

LABEL_9:
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (NSArray)groupChangeRequest
{
  return self->_groupChangeRequest;
}

- (void)setGroupChangeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_groupChangeRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupChangeRequest, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
}

uint64_t __52__WFContactContentItemChangeTransaction_updateURLs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __63__WFContactContentItemChangeTransaction_updateStreetAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __62__WFContactContentItemChangeTransaction_updateEmailAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __60__WFContactContentItemChangeTransaction_updatePhoneNumbers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unformattedInternationalStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4) ^ 1;

  return v5;
}

@end
