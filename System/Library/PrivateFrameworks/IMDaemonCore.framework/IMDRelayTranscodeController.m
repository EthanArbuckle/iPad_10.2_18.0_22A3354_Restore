@implementation IMDRelayTranscodeController

+ (id)sharedInstance
{
  if (qword_1ED935D00 != -1)
    dispatch_once(&qword_1ED935D00, &unk_1E922D710);
  return (id)qword_1ED935E38;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 target:(int64_t)a5 transcoderUserInfo:(id)a6 isSticker:(BOOL)a7 highQualityMaxByteSize:(unint64_t)a8 lowQualityMaxByteSize:(unint64_t)a9 representations:(int64_t)a10 completionBlock:(id)a11
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int64_t v37;
  char v38;
  _QWORD v39[2];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v12 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a11;
  v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v19;
  if (v19)
  {
    v37 = a5;
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v16;
        v42 = 2112;
        v43 = v18;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Transcoder received request to transcode: %@  transcodeInfo: %@", buf, 0x16u);
      }

    }
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "fileExistsAtPath:isDirectory:", v23, &v38);

    if ((v24 & 1) != 0)
    {
      if (v38)
      {
        if (IMOSLoggingEnabled(v25))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Input URL is a directory, not transcoding", buf, 2u);
          }

        }
        IMSingleObjectArray();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))v20)[2](v20, v16, v27, 0, 0, 1, 0, 0);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "resourcePath");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMDAttachmentUtilities messageAttachmentSendableUTIsForResourcePath:](IMDAttachmentUtilities, "messageAttachmentSendableUTIsForResourcePath:", v36);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v34) = 0;
        objc_msgSend(v30, "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:", v16, v17, v12, v35, v37, v33, 0, -1, v18, a10, v34, v20);

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v25))
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v16;
          _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing transcoding", buf, 0xCu);
        }

      }
      ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v20)[2](v20, v16, 0, 0, 0, 0, 0, 0);
    }
  }

}

@end
