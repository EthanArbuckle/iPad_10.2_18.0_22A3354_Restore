@implementation MFMailMessage(NSItemProvider)

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.mobilemail.internalMessageTransfer"));
  objc_msgSend(MEMORY[0x1E0D1E1E8], "externalDataTypeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v1);

  return v0;
}

- (id)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned int (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v30 = &unk_1E5A690F8;
  v9 = v8;
  v31 = v9;
  v10 = (unsigned int (**)(void *, void *))_Block_copy(&v27);
  objc_msgSend(a1, "subject", v27, v28, v29, v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(a1, "subject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subjectString");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.messageui"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_1E5A6A588, CFSTR("Main"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC4D0]))
  {
    objc_msgSend(MEMORY[0x1E0CA5920], "writableTypeIdentifiersForItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v6);

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0CA5920]);
      v18 = *MEMORY[0x1E0D46CE8];
      v19 = (void *)objc_msgSend(v17, "initWithActivityType:", *MEMORY[0x1E0D46CE8]);
      objc_msgSend(v19, "setTitle:", v13);
      v20 = *MEMORY[0x1E0D46CF0];
      v33[0] = v18;
      v21 = *MEMORY[0x1E0D46C98];
      v32[0] = v20;
      v32[1] = v21;
      objc_msgSend(a1, "globalMessageURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUserInfo:", v24);

      objc_msgSend(v19, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC618]))
      {
        if (v10[2](v10, v13))
        {
          objc_msgSend(v13, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        goto LABEL_6;
      }
      objc_msgSend(a1, "globalMessageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setTitle:", v13);
      objc_msgSend(v19, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v25;

    goto LABEL_12;
  }
  objc_msgSend(a1, "_loadMessageDataWithCompletion:", v7);
LABEL_6:
  v14 = 0;
LABEL_12:

  return v14;
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()NSItemProvider
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v3)
    || (objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC4D0]) & 1) != 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CA5920], "readableTypeIdentifiersForItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v3))
  {

LABEL_5:
    goto LABEL_6;
  }
  v9 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC618]);

  if ((v9 & 1) == 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3498], "_preferredRepresentationForItemProviderWritableTypeIdentifier:", v3);
    goto LABEL_7;
  }
LABEL_6:
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)_loadFileRepresentationOfTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFMailMessage+NSItemProvider.m"), 102, CFSTR("Attempting to load file representation for an incompatible type."));

  }
  objc_msgSend(a1, "_attributedSubject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attributedSubject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "subject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subjectString");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.messageui"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_1E5A6A588, CFSTR("Main"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "globalMessageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v4, "length") && v5)
  {
    v9 = *MEMORY[0x1E0DC1160];
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);

  }
  return v6;
}

- (void)_loadMessageDataWithCompletion:()NSItemProvider
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;

  v4 = a3;
  objc_msgSend(a1, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0D46068]);
  objc_msgSend(v5, "headerDataForMessage:downloadIfNecessary:", a1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  objc_msgSend(v5, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:didDownload:", a1, 0, &v11, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v8);

  objc_msgSend(v6, "done");
  if (v11)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9, 0);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
  }

}

+ (uint64_t)dragItemsAreAllMessages:()NSItemProvider
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "itemProvider", (_QWORD)v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "registeredTypeIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail.internalMessageTransfer"));

        if ((v10 & 1) == 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

@end
