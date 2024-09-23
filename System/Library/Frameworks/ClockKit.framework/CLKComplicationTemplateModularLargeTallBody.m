@implementation CLKComplicationTemplateModularLargeTallBody

- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateModularLargeTallBody *v8;
  CLKComplicationTemplateModularLargeTallBody *v9;
  objc_super v11;

  v6 = headerTextProvider;
  v7 = bodyTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateModularLargeTallBody;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateModularLargeTallBody setHeaderTextProvider:](v8, "setHeaderTextProvider:", v6);
    -[CLKComplicationTemplateModularLargeTallBody setBodyTextProvider:](v9, "setBodyTextProvider:", v7);
  }

  return v9;
}

- (CLKComplicationTemplateModularLargeTallBody)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLKComplicationTemplateModularLargeTallBody *v11;
  CLKComplicationTemplateModularLargeTallBody *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateModularLargeTallBody;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKComplicationTemplateModularLargeTallBody setHeaderImageProvider:](v11, "setHeaderImageProvider:", v8);
    -[CLKComplicationTemplateModularLargeTallBody setHeaderTextProvider:](v12, "setHeaderTextProvider:", v9);
    -[CLKComplicationTemplateModularLargeTallBody setBodyTextProvider:](v12, "setBodyTextProvider:", v10);
  }

  return v12;
}

+ (CLKComplicationTemplateModularLargeTallBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider bodyTextProvider:(CLKTextProvider *)bodyTextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = bodyTextProvider;
  v7 = headerTextProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:bodyTextProvider:", v7, v6);

  return (CLKComplicationTemplateModularLargeTallBody *)v8;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:bodyTextProvider:", v10, v9, v8);

  return v11;
}

- (int64_t)compatibleFamily
{
  return 1;
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
    v3[2](v3, CFSTR("headerTrailingTextProvider"), 1, 1, &v4);
    if (!v4)
      v3[2](v3, CFSTR("bodyTextProvider"), 0, 1, &v4);
  }

}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, char *))a3 + 2))(a3, CFSTR("shouldTruncateHeaderLeadingLabelFirst"), 0, &v3);
}

- (void)_enumerateDateKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, char *))a3 + 2))(a3, CFSTR("contentDate"), 0, &v3);
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;

  v9 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = a3;
  _ModularLargeImageSize(-[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("headerImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

- (NSDate)contentDate
{
  void *v2;
  void *v3;

  -[CLKComplicationTemplateModularLargeTallBody additionalContentAttributes](self, "additionalContentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NTKUpNextEventBeginDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setContentDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CLKComplicationTemplateModularLargeTallBody additionalContentAttributes](self, "additionalContentAttributes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1B8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v11 = (id)objc_msgSend(v8, "mutableCopy");
  v9 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("NTKUpNextEventBeginDateKey"));
  v10 = (void *)objc_msgSend(v11, "copy");
  -[CLKComplicationTemplateModularLargeTallBody setAdditionalContentAttributes:](self, "setAdditionalContentAttributes:", v10);

}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerTextProvider, 80);
}

- (CLKTextProvider)bodyTextProvider
{
  return self->_bodyTextProvider;
}

- (void)setBodyTextProvider:(CLKTextProvider *)bodyTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, bodyTextProvider, 88);
}

- (CLKTextProvider)headerTrailingTextProvider
{
  return self->_headerTrailingTextProvider;
}

- (void)setHeaderTrailingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)shouldTruncateHeaderLeadingLabelFirst
{
  return self->_shouldTruncateHeaderLeadingLabelFirst;
}

- (void)setShouldTruncateHeaderLeadingLabelFirst:(BOOL)a3
{
  self->_shouldTruncateHeaderLeadingLabelFirst = a3;
}

- (NSDictionary)additionalContentAttributes
{
  return self->_additionalContentAttributes;
}

- (void)setAdditionalContentAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CLKImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
  objc_storeStrong((id *)&self->_additionalContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerTrailingTextProvider, 0);
  objc_storeStrong((id *)&self->_bodyTextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
}

@end
