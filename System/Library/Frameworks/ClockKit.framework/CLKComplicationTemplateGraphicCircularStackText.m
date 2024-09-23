@implementation CLKComplicationTemplateGraphicCircularStackText

- (CLKComplicationTemplateGraphicCircularStackText)initWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicCircularStackText *v8;
  CLKComplicationTemplateGraphicCircularStackText *v9;
  objc_super v11;

  v6 = line1TextProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCircularStackText;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicCircularStackText setLine1TextProvider:](v8, "setLine1TextProvider:", v6);
    -[CLKComplicationTemplateGraphicCircularStackText setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCircularStackText)templateWithLine1TextProvider:(CLKTextProvider *)line1TextProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1TextProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1TextProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCircularStackText *)v8;
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

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, void *, char *))a3 + 2))(a3, CFSTR("highlightMode"), 0, &__block_literal_global_1012, &v3);
}

BOOL __82__CLKComplicationTemplateGraphicCircularStackText__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)a3
{
  -[CLKComplicationTemplateGraphicCircularStackText setHighlightMode:](self, "setHighlightMode:", a3);
}

- (BOOL)highlightLine2
{
  return -[CLKComplicationTemplateGraphicCircularStackText highlightMode](self, "highlightMode") != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateGraphicCircularStackText;
  v7 = -[CLKComplicationTemplate initPrivateWithJSONObjectRepresentation:bundle:](&v10, sel_initPrivateWithJSONObjectRepresentation_bundle_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlightLine2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("highlightLine2"), v8);
      objc_msgSend(v7, "setHighlightLine2:", objc_msgSend(v8, "BOOLValue"));
    }

  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateGraphicCircularStackText;
  -[CLKComplicationTemplate JSONObjectRepresentationWritingResourcesToBundlePath:purpose:](&v7, sel_JSONObjectRepresentationWritingResourcesToBundlePath_purpose_, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CLKComplicationTemplateGraphicCircularStackText highlightLine2](self, "highlightLine2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("highlightLine2"));

  return v4;
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

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);
  objc_storeStrong((id *)&self->_line1TextProvider, 0);
}

@end
