@implementation CKComposition

id __66__CKComposition_CKPersistentComposition__savedCompositionForGUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a2, "URLByAppendingPathComponent:isDirectory:", CFSTR("composition.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savedCompositionForGUID:(id)a3
{
  return (id)objc_msgSend(a1, "_savedCompositionForGUID:readUsingBlock:", a3, &__block_literal_global_496_0);
}

+ (id)_savedCompositionForGUID:(id)a3 readUsingBlock:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  char isKindOfClass;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  _CKAudioComposition *v35;
  _CKAudioComposition *v36;
  char v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  int v53;
  NSObject *v54;
  uint64_t v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  NSObject *v61;
  void *v62;
  void *v63;
  const char *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void (**v76)(id, void *);
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  _BYTE v86[10];
  id v87;
  __int16 v88;
  const __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v76 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v86 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
      *(_WORD *)&v86[8] = 2112;
      v87 = v78;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v65 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
    v67 = v78;
    _CKLog();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v65, v67);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "im_lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    CKDraftsDirectoryURL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    CKPluginDraftDirectoryURL(v6, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v77, "fileExistsAtPath:", v8);

    if (v9)
    {
      CKPluginTmpSubDirectoryURL(v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v77, "fileExistsAtPath:", v11);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v86 = v75;
          *(_WORD *)&v86[8] = 2112;
          if (v12)
            v14 = CFSTR("YES");
          v87 = v10;
          v88 = 2112;
          v89 = v14;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "getSaved draft %@ working %@ workExists %@", buf, 0x20u);
        }

      }
      if (v12)
        objc_msgSend(v77, "removeItemAtURL:error:", v10, 0);
      v84 = 0;
      objc_msgSend(v77, "copyItemAtURL:toURL:error:", v75, v10, &v84);
      v15 = v84;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v86 = v15;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Error when restoring draft to working with error %@", buf, 0xCu);
        }

      }
    }
    v76[2](v76, v73);
    v72 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v72;
    if (!v72)
    {
      v36 = 0;
LABEL_108:
      v35 = v36;

      goto LABEL_109;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v72, 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("shelfPluginPayload"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      v19 = (id)objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v83 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v71, &v83);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v83;
      if (v74)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v22 = v74;
        if ((isKindOfClass & 1) == 0)
          v22 = 0;
        v23 = v22;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v74, "fileURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (!v25)
          {
            +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "fileURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "userInfo");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "attributionInfo");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v66) = objc_msgSend(v74, "shouldHideAttachments");
            objc_msgSend(v26, "mediaObjectWithFileURL:filename:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:", v27, 0, v28, v29, 0, 0, v66);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v74, "setMediaObject:", v30);
              objc_msgSend(v30, "fileURL");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "setFileURL:", v31);

            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v74, "pluginBundleID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v86 = v33;
            _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "-> shelf:\n'NSDATA'->'%@'", buf, 0xCu);

          }
        }

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v86 = v20;
          _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Error decoding composition shelf data: %@", buf, 0xCu);
        }

      }
      v37 = objc_msgSend(v74, "shouldHideAttachments");

    }
    else
    {
      v74 = 0;
      v37 = 0;
    }
    objc_msgSend(v18, "objectForKey:", CFSTR("text"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v82 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v70, &v82);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v82;
      if (v39)
      {
        +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        CKTextForPersistentText(v39, v41, v37);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v86 = v68 != 0;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = 1;
            _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_INFO, "-> has retrieved text:%{BOOL}d for persistentText:%{BOOL}d", buf, 0xEu);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v86 = v40;
            _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "Error decoding composition text data: %@", buf, 0xCu);
          }

        }
        v68 = 0;
      }

    }
    else
    {
      v68 = 0;
    }
    objc_msgSend(v18, "objectForKey:", CFSTR("subject"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      v44 = 0;
      goto LABEL_78;
    }
    v81 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v69, &v81);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v81;
    v46 = IMOSLoggingEnabled();
    if (v44)
    {
      if (v46)
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "-> Subject retrieved and unarchived.", buf, 2u);
        }
LABEL_76:

      }
    }
    else if (v46)
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = v45;
        _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "Error decoding composition subject data: %@", buf, 0xCu);
      }
      goto LABEL_76;
    }

LABEL_78:
    objc_msgSend(v18, "objectForKey:", CFSTR("bizIntent"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      v51 = 0;
      goto LABEL_92;
    }
    v49 = (void *)MEMORY[0x1E0CB3710];
    v50 = objc_opt_class();
    v80 = 0;
    objc_msgSend(v49, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v50, objc_opt_class(), v48, &v80);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v80;
    v53 = IMOSLoggingEnabled();
    if (v51)
    {
      if (v53)
      {
        OSLogHandleForIMFoundationCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = objc_msgSend(v51, "count");
          v56 = CFSTR("something");
          if (!v55)
            v56 = CFSTR("nothing");
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v86 = v56;
          _os_log_impl(&dword_18DFCD000, v54, OS_LOG_TYPE_INFO, "-> bizIntent:%@", buf, 0xCu);
        }
LABEL_90:

      }
    }
    else if (v53)
    {
      OSLogHandleForIMFoundationCategory();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = v52;
        _os_log_impl(&dword_18DFCD000, v54, OS_LOG_TYPE_INFO, "Error decoding composition bizIntent data: %@", buf, 0xCu);
      }
      goto LABEL_90;
    }

LABEL_92:
    objc_msgSend(v18, "objectForKey:", CFSTR("sendLaterPluginInfo"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v57)
    {
      v58 = 0;
LABEL_104:
      objc_msgSend(v18, "objectForKey:", CFSTR("audioMessage"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v62, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("audioPowerLevels"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[_CKAudioComposition initWithText:subject:powerLevels:]([_CKAudioComposition alloc], "initWithText:subject:powerLevels:", v68, v44, v63);

      }
      else
      {
        v36 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:bizIntent:", v68, v44, v74, v51);
        -[CKComposition setSendLaterPluginInfo:](v36, "setSendLaterPluginInfo:", v58);
      }

      v17 = (void *)v72;
      goto LABEL_108;
    }
    v79 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v57, &v79);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v79;
    v60 = IMOSLoggingEnabled();
    if (v58)
    {
      if (v60)
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v86 = v58;
          _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "-> sendLaterPluginInfo:%@", buf, 0xCu);
        }
LABEL_102:

      }
    }
    else if (v60)
    {
      OSLogHandleForIMFoundationCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = v59;
        _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "Error decoding composition sendLaterPluginInfo data: %@", buf, 0xCu);
      }
      goto LABEL_102;
    }

    goto LABEL_104;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v86 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
      _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_DEBUG, "%s guid is invalid", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v35 = 0;
LABEL_109:

  return v35;
}

- (void)cleanupCKShareFromComposition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "payloadCollaborationType");

  if (v4 == 2)
  {
    -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudKitShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCloudKitShareRemovable");

    if (v7)
    {
      -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CKComposition removeShareURLForComposition:](self, "removeShareURLForComposition:", v8);

    }
  }
}

- (void)removeShareURLForComposition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x193FF3C18](CFSTR("CSCloudSharing"), CFSTR("CloudSharing"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "cloudKitShare");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerSetupInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__CKComposition_Collaboration__removeShareURLForComposition___block_invoke;
    v7[3] = &unk_1E274B1A0;
    v8 = v3;
    objc_msgSend(v4, "removeFromShare:containerSetupInfo:completionHandler:", v5, v6, v7);

  }
}

void __61__CKComposition_Collaboration__removeShareURLForComposition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = _IMWillLog();
  if (v7)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudKitShare");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();
LABEL_6:

    }
  }
  else if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerSetupInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

    goto LABEL_6;
  }

}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationShareOptions:(id)a8 proofreadingInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CKComposition *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKComposition;
  v22 = -[CKComposition init](&v29, sel_init);
  if (v22)
  {
    if (objc_msgSend(v15, "length"))
      v23 = v15;
    else
      v23 = 0;
    -[CKComposition setText:](v22, "setText:", v23);
    if (objc_msgSend(v16, "length"))
      v24 = v16;
    else
      v24 = 0;
    -[CKComposition setSubject:](v22, "setSubject:", v24);
    -[CKComposition setShelfPluginPayload:](v22, "setShelfPluginPayload:", v17);
    v25 = (void *)objc_msgSend(v18, "copy");
    if (objc_msgSend(v25, "count"))
    {
      v26 = (void *)objc_msgSend(v18, "copy");
      -[CKComposition setBizIntent:](v22, "setBizIntent:", v26);

    }
    else
    {
      -[CKComposition setBizIntent:](v22, "setBizIntent:", 0);
    }

    -[CKComposition setShelfMediaObject:](v22, "setShelfMediaObject:", v19);
    -[CKComposition setCollaborationShareOptions:](v22, "setCollaborationShareOptions:", v20);
    objc_msgSend(v20, "optionsGroups");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition setCollaborationOptions:](v22, "setCollaborationOptions:", v27);

    -[CKComposition setProofreadingInfo:](v22, "setProofreadingInfo:", v21);
  }

  return v22;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationOptions:(id)a8 proofreadingInfo:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  CKComposition *v24;

  v16 = (void *)MEMORY[0x1E0CD7420];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v16, "shareOptionsWithOptionsGroups:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:](self, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:", v22, v21, v20, v19, v18, v23, v17);

  return v24;
}

- (BOOL)compositionIsCollaboration
{
  void *v2;
  void *v3;
  int v4;

  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "supportsCollaboration"))
    v4 = objc_msgSend(v3, "sendAsCopy") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)compositionByAppendingText:(id)a3 shelfPluginPayload:(id)a4 shelfMediaObject:(id)a5 collaborationShareOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CKComposition *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  CKComposition *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10 || v11 || v12 || v13)
  {
    -[CKComposition text](self, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      if (v10)
      {
        v18 = (id)objc_msgSend(v16, "mutableCopy");
        objc_msgSend(v10, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "characterAtIndex:", 0);

        if (v20 != 10)
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
          objc_msgSend(v18, "appendAttributedString:", v21);

        }
        objc_msgSend(v18, "appendAttributedString:", v10);

      }
      else
      {
        v18 = v16;
      }
    }
    else
    {
      v18 = v10;
    }
    -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v23 = v11;

      v22 = v23;
    }
    -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v25 = v14;

      v24 = v25;
    }
    v35 = v14;
    -[CKComposition shelfMediaObject](self, "shelfMediaObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v11;
    v37 = v10;
    v27 = v18;
    if (v12)
    {
      v28 = v12;

      v26 = v28;
    }
    v29 = [CKComposition alloc];
    -[CKComposition subject](self, "subject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition bizIntent](self, "bizIntent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition proofreadingInfo](self, "proofreadingInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:](v29, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:", v27, v30, v22, v31, v26, v24, v32);

    -[CKComposition expressiveSendStyleID](self, "expressiveSendStyleID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition setExpressiveSendStyleID:](v15, "setExpressiveSendStyleID:", v33);

    -[CKComposition setShouldHideClearPluginButton:](v15, "setShouldHideClearPluginButton:", -[CKComposition shouldHideClearPluginButton](self, "shouldHideClearPluginButton"));
    v11 = v36;
    v10 = v37;
    v14 = v35;
  }
  else
  {
    v15 = self;
  }

  return v15;
}

- (CKComposition)compositionWithCollaborationShareOptions:(id)a3
{
  return (CKComposition *)-[CKComposition compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:](self, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", 0, 0, 0, a3);
}

- (id)compositionByAppendingCollaborativeComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CKComposition text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfMediaObject](self, "shelfMediaObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:](self, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfPluginPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfMediaObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationShareOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSArray)pasteboardItemProviders
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  CKPlainStringItemProviderWriter *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CKComposition *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = objc_msgSend(v4, "length");
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke;
  v18[3] = &unk_1E2750D40;
  v22 = &v23;
  v8 = v5;
  v19 = v8;
  v9 = v4;
  v20 = v9;
  v21 = self;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v18);
  if (*((_BYTE *)v24 + 24))
  {
    v10 = -[CKAttributedStringItemProviderWriter initWithAttributedString:]([CKAttributedStringItemProviderWriter alloc], "initWithAttributedString:", v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v10);
    objc_msgSend(v3, "addObject:", v11);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_110;
    v16[3] = &unk_1E2750D68;
    v17 = v3;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v16);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Based on the content of the composition, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v15, 2u);
      }

    }
    v10 = -[CKAttributedStringItemProviderWriter initWithAttributedString:]([CKPlainStringItemProviderWriter alloc], "initWithAttributedString:", v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v10);
    objc_msgSend(v3, "addObject:", v11);
  }

  v13 = v3;
  _Block_object_dispose(&v23, 8);

  return (NSArray *)v13;
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf;
  _BYTE v42[15];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AdaptiveImageGlyphMediaObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  v32 = v10;
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (a3 < a3 + a4)
    {
      v12 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(v8, "adaptiveImageGlyph");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAdaptiveImageGlyph:attributes:", v13, v12);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v14);
        }
        else
        {
          IMLogHandleForCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_cold_1(&buf, v42, v14);
        }

        --a4;
      }
      while (a4);
    }
    goto LABEL_30;
  }
  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(v9, "rtfDocumentItemsWithFormatString:selectedTextRange:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        }
        while (v18);
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(v10, "rtfDocumentItemsWithFormatString:selectedTextRange:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v21)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          }
          v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v23);
      }
    }
    goto LABEL_29;
  }
  if (v11)
  {
    objc_msgSend(v11, "url");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v27);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(*(id *)(a1 + 40), "ck_activeTextStylesInRange:", a3, a4);
    if (v29 | objc_msgSend(*(id *)(a1 + 40), "ck_activeTextEffectTypeInRange:", a3, a4))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend((id)objc_opt_class(), "_trimUnwantedAttributesFromAttributedString:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v28;
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v28);

LABEL_30:
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v7)
  {
    if (!v4)
      goto LABEL_7;
    v5 = v4;
  }
  objc_msgSend(v5, "pasteboardItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

LABEL_7:
}

+ (BOOL)_shouldCreateMediaObjectForUTIType:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if ((objc_msgSend(&unk_1E286F568, "containsObject:", v3) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v5, "allUTITypes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v11;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v6);
        if (UTTypeConformsTo(v3, *(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * v8)))
          break;
        if (v4 == ++v8)
        {
          v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v4)
            goto LABEL_5;
          goto LABEL_21;
        }
      }

      if ((objc_msgSend((id)*MEMORY[0x1E0CEBA10], "containsObject:", v3) & 1) != 0
        || UTTypeEqual(v3, CFSTR("public.url-name"))
        || (objc_msgSend((id)*MEMORY[0x1E0CEBA08], "containsObject:", v3) & 1) != 0)
      {
        LOBYTE(v4) = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CEA810], "__ck_pasteboardTypeListRTFD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = (objc_msgSend(v6, "containsObject:", v3) & 1) == 0
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E0CA5C40])
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E0CA5B78])
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E0CA5CC8])
                && UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5C20]) == 0;
    }
LABEL_21:

LABEL_22:
  }

  return v4;
}

+ (void)mediaObjectForItemProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[6];
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[5];
  id v35;

  v6 = a3;
  v7 = a4;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__35;
  v34[4] = __Block_byref_object_dispose__35;
  v35 = 0;
  objc_msgSend(v6, "registeredTypeIdentifiers");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__35;
  v30[4] = __Block_byref_object_dispose__35;
  v31 = 0;
  v9 = (void *)*MEMORY[0x1E0CEBA00];
  v10 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke;
  v29[3] = &unk_1E2750D90;
  v29[4] = v34;
  v29[5] = v30;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v29);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__35;
  v27[4] = __Block_byref_object_dispose__35;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__35;
  v25[4] = __Block_byref_object_dispose__35;
  v26 = 0;
  v11 = objc_opt_class();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2;
  v15[3] = &unk_1E2750F98;
  v19 = v30;
  v20 = v27;
  v21 = v25;
  v22 = v34;
  v24 = a1;
  v12 = v8;
  v16 = v12;
  v13 = v6;
  v17 = v13;
  v23 = v32;
  v14 = v7;
  v18 = v14;
  objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v11, v13, v15);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  id *v8;
  id v9;
  __CFString *inUTI;

  inUTI = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:"))
  {
    v7 = UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5B90]);
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      v9 = *v8;
      *v8 = 0;

      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CKMultiDict *v12;
  void *v13;
  CKMultiDict *v14;
  CKMultiDict *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  _QWORD *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD aBlock[4];
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[4];
  id v80;
  uint64_t *v81;
  _QWORD v82[5];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _QWORD v89[4];
  id v90;
  uint64_t *v91;
  uint64_t v92;
  _QWORD v93[4];
  CKMultiDict *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[5];
  id v101;
  _QWORD v102[4];
  id v103;
  CKMultiDict *v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v48 = a3;
  v49 = v5;
  if (v5 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    CKCreatePNGRepresentationFromUIImageFilterTypeNone(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), (id)*MEMORY[0x1E0CA5C10]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "arrayByAddingObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  v12 = objc_alloc_init(CKMultiDict);
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3;
  v102[3] = &unk_1E2750DB8;
  v105 = *(_QWORD *)(a1 + 96);
  v103 = *(id *)(a1 + 32);
  v14 = v12;
  v104 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v102);
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__35;
  v100[4] = __Block_byref_object_dispose__35;
  v101 = 0;
  if (-[CKMultiDict count](v14, "count"))
  {
    v96 = 0;
    v97 = &v96;
    v98 = 0x2050000000;
    v99 = 0;
    objc_msgSend(*(id *)(a1 + 32), "classes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4;
    v93[3] = &unk_1E2750DE0;
    v15 = v14;
    v94 = v15;
    v95 = &v96;
    objc_msgSend(v46, "enumerateObjectsUsingBlock:", v93);
    v16 = v97[3];
    if (v16 == objc_opt_class())
    {
      -[CKMultiDict objectsForKey:](v15, "objectsForKey:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0CA5C10]) & 1) != 0
        || objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0CA5BA8]))
      {
        v83 = 0;
        v84 = &v83;
        v85 = 0x2020000000;
        LOBYTE(v86) = 0;
        -[CKMultiDict objectsForKey:](v15, "objectsForKey:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_5;
        v89[3] = &unk_1E2750E30;
        v92 = *(_QWORD *)(a1 + 96);
        v90 = *(id *)(a1 + 40);
        v91 = &v83;
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v89);

        _Block_object_dispose(&v83, 8);
      }

    }
    v83 = 0;
    v84 = &v83;
    v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__35;
    v87 = __Block_byref_object_dispose__35;
    v88 = 0;
    -[CKMultiDict objectsForKey:](v15, "objectsForKey:", v97[3]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v97[3];
    if (v19 == objc_opt_class())
    {
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_7;
      v82[3] = &unk_1E274B9A0;
      v82[4] = &v83;
      objc_msgSend(v47, "enumerateObjectsUsingBlock:", v82);
      if (v84[5])
      {
LABEL_15:
        v77[0] = 0;
        v77[1] = v77;
        v77[2] = 0x3032000000;
        v77[3] = __Block_byref_object_copy__35;
        v77[4] = __Block_byref_object_dispose__35;
        v78 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_9;
        aBlock[3] = &unk_1E2750E80;
        v76 = *(_QWORD *)(a1 + 96);
        v22 = *(id *)(a1 + 40);
        v23 = *(_QWORD *)(a1 + 88);
        v73 = v22;
        v75 = v23;
        v74 = *(id *)(a1 + 48);
        v44 = _Block_copy(aBlock);
        if (v84[5])
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24 && objc_msgSend(v24, "conformsToType:", *MEMORY[0x1E0CEC4E0]))
          {
            objc_msgSend(v25, "identifier");
            v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

            v39 = *(void **)(a1 + 40);
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_129;
            v63[3] = &unk_1E2750ED0;
            v40 = v39;
            v41 = *(_QWORD *)(a1 + 96);
            v64 = v40;
            v67 = v41;
            v65 = v45;
            v66 = *(id *)(a1 + 48);
            v42 = (id)objc_msgSend(v40, "loadDataRepresentationForTypeIdentifier:completionHandler:", v26, v63);

            goto LABEL_32;
          }
        }
        else
        {
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v25 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v106, 16, v44);
          if (v27)
          {
            v28 = *(_QWORD *)v69;
            v29 = *MEMORY[0x1E0CEC4E0];
            while (2)
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v69 != v28)
                  objc_enumerationMutation(v25);
                v31 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v32, "conformsToType:", v29))
                {
                  v26 = v31;

                  goto LABEL_31;
                }

              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v106, 16);
              if (v27)
                continue;
              break;
            }
          }
        }

        if (objc_msgSend((id)v84[5], "isEqualToString:", CFSTR("com.apple.messages.maputi")))
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_132;
          v60[3] = &unk_1E2750EF8;
          v33 = *(void **)(a1 + 40);
          v61 = *(id *)(a1 + 48);
          v62 = v100;
          objc_msgSend(v33, "__ck_loadDataForAppleMapVCard:", v60);
          v26 = v61;
        }
        else
        {
          v34 = *(void **)(a1 + 96);
          v35 = v84[5];
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_135;
          v50[3] = &unk_1E2750F70;
          v37 = *(_QWORD *)(a1 + 64);
          v36 = *(_QWORD *)(a1 + 72);
          v54 = v77;
          v55 = v36;
          v56 = &v83;
          v57 = v37;
          v58 = v100;
          v59 = v34;
          v38 = *(_QWORD *)(a1 + 40);
          v51 = *(id *)(a1 + 32);
          v53 = v45;
          v52 = *(id *)(a1 + 40);
          objc_msgSend(v34, "filenameForType:forItemProvider:completionHandler:", v35, v38, v50);

          v26 = v51;
        }
LABEL_32:

        _Block_object_dispose(v77, 8);
        _Block_object_dispose(&v83, 8);

        _Block_object_dispose(&v96, 8);
        goto LABEL_33;
      }
      objc_msgSend(v47, "lastObject");
      v43 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v84[5];
      v84[5] = v43;
    }
    else
    {
      objc_msgSend((id)v97[3], "UTITypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_8;
      v79[3] = &unk_1E274A258;
      v80 = v47;
      v81 = &v83;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v79);

      v21 = v80;
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_33:
  _Block_object_dispose(v100, 8);

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(a1[6], "_shouldCreateMediaObjectForUTIType:"))
    objc_msgSend(a1[5], "pushObject:forKey:", v3, objc_msgSend(a1[4], "classForUTIType:", v3));

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "peekObjectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_6;
  v7[3] = &unk_1E2750E08;
  v4 = a1[4];
  v5 = (void *)a1[6];
  v7[4] = a1[5];
  v7[5] = a4;
  return objc_msgSend(v5, "dataForPasteboardType:forItemProvider:completion:", a2, v4, v7);
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  CKImageData *v5;

  v3 = a2;
  v5 = -[CKImageData initWithData:]([CKImageData alloc], "initWithData:", v3);

  if (-[CKImageData count](v5, "count") >= 2)
  {
    v4 = *(_BYTE **)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *v4 = 1;
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  id v8;

  v8 = a2;
  if ((CKUTTypeIsDynamic(v8, v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.icns")) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_9(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)a1[7];
    v6 = a1[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_10;
    v8[3] = &unk_1E2750E58;
    v9 = v3;
    objc_msgSend(v5, "dataForPasteboardType:forItemProvider:completion:", CFSTR("com.apple.MobileSMS.appendedURL"), v6, v8);
    v7 = *(_QWORD *)(a1[6] + 8);
    if (!*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 1;
      (*(void (**)(void))(a1[5] + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v15, 0xCu);
      }

    }
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v15, 0xCu);
        }

      }
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CKGetTmpPathForAppendedVideoURL(v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "transferGUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CKLinkAndCreateAppendedVideoTransfer(v13, v10, v14);

      }
    }

  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_129(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suggestedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByRemovingPercentEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(void **)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_130;
  v10[3] = &unk_1E2750EA8;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "mediaObjectFromItemAtURL:filename:completion:", v6, v7, v10);

}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_130(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_132(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v7 && !v9)
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v7, CFSTR("com.apple.messages.maputi"), v8, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Failed to load apple map vCard with error: %@", (uint8_t *)&v16, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a2;
  v7 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__35;
  v43 = __Block_byref_object_dispose__35;
  v44 = 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqualToString:"))
  {
    objc_storeStrong(v40 + 5, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 96), "_transcoderUserInfoFor:filename:type:", v40[5], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_136;
    block[3] = &unk_1E2750F20;
    v35 = *(_QWORD *)(a1 + 88);
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 72);
    v36 = &v39;
    v37 = v10;
    v11 = *(void **)(a1 + 48);
    v38 = *(_QWORD *)(a1 + 56);
    v32 = v9;
    v33 = v8;
    v34 = v11;
    v12 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(*(_QWORD *)(v13 + 8) + 40);
    if (!v14)
    {
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_10;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_138;
    v23[3] = &unk_1E2750F48;
    v15 = *(void **)(a1 + 96);
    v29 = *(_QWORD *)(a1 + 88);
    v30 = v15;
    v16 = *(_QWORD *)(a1 + 56);
    v26 = &v39;
    v27 = v16;
    v28 = v13;
    v17 = *(_QWORD *)(a1 + 40);
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 48);
    objc_msgSend(v15, "dataForPasteboardType:forItemProvider:completion:", v14, v17, v23);

    v12 = v24;
  }

LABEL_10:
  _Block_object_dispose(&v39, 8);

}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_136(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_138(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 80), "_transcoderUserInfoFor:filename:type:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4_139;
    block[3] = &unk_1E2750F20;
    v13 = *(_QWORD *)(a1 + 72);
    v6 = *(id *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v10 = v6;
    v11 = v5;
    v12 = v7;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4_139(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)_transcoderUserInfoFor:(id)a3 filename:(id)a4 type:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  CFMutableDictionaryRef Mutable;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v11 = UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x1E0CA5AD8]);
  if (v7 && v11 && objc_msgSend(v7, "length"))
  {
    v12 = IMIsHEVCWithAlphaVideoFromData();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v7, "length");
        v15 = CFSTR("NO");
        if (v12)
          v15 = CFSTR("YES");
        v17 = 134218242;
        v18 = v14;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Checked data (size=%lu) has alpha video channel: %@", (uint8_t *)&v17, 0x16u);
      }

    }
    if (v12)
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D37EE0]);
  }

  return Mutable;
}

+ (void)pluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "registeredTypeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.MobileSMS.PluginPayload")))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__CKComposition_UIPasteboard__pluginDisplayContainerForItemProvider_completion___block_invoke;
    v9[3] = &unk_1E274F9C0;
    v10 = v7;
    objc_msgSend(a1, "dataForPasteboardType:forItemProvider:completion:", CFSTR("com.apple.MobileSMS.PluginPayload"), v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __80__CKComposition_UIPasteboard__pluginDisplayContainerForItemProvider_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v6 = 0;
  +[CKPluginDisplayContainer unarchiveFromData:error:](CKPluginDisplayContainer, "unarchiveFromData:error:", a2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

+ (void)__ck_valueForItemClass:(Class)a3 forItemProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke;
  v12[3] = &unk_1E2750FC0;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  v11 = (id)objc_msgSend(v10, "loadObjectOfClass:completionHandler:", a3, v12);

}

void __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get itemClass for itemProvider: %@, error: %@", buf, 0x16u);

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke_148;
  block[3] = &unk_1E274CF30;
  v10 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke_148(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)dataForPasteboardType:(id)a3 forItemProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke;
  v12[3] = &unk_1E2750FE8;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  v11 = (id)objc_msgSend(v10, "loadDataRepresentationForTypeIdentifier:completionHandler:", a3, v12);

}

void __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get data for itemProvider: %@, error: %@", buf, 0x16u);

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke_150;
  block[3] = &unk_1E274CF30;
  v10 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke_150(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)filenameForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registeredTypeIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__35;
  v27[4] = __Block_byref_object_dispose__35;
  v28 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v13 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke;
  v22[3] = &unk_1E274B9A0;
  v22[4] = &v23;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);
  if (*((_BYTE *)v24 + 24))
  {
    v14 = objc_opt_class();
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_2;
    v15[3] = &unk_1E2751038;
    v16 = v11;
    v17 = v8;
    v21 = a1;
    v18 = v9;
    v19 = v10;
    v20 = v27;
    objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v14, v18, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v27, 8);

}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)*MEMORY[0x1E0CEBA08], "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  const __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a2;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "UTITypeForFilename:", v4);
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)v5;
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      if (v5)
      {
        if (UTTypeEqual(v5, *(CFStringRef *)(a1 + 40)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_11:

          goto LABEL_12;
        }
        v7 = *(_QWORD *)(a1 + 40);
      }
      v11 = *(void **)(a1 + 72);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_4;
      v13[3] = &unk_1E2751010;
      v12 = *(_QWORD *)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v11, "filenameFromURLTypeForType:forItemProvider:completionHandler:", v7, v12, v13);
      v10 = v14;
    }
    else
    {
      v8 = *(void **)(a1 + 72);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_3;
      v15[3] = &unk_1E2751010;
      v9 = *(_QWORD *)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      objc_msgSend(v8, "filenameFromURLTypeForType:forItemProvider:completionHandler:", v6, v9, v15);
      v10 = v16;
    }

    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_12:

}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)filenameFromURLTypeForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke;
  v14[3] = &unk_1E2751088;
  v17 = v10;
  v18 = a1;
  v15 = v9;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  objc_msgSend(a1, "_fileNameFromURLNameForItemProvider:fileType:completion:", v12, v11, v14);

}

void __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke_2;
    v6[3] = &unk_1E2751060;
    v4 = *(void **)(a1 + 56);
    v5 = *(id *)(a1 + 48);
    v7 = 0;
    v8 = v5;
    objc_msgSend(v4, "_fileNameFromFileURLForItemProvider:fileType:completion:", v2, v3, v6);

  }
}

uint64_t __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)_fileNameFromURLNameForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "registeredTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", CFSTR("public.url-name")) & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__CKComposition_UIPasteboard___fileNameFromURLNameForItemProvider_fileType_completion___block_invoke;
    v12[3] = &unk_1E2750FE8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(a1, "dataForPasteboardType:forItemProvider:completion:", CFSTR("public.url-name"), v8, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

void __87__CKComposition_UIPasteboard___fileNameFromURLNameForItemProvider_fileType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;

  v12 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:usedEncoding:", v6, 0);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathExtension:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UTITypeForFilename:", v9);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!UTTypeEqual(v11, *(CFStringRef *)(a1 + 32)))
    {

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_fileNameFromFileURLForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "registeredTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", CFSTR("public.file-url")) & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__CKComposition_UIPasteboard___fileNameFromFileURLForItemProvider_fileType_completion___block_invoke;
    v12[3] = &unk_1E2750FE8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(a1, "dataForPasteboardType:forItemProvider:completion:", CFSTR("public.file-url"), v8, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

void __87__CKComposition_UIPasteboard___fileNameFromFileURLForItemProvider_fileType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;

  v10 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:usedEncoding:", v6, 0);

  if (v7)
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UTITypeForFilename:", v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!UTTypeEqual(v9, *(CFStringRef *)(a1 + 32)))
    {

      v7 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_attributedStringByTransformingLinksFromAttributedString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v6 = *MEMORY[0x1E0DC1160];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __88__CKComposition_UIPasteboard___attributedStringByTransformingLinksFromAttributedString___block_invoke;
  v14 = &unk_1E27508C8;
  v15 = v5;
  v16 = v3;
  v7 = v3;
  v8 = v5;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 2, &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __88__CKComposition_UIPasteboard___attributedStringByTransformingLinksFromAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v18;
    else
      v7 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "absoluteString");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringWithRange:", a3, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isRichLinkImprovementsEnabled");

      if (v12)
      {
        v13 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v10, v7);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1160], a3, a4);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a3, a4, v17);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1160], a3, a4);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1160], a3, a4);
  }

}

+ (id)_trimUnwantedAttributesFromAttributedString:(id)a3 allowedAttributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_attributedStringByTransformingLinksFromAttributedString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "ck_removeAttributesNotIn:", v6);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

+ (id)_trimUnwantedAttributesFromAttributedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3498];
  v5 = a3;
  objc_msgSend(v4, "ck_defaultAllowedAttributesForComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_trimUnwantedAttributesFromAttributedString:allowedAttributes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isRTFDocumentWithItemProvider:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "registeredTypeIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = (void *)*MEMORY[0x1E0CEC5C0];
    v7 = (void *)*MEMORY[0x1E0CEC5C8];
    v8 = (void *)*MEMORY[0x1E0CEC4E8];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v7, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v12))
        {

LABEL_14:
LABEL_15:
          v15 = 1;
          goto LABEL_16;
        }
        objc_msgSend(v8, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          goto LABEL_15;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v15 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return v15;
}

+ (void)_pasteAttributedStringWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke;
  v14[3] = &unk_1E27510D8;
  v16 = v9;
  v17 = a1;
  v15 = v8;
  v12 = v9;
  v13 = v8;
  objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v11, v10, v14);

}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "ck_defaultAllowedAttributesForComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if ((objc_msgSend(*(id *)(a1 + 32), "supportsExpressiveText") & 1) == 0)
  {
    objc_msgSend(v9, "removeObject:", *MEMORY[0x1E0D393F0]);
    objc_msgSend(v9, "removeObject:", *MEMORY[0x1E0D393E8]);
    objc_msgSend(v9, "removeObject:", *MEMORY[0x1E0D39420]);
    objc_msgSend(v9, "removeObject:", *MEMORY[0x1E0D39440]);
    objc_msgSend(v9, "removeObject:", *MEMORY[0x1E0D39428]);
  }
  objc_msgSend(*(id *)(a1 + 48), "_trimUnwantedAttributesFromAttributedString:allowedAttributes:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "wantsInlinedRichLinks"))
  {
    objc_msgSend(v10, "ck_attributedStringByPostProcessingURLTextForRichLinks");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v12 = objc_msgSend(v10, "length");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_2;
  v17[3] = &unk_1E27510B0;
  v13 = v7;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  v20 = v21;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v17);
  objc_msgSend(*(id *)(a1 + 48), "finalCompositionFromAllCompositions:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v15, 0);

  _Block_object_dispose(v21, 8);
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  CKComposition *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CKComposition *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  uint8_t v52[8];
  _QWORD v53[4];
  id v54;
  _BYTE *v55;
  id v56;
  _BYTE buf[24];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.messages.mapattribute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("com.apple.messages.mapvcard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.messages.mapvcard.name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.messages.maputi"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 1, &v56);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v56;
    v15 = v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 0;
    if (v16)
    {
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v13, v12, v11, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *(void **)(a1 + 32);
      +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v22, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v58 = v10;
        v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Unable to load map vCard data for uti type: %@, mapName: %@, URL: %@ with error: %@", buf, 0x2Au);

      }
    }

    goto LABEL_14;
  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v19, 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    goto LABEL_14;
  }
  if (v10)
  {
    objc_msgSend(v10, "fileType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("public.url-name"));

    if ((v26 & 1) != 0)
    {
LABEL_27:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_14;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v58) = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_157;
    v53[3] = &unk_1E274EF70;
    v55 = buf;
    v27 = *(void **)(a1 + 40);
    v54 = *(id *)(a1 + 32);
    objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("com.apple.MobileSMS.PluginPayload"), a3, a4, 0, v53);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
LABEL_26:

      _Block_object_dispose(buf, 8);
      goto LABEL_27;
    }
    objc_msgSend(v10, "contents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v29, v30, 0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

      v42 = *(void **)(a1 + 40);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_158;
      v50[3] = &unk_1E274EF20;
      v43 = v31;
      v51 = v43;
      objc_msgSend(v42, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("com.apple.MobileSMS.appendedURL"), a3, a4, 0, v50);
      v44 = *(void **)(a1 + 32);
      +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v43, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v45);

      goto LABEL_26;
    }
    objc_msgSend(v10, "fileWrapper");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v10, "fileWrapper");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "preferredFilename");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "regularFileContents");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      IMUTITypeForFilename();
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v47, v39, v29, 0);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v39;
      v31 = (void *)v40;

      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "Pasted text attachment has no content!", v52, 2u);
      }

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v33, "text");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithAttributedString:", v35);

      objc_msgSend(v36, "appendAttributedString:", v32);
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");

      v32 = v36;
    }
    v37 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v32, 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v37);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
LABEL_14:

}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_157(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    +[CKPluginDisplayContainer unarchiveFromData:error:](CKPluginDisplayContainer, "unarchiveFromData:error:", a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v14 = v3;
      objc_msgSend(v3, "pluginPayload");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pluginBundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375F8]);

      if (v6)
      {
        objc_msgSend(v14, "pluginPayload");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pluginPayload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v14, "pluginPayload");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setData:", v11);

        }
      }
      +[CKComposition compositionWithPluginDisplayContainer:subject:](CKComposition, "compositionWithPluginDisplayContainer:subject:", v14, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

      v3 = v14;
    }

  }
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v3;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v12, 0xCu);
      }

    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v12, 0xCu);
        }

      }
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CKGetTmpPathForAppendedVideoURL(v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "transferGUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CKLinkAndCreateAppendedVideoTransfer(v10, v7, v11);

      }
    }

  }
}

+ (void)_pasteRTFDocumentWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a1, "isRTFDocumentWithItemProvider:", v10))
    objc_msgSend(a1, "_pasteAttributedStringWithItemProvider:builderContext:completionHandler:", v10, v8, v9);

}

+ (void)createPluginPayloadCompositionFromItemProvider:(id)a3 builderContext:(id)a4 shareOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.cloudkit.sharingsupport.pre")) & 1) != 0
    || objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.cloudkit.sharingsupport.post")))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke;
    v19[3] = &unk_1E2750D18;
    v20 = v13;
    objc_msgSend(a1, "createPluginPayloadCompositionFromCloudKitItemProvider:collaborationShareOptions:completionHandler:", v10, v12, v19);
    v14 = v20;
  }
  else if (objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", *MEMORY[0x1E0CD74A8]))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_160;
    v17[3] = &unk_1E2750D18;
    v18 = v13;
    objc_msgSend(a1, "createPluginPayloadCompositionFromCollaborativeItemProvider:collaborationShareOptions:completionHandler:", v10, v12, v17);
    v14 = v18;
  }
  else
  {
    if (!objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", *MEMORY[0x1E0CA5BA0]))
    {
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
      goto LABEL_5;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_161;
    v15[3] = &unk_1E2750D18;
    v16 = v13;
    objc_msgSend(a1, "_createPluginPayloadCompositionFromFileItemProvider:builderContext:collaborationShareOptions:completionHandler:", v10, v11, v12, v15);
    v14 = v16;
  }

LABEL_5:
}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Returning composition for CKShare.", buf, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CloudKit returned nil composition.", v11, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Returning composition for SWShareableContent.", buf, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Item Provider cannot load any type identifiers we tried. Returning nil composition.", v11, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Returning composition for FP.", buf, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "File Provider returned nil composition.", v11, 2u);
      }

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

+ (void)_createPluginPayloadCompositionFromFileItemProvider:(id)a3 builderContext:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint8_t *v35;
  id v36[2];
  id location[2];
  _QWORD v38[5];
  id v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "IN _createPluginPayloadCompositionFromFileItemProvider", buf, 2u);
    }

  }
  objc_msgSend(v10, "registeredTypeIdentifiersWithFileOptions:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v41 = buf;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__35;
  v44 = __Block_byref_object_dispose__35;
  v45 = 0;
  objc_msgSend(v15, "firstObject");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__35;
  v38[4] = __Block_byref_object_dispose__35;
  v39 = 0;
  objc_msgSend(a1, "richestMediaTypeForItemProvider:", v10);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (*((_QWORD *)v41 + 5))
  {
    location[0] = 0;
    objc_initWeak(location, a1);
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke;
    aBlock[3] = &unk_1E2751240;
    objc_copyWeak(v36, location);
    v36[1] = a1;
    v17 = v10;
    v30 = v17;
    v34 = v38;
    v31 = v11;
    v33 = v13;
    v32 = v12;
    v35 = buf;
    v18 = _Block_copy(aBlock);
    if (objc_msgSend(*((id *)v41 + 5), "isEqualToString:", *MEMORY[0x1E0CD7468])
      && objc_msgSend(v17, "hasItemConformingToTypeIdentifier:", CFSTR("public.file-url")))
    {
      v27[0] = v16;
      v27[1] = 3221225472;
      v27[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_211;
      v27[3] = &unk_1E2751290;
      v28 = v18;
      objc_msgSend(v17, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("public.file-url"), 0, v27);
      v19 = &v28;
    }
    else
    {
      v20 = *((_QWORD *)v41 + 5);
      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_216;
      v25[3] = &unk_1E27512E0;
      v26 = v18;
      v21 = (id)objc_msgSend(v17, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v20, v25);
      v19 = &v26;
    }

    objc_destroyWeak(v36);
    objc_destroyWeak(location);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Item is not of type openInPlaceType, so we can't offer Collaboration.", (uint8_t *)location, 2u);
      }

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_218;
    v23[3] = &unk_1E274C870;
    v24 = v13;
    objc_msgSend(a1, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v10, v11, v23);

  }
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(buf, 8);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  void *v37;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));

  if (WeakRetained)
  {
    if (v7 && !v8 && a3)
    {
      *(_QWORD *)buf = 0;
      v33 = buf;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__35;
      v36 = __Block_byref_object_dispose__35;
      v37 = 0;
      v10 = *(void **)(a1 + 88);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2;
      v23[3] = &unk_1E2751218;
      v24 = v12;
      objc_copyWeak(&v31, (id *)(a1 + 80));
      v25 = *(id *)(a1 + 40);
      v29 = buf;
      v28 = *(id *)(a1 + 56);
      v26 = v7;
      v14 = *(id *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 72);
      v27 = v14;
      v30 = v15;
      objc_msgSend(v10, "requestMediaObjectForItemProvider:type:builderContext:completion:", v24, v11, v13, v23);

      objc_destroyWeak(&v31);
      _Block_object_dispose(buf, 8);
      v16 = v37;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Item is not of type openInPlaceType, so we can't offer Collaboration.", buf, 2u);
        }

      }
      v18 = objc_loadWeakRetained((id *)(a1 + 80));
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_208;
      v21[3] = &unk_1E274C870;
      v22 = *(id *)(a1 + 56);
      objc_msgSend(v18, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v19, v20, v21);

      v16 = v22;
    }

  }
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id WeakRetained;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  const __CFString *v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  id v35;
  char v36;
  _QWORD v37[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
    v12 = (void *)objc_opt_class();
    if ((objc_msgSend(v12, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v39 = objc_opt_class();
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Class %@ should go through the non collaborative flow", buf, 0xCu);
        }

      }
      v14 = *(_QWORD *)(a1 + 64);
      +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v10);

      goto LABEL_20;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v10, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v17;
        v40 = 2112;
        v41 = v18;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Failed to get mediaObject for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v37[0] = v11;
    v37[1] = 3221225472;
    v37[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_162;
    v37[3] = &unk_1E2751100;
    v37[4] = *(_QWORD *)(a1 + 72);
    objc_msgSend(WeakRetained, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v20, v21, v37);

  }
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", *(_QWORD *)(a1 + 48), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(*(id *)(a1 + 48), "startAccessingSecurityScopedResource");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = CFSTR("NO");
      if (v23)
        v25 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v25;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "File is inPlace and it's from a fileProvider. Start accessing security scoped resource: %@", buf, 0xCu);
    }

  }
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_165;
  block[3] = &unk_1E27511F0;
  objc_copyWeak(&v35, (id *)(a1 + 88));
  v28 = *(id *)(a1 + 32);
  v29 = *(id *)(a1 + 40);
  v33 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 56);
  v31 = *(id *)(a1 + 48);
  v32 = v22;
  v34 = *(_OWORD *)(a1 + 72);
  v36 = v23;
  v26 = v22;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v35);
LABEL_20:

}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "mediaObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_165(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void (*v8)(uint64_t, NSObject *);
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void (*v13)(uint64_t, NSObject *);
  uint64_t v14;
  uint8_t v15[16];
  _QWORD aBlock[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char v26;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_166;
  aBlock[3] = &unk_1E27511C8;
  objc_copyWeak(&v25, (id *)(a1 + 96));
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 48);
  v2 = *(id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 80);
  v20 = v2;
  v23 = v3;
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 88);
  v21 = v4;
  v24 = v5;
  v26 = *(_BYTE *)(a1 + 104);
  v6 = _Block_copy(aBlock);
  if (CKCloudKitPostShareType_block_invoke__pred_SWCollaborationMetadataForDocumentURLSharedWithYouCore != -1)
    dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_SWCollaborationMetadataForDocumentURLSharedWithYouCore, &__block_literal_global_97);
  if (CKCloudKitPostShareType_block_invoke__pred_FPProviderForShareURLFileProvider != -1)
    dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_FPProviderForShareURLFileProvider, &__block_literal_global_200_1);
  if (CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL
    && CKCloudKitPostShareType_block_invoke__FPProviderForShareURL)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Invoking SWCollaborationMetadataForDocumentURL", v15, 2u);
      }

    }
    v8 = (void (*)(uint64_t, NSObject *))CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = _Block_copy(v6);
    v8(v9, v10);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKComposition_UIPasteboard_Collaboration: We're running on a build without SWCollaborationMetadataForDocumentURL, or the dependent FileProvider change from rdar://89285840. Falling back to the legacy SPI flow to retrieve collaboration metadata", v15, 2u);
      }

    }
    if (CKCloudKitPostShareType_block_invoke__pred_FPCollaborationMetadataForDocumentURL_PreliminaryFileProvider != -1)
      dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_FPCollaborationMetadataForDocumentURL_PreliminaryFileProvider, &__block_literal_global_205_0);
    if (CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Invoking FPCollaborationMetadataForDocumentURL_Preliminary", v15, 2u);
        }

      }
      v13 = (void (*)(uint64_t, NSObject *))CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary;
      v14 = *(_QWORD *)(a1 + 56);
      v10 = _Block_copy(v6);
      v13(v14, v10);
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_165_cold_1();
    }
  }

  objc_destroyWeak(&v25);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_166(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  _BYTE *v32;
  __int128 *p_buf;
  uint64_t v34;
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  _BYTE v39[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Error while getting collaborationMetadata: %@.", (uint8_t *)&buf, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_167;
    v37[3] = &unk_1E274C870;
    v38 = *(id *)(a1 + 72);
    objc_msgSend(WeakRetained, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v9, v10, v37);

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__35;
    v46 = __Block_byref_object_dispose__35;
    v47 = 0;
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      v12 = v11;
      v13 = v47;
      v47 = v12;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "defaultShareOptions");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v14;

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CD7420];
      objc_msgSend(v5, "defaultOptions");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v16, "shareOptionsWithOptionsGroups:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v39 = 138412546;
        *(_QWORD *)&v39[4] = v5;
        *(_WORD *)&v39[12] = 2112;
        *(_QWORD *)&v39[14] = v21;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "FileProvider returned collaborationMetadata: %@. Share options: %@", v39, 0x16u);
      }

    }
    *(_QWORD *)v39 = 0;
    *(_QWORD *)&v39[8] = v39;
    *(_QWORD *)&v39[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__35;
    v41 = __Block_byref_object_dispose__35;
    v42 = 0;
    v42 = v5;
    v22 = (void *)MEMORY[0x1E0D11690];
    v23 = *(_QWORD *)(a1 + 56);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_172;
    v26[3] = &unk_1E27511A0;
    v25 = *(_OWORD *)(a1 + 72);
    v24 = (id)v25;
    v31 = v25;
    objc_copyWeak(&v35, (id *)(a1 + 96));
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v32 = v39;
    v29 = *(id *)(a1 + 64);
    p_buf = &buf;
    v34 = *(_QWORD *)(a1 + 88);
    v30 = *(id *)(a1 + 56);
    v36 = *(_BYTE *)(a1 + 104);
    objc_msgSend(v22, "userNameAndEmail:containerSetupInfo:completionHandler:", v23, 0, v26);

    objc_destroyWeak(&v35);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(&buf, 8);
  }

}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_168;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_168(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_172(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  int v23;
  id WeakRetained;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  uint64_t v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD block[4];
  id v59;
  _QWORD v60[2];
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v9;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", buf, 0xCu);
      }

    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_173;
      block[3] = &unk_1E2751128;
      v12 = *(id *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 72);
      v60[0] = v12;
      v60[1] = v13;
      v9 = v9;
      v59 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v14 = (id *)v60;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_174;
      v56[3] = &unk_1E274C870;
      v57 = *(id *)(a1 + 64);
      objc_msgSend(WeakRetained, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v25, v26, v56);

      v14 = &v57;
    }
    v16 = *v14;
    goto LABEL_46;
  }
  if (v10)
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v8;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Setting initiatorHandle to: %@.", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setInitiatorHandle:", v8);
  v16 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v16, "personNameComponentsFromString:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setInitiatorNameComponents:", v17);
  objc_msgSend(*(id *)(a1 + 48), "setCollaborationMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "setPayloadCollaborationType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "optionsGroups");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = IMOSLoggingEnabled();
  if (!v18)
  {
    if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "FileProvider returned nil options so we don't offer collaboration.", buf, 2u);
      }

    }
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_192;
    v47[3] = &unk_1E2751128;
    v28 = *(id *)(a1 + 64);
    v29 = *(_QWORD *)(a1 + 72);
    v49 = v28;
    v50 = v29;
    v48 = 0;
    dispatch_async(MEMORY[0x1E0C80D38], v47);

    v9 = 0;
    v30 = v49;
    goto LABEL_43;
  }
  if (v19)
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v62 = v21;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Received options from File Provider. Share options: %@", buf, 0xCu);
    }

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "containsString:", CFSTR("com.apple.iwork")) & 1) == 0)
  {
    v31 = objc_alloc(MEMORY[0x1E0CA58A8]);
    v32 = *(_QWORD *)(a1 + 56);
    v55 = 0;
    v33 = (void *)objc_msgSend(v31, "initWithURL:error:", v32, &v55);
    v22 = v55;
    objc_msgSend(v33, "claimRecord");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      objc_msgSend(v33, "claimRecord");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v36, "defaultShareModeCollaboration");

      if (!v22)
        goto LABEL_33;
    }
    else
    {
      v23 = 1;
      if (!v22)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
    IMLogHandleForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_172_cold_1(v22, v37);

    goto LABEL_33;
  }
  v22 = 0;
  v23 = 1;
LABEL_34:
  objc_msgSend(*(id *)(a1 + 48), "setSendAsCopy:", v23 ^ 1u);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "summary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v38);
    }
    else
    {
      CKFrameworkBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v40);

    }
  }
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "itemForURL:error:", *(_QWORD *)(a1 + 56), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "providerID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "fp_isiCloudDriveOrCloudDocsIdentifier"))
    v43 = 1;
  else
    v43 = 3;
  objc_msgSend(*(id *)(a1 + 48), "setPayloadCollaborationType:", v43);
  v44 = *(_QWORD *)(a1 + 48);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_190;
  v51[3] = &unk_1E2751178;
  v54 = *(_QWORD *)(a1 + 88);
  v46 = *(_OWORD *)(a1 + 64);
  v45 = (id)v46;
  v53 = v46;
  v9 = v22;
  v52 = v9;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v44, v51);

LABEL_43:
  if (*(_BYTE *)(a1 + 112))
    objc_msgSend(*(id *)(a1 + 56), "stopAccessingSecurityScopedResource");

LABEL_46:
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_173(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[5];
  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, a1[4]);

}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_174(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  +[CKComposition compositionWithShelfMediaObject:](CKComposition, "compositionWithShelfMediaObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_191;
  block[3] = &unk_1E2751150;
  v8 = v3;
  v9 = v4;
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_191(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "compositionByAppendingComposition:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionWithCollaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_192(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[5];
  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, a1[4]);

}

void *__142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_195()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("SWCollaborationMetadataForDocumentURL", CFSTR("SharedWithYouCore"));
  CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL = result;
  return result;
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_199()
{
  uint64_t result;

  result = MEMORY[0x193FF3C24]("FPProviderForShareURL", CFSTR("FileProvider"));
  CKCloudKitPostShareType_block_invoke__FPProviderForShareURL = result;
  return result;
}

void *__142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_204()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("FPCollaborationMetadataForDocumentURL_Preliminary", CFSTR("FileProvider"));
  CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary = result;
  return result;
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_208(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_209;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_209(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Loading NSItemProvider URL: %@, error: %@", buf, 0x16u);
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_213;
  v12[3] = &unk_1E2751268;
  v9 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v9;
  v10 = v6;
  objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 1, &v15, v12);
  v11 = v15;

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_213(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, 1, *(_QWORD *)(a1 + 32));
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_216(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v21 = v7;
      v22 = 2112;
      if (a3)
        v10 = CFSTR("YES");
      v23 = v10;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Loading NSItemProvider URL: %@, isInPlace:%@, error: %@", buf, 0x20u);
    }

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_217;
  v15[3] = &unk_1E27512B8;
  v12 = *(id *)(a1 + 32);
  v18 = a3;
  v16 = v8;
  v17 = v12;
  v13 = v8;
  objc_msgSend(v11, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 1, &v19, v15);
  v14 = v19;

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_217(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_219;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_219(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)createPluginPayloadCompositionFromCloudKitItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  __CFString *v11;
  Class v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  Class v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = CFSTR("com.apple.cloudkit.sharingsupport.pre");
  if ((objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.cloudkit.sharingsupport.pre")) & 1) != 0)
  {
    v11 = CFSTR("CKPreSharingContext");
LABEL_5:
    v12 = NSClassFromString(&v11->isa);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Loading Cloud Kit content for type identifier: %@", buf, 0xCu);
      }

    }
    v14 = objc_opt_class();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke;
    v22[3] = &unk_1E2751358;
    v23 = v8;
    v24 = v9;
    v25 = v12;
    v15 = v9;
    v16 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", v14, v22);

    v17 = &v23;
    goto LABEL_15;
  }
  v10 = CFSTR("com.apple.cloudkit.sharingsupport.post");
  if (objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.cloudkit.sharingsupport.post")))
  {
    v11 = CFSTR("CKPostSharingContext");
    goto LABEL_5;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Type identifer is not CKCloudKitPreShareType or CKCloudKitPostShareType. Returning nil composition;",
        buf,
        2u);
    }

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_235;
  v20[3] = &unk_1E274AED0;
  v17 = &v21;
  v21 = v9;
  v19 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v20);
LABEL_15:

}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v43 = a3;
  v41 = v4;
  if (v4)
  {
    v46 = v4;
    objc_msgSend(v46, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "allowedOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v34, "shareOptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "copy");
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CD7420];
        objc_msgSend(v34, "optionsGroups");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shareOptionsWithOptionsGroups:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (id)v11;

    }
    objc_msgSend(v47, "absoluteString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "fragment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = v44;
    if (!objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC528])
      || !objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4A0])
      || !objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4B8])
      || (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC5F8]) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v13;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", buf, 0xCu);
        }

      }
      v13 = 0;
      v14 = v44;
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", v16, &stru_1E276D870);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = &stru_1E276D870;
    }
    objc_msgSend(v5, "currentUserParticipant");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "userIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lookupInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "phoneNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v37 = v18;
    }
    else
    {
      objc_msgSend(v42, "emailAddress");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v17, "nameComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(MEMORY[0x1E0CD7400], "instancesRespondToSelector:", sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_);
    v22 = objc_alloc(MEMORY[0x1E0CD7400]);
    if (v21)
    {
      objc_msgSend(v46, "containerSetupInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "initWithCollaborationIdentifier:title:defaultShareOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v36, v38, v7, 0, v13, v37, v20, v23, 0);
    }
    else
    {
      objc_msgSend(v7, "optionsGroups");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "initWithCollaborationIdentifier:title:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:", v36, v38, v23, 0, v13, v37, v20);
    }
    v25 = (void *)v24;

    +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v47, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPayloadCollaborationType:", 2);
    objc_msgSend(v26, "setCloudKitShare:", v5);
    objc_msgSend(v26, "setCollaborationMetadata:", v25);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "summary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v26, "setCollaborationOptionsSummary:", v27);
      }
      else
      {
        CKFrameworkBundle();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setCollaborationOptionsSummary:", v29);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v47;
        v57 = 2112;
        v58 = v7;
        v59 = 2112;
        v60 = v25;
        _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Received URL:%@ , Sharing Optons: %@, Metadata: %@", buf, 0x20u);
      }

    }
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_232;
    v51[3] = &unk_1E2751330;
    v52 = v7;
    v31 = *(id *)(a1 + 40);
    v53 = v43;
    v54 = v31;
    v32 = v43;
    v33 = v7;
    +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v26, v51);

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_cold_1(a1, v43, v8);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_233;
    block[3] = &unk_1E274DA38;
    v9 = *(id *)(a1 + 40);
    v49 = v43;
    v50 = v9;
    v46 = v43;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v5 = v50;
  }

}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_232(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E2751308;
  v6 = v3;
  v7 = a1[4];
  v9 = a1[6];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "compositionWithCollaborationShareOptions:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Returning composition for CKShare. Composition.", v4, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)createPluginPayloadCompositionFromCollaborativeItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Loading SWY item provider", buf, 2u);
    }

  }
  v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke;
  v15[3] = &unk_1E2750FC0;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  v14 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", v11, v15);

}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Loading object of class _SWPendingCollaboration.", buf, 2u);
    }

  }
  v8 = v5;
  objc_msgSend(v8, "collaborationMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "defaultShareOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v12, "copy");
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CD7420];
      objc_msgSend(v9, "defaultOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shareOptionsWithOptionsGroups:", v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(v8, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCollaborationMetadata:", v9);
  objc_msgSend(v15, "setPayloadCollaborationType:", 3);
  objc_msgSend(v11, "summary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "setCollaborationOptionsSummary:", v16);
  }
  else
  {
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCollaborationOptionsSummary:", v18);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v14;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Creating a composition with pluginPayload url: %@, metadata: %@, share options: %@", buf, 0x20u);
    }

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_237;
  v23[3] = &unk_1E2751330;
  v24 = v11;
  v20 = *(id *)(a1 + 40);
  v25 = v6;
  v26 = v20;
  v21 = v6;
  v22 = v11;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v15, v23);

}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_237(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E2751308;
  v6 = v3;
  v7 = a1[4];
  v9 = a1[6];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "compositionWithCollaborationShareOptions:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (void)compositionFromItemProviders:(id)a3 shareOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v12, "count"))
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E2751380;
  v15 = v9;
  v16 = a1;
  v14 = v8;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

void __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E2750D18;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "createPluginPayloadCompositionFromItemProvider:builderContext:shareOptions:completionHandler:", a2, 0, v3, v5);

}

void __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E274C2E0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

+ (void)compositionFromNonCollaborationItemProviders:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 *p_buf;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[5];
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t v53[4];
  const __CFString *v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v44 = objc_msgSend(v8, "count") - 1;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v8, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Beginning paste resolution for {%ld} given item providers.", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__35;
  v58 = __Block_byref_object_dispose__35;
  v59 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v59 = v13;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke;
  v42[3] = &unk_1E27513A8;
  v42[4] = &buf;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v42);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v33[0] = v14;
  v33[1] = 3221225472;
  v33[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2;
  v33[3] = &unk_1E27513D0;
  v37 = a1;
  v15 = v9;
  v34 = v15;
  v16 = v10;
  v35 = v16;
  v36 = &v38;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v33);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (*((_BYTE *)v39 + 24))
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      *(_DWORD *)v53 = 138412290;
      v54 = v18;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Finished RTF evaluation – isRTF={%@}.", v53, 0xCu);
    }

  }
  if (!*((_BYTE *)v39 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "wantsInlinedRichLinks");
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_239;
    v23[3] = &unk_1E27514E8;
    p_buf = &buf;
    v28 = v43;
    v31 = a1;
    v29 = &v45;
    v26 = v16;
    v32 = v20;
    v21 = v19;
    v24 = v21;
    v25 = v15;
    v30 = &v49;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v23);

  }
  if (*((_BYTE *)v50 + 24) && !*((_BYTE *)v46 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Tried all types, unable to resolve entire paste. Calling completion handler with nil.", v53, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  +[CKComposition composition](CKComposition, "composition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 56), "isRTFDocumentWithItemProvider:"))
  {
    objc_msgSend(*(id *)(a1 + 56), "_pasteRTFDocumentWithItemProvider:builderContext:completionHandler:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_239(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "registeredTypeIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v34 = a3;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Resolving itemProvider at idx={%ld} with representations: %@", buf, 0x16u);

    }
  }
  v8 = *(void **)(a1 + 88);
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_240;
  v29[3] = &unk_1E27513F8;
  v10 = *(_OWORD *)(a1 + 64);
  v32 = a3;
  v31 = v10;
  v17 = *(_OWORD *)(a1 + 48);
  v11 = (id)v17;
  v30 = v17;
  objc_msgSend(v8, "pluginDisplayContainerForItemProvider:completion:", v5, v29);
  v12 = *(void **)(a1 + 88);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_242;
  v19[3] = &unk_1E27514C0;
  v26 = a3;
  v24 = *(_OWORD *)(a1 + 64);
  v18 = *(_OWORD *)(a1 + 48);
  v13 = (id)v18;
  v23 = v18;
  v27 = *(_QWORD *)(a1 + 88);
  v20 = v5;
  v28 = *(_BYTE *)(a1 + 96);
  v21 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 80);
  v22 = v14;
  v25 = v15;
  v16 = v5;
  objc_msgSend(v12, "mediaObjectForItemProvider:completion:", v16, v19);

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_240(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "pluginPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D375F8]);

    if (v11)
    {
      objc_msgSend(v8, "pluginPayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pluginPayload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "pluginPayload");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setData:", v16);

      }
    }
    +[CKComposition composition](CKComposition, "composition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "compositionByAppendingPluginDisplayContainer:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "insertObject:atIndex:", v19, a1[8]);
    v20 = *(_QWORD *)(a1[6] + 8);
    v21 = *(_QWORD *)(v20 + 24);
    if (!v21)
    {
      v22 = *(_QWORD *)(a1[7] + 8);
      if (*(_BYTE *)(v22 + 24))
      {
        v21 = 0;
      }
      else
      {
        *(_BYTE *)(v22 + 24) = 1;
        +[CKComposition composition](CKComposition, "composition");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v24 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v32;
          do
          {
            v27 = 0;
            v28 = v23;
            do
            {
              if (*(_QWORD *)v32 != v26)
                objc_enumerationMutation(v24);
              objc_msgSend(v28, "compositionByAppendingComposition:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v27), (_QWORD)v31);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              ++v27;
              v28 = v23;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v25);
        }

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = a1[8];
            *(_DWORD *)buf = 134217984;
            v36 = v30;
            _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as Plugin Payload. Calling completion handler.", buf, 0xCu);
          }

        }
        (*(void (**)(void))(a1[4] + 16))();

        v20 = *(_QWORD *)(a1[6] + 8);
        v21 = *(_QWORD *)(v20 + 24);
      }
    }
    *(_QWORD *)(v20 + 24) = v21 - 1;

  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 *p_buf;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "insertObject:atIndex:", v7, *(_QWORD *)(a1 + 96));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(_QWORD *)(v8 + 24);
    if (!v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (*(_BYTE *)(v10 + 24))
      {
        v9 = 0;
      }
      else
      {
        *(_BYTE *)(v10 + 24) = 1;
        +[CKComposition composition](CKComposition, "composition");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v40;
          do
          {
            v23 = 0;
            v24 = v19;
            do
            {
              if (*(_QWORD *)v40 != v22)
                objc_enumerationMutation(v20);
              objc_msgSend(v24, "compositionByAppendingComposition:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              ++v23;
              v24 = v19;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v21);
        }

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = *(_QWORD *)(a1 + 96);
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v26;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as CKMediaObject. Calling completion handler.", (uint8_t *)&buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v9 = *(_QWORD *)(v8 + 24);
      }
    }
    *(_QWORD *)(v8 + 24) = v9 - 1;

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__35;
    v46 = __Block_byref_object_dispose__35;
    v47 = 0;
    v11 = *(void **)(a1 + 104);
    v12 = objc_opt_class();
    v13 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_243;
    v27[3] = &unk_1E2751498;
    v14 = *(_QWORD *)(a1 + 104);
    p_buf = &buf;
    v36 = v14;
    v28 = v13;
    v38 = *(_BYTE *)(a1 + 112);
    v33 = *(_OWORD *)(a1 + 72);
    v37 = *(_QWORD *)(a1 + 96);
    v15 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v31 = v15;
    v34 = v16;
    v29 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 88);
    v30 = v17;
    v35 = v18;
    objc_msgSend(v11, "__ck_valueForItemClass:forItemProvider:completion:", v12, v28, v27);

    _Block_object_dispose(&buf, 8);
  }

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_243(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  v4 = a2;
  v5 = *MEMORY[0x1E0CC1108];
  v6 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2_244;
  v13[3] = &unk_1E2751470;
  v24 = *(_BYTE *)(a1 + 120);
  v18 = *(_OWORD *)(a1 + 72);
  v7 = *(void **)(a1 + 104);
  v22 = *(_QWORD *)(a1 + 112);
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v17 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  v23 = *(_QWORD *)(a1 + 104);
  v19 = v9;
  v20 = v10;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 96);
  v16 = v11;
  v21 = v12;
  objc_msgSend(v7, "dataForPasteboardType:forItemProvider:completion:", v5, v6, v13);

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2_244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char v58;
  uint8_t buf[4];
  uint64_t v60;
  const __CFString *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isRichLinkImprovementsEnabled");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CC11A8], "metadataWithDataRepresentation:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          v11 = 0;
        else
          v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0;
        objc_msgSend(v9, "originalURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v10, "URL");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        if (v10)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16 && v11)
        {
          +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:](CKEmbeddedRichLinkConfiguration, "richLinkConfigurationWithURL:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:](CKBrowserItemPayload, "createBrowserItemPayloadWithRichLinkMetadata:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setPluginPayload:", v19);

          v61 = CFSTR("EmbeddedRichLinkConfiguration");
          v62[0] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_alloc(MEMORY[0x1E0CB3498]);
          v22 = (void *)objc_msgSend(v21, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v20);
          +[CKComposition composition](CKComposition, "composition");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "compositionByAppendingText:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = *(_QWORD *)(a1 + 104);
              *(_DWORD *)buf = 134217984;
              v60 = v26;
              _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as LPLinkMetadata. Calling completion handler.", buf, 0xCu);
            }

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

          goto LABEL_46;
        }

      }
    }
  }
  v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v27)
  {
    objc_msgSend(v27, "scheme");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("tel")) & 1) != 0
      || objc_msgSend(v28, "isEqualToString:", CFSTR("mailto")))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "resourceSpecifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByRemovingPercentEncoding");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(*(id *)(a1 + 112), "_attributedStringAfterPostProcessingForRichLinksForText:", v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKComposition composition](CKComposition, "composition");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "compositionByAppendingText:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "insertObject:atIndex:", v39, *(_QWORD *)(a1 + 104));
    }
    else
    {
      +[CKComposition composition](CKComposition, "composition");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
        objc_msgSend(v40, "compositionByAppendingText:", v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v40, "compositionByAppendingText:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "insertObject:atIndex:", v37, *(_QWORD *)(a1 + 104));
    }

    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v43 = *(_QWORD *)(v42 + 24);
    if (!v43)
    {
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v44 + 24))
      {
        v43 = 0;
      }
      else
      {
        *(_BYTE *)(v44 + 24) = 1;
        objc_msgSend(*(id *)(a1 + 112), "finalCompositionFromAllCompositions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = *(_QWORD *)(a1 + 104);
            *(_DWORD *)buf = 134217984;
            v60 = v47;
            _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as some form of NSURL. Calling completion handler.", buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v43 = *(_QWORD *)(v42 + 24);
      }
    }
    *(_QWORD *)(v42 + 24) = v43 - 1;

  }
  else
  {
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_252;
    v48[3] = &unk_1E2751448;
    v52 = *(_QWORD *)(a1 + 88);
    v32 = *(_QWORD *)(a1 + 104);
    v33 = *(void **)(a1 + 112);
    v53 = *(_OWORD *)(a1 + 64);
    v56 = v32;
    v57 = v33;
    v51 = *(id *)(a1 + 56);
    v49 = *(id *)(a1 + 40);
    v34 = *(id *)(a1 + 32);
    v35 = *(_QWORD *)(a1 + 80);
    v50 = v34;
    v58 = *(_BYTE *)(a1 + 120);
    v36 = *(_QWORD *)(a1 + 96);
    v54 = v35;
    v55 = v36;
    objc_msgSend(v33, "_pasteAttributedStringWithItemProvider:builderContext:completionHandler:", v30, v31, v48);

    v10 = v51;
  }
LABEL_46:

}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "insertObject:atIndex:", v5, *(_QWORD *)(a1 + 96));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(_QWORD *)(v8 + 24);
    if (!v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v10 + 24))
      {
        v9 = 0;
      }
      else
      {
        *(_BYTE *)(v10 + 24) = 1;
        objc_msgSend(*(id *)(a1 + 104), "finalCompositionFromAllCompositions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = *(_QWORD *)(a1 + 96);
            *(_DWORD *)buf = 134217984;
            v34 = v22;
            _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as NSAttributedString via _pasteAttributedStringWithItemProvider. Calling completion handler.", buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v9 = *(_QWORD *)(v8 + 24);
      }
    }
    *(_QWORD *)(v8 + 24) = v9 - 1;
  }
  else
  {
    v11 = *(void **)(a1 + 104);
    v12 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_253;
    v23[3] = &unk_1E2751420;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 80);
    v24 = v14;
    v26 = v15;
    v32 = *(_BYTE *)(a1 + 112);
    v17 = *(_QWORD *)(a1 + 96);
    v30 = *(_QWORD *)(a1 + 104);
    v31 = v17;
    v27 = *(_OWORD *)(a1 + 56);
    v28 = v16;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 88);
    v25 = v18;
    v29 = v19;
    objc_msgSend(v11, "__ck_valueForItemClass:forItemProvider:completion:", v12, v13, v23);

  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7)
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFileURL");
  if (v7
    && (v11 = v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "absoluteString"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v7, "isEqualToString:", v12) | v8 | v11,
        v12,
        (v13 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    if (*(_BYTE *)(a1 + 104))
    {
      objc_msgSend(*(id *)(a1 + 88), "_attributedStringAfterPostProcessingForRichLinksForText:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKComposition composition](CKComposition, "composition");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "compositionByAppendingText:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "insertObject:atIndex:", v24, *(_QWORD *)(a1 + 96));
    }
    else
    {
      +[CKComposition composition](CKComposition, "composition");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
        objc_msgSend(v25, "compositionByAppendingText:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v25, "compositionByAppendingText:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "insertObject:atIndex:", v22, *(_QWORD *)(a1 + 96));
    }

    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(_QWORD *)(v27 + 24);
    if (!v19)
    {
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v28 + 24))
      {
        v19 = 0;
      }
      else
      {
        *(_BYTE *)(v28 + 24) = 1;
        objc_msgSend(*(id *)(a1 + 88), "finalCompositionFromAllCompositions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = *(_QWORD *)(a1 + 96);
            v32 = 134217984;
            v33 = v31;
            _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as some form of NSString. Calling completion handler.", (uint8_t *)&v32, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v19 = *(_QWORD *)(v27 + 24);
      }
    }
    v20 = (_QWORD *)(v27 + 24);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        if (!*(_BYTE *)(v14 + 24))
        {
          *(_BYTE *)(v14 + 24) = 1;
          objc_msgSend(*(id *)(a1 + 88), "finalCompositionFromAllCompositions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = *(_QWORD *)(a1 + 96);
              v32 = 134217984;
              v33 = v17;
              _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "> Tried all types. Returning what we have for itemProvider idx={%ld}. Calling completion handler.", (uint8_t *)&v32, 0xCu);
            }

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        }
      }
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(_QWORD *)(v18 + 24);
    v20 = (_QWORD *)(v18 + 24);
    v19 = v21;
  }
  *v20 = v19 - 1;

}

+ (id)_attributedStringAfterPostProcessingForRichLinksForText:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3498];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  objc_msgSend(v5, "ck_attributedStringByPostProcessingURLTextForRichLinks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)finalCompositionFromAllCompositions:(id)a3
{
  id v3;
  void *v4;
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
  v3 = a3;
  +[CKComposition composition](CKComposition, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v10, "compositionByAppendingComposition:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)requestPluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__CKComposition_UIPasteboard__requestPluginDisplayContainerForItemProvider_completion___block_invoke;
  v9[3] = &unk_1E274F9C0;
  v7 = v6;
  v10 = v7;
  v8 = (id)objc_msgSend(v5, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.MobileSMS.PluginPayload"), v9);

}

void __87__CKComposition_UIPasteboard__requestPluginDisplayContainerForItemProvider_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v5 = 0;
  }
  else
  {
    +[CKPluginDisplayContainer unarchiveFromData:error:](CKPluginDisplayContainer, "unarchiveFromData:error:", a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)requestFilenameForType:(id)a3 forItemProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  int v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registeredTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canLoadObjectOfClass:", objc_opt_class()))
  {
    v12 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke;
    v23[3] = &unk_1E2751510;
    v24 = v10;
    v25 = v7;
    v26 = v9;
    v13 = (id)objc_msgSend(v8, "loadObjectOfClass:completionHandler:", v12, v23);

  }
  else
  {
    v14 = objc_msgSend(v11, "containsObject:", CFSTR("public.url-name"));
    v15 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v15)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v8;
          v29 = 2112;
          v30 = CFSTR("public.url-name");
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Couldn't instantiate NSString from itemProvider: %@ querying data for %@", buf, 0x16u);
        }

      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke_255;
      v19[3] = &unk_1E2751538;
      v20 = v10;
      v21 = v7;
      v22 = v9;
      v17 = (id)objc_msgSend(v8, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("public.url-name"), v19);

    }
    else
    {
      if (v15)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v8;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "No associated string data to create filename for itemProvider: %@", buf, 0xCu);
        }

      }
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }
  }

}

void __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "UTITypeForFilename:", v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (UTTypeEqual(v6, *(CFStringRef *)(a1 + 40)))
      v7 = v8;
    else
      v7 = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v5 = 0;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a2;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithData:usedEncoding:", v7, 0);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "UTITypeForFilename:", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (UTTypeEqual(v9, *(CFStringRef *)(a1 + 40)))
        v5 = v8;
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)requestCompositionFromItemProvider:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "requestCompositionFromItemProvider:builderContext:completion:", a3, 0, a4);
}

+ (void)requestCompositionFromItemProvider:(id)a3 builderContext:(id)a4 completion:(id)a5
{
  +[CKComposition requestCompositionFromItemProvider:shelfMediaObject:builderContext:completion:](CKComposition, "requestCompositionFromItemProvider:shelfMediaObject:builderContext:completion:", a3, 0, a4, a5);
}

+ (void)_requestCompositionFromItemProviderForNonCollaboration:(id)a3 builderContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void (**v42)(_QWORD);
  id obj;
  _QWORD v44[4];
  id v45;
  void (**v46)(_QWORD);
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  char v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "registeredTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "containsObject:", CFSTR("com.apple.MobileSMS.PluginPayload")))
  {
    objc_msgSend(a1, "richestMediaTypeForItemProvider:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2;
      v69[3] = &unk_1E2751588;
      v70 = v8;
      v71 = v10;
      objc_msgSend(a1, "requestMediaObjectForItemProvider:type:builderContext:completion:", v70, v12, v9, v69);

      v13 = &v70;
    }
    else
    {
      v15 = objc_msgSend(v9, "wantsInlinedRichLinks");
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isRichLinkImprovementsEnabled");

      if (v17
        && (objc_msgSend(v8, "registeredTypeIdentifiers"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = *MEMORY[0x1E0CC1108],
            v20 = objc_msgSend(v18, "containsObject:", *MEMORY[0x1E0CC1108]),
            v18,
            (v20 & v15) == 1))
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4;
        v66[3] = &unk_1E2750FE8;
        v67 = v8;
        v68 = v10;
        v21 = (id)objc_msgSend(v67, "loadDataRepresentationForTypeIdentifier:completionHandler:", v19, v66);

        v13 = &v67;
      }
      else
      {
        objc_msgSend(v8, "registeredTypeIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", CFSTR("com.apple.iCal.pasteboard.event"));

        if ((v23 & 1) != 0 || !objc_msgSend(v8, "canLoadObjectOfClass:", objc_opt_class()))
        {
          objc_msgSend(v8, "suggestedName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_32;
          objc_msgSend(v8, "suggestedName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");

          if (!v28)
            goto LABEL_32;
          objc_msgSend(v8, "suggestedName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "pathExtension");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            goto LABEL_32;
          v31 = objc_msgSend(v30, "length");

          if (!v31)
            goto LABEL_32;
          if (_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__onceToken != -1)
            dispatch_once(&_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__onceToken, &__block_literal_global_267_0);
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          obj = (id)_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes;
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
          if (v32)
          {
            v33 = *(_QWORD *)v58;
LABEL_22:
            v34 = 0;
            while (1)
            {
              if (*(_QWORD *)v58 != v33)
                objc_enumerationMutation(obj);
              v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v34);
              if ((objc_msgSend(v8, "hasItemConformingToTypeIdentifier:", v35) & 1) != 0)
                break;
              if (v32 == ++v34)
              {
                v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
                if (v32)
                  goto LABEL_22;
                goto LABEL_28;
              }
            }
            v36 = v35;

            if (v36)
              goto LABEL_31;
          }
          else
          {
LABEL_28:

          }
          objc_msgSend(v8, "suggestedName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          IMUTITypeForFilename();
          v36 = (id)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
LABEL_31:
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_268;
            v53[3] = &unk_1E2751538;
            v54 = v36;
            v55 = v8;
            v56 = v10;
            v14 = v36;
            v38 = (id)objc_msgSend(v55, "loadDataRepresentationForTypeIdentifier:completionHandler:", v14, v53);

          }
          else
          {
LABEL_32:
            v39 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_270;
            aBlock[3] = &unk_1E274DA38;
            v40 = v10;
            v52 = v40;
            v41 = v8;
            v51 = v41;
            v42 = (void (**)(_QWORD))_Block_copy(aBlock);
            v48[0] = 0;
            v48[1] = v48;
            v48[2] = 0x3032000000;
            v48[3] = __Block_byref_object_copy__35;
            v48[4] = __Block_byref_object_dispose__35;
            v49 = 0;
            if (objc_msgSend(a1, "isRTFDocumentWithItemProvider:", v41))
            {
              v44[0] = v39;
              v44[1] = 3221225472;
              v44[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_280;
              v44[3] = &unk_1E2751650;
              v47 = v48;
              v45 = v40;
              v46 = v42;
              objc_msgSend(a1, "_pasteRTFDocumentWithItemProvider:builderContext:completionHandler:", v41, v9, v44);

            }
            else
            {
              v42[2](v42);
            }
            _Block_object_dispose(v48, 8);

            v14 = v52;
          }
          goto LABEL_6;
        }
        v24 = objc_opt_class();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_264;
        v61[3] = &unk_1E27515B0;
        v65 = v15;
        v62 = v8;
        v64 = a1;
        v63 = v10;
        v25 = (id)objc_msgSend(v62, "loadObjectOfClass:completionHandler:", v24, v61);

        v13 = &v62;
      }
    }
    v14 = *v13;
LABEL_6:

    goto LABEL_7;
  }
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke;
  v72[3] = &unk_1E2751560;
  v73 = v8;
  v74 = v10;
  objc_msgSend(a1, "requestPluginDisplayContainerForItemProvider:completion:", v73, v72);

  v12 = v73;
LABEL_7:

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get pluginDisplayContainer for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(v5, "pluginPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pluginBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D375F8]);

    if (v12)
    {
      objc_msgSend(v5, "pluginPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pluginPayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attachments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v5, "pluginPayload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setData:", v17);

      }
    }
    if (v5)
    {
      +[CKComposition compositionWithPluginDisplayContainer:subject:](CKComposition, "compositionWithPluginDisplayContainer:subject:", v5, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_256;
      v22[3] = &unk_1E274DA38;
      v20 = *(id *)(a1 + 40);
      v23 = v19;
      v24 = v20;
      v21 = v19;
      dispatch_async(MEMORY[0x1E0C80D38], v22);

    }
  }

}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CKComposition *v14;
  id v15;
  CKComposition *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  CKComposition *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v11;
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Failed to get mediaObject for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else if (objc_msgSend(v8, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
    v14 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v13, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_257;
    block[3] = &unk_1E274DA38;
    v15 = *(id *)(a1 + 40);
    v30 = v14;
    v31 = v15;
    v16 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.messages.audioMessage")))
    {
      +[CKComposition audioCompositionWithMediaObject:](CKComposition, "audioCompositionWithMediaObject:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_260;
      v26[3] = &unk_1E274DA38;
      v18 = *(id *)(a1 + 40);
      v27 = v17;
      v28 = v18;
      v19 = v17;
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
    else
    {
      +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v7, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3;
      v23[3] = &unk_1E274DA38;
      v21 = *(id *)(a1 + 40);
      v24 = v20;
      v25 = v21;
      v22 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], v23);

    }
  }

}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_260(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  CKComposition *v20;
  id v21;
  CKComposition *v22;
  _QWORD v23[4];
  CKComposition *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v8;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get LPLinkMetadata representation (as NSData) for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CC11A8], "metadataWithDataRepresentation:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v10, "URL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:](CKEmbeddedRichLinkConfiguration, "richLinkConfigurationWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:](CKBrowserItemPayload, "createBrowserItemPayloadWithRichLinkMetadata:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPluginPayload:", v16);

    v26 = CFSTR("EmbeddedRichLinkConfiguration");
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = (void *)objc_msgSend(v18, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v17);
    v20 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v19, 0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_261;
    v23[3] = &unk_1E274DA38;
    v21 = *(id *)(a1 + 40);
    v24 = v20;
    v25 = v21;
    v22 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_261(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_264(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKComposition *v15;
  CKComposition *v16;
  CKComposition *v17;
  id v18;
  CKComposition *v19;
  _QWORD v20[4];
  CKComposition *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v10 = v5;
    objc_msgSend(v10, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("tel")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("mailto")))
    {
      objc_msgSend(v10, "resourceSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByRemovingPercentEncoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "_attributedStringAfterPostProcessingForRichLinksForText:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = [CKComposition alloc];
    }
    else
    {
      v16 = [CKComposition alloc];
      if (!objc_msgSend(v13, "length"))
      {
        v17 = -[CKComposition initWithText:subject:](v16, "initWithText:subject:", 0, 0);
        goto LABEL_16;
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
      v15 = v16;
    }
    v17 = -[CKComposition initWithText:subject:](v15, "initWithText:subject:", v14, 0);

LABEL_16:
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_265;
    v20[3] = &unk_1E274DA38;
    v18 = *(id *)(a1 + 40);
    v21 = v17;
    v22 = v18;
    v19 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get url for itemProvider: %@, error: %@", buf, 0x16u);

    }
  }
LABEL_17:

}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_266()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC628], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes;
  _requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes = v7;

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_268(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = a1[5];
        objc_msgSend(v7, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Failed to get file data for provider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_269;
    v11[3] = &unk_1E274CF80;
    v12 = v5;
    v13 = a1[4];
    v14 = a1[5];
    v15 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_269(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "suggestedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v3, v4, v5, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_270(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v2 = MEMORY[0x1E0C809B0];
  v35 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_271;
  aBlock[3] = &unk_1E2751628;
  v30 = *(id *)(a1 + 40);
  v3 = _Block_copy(aBlock);
  v4 = *(void **)(a1 + 32);
  v5 = (void *)*MEMORY[0x1E0CEC4E8];
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v6);

  v7 = *(void **)(a1 + 32);
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v2;
    v26[1] = 3221225472;
    v26[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_6;
    v26[3] = &unk_1E2750FE8;
    v27 = *(id *)(a1 + 32);
    v28 = v3;
    v9 = (id)objc_msgSend(v7, "loadDataRepresentationForTypeIdentifier:completionHandler:", v8, v26);

  }
  else
  {
    v10 = objc_msgSend(v7, "canLoadObjectOfClass:", objc_opt_class());
    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      v12 = objc_opt_class();
      v23[0] = v2;
      v23[1] = 3221225472;
      v23[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_277;
      v23[3] = &unk_1E2750FC0;
      v24 = *(id *)(a1 + 32);
      v25 = v3;
      v13 = (id)objc_msgSend(v11, "loadObjectOfClass:completionHandler:", v12, v23);

    }
    else if (objc_msgSend(v11, "canLoadObjectOfClass:", objc_opt_class()))
    {
      v14 = *(void **)(a1 + 32);
      v15 = objc_opt_class();
      v20[0] = v2;
      v20[1] = 3221225472;
      v20[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_278;
      v20[3] = &unk_1E2750FC0;
      v21 = *(id *)(a1 + 32);
      v22 = *(id *)(a1 + 40);
      v16 = (id)objc_msgSend(v14, "loadObjectOfClass:completionHandler:", v15, v20);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v18, "registeredTypeIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v18;
        v33 = 2112;
        v34 = v19;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "MobileSMS could not accept itemProvider: %@  registeredTypes: %@", buf, 0x16u);

      }
    }
  }

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_271(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_272;
  v5[3] = &unk_1E274DE68;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  +[CKComposition requestMediaObjectsForAttributedString:completion:](CKComposition, "requestMediaObjectsForAttributedString:completion:", v4, v5);

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_272(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];

  v3 = a2;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__35;
  v18[4] = __Block_byref_object_dispose__35;
  v19 = 0;
  +[CKComposition composition](CKComposition, "composition");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "length");
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_273;
  v12[3] = &unk_1E27515D8;
  v15 = v20;
  v17 = v4;
  v8 = v3;
  v13 = v8;
  v16 = v18;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v12);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5;
  block[3] = &unk_1E2751600;
  v10 = *(id *)(a1 + 40);
  v11 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_273(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = objc_msgSend(v19, "length");
    if (v14)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v19);
    else
      v15 = 0;
    objc_msgSend(v13, "compositionByAppendingText:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    if (v14)
    goto LABEL_10;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "compositionByAppendingMediaObject:");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_10:

  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get attributed string for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    v13 = *MEMORY[0x1E0DC1118];
    v14 = *MEMORY[0x1E0DC1188];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithData:options:documentAttributes:error:", v5, v11, 0, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get attributed string for itemProvider: %@, error: %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  CKComposition *v11;
  void *v12;
  CKComposition *v13;
  id v14;
  CKComposition *v15;
  _QWORD v16[4];
  CKComposition *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to get string for itemProvider: %@, error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v5;
      v11 = [CKComposition alloc];
      if (objc_msgSend(v10, "length"))
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
        v13 = -[CKComposition initWithText:subject:](v11, "initWithText:subject:", v12, 0);

      }
      else
      {
        v13 = -[CKComposition initWithText:subject:](v11, "initWithText:subject:", 0, 0);
      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_279;
      v16[3] = &unk_1E274DA38;
      v14 = *(id *)(a1 + 40);
      v17 = v13;
      v18 = v14;
      v15 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], v16);

    }
  }

}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_280(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "hasContent"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_281;
    v7[3] = &unk_1E2751600;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_281(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (void)requestCompositionFromItemProvider:(id)a3 shelfMediaObject:(id)a4 builderContext:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke;
  v11[3] = &unk_1E2750D18;
  v12 = v9;
  v10 = v9;
  objc_msgSend(a1, "createPluginPayloadCompositionFromItemProvider:builderContext:shareOptions:completionHandler:", a3, a5, 0, v11);

}

void __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke_2;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)requestCompositionFromItemProviders:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[4];
  _QWORD v18[3];
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__35;
  v22[4] = __Block_byref_object_dispose__35;
  v23 = 0;
  +[CKComposition composition](CKComposition, "composition");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke;
  block[3] = &unk_1E2751600;
  v10 = v7;
  v20 = v10;
  v21 = v22;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    dispatch_group_enter(v8);
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_4;
    v13[3] = &unk_1E27516C8;
    v14 = v6;
    v16 = v22;
    v15 = v8;
    objc_msgSend(a1, "requestCompositionFromItemProvider:completion:", v12, v13);
    v11 = &v14;

  }
  else
  {
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_2;
    v17[3] = &unk_1E27516A0;
    v18[0] = v8;
    v18[1] = v22;
    v18[2] = a1;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
    v11 = (id *)v18;
  }

  dispatch_group_leave(v8);
  _Block_object_dispose(v22, 8);

}

uint64_t __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_3;
  v8[3] = &unk_1E2751678;
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v5, "_requestCompositionFromItemProviderForNonCollaboration:builderContext:completion:", v4, 0, v8);

}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "compositionByAppendingComposition:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v4, "collaborationShareOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "compositionWithCollaborationShareOptions:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.messages.audioMessage"));

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v4)
  {
    v6 = v15;
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 40), "compositionByAppendingComposition:", v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v15, "collaborationShareOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compositionWithCollaborationShareOptions:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (id)richestMediaTypeForItemProvider:(id)a3
{
  id v4;
  CKMultiDict *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __CFString *v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  CKMultiDict *v21;
  void *v22;
  CKMultiDict *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  CKMultiDict *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  CKMultiDict *v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v4 = a3;
  v5 = objc_alloc_init(CKMultiDict);
  objc_msgSend(v4, "registeredTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__35;
  v48 = __Block_byref_object_dispose__35;
  v49 = 0;
  if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.sticker.mediaPayload")) & 1) == 0)
  {
    if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.sticker")))
    {
      v9 = (void *)*MEMORY[0x1E0CEC590];
      objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "containsObject:", v10);

      if (v11)
      {
        objc_msgSend(v9, "identifier");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    MEMORY[0x193FF3E1C]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v12))
    {
      v13 = v12;
LABEL_8:
      v8 = v13;
LABEL_17:

      goto LABEL_18;
    }
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.live-photo-bundle")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.live-photo-bundle");
      goto LABEL_17;
    }
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.private.live-photo-bundle")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.private.live-photo-bundle");
      goto LABEL_17;
    }
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.photos.object-reference.asset")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.photos.object-reference.asset");
      goto LABEL_17;
    }
    if ((objc_msgSend(v6, "containsObject:", CFSTR("com.apple.mapkit.map-item")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.mapkit.map-item");
      goto LABEL_17;
    }
    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0CEC570];
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if (v18)
    {
      objc_msgSend(v16, "identifier");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.messages.maputi")))
    {
      v13 = CFSTR("com.apple.messages.maputi");
      goto LABEL_8;
    }
    v19 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke;
    v40[3] = &unk_1E2750DB8;
    v43 = a1;
    v20 = v7;
    v41 = v20;
    v21 = v5;
    v42 = v21;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v40);
    if (!-[CKMultiDict count](v21, "count"))
    {
LABEL_29:
      v8 = (__CFString *)(id)v45[5];

      goto LABEL_17;
    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v39 = 0;
    objc_msgSend(v20, "classes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_2;
    v33[3] = &unk_1E2750DE0;
    v23 = v21;
    v34 = v23;
    v35 = &v36;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v33);
    -[CKMultiDict objectsForKey:](v23, "objectsForKey:", v37[3]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v37[3];
    if (v25 == objc_opt_class())
    {
      v32[0] = v19;
      v32[1] = 3221225472;
      v32[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_3;
      v32[3] = &unk_1E274B9A0;
      v32[4] = &v44;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v32);
      if (v45[5])
        goto LABEL_28;
      objc_msgSend(v24, "lastObject");
      v28 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v45[5];
      v45[5] = v28;
    }
    else
    {
      objc_msgSend((id)v37[3], "UTITypes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_4;
      v29[3] = &unk_1E274A258;
      v30 = v24;
      v31 = &v44;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v29);

      v27 = v30;
    }

LABEL_28:
    _Block_object_dispose(&v36, 8);
    goto LABEL_29;
  }
  v8 = CFSTR("com.apple.sticker.mediaPayload");
LABEL_18:
  _Block_object_dispose(&v44, 8);

  return v8;
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(a1[6], "_shouldCreateMediaObjectForUTIType:"))
    objc_msgSend(a1[5], "pushObject:forKey:", v3, objc_msgSend(a1[4], "classForUTIType:", v3));

}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "peekObjectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  id v8;

  v8 = a2;
  if ((CKUTTypeIsDynamic(v8, v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)_temporaryURLFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__35;
    v29 = __Block_byref_object_dispose__35;
    v30 = 0;
    v5 = v3;
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUbiquitousItemAtURL:", v5);

    if (v7)
    {
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
      v24 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__CKComposition_UIPasteboard___temporaryURLFromURL___block_invoke;
      v20[3] = &unk_1E27516F0;
      v21 = 0;
      v23 = &v25;
      v10 = v8;
      v22 = v10;
      objc_msgSend(v9, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 0, &v24, v20);
      v11 = v24;
      dispatch_group_wait(v10, 0xDF8475800uLL);

    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v26[5], "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "im_randomTemporaryFileURLWithFileName:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __52__CKComposition_UIPasteboard___temporaryURLFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Failed to coordinate reading for ubiquitous item: %@", (uint8_t *)&v7, 0xCu);

      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (void)mediaObjectFromItemAtURL:(id)a3 filename:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  void (**v22)(id, _QWORD, void *);
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(a1, "_temporaryURLFromURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    v23 = 0;
    objc_msgSend(v12, "copyItemAtURL:toURL:error:", v8, v11, &v23);
    v14 = v23;
    if (v14)
    {
      v15 = v14;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Failed copying item to temp location for media object creation: %@", buf, 0xCu);
        }

      }
      v10[2](v10, 0, v15);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__CKComposition_UIPasteboard__mediaObjectFromItemAtURL_filename_completion___block_invoke;
      block[3] = &unk_1E2751308;
      v19 = v11;
      v20 = v9;
      v22 = v10;
      v21 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v15 = v19;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Failed to generate a tempURL from a pasteboard item url %@", buf, 0xCu);
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.Messages.CKComposition_UIPasteBoard"), 0, 0);
    v10[2](v10, 0, v15);
  }

}

void __76__CKComposition_UIPasteboard__mediaObjectFromItemAtURL_filename_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKRemoteItemForSending *v13;

  v13 = -[CKRemoteItemForSending initWithAttachmentURL:description:blockOnPreviewCreation:]([CKRemoteItemForSending alloc], "initWithAttachmentURL:description:blockOnPreviewCreation:", *(_QWORD *)(a1 + 32), 0, 0);
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRemoteItemForSending attachmentURL](v13, "attachmentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v3, *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRemoteItemForSending appendedVideoURL](v13, "appendedVideoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CKRemoteItemForSending appendedVideoURL](v13, "appendedVideoURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKGetTmpPathForAppendedVideoURL(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRemoteItemForSending appendedVideoURL](v13, "appendedVideoURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKLinkAndCreateAppendedVideoTransfer(v10, v11, v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

+ (void)mediaObjectFromPhotosAsset:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, id);
  _QWORD *v20;
  id v21;
  id v22;
  _QWORD v23[3];
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v24 = objc_msgSend(v6, "playbackStyle");
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", v6, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Error creating PHAssetExportRequest: %@", buf, 0xCu);

      }
    }
    v7[2](v7, 0, v9);
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CD1418]);
    objc_msgSend(v12, "setVariant:", 1);
    objc_msgSend(v12, "setShouldBundleComplexAssetResources:", 1);
    if (_os_feature_enabled_impl()
      && objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Lockdown mode is enabled. Excluding location and caption metadata by default.", buf, 2u);
        }

      }
      v14 = 1;
      v15 = 1;
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.photos.shareddefaults"));
      v15 = objc_msgSend(v16, "BOOLForKey:", CFSTR("ExcludeLocationWhenSharing"));
      if ((_DWORD)v15 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Photos prefs excludes location when sharing. Excluding location metadata by default.", buf, 2u);
        }

      }
      v14 = 0;
    }
    objc_msgSend(v12, "setShouldStripLocation:", v15);
    objc_msgSend(v12, "setShouldStripCaption:", v14);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__CKComposition_UIPasteboard__mediaObjectFromPhotosAsset_completion___block_invoke;
    v18[3] = &unk_1E2751718;
    v20 = v23;
    v21 = a1;
    v19 = v7;
    objc_msgSend(v8, "exportWithOptions:completionHandler:", v12, v18);

  }
  _Block_object_dispose(v23, 8);

}

void __69__CKComposition_UIPasteboard__mediaObjectFromPhotosAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (v7 == 3)
      {
        objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1898]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          goto LABEL_16;
      }
      goto LABEL_9;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1890]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD18B8]);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD1888]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_6:
    v9 = v8;
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CD18B0]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v10 = v9;

  if (v10)
  {
LABEL_16:
    objc_msgSend(*(id *)(a1 + 48), "mediaObjectFromItemAtURL:filename:completion:", v10, 0, *(_QWORD *)(a1 + 32));

    goto LABEL_17;
  }
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Unable to deterine URL from fileURLS: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_17:

}

+ (void)requestMediaObjectForItemProvider:(id)a3 type:(id)a4 builderContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void (**v41)(void);
  id v42;
  id v43;
  _QWORD block[4];
  void (**v45)(void);
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD aBlock[4];
  id v76;
  id v77;
  id v78;
  id v79;
  uint8_t buf[4];
  const __CFString *v81;
  __int16 v82;
  const __CFString *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v10 = a4;
  v42 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "requestMediaObjectForItemProvider", buf, 2u);
    }

  }
  if (v10)
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke;
    aBlock[3] = &unk_1E2751740;
    v40 = v13;
    v76 = v40;
    v15 = v10;
    v77 = v15;
    v16 = v43;
    v78 = v16;
    v17 = v11;
    v79 = v17;
    v18 = _Block_copy(aBlock);
    v70[0] = v14;
    v70[1] = 3221225472;
    v70[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_316;
    v70[3] = &unk_1E274CFF8;
    v19 = v16;
    v71 = v19;
    v20 = v15;
    v72 = v20;
    v74 = a1;
    v21 = v18;
    v73 = v21;
    v41 = (void (**)(void))_Block_copy(v70);
    MEMORY[0x193FF3E1C]();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqualToString:", v22);

    if ((v23 & 1) != 0
      || (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.live-photo-bundle")) & 1) != 0
      || objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.private.live-photo-bundle")))
    {
      v68[0] = v14;
      v68[1] = 3221225472;
      v68[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_8;
      v68[3] = &unk_1E2751290;
      v69 = v17;
      v24 = (id)objc_msgSend(v19, "loadFileRepresentationForTypeIdentifier:completionHandler:", v20, v68);

    }
    else
    {
      if (!objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.sticker.mediaPayload")))
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v20, "isEqualToString:", v27);

        if (v28)
        {
          IMLogHandleForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Loading string representation of dragged item, e.g. for an emoji sticker inserted as text after dragging to the entry view", buf, 2u);
          }

          v63[0] = v14;
          v63[1] = 3221225472;
          v63[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_326;
          v63[3] = &unk_1E274F9C0;
          v64 = v17;
          v30 = (id)objc_msgSend(v19, "loadDataRepresentationForTypeIdentifier:completionHandler:", v20, v63);

          goto LABEL_10;
        }
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mapkit.map-item")))
        {
          if (!MEMORY[0x193FF3C18](CFSTR("MKMapItem"), CFSTR("MapKit")))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v81 = CFSTR("MKMapItem");
                v82 = 2112;
                v83 = CFSTR("MapKit");
                _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
              }

            }
            goto LABEL_10;
          }
          if (objc_msgSend(v19, "canLoadObjectOfClass:", objc_opt_class()))
          {
            v31 = objc_opt_class();
            v59[0] = v14;
            v59[1] = 3221225472;
            v59[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_331;
            v59[3] = &unk_1E2751880;
            v60 = v19;
            v61 = v20;
            v62 = v21;
            v32 = (id)objc_msgSend(v60, "loadObjectOfClass:completionHandler:", v31, v59);

            goto LABEL_10;
          }
        }
        else
        {
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.messages.maputi")))
          {
            v56[0] = v14;
            v56[1] = 3221225472;
            v56[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4_335;
            v56[3] = &unk_1E27518A8;
            v57 = v17;
            v58 = v21;
            objc_msgSend(v19, "__ck_loadDataForAppleMapVCard:", v56);

            goto LABEL_10;
          }
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.finder.node")))
          {
            v52[0] = v14;
            v52[1] = 3221225472;
            v52[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_338;
            v52[3] = &unk_1E27518D0;
            v53 = v19;
            v55 = a1;
            v54 = v17;
            v33 = (id)objc_msgSend(v53, "loadDataRepresentationForTypeIdentifier:completionHandler:", v20, v52);

            goto LABEL_10;
          }
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.photos.object-reference.asset")))
          {
            v49[0] = v14;
            v49[1] = 3221225472;
            v49[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_340;
            v49[3] = &unk_1E27518F8;
            v50 = v17;
            v51 = a1;
            v35 = (id)objc_msgSend(v19, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.photos.object-reference.asset"), v49);

            goto LABEL_10;
          }
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("public.file-url")))
          {
            v36 = objc_opt_class();
            v46[0] = v14;
            v46[1] = 3221225472;
            v46[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_345;
            v46[3] = &unk_1E2751920;
            v48 = a1;
            v47 = v17;
            v37 = (id)objc_msgSend(v19, "loadObjectOfClass:completionHandler:", v36, v46);

            goto LABEL_10;
          }
          if (!objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.drawing")))
          {
            if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.pkpass")))
            {
              block[0] = v14;
              block[1] = 3221225472;
              block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_351;
              block[3] = &unk_1E274AED0;
              v45 = v41;
              dispatch_async(MEMORY[0x1E0C80D38], block);

            }
            else
            {
              v41[2]();
            }
            goto LABEL_10;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Ignoring .drawing file", buf, 2u);
            }

          }
        }
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 0, 0, 0);
        goto LABEL_10;
      }
      v25 = MEMORY[0x193FF3C18](CFSTR("_MSMessageMediaPayload"), CFSTR("Messages"));
      v65[0] = v14;
      v65[1] = 3221225472;
      v65[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_10;
      v65[3] = &unk_1E2751830;
      v67 = v17;
      v66 = v42;
      v26 = (id)objc_msgSend(v19, "loadObjectOfClass:completionHandler:", v25, v65);

    }
LABEL_10:

    goto LABEL_46;
  }
  IMLogHandleForCategory();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    +[CKComposition(UIPasteboard) requestMediaObjectForItemProvider:type:builderContext:completion:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
LABEL_46:

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", a2, *(_QWORD *)(a1 + 40), a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2;
    v8[3] = &unk_1E2750FE8;
    v9 = v4;
    v10 = *(id *)(a1 + 56);
    v7 = (id)objc_msgSend(v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.MobileSMS.appendedURL"), v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v15, 0xCu);
      }

    }
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v15, 0xCu);
        }

      }
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CKGetTmpPathForAppendedVideoURL(v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "transferGUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CKLinkAndCreateAppendedVideoTransfer(v13, v10, v14);

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_316(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_317;
  v5[3] = &unk_1E27517E0;
  v9 = *(_QWORD *)(a1 + 56);
  v6 = v2;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v4 = (id)objc_msgSend(v3, "loadDataRepresentationForTypeIdentifier:completionHandler:", v6, v5);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_317(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3;
  block[3] = &unk_1E27517B8;
  v11 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4;
  v5[3] = &unk_1E2751790;
  v4 = *(void **)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "requestFilenameForType:forItemProvider:completion:", v2, v3, v5);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_5;
    block[3] = &unk_1E274CF30;
    v4 = &v15;
    v15 = *(id *)(a1 + 56);
    v5 = &v13;
    v13 = *(id *)(a1 + 32);
    v14 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_6;
    v9[3] = &unk_1E2751768;
    v4 = &v11;
    v11 = *(id *)(a1 + 56);
    v5 = &v10;
    v10 = *(id *)(a1 + 32);
    v8 = (id)objc_msgSend(v6, "loadFileRepresentationForTypeIdentifier:completionHandler:", v7, v9);
  }

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_7;
  block[3] = &unk_1E274CF30;
  v8 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_9;
  v3[3] = &unk_1E2751808;
  v4 = *(id *)(a1 + 32);
  +[CKComposition mediaObjectFromItemAtURL:filename:completion:](CKComposition, "mediaObjectFromItemAtURL:filename:completion:", a2, 0, v3);

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11;
  block[3] = &unk_1E27509A0;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "stickerStoreIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3
      || (+[CKStickersFrameworkInterface uiStickerWithIdentifier:](CKStickersFrameworkInterface, "uiStickerWithIdentifier:", v3), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_3();

      objc_msgSend(MEMORY[0x1E0D39B18], "stickerWithMSMessageMediaPayload:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uiSticker");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "_ck_plainStringEmojiText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_2();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "conversationSupportsInlineAdaptiveImageGlyphs");
      v11 = objc_msgSend(v4, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v10 && v11)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Handling sticker drag to entry view as adaptive image glyph", buf, 2u);
        }

        __ck_UIStickerCreateAdaptiveImageGlyphFromSticker();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Handling sticker drag to entry view as sticker added to shelf", v18, 2u);
        }

        v14 = 0;
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B18]), "initWithUISticker:adaptiveImageGlyph:", v4, v14);
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaObjectWithSticker:stickerUserInfo:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_326(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_331(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "_vCardRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_vCardFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_332;
  v12[3] = &unk_1E2751858;
  v8 = *(id *)(a1 + 48);
  v14 = v5;
  v15 = v8;
  v13 = v4;
  v9 = v5;
  v10 = v4;
  v11 = (id)objc_msgSend(v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", v7, v12);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_332(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_333;
  block[3] = &unk_1E274CF30;
  v5 = a1[6];
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_333(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4_335(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v7 && !v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failed to load apple map vCard with error: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_338(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suggestedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByRemovingPercentEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_339;
  v10[3] = &unk_1E2751808;
  v9 = *(void **)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "mediaObjectFromItemAtURL:filename:completion:", v6, v7, v10);

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_339(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_340(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithPlistData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("localIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CD1390];
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAssetsWithLocalIdentifiers:options:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_344;
      v16[3] = &unk_1E2751808;
      v13 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v13, "mediaObjectFromPhotosAsset:completion:", v12, v16);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v8;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Failed to fetch asset with identifier: %@", buf, 0xCu);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Local identifier for photo asset not found in item provider dictionary", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_344(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_345(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_346;
    v11[3] = &unk_1E2751808;
    v9 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v9, "mediaObjectFromItemAtURL:filename:completion:", v5, v8, v11);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Failed to fetch URL with error: %@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_351(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)requestMediaObjectsForAttributedString:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  _QWORD *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v5 = a3;
  v6 = a4;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__35;
  v22[4] = __Block_byref_object_dispose__35;
  v23 = 0;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke;
  block[3] = &unk_1E2751600;
  v10 = v6;
  v20 = v10;
  v21 = v22;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);
  v11 = objc_msgSend(v5, "length");
  v12 = *MEMORY[0x1E0DC10F8];
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_2;
  v15[3] = &unk_1E2751970;
  v13 = v8;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  v18 = v22;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v15);
  dispatch_group_leave(v13);

  _Block_object_dispose(v22, 8);
}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_3;
    v6[3] = &unk_1E2751948;
    v7 = *(id *)(a1 + 40);
    v8 = v4;
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fileWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regularFileContents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fileWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v4, v5, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)evaluateSendMetricsWithConversation:(id)a3 shareSheetHostBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  id *v25;
  void *v26;
  char v27;
  id *v28;
  id v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  char v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  _QWORD *v56;
  _QWORD *v57;
  int v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  CKComposition *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[4];
  _QWORD v105[4];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  -[CKComposition mediaObjects](self, "mediaObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "mediaObjectFromPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v9, "addObject:", v14);
    }
    else
    {
      objc_msgSend(v13, "__ck_photoCompositionMediaObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
        objc_msgSend(v9, "addObjectsFromArray:", v15);

    }
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v97 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "metricsCollectorMediaType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    }
    while (v18);
  }

  v22 = (id)*MEMORY[0x1E0D38658];
  v82 = v16;
  if (CKIsRunningInMessagesViewService())
  {
    v23 = (id)*MEMORY[0x1E0D38680];

    IMBiomeQueue();
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v24, &__block_literal_global_137);

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
    {
      v25 = (id *)MEMORY[0x1E0D38688];
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
        goto LABEL_33;
      v25 = (id *)MEMORY[0x1E0D38690];
    }
    v29 = *v25;
  }
  else
  {
    if (!v10)
    {
      v23 = v22;
      goto LABEL_33;
    }
    objc_msgSend(v10, "pluginBundleID");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) != 0
      || (IMBalloonExtensionIDWithSuffix(),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v23, "isEqualToString:", v26),
          v26,
          (v27 & 1) != 0))
    {
      v28 = (id *)MEMORY[0x1E0D38678];
    }
    else
    {
      v30 = objc_msgSend(v23, "hasSuffix:", *MEMORY[0x1E0D37600]);
      v28 = (id *)MEMORY[0x1E0D38670];
      if (v30)
        v28 = (id *)MEMORY[0x1E0D38660];
    }
    v29 = *v28;

  }
  v23 = v29;
LABEL_33:
  v91 = v23;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(v7, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
  v83 = v6;
  if (!v32)
  {
LABEL_45:

    goto LABEL_46;
  }
  v33 = v32;
  v79 = self;
  v80 = v13;
  v81 = v10;
  v89 = v7;
  v34 = 0;
  v35 = *(_QWORD *)v93;
  v36 = *MEMORY[0x1E0D386C8];
  v84 = *MEMORY[0x1E0D386D8];
  v88 = *MEMORY[0x1E0D38648];
  v87 = *MEMORY[0x1E0D38638];
  v37 = *MEMORY[0x1E0D38650];
  obj = v31;
  v86 = *MEMORY[0x1E0D38668];
  do
  {
    for (j = 0; j != v33; ++j)
    {
      if (*(_QWORD *)v93 != v35)
        objc_enumerationMutation(obj);
      v39 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
      v40 = objc_msgSend(v89, "countForObject:", v39);
      if ((objc_msgSend(v39, "isEqualToString:", v36) & 1) != 0
        || objc_msgSend(v39, "isEqualToString:", v84))
      {
        v34 += v40;
      }
      v41 = objc_msgSend(v90, "recipientCount");
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v39;
      v104[0] = CFSTR("type");
      v104[1] = v87;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = v43;
      v104[2] = v37;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v104[3] = v86;
      v105[2] = v44;
      v105[3] = v91;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "trackEvent:withDictionary:", v88, v45);

    }
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
  }
  while (v33);

  v7 = v89;
  v13 = v80;
  v10 = v81;
  self = v79;
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = *MEMORY[0x1E0D38640];
    v102[0] = CFSTR("type");
    v102[1] = v87;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v86;
    v103[1] = v46;
    v103[2] = v91;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trackEvent:withDictionary:", v88, v47);

    goto LABEL_45;
  }
LABEL_46:
  if (v10)
  {
    objc_msgSend(v10, "pluginBundleID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "containsString:", *MEMORY[0x1E0D375D0]);

    v50 = v49 ^ 1;
    if (!v13)
      goto LABEL_60;
  }
  else
  {
    v50 = 1;
    if (!v13)
      goto LABEL_60;
  }
  if (objc_msgSend(v13, "shouldSendAsMediaObject"))
  {
    if ((objc_msgSend(v13, "isSticker") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "trackEvent:", *MEMORY[0x1E0D389A0]);

    }
    objc_msgSend(v13, "mediaObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "needsAnimation");
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v13, "isSticker");
    v56 = (_QWORD *)MEMORY[0x1E0D38998];
    if (!v53)
      v56 = (_QWORD *)MEMORY[0x1E0D389C0];
    v57 = (_QWORD *)MEMORY[0x1E0D38990];
    if (!v53)
      v57 = (_QWORD *)MEMORY[0x1E0D389B8];
    if (!v55)
      v56 = v57;
    objc_msgSend(v54, "trackEvent:", *v56);

    goto LABEL_64;
  }
LABEL_60:
  if ((v50 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v10, "isUpdate");
    v59 = (_QWORD *)MEMORY[0x1E0D389C8];
    if (!v58)
      v59 = (_QWORD *)MEMORY[0x1E0D389A8];
    objc_msgSend(v52, "trackEvent:", *v59);
LABEL_64:

  }
  v60 = v13;
  if (v10)
  {
    objc_msgSend(v10, "pluginBundleID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v10, "pluginBundleID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonBundleIDFromExtensionID();
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63 && objc_msgSend(v63, "hasPrefix:", CFSTR("com.apple.")))
      {
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D38788]);
        if (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0D375F8]))
        {
          objc_msgSend(v10, "url");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "host");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(&unk_1E286F808, "containsObject:", v66))
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D38780]);

        }
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "trackEvent:withDictionary:", *MEMORY[0x1E0D389E8], v64);

      }
    }
  }
  MainBundle = CFBundleGetMainBundle();
  Identifier = CFBundleGetIdentifier(MainBundle);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = *MEMORY[0x1E0D388F0];
  v72 = *MEMORY[0x1E0D38A58];
  v101[0] = Identifier;
  v73 = *MEMORY[0x1E0D38A60];
  v100[0] = v72;
  v100[1] = v73;
  v74 = (void *)MEMORY[0x1E0CB37E8];
  -[CKComposition text](self, "text");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "numberWithLong:", objc_msgSend(v75, "length"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v76;
  v100[2] = *MEMORY[0x1E0D38A68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v90, "recipientCount"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v77;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trackEvent:withDictionary:", v71, v78);

}

void __93__CKComposition_Metrics__evaluateSendMetricsWithConversation_shareSheetHostBundleIdentifier___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D027B8], "discoverabilitySignal");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "source");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_alloc(MEMORY[0x1E0D02618]);
  v2 = (void *)objc_msgSend(v1, "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.MobileSMS.shared-via-sharesheet"), CFSTR("com.apple.MobileSMS"), 0, MEMORY[0x1E0C9AA70]);
  objc_msgSend(v3, "sendEvent:", v2);

}

- (BOOL)isPlainTextEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CKComposition text](self, "text");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "string");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v37 = 0;
        v32 = 0;
        v13 = 0;
        goto LABEL_10;
      }
      v32 = (void *)v11;
    }
    objc_msgSend(v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v5))
    {
      v14 = 0;
      goto LABEL_19;
    }
    v37 = v10;
    v30 = v12;
    v13 = 1;
LABEL_10:
    objc_msgSend(v8, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    if (!v16)
    {
      -[CKComposition subject](self, "subject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "string");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v28 = 0;
        v14 = 1;
        goto LABEL_16;
      }
      v27 = v17;
    }
    objc_msgSend(v8, "subject", v27);
    v34 = v9;
    v35 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v33 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition subject](self, "subject");
    v20 = v16;
    v21 = v15;
    v22 = v5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "string");
    v24 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "isEqual:", v25);

    v13 = v24;
    v5 = v22;
    v15 = v21;
    v16 = v20;

    v4 = v33;
    v9 = v34;
    v3 = v35;
    if (v20)
    {
LABEL_17:

      v10 = v37;
      if (!v13)
      {
        v8 = v36;
        if (v37)
          goto LABEL_21;
        goto LABEL_20;
      }
      v12 = v30;
      v8 = v36;
LABEL_19:

      if (v10)
      {
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:

      goto LABEL_21;
    }
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)hasNotBeenEdited:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpressiveTextEnabled");

  if (v6)
  {
    -[CKComposition text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToAttributedString:", v8);

  }
  else
  {
    v9 = -[CKComposition isPlainTextEqual:](self, "isPlainTextEqual:", v4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  objc_super v33;

  -[CKComposition mediaObjects](self, "mediaObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v4;
  v29 = (void *)MEMORY[0x1E0CB3940];
  v33.receiver = self;
  v33.super_class = (Class)CKComposition;
  -[CKComposition description](&v33, sel_description);
  v32 = objc_claimAutoreleasedReturnValue();
  -[CKComposition text](self, "text");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
    v6 = CFSTR("something");
  else
    v6 = CFSTR("nothing");
  v26 = v6;
  -[CKComposition subject](self, "subject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "length"))
    v7 = CFSTR("something");
  else
    v7 = CFSTR("nothing");
  v25 = v7;
  -[CKComposition bizIntent](self, "bizIntent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
    v8 = CFSTR("something");
  else
    v8 = CFSTR("nothing");
  v24 = v8;
  -[CKComposition shelfMediaObject](self, "shelfMediaObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v9 = CFSTR("something");
  else
    v9 = CFSTR("nothing");
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("something");
  else
    v11 = CFSTR("nothing");
  -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("something");
  else
    v13 = CFSTR("nothing");
  -[CKComposition proofreadingInfo](self, "proofreadingInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    v15 = CFSTR("something");
  else
    v15 = CFSTR("nothing");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "powerLevels");
    v23 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
      v17 = CFSTR("something");
    else
      v17 = CFSTR("nothing");
    v21 = v13;
    v18 = (void *)v32;
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ text: %@ subject: %@ bizIntent: %@, shelfMediaObject:%@, shelfPluginPayload:%@, collaborationShareOptions: %@ proofreadingInfo: %@ powerLevels: %@"), v32, v26, v25, v24, v9, v11, v21, v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
  }
  else
  {
    v22 = v13;
    v18 = (void *)v32;
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ text: %@ subject: %@ bizIntent: %@, shelfMediaObject:%@, shelfPluginPayload:%@, collaborationShareOptions: %@ proofreadingInfo: %@ powerLevels: %@"), v32, v26, v25, v24, v9, v11, v22, v15, CFSTR("nothing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;
  NSObject *v40;
  const char *v41;
  uint8_t v43[16];

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (-[CKComposition text](self, "text"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition text](self, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {

        if ((v10 & 1) != 0)
          goto LABEL_6;
      }
      else
      {

        if ((v10 & 1) != 0)
          goto LABEL_6;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_70;
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_WORD *)v43 = 0;
      v41 = "composition text is not equal";
      goto LABEL_68;
    }
LABEL_6:
    objc_msgSend(v6, "subject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (-[CKComposition subject](self, "subject"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "subject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition subject](self, "subject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {

        if ((v14 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

        if ((v14 & 1) != 0)
          goto LABEL_10;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_70;
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_WORD *)v43 = 0;
      v41 = "composition subject is not equal";
      goto LABEL_68;
    }
LABEL_10:
    objc_msgSend(v6, "shelfPluginPayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (-[CKComposition shelfPluginPayload](self, "shelfPluginPayload"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "shelfPluginPayload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (v15)
      {

        if ((v18 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

        if ((v18 & 1) != 0)
          goto LABEL_14;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_70;
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_WORD *)v43 = 0;
      v41 = "composition shelfPluginPayload is not equal";
      goto LABEL_68;
    }
LABEL_14:
    objc_msgSend(v6, "bizIntent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (-[CKComposition bizIntent](self, "bizIntent"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "bizIntent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition bizIntent](self, "bizIntent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v19)
      {

        if ((v22 & 1) != 0)
          goto LABEL_18;
      }
      else
      {

        if ((v22 & 1) != 0)
          goto LABEL_18;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_70;
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_WORD *)v43 = 0;
      v41 = "composition bizIntent is not equal";
      goto LABEL_68;
    }
LABEL_18:
    objc_msgSend(v6, "shelfMediaObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23
      || (-[CKComposition shelfMediaObject](self, "shelfMediaObject"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "shelfMediaObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposition shelfMediaObject](self, "shelfMediaObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (v23)
      {

        if ((v26 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

        if ((v26 & 1) != 0)
          goto LABEL_22;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_70;
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_WORD *)v43 = 0;
      v41 = "composition shelfMediaObject is not equal";
      goto LABEL_68;
    }
LABEL_22:
    objc_msgSend(v6, "proofreadingInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      -[CKComposition proofreadingInfo](self, "proofreadingInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_26;
    }
    objc_msgSend(v6, "proofreadingInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition proofreadingInfo](self, "proofreadingInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (v27)
    {

      if ((v30 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

      if ((v30 & 1) != 0)
      {
LABEL_26:
        objc_msgSend(v6, "collaborationShareOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
LABEL_30:
            objc_msgSend(v6, "sendLaterPluginInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
            {
              -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v3)
                goto LABEL_34;
            }
            objc_msgSend(v6, "sendLaterPluginInfo");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "isEqual:", v37);

            if (v35)
            {

              if ((v38 & 1) != 0)
              {
LABEL_34:
                v39 = 1;
LABEL_71:

                goto LABEL_72;
              }
            }
            else
            {

              if ((v38 & 1) != 0)
                goto LABEL_34;
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v43 = 0;
                v41 = "composition sendLaterPluginInfo is not equal";
                goto LABEL_68;
              }
LABEL_69:

            }
LABEL_70:
            v39 = 0;
            goto LABEL_71;
          }
        }
        objc_msgSend(v6, "collaborationShareOptions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if (v31)
        {

          if ((v34 & 1) != 0)
            goto LABEL_30;
        }
        else
        {

          if ((v34 & 1) != 0)
            goto LABEL_30;
        }
        if (!IMOSLoggingEnabled())
          goto LABEL_70;
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          goto LABEL_69;
        *(_WORD *)v43 = 0;
        v41 = "composition collaborationShareOptions are not equal";
LABEL_68:
        _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, v41, v43, 2u);
        goto LABEL_69;
      }
    }
    if (!IMOSLoggingEnabled())
      goto LABEL_70;
    OSLogHandleForIMFoundationCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      goto LABEL_69;
    *(_WORD *)v43 = 0;
    v41 = "composition proofreadingInfo is not equal";
    goto LABEL_68;
  }
  v39 = 0;
LABEL_72:

  return v39;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[CKComposition text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CKComposition subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CKComposition bizIntent](self, "bizIntent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "hash");
  -[CKComposition shelfMediaObject](self, "shelfMediaObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[CKComposition collaborationShareOptions](self, "collaborationShareOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 + objc_msgSend(v13, "hash");
  -[CKComposition proofreadingInfo](self, "proofreadingInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 + v14 + objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isAudioComposition
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

+ (id)composition
{
  return -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", 0, 0);
}

+ (Class)_LPSharedObjectMetadataClass
{
  if (_LPSharedObjectMetadataClass_onceToken != -1)
    dispatch_once(&_LPSharedObjectMetadataClass_onceToken, &__block_literal_global_274);
  return (Class)(id)_LPSharedObjectMetadataClass___LPSharedObjectMetadataClass;
}

uint64_t __45__CKComposition__LPSharedObjectMetadataClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("LPSharedObjectMetadata"), CFSTR("LinkPresentation"));
  _LPSharedObjectMetadataClass___LPSharedObjectMetadataClass = result;
  return result;
}

+ (CKComposition)compositionWithShelfPluginPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  dispatch_queue_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  CKComposition *result;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  char v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[4];
  NSObject *v91;
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t *v95;
  _QWORD v96[4];
  id v97;
  NSObject *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  _QWORD block[4];
  NSObject *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  _QWORD aBlock[4];
  id v116;
  id v117;
  uint8_t buf[4];
  id v119;
  __int16 v120;
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v8, "startTimingForKey:", CFSTR("totalTimeInMethod"));
  objc_msgSend(v8, "startTimingForKey:", CFSTR("beforeCompletionHandler"));
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke;
  aBlock[3] = &unk_1E275A9B8;
  v10 = v8;
  v116 = v10;
  v11 = v7;
  v117 = v11;
  v12 = _Block_copy(aBlock);
  objc_msgSend(v10, "startTimingForKey:", CFSTR("_compositionWithShelfPluginPayload"));
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__83;
  v113 = __Block_byref_object_dispose__83;
  v114 = 0;
  objc_msgSend(a1, "_compositionWithShelfPluginPayload:", v6);
  v114 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopTimingForKey:", CFSTR("_compositionWithShelfPluginPayload"));
  if (!v110[5])
  {
    v14 = dispatch_semaphore_create(0);
    v100 = 0;
    v101 = &v100;
    v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__83;
    v104 = __Block_byref_object_dispose__83;
    v105 = 0;
    objc_msgSend(v6, "url");
    v105 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v101[5], "isFileURL"))
    {
      objc_msgSend(v10, "startTimingForKey:", CFSTR("BRShareCopyShareURLOperation"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Starting BRShareCopyShareURLOperation", buf, 2u);
        }

      }
      v16 = objc_alloc(MEMORY[0x1E0D10EF8]);
      v17 = (void *)objc_msgSend(v16, "initWithFileURL:documentType:", v101[5], *MEMORY[0x1E0CA5C90]);
      v96[0] = v9;
      v96[1] = 3221225472;
      v96[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_113;
      v96[3] = &unk_1E275A9E0;
      v99 = &v100;
      v97 = v10;
      v98 = v14;
      objc_msgSend(v17, "setCopyShareURLCompletionBlock:", v96);
      v18 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v18, "setMaxConcurrentOperationCount:", 1);
      objc_msgSend(v18, "addOperation:", v17);

    }
    v90[0] = v9;
    v90[1] = 3221225472;
    v90[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_117;
    v90[3] = &unk_1E275AA08;
    v94 = &v100;
    v13 = v14;
    v91 = v13;
    v72 = v10;
    v92 = v72;
    v95 = &v109;
    v93 = v12;
    v74 = _Block_copy(v90);
    v19 = (void *)MEMORY[0x1E0CC11D8];
    objc_msgSend(v6, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "linkWithDataRepresentationWithoutSubstitutingAttachments:", v20);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "payloadCollaborationType") == 3)
    {
      v75 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
      v21 = objc_alloc_init(+[CKComposition _LPSharedObjectMetadataClass](CKComposition, "_LPSharedObjectMetadataClass"));
      if (v21)
      {
        objc_msgSend(v72, "startTimingForKey:", CFSTR("IMPayloadCollaborationTypePendingCollaboration"));
        objc_msgSend(v6, "collaborationMetadata");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitle:", v23);

        objc_msgSend(v21, "setIsCollaboration:", objc_msgSend(v6, "sendAsCopy") ^ 1);
        v24 = dispatch_queue_create("com.apple.ChatKit.CKComposition.CollaborationHandshakeBundleID", 0);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8830]), "initWithTargetSerialQueue:synchronous:", v24, 1);
        objc_msgSend(v6, "collaborationMetadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = v9;
        v83[1] = 3221225472;
        v83[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_3;
        v83[3] = &unk_1E275AA30;
        v84 = v21;
        v85 = v75;
        v86 = v72;
        v89 = v74;
        v87 = v73;
        v88 = v6;
        objc_msgSend(v25, "verifySourceBundleIdentifierFromMetadata:timeout:completion:", v26, v83, 5.0);

      }
      else
      {
        (*((void (**)(void *, id, void *, id))v74 + 2))(v74, v75, v73, v6);
      }

      goto LABEL_52;
    }
    if (objc_msgSend(v6, "payloadCollaborationType") != 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Starting startFetchingMetadataForURL", buf, 2u);
        }

      }
      objc_msgSend(v72, "startTimingForKey:", CFSTR("startFetchingMetadataForURL"));
      v40 = objc_alloc_init(MEMORY[0x1E0CC11E0]);
      objc_msgSend(v6, "url");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "startAccessingSecurityScopedResource");

      v76[0] = v9;
      v76[1] = 3221225472;
      v76[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_149;
      v76[3] = &unk_1E2756280;
      v77 = v40;
      v78 = v6;
      v82 = v42;
      v79 = v73;
      v80 = v72;
      v81 = v74;
      v75 = v40;
      dispatch_async(MEMORY[0x1E0C80D38], v76);

      goto LABEL_52;
    }
    objc_msgSend(v6, "cloudKitShare");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Obtaining metadata for LP from CKShare", buf, 2u);
      }

    }
    if (!v75)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v6;
          _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "Failed to obtain a CKShare from the plugin payload: %@", buf, 0xCu);
        }

      }
      goto LABEL_52;
    }
    objc_msgSend(v72, "startTimingForKey:", CFSTR("IMPayloadCollaborationTypeCloudKit"));
    v28 = objc_alloc_init(MEMORY[0x1E0CC1248]);
    objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTitle:", v29);

    objc_msgSend(v6, "containerSetupInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "containerOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "applicationBundleIdentifierOverrideForContainerAccess");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v71, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "Failed to get a bundleID from pluginPayload", buf, 2u);
        }

      }
LABEL_49:
      objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A78]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v54, CFSTR("image/png"));
        objc_msgSend(v28, "setIcon:", v55);

        goto LABEL_51;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v71;
          _os_log_impl(&dword_18DFCD000, v60, OS_LOG_TYPE_INFO, "Falling back to using App Icon for bundleIdentifier:%@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v71, "length"))
      {
        if ((objc_msgSend(v71, "containsString:", CFSTR("com.apple.")) & 1) == 0)
        {
          v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v71);
          v62 = objc_alloc(MEMORY[0x1E0D3A830]);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "thumbnailSizeForAppIconInCollaborationLinks");
          v68 = (void *)objc_msgSend(v62, "initWithSize:scale:");

          objc_msgSend(v70, "prepareImageForDescriptor:", v68);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_alloc(MEMORY[0x1E0CC1178]);
          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", objc_msgSend(v64, "CGImage"));
          v67 = (void *)objc_msgSend(v65, "initWithPlatformImage:", v66);
          objc_msgSend(v28, "setIcon:", v67);

          goto LABEL_51;
        }
        if (!IMOSLoggingEnabled())
        {
LABEL_51:
          v56 = objc_alloc_init(MEMORY[0x1E0CC1200]);
          objc_msgSend(v56, "setSpecialization:", v28);
          objc_msgSend(v56, "setIsCollaboration:", objc_msgSend(v6, "sendAsCopy") ^ 1);
          v57 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
          objc_msgSend(v6, "url");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setOriginalURL:", v58);

          objc_msgSend(v57, "setSpecialization:", v56);
          objc_msgSend(v72, "stopTimingForKey:", CFSTR("IMPayloadCollaborationTypeCloudKit"));
          (*((void (**)(void *, id, void *, id))v74 + 2))(v74, v57, v73, v6);

LABEL_52:
          _Block_object_dispose(&v100, 8);

          goto LABEL_53;
        }
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v119 = v71;
          _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "Not defaulting an icon for %@. Please file a radar!", buf, 0xCu);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_51;
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "Failed to set icon on LP since we failed to get a bundleID", buf, 2u);
        }
      }

      goto LABEL_51;
    }
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v71, 1, 0);
    objc_msgSend(v32, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v32, "URL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bundleWithURL:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "infoDictionary");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setApplication:", v37);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v119 = v37;
            v120 = 2112;
            v121 = v71;
            _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Setting application to:%@ for bundleIdentifier: %@", buf, 0x16u);
          }

        }
LABEL_48:

        goto LABEL_49;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        +[CKComposition compositionWithShelfPluginPayload:completionHandler:].cold.1((uint64_t)v32, v45, v46, v47, v48, v49, v50, v51);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v32, "URL");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v119 = v53;
        _os_log_impl(&dword_18DFCD000, v52, OS_LOG_TYPE_INFO, "Failed to get a bundle from appRecord.URL: %@", buf, 0xCu);

      }
    }
    goto LABEL_48;
  }
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_109;
  block[3] = &unk_1E2751600;
  v107 = v12;
  v108 = &v109;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v13 = v107;
LABEL_53:

  _Block_object_dispose(&v109, 8);
  return result;
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("beforeCompletionHandler"));
  objc_msgSend(*(id *)(a1 + 32), "startTimingForKey:", CFSTR("completionHandler"));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("completionHandler"));
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("totalTimeInMethod"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "-[CKComposition compositionWithShelfPluginPayload:competionHandler:] perf timer: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

uint64_t __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKComposition_Collaboration failed to get url with error: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("BRShareCopyShareURLOperation"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Finished BRShareCopyShareURLOperation", (uint8_t *)&v13, 2u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_117(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKComposition *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v9 = a3;
  v10 = a2;
  if (objc_msgSend(v8, "isFileURL"))
  {
    v11 = *(NSObject **)(a1 + 32);
    v12 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v11, v12);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "startTimingForKey:", CFSTR("updateCollaborationMetadata"));
    objc_msgSend(v7, "collaborationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatedCollaborationMetadataAppBundleIDsWithSharingURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCollaborationMetadata:", v14);

    objc_msgSend(*(id *)(a1 + 40), "stopTimingForKey:", CFSTR("updateCollaborationMetadata"));
  }
  objc_msgSend(v7, "collaborationMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCollaborationMetadata:", v15);

  objc_msgSend(v9, "setMetadata:", v10);
  objc_msgSend(v9, "dataRepresentationWithOutOfLineAttachments:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setData:", v16);
  v17 = -[CKComposition initWithText:subject:shelfPluginPayload:shelfMediaObject:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:shelfMediaObject:", 0, 0, v7, 0);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2;
  v22[3] = &unk_1E2751600;
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 64);
  v23 = v20;
  v24 = v21;
  dispatch_async(MEMORY[0x1E0C80D38], v22);

}

uint64_t __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "length");
  v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v5;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Obtaining app name and icon for 3rd party collaboration using bundle ID: %@", (uint8_t *)&v21, 0xCu);
      }

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
    objc_msgSend(v10, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v5);
    v13 = objc_alloc(MEMORY[0x1E0D3A830]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "thumbnailSizeForAppIconInCollaborationLinks");
    v15 = (void *)objc_msgSend(v13, "initWithSize:scale:");

    objc_msgSend(v12, "prepareImageForDescriptor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0CC1178]);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", objc_msgSend(v16, "CGImage"));
    v19 = (void *)objc_msgSend(v17, "initWithPlatformImage:", v18);
    objc_msgSend(*(id *)(a1 + 32), "setIcon:", v19);

  }
  else if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Failed to obtain app name and icon for 3rd party collaboration. Error from bundle ID lookup: %@", (uint8_t *)&v21, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setSpecialization:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "stopTimingForKey:", CFSTR("IMPayloadCollaborationTypePendingCollaboration"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_149(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2_150;
  v4[3] = &unk_1E275AA58;
  v9 = *(_BYTE *)(a1 + 72);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "startFetchingMetadataForURL:completionHandler:", v3, v4);

}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  }
  v8 = objc_alloc_init(+[CKComposition _LPSharedObjectMetadataClass](CKComposition, "_LPSharedObjectMetadataClass"));
  if (v8)
  {
    objc_msgSend(v5, "specialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpecialization:", v9);

    objc_msgSend(v8, "setIsCollaboration:", objc_msgSend(*(id *)(a1 + 32), "sendAsCopy") ^ 1);
    objc_msgSend(v5, "setSpecialization:", v8);
  }
  else
  {
    objc_msgSend(v5, "setCollaborationType:", 2);
    objc_msgSend(*(id *)(a1 + 40), "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "specialization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpecialization:", v11);

  }
  objc_msgSend(*(id *)(a1 + 48), "stopTimingForKey:", CFSTR("startFetchingMetadataForURL"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Finished startFetchingMetadataForURL", v13, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (id)_compositionWithShelfPluginPayload:(id)a3
{
  id v3;
  CKComposition *v4;
  void *v5;
  id v6;
  CKComposition *v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  CKComposition *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsCollaboration") & 1) == 0)
  {
    objc_msgSend(v3, "__ck_urlFromTextBodyForRichLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "shouldSendAsMediaObject"))
    {
      v6 = (id)objc_msgSend(v3, "mediaObjectFromPayload");
      v7 = [CKComposition alloc];
      v8 = 0;
      v9 = v3;
    }
    else
    {
      if ((objc_msgSend(v3, "shouldSendAsRichLink") & 1) != 0 || v5)
      {
        if (!v5)
        {
          objc_msgSend(v3, "url");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)objc_msgSend(v3, "copy");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setMessageGUID:", v14);

        objc_msgSend(v5, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          v16 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v5, "absoluteString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithString:", v17);
          objc_msgSend(v13, "setText:", v18);

        }
        else
        {
          objc_msgSend(v13, "setText:", 0);
        }

        objc_msgSend(v13, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
        objc_msgSend(v13, "setUrl:", v5);
        v4 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", 0, 0, v13);

        goto LABEL_18;
      }
      v11 = objc_msgSend(v3, "shouldSendAsText");
      v12 = [CKComposition alloc];
      objc_msgSend(v3, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v8 = v5;
      if (!v11)
      {
        v10 = -[CKComposition initWithText:subject:shelfPluginPayload:shelfMediaObject:](v12, "initWithText:subject:shelfPluginPayload:shelfMediaObject:", v5, 0, v3, 0);
        goto LABEL_6;
      }
      v9 = 0;
    }
    v10 = -[CKComposition initWithText:subject:shelfPluginPayload:](v7, "initWithText:subject:shelfPluginPayload:", v8, 0, v9);
LABEL_6:
    v4 = (CKComposition *)v10;
LABEL_18:

    goto LABEL_19;
  }
  v4 = 0;
LABEL_19:

  return v4;
}

+ (CKComposition)compositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CKComposition *v13;
  CKComposition *result;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  CKComposition *v23;

  v9 = a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__83;
  v22 = __Block_byref_object_dispose__83;
  v23 = 0;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", v12, v11, v10);

  v23 = v13;
  if (v19[5])
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__CKComposition_compositionWithText_subject_shelfPluginPayload_completionHandler___block_invoke;
    v15[3] = &unk_1E2751600;
    v16 = v9;
    v17 = &v18;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
  _Block_object_dispose(&v18, 8);

  return result;
}

uint64_t __82__CKComposition_compositionWithText_subject_shelfPluginPayload_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

+ (CKComposition)compositionWithMSMessage:(id)a3 appExtensionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "teamID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("0000000000");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(v7, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v6;
  v15 = v14;

  v16 = *MEMORY[0x1E0D375D0];
  objc_msgSend((id)*MEMORY[0x1E0D375D0], "stringByAppendingFormat:", CFSTR(":%@:%@"), v11, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "balloonPluginForBundleID:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v20, "isEqualToString:", v16);

  if ((_DWORD)v16)
  {
    v21 = objc_alloc(MEMORY[0x1E0D35750]);
    objc_msgSend(v19, "pluginBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithPluginBundle:pluginKitProxy:extension:", v22, v7, 0);

    v19 = (void *)v23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "adamID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "browserDisplayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v19, "dataSourceClass");
    objc_msgSend(v19, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pluginPayloadFromMessagePayload:appIconData:appName:adamID:allowDataPayloads:", v5, v27, v25, v24, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setIsFromMe:", 1);
    objc_msgSend(v19, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPluginBundleID:", v29);

    +[CKComposition _compositionWithShelfPluginPayload:](CKComposition, "_compositionWithShelfPluginPayload:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }

  return (CKComposition *)v30;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKComposition *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (CKComposition *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", v13, v12, v11, v10, 0, 0);

  return v14;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 proofreadingInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CKComposition *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CKComposition;
  v20 = -[CKComposition init](&v30, sel_init);
  if (v20)
  {
    if (objc_msgSend(v14, "length"))
      v21 = v14;
    else
      v21 = 0;
    -[CKComposition setText:](v20, "setText:", v21);
    if (objc_msgSend(v15, "length"))
      v22 = v15;
    else
      v22 = 0;
    -[CKComposition setSubject:](v20, "setSubject:", v22);
    -[CKComposition setShelfPluginPayload:](v20, "setShelfPluginPayload:", v16);
    v23 = (void *)objc_msgSend(v17, "copy");
    if (objc_msgSend(v23, "count"))
    {
      v24 = (void *)objc_msgSend(v17, "copy");
      -[CKComposition setBizIntent:](v20, "setBizIntent:", v24);

    }
    else
    {
      -[CKComposition setBizIntent:](v20, "setBizIntent:", 0);
    }

    -[CKComposition setShelfMediaObject:](v20, "setShelfMediaObject:", v18);
    -[CKComposition setProofreadingInfo:](v20, "setProofreadingInfo:", v19);
    if (v16)
    {
      objc_msgSend(v16, "collaborationMetadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userSelectedShareOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26
        || (objc_msgSend(v16, "collaborationMetadata"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v27, "defaultShareOptions"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27,
            v26))
      {
        -[CKComposition setCollaborationShareOptions:](v20, "setCollaborationShareOptions:", v26);
        objc_msgSend(v26, "optionsGroups");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposition setCollaborationOptions:](v20, "setCollaborationOptions:", v28);

      }
    }
  }

  return v20;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5
{
  return -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:](self, "initWithText:subject:shelfPluginPayload:bizIntent:", a3, a4, a5, 0);
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6
{
  return -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:](self, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", a3, a4, a5, 0, a6, 0);
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4
{
  return -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:](self, "initWithText:subject:shelfPluginPayload:bizIntent:", a3, a4, 0, 0);
}

- (BOOL)hasContent
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[CKComposition text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[CKComposition subject](self, "subject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (IMPluginPayload)firstEmbeddedPluginPayload
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__83;
  v11 = __Block_byref_object_dispose__83;
  v12 = 0;
  -[CKComposition text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CKComposition_firstEmbeddedPluginPayload__block_invoke;
  v6[3] = &unk_1E275AA80;
  v6[4] = &v7;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("EmbeddedRichLinkConfiguration"), 0, v3, 0, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (IMPluginPayload *)v4;
}

void __43__CKComposition_firstEmbeddedPluginPayload__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a2)
  {
    objc_msgSend(a2, "pluginPayload");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (BOOL)_compositionTextBeginsWithEmbeddedPluginAttachment
{
  void *v2;
  uint64_t v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CKComposition text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__CKComposition__compositionTextBeginsWithEmbeddedPluginAttachment__block_invoke;
  v6[3] = &unk_1E27508F0;
  v6[4] = &v7;
  objc_msgSend(v2, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v6);
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__CKComposition__compositionTextBeginsWithEmbeddedPluginAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *a5 = 1;

}

- (BOOL)hasNonwhiteSpaceContent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  if (-[CKComposition hasContent](self, "hasContent"))
  {
    -[CKComposition text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "__ck_containsOnlyCharactersFromSet:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)compositionByReplacingText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CKComposition isExpirableComposition](self, "isExpirableComposition");
  v5 = objc_alloc((Class)objc_opt_class());
  -[CKComposition subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition bizIntent](self, "bizIntent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfMediaObject](self, "shelfMediaObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition proofreadingInfo](self, "proofreadingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", v4, v6, v7, v8, v9, v10);

  -[CKComposition expressiveSendStyleID](self, "expressiveSendStyleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExpressiveSendStyleID:", v12);

  objc_msgSend(v11, "setShouldHideClearPluginButton:", -[CKComposition shouldHideClearPluginButton](self, "shouldHideClearPluginButton"));
  -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSendLaterPluginInfo:", v13);

  return v11;
}

- (id)_compositionByAppendingText:(id)a3 isExpirable:(BOOL)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CKComposition *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  char v24;
  void *v25;
  objc_class *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v38;
  int v39;
  int v40;
  void *v41;
  id v42;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v9 || v10 || v11)
  {
    -[CKComposition text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      if (v9)
      {
        v42 = (id)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v9, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v16, "characterAtIndex:", 0);

        if (objc_msgSend(v15, "length"))
        {
          objc_msgSend(v15, "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v15, "length") - 1) == 10;

        }
        else
        {
          v38 = 0;
        }
        v40 = objc_msgSend(v9, "__ck_isOnlyAdaptiveImageGlyphs");
        if (objc_msgSend(v15, "length"))
        {
          objc_msgSend(v15, "attributesAtIndex:effectiveRange:", objc_msgSend(v15, "length") - 1, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = (void *)MEMORY[0x1E0C9AA70];
        }
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = v40;
        if (v19)
          v22 = 0;
        v23 = v22 == 1 && (v20 | v21) == 0;
        v24 = v39 == 10 || v38;
        if ((v24 & 1) == 0 && !v23)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
          objc_msgSend(v42, "appendAttributedString:", v25);

        }
        objc_msgSend(v42, "appendAttributedString:", v9);

      }
      else
      {
        v42 = v14;
      }
    }
    else
    {
      v42 = v9;
    }
    -[CKComposition isExpirableComposition](self, "isExpirableComposition");
    v26 = (objc_class *)objc_opt_class();
    -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v28 = v10;

      v27 = v28;
    }
    -[CKComposition shelfMediaObject](self, "shelfMediaObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v12;
    if (v12)
    {
      v30 = v12;

      v29 = v30;
    }
    v31 = [v26 alloc];
    -[CKComposition subject](self, "subject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition bizIntent](self, "bizIntent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition proofreadingInfo](self, "proofreadingInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (CKComposition *)objc_msgSend(v31, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", v42, v32, v27, v33, v29, v34);

    -[CKComposition expressiveSendStyleID](self, "expressiveSendStyleID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition setExpressiveSendStyleID:](v13, "setExpressiveSendStyleID:", v35);

    -[CKComposition setShouldHideClearPluginButton:](v13, "setShouldHideClearPluginButton:", -[CKComposition shouldHideClearPluginButton](self, "shouldHideClearPluginButton"));
    -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition setSendLaterPluginInfo:](v13, "setSendLaterPluginInfo:", v36);

    v12 = v41;
  }
  else
  {
    v13 = self;
  }

  return v13;
}

- (id)compositionByAppendingText:(id)a3
{
  return -[CKComposition _compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:](self, "_compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:", a3, 0, 0, 0);
}

- (id)compositionByAppendingComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition _compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:](self, "_compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:", v5, objc_msgSend(v4, "isExpirableComposition"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isExpirableComposition");
  objc_msgSend(v4, "shelfPluginPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfMediaObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (CKComposition)compositionWithShelfMediaObject:(id)a3
{
  id v3;
  CKComposition *v4;

  v3 = a3;
  v4 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", 0, 0, 0, 0, v3, 0);

  return v4;
}

+ (id)compositionForTUConversationActivity:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  CKBrowserItemPayload *v21;
  void *v22;
  CKComposition *v23;
  void *v24;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  v5 = objc_alloc_init(MEMORY[0x1E0CC11F8]);
  objc_msgSend(v3, "concatenatedMetadataDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v3, "concatenatedMetadataDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v8);

  }
  objc_msgSend(v3, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationBundleIdentifier:", v9);

  objc_msgSend(v3, "localizedApplicationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "setApplication:", v10);
  }
  else
  {
    objc_msgSend(v3, "fallbackApplicationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setApplication:", v11);

  }
  objc_msgSend(v3, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v3, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v17);
      objc_msgSend(v5, "setIcon:", v18);

    }
  }
  objc_msgSend(v4, "setSpecialization:", v5);
  v19 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
  objc_msgSend(v19, "setMetadata:", v4);
  objc_msgSend(v19, "dataRepresentationWithOutOfLineAttachments:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(CKBrowserItemPayload);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserItemPayload setMessageGUID:](v21, "setMessageGUID:", v22);

  -[CKBrowserItemPayload setPluginBundleID:](v21, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
  -[CKBrowserItemPayload setData:](v21, "setData:", v20);
  v23 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", 0, 0, v21);
  -[CKComposition shelfPluginPayload](v23, "shelfPluginPayload");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setGroupActivity:", v3);

  return v23;
}

- (BOOL)isSendAnimated
{
  void *v3;
  void *v4;
  char v5;

  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  v5 = objc_msgSend(v4, "useDirectSend") ^ 1;
  return v5;
}

- (BOOL)isSaveable
{
  return 1;
}

- (Class)balloonViewClass
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;

  -[CKComposition mediaObjects](self, "mediaObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKComposition mediaObjects](self, "mediaObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    switch(objc_msgSend(v6, "mediaType"))
    {
      case 1u:
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "isRichAudioMessagesEnabled");

        goto LABEL_30;
      case 2u:
      case 3u:
        objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isFeatureEnabled");

        if (v17 && (objc_msgSend(v6, "commSafetySensitive") != 1 || objc_msgSend(v6, "isFromMe")))
          objc_msgSend(v6, "commSafetySensitive");
        goto LABEL_30;
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 0xBu:
        goto LABEL_30;
      default:

        goto LABEL_25;
    }
  }
  -[CKComposition pluginDisplayContainers](self, "pluginDisplayContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    goto LABEL_4;
  -[CKComposition text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_25:
      v9 = 0;
      return (Class)v9;
    }
    v6 = v19;
    objc_msgSend(v19, "pluginBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) == 0)
    {
      objc_msgSend(v6, "pluginBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "isEqualToString:", v22))
      {
        objc_msgSend(v6, "mediaObjectFromPayload");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          goto LABEL_30;
LABEL_21:
        objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isFeatureEnabled");

        if (v24)
        {
          objc_msgSend(v6, "mediaObjectFromPayload");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "commSafetySensitive") == 1)
          {
            objc_msgSend(v6, "mediaObjectFromPayload");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isFromMe");

            if (!v27)
              goto LABEL_30;
          }
          else
          {

          }
          objc_msgSend(v6, "mediaObjectFromPayload");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "commSafetySensitive");

        }
LABEL_30:
        objc_opt_class();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        return (Class)v9;
      }

    }
    goto LABEL_21;
  }
  -[CKComposition subject](self, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13
    || (-[CKComposition text](self, "text"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "__ck_bigEmojiStyle"),
        v14,
        (unint64_t)(v15 - 1) > 2))
  {
    -[CKComposition _compositionTextBeginsWithEmbeddedPluginAttachment](self, "_compositionTextBeginsWithEmbeddedPluginAttachment");
  }
LABEL_4:
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return (Class)v9;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSAttributedString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (IMPluginPayload)shelfPluginPayload
{
  return self->_shelfPluginPayload;
}

- (void)setShelfPluginPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (void)setExpressiveSendStyleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CKMediaObject)shelfMediaObject
{
  return self->_shelfMediaObject;
}

- (void)setShelfMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_shelfMediaObject, a3);
}

- (_SWCollaborationShareOptions)collaborationShareOptions
{
  return self->_collaborationShareOptions;
}

- (void)setCollaborationShareOptions:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationShareOptions, a3);
}

- (NSArray)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationOptions, a3);
}

- (NSString)sourceApplicationID
{
  return self->_sourceApplicationID;
}

- (void)setSourceApplicationID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationID, a3);
}

- (NSString)firstMessageGUIDOverride
{
  return self->_firstMessageGUIDOverride;
}

- (void)setFirstMessageGUIDOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (void)setGroupActivity:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivity, a3);
}

- (BOOL)hasFailedCommSafetyCheck
{
  return self->_hasFailedCommSafetyCheck;
}

- (void)setHasFailedCommSafetyCheck:(BOOL)a3
{
  self->_hasFailedCommSafetyCheck = a3;
}

- (BOOL)hasCheckedCommSafety
{
  return self->_hasCheckedCommSafety;
}

- (void)setHasCheckedCommSafety:(BOOL)a3
{
  self->_hasCheckedCommSafety = a3;
}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  return self->_sendLaterPluginInfo;
}

- (void)setSendLaterPluginInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sendLaterPluginInfo, a3);
}

- (BOOL)isFromExternalSource
{
  return self->_isFromExternalSource;
}

- (void)setIsFromExternalSource:(BOOL)a3
{
  self->_isFromExternalSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendLaterPluginInfo, 0);
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_firstMessageGUIDOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationID, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_collaborationShareOptions, 0);
  objc_storeStrong((id *)&self->_shelfMediaObject, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_shelfPluginPayload, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (CKComposition)compositionWithPluginDisplayContainer:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CKComposition *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v12 = CFSTR("PluginDisplayContainer");
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v7);

  }
  else
  {
    v9 = 0;
  }
  v10 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v9, v6);

  return v10;
}

- (id)compositionByAppendingPluginDisplayContainer:(id)a3
{
  void *v4;
  void *v5;

  +[CKComposition compositionWithPluginDisplayContainer:subject:](CKComposition, "compositionWithPluginDisplayContainer:subject:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition compositionByAppendingComposition:](self, "compositionByAppendingComposition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CKComposition)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  const __CFString **v9;
  void *v10;
  id v11;
  void *v12;
  CKComposition *v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = CFSTR("AdaptiveImageGlyphMediaObject");
    v18[0] = v5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (id *)v18;
    v9 = &v17;
  }
  else
  {
    if (!v5)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v15 = CFSTR("MediaObjectForTextAttachment");
    v16 = v5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v16;
    v9 = &v15;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = (void *)objc_msgSend(v11, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v10);

LABEL_6:
  v13 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v12, v6);

  return v13;
}

+ (CKComposition)compositionWithMediaObjects:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  CKComposition *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", 0, v5);

  -[CKComposition compositionByAppendingMediaObjects:](v7, "compositionByAppendingMediaObjects:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKComposition *)v8;
}

- (id)compositionByAppendingMediaObject:(id)a3
{
  void *v4;
  void *v5;

  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition compositionByAppendingComposition:](self, "compositionByAppendingComposition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)compositionByAppendingMediaObjects:(id)a3
{
  id v4;
  CKComposition *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKComposition *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[CKComposition compositionByAppendingMediaObject:](v10, "compositionByAppendingMediaObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v5 = (CKComposition *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)compositionByReplacingMediaObject:(id)a3 withMediaObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CKComposition *v18;
  void *v19;
  void *v20;
  CKComposition *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  -[CKComposition text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke;
  v30[3] = &unk_1E275AAA8;
  v12 = v6;
  v31 = v12;
  v13 = v10;
  v32 = v13;
  v14 = v7;
  v33 = v14;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("MediaObjectForTextAttachment"), 0, v9, 0, v30);
  v23 = v11;
  v24 = 3221225472;
  v25 = __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke_2;
  v26 = &unk_1E275AAD0;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("AdaptiveImageGlyphMediaObject"), 0, v9, 0, &v23);
  v18 = [CKComposition alloc];
  -[CKComposition subject](self, "subject", v23, v24, v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CKComposition initWithText:subject:shelfPluginPayload:](v18, "initWithText:subject:shelfPluginPayload:", v16, v19, v20);

  return v21;
}

uint64_t __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)(result + 32) == a2)
    return objc_msgSend(*(id *)(result + 40), "addAttribute:value:range:", CFSTR("MediaObjectForTextAttachment"), *(_QWORD *)(result + 48), a3, a4);
  return result;
}

uint64_t __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)(result + 32) == a2)
    return objc_msgSend(*(id *)(result + 40), "addAttribute:value:range:", CFSTR("AdaptiveImageGlyphMediaObject"), *(_QWORD *)(result + 48), a3, a4);
  return result;
}

- (id)compositionByRemovingMediaObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  CKComposition *v10;
  void *v11;
  void *v12;
  CKComposition *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  -[CKComposition text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = objc_msgSend(v5, "length");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __66__CKComposition_CKMediaObject__compositionByRemovingMediaObjects___block_invoke;
  v18 = &unk_1E275AAF8;
  v19 = v4;
  v20 = v6;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("MediaObjectForTextAttachment"), 0, v7, 2, &v15);
  v10 = [CKComposition alloc];
  -[CKComposition subject](self, "subject", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKComposition initWithText:subject:shelfPluginPayload:](v10, "initWithText:subject:shelfPluginPayload:", v8, v11, v12);

  return v13;
}

uint64_t __66__CKComposition_CKMediaObject__compositionByRemovingMediaObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", CFSTR("MediaObjectForTextAttachment"), a3, a4);
    if (a3
      && (objc_msgSend(*(id *)(a1 + 40), "string"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "characterAtIndex:", a3 - 1),
          v8,
          v9 == 10))
    {
      v10 = *(void **)(a1 + 40);
      v11 = a4 + 1;
      v12 = a3 - 1;
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      v12 = a3;
      v11 = a4;
    }
    return objc_msgSend(v10, "deleteCharactersInRange:", v12, v11);
  }
  return result;
}

- (NSArray)mediaObjects
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  -[CKComposition text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "length");
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__CKComposition_CKMediaObject__mediaObjects__block_invoke;
  v15[3] = &unk_1E275AB20;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("MediaObjectForTextAttachment"), 0, v4, 0, v15);
  v10 = v5;
  v11 = 3221225472;
  v12 = __44__CKComposition_CKMediaObject__mediaObjects__block_invoke_2;
  v13 = &unk_1E275AB48;
  v14 = v6;
  v7 = v6;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("AdaptiveImageGlyphMediaObject"), 0, v4, 0, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return (NSArray *)v8;
}

uint64_t __44__CKComposition_CKMediaObject__mediaObjects__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __44__CKComposition_CKMediaObject__mediaObjects__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (NSArray)pluginDisplayContainers
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[CKComposition text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CKComposition_CKMediaObject__pluginDisplayContainers__block_invoke;
  v7[3] = &unk_1E274EF20;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("PluginDisplayContainer"), 0, v4, 0, v7);

  return (NSArray *)v5;
}

void __55__CKComposition_CKMediaObject__pluginDisplayContainers__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (BOOL)isTextOnly
{
  void *v2;
  int v3;

  -[CKComposition text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsAttribute:", CFSTR("MediaObjectForTextAttachment")) & 1) != 0
    || (objc_msgSend(v2, "containsAttribute:", CFSTR("PluginDisplayContainer")) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "containsAttribute:", CFSTR("AdaptiveImageGlyphMediaObject")) ^ 1;
  }

  return v3;
}

- (unint64_t)mediaObjectsFileSize
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKComposition mediaObjects](self, "mediaObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412546;
    v16 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "fileURL", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "absoluteString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = IMFileSizeForItemAtPath();
        v12 = 0;

        if (!v11)
        {
          IMLogHandleForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "fileURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = v14;
            v23 = 2112;
            v24 = v12;
            _os_log_error_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_ERROR, "Unable to get file size for file at path: %@, error: %@", buf, 0x16u);

          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

  return 0;
}

+ (id)expirableCompositionWithMediaObject:(id)a3
{
  return +[_CKExpirableComposition compositionWithMediaObject:subject:](_CKExpirableComposition, "compositionWithMediaObject:subject:", a3, 0);
}

+ (id)newExpirableCompositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5
{
  return +[_CKExpirableComposition newCompositionWithText:subject:shelfPluginPayload:](_CKExpirableComposition, "newCompositionWithText:subject:shelfPluginPayload:", a3, a4, a5);
}

- (BOOL)isExpirableComposition
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

+ (id)audioCompositionWithMediaObject:(id)a3
{
  return +[_CKAudioComposition compositionWithMediaObject:subject:](_CKAudioComposition, "compositionWithMediaObject:subject:", a3, 0);
}

+ (id)quickImageCompositionWithMediaObject:(id)a3
{
  return +[_CKQuickImageComposition compositionWithMediaObject:subject:](_CKQuickImageComposition, "compositionWithMediaObject:subject:", a3, 0);
}

+ (id)photoPickerCompositionWithMediaObject:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObject:subject:](_CKQuickSendMediaComposition, "compositionWithMediaObject:subject:", a3, 0);
}

+ (id)photoPickerCompositionWithMediaObjects:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObjects:subject:](_CKQuickSendMediaComposition, "compositionWithMediaObjects:subject:", a3, 0);
}

+ (id)stickerCompositionWithMediaObjects:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObjects:subject:](_CKQuickSendMediaComposition, "compositionWithMediaObjects:subject:", a3, 0);
}

- (id)externalSourceComposition
{
  _CKExternalAudioComposition *v3;
  void *v4;
  void *v5;
  _CKExternalAudioComposition *v6;

  v3 = [_CKExternalAudioComposition alloc];
  -[CKComposition text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKComposition initWithText:subject:](v3, "initWithText:subject:", v4, v5);

  return v6;
}

- (id)superFormatSubject
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKComposition subject](self, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v2, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(v5, "__im_attributedStringByAssigningMessagePartNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v5 = objc_msgSend(v3, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__CKComposition_IMSuperFormat___attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText___block_invoke;
  v10[3] = &unk_1E275AB70;
  v6 = v3;
  v11 = v6;
  v13 = v14;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("MediaObjectForTextAttachment"), 0, v5, 0, v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  _Block_object_dispose(v14, 8);
  return v8;
}

void __93__CKComposition_IMSuperFormat___attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v8 = objc_msgSend(*(id *)(a1 + 32), "length");
  v10 = v8 - 1 >= a3 && v8 - 1 - a3 < a4;
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringWithRange:", a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "__ck_containsOnlyCharactersFromSet:", v13))
    {
      v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      if (!v14)
      {
        a4 = 0;
        a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      && objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v15, 8) != 0x7FFFFFFFFFFFFFFFLL)
    {
      ++a3;
      --a4;
    }
    if (!v10)
      a4 -= objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v15, 12) != 0x7FFFFFFFFFFFFFFFLL;

    goto LABEL_18;
  }
LABEL_19:
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v16);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

- (id)_attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(id *, void *, unint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = objc_msgSend(v7, "length");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __123__CKComposition_IMSuperFormat___attributedStringByReplacingMediaObjectsWithTransferGUIDsInText_transferGUIDs_mediaObjects___block_invoke;
  v23 = &unk_1E274F840;
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v26 = v10;
  v27 = v7;
  v14 = v7;
  v15 = v10;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, &v20);
  if (a4)
  {
    if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24, v25, v26, v27))
      v16 = v12;
    else
      v16 = 0;
    *a4 = objc_retainAutorelease(v16);
  }
  if (a5)
  {
    if (objc_msgSend(v13, "count"))
      v17 = v13;
    else
      v17 = 0;
    *a5 = objc_retainAutorelease(v17);
  }
  v18 = (void *)objc_msgSend(v15, "copy", v20, v21, v22, v23);

  return v18;
}

void __123__CKComposition_IMSuperFormat___attributedStringByReplacingMediaObjectsWithTransferGUIDsInText_transferGUIDs_mediaObjects___block_invoke(id *a1, void *a2, unint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AdaptiveImageGlyphMediaObject")),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "addObject:", v8);
    objc_msgSend(a1[5], "addObject:", v7);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D36430]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D362E0]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D36408]);
    v10 = *MEMORY[0x1E0D393F0];
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D393F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v10);

    }
    if (a3 < a3 + a4)
    {
      v14 = *MEMORY[0x1E0D362F8];
      do
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3498]);
        v16 = (void *)objc_msgSend(v9, "copy");
        v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v16);

        objc_msgSend(a1[6], "appendAttributedString:", v17);
        --a4;
      }
      while (a4);
    }

  }
  else
  {
    objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "appendAttributedString:", v7);
  }

}

- (id)superFormatText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id v17;

  -[CKComposition _attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:](self, "_attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  -[CKComposition _attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:transferGUIDs:mediaObjects:](self, "_attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:transferGUIDs:mediaObjects:", v8, &v17, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v16;
  objc_msgSend(v9, "__im_attributedStringByAssigningMessagePartNumbers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (objc_msgSend(v10, "count"))
      v13 = v10;
    else
      v13 = 0;
    *a4 = objc_retainAutorelease(v13);
  }
  if (a5)
  {
    if (objc_msgSend(v11, "count"))
      v14 = v11;
    else
      v14 = 0;
    *a5 = objc_retainAutorelease(v14);
  }

  return v12;
}

- (id)superFormatText:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  -[CKComposition text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[CKComposition superFormatText:transferGUIDs:mediaObjects:](self, "superFormatText:transferGUIDs:mediaObjects:", v5, &v11, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (a3)
  {
    if (objc_msgSend(v7, "count"))
      v9 = v8;
    else
      v9 = 0;
    *a3 = objc_retainAutorelease(v9);
  }

  return v6;
}

- (id)_messageFromPayload:(id)a3 firstGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v47 = 0;
  v48 = 0;
  objc_msgSend(v6, "__ck_superFormatStringTransferGUIDs:mediaObjects:", &v48, &v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v48;
  v42 = v47;
  objc_msgSend(v6, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("DeviceAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = *MEMORY[0x1E0D38358];
    v51[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v15 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v41 = v15;
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) != 0)
    goto LABEL_8;
  IMBalloonExtensionIDWithSuffix();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", v16))
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v17 = objc_msgSend(v6, "shouldSendAsMediaObject");

  if (v17)
  {
LABEL_8:

    v13 = 0;
    v16 = v14;
    v14 = 0;
LABEL_13:

  }
  v40 = (void *)v12;
  if (objc_msgSend(v6, "isUpdate"))
  {
    v39 = v7;
    v18 = (void *)MEMORY[0x1E0D35870];
    objc_msgSend(v6, "associatedMessageGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "breadcrumbMessageWithText:associatedMessageGUID:balloonBundleID:fileTransferGUIDs:payloadData:threadIdentifier:", v8, v19, v14, v9, v13, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v38 = v9;
    v21 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v20, "_copyWithFlags:", objc_msgSend(v20, "flags") | 0x1000000);

      v20 = (void *)v22;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = v42;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v27), "transfer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setIMMessage:", v20);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v25);
    }

    v8 = v21;
    v9 = v38;
    v7 = v39;
  }
  else
  {
    -[CKComposition messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:messageSummaryInfo:](self, "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:messageSummaryInfo:", v41, v8, 0, v9, v42, v14, v13, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "datasource");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = objc_msgSend(v6, "isUpdate");

    if ((v31 & 1) == 0)
    {
      objc_msgSend(v6, "datasource");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "guid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "datasourceWasMovedToNewGuid:", v33);

      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "datasource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "guid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "insertDataSource:forGUID:", v35, v36);

    }
  }

  return v20;
}

- (id)_compositionParts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttributedStringByRemovingTrackingInformation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __49__CKComposition_IMSuperFormat___compositionParts__block_invoke;
  v21 = &unk_1E2750D40;
  v25 = &v26;
  v8 = v5;
  v22 = v8;
  v9 = v6;
  v23 = v9;
  v10 = v3;
  v24 = v10;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v18);
  v11 = v27[3];
  if (v11 < objc_msgSend(v8, "length", v18, v19, v20, v21))
  {
    v12 = v27[3];
    v13 = objc_msgSend(v8, "length");
    objc_msgSend(v8, "attributedSubstringFromRange:", v12, v13 - v27[3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  v15 = v24;
  v16 = v10;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __49__CKComposition_IMSuperFormat___compositionParts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = a3 - v9;
    if (a3 != v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "__ck_attributedStringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17, v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + a4;
  }
  else if (v8)
  {
    if (a3 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "__ck_attributedStringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

    }
    objc_msgSend(v8, "_makeSendablePluginPayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:composeImage:](CKPluginDisplayContainer, "pluginDisplayContainerWithPluginPayload:composeImage:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + a4 + 1;

  }
}

- (BOOL)canBundleAttachmentsWithMessageOnService:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  char v7;
  uint8_t v9[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ForceNoAttachmentsWithMessage"));

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Forcing no attachments with messages (1 message per attachment) for RCS compatibility due to default ForceNoAttachmentsWithMessage", v9, 2u);
      }

    }
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "supportsCapability:", *MEMORY[0x1E0D38E38]);
  }

  return v7;
}

- (void)_applyMessagePropertiesTo:(id)a3 pluginPayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "pluginBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsString:", *MEMORY[0x1E0D37620]))
  {

  }
  else
  {
    objc_msgSend(v6, "pluginBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsString:", *MEMORY[0x1E0D37628]);

    if (!v9)
      goto LABEL_5;
  }
  objc_msgSend(v6, "pluginBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssociatedBalloonBundleID:", v10);

LABEL_5:
  -[CKComposition sourceApplicationID](self, "sourceApplicationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKComposition sourceApplicationID](self, "sourceApplicationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceApplicationID:", v12);

  }
  objc_msgSend(v16, "guid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition firstMessageGUIDOverride](self, "firstMessageGUIDOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
    objc_msgSend(v16, "setShouldNotifyOnSend:", 1);

}

- (id)messagesFromCompositionFirstGUIDForMessage:(id)a3 sendingService:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  _BOOL4 v63;
  id obj;
  void *v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  _QWORD v73[4];
  id v74;
  _QWORD aBlock[4];
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _BYTE v95[128];
  const __CFString *v96;
  uint64_t v97;
  const __CFString *v98;
  _QWORD v99[4];

  v99[1] = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v58 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__83;
  v93 = __Block_byref_object_dispose__83;
  v94 = 0;
  -[CKComposition firstMessageGUIDOverride](self, "firstMessageGUIDOverride");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v59;
  if (v6)
    v8 = (void *)v6;
  v94 = v8;

  -[CKComposition _compositionParts](self, "_compositionParts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v61 = v11;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__83;
  v87 = __Block_byref_object_dispose__83;
  v88 = 0;
  -[CKComposition superFormatSubject](self, "superFormatSubject");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v62 = v10;
  if (v84[5] && (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    -[CKComposition subject](self, "subject");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertObject:atIndex:", v14, 0);
    v57 = (void *)v14;

    v15 = (void *)v84[5];
    v84[5] = 0;

  }
  else
  {
    v57 = v13;
  }
  objc_msgSend(v10, "pluginBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  objc_msgSend(v61, "pluginBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", v19))
    v20 = objc_msgSend(v61, "shouldSendAsMediaObject");
  else
    v20 = 0;

  if ((v17 | v20) == 1)
  {
    objc_msgSend(v62, "__ck_photoCompositionString");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (v61 && objc_msgSend(v61, "shouldSendAsMediaObject"))
  {
    objc_msgSend(v61, "mediaObjectFromPayload");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      v98 = CFSTR("MediaObjectForTextAttachment");
      v99[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0CB3498]);
      v60 = (void *)objc_msgSend(v24, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v23);
LABEL_24:

LABEL_27:
LABEL_28:
      if (v60)
      {
        if (!v57 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v9, "insertObject:atIndex:", v60, 0);
          goto LABEL_35;
        }
        v29 = (void *)objc_msgSend(v60, "mutableCopy");
        objc_msgSend(v29, "appendAttributedString:", v57);
        v30 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", 0, v30);

        goto LABEL_34;
      }
LABEL_32:
      v60 = 0;
      goto LABEL_35;
    }
    goto LABEL_26;
  }
  if (!v62)
    goto LABEL_32;
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "sendAsCopy");

  if (v26)
  {
    -[CKComposition shelfMediaObject](self, "shelfMediaObject");
    v27 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v27;
    if (v27)
    {
      v96 = CFSTR("MediaObjectForTextAttachment");
      v97 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc(MEMORY[0x1E0CB3498]);
      v60 = (void *)objc_msgSend(v28, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v23);
      goto LABEL_24;
    }
LABEL_26:
    v60 = 0;
    goto LABEL_27;
  }
  +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:composeImage:](CKPluginDisplayContainer, "pluginDisplayContainerWithPluginPayload:composeImage:", v62, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v29, 0);
  v60 = 0;
LABEL_34:

LABEL_35:
  v63 = -[CKComposition canBundleAttachmentsWithMessageOnService:](self, "canBundleAttachmentsWithMessageOnService:", v58);
  -[CKComposition processedPartsForSuggestedReply:](self, "processedPartsForSuggestedReply:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v31;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v80 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v77 = 0;
          v78 = 0;
          -[CKComposition superFormatText:transferGUIDs:mediaObjects:](self, "superFormatText:transferGUIDs:mediaObjects:", v35, &v78, &v77);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v78;
          v38 = v77;
          if (objc_msgSend(v36, "length") || objc_msgSend((id)v84[5], "length"))
          {
            if (v63)
            {
              -[CKComposition messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:](self, "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:", v90[5], v36, v84[5], v37, v38, 0, 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                -[CKComposition _applyMessagePropertiesTo:pluginPayload:](self, "_applyMessagePropertiesTo:pluginPayload:", v39, v62);
                objc_msgSend(v65, "addObject:", v39);
              }
              v40 = (void *)v84[5];
              v84[5] = 0;

              v41 = (void *)v90[5];
              v90[5] = 0;

LABEL_49:
            }
            else if (objc_msgSend(v36, "length"))
            {
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke;
              aBlock[3] = &unk_1E275AB98;
              v76 = v38;
              v42 = _Block_copy(aBlock);
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_2;
              v73[3] = &unk_1E275ABC0;
              v43 = v42;
              v74 = v43;
              v44 = _Block_copy(v73);
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_3;
              v66[3] = &unk_1E275AC08;
              v45 = v43;
              v69 = v45;
              v66[4] = self;
              v71 = &v89;
              v72 = &v83;
              v67 = v62;
              v68 = v65;
              v46 = v44;
              v70 = v46;
              objc_msgSend(v36, "__im_visitMessageParts:", v66);

              v39 = v76;
              goto LABEL_49;
            }
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v47 = v35;
          objc_msgSend(v47, "pluginPayload");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKComposition _messageFromPayload:firstGUID:](self, "_messageFromPayload:firstGUID:", v48, v90[5]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = (void *)v90[5];
          v90[5] = 0;

          -[CKComposition shelfPluginPayload](self, "shelfPluginPayload");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "groupActivity");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setGroupActivity:", v52);

          -[CKComposition sourceApplicationID](self, "sourceApplicationID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            -[CKComposition sourceApplicationID](self, "sourceApplicationID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setSourceApplicationID:", v54);

          }
          if (v49)
            objc_msgSend(v65, "addObject:", v49);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    }
    while (v32);
  }

  v55 = v65;
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  return v55;
}

id __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "transfer", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) != 0)
        {
          v5 = v8;

          goto LABEL_11;
        }

      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdaptiveImageGlyph");

  return v3;
}

void __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[128];
  void *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "messagePartBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = a1;
  if (objc_msgSend(v5, "length"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v50 = v3;
    v8 = v5;
    v9 = v4;
    if (v6)
    {
      v69[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v68 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:", v14, v9, v15, v16, v10, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_applyMessagePropertiesTo:pluginPayload:", v17, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

    v3 = v50;
  }
  else
  {
    v49 = v5;
    if (objc_msgSend(v4, "__im_isOnlyAdaptiveImageGlyphFileTransfersAndWhitespaceUsingIsAdaptiveImageGlyphProvider:", *(_QWORD *)(a1 + 64)))
    {
      objc_msgSend(v4, "__im_transferGUIDsInAttributedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "array");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = *(_QWORD *)(a1 + 64);
      v62 = 0;
      objc_msgSend(v4, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingIsAdaptiveImageGlyphProvider:replacementTextProvider:removedTransferGUIDsOut:", v22, &__block_literal_global_406, &v62);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v62;
      objc_msgSend(*(id *)(a1 + 32), "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), 0, 0, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_applyMessagePropertiesTo:pluginPayload:", v24, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;

      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;

    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v10 = v12;
    v57 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v57)
    {
      v51 = v3;
      obj = v10;
      v48 = v4;
      v55 = *(_QWORD *)v59;
      v54 = *MEMORY[0x1E0D36430];
      v53 = *MEMORY[0x1E0D362F8];
      v29 = a1;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v59 != v55)
            objc_enumerationMutation(obj);
          v31 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          (*(void (**)(void))(*(_QWORD *)(v29 + 56) + 16))();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v32)
          {
            v66 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }
          v64 = v54;
          v65 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v53, v35);
          v37 = *(void **)(v29 + 32);
          v38 = *(_QWORD *)(v29 + 80);
          v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v29 + 72) + 8) + 40);
          v40 = *(_QWORD *)(*(_QWORD *)(v38 + 8) + 40);
          v63 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v39;
          v29 = v56;
          objc_msgSend(v37, "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:", v42, v36, v40, v41, v34, 0, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v29 + 32), "_applyMessagePropertiesTo:pluginPayload:", v43, *(_QWORD *)(v29 + 40));
          objc_msgSend(*(id *)(v56 + 48), "addObject:", v43);
          v44 = *(_QWORD *)(*(_QWORD *)(v56 + 80) + 8);
          v45 = *(void **)(v44 + 40);
          *(_QWORD *)(v44 + 40) = 0;

          v46 = *(_QWORD *)(*(_QWORD *)(v56 + 72) + 8);
          v47 = *(void **)(v46 + 40);
          *(_QWORD *)(v46 + 40) = 0;

        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v57);
      v3 = v51;
      v10 = obj;
      v7 = obj;
      v4 = v48;
    }
    else
    {
      v7 = v10;
    }
    v8 = v49;
  }

}

const __CFString *__90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_4()
{
  return CFSTR("");
}

- (id)processedPartsForSuggestedReply:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_9;
        objc_msgSend(v10, "pluginPayload", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("suggestedReplyBody"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
LABEL_9:
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v15);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9
{
  return -[CKComposition messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:messageSummaryInfo:](self, "messageWithGUID:superFormatText:superFormatSubject:fileTransferGUIDs:mediaObjects:balloonBundleID:payloadData:messageSummaryInfo:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9 messageSummaryInfo:(id)a10
{
  id v16;
  id v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v46 = a5;
  v47 = a6;
  v45 = a7;
  v48 = a8;
  v49 = a9;
  v18 = a10;
  -[CKComposition expressiveSendStyleID](self, "expressiveSendStyleID");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trimmedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("pew pew")))
  {
    v23 = objc_msgSend(MEMORY[0x1E0D397F8], "supportsScreenEffects");

    if (!v23)
      goto LABEL_6;
    v20 = v19;
    v19 = CFSTR("com.apple.messages.effect.CKLasersEffect");
  }
  else
  {

  }
LABEL_6:
  if (-[CKComposition isAudioComposition](self, "isAudioComposition"))
    v24 = 2097157;
  else
    v24 = 5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 |= 0x1000000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24 | 0x2000000;
  else
    v25 = v24;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isScheduledMessagesEnabled");

  if (v27
    && (-[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v28,
        v28))
  {
    -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "selectedDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 1;
    v32 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v31 = 0;
  }
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__83;
  v59 = __Block_byref_object_dispose__83;
  v60 = 0;
  v33 = objc_alloc(MEMORY[0x1E0D35870]);
  v34 = v33;
  if (v16)
  {
    v60 = (id)objc_msgSend(v33, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:scheduleType:scheduleState:messageSummaryInfo:", 0, v30, v17, v46, v47, v25, 0, v16, 0, v48, v49, v19, 0, v32, v31, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)objc_msgSend(v34, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:scheduleType:scheduleState:messageSummaryInfo:", 0, v30, v17, v46, v47, v25, 0, v35, 0, v48, v49, v19, 0, v32, v31, v18);

  }
  objc_msgSend(MEMORY[0x1E0D357E8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v56[5];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __161__CKComposition_IMSuperFormat__messageWithGUID_superFormatText_superFormatSubject_fileTransferGUIDs_mediaObjects_balloonBundleID_payloadData_messageSummaryInfo___block_invoke;
  v54[3] = &unk_1E275AC30;
  v54[4] = &v55;
  objc_msgSend(v36, "scanMessage:outgoing:waitUntilDone:completionBlock:", v37, 1, 1, v54);

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = v45;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v51 != v40)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "transfer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setIMMessage:", v56[5]);

      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v39);
  }

  v43 = (id)v56[5];
  _Block_object_dispose(&v55, 8);

  return v43;
}

void __161__CKComposition_IMSuperFormat__messageWithGUID_superFormatText_superFormatSubject_fileTransferGUIDs_mediaObjects_balloonBundleID_payloadData_messageSummaryInfo___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)messageWithGUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  -[CKComposition superFormatText:](self, "superFormatText:", &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;
  -[CKComposition superFormatSubject](self, "superFormatSubject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition expressiveSendStyleID](self, "expressiveSendStyleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = 2097157;
  else
    v9 = 5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 |= 0x1000000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 |= 0x2000000uLL;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__83;
  v31 = __Block_byref_object_dispose__83;
  v32 = 0;
  v10 = objc_alloc(MEMORY[0x1E0D35870]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v32 = (id)objc_msgSend(v10, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:", 0, v11, v5, v7, v6, v9, 0, v4, 0, 0, 0, v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v10, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:", 0, v11, v5, v7, v6, v9, 0, v12, 0, 0, 0, v8, 0);

  }
  objc_msgSend(MEMORY[0x1E0D357E8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v28[5];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__CKComposition_IMSuperFormat__messageWithGUID___block_invoke;
  v26[3] = &unk_1E275AC30;
  v26[4] = &v27;
  objc_msgSend(v13, "scanMessage:outgoing:waitUntilDone:completionBlock:", v14, 1, 1, v26);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CKComposition mediaObjects](self, "mediaObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "transfer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIMMessage:", v28[5]);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v16);
  }

  v20 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __48__CKComposition_IMSuperFormat__messageWithGUID___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

+ (id)compositionForMessageParts:(id)a3 preserveSubject:(BOOL)a4 contextIdentifier:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "compositionWithContext:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "compositionByAppendingComposition:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v16;
        }
        else if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "compositionWithContext:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[CKComposition composition](CKComposition, "composition");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "compositionWithContext:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "compositionByAppendingComposition:", v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)saveCompositionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  id v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[CKComposition(CKPersistentComposition) saveCompositionWithGUID:]";
      v65 = 2112;
      v66 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v57 = "-[CKComposition(CKPersistentComposition) saveCompositionWithGUID:]";
    v58 = v4;
    _CKLog();
  }
  if (v4)
  {
    objc_msgSend(v4, "im_lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "im_lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v64 = (const char *)v4;
          v65 = 2112;
          v66 = v9;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "guid has path specifiers %@. using stripped guid instead %@", buf, 0x16u);

        }
      }
      objc_msgSend(v4, "im_lastPathComponent", v57, v58);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }
  }
  CKDraftsDirectoryURL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v60, 1, 0, 0);
  CKPluginTmpSubDirectoryURL(v4, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v61, "fileExistsAtPath:", v12);

  if (v13)
  {
    CKPluginDraftDirectoryURL(v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v61, "fileExistsAtPath:", v15);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v64 = (const char *)v14;
        v65 = 2112;
        if (v16)
          v18 = CFSTR("YES");
        v66 = v59;
        v67 = 2112;
        v68 = v18;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "onSave draft %@ working %@ draftExists %@", buf, 0x20u);
      }

    }
    if (v16)
      objc_msgSend(v61, "removeItemAtURL:error:", v14, 0);
    v62 = 0;
    objc_msgSend(v61, "copyItemAtURL:toURL:error:", v59, v14, &v62, v57, v58);
    v19 = (char *)v62;
    if (v19 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v19;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Error when backing up working dir to drafts: %@", buf, 0xCu);
      }

    }
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CKComposition isAudioComposition](self, "isAudioComposition"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("audioMessage"));

  if (-[CKComposition isAudioComposition](self, "isAudioComposition"))
  {
    -[CKComposition mediaObjects](self, "mediaObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "powerLevels");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("audioPowerLevels"));
    }
    else
    {
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[_CKAudioComposition initWithText:subject:powerLevels:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    }

  }
  -[CKComposition shelfPluginPayload](self, "shelfPluginPayload", v57, v58);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v35 = v33;
  else
    v35 = 0;
  v36 = v35;
  if (v33)
  {
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v33, "mediaObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (v38)
      {
        v45 = v33;
      }
      else
      {
        objc_msgSend(v33, "mediaObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v33, "copy");

        objc_msgSend(v60, "URLByAppendingPathComponent:isDirectory:", CFSTR("Attachments"), 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        CKWriteMediaObjectToFileLocation(v39, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "setFileURL:", v43);
        objc_msgSend(v39, "transcoderUserInfo");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setUserInfo:", v44);

        v45 = v40;
        v33 = v45;
      }
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v46, CFSTR("shelfPluginPayload"));

  }
  else
  {
    v45 = v36;
  }
  -[CKComposition _persistTextToComposition:directoryURL:](self, "_persistTextToComposition:directoryURL:", v21, v60);
  -[CKComposition subject](self, "subject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v47, 1, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v48, CFSTR("subject"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v49, OS_LOG_TYPE_INFO, "-> preserving subject to draft", buf, 2u);
      }

    }
  }
  -[CKComposition bizIntent](self, "bizIntent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v50, 1, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v51, CFSTR("bizIntent"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v52, OS_LOG_TYPE_INFO, "-> preserving bizInent to draft", buf, 2u);
      }

    }
  }
  -[CKComposition sendLaterPluginInfo](self, "sendLaterPluginInfo");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v53, 1, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v54, CFSTR("sendLaterPluginInfo"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v55, OS_LOG_TYPE_INFO, "-> preserving sendLaterPluginInfo to draft", buf, 2u);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v21, 100, 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition _saveCompositionData:atURL:forGUID:](self, "_saveCompositionData:atURL:forGUID:", v56, v60, v4);

}

- (void)_persistTextToComposition:(id)a3 directoryURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[8];
  id v29;

  v6 = a3;
  v7 = a4;
  -[CKComposition text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Attachments"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CKPersistentTextForText(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CKComposition(CKPersistentComposition) _persistTextToComposition:directoryURL:].cold.1(v13, v15, v16, v17, v18, v19, v20, v21);
      goto LABEL_13;
    }
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;
    if (v12)
    {
      objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("text"));
      if (!IMOSLoggingEnabled())
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "-> drafted text preserved", v28, 2u);
      }
    }
    else
    {
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CKComposition(CKPersistentComposition) _persistTextToComposition:directoryURL:].cold.2((uint64_t)v13, v14, v22, v23, v24, v25, v26, v27);
    }

    goto LABEL_12;
  }
LABEL_14:

}

- (BOOL)_saveCompositionData:(id)a3 atURL:(id)a4 forGUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("composition.plist"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v7, "writeToURL:options:error:", v10, 1073741825, &v15);
  v12 = v15;

  if ((v11 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Draft (%@) write failure: %@", buf, 0x16u);
    }

  }
  return v11;
}

+ (void)deleteCompositionWithGUID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v11 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
    v12 = v3;
    _CKLog();
  }
  objc_msgSend(v3, "im_lastPathComponent", v11, v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    CKDraftsDirectoryURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);
    CKPluginTmpSubDirectoryURL(v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(15);
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_DEBUG, "%s guid is invalid", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
  }

}

- (CKComposition)compositionWithExpressiveSendStyleID:(id)a3
{
  -[CKComposition setExpressiveSendStyleID:](self, "setExpressiveSendStyleID:", a3);
  return self;
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Did not have NSAdaptiveImageGlyph for CKEmojiImageMediaObject in CKComposition", buf, 2u);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_165_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Failed to weak link either SWCollaborationMetadataForDocumentURL or FPCollaborationMetadataForDocumentURL_Preliminary. Cannot retrieve collaboration metadata.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_172_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Received an error from LSClaimBinding: %@", (uint8_t *)&v4, 0xCu);

}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_ERROR, "Failed to load object of class %@ with error: %@", (uint8_t *)&v8, 0x16u);

}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Could not load media payload from item provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Emoji sticker dragged to entry view, inserting emoji text instead of sticker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Did not find sticker in sticker store, using in-memory sticker representation instead (some representations may be missing).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)compositionWithShelfPluginPayload:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to get a URL appRecord : %@", a5, a6, a7, a8, 2u);
}

@end
