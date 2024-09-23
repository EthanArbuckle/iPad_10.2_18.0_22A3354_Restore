@implementation AXMNumericDataAxisDescriptor

- (AXMNumericDataAxisDescriptor)initWithTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  AXMNumericDataAxisDescriptor *v15;
  AXMNumericDataAxisDescriptor *v16;
  objc_super v18;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AXMNumericDataAxisDescriptor;
  v15 = -[AXMNumericDataAxisDescriptor init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[AXMNumericDataAxisDescriptor setTitle:](v15, "setTitle:", v12);
    -[AXMNumericDataAxisDescriptor _commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](v16, "_commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v13, v14, a4, a5);
  }

  return v16;
}

- (AXMNumericDataAxisDescriptor)initWithAttributedTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  AXMNumericDataAxisDescriptor *v16;
  AXMNumericDataAxisDescriptor *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AXMNumericDataAxisDescriptor;
  v16 = -[AXMNumericDataAxisDescriptor init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_attributedTitle, a3);
    -[AXMNumericDataAxisDescriptor _commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](v17, "_commonInitWithLowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v14, v15, a4, a5);
  }

  return v17;
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

- (AXMNumericDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  AXMNumericDataAxisDescriptor *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisTitleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    v8 = v7;

    v6 = v8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartNumericAxisScaleTypeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartNumericAxisLowerBoundKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartNumericAxisUpperBoundKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartNumericAxisGridlinePositionsKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[AXMNumericDataAxisDescriptor initWithAttributedTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:](self, "initWithAttributedTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v6, v17, &__block_literal_global_26, v13, v16);
  -[AXMNumericDataAxisDescriptor setScaleType:](v18, "setScaleType:", v10);

  return v18;
}

const __CFString *__51__AXMNumericDataAxisDescriptor_initWithDictionary___block_invoke()
{
  return &stru_1E6260C18;
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
  -[AXMNumericDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  v7 = v6;
  -[AXMNumericDataAxisDescriptor upperBound](self, "upperBound");
  v9 = v8;
  -[AXMNumericDataAxisDescriptor gridlinePositions](self, "gridlinePositions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMNumericDataAxisDescriptor valueDescriptionProvider](self, "valueDescriptionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = (void *)objc_msgSend(v4, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v5, v10, v12, v7, v9);

  -[AXMNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[AXMNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
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

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithString:", v5);

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXMNumericDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isCategoricalAxis
{
  return 0;
}

- (double)normalizedAxisValueForValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AXMNumericDataAxisDescriptor upperBound](self, "upperBound");
  v6 = v5;
  -[AXMNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  v8 = v6 - v7;
  -[AXMNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  return (a3 - v9) / v8;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMNumericDataAxisDescriptor title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kAXMChartAxisTitleKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMNumericDataAxisDescriptor scaleType](self, "scaleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kAXMChartNumericAxisScaleTypeKey"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kAXMChartNumericAxisLowerBoundKey"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMNumericDataAxisDescriptor upperBound](self, "upperBound");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kAXMChartNumericAxisUpperBoundKey"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("numeric"), CFSTR("kAXMChartAxisType"));
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMNumericDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMNumericDataAxisDescriptor lowerBound](self, "lowerBound");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMNumericDataAxisDescriptor upperBound](self, "upperBound");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMNumericDataAxisDescriptor gridlinePositions](self, "gridlinePositions");
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

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(int64_t)a3
{
  self->_scaleType = a3;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (id)valueDescriptionProvider
{
  return self->_valueDescriptionProvider;
}

- (void)setValueDescriptionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)gridlinePositions
{
  return self->_gridlinePositions;
}

- (void)setGridlinePositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (AXMScale)scale
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
