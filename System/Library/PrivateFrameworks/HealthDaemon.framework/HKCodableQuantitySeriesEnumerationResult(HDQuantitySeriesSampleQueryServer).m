@implementation HKCodableQuantitySeriesEnumerationResult(HDQuantitySeriesSampleQueryServer)

+ (id)resultWithID:()HDQuantitySeriesSampleQueryServer UUID:value:count:startTime:endTime:seriesIndex:
{
  objc_class *v15;
  id v16;
  id v17;
  void *v18;

  v15 = (objc_class *)MEMORY[0x1E0CB6480];
  v16 = a7;
  v17 = objc_alloc_init(v15);
  objc_msgSend(v17, "setPersistentID:", a6);
  objc_msgSend(v16, "hk_dataForUUIDBytes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setUuid:", v18);
  objc_msgSend(v17, "setValue:", a1);
  objc_msgSend(v17, "setCount:", a8);
  objc_msgSend(v17, "setStartTime:", a2);
  objc_msgSend(v17, "setEndTime:", a3);
  objc_msgSend(v17, "setSeriesIndex:", a9);
  return v17;
}

@end
