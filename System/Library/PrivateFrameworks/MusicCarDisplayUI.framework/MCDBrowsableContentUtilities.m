@implementation MCDBrowsableContentUtilities

+ (id)sharedInstance
{
  if (sharedInstance_isDispatched != -1)
    dispatch_once(&sharedInstance_isDispatched, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __46__MCDBrowsableContentUtilities_sharedInstance__block_invoke()
{
  MCDBrowsableContentUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(MCDBrowsableContentUtilities);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)setNowPlayingIdentifiers:(id)a3
{
  id v5;
  NSArray **p_nowPlayingIdentifiers;
  NSArray *nowPlayingIdentifiers;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a3;
  nowPlayingIdentifiers = self->_nowPlayingIdentifiers;
  p_nowPlayingIdentifiers = &self->_nowPlayingIdentifiers;
  if (!-[NSArray isEqualToArray:](nowPlayingIdentifiers, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)p_nowPlayingIdentifiers, a3);
    MCDGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "Posting MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification", v10, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification"), 0);

  }
}

- (NSArray)firstPartyAppBundleIDs
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.podcasts");
  v3[1] = CFSTR("com.apple.iBooks");
  v3[2] = CFSTR("com.apple.Music");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)nowPlayingIdentifiers
{
  return self->_nowPlayingIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingIdentifiers, 0);
}

@end
