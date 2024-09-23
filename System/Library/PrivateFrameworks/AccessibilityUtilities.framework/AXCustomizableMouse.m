@implementation AXCustomizableMouse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXCustomizableMouse)initWithCoder:(id)a3
{
  id v4;
  AXCustomizableMouse *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXCustomizableMouse;
  v5 = -[AXCustomizableMouse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_vendorId = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_productId = objc_msgSend(v11, "integerValue");

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("buttonMap"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    -[AXCustomizableMouse setButtonMap:](v5, "setButtonMap:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AXCustomizableMouse name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[AXCustomizableMouse identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXCustomizableMouse vendorId](self, "vendorId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("vendorId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXCustomizableMouse productId](self, "productId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productId"));

  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("buttonMap"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXCustomizableMouse name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deserialize:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _UNKNOWN **v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  _UNKNOWN **v16;
  unint64_t v17;
  void *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v3, "count"))
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = v3;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (!v5)
    goto LABEL_20;
  v6 = v5;
  v7 = *(_QWORD *)v26;
  v8 = 0x1E0CB3000uLL;
  v9 = &off_1E24C2000;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v8 + 1808), "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v24, "addObject:", v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CF3998], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "ignoreLogging");

        if ((v14 & 1) != 0)
          continue;
        v15 = v4;
        v16 = v9;
        v17 = v8;
        objc_msgSend(MEMORY[0x1E0CF3998], "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v12 = objc_claimAutoreleasedReturnValue();

        v19 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v12, v19))
        {
          AXColorizeFormatLog();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, v19))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v21;
            _os_log_impl(&dword_18C62B000, v12, v19, "%{public}@", buf, 0xCu);
          }

        }
        v8 = v17;
        v9 = v16;
        v4 = v15;
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  }
  while (v6);
LABEL_20:

  v3 = v23;
LABEL_22:

  return v24;
}

+ (id)serialize:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 1, 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)mouseForHIDDevice:(__IOHIDDevice *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    IOHIDDeviceGetProperty(a3, CFSTR("Product"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDDeviceGetProperty(a3, CFSTR("PhysicalDeviceUniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDDeviceGetProperty(a3, CFSTR("VendorID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDDeviceGetProperty(a3, CFSTR("ProductID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(a1, "_newOrExistingMouseForIdentifier:name:vendorId:productId:", v6, v5, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)mouseForHIDServiceClient:(__IOHIDServiceClient *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v5 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("Product"));
    v6 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("PhysicalDeviceUniqueID"));
    v7 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("VendorID"));
    v8 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("ProductID"));
    v9 = (void *)objc_msgSend(a1, "_newOrExistingMouseForIdentifier:name:vendorId:productId:", v6, v5, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_existingMouseForIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[7];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  if (objc_msgSend(v7, "length"))
  {
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assistiveTouchMouseCustomizedClickActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke;
    v16[3] = &unk_1E24C5010;
    v19 = a4;
    v20 = a5;
    v17 = v7;
    v18 = &v21;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  }
  v10 = (void *)v22[5];
  if (!v10)
  {
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assistiveTouchMouseCustomizedClickActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke_2;
    v15[3] = &unk_1E24C5038;
    v15[5] = a4;
    v15[6] = a5;
    v15[4] = &v21;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

    v10 = (void *)v22[5];
  }
  v13 = v10;
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEqualToIdentifier:vendorId:productId:", a1[4], a1[6], a1[7]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "vendorId") == a1[5] && objc_msgSend(v7, "productId") == a1[6])
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)_newOrExistingMouseForIdentifier:(id)a3 name:(id)a4 vendorId:(id)a5 productId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AXCustomizableMouse *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "length") || (v14 = 0, v12) && v13)
  {
    objc_msgSend(a1, "_existingMouseForIdentifier:vendorId:productId:", v10, objc_msgSend(v12, "integerValue"), objc_msgSend(v13, "integerValue"));
    v14 = (AXCustomizableMouse *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = -[AXCustomizableMouse initWithIdentifier:name:vendorId:productId:]([AXCustomizableMouse alloc], "initWithIdentifier:name:vendorId:productId:", v10, v11, objc_msgSend(v12, "integerValue"), objc_msgSend(v13, "integerValue"));
  }

  return v14;
}

- (AXCustomizableMouse)initWithIdentifier:(id)a3 name:(id)a4 vendorId:(int64_t)a5 productId:(int64_t)a6
{
  id v11;
  id v12;
  AXCustomizableMouse *v13;
  AXCustomizableMouse *v14;
  void **p_identifier;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXCustomizableMouse;
  v13 = -[AXCustomizableMouse init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a4);
    p_identifier = (void **)&v14->_identifier;
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_vendorId = a5;
    v14->_productId = a6;
    if (!-[NSString length](v14->_identifier, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li-%li"), a5, a6);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *p_identifier;
      *p_identifier = (void *)v16;

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCustomizableMouse setButtonMap:](v14, "setButtonMap:", v18);

  }
  return v14;
}

- (void)setDefaultActionForButtonNumber:(int64_t)a3
{
  void *v5;
  int v6;
  id v7;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "laserEnabled");

  if (v6)
    AXAssistiveTouchDefaultLaserIconTypeForMouseButton(a3);
  else
    AXAssistiveTouchDefaultIconTypeForMouseButton(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXCustomizableMouse setCustomAction:forButtonNumber:](self, "setCustomAction:forButtonNumber:", v7, a3);

}

- (void)setCustomAction:(id)a3 forButtonNumber:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "length");
  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
  else
    objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (BOOL)hasCustomActions
{
  void *v2;
  BOOL v3;

  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)customActionsRequireAssistiveTouch
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXCustomizableMouse buttonMap](self, "buttonMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[AXCustomizableMouse buttonMap](self, "buttonMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("__NONE__")) & 1) == 0)
          {
            AXAssistiveTouchDefaultLaserIconTypeForMouseButton(objc_msgSend(v10, "integerValue"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToString:", v13);

            if (!v14)
            {

              v15 = 1;
              goto LABEL_15;
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (NSArray)buttonsWithCustomActions
{
  void *v2;
  void *v3;
  void *v4;

  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)customActionForButtonNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  -[AXCustomizableMouse identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[AXCustomizableMouse vendorId](self, "vendorId");
  v6 = v5 ^ -[AXCustomizableMouse productId](self, "productId") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[AXCustomizableMouse isEqualToMouse:](self, "isEqualToMouse:", v4);

  return v5;
}

- (BOOL)isEqualToMouse:(id)a3
{
  AXCustomizableMouse *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (self == a3)
    return 1;
  v3 = self;
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "vendorId");
  v7 = objc_msgSend(v4, "productId");

  LOBYTE(v3) = -[AXCustomizableMouse isEqualToIdentifier:vendorId:productId:](v3, "isEqualToIdentifier:vendorId:productId:", v5, v6, v7);
  return (char)v3;
}

- (BOOL)isEqualToIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  BOOL v11;

  v8 = a3;
  -[AXCustomizableMouse identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  v11 = v10
     && -[AXCustomizableMouse vendorId](self, "vendorId") == a4
     && -[AXCustomizableMouse productId](self, "productId") == a5;

  return v11;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)AXCustomizableMouse;
  -[AXCustomizableMouse debugDescription](&v12, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomizableMouse name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomizableMouse identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXCustomizableMouse vendorId](self, "vendorId");
  v8 = -[AXCustomizableMouse productId](self, "productId");
  -[AXCustomizableMouse buttonMap](self, "buttonMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, name: %@, identifier: %@, vendorId: %d, productId: %d, buttonMap: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (int64_t)productId
{
  return self->_productId;
}

- (NSMutableDictionary)buttonMap
{
  return self->_buttonMap;
}

- (void)setButtonMap:(id)a3
{
  objc_storeStrong((id *)&self->_buttonMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
