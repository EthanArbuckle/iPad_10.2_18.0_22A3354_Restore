@implementation CKSyncEngineEvent

- (CKSyncEngineStateUpdateEvent)stateUpdateEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineStateUpdateEvent *)self;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSyncEngineEvent;
  return -[CKSyncEngineEvent init](&v3, sel_init);
}

- (CKSyncEngineFetchedDatabaseChangesEvent)fetchedDatabaseChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineFetchedDatabaseChangesEvent *)self;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineEvent *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  objc_class *v2;
  void *v3;
  const char *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v4, (uint64_t)CFSTR("CKSyncEngine"), (uint64_t)&stru_1E1F66ED0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineEvent *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (CKSyncEngineEventType)type
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99750];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("Event type subclass doesn't implement -type: %@"), v5);

  objc_exception_throw(v7);
}

- (CKSyncEngineAccountChangeEvent)accountChangeEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineAccountChangeEvent *)self;
}

- (CKSyncEngineFetchedRecordZoneChangesEvent)fetchedRecordZoneChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineFetchedRecordZoneChangesEvent *)self;
}

- (CKSyncEngineSentDatabaseChangesEvent)sentDatabaseChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineSentDatabaseChangesEvent *)self;
}

- (CKSyncEngineSentRecordZoneChangesEvent)sentRecordZoneChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineSentRecordZoneChangesEvent *)self;
}

- (CKSyncEngineWillFetchChangesEvent)willFetchChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillFetchChangesEvent *)self;
}

- (CKSyncEngineWillFetchRecordZoneChangesEvent)willFetchRecordZoneChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillFetchRecordZoneChangesEvent *)self;
}

- (CKSyncEngineDidFetchRecordZoneChangesEvent)didFetchRecordZoneChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidFetchRecordZoneChangesEvent *)self;
}

- (CKSyncEngineDidFetchChangesEvent)didFetchChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidFetchChangesEvent *)self;
}

- (CKSyncEngineWillSendChangesEvent)willSendChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillSendChangesEvent *)self;
}

- (CKSyncEngineDidSendChangesEvent)didSendChangesEvent
{
  CKException *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    v5 = *MEMORY[0x1E0C99750];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, (uint64_t)CFSTR("Cannot cast %@ to %@"), v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidSendChangesEvent *)self;
}

@end
