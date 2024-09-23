@implementation CLKComplicationTemplateModularLargeTable

- (CLKComplicationTemplateModularLargeTable)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  return -[CLKComplicationTemplateModularLargeTable initWithHeaderImageProvider:headerTextProvider:row1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:](self, "initWithHeaderImageProvider:headerTextProvider:row1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:", 0, headerTextProvider, row1Column1TextProvider, row1Column2TextProvider, row2Column1TextProvider, row2Column2TextProvider);
}

- (CLKComplicationTemplateModularLargeTable)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  CLKImageProvider *v14;
  CLKTextProvider *v15;
  CLKTextProvider *v16;
  CLKTextProvider *v17;
  CLKTextProvider *v18;
  CLKTextProvider *v19;
  CLKComplicationTemplateModularLargeTable *v20;
  CLKComplicationTemplateModularLargeTable *v21;
  objc_super v23;

  v14 = headerImageProvider;
  v15 = headerTextProvider;
  v16 = row1Column1TextProvider;
  v17 = row1Column2TextProvider;
  v18 = row2Column1TextProvider;
  v19 = row2Column2TextProvider;
  v23.receiver = self;
  v23.super_class = (Class)CLKComplicationTemplateModularLargeTable;
  v20 = -[CLKComplicationTemplate initPrivate](&v23, sel_initPrivate);
  v21 = v20;
  if (v20)
  {
    -[CLKComplicationTemplateModularLargeTable setHeaderImageProvider:](v20, "setHeaderImageProvider:", v14);
    -[CLKComplicationTemplateModularLargeTable setHeaderTextProvider:](v21, "setHeaderTextProvider:", v15);
    -[CLKComplicationTemplateModularLargeTable setRow1Column1TextProvider:](v21, "setRow1Column1TextProvider:", v16);
    -[CLKComplicationTemplateModularLargeTable setRow1Column2TextProvider:](v21, "setRow1Column2TextProvider:", v17);
    -[CLKComplicationTemplateModularLargeTable setRow2Column1TextProvider:](v21, "setRow2Column1TextProvider:", v18);
    -[CLKComplicationTemplateModularLargeTable setRow2Column2TextProvider:](v21, "setRow2Column2TextProvider:", v19);
  }

  return v21;
}

+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  CLKTextProvider *v14;
  CLKTextProvider *v15;
  CLKTextProvider *v16;
  void *v17;

  v12 = row2Column2TextProvider;
  v13 = row2Column1TextProvider;
  v14 = row1Column2TextProvider;
  v15 = row1Column1TextProvider;
  v16 = headerTextProvider;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:row1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:", v16, v15, v14, v13, v12);

  return (CLKComplicationTemplateModularLargeTable *)v17;
}

+ (CLKComplicationTemplateModularLargeTable)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  CLKTextProvider *v14;
  CLKTextProvider *v15;
  CLKTextProvider *v16;
  CLKTextProvider *v17;
  CLKTextProvider *v18;
  CLKImageProvider *v19;
  void *v20;

  v14 = row2Column2TextProvider;
  v15 = row2Column1TextProvider;
  v16 = row1Column2TextProvider;
  v17 = row1Column1TextProvider;
  v18 = headerTextProvider;
  v19 = headerImageProvider;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:row1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:", v19, v18, v17, v16, v15, v14);

  return (CLKComplicationTemplateModularLargeTable *)v20;
}

- (int64_t)compatibleFamily
{
  return 1;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("headerTextProvider"), 0, 1, &v4);
  if (!v4)
  {
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

}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;

  v9 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = a3;
  _ModularLargeImageSize(-[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("headerImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("column2Alignment"), 1, &__block_literal_global_557, &v3);
}

BOOL __75__CLKComplicationTemplateModularLargeTable__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
}

- (CLKImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKImageProvider *)headerImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerImageProvider, 80);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerTextProvider, 88);
}

- (CLKTextProvider)row1Column1TextProvider
{
  return self->_row1Column1TextProvider;
}

- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column1TextProvider, 96);
}

- (CLKTextProvider)row1Column2TextProvider
{
  return self->_row1Column2TextProvider;
}

- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column2TextProvider, 104);
}

- (CLKTextProvider)row2Column1TextProvider
{
  return self->_row2Column1TextProvider;
}

- (void)setRow2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row2Column1TextProvider, 112);
}

- (CLKTextProvider)row2Column2TextProvider
{
  return self->_row2Column2TextProvider;
}

- (void)setRow2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row2Column2TextProvider, 120);
}

- (CLKComplicationColumnAlignment)column2Alignment
{
  return self->_column2Alignment;
}

- (void)setColumn2Alignment:(CLKComplicationColumnAlignment)column2Alignment
{
  self->_column2Alignment = column2Alignment;
}

- (BOOL)useNoColumnPadding
{
  return self->_useNoColumnPadding;
}

- (void)setUseNoColumnPadding:(BOOL)a3
{
  self->_useNoColumnPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
