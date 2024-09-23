@implementation IMDCoreSpotlightBaseIndexer

+ (BOOL)cancelIndexingForItem:(id)a3
{
  return 0;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "IMDCoreSpotlightIndexer - Invalid to call IMDCoreSpotlightBaseIndexer directly, use subclass", v15, 2u);
    }

  }
}

+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)indexTypeCustomKey
{
  if (qword_1ED0D3960 != -1)
    dispatch_once(&qword_1ED0D3960, &unk_1E5AAF148);
  return (id)qword_1ED0D3958;
}

+ (id)isGroupChatCustomKey
{
  if (qword_1ED0D3840 != -1)
    dispatch_once(&qword_1ED0D3840, &unk_1E5AAE6D8);
  return (id)qword_1ED0D3838;
}

+ (id)isFromMeCustomKey
{
  if (qword_1ED0D3980 != -1)
    dispatch_once(&qword_1ED0D3980, &unk_1E5AAE718);
  return (id)qword_1ED0D3978;
}

+ (id)isBusinessChatCustomKey
{
  if (qword_1ED0D3970 != -1)
    dispatch_once(&qword_1ED0D3970, &unk_1E5AAE978);
  return (id)qword_1ED0D3968;
}

+ (id)mentionedAddressesCustomKey
{
  if (qword_1ED0D3850 != -1)
    dispatch_once(&qword_1ED0D3850, &unk_1E5AAEB80);
  return (id)qword_1ED0D3848;
}

+ (id)chatUniqueIdentifierKey
{
  if (qword_1ED0D3778 != -1)
    dispatch_once(&qword_1ED0D3778, &unk_1E5AAEA80);
  return (id)qword_1ED0D3770;
}

+ (id)isChatMutedCustomKey
{
  if (qword_1EEC40390 != -1)
    dispatch_once(&qword_1EEC40390, &unk_1E5AAEC48);
  return (id)qword_1EEC40388;
}

+ (NSString)timingProfileKey
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (void)startTimingWithProfiler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "timingProfileKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimingForKey:", v4);

}

+ (void)stopTimingWithProfiler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "timingProfileKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopTimingForKey:", v4);

}

@end
