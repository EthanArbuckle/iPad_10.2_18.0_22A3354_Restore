@implementation IMDServiceAttachmentController

- (IMDServiceAttachmentController)initWithSession:(id)a3
{
  id v4;
  IMDServiceAttachmentController *v5;
  IMDServiceAttachmentController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMDServiceAttachmentController;
  v5 = -[IMDServiceAttachmentController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_session, v4);

  return v6;
}

- (BOOL)hasLocalDevice
{
  return 0;
}

- (BOOL)acceptFileTransfer:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  IMDServiceAttachmentController *v28;
  BOOL v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled(v4);
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Accepting file transfer: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "guid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "im_randomTemporaryFileURLWithFileName:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v9 != 0;
    if (v9)
    {
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[IMDServiceAttachmentController hasLocalDevice](self, "hasLocalDevice");
      +[IMDStickerRegistry sharedInstance](IMDStickerRegistry, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stickerUserInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "isAdaptiveImageGlyph");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = sub_1D14A0230;
      v23[3] = &unk_1E922AAF0;
      v24 = v4;
      v25 = v11;
      v29 = v12;
      v26 = v10;
      v27 = v20;
      v28 = self;
      v16 = v10;
      v17 = v11;
      objc_msgSend(v13, "retrieveStickerWithProperties:isAdaptiveImageGlyph:completionBlock:", v14, v15, v23);

    }
    else
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1D1667CC8();
    }

  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Not accepting, empty transfer supplied", buf, 2u);
      }

    }
    v22 = 0;
  }

  return v22;
}

- (BOOL)_receiveFileTransfer:(id)a3 transferID:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[9];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
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
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  IMDServiceAttachmentController *v101;
  id v102;
  id v103;
  uint64_t v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v65 = a4;
  v61 = a5;
  v62 = a6;
  v60 = a7;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isInternalInstall"))
  {

LABEL_8:
    objc_msgSend(v14, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("service"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "originalFilename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "im_randomTemporaryFileURLWithFileName:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
    {
      IMLogHandleForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1D1667D88();

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.AttachmentControllerErrorDomain"), 3, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, void *, _QWORD, double, double))v15 + 2))(v15, v65, 0, 0, 0, v58, 0, 0.0, 0.0);
        v20 = 0;

      }
      else
      {
        v20 = 0;
      }
      goto LABEL_54;
    }
    if (objc_msgSend((id)*MEMORY[0x1E0D38F50], "isEqualToString:", v59))
    {
      objc_msgSend(v19, "objectForKey:", CFSTR("simID"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("file"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("url"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v25))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Attempting download from RCS", buf, 2u);
        }

      }
      v27 = objc_msgSend(v14, "thumbnailMode");
      if (v27)
        objc_msgSend(v14, "setThumbnailMode:", 2);
      objc_msgSend(MEMORY[0x1E0D39CC8], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = sub_1D14A2288;
      v97[3] = &unk_1E922AB40;
      v98 = v14;
      v99 = v61;
      v100 = v62;
      v103 = v15;
      v104 = v27;
      v101 = self;
      v102 = v65;
      objc_msgSend(v28, "downloadRCSTransferOnSimID:transferURL:destURL:completion:", v57, v25, v64, v97);

      v20 = 1;
      goto LABEL_53;
    }
    objc_msgSend(v14, "guid");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    v92 = &v91;
    v93 = 0x3032000000;
    v94 = sub_1D14A29F4;
    v95 = sub_1D14A2A04;
    v96 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x3032000000;
    v88 = sub_1D14A29F4;
    v89 = sub_1D14A2A04;
    v90 = 0;
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = sub_1D14A29F4;
    v83 = sub_1D14A2A04;
    v84 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = sub_1D14A29F4;
    v77 = sub_1D14A2A04;
    v78 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = sub_1D14A29F4;
    v71 = sub_1D14A2A04;
    v72 = 0;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = sub_1D14A2A0C;
    v66[3] = &unk_1E922AB68;
    v66[4] = &v91;
    v66[5] = &v85;
    v66[6] = &v79;
    v66[7] = &v73;
    v66[8] = &v67;
    v30 = objc_msgSend(v19, "__message_defaultFileTransferEnforceMaxFileSize:withCompletion:", 1, v66);
    v31 = v92[5];
    v20 = v31 != 0;
    if (v31)
    {
      v32 = IMOSLoggingEnabled(v30);
      if ((_DWORD)v32)
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = (void *)v86[5];
          *(_DWORD *)buf = 138412290;
          v106 = v34;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, " => Settled on signature: %@", buf, 0xCu);
        }

      }
      v35 = IMOSLoggingEnabled(v32);
      if ((_DWORD)v35)
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v14;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, " transfer: %@", buf, 0xCu);
        }

      }
      v37 = IMOSLoggingEnabled(v35);
      if ((_DWORD)v37)
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v19;
          _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "    user info: %@", buf, 0xCu);
        }

      }
      v39 = IMOSLoggingEnabled(v37);
      if ((_DWORD)v39)
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = (void *)v92[5];
          v42 = v80[5];
          v43 = v86[5];
          v44 = v68[5];
          v45 = v74[5];
          *(_DWORD *)buf = 138413314;
          v106 = v41;
          v107 = 2112;
          v108 = v42;
          v109 = 2112;
          v110 = v43;
          v111 = 2112;
          v112 = v44;
          v113 = 2112;
          v114 = v45;
          _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, " urlString: %@   owner: %@    signature: %@  key: %@  fileSizeString: %@", buf, 0x34u);
        }

      }
      if (IMOSLoggingEnabled(v39))
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Attempting download from MMCS", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39CD8], "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "path");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v92[5];
      v50 = v80[5];
      objc_msgSend((id)v86[5], "_FTDataFromHexString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v68[5], "_FTDataFromHexString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend((id)v74[5], "integerValue");
      LOBYTE(v56) = 1;
      objc_msgSend(v47, "receiveFileTransfer:transferGUID:topic:path:requestURLString:ownerID:signature:decryptionKey:fileSize:generatePreview:balloonBundleID:senderContext:progressBlock:completionBlock:", v65, v57, *MEMORY[0x1E0D34240], v48, v49, v50, v51, v52, v53, v56, v61, v62, v60, v15);

    }
    else
    {
      if (IMOSLoggingEnabled(v30))
      {
        OSLogHandleForIMFoundationCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_INFO, " => No signature found, nothing to download here", buf, 2u);
        }

      }
      if (!v15)
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.AttachmentControllerErrorDomain"), 2, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, void *, _QWORD, double, double))v15 + 2))(v15, v65, 0, 0, 0, v47, 0, 0.0, 0.0);
    }

LABEL_52:
    _Block_object_dispose(&v67, 8);

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v91, 8);

LABEL_53:
LABEL_54:

    goto LABEL_55;
  }
  v17 = IMGetCachedDomainBoolForKey();

  if (!v17)
    goto LABEL_8;
  IMLogHandleForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1D1667D28();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.AttachmentControllerErrorDomain"), 15, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, void *, _QWORD, double, double))v15 + 2))(v15, v65, 0, 0, 0, v19, 0, 0.0, 0.0);
    v20 = 0;
LABEL_55:

    goto LABEL_56;
  }
  v20 = 0;
LABEL_56:

  return v20;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  CFMutableDictionaryRef Mutable;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  unint64_t v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];
  _QWORD v50[3];
  uint8_t buf[4];
  _BYTE v52[14];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v39 = a5;
  v40 = a6;
  v41 = a7;
  v42 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a12;
  v22 = a13;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v22;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (v22 = (id)objc_msgSend(v18, "length")) == 0)
  {
    if (IMOSLoggingEnabled(v22))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v52 = a4;
        *(_WORD *)&v52[4] = 2112;
        *(_QWORD *)&v52[6] = v18;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Trying to retrieve attachment at index: %u for transfer ID: %@, failing", buf, 0x12u);
      }

    }
    ((void (**)(_QWORD, id, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v23)[2](v23, v18, a4, 0, 0, 0, 0);
  }
  else
  {
    if (IMOSLoggingEnabled(v22))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v52 = v18;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
      }

    }
    v50[0] = v18;
    v49[0] = IMDRelayLocalMessageDictionaryGUIDKey;
    v49[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v25;
    v49[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
    v50[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = IMDRelayLocalMessageDictionaryTypeKey;
    v47[1] = IMDRelayLocalMessageDictionaryDictKey;
    v48[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
    v48[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[IMDServiceAttachmentController sendToLocalPeers:](self, "sendToLocalPeers:", v26);
    if (v27)
    {
      if (!qword_1EFC63CE0)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v29 = (void *)qword_1EFC63CE0;
        qword_1EFC63CE0 = (uint64_t)Mutable;

      }
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("_%lu"), a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)qword_1EFC63CE0;
      v32 = _Block_copy(v23);
      objc_msgSend(v31, "setObject:forKey:", v32, v30);

      v33 = dispatch_time(0, 600000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14A3104;
      block[3] = &unk_1E9229A70;
      v44 = v30;
      v45 = v18;
      v46 = a4;
      v34 = v30;
      dispatch_after(v33, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      if (IMOSLoggingEnabled(v27))
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v52 = v18;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
        }

      }
      ((void (**)(_QWORD, id, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v23)[2](v23, v18, a4, 0, 0, 0, 0);
    }

  }
}

- (void)remoteFileResponse:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, " Incomming response for file attachment %@ ", buf, 0xCu);
    }

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryAttachmentIndexKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryFileDataKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error-code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v11 = 0;
  if (v10)
    v12 = v10 == 5;
  else
    v12 = 1;
  v13 = v12;
  if (v10 && v10 != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38C58], v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v5, "length");
  if (v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_msgSend(v8, "length");
        *(_DWORD *)buf = 138413058;
        v26 = v5;
        v27 = 2048;
        v28 = v7;
        v29 = 2048;
        v30 = v16;
        v31 = 2048;
        v32 = v10;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachmentIndex %lu data of length %lu errorCode %lu", buf, 0x2Au);
      }

    }
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("_%lu"), v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1EFC63CE0, "objectForKey:", v17);
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v19 = IMOSLoggingEnabled(v18);
    if (v18)
    {
      if ((_DWORD)v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }

      }
      ((void (**)(_QWORD, void *, uint64_t, _QWORD, void *, uint64_t, void *))v18)[2](v18, v5, v7, 0, v8, v13, v11);
      objc_msgSend((id)qword_1EFC63CE0, "removeObjectForKey:", v17);
    }
    else
    {
      if ((_DWORD)v19)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v17;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)qword_1EFC63CE0, "allKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v26 = v23;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);

        }
      }
    }
    if (!objc_msgSend((id)qword_1EFC63CE0, "count"))
    {
      v24 = (void *)qword_1EFC63CE0;
      qword_1EFC63CE0 = 0;

    }
  }

}

- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8
{
  _BOOL4 v9;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];
  _QWORD v37[4];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v9 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v33 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v31;
      v40 = 2048;
      v41 = a8;
      v42 = 2112;
      v43 = v13;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Forwarding Attachment with guid %@ to local peer. Error: %lu. fileURL %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributesOfItemAtPath:error:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longValue");

  v20 = v19 > 0x100000 || v9;
  if ((v20 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
  else
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  v36[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v36[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  v36[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  v23 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[2] = v23;
  v36[3] = CFSTR("error-code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  v34[0] = IMDRelayLocalMessageDictionaryDictKey;
  v34[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v35[0] = v25;
  v35[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v20)
  {
    if (IMOSLoggingEnabled(v26))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }

    }
    -[IMDServiceAttachmentController sendToLocalPeersFile:dictionary:](self, "sendToLocalPeersFile:dictionary:", v13, v27);
  }
  else
  {
    -[IMDServiceAttachmentController localDeviceProductVersion](self, "localDeviceProductVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v29))
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v29;
        _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Using legacy api to send attachment running on product version: %@", buf, 0xCu);
      }

    }
    -[IMDServiceAttachmentController sendToLocalPeers:](self, "sendToLocalPeers:", v27);

  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  CFMutableDictionaryRef Mutable;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  BOOL v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  BOOL v90;
  void *v91;
  void *v92;
  __CFString *inUTI;
  void *v94;
  void *v95;
  unint64_t v96;
  id v97;
  id v98;
  _OWORD v99[2];
  uint64_t v100;
  _QWORD v101[5];
  id v102;
  id v103;
  id v104;
  uint64_t *v105;
  unint64_t v106;
  _QWORD v107[4];
  id v108;
  IMDServiceAttachmentController *v109;
  id v110;
  id v111;
  uint64_t *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t);
  void *v117;
  IMDServiceAttachmentController *v118;
  id v119;
  int64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  uint8_t buf[32];
  uint64_t v126;
  uint64_t v127;

  v5 = a5;
  v127 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryAttachmentIndexKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v10, "unsignedIntegerValue");

  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("send-file-url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v124 = v12;
  objc_msgSend(v8, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = CFSTR("NO");
      if (v5)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ shouldRetry %@", buf, 0x16u);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "itemWithGUID:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Unable To locate Message with GUID %@, adding to pending requests to retry later", buf, 0xCu);
      }

    }
    -[IMDServiceAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[IMDServiceAttachmentController setPendingRemoteFileRequests:](self, "setPendingRemoteFileRequests:", v25);
    }
    v27 = objc_msgSend(v25, "addObject:", v8);
    if (v5)
    {
      if (a4 <= 39)
      {
        if (IMOSLoggingEnabled(v27))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v9;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Message with Guid  is not found %@, Retrying it a bit ", buf, 0xCu);
          }

        }
        v97 = v8;
        im_dispatch_after();

        goto LABEL_88;
      }
      if (IMOSLoggingEnabled(v27))
      {
        OSLogHandleForIMFoundationCategory();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_1D1413000, v72, OS_LOG_TYPE_INFO, "Message with Guid is not found %@, No retried remain ", buf, 0xCu);
        }

      }
    }
    v68 = 1;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }

  }
  -[IMDServiceAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObject:", v8);

  -[IMDServiceAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") == 0;

  if (v24)
    -[IMDServiceAttachmentController setPendingRemoteFileRequests:](self, "setPendingRemoteFileRequests:", 0);
  if (!objc_msgSend(v19, "type"))
  {
    v25 = v19;
    v29 = objc_msgSend(v25, "isFinished");
    if ((v29 & 1) != 0)
      goto LABEL_30;
    if (a4 > 39)
    {
      if (IMOSLoggingEnabled(v29))
      {
        OSLogHandleForIMFoundationCategory();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_1D1413000, v74, OS_LOG_TYPE_INFO, "Message with Guid is unfinished %@, No retried remain ", buf, 0xCu);
        }

      }
      v68 = 2;
      goto LABEL_133;
    }
    if (IMOSLoggingEnabled(v29))
    {
      OSLogHandleForIMFoundationCategory();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1D1413000, v71, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
      }

    }
    v114 = MEMORY[0x1E0C809B0];
    v115 = 3221225472;
    v116 = sub_1D14A4ED4;
    v117 = &unk_1E9229A70;
    v118 = self;
    v119 = v8;
    v120 = a4;
    im_dispatch_after();

LABEL_88:
    v68 = 0;
    goto LABEL_133;
  }
  v25 = 0;
LABEL_30:
  objc_msgSend(v19, "fileTransferGUIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v68 = 3;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled(v31))
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
    }

  }
  objc_msgSend(v19, "fileTransferGUIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v96 < objc_msgSend(v33, "count");

  if (v34)
  {
    objc_msgSend(v19, "fileTransferGUIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndex:", v96);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v37))
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v94;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
      }

    }
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "transferForGUID:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v95)
    {
      if (IMOSLoggingEnabled(v40))
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Transfer not found in transfer center, checking attachment store", buf, 2u);
        }

      }
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "attachmentWithGUID:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v95)
      {
        if (IMOSLoggingEnabled(v40))
        {
          OSLogHandleForIMFoundationCategory();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v94;
            _os_log_impl(&dword_1D1413000, v84, OS_LOG_TYPE_INFO, "Did not find file transfer for message GUID %@ transfer guid %@", buf, 0x16u);
          }

        }
        v68 = 3;

        goto LABEL_132;
      }
    }
    if (IMOSLoggingEnabled(v40))
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v94;
        _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
      }

    }
    v44 = objc_msgSend(v95, "isFinished");
    if (!(_DWORD)v44)
    {
      if (a4 > 39)
      {
        if (IMOSLoggingEnabled(v44))
        {
          OSLogHandleForIMEventCategory();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v94;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            _os_log_impl(&dword_1D1413000, v75, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ", buf, 0x16u);
          }

        }
        v68 = 4;
        goto LABEL_131;
      }
      if (IMOSLoggingEnabled(v44))
      {
        OSLogHandleForIMFoundationCategory();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_1D1413000, v73, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
        }

      }
      v98 = v8;
      im_dispatch_after();

LABEL_130:
      v68 = 0;
LABEL_131:

LABEL_132:
      goto LABEL_133;
    }
    v45 = IMOSLoggingEnabled(v44);
    if ((_DWORD)v45)
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v94;
        _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled(v45))
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay", buf, 2u);
      }

    }
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "chatsGUIDsForMessageWithGUID:", v9);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lastObject");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "chatWithGUID:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend(v91, "isFiltered");
    v52 = v51;
    v53 = v14 ^ 1u;
    if (v51)
      v54 = v14 ^ 1;
    else
      v54 = 1;
    if (v54 == 1)
    {
      if (IMOSLoggingEnabled(v51))
      {
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52 == 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v57;
          _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay, this is a known sender (%@) or old watch (%@)", buf, 0x16u);

        }
      }
      objc_msgSend(v95, "type");
      inUTI = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "transcoderUserInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "mutableCopy");

      Mutable = (CFMutableDictionaryRef)UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5AD8]);
      if ((_DWORD)Mutable)
      {
        if (!v59)
        {
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v59 = Mutable;
        }
        if (IMOSLoggingEnabled(Mutable))
        {
          OSLogHandleForIMFoundationCategory();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v61, OS_LOG_TYPE_INFO, "Found an a/v type, adding transcoder options to remove alpha and check for hevc+alpha", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKey:", v62, *MEMORY[0x1E0D37F00]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKey:", v63, *MEMORY[0x1E0D37EC8]);

      }
      v90 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:](IMDAttachmentUtilities, "shouldEnablePreviewTranscodingQualityForTransfer:isSending:", v95, 1);
      +[IMDAttachmentUtilities messageAttachmentSendableUTIs](IMDAttachmentUtilities, "messageAttachmentSendableUTIs");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "localURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v95, "isSticker");
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = sub_1D14A4EEC;
      v107[3] = &unk_1E922AB90;
      v108 = v95;
      v109 = self;
      v112 = &v121;
      v113 = v96;
      v110 = v94;
      v111 = v9;
      LOBYTE(v89) = v90;
      objc_msgSend(v65, "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:", v66, inUTI, v67, v64, 0, &unk_1E92718F8, 0, -1, v59, 0, v89, v107);

      goto LABEL_129;
    }
    objc_msgSend(v95, "type");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v76 == 0;

    if (v77)
      goto LABEL_139;
    v79 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v95, "type");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "typeWithIdentifier:", v80);
    inUTI = (__CFString *)objc_claimAutoreleasedReturnValue();

    v78 = -[__CFString conformsToType:](inUTI, "conformsToType:", *MEMORY[0x1E0CEC520]);
    if ((_DWORD)v78)
    {
      objc_msgSend(v95, "localURL");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = IMFileURLIsActuallyAnimated();

      if ((v82 & 1) == 0)
      {
        v126 = 0;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero();
        *(_OWORD *)buf = xmmword_1D1683060;
        *(_OWORD *)&buf[16] = xmmword_1D1683070;
        LOBYTE(v126) = objc_msgSend(v95, "isSticker");
        BYTE2(v126) = objc_msgSend(v95, "isAdaptiveImageGlyph");
        BYTE1(v126) = 0;
        objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "localURL");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v101[0] = MEMORY[0x1E0C809B0];
        v101[1] = 3221225472;
        v101[2] = sub_1D14A53F4;
        v101[3] = &unk_1E922ABB8;
        v101[4] = self;
        v106 = v96;
        v102 = v94;
        v103 = v9;
        v105 = &v121;
        v104 = v95;
        v99[0] = *(_OWORD *)buf;
        v99[1] = *(_OWORD *)&buf[16];
        v100 = v126;
        objc_msgSend(v87, "generateSafeRender:constraints:completionBlock:", v88, v99, v101);

        goto LABEL_129;
      }
    }
    if (!inUTI)
    {
LABEL_139:
      if (IMOSLoggingEnabled(v78))
      {
        OSLogHandleForIMFoundationCategory();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v85, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not found", buf, 2u);
        }

      }
      inUTI = 0;
    }
    else if (IMOSLoggingEnabled(v78))
    {
      OSLogHandleForIMFoundationCategory();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = inUTI;
        _os_log_impl(&dword_1D1413000, v83, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v95, "localURL");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceAttachmentController _sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:](self, "_sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:", v96, v94, v9, v86, *((unsigned __int8 *)v122 + 24), 5);

LABEL_129:
    goto LABEL_130;
  }
  if (IMOSLoggingEnabled(v35))
  {
    OSLogHandleForIMFoundationCategory();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "fileTransferGUIDs");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v96;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v70;
      _os_log_impl(&dword_1D1413000, v69, OS_LOG_TYPE_INFO, "Attachment index out of bounds. attachment index: %lu file transfer guids: %@", buf, 0x16u);

    }
  }
  v68 = 6;
LABEL_133:

  if (v68)
    -[IMDServiceAttachmentController _sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:](self, "_sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:", v96, 0, v9, 0, *((unsigned __int8 *)v122 + 24), v68);

  _Block_object_dispose(&v121, 8);
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return 0;
}

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  return 0;
}

- (id)localDeviceProductVersion
{
  return CFSTR("unknown");
}

- (IMDServiceSession)session
{
  return (IMDServiceSession *)objc_loadWeakRetained((id *)&self->_session);
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
  objc_destroyWeak((id *)&self->_session);
}

@end
