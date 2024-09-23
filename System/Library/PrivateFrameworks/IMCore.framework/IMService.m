@implementation IMService

+ (id)iMessageService
{
  return (id)qword_1ECF124E8;
}

+ (id)smsService
{
  return (id)qword_1ECF124F0;
}

+ (NSNotificationCenter)notificationCenter
{
  return 0;
}

+ (void)forgetStatusImageAppearance
{
  +[IMServiceAgent forgetStatusImageAppearance](IMServiceAgent, "forgetStatusImageAppearance");
}

+ (NSString)imageNameForStatus:(IMPersonStatus)status
{
  return (NSString *)MEMORY[0x1E0DE7D20](IMServiceAgent, sel_imageNameForStatus_);
}

+ (NSURL)imageURLForStatus:(IMPersonStatus)status
{
  return (NSURL *)MEMORY[0x1E0DE7D20](IMServiceAgent, sel_imageURLForStatus_);
}

+ (NSArray)allServices
{
  return (NSArray *)+[IMServiceImpl allServices](IMServiceImpl, "allServices");
}

+ (id)allServicesNonBlocking
{
  return +[IMServiceImpl allServicesNonBlocking](IMServiceImpl, "allServicesNonBlocking");
}

+ (IMService)serviceWithName:(NSString *)name
{
  return (IMService *)+[IMServiceImpl serviceWithName:](IMServiceImpl, "serviceWithName:", name);
}

+ (IMPersonStatus)myStatus
{
  return 0;
}

+ (NSDate)myIdleTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v4, "myIdleTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

+ (BOOL)isEmailAddress:(id)a3 inDomains:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (!v7)
    goto LABEL_16;
  v8 = 0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("*")) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v7) = 1;
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hasSuffix:", v9))
      break;
LABEL_9:

    if (v7 == ++v8)
    {
      LOBYTE(v7) = 0;
      goto LABEL_16;
    }
  }
  v10 = objc_msgSend(v5, "length");
  v11 = v10 + ~objc_msgSend(v9, "length");
  if (v11 < objc_msgSend(v5, "length"))
  {
    if (v11 && v11 < objc_msgSend(v5, "length") && objc_msgSend(v5, "characterAtIndex:", v11) == 64)
      goto LABEL_11;
    goto LABEL_9;
  }
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1A21960EC((uint64_t)v5, (uint64_t)v9, v7);

  LOBYTE(v7) = 0;
LABEL_15:

LABEL_16:
  return (char)v7;
}

+ (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4 forHandleType:(unint64_t)a5
{
  return (id)IMCanonicalFormOfIDWithSensitivity();
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)initialSyncPerformed
{
  return 0;
}

- (NSString)localizedName
{
  return 0;
}

- (NSString)localizedShortName
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (IMServiceStatus)status
{
  return 0;
}

- (NSDictionary)infoForScreenName:(NSString *)screenName
{
  return 0;
}

- (NSArray)infoForAllScreenNames
{
  return 0;
}

- (NSArray)infoForPreferredScreenNames
{
  return 0;
}

- (id)canonicalFormOfID:(id)a3
{
  return 0;
}

- (NSArray)peopleWithScreenName:(NSString *)screenName
{
  return 0;
}

- (NSArray)screenNamesForPerson:(ABPerson *)person
{
  return 0;
}

- (id)myScreenNames
{
  return 0;
}

- (BOOL)supportsCapability:(id)a3
{
  return 0;
}

- (BOOL)supportsReplicationCapability:(id)a3
{
  return 0;
}

- (NSDictionary)serviceProperties
{
  return 0;
}

- (void)setServiceProperties:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProperties, 0);
}

- (id)infoForPerson:(id)a3
{
  return 0;
}

- (id)infoForAllPeople
{
  return 0;
}

- (id)infoForDisplayedPeople
{
  return 0;
}

+ (id)aimService
{
  return 0;
}

+ (id)subnetService
{
  return 0;
}

+ (id)jabberService
{
  return 0;
}

+ (id)callService
{
  return (id)qword_1ECF124E0;
}

+ (id)facetimeService
{
  return (id)qword_1ECF124E0;
}

+ (id)iMessageLiteService
{
  return (id)qword_1ECF123C0;
}

+ (id)satelliteSMSService
{
  return (id)qword_1ECF123B8;
}

+ (id)rcsService
{
  return (id)qword_1ECF123B0;
}

@end
