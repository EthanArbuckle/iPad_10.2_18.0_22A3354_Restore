@implementation IMDPersistentAttachmentController

+ (id)sharedInstance
{
  if (qword_1ED0D39B8 != -1)
    dispatch_once(&qword_1ED0D39B8, &unk_1E5AAF1C8);
  return (id)qword_1ED0D3AA0;
}

- (void)saveAttachmentsForTransfer:(id)a3 chatGUID:(id)a4 storeAtExternalLocation:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;

  v7 = a5;
  v11 = -[IMDPersistentAttachmentController _saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:](self, "_saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:", a3, 0, 0, 0, 0);
  v12 = 0;
  if (v7)
    v12 = -[IMDPersistentAttachmentController _saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:](self, "_saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:", a3, 0, 0, a4, 1);
  if (a6)
    (*((void (**)(id, id, _QWORD, id))a6 + 2))(a6, v11, 0, v12);
}

- (void)saveAttachmentsForTransfer:(id)a3 completion:(id)a4
{
  id v5;

  v5 = -[IMDPersistentAttachmentController _saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:](self, "_saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:", a3, 0, 0, 0, 0);
  if (a4)
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v5, 0);
}

- (void)moveAttachmentsForTransfer:(id)a3 completion:(id)a4
{
  id v5;

  v5 = -[IMDPersistentAttachmentController _saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:](self, "_saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:", a3, 0, 1);
  if (a4)
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v5, 0);
}

- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5
{
  return -[IMDPersistentAttachmentController _saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:](self, "_saveAttachmentForTransfer:highQuality:copyWithinAttachmentStore:chatGUID:storeAtExternalPath:", a3, a4, a5, 0, 0);
}

- (BOOL)_shouldDeleteOriginalPath:(id)a3 copyWithinAttachmentStore:(BOOL)a4 destPath:(id)a5 storeAtExternalPath:(BOOL)a6
{
  int v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a6 && sub_1ABBC2434((__CFString *)a3))
  {
    v8 = IMOSLoggingEnabled();
    if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        v11 = 138412546;
        v12 = a3;
        v13 = 2112;
        v14 = a5;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Not deleting at original path %@ because we're storing at an external path %@", (uint8_t *)&v11, 0x16u);
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  dispatch_time_t v53;
  NSObject *v54;
  NSObject *v55;
  int v56;
  NSObject *v57;
  const __CFString *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD block[8];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v71 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "filename"), "length"))
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v18 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      return 0;
    *(_DWORD *)buf = 138412290;
    v68 = (uint64_t)a3;
    v15 = "   => transfer has empty file name, bailing: %@";
    goto LABEL_19;
  }
  v13 = objc_msgSend(a3, "transferState");
  if (!objc_msgSend(a3, "isIncoming") || v13 > 3 || v10)
  {
    v64 = 0;
    v19 = (void *)objc_msgSend(a3, "filename");
    v20 = (uint64_t)v19;
    if (v10)
      v20 = objc_msgSend(v19, "__im_filePathWithVariant:", *MEMORY[0x1E0D38090]);
    v21 = -[IMDPersistentAttachmentController _persistentPathForTransfer:filename:highQuality:chatGUID:storeAtExternalPath:](self, "_persistentPathForTransfer:filename:highQuality:chatGUID:storeAtExternalPath:", a3, v20, v10, a6, v7);
    if (objc_msgSend(v21, "length"))
    {
      v22 = (void *)MEMORY[0x1AF435474]();
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = objc_msgSend(v21, "stringByDeletingLastPathComponent");
      if (v10)
        v25 = objc_msgSend(a3, "temporaryHighQualityLocalPath");
      else
        v25 = objc_msgSend(a3, "localPath");
      v28 = (__CFString *)v25;
      if ((objc_msgSend(v23, "__im_makeDirectoriesInPath:mode:", v24, 448) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v24;
            _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "   => transfer could not ensure persistent path: %@", buf, 0xCu);
          }
        }
        v26 = 0;
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v28, "isEqualToString:", v21))
      {
        if (IMOSLoggingEnabled())
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "   => local path is already the same as destination path. Not moving or copying.", buf, 2u);
          }
        }
        v26 = (id)objc_msgSend(v21, "copy");
LABEL_34:
        objc_autoreleasePoolPop(v22);
        return v26;
      }
      v31 = objc_msgSend(v23, "fileExistsAtPath:", v21);
      if (v31 && !v7)
      {
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)a3;
            _os_log_impl(&dword_1ABB60000, v32, OS_LOG_TYPE_INFO, "   => file already exists for transfer: %@", buf, 0xCu);
          }
        }
        v33 = 0;
        goto LABEL_109;
      }
      if (sub_1ABBC2434(v28) && !v9 && !v7)
      {
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)a3;
            _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "   => file is already in attachment store: %@", buf, 0xCu);
          }
        }
        v33 = v28;
        goto LABEL_109;
      }
      v35 = (void *)objc_msgSend(a3, "sandboxToken");
      v61 = (uint64_t)v35;
      if (v35)
      {
        objc_msgSend(v35, "UTF8String");
        v36 = sandbox_extension_consume();
        if (v36 != -1)
          goto LABEL_54;
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v68 = (uint64_t)v28;
            v69 = 2112;
            v70 = v61;
            _os_log_impl(&dword_1ABB60000, v37, OS_LOG_TYPE_INFO, "Failed to consume sandbox token, %@ token: %@", buf, 0x16u);
          }
        }
      }
      v36 = -1;
LABEL_54:
      v62 = v36;
      if (!v28)
      {
LABEL_81:
        v46 = 0;
LABEL_102:
        if (v62 != -1
          && sandbox_extension_release() == -1
          && IMOSLoggingEnabled()
          && (v54 = OSLogHandleForIMFoundationCategory(), os_log_type_enabled(v54, OS_LOG_TYPE_INFO)))
        {
          *(_DWORD *)buf = 138412546;
          v68 = (uint64_t)v28;
          v69 = 2112;
          v70 = v61;
          _os_log_impl(&dword_1ABB60000, v54, OS_LOG_TYPE_INFO, "Failed to release sandbox token, %@ token: %@", buf, 0x16u);
          v33 = 0;
          if ((v46 & 1) == 0)
            goto LABEL_122;
        }
        else
        {
          v33 = 0;
          if (!v46)
          {
LABEL_122:
            objc_autoreleasePoolPop(v22);
            return v33;
          }
        }
LABEL_109:
        if (IMOSLoggingEnabled())
        {
          v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)v21;
            _os_log_impl(&dword_1ABB60000, v55, OS_LOG_TYPE_INFO, "Changing permissions on attachment file at %@", buf, 0xCu);
          }
        }
        v65 = *MEMORY[0x1E0CB2AD8];
        v66 = *MEMORY[0x1E0CB2AC0];
        v56 = objc_msgSend(v23, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1), v21, &v64);
        if (IMOSLoggingEnabled())
        {
          v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = CFSTR("NO");
            if (v56)
              v58 = CFSTR("YES");
            *(_DWORD *)buf = 138412546;
            v68 = (uint64_t)v58;
            v69 = 2112;
            v70 = v64;
            _os_log_impl(&dword_1ABB60000, v57, OS_LOG_TYPE_INFO, "    => Permissions changed: %@  error: %@", buf, 0x16u);
          }
        }
        if (!v33)
          v33 = (__CFString *)objc_msgSend(v21, "copy");
        if (IMOSLoggingEnabled())
        {
          v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)v33;
            _os_log_impl(&dword_1ABB60000, v59, OS_LOG_TYPE_INFO, "   => Success! returning path: %@", buf, 0xCu);
          }
        }
        goto LABEL_122;
      }
      if (!objc_msgSend(v23, "fileExistsAtPath:", v28))
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_81;
        v44 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          goto LABEL_81;
        *(_DWORD *)buf = 138412290;
        v68 = (uint64_t)v28;
        v45 = "   => ** failed copying file from path, file not on disk: %@";
        goto LABEL_80;
      }
      if (v31 & v7)
      {
        v38 = objc_msgSend((id)objc_msgSend(v23, "im_randomTemporaryFileURLWithFileName:", CFSTR("tmp")), "path");
        objc_msgSend(v23, "copyItemAtPath:toPath:error:", v28, v38, &v64);
        v60 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21);
        if ((objc_msgSend(v23, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v60, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v38), 0, 0, 0, &v64) & 1) == 0)
        {
LABEL_58:
          if (IMOSLoggingEnabled())
          {
            v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v68 = (uint64_t)v21;
              _os_log_impl(&dword_1ABB60000, v39, OS_LOG_TYPE_INFO, "   => ** failed copying file to path: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v64;
              _os_log_impl(&dword_1ABB60000, v40, OS_LOG_TYPE_INFO, "          The error was %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v68 = (uint64_t)v21;
              _os_log_impl(&dword_1ABB60000, v41, OS_LOG_TYPE_INFO, "   => failed copy file to path: %@, will try move", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v64;
              _os_log_impl(&dword_1ABB60000, v42, OS_LOG_TYPE_INFO, "      The error was %@", buf, 0xCu);
            }
          }
          if ((objc_msgSend(v23, "moveItemAtPath:toPath:error:", v28, v21, &v64) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              v43 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v68 = (uint64_t)v21;
                _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "   => ** failed moving file to path: %@", buf, 0xCu);
              }
            }
            if (!IMOSLoggingEnabled())
              goto LABEL_81;
            v44 = OSLogHandleForIMFoundationCategory();
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              goto LABEL_81;
            *(_DWORD *)buf = 138412290;
            v68 = v64;
            v45 = "          The error was %@";
LABEL_80:
            _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, v45, buf, 0xCu);
            goto LABEL_81;
          }
LABEL_101:
          v46 = 1;
          goto LABEL_102;
        }
      }
      else if (!objc_msgSend(v23, "copyItemAtPath:toPath:error:", v28, v21, &v64))
      {
        goto LABEL_58;
      }
      if (IMOSLoggingEnabled())
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v68 = (uint64_t)v21;
          _os_log_impl(&dword_1ABB60000, v47, OS_LOG_TYPE_INFO, "   => successfully copied file to path: %@", buf, 0xCu);
        }
      }
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v48, OS_LOG_TYPE_INFO, "   => checking if file has any siblings to copy", buf, 2u);
          }
        }
        v49 = (id)objc_msgSend(-[IMDPersistentAttachmentController _migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:](self, "_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:", v28, v21, v23), "copy");
      }
      else
      {
        v49 = (id)objc_msgSend(a3, "_auxVideoPathIfItExists");
        if (v49)
        {
          if (IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v51 = objc_msgSend(v49, "lastPathComponent");
              *(_DWORD *)buf = 138412290;
              v68 = v51;
              _os_log_impl(&dword_1ABB60000, v50, OS_LOG_TYPE_INFO, "   => copying video complement: %@", buf, 0xCu);
            }
          }
          -[IMDPersistentAttachmentController _migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:](self, "_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:", v28, v21, v23);
          v49 = 0;
        }
      }
      if (-[IMDPersistentAttachmentController _shouldDeleteOriginalPath:copyWithinAttachmentStore:destPath:storeAtExternalPath:](self, "_shouldDeleteOriginalPath:copyWithinAttachmentStore:destPath:storeAtExternalPath:", v28, v9, v21, v7))
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = (uint64_t)v28;
            _os_log_impl(&dword_1ABB60000, v52, OS_LOG_TYPE_INFO, "        ...removing old file in 10: %@", buf, 0xCu);
          }
        }
        v53 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1ABBC3370;
        block[3] = &unk_1E5AB7CB8;
        block[4] = v28;
        block[5] = v23;
        block[6] = v49;
        block[7] = self;
        dispatch_after(v53, MEMORY[0x1E0C80D38], block);
      }
      goto LABEL_101;
    }
    if (!IMOSLoggingEnabled())
      return 0;
    v18 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      return 0;
    *(_DWORD *)buf = 138412290;
    v68 = (uint64_t)a3;
    v15 = "   => persistent path is zero length for transfer: %@";
LABEL_19:
    v16 = v18;
    v17 = 12;
    goto LABEL_20;
  }
  if (!IMOSLoggingEnabled())
    return 0;
  v14 = OSLogHandleForIMFoundationCategory();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    return 0;
  *(_WORD *)buf = 0;
  v15 = "   => transfer is not ready to save";
  v16 = v14;
  v17 = 2;
LABEL_20:
  _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
  return 0;
}

- (BOOL)_canDeleteAttachmentPath:(id)a3
{
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "isEqualToString:", CFSTR("Attachments")))
  {
    v4 = IMOSLoggingEnabled();
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      v4 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        LOWORD(v13) = 0;
        v6 = "Not deleting attachment path, last component is Attachments";
        v7 = v5;
        v8 = 2;
LABEL_14:
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v13, v8);
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(a3, "lastPathComponent");
    if (objc_msgSend(v9, "length") == 36)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByExpandingTildeInPath")) & 1) != 0)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        v4 = IMOSLoggingEnabled();
        if (v4)
        {
          v11 = OSLogHandleForIMFoundationCategory();
          v4 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
          if (v4)
          {
            v13 = 138412290;
            v14 = a3;
            v6 = "Not deleting attachment path, not in attachment store: %@";
            v7 = v11;
            v8 = 12;
            goto LABEL_14;
          }
        }
      }
    }
    else
    {
      v4 = IMOSLoggingEnabled();
      if (v4)
      {
        v10 = OSLogHandleForIMFoundationCategory();
        v4 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v4)
        {
          v13 = 138412546;
          v14 = a3;
          v15 = 2112;
          v16 = v9;
          v6 = "Not deleting attachment path, last component is not guid-like %@ guidPathComponent: %@";
          v7 = v10;
          v8 = 22;
          goto LABEL_14;
        }
      }
    }
  }
  return v4;
}

- (void)_removeLegacyAttachmentPathsInAttachmentStoreWithOriginalPath:(id)a3 withFileManager:(id)a4
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_msgSend(a4, "contentsOfDirectoryAtPath:error:", v6, 0);
  if (v7 && !objc_msgSend(v7, "count"))
  {
    v10 = -[IMDPersistentAttachmentController _canDeleteAttachmentPath:](self, "_canDeleteAttachmentPath:", v6);
    v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v6;
          _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Path was in attachment store, removing %@", (uint8_t *)&v13, 0xCu);
        }
      }
      objc_msgSend(a4, "removeItemAtPath:error:", v6, 0);
    }
    else if (v11)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        v9 = "Bailing out of legacy attachment path deletion, %@ is not an eligible path";
        goto LABEL_6;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v6;
      v9 = "Bailing out of legacy attachment path deletion, %@ has other contents in path";
LABEL_6:
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:(id)a3 destinationPath:(id)a4 withFileManager:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v33 = a4;
  v9 = objc_msgSend(a4, "stringByDeletingLastPathComponent");
  v34 = a3;
  v10 = objc_msgSend(a3, "lastPathComponent");
  v39 = (void *)v9;
  v40 = v8;
  LODWORD(v9) = objc_msgSend(v8, "isEqualToString:", v9);
  v11 = IMOSLoggingEnabled();
  if (!(_DWORD)v9)
  {
    if (v11)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v10;
        v51 = 2112;
        v52 = (uint64_t)v8;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Looking for sibling files of %@ in %@", buf, 0x16u);
      }
    }
    v15 = (void *)objc_msgSend(a5, "contentsOfDirectoryAtPath:error:", v8, 0);
    obj = v15;
    if (!v15
      || !objc_msgSend(v15, "count")
      || (v45 = 0u,
          v46 = 0u,
          v43 = 0u,
          v44 = 0u,
          (v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16)) == 0))
    {
      v38 = 0;
      return v38;
    }
    v38 = 0;
    v17 = *(_QWORD *)v44;
    v35 = *MEMORY[0x1E0CB28A8];
    v37 = *MEMORY[0x1E0CB2AD8];
    v36 = *MEMORY[0x1E0CB2AC0];
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v19, "isEqualToString:", v10))
        {
          if (IMOSLoggingEnabled())
          {
            v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v50 = (uint64_t)v19;
              v21 = v20;
              v22 = "Sibling search found orig filename %@, skipping";
              v23 = 12;
LABEL_47:
              _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
              continue;
            }
          }
          continue;
        }
        v24 = objc_msgSend(v40, "stringByAppendingPathComponent:", v19);
        v25 = objc_msgSend(v39, "stringByAppendingPathComponent:", v19);
        if (IMOSLoggingEnabled())
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v24;
            v51 = 2112;
            v52 = v25;
            _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Will migrate sibling at path %@ to %@", buf, 0x16u);
          }
        }
        v42 = 0;
        v27 = objc_msgSend(a5, "removeItemAtPath:error:", v25, &v42);
        if (!v27)
          goto LABEL_55;
        if (!v42)
          goto LABEL_34;
        if (!objc_msgSend((id)objc_msgSend(v42, "domain"), "isEqualToString:", v35)
          || objc_msgSend(v42, "code") != 4)
        {
LABEL_55:
          if (IMOSLoggingEnabled())
          {
            v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = CFSTR("NO");
              if (v27)
                v29 = CFSTR("YES");
              *(_DWORD *)buf = 138412802;
              v50 = v25;
              v51 = 2112;
              v52 = (uint64_t)v29;
              v53 = 2112;
              v54 = (uint64_t)v42;
              _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Failed to delete existing sibling %@ success %@ error %@", buf, 0x20u);
            }
          }
        }
        if (v42)
          v42 = 0;
LABEL_34:
        objc_msgSend(a5, "copyItemAtPath:toPath:error:", v24, v25, &v42);
        if (v42)
        {
          if (IMOSLoggingEnabled())
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v50 = (uint64_t)v34;
              v51 = 2112;
              v52 = v24;
              v53 = 2112;
              v54 = v25;
              v55 = 2112;
              v56 = v42;
              v21 = v30;
              v22 = "Failed to copy sibling attachment to dst. Orig %@ sibling %@ dst %@ error %@";
              v23 = 42;
              goto LABEL_47;
            }
          }
        }
        else
        {
          if (!v38)
            v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (IMOSLoggingEnabled())
          {
            v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v50 = (uint64_t)v19;
              v51 = 2112;
              v52 = (uint64_t)v33;
              _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "Successfully migrated %@ to %@", buf, 0x16u);
            }
          }
          objc_msgSend(v38, "addObject:", v24);
          v47 = v37;
          v48 = v36;
          objc_msgSend(a5, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1), v25, &v42);
          if (v42)
          {
            if (IMOSLoggingEnabled())
            {
              v32 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v50 = v25;
                v51 = 2112;
                v52 = (uint64_t)v42;
                v21 = v32;
                v22 = "Failed to update permissions on sibling file dst path %@ error %@";
                v23 = 22;
                goto LABEL_47;
              }
            }
          }
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      if (!v16)
        return v38;
    }
  }
  if (v11)
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Can't migrate sibling attachments to the same folder", buf, 2u);
    }
  }
  return 0;
}

- (BOOL)isSafeToDeleteAttachmentPath:(id)a3
{
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "isEqualToString:", CFSTR("Attachments")))
  {
    v4 = IMOSLoggingEnabled();
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      v4 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        LOWORD(v11) = 0;
        v6 = "Not deleting attachment path, last component is Attachments";
        v7 = v5;
        v8 = 2;
LABEL_10:
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v11, v8);
        LOBYTE(v4) = 0;
      }
    }
  }
  else if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByExpandingTildeInPath")) & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = IMOSLoggingEnabled();
    if (v4)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      v4 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v4)
      {
        v11 = 138412290;
        v12 = a3;
        v6 = "Not deleting attachment path, not in attachment store: %@";
        v7 = v9;
        v8 = 12;
        goto LABEL_10;
      }
    }
  }
  return v4;
}

- (BOOL)deleteAttachmentsForTransfer:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel__deleteAttachmentForTransfer_highQuality_);
}

- (BOOL)_deleteAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  char v11;
  int v12;
  NSObject *v13;
  const char *v14;
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v19 = a3;
      v20 = 2112;
      v21 = (id)v8;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Request to delete attachment for transfer: %@ high quality: %@", buf, 0x16u);
    }
  }
  v9 = -[IMDPersistentAttachmentController _persistentPathForTransfer:filename:highQuality:chatGUID:storeAtExternalPath:](self, "_persistentPathForTransfer:filename:highQuality:chatGUID:storeAtExternalPath:", a3, 0, v4, 0, 0);
  if (v9 || objc_msgSend(0, "length"))
  {
    v10 = (void *)MEMORY[0x1AF435474]();
    v17 = 0;
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v9, &v17);
    v12 = IMOSLoggingEnabled();
    if ((v11 & 1) != 0)
    {
      if (!v12)
        goto LABEL_16;
      v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = a3;
      v14 = "  => Successfully deleted item at path: %@  for transfer: %@";
    }
    else
    {
      if (!v12)
        goto LABEL_16;
      v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = a3;
      v14 = "  => failed to remove item at path: %@  for transfer: %@";
    }
    _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, v14, buf, 0x16u);
LABEL_16:
    objc_autoreleasePoolPop(v10);
    return v11;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a3;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "  => No persistent path for transfer found: %@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)_persistentPathForTransfer:(id)a3 filename:(id)a4 highQuality:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  NSObject *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v7 = a7;
  v9 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isSticker"))
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(a3, "guid");
        v14 = objc_msgSend(a3, "isSticker");
        v15 = CFSTR("NO");
        if (v14)
          v15 = CFSTR("YES");
        v20 = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Generating path for sticker transfer %@ isSticker %@", (uint8_t *)&v20, 0x16u);
      }
    }
    objc_msgSend(a3, "stickerUserInfo");
    objc_msgSend(a3, "isAdaptiveImageGlyph");
    return (id)IMSharedHelperCachePathForStickerWithProperties();
  }
  else
  {
    v17 = (void *)objc_msgSend(a3, "guid");
    if (objc_msgSend(a3, "isAuxVideo"))
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = (uint64_t)a3;
          _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Overriding guid for transfer in _persistentPathForTransfer %@", (uint8_t *)&v20, 0xCu);
        }
      }
      v17 = (void *)objc_msgSend(MEMORY[0x1E0D39848], "guidByStrippingAuxPrefix:", v17);
    }
    if (v9)
      v19 = (void *)objc_msgSend(a3, "temporaryHighQualityLocalPath");
    else
      v19 = (void *)objc_msgSend(a3, "localPath");
    if (!a4)
      a4 = (id)objc_msgSend(v19, "lastPathComponent");
    return IMDCopyAttachmentPersistentPath(v17, a4, objc_msgSend(a3, "mimeType"), objc_msgSend(a3, "type"), (uint64_t)a6, v7);
  }
}

- (BOOL)cleanseOrphanedFileTransfers
{
  IMDOrphanedAttachmentHandler *v2;

  v2 = objc_alloc_init(IMDOrphanedAttachmentHandler);
  -[IMDOrphanedAttachmentHandler cleanseOrphanedAttachments](v2, "cleanseOrphanedAttachments");

  return 1;
}

@end
