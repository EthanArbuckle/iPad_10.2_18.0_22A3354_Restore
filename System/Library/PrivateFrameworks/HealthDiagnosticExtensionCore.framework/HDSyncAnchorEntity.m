@implementation HDSyncAnchorEntity

void __117__HDSyncAnchorEntity_HealthDiagnosticExtension__hde_reportSyncAnchorsForSyncProvenance_diagnosticOperation_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[8];

  v32[7] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (a6 | a5 | a7 | a8 | a10)
  {
    objc_msgSend(MEMORY[0x24BE40C70], "identifierWithSchema:entity:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(a1 + 32);
    objc_msgSend(v31, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v30;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v22;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendRow:", v25);

  }
}

@end
