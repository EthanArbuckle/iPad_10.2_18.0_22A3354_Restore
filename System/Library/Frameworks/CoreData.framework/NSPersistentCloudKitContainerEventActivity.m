@implementation NSPersistentCloudKitContainerEventActivity

- (_QWORD)initWithRequestIdentifier:(void *)a1 storeIdentifier:(uint64_t)a2 eventType:(uint64_t)a3
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  v3 = objc_msgSendSuper2(&v5, sel__initWithIdentifier_forStore_activityType_, a2, a3, 0);
  if (v3)
    v3[8] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  -[NSPersistentCloudKitContainerActivity dealloc](&v3, sel_dealloc);
}

- (id)beginActivityForPhase:(unint64_t)a3
{
  NSPersistentCloudKitContainerSetupPhaseActivity *v5;
  NSPersistentCloudKitContainerSetupPhaseActivity *v6;
  NSUUID *identifier;
  NSUUID *parentActivityIdentifier;

  v5 = [NSPersistentCloudKitContainerSetupPhaseActivity alloc];
  if (self)
  {
    v6 = -[NSPersistentCloudKitContainerSetupPhaseActivity initWithPhase:storeIdentifier:](v5, "initWithPhase:storeIdentifier:", a3, self->super._storeIdentifier);
    identifier = self->super._identifier;
    if (!v6)
      goto LABEL_5;
  }
  else
  {
    v6 = -[NSPersistentCloudKitContainerSetupPhaseActivity initWithPhase:storeIdentifier:](v5, "initWithPhase:storeIdentifier:", a3, 0);
    identifier = 0;
    if (!v6)
      goto LABEL_5;
  }
  parentActivityIdentifier = v6->super._parentActivityIdentifier;
  if (parentActivityIdentifier != identifier)
  {

    v6->super._parentActivityIdentifier = identifier;
  }
LABEL_5:
  -[NSMutableDictionary setObject:forKey:](self->_activitiesByPhaseNum, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  return v6;
}

- (id)endActivityForPhase:(unint64_t)a3 withError:(id)a4
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v18;
  objc_class *v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_activitiesByPhaseNum, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"));
  if (!v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar.");
    v8 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, a3);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    _NSCoreDataLog(17, v7, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v18 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, a3);
      v19 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = NSStringFromClass(v19);
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar.", buf, 0x16u);
    }
  }
  objc_msgSend(v6, "finishWithError:", a4);
  return v6;
}

- (id)createDictionaryRepresentation
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  v3 = -[NSPersistentCloudKitContainerActivity createDictionaryRepresentation](&v5, sel_createDictionaryRepresentation);
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eventType), CFSTR("eventType"));
  return v3;
}

@end
