@implementation PFCloudKitMetadataValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _QWORD v14[7];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PFCloudKitMetadataValueTransformer;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", objc_msgSendSuper2(&v13, sel_allowedTopLevelClasses));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  getCloudKitCKRecordClass[0]();
  v14[0] = objc_opt_class();
  getCloudKitCKShareClass[0]();
  v14[1] = objc_opt_class();
  getCloudKitCKRecordIDClass[0]();
  v14[2] = objc_opt_class();
  getCloudKitCKRecordZoneIDClass[0]();
  v14[3] = objc_opt_class();
  getCloudKitCKServerChangeTokenClass[0]();
  v14[4] = objc_opt_class();
  getCloudKitCKNotificationInfoClass[0]();
  v14[5] = objc_opt_class();
  v14[6] = objc_opt_class();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v5);
  }
  return (NSArray *)v2;
}

@end
