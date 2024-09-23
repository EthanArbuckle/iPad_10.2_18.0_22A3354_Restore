@implementation CNDraggingContact

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_14 != -1)
    dispatch_once(&os_log_cn_once_token_0_14, &__block_literal_global_93);
  return (OS_os_log *)(id)os_log_cn_once_object_0_14;
}

void __27__CNDraggingContact_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "dragging");
  v1 = (void *)os_log_cn_once_object_0_14;
  os_log_cn_once_object_0_14 = (uint64_t)v0;

}

+ (id)availableDataRepresentationTypes
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CNContactIdentifiersPboardType");
  v3[1] = CFSTR("CNLinkedContactsIdentifiersPboardType");
  v3[2] = *MEMORY[0x1E0CA5CB0];
  v3[3] = CFSTR("com.apple.contacts.vCardDisplayNames");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNDraggingContact)initWithContact:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNDraggingContact *v9;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    objc_storeStrong((id *)&self->_contactStore, a4);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchContactWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  CNContactStore *v12;
  void *v13;
  void *v14;
  BOOL v15;
  CNContactFetchRequest *v16;
  void *v17;
  CNContactFetchRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNDraggingContact contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "areKeysAvailable:", v6);

  if (v7)
  {
    -[CNDraggingContact contact](self, "contact");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNDraggingContact contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_INFO, "No contact store injected, using a store with default options", buf, 2u);
      }

      v12 = objc_alloc_init(CNContactStore);
      -[CNDraggingContact setContactStore:](self, "setContactStore:", v12);

    }
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__23;
    v36 = __Block_byref_object_dispose__23;
    v37 = 0;
    -[CNDraggingContact contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length") == 0;

    if (v15)
    {
      v24 = 0;
    }
    else
    {
      v16 = [CNContactFetchRequest alloc];
      v45 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CNContactFetchRequest initWithKeysToFetch:](v16, "initWithKeysToFetch:", v17);

      -[CNContactFetchRequest setOnlyMainStore:](v18, "setOnlyMainStore:", 1);
      -[CNDraggingContact contact](self, "contact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactFetchRequest setPredicate:](v18, "setPredicate:", v22);

      -[CNDraggingContact contactStore](self, "contactStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __42__CNDraggingContact_fetchContactWithKeys___block_invoke;
      v30[3] = &unk_1E29F80D0;
      v30[4] = buf;
      objc_msgSend(v23, "enumerateContactsWithFetchRequest:error:usingBlock:", v18, &v31, v30);
      v24 = v31;

    }
    v25 = (void *)*((_QWORD *)v33 + 5);
    if (!v25)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[CNDraggingContact contact](self, "contact");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNDraggingContact contactStore](self, "contactStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v38 = 138412802;
        v39 = v28;
        v40 = 2114;
        v41 = v29;
        v42 = 2114;
        v43 = v24;
        _os_log_error_impl(&dword_18F8BD000, v26, OS_LOG_TYPE_ERROR, "Error refetching contact %@ from store %{public}@: %{public}@", v38, 0x20u);

      }
      v25 = (void *)*((_QWORD *)v33 + 5);
    }
    v8 = v25;
    _Block_object_dispose(buf, 8);

  }
  return v8;
}

void __42__CNDraggingContact_fetchContactWithKeys___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)serializeContactToVCard:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DDCAF0];
  v4 = a3;
  objc_msgSend(v3, "optionsFromPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePhotos:", 1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactVCardSerialization dataWithContacts:options:error:](CNContactVCardSerialization, "dataWithContacts:options:error:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fileNameForContact:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", CFSTR("VCARD_DEFAULT_FILE_NAME"), objc_opt_class(), 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("vcf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileURLRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v15;
  id v16;

  -[CNDraggingContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNDraggingContact cachedFileURLRepresentation](self, "cachedFileURLRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[CNContactVCardSerialization descriptorForRequiredKeys](CNContactVCardSerialization, "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDraggingContact fetchContactWithKeys:](self, "fetchContactWithKeys:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNDraggingContact serializeContactToVCard:](self, "serializeContactToVCard:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13A48], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureTemporarySubdirectoryWithName:", CFSTR("DraggedItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNDraggingContact fileNameForContact:](self, "fileNameForContact:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v12 = objc_msgSend(v7, "writeToURL:options:error:", v11, 1, &v16);
    v13 = v16;
    if (v12)
    {
      -[CNDraggingContact setCachedFileURLRepresentation:](self, "setCachedFileURLRepresentation:", v11);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CNDraggingContact fileURLRepresentation].cold.1(v6, (uint64_t)v13, v15);

    }
  }
  -[CNDraggingContact cachedFileURLRepresentation](self, "cachedFileURLRepresentation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cleanupFileURLRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[CNDraggingContact cachedFileURLRepresentation](self, "cachedFileURLRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDraggingContact cachedFileURLRepresentation](self, "cachedFileURLRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);

    -[CNDraggingContact setCachedFileURLRepresentation:](self, "setCachedFileURLRepresentation:", 0);
  }
}

- (id)dataRepresentationForType:(id)a3
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNDraggingContact contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_12;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5CB0]))
  {
    +[CNContactVCardSerialization descriptorForRequiredKeys](CNContactVCardSerialization, "descriptorForRequiredKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDraggingContact fetchContactWithKeys:](self, "fetchContactWithKeys:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNDraggingContact serializeContactToVCard:](self, "serializeContactToVCard:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CNContactIdentifiersPboardType")))
  {
    v9 = (void *)MEMORY[0x1E0CB38B0];
    -[CNDraggingContact contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataWithPropertyList:format:options:error:", v11, 200, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("CNLinkedContactsIdentifiersPboardType")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.contacts.vCardDisplayNames")))
    {
      +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNDraggingContact fetchContactWithKeys:](self, "fetchContactWithKeys:", v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNDraggingContact fileNameForContact:](self, "fileNameForContact:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB38B0];
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dataWithPropertyList:format:options:error:", v22, 200, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  -[CNDraggingContact contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "linkedContacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  -[CNDraggingContact contact](self, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    objc_msgSend(v15, "linkedContacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_cn_map:", &__block_literal_global_26_1);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v18;

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v24, 200, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v8;
}

uint64_t __47__CNDraggingContact_dataRepresentationForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSURL)cachedFileURLRepresentation
{
  return self->_cachedFileURLRepresentation;
}

- (void)setCachedFileURLRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFileURLRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileURLRepresentation, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)fileURLRepresentation
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "Error writing contact %@ to temporary file: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
