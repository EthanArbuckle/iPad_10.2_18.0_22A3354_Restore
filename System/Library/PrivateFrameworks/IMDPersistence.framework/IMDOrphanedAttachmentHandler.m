@implementation IMDOrphanedAttachmentHandler

- (IMDOrphanedAttachmentHandler)init
{
  IMDOrphanedAttachmentHandler *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMDOrphanedAttachmentHandler;
  v2 = -[IMDOrphanedAttachmentHandler init](&v4, sel_init);
  if (v2)
    v2->_fileManager = (IMDFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
  return v2;
}

- (IMDOrphanedAttachmentHandler)initWithFileManager:(id)a3
{
  IMDOrphanedAttachmentHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDOrphanedAttachmentHandler;
  v4 = -[IMDOrphanedAttachmentHandler init](&v6, sel_init);
  if (v4)
    v4->_fileManager = (IMDFileManager *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDOrphanedAttachmentHandler;
  -[IMDOrphanedAttachmentHandler dealloc](&v3, sel_dealloc);
}

- (unsigned)maxCleanseIterations
{
  return 500;
}

- (void)_cleanseOrphanedAttachmentsWithEnumerator:(id)a3 atPath:(id)a4
{
  uint64_t v4;
  __int128 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  int v9;
  const __CFString *v10;
  NSObject *v11;
  CFStringRef v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v34;
  _QWORD v37[6];
  id v38;
  uint64_t v39;
  _BYTE buf[12];
  __int16 v41;
  _QWORD v42[4];

  *(_QWORD *)((char *)&v42[2] + 2) = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "nextObject");
  if (v4)
  {
    v6 = (void *)v4;
    v7 = 0;
    v34 = *MEMORY[0x1E0C9AE00];
    *(_QWORD *)&v5 = 138412546;
    v32 = v5;
    while (1)
    {
      if (v7 >= -[IMDOrphanedAttachmentHandler maxCleanseIterations](self, "maxCleanseIterations", v32))
      {
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = sub_1ABB97564;
        v37[3] = &unk_1E5AB28E0;
        objc_copyWeak(&v38, (id *)buf);
        v37[4] = a3;
        v37[5] = a4;
        IMDPersistencePerformBlock(v37, 0);
        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
        return;
      }
      v8 = (void *)MEMORY[0x1AF435474]();
      v9 = objc_msgSend(a3, "level");
      if (v9 != 3)
        break;
      if (objc_msgSend(a3, "level") == 3)
      {
        v10 = (const __CFString *)objc_msgSend(v6, "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v32;
            *(_QWORD *)&buf[4] = v6;
            v41 = 2112;
            v42[0] = v10;
            _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Examining '%@' as it looks like it contains a guid '%@'.", buf, 0x16u);
          }
        }
        v12 = IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(v10, 1);
        if (v12 || (v12 = IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(v10, 0)) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v6;
              _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Keeping '%@' we have a record for it in the DB.", buf, 0xCu);
            }
          }
          v14 = IMDAttachmentRecordCopyFilename(v34, (uint64_t)v12, 0);
          v15 = IMDAttachmentRecordCopyFilename(v34, (uint64_t)v12, 1);
          v16 = (void *)objc_msgSend(a4, "stringByAppendingPathComponent:", v6);
          v17 = (void *)-[IMDFileManager enumeratorAtPath:](-[IMDOrphanedAttachmentHandler fileManager](self, "fileManager"), "enumeratorAtPath:", v16);
          for (i = objc_msgSend(v17, "nextObject"); ; i = objc_msgSend(v17, "nextObject"))
          {
            v19 = (void *)i;
            if (!i)
              break;
            v20 = (void *)MEMORY[0x1AF435474]();
            if ((objc_msgSend((id)objc_msgSend(v19, "lastPathComponent"), "isEqualToString:", objc_msgSend(v14, "lastPathComponent")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v19, "lastPathComponent"), "isEqualToString:", objc_msgSend(v15, "lastPathComponent")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v19, "pathExtension"), "isEqualToIgnoringCase:", CFSTR("MOV")) & 1) != 0)
            {
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v19;
                  _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "  Not deleting the actual attachment: %@", buf, 0xCu);
                }
              }
            }
            else
            {
              v22 = objc_msgSend(v16, "stringByAppendingPathComponent:", v19);
              if (IMOSLoggingEnabled())
              {
                v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v22;
                  _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "  Deleting preview: %@", buf, 0xCu);
                }
              }
              -[IMDFileManager removeItemAtPath:error:](-[IMDOrphanedAttachmentHandler fileManager](self, "fileManager"), "removeItemAtPath:error:", v22, 0);
            }
            objc_autoreleasePoolPop(v20);
          }

          CFRelease(v12);
          goto LABEL_32;
        }
        v39 = 0;
        v28 = objc_msgSend(a4, "stringByAppendingPathComponent:", v6);
        if (IMOSLoggingEnabled())
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v28;
            _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "To Delete: %@", buf, 0xCu);
          }
        }
        -[IMDFileManager removeItemAtPath:error:](-[IMDOrphanedAttachmentHandler fileManager](self, "fileManager"), "removeItemAtPath:error:", v28, &v39);
        if (!IMOSLoggingEnabled())
          goto LABEL_32;
        v30 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v28;
        v25 = v30;
        v26 = "Cleaned up '%@'";
        v27 = 12;
LABEL_30:
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
      }
LABEL_32:
      objc_autoreleasePoolPop(v8);
      v6 = (void *)objc_msgSend(a3, "nextObject");
      ++v7;
      if (!v6)
        goto LABEL_40;
    }
    if (!IMOSLoggingEnabled())
      goto LABEL_32;
    v24 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v6;
    v41 = 1024;
    LODWORD(v42[0]) = v9;
    WORD2(v42[0]) = 1024;
    *(_DWORD *)((char *)v42 + 6) = 3;
    v25 = v24;
    v26 = "Skipping '%@' as its level is %d and our target level is %d.";
    v27 = 24;
    goto LABEL_30;
  }
LABEL_40:
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("successfully.");
      _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "File cleanse ended %@", buf, 0xCu);
    }
  }
}

- (void)cleanseOrphanedAttachments
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Beginning file cleanse.", v4, 2u);
    }
  }
  -[IMDOrphanedAttachmentHandler cleanseOrphanedAttachmentsInDirectoryAtPath:](self, "cleanseOrphanedAttachmentsInDirectoryAtPath:", objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByExpandingTildeInPath"));
}

- (void)cleanseOrphanedAttachmentsInDirectoryAtPath:(id)a3
{
  -[IMDOrphanedAttachmentHandler _cleanseOrphanedAttachmentsWithEnumerator:atPath:](self, "_cleanseOrphanedAttachmentsWithEnumerator:atPath:", -[IMDFileManager enumeratorAtPath:](-[IMDOrphanedAttachmentHandler fileManager](self, "fileManager"), "enumeratorAtPath:", a3), a3);
}

- (IMDFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
