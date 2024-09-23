@implementation MediaLibraryHelper

- (void)_updateITunesRadioEnabled
{
  int AppIntegerValue;
  id v4;

  AppIntegerValue = __iTunesRadioEnabledOverride___overrideRadioAvailable;
  if (__iTunesRadioEnabledOverride___overrideRadioAvailable == -1)
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("overrideRadioEnabled"), CFSTR("com.apple.iapd"), 0);
    __iTunesRadioEnabledOverride___overrideRadioAvailable = AppIntegerValue;
    if (AppIntegerValue)
      goto LABEL_3;
LABEL_7:
    if (self->_showMusic)
    {
      objc_msgSend(MEMORY[0x24BDDCB48], "defaultRadioLibrary");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      self->_iTunesRadioEnabled = objc_msgSend(v4, "isEnabled");

    }
    else
    {
      self->_iTunesRadioEnabled = 0;
    }
    return;
  }
  if (!__iTunesRadioEnabledOverride___overrideRadioAvailable)
    goto LABEL_7;
LABEL_3:
  if (AppIntegerValue == -1)
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("overrideRadioEnabled"), CFSTR("com.apple.iapd"), 0);
    __iTunesRadioEnabledOverride___overrideRadioAvailable = AppIntegerValue;
  }
  self->_iTunesRadioEnabled = AppIntegerValue == 1;
}

- (BOOL)iTunesRadioEnabled
{
  -[MediaLibraryHelper _updateITunesRadioEnabled](self, "_updateITunesRadioEnabled");
  return self->_iTunesRadioEnabled;
}

- (MediaLibraryHelper)init
{
  MediaLibraryHelper *v2;
  char v3;
  char v4;
  int AppBooleanValue;
  char v6;
  char v7;
  WorkspaceObserver *v8;
  WorkspaceObserver *workspaceObserver;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MediaLibraryHelper;
  v2 = -[MediaLibraryHelper init](&v11, sel_init);
  if (!v2)
    return v2;
  v3 = __mediaLibraryAccessOverride___MLAccessOverride;
  if (__mediaLibraryAccessOverride___MLAccessOverride == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MediaLibraryAccessOverride"), CFSTR("com.apple.iapd"), 0);
    v3 = AppBooleanValue;
    __mediaLibraryAccessOverride___MLAccessOverride = AppBooleanValue;
    if ((AppBooleanValue & 1) == 0)
      goto LABEL_4;
LABEL_6:
    v4 = 1;
    goto LABEL_7;
  }
  if ((__mediaLibraryAccessOverride___MLAccessOverride & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v4 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
LABEL_7:
  v2->_showMusic = v4;
  if ((v3 & 2) != 0)
    v6 = 1;
  else
    v6 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
  v2->_showPodcasts = v6;
  if ((v3 & 4) != 0)
    v7 = 1;
  else
    v7 = IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
  v2->_showAudioBooks = v7;
  -[MediaLibraryHelper _updateITunesRadioEnabled](v2, "_updateITunesRadioEnabled");
  v8 = objc_alloc_init(WorkspaceObserver);
  workspaceObserver = v2->_workspaceObserver;
  v2->_workspaceObserver = v8;

  -[WorkspaceObserver setDelegate:](v2->_workspaceObserver, "setDelegate:", v2);
  -[WorkspaceObserver startObserving](v2->_workspaceObserver, "startObserving");
  return v2;
}

- (void)dealloc
{
  WorkspaceObserver *workspaceObserver;
  objc_super v4;

  -[WorkspaceObserver stopObserving](self->_workspaceObserver, "stopObserving");
  -[WorkspaceObserver setDelegate:](self->_workspaceObserver, "setDelegate:", 0);
  workspaceObserver = self->_workspaceObserver;
  self->_workspaceObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)MediaLibraryHelper;
  -[MediaLibraryHelper dealloc](&v4, sel_dealloc);
}

- (void)handleAppInstall:(id)a3
{
  void *v4;
  char v5;
  _BOOL4 showMusic;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 showPodcasts;
  void *v11;
  int v12;
  _BOOL4 showAudioBooks;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music"));

  if ((v5 & 1) != 0)
  {
    showMusic = self->_showMusic;
    self->_showMusic = 1;
    if (!showMusic)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", kMediaLibraryMusicAppInstalledNotification, 0);

LABEL_9:
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", kMediaLibraryNeedFilterChange, 0);

    }
  }
  else
  {
    objc_msgSend(v15, "applicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.podcasts"));

    if ((v9 & 1) != 0)
    {
      showPodcasts = self->_showPodcasts;
      self->_showPodcasts = 1;
      if (!showPodcasts)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v15, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.iBooks"));

      if (v12)
      {
        showAudioBooks = self->_showAudioBooks;
        self->_showAudioBooks = 1;
        if (!showAudioBooks)
          goto LABEL_9;
      }
    }
  }

}

- (void)handleAppUninstall:(id)a3
{
  id v4;
  unsigned int AppBooleanValue;
  void *v6;
  char v7;
  _BOOL4 showMusic;
  void *v9;
  void *v10;
  char v11;
  int showPodcasts;
  int v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v4 = a3;
  AppBooleanValue = __mediaLibraryAccessOverride___MLAccessOverride;
  v17 = v4;
  if (__mediaLibraryAccessOverride___MLAccessOverride == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MediaLibraryAccessOverride"), CFSTR("com.apple.iapd"), 0);
    v4 = v17;
    __mediaLibraryAccessOverride___MLAccessOverride = AppBooleanValue;
  }
  objc_msgSend(v4, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Music"));

  if ((v7 & 1) != 0)
  {
    showMusic = self->_showMusic;
    self->_showMusic = AppBooleanValue & 1;
    if ((AppBooleanValue & 1) != showMusic)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", kMediaLibraryMusicAppUninstalledNotification, 0);

LABEL_11:
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", kMediaLibraryNeedFilterChange, 0);

    }
  }
  else
  {
    objc_msgSend(v17, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.podcasts"));

    if ((v11 & 1) != 0)
    {
      showPodcasts = self->_showPodcasts;
      v13 = (AppBooleanValue >> 1) & 1;
      self->_showPodcasts = (AppBooleanValue & 2) != 0;
    }
    else
    {
      objc_msgSend(v17, "applicationIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.iBooks"));

      if (!v15)
        goto LABEL_12;
      showPodcasts = self->_showAudioBooks;
      v13 = (AppBooleanValue >> 2) & 1;
      self->_showAudioBooks = (AppBooleanValue & 4) != 0;
    }
    if (v13 != showPodcasts)
      goto LABEL_11;
  }
LABEL_12:

}

- (int)getFilteredMediaTypesMask:(int)a3
{
  int v3;

  if (a3)
    v3 = a3;
  else
    v3 = 3327;
  if (!self->_showMusic)
    v3 &= 0xFFFFF7FE;
  if (!self->_showPodcasts)
    v3 &= 0xFFFFFBFD;
  if (self->_showAudioBooks)
    return v3;
  else
    return v3 & 0xFFFFFFFB;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MediaLibraryHelper handleAppInstall:](self, "handleAppInstall:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MediaLibraryHelper handleAppUninstall:](self, "handleAppUninstall:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MediaLibraryHelper handleAppUninstall:](self, "handleAppUninstall:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)showMusic
{
  return self->_showMusic;
}

- (BOOL)showPodcasts
{
  return self->_showPodcasts;
}

- (BOOL)showAudioBooks
{
  return self->_showAudioBooks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceObserver, 0);
}

@end
