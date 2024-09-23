@implementation NSDictionary

void __48__NSDictionary_HKCodingSupport__codableMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HKCodableMetadataKeyValuePair *v6;
  char isKindOfClass;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_alloc_init(HKCodableMetadataKeyValuePair);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    -[HKCodableMetadataKeyValuePair setKey:](v6, "setKey:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKCodableMetadataKeyValuePair setNumberIntValue:](v6, "setNumberIntValue:", objc_msgSend(v5, "longLongValue"));
    if ((isKindOfClass & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKCodableMetadataKeyValuePair setStringValue:](v6, "setStringValue:", v5);
    if ((isKindOfClass & 1) != 0)
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "addKeyValuePairs:", v6);
  }
LABEL_9:

}

@end
