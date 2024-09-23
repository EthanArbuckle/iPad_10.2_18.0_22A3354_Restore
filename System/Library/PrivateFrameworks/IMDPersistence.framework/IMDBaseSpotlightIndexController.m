@implementation IMDBaseSpotlightIndexController

- (id)errorAnalyzer
{
  return (id)objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[12];
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing");
  sub_1ABBACD88();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v11 = fabs(v10);

    if (v11 < 10800.0)
    {

      v12 = 1;
      goto LABEL_13;
    }
  }

  if ((v7 & 1) != 0)
  {
    v12 = 0;
LABEL_13:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        sub_1ABBACD88();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = CFSTR("NO");
        if (v12)
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        *(_DWORD *)v23 = 138412802;
        if (v7)
          v20 = CFSTR("YES");
        *(_QWORD *)&v23[4] = v20;
        v24 = 2112;
        v25 = v21;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Spotlight requesting full reindex, scheduling deferred indexing. Index in progress %@ rerequestWithinInterval %@ lastRequestDate %@", v23, 0x20u);

      }
    }
    +[IMSpotlightEventNotifier sharedNotifier](IMSpotlightEventNotifier, "sharedNotifier", *(_QWORD *)v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deferredReindexScheduled");

    sub_1ABBACD20(2);
    objc_msgSend(MEMORY[0x1E0D397C8], "setNeedsDeferredIndexing");
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Spotlight requesting full reindex, fullfilling request", v23, 2u);
    }

  }
  sub_1ABBACD20(1);
  IMDCoreSpotlightSetNeedsMessageReindex(6, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  v16 = v15;
  if (v15)
  {
    CFPreferencesAppSynchronize(v15);
    CFPreferencesSetAppValue(CFSTR("IMDCoreSpotlightLastFullReindexRequestTime"), v14, v16);
    CFRelease(v16);
  }

LABEL_23:
  if (v6)
    v6[2](v6);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      v17 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Got the callback for reindexSearchableItemsWithIdentifiers with %lu identifiers", (uint8_t *)&v16, 0xCu);
    }

  }
  v11 = objc_msgSend(v8, "count") == 0;
  v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      OSLogHandleForIMEventCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Not reindexing, we were asked to index 0 items", (uint8_t *)&v16, 2u);
      }

    }
  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMEventCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v8, "count");
        v16 = 134217984;
        v17 = v14;
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Spotlight requesting reindexing of %lu identifiers, fullfilling request", (uint8_t *)&v16, 0xCu);
      }

    }
    IMDCoreSpotlightReindexMessages(v8, 7, 0);
  }
  if (v9)
    v9[2](v9);

}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 error:(id *)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 error:(id *)a8
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)_createErrorFromSyncError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IMDBaseSpotlightIndexController errorAnalyzer](self, "errorAnalyzer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &unk_1E5ADC060;
    v6 = objc_msgSend(v5, "responseForError:attempt:retryInterval:", v4, 0, &v22);
    v7 = v22;

    v8 = *MEMORY[0x1E0CB3388];
    v23[0] = *MEMORY[0x1E0D37668];
    v23[1] = v8;
    v24[0] = v7;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.IndexRequestHandler"), v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC5B898(v12, v14, v15, v16, v17, v18, v19, v20);
    v13 = 0;
  }

  return v13;
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  intptr_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  dispatch_time_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  id v59;
  id v60;
  _QWORD v61[4];
  NSObject *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  _QWORD v66[5];
  NSObject *v67;
  __int128 *p_buf;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _QWORD v97[2];
  _QWORD v98[2];
  uint64_t v99;
  uint8_t v100[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  _QWORD v104[2];
  _QWORD v105[2];
  uint64_t v106;
  __int128 buf;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v12 = a4;
  v60 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Spotlight requesting fileURL for item identifier %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v108 = 0x3032000000;
  v109 = sub_1ABBADCA4;
  v110 = sub_1ABBADCB4;
  v111 = 0;
  v14 = v12;
  v111 = v14;
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = sub_1ABBADCA4;
  v95 = sub_1ABBADCB4;
  v96 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = sub_1ABBADCA4;
  v89 = sub_1ABBADCB4;
  v90 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_1ABBADCA4;
  v83 = sub_1ABBADCB4;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = sub_1ABBADCA4;
  v77 = sub_1ABBADCB4;
  v78 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v100 = 138412290;
      v101 = v16;
      _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Starting download of file transfer with GUID %@", v100, 0xCu);
    }

  }
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  -[IMDBaseSpotlightIndexController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_1ABBADCBC;
  v66[3] = &unk_1E5AB7190;
  v69 = &v73;
  v70 = &v85;
  v71 = &v91;
  v72 = &v79;
  p_buf = &buf;
  v66[4] = self;
  v21 = v17;
  v67 = v21;
  objc_msgSend(v18, "retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:", v19, a6, v66);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v100 = 0;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Beginning blocking index extension on file transfer download.", v100, 2u);
    }

  }
  v23 = dispatch_time(0, 180000000000);
  v24 = dispatch_group_wait(v21, v23);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v100 = 0;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Finished blocking index extension on file transfer download.", v100, 2u);
    }

  }
  v26 = v86[5];
  if (!v26 && v24)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v104[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("File URL fetch operation was unsuccessful."), &stru_1E5AC1D70, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v29;
    v104[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Timed out while downloading file transfer."), &stru_1E5AC1D70, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D39C28], 257, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (a7)
      *a7 = objc_retainAutorelease(v33);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v100 = 138412290;
        v101 = v35;
        _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "Timed out while downloading file transfer with GUID %@", v100, 0xCu);
      }

    }
LABEL_56:
    v48 = 0;
    goto LABEL_57;
  }
  if (!v26 && v92[5] && (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "isEqualToString:") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        v39 = v92[5];
        *(_DWORD *)v100 = 138412546;
        v101 = v38;
        v102 = 2112;
        v103 = v39;
        _os_log_impl(&dword_1ABB60000, v37, OS_LOG_TYPE_INFO, "Requested download of file transfer with GUID %@ failed, but was able to derive a suggested retry GUID %@", v100, 0x16u);
      }

    }
    v40 = dispatch_group_create();
    dispatch_group_enter(v40);
    -[IMDBaseSpotlightIndexController delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v92[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v20;
    v61[1] = 3221225472;
    v61[2] = sub_1ABBADFE0;
    v61[3] = &unk_1E5AB71B8;
    v63 = &v91;
    v64 = &v73;
    v65 = &v85;
    v43 = v40;
    v62 = v43;
    objc_msgSend(v41, "retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:", v42, a6, v61);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, "Beginning blocking index extension on secondary file transfer download.", v100, 2u);
      }

    }
    v45 = dispatch_time(0, 180000000000);
    dispatch_group_wait(v43, v45);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1ABB60000, v46, OS_LOG_TYPE_INFO, "Finished blocking index extension on secondary file transfer download.", v100, 2u);
      }

    }
  }
  v36 = (void *)v86[5];
  if (v36 || a7 && (v47 = (void *)v80[5]) != 0 && (*a7 = objc_retainAutorelease(v47), (v36 = (void *)v86[5]) != 0))
  {
    if (!IMUTITypeIsSupportedByPhotos())
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v97[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("File URL fetch operation was unsuccessful."), &stru_1E5AC1D70, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = v51;
      v97[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File transfer had an unsupported UTI %@"), v74[5]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v98[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D39C28], 256, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (a7)
        *a7 = objc_retainAutorelease(v54);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          v57 = v74[5];
          *(_DWORD *)v100 = 138412546;
          v101 = v56;
          v102 = 2112;
          v103 = v57;
          _os_log_impl(&dword_1ABB60000, v55, OS_LOG_TYPE_INFO, "File transfer with GUID %@ had unsupported UTI type %@", v100, 0x16u);
        }

      }
      goto LABEL_56;
    }
    v36 = (void *)v86[5];
  }
  v48 = v36;
LABEL_57:

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&buf, 8);
  return v48;
}

- (id)fileURLsForSearchableIndex:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t i;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  const __CFString *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  unint64_t m;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  dispatch_time_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  const __CFString *v55;
  void *v56;
  void *v57;
  char IsSupportedByPhotos;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  __CFString *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  dispatch_group_t group;
  id v76;
  id v77;
  id v78;
  __CFString *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v83;
  void *v85;
  __CFString *obja;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  NSObject *v94;
  uint64_t *v95;
  uint64_t *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  dispatch_group_t v106;
  uint64_t *v107;
  uint64_t *v108;
  __int128 *p_buf;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  _QWORD v136[2];
  _QWORD v137[2];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _QWORD v141[2];
  _QWORD v142[2];
  uint8_t v143[4];
  const __CFString *v144;
  __int16 v145;
  __CFString *v146;
  __int128 buf;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v78 = a4;
  v77 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v78;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Spotlight requesting fileURL for item identifiers %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (objc_msgSend(v78, "count"))
  {
    v79 = (__CFString *)v78;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v148 = 0x3032000000;
    v149 = sub_1ABBADCA4;
    v150 = sub_1ABBADCB4;
    v151 = 0;
    v151 = (id)objc_opt_new();
    v130 = 0;
    v131 = &v130;
    v132 = 0x3032000000;
    v133 = sub_1ABBADCA4;
    v134 = sub_1ABBADCB4;
    v135 = 0;
    v135 = (id)objc_opt_new();
    v124 = 0;
    v125 = &v124;
    v126 = 0x3032000000;
    v127 = sub_1ABBADCA4;
    v128 = sub_1ABBADCB4;
    v129 = 0;
    v129 = (id)objc_opt_new();
    v118 = 0;
    v119 = &v118;
    v120 = 0x3032000000;
    v121 = sub_1ABBADCA4;
    v122 = sub_1ABBADCB4;
    v123 = 0;
    v123 = (id)objc_opt_new();
    v112 = 0;
    v113 = &v112;
    v114 = 0x3032000000;
    v115 = sub_1ABBADCA4;
    v116 = sub_1ABBADCB4;
    v117 = 0;
    v117 = (id)objc_opt_new();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v143 = 138412290;
        v144 = v79;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Starting download of file transfer with GUIDs %@", v143, 0xCu);
      }

    }
    v11 = dispatch_group_create();
    for (i = 0; i < -[__CFString count](v79, "count"); ++i)
      dispatch_group_enter(v11);
    -[IMDBaseSpotlightIndexController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = sub_1ABBAF2D0;
    v105[3] = &unk_1E5AB71E0;
    v108 = &v130;
    p_buf = &buf;
    v107 = &v118;
    v105[4] = self;
    v110 = &v124;
    v111 = &v112;
    group = v11;
    v106 = group;
    objc_msgSend(v13, "retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:", v79, a6, v105);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v143 = 0;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Beginning blocking index extension on file transfer download.", v143, 2u);
      }

    }
    v15 = dispatch_time(0, 180000000000);
    v16 = dispatch_group_wait(group, v15);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v143 = 0;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Finished blocking index extension on file transfer download.", v143, 2u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = CFSTR("YES");
        if (!v16)
          v19 = CFSTR("NO");
        *(_DWORD *)v143 = 138412546;
        v144 = v19;
        v145 = 2112;
        v146 = v79;
        _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Timed out: [%@] while downloading file transfer with GUIDs %@", v143, 0x16u);
      }

    }
    if (v16)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v141[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("File URL fetch operation was unsuccessful."), &stru_1E5AC1D70, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = v22;
      v141[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Timed out while downloading file transfer."), &stru_1E5AC1D70, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v142[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D39C28], 257, v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v27 = v79;
      v28 = -[__CFString countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v101, v140, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v102;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v102 != v29)
              objc_enumerationMutation(v27);
            v31 = *(const __CFString **)(*((_QWORD *)&v101 + 1) + 8 * j);
            if ((objc_msgSend((id)v113[5], "containsObject:", v31) & 1) == 0)
            {
              objc_msgSend((id)v131[5], "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32 == 0;

              if (v33)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v143 = 138412290;
                    v144 = v31;
                    _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "Timed out while downloading file transfer with GUID %@", v143, 0xCu);
                  }

                }
                objc_msgSend((id)v125[5], "setObject:forKeyedSubscript:", v26, v31);
              }
            }
          }
          v28 = -[__CFString countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v101, v140, 16);
        }
        while (v28);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v143 = 138412290;
          v144 = v26;
          _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "Timed out while downloading file transfers, error %@", v143, 0xCu);
        }

      }
      if (a7)
        *a7 = objc_retainAutorelease(v26);

    }
    v85 = (void *)objc_opt_new();
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v36 = (id)v131[5];
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v97, v139, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v98;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v98 != v38)
            objc_enumerationMutation(v36);
          v40 = *(__CFString **)(*((_QWORD *)&v97 + 1) + 8 * k);
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", v40);
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v131[5], "objectForKeyedSubscript:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            v43 = 1;
          else
            v43 = v41 == 0;
          if (v43)
          {

          }
          else if ((-[__CFString isEqualToString:](v40, "isEqualToString:", v41) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v143 = 138412546;
                v144 = v40;
                v145 = 2112;
                v146 = v41;
                _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, "Requested download of file transfer with GUID %@ failed, but was able to derive a suggested retry GUID %@", v143, 0x16u);
              }

            }
            objc_msgSend(v85, "addObject:", v41);
          }

        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v97, v139, 16);
      }
      while (v37);
    }

    if (objc_msgSend(v85, "count"))
    {
      v45 = dispatch_group_create();
      for (m = 0; m < objc_msgSend(v85, "count"); ++m)
        dispatch_group_enter(v45);
      -[IMDBaseSpotlightIndexController delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = sub_1ABBAF63C;
      v93[3] = &unk_1E5AB7208;
      v95 = &v118;
      v96 = &v130;
      v48 = v45;
      v94 = v48;
      objc_msgSend(v47, "retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:", v85, a6, v93);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v143 = 0;
          _os_log_impl(&dword_1ABB60000, v49, OS_LOG_TYPE_INFO, "Beginning blocking index extension on secondary file transfer download.", v143, 2u);
        }

      }
      v50 = dispatch_time(0, 180000000000);
      dispatch_group_wait(v48, v50);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v143 = 0;
          _os_log_impl(&dword_1ABB60000, v51, OS_LOG_TYPE_INFO, "Finished blocking index extension on secondary file transfer download.", v143, 2u);
        }

      }
    }
    if (NSClassFromString(CFSTR("CSFileURLBatchResult")))
    {
      v88 = (void *)objc_opt_new();
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      obja = v79;
      v52 = -[__CFString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v89, v138, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v90;
        v80 = *MEMORY[0x1E0D39C28];
        v83 = *MEMORY[0x1E0CB2D50];
        v81 = *MEMORY[0x1E0CB2D68];
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v90 != v53)
              objc_enumerationMutation(obja);
            v55 = *(const __CFString **)(*((_QWORD *)&v89 + 1) + 8 * n);
            objc_msgSend((id)v131[5], "objectForKeyedSubscript:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              objc_msgSend((id)v119[5], "objectForKeyedSubscript:", v55);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              IsSupportedByPhotos = IMUTITypeIsSupportedByPhotos();

              if ((IsSupportedByPhotos & 1) == 0)
              {
                v59 = (void *)MEMORY[0x1E0CB35C8];
                v136[0] = v83;
                objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("File URL fetch operation was unsuccessful."), &stru_1E5AC1D70, 0);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v137[0] = v61;
                v136[1] = v81;
                v62 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend((id)v119[5], "objectForKeyedSubscript:", v55);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "stringWithFormat:", CFSTR("File transfer had an unsupported UTI %@"), v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v137[1] = v64;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "errorWithDomain:code:userInfo:", v80, 256, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend((id)v125[5], "setObject:forKeyedSubscript:", v66, v55);
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend((id)v119[5], "objectForKeyedSubscript:", v55);
                    v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v143 = 138412546;
                    v144 = v55;
                    v145 = 2112;
                    v146 = v68;
                    _os_log_impl(&dword_1ABB60000, v67, OS_LOG_TYPE_INFO, "File transfer with GUID %@ had unsupported UTI type %@", v143, 0x16u);

                  }
                }

              }
            }
            v69 = objc_alloc(MEMORY[0x1E0CA6AD8]);
            objc_msgSend((id)v131[5], "objectForKeyedSubscript:", v55);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v125[5], "objectForKeyedSubscript:", v55);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (void *)objc_msgSend(v69, "initWithFileURL:andError:", v70, v71);

            if (v72)
              objc_msgSend(v88, "addObject:", v72);

          }
          v52 = -[__CFString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v89, v138, 16);
        }
        while (v52);
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v143 = 0;
          _os_log_impl(&dword_1ABB60000, v73, OS_LOG_TYPE_INFO, "class CSFileURLBatchResult not found!", v143, 2u);
        }

      }
      v88 = 0;
    }

    _Block_object_dispose(&v112, 8);
    _Block_object_dispose(&v118, 8);

    _Block_object_dispose(&v124, 8);
    _Block_object_dispose(&v130, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v88 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v88;
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Spotlight requesting data for item %@ and type %@", (uint8_t *)&v18, 0x16u);
    }

  }
  v13 = v10;
  if (objc_msgSend(v13, "length"))
  {
    +[IMDSpotlightDataProvider dataProviderForIdentifier:](IMDSpotlightDataProvider, "dataProviderForIdentifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)MEMORY[0x1AF435474]();
      objc_msgSend(v14, "dataForGUID:error:", v13, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  __int128 v42;
  id v43;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  int64_t v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    if ((a4 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v52 = a4;
          _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "searchableItemsDidUpdate called with reason other than summaries (%ld), returning early.", buf, 0xCu);
        }

      }
      goto LABEL_60;
    }
    v8 = objc_msgSend(v5, "count");
    v9 = IMOSLoggingEnabled();
    if (v8)
    {
      v43 = v5;
      if (v9)
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v52 = objc_msgSend(v5, "count");
          _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Received searchableItemsDidUpdate callback with %llu items", buf, 0xCu);
        }

      }
      v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v5;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v11)
      {
        v13 = *(_QWORD *)v48;
        *(_QWORD *)&v12 = 138412290;
        v42 = v12;
LABEL_17:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
          objc_msgSend(v15, "uniqueIdentifier", v42);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v16, "length"))
          {
            IMLogHandleForCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              sub_1ABC5B90C((uint64_t)v15, v34, v35, v36, v37, v38, v39, v40);

            goto LABEL_55;
          }
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39930]), "initWithEncodedMessagePartGUID:", v16);
          objc_msgSend(v17, "messageGUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v17, "messageGUID");
            v19 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v19;
          }
          objc_msgSend(v15, "attributeSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "summarizationStatus") == 1;

          if (!v21)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v15, "attributeSet");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "summarizationStatus");
                *(_DWORD *)buf = 138412546;
                v52 = (int64_t)v16;
                v53 = 1024;
                v54 = v32;
                _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "Item with identifier %@ has unsuccessful summarization status (%d). Will delete old summary.", buf, 0x12u);

              }
            }
            v23 = objc_alloc_init(MEMORY[0x1E0CB3498]);
            objc_msgSend(v46, "setObject:forKey:", v23, v16);
            goto LABEL_46;
          }
          objc_msgSend(v15, "attributeSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "summarizationContentTopic");
          v23 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "attributeSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "summarizationContentTopLine");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "attributeSet");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "summarizationContentSynopsis");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v28 = v25;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v42;
                v52 = (int64_t)v16;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Using topLine as summary for item with GUID %@.", buf, 0xCu);
              }
LABEL_43:

            }
          }
          else if (v27)
          {
            v28 = v27;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v42;
                v52 = (int64_t)v16;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Using synopsis as summary for item with GUID %@.", buf, 0xCu);
              }
              goto LABEL_43;
            }
          }
          else
          {
            if (!v23)
            {
              IMLogHandleForCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v42;
                v52 = (int64_t)v16;
                _os_log_error_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_ERROR, "Unexpectedly received nil summary for item with identifier (%@) while summarization status was successful.", buf, 0xCu);
              }
              goto LABEL_45;
            }
            v28 = v23;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v42;
                v52 = (int64_t)v16;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Using topic as summary for item with GUID %@.", buf, 0xCu);
              }
              goto LABEL_43;
            }
          }
          objc_msgSend(v46, "setObject:forKey:", v28, v16);
LABEL_45:

LABEL_46:
          if (v11 == ++v14)
          {
            v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            v11 = v33;
            if (v33)
              goto LABEL_17;
            break;
          }
        }
      }

      -[IMDBaseSpotlightIndexController delegate](self, "delegate");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "updateChatsUsingMessageGUIDsAndSummaries:", v46);
LABEL_55:

      v5 = v43;
    }
    else if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v41, OS_LOG_TYPE_INFO, "searchableItemsDidUpdate called with no updated items, returning early.", buf, 2u);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC5B974(v7);

  }
LABEL_60:

}

- (IMDBaseSpotlightIndexControllerDelegate)delegate
{
  return (IMDBaseSpotlightIndexControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
