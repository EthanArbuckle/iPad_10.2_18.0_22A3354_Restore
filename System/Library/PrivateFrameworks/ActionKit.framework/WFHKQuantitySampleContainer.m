@implementation WFHKQuantitySampleContainer

- (WFHKQuantitySampleContainer)initWithSample:(id)a3 unit:(id)a4
{
  id v6;
  id v7;
  WFHKQuantitySampleContainer *v8;
  WFHKQuantitySampleContainer *v9;
  WFHKQuantitySampleContainer *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFHKQuantitySampleContainer;
  v8 = -[WFHKQuantitySampleContainer init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WFHKQuantitySampleContainer setQuantitySample:](v8, "setQuantitySample:", v6);
    -[WFHKQuantitySampleContainer setUnit:](v9, "setUnit:", v7);
    v10 = v9;
  }

  return v9;
}

- (WFHKQuantitySampleContainer)initWithSubsamples:(id)a3 unit:(id)a4
{
  id v6;
  WFHKQuantitySampleContainer *v7;
  WFHKQuantitySampleContainer *v8;
  WFHKQuantitySampleContainer *v9;

  v6 = a3;
  v7 = -[WFHKQuantitySampleContainer initWithSample:unit:](self, "initWithSample:unit:", 0, a4);
  v8 = v7;
  if (v7)
  {
    -[WFHKQuantitySampleContainer setSubsamples:](v7, "setSubsamples:", v6);
    v9 = v8;
  }

  return v8;
}

- (NSArray)subcontainers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFHKQuantitySampleContainer subsamples](self, "subsamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WFHKQuantitySampleContainer_subcontainers__block_invoke;
  v6[3] = &unk_24F8B4E18;
  v6[4] = self;
  objc_msgSend(v3, "if_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (HKQuantitySample)quantitySample
{
  HKQuantitySample *quantitySample;
  HKQuantitySample *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  quantitySample = self->_quantitySample;
  if (quantitySample)
  {
    v3 = quantitySample;
  }
  else if (-[WFHKQuantitySampleContainer hasSubsamples](self, "hasSubsamples")
         && -[WFHKQuantitySampleContainer hasValue](self, "hasValue"))
  {
    -[WFHKQuantitySampleContainer subsamples](self, "subsamples");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKQuantitySampleContainer unit](self, "unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "quantity", (_QWORD)v32);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValueForUnit:", v6);
          v13 = v13 + v16;

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0.0;
    }

    objc_msgSend(v8, "quantityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "aggregationStyle");

    if (v18 == 1)
      v13 = v13 / (double)(unint64_t)objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v6, v13, (_QWORD)v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quantityType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("@min.startDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("@max.endDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isMaximumDurationRestricted")
      && (objc_msgSend(v20, "maximumAllowedDuration"),
          v24 = v23,
          objc_msgSend(v22, "timeIntervalSinceDate:", v21),
          v25 > v24)
      || objc_msgSend(v20, "isMinimumDurationRestricted")
      && (objc_msgSend(v20, "minimumAllowedDuration"),
          v27 = v26,
          objc_msgSend(v22, "timeIntervalSinceDate:", v21),
          v28 < v27))
    {
      v3 = 0;
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDD3E68];
      objc_msgSend(v8, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v20, v19, v21, v22, v30);
      v3 = (HKQuantitySample *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (BOOL)hasValue
{
  void *v2;
  BOOL v3;

  -[WFHKQuantitySampleContainer unit](self, "unit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)normalizedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[WFHKQuantitySampleContainer unit](self, "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKQuantitySampleContainer unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_normalizedDoubleValueForUnit:", v6);
  v8 = v7;

  return v8;
}

- (BOOL)hasSubsamples
{
  void *v2;
  BOOL v3;

  -[WFHKQuantitySampleContainer subsamples](self, "subsamples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFHKQuantitySampleContainer normalizedValue](self, "normalizedValue");
  v5 = v4;
  -[WFHKQuantitySampleContainer unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFHKQuantitySampleContainer %p> %.1f %@"), self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFHKQuantitySampleContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFHKQuantitySampleContainer *v11;
  WFHKQuantitySampleContainer *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantitySample"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("subsamples"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
    v11 = -[WFHKQuantitySampleContainer initWithSubsamples:unit:](self, "initWithSubsamples:unit:", v10, v5);
  else
    v11 = -[WFHKQuantitySampleContainer initWithSample:unit:](self, "initWithSample:unit:", v6, v5);
  v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[WFHKQuantitySampleContainer hasSubsamples](self, "hasSubsamples"))
  {
    -[WFHKQuantitySampleContainer subsamples](self, "subsamples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("subsamples");
  }
  else
  {
    -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("quantitySample");
  }
  objc_msgSend(v7, "encodeObject:forKey:", v4, v5);

  -[WFHKQuantitySampleContainer unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("unit"));

}

- (NSString)wfName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[WFHKQuantitySampleContainer unit](self, "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKQuantitySampleContainer unit](self, "unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_normalizedDoubleValueForUnit:", v6);
    v8 = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v9, "setNumberStyle:", 1);
    objc_msgSend(v9, "setUsesGroupingSeparator:", 0);
    v10 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$@ %2$@"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKQuantitySampleContainer unit](self, "unit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unitString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%@ Quantity Sample, no unit data"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quantityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v9, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v16;
}

- (NSArray)dataSamples
{
  void *v2;
  void *v3;

  -[WFHKQuantitySampleContainer subcontainers](self, "subcontainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_23509);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)updateValue:(id)a3 fromStatisticsOperation:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = (void *)MEMORY[0x24BDD3E50];
  v6 = a3;
  -[WFHKQuantitySampleContainer unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v9 = v8;

  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v7, v9);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD3E68];
  -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKQuantitySampleContainer quantitySample](self, "quantitySample");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quantitySampleWithType:quantity:startDate:endDate:", v11, v18, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKQuantitySampleContainer setQuantitySample:](self, "setQuantitySample:", v17);

}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (BOOL)canProvideDataSamples
{
  return self->_canProvideDataSamples;
}

- (void)setQuantitySample:(id)a3
{
  objc_storeStrong((id *)&self->_quantitySample, a3);
}

- (double)value
{
  return self->_value;
}

- (void)setSubcontainers:(id)a3
{
  objc_storeStrong((id *)&self->_subcontainers, a3);
}

- (NSArray)subsamples
{
  return self->_subsamples;
}

- (void)setSubsamples:(id)a3
{
  objc_storeStrong((id *)&self->_subsamples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsamples, 0);
  objc_storeStrong((id *)&self->_subcontainers, 0);
  objc_storeStrong((id *)&self->_quantitySample, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

id __42__WFHKQuantitySampleContainer_dataSamples__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = a2;
  objc_msgSend(v3, "quantitySample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValueForUnit:", v6);
  objc_msgSend(v2, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

WFHKQuantitySampleContainer *__44__WFHKQuantitySampleContainer_subcontainers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFHKQuantitySampleContainer *v4;
  void *v5;
  WFHKQuantitySampleContainer *v6;

  v3 = a2;
  v4 = [WFHKQuantitySampleContainer alloc];
  objc_msgSend(*(id *)(a1 + 32), "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFHKQuantitySampleContainer initWithSample:unit:](v4, "initWithSample:unit:", v3, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
