@implementation HAPKeychainItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = (void *)objc_opt_class();
  -[HAPKeychainItem genericData](self, "genericData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDictionaryFromGenericData:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[HAPKeychainItem accessGroup](self, "accessGroup");
  v22 = objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem type](self, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = KeyTypeDescription(v21);
  -[HAPKeychainItem account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPKeychainItem isSyncable](self, "isSyncable"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  -[HAPKeychainItem valueData](self, "valueData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSObjectMasked();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPKeychainItem isInvisible](self, "isInvisible"))
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  -[HAPKeychainItem viewHint](self, "viewHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR(", viewHint: ");
  else
    v11 = &stru_1E894EFE8;
  -[HAPKeychainItem viewHint](self, "viewHint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HAPKeychainItem viewHint](self, "viewHint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    v14 = (void *)v22;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("agrp: %@, type: %s, acct: %@, sync: %@, hash: %@, invisible: %@%@%@, dictionary:%@"), v22, v19, v5, v17, v8, v9, v11, v13, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v6;
    v14 = (void *)v22;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("agrp: %@, type: %s, acct: %@, sync: %@, hash: %@, invisible: %@%@%@, dictionary:%@"), v22, v19, v5, v18, v8, v9, v11, &stru_1E894EFE8, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (HAPKeychainItem)initWithQueryResult:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4
{
  _BOOL4 v4;
  HAPKeychainItem *v6;
  const __CFString *Value;
  CFStringRef Copy;
  NSString *accessGroup;
  const __CFNumber *v10;
  uint64_t v11;
  NSNumber *type;
  const __CFString *v13;
  CFStringRef v14;
  NSString *label;
  const __CFString *v16;
  CFStringRef v17;
  NSString *itemDescription;
  const __CFBoolean *v19;
  const __CFBoolean *v20;
  const __CFString *v21;
  CFStringRef v22;
  NSString *account;
  const void *v24;
  const __CFData *v25;
  CFDataRef v26;
  NSData *valueData;
  const __CFData *TypedValue;
  CFDataRef v29;
  NSData *genericData;
  const __CFString *v31;
  CFStringRef v32;
  NSString *viewHint;
  void *v34;
  unsigned int valuePtr;
  objc_super v37;

  v4 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HAPKeychainItem;
  v6 = -[HAPKeychainItem init](&v37, sel_init);
  if (v6)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6898]);
    Copy = CFStringCreateCopy(0, Value);
    accessGroup = v6->_accessGroup;
    v6->_accessGroup = &Copy->isa;

    valuePtr = 0;
    v10 = (const __CFNumber *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6BC8]);
    CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", valuePtr);
    v11 = objc_claimAutoreleasedReturnValue();
    type = v6->_type;
    v6->_type = (NSNumber *)v11;

    v13 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6A90]);
    v14 = CFStringCreateCopy(0, v13);
    label = v6->_label;
    v6->_label = &v14->isa;

    v16 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD69A0]);
    v17 = CFStringCreateCopy(0, v16);
    itemDescription = v6->_itemDescription;
    v6->_itemDescription = &v17->isa;

    v19 = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6B80]);
    if (v19)
      v6->_syncable = CFBooleanGetValue(v19) != 0;
    v20 = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD69C0]);
    if (v20)
      v6->_invisible = CFBooleanGetValue(v20) != 0;
    v21 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD68F8]);
    v22 = CFStringCreateCopy(0, v21);
    account = v6->_account;
    v6->_account = &v22->isa;

    v24 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD70E0]);
    v6->_platformReference = (void *)CFRetain(v24);
    if (v4)
    {
      v25 = (const __CFData *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD70D8]);
      v26 = CFDataCreateCopy(0, v25);
      valueData = v6->_valueData;
      v6->_valueData = (NSData *)v26;

    }
    CFDataGetTypeID();
    TypedValue = (const __CFData *)CFDictionaryGetTypedValue();
    if (TypedValue)
    {
      v29 = CFDataCreateCopy(0, TypedValue);
      genericData = v6->_genericData;
      v6->_genericData = (NSData *)v29;

    }
    v31 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6B78]);
    if (v31)
    {
      v32 = CFStringCreateCopy(0, v31);
      viewHint = v6->_viewHint;
      v6->_viewHint = &v32->isa;

    }
    CFDateGetTypeID();
    v34 = (void *)CFDictionaryGetTypedValue();
    if (v34)
      objc_storeStrong((id *)&v6->_creationDate, v34);
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HAPMutableKeychainItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init(HAPMutableKeychainItem);
  -[HAPKeychainItem accessGroup](self, "accessGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setAccessGroup:](v4, "setAccessGroup:", v5);

  -[HAPKeychainItem type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setType:](v4, "setType:", v6);

  -[HAPKeychainItem account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setAccount:](v4, "setAccount:", v7);

  -[HAPKeychainItem valueData](self, "valueData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setValueData:](v4, "setValueData:", v8);

  -[HAPKeychainItem setSyncable:](v4, "setSyncable:", -[HAPKeychainItem isSyncable](self, "isSyncable"));
  -[HAPKeychainItem viewHint](self, "viewHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v4, "setViewHint:", v9);

  -[HAPKeychainItem label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setLabel:](v4, "setLabel:", v10);

  -[HAPKeychainItem itemDescription](self, "itemDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setItemDescription:](v4, "setItemDescription:", v11);

  -[HAPKeychainItem creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setCreationDate:](v4, "setCreationDate:", v12);

  -[HAPKeychainItem genericData](self, "genericData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setGenericData:](v4, "setGenericData:", v13);

  return v4;
}

- (id)mutableCopy
{
  return -[HAPKeychainItem mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HAPKeychainItem accessGroup](self, "accessGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  -[HAPKeychainItem type](self, "type");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[3];
  v4[3] = v7;

  -[HAPKeychainItem account](self, "account");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[4];
  v4[4] = v9;

  -[HAPKeychainItem valueData](self, "valueData");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[5];
  v4[5] = v11;

  *((_BYTE *)v4 + 8) = -[HAPKeychainItem isSyncable](self, "isSyncable");
  -[HAPKeychainItem viewHint](self, "viewHint");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v4[8];
  v4[8] = v13;

  -[HAPKeychainItem label](self, "label");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v4[6];
  v4[6] = v15;

  -[HAPKeychainItem itemDescription](self, "itemDescription");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v4[7];
  v4[7] = v17;

  -[HAPKeychainItem creationDate](self, "creationDate");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v4[9];
  v4[9] = v19;

  -[HAPKeychainItem genericData](self, "genericData");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4[10];
  v4[10] = v21;

  return v4;
}

- (void)dealloc
{
  void *platformReference;
  objc_super v4;

  platformReference = self->_platformReference;
  if (platformReference)
  {
    CFRelease(platformReference);
    self->_platformReference = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HAPKeychainItem;
  -[HAPKeychainItem dealloc](&v4, sel_dealloc);
}

- (BOOL)matchesPublicKeyData:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  _BYTE v8[65];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(objc_retainAutorelease(a3), "bytes"))
    return 0;
  DataToHexCStringEx();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem valueData](self, "valueData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessGroup, a3);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void)setValueData:(id)a3
{
  objc_storeStrong((id *)&self->_valueData, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (BOOL)isSyncable
{
  return self->_syncable;
}

- (void)setSyncable:(BOOL)a3
{
  self->_syncable = a3;
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setViewHint:(id)a3
{
  objc_storeStrong((id *)&self->_viewHint, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSData)genericData
{
  return self->_genericData;
}

- (void)setGenericData:(id)a3
{
  objc_storeStrong((id *)&self->_genericData, a3);
}

- (BOOL)isInvisible
{
  return self->_invisible;
}

- (void)platformReference
{
  return self->_platformReference;
}

- (void)setPlatformReference:(void *)a3
{
  self->_platformReference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

+ (BOOL)isQueryResultValid:(__CFDictionary *)a3 shouldIncludeData:(BOOL)a4
{
  _BOOL4 v4;
  const void *Value;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID v11;
  CFTypeID v12;

  v4 = a4;
  Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6898]);
  if (Value)
  {
    v7 = CFGetTypeID(Value);
    if (v7 != CFStringGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6BC8]);
    if (!Value)
      return (char)Value;
    v8 = CFGetTypeID(Value);
    if (v8 != CFNumberGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD6A90]);
    if (!Value)
      return (char)Value;
    v9 = CFGetTypeID(Value);
    if (v9 != CFStringGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD69A0]);
    if (!Value)
      return (char)Value;
    v10 = CFGetTypeID(Value);
    if (v10 != CFStringGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD68F8]);
    if (!Value)
      return (char)Value;
    v11 = CFGetTypeID(Value);
    if (v11 != CFStringGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD70E0]);
    if (Value)
    {
      if (!v4)
      {
LABEL_15:
        LOBYTE(Value) = 1;
        return (char)Value;
      }
      Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CD70D8]);
      if (Value)
      {
        v12 = CFGetTypeID(Value);
        if (v12 == CFDataGetTypeID())
          goto LABEL_15;
LABEL_17:
        LOBYTE(Value) = 0;
      }
    }
  }
  return (char)Value;
}

@end
