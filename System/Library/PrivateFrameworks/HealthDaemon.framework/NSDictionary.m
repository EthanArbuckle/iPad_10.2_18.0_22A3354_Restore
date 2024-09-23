@implementation NSDictionary

void __51__NSDictionary_HDCodingSupport__hk_codableMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HDCodableMetadataKeyValuePair *v6;
  char isKindOfClass;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_alloc_init(HDCodableMetadataKeyValuePair);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    -[HDCodableMetadataKeyValuePair setKey:](v6, "setKey:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableMetadataKeyValuePair setStringValue:](v6, "setStringValue:", v5);
    if ((isKindOfClass & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    if (objc_msgSend(v8, "hk_hasFloatingPointValue"))
    {
      objc_msgSend(v8, "doubleValue");
      -[HDCodableMetadataKeyValuePair setNumberDoubleValue:](v6, "setNumberDoubleValue:");
    }
    else
    {
      -[HDCodableMetadataKeyValuePair setNumberIntValue:](v6, "setNumberIntValue:", objc_msgSend(v8, "longLongValue"));
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      -[HDCodableMetadataKeyValuePair setDateValue:](v6, "setDateValue:");
      if ((isKindOfClass & 1) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HDCodableMetadataKeyValuePair setDataValue:](v6, "setDataValue:", v5);
        if ((isKindOfClass & 1) != 0)
          goto LABEL_16;
      }
      goto LABEL_17;
    }
    objc_msgSend(v5, "codableRepresentationForSync");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCodableMetadataKeyValuePair setQuantityValue:](v6, "setQuantityValue:", v8);
  }

  if ((isKindOfClass & 1) != 0)
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "addKeyValuePairs:", v6);
LABEL_17:

}

@end
