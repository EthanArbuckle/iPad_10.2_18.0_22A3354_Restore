@implementation CKNicknameUtility

+ (id)customImageForUpdate:(id)a3 style:(unint64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 5 || v5)
  {

    goto LABEL_6;
  }
  if (a4 == 4)
  {
LABEL_6:
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("ContactsIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)avatarContactForUpdate:(id)a3 style:(unint64_t)a4
{
  id v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "updateType");
  objc_msgSend(v5, "contact");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a4 != 2)
  {
    if (a4 != 6)
    {
      if (a4 != 5)
      {
        if ((v6 & 4) == 0)
          goto LABEL_7;
        objc_msgSend(v5, "nickname");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "avatar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0C97360]);
          objc_msgSend(v8, "setImageData:", v9);

        }
        else
        {
          v8 = v7;
        }
LABEL_6:

        v7 = v8;
LABEL_7:
        v7 = v7;
        v8 = v7;
        goto LABEL_8;
      }
      +[CKNicknameUtility createContactForOutgoingShare](CKNicknameUtility, "createContactForOutgoingShare");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    goto LABEL_6;
  }
LABEL_8:

  return v8;
}

+ (id)avatarContactsForUpdates:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend((id)objc_opt_class(), "avatarContactForUpdate:style:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), a4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)addContactOptionsMenuItemsWithTarget:(id)a3 update:(id)a4
{
  id v5;
  id v6;
  CKMenuItemObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CKMenuItemObject *v12;
  CKMenuItemObject *v13;
  void *v14;
  void *v15;
  id v16;
  CKMenuItemObject *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  location = 0;
  v20 = v5;
  objc_initWeak(&location, v5);
  v7 = [CKMenuItemObject alloc];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke;
  v24[3] = &unk_1E274D5D0;
  objc_copyWeak(&v26, &location);
  v11 = v6;
  v25 = v11;
  v12 = -[CKMenuItemObject initWithTitle:imageName:handler:](v7, "initWithTitle:imageName:handler:", v9, CFSTR("person.crop.circle"), v24);
  v28[0] = v12;
  v13 = [CKMenuItemObject alloc];
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_TO_EXISTING_CONTACT"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke_2;
  v21[3] = &unk_1E274D5D0;
  objc_copyWeak(&v23, &location);
  v16 = v11;
  v22 = v16;
  v17 = -[CKMenuItemObject initWithTitle:imageName:handler:](v13, "initWithTitle:imageName:handler:", v15, CFSTR("person.crop.circle.badge.plus"), v21);
  v28[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
  return v18;
}

void __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceSelectedAction:forUpdate:", 4, *(_QWORD *)(a1 + 32));

}

void __65__CKNicknameUtility_addContactOptionsMenuItemsWithTarget_update___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceSelectedAction:forUpdate:", 5, *(_QWORD *)(a1 + 32));

}

+ (id)addContactOptionsMenuWithTarget:(id)a3 update:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "addContactOptionsMenuItemsWithTarget:update:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "uiAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  v14 = (void *)MEMORY[0x1E0CEA740];
  v15 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v14, "menuWithTitle:children:", &stru_1E276D870, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)updateNameAndPhotoMenuItemsWithTarget:(id)a3 update:(id)a4
{
  id v5;
  id v6;
  CKMenuItemObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  CKMenuItemObject *v11;
  CKMenuItemObject *v12;
  void *v13;
  void *v14;
  id v15;
  CKMenuItemObject *v16;
  CKMenuItemObject *v17;
  void *v18;
  void *v19;
  id v20;
  CKMenuItemObject *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  location = 0;
  v25 = v5;
  objc_initWeak(&location, v5);
  v7 = [CKMenuItemObject alloc];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NAME_AND_PHOTO"), &stru_1E276D870, CFSTR("ChatKit"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  v9 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke;
  v33[3] = &unk_1E274D5D0;
  objc_copyWeak(&v35, &location);
  v10 = v6;
  v34 = v10;
  v11 = -[CKMenuItemObject initWithTitle:imageName:handler:](v7, "initWithTitle:imageName:handler:", v26, 0, v33);
  v37[0] = v11;
  v12 = [CKMenuItemObject alloc];
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NAME_ONLY"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_2;
  v30[3] = &unk_1E274D5D0;
  objc_copyWeak(&v32, &location);
  v15 = v10;
  v31 = v15;
  v16 = -[CKMenuItemObject initWithTitle:imageName:handler:](v12, "initWithTitle:imageName:handler:", v14, 0, v30);
  v37[1] = v16;
  v17 = [CKMenuItemObject alloc];
  CKFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHOTO_ONLY"), &stru_1E276D870, CFSTR("ChatKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_3;
  v27[3] = &unk_1E274D5D0;
  objc_copyWeak(&v29, &location);
  v20 = v15;
  v28 = v20;
  v21 = -[CKMenuItemObject initWithTitle:imageName:handler:](v17, "initWithTitle:imageName:handler:", v19, 0, v27);
  v37[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v22;
}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceSelectedAction:forUpdate:", 3, *(_QWORD *)(a1 + 32));

}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceSelectedAction:forUpdate:", 1, *(_QWORD *)(a1 + 32));

}

void __66__CKNicknameUtility_updateNameAndPhotoMenuItemsWithTarget_update___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceSelectedAction:forUpdate:", 2, *(_QWORD *)(a1 + 32));

}

+ (id)updateNameAndPhotoMenuWithTarget:(id)a3 update:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "updateNameAndPhotoMenuItemsWithTarget:update:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "uiAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UPDATE_PHOTO_AND_NAME_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CEA740];
  v17 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v16, "menuWithTitle:children:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)bannerTitleTextWithUpdates:(id)a3 style:(unint64_t)a4 useNamedTitles:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (v9)
    {
      objc_msgSend(v9, "givenName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "handle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
  switch(a4)
  {
    case 1uLL:
      if (v5)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("%@_SHARED_A_NEW_PHOTO");
        goto LABEL_11;
      }
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v24 = CFSTR("THIS_PERSON_SHARED_A_NEW_PHOTO");
      goto LABEL_28;
    case 2uLL:
      if (v5)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("%@_SHARED_A_NEW_NAME");
LABEL_11:
        objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E276D870, CFSTR("ChatKit"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v17, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceLayoutDirection");

        if (v20 == 1)
          v21 = CFSTR("\u200F");
        else
          v21 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v18);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CKFrameworkBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        v24 = CFSTR("THIS_PERSON_SHARED_A_NEW_NAME");
LABEL_28:
        objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1E276D870, CFSTR("ChatKit"));
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v22;

      if (!v10)
        goto LABEL_30;
      goto LABEL_32;
    case 3uLL:
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v24 = CFSTR("THIS_PERSON_SHARED_A_NEW_PHOTO_AND_NAME");
      goto LABEL_28;
    case 4uLL:
      v25 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PEOPLE_SHARED_UPDATED_CONTACT_INFO_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v27, objc_msgSend(v7, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

      if (v30 == 1)
        v31 = CFSTR("\u200F");
      else
        v31 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", v28);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 5uLL:
      CKFrameworkBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v33;
      v34 = CFSTR("SHARE_YOUR_NAME_AND_PHOTO");
      goto LABEL_24;
    case 6uLL:
      CKFrameworkBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v33;
      v34 = CFSTR("ADD_YOUR_NAME_AND_PHOTO");
LABEL_24:
      objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("ChatKit"));
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v35 = (void *)v32;
      goto LABEL_31;
    default:
      v35 = 0;
      if (!v10)
      {
LABEL_30:
        CKFrameworkBundle();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("NEW_CONTACT_INFORMATION"), &stru_1E276D870, CFSTR("ChatKit"));
        v36 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v36;
LABEL_31:

      }
LABEL_32:

      return v35;
  }
}

+ (id)bannerActionButtonStringWithUpdates:(id)a3 style:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;

  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a4)
  {
    case 6uLL:
      v10 = CKIsRunningInMacCatalyst();
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v10)
        v9 = CFSTR("SET_UP_BUTTON");
      else
        v9 = CFSTR("SET_UP");
      goto LABEL_17;
    case 5uLL:
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SHARE_BUTTON_TEXT");
      goto LABEL_17;
    case 4uLL:
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("VIEW_BUTTON_TEXT");
LABEL_17:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
  }
  objc_msgSend(v5, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = CFSTR("UPDATE_LIST_TEXT");
  if (!v11)
    v14 = CFSTR("UPDATE_BUTTON_TEXT");
  v15 = CFSTR("ADD_BUTTON_TEXT");
  if (v11)
    v15 = CFSTR("ADD_LIST_TEXT");
  if (v8)
    v16 = v14;
  else
    v16 = v15;
  objc_msgSend(v12, "localizedStringForKey:value:table:", v16, &stru_1E276D870, CFSTR("ChatKit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v17;
}

+ (id)bannerSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend((id)objc_opt_class(), "_catalystSubtitleTextWithUpdates:style:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 - 2 >= 2)
    {
      if (a4 != 5)
      {
        v6 = 0;
        goto LABEL_11;
      }
      objc_msgSend((id)objc_opt_class(), "createContactForOutgoingShare");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)objc_opt_class();
      objc_msgSend(v5, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nickname");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createContactFromNickname:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v11)
      v12 = v11;

  }
LABEL_11:

  return v6;
}

+ (id)_catalystSubtitleTextWithUpdates:(id)a3 style:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 - 2 < 2)
  {
    v17 = (void *)objc_opt_class();
    objc_msgSend(v6, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nickname");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createContactFromNickname:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4 != 5)
    {
      if (a4 == 4)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "nickname", (_QWORD)v24);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "createContactFromNickname:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "givenName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v15);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v10);
        }

        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
      goto LABEL_18;
    }
    objc_msgSend((id)objc_opt_class(), "createContactForOutgoingShare");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v21)
    v22 = v21;

LABEL_18:
  return v16;
}

+ (id)getContactDisplayName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E276D870);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "givenName");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = v15;
LABEL_11:

    v4 = (void *)v14;
    goto LABEL_12;
  }
  objc_msgSend(v3, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E276D870);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v3, "familyName");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v3, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v3, "phoneNumbers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = objc_claimAutoreleasedReturnValue();

LABEL_10:
    v4 = v12;
    goto LABEL_11;
  }
  objc_msgSend(v3, "emailAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v3, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "value");
    v14 = objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_12:

  return v4;
}

+ (id)createContactFromNickname:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C97360];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v7);

  objc_msgSend(v4, "avatar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setImageData:", v9);

  return v5;
}

+ (id)createContactForOutgoingShare
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalNickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_7;
  objc_msgSend((id)objc_opt_class(), "createContactFromNickname:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Using nickname %@ for outgoing share banner with contact: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  if (!v4)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchMeContactWithKeys:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Using me contact for outgoing share banner: %@", (uint8_t *)&v11, 0xCu);
      }

    }
    if (!v4)
    {
      +[CKMeCardSharingNameProvider nameContactForPrimaryAccount](CKMeCardSharingNameProvider, "nameContactForPrimaryAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Using primary account contact for outgoing share banner: %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }

  return v4;
}

+ (id)groupPhotoUpdateTitleForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCNContactForHandleWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GROUP_PHOTO_BANNER_UPDATE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    +[CKNicknameUtility getContactDisplayName:](CKNicknameUtility, "getContactDisplayName:", v6);
  else
    objc_msgSend(v3, "handleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

  if (v13 == 1)
    v14 = CFSTR("\u200F");
  else
    v14 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)groupPhotoUpdateSubtitleForUpdate:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(objc_msgSend(a3, "groupUpdateType"))
  {
    case 1:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_NAME_ADDED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 2:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_ADDED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 3:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_ADDED_AND_NAME_ADDED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 4:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_REMOVED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 5:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_NAME_REMOVED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 6:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_REMOVED_AND_NAME_REMOVED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 7:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_REMOVED_AND_NAME_ADDED_BANNER_UPDATE_SUBTITLE");
      goto LABEL_11;
    case 8:
      CKFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("GROUP_PHOTO_ADDED_AND_NAME_REMOVED_BANNER_UPDATE_SUBTITLE");
LABEL_11:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)formattedNameWithFirstName:(id)a3 lastName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setGivenName:", v6);

  objc_msgSend(v8, "setFamilyName:", v5);
  objc_msgSend(v7, "stringFromPersonNameComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
