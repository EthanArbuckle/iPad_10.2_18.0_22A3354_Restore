@implementation IMTransferAgentController

+ (id)sharedInstance
{
  if (qword_2540D93B0 != -1)
    dispatch_once(&qword_2540D93B0, &unk_24F979E40);
  return (id)qword_2540D93D8;
}

- (void)dealloc
{
  objc_super v3;

  -[IMTransferAgentController setController:](self, "setController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentController;
  -[IMTransferAgentController dealloc](&v3, sel_dealloc);
}

- (BOOL)_shouldRetryUploadGivenMMCSError:(id)a3 retryAttemptCount:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  char v9;
  BOOL v10;
  uint8_t v12[16];

  v5 = a3;
  im_assert_primary_queue();
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE633E0]) & 1) == 0)
  {

    goto LABEL_10;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 4)
  {
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "We will not try to re-upload as the transfer was explicitly cancelled", v12, 2u);
    }

  }
  v9 = 0;
LABEL_11:
  if (a4 < 3)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (void)_sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 retryAttemptCount:(unint64_t)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  IMTransferAgentController *v20;
  id v21;
  void *v22;
  MMCSController *v23;
  MMCSController *controller;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
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
  uint64_t v45;
  MMCSController *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  id v64;
  id val;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  IMTransferAgentController *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 *p_buf;
  char v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88[2];
  id location;
  _QWORD v90[4];
  id v91;
  id v92;
  __int128 buf;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v61 = a4;
  v17 = a5;
  v18 = a6;
  v57 = a8;
  v19 = a9;
  v59 = a10;
  im_assert_primary_queue();
  v20 = self;
  if (!self->_controller)
  {
    v21 = objc_alloc(MEMORY[0x24BE634A8]);
    im_primary_queue();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (MMCSController *)objc_msgSend(v21, "initWithQueue:", v22);
    controller = self->_controller;
    self->_controller = v23;

  }
  v25 = objc_alloc_init(MEMORY[0x24BE634B8]);
  IMSingleObjectArray();
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringGUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setGuid:", v26);

  objc_msgSend(v16, "stringByResolvingAndStandardizingPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLocalPath:", v27);

  objc_msgSend(v25, "setEncryptionBehavior:", 1);
  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = sub_22D981F30;
  v90[3] = &unk_24F979F80;
  v28 = v17;
  v91 = v28;
  v29 = v19;
  v92 = v29;
  objc_msgSend(v25, "setProgressUpdateBlock:", v90);
  v63 = IMOptOutOfOptimizedMadridAttachmentUploadPath();
  if (v63 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v25, "guid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_22D97D000, v30, OS_LOG_TYPE_INFO, "Opting upload with GUID %@ out of optimized AuthPut flow.", (uint8_t *)&buf, 0xCu);

    }
  }
  location = 0;
  objc_initWeak(&location, val);
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = sub_22D982058;
  v80[3] = &unk_24F979FD0;
  objc_copyWeak(v88, &location);
  v80[4] = self;
  v88[1] = (id)a7;
  v56 = v28;
  v81 = v56;
  v54 = v16;
  v82 = v54;
  v32 = v61;
  v83 = v32;
  v33 = v18;
  v84 = v33;
  v34 = v57;
  v85 = v34;
  v58 = v29;
  v86 = v58;
  v62 = v59;
  v87 = v62;
  objc_msgSend(v25, "setCompletionBlock:", v80);
  v35 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v25, "guid");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("Upload-transfer-%@-mmcs-registration"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v25, "guid");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("Upload-transfer-%@-preauth"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v25, "guid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("Upload-transfer-%@-mmcs-upload"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v94 = 0x3032000000;
  v95 = sub_22D9826E0;
  v96 = sub_22D9826F0;
  v97 = 0;
  v44 = v33;
  v97 = objc_alloc_init(MEMORY[0x24BE508D8]);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "startTimingForKey:", v37);
  v45 = v63 ^ 1u;
  v46 = v20->_controller;
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = sub_22D9826F8;
  v66[3] = &unk_24F97A048;
  v64 = v25;
  v67 = v64;
  p_buf = &buf;
  v47 = v37;
  v68 = v47;
  v79 = v45;
  v60 = v32;
  v69 = v60;
  v70 = v20;
  v48 = v34;
  v71 = v48;
  v49 = v40;
  v72 = v49;
  v55 = v54;
  v73 = v55;
  v50 = v43;
  v74 = v50;
  v51 = val;
  v75 = v51;
  v52 = v56;
  v76 = v52;
  v53 = v44;
  v77 = v53;
  -[MMCSController registerFilesForUpload:withPreauthentication:completionBlock:](v46, "registerFilesForUpload:withPreauthentication:completionBlock:", v51, v45, v66);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v88);
  objc_destroyWeak(&location);

}

- (void)warm
{
  id v3;
  void *v4;
  MMCSController *v5;
  MMCSController *controller;

  im_assert_primary_queue();
  if (!self->_controller)
  {
    v3 = objc_alloc(MEMORY[0x24BE634A8]);
    im_primary_queue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MMCSController *)objc_msgSend(v3, "initWithQueue:", v4);
    controller = self->_controller;
    self->_controller = v5;

  }
  -[IMTransferAgentController _isAllowlistedURL:](self, "_isAllowlistedURL:", 0);
  MEMORY[0x24BEDD108](MEMORY[0x24BE634A8], sel_preMMCSWarm);
}

- (void)sendFilePath:(id)a3 encrypt:(BOOL)a4 topic:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 userInfo:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  _BOOL4 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  NSObject *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  void (**v40)(_QWORD, _QWORD, _QWORD);
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  IMTransferAgentController *v46;
  id v47;
  id v48;
  id v49;
  unint64_t v50;
  BOOL v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v14 = a4;
  v56 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v37 = a5;
  v38 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  im_assert_primary_queue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributesOfItemAtPath:error:", v16, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

  }
  else
  {
    v24 = 0;
  }
  +[IMTransferAgentIDSInterface sharedInstance](IMTransferAgentIDSInterface, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localCompanionDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = v26;
      v54 = 2048;
      v55 = v24;
      _os_log_impl(&dword_22D97D000, v27, OS_LOG_TYPE_INFO, "local device: %@ file size: %lu", buf, 0x16u);
    }

  }
  if (v24 < 0x6400001)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = sub_22D985488;
    v41[3] = &unk_24F97A098;
    v48 = v20;
    v51 = v14;
    v42 = v26;
    v50 = v24;
    v43 = v37;
    v44 = v38;
    v45 = v17;
    v46 = self;
    v47 = v18;
    v49 = v19;
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E31D724](v41);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v31, OS_LOG_TYPE_INFO, " => File passes file size restrictions", buf, 2u);
      }

    }
    v32 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v32)
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D97D000, v33, OS_LOG_TYPE_INFO, "Encrypting file", buf, 2u);
        }

      }
      +[IMTransferEncryptionController sharedInstance](IMTransferEncryptionController, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = sub_22D985818;
      v39[3] = &unk_24F97A0C0;
      v40 = v30;
      objc_msgSend(v34, "encryptURL:completionBlock:", v35, v39);

    }
    else
    {
      if (v32)
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D97D000, v36, OS_LOG_TYPE_INFO, "Not encrypting file", buf, 2u);
        }

      }
      ((void (**)(_QWORD, id, _QWORD))v30)[2](v30, v16, 0);
    }

    v29 = v48;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = 104857600;
        _os_log_impl(&dword_22D97D000, v28, OS_LOG_TYPE_INFO, "  ** File is too large - failing, over max size of: %d", buf, 8u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferServicesErrorDomain"), -6, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id, unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, v16, v24, 0, 0, 0, 0, v29, 0);
  }

}

- (void)cancelSendTransferID:(id)a3
{
  id v4;

  v4 = a3;
  im_assert_primary_queue();
  -[MMCSController cancelPutRequestID:](self->_controller, "cancelPutRequestID:", v4);

}

- (id)_defaultMMCSAllowlist
{
  im_assert_primary_queue();
  return &unk_24F97D3E0;
}

- (BOOL)_isAllowlistedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  im_assert_primary_queue();
  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("mmcs-whitelist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    -[IMTransferAgentController _defaultMMCSAllowlist](self, "_defaultMMCSAllowlist");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Server bag does not have allowlisted urls. Resorting to defaults", buf, 2u);
      }

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Checking URL %@ with domains %@", buf, 0x16u);
    }

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        if (objc_msgSend(v4, "__im_conformsToDomain:domainExtension:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), CFSTR("com"), (_QWORD)v18))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v4;
              _os_log_impl(&dword_22D97D000, v16, OS_LOG_TYPE_INFO, "URL is allowlisted %@", buf, 0xCu);
            }

          }
          v15 = 1;
          goto LABEL_29;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_22D97D000, v14, OS_LOG_TYPE_INFO, "MMCS: Invalid URL %@", buf, 0xCu);
    }

  }
  v15 = 0;
LABEL_29:

  return v15;
}

- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 allowReauthorize:(BOOL)a9 fileSize:(unint64_t)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  MMCSController *v25;
  MMCSController *controller;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  int v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  MMCSController *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  IMTransferAgentController *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  __int128 *v89;
  _QWORD v90[4];
  id v91;
  IMTransferAgentController *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  _QWORD *v101;
  __int128 *p_buf;
  id v103[2];
  BOOL v104;
  _QWORD v105[3];
  int v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id location;
  __int128 v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  __int128 buf;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v67 = a4;
  v20 = a5;
  v21 = a6;
  v68 = a7;
  v71 = a8;
  v22 = v20;
  v69 = a11;
  v70 = a12;
  v72 = a13;
  im_assert_primary_queue();
  v73 = v21;
  if (!self->_controller)
  {
    v23 = objc_alloc(MEMORY[0x24BE634A8]);
    im_primary_queue();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (MMCSController *)objc_msgSend(v23, "initWithQueue:", v24);
    controller = self->_controller;
    self->_controller = v25;

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[IMTransferAgentController _isAllowlistedURL:](self, "_isAllowlistedURL:", v27);

  if (v28)
  {
    v29 = objc_alloc_init(MEMORY[0x24BE634B0]);
    location = 0;
    objc_initWeak(&location, v29);
    IMSingleObjectArray();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v117 = 0x3032000000;
    v118 = sub_22D9826E0;
    v119 = sub_22D9826F0;
    v120 = 0;
    v31 = v30;
    v120 = v31;
    if (v73)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v29, "setSignature:", v71);
    objc_msgSend(v29, "setGuid:", v19);
    objc_msgSend(v20, "stringByResolvingAndStandardizingPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLocalPath:", v34);

    objc_msgSend(v29, "setRequestURL:", v66);
    objc_msgSend(v29, "setProtocolFileSize:", a10);
    v107[0] = MEMORY[0x24BDAC760];
    v107[1] = 3221225472;
    v107[2] = sub_22D9865BC;
    v107[3] = &unk_24F97A0E8;
    v35 = v19;
    v108 = v35;
    v36 = v70;
    v109 = v36;
    objc_msgSend(v29, "setProgressUpdateBlock:", v107);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        LODWORD(v111) = 138412290;
        *(_QWORD *)((char *)&v111 + 4) = v29;
        _os_log_impl(&dword_22D97D000, v37, OS_LOG_TYPE_INFO, "Created get file request: %@", (uint8_t *)&v111, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "linkQualityValueForInterfaceType:", 3);
        LODWORD(v111) = 67109120;
        DWORD1(v111) = v40;
        _os_log_impl(&dword_22D97D000, v38, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", (uint8_t *)&v111, 8u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "linkQualityValueForInterfaceType:", 2);
        LODWORD(v111) = 67109120;
        DWORD1(v111) = v43;
        _os_log_impl(&dword_22D97D000, v41, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", (uint8_t *)&v111, 8u);

      }
    }
    v105[0] = 0;
    v105[1] = v105;
    v105[2] = 0x2020000000;
    v106 = 0;
    v90[0] = MEMORY[0x24BDAC760];
    v90[1] = 3221225472;
    v90[2] = sub_22D9866E4;
    v90[3] = &unk_24F97A188;
    objc_copyWeak(v103, &location);
    v65 = v31;
    v62 = v19;
    v101 = v105;
    v104 = a9;
    v44 = v35;
    v91 = v44;
    v92 = self;
    v45 = v67;
    v93 = v45;
    v61 = v22;
    v64 = v22;
    v94 = v64;
    v46 = v73;
    v95 = v46;
    v47 = v68;
    v96 = v47;
    v48 = v71;
    v97 = v48;
    v103[1] = (id)a10;
    v63 = v69;
    v98 = v63;
    v99 = v36;
    v100 = v72;
    p_buf = &buf;
    objc_msgSend(v29, "setCompletionBlock:", v90);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("download-transfer-%@-mmcs-registration"), v44);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("download-transfer-%@-preauth"), v44);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v29;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("download-transfer-%@-mmcs-upload"), v44);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v46;
    *(_QWORD *)&v111 = 0;
    *((_QWORD *)&v111 + 1) = &v111;
    v112 = 0x3032000000;
    v113 = sub_22D9826E0;
    v114 = sub_22D9826F0;
    v115 = 0;
    v53 = (void *)v51;
    v115 = objc_alloc_init(MEMORY[0x24BE508D8]);
    objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 40), "startTimingForKey:", v49);
    v54 = self->_controller;
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = sub_22D9871D4;
    v74[3] = &unk_24F97A200;
    v89 = &v111;
    v55 = v49;
    v75 = v55;
    v76 = v45;
    v77 = v47;
    v78 = v48;
    v79 = v44;
    v80 = self;
    v56 = v66;
    v81 = v56;
    v57 = v50;
    v82 = v57;
    v83 = v52;
    v33 = v60;
    v84 = v33;
    v85 = v64;
    v58 = v53;
    v86 = v58;
    v59 = v65;
    v87 = v59;
    v88 = v63;
    -[MMCSController registerFilesForDownload:completionBlock:](v54, "registerFilesForDownload:completionBlock:", v59, v74);

    v22 = v61;
    v19 = v62;

    _Block_object_dispose(&v111, 8);
    objc_destroyWeak(v103);
    _Block_object_dispose(v105, 8);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_22D97D000, v32, OS_LOG_TYPE_INFO, "MMCS failing transfer invalid url %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (v72)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentErrorDomain"), 10, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, id, _QWORD, id, const __CFString *))v72 + 2))(v72, v19, v20, 0, v33, CFSTR("Invalid url"));
LABEL_26:

  }
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 fileSize:(unint64_t)a9 decryptionKey:(id)a10 sourceAppID:(id)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  IMTransferAgentController *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint8_t buf[16];

  v47 = a3;
  v43 = a4;
  v19 = a5;
  v46 = a6;
  v48 = a7;
  v45 = a8;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  im_assert_primary_queue();
  v42 = v21;
  if (IMGetCachedDomainBoolForKey())
  {
    v24 = v20;
    v26 = v46;
    v25 = v47;
    v27 = v45;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v28, OS_LOG_TYPE_INFO, "************* Failed attachment download is on ***********************", buf, 2u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v29, OS_LOG_TYPE_INFO, "************* Failed attachment download is on ***********************", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.private.IMTransferAgentForcedFailure"), 0, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, id, _QWORD, id, _QWORD))v23 + 2))(v23, v47, v19, 0, v30, 0);
    v31 = v23;
    v32 = v19;
    v33 = v42;
    v34 = v43;
  }
  else
  {
    v24 = v20;
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_randomSimilarFilePathAsPath:", v19);
      v30 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = v19;
    }
    v34 = v43;
    v36 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = sub_22D9896DC;
    v54[3] = &unk_24F97A250;
    v54[4] = self;
    v37 = v43;
    v55 = v37;
    v56 = v23;
    v41 = self;
    v31 = v23;
    v38 = (void *)MEMORY[0x22E31D724](v54);
    v49[0] = v36;
    v49[1] = 3221225472;
    v49[2] = sub_22D989964;
    v49[3] = &unk_24F97A2A0;
    v50 = v24;
    v51 = v19;
    v53 = v38;
    v25 = v47;
    v52 = v47;
    v44 = v38;
    v32 = v19;
    v33 = v42;
    LOBYTE(v40) = 1;
    v39 = v37;
    v27 = v45;
    v26 = v46;
    -[IMTransferAgentController _receiveFileTransfer:topic:path:requestURLString:ownerID:signature:allowReauthorize:fileSize:sourceAppID:progressBlock:completionBlock:](v41, "_receiveFileTransfer:topic:path:requestURLString:ownerID:signature:allowReauthorize:fileSize:sourceAppID:progressBlock:completionBlock:", v52, v39, v30, v46, v48, v45, v40, a9, v42, v22, v49);

  }
}

- (void)ensureSafeAttachment:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, char, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  im_assert_primary_queue();
  if (objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown")
    && (objc_msgSend(v7, "path"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = IMTransferRequestIsForMessages(v8, v10),
        v10,
        v11))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_22D97D000, v12, OS_LOG_TYPE_INFO, "Lockdown mode enabled, generating safe render for attachment: %@", buf, 0xCu);
      }

    }
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = sub_22D989F78;
    v19 = &unk_24F97A2C8;
    v13 = v7;
    v20 = v13;
    v21 = v9;
    v14 = (void *)MEMORY[0x22E31D724](&v16);
    objc_msgSend(MEMORY[0x24BE51370], "sharedInstance", v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "generateSafeRender:completionBlock:", v13, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t, id, _QWORD))v9 + 2))(v9, 1, v7, 0);
  }

}

- (MMCSController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
