@implementation NSPersistentCloudKitContainerActivity

- (id)_initWithIdentifier:(id)a3 forStore:(id)a4 activityType:(unint64_t)a5
{
  NSPersistentCloudKitContainerActivity *v8;
  NSDate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSPersistentCloudKitContainerActivity;
  v8 = -[NSPersistentCloudKitContainerActivity init](&v11, sel_init);
  if (v8)
  {
    v8->_identifier = (NSUUID *)a3;
    v8->_storeIdentifier = (NSString *)a4;
    v9 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    v8->_activityType = a5;
    v8->_startDate = v9;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_error = 0;
  self->_parentActivityIdentifier = 0;

  self->_endDate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerActivity;
  -[NSPersistentCloudKitContainerActivity dealloc](&v3, sel_dealloc);
}

- (id)createDictionaryRepresentation
{
  id v3;
  NSUUID *parentActivityIdentifier;
  unint64_t activityType;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSDate *endDate;
  NSError *error;
  _BOOL8 v17;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  parentActivityIdentifier = self->_parentActivityIdentifier;
  if (parentActivityIdentifier)
    objc_msgSend(v3, "setObject:forKey:", parentActivityIdentifier, CFSTR("parentActivityIdentifier"));
  activityType = self->_activityType;
  objc_opt_self();
  if (activityType >= 5)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to create a string for activity type '%lu'");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, activityType);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = activityType;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to create a string for activity type '%lu'", buf, 0xCu);
    }
    v6 = &stru_1E1EE23F0;
  }
  else
  {
    v6 = off_1E1EE1820[activityType];
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("activityType"));
  objc_msgSend(v3, "setObject:forKey:", self->_startDate, CFSTR("startDate"));
  endDate = self->_endDate;
  if (endDate)
    objc_msgSend(v3, "setObject:forKey:", endDate, CFSTR("endDate"));
  error = self->_error;
  if (error)
    objc_msgSend(v3, "setObject:forKey:", error, CFSTR("error"));
  if (self->_endDate)
    v17 = self->_error == 0;
  else
    v17 = 0;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17), CFSTR("succeeded"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_endDate != 0), CFSTR("finished"));
  return v3;
}

- (void)finishWithError:(id)a3
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
  NSPersistentCloudKitContainerActivity *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_endDate)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to finish an activity multiple times: %@");
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)self);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to finish an activity multiple times: %@", buf, 0xCu);
    }
  }
  else
  {
    self->_endDate = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    self->_error = (NSError *)a3;
  }
}

@end
