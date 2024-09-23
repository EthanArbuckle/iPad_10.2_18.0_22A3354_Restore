@implementation CKAttachmentSaver

- (CKAttachmentSaver)initWithAttachments:(id)a3
{
  id v4;
  CKAttachmentSaver *v5;
  uint64_t v6;
  NSMutableArray *attachments;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentSaver;
  v5 = -[CKAttachmentSaver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    attachments = v5->_attachments;
    v5->_attachments = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)popAndSaveNextAttachment
{
  -[CKAttachmentSaver _pop](self, "_pop");
  -[CKAttachmentSaver _saveNextAttachment](self, "_saveNextAttachment");
}

- (void)_pop
{
  -[NSMutableArray removeObjectAtIndex:](self->_attachments, "removeObjectAtIndex:", 0);
  self->_errorCount = 0;
}

- (void)_saveNextAttachment
{
  void *v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsCompatibleWithSavedPhotosAlbum;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  CKAttachmentSaver *v28;
  __int128 *p_buf;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  void *v37;
  __int128 buf;
  uint64_t v39;
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_attachments, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_attachments, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v5);

    if (IsCompatibleWithSavedPhotosAlbum)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v4;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Attempting to save video attachment with URL %@", (uint8_t *)&buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_CKShouldLog())
        {
          v25 = v4;
          _CKLog();
        }
      }
      objc_msgSend(v4, "path", v25);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      UISaveVideoAtPathToSavedPhotosAlbum(v8, self, sel__saveCompletionForVideoWithPath_error_context_, 0);

    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v39 = 0x2020000000;
      v40 = 0;
      if (objc_msgSend(v3, "isIrisAsset"))
      {
        objc_msgSend(v3, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "calculateIrisVideoPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x1E0D75318]);
        v13 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
        v14 = *(_OWORD *)v13;
        v33 = *(_QWORD *)(v13 + 16);
        v32 = v14;
        v15 = (void *)objc_msgSend(v12, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v11, v10, &v32, 0);
        v16 = dispatch_semaphore_create(0);
        if (v15)
        {
          if ((_IMWillLog() & 1) != 0)
          {
            v25 = v15;
            _IMAlwaysLog();
          }
          objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary", v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = MEMORY[0x1E0C809B0];
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __40__CKAttachmentSaver__saveNextAttachment__block_invoke;
          v30[3] = &unk_1E274A208;
          v31 = v15;
          v26[0] = v18;
          v26[1] = 3221225472;
          v26[2] = __40__CKAttachmentSaver__saveNextAttachment__block_invoke_2;
          v26[3] = &unk_1E274AF98;
          p_buf = &buf;
          v19 = v16;
          v27 = v19;
          v28 = self;
          objc_msgSend(v17, "performChanges:completionHandler:", v30, v26);

          dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          _IMWarn();
          -[CKAttachmentSaver popAndSaveNextAttachment](self, "popAndSaveNextAttachment", v10, v11, 0);
        }

      }
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v4);
        if (v20)
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v36 = 138412290;
              v37 = v4;
              _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_DEBUG, "Attempting to save image attachment with URL %@", v36, 0xCu);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v25 = v4;
            _CKLog();
          }
          UIImageDataWriteToSavedPhotosAlbum();
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v36 = 138412290;
              v37 = v4;
              _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_DEBUG, "Could not find data to save attachment with URL %@. Skipping.", v36, 0xCu);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v25 = v4;
            _CKLog();
          }
          -[CKAttachmentSaver popAndSaveNextAttachment](self, "popAndSaveNextAttachment", v25);
        }

      }
      _Block_object_dispose(&buf, 8);
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0D38898];
    v35 = *MEMORY[0x1E0D38888];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trackEvent:withDictionary:", *MEMORY[0x1E0D38868], v24);

  }
}

id __40__CKAttachmentSaver__saveNextAttachment__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13B0], "creationRequestForAssetFromVideoComplementBundle:", *(_QWORD *)(a1 + 32));
}

void __40__CKAttachmentSaver__saveNextAttachment__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if (_IMWillLog())
    _IMAlwaysLog();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (_IMWillLog())
    _IMAlwaysLog();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "popAndSaveNextAttachment");

}

- (void)_saveCompletionForVideoWithPath:(id)a3 error:(id)a4 context:(void *)a5
{
  -[CKAttachmentSaver _saveCompletion:](self, "_saveCompletion:", a4);
}

- (void)_saveCompletionForImage:(id)a3 error:(id)a4 context:(void *)a5
{
  -[CKAttachmentSaver _saveCompletion:](self, "_saveCompletion:", a4);
}

- (void)_saveCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "code") == -3301)
    {
      v6 = self->_errorCount + 1;
      self->_errorCount = v6;
      v7 = IMOSLoggingEnabled();
      if (v6 > 4)
      {
        if (v7)
        {
          CKLogCStringForType(46);
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_DEBUG, "Write Busy error saving attachment too many times. Skipping.", buf, 2u);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          _CKLog();
        -[CKAttachmentSaver popAndSaveNextAttachment](self, "popAndSaveNextAttachment");
      }
      else
      {
        if (v7)
        {
          CKLogCStringForType(46);
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "Write Busy error saving attachment. Trying again soon.", buf, 2u);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          _CKLog();
        -[CKAttachmentSaver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__saveNextAttachment, 0, 0.25);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v5;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "Unexpected error saving attachment. Skipping. Error: %@", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v11 = v5;
        _CKLog();
      }
      -[CKAttachmentSaver popAndSaveNextAttachment](self, "popAndSaveNextAttachment", v11);
    }
  }
  else
  {
    -[CKAttachmentSaver popAndSaveNextAttachment](self, "popAndSaveNextAttachment");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
