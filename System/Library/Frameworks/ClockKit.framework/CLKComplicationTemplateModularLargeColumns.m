@implementation CLKComplicationTemplateModularLargeColumns

- (CLKComplicationTemplateModularLargeColumns)initWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  return -[CLKComplicationTemplateModularLargeColumns initWithRow1ImageProvider:row1Column1TextProvider:row1Column2TextProvider:row2ImageProvider:row2Column1TextProvider:row2Column2TextProvider:row3ImageProvider:row3Column1TextProvider:row3Column2TextProvider:](self, "initWithRow1ImageProvider:row1Column1TextProvider:row1Column2TextProvider:row2ImageProvider:row2Column1TextProvider:row2Column2TextProvider:row3ImageProvider:row3Column1TextProvider:row3Column2TextProvider:", 0, row1Column1TextProvider, row1Column2TextProvider, 0, row2Column1TextProvider, row2Column2TextProvider, 0, row3Column1TextProvider, row3Column2TextProvider);
}

- (CLKComplicationTemplateModularLargeColumns)initWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  CLKImageProvider *v17;
  CLKTextProvider *v18;
  CLKTextProvider *v19;
  CLKImageProvider *v20;
  CLKTextProvider *v21;
  CLKTextProvider *v22;
  CLKImageProvider *v23;
  CLKTextProvider *v24;
  CLKTextProvider *v25;
  CLKComplicationTemplateModularLargeColumns *v26;
  CLKComplicationTemplateModularLargeColumns *v27;
  objc_super v29;

  v17 = row1ImageProvider;
  v18 = row1Column1TextProvider;
  v19 = row1Column2TextProvider;
  v20 = row2ImageProvider;
  v21 = row2Column1TextProvider;
  v22 = row2Column2TextProvider;
  v23 = row3ImageProvider;
  v24 = row3Column1TextProvider;
  v25 = row3Column2TextProvider;
  v29.receiver = self;
  v29.super_class = (Class)CLKComplicationTemplateModularLargeColumns;
  v26 = -[CLKComplicationTemplate initPrivate](&v29, sel_initPrivate);
  v27 = v26;
  if (v26)
  {
    -[CLKComplicationTemplateModularLargeColumns setRow1ImageProvider:](v26, "setRow1ImageProvider:", v17);
    -[CLKComplicationTemplateModularLargeColumns setRow1Column1TextProvider:](v27, "setRow1Column1TextProvider:", v18);
    -[CLKComplicationTemplateModularLargeColumns setRow1Column2TextProvider:](v27, "setRow1Column2TextProvider:", v19);
    -[CLKComplicationTemplateModularLargeColumns setRow2ImageProvider:](v27, "setRow2ImageProvider:", v20);
    -[CLKComplicationTemplateModularLargeColumns setRow2Column1TextProvider:](v27, "setRow2Column1TextProvider:", v21);
    -[CLKComplicationTemplateModularLargeColumns setRow2Column2TextProvider:](v27, "setRow2Column2TextProvider:", v22);
    -[CLKComplicationTemplateModularLargeColumns setRow3ImageProvider:](v27, "setRow3ImageProvider:", v23);
    -[CLKComplicationTemplateModularLargeColumns setRow3Column1TextProvider:](v27, "setRow3Column1TextProvider:", v24);
    -[CLKComplicationTemplateModularLargeColumns setRow3Column2TextProvider:](v27, "setRow3Column2TextProvider:", v25);
  }

  return v27;
}

+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  CLKTextProvider *v14;
  CLKTextProvider *v15;
  CLKTextProvider *v16;
  CLKTextProvider *v17;
  CLKTextProvider *v18;
  CLKTextProvider *v19;
  void *v20;

  v14 = row3Column2TextProvider;
  v15 = row3Column1TextProvider;
  v16 = row2Column2TextProvider;
  v17 = row2Column1TextProvider;
  v18 = row1Column2TextProvider;
  v19 = row1Column1TextProvider;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRow1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:row3Column1TextProvider:row3Column2TextProvider:", v19, v18, v17, v16, v15, v14);

  return (CLKComplicationTemplateModularLargeColumns *)v20;
}

+ (CLKComplicationTemplateModularLargeColumns)templateWithRow1ImageProvider:(CLKImageProvider *)row1ImageProvider row1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider row1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider row2ImageProvider:(CLKImageProvider *)row2ImageProvider row2Column1TextProvider:(CLKTextProvider *)row2Column1TextProvider row2Column2TextProvider:(CLKTextProvider *)row2Column2TextProvider row3ImageProvider:(CLKImageProvider *)row3ImageProvider row3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider row3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  CLKTextProvider *v18;
  CLKTextProvider *v19;
  CLKImageProvider *v20;
  CLKTextProvider *v21;
  CLKTextProvider *v22;
  CLKImageProvider *v23;
  CLKTextProvider *v24;
  CLKTextProvider *v25;
  CLKImageProvider *v26;
  void *v27;

  v18 = row3Column2TextProvider;
  v19 = row3Column1TextProvider;
  v20 = row3ImageProvider;
  v21 = row2Column2TextProvider;
  v22 = row2Column1TextProvider;
  v23 = row2ImageProvider;
  v24 = row1Column2TextProvider;
  v25 = row1Column1TextProvider;
  v26 = row1ImageProvider;
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRow1ImageProvider:row1Column1TextProvider:row1Column2TextProvider:row2ImageProvider:row2Column1TextProvider:row2Column2TextProvider:row3ImageProvider:row3Column1TextProvider:row3Column2TextProvider:", v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return (CLKComplicationTemplateModularLargeColumns *)v27;
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
  v3[2](v3, CFSTR("row1Column1TextProvider"), 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("row1Column2TextProvider"), 0, 1, &v4);
    if (!v4)
    {
      v3[2](v3, CFSTR("row2Column1TextProvider"), 0, 1, &v4);
      if (!v4)
      {
        v3[2](v3, CFSTR("row2Column2TextProvider"), 0, 1, &v4);
        if (!v4)
        {
          v3[2](v3, CFSTR("row3Column1TextProvider"), 0, 1, &v4);
          if (!v4)
            v3[2](v3, CFSTR("row3Column2TextProvider"), 0, 1, &v4);
        }
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

  v4 = a3;
  v9 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  _ModularLargeImageSize(-[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("row1ImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  if (!v9)
  {
    (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
     + 2))(v4, CFSTR("row2ImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
    if (!v9)
      (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
       + 2))(v4, CFSTR("row3ImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  }

}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("column2Alignment"), 1, &__block_literal_global_582, &v3);
}

BOOL __77__CLKComplicationTemplateModularLargeColumns__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationColumnAlignment(a2);
}

- (CLKImageProvider)row1ImageProvider
{
  return self->_row1ImageProvider;
}

- (void)setRow1ImageProvider:(CLKImageProvider *)row1ImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1ImageProvider, 80);
}

- (CLKTextProvider)row1Column1TextProvider
{
  return self->_row1Column1TextProvider;
}

- (void)setRow1Column1TextProvider:(CLKTextProvider *)row1Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column1TextProvider, 88);
}

- (CLKTextProvider)row1Column2TextProvider
{
  return self->_row1Column2TextProvider;
}

- (void)setRow1Column2TextProvider:(CLKTextProvider *)row1Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row1Column2TextProvider, 96);
}

- (CLKImageProvider)row2ImageProvider
{
  return self->_row2ImageProvider;
}

- (void)setRow2ImageProvider:(CLKImageProvider *)row2ImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row2ImageProvider, 104);
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

- (CLKImageProvider)row3ImageProvider
{
  return self->_row3ImageProvider;
}

- (void)setRow3ImageProvider:(CLKImageProvider *)row3ImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row3ImageProvider, 128);
}

- (CLKTextProvider)row3Column1TextProvider
{
  return self->_row3Column1TextProvider;
}

- (void)setRow3Column1TextProvider:(CLKTextProvider *)row3Column1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row3Column1TextProvider, 136);
}

- (CLKTextProvider)row3Column2TextProvider
{
  return self->_row3Column2TextProvider;
}

- (void)setRow3Column2TextProvider:(CLKTextProvider *)row3Column2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, row3Column2TextProvider, 144);
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
  objc_storeStrong((id *)&self->_row3Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row3Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row3ImageProvider, 0);
  objc_storeStrong((id *)&self->_row2Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row2Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row2ImageProvider, 0);
  objc_storeStrong((id *)&self->_row1Column2TextProvider, 0);
  objc_storeStrong((id *)&self->_row1Column1TextProvider, 0);
  objc_storeStrong((id *)&self->_row1ImageProvider, 0);
}

@end
