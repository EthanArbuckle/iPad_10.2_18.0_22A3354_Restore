@implementation AXDataSeriesDescriptor

- (AXDataSeriesDescriptor)initWithName:(NSString *)name isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints
{
  _BOOL8 v6;
  NSString *v8;
  NSArray *v9;
  AXDataSeriesDescriptor *v10;
  AXDataSeriesDescriptor *v11;
  objc_super v13;

  v6 = isContinuous;
  v8 = name;
  v9 = dataPoints;
  v13.receiver = self;
  v13.super_class = (Class)AXDataSeriesDescriptor;
  v10 = -[AXDataSeriesDescriptor init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AXDataSeriesDescriptor setName:](v10, "setName:", v8);
    -[AXDataSeriesDescriptor _commonInitWithContinuous:dataPoints:](v11, "_commonInitWithContinuous:dataPoints:", v6, v9);
  }

  return v11;
}

- (AXDataSeriesDescriptor)initWithAttributedName:(NSAttributedString *)attributedName isContinuous:(BOOL)isContinuous dataPoints:(NSArray *)dataPoints
{
  _BOOL8 v6;
  NSAttributedString *v9;
  NSArray *v10;
  AXDataSeriesDescriptor *v11;
  AXDataSeriesDescriptor *v12;
  objc_super v14;

  v6 = isContinuous;
  v9 = attributedName;
  v10 = dataPoints;
  v14.receiver = self;
  v14.super_class = (Class)AXDataSeriesDescriptor;
  v11 = -[AXDataSeriesDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedName, attributedName);
    -[AXDataSeriesDescriptor _commonInitWithContinuous:dataPoints:](v12, "_commonInitWithContinuous:dataPoints:", v6, v10);
  }

  return v12;
}

- (AXDataSeriesDescriptor)initWithDictionary:(id)a3
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
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  AXDataSeriesDescriptor *v26;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  AXDataPoint *v49;
  _QWORD *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _Unwind_Exception *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;

  v4 = a3;
  getkAXMChartSeriesNameKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartSeriesContinuousKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v8, "BOOLValue");

  getkAXMChartSeriesXDataKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartSeriesYDataKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartSeriesZNumericDataKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartSeriesZCategoricalDataKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v17 = (_QWORD *)getkAXMChartSeriesLabelDataKeySymbolLoc_ptr;
  v68 = getkAXMChartSeriesLabelDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesLabelDataKeySymbolLoc_ptr)
  {
    v18 = (void *)AXMediaUtilitiesLibrary();
    v17 = dlsym(v18, "kAXMChartSeriesLabelDataKey");
    v66[3] = (uint64_t)v17;
    getkAXMChartSeriesLabelDataKeySymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v65, 8);
  if (!v17)
  {
    v54 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v65, 8);
    _Unwind_Resume(v54);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartSeriesValueDescriptionsKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v20);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v10, "count");
  if (v21 != objc_msgSend(v12, "count") && v12
    || (v22 = objc_msgSend(v10, "count"), v22 != objc_msgSend(v14, "count")) && v14
    || (v23 = objc_msgSend(v10, "count"), v23 != objc_msgSend(v16, "count")) && v16
    || (v24 = objc_msgSend(v10, "count"), v24 != objc_msgSend(v19, "count")) && v19)
  {
    AXAudioGraphLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[AXDataSeriesDescriptor initWithDictionary:].cold.2((uint64_t)v4, v25);
    v26 = 0;
    goto LABEL_15;
  }
  v62 = v19;
  v63 = v16;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", self, v6);
  v61 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v28 = 0;
    v29 = 0x24C1B7000uLL;
    v59 = v12;
    v60 = v10;
    v58 = v14;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v32 = *(void **)(v29 + 2352);
      objc_msgSend(v10, "objectAtIndexedSubscript:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v32, "valueWithCategory:", v33);
      }
      else
      {
        objc_msgSend(v33, "doubleValue");
        objc_msgSend(v32, "valueWithNumber:");
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v36 = *(void **)(v29 + 2352);
        objc_msgSend(v12, "objectAtIndexedSubscript:", v28);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        objc_msgSend(v36, "valueWithNumber:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_25;
      }
      else
      {
        v38 = 0;
        if (!v14)
        {
LABEL_25:
          v41 = 0;
          goto LABEL_26;
        }
      }
      v39 = *(void **)(v29 + 2352);
      objc_msgSend(v14, "objectAtIndexedSubscript:", v28);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      objc_msgSend(v39, "valueWithNumber:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
      if (v63)
      {
        v42 = *(void **)(v29 + 2352);
        objc_msgSend(v63, "objectAtIndexedSubscript:", v28);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "valueWithCategory:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(v64, "objectAtIndexedSubscript:", v28);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v41)
        objc_msgSend(v46, "addObject:", v41);
      if (v44)
        objc_msgSend(v47, "addObject:", v44);
      if (v62)
      {
        objc_msgSend(v62, "objectAtIndexedSubscript:", v28);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      v49 = -[AXDataPoint initWithX:y:additionalValues:label:]([AXDataPoint alloc], "initWithX:y:additionalValues:label:", v35, v38, v47, v48);
      -[AXDataPoint setValueDescription:](v49, "setValueDescription:", v45);
      -[NSObject addObject:](v61, "addObject:", v49);

      ++v28;
      v10 = v60;
      v14 = v58;
      v12 = v59;
      v29 = 0x24C1B7000;
    }
    while (v28 < objc_msgSend(v60, "count"));
  }
  v6 = v56;
  v25 = v61;
  v50 = (_QWORD *)objc_msgSend(v55, "initWithAttributedName:isContinuous:dataPoints:", v56, v57, v61);
  if (v50)
  {
    getkAXMChartSeriesMeanValueDescriptionKey();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v50[4];
    v50[4] = v52;

  }
  self = v50;
  v26 = self;
  v19 = v62;
  v16 = v63;
LABEL_15:

  return v26;
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
  -[AXDataSeriesDescriptor attributedName](self, "attributedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXDataSeriesDescriptor isContinuous](self, "isContinuous");
  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithAttributedName:isContinuous:dataPoints:", v5, v6, v7);

  return v8;
}

- (void)setName:(NSString *)name
{
  NSAttributedString *v4;
  NSAttributedString *attributedName;
  NSString *v6;

  v6 = name;
  if (v6)
  {
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v6);
    attributedName = self->_attributedName;
    self->_attributedName = v4;
  }
  else
  {
    attributedName = self->_attributedName;
    self->_attributedName = 0;
  }

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[AXDataSeriesDescriptor attributedName](self, "attributedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)meanYValue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "yValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "number");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  return v7 / (double)v12;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  AXDataSeriesDescriptor *v68;
  void *v69;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v66 = 0;
    v67 = 0;
    v68 = self;
    v69 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "valueDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v14);

      if (v63)
      {
        objc_msgSend(v13, "xValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "category");
      }
      else
      {
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v13, "xValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "number");
        objc_msgSend(v16, "numberWithDouble:");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v17);

      objc_msgSend(v13, "yValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (uint64_t)v67;
        if (!v67)
        {
          -[AXDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](self, "_mutableArrayOfNSNullWithCount:", v9);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)MEMORY[0x24BDD16E0];
        v21 = (void *)v19;
        objc_msgSend(v13, "yValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "number");
        objc_msgSend(v20, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v21;
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
        self = v68;
        v46 = v66;
        if (!v66)
        {
          -[AXDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v68, "_mutableArrayOfNSNullWithCount:", v9);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "label");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v46;
        objc_msgSend(v46, "addObject:", v47);

      }
      else
      {
        self = v68;
      }

      ++v9;
      -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
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
          -[AXDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v68, "_mutableArrayOfNSNullWithCount:", v9);
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
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
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
        v33 = v69;
        if (!v69)
        {
          -[AXDataSeriesDescriptor _mutableArrayOfNSNullWithCount:](v68, "_mutableArrayOfNSNullWithCount:", v9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "additionalValues");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v26);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "number");
        v37 = v36;

        v69 = v33;
        if (v37 == 9.22337204e18)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v32);
        }
        else
        {
          v39 = (void *)MEMORY[0x24BDD16E0];
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
  v66 = 0;
  v67 = 0;
  v8 = 0;
  v69 = 0;
LABEL_41:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDataSeriesDescriptor attributedName](self, "attributedName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartSeriesNameKey();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, v52);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXDataSeriesDescriptor isContinuous](self, "isContinuous"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartSeriesContinuousKey();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v53, v54);

  getkAXMChartSeriesXDataKey();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v65, v55);

  getkAXMChartSeriesYDataKey();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v67, v56);

  getkAXMChartSeriesZNumericDataKey();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v69, v57);

  getkAXMChartSeriesZCategoricalDataKey();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v8, v58);

  getkAXMChartSeriesValueDescriptionsKey();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v64, v59);

  -[AXDataSeriesDescriptor meanValueDescription](self, "meanValueDescription");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartSeriesMeanValueDescriptionKey();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v60, v61);

  return v50;
}

- (id)_mutableArrayOfNSNullWithCount:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      --a3;
    }
    while (a3);
  }
  return v4;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXDataSeriesDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXDataSeriesDescriptor isContinuous](self, "isContinuous"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[AXDataSeriesDescriptor dataPoints](self, "dataPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ continuous=%@ points=%@>"), v4, self, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
  objc_setProperty_nonatomic_copy(self, a2, attributedName, 16);
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)isContinuous
{
  self->_isContinuous = isContinuous;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(NSArray *)dataPoints
{
  objc_setProperty_nonatomic_copy(self, a2, dataPoints, 24);
}

- (NSString)meanValueDescription
{
  return self->_meanValueDescription;
}

- (void)setMeanValueDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanValueDescription, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_209557000, a2, OS_LOG_TYPE_FAULT, "Data is not aligned: %@", (uint8_t *)&v2, 0xCu);
}

@end
