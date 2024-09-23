@implementation CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge

- (int64_t)compatibleFamily
{
  return 11;
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
    v3[2](v3, CFSTR("body1TextProvider"), 0, 1, &v4);
    if (!v4)
      v3[2](v3, CFSTR("body2TextProvider"), 1, 1, &v4);
  }

}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, CFSTR("headerLabelData"), 1, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("headerLabel")))
    return CFSTR("headerLabelData");
  else
    return 0;
}

- (BOOL)usesSwiftUI
{
  return 1;
}

- (BOOL)needsSerializableCopy
{
  return 1;
}

- (id)serializableCopyWithImageProviders:(id)a3
{
  id v4;
  CLKComplicationTemplateGraphicRectangularStandardBody *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CLKComplicationTemplateGraphicRectangularStandardBody *v10;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicRectangularStandardBody alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerLabelData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge headerTextProvider](self, "headerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge body1TextProvider](self, "body1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge body2TextProvider](self, "body2TextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CLKComplicationTemplateGraphicRectangularStandardBody initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:](v5, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v6, v7, v8, v9);

  -[CLKComplicationTemplate setSdkVersion:](v10, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v10;
}

- (NSData)headerLabelData
{
  return self->_headerLabelData;
}

- (void)setHeaderLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabelData, a3);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CLKTextProvider)body2TextProvider
{
  return self->_body2TextProvider;
}

- (void)setBody2TextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body2TextProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerLabelData, 0);
}

@end
