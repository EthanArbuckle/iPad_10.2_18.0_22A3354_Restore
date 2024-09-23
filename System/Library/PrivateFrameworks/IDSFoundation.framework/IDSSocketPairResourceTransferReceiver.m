@implementation IDSSocketPairResourceTransferReceiver

+ (id)incomingFilePathForMessageUUID:(id)a3
{
  if (!a3)
    return 0;
  sub_19BA528A8(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)incomingFilePath
{
  return sub_19BA528A8(0);
}

+ (id)modernIncomingFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  sub_19BA57E80(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0C99D20];
  NSHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObjects_(v4, v6, (uint64_t)v5, v7, CFSTR("/Library/IdentityServices/files/"), v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathWithComponents_(v3, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IDSSocketPairResourceTransferReceiver)initWithMessage:(id)a3 resumeResourceTransfers:(BOOL)a4 receiverError:(unsigned __int8 *)a5
{
  _BOOL4 v5;
  id v7;
  IDSSocketPairResourceTransferReceiver *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  IDSSocketPairResourceTransferReceiver *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  const char *v61;
  uint64_t v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  NSObject *v76;
  unint64_t totalBytesExpected;
  unsigned __int8 *v78;
  char v79;
  NSObject *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  const char *v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  const char *v98;
  uint64_t v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  char v104;
  NSObject *v105;
  size_t MaximumSizeOfFileSystemRepresentation;
  char *v107;
  const char *v108;
  double v109;
  char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  double v114;
  void *v115;
  size_t v116;
  const char *v117;
  double v118;
  id v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  void *v127;
  const char *v128;
  double v129;
  uint64_t v130;
  NSObject *v131;
  double v132;
  const char *v133;
  uint64_t v134;
  double v135;
  void *v136;
  const char *v137;
  double v138;
  const char *v139;
  double v140;
  unint64_t v141;
  NSObject *v142;
  void *v143;
  const char *v144;
  double v145;
  NSObject *v146;
  NSDate *v147;
  const char *v148;
  double v149;
  const char *v150;
  void *v151;
  double v152;
  char v153;
  uint64_t v154;
  double v155;
  NSObject *v156;
  char *v157;
  const char *v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  NSString *peerResponseIdentifier;
  const char *v163;
  uint64_t v164;
  double v165;
  uint64_t v166;
  NSString *messageUUID;
  IDSSocketPairResourceTransferReceiver *v168;
  id v170;
  unint64_t v171;
  void *v172;
  void *v173;
  uint64_t v174;
  NSDate *v175;
  id v176;
  id obj;
  uint64_t v178;
  __CFString *string;
  void *v180;
  id v181;
  id v182;
  void *v183;
  id v184;
  NSDate **p_expiryDate;
  unint64_t v186;
  id v187;
  void *v188;
  void *v189;
  void *v191;
  void *v192;
  id v193;
  objc_super v194;
  id v195;
  uint8_t buf[4];
  _BYTE v197[18];
  __int16 v198;
  NSDate *v199;
  _QWORD v200[4];

  v5 = a4;
  v200[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v194.receiver = self;
  v194.super_class = (Class)IDSSocketPairResourceTransferReceiver;
  v8 = -[IDSSocketPairResourceTransferReceiver init](&v194, sel_init);
  v12 = v8;
  if (!v8)
    goto LABEL_147;
  v8->_fileDescriptor = -1;
  if (v5)
  {
    objc_msgSend_data(v7, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_length(v13, v14, v15, v16);
    objc_msgSend_subdataWithRangeNoCopy_(v13, v18, 1, v19, v17 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compressed(v7, v21, v22, v23))
    {
      objc_msgSend__FTDecompressData(v20, v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v27;
    }
    goto LABEL_7;
  }
  v28 = objc_msgSend_compressed(v7, v9, v10, v11);
  objc_msgSend_data(v7, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v32;
  if (v28)
  {
    objc_msgSend__FTDecompressData(v32, v33, v34, v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_9;
  }
  v20 = v32;
LABEL_9:
  JWDecodeDictionary();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  sub_19BA53E38(v37, v36, CFSTR("ids-message-resource-transfer-url"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_class();
  sub_19BA53E38(v38, v36, CFSTR("ids-message-resource-transfer-total-bytes"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_opt_class();
  sub_19BA53E38(v39, v36, CFSTR("ids-message-resource-transfer-expiry-date"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v40;
  if (v40)
  {
    v45 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend_doubleValue(v40, v41, v42, v43);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v49;
    if (v191 && v192)
    {
      if (v49)
      {
        objc_msgSend_timeIntervalSinceNow(v49, v41, v42, v50);
        if (v54 <= 3600.0)
        {
          objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v52, v53, 3600.0);
        }
        else
        {
          objc_msgSend_timeIntervalSinceNow(v51, v52, v53, 3600.0);
          objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v56, v57, v55 * 1.1 + 60.0);
        }
        v58 = objc_claimAutoreleasedReturnValue();

        v51 = (void *)v58;
LABEL_29:
        p_expiryDate = &v12->_expiryDate;
        objc_storeStrong((id *)&v12->_expiryDate, v51);
        v12->_totalBytesExpected = objc_msgSend_unsignedLongLongValue(v192, v61, v62, v63);
        sub_19BA528A8(0);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = 0;
        objc_msgSend_attributesOfFileSystemForPath_error_(v67, v68, (uint64_t)v189, v69, &v193);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v193;

        if (!v188)
        {
          OSLogHandleForIDSCategory();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v197 = v5;
            *(_WORD *)&v197[4] = 2112;
            *(_QWORD *)&v197[6] = v189;
            _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: cannot get system attributes (%d) for path %@", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
              MarcoLog();
            if (IMShouldLog())
              IMLogString();
          }
          v78 = a5;
          if (!a5)
            goto LABEL_50;
          v79 = 2;
          goto LABEL_49;
        }
        objc_msgSend_objectForKey_(v188, v70, *MEMORY[0x1E0CB2B00], v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = objc_msgSend_unsignedLongLongValue(v72, v73, v74, v75);

        if (v186 < v12->_totalBytesExpected)
        {
          OSLogHandleForIDSCategory();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            totalBytesExpected = v12->_totalBytesExpected;
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)v197 = totalBytesExpected;
            *(_WORD *)&v197[8] = 2048;
            *(_QWORD *)&v197[10] = v186;
            v198 = 1024;
            LODWORD(v199) = v5;
            _os_log_impl(&dword_19B949000, v76, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: system space unavailable file %llu system %llu (%d)", buf, 0x1Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
              MarcoLog();
            if (IMShouldLog())
              IMLogString();
          }
          v78 = a5;
          if (!a5)
            goto LABEL_50;
          v79 = 4;
LABEL_49:
          *v78 = v79;
LABEL_50:
          v60 = 1;
LABEL_144:

          goto LABEL_145;
        }
        v81 = objc_opt_class();
        sub_19BA53E38(v81, v36, CFSTR("ids-message-resource-transfer-metadata"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_messageUUID(v7, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = v191;
        v182 = v85;
        objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v86, (uint64_t)v181, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastPathComponent(v88, v89, v90, v91);
        v183 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v183)
        {
          OSLogHandleForIDSCategory();
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v197 = v181;
            _os_log_impl(&dword_19B949000, v121, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't get last path component from %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v170 = v181;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v170 = v181;
              IMLogString();
            }
          }
          v119 = 0;
          LODWORD(v178) = -1;
          goto LABEL_108;
        }
        sub_19BA528A8(v182);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x1E0CB3940];
        v200[0] = v180;
        v200[1] = v183;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v93, (uint64_t)v200, v94, 2);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pathWithComponents_(v92, v96, (uint64_t)v95, v97);
        string = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!string)
        {
          OSLogHandleForIDSCategory();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v197 = v181;
            *(_WORD *)&v197[8] = 2112;
            *(_QWORD *)&v197[10] = v180;
            _os_log_impl(&dword_19B949000, v122, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't get new path from original %@ destination %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v170 = v181;
              v172 = v180;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v170 = v181;
              v172 = v180;
              IMLogString();
            }
          }
          v119 = 0;
          LODWORD(v178) = -1;
          goto LABEL_107;
        }
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = 0;
        v104 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v101, v102, (uint64_t)v180, v103, 1, 0, &v195);
        v176 = v195;

        if ((v104 & 1) == 0)
        {
          OSLogHandleForIDSCategory();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v197 = v181;
            *(_WORD *)&v197[8] = 2112;
            *(_QWORD *)&v197[10] = v180;
            _os_log_impl(&dword_19B949000, v105, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't create new directory from original %@ destination %@ (may be benign)", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v170 = v181;
              v172 = v180;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v170 = v181;
              v172 = v180;
              IMLogString();
            }
          }
        }
        MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(string);
        v107 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xDB731B8EuLL);
        v110 = v107;
        if (v107)
        {
          objc_msgSend_getFileSystemRepresentation_maxLength_(string, v108, (uint64_t)v107, v109, MaximumSizeOfFileSystemRepresentation);
          if (IMGetDomainBoolForKey())
            v111 = open(v110, 521, 384, v172);
          else
            v111 = open(v110, 1545, 384, v172);
          v178 = v111;
          if ((_DWORD)v111 != -1)
          {
            objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v112, v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = strlen(v110);
            objc_msgSend_stringWithFileSystemRepresentation_length_(v115, v117, (uint64_t)v110, v118, v116);
            v119 = (id)objc_claimAutoreleasedReturnValue();

            free(v110);
            OSLogHandleForIDSCategory();
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v197 = v181;
              *(_WORD *)&v197[8] = 2112;
              *(_QWORD *)&v197[10] = string;
              v198 = 1024;
              LODWORD(v199) = v178;
              _os_log_impl(&dword_19B949000, v120, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: originalFilePath %@ newFilePath %@ newFileDescriptor %d", buf, 0x1Cu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v172 = string;
                v174 = v178;
                v170 = v181;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v174 = v178;
                v170 = v181;
                v172 = string;
                IMLogString();
              }
            }
            goto LABEL_106;
          }
          v130 = *__error();
          OSLogHandleForIDSCategory();
          v131 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v197 = v110;
            *(_WORD *)&v197[8] = 1024;
            *(_DWORD *)&v197[10] = v130;
            _os_log_impl(&dword_19B949000, v131, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't open file for writing @%s errno %d", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v170 = v110;
              v172 = (void *)v130;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v170 = v110;
              v172 = (void *)v130;
              IMLogString();
            }
          }
          IDSAssertNonFatalErrnoWithSource(v130, "SocketPairMessage open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2002, v132);
          objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v133, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeItemAtPath_error_(v136, v137, (uint64_t)v180, v138, 0);

          free(v110);
        }
        else
        {
          OSLogHandleForIDSCategory();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v197 = MaximumSizeOfFileSystemRepresentation;
            _os_log_impl(&dword_19B949000, v123, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't allocate %ld bytes for new file path", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v170 = (id)MaximumSizeOfFileSystemRepresentation;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v170 = (id)MaximumSizeOfFileSystemRepresentation;
              IMLogString();
            }
          }
          objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v124, v125, v126, v170, v172);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeItemAtPath_error_(v127, v128, (uint64_t)v180, v129, 0);

        }
        v119 = 0;
        LODWORD(v178) = -1;
LABEL_106:

LABEL_107:
LABEL_108:

        v184 = v119;
        v12->_fileDescriptor = v178;

        objc_storeStrong((id *)&v12->_resourcePath, v119);
        if (v12->_fileDescriptor == -1)
        {
          v154 = *__error();
          IDSAssertNonFatalErrnoWithSource(v154, "IDSSocketPairResourceTransferReceiver", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2116, v155);
          OSLogHandleForIDSCategory();
          v156 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
          {
            v157 = strerror(v154);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v197 = v154;
            *(_WORD *)&v197[4] = 2080;
            *(_QWORD *)&v197[6] = v157;
            _os_log_impl(&dword_19B949000, v156, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: cannot create file (errno: %d (%s))", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              strerror(v154);
              MarcoLog();
            }
            if (IMShouldLog())
            {
              strerror(v154);
              IMLogString();
            }
          }
          if (a5)
            *a5 = 2;
          v60 = 1;
        }
        else
        {
          IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSSocketPairMessage.m", 2122, 0);
          if (fchmod(v12->_fileDescriptor, 0x1B6u) == -1)
          {
            v141 = *__error();
            OSLogHandleForIDSCategory();
            v142 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v197 = v141;
              _os_log_impl(&dword_19B949000, v142, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: failed to fchmod the file %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v170 = (id)v141;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v170 = (id)v141;
                IMLogString();
              }
            }
          }
          objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99E08], v139, (uint64_t)v36, v140, v170, v172, v174);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v143, v144, (uint64_t)CFSTR("ids-message-resource-transfer-data"), v145);
          OSLogHandleForIDSCategory();
          v146 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            v147 = *p_expiryDate;
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v197 = v186;
            *(_WORD *)&v197[8] = 2112;
            *(_QWORD *)&v197[10] = v143;
            v198 = 2112;
            v199 = v147;
            _os_log_impl(&dword_19B949000, v146, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: init called with filesystem-free-size %llu header %@ expiryDate %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v173 = v143;
              v175 = *p_expiryDate;
              v171 = v186;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v173 = v143;
              v175 = *p_expiryDate;
              v171 = v186;
              IMLogString();
            }
          }
          objc_msgSend_objectForKey_(v36, v148, (uint64_t)CFSTR("ids-message-resource-transfer-data"), v149, v171, v173, v175);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
            v153 = objc_msgSend_writeResourceData_resourceByteOffset_(v12, v150, (uint64_t)v151, v152, 0);
          else
            v153 = objc_msgSend_writeResourceData_(v12, v150, (uint64_t)v151, v152);
          if ((v153 & 1) != 0)
          {
            objc_storeStrong((id *)&v12->_metadata, obj);
            objc_msgSend_peerResponseIdentifier(v7, v158, v159, v160);
            v161 = objc_claimAutoreleasedReturnValue();
            peerResponseIdentifier = v12->_peerResponseIdentifier;
            v12->_peerResponseIdentifier = (NSString *)v161;

            objc_msgSend_messageUUID(v7, v163, v164, v165);
            v166 = objc_claimAutoreleasedReturnValue();
            messageUUID = v12->_messageUUID;
            v12->_messageUUID = (NSString *)v166;

            v60 = 0;
            v12->_resumeResourceTransfers = v5;
          }
          else
          {
            if (a5)
              *a5 = 3;
            v60 = 1;
          }

        }
        goto LABEL_144;
      }
LABEL_17:
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v41, v42, 172800.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
  }
  else
  {
    v51 = 0;
    if (v191 && v192)
      goto LABEL_17;
  }
  OSLogHandleForIDSCategory();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v197 = v5;
    _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: missing header (%d)", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }
  v60 = 1;
  if (a5)
    *a5 = 1;
LABEL_145:

  if (!v60)
  {
LABEL_147:
    v168 = v12;
    goto LABEL_148;
  }
  v168 = 0;
LABEL_148:

  return v168;
}

- (void)abortTransfer
{
  int fileDescriptor;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  NSObject *v8;
  NSString *resourcePath;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_fileDescriptor = -1;
    v7 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, v4, v5, v6);
    if (unlink(v7))
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 138412290;
        v11 = resourcePath;
        _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: failed to unlink aborted transfer @ %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
    }
  }
}

- (void)dealloc
{
  int fileDescriptor;
  objc_super v4;

  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
    close(fileDescriptor);
  v4.receiver = self;
  v4.super_class = (Class)IDSSocketPairResourceTransferReceiver;
  -[IDSSocketPairResourceTransferReceiver dealloc](&v4, sel_dealloc);
}

- (BOOL)writeResourceData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  char v25;
  NSObject *v26;
  unint64_t totalBytesReceived;
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_length(v4, v5, v6, v7);
  if (v8 <= 7)
  {
    v9 = v8;
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v9;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: incoming chunk does not have sufficient data (%lu)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
LABEL_19:
    close(self->_fileDescriptor);
    v25 = 0;
    self->_fileDescriptor = -1;
    self->_done = 1;
    goto LABEL_20;
  }
  v11 = objc_retainAutorelease(v4);
  v17 = bswap64(*(_QWORD *)objc_msgSend_bytes(v11, v12, v13, v14));
  if (self->_totalBytesReceived != v17)
  {
    OSLogHandleForIDSCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      totalBytesReceived = self->_totalBytesReceived;
      *(_DWORD *)buf = 134218240;
      v30 = v17;
      v31 = 2048;
      v32 = totalBytesReceived;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: mismatching incoming resource chunk index: stated %llu != actual %llu", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    goto LABEL_19;
  }
  v19 = objc_msgSend_length(v11, v15, v16, v18);
  objc_msgSend_subdataWithRangeNoCopy_(v11, v20, 8, v21, v19 - 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_writeResourceData_resourceByteOffset_(self, v23, (uint64_t)v22, v24, v17);

LABEL_20:
  return v25;
}

- (BOOL)writeResourceData:(id)a3 resourceByteOffset:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  size_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const void *v16;
  ssize_t v17;
  ssize_t v18;
  NSObject *v19;
  NSString *v20;
  unint64_t v21;
  int v22;
  NSObject *v23;
  unint64_t totalBytesExpected;
  NSString *resourcePath;
  NSObject *v26;
  unint64_t totalBytesReceived;
  unint64_t v28;
  NSString *v29;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  NSString *v33;
  NSObject *v34;
  unint64_t v35;
  unint64_t v36;
  NSString *v37;
  BOOL v38;
  uint8_t buf[4];
  size_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  _BYTE v47[18];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = v6;
  if (v6)
  {
    v11 = objc_msgSend_length(v6, v7, v8, v9);
    v12 = objc_retainAutorelease(v10);
    v16 = (const void *)objc_msgSend_bytes(v12, v13, v14, v15);
    v17 = write(self->_fileDescriptor, v16, v11);
    if (v17 <= 0)
    {
      v22 = *__error();
      OSLogHandleForIDSCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        totalBytesExpected = self->_totalBytesExpected;
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 134219010;
        v41 = v11;
        v42 = 2048;
        v43 = totalBytesExpected;
        v44 = 2112;
        v45 = (unint64_t)resourcePath;
        v46 = 1024;
        *(_DWORD *)v47 = v22;
        *(_WORD *)&v47[4] = 2080;
        *(_QWORD *)&v47[6] = strerror(v22);
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: error writing %lu (%llu total) to file %@ (errno: %d (%s))", buf, 0x30u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          strerror(v22);
          MarcoLog();
        }
        if (IMShouldLog())
        {
          strerror(v22);
          IMLogString();
        }
      }
      goto LABEL_44;
    }
    v18 = v17;
    if (v17 < v11)
    {
      OSLogHandleForIDSCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_resourcePath;
        *(_DWORD *)buf = 134218498;
        v41 = v18;
        v42 = 2048;
        v43 = v11;
        v44 = 2112;
        v45 = (unint64_t)v20;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: only wrote %ld/%lu bytes to file %@", buf, 0x20u);
      }

      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_44;
      if (MarcoShouldLog())
        MarcoLog();
      if (!IMShouldLog())
        goto LABEL_44;
      goto LABEL_43;
    }
    OSLogHandleForIDSCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_totalBytesExpected;
      totalBytesReceived = self->_totalBytesReceived;
      v29 = self->_resourcePath;
      *(_DWORD *)buf = 134219010;
      v41 = v11;
      v42 = 2048;
      v43 = totalBytesReceived;
      v44 = 2048;
      v45 = v28;
      v46 = 2112;
      *(_QWORD *)v47 = v29;
      *(_WORD *)&v47[8] = 2048;
      *(_QWORD *)&v47[10] = a4;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: wrote %lu (received %llu out of %llu total) bytes to file %@ at %llu", buf, 0x34u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    v21 = self->_totalBytesReceived + v18;
    self->_totalBytesReceived = v21;
  }
  else
  {
    v21 = self->_totalBytesReceived;
  }
  v30 = self->_totalBytesExpected;
  if (v21 == v30)
  {
    OSLogHandleForIDSCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_totalBytesExpected;
      v33 = self->_resourcePath;
      *(_DWORD *)buf = 134218242;
      v41 = v32;
      v42 = 2112;
      v43 = (unint64_t)v33;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: finished writing all %llu  bytes to file %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    close(self->_fileDescriptor);
    self->_fileDescriptor = -1;
    self->_done = 1;
    v30 = self->_totalBytesExpected;
    v21 = self->_totalBytesReceived;
  }
  if (v21 <= v30)
  {
    v38 = 1;
    goto LABEL_46;
  }
  OSLogHandleForIDSCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v36 = self->_totalBytesExpected;
    v35 = self->_totalBytesReceived;
    v37 = self->_resourcePath;
    *(_DWORD *)buf = 134218498;
    v41 = v35;
    v42 = 2048;
    v43 = v36;
    v44 = 2112;
    v45 = (unint64_t)v37;
    _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: received %llu bytes, more than expected %llu to file %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
LABEL_43:
      IMLogString();
  }
LABEL_44:
  close(self->_fileDescriptor);
  v38 = 0;
  self->_fileDescriptor = -1;
  self->_done = 1;
LABEL_46:

  return v38;
}

- (BOOL)appendMessage:(id)a3 receiverError:(unsigned __int8 *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSString *messageUUID;
  char v12;
  NSString *v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  id v20;
  const char *v21;
  uint64_t v22;
  double v23;
  unsigned __int8 *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  NSString *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  NSString *resourcePath;
  const char *v51;
  uint64_t v52;
  double v53;
  NSString *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  NSString *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  double v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  double v72;
  void *v73;
  NSString *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  const char *v78;
  uint64_t v79;
  double v80;
  int v81;
  const char *v82;
  uint64_t v83;
  double v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  double v88;
  void *v89;
  void *v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  double v94;
  NSString *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  NSString *v101;
  const char *v102;
  uint64_t v103;
  double v104;
  NSString *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  double v109;
  const char *v110;
  uint64_t v111;
  double v112;
  NSString *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  double v117;
  const char *v118;
  double v119;
  NSObject *v120;
  unint64_t totalBytesReceived;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  double v125;
  NSString *v126;
  uint64_t v127;
  NSString *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  NSString *v132;
  uint64_t v133;
  NSString *v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  double v138;
  NSString *v139;
  uint64_t v140;
  NSString *v141;
  const char *v142;
  uint64_t v143;
  double v144;
  NSString *v145;
  uint64_t v146;
  NSString *v147;
  NSString *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  NSString *v154;
  uint8_t buf[4];
  unint64_t v156;
  __int16 v157;
  unint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  NSString *v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = v5;
  if (self->_done)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      messageUUID = self->_messageUUID;
      *(_DWORD *)buf = 138412290;
      v156 = (unint64_t)messageUUID;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: already done with this resource! messageUUID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    v12 = 0;
  }
  else
  {
    v13 = self->_messageUUID;
    objc_msgSend_messageUUID(v5, v6, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend_isEqualToString_(v13, v15, (uint64_t)v14, v16);

    if ((v13 & 1) != 0)
    {
      if (self->_resumeResourceTransfers)
      {
        objc_msgSend_data(v9, v17, v18, v19);
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = (unsigned __int8 *)objc_msgSend_bytes(v20, v21, v22, v23);
        v28 = ((unint64_t)v24[1] << 48) | ((unint64_t)v24[2] << 40) | ((unint64_t)v24[3] << 32) | ((unint64_t)v24[4] << 24) | ((unint64_t)v24[5] << 16) | ((unint64_t)v24[6] << 8) | v24[7];
        if (self->_totalBytesReceived == v28)
        {
          v29 = objc_msgSend_length(v20, v25, v26, v27);
          objc_msgSend_subdataWithRangeNoCopy_(v20, v30, 8, v31, v29 - 8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_compressed(v9, v33, v34, v35))
          {
            objc_msgSend__FTDecompressData(v32, v36, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            OSLogHandleForIDSCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v44 = self->_messageUUID;
              v45 = objc_msgSend_length(v32, v41, v42, v43);
              v49 = objc_msgSend_length(v39, v46, v47, v48);
              resourcePath = self->_resourcePath;
              *(_DWORD *)buf = 138413058;
              v156 = (unint64_t)v44;
              v157 = 2048;
              v158 = v45;
              v159 = 2048;
              v160 = v49;
              v161 = 2112;
              v162 = resourcePath;
              _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu decompressed: %lu) to file %@", buf, 0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v54 = self->_messageUUID;
                v55 = objc_msgSend_length(v32, v51, v52, v53);
                v153 = objc_msgSend_length(v39, v56, v57, v58);
                v154 = self->_resourcePath;
                v149 = v54;
                v152 = v55;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v62 = self->_messageUUID;
                v63 = objc_msgSend_length(v32, v59, v60, v61);
                v153 = objc_msgSend_length(v39, v64, v65, v66);
                v154 = self->_resourcePath;
                v149 = v62;
                v152 = v63;
                IMLogString();
              }
            }

          }
          else
          {
            OSLogHandleForIDSCategory();
            v135 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              v139 = self->_messageUUID;
              v140 = objc_msgSend_length(v32, v136, v137, v138);
              v141 = self->_resourcePath;
              *(_DWORD *)buf = 138412802;
              v156 = (unint64_t)v139;
              v157 = 2048;
              v158 = v140;
              v159 = 2112;
              v160 = (uint64_t)v141;
              _os_log_impl(&dword_19B949000, v135, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu) to file %@", buf, 0x20u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v145 = self->_messageUUID;
                v152 = objc_msgSend_length(v32, v142, v143, v144);
                v153 = (uint64_t)self->_resourcePath;
                v149 = v145;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v147 = self->_messageUUID;
                v152 = objc_msgSend_length(v32, v67, v146, v68);
                v153 = (uint64_t)self->_resourcePath;
                v149 = v147;
                IMLogString();
              }
            }
            v39 = v32;
          }
          v12 = objc_msgSend_writeResourceData_resourceByteOffset_(self, v67, (uint64_t)v39, v68, v28, v149, v152, v153, v154);

        }
        else
        {
          OSLogHandleForIDSCategory();
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            totalBytesReceived = self->_totalBytesReceived;
            *(_DWORD *)buf = 134218240;
            v156 = v28;
            v157 = 2048;
            v158 = totalBytesReceived;
            _os_log_impl(&dword_19B949000, v120, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: mismatching incoming resource chunk index: stated %llu != actual %llu", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
              MarcoLog();
            if (IMShouldLog())
              IMLogString();
          }
          v12 = 0;
        }

      }
      else
      {
        v81 = objc_msgSend_compressed(v9, v17, v18, v19);
        objc_msgSend_data(v9, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v85;
        if (v81)
        {
          objc_msgSend__FTDecompressData(v85, v86, v87, v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          OSLogHandleForIDSCategory();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            v95 = self->_messageUUID;
            v96 = objc_msgSend_length(v89, v92, v93, v94);
            v100 = objc_msgSend_length(v90, v97, v98, v99);
            v101 = self->_resourcePath;
            *(_DWORD *)buf = 138413058;
            v156 = (unint64_t)v95;
            v157 = 2048;
            v158 = v96;
            v159 = 2048;
            v160 = v100;
            v161 = 2112;
            v162 = v101;
            _os_log_impl(&dword_19B949000, v91, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu decompressed: %lu) to file %@", buf, 0x2Au);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v105 = self->_messageUUID;
              v106 = objc_msgSend_length(v89, v102, v103, v104);
              v153 = objc_msgSend_length(v90, v107, v108, v109);
              v154 = self->_resourcePath;
              v149 = v105;
              v152 = v106;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v113 = self->_messageUUID;
              v114 = objc_msgSend_length(v89, v110, v111, v112);
              v153 = objc_msgSend_length(v90, v115, v116, v117);
              v154 = self->_resourcePath;
              v149 = v113;
              v152 = v114;
              IMLogString();
            }
          }

        }
        else
        {
          OSLogHandleForIDSCategory();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            v126 = self->_messageUUID;
            v127 = objc_msgSend_length(v89, v123, v124, v125);
            v128 = self->_resourcePath;
            *(_DWORD *)buf = 138412802;
            v156 = (unint64_t)v126;
            v157 = 2048;
            v158 = v127;
            v159 = 2112;
            v160 = (uint64_t)v128;
            _os_log_impl(&dword_19B949000, v122, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu) to file %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v132 = self->_messageUUID;
              v152 = objc_msgSend_length(v89, v129, v130, v131);
              v153 = (uint64_t)self->_resourcePath;
              v149 = v132;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v134 = self->_messageUUID;
              v152 = objc_msgSend_length(v89, v118, v133, v119);
              v153 = (uint64_t)self->_resourcePath;
              v149 = v134;
              IMLogString();
            }
          }
          v90 = v89;
        }
        v12 = objc_msgSend_writeResourceData_(self, v118, (uint64_t)v90, v119, v149, v152, v153, v154);

      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_messageUUID(v9, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = self->_messageUUID;
        *(_DWORD *)buf = 138412546;
        v156 = (unint64_t)v73;
        v157 = 2112;
        v158 = (unint64_t)v74;
        _os_log_impl(&dword_19B949000, v69, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: messageUUID %@ does not match original messageUUID %@", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          objc_msgSend_messageUUID(v9, v75, v76, v77);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          MarcoLog();

        }
        if (IMShouldLog())
        {
          objc_msgSend_messageUUID(v9, v78, v79, v80);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          IMLogString();

        }
      }
      v12 = 0;
      self->_done = 1;
    }
  }

  return v12;
}

- (id)finalizedMessageDictionaryIfDone
{
  uint64_t v2;
  double v3;
  __CFDictionary *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v15;
  NSString *resourcePath;
  NSString *v17;
  NSDictionary *metadata;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_done)
    return 0;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(self->_resourcePath, v6, v7, v8);
  v9 = sandbox_extension_issue_file();
  if (v9)
  {
    v12 = (void *)v9;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      CFDictionarySetValue(v5, CFSTR("ids-message-resource-transfer-sandbox-extension"), v13);

    free(v12);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      resourcePath = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v20 = resourcePath;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for file [%@]", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
  }
  v17 = self->_resourcePath;
  if (v17)
    CFDictionarySetValue(v5, CFSTR("ids-message-resource-transfer-url"), v17);
  metadata = self->_metadata;
  if (metadata)
    CFDictionarySetValue(v5, CFSTR("ids-message-resource-transfer-metadata"), metadata);
  return v5;
}

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
