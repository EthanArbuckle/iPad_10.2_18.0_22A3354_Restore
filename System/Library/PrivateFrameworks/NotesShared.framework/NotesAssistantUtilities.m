@implementation NotesAssistantUtilities

+ (id)folderOptionsForModernContext:(id)a3 htmlContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke;
  v22[3] = &unk_1E76C73B0;
  v23 = v5;
  v9 = v7;
  v24 = v9;
  v10 = v5;
  objc_msgSend(v10, "performBlockAndWait:", v22);
  v16 = v8;
  v17 = 3221225472;
  v18 = __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke_2;
  v19 = &unk_1E76C73B0;
  v20 = v6;
  v11 = v9;
  v21 = v11;
  v12 = v6;
  objc_msgSend(v12, "performBlockAndWait:", &v16);
  +[NotesAssistantFolderOption disambiguateFolderOptions:](NotesAssistantFolderOption, "disambiguateFolderOptions:", v11, v16, v17, v18, v19);
  v13 = v21;
  v14 = v11;

  return v14;
}

void __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NotesAssistantFolderOption *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[ICFolder visibleFoldersInContext:](ICFolder, "visibleFoldersInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!objc_msgSend(v7, "folderType"))
        {
          v8 = *(void **)(a1 + 40);
          v9 = -[NotesAssistantFolderOption initWithModernFolder:]([NotesAssistantFolderOption alloc], "initWithModernFolder:", v7);
          objc_msgSend(v8, "addObject:", v9);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NotesAssistantFolderOption *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D62A00], "ic_objectsMatchingPredicate:context:", 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "didChooseToMigrate");

        if ((v9 & 1) == 0)
        {
          v10 = *(void **)(a1 + 40);
          v11 = -[NotesAssistantFolderOption initWithLegacyFolder:]([NotesAssistantFolderOption alloc], "initWithLegacyFolder:", v7);
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

+ (id)folderForGroupName:(id)a3 withNoteContext:(id)a4 htmlNoteContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "modernFolderForGroupName:withContext:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(a1, "legacyFolderForGroupName:withContext:", v8, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

+ (id)legacyFolderForGroupName:(id)a3 withContext:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  objc_msgSend(a3, "vocabularyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NotesAssistantUtilities objectForIDURL:inContext:](NotesAssistantUtilities, "objectForIDURL:inContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)modernFolderForGroupName:(id)a3 withContext:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  objc_msgSend(a3, "vocabularyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NotesAssistantUtilities objectForIDURL:inContext:](NotesAssistantUtilities, "objectForIDURL:inContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)objectForIDURL:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__62;
  v19 = __Block_byref_object_dispose__62;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__NotesAssistantUtilities_objectForIDURL_inContext___block_invoke;
  v11[3] = &unk_1E76C95A8;
  v7 = v6;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __52__NotesAssistantUtilities_objectForIDURL_inContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectIDForURIRepresentation:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectWithID:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v7;
  }

}

@end
