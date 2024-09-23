@implementation HKCodableQuantitySeriesDatum(HDQuantitySampleEntity)

+ (id)datumWithValue:()HDQuantitySampleEntity timeInterval:
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB6478]);
  objc_msgSend(v4, "setValue:", a1);
  objc_msgSend(v4, "setTimeInterval:", a2);
  return v4;
}

+ (id)datumWithTimestamp:()HDQuantitySampleEntity value:duration:
{
  id v6;
  double v7;

  v6 = objc_alloc_init(MEMORY[0x1E0CB6478]);
  objc_msgSend(v6, "setTimeInterval:", a1);
  objc_msgSend(v6, "setValue:", a2);
  if (a3 != -1.0)
  {
    *(float *)&v7 = a3;
    objc_msgSend(v6, "setDuration:", v7);
  }
  return v6;
}

+ (uint64_t)datumWithStartTime:()HDQuantitySampleEntity value:endTime:
{
  double v5;
  void *v11;

  v5 = a5;
  if (a5 < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleSeriesEntity.mm"), 2027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTime >= startTime"));

  }
  *(float *)&a5 = v5 - a3;
  return objc_msgSend(a1, "datumWithTimestamp:value:duration:", a3, a4, a5);
}

@end
