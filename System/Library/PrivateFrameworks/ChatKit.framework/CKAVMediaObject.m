@implementation CKAVMediaObject

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKAVMediaObject;
  -[CKMediaObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject transcoderUserInfo](self, "transcoderUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int isKindOfClass;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  CKAVMediaObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double (*v36)(_QWORD *);
  CKAVMediaObject *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  char v45;
  uint8_t buf[4];
  CKAVMediaObject *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (duration__pred_CMTimeGetSecondsCoreMedia != -1)
    dispatch_once(&duration__pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_76);
  if (!self->_durationLoaded)
  {
    +[CKAVMediaObject durationCache](CKAVMediaObject, "durationCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transferGUID](self, "transferGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      -[CKAVMediaObject setDuration:](self, "setDuration:");
    }
    -[CKMediaObject transcoderUserInfo](self, "transcoderUserInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (self->_durationLoaded)
        goto LABEL_64;
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37ED0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            OSLogHandleForIMFoundationCategory();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v47 = self;
              v48 = 2112;
              v49 = *(double *)&v8;
              _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "For media object (%@), getting duration (%@) from transcoderUserInfo", buf, 0x16u);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v38 = self;
            v40 = *(double *)&v8;
            _CKLog();
          }
          objc_msgSend(v8, "doubleValue", v38, *(_QWORD *)&v40);
          -[CKAVMediaObject setDuration:](self, "setDuration:");
        }
      }

      if (self->_durationLoaded)
        goto LABEL_64;
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D37F08]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D37ED8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        isKindOfClass = 0;
      }
      if (v11)
      {
        objc_opt_class();
        if ((isKindOfClass & objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "doubleValue");
          v14 = v13;
          objc_msgSend(v10, "doubleValue");
          v16 = v14 - v15;
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v47 = self;
              v48 = 2048;
              v49 = v16;
              v50 = 2112;
              v51 = v10;
              v52 = 2112;
              v53 = v11;
              _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "For media object (%@), getting duration (%f) from start and end: (%@|%@)", buf, 0x2Au);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v42 = v10;
            v43 = v11;
            v40 = v16;
            v38 = self;
            _CKLog();
          }
          -[CKAVMediaObject setDuration:](self, "setDuration:", v16, v38, *(_QWORD *)&v40, v42, v43);
        }
      }

    }
    if (!self->_durationLoaded)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[CKMediaObject fileURL](self, "fileURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = self;
          v48 = 2112;
          v49 = *(double *)&v19;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_DEBUG, "For media object (%@), calculating duration from file: %@", buf, 0x16u);

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        -[CKMediaObject fileURL](self, "fileURL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLog();

      }
      v20 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      v45 = 0;
      -[CKMediaObject fileURL](self, "fileURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v22, &v45);
      if (v45)
        v24 = 0;
      else
        v24 = v23;

      if (v24)
      {
        -[CKMediaObject transcoderUserInfo](self, "transcoderUserInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0D37EC0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
        else
          -[CKMediaObject fileURL](self, "fileURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x193FF3C18](CFSTR("PLAssetSharingUtilities"), CFSTR("PhotoLibraryServices"));
        -[CKMediaObject fileURL](self, "fileURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "playerItemForVideoURL:fallbackFilePath:library:", v29, v32, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "asset");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v36 = (double (*)(_QWORD *))duration__CMTimeGetSeconds;
        if (v34)
          objc_msgSend(v34, "duration");
        else
          memset(v44, 0, sizeof(v44));
        if (v36(v44) >= 0.0)
          -[CKAVMediaObject setDuration:](self, "setDuration:");
        else
          self->_durationLoaded = 1;

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(46);
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            -[CKMediaObject fileURL](self, "fileURL");
            v28 = (CKAVMediaObject *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v28;
            _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_DEBUG, "  => No file at URL (%@), aborting duration calculation", buf, 0xCu);

          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          -[CKMediaObject fileURL](self, "fileURL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          _CKLog();

        }
        self->_durationLoaded = 1;
      }

    }
LABEL_64:

  }
  return self->_duration;
}

void *__27__CKAVMediaObject_duration__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  duration__CMTimeGetSeconds = result;
  return result;
}

+ (id)durationCache
{
  if (durationCache_once != -1)
    dispatch_once(&durationCache_once, &__block_literal_global_41);
  return (id)durationCache_sDurationCache;
}

void __32__CKAVMediaObject_durationCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  CKCreateCache(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)durationCache_sDurationCache;
  durationCache_sDurationCache = v0;

}

- (void)setDuration:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    self->_durationLoaded = 1;
    +[CKAVMediaObject durationCache](CKAVMediaObject, "durationCache");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transferGUID](self, "transferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v6);

  }
}

- (BOOL)durationLoaded
{
  return self->_durationLoaded;
}

- (void)setDurationLoaded:(BOOL)a3
{
  self->_durationLoaded = a3;
}

@end
