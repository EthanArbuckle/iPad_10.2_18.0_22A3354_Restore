@implementation PFCloudKitBaseMetric

- (PFCloudKitBaseMetric)initWithContainerIdentifier:(id)a3
{
  PFCloudKitBaseMetric *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitBaseMetric;
  v4 = -[PFCloudKitBaseMetric init](&v6, sel_init);
  if (v4)
  {
    v4->_containerIdentifier = (NSString *)a3;
    v4->_processName = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitBaseMetric;
  -[PFCloudKitBaseMetric dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;

  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to log metric with PFCloudKitBaseMetric, but each subclass must provide it's own name.");
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18A253000, v9, OS_LOG_TYPE_FAULT, "CoreData: Attempt to log metric with PFCloudKitBaseMetric, but each subclass must provide it's own name.", (uint8_t *)&v11, 2u);
  }
  return (NSString *)CFSTR("com.apple.coredata.cloudkit.base");
}

- (NSDictionary)payload
{
  NSString *processName;
  NSString *containerIdentifier;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("processName");
  processName = self->_processName;
  if (!processName)
    processName = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6[1] = CFSTR("containerIdentifier");
  v7[0] = processName;
  containerIdentifier = self->_containerIdentifier;
  if (!containerIdentifier)
    containerIdentifier = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7[1] = containerIdentifier;
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitBaseMetric;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@\n%@"), -[PFCloudKitBaseMetric description](&v3, sel_description), -[PFCloudKitBaseMetric name](self, "name"), -[PFCloudKitBaseMetric payload](self, "payload"));
}

@end
