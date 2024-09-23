@implementation NSCloudKitMirroringDelegateSerializationRequest

- (NSCloudKitMirroringDelegateSerializationRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringDelegateSerializationRequest *v4;
  NSCloudKitMirroringDelegateSerializationRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v7, sel_initWithOptions_completionBlock_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_resultType = 0;
    v4->_objectIDsToSerialize = (NSSet *)(id)NSSet_EmptySet;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequest;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[NSCloudKitMirroringRequest description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR(" resultType: %@"), +[NSCloudKitMirroringDelegateSerializationRequest stringForResultType:]((uint64_t)NSCloudKitMirroringDelegateSerializationRequest, self->_resultType));
  objc_msgSend(v3, "appendFormat:", CFSTR(" resultType: %@"), +[NSCloudKitMirroringDelegateSerializationRequest stringForResultType:]((uint64_t)NSCloudKitMirroringDelegateSerializationRequest, self->_resultType));
  objc_msgSend(v3, "appendFormat:", CFSTR("\nobjectIDsToSerialize:\n%@"), self->_objectIDsToSerialize);
  return v3;
}

+ (const)stringForResultType:(uint64_t)a1
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
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2 == 1)
    return CFSTR("Records");
  if (!a2)
    return CFSTR("RecordIDs");
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown result type: %lu");
  _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a2);
  v11 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a2;
    _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Unknown result type: %lu", buf, 0xCu);
  }
  return 0;
}

- (void)setObjectIDsToSerialize:(id)a3
{
  NSSet *objectIDsToSerialize;
  NSSet *v6;

  objectIDsToSerialize = self->_objectIDsToSerialize;
  if (objectIDsToSerialize != a3)
  {

    if (a3)
      v6 = (NSSet *)a3;
    else
      v6 = (NSSet *)(id)NSSet_EmptySet;
    self->_objectIDsToSerialize = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringDelegateSerializationRequest;
  v4 = -[NSCloudKitMirroringRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[10] = self->_resultType;
  v4[11] = self->_objectIDsToSerialize;
  return v4;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSSet)objectIDsToSerialize
{
  return self->_objectIDsToSerialize;
}

@end
