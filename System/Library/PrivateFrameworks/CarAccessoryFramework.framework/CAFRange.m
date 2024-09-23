@implementation CAFRange

- (CAFInt64Range)int64Range
{
  CAFInt64Range *v3;
  void *v4;
  CAFInt64Range *v5;

  v3 = [CAFInt64Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFInt16Range)int16Range
{
  CAFInt16Range *v3;
  void *v4;
  CAFInt16Range *v5;

  v3 = [CAFInt16Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFUInt64Range)uInt64Range
{
  CAFUInt64Range *v3;
  void *v4;
  CAFUInt64Range *v5;

  v3 = [CAFUInt64Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFRange)initWithMetaData:(id)a3
{
  id v5;
  CAFRange *v6;
  CAFRange *v7;
  CAFCachedDescription *v8;
  CAFCachedDescription *cachedDescription;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFRange;
  v6 = -[CAFRange init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metaData, a3);
    v8 = -[CAFCachedDescription initWithCacheable:lazyRefreshDescription:]([CAFCachedDescription alloc], "initWithCacheable:lazyRefreshDescription:", v7, 1);
    cachedDescription = v7->_cachedDescription;
    v7->_cachedDescription = v8;

  }
  return v7;
}

- (NSNumber)minimum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAFRange metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAFRange metaData](self, "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "minimum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v6;
}

- (NSNumber)maximum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAFRange metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAFRange metaData](self, "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "maximum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v6;
}

- (NSNumber)step
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAFRange metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAFRange metaData](self, "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "step");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v6;
}

- (NSArray)validValues
{
  void *v2;
  void *v3;

  -[CAFRange metaData](self, "metaData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[CAFRange validValues](self, "validValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFRange validValues](self, "validValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    return v7;
  }
  else
  {
    -[CAFRange minimum](self, "minimum");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "compare:", v9);

    -[CAFRange maximum](self, "maximum");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "compare:", v11);

    return v10 < 2 && (unint64_t)(v12 + 1) < 2;
  }
}

- (id)valueRoundedToNearestStepValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  int v22;
  _QWORD v23[2];
  int v24;
  _QWORD v25[2];
  int v26;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1520]), "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0, 0, 0, 0, 0);
  v6 = (void *)MEMORY[0x24BDD1518];
  -[CAFRange minimum](self, "minimum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "decimalValue");
  }
  else
  {
    v25[0] = 0;
    v25[1] = 0;
    v26 = 0;
  }
  objc_msgSend(v6, "decimalNumberWithDecimal:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD1518];
  -[CAFRange step](self, "step");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "decimalValue");
  }
  else
  {
    v23[0] = 0;
    v23[1] = 0;
    v24 = 0;
  }
  objc_msgSend(v10, "decimalNumberWithDecimal:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD1518];
  if (v4)
  {
    objc_msgSend(v4, "decimalValue");
  }
  else
  {
    v21[0] = 0;
    v21[1] = 0;
    v22 = 0;
  }
  objc_msgSend(v14, "decimalNumberWithDecimal:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "decimalNumberBySubtracting:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decimalNumberByDividingBy:withBehavior:", v13, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "decimalNumberByMultiplyingBy:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberByAdding:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFRange cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)minimum
{
  return &unk_250958740;
}

+ (id)maximum
{
  return &unk_250958740;
}

+ (id)step
{
  return &unk_250958758;
}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CAFRange validValues](self, "validValues", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[CAFRange validValues](self, "validValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_2508FF798;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[CAFRange minimum](self, "minimum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFRange maximum](self, "maximum");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFRange step](self, "step");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@[%@..%@]x%@"), v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CAFCharacteristicMetadata)metaData
{
  return self->_metaData;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

- (CAFFloatRange)floatRange
{
  CAFFloatRange *v3;
  void *v4;
  CAFFloatRange *v5;

  v3 = [CAFFloatRange alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFUInt8Range)uInt8Range
{
  CAFUInt8Range *v3;
  void *v4;
  CAFUInt8Range *v5;

  v3 = [CAFUInt8Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFInt32Range)int32Range
{
  CAFInt32Range *v3;
  void *v4;
  CAFInt32Range *v5;

  v3 = [CAFInt32Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFUInt32Range)uInt32Range
{
  CAFUInt32Range *v3;
  void *v4;
  CAFUInt32Range *v5;

  v3 = [CAFUInt32Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFUInt16Range)uInt16Range
{
  CAFUInt16Range *v3;
  void *v4;
  CAFUInt16Range *v5;

  v3 = [CAFUInt16Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

- (CAFInt8Range)int8Range
{
  CAFInt8Range *v3;
  void *v4;
  CAFInt8Range *v5;

  v3 = [CAFInt8Range alloc];
  -[CAFRange metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFRange initWithMetaData:](v3, "initWithMetaData:", v4);

  return v5;
}

@end
