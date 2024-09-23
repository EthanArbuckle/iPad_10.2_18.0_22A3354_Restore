@implementation IMTransferEncryptionController

+ (id)sharedInstance
{
  if (qword_2540D93C8 != -1)
    dispatch_once(&qword_2540D93C8, &unk_24F979EA0);
  return (id)qword_2540D93F0;
}

- (void)encryptURL:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v5;
          _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Request to encrypt data at url: %@", (uint8_t *)&v9, 0xCu);
        }

      }
      +[IMTransferEncryptionHelpers encryptURL:completionBlock:](IMTransferEncryptionHelpers, "encryptURL:completionBlock:", v5, v7);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v6 + 2))(v6, 0, 0, 0, 0, 300);
    }
  }

}

- (void)decryptURL:(id)a3 key:(id)a4 outputFileName:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = 138412546;
          v16 = v9;
          v17 = 2112;
          v18 = v10;
          _os_log_impl(&dword_22D97D000, v14, OS_LOG_TYPE_INFO, "Request to decrypt data at url: %@  with key: %@", (uint8_t *)&v15, 0x16u);
        }

      }
      +[IMTransferEncryptionHelpers decryptURL:key:outputFileName:completionBlock:](IMTransferEncryptionHelpers, "decryptURL:key:outputFileName:completionBlock:", v9, v10, v11, v13);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v12 + 2))(v12, 0, 0, 0, 301);
    }
  }

}

@end
