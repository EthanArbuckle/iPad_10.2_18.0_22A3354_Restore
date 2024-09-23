@implementation SFSiriVoiceUtilities

- (NSString)activeSiriReaderSessionIdentifier
{
  return self->_activeSiriReaderSessionIdentifier;
}

void __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *This;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_4_2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)WeakRetained[2];
    WeakRetained[2] = v6;

    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Siri has downloaded voices for the following languages: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v9 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

+ (SFSiriVoiceUtilities)sharedVoiceUtilities
{
  if (sharedVoiceUtilities_onceToken != -1)
    dispatch_once(&sharedVoiceUtilities_onceToken, &__block_literal_global_58);
  return (SFSiriVoiceUtilities *)(id)sharedVoiceUtilities_sharedVoiceUtilitiesInstance;
}

void __44__SFSiriVoiceUtilities_sharedVoiceUtilities__block_invoke()
{
  SFSiriVoiceUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(SFSiriVoiceUtilities);
  v1 = (void *)sharedVoiceUtilities_sharedVoiceUtilitiesInstance;
  sharedVoiceUtilities_sharedVoiceUtilitiesInstance = (uint64_t)v0;

}

- (void)fetchAvailableVoiceLanguages
{
  SiriTTSDaemonSession *v3;
  SiriTTSDaemonSession *activeSiriDaemonSession;
  SiriTTSDaemonSession *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_activeSiriDaemonSession)
  {
    v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x1E0DA78A8]);
    activeSiriDaemonSession = self->_activeSiriDaemonSession;
    self->_activeSiriDaemonSession = v3;

  }
  objc_initWeak(&location, self);
  v5 = self->_activeSiriDaemonSession;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke;
  v6[3] = &unk_1E21E70E8;
  objc_copyWeak(&v7, &location);
  -[SiriTTSDaemonSession downloadedVoicesMatching:reply:](v5, "downloadedVoicesMatching:reply:", 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)downloadedSiriVoiceLanguages
{
  return self->_downloadedSiriVoiceLanguages;
}

- (NSURL)activeSiriReaderSessionURL
{
  return self->_activeSiriReaderSessionURL;
}

- (void)setActiveSiriReaderSessionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setActiveSiriReaderSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSiriReaderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeSiriReaderSessionURL, 0);
  objc_storeStrong((id *)&self->_downloadedSiriVoiceLanguages, 0);
  objc_storeStrong((id *)&self->_activeSiriDaemonSession, 0);
}

@end
