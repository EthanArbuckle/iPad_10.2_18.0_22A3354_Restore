@implementation IMDSpotlightIndexDelegate

+ (id)sharedInstance
{
  if (qword_1ED935C38 != -1)
    dispatch_once(&qword_1ED935C38, &unk_1E922F6B8);
  if (qword_1ED935D48 != -1)
    dispatch_once(&qword_1ED935D48, &unk_1E922F6D8);
  if (qword_1ED935D58 != -1)
    dispatch_once(&qword_1ED935D58, &unk_1E922F6F8);
  return (id)qword_1ED935E88;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMEventCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Got the callback for reindex", v8, 2u);
    }

  }
  IMDCoreSpotlightSetNeedsMessageReindex();
  if (v6)
    v6[2](v6);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Got the callback for reindex", v11, 2u);
    }

  }
  IMDCoreSpotlightSetNeedsMessageReindex();
  if (v9)
    v9[2](v9);

}

@end
