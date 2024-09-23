@implementation CKVSimulatedMultiDatasetBridge

- (CKVSimulatedMultiDatasetBridge)initWithTask:(unsigned __int16)a3
{
  CKVSimulatedMultiDatasetBridge *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKVSimulatedMultiDatasetBridge;
  result = -[CKVSimulatedMultiDatasetBridge init](&v5, sel_init);
  if (result)
    result->_task = a3;
  return result;
}

- (CKVSimulatedMultiDatasetBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init not available"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)datasetInfoSummaryListForTask
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C9AA60];
  switch(self->_task)
  {
    case 1u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 1, CFSTR("com.apple.test.app1"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v4;
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 1, CFSTR("com.apple.test.app2"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    case 2u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 2, *MEMORY[0x1E0D42B38]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v17;
      goto LABEL_12;
    case 3u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 3, *MEMORY[0x1E0D42B20]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v16;
      goto LABEL_12;
    case 4u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 4, *MEMORY[0x1E0D42B50]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v15;
      goto LABEL_12;
    case 5u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 10, *MEMORY[0x1E0D42B58]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v14;
      goto LABEL_12;
    case 6u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 12, *MEMORY[0x1E0D42B40]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v13;
      goto LABEL_12;
    case 7u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 13, *MEMORY[0x1E0D42B80]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v12;
      goto LABEL_12;
    case 8u:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 15, *MEMORY[0x1E0D42B28]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v11;
      goto LABEL_12;
    case 0xAu:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 21, *MEMORY[0x1E0D42B48]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v10;
      goto LABEL_12;
    case 0xBu:
      -[CKVSimulatedMultiDatasetBridge _createDatasetInfoSummary:withOriginAppId:](self, "_createDatasetInfoSummary:withOriginAppId:", 9, *MEMORY[0x1E0D42B30]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v4;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = &v9;
LABEL_12:
      objc_msgSend(v6, "arrayWithObjects:count:", v7, 1, v9, v10, v11, v12, v13, v14, v15, v16, v17);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)profileDirectory
{
  void *v2;
  void *v3;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Assistant/SiriVocabulary/Modules/TestEndToEnd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)profileFileName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  CKVTaskIdDescription(self->_task);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@Profile"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  -[CKVSimulatedMultiDatasetBridge profileFileName](self, "profileFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVSimulatedMultiDatasetBridge profileDirectory](self, "profileDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:relativeToURL:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D42C00], "profileWithContentsOfURL:error:", v10, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (!v11)
  {
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CKVSimulatedMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
      v24 = 2112;
      v25 = v12;
      _os_log_error_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_ERROR, "%s Unable to read profile %@", buf, 0x16u);
    }
  }
  objc_msgSend(v11, "profileInfo");
  v14 = objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend((id)v14, "datasetCount");

  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__CKVSimulatedMultiDatasetBridge_enumerateAllDatasets_usingBlock___block_invoke;
  v18[3] = &unk_1E4D28D50;
  v15 = v6;
  v19 = v15;
  LOBYTE(v14) = objc_msgSend(v11, "enumerateDatasetsWithError:usingBlock:", &v20, v18);
  v16 = v20;
  if ((v14 & 1) == 0)
  {
    v17 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CKVSimulatedMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_1A48B3000, v17, OS_LOG_TYPE_ERROR, "%s Unable to enumerate datasets: %@", buf, 0x16u);
    }
  }

}

- (id)_createDatasetInfoSummary:(int64_t)a3 withOriginAppId:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0D42BC0];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithItemType:originAppId:itemCount:error:", a3, v6, 0, 0);

  return v7;
}

uint64_t __66__CKVSimulatedMultiDatasetBridge_enumerateAllDatasets_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  CKVSimulatedDatasetBridge *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[CKVSimulatedDatasetBridge initWithDataset:]([CKVSimulatedDatasetBridge alloc], "initWithDataset:", v3);

  (*(void (**)(uint64_t, CKVSimulatedDatasetBridge *))(v2 + 16))(v2, v4);
  return 1;
}

@end
