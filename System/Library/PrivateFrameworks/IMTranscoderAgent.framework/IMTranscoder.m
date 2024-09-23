@implementation IMTranscoder

+ (id)supportedUTIs
{
  return 0;
}

+ (BOOL)supportsUTI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (void *)objc_msgSend_supportedUTIs(a1, a2, (uint64_t)a3, v3, v4, v5, v6, 0);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v20, (uint64_t)v24, 16, v10, v11);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v8);
        if (UTTypeConformsTo((CFStringRef)a3, *(CFStringRef *)(*((_QWORD *)&v20 + 1) + 8 * v15)))
        {
          LOBYTE(v12) = 1;
          return v12;
        }
        ++v15;
      }
      while (v13 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v20, (uint64_t)v24, 16, v17, v18);
      v13 = v12;
      if (v12)
        continue;
      break;
    }
  }
  return v12;
}

+ (BOOL)shouldPreserveHEIFEncoding:(id)a3 target:(int64_t)a4 sourceUTI:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, (uint64_t)a3, a4, (uint64_t)a5, v5, v6);
  v16 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)CFSTR("ForceHEIFEncoding"), v12, v13, v14, v15);
  if (v16)
  {
    v17 = (void *)v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22, v23))
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          LOBYTE(v25) = 1;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            LOWORD(v42) = 0;
            _os_log_impl(&dword_21DFB1000, v24, OS_LOG_TYPE_INFO, "Forcing HEIF encoding from default", (uint8_t *)&v42, 2u);
          }
        }
        else
        {
          LOBYTE(v25) = 1;
        }
        return (char)v25;
      }
    }
  }
  if (UTTypeConformsTo((CFStringRef)a5, (CFStringRef)*MEMORY[0x24BDC1820]))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_16;
    v26 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v42 = 138412290;
    v43 = (int64_t)a5;
    v27 = "Rejecting HEIF encoding, source is %@";
LABEL_15:
    _os_log_impl(&dword_21DFB1000, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v42, 0xCu);
LABEL_16:
    LOBYTE(v25) = 0;
    return (char)v25;
  }
  v28 = IMOSLoggingEnabled();
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (!v28)
      goto LABEL_16;
    v26 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v42 = 134217984;
    v43 = a4;
    v27 = "Rejecting HEIF encoding for non iMessage/RCS target %ld";
    goto LABEL_15;
  }
  if (v28)
  {
    v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v42 = 138412290;
      v43 = (int64_t)a3;
      _os_log_impl(&dword_21DFB1000, v35, OS_LOG_TYPE_INFO, "Checking for HEIF support %@", (uint8_t *)&v42, 0xCu);
    }
  }
  v25 = (void *)objc_msgSend_objectForKey_(a3, v29, *MEMORY[0x24BE4FDB8], v30, v31, v32, v33);
  if (v25)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      LOBYTE(v25) = objc_msgSend_integerValue(v25, v36, v37, v38, v39, v40, v41) == 1;
      return (char)v25;
    }
    goto LABEL_16;
  }
  return (char)v25;
}

+ (BOOL)shouldPreserveHDREncoding:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, (uint64_t)a3, v3, v4, v5, v6);
  v14 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("ForceHDREncoding"), v10, v11, v12, v13);
  if (v14
    && (v15 = (void *)v14, (objc_opt_respondsToSelector() & 1) != 0)
    && objc_msgSend_BOOLValue(v15, v16, v17, v18, v19, v20, v21))
  {
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      LOBYTE(v23) = 1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_21DFB1000, v22, OS_LOG_TYPE_INFO, "Forcing HDR encoding from default", (uint8_t *)&v37, 2u);
      }
    }
    else
    {
      LOBYTE(v23) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v37 = 138412290;
        v38 = a3;
        _os_log_impl(&dword_21DFB1000, v29, OS_LOG_TYPE_INFO, "Checking for HDR support %@", (uint8_t *)&v37, 0xCu);
      }
    }
    v23 = (void *)objc_msgSend_objectForKey_(a3, v24, *MEMORY[0x24BE4FDB0], v25, v26, v27, v28);
    if (v23)
      LOBYTE(v23) = (objc_opt_respondsToSelector() & 1) != 0
                 && objc_msgSend_integerValue(v23, v30, v31, v32, v33, v34, v35) == 1;
  }
  return (char)v23;
}

+ (BOOL)shouldPreserveAAEncoding:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, (uint64_t)a3, v3, v4, v5, v6);
  v14 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("ForceAAEncoding"), v10, v11, v12, v13);
  if (v14
    && (v15 = (void *)v14, (objc_opt_respondsToSelector() & 1) != 0)
    && objc_msgSend_BOOLValue(v15, v16, v17, v18, v19, v20, v21))
  {
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      LOBYTE(v23) = 1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_21DFB1000, v22, OS_LOG_TYPE_INFO, "Forcing AA encoding from default", (uint8_t *)&v37, 2u);
      }
    }
    else
    {
      LOBYTE(v23) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v37 = 138412290;
        v38 = a3;
        _os_log_impl(&dword_21DFB1000, v29, OS_LOG_TYPE_INFO, "Checking for HEIF support %@", (uint8_t *)&v37, 0xCu);
      }
    }
    v23 = (void *)objc_msgSend_objectForKey_(a3, v24, *MEMORY[0x24BE4FDB8], v25, v26, v27, v28);
    if (v23)
      LOBYTE(v23) = (objc_opt_respondsToSelector() & 1) != 0
                 && objc_msgSend_integerValue(v23, v30, v31, v32, v33, v34, v35) == 1;
  }
  return (char)v23;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  return 0;
}

- (BOOL)transcodeProcessingRequired:(int64_t)a3
{
  return (unint64_t)a3 > 1;
}

- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  NSObject *v14;
  uint8_t v15[16];

  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21DFB1000, v14, OS_LOG_TYPE_INFO, "Attempted to transcode with generic transcoder--this is probably unintentional!!", v15, 2u);
    }
  }
  if (a13)
    (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))a13 + 2))(a13, a3, 0, 0, 0, 1, 0, 0);
}

- (BOOL)BOOLFromTranscoderUserInfo:(id)a3 withKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)a4, (uint64_t)a4, v4, v5, v6);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      v16 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13, v14, v15);
    else
      v16 = 0;
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = CFSTR("NO");
        v21 = 138413058;
        v22 = a3;
        v23 = 2112;
        if (v16)
          v18 = CFSTR("YES");
        v24 = v9;
        v25 = 2112;
        v26 = a4;
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_21DFB1000, v17, OS_LOG_TYPE_INFO, "Has transcoderUserInfo: %@, found %@, so %@ = %@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = a4;
        _os_log_impl(&dword_21DFB1000, v19, OS_LOG_TYPE_INFO, "No transcoderUserInfo for %@", (uint8_t *)&v21, 0xCu);
      }
    }
    LOBYTE(v16) = 0;
  }
  return v16;
}

@end
