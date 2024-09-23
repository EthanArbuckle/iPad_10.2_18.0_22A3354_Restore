@implementation _CLKTimeFormatSentinel

+ (void)listenForLocaleChangesIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59___CLKTimeFormatSentinel_listenForLocaleChangesIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (listenForLocaleChangesIfNecessary_onceToken != -1)
    dispatch_once(&listenForLocaleChangesIfNecessary_onceToken, block);
}

+ (void)_handleLocaleChange
{
  id v2;

  +[_CLKTimeFormatData resetTimeFormatData](_CLKTimeFormatData, "resetTimeFormatData");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("CLKFormatTimeIntervalCacheInvalidateNotification"), 0);

}

@end
