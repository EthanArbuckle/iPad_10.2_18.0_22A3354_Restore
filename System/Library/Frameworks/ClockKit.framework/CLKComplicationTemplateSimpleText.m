@implementation CLKComplicationTemplateSimpleText

- (CLKComplicationTemplateSimpleText)initWithTextProvider:(id)a3
{
  id v4;
  CLKComplicationTemplateSimpleText *v5;
  CLKComplicationTemplateSimpleText *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateSimpleText;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateSimpleText setTextProvider:](v5, "setTextProvider:", v4);

  return v6;
}

+ (id)templateWithTextProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:", v4);

  return v5;
}

- (int64_t)compatibleFamily
{
  return 106;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
