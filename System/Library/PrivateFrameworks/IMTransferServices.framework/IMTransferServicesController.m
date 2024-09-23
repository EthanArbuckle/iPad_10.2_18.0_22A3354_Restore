@implementation IMTransferServicesController

+ (id)sharedInstance
{
  if (qword_253EA4480 != -1)
    dispatch_once(&qword_253EA4480, &unk_24C0A9548);
  return (id)qword_253EA4490;
}

- (void)_sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 retries:(int)a9 progressBlock:(id)a10 completionBlock:(id)a11
{
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  xpc_object_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  NSObject *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  uint64_t v134;
  NSObject *v135;
  int v136;
  _xpc_connection_s *v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  _BOOL4 v142;
  _QWORD handler[14];
  int v145;
  BOOL v146;
  uint64_t v147;
  uint64_t v148;
  int64_t (*v149)(uint64_t, void *);
  void *v150;
  id v151;
  _BYTE *v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(uint64_t);
  void *v156;
  _BYTE *v157;
  uint64_t v158;
  uint8_t v159[4];
  void *v160;
  __int16 v161;
  int v162;
  _BYTE buf[24];
  id v164;
  void (*v165)(uint64_t);
  uint64_t v166;
  uint64_t v167;

  v142 = a8;
  v167 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a6;
      *(_WORD *)&buf[22] = 2112;
      v164 = a7;
      _os_log_impl(&dword_2084AC000, v22, OS_LOG_TYPE_INFO, "TransferServices received request to transfer %@  ID: %@ sourceAppID: %@", buf, 0x20u);
    }
  }
  v158 = 0;
  v23 = (void *)MEMORY[0x24BDBCF48];
  v24 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v15, v16, v17, v18, v19, v20, v21);
  v32 = objc_msgSend_pathExtension(a3, v25, v26, v27, v28, v29, v30, v31);
  v39 = objc_msgSend__randomTemporaryPathWithSuffix_(v24, v33, v32, v34, v35, v36, v37, v38);
  v46 = (void *)objc_msgSend_fileURLWithPath_(v23, v40, v39, v41, v42, v43, v44, v45);
  if (IMOSLoggingEnabled())
  {
    v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v46;
      _os_log_impl(&dword_2084AC000, v54, OS_LOG_TYPE_INFO, "Attempting to clone current transfer URL %@ to new URL %@", buf, 0x16u);
    }
  }
  v55 = objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v47, v48, v49, v50, v51, v52, v53);
  v62 = objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v56, (uint64_t)a3, v57, v58, v59, v60, v61);
  LOBYTE(v55) = objc_msgSend_copyItemAtURL_toURL_error_((void *)v55, v63, v62, (uint64_t)v46, (uint64_t)&v158, v64, v65, v66);
  v67 = IMOSLoggingEnabled();
  if ((v55 & 1) != 0)
  {
    if (v67)
    {
      v72 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2084AC000, v72, OS_LOG_TYPE_INFO, "Connecting to transfer agent", buf, 2u);
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v164 = sub_2084AE3B4;
    v165 = sub_2084AE3C4;
    v166 = 0xAAAAAAAAAAAAAAAALL;
    im_primary_queue();
    v166 = IMXPCCreateConnectionForServiceWithQueue();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v153 = MEMORY[0x24BDAC760];
      v154 = 3221225472;
      v155 = sub_2084AE3D0;
      v156 = &unk_24C0A9590;
      v157 = buf;
      v147 = MEMORY[0x24BDAC760];
      v148 = 3221225472;
      v149 = sub_2084AE488;
      v150 = &unk_24C0A95B8;
      v151 = a10;
      v152 = buf;
      IMXPCConfigureConnection();
      v73 = xpc_dictionary_create(0, 0, 0);
      v81 = (void *)objc_msgSend_path(v46, v74, v75, v76, v77, v78, v79, v80);
      v89 = objc_msgSend_UTF8String(v81, v82, v83, v84, v85, v86, v87, v88);
      v140 = objc_msgSend_UTF8String(a6, v90, v91, v92, v93, v94, v95, v96);
      IMInsertStringsToXPCDictionary();
      v139 = objc_msgSend_UTF8String(a4, v97, v98, v99, v100, v101, v102, v103, v89, "transferID", v140, 0);
      IMInsertStringsToXPCDictionary();
      objc_msgSend_UTF8String(a7, v104, v105, v106, v107, v108, v109, v110, v139, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      IMInsertDictionariesToXPCDictionary();
      v118 = (void *)objc_msgSend_path(v46, v111, v112, v113, v114, v115, v116, v117, a5, 0, v142, 0);
      objc_msgSend_UTF8String(v118, v119, v120, v121, v122, v123, v124, v125);
      v126 = (void *)sandbox_extension_issue_file();
      if (v126)
      {
        IMInsertStringsToXPCDictionary();
        free(v126);
      }
      else if (IMOSLoggingEnabled())
      {
        v135 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
        {
          v136 = *__error();
          *(_DWORD *)v159 = 138412546;
          v160 = v46;
          v161 = 1024;
          v162 = v136;
          _os_log_impl(&dword_2084AC000, v135, OS_LOG_TYPE_INFO, "Unable to grant access to path (sandbox extension is NULL) (file path: %@) errno %d", v159, 0x12u);
        }
      }
      v137 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
      v138 = im_primary_queue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = sub_2084AE624;
      handler[3] = &unk_24C0A95E0;
      v145 = a9;
      handler[4] = self;
      handler[5] = a3;
      handler[6] = a4;
      handler[7] = a5;
      handler[8] = a6;
      handler[9] = a7;
      v146 = v142;
      handler[10] = v46;
      handler[11] = a10;
      handler[12] = a11;
      handler[13] = buf;
      xpc_connection_send_message_with_reply(v137, v73, v138, handler);
      xpc_release(v73);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v133 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v159 = 0;
          _os_log_impl(&dword_2084AC000, v133, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v159, 2u);
        }
      }
      if (a11)
      {
        v134 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v129, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -3, 0, v130, v131, v132);
        (*((void (**)(id, id, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a11 + 2))(a11, a3, 0, v134, 0, 0, 0, 0, 0, 0);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v67)
    {
      v127 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v158;
        _os_log_impl(&dword_2084AC000, v127, OS_LOG_TYPE_INFO, "Cloning failed with error %@, giving up since we're not guaranteed to get a file", buf, 0xCu);
      }
    }
    if (a11)
    {
      v128 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v68, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -2, 0, v69, v70, v71);
      (*((void (**)(id, id, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a11 + 2))(a11, a3, 0, v128, 0, 0, 0, 0, 0, 0);
    }
  }
}

- (void)sendFilePath:(id)a3 topic:(id)a4 transferID:(id)a5 encryptFile:(BOOL)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  int v8;

  v8 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a5, 0, a6, v8, a7, a8);
}

- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 encryptFile:(BOOL)a7 progressBlock:(id)a8 completionBlock:(id)a9
{
  int v9;

  v9 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, 0, a7, v9, a8, a9);
}

- (void)sendFilePath:(id)a3 topic:(id)a4 userInfo:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 encryptFile:(BOOL)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  int v10;

  v10 = 0;
  objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v10, a9, a10);
}

- (void)_receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 retries:(int)a11 fileSize:(unint64_t)value progressBlock:(id)a13 completionBlock:(id)a14
{
  NSObject *v18;
  xpc_object_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
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
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *PathComponent;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  int v114;
  _xpc_connection_s *v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD handler[17];
  int v124;
  _QWORD v125[12];
  uint8_t v126[4];
  void *v127;
  __int16 v128;
  uint64_t v129;
  _BYTE buf[24];
  id v131;
  void (*v132)(uint64_t);
  uint64_t v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      v131 = a8;
      _os_log_impl(&dword_2084AC000, v18, OS_LOG_TYPE_INFO, "TransferServices received request to receive transfer %@  ID: %@ sourceAppID: %@", buf, 0x20u);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v131 = sub_2084AE3B4;
  v132 = sub_2084AE3C4;
  v133 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v133 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v125[7] = MEMORY[0x24BDAC760];
    v125[8] = 3221225472;
    v125[9] = sub_2084AF28C;
    v125[10] = &unk_24C0A9590;
    v125[11] = buf;
    v125[1] = MEMORY[0x24BDAC760];
    v125[2] = 3221225472;
    v125[3] = sub_2084AF344;
    v125[4] = &unk_24C0A95B8;
    v125[5] = a13;
    v125[6] = buf;
    IMXPCConfigureConnection();
    v19 = xpc_dictionary_create(0, 0, 0);
    v117 = objc_msgSend_UTF8String(a4, v20, v21, v22, v23, v24, v25, v26);
    IMInsertStringsToXPCDictionary();
    objc_msgSend_UTF8String(a5, v27, v28, v29, v30, v31, v32, v33, v117, 0);
    objc_msgSend_UTF8String(a3, v34, v35, v36, v37, v38, v39, v40);
    v48 = objc_msgSend_UTF8String(a7, v41, v42, v43, v44, v45, v46, v47);
    v119 = objc_msgSend_UTF8String(a6, v49, v50, v51, v52, v53, v54, v55);
    IMInsertStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    v118 = objc_msgSend_UTF8String(a8, v56, v57, v58, v59, v60, v61, v62, 0, 0, a10, 0, v48, "urlString", v119, 0);
    IMInsertStringsToXPCDictionary();
    xpc_dictionary_set_uint64(v19, "file-size", value);
    if (a5)
    {
      v69 = (void *)objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v63, (uint64_t)a5, v64, v65, v66, v67, v68, v118, 0);
      PathComponent = (void *)objc_msgSend_URLByDeletingLastPathComponent(v69, v70, v71, v72, v73, v74, v75, v76);
      v125[0] = 0;
      v85 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v78, v79, v80, v81, v82, v83, v84);
      if ((objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v85, v86, (uint64_t)PathComponent, 1, 0, (uint64_t)v125, v87, v88) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v96 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v126 = 138412546;
            v127 = PathComponent;
            v128 = 2112;
            v129 = v125[0];
            _os_log_impl(&dword_2084AC000, v96, OS_LOG_TYPE_INFO, "Unable to create containing directory (%@) with error: %@", v126, 0x16u);
          }
        }
      }
      v97 = (void *)objc_msgSend_path(PathComponent, v89, v90, v91, v92, v93, v94, v95);
      objc_msgSend_UTF8String(v97, v98, v99, v100, v101, v102, v103, v104);
      v105 = (void *)sandbox_extension_issue_file();
      if (v105)
      {
        IMInsertStringsToXPCDictionary();
        free(v105);
      }
      else if (IMOSLoggingEnabled())
      {
        v113 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          v114 = *__error();
          *(_DWORD *)v126 = 138412546;
          v127 = PathComponent;
          v128 = 1024;
          LODWORD(v129) = v114;
          _os_log_impl(&dword_2084AC000, v113, OS_LOG_TYPE_INFO, "Unable to grant access to path (sandbox extension is NULL) (file path: %@) errno %d", v126, 0x12u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v112 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v126 = 0;
          _os_log_impl(&dword_2084AC000, v112, OS_LOG_TYPE_INFO, "TransferServices received request to receive transfer but the receivePath was NULL", v126, 2u);
        }
      }
      IMReportAutoBugCapture();
    }
    v115 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
    v116 = im_primary_queue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_2084AF4E0;
    handler[3] = &unk_24C0A9608;
    v124 = a11;
    handler[4] = self;
    handler[5] = a3;
    handler[6] = a4;
    handler[7] = a5;
    handler[8] = a6;
    handler[9] = a7;
    handler[10] = a8;
    handler[11] = a9;
    handler[12] = a10;
    handler[13] = a13;
    handler[14] = a14;
    handler[15] = buf;
    handler[16] = value;
    xpc_connection_send_message_with_reply(v115, v19, v116, handler);
    xpc_release(v19);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v110 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v126 = 0;
        _os_log_impl(&dword_2084AC000, v110, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v126, 2u);
      }
    }
    if (a14)
    {
      v111 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v106, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -3, 0, v107, v108, v109);
      (*((void (**)(id, id, id, _QWORD, uint64_t, _QWORD))a14 + 2))(a14, a3, a5, 0, v111, 0);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 fileSize:(unint64_t)a10 progressBlock:(id)a11 completionBlock:(id)a12
{
  int v12;

  v12 = 0;
  objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8, a9, v12, a10, a11, a12);
}

- (void)receiveFileTransfer:(id)a3 topic:(id)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 sourceAppID:(id)a8 signature:(id)a9 decryptionKey:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  int v13;

  v13 = 0;
  objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10, v13, a11, a12, a13);
}

- (void)cancelSendTransferID:(id)a3
{
  NSObject *v4;
  xpc_object_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  uint8_t v15[8];
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_2084AC000, v4, OS_LOG_TYPE_INFO, "TransferServices received request to cancel send: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3052000000;
  v23 = sub_2084AE3B4;
  v24 = sub_2084AE3C4;
  v25 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v25 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = sub_2084AFB78;
    v19 = &unk_24C0A9590;
    p_buf = &buf;
    IMXPCConfigureConnection();
    v5 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    objc_msgSend_UTF8String(a3, v6, v7, v8, v9, v10, v11, v12, 1, 0);
    IMInsertStringsToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)&buf + 1) + 40), v5);
    xpc_release(v5);
    v13 = *(_xpc_connection_s **)(*((_QWORD *)&buf + 1) + 40);
    if (v13)
    {
      xpc_connection_cancel(v13);
      xpc_release(*(xpc_object_t *)(*((_QWORD *)&buf + 1) + 40));
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2084AC000, v14, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v15, 2u);
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)preWarmMMCSForOwnerID:(id)a3
{
  NSObject *v3;
  xpc_object_t v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2084AC000, v3, OS_LOG_TYPE_INFO, "TransferServices received request to prewarm MMCS connection", buf, 2u);
    }
  }
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3052000000;
  v22 = sub_2084AE3B4;
  v23 = sub_2084AE3C4;
  v24 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v24 = IMXPCCreateConnectionForServiceWithQueue();
  if (*((_QWORD *)v20 + 5))
  {
    v13 = buf;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = sub_2084AFE8C;
    v17 = &unk_24C0A9590;
    v18 = buf;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = sub_2084AFED8;
    v12 = &unk_24C0A9670;
    IMXPCConfigureConnection();
    v4 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    IMInsertStringsToXPCDictionary();
    xpc_connection_send_message(*((xpc_connection_t *)v20 + 5), v4);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2084AC000, v5, OS_LOG_TYPE_INFO, "send prewarm message to transfer agent", v8, 2u);
      }
    }
    xpc_release(v4);
    v6 = (_xpc_connection_s *)*((_QWORD *)v20 + 5);
    if (v6)
    {
      xpc_connection_cancel(v6);
      xpc_release(*((xpc_object_t *)v20 + 5));
      *((_QWORD *)v20 + 5) = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2084AC000, v7, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v8, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 completionBlock:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_getNicknameWithRecordID_decryptionKey_wallpaperDataTag_wallpaperLowResDataTag_wallpaperMetadataTag_completionBlock_, a3, a4, 0, 0, 0, a5);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8
{
  objc_msgSend_getNicknameWithRecordID_decryptionKey_wallpaperDataTag_wallpaperLowResDataTag_wallpaperMetadataTag_isKnownSender_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 completionBlock:(id)a9
{
  char v9;

  v9 = 1;
  objc_msgSend_getNicknameWithRecordID_decryptionKey_wallpaperDataTag_wallpaperLowResDataTag_wallpaperMetadataTag_isKnownSender_shouldDecodeImageFields_completionBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v9, a9);
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10
{
  NSObject *v11;
  uint64_t v12;
  xpc_object_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _xpc_connection_s *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD handler[6];
  uint8_t v31[16];
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  __int128 *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_2084AC000, v11, OS_LOG_TYPE_INFO, "TransferServices received request to get nickname with record ID %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3052000000;
  v44 = sub_2084AE3B4;
  v45 = sub_2084AE3C4;
  v46 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v46 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v12 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = sub_2084B0480;
    v40 = &unk_24C0A9590;
    p_buf = &buf;
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = sub_2084B04CC;
    v35 = &unk_24C0A9670;
    v36 = &buf;
    v37 = MEMORY[0x24BDAC760];
    IMXPCConfigureConnection();
    v13 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    objc_msgSend_UTF8String(a3, v14, v15, v16, v17, v18, v19, v20, 1, 0);
    IMInsertStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_2084AC000, v21, OS_LOG_TYPE_INFO, "Sending get nickname message to transfer agent", v31, 2u);
      }
    }
    v22 = *(_xpc_connection_s **)(*((_QWORD *)&buf + 1) + 40);
    v23 = im_primary_queue();
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = sub_2084B05F4;
    handler[3] = &unk_24C0A9698;
    handler[4] = a10;
    handler[5] = &buf;
    xpc_connection_send_message_with_reply(v22, v13, v23, handler);
    xpc_release(v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_2084AC000, v28, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v31, 2u);
      }
    }
    v29 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v24, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -3, 0, v25, v26, v27);
    if (a10)
      (*((void (**)(id, _QWORD, uint64_t))a10 + 2))(a10, 0, v29);
  }
  _Block_object_dispose(&buf, 8);
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2084B0958;
  v8[3] = &unk_24C0A96C0;
  v8[4] = a5;
  objc_msgSend_setPersonalNickname_oldRecordID_completionBlockWithWallpaperTags_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)v8, v5, v6, v7);
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 completionBlockWithWallpaperTags:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  xpc_object_t v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD handler[6];
  uint8_t v21[16];
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  _BYTE *v31;
  _BYTE buf[24];
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_2084AC000, v8, OS_LOG_TYPE_INFO, "TransferServices received request to upload new personal nickname: %@ and delete record with ID: %@", buf, 0x16u);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v33 = sub_2084AE3B4;
  v34 = sub_2084AE3C4;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v35 = IMXPCCreateConnectionForServiceWithQueue();
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v9 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = sub_2084B0D1C;
    v30 = &unk_24C0A9590;
    v31 = buf;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_2084B0D68;
    v25 = &unk_24C0A9670;
    v26 = buf;
    v27 = MEMORY[0x24BDAC760];
    IMXPCConfigureConnection();
    v10 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    IMInsertKeyedCodableObjectsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2084AC000, v11, OS_LOG_TYPE_INFO, "Sending upload nickname message to transfer agent", v21, 2u);
      }
    }
    v12 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
    v13 = im_primary_queue();
    handler[0] = v9;
    handler[1] = 3221225472;
    handler[2] = sub_2084B0E90;
    handler[3] = &unk_24C0A9698;
    handler[4] = a5;
    handler[5] = buf;
    xpc_connection_send_message_with_reply(v12, v10, v13, handler);
    xpc_release(v10);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2084AC000, v18, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v21, 2u);
      }
    }
    v19 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v14, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -3, 0, v15, v16, v17);
    if (a5)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 0, 0, 0, 0, 0, 0, 0, v19);
  }
  _Block_object_dispose(buf, 8);
}

- (void)deleteAllPersonalNicknamesWithCompletion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  xpc_object_t v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD handler[6];
  uint8_t v17[16];
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;

  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2084AC000, v4, OS_LOG_TYPE_INFO, "TransferServices received requestd to delete all nicknames", buf, 2u);
    }
  }
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3052000000;
  v31 = sub_2084AE3B4;
  v32 = sub_2084AE3C4;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  im_primary_queue();
  v33 = IMXPCCreateConnectionForServiceWithQueue();
  if (*((_QWORD *)v29 + 5))
  {
    v5 = MEMORY[0x24BDAC760];
    v22 = buf;
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = sub_2084B158C;
    v26 = &unk_24C0A9590;
    v27 = buf;
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = sub_2084B15D8;
    v21 = &unk_24C0A9670;
    IMXPCConfigureConnection();
    v6 = xpc_dictionary_create(0, 0, 0);
    IMInsertBoolsToXPCDictionary();
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2084AC000, v7, OS_LOG_TYPE_INFO, "Sending delete all nicknames message to transfer agent", v17, 2u);
      }
    }
    v8 = (_xpc_connection_s *)*((_QWORD *)v29 + 5);
    v9 = im_primary_queue();
    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = sub_2084B1700;
    handler[3] = &unk_24C0A9698;
    handler[4] = a3;
    handler[5] = buf;
    xpc_connection_send_message_with_reply(v8, v6, v9, handler);
    xpc_release(v6);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2084AC000, v14, OS_LOG_TYPE_INFO, "Unable to connect to transfer service", v17, 2u);
      }
    }
    v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v10, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -3, 0, v11, v12, v13);
    if (a3)
      (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v15);
  }
  _Block_object_dispose(buf, 8);
}

@end
