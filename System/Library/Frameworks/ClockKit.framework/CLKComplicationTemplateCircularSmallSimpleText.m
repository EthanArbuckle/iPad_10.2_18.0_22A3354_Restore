@implementation CLKComplicationTemplateCircularSmallSimpleText

- (CLKComplicationTemplateCircularSmallSimpleText)init
{
  return -[CLKComplicationTemplateCircularSmallSimpleText initWithTextProvider:](self, "initWithTextProvider:", 0);
}

- (CLKComplicationTemplateCircularSmallSimpleText)initWithTextProvider:(CLKTextProvider *)textProvider
{
  CLKTextProvider *v4;
  CLKComplicationTemplateCircularSmallSimpleText *v5;
  CLKComplicationTemplateCircularSmallSimpleText *v6;
  objc_super v8;

  v4 = textProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateCircularSmallSimpleText;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
  {
    v5->_maxDynamicFontSize = 4;
    -[CLKComplicationTemplateCircularSmallSimpleText setTextProvider:](v5, "setTextProvider:", v4);
  }

  return v6;
}

+ (CLKComplicationTemplateCircularSmallSimpleText)templateWithTextProvider:(CLKTextProvider *)textProvider
{
  CLKTextProvider *v4;
  void *v5;

  v4 = textProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:", v4);

  return (CLKComplicationTemplateCircularSmallSimpleText *)v5;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, void *, char *))a3 + 2))(a3, CFSTR("maxDynamicFontSize"), 0, &__block_literal_global_656, &v3);
}

BOOL __81__CLKComplicationTemplateCircularSmallSimpleText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationDynamicFontSize(a2);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
  objc_setProperty_nonatomic_copy(self, a2, textProvider, 72);
}

- (int64_t)maxDynamicFontSize
{
  return self->_maxDynamicFontSize;
}

- (void)setMaxDynamicFontSize:(int64_t)a3
{
  self->_maxDynamicFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
