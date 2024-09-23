@implementation IMUnarchiverDecoder

+ (id)_decodeEncodedData:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Decoding data of length %@", buf, 0xCu);

    }
  }
  v22 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v22);
  v11 = v22;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "_enableStrictSecureDecodingMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "strict-decoding 009 _enableStrictSecureDecodingMode called with error:[%@]", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v10, "setDecodingFailurePolicy:", 0);
  objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Successfully decoded data!", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (id)objc_opt_class();
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v19 = v18;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Could not decode data because decoded object was of class %@ instead of expected class %@", buf, 0x16u);

      }
    }
    v14 = 0;
  }
  v20 = v14;

  return v20;
}

+ (id)decodeEncodedDataSecurely:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a5;
  +[IMUnarchiverDecoder _decodeEncodedData:ofClass:includesAllowlistedClasses:](IMUnarchiverDecoder, "_decodeEncodedData:ofClass:includesAllowlistedClasses:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
