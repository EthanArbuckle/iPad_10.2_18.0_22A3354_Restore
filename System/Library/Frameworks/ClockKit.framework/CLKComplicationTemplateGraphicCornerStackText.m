@implementation CLKComplicationTemplateGraphicCornerStackText

- (CLKComplicationTemplateGraphicCornerStackText)initWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicCornerStackText *v8;
  CLKComplicationTemplateGraphicCornerStackText *v9;
  objc_super v11;

  v6 = innerTextProvider;
  v7 = outerTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCornerStackText;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicCornerStackText setInnerTextProvider:](v8, "setInnerTextProvider:", v6);
    -[CLKComplicationTemplateGraphicCornerStackText setOuterTextProvider:](v9, "setOuterTextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCornerStackText)templateWithInnerTextProvider:(CLKTextProvider *)innerTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = outerTextProvider;
  v7 = innerTextProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInnerTextProvider:outerTextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCornerStackText *)v8;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("innerTextProvider"), 0, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("outerTextProvider"), 0, 1, &v4);

}

- (CLKTextProvider)innerTextProvider
{
  return self->_innerTextProvider;
}

- (void)setInnerTextProvider:(CLKTextProvider *)innerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, innerTextProvider, 72);
}

- (CLKTextProvider)outerTextProvider
{
  return self->_outerTextProvider;
}

- (void)setOuterTextProvider:(CLKTextProvider *)outerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, outerTextProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerTextProvider, 0);
  objc_storeStrong((id *)&self->_innerTextProvider, 0);
}

@end
