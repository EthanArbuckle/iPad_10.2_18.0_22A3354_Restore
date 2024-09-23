@implementation IMCoreSpotlightUtilities

+ (BOOL)needsIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)skipIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)needsDonation
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (BOOL)needsInitialDonation
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (void)setNeedsInitialDonation:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

+ (BOOL)needsDeferredIndexing
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

+ (void)setNeedsDeferredIndexing
{
  IMSetDomainBoolForKey();
}

+ (unint64_t)lastDonatedRowID
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)descriptionForReindexReason:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("No Recorded Reason");
  else
    return off_1E3FBA0B8[a3 - 1];
}

+ (BOOL)verboseLoggingEnabled
{
  if (qword_1EE503A58 != -1)
    dispatch_once(&qword_1EE503A58, &unk_1E3FB3D68);
  return byte_1EE5045D0;
}

+ (unint64_t)reindexReason
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)_reindexSuspendedUntilKey
{
  return CFSTR("IMCSReindexSuspendedUntilDate");
}

+ (NSDate)reindexingSuspendedUntilDate
{
  NSDate *v2;

  objc_msgSend(a1, "_reindexSuspendedUntilKey");
  v2 = (NSDate *)IMGetCachedDomainValueForKey();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

+ (void)setReindexingSuspendedUntilDate:(id)a3
{
  objc_msgSend(a1, "_reindexSuspendedUntilKey");
  IMSetDomainValueForKey();
}

+ (id)_reindexSuspensionReasonKey
{
  return CFSTR("IMCSReindexSuspensionReason");
}

+ (NSString)reindexingSuspensionReason
{
  NSString *v2;

  objc_msgSend(a1, "_reindexSuspensionReasonKey");
  v2 = (NSString *)IMGetCachedDomainValueForKey();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

+ (void)setReindexingSuspensionReason:(id)a3
{
  objc_msgSend(a1, "_reindexSuspensionReasonKey");
  IMSetDomainValueForKey();
}

+ (BOOL)reindexingSuspended
{
  double v2;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", objc_msgSend(a1, "reindexingSuspendedUntilDate"));
  return v2 < 0.0;
}

+ (BOOL)notifyForSpotlightEvents
{
  int v3;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v3)
  {
    objc_msgSend(a1, "_notifyForSpotlightEventsKey");
    LOBYTE(v3) = IMGetDomainBoolForKeyWithDefaultValue();
  }
  return v3;
}

+ (void)setNotifyForSpotlightEvents:(BOOL)a3
{
  objc_msgSend(a1, "_notifyForSpotlightEventsKey");
  IMSetDomainBoolForKey();
}

+ (id)_notifyForSpotlightEventsKey
{
  return CFSTR("IMCSNotifyForEvents");
}

+ (BOOL)notifyForVerboseSpotlightEvents
{
  int v3;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v3)
  {
    objc_msgSend(a1, "_notifyForVerboseSpotlightEventsKey");
    LOBYTE(v3) = IMGetDomainBoolForKeyWithDefaultValue();
  }
  return v3;
}

+ (void)setNotifyForVerboseSpotlightEvents:(BOOL)a3
{
  objc_msgSend(a1, "_notifyForVerboseSpotlightEventsKey");
  IMSetDomainBoolForKey();
}

+ (id)_notifyForVerboseSpotlightEventsKey
{
  return CFSTR("IMCSNotifyForVerboseEvents");
}

+ (BOOL)spotlightEventsAreTimeSensitive
{
  int v3;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall");
  if (v3)
  {
    objc_msgSend(a1, "_spotlightEventsAreTimeSensitiveKey");
    LOBYTE(v3) = IMGetDomainBoolForKeyWithDefaultValue();
  }
  return v3;
}

+ (void)setSpotlightEventsAreTimeSensitive:(BOOL)a3
{
  objc_msgSend(a1, "_spotlightEventsAreTimeSensitiveKey");
  IMSetDomainBoolForKey();
}

+ (id)_spotlightEventsAreTimeSensitiveKey
{
  return CFSTR("IMCSEventsAreTimeSensitive");
}

+ (int64_t)chatBatchSize
{
  objc_msgSend(a1, "_chatBatchSizeKey");
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (void)setChatBatchSize:(int64_t)a3
{
  objc_msgSend(a1, "_chatBatchSizeKey");
  IMSetDomainIntForKey();
}

+ (id)_chatBatchSizeKey
{
  return CFSTR("ChatBatchSize");
}

+ (int64_t)messageSubBatchSize
{
  objc_msgSend(a1, "_messageSubBatchSizeKey");
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (void)setMessageSubBatchSize:(int64_t)a3
{
  objc_msgSend(a1, "_messageSubBatchSizeKey");
  IMSetDomainIntForKey();
}

+ (id)_messageSubBatchSizeKey
{
  return CFSTR("MessageSubBatchSize");
}

+ (int64_t)messageRecordBatchSize
{
  objc_msgSend(a1, "_messageRecordBatchSizeKey");
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (void)setMessageRecordBatchSize:(int64_t)a3
{
  objc_msgSend(a1, "_messageRecordBatchSizeKey");
  IMSetDomainIntForKey();
}

+ (id)_messageRecordBatchSizeKey
{
  return CFSTR("MessageRecordBatchSize");
}

+ (int64_t)reindexFirstBatchSize
{
  objc_msgSend(a1, "_reindexFirstBatchSizeKey");
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (void)setReindexFirstBatchSize:(int64_t)a3
{
  objc_msgSend(a1, "_reindexFirstBatchSizeKey");
  IMSetDomainIntForKey();
}

+ (id)_reindexFirstBatchSizeKey
{
  return CFSTR("ReindexFirstBatchSize");
}

+ (int64_t)reindexSupplementalBatchSize
{
  objc_msgSend(a1, "_reindexSupplementalBatchSizeKey");
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (void)setReindexSupplementalBatchSize:(int64_t)a3
{
  objc_msgSend(a1, "_reindexSupplementalBatchSizeKey");
  IMSetDomainIntForKey();
}

+ (id)_reindexSupplementalBatchSizeKey
{
  return CFSTR("ReindexSupplementalBatchSize");
}

@end
