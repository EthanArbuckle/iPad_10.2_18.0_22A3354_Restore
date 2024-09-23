@implementation IMINInteractionUtilities

+ (id)sharedInstance
{
  if (qword_1ECFC7608 != -1)
    dispatch_once(&qword_1ECFC7608, &unk_1E3FB32A8);
  return (id)qword_1ECFC7560;
}

- (IMINInteractionUtilities)init
{
  IMINInteractionUtilities *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMINInteractionUtilities;
  v2 = -[IMINInteractionUtilities init](&v4, sel_init);
  if (v2)
    v2->_searchableIndex = (CSSearchableIndex *)objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("CSSearchableIndex"), CFSTR("CoreSpotlight")));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMINInteractionUtilities;
  -[IMINInteractionUtilities dealloc](&v3, sel_dealloc);
}

- (void)deleteInteractionsWithChatGUIDs:(id)a3
{
  NSObject *v5;
  CSSearchableIndex *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = a3;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Calling API to delete INInteractions with chat guids %@", buf, 0xCu);
    }
  }
  v6 = -[IMINInteractionUtilities searchableIndex](self, "searchableIndex");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E25B034;
  v7[3] = &unk_1E3FB4F20;
  v7[4] = a3;
  -[CSSearchableIndex deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:](v6, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:", a3, CFSTR("com.apple.MobileSMS"), 0, v7);
}

- (void)deleteInteractionsWithMessageGUIDs:(id)a3
{
  NSObject *v5;
  CSSearchableIndex *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = a3;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Calling API to delete INInteractions with message guids %@", buf, 0xCu);
    }
  }
  v6 = -[IMINInteractionUtilities searchableIndex](self, "searchableIndex");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E25B2B0;
  v7[3] = &unk_1E3FB4F20;
  v7[4] = a3;
  -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:](v6, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:", a3, CFSTR("com.apple.MobileSMS"), 0, v7);
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
