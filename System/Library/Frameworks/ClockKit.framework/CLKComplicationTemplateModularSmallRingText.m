@implementation CLKComplicationTemplateModularSmallRingText

- (CLKComplicationTemplateModularSmallRingText)initWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKTextProvider *v8;
  CLKComplicationTemplateModularSmallRingText *v9;
  CLKComplicationTemplateModularSmallRingText *v10;
  double v11;
  objc_super v13;

  v8 = textProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateModularSmallRingText;
  v9 = -[CLKComplicationTemplate initPrivate](&v13, sel_initPrivate);
  v10 = v9;
  if (v9)
  {
    -[CLKComplicationTemplateModularSmallRingText setTextProvider:](v9, "setTextProvider:", v8);
    *(float *)&v11 = fillFraction;
    -[CLKComplicationTemplateModularSmallRingText setFillFraction:](v10, "setFillFraction:", v11);
    -[CLKComplicationTemplateModularSmallRingText setRingStyle:](v10, "setRingStyle:", ringStyle);
  }

  return v10;
}

+ (CLKComplicationTemplateModularSmallRingText)templateWithTextProvider:(CLKTextProvider *)textProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKTextProvider *v8;
  id v9;
  double v10;
  void *v11;

  v8 = textProvider;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = fillFraction;
  v11 = (void *)objc_msgSend(v9, "initWithTextProvider:fillFraction:ringStyle:", v8, ringStyle, v10);

  return (CLKComplicationTemplateModularSmallRingText *)v11;
}

- (int64_t)compatibleFamily
{
  return 0;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, _QWORD, char *))a3 + 2))(a3, CFSTR("fillFraction"), 1, 0, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("ringStyle"), 1, &__block_literal_global_300, &v3);
}

BOOL __78__CLKComplicationTemplateModularSmallRingText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
  objc_setProperty_nonatomic_copy(self, a2, textProvider, 80);
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)fillFraction
{
  self->_fillFraction = fillFraction;
}

- (CLKComplicationRingStyle)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle
{
  self->_ringStyle = ringStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
