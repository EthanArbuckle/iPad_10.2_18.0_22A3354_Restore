@implementation NSPersistentCloudKitContainerSetupPhaseActivity

+ (const)stringForPhase:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2 < 7)
    return off_1E1EE1848[a2];
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to create a string for this phase: %lu");
  _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a2);
  v11 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a2;
    _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to create a string for this phase: %lu", buf, 0xCu);
  }
  return &stru_1E1EE23F0;
}

- (NSPersistentCloudKitContainerSetupPhaseActivity)initWithPhase:(unint64_t)a3 storeIdentifier:(id)a4
{
  NSPersistentCloudKitContainerSetupPhaseActivity *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCloudKitContainerSetupPhaseActivity;
  result = -[NSPersistentCloudKitContainerActivity _initWithIdentifier:forStore:activityType:](&v6, sel__initWithIdentifier_forStore_activityType_, objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), a4, 4);
  if (result)
    result->_phase = a3;
  return result;
}

- (id)createDictionaryRepresentation
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSPersistentCloudKitContainerSetupPhaseActivity;
  v3 = -[NSPersistentCloudKitContainerActivity createDictionaryRepresentation](&v5, sel_createDictionaryRepresentation);
  objc_msgSend(v3, "setObject:forKey:", +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, self->_phase), CFSTR("phase"));
  return v3;
}

@end
