@implementation HDSyncAnchorEntity(HealthDiagnosticExtension)

+ (void)hde_reportSyncAnchorsForSyncProvenance:()HealthDiagnosticExtension diagnosticOperation:database:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD530);
  v20 = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __117__HDSyncAnchorEntity_HealthDiagnosticExtension__hde_reportSyncAnchorsForSyncProvenance_diagnosticOperation_database___block_invoke;
  v17 = &unk_24E0D8B58;
  v19 = &v21;
  v11 = v10;
  v18 = v11;
  LOBYTE(a1) = objc_msgSend(a1, "enumerateSyncAnchorsForStoreID:database:error:handler:", a3, v9, &v20, &v14);
  v12 = v20;
  objc_msgSend(v11, "formattedTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v13);

  objc_msgSend(v8, "appendNewline");
  if ((a1 & 1) != 0)
  {
    if (!*((_BYTE *)v22 + 24))
      objc_msgSend(v8, "appendFormat:", CFSTR("\tNo sync anchors found for this store."));
  }
  else
  {
    objc_msgSend(v8, "log:", CFSTR("ERROR: Failed to retrieve sync anchor information: %@"), v12, v14, v15, v16, v17);
  }

  _Block_object_dispose(&v21, 8);
}

@end
