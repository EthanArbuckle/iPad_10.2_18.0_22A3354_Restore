@implementation NSPersistentCloudKitContainerEventResult

- (NSPersistentCloudKitContainerEventResult)initWithResult:(id)a3 ofType:(int64_t)a4
{
  NSPersistentCloudKitContainerEventResult *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  v6 = -[NSPersistentCloudKitContainerEventResult init](&v8, sel_init);
  if (v6)
  {
    v6->_result = a3;
    v6->_resultType = a4;
  }
  return v6;
}

- (NSPersistentCloudKitContainerEventResult)initWithSubresults:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSPersistentCloudKitContainerEventResult *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v36;
  NSPersistentCloudKitContainerEventResult *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "count"))
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPersistentCloudKitContainerEventResult initialized without any subresults to aggregate.");
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v36);
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainerEventResult initialized without any subresults to aggregate.", buf, 2u);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  v13 = -[NSPersistentCloudKitContainerEventResult init](&v42, sel_init);
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = v13;
    v13->_resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(a3);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
          v20 = objc_msgSend(v19, "resultType");
          if (v20 == 1)
          {
            v22 = objc_msgSend((id)objc_msgSend(v19, "result"), "lastObject");
            if (v22)
            {
              v23 = (void *)v22;
              v24 = (void *)objc_msgSend(v14, "lastObject");
              v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "integerValue") + objc_msgSend(v23, "integerValue"));
              if (objc_msgSend(v14, "count"))
                objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 0, v25);
              else
                objc_msgSend(v14, "addObject:", v25);
            }
          }
          else if (v20)
          {
            v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown NSPersistentCloudKitContainerEventResultType in subResult: %@");
            _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)v19);
            v33 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v19;
              _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Unknown NSPersistentCloudKitContainerEventResultType in subResult: %@", buf, 0xCu);
            }
          }
          else
          {
            v21 = (void *)objc_msgSend(v19, "result");
            if (objc_msgSend(v21, "count"))
              objc_msgSend(v14, "addObjectsFromArray:", v21);
          }
          ++v18;
        }
        while (v16 != v18);
        v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        v16 = v34;
      }
      while (v34);
    }
    v13 = v37;
    v37->_result = (id)objc_msgSend(v14, "copy");

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  self->_result = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  -[NSPersistentCloudKitContainerEventResult dealloc](&v3, sel_dealloc);
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSPersistentCloudKitContainerEventResultType)resultType
{
  return self->_resultType;
}

@end
