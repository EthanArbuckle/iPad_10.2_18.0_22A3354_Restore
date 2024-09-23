@implementation CDDCloudKitScheduledActivity

+ (NSString)entityName
{
  return (NSString *)CFSTR("CDDCloudKitScheduledActivity");
}

- (unint64_t)activityType
{
  return objc_msgSend((id)-[CDDCloudKitScheduledActivity activityTypeNum](self, "activityTypeNum"), "unsignedIntegerValue");
}

- (void)setActivityType:(unint64_t)a3
{
  -[CDDCloudKitScheduledActivity setActivityTypeNum:](self, "setActivityTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
}

- (void)populateFromCriteria:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C808F8]));
  if (v4 && (v5 = v4, xpc_BOOL_get_value(v4)))
  {
    if (!xpc_BOOL_get_value(v5))
      return;
    v6 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v6 = MEMORY[0x1E0C9AAA0];
  }
  -[CDDCloudKitScheduledActivity setIsUserRequestedBackupTask:](self, "setIsUserRequestedBackupTask:", v6);
}

- (id)xpcActivityCriteria
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  LODWORD(self) = objc_msgSend((id)-[CDDCloudKitScheduledActivity isUserRequestedBackupTask](self, "isUserRequestedBackupTask"), "BOOLValue");
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C808F8]);
  if ((_DWORD)self)
    v5 = MEMORY[0x1E0C81240];
  else
    v5 = MEMORY[0x1E0C81238];
  objc_msgSend(v3, "setObject:forKey:", v5, v4);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

@end
