@implementation MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep

+ (id)_popUIDsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("uid"), 1, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date_added"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flags"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("del"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("pop_uids"), 1, v8);

  objc_msgSend(v9, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E4F69490, 1);
  objc_msgSend(v9, "addIndexForColumns:", &unk_1E4F694A8);
  return v9;
}

+ (int)runWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  int v11;

  v4 = a3;
  if ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE pop_uids RENAME TO pop_uids_old"), CFSTR("Moving pop_uids table aside")) & 1) != 0&& (objc_msgSend(a1, "_popUIDsTableSchema"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "definitionWithDatabaseName:includeIndexes:", 0, 0), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v4, "executeStatementString:errorMessage:", v6, CFSTR("Creating new pop_uids table")), v6, v5, (v7 & 1) != 0)&& (objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT OR REPLACE INTO pop_uids (mailbox, uid, date_added, flags, del) SELECT mailbox, uid, date_added, flags, del FROM pop_uids_old ORDER BY ROWID ASC "), CFSTR("Populating pop_uids")) & 1) != 0&& objc_msgSend(v4,
                       "executeStatementString:errorMessage:",
                       CFSTR("DROP TABLE pop_uids_old"),
                       CFSTR("Dropping pop_uids_old")))
  {
    objc_msgSend(a1, "_popUIDsTableSchema");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexDefinitionsWithDatabaseName:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "executeStatementString:errorMessage:", v9, CFSTR("Creating pop_uids indexes"));

    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

@end
