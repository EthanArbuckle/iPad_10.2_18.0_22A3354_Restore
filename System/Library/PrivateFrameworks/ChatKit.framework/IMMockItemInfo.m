@implementation IMMockItemInfo

+ (id)defaultMockInfoArray
{
  void *v2;
  int i;
  IMMockItemInfo *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
  for (i = 0; i != 50; ++i)
  {
    v4 = -[IMMockItemInfo initWithMockItemType:outgoing:]([IMMockItemInfo alloc], "initWithMockItemType:outgoing:", 0, (i & 1) == 0);
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

+ (id)encodedMockItemInfoArray:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)decodedMockItemInfoArray:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 1);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMMockItemInfo)initWithMockItemType:(int64_t)a3 outgoing:(BOOL)a4
{
  IMMockItemInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMMockItemInfo;
  result = -[IMMockItemInfo init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_outgoing = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMockItemInfo type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IMMockItemInfo outgoing](self, "outgoing"), CFSTR("outgoing"));

}

- (IMMockItemInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("outgoing"));

  return -[IMMockItemInfo initWithMockItemType:outgoing:](self, "initWithMockItemType:outgoing:", v5, v6);
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)outgoing
{
  return self->_outgoing;
}

@end
