@implementation NSCloudKitMirroringActivityVoucherManager

- (NSCloudKitMirroringActivityVoucherManager)init
{
  NSCloudKitMirroringActivityVoucherManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSCloudKitMirroringActivityVoucherManager;
  v2 = -[NSCloudKitMirroringActivityVoucherManager init](&v4, sel_init);
  if (v2)
    v2->_vouchersByEventType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_vouchersByEventType = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringActivityVoucherManager;
  -[NSCloudKitMirroringActivityVoucherManager dealloc](&v3, sel_dealloc);
}

- (unint64_t)countVouchers
{
  NSMutableDictionary *vouchersByEventType;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  vouchersByEventType = self->_vouchersByEventType;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](vouchersByEventType, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(vouchersByEventType);
      v6 += objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_vouchersByEventType, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)), "count");
    }
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](vouchersByEventType, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (BOOL)hasVoucherMatching:(id)a3
{
  return 0;
}

- (void)addVoucher:(id)a3
{
  id v4;

  v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, objc_msgSend(a3, "eventType"));
  objc_msgSend(v4, "addObject:", a3);

}

- (id)_vouchersForEventType:(uint64_t)a1
{
  id v4;

  if (!a1)
    return 0;
  v4 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2));
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2));
  }
  return v4;
}

- (void)expireVoucher:(id)a3
{
  id v4;

  v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, objc_msgSend(a3, "eventType"));
  objc_msgSend(v4, "removeObject:", a3);

}

- (void)expireVouchersForEventType:(int64_t)a3
{
  id v3;

  v3 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, a3);
  objc_msgSend(v3, "removeAllObjects");

}

- (id)usableVoucherForEventType:(int64_t)a3
{
  id result;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) < 2)
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_vouchersByEventType, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "lastObject");
  if (a3)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Is there a new event type: %@");
    v7 = +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", a3);
    _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", a3);
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Is there a new event type: %@", buf, 0xCu);
    }
    return 0;
  }
  else
  {
    result = -[NSCloudKitMirroringActivityVoucherManager usableVoucherForEventType:](self, "usableVoucherForEventType:", 2);
    if (!result)
      return -[NSCloudKitMirroringActivityVoucherManager usableVoucherForEventType:](self, "usableVoucherForEventType:", 1);
  }
  return result;
}

@end
