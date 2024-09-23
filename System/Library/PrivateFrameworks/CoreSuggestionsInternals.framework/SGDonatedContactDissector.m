@implementation SGDonatedContactDissector

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  SGPipelineEnrichment *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isSent") & 1) == 0)
  {
    objc_msgSend(v6, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v9;
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "Dissecting a donated contact identifier: %@", buf, 0xCu);
      }

      +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = *MEMORY[0x1E0C967C0];
        v27[0] = *MEMORY[0x1E0C966A8];
        v27[1] = v12;
        v13 = *MEMORY[0x1E0C966C0];
        v27[2] = *MEMORY[0x1E0C966D0];
        v27[3] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(v15, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v14, &v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v26;
        if (v16)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v16, "givenName");
          v24 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "familyName");
          v25 = v14;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@ %@"), v19, v20);

          v22 = -[SGPipelineEnrichment initWithPseudoContactWithKey:parent:name:]([SGPipelineEnrichment alloc], "initWithPseudoContactWithKey:parent:name:", v11, v7, v21);
          objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 128, 0, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setExtractionInfo:](v22, "setExtractionInfo:", v23);

          v17 = v24;
          objc_msgSend(v7, "addEnrichment:", v22);
          objc_msgSend(v7, "setContactInformationExtracted:", 1);

          v14 = v25;
        }
        else
        {
          sgLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v9;
            _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "Received a donated contact identifier: %@, but contact store returned nil", buf, 0xCu);
          }
        }

      }
    }

  }
}

@end
