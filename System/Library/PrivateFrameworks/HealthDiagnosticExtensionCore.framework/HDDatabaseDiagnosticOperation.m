@implementation HDDatabaseDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthDatabase.txt");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Analyzing health database...\n"));
  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb.sqlite"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb_secure.sqlite"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb_secure.hfd"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation reportStatsForDatabaseAtURL:](self, "reportStatsForDatabaseAtURL:", v3);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation reportStatsForDatabaseAtURL:](self, "reportStatsForDatabaseAtURL:", v4);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDatabaseDiagnosticOperation _reportSizeForHFDAtURL:](self, "_reportSizeForHFDAtURL:", v5);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDatabaseDiagnosticOperation _reportJournalStatisticsInSubdirectory:profileDirectory:](self, "_reportJournalStatisticsInSubdirectory:profileDirectory:", CFSTR("Journals"), v6);
  -[HDDatabaseDiagnosticOperation _reportJournalStatisticsInSubdirectory:profileDirectory:](self, "_reportJournalStatisticsInSubdirectory:profileDirectory:", CFSTR("CloudSyncJournals"), v6);
  -[HDDatabaseDiagnosticOperation _reportMedicalIDStatistics](self, "_reportMedicalIDStatistics");
  if (-[HDDatabaseDiagnosticOperation _reportStatisticsForUnprotectedDatabaseAtURL:protectedDatabaseAtURL:](self, "_reportStatisticsForUnprotectedDatabaseAtURL:protectedDatabaseAtURL:", v3, v4)&& !-[HDDatabaseDiagnosticOperation _captureUnprotectedDatabaseAtURL:protectedDatabaseAtURL:reason:](self, "_captureUnprotectedDatabaseAtURL:protectedDatabaseAtURL:reason:", v3, v4, CFSTR("analysis result")))
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to capture databases"));
  }

}

- (BOOL)allowsSensitiveAttachments
{
  return 0;
}

- (BOOL)_captureUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HDDatabaseDiagnosticOperation allowsSensitiveAttachments](self, "allowsSensitiveAttachments"))
  {
    v24 = v10;
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Capturing Health database for reason: %@"), v10);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v9;
    v26 = v8;
    v31[0] = v8;
    v31[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[HDDiagnosticOperation attachmentDirectoryURL](self, "attachmentDirectoryURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v19, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[HDDiagnosticOperation copyDatabaseFromURL:toURL:](self, "copyDatabaseFromURL:toURL:", v17, v20))
          {
            ++v14;
          }
          else
          {
            objc_msgSend(v17, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to collect database at path %@"), v21);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    v22 = v14 > 0;
    v9 = v25;
    v8 = v26;
    v10 = v24;
  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Sensitive attachments disabled. Skipping database capture for: %@"), v10);
    v22 = 0;
  }

  return v22;
}

- (void)_reportMedicalIDStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/var/mobile/Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("MedicalID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("MedicalIDData.archive"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "fileExistsAtPath:", v6);

  if (v7)
  {
    -[HDDiagnosticOperation prettyPrintFileSize:](self, "prettyPrintFileSize:", -[HDDiagnosticOperation fileSizeForURL:](self, "fileSizeForURL:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Medical ID has been set up; archive is %@"),
      v8);

  }
  else
  {
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("No medical ID present."));
  }

}

- (BOOL)_reportStatisticsForUnprotectedDatabaseAtURL:(id)a3 protectedDatabaseAtURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[9];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Unprotected Database (%@):\n"), v8);

  -[HDDiagnosticOperation verifyPermissionsForFileAtURL:](self, "verifyPermissionsForFileAtURL:", v7);
  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Analyzing unprotected database..."));
    -[HDDiagnosticOperation reportIntegrityForDatabase:](self, "reportIntegrityForDatabase:", v9);
    -[HDDiagnosticOperation checkSchemaVersionForDatabase:currentSchema:futureSchema:](self, "checkSchemaVersionForDatabase:currentSchema:futureSchema:", v9, 18006, 100002);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v9, v10);

  }
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Protected Database (%@):\n"), v11);

  -[HDDiagnosticOperation verifyPermissionsForFileAtURL:](self, "verifyPermissionsForFileAtURL:", v6);
  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Analyzing protected database..."));
    objc_msgSend(v12, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Skip integrity check for %@"), v14);

    -[HDDiagnosticOperation checkSchemaVersionForDatabase:currentSchema:futureSchema:](self, "checkSchemaVersionForDatabase:currentSchema:futureSchema:", v12, 18006, 100017);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    v17[8] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v12, v15);

    if (v9)
      -[HDDatabaseDiagnosticOperation _reportMissingSourceOrderEntriesWithUnprotectedDatabase:protectedDatabase:](self, "_reportMissingSourceOrderEntriesWithUnprotectedDatabase:protectedDatabase:", v9, v12);
  }
  objc_msgSend(v12, "close");
  objc_msgSend(v9, "close");

  return 0;
}

- (void)_reportSizeForHFDAtURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("HFD database %@:"), v4);

  v5 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v16, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    v8 = -[HDDiagnosticOperation fileSizeForURL:](self, "fileSizeForURL:", v16);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = v8;
      objc_msgSend(v16, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t%@:"), v10);

      -[HDDiagnosticOperation prettyPrintFileSize:](self, "prettyPrintFileSize:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t\tSize:\t\t%@"), v11);

      -[HDDiagnosticOperation fileCreationDateForURL:](self, "fileCreationDateForURL:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t\tCreated:\t%@"), v13);

      -[HDDiagnosticOperation fileModificationDateForURL:](self, "fileModificationDateForURL:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t\tModified:\t%@"), v15);

    }
  }
  else
  {
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\tNo HFD store"));
  }

}

- (void)_reportJournalStatisticsInSubdirectory:(id)a3 profileDirectory:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  v6 = a3;
  objc_msgSend(a4, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0.0;
  v14 = 0;
  v8 = -[HDDiagnosticOperation getFileStatisticsForDirectoryWithURL:earliestModificationDate:totalFileSize:maxFileSize:](self, "getFileStatisticsForDirectoryWithURL:earliestModificationDate:totalFileSize:maxFileSize:", v7, &v16, &v15, &v14);
  if (v8)
  {
    v9 = v8;
    v10 = (double)v15 * 0.0009765625;
    v11 = (double)v14 * 0.0009765625;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@: Found %ld unprocessed journal chapters (total %0.2lfkb, max %0.2lfkb). The oldest file was last modified %@"), v6, v9, *(_QWORD *)&v10, *(_QWORD *)&v11, v13);

  }
  else
  {
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@: No outstanding unprocessed journal chapters."), v6);
  }

}

- (void)_reportMissingSourceOrderEntriesWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HDDatabaseDiagnosticOperation *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  HDDatabaseDiagnosticOperation *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40[2];

  v6 = a4;
  v7 = a3;
  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Checking for missing source order entries..."));
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = *MEMORY[0x24BE408C8];
  v11 = *MEMORY[0x24BE408D0];
  objc_msgSend(MEMORY[0x24BE40AF0], "databaseTable");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE40D48];
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ ORDER BY %@ ASC, %@ ASC"), v10, v11, v12, v10, *MEMORY[0x24BE40D48]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = 0;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke;
  v38[3] = &unk_24E0D8858;
  v15 = v8;
  v39 = v15;
  LOBYTE(v12) = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v14, v40, 0, v38);

  v16 = v40[0];
  v17 = v16;
  if ((v12 & 1) != 0)
  {
    v31 = (void *)MEMORY[0x24BDD17C8];
    v30 = *MEMORY[0x24BE40938];
    v18 = *MEMORY[0x24BE40870];
    objc_msgSend(MEMORY[0x24BE40BC0], "databaseTable");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40A98], "databaseTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x24BE40860];
    objc_msgSend(MEMORY[0x24BE40AA8], "databaseTable");
    v33 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40A98], "databaseTable");
    v32 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    v23 = *MEMORY[0x24BE40868];
    objc_msgSend(MEMORY[0x24BE40AA8], "databaseTable");
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = v23;
    v15 = v22;
    objc_msgSend(v31, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ ON %@.%@=%@.%@ GROUP BY %@, %@"), v30, v18, v29, v19, v28, v20, v21, v27, v24, v13, v30, v18);
    v25 = objc_claimAutoreleasedReturnValue();

    v6 = v33;
    v37 = 0;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke_2;
    v34[3] = &unk_24E0D8880;
    v35 = v22;
    v36 = v32;
    LOBYTE(v24) = objc_msgSend(v33, "executeSQL:error:bindingHandler:enumerationHandler:", v25, &v37, 0, v34);
    v26 = v37;
    v17 = v26;
    if ((v24 & 1) == 0)
      -[HDDiagnosticOperation log:](v32, "log:", CFSTR("Failed to enumerate data_type/source_id combinations: %@"), v26);

    v14 = (void *)v25;
  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Unable to look up source order information: %@"), v16);
  }

}

uint64_t __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  MEMORY[0x22078BF90](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF90](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_msgSend(v6, "addObject:", v5);

  return 1;
}

uint64_t __107__HDDatabaseDiagnosticOperation__reportMissingSourceOrderEntriesWithUnprotectedDatabase_protectedDatabase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  MEMORY[0x22078BF90](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF90](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("WARNING: Source order for data type %@ is missing entry for source %@"), v4, v5);

  return 1;
}

@end
