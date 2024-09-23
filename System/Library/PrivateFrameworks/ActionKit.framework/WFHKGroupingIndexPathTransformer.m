@implementation WFHKGroupingIndexPathTransformer

- (WFHKGroupingIndexPathTransformer)initWithGroupingOption:(int64_t)a3
{
  WFHKGroupingIndexPathTransformer *v4;
  WFHKGroupingIndexPathTransformer *v5;
  WFHKGroupingIndexPathTransformer *v6;

  v4 = -[WFHKGroupingIndexPathTransformer init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_groupingOption = a3;
    v6 = v4;
  }

  return v5;
}

- (WFHKGroupingIndexPathTransformer)init
{
  WFHKGroupingIndexPathTransformer *v2;
  uint64_t v3;
  NSCalendar *conversionCalendar;
  WFHKGroupingIndexPathTransformer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHKGroupingIndexPathTransformer;
  v2 = -[WFHKGroupingIndexPathTransformer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v3 = objc_claimAutoreleasedReturnValue();
    conversionCalendar = v2->_conversionCalendar;
    v2->_conversionCalendar = (NSCalendar *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)transformedValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WFHKGroupingIndexPathTransformer conversionCalendar](self, "conversionCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 24700, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    switch(-[WFHKGroupingIndexPathTransformer groupingOption](self, "groupingOption"))
    {
      case 1:
        v8 = (void *)MEMORY[0x24BDD15D8];
        v25[0] = objc_msgSend(v7, "year");
        v25[1] = objc_msgSend(v7, "month");
        v25[2] = objc_msgSend(v7, "day");
        v25[3] = objc_msgSend(v7, "hour");
        v25[4] = objc_msgSend(v7, "minute");
        v9 = v25;
        v10 = v8;
        v11 = 5;
        goto LABEL_13;
      case 2:
        v15 = (void *)MEMORY[0x24BDD15D8];
        v24[0] = objc_msgSend(v7, "year");
        v24[1] = objc_msgSend(v7, "month");
        v24[2] = objc_msgSend(v7, "day");
        v24[3] = objc_msgSend(v7, "hour");
        v9 = v24;
        v10 = v15;
        v11 = 4;
        goto LABEL_13;
      case 3:
        v13 = (void *)MEMORY[0x24BDD15D8];
        v23[0] = objc_msgSend(v7, "year");
        v23[1] = objc_msgSend(v7, "month");
        v23[2] = objc_msgSend(v7, "day");
        v9 = v23;
        v10 = v13;
        v11 = 3;
        goto LABEL_13;
      case 4:
        v14 = (void *)MEMORY[0x24BDD15D8];
        v22[0] = objc_msgSend(v7, "yearForWeekOfYear");
        v22[1] = objc_msgSend(v7, "weekOfYear");
        v9 = v22;
        goto LABEL_11;
      case 5:
        v14 = (void *)MEMORY[0x24BDD15D8];
        v21[0] = objc_msgSend(v7, "year");
        v21[1] = objc_msgSend(v7, "month");
        v9 = v21;
        goto LABEL_11;
      case 6:
        v14 = (void *)MEMORY[0x24BDD15D8];
        v20[0] = objc_msgSend(v7, "year");
        v16 = (double)objc_msgSend(v7, "month") / 3.0;
        v20[1] = vcvtps_u32_f32(v16);
        v9 = v20;
LABEL_11:
        v10 = v14;
        v11 = 2;
        goto LABEL_13;
      case 7:
        v17 = (void *)MEMORY[0x24BDD15D8];
        v19 = objc_msgSend(v7, "year");
        v9 = &v19;
        v10 = v17;
        v11 = 1;
LABEL_13:
        objc_msgSend(v10, "indexPathWithIndexes:length:", v9, v11, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v12 = 0;
        break;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    switch(-[WFHKGroupingIndexPathTransformer groupingOption](self, "groupingOption"))
    {
      case 1:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "indexAtPosition:", 2));
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "indexAtPosition:", 3));
        objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "indexAtPosition:", 4));
        goto LABEL_13;
      case 2:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "indexAtPosition:", 2));
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "indexAtPosition:", 3));
        goto LABEL_13;
      case 3:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        v8 = objc_msgSend(v5, "indexAtPosition:", 2);
        v9 = v6;
        goto LABEL_10;
      case 4:
        objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "indexAtPosition:", 1));
        objc_msgSend(v6, "setWeekday:", 1);
        goto LABEL_13;
      case 5:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        v9 = v6;
        v8 = 1;
LABEL_10:
        objc_msgSend(v9, "setDay:", v8);
        goto LABEL_13;
      case 6:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", 3 * objc_msgSend(v5, "indexAtPosition:", 1) - 2);
        goto LABEL_13;
      case 7:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
LABEL_13:
        -[WFHKGroupingIndexPathTransformer conversionCalendar](self, "conversionCalendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateFromComponents:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v7 = 0;
        break;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)groupingOption
{
  return self->_groupingOption;
}

- (void)setGroupingOption:(int64_t)a3
{
  self->_groupingOption = a3;
}

- (NSCalendar)conversionCalendar
{
  return self->_conversionCalendar;
}

- (void)setConversionCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_conversionCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionCalendar, 0);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
