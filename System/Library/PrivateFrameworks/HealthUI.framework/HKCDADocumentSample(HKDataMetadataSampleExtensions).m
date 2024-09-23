@implementation HKCDADocumentSample(HKDataMetadataSampleExtensions)

- (uint64_t)hasAssociatedReport
{
  return 1;
}

- (void)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, char, void *);
  void *v22;
  void (**v23)(id, uint64_t, _QWORD);
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "documentData"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    v7[2](v7, v10, 0);

  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__5;
    v25[4] = __Block_byref_object_dispose__5;
    v26 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __106__HKCDADocumentSample_HKDataMetadataSampleExtensions__fetchDetailedReportWithHealthStore_reportDataBlock___block_invoke;
    v22 = &unk_1E9C41170;
    v24 = v25;
    v23 = v7;
    v12 = _Block_copy(&v19);
    v13 = (void *)MEMORY[0x1E0CB6A78];
    objc_msgSend(a1, "UUID", v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForObjectWithUUID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0CB6638]);
    objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDocumentType:predicate:limit:sortDescriptors:includeDocumentData:resultsHandler:", v17, v15, 0, 0, 1, v12);

    objc_msgSend(v6, "executeQuery:", v18);
    _Block_object_dispose(v25, 8);

  }
}

@end
