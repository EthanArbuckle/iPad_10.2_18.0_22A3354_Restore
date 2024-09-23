@implementation CNUIDraftSupport

+ (id)loadNewContactDraft
{
  return +[CNUIDraftSupport loadDraft:](CNUIDraftSupport, "loadDraft:", CFSTR("/var/mobile/Library/AddressBook/NewContactDraft.cncontact"));
}

+ (id)loadDraft:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v17 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v17);
    v6 = v17;
    v7 = v6;
    if (v5)
    {
      v8 = objc_opt_class();
      v9 = *MEMORY[0x1E0CB2CD0];
      v16 = v7;
      objc_msgSend(v5, "decodeTopLevelObjectOfClass:forKey:error:", v8, v9, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;

      if (v10)
      {
        v12 = v10;
      }
      else
      {
        CNUILogContactCard();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving draft contact: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v10 = 0;
      v11 = v6;
    }
    objc_msgSend(a1, "deleteDrafts");

  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v14 = v10;

  return v14;
}

+ (void)saveNewContactDraft:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v3, "writeToFile:atomically:", CFSTR("/var/mobile/Library/AddressBook/NewContactDraft.cncontact"), 0);
  }
  else
  {
    CNUILogContactCard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Error archiving edited contact: %@", buf, 0xCu);
    }

  }
}

+ (void)deleteDrafts
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/AddressBook/NewContactDraft.cncontact"), &v7);
  v3 = v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/AddressBook/EditedContactDraft.cncontact"), &v6);
  v5 = v6;

}

@end
