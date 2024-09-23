@implementation ICAccount

- (id)fallbackImageDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EB8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)awakeFromFetch
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAccount;
  -[ICCloudSyncingObject awakeFromFetch](&v5, sel_awakeFromFetch);
  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LocalAccount"));

  if (v4)
    -[ICAccount setAccountType:](self, "setAccountType:", 3);
}

- (void)setAccountType:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[ICAccount accountType](self, "accountType") != a3)
  {
    -[ICAccount willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("accountType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("accountType"));

    -[ICAccount didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("accountType"));
    -[ICAccount updateAccountNameForAccountListSorting](self, "updateAccountNameForAccountListSorting");
  }
}

- (id)standardFolderIdentifierWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[ICAccount identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardFolderIdentifierWithPrefix:accountIdentifier:accountType:", v4, v6, -[ICAccount accountType](self, "accountType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)standardFolderIdentifierWithPrefix:(id)a3 accountIdentifier:(id)a4 accountType:(int)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (a5 == 1)
      v10 = CFSTR("CloudKit");
    else
      v10 = (__CFString *)v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v7, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[ICAccount standardFolderIdentifierWithPrefix:accountIdentifier:accountType:].cold.1();

    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->primaryEmail, 0);
  objc_storeStrong((id *)&self->fullName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_accountProxy, 0);
  objc_storeStrong((id *)&self->_trashFolder, 0);
  objc_storeStrong((id *)&self->_defaultFolder, 0);
}

- (id)previewImageDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63ED8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EC8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountFilesDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend((id)objc_opt_class(), "accountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationDocumentsURLForAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccount identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        v8 = -[ICAccount storeDataSeparately](self, "storeDataSeparately"),
        v7,
        (v8 & 1) != 0))
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EE8], 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAccount identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v10, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v5;
    v9 = v11;
  }

  return v11;
}

+ (ICAccountUtilities)accountUtilities
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_accountUtilities;
  if (!_accountUtilities)
  {
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_accountUtilities;
    _accountUtilities = v3;

    v2 = (void *)_accountUtilities;
  }
  return (ICAccountUtilities *)v2;
}

- (id)accountDataCreateIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  -[ICAccount accountData](self, "accountData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = +[ICAccountData newAccountDataForAccount:](ICAccountData, "newAccountDataForAccount:", self);
    -[ICAccount setAccountData:](self, "setAccountData:", v4);

  }
  -[ICAccount accountData](self, "accountData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "markedForDeletion");

  if (v6)
  {
    -[ICAccount accountData](self, "accountData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMarkedForDeletion:", 0);

  }
  return (id)-[ICAccount accountData](self, "accountData");
}

- (id)subFolderIdentifiersOrderedSet
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = -[ICAccount accountDataCreateIfNecessary](self, "accountDataCreateIfNecessary");
  -[ICAccount accountData](self, "accountData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.accountData) != nil)", "-[ICAccount subFolderIdentifiersOrderedSet]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.accountData");
  v6.receiver = self;
  v6.super_class = (Class)ICAccount;
  -[ICNoteContainer subFolderIdentifiersOrderedSet](&v6, sel_subFolderIdentifiersOrderedSet);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)replicaIDForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  v4 = a3;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "concurrencyType");

  if (v6 == 2)
  {
    -[ICAccount replicaIDToBundleIdentifier](self, "replicaIDToBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend((id)objc_opt_class(), "bundleIdentifiersWithReplicaID", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

      v16 = (void *)objc_msgSend(v8, "copy");
      -[ICAccount setReplicaIDToBundleIdentifier:](self, "setReplicaIDToBundleIdentifier:", v16);

    }
    -[ICAccount replicaIDToBundleIdentifier](self, "replicaIDToBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)updateTrashFolderHiddenNoteContainerState
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[ICAccount trashFolder](self, "trashFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ICAccount_updateTrashFolderHiddenNoteContainerState__block_invoke;
  v5[3] = &unk_1E76C73F8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

id __64__ICAccount_Management__initializeLocalAccountNamesInBackground__block_invoke()
{
  id v0;

  v0 = +[ICAccount localizedLocalAccountName](ICAccount, "localizedLocalAccountName");
  return +[ICAccount localizedLocalAccountNameMidSentence](ICAccount, "localizedLocalAccountNameMidSentence");
}

- (id)allItemsFolderLocalizedTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All %@"), CFSTR("All %@"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICAccount localizedNameMidSentence](self, "localizedNameMidSentence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedNameMidSentence
{
  void *v3;
  int v4;
  void *v5;

  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("InMemoryAccount"));

  if (v4 || -[ICAccount accountType](self, "accountType") != 3)
  {
    -[ICAccount name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ICAccount localizedLocalAccountNameMidSentence](ICAccount, "localizedLocalAccountNameMidSentence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)localizedLocalAccountNameMidSentence
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (void *)localizedLocalAccountNameMidSentence;
  if (!localizedLocalAccountNameMidSentence)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = CFSTR("on my device");
      goto LABEL_5;
    }
    +[ICAccount localizedLocalAccountNameMidSentence:](ICAccount, "localizedLocalAccountNameMidSentence:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)localizedLocalAccountNameMidSentence;
    localizedLocalAccountNameMidSentence = v4;

    v3 = (void *)localizedLocalAccountNameMidSentence;
  }
  v6 = v3;
LABEL_5:
  objc_sync_exit(v2);

  return v6;
}

- (NSString)localizedName
{
  void *v3;
  int v4;
  void *v5;

  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("InMemoryAccount"));

  if (v4 || -[ICAccount accountType](self, "accountType") != 3)
  {
    -[ICAccount name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ICAccount localizedLocalAccountName](ICAccount, "localizedLocalAccountName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

+ (id)localizedLocalAccountName
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (void *)localizedLocalAccountName;
  if (!localizedLocalAccountName)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = CFSTR("On My Device");
      goto LABEL_5;
    }
    +[ICAccount localizedLocalAccountNameMidSentence:](ICAccount, "localizedLocalAccountNameMidSentence:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)localizedLocalAccountName;
    localizedLocalAccountName = v4;

    v3 = (void *)localizedLocalAccountName;
  }
  v6 = v3;
LABEL_5:
  objc_sync_exit(v2);

  return v6;
}

+ (id)localAccountInContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "accountWithIdentifier:context:", CFSTR("LocalAccount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "didChooseToMigrate") & 1) == 0)
    objc_msgSend(v4, "setDidChooseToMigrate:", 1);
  return v4;
}

+ (ICAccount)accountWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAccount *)v10;
}

+ (BOOL)isCloudKitAccountAvailable
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "managedObjectContext");
  else
    objc_msgSend(v4, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "isCloudKitAccountAvailableInContext:", v6);
  return v7;
}

+ (BOOL)isCloudKitAccountAvailableInContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v4 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v4);
  objc_msgSend((id)accountForAppleCloudKitTable, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      *((_BYTE *)v20 + 24) = 1;
  }

  objc_sync_exit(v4);
  if (*((_BYTE *)v20 + 24))
    goto LABEL_9;
  v8 = (id)accountsForAppleCloudKitTable;
  objc_sync_enter(v8);
  objc_msgSend((id)accountsForAppleCloudKitTable, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      *((_BYTE *)v20 + 24) = 1;
  }

  objc_sync_exit(v8);
  if (*((_BYTE *)v20 + 24))
  {
LABEL_9:
    v14 = 1;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__ICAccount_Management__isCloudKitAccountAvailableInContext___block_invoke;
    v16[3] = &unk_1E76C7730;
    v18 = &v19;
    v17 = v3;
    objc_msgSend(v17, "performBlockAndWait:", v16);

    v14 = *((_BYTE *)v20 + 24) != 0;
  }
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)setName:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[ICAccount name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[ICAccount willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));
    -[ICAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("name"));
    -[ICAccount didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
    -[ICAccount updateAccountNameForAccountListSorting](self, "updateAccountNameForAccountListSorting");
  }

}

- (id)predicateForVisibleFolders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3528]);
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder predicateForVisibleFoldersInContext:](ICFolder, "predicateForVisibleFoldersInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  -[ICAccount predicateForFolders](self, "predicateForFolders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithType:subpredicates:", 1, v7);

  return v8;
}

- (id)predicateForVisibleNotesIncludingTrash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount predicateForNotesInAccount](self, "predicateForNotesInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:](ICNote, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", 1, 1, 1, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predicateForVisibleNotes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICCloudSyncingObject viewContext](self, "viewContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[ICAccount predicateForNotesInAccount](self, "predicateForNotesInAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNote predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:](ICNote, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", 0, +[ICAccount hidesSystemPaperNotesInCustomFolders](ICAccount, "hidesSystemPaperNotesInCustomFolders") ^ 1, +[ICAccount hidesMathNotesInCustomFolders](ICAccount, "hidesMathNotesInCustomFolders") ^ 1, +[ICAccount hidesCallNotesInCustomFolders](ICAccount, "hidesCallNotesInCustomFolders") ^ 1, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_addNonNilObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)hidesSystemPaperNotesInCustomFolders
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICAccountHidesSystemPaperNotesInCustomFolders"));

  return v3;
}

- (id)predicateForNotesInAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.account == %@"), self);
}

- (unint64_t)visibleNotesIncludingTrashCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICAccount predicateForVisibleNotesIncludingTrash](self, "predicateForVisibleNotesIncludingTrash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICNote countOfNotesMatchingPredicate:context:](ICNote, "countOfNotesMatchingPredicate:context:", v3, v4);

  return v5;
}

uint64_t __54__ICAccount_updateTrashFolderHiddenNoteContainerState__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "visibleNotesCount");
    result = objc_msgSend(*(id *)(a1 + 32), "isHiddenNoteContainer");
    if ((v3 == 0) != (_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "setIsHiddenNoteContainer:", v3 == 0);
  }
  return result;
}

- (id)predicateForFolders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("account.identifier == %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasAnyCustomFoldersIncludingSystem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICAccount visibleFolders](self, "visibleFolders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v3)
        {
          -[ICAccount trashFolder](self, "trashFolder");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v11))
          {

          }
          else
          {
            -[ICAccount defaultFolder](self, "defaultFolder");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "isEqual:", v12);

            if (!v13)
            {
LABEL_15:
              v14 = 1;
              goto LABEL_16;
            }
          }
        }
        else if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isModernCustomFolder") & 1) != 0)
        {
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)visibleFolders
{
  void *v3;
  void *v4;
  void *v5;

  -[ICAccount predicateForVisibleFolders](self, "predicateForVisibleFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder foldersMatchingPredicate:context:](ICFolder, "foldersMatchingPredicate:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addTrashObserversIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[ICCloudSyncingObject hasContextOptions:](self, "hasContextOptions:", 721457)
    && !-[ICAccount didAddTrashObservers](self, "didAddTrashObservers"))
  {
    -[ICAccount trashFolder](self, "trashFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ICAccount trashFolder](self, "trashFolder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ic_addObserver:forKeyPath:context:explicitOptions:", self, CFSTR("notes"), compoundliteral, 4);

      -[ICAccount setDidAddTrashObservers:](self, "setDidAddTrashObservers:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v5 = *MEMORY[0x1E0C978A8];
      -[ICAccount managedObjectContext](self, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_managedObjectContextDidSave_, v5, v6);

    }
  }
}

- (ICFolder)trashFolder
{
  ICFolder *trashFolder;
  void *v4;
  ICFolder *v5;
  ICFolder *v6;
  ICFolder *v7;

  trashFolder = self->_trashFolder;
  if (!trashFolder)
  {
    -[ICAccount trashFolderIdentifier](self, "trashFolderIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount folderWithIdentifier:](self, "folderWithIdentifier:", v4);
    v5 = (ICFolder *)objc_claimAutoreleasedReturnValue();
    v6 = self->_trashFolder;
    self->_trashFolder = v5;

    v7 = self->_trashFolder;
    if (!v7)
    {
      -[ICAccount createTrashFolder](self, "createTrashFolder");
      v7 = self->_trashFolder;
    }
    if (-[ICFolder markedForDeletion](v7, "markedForDeletion"))
      -[ICFolder setMarkedForDeletion:](self->_trashFolder, "setMarkedForDeletion:", 0);
    -[ICAccount addTrashObserversIfNecessary](self, "addTrashObserversIfNecessary");
    trashFolder = self->_trashFolder;
  }
  return trashFolder;
}

- (ICFolder)defaultFolder
{
  ICFolder *defaultFolder;
  void *v4;
  ICFolder *v5;
  ICFolder *v6;
  ICFolder *v7;
  int v8;

  defaultFolder = self->_defaultFolder;
  if (!defaultFolder)
  {
    -[ICAccount defaultFolderIdentifier](self, "defaultFolderIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount folderWithIdentifier:](self, "folderWithIdentifier:", v4);
    v5 = (ICFolder *)objc_claimAutoreleasedReturnValue();
    v6 = self->_defaultFolder;
    self->_defaultFolder = v5;

    v7 = self->_defaultFolder;
    if (!v7)
    {
      -[ICAccount createDefaultFolder](self, "createDefaultFolder");
      v7 = self->_defaultFolder;
    }
    v8 = -[ICFolder markedForDeletion](v7, "markedForDeletion");
    defaultFolder = self->_defaultFolder;
    if (v8)
    {
      -[ICFolder setMarkedForDeletion:](defaultFolder, "setMarkedForDeletion:", 0);
      defaultFolder = self->_defaultFolder;
    }
  }
  return defaultFolder;
}

- (void)dealloc
{
  objc_super v3;

  -[ICAccount removeAllObserversIfNecessary](self, "removeAllObserversIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)ICAccount;
  -[ICAccount dealloc](&v3, sel_dealloc);
}

- (void)willTurnIntoFault
{
  ICFolder *trashFolder;
  ICFolder *defaultFolder;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAccount;
  -[ICNoteContainer willTurnIntoFault](&v5, sel_willTurnIntoFault);
  -[ICAccount removeAllObserversIfNecessary](self, "removeAllObserversIfNecessary");
  trashFolder = self->_trashFolder;
  self->_trashFolder = 0;

  defaultFolder = self->_defaultFolder;
  self->_defaultFolder = 0;

}

- (void)removeTrashObserversIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[ICAccount didAddTrashObservers](self, "didAddTrashObservers"))
  {
    -[ICAccount trashFolder](self, "trashFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("notes"), compoundliteral);

    -[ICAccount setDidAddTrashObservers:](self, "setDidAddTrashObservers:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C978A8];
    -[ICAccount managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, v4, v5);

  }
}

- (BOOL)didAddTrashObservers
{
  return self->_didAddTrashObservers;
}

- (id)trashFolderIdentifier
{
  return -[ICAccount standardFolderIdentifierWithPrefix:](self, "standardFolderIdentifierWithPrefix:", CFSTR("TrashFolder"));
}

- (void)setDidAddTrashObservers:(BOOL)a3
{
  self->_didAddTrashObservers = a3;
}

- (id)defaultFolderIdentifier
{
  return -[ICAccount standardFolderIdentifierWithPrefix:](self, "standardFolderIdentifierWithPrefix:", CFSTR("DefaultFolder"));
}

+ (BOOL)hasActiveCloudKitAccountInContext:(id)a3
{
  return +[ICAccount numberOfCloudKitAccountsInContext:onlyMigrated:](ICAccount, "numberOfCloudKitAccountsInContext:onlyMigrated:", a3, 1) != 0;
}

unint64_t __61__ICAccount_Management__isCloudKitAccountAvailableInContext___block_invoke(uint64_t a1)
{
  unint64_t result;

  result = +[ICAccount numberOfCloudKitAccountsInContext:onlyMigrated:](ICAccount, "numberOfCloudKitAccountsInContext:onlyMigrated:", *(_QWORD *)(a1 + 32), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

+ (unint64_t)numberOfCloudKitAccountsInContext:(id)a3 onlyMigrated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  NSObject *v15;
  id v18;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  objc_msgSend(v5, "fetchRequestWithEntityName:", CFSTR("ICAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accountType == %d"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObjects:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("didChooseToMigrate == YES"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v12);

  v18 = 0;
  v13 = objc_msgSend(v6, "countForFetchRequest:error:", v7, &v18);

  v14 = v18;
  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICAccount(Management) numberOfCloudKitAccountsInContext:onlyMigrated:].cold.1();

  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 != 0)
    v13 = 0;

  return v13;
}

- (id)folderWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("account"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder foldersMatchingPredicate:context:](ICFolder, "foldersMatchingPredicate:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isShowingDateHeaders
{
  _BOOL4 v2;

  v2 = -[ICAccount supportsDateHeaders](self, "supportsDateHeaders");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D641D8], "defaultDateHeadersType") == 2;
  return v2;
}

- (BOOL)supportsDateHeaders
{
  void *v2;
  BOOL v3;

  -[ICNoteContainer customNoteSortType](self, "customNoteSortType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resolvedCustomSortTypeOrder") != 3;

  return v3;
}

- (id)subFolderOrderMergeableData
{
  void *v2;
  void *v3;

  -[ICAccount accountData](self, "accountData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)accountForAppleCloudKitTable;
    accountForAppleCloudKitTable = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)accountsForAppleCloudKitTable;
    accountsForAppleCloudKitTable = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
}

+ (void)initializeLocalAccountNamesInBackground
{
  NSObject *v2;

  dispatch_get_global_queue(2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_567);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICAccount ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CoreData/ICAccount.m") & 1) != 0)
  {
    v13 = -[ICAccount ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == compoundliteral && (v13 & 1) == 0)
      -[ICAccount updateTrashFolderHiddenNoteContainerState](self, "updateTrashFolderHiddenNoteContainerState");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAccount;
    -[ICAccount observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

- (unint64_t)visibleNotesCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICAccount predicateForVisibleNotes](self, "predicateForVisibleNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICNote countOfNotesMatchingPredicate:context:](ICNote, "countOfNotesMatchingPredicate:context:", v3, v4);

  return v5;
}

- (BOOL)isPrimaryiCloudAccount
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[ICAccount accountType](self, "accountType");

    if (v4 != 1)
      return 0;
    +[ICAccount accountUtilities](ICAccount, "accountUtilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iCloudACAccountWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ic_isPrimaryAppleAccount");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isManaged
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isManagedACAccountWithIdentifier:", v6);

  return v7;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 3;
}

- (unint64_t)searchResultType
{
  return 3;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  return !-[ICCloudSyncingObject isVisible](self, "isVisible");
}

- (BOOL)isMovable
{
  return 0;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Modern");
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAccount objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  return (CSSearchableItemAttributeSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[ICAccount userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    -[ICAccount username](self, "username");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(v3, "setDisplayName:", v4);
  objc_msgSend(v3, "setTextContent:", v4);
  objc_msgSend(v3, "setIc_searchResultType:", 3);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if (-[ICAccount isManaged](self, "isManaged"))
    v6 = &unk_1E771A420;
  else
    v6 = &unk_1E771A438;
  objc_msgSend(v3, "setDataOwnerType:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAccount associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[ICAccount name](self, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E76DB108;
  v4 = v2;

  return v4;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

+ (void)setAccountUtilities:(id)a3
{
  objc_storeStrong((id *)&_accountUtilities, a3);
}

- (BOOL)isDataSeparated
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "ic_shouldCreateSeparatePersistentStore");
  return (char)v6;
}

- (BOOL)isLocalAccount
{
  void *v2;
  char v3;

  -[ICAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("LocalAccount"));

  return v3;
}

- (NSString)dsid
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *dsid;

  if (!self->_dsid)
  {
    -[ICAccount identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
    {
LABEL_5:

      return self->_dsid;
    }
    v4 = -[ICAccount accountType](self, "accountType");

    if (v4 == 1)
    {
      +[ICAccount accountUtilities](ICAccount, "accountUtilities");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccount identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "iCloudACAccountWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aa_personID");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      dsid = self->_dsid;
      self->_dsid = v7;

      goto LABEL_5;
    }
  }
  return self->_dsid;
}

- (NSString)altDSID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *altDSID;

  if (!self->_altDSID)
  {
    -[ICAccount identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
    {
LABEL_5:

      return self->_altDSID;
    }
    v4 = -[ICAccount accountType](self, "accountType");

    if (v4 == 1)
    {
      +[ICAccount accountUtilities](ICAccount, "accountUtilities");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccount identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "iCloudACAccountWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aa_altDSID");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      altDSID = self->_altDSID;
      self->_altDSID = v7;

      goto LABEL_5;
    }
  }
  return self->_altDSID;
}

- (NSString)username
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *username;

  if (!self->_username)
  {
    -[ICAccount identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
    {
LABEL_5:

      return self->_username;
    }
    v4 = -[ICAccount accountType](self, "accountType");

    if (v4 == 1)
    {
      +[ICAccount accountUtilities](ICAccount, "accountUtilities");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccount identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "iCloudACAccountWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      username = self->_username;
      self->_username = v7;

      goto LABEL_5;
    }
  }
  return self->_username;
}

- (id)cacheKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)localeDidChange:(id)a3
{
  void *v3;
  void *v4;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = (void *)localizedLocalAccountName;
  localizedLocalAccountName = 0;

  v4 = (void *)localizedLocalAccountNameMidSentence;
  localizedLocalAccountNameMidSentence = 0;

  objc_sync_exit(obj);
}

- (void)awakeFromInsert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAccount;
  -[ICCloudSyncingObject awakeFromInsert](&v3, sel_awakeFromInsert);
  -[ICAccount setOwner:](self, "setOwner:", self);
  -[ICAccount setSortOrder:](self, "setSortOrder:", 0);
  -[ICAccount setNestedTitleForSorting:](self, "setNestedTitleForSorting:", &stru_1E76DB108);
  -[ICAccount setIsHiddenNoteContainer:](self, "setIsHiddenNoteContainer:", 1);
  -[ICAccount setStoreDataSeparately:](self, "setStoreDataSeparately:", 1);
}

- (void)prepareForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAccount;
  -[ICAccount prepareForDeletion](&v4, sel_prepareForDeletion);
  -[ICAccount removeAllObserversIfNecessary](self, "removeAllObserversIfNecessary");
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeMainKeyFromKeychainForObject:", self);

}

- (void)setMarkedForDeletion:(BOOL)a3
{
  NSObject *v3;
  void *v5;

  if (a3)
  {
    v3 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ICAccount setMarkedForDeletion:].cold.1(v3);

  }
  else
  {
    -[ICAccount willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedForDeletion"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("markedForDeletion"));

    -[ICAccount didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedForDeletion"));
  }
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (void)performBlockInPersonaContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlockInPersonaContext:forAccountIdentifier:", v4, v5);

}

- (void)performBlockInPersonaContextIfNecessary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ICAccount_performBlockInPersonaContextIfNecessary___block_invoke;
  v6[3] = &unk_1E76C91F0;
  v7 = v4;
  v5 = v4;
  -[ICAccount performBlockInPersonaContext:](self, "performBlockInPersonaContext:", v6);

}

uint64_t __53__ICAccount_performBlockInPersonaContextIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)createStandardFolders
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Existing folder's account isn't deleted. Faulting it by checking its identifier: (%@)", a1, 0xCu);

}

- (void)createDefaultFolder
{
  void *v3;
  ICFolder *v4;
  ICFolder *defaultFolder;
  void *v6;

  -[ICAccount defaultFolderIdentifier](self, "defaultFolderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v3, self);
  defaultFolder = self->_defaultFolder;
  self->_defaultFolder = v4;

  +[ICFolder englishTitleForDefaultFolder](ICFolder, "englishTitleForDefaultFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder setTitle:](self->_defaultFolder, "setTitle:", v6);

  -[ICFolder setSortOrder:](self->_defaultFolder, "setSortOrder:", 1);
  -[ICFolder updateChangeCountWithReason:](self->_defaultFolder, "updateChangeCountWithReason:", CFSTR("Created default folder"));
}

- (void)createTrashFolder
{
  void *v3;
  ICFolder *v4;
  ICFolder *trashFolder;
  void *v6;

  -[ICAccount trashFolderIdentifier](self, "trashFolderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v3, self);
  trashFolder = self->_trashFolder;
  self->_trashFolder = v4;

  +[ICFolder englishTitleForTrashFolder](ICFolder, "englishTitleForTrashFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder setTitle:](self->_trashFolder, "setTitle:", v6);

  -[ICFolder setFolderType:](self->_trashFolder, "setFolderType:", 1);
  -[ICFolder setIsHiddenNoteContainer:](self->_trashFolder, "setIsHiddenNoteContainer:", 1);
  -[ICFolder setSortOrder:](self->_trashFolder, "setSortOrder:", 3);
  -[ICAccount addTrashObserversIfNecessary](self, "addTrashObserversIfNecessary");
  -[ICFolder updateChangeCountWithReason:](self->_trashFolder, "updateChangeCountWithReason:", CFSTR("Created trash folder"));
}

+ (id)keyPathsForValuesAffectingLocalizedName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("accountType"), CFSTR("name"), 0);
}

- (NSPersistentStore)persistentStore
{
  void *v2;
  void *v3;

  -[ICAccount objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStore *)v3;
}

- (BOOL)isLeaf
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)supportsLegacyTombstones
{
  return -[ICAccount accountType](self, "accountType") == 1;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;
  NSObject *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ICAccount accountType](self, "accountType");
    v7 = objc_msgSend(v5, "accountType");
    v8 = -[ICAccount accountType](self, "accountType");
    if (v6 == v7)
    {
      if (v8 != 1)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0D64240], "persistentStoreURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccount persistentStore](self, "persistentStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v9);

      objc_msgSend(v5, "persistentStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v9);

      if (v12 && !v15)
      {
        v16 = -1;
LABEL_19:

        goto LABEL_20;
      }

      if ((v12 | v15 ^ 1) == 1)
      {
LABEL_18:
        -[ICAccount name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v18);

        goto LABEL_19;
      }
    }
    else
    {
      if (v8 == 1)
      {
        v16 = -1;
LABEL_20:

        goto LABEL_21;
      }
      if (objc_msgSend(v5, "accountType") != 1)
        goto LABEL_18;
    }
    v16 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = -1;
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ICAccount compare:].cold.1((uint64_t)self, (uint64_t)v4, v17);

    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (unint64_t)visibleCustomFoldersCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICAccount predicateForCustomFolders](self, "predicateForCustomFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICFolder countOfFoldersMatchingPredicate:context:](ICFolder, "countOfFoldersMatchingPredicate:context:", v3, v4);

  return v5;
}

- (BOOL)containsSharedFolders
{
  void *v3;
  char v4;

  if (-[ICAccount accountType](self, "accountType") != 1)
    return 0;
  -[ICAccount visibleFolders](self, "visibleFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_25);

  return v4;
}

uint64_t __34__ICAccount_containsSharedFolders__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharedViaICloud");
}

- (id)customRootLevelFolders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[ICAccount predicateForVisibleFolders](self, "predicateForVisibleFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parent == nil"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sortOrder == %d"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccount folders](self, "folders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredSetUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)indexOfCustomRootLevelFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "sortOrder") != 2)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "folder.sortOrder == ICNoteContainerSortOrderFolder", "-[ICAccount indexOfCustomRootLevelFolder:]", 1, 0, CFSTR("Grabbing index of non-custom folder"));
  -[ICAccount subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICAccount customRootLevelFolders](self, "customRootLevelFolders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "indexOfObject:", v4);

  }
  return v7;
}

- (id)predicateForCustomFolders
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount predicateForVisibleFolders](self, "predicateForVisibleFolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3880];
  -[ICAccount defaultFolderIdentifier](self, "defaultFolderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("identifier != %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3880];
  -[ICAccount trashFolderIdentifier](self, "trashFolderIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("identifier != %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)predicateForPinnedNotes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount predicateForNotesInAccount](self, "predicateForNotesInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[ICNote predicateForPinnedNotes](ICNote, "predicateForPinnedNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)visibleFoldersWithParent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICAccount visibleFolders](self, "visibleFolders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "parent");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)visibleRootFoldersContainFolderWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICAccount visibleFoldersWithParent:](self, "visibleFoldersWithParent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  +[ICFolder reservedFolderTitles](ICFolder, "reservedFolderTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  -[ICAccount reservedAccountFolderTitles](self, "reservedAccountFolderTitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  LOBYTE(v9) = objc_msgSend(v7, "containsObject:", v4);
  return (char)v9;
}

- (id)reservedAccountFolderTitles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[ICAccount allItemsFolderLocalizedTitle](self, "allItemsFolderLocalizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleNoteContainers
{
  void *v3;
  void *v4;
  void *v5;

  -[ICAccount visibleFolders](self, "visibleFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount accountProxy](self, "accountProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("visibleFolders"));
}

- (id)visibleNoteContainerChildren
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICAccount visibleFolders](self, "visibleFolders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "parent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

        }
        else if ((objc_msgSend(v9, "isHiddenNoteContainer") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_msgSend(v12, "count");
  -[ICAccount trashFolder](self, "trashFolder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "containsObject:", v14);

  if (v13 - (unint64_t)v15 >= 2)
  {
    -[ICAccount accountProxy](self, "accountProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v16, 0);

  }
  return v12;
}

- (id)uniqueUserParticipants
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[3];
  _QWORD v80[5];

  v80[3] = *MEMORY[0x1E0C80C00];
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote predicateForVisibleNotesInContext:](ICNote, "predicateForVisibleNotesInContext:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.account == %@"), self);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("serverShareData != nil"), self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v64 = (void *)v5;
  v65 = (void *)v4;
  v80[0] = v4;
  v80[1] = v5;
  v80[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder predicateForVisibleFoldersInContext:](ICFolder, "predicateForVisibleFoldersInContext:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account == %@"), self);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v60 = (void *)v12;
  v61 = (void *)v11;
  v79[0] = v11;
  v79[1] = v12;
  v63 = (void *)v6;
  v79[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  +[ICNote fetchRequest](ICNote, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v9;
  objc_msgSend(v16, "setPredicate:", v9);
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v58 = v16;
  objc_msgSend(v17, "executeFetchRequest:error:", v16, &v76);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v76;

  if (v19)
  {
    v20 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ICAccount uniqueUserParticipants].cold.2();

  }
  +[ICFolder fetchRequest](ICFolder, "fetchRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v15);
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v19;
  v56 = v21;
  objc_msgSend(v22, "executeFetchRequest:error:", v21, &v75);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v75;

  if (v24)
  {
    v25 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ICAccount uniqueUserParticipants].cold.1();

  }
  v55 = v24;
  v59 = (void *)v15;
  v57 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v23;
  objc_msgSend(v26, "addObjectsFromArray:", v23);
  v53 = v26;
  objc_msgSend(v26, "ic_flatMap:", &__block_literal_global_115);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v27;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v33, "userIdentity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "userRecordID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "recordName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v33, "ic_participantName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@_%@"), v38, v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "allKeys");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "containsObject:", v39);

          if ((v41 & 1) == 0)
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, v39);

        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v30);
  }

  objc_msgSend(v28, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v45 = v43;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v68 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "ic_addNonNilObject:", v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v47);
  }

  v51 = (void *)objc_msgSend(v44, "copy");
  return v51;
}

id __35__ICAccount_uniqueUserParticipants__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "serverShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_acceptedParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_117);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __35__ICAccount_uniqueUserParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C94730]) ^ 1;

  return v5;
}

- (ICAccountProxy)accountProxy
{
  ICAccountProxy *accountProxy;
  ICAccountProxy *v4;
  ICAccountProxy *v5;

  accountProxy = self->_accountProxy;
  if (!accountProxy)
  {
    +[ICAccountProxy accountProxyWithAccount:](ICAccountProxy, "accountProxyWithAccount:", self);
    v4 = (ICAccountProxy *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountProxy;
    self->_accountProxy = v4;

    accountProxy = self->_accountProxy;
  }
  return accountProxy;
}

- (id)allChildObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  ICAccount *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  -[ICAccount folders](self, "folders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "addObjectsFromArray:", v5);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v38 = v5;
    obj = (id)objc_msgSend(v5, "copy");
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v60 != v40)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v7, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:](ICLegacyTombstone, "tombstoneIdentifierForObjectIdentifier:type:", v8, 2);
          v9 = objc_claimAutoreleasedReturnValue();

          -[ICAccount managedObjectContext](v48, "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)v9;
          +[ICLegacyTombstone legacyTombstoneWithIdentifier:context:](ICLegacyTombstone, "legacyTombstoneWithIdentifier:context:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v7, "notes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allObjects");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v43 = v11;
            v44 = i;
            objc_msgSend(v3, "addObjectsFromArray:", v13);
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v42 = v13;
            v46 = v13;
            v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
            if (v49)
            {
              v47 = *(_QWORD *)v56;
              do
              {
                for (j = 0; j != v49; ++j)
                {
                  if (*(_QWORD *)v56 != v47)
                    objc_enumerationMutation(v46);
                  v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                  objc_msgSend(v15, "identifier");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:](ICLegacyTombstone, "tombstoneIdentifierForObjectIdentifier:type:", v16, 2);
                  v17 = objc_claimAutoreleasedReturnValue();

                  -[ICAccount managedObjectContext](v48, "managedObjectContext");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = (void *)v17;
                  +[ICLegacyTombstone legacyTombstoneWithIdentifier:context:](ICLegacyTombstone, "legacyTombstoneWithIdentifier:context:", v17, v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v19)
                    objc_msgSend(v3, "addObject:", v19);
                  objc_msgSend(v15, "attachments");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "allObjects");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v21);
                  v53 = 0u;
                  v54 = 0u;
                  v51 = 0u;
                  v52 = 0u;
                  v22 = v21;
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
                  if (v23)
                  {
                    v24 = v23;
                    v25 = *(_QWORD *)v52;
                    do
                    {
                      for (k = 0; k != v24; ++k)
                      {
                        if (*(_QWORD *)v52 != v25)
                          objc_enumerationMutation(v22);
                        v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
                        objc_msgSend(v27, "media");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v28)
                        {
                          objc_msgSend(v27, "media");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "addObject:", v29);

                        }
                        objc_msgSend(v27, "previewImages");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v30)
                        {
                          objc_msgSend(v27, "previewImages");
                          v31 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v31, "allObjects");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "addObjectsFromArray:", v32);

                        }
                      }
                      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
                    }
                    while (v24);
                  }

                  objc_msgSend(v15, "inlineAttachments");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "allObjects");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v34);

                }
                v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
              }
              while (v49);
            }

            v11 = v43;
            i = v44;
            v13 = v42;
          }

        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v41);
    }

    v5 = v38;
  }
  -[ICAccount hashtags](v48, "hashtags");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v36);

  return v3;
}

- (BOOL)shouldExcludeFilesFromCloudBackup
{
  return -[ICAccount accountType](self, "accountType") == 1;
}

- (id)accountFilesDirectoryURLInApplicationDataContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend((id)objc_opt_class(), "accountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationDataContainerURLForAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccount identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EE8], 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAccount identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = v5;

  return v10;
}

- (id)fallbackPDFDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EC0], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)exportableMediaDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EB0], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)deleteUnusedHashtagsWithStandardizedContent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!+[ICInlineAttachment isHashtagStandardizedContent:usedInAccount:](ICInlineAttachment, "isHashtagStandardizedContent:usedInAccount:", v9, self))
        {
          +[ICHashtag hashtagWithStandardizedContent:account:](ICHashtag, "hashtagWithStandardizedContent:account:", v9, self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "markForDeletion");

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)temporaryDirectoryURL
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__ICAccount_temporaryDirectoryURL__block_invoke;
  v4[3] = &unk_1E76C77A8;
  v4[4] = &v5;
  -[ICAccount performBlockInPersonaContext:](self, "performBlockInPersonaContext:", v4);
  if (v6[5])
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__ICAccount_temporaryDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  NSTemporaryDirectory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)systemPaperTemporaryDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v16;

  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationDocumentsURLForAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63ED0], 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v16);
  v11 = v16;

  if ((v10 & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICAccount systemPaperTemporaryDirectoryURL].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "temporaryDirectory");
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }

  return v8;
}

- (void)ensureCriticalPaperDirectoriesExist
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, v6, "Failed to create paper bundle URL for account (%@): %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (id)systemPaperDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount accountFilesDirectoryURL](self, "accountFilesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63ED0], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)systemPaperBundlesDirectoryURL
{
  void *v2;
  void *v3;

  -[ICAccount systemPaperDirectoryURL](self, "systemPaperDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EA8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)systemPaperNotes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[ICAccount predicateForNotesInAccount](self, "predicateForNotesInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isSystemPaper == YES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mostRecentSystemPaperNoteInManagedObjectContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "+[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:]";
    v15 = 1024;
    v16 = 1017;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  +[ICNote systemPaperNotesFetchRequest](ICNote, "systemPaperNotesFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  v12 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:].cold.3();

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:].cold.2(v9, v10);

  }
  else
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (void)setHidesSystemPaperNotesInCustomFolders:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICAccountHidesSystemPaperNotesInCustomFolders"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("ICAccountHidesSystemPaperNotesInCustomFoldersDidChangeNotification"), 0, 0);

}

+ (BOOL)hidesMathNotesInCustomFolders
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICAccountHidesMathNotesInCustomFolders"));

  return v3;
}

+ (void)setHidesMathNotesInCustomFolders:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICAccountHidesMathNotesInCustomFolders"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("ICAccountHidesMathNotesInCustomFoldersDidChangeNotification"), 0, 0);

}

+ (BOOL)hidesCallNotesInCustomFolders
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICAccountHidesCallNotesInCustomFolders"));

  return v3;
}

+ (void)setHidesCallNotesInCustomFolders:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICAccountHidesCallNotesInCustomFolders"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("ICAccountHidesCallNotesInCustomFoldersDidChangeNotification"), 0, 0);

}

- (void)updateFullNameAndEmail:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICAccount accountType](self, "accountType") == 1)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2080;
      v16 = "-[ICAccount updateFullNameAndEmail:]";
      v17 = 1024;
      v18 = 1096;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Fetching user's full name and primary email address… {account: %@}%s:%d", buf, 0x1Cu);

    }
    objc_initWeak((id *)buf, self);
    -[ICCloudSyncingObject cloudContext](self, "cloudContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerForAccountID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__ICAccount_updateFullNameAndEmail___block_invoke;
    v10[3] = &unk_1E76CA960;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v4;
    objc_msgSend(v9, "fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __36__ICAccount_updateFullNameAndEmail___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id WeakRetained;
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = os_log_create("com.apple.notes", "Cloud");
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_1();
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFullName:", v9);

  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v13, "setPrimaryEmail:", v8);

  performBlockOnMainThread();
}

- (BOOL)canHaveCryptoStrategy
{
  return 1;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1EF522D18;
}

- (BOOL)cryptoStrategyIsTransient
{
  return 1;
}

- (signed)resolvedLockedNotesMode
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  signed __int16 v8;

  -[ICAccount accountData](self, "accountData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[ICAccount accountData](self, "accountData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockedNotesMode");

  if (!v6)
    return 1;
  -[ICAccount accountData](self, "accountData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lockedNotesMode");

  return v8;
}

- (void)setResolvedLockedNotesMode:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v3 = a3;
  -[ICAccount accountData](self, "accountData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ICAccount accountData](self, "accountData"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "lockedNotesMode"),
        v7,
        v6,
        v8 == (_DWORD)v3))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICAccount setResolvedLockedNotesMode:].cold.2(self, v3);

  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICAccount setResolvedLockedNotesMode:].cold.1(self, v3);

    -[ICAccount accountDataCreateIfNecessary](self, "accountDataCreateIfNecessary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLockedNotesMode:", v3);

    -[ICAccount accountData](self, "accountData");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateChangeCountWithReason:](v9, "updateChangeCountWithReason:", CFSTR("Set locked notes mode"));
  }

}

- (id)passwordProtectedNotes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount predicateForNotesInAccount](self, "predicateForNotesInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject predicateForVisibleObjects](ICNote, "predicateForVisibleObjects", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  +[ICCloudSyncingObject predicateForPasswordProtectedObjects](ICNote, "predicateForPasswordProtectedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canPasswordProtectNotes
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userType");

  return -[ICAccount accountType](self, "accountType") != 1 || v5 != 1;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)visibleNotes
{
  void *v3;
  void *v4;
  void *v5;

  -[ICAccount predicateForVisibleNotes](self, "predicateForVisibleNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)visibleInCloudNotesIncludingTrashCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[ICAccount predicateForVisibleNotesIncludingTrash](self, "predicateForVisibleNotesIncludingTrash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject predicateForInCloudObjects](ICCloudSyncingObject, "predicateForInCloudObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[ICNote countOfNotesMatchingPredicate:context:](ICNote, "countOfNotesMatchingPredicate:context:", v8, v9);

  return v10;
}

- (unint64_t)visibleAttachmentsIncludingTrashCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICAccount predicateForVisibleAttachmentsIncludingTrash](self, "predicateForVisibleAttachmentsIncludingTrash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICAttachment countOfAttachmentsMatchingPredicate:context:](ICAttachment, "countOfAttachmentsMatchingPredicate:context:", v3, v4);

  return v5;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[ICAccount didChooseToMigrate](self, "didChooseToMigrate") != a3)
  {
    -[ICAccount willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("didChooseToMigrate"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("didChooseToMigrate"));

    -[ICAccount didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("didChooseToMigrate"));
    +[ICMigrationUtilities updateLegacyAccountMigrationStateForModernAccount:](ICMigrationUtilities, "updateLegacyAccountMigrationStateForModernAccount:", self);
  }
}

- (void)updateAccountNameForAccountListSorting
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ICAccount localizedName](self, "localizedName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E76DB108;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld_%@"), (int)-[ICAccount accountType](self, "accountType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount setAccountNameForAccountListSorting:](self, "setAccountNameForAccountListSorting:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICAccount ownerInverse](self, "ownerInverse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        -[ICAccount accountNameForAccountListSorting](self, "accountNameForAccountListSorting");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAccountNameForAccountListSorting:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)predicateForAttachmentsInAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.folder.account == %@"), self);
}

- (id)predicateForVisibleAttachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount predicateForAttachmentsInAccount](self, "predicateForAttachmentsInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleAttachmentsInContext:](ICAttachment, "predicateForVisibleAttachmentsInContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predicateForVisibleAttachmentsIncludingTrash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount predicateForAttachmentsInAccount](self, "predicateForAttachmentsInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleAttachmentsIncludingTrashInContext:](ICAttachment, "predicateForVisibleAttachmentsIncludingTrashInContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predicateForSearchableAttachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment predicateForSearchableAttachmentsInContext:](ICAttachment, "predicateForSearchableAttachmentsInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  -[ICAccount predicateForAttachmentsInAccount](self, "predicateForAttachmentsInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICCloudSyncingObject hasContextOptions:](self, "hasContextOptions:", 1))
  {
    -[ICAccount managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            -[ICAccount trashFolder](self, "trashFolder", (_QWORD)v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 == v17)
            {
              -[ICAccount updateTrashFolderHiddenNoteContainerState](self, "updateTrashFolderHiddenNoteContainerState");
              goto LABEL_13;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

}

- (id)ic_loggingIdentifier
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  v12 = 0;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__ICAccount_ic_loggingIdentifier__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__ICAccount_ic_loggingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICAccount *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICAccount;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__ICAccount_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __29__ICAccount_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
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

  objc_msgSend(*(id *)(a1 + 40), "dsid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("dsid"));

  objc_msgSend(*(id *)(a1 + 40), "userRecordName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("userRecordName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didChooseToMigrate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("didChooseToMigrate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didFinishMigration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("didFinishMigration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didMigrateOnMac"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("didMigrateOnMac"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "notes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("noteCount"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "folders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, CFSTR("folderCount"));

  objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskContinuationToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("serverSideUpdateTaskContinuationToken"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskFailureCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("serverSideUpdateTaskFailureCount"));

  objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskLastAttemptedBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, CFSTR("serverSideUpdateTaskLastAttemptedBuild"));

  objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskLastAttemptedVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, CFSTR("serverSideUpdateTaskLastAttemptedVersion"));

  objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskLastCompletedBuild");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v21, CFSTR("serverSideUpdateTaskLastCompletedBuild"));

  objc_msgSend(*(id *)(a1 + 40), "serverSideUpdateTaskLastCompletedVersion");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("serverSideUpdateTaskLastCompletedVersion"));

}

- (id)visibleSubFolders
{
  void *v2;
  void *v3;

  -[ICAccount customRootLevelFolders](self, "customRootLevelFolders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSubFolderOrderMergeableData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICAccount accountData](self, "accountData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMergeableData:", v4);

}

- (void)updateSubFolderMergeableDataChangeCount
{
  id v2;

  -[ICAccount accountData](self, "accountData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateChangeCountWithReason:", CFSTR("Updated subfolders"));

}

- (void)setUserRecordName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v6;
    v12 = 2112;
    v14 = 2080;
    v13 = v4;
    v15 = "-[ICAccount setUserRecordName:]";
    v16 = 1024;
    v17 = 1458;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Setting user record name… {account: %@, userRecordName: %@}%s:%d", (uint8_t *)&v10, 0x26u);

  }
  NSStringFromSelector(sel_userRecordName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount willChangeValueForKey:](self, "willChangeValueForKey:", v7);

  NSStringFromSelector(sel_userRecordName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, v8);

  NSStringFromSelector(sel_userRecordName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccount didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (BOOL)allowsImporting
{
  return 1;
}

- (BOOL)allowsExporting
{
  return 1;
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (void)setDefaultFolder:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFolder, a3);
}

- (void)setTrashFolder:(id)a3
{
  objc_storeStrong((id *)&self->_trashFolder, a3);
}

- (void)setAccountProxy:(id)a3
{
  objc_storeStrong((id *)&self->_accountProxy, a3);
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSPersonNameComponents)fullName
{
  return self->fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->fullName, a3);
}

- (NSString)primaryEmail
{
  return self->primaryEmail;
}

- (void)setPrimaryEmail:(id)a3
{
  objc_storeStrong((id *)&self->primaryEmail, a3);
}

+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5
{
  return (id)objc_msgSend(a1, "newAccountWithIdentifier:type:context:persistentStore:", a3, *(_QWORD *)&a4, a5, 0);
}

+ (id)newAccountWithIdentifier:(id)a3 type:(int)a4 context:(id)a5 persistentStore:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a6;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICAccount"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", v10);
    objc_msgSend(v12, "setAccountType:", v8);
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistentStoreForAccountID:", v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "assignToPersistentStore:", v13);
    objc_msgSend(v12, "createStandardFolders");

  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ICAccount(Management) newAccountWithIdentifier:type:context:persistentStore:].cold.1(a2, v14);

    v12 = 0;
  }

  return v12;
}

+ (id)newLocalAccountInContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(a1, "accountWithIdentifier:context:", CFSTR("LocalAccount"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Trying to add the local account, but it already exists", v12, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "userType") == 1 && !objc_msgSend(v9, "isTransientUser"))
    {

      v6 = 0;
      goto LABEL_9;
    }
    v6 = (void *)objc_msgSend(a1, "newAccountWithIdentifier:type:context:", CFSTR("LocalAccount"), 3, v4);
    objc_msgSend(v6, "setDidChooseToMigrate:", 1);

  }
  objc_msgSend(a1, "localizedLocalAccountName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v10);

LABEL_9:
  return v6;
}

+ (id)inMemoryAccountInContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "accountWithIdentifier:context:", CFSTR("InMemoryAccount"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(a1, "newAccountWithIdentifier:type:context:", CFSTR("InMemoryAccount"), 3, v4);
    objc_msgSend(v5, "setDidChooseToMigrate:", 1);
    objc_msgSend(v5, "setName:", CFSTR("In-Memory"));
  }

  return v5;
}

+ (void)deleteAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ICAccount(Management) deleteAccount:].cold.2(v3, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICAccountWillBeDeletedNotification"), v3);

  objc_msgSend(v3, "removeAllObserversIfNecessary");
  if (objc_msgSend(v3, "storeDataSeparately"))
  {
    objc_msgSend(v3, "accountFilesDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteObject:", v3);

  if (v6)
  {
    +[ICFileUtilities coordinateDeleteItemAt:](ICFileUtilities, "coordinateDeleteItemAt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ICAccount(Management) deleteAccount:].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("ICAccountWasDeletedNotification"), v3);

}

+ (void)deleteAccountWithBatchDelete:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v5;
    _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Deleting modern account with batch delete %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICAccountWillBeDeletedNotification"), v4);

  objc_msgSend(v4, "removeAllObserversIfNecessary");
  v8 = objc_msgSend(v4, "storeDataSeparately");
  v37 = (void *)v5;
  if (v8)
  {
    objc_msgSend(v4, "accountFilesDirectoryURL");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v33 = 0;
    v34 = 0;
  }
  else
  {
    +[ICMedia mediaIdentifiersForAccount:](ICMedia, "mediaIdentifiersForAccount:", v4);
    v33 = objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImage attachmentPreviewImageIdentifiersForAccount:](ICAttachmentPreviewImage, "attachmentPreviewImageIdentifiersForAccount:", v4);
    v34 = objc_claimAutoreleasedReturnValue();
    +[ICAttachment attachmentIdentifiersForAccount:](ICAttachment, "attachmentIdentifiersForAccount:", v4);
    v35 = 0;
    v36 = objc_claimAutoreleasedReturnValue();
  }
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeMainKeysFromKeychainForAccount:", v4);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("ICAccount"));
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("identifier == %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v10);
  v15 = (void *)MEMORY[0x1C3B7AC74](objc_msgSend(v14, "setResultType:", 0));
  objc_msgSend(v4, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v17 = (id)objc_msgSend(v16, "executeRequest:error:", v14, &v39);
  v18 = v39;
  if (v18)
  {
    v19 = v18;
    v20 = a1;
    v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[ICAccount(Management) deleteAccountWithBatchDelete:].cold.4();

    v22 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[ICAccount(Management) deleteAccountWithBatchDelete:].cold.3();

    objc_msgSend(v20, "deleteAccount:", v4);
  }
  v38 = 0;
  objc_msgSend(v16, "save:", &v38);
  v23 = v38;
  if (v23)
  {
    v24 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[ICAccount(Management) deleteAccountWithBatchDelete:].cold.2();

  }
  objc_autoreleasePoolPop(v15);
  if (v8)
  {
    v25 = (void *)v35;
    +[ICFileUtilities coordinateDeleteItemAt:](ICFileUtilities, "coordinateDeleteItemAt:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v33;
    v28 = (void *)v34;
    v29 = (void *)v36;
    if (v26)
    {
      v30 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[ICAccount(Management) deleteAccount:].cold.1();

    }
  }
  else
  {
    v27 = (void *)v33;
    +[ICMedia purgeMediaFilesForIdentifiers:account:](ICMedia, "purgeMediaFilesForIdentifiers:account:", v33, v4);
    v28 = (void *)v34;
    +[ICAttachmentPreviewImage purgePreviewImageFilesForIdentifiers:account:](ICAttachmentPreviewImage, "purgePreviewImageFilesForIdentifiers:account:", v34, v4);
    v29 = (void *)v36;
    +[ICAttachment purgeAttachmentFilesForIdentifiers:account:](ICAttachment, "purgeAttachmentFilesForIdentifiers:account:", v36, v4);
    v25 = (void *)v35;
  }
  v31 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = (uint64_t)v37;
    _os_log_impl(&dword_1BD918000, v31, OS_LOG_TYPE_INFO, "Completed batch delete for modern account %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "postNotificationName:object:", CFSTR("ICAccountWasDeletedNotification"), v4);

}

+ (id)cloudKitAccountWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = 0;
  if (v7 && v8)
  {
    if (objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests"))
    {
      objc_msgSend(a1, "accountWithIdentifier:context:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v10 = (id)accountsForAppleCloudKitTable;
    objc_sync_enter(v10);
    objc_msgSend((id)accountsForAppleCloudKitTable, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12;
    if (v12)
      goto LABEL_6;
    +[ICAccount accountUtilities](ICAccount, "accountUtilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iCloudACAccountWithIdentifier:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "ic_isNotesEnabled"))
    {
      v9 = 0;
      goto LABEL_18;
    }
    objc_msgSend(a1, "accountWithIdentifier:context:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_6:
      objc_msgSend(v9, "managedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if ((objc_msgSend(v9, "isDeleted") & 1) == 0)
        {
          if (v12)
          {
LABEL_19:

            objc_sync_exit(v10);
            goto LABEL_20;
          }
          goto LABEL_14;
        }
        v14 = 0;
      }
      else
      {
        objc_msgSend(a1, "accountWithIdentifier:context:", v6, v7);
        v14 = objc_claimAutoreleasedReturnValue();
      }

      v9 = (void *)v14;
    }
LABEL_14:
    v16 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v6);
    v17 = (void *)accountsForAppleCloudKitTable;
    v18 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v17, "setObject:forKey:", v18, v7);

LABEL_18:
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

+ (id)cloudKitAccountInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__20;
  v47 = __Block_byref_object_dispose__20;
  v48 = 0;
  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryICloudACAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAccount(Management) cloudKitAccountInContext:].cold.5(v8, (uint64_t)v49, v7);
  }

  v9 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v9);
  objc_msgSend((id)accountForAppleCloudKitTable, "objectForKey:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v44[5];
  v44[5] = v10;

  objc_sync_exit(v9);
  v12 = (void *)v44[5];
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    objc_msgSend(v12, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v21 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[ICAccount(Management) cloudKitAccountInContext:].cold.3();

      v33[0] = v13;
      v33[1] = 3221225472;
      v33[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_580;
      v33[3] = &unk_1E76CA9A8;
      v36 = &v43;
      v37 = a1;
      v34 = v6;
      v35 = v4;
      objc_msgSend(v35, "performBlockAndWait:", v33);

    }
    else
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      objc_msgSend((id)v44[5], "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_2;
      v28[3] = &unk_1E76CA9D0;
      v28[4] = &v29;
      v28[5] = &v43;
      objc_msgSend(v16, "performBlockAndWait:", v28);

      if (*((_BYTE *)v30 + 24))
      {
        v17 = os_log_create("com.apple.notes", "Accounts");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          +[ICAccount(Management) cloudKitAccountInContext:].cold.4();

        v18 = (void *)v44[5];
        v44[5] = 0;

      }
      _Block_object_dispose(&v29, 8);
    }
  }
  else if (objc_msgSend(v6, "ic_isNotesEnabled"))
  {
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        +[ICAccount(Management) cloudKitAccountInContext:].cold.1();

      v38[0] = v13;
      v38[1] = 3221225472;
      v38[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke;
      v38[3] = &unk_1E76CA9A8;
      v41 = &v43;
      v42 = a1;
      v39 = v19;
      v40 = v4;
      objc_msgSend(v40, "performBlockAndWait:", v38);

    }
  }
  else
  {
    v22 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[ICAccount(Management) cloudKitAccountInContext:].cold.2();

  }
  v23 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v23);
  objc_msgSend((id)accountForAppleCloudKitTable, "setObject:forKey:", v44[5], v4);
  objc_sync_exit(v23);

  objc_msgSend((id)v44[5], "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_581;
  v27[3] = &unk_1E76C77A8;
  v27[4] = &v43;
  objc_msgSend(v24, "performBlockAndWait:", v27);

  v25 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  return v25;
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 56), "accountWithIdentifier:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_580(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:context:", v6, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isDeleted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_581(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_581_cold_1(a1, v2);

}

+ (id)cloudKitIfMigratedElseLocalAccountInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "cloudKitAccountInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "didChooseToMigrate"))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(a1, "allActiveCloudKitAccountsInContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v8, "firstObject");
    else
      objc_msgSend(a1, "localAccountInContext:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)defaultAccountInContext:(id)a3
{
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;

  v4 = a3;
  v5 = (const __CFString *)ICSettingsBundleID();
  CFPreferencesAppSynchronize(v5);
  v6 = (const __CFString *)ICSettingsBundleID();
  v7 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("DefaultNotesAccount"), v6);
  v8 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICAccount(Management) defaultAccountInContext:].cold.3(v7, v8, v9);

  if (objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests"))
  {
    +[ICDefaultAccountUtilities _defaultAccountIdentifierForTests](ICDefaultAccountUtilities, "_defaultAccountIdentifierForTests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = v10;

      v12 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[ICAccount(Management) defaultAccountInContext:].cold.2();

      v7 = v11;
    }

  }
  if (v7)
  {
    +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v7, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "didChooseToMigrate"))
    {
      v15 = v14;
      v14 = v15;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = 0;
  }
  if (!-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x1E0D629B0])
    || (objc_msgSend(a1, "localAccountInContext:", v4),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "didChooseToMigrate"),
        v16,
        !v17)
    || (objc_msgSend(a1, "localAccountInContext:", v4), (v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v18 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[ICAccount(Management) defaultAccountInContext:].cold.1();

    objc_msgSend(a1, "cloudKitIfMigratedElseLocalAccountInContext:", v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  v19 = v15;

  return v19;
}

+ (id)activeAccountWithUserRecordName:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("didChooseToMigrate == YES && userRecordName == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_accountType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v8, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)allAccountsInContext:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3928];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithKey:ascending:", CFSTR("name"), 1);
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", 0, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allAccountIdentifiersInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3B7AC74]();
  +[ICAccount fetchRequest](ICAccount, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E771AB00);
  objc_msgSend(v3, "executeFetchRequest:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
  else
    v8 = 0;

  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)passwordProtectedNoteIdentifiersInAccountIdentifier:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("folder.account.identifier == %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  +[ICCloudSyncingObject predicateForPasswordProtectedObjects](ICCloudSyncingObject, "predicateForPasswordProtectedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote noteIdentifiersMatchingPredicate:context:](ICNote, "noteIdentifiersMatchingPredicate:context:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)allActiveAccountsInContext:(id)a3
{
  return (id)objc_msgSend(a1, "allActiveAccountsInContext:sortDescriptors:relationshipKeyPathsForPrefetching:", a3, 0, 0);
}

+ (id)allActiveAccountsInContextSortedByAccountType:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3928];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithKey:ascending:", CFSTR("accountType"), 1);
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allActiveAccountsInContext:sortDescriptors:relationshipKeyPathsForPrefetching:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allActiveAccountsInContextWithDefaultBeingFirstIfApplicable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "allActiveAccountsInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__ICAccount_Management__allActiveAccountsInContextWithDefaultBeingFirstIfApplicable___block_invoke;
  v13[3] = &unk_1E76CA9F8;
  v14 = v6;
  v7 = v6;
  objc_msgSend(v5, "ic_objectsPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "removeObject:", v9);
    objc_msgSend(v10, "insertObject:atIndex:", v9, 0);
    v11 = objc_msgSend(v10, "copy");

    v5 = (void *)v11;
  }

  return v5;
}

uint64_t __85__ICAccount_Management__allActiveAccountsInContextWithDefaultBeingFirstIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (id)allActiveAccountsInContext:(id)a3 sortDescriptors:(id)a4 relationshipKeyPathsForPrefetching:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB3880];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("accountType != %d || didChooseToMigrate == YES"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:", v12, v10, v9, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)allCloudKitAccountsInContext:(id)a3
{
  return (id)objc_msgSend(a1, "accountsWithAccountType:context:", 1, a3);
}

+ (id)allActiveCloudKitAccountsInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("accountType == %d && didChooseToMigrate == YES"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsMatchingPredicate:context:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accountsWithAccountType:(int)a3 context:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("accountType == %d"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)clearAccountForAppleCloudKitTable
{
  id v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  id v6;
  NSObject *v7;

  v2 = (id)accountForAppleCloudKitTable;
  objc_sync_enter(v2);
  v3 = objc_msgSend((id)accountForAppleCloudKitTable, "count");
  v4 = v3 != 0;
  if (v3)
  {
    v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ICAccount(Management) clearAccountForAppleCloudKitTable].cold.2();

    objc_msgSend((id)accountForAppleCloudKitTable, "removeAllObjects");
  }
  objc_sync_exit(v2);

  v6 = (id)accountsForAppleCloudKitTable;
  objc_sync_enter(v6);
  if (objc_msgSend((id)accountsForAppleCloudKitTable, "count"))
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICAccount(Management) clearAccountForAppleCloudKitTable].cold.1();

    objc_msgSend((id)accountsForAppleCloudKitTable, "removeAllObjects");
    v4 = 1;
  }
  objc_sync_exit(v6);

  return v4;
}

+ (BOOL)hasModernAccountInContext:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ICAccount_Management__hasModernAccountInContext___block_invoke;
  v7[3] = &unk_1E76C76B0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __51__ICAccount_Management__hasModernAccountInContext___block_invoke(uint64_t a1)
{
  id v2;

  +[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (BOOL)isInICloudAccount
{
  ICAccount *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICAccount managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICAccount_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__ICAccount_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accountType");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result == 1;
  return result;
}

- (id)recordZoneName
{
  return (id)*MEMORY[0x1E0C94A30];
}

- (NSString)recordType
{
  return (NSString *)(id)*MEMORY[0x1E0C94A28];
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBePushedToCloud
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[ICAccount userRecordName](self, "userRecordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v6.receiver = self;
    v6.super_class = (Class)ICAccount;
    v4 = -[ICCloudSyncingObject needsToBePushedToCloud](&v6, sel_needsToBePushedToCloud);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;

  v7 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v7)
  {
    if (v8)
    {
      objc_msgSend(v8, "userRecordName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "userRecordName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "recordName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
          v10 = v9;
        else
          v10 = 0;
      }
    }
  }

  return v10;
}

+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  NSObject *v19;

  v5 = a4;
  +[ICAccount allCloudKitAccountsInContext:](ICAccount, "allCloudKitAccountsInContext:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke;
    v18[3] = &unk_1E76CB8E8;
    v19 = v5;
    objc_msgSend(v6, "ic_objectsPassingTest:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v19;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[ICAccount(CloudKit) allCloudObjectIDsInContext:passingTest:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

uint64_t __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, a4);
  else
    return 1;
}

uint64_t __62__ICAccount_CloudKit__allCloudObjectIDsInContext_passingTest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = a3;
  v9 = a6;
  +[ICAccount allCloudKitAccountsInContext:](ICAccount, "allCloudKitAccountsInContext:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__ICAccount_CloudKit__enumerateAllCloudObjectsInContext_batchSize_saveAfterBatch_usingBlock___block_invoke;
    v19[3] = &unk_1E76CB950;
    v20 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
    if (v7)
      objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("Saving after enumerating all accounts"));

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[ICAccount(CloudKit) enumerateAllCloudObjectsInContext:batchSize:saveAfterBatch:usingBlock:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

uint64_t __93__ICAccount_CloudKit__enumerateAllCloudObjectsInContext_batchSize_saveAfterBatch_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  return 0;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  int v21;
  BOOL v22;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  objc_super v44;

  v10 = a3;
  if (!a5)
  {
    v44.receiver = self;
    v44.super_class = (Class)ICAccount;
    if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v44, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, a4, 0, a6))goto LABEL_9;
    objc_msgSend(v10, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount setUserRecordName:](self, "setUserRecordName:", v15);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DidChooseToMigrate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16
      || (v18 = objc_msgSend(v16, "BOOLValue"),
          v18 == -[ICAccount didChooseToMigrate](self, "didChooseToMigrate")))
    {
      v21 = 0;
    }
    else
    {
      v19 = (id)-[ICAccount ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D640D8]);
      -[ICAccount setDidChooseToMigrate:](self, "setDidChooseToMigrate:", objc_msgSend(v17, "BOOLValue"));
      v20 = (id)-[ICAccount ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D640D0]);
      if ((-[ICAccount didChooseToMigrate](self, "didChooseToMigrate") & 1) == 0)
        +[ICNoteContext setLegacyNotesDisabled:](ICNoteContext, "setLegacyNotesDisabled:", 0);
      v21 = 1;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DidFinishMigration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = objc_msgSend(v24, "BOOLValue");
      if (v26 != -[ICAccount didFinishMigration](self, "didFinishMigration"))
      {
        -[ICAccount setDidFinishMigration:](self, "setDidFinishMigration:", objc_msgSend(v25, "BOOLValue"));
        v21 = 1;
      }
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DidMigrateOnMac"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27
      || (v29 = objc_msgSend(v27, "BOOLValue"),
          v29 == -[ICAccount didMigrateOnMac](self, "didMigrateOnMac")))
    {
      if (!v21)
      {
LABEL_24:

        v22 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      -[ICAccount setDidMigrateOnMac:](self, "setDidMigrateOnMac:", objc_msgSend(v28, "BOOLValue"));
    }
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "primaryICloudACAccount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[ICAccount(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);

      v40 = -[ICAccount didChooseToMigrate](self, "didChooseToMigrate");
      v41 = -[ICAccount didFinishMigration](self, "didFinishMigration");
      v42 = -[ICAccount didMigrateOnMac](self, "didMigrateOnMac");
      objc_msgSend(v31, "accountStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICMigrationUtilities saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:](ICMigrationUtilities, "saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:", v40, v41, v42, v31, v43, 0);

    }
    goto LABEL_24;
  }
  v11 = (void *)MEMORY[0x1E0D641A0];
  -[ICAccount className](self, "className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICStringFromSyncingApproach(a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccount(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v12, v13);

LABEL_9:
  v22 = 0;
LABEL_10:

  return v22;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICAccount className](self, "className", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccount(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v7, v8);

    return 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICAccount;
    -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v20, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccount cryptoVerifier](self, "cryptoVerifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("CryptoVerifier"));

    -[ICAccount cryptoSalt](self, "cryptoSalt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("CryptoSalt"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICAccount cryptoIterationCount](self, "cryptoIterationCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("CryptoIterationCount"));

    -[ICCloudSyncingObject passwordHint](self, "passwordHint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("PasswordHint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAccount didChooseToMigrate](self, "didChooseToMigrate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("DidChooseToMigrate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAccount didFinishMigration](self, "didFinishMigration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("DidFinishMigration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAccount didMigrateOnMac](self, "didMigrateOnMac"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("DidMigrateOnMac"));

    return v10;
  }
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4;
  ICAccount *v5;

  v4 = a3;
  v5 = self;
  ICAccount.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);

}

- (void)setMarkedForDeletion:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a1, v3, "Trying to set an account marked for deletion: %@", v4);

  OUTLINED_FUNCTION_4_0();
}

+ (void)standardFolderIdentifierWithPrefix:accountIdentifier:accountType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "No identifier for account when trying to get standard %@ identifier", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)compare:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v9;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v10, 0x20u);

}

- (void)uniqueUserParticipants
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching shared notes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)systemPaperTemporaryDirectoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error creating temporary directory for system paper — falling back to system's temporary directory {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "No notes in system paper folder.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Suggesting most recently modified system paper note: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

+ (void)mostRecentSystemPaperNoteInManagedObjectContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Encountered error while trying to fetch most recent system paper note: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetched user's full name and primary email address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __36__ICAccount_updateFullNameAndEmail___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching user's full name and primary email address {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setResolvedLockedNotesMode:(void *)a1 .cold.1(void *a1, __int16 a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAccountDataLockedNotesMode(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Setting locked notes mode… {account: %@, mode: %@}", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)setResolvedLockedNotesMode:(void *)a1 .cold.2(void *a1, __int16 a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAccountDataLockedNotesMode(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Not setting locked notes mode because it hasn't changed {account: %@, mode: %@}", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __50__ICAccount_Management__cloudKitAccountInContext___block_invoke_581_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "didChooseToMigrate");
  v6 = 138412546;
  v7 = v4;
  v8 = 1024;
  v9 = v5;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Returning account for primary iCloud Apple Account {accountID: %@, didChooseToMigrate: %d}", (uint8_t *)&v6, 0x12u);

  OUTLINED_FUNCTION_2();
}

@end
