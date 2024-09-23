@implementation CKPrintController

- (BOOL)isPrinting
{
  return self->_isPrinting;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation_0 != -1)
    dispatch_once(&sharedInstance_creation_0, &__block_literal_global_140);
  return (id)sharedInstance_sInstance_2;
}

void __35__CKPrintController_sharedInstance__block_invoke()
{
  CKPrintController *v0;
  void *v1;

  v0 = objc_alloc_init(CKPrintController);
  v1 = (void *)sharedInstance_sInstance_2;
  sharedInstance_sInstance_2 = (uint64_t)v0;

}

- (CKPrintController)init
{
  CKPrintController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPrintController;
  result = -[CKPrintController init](&v3, sel_init);
  if (result)
    result->_isPrinting = 0;
  return result;
}

- (void)setPrinting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("YES");
      if (self->_isPrinting)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      if (!v3)
        v6 = CFSTR("NO");
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "set isPrinting from [%@] to [%@]", (uint8_t *)&v8, 0x16u);
    }

  }
  self->_isPrinting = v3;
}

- (id)avatarImageForContact:(id)a3 diameter:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPrintController avatarCache](self, "avatarCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0C97460];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    objc_msgSend(v12, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, a4, a4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v21 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[CKPrintController avatarImageRenderer](self, "avatarImageRenderer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "avatarImageForContacts:scope:", v16, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CKPrintController avatarCache](self, "avatarCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:cost:", v11, v7, 1);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v7;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "avatar cache store for contact [%@]", buf, 0xCu);
        }
LABEL_18:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "avatar fetch fail for contact [%@]", buf, 0xCu);
      }
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "avatar cache hit for contact [%@]", buf, 0xCu);
    }

  }
  v11 = v9;
LABEL_20:

  return v11;
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  CNAvatarImageRenderer *avatarImageRenderer;
  id v4;
  void *v5;
  CNAvatarImageRenderer *v6;
  CNAvatarImageRenderer *v7;

  avatarImageRenderer = self->_avatarImageRenderer;
  if (!avatarImageRenderer)
  {
    v4 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CNAvatarImageRenderer *)objc_msgSend(v4, "initWithSettings:", v5);
    v7 = self->_avatarImageRenderer;
    self->_avatarImageRenderer = v6;

    avatarImageRenderer = self->_avatarImageRenderer;
  }
  return avatarImageRenderer;
}

- (NSCache)avatarCache
{
  NSCache *avatarCache;
  NSCache *v4;
  NSCache *v5;

  avatarCache = self->_avatarCache;
  if (!avatarCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_avatarCache;
    self->_avatarCache = v4;

    -[NSCache setTotalCostLimit:](self->_avatarCache, "setTotalCostLimit:", 50);
    avatarCache = self->_avatarCache;
  }
  return avatarCache;
}

- (void)clearAvatarCache
{
  NSCache *avatarCache;

  avatarCache = self->_avatarCache;
  self->_avatarCache = 0;

}

+ (id)printBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
}

+ (id)printTranscriptTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
}

+ (id)printBalloonTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

+ (id)printAttributes:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CKPrintController printTranscriptTextColor](CKPrintController, "printTranscriptTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v3;
}

+ (void)printBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  a3->var2 = 2;
  a3->var5 = 4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unfilledBalloonColorForColorType:", 0xFFFFFFFFLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ckColor");
  a3->var6.red = v7;
  a3->var6.green = v8;
  a3->var6.blue = v9;
  a3->var6.alpha = v10;

  a3->var7 = 1;
  a3->var0 = 0;
}

+ (void)printResolvedColors:(id *)a3 balloonDescriptor:(CKBalloonDescriptor_t *)a4 coloredBalloonView:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[CKPrintController printBackgroundColor](CKPrintController, "printBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "printBalloonDescriptor:", a4);
  objc_msgSend(v8, "setBalloonStyle:", 2);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unfilledBalloonColorForColorType:", 0xFFFFFFFFLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ckColor");
  objc_msgSend(v8, "setStrokeColor:");

  objc_msgSend(v8, "setColor:", 4);
  objc_msgSend(v8, "setUserInterfaceStyle:", 1);

}

- (void)setAvatarImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageRenderer, a3);
}

- (void)setAvatarCache:(id)a3
{
  objc_storeStrong((id *)&self->_avatarCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarCache, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
}

@end
