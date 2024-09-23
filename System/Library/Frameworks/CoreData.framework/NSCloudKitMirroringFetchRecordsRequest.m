@implementation NSCloudKitMirroringFetchRecordsRequest

- (NSCloudKitMirroringFetchRecordsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringFetchRecordsRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v6, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    v4->_objectIDsToFetch = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v4->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v4->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v4->_editable = 1;
    v4->_perOperationObjectThreshold = 400;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityNameToAttributesToFetch = 0;
  self->_entityNameToAttributeNamesToFetch = 0;

  self->_objectIDsToFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (NSDictionary)entityNameToAttributesToFetch
{
  return self->_entityNameToAttributesToFetch;
}

- (void)setEntityNameToAttributesToFetch:(id)a3
{
  NSDictionary *entityNameToAttributesToFetch;

  if (self->_editable)
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    if (entityNameToAttributesToFetch != a3)
    {

      self->_entityNameToAttributesToFetch = (NSDictionary *)objc_msgSend(a3, "copy");
      if (-[NSDictionary count](self->_entityNameToAttributeNamesToFetch, "count"))
      {

        self->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      }
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (uint64_t)throwNotEditable:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  void *v7;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = NSStringFromSelector(aSelector);
    v7 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ called after the request was sent to %@\nRequest: %@"), v6, NSStringFromSelector(sel_executeRequest_error_), v2), 0);
    objc_exception_throw(v7);
  }
  return result;
}

- (void)setEntityNameToAttributeNamesToFetch:(id)a3
{
  NSDictionary *entityNameToAttributeNamesToFetch;

  if (self->_editable)
  {
    entityNameToAttributeNamesToFetch = self->_entityNameToAttributeNamesToFetch;
    if (entityNameToAttributeNamesToFetch != a3)
    {

      self->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_msgSend(a3, "copy");
      if (-[NSDictionary count](self->_entityNameToAttributesToFetch, "count"))
      {

        self->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      }
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (void)setObjectIDsToFetch:(id)a3
{
  NSArray *objectIDsToFetch;

  if (self->_editable)
  {
    objectIDsToFetch = self->_objectIDsToFetch;
    if (objectIDsToFetch != a3)
    {

      self->_objectIDsToFetch = (NSArray *)objc_msgSend(a3, "copy");
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSDictionary *entityNameToAttributesToFetch;
  _QWORD *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v26[7];
  _QWORD v27[7];
  objc_super v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v28.receiver = self;
  v28.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  if (!-[NSCloudKitMirroringRequest validateForUseWithStore:error:](&v28, sel_validateForUseWithStore_error_, a3, &v29))
    goto LABEL_10;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  if (-[NSDictionary count](self->_entityNameToAttributesToFetch, "count"))
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke;
    v27[3] = &unk_1E1EDF5B8;
    v27[4] = v9;
    v27[5] = v8;
    v27[6] = v7;
    v11 = v27;
LABEL_6:
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](entityNameToAttributesToFetch, "enumerateKeysAndObjectsUsingBlock:", v11);
    goto LABEL_7;
  }
  if (-[NSDictionary count](self->_entityNameToAttributeNamesToFetch, "count"))
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributeNamesToFetch;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3;
    v26[3] = &unk_1E1EDF5B8;
    v26[4] = v9;
    v26[5] = v8;
    v26[6] = v7;
    v11 = v26;
    goto LABEL_6;
  }
LABEL_7:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "sortUsingSelector:", sel_compare_);
    v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v13 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Invalid '%@'. The following validation failures occured:"), NSStringFromClass(v13));
    objc_msgSend(v14, "appendFormat:", CFSTR("\n%@"), objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n")));
    v15 = *MEMORY[0x1E0CB28A8];
    v34 = *MEMORY[0x1E0CB2D68];
    v35[0] = v14;
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, 134070, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1));

  }
  else if (v8)
  {

    self->_entityNameToAttributesToFetch = (NSDictionary *)objc_msgSend(v8, "copy");
    self->_editable = 0;
    LOBYTE(v16) = 1;
    return v16;
  }

LABEL_10:
  if (!v29)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringFetchRecordsRequest.m");
    v24 = __pflogFaultLog;
    v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v16)
      return v16;
    *(_DWORD *)buf = 136315394;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringFetchRecordsRequest.m";
    v32 = 1024;
    v33 = 195;
    _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_15:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (!a4)
    goto LABEL_15;
  LOBYTE(v16) = 0;
  *a4 = v29;
  return v16;
}

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[8];

  v6 = objc_msgSend((id)objc_msgSend(a1[4], "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    v7 = v6;
    v8 = (id)objc_msgSend(a1[5], "objectForKey:", a2);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1[5], "setObject:forKey:", v9, a2);
      v8 = v9;
    }
    v10 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2;
    v11[3] = &unk_1E1EDF590;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a1[6];
    v11[7] = a2;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    objc_msgSend(a1[6], "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - entity not found in model"), a2));
  }
}

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", objc_msgSend(a2, "name"));
  if (v4)
  {
    v5 = v4;
    v6 = *(void **)(a1 + 40);
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@ - attribute not found on entity"), *(_QWORD *)(a1 + 56), objc_msgSend(a2, "name"));
    v6 = v7;
  }
  return objc_msgSend(v6, "addObject:", v5);
}

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[8];

  v6 = objc_msgSend((id)objc_msgSend(a1[4], "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    v7 = v6;
    v8 = (id)objc_msgSend(a1[5], "objectForKey:", a2);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1[5], "setObject:forKey:", v9, a2);
      v8 = v9;
    }
    v10 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4;
    v11[3] = &unk_1E1EDF5E0;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a1[6];
    v11[7] = a2;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    objc_msgSend(a1[6], "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - entity not found in model"), a2));
  }
}

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", a2);
  if (v4)
  {
    v5 = v4;
    v6 = *(void **)(a1 + 40);
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@ - attribute not found on entity"), *(_QWORD *)(a1 + 56), a2);
    v6 = v7;
  }
  return objc_msgSend(v6, "addObject:", v5);
}

- (NSArray)objectIDsToFetch
{
  return self->_objectIDsToFetch;
}

@end
