@implementation AXNumericDataAxisDescriptor

- (AXNumericDataAxisDescriptor)initWithTitle:(NSString *)title lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider
{
  NSString *v12;
  NSArray *v13;
  void *v14;
  AXNumericDataAxisDescriptor *v15;
  AXNumericDataAxisDescriptor *v16;
  const __CFString *v17;
  objc_super v19;

  v12 = title;
  v13 = gridlinePositions;
  v14 = valueDescriptionProvider;
  v19.receiver = self;
  v19.super_class = (Class)AXNumericDataAxisDescriptor;
  v15 = -[AXNumericDataAxisDescriptor init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    if (v12)
      v17 = (const __CFString *)v12;
    else
      v17 = &stru_24C1B9220;
    -[AXNumericDataAxisDescriptor setTitle:](v15, "setTitle:", v17);
    -[AXNumericDataAxisDescriptor _commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](v16, "_commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v13, v14, lowerbound, upperBound);
  }

  return v16;
}

- (AXNumericDataAxisDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider
{
  NSAttributedString *v12;
  NSArray *v13;
  void *v14;
  AXNumericDataAxisDescriptor *v15;
  NSAttributedString *v16;
  NSAttributedString *v17;
  objc_super v19;

  v12 = attributedTitle;
  v13 = gridlinePositions;
  v14 = valueDescriptionProvider;
  v19.receiver = self;
  v19.super_class = (Class)AXNumericDataAxisDescriptor;
  v15 = -[AXNumericDataAxisDescriptor init](&v19, sel_init);
  if (v15)
  {
    if (v12)
      v16 = v12;
    else
      v16 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24C1B9220);
    v17 = v15->_attributedTitle;
    v15->_attributedTitle = v16;

    -[AXNumericDataAxisDescriptor _commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](v15, "_commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v13, v14, lowerbound, upperBound);
  }

  return v15;
}

- (void)_commonInitWithLowerBound:(double)a3 upperBound:(double)a4 gridlinePositions:(id)a5 valueDescriptionProvider:(id)a6
{
  id v9;
  void *v10;
  id valueDescriptionProvider;
  id v12;

  self->_lowerBound = a3;
  self->_upperBound = a4;
  objc_storeStrong((id *)&self->_gridlinePositions, a5);
  v12 = a5;
  v9 = a6;
  v10 = (void *)objc_msgSend(v9, "copy");

  valueDescriptionProvider = self->_valueDescriptionProvider;
  self->_valueDescriptionProvider = v10;

}

- (AXNumericDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  AXNumericDataAxisDescriptor *v24;

  v4 = a3;
  getkAXMChartAxisTitleKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    getkAXMChartAxisTitleKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    getkAXMChartAxisTitleKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithString:", v10);

  }
  getkAXMChartNumericAxisScaleTypeKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  getkAXMChartNumericAxisLowerBoundKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  getkAXMChartNumericAxisUpperBoundKey();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  getkAXMChartNumericAxisGridlinePositionsKey();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[AXNumericDataAxisDescriptor initWithAttributedTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](self, "initWithAttributedTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v8, v23, &__block_literal_global_0, v17, v21);
  -[AXNumericDataAxisDescriptor setScaleType:](v24, "setScaleType:", v13);

  return v24;
}

const __CFString *__50__AXNumericDataAxisDescriptor_initWithDictionary___block_invoke()
{
  return &stru_24C1B9220;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AXNumericDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  v7 = v6;
  -[AXNumericDataAxisDescriptor upperBound](self, "upperBound");
  v9 = v8;
  -[AXNumericDataAxisDescriptor gridlinePositions](self, "gridlinePositions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXNumericDataAxisDescriptor valueDescriptionProvider](self, "valueDescriptionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = (void *)objc_msgSend(v4, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v5, v10, v12, v7, v9);

  -[AXNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[AXNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v13, "setAttributedTitle:", v17);

  }
  return v13;
}

- (void)setTitle:(id)a3
{
  objc_class *v4;
  id v5;
  NSAttributedString *v6;
  NSAttributedString *attributedTitle;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithString:", v5);

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartAxisTitleKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AXNumericDataAxisDescriptor scaleType](self, "scaleType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartNumericAxisScaleTypeKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[AXNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartNumericAxisLowerBoundKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[AXNumericDataAxisDescriptor upperBound](self, "upperBound");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartNumericAxisUpperBoundKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

  getkAXMChartAxisTypeNumeric();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartAxisTypeKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

  -[AXNumericDataAxisDescriptor gridlinePositions](self, "gridlinePositions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartNumericAxisGridlinePositionsKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);

  return v3;
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
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXNumericDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[AXNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[AXNumericDataAxisDescriptor upperBound](self, "upperBound");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXNumericDataAxisDescriptor gridlinePositions](self, "gridlinePositions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p title=%@ bounds=[%@, %@], gridlines=%@>"), v4, self, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AXNumericDataAxisDescriptorScale)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(AXNumericDataAxisDescriptorScale)scaleType
{
  self->_scaleType = scaleType;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)lowerBound
{
  self->_lowerBound = lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)upperBound
{
  self->_upperBound = upperBound;
}

- (void)valueDescriptionProvider
{
  return self->_valueDescriptionProvider;
}

- (void)setValueDescriptionProvider:(void *)valueDescriptionProvider
{
  objc_setProperty_nonatomic_copy(self, a2, valueDescriptionProvider, 48);
}

- (NSArray)gridlinePositions
{
  return self->_gridlinePositions;
}

- (void)setGridlinePositions:(NSArray *)gridlinePositions
{
  objc_setProperty_nonatomic_copy(self, a2, gridlinePositions, 56);
}

- (AXScale)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->_scale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_gridlinePositions, 0);
  objc_storeStrong(&self->_valueDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
