@implementation NSCloudKitMirroringResult

- (NSCloudKitMirroringResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  NSCloudKitMirroringResult *v12;
  NSError *v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = -[NSCloudKitMirroringResult init](self, "init");
  if (v12)
  {
    v12->_request = (NSCloudKitMirroringRequest *)a3;
    v12->_storeIdentifier = (NSString *)a4;
    v12->_success = a5;
    v12->_madeChanges = a6;
    v13 = (NSError *)a7;
    v12->_error = v13;
    if (v12->_success && v13 != 0)
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "initWithRequest passed an error (%@) on a succes condition");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)a7);
      v34 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        return v12;
      *(_DWORD *)buf = 138412290;
      v39 = a7;
      v24 = "CoreData: initWithRequest passed an error (%@) on a succes condition";
      v25 = v34;
      v26 = 12;
LABEL_17:
      _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
      return v12;
    }
    if (!v12->_success && v13 == 0)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "initWithRequest illegally passed nil instead of an error on a failure condition");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v37);
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "CoreData: initWithRequest illegally passed nil instead of an error on a failure condition";
        v25 = v23;
        v26 = 2;
        goto LABEL_17;
      }
    }
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringResult;
  v3 = (void *)objc_msgSend(-[NSCloudKitMirroringResult description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR(" storeIdentifier: %@ success: %d madeChanges: %d error: %@"), self->_storeIdentifier, self->_success, self->_madeChanges, self->_error);
  return v3;
}

- (NSCloudKitMirroringRequest)request
{
  return self->_request;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)madeChanges
{
  return self->_madeChanges;
}

@end
