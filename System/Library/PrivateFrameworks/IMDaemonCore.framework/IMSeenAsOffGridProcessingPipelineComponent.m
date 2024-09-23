@implementation IMSeenAsOffGridProcessingPipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _BYTE v28[22];
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Started processing", v28, 2u);
    }

  }
  v5 = objc_msgSend(v3, "seenAsOffGrid");
  if ((v5 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Not seen as off grid", v28, 2u);
      }

    }
    goto LABEL_29;
  }
  objc_msgSend(v3, "lastPublisherOfOffGridStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Missing identifier of last published status, not attempting to recover", v28, 2u);
      }

    }
LABEL_29:
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0D34E28], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "__imHexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPublisherOfOffGridStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v11, "isEqualToString:", v12);
      v15 = CFSTR("NO");
      *(_DWORD *)v28 = 138412802;
      *(_QWORD *)&v28[4] = v10;
      *(_WORD *)&v28[12] = 2112;
      if (v14)
        v15 = CFSTR("YES");
      *(_QWORD *)&v28[14] = v12;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Our token %@, token of last publisher %@, same? %@", v28, 0x20u);
    }

  }
  v16 = objc_msgSend(v11, "isEqualToString:", v12, *(_OWORD *)v28);
  if ((v16 & 1) != 0)
  {
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anySessionForServiceName:", *MEMORY[0x1E0D38F70]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v3, "seenAsOffGrid");
    LODWORD(v17) = v19;
    v20 = IMOSLoggingEnabled(v19);
    if ((_DWORD)v17)
    {
      if (v20)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Sender sees us as off grid", v28, 2u);
        }

      }
      objc_msgSend(v18, "republishOffGridStatusIfNecessary");
    }
    else if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Not seen as off grid", v28, 2u);
      }

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);

  }
  else
  {
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Last published off grid status was not from our device, not attempting to recover", v28, 2u);
      }

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);
  }

LABEL_41:
  return v24;
}

@end
