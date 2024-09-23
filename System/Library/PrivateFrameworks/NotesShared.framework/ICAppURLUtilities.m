@implementation ICAppURLUtilities

+ (BOOL)isLaunchingQuickNoteViaPencil:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", CFSTR("launchedByPencil"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isQuickNoteModeURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((ICIsNotesURLScheme(v7) & 1) != 0
      || objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", CFSTR("mobilenotes-quicknote")))
    {
      v8 = objc_msgSend(v6, "ic_isCaseInsensitiveEqualToString:", CFSTR("quicknote"));
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)appURLForNote:(id)a3
{
  return (id)objc_msgSend(a1, "appURLForNote:inFolder:", a3, 0);
}

+ (id)predicateForVisibleNotesMentionedInURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicateForNotesMentionedInURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject predicateForUnmarkedForDeletionObjects](ICCloudSyncingObject, "predicateForUnmarkedForDeletionObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    v10[0] = v3;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)predicateForNotesMentionedInURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = ICIsNotesURLScheme(v5);

  if (v6)
  {
    objc_msgSend(a1, "modernNoteIdentifierFromEntityURI:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(a1, "predicateForNotesWithIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(a1, "isShowNoteURL:options:", v4, 1))
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(a1, "predicateForNotesMentionedInURL:action:", v4, CFSTR("showNote"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
LABEL_9:

    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4
{
  return (id)objc_msgSend(a1, "predicateForNotesMentionedInURL:action:queryItemName:", a3, a4, CFSTR("identifier"));
}

+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4 queryItemName:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "firstQueryItemInURL:andHost:andQueryItemName:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForNotesWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)predicateForNotesWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (isValidIdentifier(v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K ==[c] %@"), CFSTR("identifier"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ICAppURLUtilities predicateForNotesWithIdentifier:].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    v4 = 0;
  }

  return v4;
}

+ (id)appURLForHTMLNote:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v5, "setHost:", CFSTR("showHTMLNote"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URIRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("objectIDURI"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v11);

  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)objectIDURIRepresentationForHTMLNoteMentionedInURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "isShowHTMLNoteURL:", v4))
  {
    objc_msgSend(a1, "firstQueryItemInURL:andHost:andQueryItemName:", v4, CFSTR("showHTMLNote"), CFSTR("objectIDURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)appURLForFolder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("applenotes"));
    objc_msgSend(v5, "setHost:", CFSTR("showFolder"));
    v6 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v3, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URIRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItemWithName:value:", CFSTR("objectIDURI"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQueryItems:", v11);

    objc_msgSend(v5, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)objectIDForModernFolderMentionedInURL:(id)a3 options:(unint64_t)a4 noteContext:(id)a5
{
  char v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((v6 & 1) != 0
    || (objc_msgSend(a1, "objectIDForModernFolderEntityURI:noteContext:", v8, v9),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "objectIDURIRepresentationForFolderMentionedInLegacyShowFolderURL:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "persistentStoreCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "managedObjectIDForURIRepresentation:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = (void *)v10;
    v12 = 0;
  }

  return v11;
}

+ (id)objectIDForModernFolderMentionedInURL:(id)a3 noteContext:(id)a4
{
  return (id)objc_msgSend(a1, "objectIDForModernFolderMentionedInURL:options:noteContext:", a3, 0, a4);
}

+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowFolderURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(a1, "isShowFolderURL:options:", v4, 1))
  {
    objc_msgSend(a1, "firstQueryItemInURL:andHost:andQueryItemName:", v4, CFSTR("showFolder"), CFSTR("objectIDURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v5, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)appURLForHTMLFolder:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v5, "setHost:", CFSTR("showHTMLFolder"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URIRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("objectIDURI"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v11);

  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 options:(unint64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a1, "objectIDForHTMLFolderEntityURI:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(a1, "objectIDURIRepresentationForFolderMentionedInLegacyShowHTMLFolderURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistentStoreCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "managedObjectIDForURIRepresentation:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "objectIDForHTMLFolderMentionedInURL:options:context:", a3, 0, a4);
}

+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowHTMLFolderURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "isShowHTMLFolderURL:options:", v4, 1))
  {
    objc_msgSend(a1, "firstQueryItemInURL:andHost:andQueryItemName:", v4, CFSTR("showHTMLFolder"), CFSTR("objectIDURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)appURLForDefaultFolder
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v2, "setHost:", CFSTR("showDefaultFolder"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appURLForFolderList
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v2, "setHost:", CFSTR("showFolderList"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appURLForShowSmartFoldersHelp
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v2, "setHost:", CFSTR("showSmartFoldersHelp"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isShowFolderListURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showFolderList"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowDefaultFolderURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showDefaultFolder"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowFolderURL:(id)a3
{
  return objc_msgSend(a1, "isShowFolderURL:options:", a3, 0);
}

+ (BOOL)isShowFolderURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || (objc_msgSend(a1, "isModernFolderEntityURI:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        objc_msgSend(v8, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", CFSTR("showFolder"));

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isShowHTMLFolderURL:(id)a3
{
  return objc_msgSend(a1, "isShowHTMLFolderURL:options:", a3, 0);
}

+ (BOOL)isShowHTMLFolderURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || (objc_msgSend(a1, "isHTMLFolderEntityURI:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        objc_msgSend(v8, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", CFSTR("showHTMLFolder"));

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isShowNoteURL:(id)a3
{
  return objc_msgSend(a1, "isShowNoteURL:options:", a3, 0);
}

+ (BOOL)isShowNoteURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || (objc_msgSend(a1, "isModernNoteEntityURI:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        objc_msgSend(v8, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", CFSTR("showNote"));

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)folderIdentifierForShowNoteURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && objc_msgSend(a1, "isShowNoteURL:", v4))
  {
    objc_msgSend(a1, "firstQueryItemInURL:andHost:andQueryItemName:", v4, CFSTR("showNote"), CFSTR("folderIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isShowLegacyNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showLegacyNote"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowHTMLNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showHTMLNote"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowSmartFoldersHelpURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showSmartFoldersHelp"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isSystemPaperURL:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ICIsNotesURLScheme(v4);

  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "queryItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", CFSTR("displayMode")) & 1) != 0)
          {
            objc_msgSend(v11, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "containsString:", CFSTR("paper"));

            if ((v14 & 1) != 0)
            {
              v5 = 1;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    v5 = 0;
LABEL_16:

  }
  return v5 != 0;
}

+ (BOOL)isNewNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("newNote"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isTranscriptionDonationURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("transcriptionFeedback"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isTranscriptionDonationURLPositive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("transcriptionFeedback")))
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v4, "queryItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
        {
          v10 = v9;
          v19 = v7;
          v11 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              objc_msgSend(v13, "name");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "ic_isCaseInsensitiveEqualToString:", CFSTR("isPositive"));

              if ((v15 & 1) != 0)
              {
                objc_msgSend(v13, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v17, "isEqual:", CFSTR("1"));

                goto LABEL_17;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v10)
              continue;
            break;
          }
          v16 = 0;
LABEL_17:
          v7 = v19;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)attachmentForTranscriptionDonationURL:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = ICIsNotesURLScheme(v8);

    if (v9)
    {
      objc_msgSend(v7, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "ic_isCaseInsensitiveEqualToString:", CFSTR("transcriptionFeedback")))
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "queryItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v22 = v10;
          v23 = v6;
          v14 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v16, "name", v22);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "ic_isCaseInsensitiveEqualToString:", CFSTR("attachmentID"));

              if ((v18 & 1) != 0)
              {
                objc_msgSend(v16, "value");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = v23;
                +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v20, v23);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_17;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v13)
              continue;
            break;
          }
          v19 = 0;
          v6 = v23;
LABEL_17:
          v10 = v22;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)appURLForTranscriptionDonationForAttachmentIdentifier:(id)a3 isPositive:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v7, "setHost:", CFSTR("transcriptionFeedback"));
  if (v4)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("isPositive"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("attachmentID"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryItems:", v11);

  objc_msgSend(v7, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isShowPaperURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("showPaper"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowNoteFocusedInFolderURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      objc_msgSend(v4, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", CFSTR("focusNoteInFolder"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)appURLForContainingFolderWithNoteFocused:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", CFSTR("applenotes"));
    objc_msgSend(v4, "setHost:", CFSTR("focusNoteInFolder"));
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("identifier"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v6);

    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)appURLForNote:(id)a3 inFolder:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v7, "setScheme:", CFSTR("applenotes"));
    objc_msgSend(v7, "setHost:", CFSTR("showNote"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("identifier"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    if (v5)
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queryItemWithName:value:", CFSTR("folderIdentifier"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
    }
    v15 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v7, "setQueryItems:", v15);

    objc_msgSend(v7, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)predicateForFolderWithNoteFocusedInURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isShowNoteFocusedInFolderURL:", v4))
  {
    objc_msgSend(a1, "predicateForNotesMentionedInURL:action:", v4, CFSTR("focusNoteInFolder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)urlForQuickNoteWithOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v4, "setHost:", CFSTR("quicknote"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queryItemWithName:value:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setQueryItems:", v5);
  objc_msgSend(v4, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)quickNoteURLShouldShowList:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", CFSTR("showList"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)quickNoteURLShouldShowShareSheet:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", CFSTR("showShareSheet"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)quickNoteURLShouldShowiCloudShareSheet:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", CFSTR("showiCloudShareSheet"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)attachmentIdentifierFromQuickNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_stringValueForQueryItemWithKey:", CFSTR("attachment"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isValidIdentifier(v5))
    {

      v6 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)noteIdentifierFromQuickNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_stringValueForQueryItemWithKey:", CFSTR("note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isValidIdentifier(v5))
    {

      v6 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)contentOffsetFromQuickNoteURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_queryItemWithKey:", CFSTR("contentOffsetY"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)quickNoteURLIsContinuing:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isQuickNoteModeURL:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", CFSTR("continuing"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)firstQueryItemInURL:(id)a3 andHost:(id)a4 andQueryItemName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = ICIsNotesURLScheme(v10);

    if (v11)
    {
      objc_msgSend(v9, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", v7);

      if (v13)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "queryItems", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
LABEL_6:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
            objc_msgSend(v19, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "ic_isCaseInsensitiveEqualToString:", v8);

            if ((v21 & 1) != 0)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
              if (v16)
                goto LABEL_6;
              goto LABEL_12;
            }
          }
          v22 = v19;

          if (v22)
            goto LABEL_22;
        }
        else
        {
LABEL_12:

        }
        v23 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[ICAppURLUtilities firstQueryItemInURL:andHost:andQueryItemName:].cold.1((uint64_t)v8, v9, v23);

      }
      else
      {
        v23 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[ICAppURLUtilities firstQueryItemInURL:andHost:andQueryItemName:].cold.2((uint64_t)v7, (uint64_t)v9, v23);
      }

    }
    v22 = 0;
LABEL_22:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)referralURLForSnapshotBackgroundTask
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v2, "setHost:", CFSTR("snapshotBackgroundTask"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)URLForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__37;
  v25 = __Block_byref_object_dispose__37;
  v26 = 0;
  if (length)
  {
    v8 = *MEMORY[0x1E0DC1160];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__ICAppURLUtilities_URLForAttributedString_range___block_invoke;
    v20[3] = &unk_1E76C7E30;
    v20[4] = &v21;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v20);
  }
  else
  {
    if (location < objc_msgSend(v6, "length"))
    {
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], location, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v22[5];
      v22[5] = v9;

    }
    if (v22[5])
      v11 = 1;
    else
      v11 = location == 0;
    if (!v11)
    {
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], location - 1, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v22[5];
      v22[5] = v12;

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (id)v22[5];
LABEL_14:
    v15 = v14;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22[5]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v22[5])
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "Cannot convert link attribute of type %@ to an NSURL", buf, 0xCu);

    }
  }
  v15 = 0;
LABEL_20:
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __50__ICAppURLUtilities_URLForAttributedString_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a2;
  if (v8)
  {
    v13 = v8;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
    {
      *v10 = 0;

      *a5 = 1;
    }
    else
    {
      objc_storeStrong(v10, a2);
    }
    v8 = v13;
  }

}

+ (id)URLWithSchemeForString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  else
    +[ICAppURLUtilities detectedURLInString:allowNonLinkCharacters:](ICAppURLUtilities, "detectedURLInString:allowNonLinkCharacters:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)noteIdentifierFromNotesAppURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "scheme"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = ICIsNotesURLScheme(v5),
        v5,
        v6))
  {
    objc_msgSend(a1, "modernNoteIdentifierFromEntityURI:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;
    }
    else
    {
      NotesAppGUIDForNoteMentionedInURL(v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)NotesAppIDForNoteMentionedInURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!ICIsNotesURLScheme(v4))
    goto LABEL_12;
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", CFSTR("showNote")))
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ic_isCaseInsensitiveEqualToString:", CFSTR("showHTMLNote"));

  if (v7)
  {
LABEL_5:
    objc_msgSend(v3, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("&"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("="));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") == 2)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", CFSTR("identifier"));

        v13 = 0;
        if (v12)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (isValidIdentifier(v14))
            v15 = v14;
          else
            v15 = 0;
          v13 = v15;

        }
      }
      else
      {
        v13 = 0;
      }

      goto LABEL_16;
    }
LABEL_12:
    v13 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

+ (id)detectedURLInString:(id)a3 allowNonLinkCharacters:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 32, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v6)
  {
    v8 = objc_msgSend(v5, "ic_range");
    v10 = v9;
    objc_msgSend(v6, "matchesInString:options:range:", v5, 0, v8, v9);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (os_log_t)(id)objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      v21 = v7;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!a4 && (v8 != objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "range") || v10 != v17))
            continue;
          objc_msgSend(v16, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v21;
          goto LABEL_20;
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v19 = 0;
        v7 = v21;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_20:

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[ICAppURLUtilities detectedURLInString:allowNonLinkCharacters:].cold.1(v11);
    v19 = 0;
  }

  return v19;
}

+ (id)entityURIForNote:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23B1B0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  static ICAppURLUtilities.entityURI(for:)(v7, v6);

  v8 = sub_1BDBFC948();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1BDBFC8D0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

+ (BOOL)isHTMLNoteEntityURI:(id)a3
{
  return sub_1BDB7A35C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))_sSo17ICAppURLUtilitiesC11NotesSharedE19isHTMLNoteEntityURIySb10Foundation3URLVFZ_0);
}

+ (BOOL)isModernNoteEntityURI:(id)a3
{
  return sub_1BDB79F9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_1BDB77E44);
}

+ (id)objectIDURIRepresentationForHTMLNoteEntityURI:(id)a3 context:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  uint64_t v15;

  v5 = sub_1BDBFC948();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23B1B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  swift_unknownObjectRetain();
  static ICAppURLUtilities.objectIDURIRepresentation(forHTMLNoteEntityURI:context:)(a4, (uint64_t)v11);
  swift_unknownObjectRelease();
  v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) != 1)
  {
    v13 = (void *)sub_1BDBFC8D0();
    v12(v11, v5);
  }
  return v13;
}

+ (id)modernNoteIdentifierFromEntityURI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1BDBFC948();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  _sSo17ICAppURLUtilitiesC11NotesSharedE20modernNoteIdentifier13fromEntityURISSSg10Foundation3URLV_tFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (!v8)
    return 0;
  v9 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return v9;
}

+ (BOOL)isHTMLFolderEntityURI:(id)a3
{
  return sub_1BDB7A35C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))_sSo17ICAppURLUtilitiesC11NotesSharedE21isHTMLFolderEntityURIySb10Foundation3URLVFZ_0);
}

+ (BOOL)isModernFolderEntityURI:(id)a3
{
  return sub_1BDB79F9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_1BDB77300);
}

+ (id)objectIDForHTMLFolderEntityURI:(id)a3 context:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23B1B0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BDBFC90C();
    v9 = sub_1BDBFC948();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1BDBFC948();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  swift_unknownObjectRetain();
  v11 = _sSo17ICAppURLUtilitiesC11NotesSharedE8objectID22forHTMLFolderEntityURI7contextSo015NSManagedObjectF0CSg10Foundation3URLVSg_So15ICLegacyContext_ptFZ_0((uint64_t)v8, a4);
  swift_unknownObjectRelease();
  sub_1BDAC350C((uint64_t)v8, &qword_1ED23B1B0);
  return v11;
}

+ (id)objectIDForModernFolderEntityURI:(id)a3 noteContext:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23B1B0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BDBFC90C();
    v9 = sub_1BDBFC948();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1BDBFC948();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = a4;
  v12 = _sSo17ICAppURLUtilitiesC11NotesSharedE8objectID24forModernFolderEntityURI11noteContextSo015NSManagedObjectF0CSg10Foundation3URLVSg_So06ICNoteM0CtFZ_0((uint64_t)v8, v11);

  sub_1BDAC350C((uint64_t)v8, &qword_1ED23B1B0);
  return v12;
}

+ (void)predicateForNotesWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "invalid note identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)attachmentIdentifierFromQuickNoteURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a1, a3, "invalid identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)firstQueryItemInURL:(uint64_t)a1 andHost:(void *)a2 andQueryItemName:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_9(&dword_1BD918000, a3, v6, "Unknown query item %@ in query %@", (uint8_t *)&v7);

}

+ (void)firstQueryItemInURL:(uint64_t)a1 andHost:(uint64_t)a2 andQueryItemName:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_9(&dword_1BD918000, a3, (uint64_t)a3, "Unknown host %@ in url %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)detectedURLInString:(os_log_t)log allowNonLinkCharacters:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Could not create NSDataDetector.", v1, 2u);
}

@end
