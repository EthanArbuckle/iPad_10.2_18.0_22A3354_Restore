@implementation IMDRelayAttachmentController

- (int64_t)transcodeTargetType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDRelayAttachmentController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transcodeTarget");

  return v4;
}

- (void)processAttachmentsForMessage:(id)a3 generateTextParts:(BOOL)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 completionBlock:(id)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __CFDictionary *Mutable;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _BOOL4 v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *key;
  id v80;
  id v81;
  NSObject *group;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  id v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  _QWORD block[4];
  id v96;
  id v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t, void *, void *, void *, int, uint64_t);
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  NSObject *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t v115;
  _QWORD v116[4];
  id v117;
  id v118;
  uint64_t *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  id v124;
  uint64_t *v125;
  BOOL v126;
  _QWORD aBlock[4];
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  _QWORD v139[3];

  v74 = a4;
  v139[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v80 = a5;
  v84 = a6;
  v73 = a7;
  group = dispatch_group_create();
  v93 = v10;
  objc_msgSend(v10, "fileTransferGUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if ((_DWORD)v12)
  {
    -[IMDRelayAttachmentController session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "maxSizePerAttachmentWithCount:lastAddressedHandle:lastAddressedSIMID:", v12, v80, v84);

  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v14 = 0;
  }
  v135 = 0;
  v136 = &v135;
  v137 = 0x2020000000;
  v138 = 0;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = sub_1D1450AA4;
  v133 = sub_1D1450AB4;
  v134 = 0;
  v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_IMWillLog() & 1) != 0)
    _IMAlwaysLog();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPriusCompatibilityEnabled");

  if (v17)
  {
    objc_msgSend(v93, "threadIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length") && v74;

    if (v19)
    {
      if (_IMWillLog())
      {
        objc_msgSend(v93, "guid");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog();

      }
      IMSharedUtilitiesFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("REPLIED_BACKWARD_COMPATIBILITY"), &stru_1E92346B0, CFSTR("IMSharedUtilities"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDRelayAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v21, objc_msgSend((id)v130[5], "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend((id)v130[5], "addObject:", v22);

    }
  }
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance", v68);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D1450ABC;
  aBlock[3] = &unk_1E9228C20;
  v70 = v23;
  v128 = v70;
  v24 = _Block_copy(aBlock);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_msgSend(v15, "length");
  v28 = *MEMORY[0x1E0D366B8];
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = sub_1D1450AC8;
  v120[3] = &unk_1E9228C88;
  v121 = v15;
  v125 = &v129;
  v90 = v25;
  v122 = v90;
  v81 = v26;
  v123 = v81;
  v126 = v74;
  v71 = v121;
  v72 = v24;
  v124 = v72;
  objc_msgSend(v121, "enumerateAttribute:inRange:options:usingBlock:", v28, 0, v27, 0, v120);
  if (!v74)
  {
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = sub_1D1450F44;
    v116[3] = &unk_1E9228CB0;
    v119 = &v129;
    v117 = v90;
    v118 = v81;
    objc_msgSend(v71, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v72, v116);

  }
  v29 = 0;
  v30 = 0;
  key = (void *)*MEMORY[0x1E0D39450];
  v77 = (void *)*MEMORY[0x1E0D39458];
  v75 = (void *)*MEMORY[0x1E0D37FC0];
  v31 = (double)v14 * 0.92;
  v76 = *MEMORY[0x1E0D39CB8];
  while (v30 < objc_msgSend(v90, "count"))
  {
    v92 = v30;
    objc_msgSend(v90, "objectAtIndexedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v32, "integerValue");

    objc_msgSend(v81, "objectAtIndexedSubscript:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "transferForGUID:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startTransfer:", v33);
    objc_msgSend(v34, "endTransfer:", v33);
    objc_msgSend(v93, "accountID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "handle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v93, "handle");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v88;
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v34, "assignTransfer:toAccount:otherPerson:", v33, v36, v38);
    if (v37)

    objc_msgSend(v35, "localPath");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "type");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_IMWillLog() & 1) != 0)
    {
      v69 = v94;
      _IMAlwaysLog();
    }
    v89 = objc_msgSend(v94, "length", v69);
    if (v89)
    {
      dispatch_group_enter(group);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v94);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "pathExtension");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "length"))
      {
        v83 = v40;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "type");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pathExtensionForUTIType:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v43, "length"))
        {
          v44 = v43;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "mimeType");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "pathExtensionForMIMEType:", v46);
          v47 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v47;
        }
        v83 = v44;
        if (objc_msgSend(v44, "length"))
        {
          objc_msgSend(v39, "absoluteString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringByDeletingPathExtension");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "stringByAppendingPathExtension:", v83);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v50, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v50);
            v51 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v51;
          }

        }
      }
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "im_generateCopyForURL:", v39);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v53 = 0;
      }
      objc_msgSend(v35, "transcoderUserInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      Mutable = (__CFDictionary *)objc_msgSend(v54, "mutableCopy");

      if (!Mutable)
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v56 = v80;
      if (v80)
        CFDictionarySetValue(Mutable, key, v56);

      v57 = v84;
      if (v84)
        CFDictionarySetValue(Mutable, v77, v57);

      v86 = v34;
      v87 = v33;
      if (objc_msgSend(v35, "isAdaptiveImageGlyph"))
        CFDictionarySetValue(Mutable, v75, MEMORY[0x1E0C9AAB0]);
      if (v53)
        v58 = v53;
      else
        v58 = v39;
      v59 = v58;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v139[0] = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v35, "isSticker");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("public.3gpp"), CFSTR("public.3gp"), CFSTR("public.png"), CFSTR("public.jpg"), CFSTR("public.jpeg"), 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[IMDRelayAttachmentController transcodeTargetType](self, "transcodeTargetType");
      v100 = MEMORY[0x1E0C809B0];
      v101 = 3221225472;
      v102 = sub_1D1450FE8;
      v103 = &unk_1E9228CD8;
      v104 = v59;
      v105 = v61;
      v106 = v91;
      v115 = v85;
      v107 = v35;
      v113 = &v129;
      v108 = v86;
      v109 = v87;
      v110 = v93;
      v114 = &v135;
      v111 = v53;
      v112 = group;
      v69 = 0;
      objc_msgSend(v62, "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:", v104, v106, v63, v64, v65, v105);

      v34 = v86;
      v33 = v87;

      v29 = 1;
    }
    else
    {
      *((_BYTE *)v136 + 24) = 1;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v76, -2, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _IMWarn();
      objc_msgSend(v34, "failTransfer:error:", v33, v39, v94, v35, v39);
    }

    v30 = v92 + 1;
    if (!v89)
      goto LABEL_70;
  }
  objc_msgSend(v93, "expressiveSendStyleID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "length") && objc_msgSend((id)v130[5], "count"))
  {

    if (!v74)
      goto LABEL_66;
    if (_IMWillLog())
    {
      objc_msgSend(v93, "guid");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    objc_msgSend(v93, "_localizedBackwardsCompatibleExpressiveSendText", v69);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRelayAttachmentController _plainTextPartWithString:index:](self, "_plainTextPartWithString:index:", v66, objc_msgSend((id)v130[5], "count"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
      objc_msgSend((id)v130[5], "addObject:", v67);

  }
LABEL_66:
  if ((v29 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1451A70;
    block[3] = &unk_1E9228D00;
    v96 = v93;
    v98 = &v135;
    v97 = v73;
    v99 = &v129;
    dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  }
  else if (v73)
  {
    (*((void (**)(id, void *, BOOL, uint64_t, _QWORD))v73 + 2))(v73, v93, *((_BYTE *)v136 + 24) == 0, v130[5], 0);
  }
LABEL_70:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

}

- (id)_plainTextPartWithString:(id)a3 index:(int64_t)a4
{
  id v5;
  __CFDictionary *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CFDictionarySetValue(v6, CFSTR("Type"), CFSTR("text/plain"));
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFDictionarySetValue(v6, CFSTR("Data"), v7);

    if (CFSTR("text"))
      CFDictionarySetValue(v6, CFSTR("Tag"), CFSTR("text"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("text_%d.txt"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      CFDictionarySetValue(v6, CFSTR("Path"), v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (IMDRelayAttachmentController)initWithSession:(id)a3
{
  id v5;
  IMDRelayAttachmentController *v6;
  IMDRelayAttachmentController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayAttachmentController;
  v6 = -[IMDRelayAttachmentController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (void)_sizeLimitsForTransfer:(id)a3 bigSize:(unint64_t *)a4 smallSize:(unint64_t *)a5
{
  void *v5;
  id v6;

  objc_msgSend(a3, "type");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMiMessageSizeLimitsForTransferType();

}

- (void)processAttachmentsForPeerRelayForMessage:(id)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5 completionBlock:(id)a6 uploadFailureBlock:(id)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void (**v28)(void *, void *);
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *group;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  _BYTE *v55;
  id v56;
  _QWORD aBlock[4];
  id v58;
  IMDRelayAttachmentController *v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v43 = a7;
  if (IMOSLoggingEnabled(v43))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode and upload Parts of a Message to MMCS ", buf, 2u);
    }

  }
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "fileTransferGUIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "count"))
  {
    objc_msgSend(v11, "fileTransferGUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    -[IMDRelayAttachmentController session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v15, "maxSizePerAttachmentWithCount:lastAddressedHandle:lastAddressedSIMID:", v14, v36, v37);

    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 1;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    group = dispatch_group_create();
    v42 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v39;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    if (v17)
    {
      v18 = 0;
      v45 = *(_QWORD *)v72;
      do
      {
        v46 = v17;
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v72 != v45)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v16, "transferForGUID:", v20, v36);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            dispatch_group_enter(group);
            objc_msgSend(v21, "_setNeedsWrapper:", 0);
            objc_msgSend(v16, "startTransfer:", v20);
            objc_msgSend(v16, "endTransfer:", v20);
            objc_msgSend(v11, "accountID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "handle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v11, "handle");
              a4 = (id)objc_claimAutoreleasedReturnValue();
              v24 = a4;
            }
            else
            {
              v24 = 0;
            }
            objc_msgSend(v16, "assignTransfer:toAccount:otherPerson:", v20, v22, v24);
            if (v23)

            v69 = 0;
            v70 = 0;
            if (IMOSLoggingEnabled(-[IMDRelayAttachmentController _sizeLimitsForTransfer:bigSize:smallSize:](self, "_sizeLimitsForTransfer:bigSize:smallSize:", v21, &v70, &v69)))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v70;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v69;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Big size: %d    Small Size: %d", buf, 0xEu);
              }

            }
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_1D146FCF0;
            aBlock[3] = &unk_1E92299A8;
            v27 = v21;
            v58 = v27;
            v59 = self;
            v68 = v41;
            v60 = v16;
            v61 = v20;
            v66 = &v75;
            v67 = &v79;
            v62 = group;
            v65 = v43;
            v63 = v11;
            v64 = v44;
            v28 = (void (**)(void *, void *))_Block_copy(aBlock);
            objc_msgSend(v27, "localURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0;
            objc_msgSend(v42, "coordinateReadingItemAtURL:options:error:byAccessor:", v29, 0, &v56, v28);
            v30 = v56;

            if (v30)
            {
              if (IMOSLoggingEnabled(v31))
              {
                OSLogHandleForIMFoundationCategory();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v27, "localURL");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v33;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v30;
                  _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Failed coordinated read of: %@  (Error: %@)", buf, 0x16u);

                }
              }
              objc_msgSend(v27, "localURL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v28[2](v28, v34);

            }
            v18 = 1;
          }
          else
          {
            if (IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v20;
                _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
              }

            }
            *((_BYTE *)v80 + 24) = 0;
            *((_DWORD *)v76 + 6) = 34;
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      }
      while (v17);

      if ((v18 & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v84 = sub_1D1471C74;
        v85 = sub_1D1471C84;
        v86 = 0;
        v86 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AA0]), "initWithIdentifier:timeout:", CFSTR("OutgoingMessagesPowerAssertion"), 120.0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1D1471C8C;
        block[3] = &unk_1E92299D0;
        v50 = obj;
        v53 = &v79;
        v52 = v38;
        v51 = v44;
        v54 = &v75;
        v55 = buf;
        dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {

    }
    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v79, 8);

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "AttachmentController: Told To Transcode but the message had no parts, don't wake me up. ", buf, 2u);
      }

    }
    if (v38)
      (*((void (**)(id, id, uint64_t, _QWORD))v38 + 2))(v38, v44, 1, 0);
  }

}

- (void)retrieveAttachmentsForMessage:(id)a3 ignoreStoredTransfers:(BOOL)a4 displayID:(id)a5 token:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, char);
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t *v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "fileTransferGUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    if (a4)
    {
      v19 = IMOSLoggingEnabled(v18);
      if ((_DWORD)v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "   Ignoring existing transfers.";
LABEL_19:
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    objc_msgSend(v12, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRelayAttachmentController _existingStoredMessageWithCompletedTransfersForMessageGUID:](self, "_existingStoredMessageWithCompletedTransfersForMessageGUID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = IMOSLoggingEnabled(v24);
    if (!v23)
    {
      if ((_DWORD)v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "   We don't have all the attachments yet, we'll just re-download.";
          goto LABEL_19;
        }
LABEL_20:

      }
LABEL_21:
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMEventCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Starting network availablity check...", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isScreenLit"))
        v28 = 0;
      else
        v28 = 9;

      *(_QWORD *)buf = 0;
      v41 = buf;
      v42 = 0x3032000000;
      v43 = sub_1D1471C74;
      v44 = sub_1D1471C84;
      v45 = 0;
      v29 = objc_alloc(MEMORY[0x1E0D36A80]);
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = sub_1D1472198;
      v35 = &unk_1E9229A48;
      v39 = buf;
      v36 = v12;
      v37 = v13;
      v38 = v15;
      v30 = objc_msgSend(v29, "initWithFlags:options:timeout:wifiTimeout:completionBlock:", 3, v28, &v32, 20.0, 5.0);
      v31 = (void *)*((_QWORD *)v41 + 5);
      *((_QWORD *)v41 + 5) = v30;

      objc_msgSend(*((id *)v41 + 5), "start", v32, v33, v34, v35);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    if ((_DWORD)v19)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "   We already have all these transfers, just moving along as a success!", buf, 2u);
      }

    }
    if (v15)
      (*((void (**)(id, void *, id, uint64_t, _QWORD))v15 + 2))(v15, v23, v13, 1, 0);

  }
  else if (v15)
  {
    (*((void (**)(id, id, id, uint64_t, _QWORD))v15 + 2))(v15, v12, v13, 1, 0);
  }
LABEL_29:

}

- (id)_existingStoredMessageWithCompletedTransfersForMessageGUID:(id)a3
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  id v30;
  __CFString *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithGUID:", v30);
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = v31;
  if (v31)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v31;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Found already stored message: %@", buf, 0xCu);
      }

      v5 = v31;
    }
    -[__CFString fileTransferGUIDs](v5, "fileTransferGUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 != 0;

    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = CFSTR("NO");
        if (v8)
          v12 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "   ==> Has attachments present: %@", buf, 0xCu);
      }

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[__CFString fileTransferGUIDs](v31, "fileTransferGUIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(obj);
          v16 = *(const __CFString **)(*((_QWORD *)&v33 + 1) + 8 * i);
          +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "transferForGUID:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "localURL");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (__CFString *)v20;
            if (!v20
              || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[__CFString path](v21, "path"),
                  v23 = (void *)objc_claimAutoreleasedReturnValue(),
                  v24 = objc_msgSend(v22, "fileExistsAtPath:", v23),
                  v23,
                  v22,
                  (v24 & 1) == 0))
            {
              if (IMOSLoggingEnabled(v20))
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v39 = v21;
                  _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "   ==> Missing an attachment at path: %@", buf, 0xCu);
                }

              }
              v9 = 0;
            }

          }
          else
          {
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v39 = v16;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "   ==> Missing a transfer for guid: %@", buf, 0xCu);
              }

            }
            v9 = 0;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v13);
    }

    v5 = v31;
    if (v9)
      v27 = v31;
    else
      v27 = 0;
    v28 = v27;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSMutableDictionary *peerCompletionBlocks;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary **p_peerCompletionBlocks;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v36 = a5;
  v37 = a6;
  v38 = a7;
  v39 = a8;
  v40 = a9;
  v41 = a10;
  v42 = a12;
  v19 = a13;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v18;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
    }

  }
  v47[0] = v18;
  v46[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v46[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v21;
  v46[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
  v47[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  JWEncodeDictionary();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "_FTCopyGzippedData");
  v44[0] = IMDRelayLocalMessageDictionaryTypeKey;
  v44[1] = IMDRelayLocalMessageDictionaryDictKey;
  v45[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
  v45[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "sendToLocalPeers:", v25);

  if (v27)
  {
    peerCompletionBlocks = self->_peerCompletionBlocks;
    if (!peerCompletionBlocks)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v32 = self->_peerCompletionBlocks;
      p_peerCompletionBlocks = &self->_peerCompletionBlocks;
      *p_peerCompletionBlocks = (NSMutableDictionary *)Mutable;

      peerCompletionBlocks = *p_peerCompletionBlocks;
    }
    v33 = _Block_copy(v19);
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("_%lu"), a4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](peerCompletionBlocks, "setObject:forKey:", v33, v34);

  }
  else
  {
    if (IMOSLoggingEnabled(v28))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v18;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
      }

    }
    (*((void (**)(id, id, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v19 + 2))(v19, v18, a4, 0, 0, 0, 0);
  }

}

- (void)_sendFileURL:(id)a3 forMessageGUID:(id)a4 attachmentIndex:(int64_t)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[3];
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longValue");

  if (v13 > 0x100000)
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
  else
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v8;
      v38 = 2048;
      v39 = a5;
      v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Forwarding Attachment (%@, %ld) to local peer. Filepath %@", buf, 0x20u);
    }

  }
  v35[0] = v8;
  v34[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v34[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v16;
  v34[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  v17 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)

  v19 = v13 <= 0x100000;
  JWEncodeDictionary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "_FTCopyGzippedData");
  v32[0] = IMDRelayLocalMessageDictionaryDictKey;
  v32[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v33[0] = v21;
  v33[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = IMOSLoggingEnabled(v22);
  if (v19)
  {
    if (v23)
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Using legacy api to send attachment", buf, 2u);
      }

    }
    +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "sendToLocalPeers:", v22);

    if (IMOSLoggingEnabled(v27))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = CFSTR("NO");
        if (v26)
          v29 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v37 = v29;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Got success? %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (v23)
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }

    }
    +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendFileToLocalPeers:metadata:", v7, v22);

  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  unint64_t v73;
  _OWORD v74[2];
  uint64_t v75;
  _QWORD v76[5];
  id v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  IMDRelayAttachmentController *v83;
  id v84;
  int64_t v85;
  uint8_t buf[32];
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryAttachmentIndexKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ and index %lu", buf, 0x16u);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageWithGUID:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = IMOSLoggingEnabled(v16);
  if (!v15)
  {
    if (!v17)
      goto LABEL_82;
    OSLogHandleForIMFoundationCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Unable To locate Message with GUID %@, adding to pending requests to retry later", buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (v17)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }

  }
  -[IMDRelayAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObject:", v6);

  -[IMDRelayAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") == 0;

  if (v21)
    -[IMDRelayAttachmentController setPendingRemoteFileRequests:](self, "setPendingRemoteFileRequests:", 0);
  v22 = objc_msgSend(v15, "isFinished");
  if ((v22 & 1) != 0)
  {
    objc_msgSend(v15, "fileTransferGUIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = IMOSLoggingEnabled(v24);
    if (v23)
    {
      if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
        }

      }
      objc_msgSend(v15, "fileTransferGUIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v9 < objc_msgSend(v27, "count");

      if (v28)
      {
        objc_msgSend(v15, "fileTransferGUIDs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndex:", v9);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled(v30))
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v68;
            _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
          }

        }
        +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "transferForGUID:", v68);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          if (IMOSLoggingEnabled(v34))
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v68;
              _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
            }

          }
          v36 = objc_msgSend(v33, "isFinished");
          if ((_DWORD)v36)
          {
            v37 = IMOSLoggingEnabled(v36);
            if ((_DWORD)v37)
            {
              OSLogHandleForIMFoundationCategory();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v68;
                _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
              }

            }
            if (v11)
            {
              v39 = (void *)MEMORY[0x1E0CEC3F8];
              objc_msgSend(v33, "type");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "typeWithIdentifier:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v42 = objc_msgSend(v41, "conformsToType:", *MEMORY[0x1E0CEC520]);
              if ((_DWORD)v42
                && (objc_msgSend(v33, "localURL"),
                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                    v44 = IMFileURLIsActuallyAnimated(),
                    v43,
                    (v44 & 1) == 0))
              {
                v87 = 0;
                memset(buf, 0, sizeof(buf));
                IMPreviewConstraintsZero();
                *(_OWORD *)buf = xmmword_1D1683060;
                *(_OWORD *)&buf[16] = xmmword_1D1683070;
                LOBYTE(v87) = objc_msgSend(v33, "isSticker");
                BYTE2(v87) = objc_msgSend(v33, "isAdaptiveImageGlyph");
                BYTE1(v87) = 0;
                objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "localURL");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v76[0] = MEMORY[0x1E0C809B0];
                v76[1] = 3221225472;
                v76[2] = sub_1D1474F5C;
                v76[3] = &unk_1E9229A98;
                v76[4] = self;
                v77 = v15;
                v78 = v9;
                v74[0] = *(_OWORD *)buf;
                v74[1] = *(_OWORD *)&buf[16];
                v75 = v87;
                objc_msgSend(v54, "generateSafeRender:constraints:completionBlock:", v55, v74, v76);

              }
              else
              {
                if (IMOSLoggingEnabled(v42))
                {
                  OSLogHandleForIMFoundationCategory();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v41;
                    _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v33, "localURL");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "guid");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDRelayAttachmentController _sendFileURL:forMessageGUID:attachmentIndex:](self, "_sendFileURL:forMessageGUID:attachmentIndex:", v46, v47, v9);

              }
            }
            else
            {
              if (IMOSLoggingEnabled(v37))
              {
                OSLogHandleForIMFoundationCategory();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "Request is from an old watch, so we need to transcode", buf, 2u);
                }

              }
              objc_msgSend(v33, "transcoderUserInfo");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "isAdaptiveImageGlyph"))
              {
                if (v67)
                  v57 = (id)objc_msgSend(v67, "mutableCopy");
                else
                  v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v58 = v57;
                objc_msgSend(v57, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D37FC0]);
                v59 = objc_msgSend(v58, "copy");

                v67 = (void *)v59;
              }
              +[IMDRelayTranscodeController sharedInstance](IMDRelayTranscodeController, "sharedInstance");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "localURL");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "type");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDRelayAttachmentController session](self, "session");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "service");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "transcodeTarget");
              v63 = objc_msgSend(v33, "isSticker");
              v70[0] = MEMORY[0x1E0C809B0];
              v70[1] = 3221225472;
              v70[2] = sub_1D1475118;
              v70[3] = &unk_1E9229AC0;
              v71 = v68;
              v72 = v15;
              v73 = v9;
              objc_msgSend(v64, "transcodeFileTransferContents:utiType:target:transcoderUserInfo:isSticker:highQualityMaxByteSize:lowQualityMaxByteSize:representations:completionBlock:", v66, v65, v62, v67, v63, 0x80000, 0x80000, 0, v70);

            }
          }
          else
          {
            v51 = IMOSLoggingEnabled(v36);
            if (a4 >= 40)
            {
              if (v51)
              {
                OSLogHandleForIMEventCategory();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v68;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v7;
                  _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ", buf, 0x16u);
                }

              }
            }
            else
            {
              if (v51)
              {
                OSLogHandleForIMFoundationCategory();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v68;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v7;
                  _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
                }

              }
              v69 = v6;
              im_dispatch_after();

            }
          }
        }

      }
      goto LABEL_82;
    }
    if (!v25)
      goto LABEL_82;
    OSLogHandleForIMFoundationCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "We have the message but no transfer guids - %@", buf, 0xCu);
    }
LABEL_58:

    goto LABEL_82;
  }
  v49 = IMOSLoggingEnabled(v22);
  if (a4 >= 40)
  {
    if (!v49)
      goto LABEL_82;
    OSLogHandleForIMFoundationCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Message with Guid is unfinished %@, No retried remain ", buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (v49)
  {
    OSLogHandleForIMFoundationCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
    }

  }
  v79 = MEMORY[0x1E0C809B0];
  v80 = 3221225472;
  v81 = sub_1D1474F48;
  v82 = &unk_1E9229A70;
  v83 = self;
  v84 = v6;
  v85 = a4;
  im_dispatch_after();

LABEL_82:
}

- (void)remoteFileResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSMutableDictionary *peerCompletionBlocks;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Received remote file response message %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryAttachmentIndexKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryFileDataKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "length");
  if (v10)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v6;
        v22 = 2048;
        v23 = v8;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachment index %lu ", buf, 0x16u);
      }

    }
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("_%lu"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_peerCompletionBlocks, "objectForKey:", v12);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14 = IMOSLoggingEnabled(v13);
    if (v13)
    {
      if ((_DWORD)v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }

      }
      ((void (**)(_QWORD, void *, uint64_t, _QWORD, void *, uint64_t, _QWORD))v13)[2](v13, v6, v8, 0, v9, 1, 0);
      -[NSMutableDictionary removeObjectForKey:](self->_peerCompletionBlocks, "removeObjectForKey:", v12);
    }
    else
    {
      if ((_DWORD)v14)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          -[NSMutableDictionary allKeys](self->_peerCompletionBlocks, "allKeys");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v18;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);

        }
      }
    }
    if (!-[NSMutableDictionary count](self->_peerCompletionBlocks, "count"))
    {
      peerCompletionBlocks = self->_peerCompletionBlocks;
      self->_peerCompletionBlocks = 0;

    }
  }

}

- (IMDServiceSession)session
{
  return self->_session;
}

- (NSMutableDictionary)peerCompletionBlocks
{
  return self->_peerCompletionBlocks;
}

- (void)setPeerCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_peerCompletionBlocks, a3);
}

- (NSMutableSet)pendingRemoteFileRequests
{
  return self->_pendingRemoteFileRequests;
}

- (void)setPendingRemoteFileRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRemoteFileRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRemoteFileRequests, 0);
  objc_storeStrong((id *)&self->_peerCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
