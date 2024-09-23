@implementation FTServiceStatus

- (void)_reload
{
  uint64_t v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_supportedServicesFlags(self, a2, v2);
  v7 = objc_msgSend__noCache_supportedServicesFlags(self, v5, v6);
  objc_msgSend_setSupportedServicesFlags_(self, v8, v7);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((v7 & 1) != 0)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    if ((v7 & 2) != 0)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if ((v7 & 4) != 0)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v23 = 138413058;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2048;
    v30 = objc_msgSend_supportedServicesFlags(self, v12, v13);
    _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Updating supported service status { iMessageSupported: %@, faceTimeAudioSupported: %@, faceTimeMultiwaySupported: %@, supportedServicesFlags: %llu }", (uint8_t *)&v23, 0x2Au);
  }

  if ((((v4 ^ v7) & 1) != 0
     || ((v4 >> 1) & 1) != ((v7 >> 1) & 1)
     || ((v4 >> 2) & 1) != ((v7 >> 2) & 1))
    && (objc_msgSend_blockPost(self, v17, v18) & 1) == 0)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, (uint64_t)CFSTR("FTServiceStatusDidChangeNotification"), 0);

  }
}

- (unint64_t)supportedServicesFlags
{
  return self->_supportedServicesFlags;
}

- (void)_addObservers
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;
  id location;

  IMUserScopedNotification();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  im_primary_queue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v7, &location);
  v4 = IMDispatchForNotify();
  objc_msgSend_setSupportedServicesToken_(self, v5, v4, v6, 3221225472, sub_1A4C93E64, &unk_1E4DD9A80);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

+ (id)sharedInstance
{
  if (qword_1ECF9D7F8 != -1)
    dispatch_once(&qword_1ECF9D7F8, &unk_1E4DD93F0);
  return (id)qword_1ECF9D808;
}

- (int)supportedServicesToken
{
  return self->_supportedServicesToken;
}

- (void)setSupportedServicesToken:(int)a3
{
  self->_supportedServicesToken = a3;
}

- (void)setSupportedServicesFlags:(unint64_t)a3
{
  self->_supportedServicesFlags = a3;
}

- (id)initPrivate
{
  FTServiceStatus *v2;
  const char *v3;
  uint64_t v4;
  FTServiceStatus *v5;
  const char *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FTServiceStatus;
  v2 = -[FTServiceStatus init](&v9, sel_init);
  v5 = v2;
  if (v2)
  {
    v2->_blockPost = 1;
    objc_msgSend__addObservers(v2, v3, v4);
    objc_msgSend__reload(v5, v6, v7);
    v5->_blockPost = 0;
  }
  return v5;
}

- (BOOL)iMessageSupported
{
  uint64_t v2;

  return objc_msgSend_supportedServicesFlags(self, a2, v2) & 1;
}

- (BOOL)faceTimeMultiwaySupported
{
  uint64_t v2;

  return ((unint64_t)objc_msgSend_supportedServicesFlags(self, a2, v2) >> 2) & 1;
}

- (BOOL)faceTimeAudioSupported
{
  uint64_t v2;

  return ((unint64_t)objc_msgSend_supportedServicesFlags(self, a2, v2) >> 1) & 1;
}

- (BOOL)blockPost
{
  return self->_blockPost;
}

- (unint64_t)_noCache_supportedServicesFlags
{
  uint64_t v2;
  int v3;
  uint64_t state64;

  state64 = 0;
  v3 = objc_msgSend_supportedServicesToken(self, a2, v2);
  notify_get_state(v3, &state64);
  return state64;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__removeObservers(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FTServiceStatus;
  -[FTServiceStatus dealloc](&v4, sel_dealloc);
}

- (void)_removeObservers
{
  uint64_t v2;
  int v3;

  v3 = objc_msgSend_supportedServicesToken(self, a2, v2);
  notify_cancel(v3);
}

- (void)setBlockPost:(BOOL)a3
{
  self->_blockPost = a3;
}

@end
