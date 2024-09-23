@implementation IMDDonationManager

+ (id)sharedInstance
{
  if (qword_1ED0D39D0 != -1)
    dispatch_once(&qword_1ED0D39D0, &unk_1E5AAF268);
  return (id)qword_1ED0D3AB8;
}

- (IMDDonationManager)init
{
  IMDDonationManager *v2;
  uint64_t v3;
  NSFileManager *fileManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDDonationManager;
  v2 = -[IMDDonationManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = objc_claimAutoreleasedReturnValue();
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSFileManager *fileManager;
  objc_super v4;

  fileManager = self->_fileManager;
  self->_fileManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMDDonationManager;
  -[IMDDonationManager dealloc](&v4, sel_dealloc);
}

- (void)copyGroupPhotoToExternalPathIfNecessary:(id)a3 chatGUID:(id)a4 attachmentFilepath:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  char v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  const __CFString *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    -[__CFString im_lastPathComponent](v10, "im_lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperExternalLocationForFile();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDDonationManager fileManager](self, "fileManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

    v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v13;
          _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "File already exists at path %@", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v13;
          _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "File missing at path %@. Will attempt to copy from Attachments directory", buf, 0xCu);
        }

      }
      objc_msgSend(v13, "stringByDeletingLastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDDonationManager fileManager](self, "fileManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "__im_makeDirectoriesInPath:mode:", v20, 448);

      if ((v22 & 1) == 0 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v20;
          _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "Error creating intermediate directories for path: %@", buf, 0xCu);
        }

      }
      -[IMDDonationManager fileManager](self, "fileManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v25 = objc_msgSend(v24, "copyItemAtPath:toPath:error:", v11, v13, &v32);
      v26 = v32;

      if (v26)
        v27 = 0;
      else
        v27 = v25;
      v28 = IMOSLoggingEnabled();
      if ((v27 & 1) != 0)
      {
        if (v28)
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v13;
            v35 = 2112;
            v36 = v11;
            _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Successfully copied to path %@ from path %@", buf, 0x16u);
          }

        }
      }
      else if (v28)
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          v34 = v13;
          v35 = 2112;
          if (v25)
            v31 = CFSTR("YES");
          v36 = v11;
          v37 = 2112;
          v38 = v31;
          v39 = 2112;
          v40 = v26;
          _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "Error copying to path %@ from path %@ success: %@ error: %@", buf, 0x2Au);
        }

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "early returning from copyGroupPhotoToExternalPathIfNecessary - nil argument. groupPhotoGUID %@ chatGUID %@ filepath %@", buf, 0x20u);
    }

  }
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
