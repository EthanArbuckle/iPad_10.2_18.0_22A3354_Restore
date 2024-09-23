@implementation HDDemoDataHealthDocumentSampleGenerator

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataHealthDocumentSampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:](&v27, sel_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection_, a3, v8, v9);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("HealthDemoDataGenerateHealthDocumentsKey"));

  if (v11)
  {
    _HKInitializeLogging();
    v12 = (os_log_t *)MEMORY[0x1E0CB52C8];
    v13 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Generating demo CDA documents for date: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLForResource:withExtension:", CFSTR("demo_cdas"), CFSTR("zip"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithPathname:", v16);
      v26 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __107__HDDemoDataHealthDocumentSampleGenerator_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection___block_invoke;
      v23[3] = &unk_1E6CFA6A8;
      v24 = v8;
      v25 = v9;
      v18 = objc_msgSend(v17, "enumerateEntriesWithError:block:", &v26, v23);
      v19 = v26;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v17;
          v30 = 2112;
          v31 = v19;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Error enumerating contents of %@: %@", buf, 0x16u);
        }
      }
      _HKInitializeLogging();
      v21 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Generation of demo CDA documents completed", buf, 2u);
      }

    }
    else
    {
      _HKInitializeLogging();
      v22 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "Could not locate zip file containing CDA demo documents; aborting generation",
          buf,
          2u);
      }
    }

  }
}

void __107__HDDemoDataHealthDocumentSampleGenerator_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "pathname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuffix:", CFSTR(".xml"));

  if (v6)
  {
    objc_msgSend(v3, "dataWithMaxSizeBytes:error:", 100000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB6358], "CDADocumentSampleWithData:startDate:endDate:metadata:validationError:", v7, v8, v8, 0, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
      objc_msgSend(*(id *)(a1 + 40), "addObjectFromPhone:", v9);

    }
  }

}

@end
