@implementation NSPersistentCloudKitContainerEvent

- (NSPersistentCloudKitContainerEvent)initWithCKEvent:(id)a3
{
  NSPersistentCloudKitContainerEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCloudKitContainerEvent;
  v4 = -[NSPersistentCloudKitContainerEvent init](&v6, sel_init);
  if (v4)
  {
    v4->_ckEventObjectID = (NSManagedObjectID *)(id)objc_msgSend(a3, "objectID");
    v4->_identifier = (NSUUID *)(id)objc_msgSend(a3, "eventIdentifier");
    v4->_storeIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore"), "identifier");
    v4->_type = objc_msgSend(a3, "cloudKitEventType");
    v4->_startDate = (NSDate *)(id)objc_msgSend(a3, "startedAt");
    v4->_endDate = (NSDate *)(id)objc_msgSend(a3, "endedAt");
    v4->_succeeded = objc_msgSend(a3, "succeeded");
    if (objc_msgSend((id)objc_msgSend(a3, "errorDomain"), "length"))
      v4->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "errorDomain"), objc_msgSend(a3, "errorCode"), 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_endDate = 0;
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEvent;
  -[NSPersistentCloudKitContainerEvent dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSUUID isEqual:](self->_identifier, "isEqual:", *((_QWORD *)a3 + 3));
      if (v5)
        LOBYTE(v5) = self->_type == *((_QWORD *)a3 + 5);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  NSError *error;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSPersistentCloudKitContainerEvent;
  v3 = (void *)objc_msgSend(-[NSPersistentCloudKitContainerEvent description](&v7, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR(" { type: %@ store: %@ started: %@ ended: %@"), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", self->_type), self->_storeIdentifier, self->_startDate, self->_endDate);
  if (self->_succeeded)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" succeeded: %@"), v4);
  error = self->_error;
  if (error)
    objc_msgSend(v3, "appendFormat:", CFSTR(" error: %@:%ld"), -[NSError domain](error, "domain"), -[NSError code](self->_error, "code"));
  objc_msgSend(v3, "appendString:", CFSTR(" }"));
  return v3;
}

+ (id)eventTypeString:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 3)
    return off_1E1EDE6A0[a3];
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown event type, cannot covert to string: %ld");
  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
  v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Unknown event type, cannot covert to string: %ld", buf, 0xCu);
  }
  return 0;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSPersistentCloudKitContainerEventType)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

@end
