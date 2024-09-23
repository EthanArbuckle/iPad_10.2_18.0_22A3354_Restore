@implementation INCodableAttributeMetadataClassWithMetadataTypeName

void __INCodableAttributeMetadataClassWithMetadataTypeName_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  NSString *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = v8;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INCodable%@AttributeMetadata"), v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)INCodableAttributeMetadataClassWithMetadataTypeName_classForTypeName, "setObject:forKeyedSubscript:", NSClassFromString(v7), v8);

}

void __INCodableAttributeMetadataClassWithMetadataTypeName_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)INCodableAttributeMetadataClassWithMetadataTypeName_classForTypeName;
  INCodableAttributeMetadataClassWithMetadataTypeName_classForTypeName = (uint64_t)v0;

  v2 = &unk_1E23FE028;
  +[0 enumerateKeysAndObjectsUsingBlock:](&unk_1E23FE028, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9_95090);

}

@end
