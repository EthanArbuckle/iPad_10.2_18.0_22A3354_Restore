@implementation FCModifyPuzzleTypeSettingsCommand

- (FCModifyPuzzleTypeSettingsCommand)initWithPuzzleTypeSettingsEntries:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifyPuzzleTypeSettingsCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

uint64_t __77__FCModifyPuzzleTypeSettingsCommand_initWithPuzzleTypeSettingsEntries_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settingsData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingsData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 != v10;
    if (v9 != v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("settingsData"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastSeenPuzzleIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSeenPuzzleIDs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "fc_isEqualToArray:", v13) & 1) == 0)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("lastSeenPuzzleIDs"));
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
