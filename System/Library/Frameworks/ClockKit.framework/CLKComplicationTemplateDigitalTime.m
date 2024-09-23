@implementation CLKComplicationTemplateDigitalTime

- (CLKComplicationTemplateDigitalTime)initWithMetadata:(id)a3
{
  id v4;
  CLKComplicationTemplateDigitalTime *v5;
  CLKComplicationTemplateDigitalTime *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateDigitalTime;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplate setMetadata:](v5, "setMetadata:", v4);

  return v6;
}

+ (id)templateWithMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetadata:", v4);

  return v5;
}

- (int64_t)compatibleFamily
{
  return 106;
}

@end
