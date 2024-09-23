@implementation IMSnapshotTranscoder

+ (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t PathComponent;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD block[12];
  uint8_t v95[4];
  id v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int128 buf;
  uint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v12 = IMBalloonExtensionIDWithSuffix();
  if (objc_msgSend_isEqualToString_(a5, v13, v12, v14, v15, v16, v17))
  {
    v18 = MEMORY[0x2207A8008](CFSTR("PKPeerPaymentBubbleView"), CFSTR("PassKitUI"));
    v19 = (void *)MEMORY[0x2207A8008](CFSTR("CKUIBehavior"), CFSTR("ChatKit"));
    v26 = (void *)objc_msgSend_sharedBehaviors(v19, v20, v21, v22, v23, v24, v25);
    v33 = objc_msgSend_isFromMe(a6, v27, v28, v29, v30, v31, v32);
    objc_msgSend_pluginBalloonInsetsForMessageFromMe_(v26, v34, v33, v35, v36, v37, v38);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v102 = 0x3052000000;
    v103 = sub_21DFC8B8C;
    v104 = sub_21DFC8B9C;
    v105 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DFC8BA8;
    block[3] = &unk_24E1FF870;
    block[4] = v18;
    block[5] = a4;
    block[8] = v39;
    block[9] = v40;
    block[10] = v41;
    block[11] = v42;
    block[6] = a6;
    block[7] = &buf;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    if (objc_msgSend_length(*(void **)(*((_QWORD *)&buf + 1) + 40), v43, v44, v45, v46, v47, v48))
    {
      v49 = (void *)IMPluginSnapshotCachesFileURL();
      PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v49, v50, v51, v52, v53, v54, v55);
      v93 = 0;
      if (PathComponent)
      {
        v63 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v56, v57, v58, v59, v60, v61);
        if (objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v63, v64, PathComponent, 1, 0, (uint64_t)&v93, v65))
        {
          v92 = 0;
          v69 = objc_msgSend_writeToURL_options_error_(*(void **)(*((_QWORD *)&buf + 1) + 40), v66, (uint64_t)v49, 0, (uint64_t)&v92, v67, v68);
          if ((v69 & 1) != 0)
          {
            v70 = 0;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v91 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v95 = 138412546;
                v96 = a3;
                v97 = 2112;
                v98 = v92;
                _os_log_impl(&dword_21DFB1000, v91, OS_LOG_TYPE_INFO, "Failed to write snapshot for message %@ Error: %@", v95, 0x16u);
              }
            }
            v70 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v88, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -10, 0, v89, v90);
          }
          goto LABEL_20;
        }
      }
      if (IMOSLoggingEnabled())
      {
        v79 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v95 = 138412802;
          v96 = a3;
          v97 = 2112;
          v98 = PathComponent;
          v99 = 2112;
          v100 = v93;
          _os_log_impl(&dword_21DFB1000, v79, OS_LOG_TYPE_INFO, "Failed to create snapshot directory for message %@ with url %@ Error: %@", v95, 0x20u);
        }
      }
      v80 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v76, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -12, 0, v77, v78);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          v85 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v95 = 138412546;
          v96 = a3;
          v97 = 2112;
          v98 = v85;
          _os_log_impl(&dword_21DFB1000, v84, OS_LOG_TYPE_INFO, "Failed to generate snapshot for message %@ %@", v95, 0x16u);
        }
      }
      v80 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v81, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -9, 0, v82, v83);
    }
    v70 = v80;
    v69 = 0;
LABEL_20:
    if (IMOSLoggingEnabled())
    {
      v86 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v95 = 138412546;
        v96 = a3;
        v97 = 2112;
        v98 = v87;
        _os_log_impl(&dword_21DFB1000, v86, OS_LOG_TYPE_INFO, "Generated snapshot for message %@ %@", v95, 0x16u);
      }
    }

    (*((void (**)(id, uint64_t, uint64_t))a7 + 2))(a7, v69, v70);
    _Block_object_dispose(&buf, 8);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v74 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a5;
      _os_log_impl(&dword_21DFB1000, v74, OS_LOG_TYPE_INFO, "Transcoder snapshot request for an unsupported plugin bundle: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v75 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v71, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -1, 0, v72, v73);
  (*((void (**)(id, _QWORD, uint64_t))a7 + 2))(a7, 0, v75);
}

@end
