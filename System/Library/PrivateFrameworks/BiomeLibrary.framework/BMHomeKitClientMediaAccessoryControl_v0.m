@implementation BMHomeKitClientMediaAccessoryControl_v0

- (id)accessoryState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BMHomeKitAccessoryState_v0 *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMHomeKitAccessoryState_v0 *v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BMHomeKitClientMediaAccessoryControl_v0;
  -[BMHomeKitClientMediaAccessoryControl accessoryState](&v23, sel_accessoryState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v8 = [BMHomeKitAccessoryState_v0 alloc];
        objc_msgSend(v7, "mediaPropertyType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "valueType");
        objc_msgSend(v7, "dataValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "numValue");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[BMHomeKitAccessoryState initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:](v8, "initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:", v9, v10, v11, v12, v14);
        objc_msgSend(v18, "addObject:", v15);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  return v18;
}

@end
