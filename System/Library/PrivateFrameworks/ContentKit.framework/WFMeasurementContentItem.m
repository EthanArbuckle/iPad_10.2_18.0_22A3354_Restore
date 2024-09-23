@implementation WFMeasurementContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Scripting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFLocalizedString(CFSTR("Measurement"));
}

+ (id)pluralTypeDescription
{
  return WFLocalizedString(CFSTR("Measurements"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Measurements"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 5;
}

- (NSMeasurement)measurement
{
  return (NSMeasurement *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  WFQuantityValue *v27;
  void *v28;
  void *v29;
  void *v30;
  WFQuantityValue *v31;
  _QWORD v32[2];
  int v33;

  if ((Class)objc_opt_class() == a3)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1668]);
    objc_msgSend(v8, "setUnitOptions:", 1);
    -[WFMeasurementContentItem measurement](self, "measurement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_preferredValueRounding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFMeasurementContentItem measurement](self, "measurement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "wf_preferredValueRounding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");
      objc_msgSend(v8, "numberFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaximumFractionDigits:", v13);

    }
    -[WFMeasurementContentItem measurement](self, "measurement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromMeasurement:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((Class)objc_opt_class() == a3)
    {
      v18 = (void *)MEMORY[0x24BDD16E0];
      -[WFMeasurementContentItem measurement](self, "measurement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      return v21;
    }
    if ((Class)objc_opt_class() != a3)
      return 0;
    v22 = (void *)MEMORY[0x24BDD1518];
    v23 = (void *)MEMORY[0x24BDD16E0];
    -[WFMeasurementContentItem measurement](self, "measurement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v23, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "decimalValue");
    }
    else
    {
      v32[0] = 0;
      v32[1] = 0;
      v33 = 0;
    }
    objc_msgSend(v22, "decimalNumberWithDecimal:", v32);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v27 = [WFQuantityValue alloc];
    -[WFMeasurementContentItem measurement](self, "measurement");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "symbol");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[WFQuantityValue initWithMagnitude:unitString:](v27, "initWithMagnitude:unitString:", v8, v30);

    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (BOOL)alwaysEncodeUsingWFSerializableContent
{
  return 1;
}

@end
