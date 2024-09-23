@implementation DASharedAccountProperties

+ (id)parentAccountTypes
{
  if (parentAccountTypes_onceToken != -1)
    dispatch_once(&parentAccountTypes_onceToken, &__block_literal_global_4);
  return (id)parentAccountTypes__sParentAccountTypes;
}

void __47__DASharedAccountProperties_parentAccountTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C8F030], *MEMORY[0x1E0C8F0D0], *MEMORY[0x1E0C8F0A8], *MEMORY[0x1E0C8F160], *MEMORY[0x1E0C8F028], *MEMORY[0x1E0C8F088], *MEMORY[0x1E0C8F058], *MEMORY[0x1E0C8F060], *MEMORY[0x1E0C8F108], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)parentAccountTypes__sParentAccountTypes;
  parentAccountTypes__sParentAccountTypes = v0;

}

+ (id)leafAccountTypes
{
  if (leafAccountTypes_onceToken != -1)
    dispatch_once(&leafAccountTypes_onceToken, &__block_literal_global_1);
  return (id)leafAccountTypes__sLeafAccountTypes;
}

void __45__DASharedAccountProperties_leafAccountTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C8F140], *MEMORY[0x1E0C8F058], *MEMORY[0x1E0C8F060], *MEMORY[0x1E0C8F100], *MEMORY[0x1E0C8F0E0], *MEMORY[0x1E0C8F0B0], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)leafAccountTypes__sLeafAccountTypes;
  leafAccountTypes__sLeafAccountTypes = v0;

}

+ (id)leafAccountTypesToCheckForEquality
{
  if (leafAccountTypesToCheckForEquality_onceToken != -1)
    dispatch_once(&leafAccountTypesToCheckForEquality_onceToken, &__block_literal_global_2);
  return (id)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality;
}

uint64_t __63__DASharedAccountProperties_leafAccountTypesToCheckForEquality__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[DASharedAccountProperties leafAccountTypes](DASharedAccountProperties, "leafAccountTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality;
  leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality = v1;

  return objc_msgSend((id)leafAccountTypesToCheckForEquality__sLeafAccountTypesToCheckForEquality, "removeObject:", *MEMORY[0x1E0C8F0E0]);
}

+ (id)DAAccountSavePreflighted
{
  return CFSTR("DAAccountSavePreflighted");
}

+ (id)DAAccountDoNotSaveReason
{
  return CFSTR("DAAccountDoNotSaveReason");
}

+ (id)DAAccountIdentifiersToIgnoreForUniquenessCheck
{
  return CFSTR("kDAAccountIdentifiersToIgnoreForUniquenessCheck");
}

+ (id)DAAccountPrincipalPath
{
  return CFSTR("DAAccountPrincipalPath");
}

+ (id)CalDAVSubscribedCalendarsKey
{
  return CFSTR("SubscribedCalendars");
}

+ (id)SubCalFilterAlarmsKey
{
  return CFSTR("com.apple.ical.urlsubscribe.filteralarms");
}

+ (id)SubCalSubscriptionURLKey
{
  return CFSTR("subscription_url");
}

+ (id)SubCalTitleKey
{
  return CFSTR("title");
}

+ (id)SubCalInsecureConnectionApproved
{
  return CFSTR("SubCalInsecureConnectionApproved");
}

+ (id)DACardDAVAccountDSID
{
  return CFSTR("DACardDAVAccountDSID");
}

@end
