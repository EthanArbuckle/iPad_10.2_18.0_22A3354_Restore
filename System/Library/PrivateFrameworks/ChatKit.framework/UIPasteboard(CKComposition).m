@implementation UIPasteboard(CKComposition)

+ (id)__ck_pasteboardTypeListRTFD
{
  uint64_t v0;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA5B50];
  v2[0] = *MEMORY[0x1E0CA5C48];
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)__ck_canCreateComposition
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  const __CFString *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "hasStrings") & 1) != 0
    || (objc_msgSend(a1, "hasURLs") & 1) != 0
    || (objc_msgSend(a1, "hasImages") & 1) != 0)
  {
    return 1;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.MobileSMS.PluginPayload"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.cloudkit.sharingsupport.pre"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.cloudkit.sharingsupport.post"));
  objc_msgSend(v4, "addObject:", *MEMORY[0x1E0CC1108]);
  objc_msgSend(a1, "__ck_mediaObjectManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allUTITypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(MEMORY[0x1E0CEA810], "__ck_pasteboardTypeListRTFD");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "pasteboardTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    LOBYTE(v2) = 0;
    v15 = *(_QWORD *)v30;
    while (2)
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        if ((v2 & 1) != 0
          || (v17 = *(const __CFString **)(*((_QWORD *)&v29 + 1) + 8 * j),
              QLPreviewControllerSupportsContentType())
          && (objc_msgSend(MEMORY[0x1E0CEA810], "__ck_pasteboardTypeListRTFD"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "containsObject:", v17),
              v18,
              !v19))
        {
          v2 = 1;
          goto LABEL_36;
        }
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v4, "allObjects", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v26;
          while (2)
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v26 != v23)
                objc_enumerationMutation(v20);
              if (UTTypeEqual(v17, *(CFStringRef *)(*((_QWORD *)&v25 + 1) + 8 * k)))
              {
                v2 = 1;
                goto LABEL_31;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            if (v22)
              continue;
            break;
          }
        }
        v2 = 0;
LABEL_31:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v2 = 0;
  }
LABEL_36:

  return v2;
}

- (void)__ck_compositionWithContext:()CKComposition completionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "itemProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__UIPasteboard_CKComposition____ck_compositionWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E2750D18;
  v11 = v6;
  v9 = v6;
  +[CKComposition compositionFromNonCollaborationItemProviders:builderContext:completionHandler:](CKComposition, "compositionFromNonCollaborationItemProviders:builderContext:completionHandler:", v8, v7, v10);

}

- (CKMediaObjectManager)__ck_mediaObjectManager
{
  return +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
}

@end
