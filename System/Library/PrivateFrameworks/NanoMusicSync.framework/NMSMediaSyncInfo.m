@implementation NMSMediaSyncInfo

- (NMSMediaSyncInfo)initWithTarget:(unint64_t)a3
{
  return (NMSMediaSyncInfo *)-[NMSMediaSyncInfo _initWithTarget:readAndObserveChanges:](self, "_initWithTarget:readAndObserveChanges:", a3, 1);
}

- (id)_initWithTarget:(unint64_t)a3 readAndObserveChanges:(BOOL)a4
{
  _BOOL4 v4;
  NMSMediaSyncInfo *v6;
  NMSMediaSyncInfo *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaSyncInfo;
  v6 = -[NMSMediaSyncInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_target = a3;
    v6->_notifyToken = -1;
    if (v4)
    {
      -[NMSMediaSyncInfo _registerForInfoChanged](v6, "_registerForInfoChanged");
      -[NMSMediaSyncInfo _readInfo](v7, "_readInfo");
    }
  }
  return v7;
}

- (void)_registerForInfoChanged
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_216E27000, log, OS_LOG_TYPE_ERROR, "Failed to register for notification: %@ with status: %d", (uint8_t *)&v3, 0x12u);
}

- (id)_notificationName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NMSMediaSyncInfo _targetIdentifier](self, "_targetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.NMSMediaSyncInfo.%@.changed"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_readInfo
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *info;
  id v6;

  switch(-[NMSMediaSyncInfo target](self, "target"))
  {
    case 0uLL:
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "musicSyncInfo");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "podcastsSyncInfo");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audiobooksSyncInfo");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
    case 4uLL:
      v3 = (void *)MEMORY[0x24BDBCE70];
      -[NMSMediaSyncInfo _syncInfoFilePath](self, "_syncInfoFilePath");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryWithContentsOfFile:");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      info = self->_info;
      self->_info = v4;

      break;
    default:
      return;
  }
}

- (id)_preferencesInfoKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NMSMediaSyncInfo _targetIdentifier](self, "_targetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("NMSMediaSyncInfo-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_preferencesApplicationID
{
  return CFSTR("com.apple.NanoMusicSync");
}

- (id)containers
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("containers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)statusForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "integerValue");
  else
    v9 = 1;

  return v9;
}

- (float)progressForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cachedProgress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_notifyToken))
    notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSyncInfo;
  -[NMSMediaSyncInfo dealloc](&v3, sel_dealloc);
}

- (id)itemsForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemsIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)hasItem:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (unint64_t)statusForItem:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "integerValue");
  else
    v9 = 1;

  return v9;
}

- (float)progressForItem:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("progressBytes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)(unint64_t)objc_msgSend(v7, "unsignedLongLongValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalBytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v8 / (double)(unint64_t)objc_msgSend(v9, "unsignedLongLongValue");

  return *(float *)&v8;
}

- (unint64_t)downloadPauseReasonForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (unint64_t)downloadPauseReasonForItem:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (BOOL)hasItemsWaitingWithoutPauseReasonForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasItemsWaitingWithoutPauseReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");

  return (char)v4;
}

- (unint64_t)playabilityForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playability"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemsOverStorageLimitCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue") != 0;
  }

  return v9;
}

- (BOOL)isItemOverStorageLimit:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("overStorageLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");

  return (char)v4;
}

- (BOOL)hasDownloadableItemsWithinStorageLimitForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasDownloadableItemsWithinStorageLimitKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");

  return (char)v4;
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (float)progress
{
  void *v2;
  float v3;
  float v4;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("cachedProgress"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (unint64_t)downloadPauseReason
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)hasItemsWaitingWithoutPauseReason
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("hasItemsWaitingWithoutPauseReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasItemsOverStorageLimit
{
  void *v3;
  NSDictionary *info;
  void *v5;
  char v6;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("itemsOverStorageLimitCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue") != 0;
  }

  return v6;
}

- (id)userInfoForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)userInfoForItem:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)itemCount
{
  void *v3;
  NSDictionary *info;
  void *v5;
  uint64_t v6;
  void *v7;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("items"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  info = self->_info;
  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
LABEL_5:
    v7 = (void *)v6;

    return (unint64_t)v7;
  }
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("itemCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("itemCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    goto LABEL_5;
  }
  return (unint64_t)v7;
}

- (BOOL)_isValid
{
  void *v2;
  BOOL v3;

  -[NMSMediaSyncInfo info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasItemsForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "unsignedIntegerValue") != 0;
  else
    v9 = 1;

  return v9;
}

void __43__NMSMediaSyncInfo__registerForInfoChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_readInfo");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaSyncInfoDidUpdateNotification"), v3);

    WeakRetained = v3;
  }

}

- (id)_targetIdentifier
{
  unint64_t target;

  target = self->_target;
  if (target > 4)
    return 0;
  else
    return off_24D647668[target];
}

- (id)_syncInfoFilePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_mediaSyncInfoDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo _targetIdentifier](self, "_targetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_mediaSyncInfoDirectory
{
  if (_mediaSyncInfoDirectory_onceToken != -1)
    dispatch_once(&_mediaSyncInfoDirectory_onceToken, &__block_literal_global_2);
  return (id)_mediaSyncInfoDirectory_path;
}

void __43__NMSMediaSyncInfo__mediaSyncInfoDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[NMSPathUtil mediaSyncInfoDirectory](NMSPathUtil, "mediaSyncInfoDirectory");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_mediaSyncInfoDirectory_path;
  _mediaSyncInfoDirectory_path = v0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _mediaSyncInfoDirectory_path, 1, 0, 0);

}

- (unint64_t)numberOfItemsOverStorageLimitForContainer:(id)a3
{
  NSDictionary *info;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  info = self->_info;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](info, "objectForKeyedSubscript:", CFSTR("containers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemsOverStorageLimitCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (unint64_t)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

- (id)keepLocalEnabledPlaylists
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo _identifiersWithKeepLocalStates:modelKind:](self, "_identifiersWithKeepLocalStates:modelKind:", &unk_24D655848, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)keepLocalEnabledAlbums
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo _identifiersWithKeepLocalStates:modelKind:](self, "_identifiersWithKeepLocalStates:modelKind:", &unk_24D655860, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allPlaylists
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo _identifiersWithKeepLocalStates:modelKind:](self, "_identifiersWithKeepLocalStates:modelKind:", &unk_24D655878, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allAlbums
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo _identifiersWithKeepLocalStates:modelKind:](self, "_identifiersWithKeepLocalStates:modelKind:", &unk_24D655890, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_identifiersWithKeepLocalStates:(id)a3 modelKind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  NMSMediaSyncInfo *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncInfo containers](self, "containers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke;
  v18 = &unk_24D647C08;
  v19 = self;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v15);

  v13 = (void *)objc_msgSend(v10, "copy", v15, v16, v17, v18, v19);
  return v13;
}

void __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;

  objc_msgSend(*(id *)(a1 + 32), "userInfoForContainer:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keepLocal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_syncInfoModelKindForMPModelKind:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("modelKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE6B170];
    objc_msgSend(v3, "objectForKey:", CFSTR("midData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pidFromMIDData:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    }
    else
    {
      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke_cold_1((uint64_t)v3, v11);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_syncInfoModelKindForMPModelKind:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identityKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = &unk_24D655B90;
  }
  else
  {
    objc_msgSend(v3, "identityKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDBCE88];
      v13 = *MEMORY[0x24BDBCAB0];
      v17 = CFSTR("modelKind");
      objc_msgSend(v3, "identityKind");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, CFSTR("Unsupported modelKind."), v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v16);
    }
    v7 = &unk_24D655BA8;
  }

  return v7;
}

void __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "UserInfo is missing MID data: %@", (uint8_t *)&v2, 0xCu);
}

@end
