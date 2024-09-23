@implementation HKCDADocumentShareItemSource

- (HKCDADocumentShareItemSource)initWithDocumentSample:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKCDADocumentShareItemSource *v14;
  HKCDADocumentShareItemSource *v15;
  id *p_documentSample;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData *shareData;
  HKCDAPDFGenerator *v21;
  HKCDAPDFGenerator *generator;
  NSURL *exportArchiveURL;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CDA_EXPORT_ARCHIVE_FOLDER_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("http://localhost/%@.zip"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)HKCDADocumentShareItemSource;
  v14 = -[UIActivityItemProvider initWithPlaceholderItem:](&v25, sel_initWithPlaceholderItem_, v13);
  v15 = v14;
  if (v14)
  {
    p_documentSample = (id *)&v14->_documentSample;
    objc_storeStrong((id *)&v14->_documentSample, a3);
    objc_storeStrong((id *)&v15->_healthStore, a4);
    objc_msgSend(*p_documentSample, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*p_documentSample, "document");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "documentData");
      v19 = objc_claimAutoreleasedReturnValue();
      shareData = v15->_shareData;
      v15->_shareData = (NSData *)v19;

    }
    else
    {
      v18 = v15->_shareData;
      v15->_shareData = 0;
    }

    v21 = objc_alloc_init(HKCDAPDFGenerator);
    generator = v15->_generator;
    v15->_generator = v21;

    exportArchiveURL = v15->_exportArchiveURL;
    v15->_exportArchiveURL = 0;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_exportArchiveURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_exportArchiveURL, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)HKCDADocumentShareItemSource;
  -[HKCDADocumentShareItemSource dealloc](&v6, sel_dealloc);
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return CFSTR("com.pkware.zip-archive");
}

- (id)_simpleError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ExportHealthReport"), 100, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_buildZipArchiveWithCDA:(id)a3 generatedPDF:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSURL *v20;
  NSURL *exportArchiveURL;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[2];
  char __dst[1024];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v11;
  v44[1] = CFSTR("ccd_export_dir_XXXXXX");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy(__dst, (const char *)objc_msgSend(v13, "UTF8String"), 0x400uLL);
  __dst[1023] = 0;
  v14 = mkdtemp(__dst);
  if (v14)
  {
    v41 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CDA_EXPORT_ARCHIVE_FOLDER_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)v15;
    v42[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.zip"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
    exportArchiveURL = self->_exportArchiveURL;
    self->_exportArchiveURL = v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F08]), "initWithURL:archiveType:", self->_exportArchiveURL, 0);
    if (objc_msgSend(v22, "archiveIsValid"))
    {
      v37 = v19;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v36 = v9;
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CDA_EXPORT_FILE_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v17, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v26, "stringByAppendingString:", CFSTR(".xml"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fileURLWithPath:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v23;
      v30 = v23;
      v9 = v36;
      objc_msgSend(v22, "addDataToArchive:pathInArchive:", v30, v29);

      v31 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v26, "stringByAppendingString:", CFSTR(".pdf"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fileURLWithPath:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addFileToArchive:pathInArchive:", v36, v33);

      if (objc_msgSend(v22, "archiveIsValid"))
      {
        objc_msgSend(v22, "closeArchive");
        v10[2](v10, 1, 0);
      }
      else
      {
        -[HKCDADocumentShareItemSource _simpleError:](self, "_simpleError:", CFSTR("Unable to add files to archive for Clinical Document export"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v35);

      }
      v8 = v38;
      v19 = v37;
    }
    else
    {
      -[HKCDADocumentShareItemSource _simpleError:](self, "_simpleError:", CFSTR("Unable to create archive for Clinical Document export."));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v25);
    }

    v34 = v40;
    v13 = v41;
  }
  else
  {
    -[HKCDADocumentShareItemSource _simpleError:](self, "_simpleError:", CFSTR("Unable to create temporary directory for exported Health Report."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v34);
  }

}

- (void)_generatePDFforCDA:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKCDAPDFGenerator *generator;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  generator = self->_generator;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HKCDADocumentShareItemSource__generatePDFforCDA_completion___block_invoke;
  v11[3] = &unk_1E9C45A70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HKCDAPDFGenerator generatePDFForCDAXML:completionHandler:](generator, "generatePDFForCDAXML:completionHandler:", v10, v11);

}

uint64_t __62__HKCDADocumentShareItemSource__generatePDFforCDA_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_buildZipArchiveWithCDA:generatedPDF:completion:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_loadShareDataWithHealthStore:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSData *shareData;
  HKCDADocumentSample *documentSample;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = v6;
  shareData = self->_shareData;
  if (shareData)
  {
    -[HKCDADocumentShareItemSource _generatePDFforCDA:completion:](self, "_generatePDFforCDA:completion:", shareData, v6);
  }
  else
  {
    documentSample = self->_documentSample;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__HKCDADocumentShareItemSource__loadShareDataWithHealthStore_completion___block_invoke;
    v10[3] = &unk_1E9C45A98;
    v10[4] = self;
    v11 = v6;
    -[HKCDADocumentSample fetchDetailedReportWithHealthStore:reportDataBlock:](documentSample, "fetchDetailedReportWithHealthStore:reportDataBlock:", a3, v10);

  }
}

void __73__HKCDADocumentShareItemSource__loadShareDataWithHealthStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), a2);
    objc_msgSend(*(id *)(a1 + 32), "_generatePDFforCDA:completion:", v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)item
{
  dispatch_semaphore_t v3;
  HKHealthStore *healthStore;
  NSObject *v5;
  NSURL *v6;
  NSURL *v7;
  uint64_t v9;
  uint64_t v10;
  intptr_t (*v11)(uint64_t, char);
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  healthStore = self->_healthStore;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __36__HKCDADocumentShareItemSource_item__block_invoke;
  v12 = &unk_1E9C42138;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  -[HKCDADocumentShareItemSource _loadShareDataWithHealthStore:completion:](self, "_loadShareDataWithHealthStore:completion:", healthStore, &v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v16 + 24))
  {
    v6 = self->_exportArchiveURL;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E9C4C428, v9, v10, v11, v12);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  _Block_object_dispose(&v15, 8);
  return v7;
}

intptr_t __36__HKCDADocumentShareItemSource_item__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (HKCDADocumentSample)documentSample
{
  return self->_documentSample;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSData)shareData
{
  return self->_shareData;
}

- (HKCDAPDFGenerator)generator
{
  return self->_generator;
}

- (NSURL)exportArchiveURL
{
  return self->_exportArchiveURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportArchiveURL, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_documentSample, 0);
}

@end
