@implementation IMDQuickSwitchController

+ (id)sharedInstance
{
  if (qword_1ED935C88 != -1)
    dispatch_once(&qword_1ED935C88, &unk_1E922AEB0);
  return (id)qword_1ED935DB8;
}

- (IMDQuickSwitchController)init
{
  IMDQuickSwitchController *v2;
  IMDQuickSwitchController *v3;
  IDSService *v4;
  PSYSyncCoordinator *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDQuickSwitchController;
  v2 = -[IMDQuickSwitchController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    if (qword_1ED935F80 != -1)
      dispatch_once(&qword_1ED935F80, &unk_1E922AE40);
    v4 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.messagesquickswitch"));
    v3->_quickSwitchIDSService = v4;
    -[IDSService addDelegate:queue:](v4, "addDelegate:queue:", v3, MEMORY[0x1E0C80D38]);
    v5 = (PSYSyncCoordinator *)(id)objc_msgSend((id)qword_1ED935F88, "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.messagessync"));
    v3->_syncCoordinator = v5;
    -[PSYSyncCoordinator setDelegate:](v5, "setDelegate:", v3);
    v2 = (IMDQuickSwitchController *)-[IMDQuickSwitchController _cleanUpTemporaryFiles](v3, "_cleanUpTemporaryFiles");
  }
  if (IMOSLoggingEnabled(v2))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Instantiated IMDQuickSwitchController", v8, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[IMDQuickSwitchController _cleanUpTemporaryFiles](self, "_cleanUpTemporaryFiles");
  v3.receiver = self;
  v3.super_class = (Class)IMDQuickSwitchController;
  -[IMDQuickSwitchController dealloc](&v3, sel_dealloc);
}

- (void)dummyMethod
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Sending dummy request", v4, 2u);
    }
  }
  -[IMDQuickSwitchController _isPairedDeviceInProxyMode](self, "_isPairedDeviceInProxyMode");
  -[IMDQuickSwitchController _initiateQuickSwitch](self, "_initiateQuickSwitch");
}

- (int64_t)_getCurrentDBVersion
{
  uint64_t SchemaVersion;
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SchemaVersion = IMDSMSRecordStoreGetSchemaVersion();
  v3 = SchemaVersion;
  if (IMOSLoggingEnabled(SchemaVersion))
  {
    v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Current db version is %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (id)_getTempDBPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("MessagesQSwitch"));
}

- (id)_getTempRecentsPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("Recents"));
}

- (id)_getZippedRecentsPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("compressedSMSRecents.zip"));
}

- (id)_getTruncatedDBPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("tempSMS.db"));
}

- (id)_getDowngradedDBPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("tempDowngradedSMS.db"));
}

- (id)_getZippedDBPath
{
  return (id)objc_msgSend((id)objc_msgSend((id)IMSafeTemporaryDirectory(), "path"), "stringByAppendingPathComponent:", CFSTR("compressedSMSDB.zip"));
}

- (unint64_t)_getFileSizeAtPath:(id)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v12;
  unint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!IMOSLoggingEnabled(self))
      return 0;
    v9 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v6 = "QuickSwitch Could not determine file size as path was nil";
    v7 = v9;
    v8 = 2;
    goto LABEL_9;
  }
  v13 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", a3, &v13);
  if (v13)
  {
    if (!IMOSLoggingEnabled(v4))
      return 0;
    v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      return 0;
    *(_DWORD *)buf = 138412546;
    v15 = a3;
    v16 = 2112;
    v17 = v13;
    v6 = "QuickSwitch Could not determine file size at path %@ with error %@";
    v7 = v5;
    v8 = 22;
LABEL_9:
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
    return 0;
  }
  v10 = objc_msgSend(v4, "fileSize");
  if (IMOSLoggingEnabled(v10))
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = a3;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Size of file at path %@ is %lu", buf, 0x16u);
    }
  }
  return v10;
}

- (BOOL)_truncateDBToPath:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = IMDDatabaseDelete();
    if ((v5 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v5))
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v13 = a3;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete DB at path %@", buf, 0xCu);
        }
      }
    }
    IMTimingStartTimingForKey();
    v7 = IMDTrimSharedDatabaseToMessageCount();
    v8 = v7;
    if ((v7 & 1) != 0)
    {
      IMTimingStopTimingForKey();
      -[IMDQuickSwitchController _getFileSizeAtPath:](self, "_getFileSizeAtPath:", a3);
    }
    else if (IMOSLoggingEnabled(v7))
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "QuickSwitch Could not trim DB with error %@ ", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(self))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "QuickSwitch We got a nil path to truncate to.", buf, 2u);
      }
    }
    return 0;
  }
  return v8;
}

- (void)_deleteFileAtPath:(id)a3
{
  uint64_t v4;
  char v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v15 = 0;
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", a3, &v15);
    v5 = v4;
    v6 = IMOSLoggingEnabled(v4);
    if ((v5 & 1) != 0)
    {
      if (v6)
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = a3;
          v8 = "Deleted file at path %@ ";
          v9 = v7;
          v10 = 12;
LABEL_12:
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v16, v10);
        }
      }
    }
    else if (v6)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(v15, "domain");
        v14 = objc_msgSend(v15, "code");
        v16 = 138412802;
        v17 = a3;
        v18 = 2112;
        v19 = v13;
        v20 = 2048;
        v21 = v14;
        v8 = "QuickSwitch Could not delete file at path %@ with error domain '%@' code: %ld";
        v9 = v12;
        v10 = 32;
        goto LABEL_12;
      }
    }
  }
  else if (IMOSLoggingEnabled(self))
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v8 = "QuickSwitch we were given a nil path to delete";
      v9 = v11;
      v10 = 2;
      goto LABEL_12;
    }
  }
}

- (void)_cleanUpTemporaryFiles
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Cleaning up temporary files", buf, 2u);
    }
  }
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getTempDBPath](self, "_getTempDBPath"));
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getTempRecentsPath](self, "_getTempRecentsPath"));
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getZippedDBPath](self, "_getZippedDBPath"));
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getZippedRecentsPath](self, "_getZippedRecentsPath"));
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getTruncatedDBPath](self, "_getTruncatedDBPath"));
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", -[IMDQuickSwitchController _getDowngradedDBPath](self, "_getDowngradedDBPath"));
  -[IMDQuickSwitchController _getTruncatedDBPath](self, "_getTruncatedDBPath");
  v4 = IMDDatabaseDelete();
  if ((v4 & 1) == 0 && IMOSLoggingEnabled(v4))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = -[IMDQuickSwitchController _getTruncatedDBPath](self, "_getTruncatedDBPath");
      *(_DWORD *)buf = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete DB at path %@ %@", buf, 0x16u);
    }
  }
}

- (void)_compressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a4);
  if ((_DWORD)v9)
  {
    if (IMOSLoggingEnabled(v9))
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "QuickSwitch. We do not expect file to already exist. Clearing it.", buf, 2u);
      }
    }
    v19 = 0;
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", a4, &v19);
    if ((v11 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v11))
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v21 = a4;
          v22 = 2112;
          v23 = v19;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete zipped file DB at path %@ with error %@", buf, 0x16u);
        }
      }
    }
  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = a5;
  v13 = objc_alloc(MEMORY[0x1E0D36A30]);
  v14 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3, v17, 3221225472, sub_1D14B0000, &unk_1E922AED8, a4, self, v18);
  v15 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a4);
  v16 = (void *)objc_msgSend(v13, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:", v14, v15, 0, 2, &v17, MEMORY[0x1E0C80D38]);
  IMTimingStartTimingForKey();
  objc_msgSend(v16, "start");
}

- (void)_decompressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a4);
  if ((_DWORD)v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "QuickSwitch. We do not expect file to already exist.", buf, 2u);
      }
    }
    v17 = 0;
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", a4, &v17);
    if ((v10 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v10))
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v19 = a4;
          v20 = 2112;
          v21 = v17;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete zipped file DB at path %@ with error %@", buf, 0x16u);
        }
      }
    }
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D14B031C;
  v16[3] = &unk_1E922AF00;
  v16[4] = a4;
  v16[5] = a5;
  v12 = objc_alloc(MEMORY[0x1E0D36A30]);
  v13 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v14 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a4);
  v15 = (void *)objc_msgSend(v12, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:", v13, v14, 0, 1, v16, MEMORY[0x1E0C80D38]);
  IMTimingStartTimingForKey();
  objc_msgSend(v15, "start");
}

- (void)_initiateQuickSwitch
{
  NSObject *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Initiating quick switch", buf, 2u);
    }
  }
  v4 = objc_alloc(MEMORY[0x1E0C99D80]);
  v5 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("c"), 0);
  v6 = -[IMDQuickSwitchController _sendIDSMessage:](self, "_sendIDSMessage:", v5);
  if (!v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "QuickSwitch Could not send initiate QuickSwitch message. Bailing!", v8, 2u);
      }
    }
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
  }

}

- (void)_sendDBVersionResponse:(int64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  uint8_t buf[16];

  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v7 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("c"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("dbv"), 0);
  v8 = -[IMDQuickSwitchController _sendIDSMessage:](self, "_sendIDSMessage:", v7);
  if (!v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Could not send initiate QuickSwitch message. Bailing!", buf, 2u);
      }
    }
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
  }

}

- (void)_sendRecentsRequest
{
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  uint8_t buf[16];

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5), CFSTR("c"), 0);
  v5 = -[IMDQuickSwitchController _sendIDSMessage:](self, "_sendIDSMessage:", v4);
  if (!v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Could not send QuickSwitch Recents request. Bailing!", buf, 2u);
      }
    }
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
  }

}

- (void)_handleQuickSwitchInitiateRequest
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled(self))
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "We tried to _handleQuickSwitchInitiateRequest a non watch device for QuickSwitch. This is really bad!", v3, 2u);
    }
  }
}

- (void)_quickSwitchCompleted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Finished with success %@", (uint8_t *)&v7, 0xCu);
    }
  }
  -[IMDQuickSwitchController _cleanUpTemporaryFiles](self, "_cleanUpTemporaryFiles");
  -[IMDQuickSwitchController _notifyPSYWithResult:](self, "_notifyPSYWithResult:", v3);
}

- (BOOL)_sendZippedFileAtPath:(id)a3 withCommand:(int64_t)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  return MEMORY[0x1E0DE7D20](self, sel__sendIDSFile_withCommand_);
}

- (void)_handleDBVersionResponse:(id)a3
{
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  char v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[5];
  int64_t v33;
  id v34;
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = (int64_t)a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "dbVersionResponse %@", buf, 0xCu);
    }
  }
  v6 = -[IMDQuickSwitchController _getCurrentDBVersion](self, "_getCurrentDBVersion");
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("dbv")), "integerValue");
  if (v6 != v7)
  {
    v14 = IMDCanDowngradeDatabaseToVersion();
    v15 = v14;
    v16 = IMOSLoggingEnabled(v14);
    if (!v15)
    {
      if (v16)
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v36 = v6;
          v37 = 2048;
          v38 = v7;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Trying to QuickSwitch to incompatible gizmo. Bailing quick switch. localDBVersion %ld gizmoDBVersion %ld", buf, 0x16u);
        }
      }
      goto LABEL_15;
    }
    if (v16)
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v7;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Downgrade: found a database that can be downgraded to version: %ld", buf, 0xCu);
      }
    }
  }
  v8 = -[IMDQuickSwitchController _getTruncatedDBPath](self, "_getTruncatedDBPath");
  v9 = -[IMDQuickSwitchController _truncateDBToPath:](self, "_truncateDBToPath:", v8);
  if (!(_DWORD)v9
    || (v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v8),
        (v9 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v9))
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (int64_t)v8;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "QuickSwitch Truncated DB did not succeed at path %@, Really bad! ", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
  v10 = IMOSLoggingEnabled(v9);
  if ((_DWORD)v10)
  {
    v11 = OSLogHandleForIMFoundationCategory();
    v10 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if ((_DWORD)v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Truncation succeeded! :-)", buf, 2u);
    }
  }
  if (v6 == v7)
    goto LABEL_11;
  if (IMOSLoggingEnabled(v10))
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v6;
      v37 = 2048;
      v38 = v7;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Attempting downgrade from %ld to %ld...", buf, 0x16u);
    }
  }
  v20 = -[IMDQuickSwitchController _getDowngradedDBPath](self, "_getDowngradedDBPath");
  v34 = 0;
  v21 = IMDDowngradeDatabaseToVersion();
  v22 = v21;
  v23 = IMOSLoggingEnabled(v21);
  if ((v22 & 1) == 0)
  {
    if (v23)
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = objc_msgSend(v34, "localizedDescription");
        *(_DWORD *)buf = 134218498;
        v36 = v7;
        v37 = 2048;
        v38 = v6;
        v39 = 2112;
        v40 = v30;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Error Trying to QuickSwitch watch to version %ld from %ld. Downgrade failed with error: %@", buf, 0x20u);
      }
    }
LABEL_15:
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
    return;
  }
  if (v23)
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v6;
      v37 = 2048;
      v38 = v7;
      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Downgraded from %ld to %ld ok! :-D", buf, 0x16u);
    }
  }
  -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", v8);
  v33 = 0;
  v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtPath:toPath:error:", v20, v8, &v33);
  if (v33)
    v26 = 0;
  else
    v26 = v25;
  v27 = IMOSLoggingEnabled(v25);
  if ((v26 & 1) != 0)
  {
    if (v27)
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = (int64_t)v20;
        v37 = 2112;
        v38 = (uint64_t)v8;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "renamed %@ to %@ in preperation for compression - this means the downgrade completed ok. :-D", buf, 0x16u);
      }
    }
LABEL_11:
    v12 = -[IMDQuickSwitchController _getZippedDBPath](self, "_getZippedDBPath");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1D14B0F70;
    v32[3] = &unk_1E9228690;
    v32[4] = self;
    -[IMDQuickSwitchController _compressFileAtPath:toPath:withCompletionBlock:](self, "_compressFileAtPath:toPath:withCompletionBlock:", v8, v12, v32);
    return;
  }
  if (v27)
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v33;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "QuickSwitch failed to rename downgraded db to tempdb with error: %@", buf, 0xCu);
    }
  }
  -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
}

- (void)_handleRecentsRequest
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)FormattedRecentDomainDirectory(), "stringByStandardizingPath");
  v4 = -[IMDQuickSwitchController _getTempRecentsPath](self, "_getTempRecentsPath");
  v5 = -[IMDQuickSwitchController _getZippedRecentsPath](self, "_getZippedRecentsPath");
  v11 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3);
  if (!(_DWORD)v6)
    goto LABEL_6;
  if (IMOSLoggingEnabled(v6))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Copying from %@ to %@", buf, 0x16u);
    }
  }
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", v3, v4, &v11);
  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v8))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "QuickSwitch could not copy path to temp directory with error %@. Bailing!!", buf, 0xCu);
      }
    }
    -[IMDQuickSwitchController _deleteFileAtPath:](self, "_deleteFileAtPath:", v4);
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
  }
  else
  {
LABEL_6:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D14B130C;
    v10[3] = &unk_1E922A180;
    v10[4] = v5;
    v10[5] = self;
    -[IMDQuickSwitchController _compressFileAtPath:toPath:withCompletionBlock:](self, "_compressFileAtPath:toPath:withCompletionBlock:", v4, v5, v10);
  }
}

- (void)_handleQuickSwitchCompleted:(id)a3
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "_handleQuickSwitchCompleted %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("s")), "BOOLValue"));
}

- (void)_handleIncomingDB:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "QuickSwitch got _handleIncomingDB on a non gizmo. Really bad!!", v4, 2u);
    }
  }
}

- (void)_handleIncomingRecents:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "QuickSwitch got _handleIncomingRecents on a non gizmo. Really bad!!", v4, 2u);
    }
  }
}

- (void)_sendQuickSwitchCompletedWithResult:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v7 = (id)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("c"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("s"), 0);
  -[IMDQuickSwitchController _sendIDSMessage:](self, "_sendIDSMessage:", v7);

}

- (BOOL)_sendIDSFile:(id)a3 withCommand:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4), CFSTR("c"), 0);
  v13 = 0;
  v14 = 0;
  v9 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](self->_quickSwitchIDSService, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", a3, v8, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D345D0]), 300, 0, &v14, &v13);
  if (IMOSLoggingEnabled(v9))
  {
    v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if ((_DWORD)v9)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138413314;
      v16 = a3;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Sending file at URL %@ to local account (identifier %@)  (error %@)  (metadata %@) success: %@", buf, 0x34u);
    }
  }

  return v9;
}

- (BOOL)_sendIDSMessage:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v5 = (void *)objc_msgSend((id)JWEncodeDictionary(), "_FTCopyGzippedData");
  v6 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](self->_quickSwitchIDSService, "sendData:toDestinations:priority:options:identifier:error:", v5, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D345D0]), 300, 0, &v11, &v10);
  if (IMOSLoggingEnabled(v6))
  {
    v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if ((_DWORD)v6)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138413058;
      v13 = v11;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = a3;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Sending message to local account (identifier %@)  (error %@)  (request %@) success: %@", buf, 0x2Au);
    }
  }

  return v6;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138413314;
      v25 = a3;
      v26 = 2112;
      v27 = a4;
      v28 = 2112;
      v29 = a5;
      v30 = 2112;
      v31 = a6;
      v32 = 2112;
      v33 = a7;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "service %@, account %@, incomingData %@ fromID %@ context %@", (uint8_t *)&v24, 0x34u);
    }
  }
  if (objc_msgSend(a3, "deviceForFromID:", a6))
  {
    objc_msgSend(a5, "_FTOptionallyDecompressData");
    v14 = (void *)JWDecodeDictionary();
    if (IMOSLoggingEnabled(v14))
    {
      v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v14;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Got request %@", (uint8_t *)&v24, 0xCu);
      }
    }
    v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKey:", CFSTR("c")), "integerValue");
    v17 = (void *)v16;
    switch(v16)
    {
      case 1:
        if (IMOSLoggingEnabled(v16))
        {
          v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandInitiateQuickSwitch", (uint8_t *)&v24, 2u);
          }
        }
        -[IMDQuickSwitchController _handleQuickSwitchInitiateRequest](self, "_handleQuickSwitchInitiateRequest");
        break;
      case 2:
        if (IMOSLoggingEnabled(v16))
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandResponeDBVersion", (uint8_t *)&v24, 2u);
          }
        }
        -[IMDQuickSwitchController _handleDBVersionResponse:](self, "_handleDBVersionResponse:", v14);
        break;
      case 4:
        if (IMOSLoggingEnabled(v16))
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandQuickSwitchCompleted", (uint8_t *)&v24, 2u);
          }
        }
        -[IMDQuickSwitchController _handleQuickSwitchCompleted:](self, "_handleQuickSwitchCompleted:", v14);
        break;
      case 5:
        if (IMOSLoggingEnabled(v16))
        {
          v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandRequestRecents", (uint8_t *)&v24, 2u);
          }
        }
        -[IMDQuickSwitchController _handleRecentsRequest](self, "_handleRecentsRequest");
        break;
      default:
        if (IMOSLoggingEnabled(v16))
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v24 = 134217984;
            v25 = v17;
            v20 = "QuickSwitch got unknown request over quick switch service %ld";
            goto LABEL_31;
          }
        }
        break;
    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = a6;
      v20 = "Not an IDSDevice: fromID %@. Bailing";
LABEL_31:
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = 138413570;
      v23 = a3;
      v24 = 2112;
      v25 = a4;
      v26 = 2112;
      v27 = a5;
      v28 = 2112;
      v29 = a6;
      v30 = 2112;
      v31 = a7;
      v32 = 2112;
      v33 = a8;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "service %@, account %@, resourceURL %@ metadata %@ fromID %@ context %@", (uint8_t *)&v22, 0x3Eu);
    }
  }
  if (!objc_msgSend(a3, "deviceForFromID:", a7))
  {
    if (!IMOSLoggingEnabled(0))
      return;
    v19 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      return;
    v22 = 138412290;
    v23 = a7;
    v20 = "Not an IDSDevice: fromID %@. Bailing";
    goto LABEL_21;
  }
  v16 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("c")), "integerValue");
  v17 = (void *)v16;
  if (v16 != 6)
  {
    if (v16 == 3)
    {
      if (IMOSLoggingEnabled(3))
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v22 = 138412290;
          v23 = a5;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandIncomingDB at url %@", (uint8_t *)&v22, 0xCu);
        }
      }
      -[IMDQuickSwitchController _handleIncomingDB:](self, "_handleIncomingDB:", objc_msgSend(a5, "path"));
      return;
    }
    if (!IMOSLoggingEnabled(v16))
      return;
    v19 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      return;
    v22 = 134217984;
    v23 = v17;
    v20 = "QuickSwitch got unknown resource ULR callback over quick switch service %ld";
LABEL_21:
    _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0xCu);
    return;
  }
  if (IMOSLoggingEnabled(6))
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = a5;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandIncomingRecents at url %@", (uint8_t *)&v22, 0xCu);
    }
  }
  -[IMDQuickSwitchController _handleIncomingRecents:](self, "_handleIncomingRecents:", objc_msgSend(a5, "path"));
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = a5;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "message sent with identifier %@ ", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)_isPairedDeviceInProxyMode
{
  NSObject *v2;
  IMDServiceController *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Checking if we are in proxy mode", buf, 2u);
    }
  }
  v3 = +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v4 = (_QWORD *)MEMORY[0x1E0D38F68];
  v5 = -[IMDAccountController activeAccountsForService:](+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"), "activeAccountsForService:", -[IMDServiceController serviceWithName:](v3, "serviceWithName:", *MEMORY[0x1E0D38F68]));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  v7 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "service"), "internalName"), "isEqualToString:", *v4))
        {
          v11 = objc_msgSend((id)objc_msgSend(v10, "loginID"), "_appearsToBeEmail");
          if ((_DWORD)v11)
          {
            if (IMOSLoggingEnabled(v11))
            {
              v14 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v21 = v10;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not in proxy mode. Found active iMessage account signed into email %@ ", buf, 0xCu);
              }
            }
            return 0;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  if (!IMOSLoggingEnabled(v6))
    return 1;
  v12 = OSLogHandleForIMEventCategory();
  v13 = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "In proxy mode. Did not find any active iMessage account logged in using email.", buf, 2u);
  }
  return v13;
}

- (id)_defaultPairedDevice
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)-[IDSService devices](self->_quickSwitchIDSService, "devices", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "isDefaultPairedDevice");
        if ((_DWORD)v8)
        {
          if (IMOSLoggingEnabled(v8))
          {
            v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v17 = v7;
              _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Found default paired device %@", buf, 0xCu);
            }
          }
          return v7;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  if (IMOSLoggingEnabled(v3))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "QuickSwitch Did not find default paired device", buf, 2u);
    }
  }
  return 0;
}

- (BOOL)_supportsQuickSwitchWithPairedDevice
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance"), "getActivePairedDevice");
  return objc_msgSend(v2, "supportsCapability:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A6E3ECD8-FC98-42E0-B5AD-AC9ECA775FBE")));
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = a3;
      v12 = 2112;
      v13 = a4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Got beginSyncSession call with coordinator %@ and session %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v8 = -[IMDQuickSwitchController _supportsQuickSwitchWithPairedDevice](self, "_supportsQuickSwitchWithPairedDevice");
  if (v8)
  {
    -[IMDQuickSwitchController _initiateQuickSwitch](self, "_initiateQuickSwitch");
  }
  else
  {
    if (IMOSLoggingEnabled(v8))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "QuickSwitch. Pairing with older gizmo. Not supported", (uint8_t *)&v10, 2u);
      }
    }
    -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", 0);
  }
}

- (void)_notifyPSYWithResult:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)-[PSYSyncCoordinator activeSyncSession](-[IMDQuickSwitchController syncCoordinator](self, "syncCoordinator"), "activeSyncSession");
  v5 = IMOSLoggingEnabled(v4);
  if (v3)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Calling back to PSY with success", buf, 2u);
      }
    }
    objc_msgSend(v4, "syncDidComplete");
  }
  else
  {
    if (v5)
    {
      v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Calling back to PSY with failure", v8, 2u);
      }
    }
    objc_msgSend(v4, "syncDidFailWithError:", 0);
  }
}

- (void)_notifyPSYDataSent
{
  uint64_t v2;

  v2 = -[PSYSyncCoordinator activeSyncSession](-[IMDQuickSwitchController syncCoordinator](self, "syncCoordinator"), "activeSyncSession");
  MEMORY[0x1E0DE7D20](v2, sel_syncDidCompleteSending);
}

- (IDSService)quickSwitchIDSService
{
  return self->_quickSwitchIDSService;
}

- (void)setQuickSwitchIDSService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
