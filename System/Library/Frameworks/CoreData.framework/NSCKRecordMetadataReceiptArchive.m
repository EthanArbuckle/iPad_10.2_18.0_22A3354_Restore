@implementation NSCKRecordMetadataReceiptArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCKRecordMetadataReceiptArchive)initWithReceiptsToEncode:(id)a3
{
  NSCKRecordMetadataReceiptArchive *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  const __CFString *v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  v3 = -[NSCKRecordMetadataReceiptArchive init](&v17, sel_init);
  if (v3)
  {
    v3->_zoneIDToArchivedReceipts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(a3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v9 = (void *)objc_msgSend(v8, "createRecordIDForMovedRecord");
          v10 = (id)-[NSMutableDictionary objectForKey:](v3->_zoneIDToArchivedReceipts, "objectForKey:", objc_msgSend(v9, "zoneID"));
          if (!v10)
          {
            v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            -[NSMutableDictionary setObject:forKey:](v3->_zoneIDToArchivedReceipts, "setObject:forKey:", v10, objc_msgSend(v9, "zoneID"));
          }
          v18 = CFSTR("movedAt");
          v19 = objc_msgSend(v8, "movedAt");
          objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1), objc_msgSend(v9, "recordName"));

        }
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      }
      while (v5);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_zoneIDToArchivedReceipts = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  -[NSCKRecordMetadataReceiptArchive dealloc](&v3, sel_dealloc);
}

- (NSCKRecordMetadataReceiptArchive)initWithCoder:(id)a3
{
  NSCKRecordMetadataReceiptArchive *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  v4 = -[NSCKRecordMetadataReceiptArchive init](&v7, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v8[0] = objc_opt_class();
    getCloudKitCKRecordZoneIDClass[0]();
    v8[1] = objc_opt_class();
    v8[2] = objc_opt_class();
    v8[3] = objc_opt_class();
    v4->_zoneIDToArchivedReceipts = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4)), CFSTR("archiveDictionary"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_zoneIDToArchivedReceipts, CFSTR("archiveDictionary"));
}

- (void)enumerateArchivedRecordIDsUsingBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *obj;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_zoneIDToArchivedReceipts;
  v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v17 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v4);
        v6 = (void *)-[NSMutableDictionary objectForKey:](self->_zoneIDToArchivedReceipts, "objectForKey:", v5);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              v12 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", v11, v5);
              (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, v12, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v11), "objectForKey:", CFSTR("movedAt")));

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }
        v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }
}

@end
