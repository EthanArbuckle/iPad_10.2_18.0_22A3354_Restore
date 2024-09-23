@implementation HKSelectedRangeData

- (HKSelectedRangeData)initWithStatisticsType:(int64_t)a3
{
  HKSelectedRangeData *v4;
  HKSelectedRangeData *v5;
  NSAttributedString *attributedString;
  NSString *titleOverride;
  UIColor *titleColorOverride;
  NSNumber *valueAsNumber;
  UIColor *prefixColor;
  NSMutableDictionary *v11;
  NSMutableDictionary *metadata;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKSelectedRangeData;
  v4 = -[HKSelectedRangeData init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_statisticsType = a3;
    v4->_dataType = 0;
    attributedString = v4->_attributedString;
    v4->_attributedString = 0;

    titleOverride = v5->_titleOverride;
    v5->_titleOverride = 0;

    titleColorOverride = v5->_titleColorOverride;
    v5->_titleColorOverride = 0;

    valueAsNumber = v5->_valueAsNumber;
    v5->_valueAsNumber = 0;

    prefixColor = v5->_prefixColor;
    v5->_prefixColor = 0;

    v5->_prefersImageAffixes = 1;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metadata = v5->_metadata;
    v5->_metadata = v11;

  }
  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = -[HKSelectedRangeData statisticsType](self, "statisticsType");
  v4 = -[HKSelectedRangeData dataType](self, "dataType") ^ v3;
  -[HKSelectedRangeData attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[HKSelectedRangeData valueAsNumber](self, "valueAsNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HKSelectedRangeData prefixColor](self, "prefixColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[HKSelectedRangeData prefersImageAffixes](self, "prefersImageAffixes");
  -[HKSelectedRangeData titleOverride](self, "titleOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ v11 ^ objc_msgSend(v12, "hash");
  -[HKSelectedRangeData titleColorOverride](self, "titleColorOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[HKSelectedRangeData metadata](self, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HKSelectedRangeData *v4;
  HKSelectedRangeData *v5;
  BOOL v6;

  v4 = (HKSelectedRangeData *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[HKSelectedRangeData isEqualToSelectedRangeData:](self, "isEqualToSelectedRangeData:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSelectedRangeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  _BOOL4 v34;
  char v35;
  void *v37;
  void *v38;

  v4 = a3;
  -[HKSelectedRangeData attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[HKSelectedRangeData attributedString](self, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToAttributedString:", v8);

    v10 = v9 ^ 1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  v10 = 0;
LABEL_5:
  -[HKSelectedRangeData valueAsNumber](self, "valueAsNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_8:
    -[HKSelectedRangeData valueAsNumber](self, "valueAsNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueAsNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToNumber:", v14);

    v16 = v15 ^ 1;
    goto LABEL_9;
  }
  objc_msgSend(v4, "valueAsNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_8;
  v16 = 0;
LABEL_9:
  -[HKSelectedRangeData titleOverride](self, "titleOverride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_12:
    -[HKSelectedRangeData titleOverride](self, "titleOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    goto LABEL_13;
  }
  objc_msgSend(v4, "titleOverride");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_12;
  v21 = 1;
LABEL_13:
  -[HKSelectedRangeData titleColorOverride](self, "titleColorOverride");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

LABEL_16:
    -[HKSelectedRangeData titleColorOverride](self, "titleColorOverride");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleColorOverride");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    v27 = v26 ^ 1;
    goto LABEL_17;
  }
  objc_msgSend(v4, "titleColorOverride");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_16;
  v27 = 0;
LABEL_17:
  -[HKSelectedRangeData prefixColor](self, "prefixColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

LABEL_20:
    -[HKSelectedRangeData prefixColor](self, "prefixColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prefixColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v30, "isEqual:", v31);

    goto LABEL_21;
  }
  objc_msgSend(v4, "prefixColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_20;
LABEL_21:
  v32 = -[HKSelectedRangeData statisticsType](self, "statisticsType");
  if (v32 == objc_msgSend(v4, "statisticsType")
    && (v33 = -[HKSelectedRangeData dataType](self, "dataType"), v33 == objc_msgSend(v4, "dataType"))
    && (v34 = -[HKSelectedRangeData prefersImageAffixes](self, "prefersImageAffixes"),
        ((v34 ^ objc_msgSend(v4, "prefersImageAffixes") | v10 | v21 ^ 1 | v27 | v16) & 1) == 0))
  {
    -[HKSelectedRangeData metadata](self, "metadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v37, "isEqualToDictionary:", v38);

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)description
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
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)HKSelectedRangeData;
  -[HKSelectedRangeData description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData titleOverride](self, "titleOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData titleColorOverride](self, "titleColorOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData valueAsNumber](self, "valueAsNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromSelectedRangeStatisticsType(-[HKSelectedRangeData statisticsType](self, "statisticsType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromSelectedRangeDataType(-[HKSelectedRangeData dataType](self, "dataType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData prefixColor](self, "prefixColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData prefersImageAffixes](self, "prefersImageAffixes");
  HKStringFromBool();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, attributed: %@, titleOverride: %@, titleColorOverride: %@, valueAsNumber: %@, statisticsType: %@, dataType: %@, prefixColor: %@, prefersImageAffixes: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)statisticsType
{
  return self->_statisticsType;
}

- (void)setStatisticsType:(int64_t)a3
{
  self->_statisticsType = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)titleColorOverride
{
  return self->_titleColorOverride;
}

- (void)setTitleColorOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)valueAsNumber
{
  return self->_valueAsNumber;
}

- (void)setValueAsNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)prefixColor
{
  return self->_prefixColor;
}

- (void)setPrefixColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)prefersImageAffixes
{
  return self->_prefersImageAffixes;
}

- (void)setPrefersImageAffixes:(BOOL)a3
{
  self->_prefersImageAffixes = a3;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)titleTapOutBlock
{
  return self->_titleTapOutBlock;
}

- (void)setTitleTapOutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_titleTapOutBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_prefixColor, 0);
  objc_storeStrong((id *)&self->_valueAsNumber, 0);
  objc_storeStrong((id *)&self->_titleColorOverride, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
