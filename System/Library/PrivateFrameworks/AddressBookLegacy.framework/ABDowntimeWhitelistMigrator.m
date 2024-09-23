@implementation ABDowntimeWhitelistMigrator

+ (BOOL)moveDowntimeWhitelistFromUnknownProperties:(CPSqliteConnection *)a3
{
  uint64_t v3;

  v3 = CPSqliteConnectionStatementForSQL();
  if (v3)
  {
    CPSqliteStatementSendResults();
    CPSqliteStatementReset();
    CPSqliteDatabaseReleaseSqliteStatement();
  }
  return v3 != 0;
}

+ (id)unknownPropertiesFromExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v13 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v13);
    v5 = v13;
    if (v4)
    {
      v14[0] = objc_opt_class();
      v14[1] = objc_opt_class();
      v14[2] = objc_opt_class();
      v14[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "finishDecoding");
    }
    else
    {
      ABDiagnosticsEnabled();
      _ABLog2(4, (uint64_t)"+[ABDowntimeWhitelistMigrator unknownPropertiesFromExternalRepresentation:]", 69, 0, (uint64_t)CFSTR("Error trying to decode externalRepresentation: %@"), v9, v10, v11, (uint64_t)v5);
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

+ (id)externalRepresentationFromUnknownProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v5, "setOutputFormat:", 200);
    objc_msgSend(v5, "encodeObject:forKey:", v3, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v5, "finishEncoding");
    objc_msgSend(v5, "encodedData");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

@end
