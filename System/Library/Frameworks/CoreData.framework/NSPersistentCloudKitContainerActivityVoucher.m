@implementation NSPersistentCloudKitContainerActivityVoucher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentCloudKitContainerActivityVoucher)initWithLabel:(id)a3 forEventsOfType:(int64_t)a4 withConfiguration:(id)a5 affectingObjectsMatching:(id)a6
{
  NSPersistentCloudKitContainerActivityVoucher *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  objc_class *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  objc_class *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  uint64_t v38;
  objc_super v39;
  const __CFString *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)NSPersistentCloudKitContainerActivityVoucher;
  v10 = -[NSPersistentCloudKitContainerActivityVoucher init](&v39, sel_init);
  if (v10)
  {
    if (a4)
    {
      if (a5)
      {
        if (objc_msgSend(a5, "isLongLived"))
        {
          v26 = (void *)MEMORY[0x1E0C99DA0];
          v27 = *MEMORY[0x1E0C99778];
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          v31 = (objc_class *)objc_opt_class();
          v32 = objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ does not allow clients to specify if operations are longlived or not. Clients should leave longLived unmodified and allow %@ to choose to mark operations long lived or not."), v30, NSStringFromClass(v31));
          v40 = CFSTR("offendingConfiguration");
          v41[0] = a5;
          v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
          v17 = v26;
          v18 = v27;
          v16 = v32;
          goto LABEL_16;
        }
        if ((objc_msgSend(a5, "allowsCellularAccess") & 1) != 0)
        {
          if ((objc_msgSend(a5, "allowsExpensiveNetworkAccess") & 1) != 0)
          {
            v10->_eventType = a4;
            v10->_bundleIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
            v10->_processName = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
            v10->_label = (NSString *)objc_msgSend(a3, "copy");
            v10->_fetchRequest = (NSFetchRequest *)objc_msgSend(a6, "copy");
            v10->_operationConfiguration = (CKOperationConfiguration *)objc_msgSend(a5, "copy");
            return v10;
          }
          v19 = (void *)MEMORY[0x1E0C99DA0];
          v20 = *MEMORY[0x1E0C99778];
          v36 = (void *)MEMORY[0x1E0CB3940];
          v37 = (objc_class *)objc_opt_class();
          v25 = objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ does not support network customizations yet (allowsExpensiveNetworkAccess = NO). If you require this functionality please file a radar to CoreData | New Bugs."), NSStringFromClass(v37), v38);
        }
        else
        {
          v19 = (void *)MEMORY[0x1E0C99DA0];
          v20 = *MEMORY[0x1E0C99778];
          v34 = (void *)MEMORY[0x1E0CB3940];
          v35 = (objc_class *)objc_opt_class();
          v25 = objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ does not support network customizations yet (allowsCellularAccess = NO). If you require this functionality please file a radar to CoreData | New Bugs."), NSStringFromClass(v35), v38);
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99778];
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        getCloudKitCKOperationConfigurationClass[0]();
        v24 = (objc_class *)objc_opt_class();
        v25 = objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ requires that clients pass in an instance of %@ that describes how they would like to prioritize work on behalf of the voucher."), v23, NSStringFromClass(v24));
      }
      v16 = v25;
      v17 = v19;
      v18 = v20;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_opt_class();
      v16 = objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ does not support the escalation of events of type %@. %@ events will be escalated in association with a voucher that is applied to %@ / %@ events as needed."), NSStringFromClass(v15), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", 0), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", 0), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", 2), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:",
                1));
      v17 = v12;
      v18 = v13;
    }
    v33 = 0;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, v33));
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_bundleIdentifier = 0;
  self->_fetchRequest = 0;

  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerActivityVoucher;
  -[NSPersistentCloudKitContainerActivityVoucher dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPersistentCloudKitContainerActivityVoucher *v4;

  v4 = -[NSPersistentCloudKitContainerActivityVoucher initWithLabel:forEventsOfType:withConfiguration:affectingObjectsMatching:]([NSPersistentCloudKitContainerActivityVoucher alloc], "initWithLabel:forEventsOfType:withConfiguration:affectingObjectsMatching:", self->_label, self->_eventType, self->_operationConfiguration, self->_fetchRequest);

  v4->_bundleIdentifier = self->_bundleIdentifier;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>\n\t%@\n\t%@:%@\n\t%@\n\t%@"), NSStringFromClass(v4), self, self->_label, +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", self->_eventType), self->_processName, self->_bundleIdentifier, +[NSPersistentCloudKitContainerActivityVoucher describeConfiguration:](NSPersistentCloudKitContainerActivityVoucher, "describeConfiguration:", self->_operationConfiguration), self->_fetchRequest);
}

- (NSPersistentCloudKitContainerActivityVoucher)initWithCoder:(id)a3
{
  NSPersistentCloudKitContainerActivityVoucher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCloudKitContainerActivityVoucher;
  v4 = -[NSPersistentCloudKitContainerActivityVoucher init](&v6, sel_init);
  if (v4)
  {
    v4->_label = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v4->_bundleIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v4->_eventType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventTypeNum")), "unsignedIntegerValue");
    v4->_fetchRequest = (NSFetchRequest *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchRequest"));
    getCloudKitCKOperationConfigurationClass[0]();
    v4->_operationConfiguration = (CKOperationConfiguration *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationConfiguration"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eventType), CFSTR("eventTypeNum"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_fetchRequest, CFSTR("fetchRequest"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_operationConfiguration, CFSTR("operationConfiguration"));
}

+ (id)describeConfiguration:(id)a3
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  id v7;
  const __CFString *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
    return CFSTR("nil");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = +[NSPersistentCloudKitContainerActivityVoucher stringForQoS:](NSPersistentCloudKitContainerActivityVoucher, "stringForQoS:", objc_msgSend(a3, "qualityOfService"));
  if (objc_msgSend(a3, "allowsCellularAccess"))
    v8 = CFSTR("wifi+celluar");
  else
    v8 = CFSTR("wifi-only");
  v9 = objc_msgSend(a3, "isLongLived");
  objc_msgSend(a3, "timeoutIntervalForRequest");
  v11 = v10;
  objc_msgSend(a3, "timeoutIntervalForResource");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %@:%@:%d:%f:%f>"), v6, a3, v7, v8, v9, v11, v12);
}

+ (id)describeConfigurationWithoutPointer:(id)a3
{
  void *v4;
  id v5;
  const __CFString *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
    return CFSTR("nil");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = +[NSPersistentCloudKitContainerActivityVoucher stringForQoS:](NSPersistentCloudKitContainerActivityVoucher, "stringForQoS:", objc_msgSend(a3, "qualityOfService"));
  if (objc_msgSend(a3, "allowsCellularAccess"))
    v6 = CFSTR("wifi+celluar");
  else
    v6 = CFSTR("wifi-only");
  v7 = objc_msgSend(a3, "isLongLived");
  objc_msgSend(a3, "timeoutIntervalForRequest");
  v9 = v8;
  objc_msgSend(a3, "timeoutIntervalForResource");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@:%d:%f:%f"), v5, v6, v7, v9, v10);
}

+ (id)stringForQoS:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14[6];

  if (a3 <= 16)
  {
    if (a3 == -1)
      return CFSTR("Default");
    if (a3 == 9)
      return CFSTR("Background");
  }
  else
  {
    switch(a3)
    {
      case 17:
        return CFSTR("Utility");
      case 33:
        return CFSTR("UserInteractive");
      case 25:
        return CFSTR("UserInitiated");
    }
  }
  v14[4] = v3;
  v14[5] = v4;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Did someone add a new QoS class? This method should probably be updated.");
  _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v14[0]);
  v13 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Did someone add a new QoS class? This method should probably be updated.", (uint8_t *)v14, 2u);
  }
  return CFSTR("unknown");
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

@end
