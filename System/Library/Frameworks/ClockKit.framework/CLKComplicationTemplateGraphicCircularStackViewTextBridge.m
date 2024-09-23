@implementation CLKComplicationTemplateGraphicCircularStackViewTextBridge

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("contentData"), 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("content")))
    return CFSTR("contentData");
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
  CLKComplicationTemplateGraphicCircularStackImage *v5;
  void *v6;
  void *v7;
  CLKComplicationTemplateGraphicCircularStackImage *v8;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicCircularStackImage alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKComplicationTemplateGraphicCircularStackViewTextBridge textProvider](self, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CLKComplicationTemplateGraphicCircularStackImage initWithLine1ImageProvider:line2TextProvider:](v5, "initWithLine1ImageProvider:line2TextProvider:", v6, v7);

  -[CLKComplicationTemplate setSdkVersion:](v8, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v8;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
  objc_storeStrong((id *)&self->_contentData, a3);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
}

@end
