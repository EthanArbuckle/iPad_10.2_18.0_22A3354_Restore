@implementation CLKComplicationTemplateExtraLargeColumnsText

- (CLKComplicationTemplateExtraLargeColumnsText)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  CLKTextProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  CLKComplicationTemplateExtraLargeColumnsText *v14;
  CLKComplicationTemplateExtraLargeColumnsText *v15;
  objc_super v17;

  v10 = row1Column1TextProvider;
  v11 = row1Column2TextProvider;
  v12 = row2Column1TextProvider;
  v13 = row2Column2TextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateExtraLargeColumnsText;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateExtraLargeColumnsText setRow1Column1TextProvider:](v14, "setRow1Column1TextProvider:", v10);
    -[CLKComplicationTemplateExtraLargeColumnsText setRow1Column2TextProvider:](v15, "setRow1Column2TextProvider:", v11);
    -[CLKComplicationTemplateExtraLargeColumnsText setRow2Column1TextProvider:](v15, "setRow2Column1TextProvider:", v12);
    -[CLKComplicationTemplateExtraLargeColumnsText setRow2Column2TextProvider:](v15, "setRow2Column2TextProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateExtraLargeColumnsText)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  CLKTextProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  void *v14;

  v10 = row2Column2TextProvider;
  v11 = row2Column1TextProvider;
  v12 = row1Column2TextProvider;
  v13 = row1Column1TextProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRow1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateExtraLargeColumnsText *)v14;
}

- (int64_t)compatibleFamily
{
  return 7;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("row1Column1TextProvider"), 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("row1Column2TextProvider"), 0, 1, &v4);
    if (!v4)
    {
      v3[2](v3, CFSTR("row2Column1TextProvider"), 0, 1, &v4);
      if (!v4)
        v3[2](v3, CFSTR("row2Column2TextProvider"), 0, 1, &v4);
    }
  }

}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("column2Alignment"), 1, &__block_literal_global_737, &v3);
}

BOOL __79__CLKComplicationTemplateExtraLargeColumnsText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, char *))a3 + 2))(a3, CFSTR("highlightColumn2"), 1, &v3);
}

- (CLKTextProvider)row1Column1TextProvider
{
  return self->_row1Column1TextProvider;
}

- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column1TextProvider, 80);
}

- (CLKTextProvider)row1Column2TextProvider
{
  return self->_row1Column2TextProvider;
}

- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column2TextProvider, 88);
}

- (CLKTextProvider)row2Column1TextProvider
{
  return self->_row2Column1TextProvider;
}

- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row2Column1TextProvider, 96);
}

- (CLKTextProvider)row2Column2TextProvider
{
  return self->_row2Column2TextProvider;
}

- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row2Column2TextProvider, 104);
}

- (CLKComplicationColumnAlignment)column2Alignment
{
  return self->_column2Alignment;
}

- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment
{
  self->_column2Alignment = column2Alignment;
}

- (BOOL)highlightColumn2
{
  return self->_highlightColumn2;
}

- (void)setHighlightColumn2:(BOOL)highlightColumn2
{
  self->_highlightColumn2 = highlightColumn2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);
}

@end
