@implementation ICDatabaseStateHandler

+ (void)registerStateHandler
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__ICDatabaseStateHandler_registerStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  objc_msgSend(MEMORY[0x1E0D64280], "addStateHandlerWithName:stateBlock:", "Notes Database", v2);
}

uint64_t __46__ICDatabaseStateHandler_registerStateHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateDictionary");
}

+ (id)stateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(a1, "modernDatabaseState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Modern"));

  objc_autoreleasePoolPop(v4);
  v6 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(a1, "miscState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Misc"));

  objc_autoreleasePoolPop(v6);
  return v3;
}

+ (id)miscState
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ICDatabaseStateHandler_miscState__block_invoke;
  v7[3] = &unk_1E76C73F8;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  return v5;
}

void __35__ICDatabaseStateHandler_miscState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[ICNoteContext legacyNotesDisabled](ICNoteContext, "legacyNotesDisabled"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("LegacyNotesDisabled"));

}

+ (id)modernDatabaseState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke;
  v11[3] = &unk_1E76C78F8;
  v12 = v5;
  v14 = a1;
  v6 = v3;
  v13 = v6;
  v7 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  __int128 v52;
  _QWORD v53[4];
  __int128 v54;
  _QWORD v55[4];
  __int128 v56;
  _QWORD v57[4];
  __int128 v58;
  _QWORD v59[4];
  __int128 v60;
  _QWORD v61[4];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  +[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v68 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "addLoggable:toDictionary:", v7, *(_QWORD *)(a1 + 40));
        objc_msgSend(v7, "accountData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 48), "addLoggable:toDictionary:", v8, *(_QWORD *)(a1 + 40));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v4);
  }

  +[ICFolder allFoldersInContext:](ICFolder, "allFoldersInContext:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v64 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 48), "addLoggable:toDictionary:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j), *(_QWORD *)(a1 + 40));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v11);
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_2;
  v61[3] = &unk_1E76C7808;
  v37 = *(_OWORD *)(a1 + 40);
  v16 = (id)v37;
  v62 = v37;
  +[ICNote enumerateNotesInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:](ICNote, "enumerateNotesInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v14, 10, 0, 0, v61);
  v17 = *(_QWORD *)(a1 + 32);
  v59[0] = v15;
  v59[1] = 3221225472;
  v59[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_3;
  v59[3] = &unk_1E76C7830;
  v38 = *(_OWORD *)(a1 + 40);
  v18 = (id)v38;
  v60 = v38;
  +[ICAttachment enumerateAttachmentsInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:](ICAttachment, "enumerateAttachmentsInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v17, 10, 0, 0, v59);
  v19 = *(_QWORD *)(a1 + 32);
  v57[0] = v15;
  v57[1] = 3221225472;
  v57[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_4;
  v57[3] = &unk_1E76C7858;
  v39 = *(_OWORD *)(a1 + 40);
  v20 = (id)v39;
  v58 = v39;
  +[ICMedia enumerateMediaInContext:batchSize:saveAfterBatch:usingBlock:](ICMedia, "enumerateMediaInContext:batchSize:saveAfterBatch:usingBlock:", v19, 10, 0, v57);
  v21 = *(_QWORD *)(a1 + 32);
  v55[0] = v15;
  v55[1] = 3221225472;
  v55[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_5;
  v55[3] = &unk_1E76C7880;
  v40 = *(_OWORD *)(a1 + 40);
  v22 = (id)v40;
  v56 = v40;
  +[ICAttachmentPreviewImage enumerateAttachmentPreviewImagesInContext:batchSize:saveAfterBatch:usingBlock:](ICAttachmentPreviewImage, "enumerateAttachmentPreviewImagesInContext:batchSize:saveAfterBatch:usingBlock:", v21, 10, 0, v55);
  v23 = *(_QWORD *)(a1 + 32);
  v53[0] = v15;
  v53[1] = 3221225472;
  v53[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_6;
  v53[3] = &unk_1E76C78A8;
  v41 = *(_OWORD *)(a1 + 40);
  v24 = (id)v41;
  v54 = v41;
  +[ICInlineAttachment enumerateInlineAttachmentsInContext:typeUTI:tokenContentIdentifier:batchSize:visibleOnly:saveAfterBatch:usingBlock:](ICInlineAttachment, "enumerateInlineAttachmentsInContext:typeUTI:tokenContentIdentifier:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v23, 0, 0, 10, 0, 0, v53);
  v25 = *(_QWORD *)(a1 + 32);
  v51[0] = v15;
  v51[1] = 3221225472;
  v51[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_7;
  v51[3] = &unk_1E76C78D0;
  v42 = *(_OWORD *)(a1 + 40);
  v26 = (id)v42;
  v52 = v42;
  +[ICHashtag enumerateHashtagsInContext:batchSize:saveAfterBatch:usingBlock:](ICHashtag, "enumerateHashtagsInContext:batchSize:saveAfterBatch:usingBlock:", v25, 10, 0, v51);
  +[ICDeviceMigrationState allDeviceMigrationStatesInContext:](ICDeviceMigrationState, "allDeviceMigrationStatesInContext:", *(_QWORD *)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(a1 + 48), "addLoggable:toDictionary:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k), *(_QWORD *)(a1 + 40));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
    }
    while (v29);
  }

  +[ICServerChangeToken serverChangeTokensMatchingPredicate:inContext:](ICServerChangeToken, "serverChangeTokensMatchingPredicate:inContext:", 0, *(_QWORD *)(a1 + 32));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(a1 + 48), "addLoggable:toDictionary:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m), *(_QWORD *)(a1 + 40));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
    }
    while (v34);
  }

}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addLoggable:toDictionary:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)stateDictionaryFromLoggables:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "addLoggable:toDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v5, (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

+ (void)addLoggable:(id)a3 toDictionary:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v11, "ic_loggingIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "ic_loggingValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

@end
