@implementation IMDStickerRegistry

+ (id)sharedInstance
{
  if (qword_1ED935D28 != -1)
    dispatch_once(&qword_1ED935D28, &unk_1E922EE90);
  return (id)qword_1ED935E68;
}

- (IMDStickerRegistry)init
{
  uint64_t Mutable;
  IMDStickerRegistry *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)IMDStickerRegistry;
  Mutable = -[IMDStickerRegistry init](&v9, sel_init);
  v3 = (IMDStickerRegistry *)Mutable;
  if (Mutable)
  {
    Mutable = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
    if ((_DWORD)Mutable)
    {
      v4 = objc_msgSend(CFSTR("/var/mobile/Library/SMS/Stickers"), "stringByExpandingTildeInPath");
      Mutable = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v4);
      if ((_DWORD)Mutable)
      {
        v8 = 0;
        Mutable = IMOSLoggingEnabled(objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v4, &v8));
        if ((_DWORD)Mutable)
        {
          v5 = OSLogHandleForIMEventCategory();
          Mutable = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
          if ((_DWORD)Mutable)
          {
            *(_DWORD *)buf = 138412546;
            v11 = v4;
            v12 = 2112;
            v13 = v8;
            _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Deleting legacy Sticker folder at path %@, error %@", buf, 0x16u);
          }
        }
      }
    }
    if (!v3->_stickerPackGUIDToPackMap)
    {
      Mutable = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v3->_stickerPackGUIDToPackMap = (NSMutableDictionary *)Mutable;
    }
  }
  if (IMOSLoggingEnabled(Mutable))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Initialized IMDStickerStore", buf, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDStickerRegistry;
  -[IMDStickerRegistry dealloc](&v3, sel_dealloc);
}

- (id)_cachedPathForStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4
{
  return (id)IMSharedHelperCachePathForStickerWithProperties();
}

- (BOOL)_isRecipeBasedSticker:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  if (objc_msgSend(a3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D392E0]), "length");
    if (v4)
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D39320]), "length") != 0;
  }
  else
  {
    LODWORD(v4) = IMOSLoggingEnabled(0);
    if ((_DWORD)v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      LODWORD(v4) = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if ((_DWORD)v4)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "_isRecipeBasedSticker invalid properties", v7, 2u);
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (void)retrieveStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL8 v17;
  _BOOL4 v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[7];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = IMOSLoggingEnabled(self);
  if ((_DWORD)v9)
  {
    v10 = OSLogHandleForIMEventCategory();
    v9 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((_DWORD)v9)
    {
      *(_DWORD *)buf = 138412546;
      v28 = a3;
      v29 = 2112;
      v30 = a5;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Retrieve sticker with properties %@, completionBlock %@", buf, 0x16u);
    }
  }
  if (a5)
  {
    if (a3 && objc_msgSend(a3, "count"))
    {
      v11 = -[IMDStickerRegistry _cachedPathForStickerWithProperties:isAdaptiveImageGlyph:](self, "_cachedPathForStickerWithProperties:isAdaptiveImageGlyph:", a3, v6);
      v12 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D392E0]);
      if (v11)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v11);
        if ((_DWORD)v14)
        {
          if (IMOSLoggingEnabled(v14))
          {
            v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v11;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "sticker found in cache %@", buf, 0xCu);
            }
          }
          (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v11, 0);
        }
        else
        {
          v17 = -[IMDStickerRegistry _isRecipeBasedSticker:](self, "_isRecipeBasedSticker:", a3);
          v18 = v17;
          v19 = IMOSLoggingEnabled(v17);
          if (v18)
          {
            if (v19)
            {
              v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v13;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Received ME-sticker from balloon %@", buf, 0xCu);
              }
            }
            v21 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D39320]);
            v22 = (void *)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
            v23 = objc_msgSend(v21, "_FTDataFromHexString");
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = sub_1D15CC6B8;
            v26[3] = &unk_1E922EEB8;
            v26[5] = 0;
            v26[6] = a5;
            v26[4] = v13;
            objc_msgSend(v22, "transcodeLocalTransferPayloadData:balloonBundleID:completionBlock:", v23, v13, v26);
          }
          else
          {
            if (v19)
            {
              v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Sticker not found in cache", buf, 2u);
              }
            }
            (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled(v12))
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v28 = a3;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Invalid sticker properties passed to retrieveStickerWithProperties %@", buf, 0xCu);
          }
        }
        (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.private.IMDaemonCore.IMDStickerRegistry"), 2, 0));
      }
    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.private.IMDaemonCore.IMDStickerRegistry"), 1, 0));
    }
  }
  else if (IMOSLoggingEnabled(v9))
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "IMDStickerRegistry. No completion block passed in.", buf, 2u);
    }
  }
}

- (NSMutableDictionary)stickerPackGUIDToPackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStickerPackGUIDToPackMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
