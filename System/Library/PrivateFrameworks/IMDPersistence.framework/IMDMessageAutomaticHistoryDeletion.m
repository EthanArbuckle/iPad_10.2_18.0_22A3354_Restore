@implementation IMDMessageAutomaticHistoryDeletion

+ (void)cleanUpOrphanAttachments
{
  NSObject *v2;
  IMDOrphanedAttachmentHandler *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Cleansing orphaned attachments", v4, 2u);
    }
  }
  v3 = objc_alloc_init(IMDOrphanedAttachmentHandler);
  -[IMDOrphanedAttachmentHandler cleanseOrphanedAttachments](v3, "cleanseOrphanedAttachments");

}

+ (void)deleteMessagesAndAttachmentsAfterDays:(id)a3
{
  +[IMDMessageAutomaticHistoryDeletion deleteMessagesAfterDays:](IMDMessageAutomaticHistoryDeletion, "deleteMessagesAfterDays:");
  MEMORY[0x1E0DE7D20](IMDMessageAutomaticHistoryDeletion, sel_deleteAttachmentsAfterDays_);
}

+ (void)deleteMessagesAfterDays:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "longLongValue"))
  {
    v5 = 0;
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v7 = objc_msgSend(a3, "longValue");
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "permanently deleting messages not in recently deleted older than %ld days", buf, 0xCu);
      }
    }
    IMDMessageRecordDeleteMessagesOlderThanDays(objc_msgSend(a3, "longLongValue"), &v5);
  }
}

+ (void)deleteAttachmentsAfterDays:(id)a3
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "longLongValue"))
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = 134217984;
        v6 = objc_msgSend(a3, "longValue");
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "deleting attachments older than %ld days", (uint8_t *)&v5, 0xCu);
      }
    }
    IMDAttachmentRecordDeleteAttachmentsOlderThanDays(objc_msgSend(a3, "longLongValue"));
  }
}

+ (void)deleteRecoverableMessagesEligibleForPermanentRemoval
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 134217984;
      v4 = 30;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "permanently deleting messages in recently deleted older than %lld days", (uint8_t *)&v3, 0xCu);
    }
  }
  -[IMDRemoteDatabaseProtocol deleteRecoverableMessagesOlderThanDays:](+[IMDDatabase database](IMDDatabase, "database"), "deleteRecoverableMessagesOlderThanDays:", 30);
}

+ (void)deleteJunkMessagesEligibleForPermanentRemovalOldThanDays:(int64_t)a3
{
  NSObject *v4;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = a3;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "permanently deleting messages filtered as junk older than %lld days", (uint8_t *)&v5, 0xCu);
    }
  }
  -[IMDRemoteDatabaseProtocol deleteJunkMessagesOlderThanDays:](+[IMDDatabase database](IMDDatabase, "database"), "deleteJunkMessagesOlderThanDays:", a3);
}

+ (void)cleanDatabase
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "  => Cleaning up orphaned messages", buf, 2u);
    }
  }
  IMDMessageRecordDeleteOrphanedMessages();
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Cleansing database", v4, 2u);
    }
  }
  IMDDatabaseClean();
}

+ (void)deleteSpolightArchivedFiles
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "deleting spotlight archive files", buf, 2u);
    }
  }
  v4 = (void *)objc_msgSend(a1, "_getDirSubDirURLsForDirPath:error:", objc_msgSend(CFSTR("~/Library/Messages/Archive"), "stringByExpandingTildeInPath"), 0);
  v5 = v4;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v15;
      *(_QWORD *)&v7 = 138412290;
      v13 = v7;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "path", v13);
          if (IMOSLoggingEnabled())
          {
            v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              v19 = v10;
              _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "main folder path found %@", buf, 0xCu);
            }
          }
          objc_msgSend(a1, "deleteDirectoryAtPath:", v10);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v6);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "could not messages archive director, error:", buf, 2u);
    }
  }
}

+ (void)deleteDirectoryAtPath:(id)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = a3;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "deleteDirectoryAtPath: Deleting directory at path %@", (uint8_t *)&v7, 0xCu);
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", a3, 0);
  }
  else if (v4)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "deleteDirectoryAtPath:  path is nil", (uint8_t *)&v7, 2u);
    }
  }
}

+ (BOOL)isFileAtDirPath:(id)a3 olderThanDays:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v6 = objc_msgSend(a1, "_getDirSubDirURLsForDirPath:error:", a3, &v9);
  if (!v6)
    return v9 == 0;
  v7 = (void *)objc_msgSend(a1, "_getFilePathNotDSStore:", v6);
  if ((objc_msgSend(v7, "isEqualToString:", &stru_1E5AC1D70) & 1) != 0)
    return v9 == 0;
  if ((objc_msgSend(a1, "isDirCreationDateAtPath:olderThanDays:", v7, a4) & 1) != 0)
    return 1;
  return objc_msgSend(a1, "isFileHeaderDateAtPath:olderThanDays:", v7, a4);
}

+ (BOOL)isFileHeaderDateAtPath:(id)a3 olderThanDays:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = (uint64_t)a3;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: checking file at path %@", (uint8_t *)&v14, 0xCu);
    }
  }
  v8 = (void *)objc_msgSend((id)objc_msgSend(a1, "_getiChatFileMetadataForPath:", a3), "objectForKey:", CFSTR("EndTime"));
  v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v8, "description");
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: date modified %@", (uint8_t *)&v14, 0xCu);
      }
    }
    LOBYTE(v9) = objc_msgSend(a1, "isOlderThanDays:fromDate:", a4, v8);
  }
  else if (v9)
  {
    v12 = OSLogHandleForIMFoundationCategory();
    v9 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: dateCreated or dateMod is nil", (uint8_t *)&v14, 2u);
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

+ (BOOL)isDirCreationDateAtPath:(id)a3 olderThanDays:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = a3;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays: checking how old dir at %@ is", (uint8_t *)&v13, 0xCu);
    }
  }
  v8 = (void *)objc_msgSend(a1, "_getPathAttributesForPath:", a3);
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays:path attributes are %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v8)
  {
    LOBYTE(v10) = objc_msgSend(a1, "isOlderThanDays:fromDate:", a4, objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2A38]));
  }
  else
  {
    v10 = IMOSLoggingEnabled();
    if (v10)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      v10 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays: Could not locate directory at path", (uint8_t *)&v13, 2u);
        LOBYTE(v10) = 0;
      }
    }
  }
  return v10;
}

+ (BOOL)isOlderThanDays:(int64_t)a3 fromDate:(id)a4
{
  BOOL result;
  double v5;
  double v6;

  result = 0;
  if (a3)
  {
    if (a4)
    {
      v5 = (double)(-86400 * a3);
      objc_msgSend(a4, "timeIntervalSinceNow");
      return ceil(v6) < v5;
    }
  }
  return result;
}

+ (id)_getPathAttributesForPath:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
}

+ (id)_getDirSubDirURLsForDirPath:(id)a3 error:(id *)a4
{
  uint64_t v5;

  if (!a3)
    return 0;
  v5 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
  return (id)MEMORY[0x1E0DE7D20](v5, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_);
}

+ (id)_getiChatFileMetadataForPath:(id)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:"));
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v9);
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "_getiChatFileMetadataForPath: data %@", buf, 0xCu);
    }
  }
  v6 = (void *)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Failed to unarchive iChat file metadata. Error: %@", buf, 0xCu);
      }
    }
  }

  return v6;
}

+ (id)_getFilePathNotDSStore:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return &stru_1E5AC1D70;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(a3);
    v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "path");
    if ((objc_msgSend(v8, "containsString:", CFSTR(".DS_Store")) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR(".DS_Store")))
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_3;
      return &stru_1E5AC1D70;
    }
  }
}

@end
