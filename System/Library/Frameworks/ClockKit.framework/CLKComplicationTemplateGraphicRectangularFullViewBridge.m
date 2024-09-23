@implementation CLKComplicationTemplateGraphicRectangularFullViewBridge

- (int64_t)compatibleFamily
{
  return 11;
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
  CLKComplicationTemplateGraphicRectangularFullImage *v5;
  void *v6;
  CLKComplicationTemplateGraphicRectangularFullImage *v7;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicRectangularFullImage alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CLKComplicationTemplateGraphicRectangularFullImage initWithImageProvider:](v5, "initWithImageProvider:", v6);
  -[CLKComplicationTemplate setSdkVersion:](v7, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v7;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
  objc_storeStrong((id *)&self->_contentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentData, 0);
}

@end
