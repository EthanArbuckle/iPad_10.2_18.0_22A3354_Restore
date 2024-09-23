@implementation IMInternalPayloadUtilities

+ (BOOL)writePayload:(id)a3 toURL:(id)a4
{
  int v7;

  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v7)
    LOBYTE(v7) = objc_msgSend(a1, "writeData:toURL:", objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0), a4);
  return v7;
}

+ (BOOL)writeData:(id)a3 toURL:(id)a4
{
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
  {
    v14 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(a4, "URLByDeletingLastPathComponent"), 1, 0, 0);
    v6 = objc_msgSend(a3, "writeToURL:options:error:", a4, 1, &v14);
    v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = a4;
          v9 = "Write successful to %@";
          v10 = v8;
          v11 = 12;
LABEL_11:
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
        }
      }
    }
    else if (v7)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v16 = a4;
        v17 = 2112;
        v18 = v14;
        v9 = "Write failed to %@ (error: %@)";
        v10 = v13;
        v11 = 22;
        goto LABEL_11;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)writeMessagePayloadToDisk:(id)a3 fileName:(id)a4
{
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v6)
  {
    v7 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    LOBYTE(v6) = 0;
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = (uint64_t)a4;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Incoming message will be written to %@", buf, 0xCu);
        }
      }
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/SMS/%@"), a4);
      v6 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v6)
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v14 = v9;
            _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Will log message payload to path: %@", buf, 0xCu);
          }
        }
        LOBYTE(v6) = +[IMInternalPayloadUtilities writePayload:toURL:](IMInternalPayloadUtilities, "writePayload:toURL:", a3, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9));
      }
      else if (v6)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        v6 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Unable to log message payload to disk: path is nil", buf, 2u);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

+ (BOOL)writeDataPayloadToDisk:(id)a3 fileName:(id)a4
{
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v6)
  {
    v7 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    LOBYTE(v6) = 0;
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = (uint64_t)a4;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Incoming data payload will be written to %@", buf, 0xCu);
        }
      }
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/SMS/%@"), a4);
      v6 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v6)
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v14 = v9;
            _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Will log data payload to path: %@", buf, 0xCu);
          }
        }
        LOBYTE(v6) = +[IMInternalPayloadUtilities writeData:toURL:](IMInternalPayloadUtilities, "writeData:toURL:", a3, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9));
      }
      else if (v6)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        v6 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Unable to log data payload to disk: path is nil", buf, 2u);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

+ (id)writeMessagePayloadToTemporaryDirectory:(id)a3 fileName:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
    return 0;
  v6 = (void *)objc_msgSend(IMSafeTemporaryDirectory(), "path");
  if (!objc_msgSend(v6, "length"))
    return 0;
  v12[0] = v6;
  v12[1] = CFSTR("MessagesBlastDoorFailedPayloads");
  v12[2] = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3));
  if (!+[IMInternalPayloadUtilities writePayload:toURL:](IMInternalPayloadUtilities, "writePayload:toURL:", a3, v7))
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Failed to write error payload to path %@", (uint8_t *)&v10, 0xCu);
      }
    }
    return 0;
  }
  return v7;
}

@end
