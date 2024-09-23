@implementation ICAppURLUtilities(UI)

+ (id)appURLForNote:()UI inVirtualSmartFolder:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appURLForNoteIdentifier:inVirtualSmartFolder:actionName:", v7, v6, CFSTR("showNoteInVirtualSmartFolder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)appURLForNoteIdentifier:()UI inVirtualSmartFolder:actionName:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    v9 = a5;
    v10 = a3;
    objc_msgSend(v8, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v7, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queryItemWithName:value:", CFSTR("type"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("note"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v16);

    objc_msgSend(v7, "accountObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "accountObjectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URIRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("accountObjectIDURL"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v21);

    }
    v22 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    ICNotesAppURLScheme();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setScheme:", v23);

    objc_msgSend(v22, "setHost:", v9);
    v24 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v22, "setQueryItems:", v24);

    objc_msgSend(v22, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)appURLForVirtualSmartFolder:()UI
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
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("type"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(v3, "accountObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "accountObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URIRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("accountObjectIDURL"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  ICNotesAppURLScheme();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScheme:", v14);

  objc_msgSend(v13, "setHost:", CFSTR("showVirtualSmartFolder"));
  v15 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v13, "setQueryItems:", v15);

  objc_msgSend(v13, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (ICVirtualSmartFolderItemIdentifier)virtualSmartFolderMentionedInURL:()UI context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICVirtualSmartFolderItemIdentifier *v17;
  ICVirtualSmartFolderItemIdentifier *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isShowVirtualSmartFolderURL:", v6) & 1) != 0
    || objc_msgSend(a1, "isShowNoteInVirtualSmartFolderURL:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_queryItemWithKey:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICVirtualSmartFolderItemIdentifier allTypes](ICVirtualSmartFolderItemIdentifier, "allTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if (v12)
    {
      objc_msgSend(v8, "ic_queryItemWithKey:", CFSTR("accountObjectIDURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v7, "persistentStoreCoordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ic_managedObjectIDForURIString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
      v18 = [ICVirtualSmartFolderItemIdentifier alloc];
      +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](v18, "initWithType:parentIdentifier:accountObjectID:", v10, v19, v16);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)notePredicateFromNoteInVirtualSmartFolderInURL:()UI
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "isShowNoteInVirtualSmartFolderURL:", v4))
  {
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForNotesMentionedInURL:action:queryItemName:", v4, v5, CFSTR("note"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isShowVirtualSmartFolderURL:()UI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICIsNotesURLScheme())
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("showVirtualSmartFolder")))
    {
      objc_msgSend(v3, "ic_queryItemWithKey:", CFSTR("type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (uint64_t)isShowNoteInVirtualSmartFolderURL:()UI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICIsNotesURLScheme())
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("showNoteInVirtualSmartFolder"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
