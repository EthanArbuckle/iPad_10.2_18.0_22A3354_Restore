@implementation CLKComplicationTemplateCircularSmallStackText

- (CLKComplicationTemplateCircularSmallStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateCircularSmallStackText *v8;
  CLKComplicationTemplateCircularSmallStackText *v9;
  objc_super v11;

  v6 = line1TextProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateCircularSmallStackText;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateCircularSmallStackText setLine1TextProvider:](v8, "setLine1TextProvider:", v6);
    -[CLKComplicationTemplateCircularSmallStackText setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateCircularSmallStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1TextProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1TextProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateCircularSmallStackText *)v8;
}

- (int64_t)compatibleFamily
{
  return 4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("line1TextProvider"), 0, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("line2TextProvider"), 0, 1, &v4);

}

- (CLKTextProvider)line1TextProvider
{
  return self->_line1TextProvider;
}

- (void)setLine1TextProvider:(CLKTextProvider *)line1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, line1TextProvider, 72);
}

- (CLKTextProvider)line2TextProvider
{
  return self->_line2TextProvider;
}

- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, line2TextProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);
  objc_storeStrong((id *)&self->_line1TextProvider, 0);
}

@end
