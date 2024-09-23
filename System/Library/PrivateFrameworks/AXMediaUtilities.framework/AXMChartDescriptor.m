@implementation AXMChartDescriptor

- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7
{
  return -[AXMChartDescriptor initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", a3, a4, a5, a6, 0, a7);
}

- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 series:(id)a7
{
  return -[AXMChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", a3, a4, a5, a6, 0, a7);
}

- (AXMChartDescriptor)initWithTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AXMChartDescriptor *v20;
  uint64_t v21;
  NSAttributedString *attributedTitle;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AXMChartDescriptor;
  v20 = -[AXMChartDescriptor init](&v24, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
    attributedTitle = v20->_attributedTitle;
    v20->_attributedTitle = (NSAttributedString *)v21;

    -[AXMChartDescriptor _commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v20, "_commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v15, v16, v17, v18, v19);
  }

  return v20;
}

- (AXMChartDescriptor)initWithAttributedTitle:(id)a3 summary:(id)a4 xAxisDescriptor:(id)a5 yAxisDescriptor:(id)a6 additionalAxes:(id)a7 series:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AXMChartDescriptor *v21;
  AXMChartDescriptor *v22;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AXMChartDescriptor;
  v21 = -[AXMChartDescriptor init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_attributedTitle, a3);
    -[AXMChartDescriptor _commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v22, "_commonInitWithSummary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v16, v17, v18, v19, v20);
  }

  return v22;
}

- (AXMChartDescriptor)initWithDictionary:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  AXMNumericDataAxisDescriptor *v18;
  uint64_t v19;
  uint64_t i;
  AXMNumericDataAxisDescriptor *v21;
  void *v22;
  char v23;
  AXMNumericDataAxisDescriptor *v24;
  AXMNumericDataAxisDescriptor *v25;
  void *v26;
  int v27;
  AXMNumericDataAxisDescriptor *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  AXMNumericDataAxisDescriptor *v32;
  AXMCategoricalDataAxisDescriptor *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  AXMDataSeriesDescriptor *v42;
  AXMChartDescriptor *v43;
  AXMNumericDataAxisDescriptor *v45;
  void *v46;
  AXMNumericDataAxisDescriptor *v47;
  uint64_t v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id obj;
  AXMNumericDataAxisDescriptor *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartTitleKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v3;
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
    v51 = v5;
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartSummaryKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartContentDirectionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartContentFrameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AXMRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartXAxisKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartYAxisKey"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartAdditionalAxesKey"));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (!v16)
  {
    v18 = 0;
    v57 = 0;
    goto LABEL_20;
  }
  v17 = v16;
  v18 = 0;
  v57 = 0;
  v19 = *(_QWORD *)v63;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v63 != v19)
        objc_enumerationMutation(obj);
      v21 = *(AXMNumericDataAxisDescriptor **)(*((_QWORD *)&v62 + 1) + 8 * i);
      -[AXMNumericDataAxisDescriptor objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("numeric"));

      if ((v23 & 1) != 0)
      {
        v24 = v57;
        v25 = v18;
        v57 = v21;
      }
      else
      {
        -[AXMNumericDataAxisDescriptor objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("categorical"));

        v24 = v18;
        v25 = v21;
        if (!v27)
          continue;
      }
      v28 = v21;

      v18 = v25;
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  }
  while (v17);
LABEL_20:
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kAXMChartSeriesKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "isEqualToString:", CFSTR("categorical"));
  v31 = (objc_class *)objc_opt_class();

  v46 = (void *)objc_msgSend([v31 alloc], "initWithDictionary:", v54);
  if (v53)
    v47 = -[AXMNumericDataAxisDescriptor initWithDictionary:]([AXMNumericDataAxisDescriptor alloc], "initWithDictionary:", v53);
  else
    v47 = 0;
  v32 = v57;
  if (v57)
    v32 = -[AXMNumericDataAxisDescriptor initWithDictionary:]([AXMNumericDataAxisDescriptor alloc], "initWithDictionary:", v57);
  if (v18)
    v33 = -[AXMCategoricalDataAxisDescriptor initWithDictionary:]([AXMCategoricalDataAxisDescriptor alloc], "initWithDictionary:", v18);
  else
    v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v32)
    objc_msgSend(v34, "addObject:", v32);
  if (v33)
    objc_msgSend(v35, "addObject:", v33);
  v45 = v32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v37 = v29;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v59 != v40)
          objc_enumerationMutation(v37);
        v42 = -[AXMDataSeriesDescriptor initWithDictionary:]([AXMDataSeriesDescriptor alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
        objc_msgSend(v36, "addObject:", v42);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v39);
  }

  v43 = -[AXMChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](self, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v51, v50, v46, v47, v35, v36);
  -[AXMChartDescriptor setContentDirection:](v43, "setContentDirection:", v48);
  -[AXMChartDescriptor setContentFrame:](v43, "setContentFrame:", v9, v11, v13, v15);

  return v43;
}

- (void)_commonInitWithSummary:(id)a3 xAxisDescriptor:(id)a4 yAxisDescriptor:(id)a5 additionalAxes:(id)a6 series:(id)a7
{
  AXMDataAxisDescriptor *v12;
  AXMNumericDataAxisDescriptor *v13;
  id v14;
  id v15;
  NSString *v16;
  NSString *summary;
  AXMDataAxisDescriptor *xAxis;
  AXMNumericDataAxisDescriptor *yAxis;
  AXMNumericDataAxisDescriptor *v20;
  NSArray *v21;
  NSArray *additionalAxes;
  NSArray *v23;
  NSArray *series;
  AXMDataAxisDescriptor *v25;

  v12 = (AXMDataAxisDescriptor *)a4;
  v13 = (AXMNumericDataAxisDescriptor *)a5;
  v14 = a7;
  v15 = a6;
  v16 = (NSString *)objc_msgSend(a3, "copy");
  summary = self->_summary;
  self->_summary = v16;

  xAxis = self->_xAxis;
  self->_xAxis = v12;
  v25 = v12;

  yAxis = self->_yAxis;
  self->_yAxis = v13;
  v20 = v13;

  v21 = (NSArray *)objc_msgSend(v15, "copy");
  additionalAxes = self->_additionalAxes;
  self->_additionalAxes = v21;

  v23 = (NSArray *)objc_msgSend(v14, "copy");
  series = self->_series;
  self->_series = v23;

}

- (id)copyWithZone:(_NSZone *)a3
{
  AXMChartDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXMChartDescriptor *v11;

  v4 = +[AXMChartDescriptor allocWithZone:](AXMChartDescriptor, "allocWithZone:", a3);
  -[AXMChartDescriptor attributedTitle](self, "attributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor xAxis](self, "xAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor yAxis](self, "yAxis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor additionalAxes](self, "additionalAxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor series](self, "series");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AXMChartDescriptor initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:](v4, "initWithAttributedTitle:summary:xAxisDescriptor:yAxisDescriptor:additionalAxes:series:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXMChartDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
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
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor xAxis](self, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMChartDescriptor yAxis](self, "yAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[AXMChartDescriptor additionalAxes](self, "additionalAxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[AXMChartDescriptor series](self, "series");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v19), "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  -[AXMChartDescriptor title](self, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("kAXMChartTitleKey"));

  -[AXMChartDescriptor summary](self, "summary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("kAXMChartSummaryKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMChartDescriptor contentDirection](self, "contentDirection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("kAXMChartContentDirectionKey"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("kAXMChartXAxisKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kAXMChartYAxisKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kAXMChartAdditionalAxesKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("kAXMChartSeriesKey"));

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

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor xAxis](self, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[AXMChartDescriptor yAxis](self, "yAxis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXMChartDescriptor yAxis](self, "yAxis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXMChartDescriptor additionalAxes](self, "additionalAxes");
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

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_opt_class();
  -[AXMChartDescriptor title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor summary](self, "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMChartDescriptor series](self, "series");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p\n\ttitle=%@\n\tsummary=%@\n\tAxes:\n\t%@Series:\n\t%@>"), v13, self, v14, v15, v3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (void)generateDataSummariesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AXMDataSummary *v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXMChartDescriptor series](self, "series");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = -[AXMDataSummary initWithSeries:chartDescriptor:]([AXMDataSummary alloc], "initWithSeries:chartDescriptor:", v9, self);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __58__AXMChartDescriptor_generateDataSummariesWithCompletion___block_invoke;
        v11[3] = &unk_1E625EE18;
        v13 = v18;
        v11[4] = self;
        v12 = v4;
        -[AXMDataSummary computeRegressionModel:](v10, "computeRegressionModel:", v11);
        objc_msgSend(v9, "setDataSummary:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  _Block_object_dispose(v18, 8);
}

void __58__AXMChartDescriptor_generateDataSummariesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "series");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == objc_msgSend(v4, "count"))
  {
    v3 = *(_QWORD *)(a1 + 40);

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {

  }
}

- (AXMNumericDataAxisDescriptor)timeNumericAxisDescriptor
{
  AXMNumericDataAxisDescriptor *v3;
  void *v4;
  char v5;

  v3 = self->_timeNumericAxisDescriptor;
  if (!v3)
  {
    -[AXMChartDescriptor xAxis](self, "xAxis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCategoricalAxis");

    if ((v5 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      -[AXMChartDescriptor xAxis](self, "xAxis");
      v3 = (AXMNumericDataAxisDescriptor *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (AXMCategoricalDataAxisDescriptor)timeCategoricalAxisDescriptor
{
  AXMCategoricalDataAxisDescriptor *v3;
  void *v4;
  int v5;

  v3 = self->_timeCategoricalAxisDescriptor;
  if (!v3)
  {
    -[AXMChartDescriptor xAxis](self, "xAxis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCategoricalAxis");

    if (v5)
    {
      -[AXMChartDescriptor xAxis](self, "xAxis");
      v3 = (AXMCategoricalDataAxisDescriptor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (AXMNumericDataAxisDescriptor)pitchAxisDescriptor
{
  AXMNumericDataAxisDescriptor *pitchAxisDescriptor;

  pitchAxisDescriptor = self->_pitchAxisDescriptor;
  if (pitchAxisDescriptor)
    return pitchAxisDescriptor;
  -[AXMChartDescriptor yAxis](self, "yAxis");
  return (AXMNumericDataAxisDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

- (AXMNumericDataAxisDescriptor)durationAxisDescriptor
{
  AXMNumericDataAxisDescriptor *durationAxisDescriptor;

  durationAxisDescriptor = self->_durationAxisDescriptor;
  if (durationAxisDescriptor)
    return durationAxisDescriptor;
  -[AXMChartDescriptor zNumericAxisDescriptor](self, "zNumericAxisDescriptor");
  return (AXMNumericDataAxisDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

- (AXMNumericDataAxisDescriptor)volumeAxisDescriptor
{
  AXMNumericDataAxisDescriptor *volumeAxisDescriptor;

  volumeAxisDescriptor = self->_volumeAxisDescriptor;
  if (volumeAxisDescriptor)
    return volumeAxisDescriptor;
  -[AXMChartDescriptor zNumericAxisDescriptor](self, "zNumericAxisDescriptor");
  return (AXMNumericDataAxisDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

- (AXMCategoricalDataAxisDescriptor)timbreAxisDescriptor
{
  AXMCategoricalDataAxisDescriptor *timbreAxisDescriptor;

  timbreAxisDescriptor = self->_timbreAxisDescriptor;
  if (timbreAxisDescriptor)
    return timbreAxisDescriptor;
  -[AXMChartDescriptor zCategoricalAxisDescriptor](self, "zCategoricalAxisDescriptor");
  return (AXMCategoricalDataAxisDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)zNumericAxisDescriptor
{
  void *v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXMChartDescriptor additionalAxes](self, "additionalAxes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        if (!objc_msgSend(v6, "isCategoricalAxis"))
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

- (id)zCategoricalAxisDescriptor
{
  void *v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXMChartDescriptor additionalAxes](self, "additionalAxes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(v6, "isCategoricalAxis") & 1) != 0)
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

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)contentDirection
{
  return self->_contentDirection;
}

- (void)setContentDirection:(int64_t)a3
{
  self->_contentDirection = a3;
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

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSArray)series
{
  return self->_series;
}

- (void)setSeries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AXMDataAxisDescriptor)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)a3
{
  objc_storeStrong((id *)&self->_xAxis, a3);
}

- (AXMNumericDataAxisDescriptor)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(id)a3
{
  objc_storeStrong((id *)&self->_yAxis, a3);
}

- (NSArray)additionalAxes
{
  return self->_additionalAxes;
}

- (void)setAdditionalAxes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_additionalAxes, 0);
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_timbreAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_volumeAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_durationAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_pitchAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_timeCategoricalAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_timeNumericAxisDescriptor, 0);
}

@end
