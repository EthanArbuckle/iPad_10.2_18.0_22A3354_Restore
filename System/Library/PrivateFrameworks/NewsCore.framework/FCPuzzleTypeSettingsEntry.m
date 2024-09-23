@implementation FCPuzzleTypeSettingsEntry

- (FCPuzzleTypeSettingsEntry)initWithEntryID:(id)a3 puzzleTypeID:(id)a4 settingsData:(id)a5 lastSeenPuzzleIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCPuzzleTypeSettingsEntry *v14;
  FCPuzzleTypeSettingsEntry *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *puzzleTypeID;
  uint64_t v20;
  NSData *settingsData;
  uint64_t v22;
  void *lastSeenPuzzleIDs;
  void *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzleTypeSettings entry must have an entryID"));
    *(_DWORD *)buf = 136315906;
    v29 = "-[FCPuzzleTypeSettingsEntry initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:]";
    v30 = 2080;
    v31 = "FCPuzzleTypeSettingsEntry.m";
    v32 = 1024;
    v33 = 19;
    v34 = 2114;
    v35 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzleTypeSettings entry must have a puzzleTypeID"));
    *(_DWORD *)buf = 136315906;
    v29 = "-[FCPuzzleTypeSettingsEntry initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:]";
    v30 = 2080;
    v31 = "FCPuzzleTypeSettingsEntry.m";
    v32 = 1024;
    v33 = 20;
    v34 = 2114;
    v35 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v27.receiver = self;
  v27.super_class = (Class)FCPuzzleTypeSettingsEntry;
  v14 = -[FCPuzzleTypeSettingsEntry init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v10 && v11)
    {
      v16 = objc_msgSend(v10, "copy");
      identifier = v15->_identifier;
      v15->_identifier = (NSString *)v16;

      v18 = objc_msgSend(v11, "copy");
      puzzleTypeID = v15->_puzzleTypeID;
      v15->_puzzleTypeID = (NSString *)v18;

      v20 = objc_msgSend(v12, "copy");
      settingsData = v15->_settingsData;
      v15->_settingsData = (NSData *)v20;

      v22 = objc_msgSend(v13, "copy");
      lastSeenPuzzleIDs = v15->_lastSeenPuzzleIDs;
      v15->_lastSeenPuzzleIDs = (NSArray *)v22;
    }
    else
    {
      lastSeenPuzzleIDs = v14;
      v15 = 0;
    }

  }
  return v15;
}

- (CKRecord)asCKRecord
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1ED0F7FD0 != -1)
    dispatch_once(&qword_1ED0F7FD0, &__block_literal_global_53);
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCPuzzleTypeSettingsEntry identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, _MergedGlobals_158);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("PuzzleTypeSettings"), v5);
  -[FCPuzzleTypeSettingsEntry puzzleTypeID](self, "puzzleTypeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("puzzleTypeID"));

  -[FCPuzzleTypeSettingsEntry settingsData](self, "settingsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("settingsData"));

  -[FCPuzzleTypeSettingsEntry lastSeenPuzzleIDs](self, "lastSeenPuzzleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("lastSeenPuzzleIDs"));

  return (CKRecord *)v6;
}

void __39__FCPuzzleTypeSettingsEntry_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("UserInfo"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_158;
  _MergedGlobals_158 = v1;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (NSData)settingsData
{
  return self->_settingsData;
}

- (NSArray)lastSeenPuzzleIDs
{
  return self->_lastSeenPuzzleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_settingsData, 0);
  objc_storeStrong((id *)&self->_puzzleTypeID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  id v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settingsData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastSeenPuzzleIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v3, "initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:", v6, v7, v8, v9);
    v3 = v10;

  }
  return v3;
}

@end
