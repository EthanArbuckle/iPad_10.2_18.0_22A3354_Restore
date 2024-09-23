@implementation CLKComplicationTemplateGraphicExtraLargeCircularMetadata

- (CLKComplicationTemplateGraphicExtraLargeCircularMetadata)initWithMetadata:(id)a3
{
  id v4;
  CLKComplicationTemplateGraphicExtraLargeCircularMetadata *v5;
  CLKComplicationTemplateGraphicExtraLargeCircularMetadata *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularMetadata;
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

@end
