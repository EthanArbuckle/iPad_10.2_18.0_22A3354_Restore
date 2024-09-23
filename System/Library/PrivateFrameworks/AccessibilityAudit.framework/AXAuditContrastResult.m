@implementation AXAuditContrastResult

- (AXAuditContrastResult)init
{
  AXAuditContrastResult *v2;
  AXAuditContrastResult *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXAuditContrastResult;
  v2 = -[AXAuditContrastResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXAuditContrastResult setClassification:](v2, "setClassification:", 0);
  return v3;
}

- (NSArray)compareColors
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[AXAuditContrastResult textColor](self, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditContrastResult primaryColor](self, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditContrastResult secondaryColor](self, "secondaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!v4)
    {
      v7 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    v6 = objc_msgSend(v3, "isEqualToString:", v4);
    v7 = v3;
    if ((v6 & (v5 != 0)) != 0)
      v8 = v5;
    else
      v8 = v4;
  }
  else
  {
    v7 = v4;
    v8 = v5;
  }
  v9 = v8;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return (NSArray *)v11;
}

- (NSString)summary
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = -[AXAuditContrastResult classification](self, "classification");
  if (v3 == 15 || (v4 = 0.0, v3 == 12))
  {
    -[AXAuditContrastResult fontSize](self, "fontSize");
    v4 = v5;
  }
  -[AXAuditContrastResult textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXAuditContrastResult primaryColor](self, "primaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_19;
    }
    v8 = CFSTR("textBackgroundComparisonFormatter");
  }
  else
  {
    v8 = CFSTR("colorsComparisonFormatter");
  }
  AXAuditLocString(v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_16;
  AXAuditLocString(CFSTR("textContrastRatioFormatter"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v4 > 0.0)
  {
    AXAuditLocString(CFSTR("fontSizeFormatter"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[AXAuditContrastResult ratio](self, "ratio");
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", v9, v12);
  -[AXAuditContrastResult compareColors](self, "compareColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 2)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v7, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, *(_QWORD *)&v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "appendString:", v7);
    if (v19)
    {
      objc_msgSend(v13, "appendString:", v19);

    }
  }
  else
  {
    objc_msgSend(v13, "appendString:", v7);
  }

LABEL_19:
  return (NSString *)v13;
}

- (id)description
{
  id v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  objc_super v16;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = -[AXAuditContrastResult classification](self, "classification");
  v16.receiver = self;
  v16.super_class = (Class)AXAuditContrastResult;
  -[AXAuditContrastResult description](&v16, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%ld] %@, "), v4, v5);

  -[AXAuditContrastResult ratio](self, "ratio");
  objc_msgSend(v3, "appendFormat:", CFSTR("Ratio:%.2f "), v6);
  -[AXAuditContrastResult textColor](self, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXAuditContrastResult textColor](self, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Text:%@ "), v8);

  }
  -[AXAuditContrastResult primaryColor](self, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXAuditContrastResult primaryColor](self, "primaryColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("PrimaryColor:%@ "), v10);

  }
  -[AXAuditContrastResult secondaryColor](self, "secondaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXAuditContrastResult secondaryColor](self, "secondaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("SecondaryColor:%@ "), v12);

  }
  -[AXAuditContrastResult fontSize](self, "fontSize");
  if (v13 > 0.0)
  {
    -[AXAuditContrastResult fontSize](self, "fontSize");
    objc_msgSend(v3, "appendFormat:", CFSTR("FontSize:%.0f"), v14);
  }
  return v3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSString)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)ratio
{
  return self->_ratio;
}

- (void)setRatio:(double)a3
{
  self->_ratio = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
