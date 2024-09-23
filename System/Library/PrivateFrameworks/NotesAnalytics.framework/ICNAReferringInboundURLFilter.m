@implementation ICNAReferringInboundURLFilter

+ (id)filterReferringInboundURL:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(MEMORY[0x1E0D639E0], "isShowNoteURL:", v4) & 1) != 0)
    {
      v6 = CFSTR("showNote");
    }
    else if ((objc_msgSend(MEMORY[0x1E0D639E0], "isShowLegacyNoteURL:", v4) & 1) != 0)
    {
      v6 = CFSTR("showLegacyNote");
    }
    else
    {
      objc_msgSend(v4, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "filterStringByAllowedTieredPrefixReplacements:", v7);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(a1, "filterURLByLogicalReplacements:", v4);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
          v6 = (__CFString *)v8;
        else
          v6 = CFSTR("other");
      }
    }
  }
  else
  {
    v6 = &stru_1E771FED0;
  }

  return v6;
}

+ (id)filterStringByAllowedTieredPrefixReplacements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v17;

  v4 = a3;
  objc_msgSend(a1, "allowedTieredPrefixReplacements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v7 = objc_msgSend(a1, "foundMatchingPrefixAmongCandidates:forInputString:matchingPrefixInplaceResult:", v6, v4, &v17);
  v8 = v17;
  v9 = v8;
  if (v7)
  {
    while (1)
    {
      objc_opt_class();
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        break;
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v9;
      v13 = objc_msgSend(a1, "foundMatchingPrefixAmongCandidates:forInputString:matchingPrefixInplaceResult:", v12, v4, &v17);
      v14 = v17;

      v9 = v14;
      v6 = v12;
      v5 = v11;
      if ((v13 & 1) == 0)
        goto LABEL_7;
    }
    v12 = v6;
    v14 = v9;
  }
  else
  {
    v12 = v6;
    v14 = v8;
    v11 = v5;
  }
LABEL_7:
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

+ (id)filterURLByLogicalReplacements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;

  v3 = a3;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v3, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("userActivity"));

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    objc_msgSend(v9, "setQuery:", 0);
    objc_msgSend(v9, "string");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(v3, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("file");
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("file"));

  if (!v12)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("notesairdropdocument"));

  if (v14)
    v10 = CFSTR("notesairdropdocument");
LABEL_9:

  return v10;
}

+ (id)allowedTieredPrefixReplacements
{
  if (allowedTieredPrefixReplacements_onceToken != -1)
    dispatch_once(&allowedTieredPrefixReplacements_onceToken, &__block_literal_global_0);
  return (id)allowedTieredPrefixReplacements_allowedTieredPrefixReplacements;
}

void __64__ICNAReferringInboundURLFilter_allowedTieredPrefixReplacements__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;

  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v0, CFSTR("showLegacyNote"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v1, CFSTR("showNote"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v2, CFSTR("notesairdropdocument"));

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v3, CFSTR("mobilenotes"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("mobilenotes://snapshotBackgroundTask"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mobilenotes://showFolderList"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mobilenotes://text"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mobilenotes://msg"));

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mobilenotes://newNote"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("mobilenotes://newNote?action=0"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("mobilenotes://newNote?action=1"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("mobilenotes://newNote?action=2"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("mobilenotes://newNote?action=3"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("mobilenotes://newNote?action=4"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("mobilenotes://newNote?action=5"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("mobilenotes://newNote?action=6"));

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mobilenotes://quicknote"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("mobilenotes://quicknote?showList=1"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("mobilenotes://quicknote?showList=0"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("mobilenotes://quicknote?launchedByPencil=0"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("mobilenotes://quicknote?launchedByPencil=1"));

  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("mobilenotes-quicknote"));
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("mobilenotes-quicknote://quicknote"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("mobilenotes-quicknote://quicknote?showList=0"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("mobilenotes-quicknote://quicknote?showList=1"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("mobilenotes-quicknote://quicknote?launchedByPencil=0"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("mobilenotes-quicknote://quicknote?launchedByPencil=1"));

  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v27, CFSTR("notesAnalytics"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("notesAnalytics://cloudKitShare"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("notesAnalytics://shortcutItem"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("notesAnalytics://userActivity"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("notesAnalytics://notificationCenter"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("notesAnalytics://sharingExtension"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("notesAnalytics://todayExtension"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("notesAnalytics://intentsExtension"));

  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v35, CFSTR("shortcutItem"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/com.apple.notes.photo"), CFSTR("shortcutItem"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v37);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/com.apple.notes.newNote"), CFSTR("shortcutItem"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, v39);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/com.apple.notes.scanDocument"), CFSTR("shortcutItem"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, v41);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/com.apple.notes.checklist"), CFSTR("shortcutItem"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, v43);

  v44 = objc_msgSend(v46, "copy");
  v45 = (void *)allowedTieredPrefixReplacements_allowedTieredPrefixReplacements;
  allowedTieredPrefixReplacements_allowedTieredPrefixReplacements = v44;

}

+ (BOOL)foundMatchingPrefixAmongCandidates:(id)a3 forInputString:(id)a4 matchingPrefixInplaceResult:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", v14, (_QWORD)v17))
        {
          *a5 = objc_retainAutorelease(v14);
          v15 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

@end
