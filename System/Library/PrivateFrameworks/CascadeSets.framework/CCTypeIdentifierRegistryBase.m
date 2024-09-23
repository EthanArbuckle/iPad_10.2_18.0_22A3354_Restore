@implementation CCTypeIdentifierRegistryBase

+ (BOOL)isValidItemType:(unsigned __int16)a3
{
  return objc_msgSend(a1, "itemMessageSubclassForItemType:", a3) != 0;
}

+ (Class)itemMessageSubclassForItemType:(unsigned __int16)a3
{
  return 0;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(a1, "itemMessageSubclassForIdentifier:");
  if (v4)
  {
    objc_msgSend(v4, "descriptionForTypeIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)isValidFieldType:(unsigned __int16)a3
{
  return objc_msgSend(a1, "itemMessageSubclassForFieldType:", a3) != 0;
}

+ (unsigned)itemTypeForFieldType:(unsigned __int16)a3 error:(id *)a4
{
  unsigned int v5;
  void *v6;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_msgSend(a1, "itemMessageSubclassForFieldType:");
  if (v6)
    return objc_msgSend(v6, "itemType");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided type identifer %hu is not a valid field type"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCUnrecognizedIdentifierErrorForDescription(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CCSetError(a4, v9);

  return CCTypeIdentifierUnknown;
}

+ (id)setIdentifierForItemType:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemTypeForSetIdentifier:(id)a3
{
  return CCTypeIdentifierUnknown;
}

+ (Class)itemMessageSubclassForIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)itemMessageSubclassForFieldType:(unsigned __int16)a3
{
  return 0;
}

@end
