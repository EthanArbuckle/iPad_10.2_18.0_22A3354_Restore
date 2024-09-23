@implementation LNMeasurementValueType(CATSupport)

- (const)cat_dialogType
{
  return CFSTR("dialog.String");
}

- (id)cat_value:()CATSupport
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3760];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v5, "stringFromMeasurement:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)cat_keyPath
{
  return 0;
}

@end
