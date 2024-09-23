@implementation IMTransferServicesCompressionController

+ (id)sharedInstance
{
  if (qword_253EA4478 != -1)
    dispatch_once(&qword_253EA4478, &unk_24C0A9528);
  return (id)qword_253EA4488;
}

- (void)_mapCopier:(id)a3 toBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *blockMap;
  id v12;
  const char *v13;
  uint64_t v14;
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

  if (a3 && a4)
  {
    blockMap = self->_blockMap;
    if (!blockMap)
    {
      blockMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      self->_blockMap = blockMap;
    }
    v12 = (id)objc_msgSend_copy(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
    v20 = objc_msgSend_identifier(a3, v13, v14, v15, v16, v17, v18, v19);
    MEMORY[0x24BEDD108](blockMap, sel_setObject_forKey_, v12, v20, v21, v22, v23, v24);
  }
}

- (void)_unmapCopier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *blockMap;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a3 && objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7))
  {
    blockMap = self->_blockMap;
    v18 = objc_msgSend_identifier(a3, v10, v11, v12, v13, v14, v15, v16);
    objc_msgSend_removeObjectForKey_(blockMap, v19, v18, v20, v21, v22, v23, v24);
    if (!objc_msgSend_count(self->_blockMap, v25, v26, v27, v28, v29, v30, v31))
    {

      self->_blockMap = 0;
    }
  }
}

- (id)_blockForCopier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *blockMap;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (!a3 || !objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7))
    return 0;
  blockMap = self->_blockMap;
  v18 = objc_msgSend_identifier(a3, v10, v11, v12, v13, v14, v15, v16);
  return (id)MEMORY[0x24BEDD108](blockMap, sel_objectForKey_, v18, v19, v20, v21, v22, v23);
}

- (void)compressFileTransfer:(id)a3 completionBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  char v54;
  int v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (a3)
    {
      v54 = 0;
      v11 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
      v19 = objc_msgSend_path(a3, v12, v13, v14, v15, v16, v17, v18);
      if ((objc_msgSend_fileExistsAtPath_isDirectory_(v11, v20, v19, (uint64_t)&v54, v21, v22, v23, v24) & 1) != 0)
      {
        if (v54)
        {
          v25 = objc_alloc(MEMORY[0x24BE50890]);
          v33 = objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v26, v27, v28, v29, v30, v31, v32);
          v36 = (void *)objc_msgSend_initWithInputURL_outputURL_identifier_operation_delegate_(v25, v34, (uint64_t)a3, 0, v33, 0, (uint64_t)self, v35);
          objc_msgSend__mapCopier_toBlock_(self, v37, (uint64_t)v36, (uint64_t)a4, v38, v39, v40, v41);
          if (IMOSLoggingEnabled())
          {
            v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v55 = 138412290;
              v56 = a3;
              _os_log_impl(&dword_2084AC000, v49, OS_LOG_TYPE_INFO, "Starting compression for URL: %@", (uint8_t *)&v55, 0xCu);
            }
          }
          objc_msgSend_start(v36, v42, v43, v44, v45, v46, v47, v48);

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v53 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              v55 = 138412290;
              v56 = a3;
              _os_log_impl(&dword_2084AC000, v53, OS_LOG_TYPE_INFO, "URL supplied (%@) is not a directory, marking as not needed", (uint8_t *)&v55, 0xCu);
            }
          }
          (*((void (**)(id, id, id, _QWORD, uint64_t, _QWORD))a4 + 2))(a4, a3, a3, 0, 1, 0);
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v55 = 138412290;
            v56 = a3;
            _os_log_impl(&dword_2084AC000, v52, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing compression", (uint8_t *)&v55, 0xCu);
          }
        }
        (*((void (**)(id, id, id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, a3, a3, 0, 0, 0);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          LOWORD(v55) = 0;
          _os_log_impl(&dword_2084AC000, v51, OS_LOG_TYPE_INFO, "No transfer URL supplied, failing", (uint8_t *)&v55, 2u);
        }
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, 0, 0, 0);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_2084AC000, v50, OS_LOG_TYPE_INFO, "No input block for transfer URL, failing", (uint8_t *)&v55, 2u);
    }
  }
}

- (void)fileCopierDidStart:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = a3;
      v14 = 2112;
      v15 = objc_msgSend_inputURL(a3, v5, v6, v7, v8, v9, v10, v11);
      _os_log_impl(&dword_2084AC000, v4, OS_LOG_TYPE_INFO, "Copier started: %@  (URL: %@)", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)fileCopierDidFinish:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  const __CFString *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
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
  int v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend__blockForCopier_(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v64 = 138412546;
      v65 = (uint64_t)a3;
      v66 = 2112;
      v67 = objc_msgSend_inputURL(a3, v12, v13, v14, v15, v16, v17, v18);
      _os_log_impl(&dword_2084AC000, v11, OS_LOG_TYPE_INFO, "Copier completed: %@  (URL: %@)", (uint8_t *)&v64, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend_inputURL(a3, v20, v21, v22, v23, v24, v25, v26);
      v64 = 138412290;
      v65 = v27;
      _os_log_impl(&dword_2084AC000, v19, OS_LOG_TYPE_INFO, "    Input URL: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend_outputURL(a3, v29, v30, v31, v32, v33, v34, v35);
      v64 = 138412290;
      v65 = v36;
      _os_log_impl(&dword_2084AC000, v28, OS_LOG_TYPE_INFO, "   Output URL: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = objc_msgSend_didErrorOccur(a3, v37, v38, v39, v40, v41, v42, v43);
      v46 = CFSTR("YES");
      if (v45)
        v46 = CFSTR("NO");
      v64 = 138412290;
      v65 = (uint64_t)v46;
      _os_log_impl(&dword_2084AC000, v44, OS_LOG_TYPE_INFO, "      Success: %@", (uint8_t *)&v64, 0xCu);
    }
  }
  if (v10)
  {
    v47 = objc_msgSend_inputURL(a3, v37, v38, v39, v40, v41, v42, v43);
    v55 = objc_msgSend_outputURL(a3, v48, v49, v50, v51, v52, v53, v54);
    v63 = objc_msgSend_didErrorOccur(a3, v56, v57, v58, v59, v60, v61, v62);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v10 + 16))(v10, v47, v55, 0, v63 ^ 1u, 1);
  }
  objc_msgSend__unmapCopier_(self, v37, (uint64_t)a3, v39, v40, v41, v42, v43);
}

@end
