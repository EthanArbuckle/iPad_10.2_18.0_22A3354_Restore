@implementation IMDCoreSpotlightMessageBalloonPluginIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  unsigned __int8 isKindOfClass;
  void *v66;
  const __CFString *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t v79[8];
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  __int128 buf;
  Class (*v84)(uint64_t);
  void *v85;
  uint8_t *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v74 = a4;
  v12 = a6;
  v75 = a7;
  objc_msgSend(v11, "objectForKey:", CFSTR("balloonBundleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("payloadData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("knownSender"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = CFSTR("NO");
      if (v16)
        v18 = CFSTR("YES");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "known sender: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (v13)
    v19 = v16;
  else
    v19 = 0;
  if (v19 != 1
    || !v14
    || (v20 = *MEMORY[0x1E0D375F8], (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D375F8]) & 1) == 0)
    && !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D375D0]))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("service"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D38F58]);

    objc_msgSend(v11, "objectForKey:", CFSTR("attributedBody"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29;
    if (v28)
    {
      v30 = objc_msgSend(v29, "length");
      if (v23)
      {
        v31 = v30;
        v32 = *MEMORY[0x1E0D365F0];
        if (objc_msgSend(v23, "attribute:existsInRange:", *MEMORY[0x1E0D365F0], 0, v30))
        {
          buf = 0uLL;
          objc_msgSend(v23, "attribute:atIndex:longestEffectiveRange:inRange:", v32, 0, &buf, 0, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && buf == __PAIR128__(v31, 0))
          {
            objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isDataDetectedLinkAllowedForSWY:", v33);

            if (v35)
            {
              if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
                && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v79 = 0;
                  _os_log_impl(&dword_1ABB60000, v36, OS_LOG_TYPE_INFO, "Found a non-rich SMS link to index", v79, 2u);
                }

              }
              v37 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v33, "absoluteString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "URLWithString:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setURL:", v39);

              objc_msgSend(a1, "indexTypeCustomKey");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setValue:forCustomKey:", CFSTR("lnk"), v40);

              objc_msgSend(v12, "setMessageType:", CFSTR("lnk"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "lpHasRichMediaCustomKey");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setValue:forCustomKey:", v41, v42);

            }
          }

        }
      }
    }
    else
    {
      IMDCoreSpotlightURLFromAttributedMessageBody(v29);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isDataDetectedLinkAllowedForSWY:", v43);

        if (v45)
        {
          objc_msgSend(v12, "setURL:", v43);
          objc_msgSend(a1, "indexTypeCustomKey");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:forCustomKey:", CFSTR("lnk"), v46);

          objc_msgSend(v12, "setMessageType:", CFSTR("lnk"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "lpHasRichMediaCustomKey");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:forCustomKey:", v47, v48);

        }
      }

    }
    goto LABEL_68;
  }
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Indexing balloon with bundle ID %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (objc_msgSend(v13, "isEqualToString:", v20))
  {
    if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Found a rich link to index", (uint8_t *)&buf, 2u);
      }

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("attributedBody"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    IMDCoreSpotlightURLFromAttributedMessageBody(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "absoluteString");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(a1, "_newSummaryTextForPayloadData:item:", v14, v11);
    if (objc_msgSend(v25, "length") || !v73)
    {
      if (!v25)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1ABB60000, v57, OS_LOG_TYPE_INFO, "IMDCoreSpotlightMessageBalloonPluginIndexer - Failed to get summary text", (uint8_t *)&buf, 2u);
          }

        }
        v25 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      v26 = v73;

      v25 = v26;
    }
    objc_msgSend(v12, "setTextContent:", v25);
    objc_msgSend(a1, "lpDescriptionCustomKey");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forCustomKey:", v25, v49);

    objc_msgSend(a1, "indexTypeCustomKey");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forCustomKey:", CFSTR("lnk"), v50);

    objc_msgSend(v12, "setMessageType:", CFSTR("lnk"));
LABEL_48:
    _IMDCoreSpotlightStrippedBody(v11, (uint64_t)CFSTR("plainBody"), v73);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_pluginPayloadAttachmentPathsForItem:", v11);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    v78 = 0;
    v76 = 0;
    v51 = objc_msgSend(a1, "_richLinkPluginHasRichContentForItem:attachmentPaths:originalURL:outURL:outTitle:outLPMetadata:", v11, v71, v69, &v78, &v77, &v76);
    v72 = v78;
    v68 = v77;
    v52 = v76;
    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lpHasRichMediaCustomKey");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forCustomKey:", v53, v54);

      objc_msgSend(a1, "lpPluginPathsCustomKey");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forCustomKey:", v71, v55);

      if (objc_msgSend(v68, "length"))
      {
        objc_msgSend(a1, "lpTitleCustomKey");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forCustomKey:", v68, v56);

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1ABB60000, v58, OS_LOG_TYPE_INFO, "IMDCoreSpotlightMessageBalloonPluginIndexer - Failed to get Title from LP for url.", (uint8_t *)&buf, 2u);
        }

      }
    }
    if (v72)
    {
      v59 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v72, "absoluteString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "URLWithString:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setURL:", v61);

    }
    objc_msgSend(v52, "specialization");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v79 = 0;
    v80 = v79;
    v81 = 0x2050000000;
    v63 = (void *)qword_1EEC40470;
    v82 = qword_1EEC40470;
    if (!qword_1EEC40470)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v84 = sub_1ABBB8CB4;
      v85 = &unk_1E5AB0C88;
      v86 = v79;
      sub_1ABBB8CB4((uint64_t)&buf);
      v63 = (void *)*((_QWORD *)v80 + 3);
    }
    v64 = objc_retainAutorelease(v63);
    _Block_object_dispose(v79, 8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(a1, "indexTypeCustomKey");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v52 != 0) & isKindOfClass) != 0)
      v67 = CFSTR("loc");
    else
      v67 = CFSTR("lnk");
    objc_msgSend(v12, "setValue:forCustomKey:", v67, v66);

    objc_msgSend(v12, "setMessageType:", v67);
LABEL_68:

  }
}

+ (id)lpDescriptionCustomKey
{
  if (qword_1EEC40418 != -1)
    dispatch_once(&qword_1EEC40418, &unk_1E5AB7598);
  return (id)qword_1EEC40410;
}

+ (id)lpTitleCustomKey
{
  if (qword_1EEC40428 != -1)
    dispatch_once(&qword_1EEC40428, &unk_1E5AB75B8);
  return (id)qword_1EEC40420;
}

+ (id)_newSummaryTextForPayloadData:(id)a3 item:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x1E0D397E0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setData:", v7);

  objc_msgSend(v6, "objectForKey:", CFSTR("guid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessageGUID:", v9);
  objc_msgSend(v6, "objectForKey:", CFSTR("flags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = ((unint64_t)objc_msgSend(v10, "unsignedLongLongValue") >> 2) & 1;
  objc_msgSend(v8, "setIsFromMe:", v11);
  objc_msgSend(MEMORY[0x1E0D39A68], "previewSummaryWithPluginPayload:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

+ (id)_pluginPayloadAttachmentPathsForItem:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectForKeyedSubscript:", CFSTR("path"), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)_richLinkPluginHasRichContentForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5 outURL:(id *)a6 outTitle:(id *)a7 outLPMetadata:(id *)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  __CFArray *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  void *v48;
  id *v49;
  void *v50;
  id *v51;
  id v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = MEMORY[0x1AF434FF4](CFSTR("LPLinkMetadataPresentationTransformer"), CFSTR("LinkPresentation"));
  if (v15)
  {
    v16 = (objc_class *)v15;
    v49 = a7;
    v51 = a8;
    objc_msgSend(v12, "objectForKey:", CFSTR("payloadData"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0D397E0]);
    v50 = (void *)v17;
    objc_msgSend(v18, "setData:", v17);
    objc_msgSend(v12, "objectForKey:", CFSTR("guid"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMessageGUID:");
    objc_msgSend(v12, "objectForKey:", CFSTR("flags"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = ((unint64_t)objc_msgSend(v19, "unsignedLongLongValue") >> 2) & 1;

    objc_msgSend(v18, "setIsFromMe:", v20);
    v54 = v14;
    objc_msgSend(v18, "setUrl:", v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v52 = v13;
    v22 = v13;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v21 && v27)
            CFArrayAppendValue(v21, v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v24);
    }

    objc_msgSend(v18, "setAttachments:", v21);
    objc_msgSend(MEMORY[0x1E0D39A68], "linkMetadataForPluginPayload:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    v31 = objc_alloc_init(v16);
    objc_msgSend(v31, "setMetadata:", v30);
    objc_msgSend(v31, "setComplete:", 1);
    objc_msgSend(v31, "setPreferredSizeClass:", 5);
    objc_msgSend(v30, "URL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(v30, "originalURL");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = v14;
      if (v36)
        v38 = (void *)v36;
      v34 = v38;

    }
    objc_msgSend(v31, "setURL:", v34);
    v35 = objc_msgSend(v31, "hasMedia");
    objc_msgSend(v31, "originalURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "scheme");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");

      if (!v42)
      {
        v46 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v40, "absoluteString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "URLWithString:", v44);
        v47 = objc_claimAutoreleasedReturnValue();

        v40 = (id)v47;
      }
      v13 = v52;
      if (a6 && v40)
      {
        v40 = objc_retainAutorelease(v40);
        *a6 = v40;
      }
    }
    else
    {
      v13 = v52;
    }
    if (v49)
    {
      objc_msgSend(v30, "title");
      *v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v51)
      *v51 = objc_retainAutorelease(v30);

    v14 = v54;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (id)lpHasRichMediaCustomKey
{
  if (qword_1EEC40438 != -1)
    dispatch_once(&qword_1EEC40438, &unk_1E5AAEB40);
  return (id)qword_1EEC40430;
}

+ (id)lpPluginPathsCustomKey
{
  if (qword_1EEC40448 != -1)
    dispatch_once(&qword_1EEC40448, &unk_1E5AB75D8);
  return (id)qword_1EEC40440;
}

@end
