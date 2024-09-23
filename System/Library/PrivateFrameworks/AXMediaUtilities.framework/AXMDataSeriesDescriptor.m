@implementation AXMDataSeriesDescriptor

- (AXMDataSeriesDescriptor)initWithName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  AXMDataSeriesDescriptor *v10;
  AXMDataSeriesDescriptor *v11;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXMDataSeriesDescriptor;
  v10 = -[AXMDataSeriesDescriptor init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AXMDataSeriesDescriptor setName:](v10, "setName:", v8);
    -[AXMDataSeriesDescriptor _commonInitWithContinuous:dataPoints:](v11, "_commonInitWithContinuous:dataPoints:", v6, v9);
  }

  return v11;
}

- (AXMDataSeriesDescriptor)initWithAttributedName:(id)a3 isContinuous:(BOOL)a4 dataPoints:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  AXMDataSeriesDescriptor *v11;
  AXMDataSeriesDescriptor *v12;
  objc_super v14;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXMDataSeriesDescriptor;
  v11 = -[AXMDataSeriesDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedName, a3);
    -[AXMDataSeriesDescriptor _commonInitWithContinuous:dataPoints:](v12, "_commonInitWithContinuous:dataPoints:", v6, v10);
  }

  return v12;
}

- (AXMDataSeriesDescriptor)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AXMDataSeriesDescriptor *v17;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  AXMDataPoint *v36;
  AXMDataSeriesDescriptor *v37;
  uint64_t v38;
  NSString *meanValueDescription;
  void *v40;
  AXMDataSeriesDescriptor *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesNameKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesContinuousKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesXDataKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesYDataKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesZNumericDataKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesZCategoricalDataKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesLabelDataKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesValueDescriptionsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "count");
  if (v14 != objc_msgSend(v10, "count") && v10
    || (v15 = objc_msgSend(v9, "count"), v15 != objc_msgSend(v11, "count")) && v11
    || (v16 = objc_msgSend(v9, "count"), v16 != objc_msgSend(v12, "count")) && v12)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v49 = v13;
  v19 = objc_msgSend(v9, "count");
  if (v19 != objc_msgSend(v50, "count") && v50)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v47 = v12;
  v40 = v7;
  v41 = self;
  v42 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v20 = 0;
    v45 = v10;
    v46 = v9;
    v44 = v11;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if ((isKindOfClass & 1) != 0)
      {
        +[AXMDataPointValue valueWithCategory:](AXMDataPointValue, "valueWithCategory:", v23);
      }
      else
      {
        objc_msgSend(v23, "doubleValue");
        +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_24;
      }
      else
      {
        v27 = 0;
        if (!v11)
        {
LABEL_24:
          v29 = 0;
          goto LABEL_25;
        }
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      +[AXMDataPointValue valueWithNumber:](AXMDataPointValue, "valueWithNumber:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
      if (v47)
      {
        objc_msgSend(v47, "objectAtIndexedSubscript:", v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMDataPointValue valueWithCategory:](AXMDataPointValue, "valueWithCategory:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(v49, "objectAtIndexedSubscript:", v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v29)
        objc_msgSend(v33, "addObject:", v29);
      if (v31)
        objc_msgSend(v34, "addObject:", v31);
      if (v50)
      {
        objc_msgSend(v50, "objectAtIndexedSubscript:", v20);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      v36 = -[AXMDataPoint initWithX:y:additionalValues:label:]([AXMDataPoint alloc], "initWithX:y:additionalValues:label:", v25, v27, v34, v35);
      -[AXMDataPoint setValueDescription:](v36, "setValueDescription:", v32);
      objc_msgSend(v48, "addObject:", v36);

      ++v20;
      v9 = v46;
      v11 = v44;
      v10 = v45;
    }
    while (v20 < objc_msgSend(v46, "count"));
  }
  v7 = v40;
  v37 = -[AXMDataSeriesDescriptor initWithAttributedName:isContinuous:dataPoints:](v41, "initWithAttributedName:isContinuous:dataPoints:", v40, v43, v48);
  v13 = v49;
  if (v37)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesMeanValueDescriptionKey"));
    v38 = objc_claimAutoreleasedReturnValue();
    meanValueDescription = v37->_meanValueDescription;
    v37->_meanValueDescription = (NSString *)v38;

  }
  self = v37;

  v17 = self;
  v5 = v42;
  v12 = v47;
LABEL_11:

  return v17;
}

- (void)_commonInitWithContinuous:(BOOL)a3 dataPoints:(id)a4
{
  NSArray *v5;
  NSArray *dataPoints;

  self->_isContinuous = a3;
  v5 = (NSArray *)objc_msgSend(a4, "copy");
  dataPoints = self->_dataPoints;
  self->_dataPoints = v5;

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXMDataSeriesDescriptor attributedName](self, "attributedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXMDataSeriesDescriptor isContinuous](self, "isContinuous");
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithAttributedName:isContinuous:dataPoints:", v5, v6, v7);

  return v8;
}

- (void)setName:(id)a3
{
  objc_class *v4;
  id v5;
  NSAttributedString *v6;
  NSAttributedString *attributedName;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithString:", v5);

    attributedName = self->_attributedName;
    self->_attributedName = v6;

  }
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[AXMDataSeriesDescriptor attributedName](self, "attributedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)minimumDataValueOnTimeAxis
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeEncodingValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "number");
  v9 = v8;

  return v9;
}

- (double)maximumDataValueOnTimeAxis
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeEncodingValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "number");
  v10 = v9;

  return v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  AXMDataSeriesDescriptor *v60;
  void *v61;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v58 = 0;
    v59 = 0;
    v60 = self;
    v61 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "valueDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v14);

      if (v55)
      {
        objc_msgSend(v13, "xValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "category");
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "xValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "number");
        objc_msgSend(v16, "numberWithDouble:");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v17);

      objc_msgSend(v13, "yValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (uint64_t)v59;
        if (!v59)
        {
          -[AXMDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](self, "_mutableArrayOfNSNullWithCount:", v9);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v21 = (void *)v19;
        objc_msgSend(v13, "yValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "number");
        objc_msgSend(v20, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v21;
        objc_msgSend(v21, "addObject:", v23);

      }
      objc_msgSend(v13, "additionalValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25)
        break;
LABEL_33:
      objc_msgSend(v13, "label");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "length");

      if (v45)
      {
        self = v60;
        v46 = v58;
        if (!v58)
        {
          -[AXMDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v60, "_mutableArrayOfNSNullWithCount:", v9);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "label");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v46;
        objc_msgSend(v46, "addObject:", v47);

      }
      else
      {
        self = v60;
      }

      ++v9;
      -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (v9 >= v49)
        goto LABEL_41;
    }
    v26 = 0;
    while (1)
    {
      objc_msgSend(v13, "additionalValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "category");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          v11 = v26;
        if (v26 != v11)
          goto LABEL_32;
        if (!v8)
        {
          -[AXMDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v60, "_mutableArrayOfNSNullWithCount:", v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "additionalValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "category");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v8, "addObject:", v32);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v38);

        }
        v11 = v26;
      }
      else
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          v10 = v26;
        if (v26 != v10)
          goto LABEL_32;
        v33 = v61;
        if (!v61)
        {
          -[AXMDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v60, "_mutableArrayOfNSNullWithCount:", v9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "additionalValues");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v26);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "number");
        v37 = v36;

        v61 = v33;
        if (v37 == 9.22337204e18)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v32);
        }
        else
        {
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v13, "additionalValues");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", v26);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "number");
          objc_msgSend(v39, "numberWithDouble:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v41);

        }
        v10 = v26;
      }

LABEL_32:
      ++v26;
      objc_msgSend(v13, "additionalValues");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v26 >= v43)
        goto LABEL_33;
    }
  }
  v58 = 0;
  v59 = 0;
  v8 = 0;
  v61 = 0;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSeriesDescriptor name](self, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, CFSTR("kAXMChartSeriesNameKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMDataSeriesDescriptor isContinuous](self, "isContinuous"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v52, CFSTR("kAXMChartSeriesContinuousKey"));

  objc_msgSend(v50, "setObject:forKeyedSubscript:", v57, CFSTR("kAXMChartSeriesXDataKey"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v59, CFSTR("kAXMChartSeriesYDataKey"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v61, CFSTR("kAXMChartSeriesZNumericDataKey"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v8, CFSTR("kAXMChartSeriesZCategoricalDataKey"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v56, CFSTR("kAXMChartSeriesValueDescriptionsKey"));
  -[AXMDataSeriesDescriptor meanValueDescription](self, "meanValueDescription");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v53, CFSTR("kAXMChartSeriesMeanValueDescriptionKey"));

  return v50;
}

- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      --a3;
    }
    while (a3);
  }
  return v4;
}

- (NSArray)xValues
{
  void *v2;
  void *v3;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_322);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __34__AXMDataSeriesDescriptor_xValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "xValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AXMDataPointValue emptyValue](AXMDataPointValue, "emptyValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSArray)yValues
{
  void *v2;
  void *v3;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_323);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __34__AXMDataSeriesDescriptor_yValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "yValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AXMDataPointValue emptyValue](AXMDataPointValue, "emptyValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSArray)additionalNumericalValues
{
  void *v2;
  void *v3;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_324);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __52__AXMDataSeriesDescriptor_additionalNumericalValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "zNumericAxisValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AXMDataPointValue emptyValue](AXMDataPointValue, "emptyValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSArray)additionalCategoricalValues
{
  void *v2;
  void *v3;

  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_325);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __54__AXMDataSeriesDescriptor_additionalCategoricalValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "zCategoryAxisValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[AXMDataPointValue emptyValue](AXMDataPointValue, "emptyValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)numericalValuesFromDataPointValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v3, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        ++v7;
      }
      while (v7 < objc_msgSend(v3, "count"));
    }
    v9 = objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_327);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

uint64_t __62__AXMDataSeriesDescriptor_numericalValuesFromDataPointValues___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "number");
  return objc_msgSend(v2, "numberWithDouble:");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMDataSeriesDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMDataSeriesDescriptor isContinuous](self, "isContinuous"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMDataSeriesDescriptor dataPoints](self, "dataPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ continuous=%@ points=%@>"), v4, self, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setDataSummary:(id)a3
{
  objc_storeStrong((id *)&self->_dataSummary, a3);
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AXMDataSummary)dataSummary
{
  return self->_dataSummary;
}

- (NSString)meanValueDescription
{
  return self->_meanValueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanValueDescription, 0);
  objc_storeStrong((id *)&self->_dataSummary, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
}

@end
