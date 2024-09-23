@implementation NSAttributedString(UserNotifications)

+ (id)_un_attributedStringWithRTFDData:()UserNotifications
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v20[0] = CFSTR("DocumentType");
    v20[1] = CFSTR("DefaultAttributes");
    v21[0] = CFSTR("NSRTFD");
    v21[1] = MEMORY[0x1E0C9AA70];
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithData:options:documentAttributes:error:", v4, v5, 0, &v19);

    v7 = v19;
    if (v7)
    {
      v8 = UNLogUtilities;
      if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR))
        +[NSAttributedString(UserNotifications) _un_attributedStringWithRTFDData:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v16 = objc_msgSend(v6, "length");
    objc_msgSend(v6, "removeAttribute:range:", CFSTR("NSFont"), 0, v16);
    objc_msgSend(v6, "removeAttribute:range:", CFSTR("NSParagraphStyle"), 0, v16);
    v17 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)_un_RTFDData
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v16 = CFSTR("DocumentType");
  v17[0] = CFSTR("NSRTFD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v2, v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v5)
  {
    v6 = UNLogUtilities;
    if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR))
      -[NSAttributedString(UserNotifications) _un_RTFDData].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return v4;
}

- (id)_un_truncatedAttributedStringToMaxLength:()UserNotifications
{
  id v5;

  if (objc_msgSend(a1, "length") <= a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "attributedSubstringFromRange:", 0, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_un_attributedStringByKeepingOnlyAttachmentAttributes
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__NSAttributedString_UserNotifications___un_attributedStringByKeepingOnlyAttachmentAttributes__block_invoke;
  v6[3] = &unk_1E57EFC68;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v6);

  return v4;
}

+ (void)_un_attributedStringWithRTFDData:()UserNotifications .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, a1, a3, "Failed to create attributed string from RTFD data", a5, a6, a7, a8, 0);
}

- (void)_un_RTFDData
{
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, a1, a3, "Failed to create RTFD data from attributed string", a5, a6, a7, a8, 0);
}

@end
