@implementation AXChartDescriptor

- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series
{
  return -[AXChartDescriptor initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", title, summary, xAxis, yAxis, 0, series);
}

- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis series:(NSArray *)series
{
  return -[AXChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", attributedTitle, summary, xAxis, yAxis, 0, series);
}

- (AXChartDescriptor)initWithTitle:(NSString *)title summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series
{
  NSString *v14;
  NSString *v15;
  id v16;
  AXNumericDataAxisDescriptor *v17;
  NSArray *v18;
  NSArray *v19;
  AXChartDescriptor *v20;
  AXChartDescriptor *v21;
  objc_super v23;

  v14 = title;
  v15 = summary;
  v16 = xAxis;
  v17 = yAxis;
  v18 = additionalAxes;
  v19 = series;
  v23.receiver = self;
  v23.super_class = (Class)AXChartDescriptor;
  v20 = -[AXChartDescriptor init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[AXChartDescriptor setTitle:](v20, "setTitle:", v14);
    -[AXChartDescriptor _commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v21, "_commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v15, v16, v17, v18, v19);
  }

  return v21;
}

- (AXChartDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle summary:(NSString *)summary xAxisDescriptor:(id)xAxis yAxisDescriptor:(AXNumericDataAxisDescriptor *)yAxis additionalAxes:(NSArray *)additionalAxes series:(NSArray *)series
{
  NSAttributedString *v15;
  NSString *v16;
  id v17;
  AXNumericDataAxisDescriptor *v18;
  NSArray *v19;
  NSArray *v20;
  AXChartDescriptor *v21;
  AXChartDescriptor *v22;
  objc_super v24;

  v15 = attributedTitle;
  v16 = summary;
  v17 = xAxis;
  v18 = yAxis;
  v19 = additionalAxes;
  v20 = series;
  v24.receiver = self;
  v24.super_class = (Class)AXChartDescriptor;
  v21 = -[AXChartDescriptor init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_attributedTitle, attributedTitle);
    -[AXChartDescriptor _commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v22, "_commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v16, v17, v18, v19, v20);
  }

  return v22;
}

- (AXChartDescriptor)initWithDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  AXDataSeriesDescriptor *v53;
  AXChartDescriptor *v54;
  uint64_t v56;
  AXNumericDataAxisDescriptor *v58;
  void *v59;
  void *v60;
  void *v61;
  AXCategoricalDataAxisDescriptor *v62;
  AXNumericDataAxisDescriptor *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  getkAXMChartTitleKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartSummaryKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartContentDirectionKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v8 = (_QWORD *)getkAXMChartContentFrameKeySymbolLoc_ptr;
  v79 = getkAXMChartContentFrameKeySymbolLoc_ptr;
  if (!getkAXMChartContentFrameKeySymbolLoc_ptr)
  {
    v9 = (void *)AXMediaUtilitiesLibrary();
    v8 = dlsym(v9, "kAXMChartContentFrameKey");
    v77[3] = (uint64_t)v8;
    getkAXMChartContentFrameKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v76, 8);
  if (!v8)
  {
    AXAnimatedImagesEnabled_cold_1();
    __break(1u);
  }
  v56 = v7;
  objc_msgSend(v66, "objectForKeyedSubscript:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AXMRectValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  getkAXMChartXAxisKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v19);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartYAxisKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v20);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartAdditionalAxesKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v22;
  v23 = 0;
  v24 = 0;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        getkAXMChartAxisTypeKey();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        getkAXMChartAxisTypeNumeric();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        if ((v32 & 1) != 0)
        {
          v33 = v24;
          v34 = v23;
          v24 = v28;
        }
        else
        {
          getkAXMChartAxisTypeKey();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          getkAXMChartAxisTypeCategorical();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqualToString:", v37);

          v33 = v23;
          v34 = v28;
          if (!v38)
            continue;
        }
        v39 = v28;

        v23 = v34;
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v25);
  }

  getkAXMChartSeriesKey();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  getkAXMChartAxisTypeKey();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartAxisTypeCategorical();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "isEqualToString:", v44);
  v45 = (objc_class *)objc_opt_class();

  v59 = (void *)objc_msgSend([v45 alloc], "initWithDictionary:", v65);
  if (v64)
  {
    v58 = -[AXNumericDataAxisDescriptor initWithDictionary:]([AXNumericDataAxisDescriptor alloc], "initWithDictionary:", v64);
    if (v24)
      goto LABEL_17;
LABEL_20:
    v63 = 0;
    if (v23)
      goto LABEL_18;
    goto LABEL_21;
  }
  v58 = 0;
  if (!v24)
    goto LABEL_20;
LABEL_17:
  v63 = -[AXNumericDataAxisDescriptor initWithDictionary:]([AXNumericDataAxisDescriptor alloc], "initWithDictionary:", v24);
  if (v23)
  {
LABEL_18:
    v62 = -[AXCategoricalDataAxisDescriptor initWithDictionary:]([AXCategoricalDataAxisDescriptor alloc], "initWithDictionary:", v23);
    goto LABEL_22;
  }
LABEL_21:
  v62 = 0;
LABEL_22:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v63)
    objc_msgSend(v46, "addObject:", v63);
  if (v62)
    objc_msgSend(v47, "addObject:", v62);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v49 = v41;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v69 != v51)
          objc_enumerationMutation(v49);
        v53 = -[AXDataSeriesDescriptor initWithDictionary:]([AXDataSeriesDescriptor alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
        objc_msgSend(v48, "addObject:", v53);

      }
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v50);
  }

  v54 = -[AXChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v61, v60, v59, v58, v47, v48);
  -[AXChartDescriptor setContentDirection:](v54, "setContentDirection:", v56);
  -[AXChartDescriptor setContentFrame:](v54, "setContentFrame:", v12, v14, v16, v18);

  return v54;
}

- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSUUID *v17;
  NSUUID *identifier;
  NSString *v19;
  NSString *summary;
  NSArray *v21;
  NSArray *additionalAxes;
  NSArray *v23;
  NSArray *series;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void (**v31)(_QWORD);
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v17;

  v19 = (NSString *)objc_msgSend(v12, "copy");
  summary = self->_summary;
  self->_summary = v19;

  objc_storeStrong((id *)&self->_xAxis, a4);
  objc_storeStrong((id *)&self->_yAxis, a5);
  v21 = (NSArray *)objc_msgSend(v15, "copy");
  additionalAxes = self->_additionalAxes;
  self->_additionalAxes = v21;

  v23 = (NSArray *)objc_msgSend(v16, "copy");
  series = self->_series;
  self->_series = v23;

  if (v14)
  {
    v33 = v13;
    v34 = v12;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v29);
          objc_msgSend(v14, "valueDescriptionProvider", v33, v34, (_QWORD)v35);
          v31 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "meanYValue");
          v31[2](v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "length"))
            objc_msgSend(v30, "setMeanValueDescription:", v32);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v27);
    }

    v13 = v33;
    v12 = v34;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  AXChartDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXChartDescriptor *v11;

  v4 = +[AXChartDescriptor allocWithZone:](AXChartDescriptor, "allocWithZone:", a3);
  -[AXChartDescriptor attributedTitle](self, "attributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor xAxis](self, "xAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor yAxis](self, "yAxis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor additionalAxes](self, "additionalAxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor series](self, "series");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AXChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v4, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXChartDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(NSString *)title
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;
  NSString *v6;

  v6 = title;
  if (v6)
  {
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v6);
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;
  }
  else
  {
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = 0;
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[AXChartDescriptor computeValueDescriptionsIfNeeded](self, "computeValueDescriptionsIfNeeded");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor xAxis](self, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXChartDescriptor yAxis](self, "yAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[AXChartDescriptor additionalAxes](self, "additionalAxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v12), "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[AXChartDescriptor series](self, "series");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19), "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v17);
  }

  -[AXChartDescriptor attributedTitle](self, "attributedTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartTitleKey();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, v22);

  -[AXChartDescriptor summary](self, "summary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartSummaryKey();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, v24);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AXChartDescriptor contentDirection](self, "contentDirection"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartContentDirectionKey();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, v26);

  getkAXMChartXAxisKey();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, v27);

  getkAXMChartYAxisKey();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v28);

  getkAXMChartAdditionalAxesKey();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v29);

  getkAXMChartSeriesKey();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v30);

  return v3;
}

- (void)computeValueDescriptionsIfNeeded
{
  AXChartDescriptor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  AXChartDescriptor *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x24BDAC8D0];
  -[AXChartDescriptor series](self, "series");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[AXChartDescriptor series](v2, "series");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v47;
      v36 = v2;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(obj);
          v34 = v8;
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v8), "dataPoints");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v35 = v9;
          v38 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v38)
          {
            v37 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v43 != v37)
                  objc_enumerationMutation(v35);
                v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                -[AXChartDescriptor xAxis](v2, "xAxis");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[AXChartDescriptor xAxis](v2, "xAxis");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v13 = 0;
                }

                -[AXChartDescriptor yAxis](v2, "yAxis");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXChartDescriptor _additionalNumericAxis](v2, "_additionalNumericAxis");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v13;
                if (v13)
                {
                  objc_msgSend(v13, "valueDescriptionProvider");
                  v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "xValue");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "number");
                  v16[2](v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  objc_msgSend(v11, "xValue");
                  v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "category");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(v14, "valueDescriptionProvider");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                v40 = v14;
                if (v19)
                {
                  objc_msgSend(v14, "valueDescriptionProvider");
                  v20 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "yValue");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "number");
                  v20[2](v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v22 = 0;
                }
                objc_msgSend(v11, "_additionalNumericValue");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v15;
                if (v23)
                {
                  objc_msgSend(v15, "valueDescriptionProvider");
                  v24 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "doubleValue");
                  v24[2](v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v25 = 0;
                }
                objc_msgSend(v11, "_additionalCategoricalValue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "label");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v28;
                if (v27)
                  objc_msgSend(v28, "addObject:", v27);
                if (v18)
                  objc_msgSend(v29, "addObject:", v18);
                if (v22)
                  objc_msgSend(v29, "addObject:", v22);
                if (v25)
                  objc_msgSend(v29, "addObject:", v25);
                if (v26)
                  objc_msgSend(v29, "addObject:", v26);
                objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setValueDescription:", v30);

                v2 = v36;
              }
              v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            }
            while (v38);
          }

          v8 = v34 + 1;
        }
        while (v34 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v33);
    }

  }
}

- (id)_additionalNumericAxis
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[AXChartDescriptor additionalAxes](self, "additionalAxes");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_additionalCategoricalAxis
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[AXChartDescriptor additionalAxes](self, "additionalAxes");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor xAxis](self, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[AXChartDescriptor yAxis](self, "yAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXChartDescriptor yAxis](self, "yAxis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXChartDescriptor additionalAxes](self, "additionalAxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = objc_opt_class();
  -[AXChartDescriptor title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor summary](self, "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXChartDescriptor series](self, "series");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p\n\ttitle=%@\n\tsummary=%@\n\tAxes:\n\t%@Series:\n\t%@>"), v13, self, v14, v15, v3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  objc_setProperty_nonatomic_copy(self, a2, attributedTitle, 8);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
  objc_setProperty_nonatomic_copy(self, a2, summary, 16);
}

- (AXChartDescriptorContentDirection)contentDirection
{
  return self->_contentDirection;
}

- (void)setContentDirection:(AXChartDescriptorContentDirection)contentDirection
{
  self->_contentDirection = contentDirection;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)contentFrame
{
  self->_contentFrame = contentFrame;
}

- (NSArray)series
{
  return self->_series;
}

- (void)setSeries:(NSArray *)series
{
  objc_setProperty_nonatomic_copy(self, a2, series, 32);
}

- (id)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)xAxis
{
  objc_storeStrong((id *)&self->_xAxis, xAxis);
}

- (AXNumericDataAxisDescriptor)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(AXNumericDataAxisDescriptor *)yAxis
{
  objc_storeStrong((id *)&self->_yAxis, yAxis);
}

- (NSArray)additionalAxes
{
  return self->_additionalAxes;
}

- (void)setAdditionalAxes:(NSArray *)additionalAxes
{
  objc_setProperty_nonatomic_copy(self, a2, additionalAxes, 56);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_additionalAxes, 0);
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
