@implementation UniversalSearchSession

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a3;
  objc_msgSend(v10, "dictionaryWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("UniversalSearchBagUserInfoDictionaryKey"));
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("UniversalSearchBagLoadErrorUserInfoDictionaryKey"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("UniversalSearchDidLoadBagNotification"), self, v13);

  v15.receiver = self;
  v15.super_class = (Class)UniversalSearchSession;
  -[WBSParsecDSession session:bag:didLoadWithError:](&v15, sel_session_bag_didLoadWithError_, v11, v8, v9);

}

void __39__UniversalSearchSession_sharedSession__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D8AA78], "sharedPARSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithParsecdSession:skipAutoFillDataUpdates:", v4, 0);
  v3 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v2;

}

+ (id)sharedSession
{
  id v3;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D8AC58], "areSiriSearchSuggestionsEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__UniversalSearchSession_sharedSession__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedSession_onceToken != -1)
      dispatch_once(&sharedSession_onceToken, block);
    v3 = (id)sharedSession_sharedSession;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)shouldUseSearchFoundation
{
  return 1;
}

@end
