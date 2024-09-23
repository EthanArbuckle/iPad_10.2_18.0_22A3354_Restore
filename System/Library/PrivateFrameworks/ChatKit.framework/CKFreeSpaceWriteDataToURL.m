@implementation CKFreeSpaceWriteDataToURL

void __CKFreeSpaceWriteDataToURL_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 0;
    v7 = objc_msgSend(v5, "writeToURL:options:error:", v6, 1073741825, &v14);
    v8 = v14;
    if ((v7 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v16 = v10;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Failed to write preview at URL: %@ with error: %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "writeToURL:atomically:", *(_QWORD *)(a1 + 40), 1);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a4;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Failed to guarantee free space with error: %@", buf, 0xCu);
    }

  }
  v13 = *(NSObject **)(a1 + 48);
  if (v13)
    dispatch_group_leave(v13);
}

@end
