@implementation IMMessageMomentShareProcessingPipelineComponent

- (IMMessageMomentShareProcessingPipelineComponent)initWithTrustedData:(id)a3
{
  id v4;
  IMMessageMomentShareProcessingPipelineComponent *v5;
  IMMessageMomentShareProcessingPipelineComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMMessageMomentShareProcessingPipelineComponent;
  v5 = -[IMMessageMomentShareProcessingPipelineComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IMMessageMomentShareProcessingPipelineComponent setTrustedData:](v5, "setTrustedData:", v4);

  return v6;
}

- (id)runIndividuallyWithInput:(id)a3
{
  NSObject *v3;
  __CFString *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v34;
  id v35;
  void *v37;
  id obj;
  char v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (IMOSLoggingEnabled(v35))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v35, "messageItems");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v4;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "<IMMessageMomentShareProcessingPipelineComponent> Started processing for Messages: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v35, "messageItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "<IMMessageMomentShareProcessingPipelineComponent> Failed to find any message items", buf, 2u);
      }

    }
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 10, 0);
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v31);

  }
  else
  {
    v34 = objc_alloc_init(MEMORY[0x1E0D35A10]);
    objc_msgSend(v35, "chat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v35, "messageItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v9)
      {
        v10 = 0;
        v39 = 0;
        v11 = *(_QWORD *)v42;
        obj = v8;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isTypingMessage") & 1) == 0)
            {
              v40 = 0;
              v14 = (void *)MEMORY[0x1E0D39960];
              objc_msgSend(v13, "balloonBundleID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "body");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "payloadData");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "photoShareURLFromPluginBundleID:contentString:payload:shouldAccept:", v15, v16, v17, &v40);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                if ((v10 & 1) == 0)
                {
                  -[IMMessageMomentShareProcessingPipelineComponent trustedData](self, "trustedData");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "fromIdentifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "_stripFZIDPrefix");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = v22;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = IMDAreAllAliasesUnknown();

                  v39 = v24 ^ 1;
                }
                if ((v39 & 1) != 0 && v40)
                {
                  +[IMDMomentShareManager sharedInstance](IMDMomentShareManager, "sharedInstance");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "registerAndAcceptMomentShareForMessage:inChat:resetAssetTransfers:", v13, v37, 1);

                  v10 = 1;
                  v39 = 1;
                }
                else
                {
                  if (IMOSLoggingEnabled(v19))
                  {
                    OSLogHandleForIMEventCategory();
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                    {
                      if ((v39 & 1) != 0)
                        v27 = CFSTR("YES");
                      else
                        v27 = CFSTR("NO");
                      *(_DWORD *)buf = 138412546;
                      if (v40)
                        v28 = CFSTR("YES");
                      else
                        v28 = CFSTR("NO");
                      v46 = v27;
                      v47 = 2112;
                      v48 = v28;
                      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Not accepting moment share, both isFromKnownSender (%@) and shouldAccept (%@) must be true", buf, 0x16u);
                    }

                  }
                  v10 = 1;
                }
              }

            }
          }
          v8 = obj;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v9);
      }

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMEventCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v46 = CFSTR("NO");
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Not accepting moment share hasChat: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v34, "fullfillWithValue:", v35);

  }
  return v34;
}

- (IMDiMessageIDSTrustedData)trustedData
{
  return self->_trustedData;
}

- (void)setTrustedData:(id)a3
{
  objc_storeStrong((id *)&self->_trustedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedData, 0);
}

@end
