@implementation CLKComplicationTemplateModularLargeStandardBody

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return -[CLKComplicationTemplateModularLargeStandardBody initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:](self, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", 0, headerTextProvider, body1TextProvider, 0);
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  return -[CLKComplicationTemplateModularLargeStandardBody initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:](self, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", headerImageProvider, headerTextProvider, body1TextProvider, 0);
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  return -[CLKComplicationTemplateModularLargeStandardBody initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:](self, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", 0, headerTextProvider, body1TextProvider, body2TextProvider);
}

- (CLKComplicationTemplateModularLargeStandardBody)initWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  CLKImageProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  CLKComplicationTemplateModularLargeStandardBody *v14;
  CLKComplicationTemplateModularLargeStandardBody *v15;
  objc_super v17;

  v10 = headerImageProvider;
  v11 = headerTextProvider;
  v12 = body1TextProvider;
  v13 = body2TextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateModularLargeStandardBody;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateModularLargeStandardBody setHeaderImageProvider:](v14, "setHeaderImageProvider:", v10);
    -[CLKComplicationTemplateModularLargeStandardBody setHeaderTextProvider:](v15, "setHeaderTextProvider:", v11);
    -[CLKComplicationTemplateModularLargeStandardBody setBody1TextProvider:](v15, "setBody1TextProvider:", v12);
    -[CLKComplicationTemplateModularLargeStandardBody setBody2TextProvider:](v15, "setBody2TextProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = body1TextProvider;
  v7 = headerTextProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:body1TextProvider:", v7, v6);

  return (CLKComplicationTemplateModularLargeStandardBody *)v8;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider
{
  CLKTextProvider *v8;
  CLKTextProvider *v9;
  CLKImageProvider *v10;
  void *v11;

  v8 = body1TextProvider;
  v9 = headerTextProvider;
  v10 = headerImageProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:", v10, v9, v8);

  return (CLKComplicationTemplateModularLargeStandardBody *)v11;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  CLKTextProvider *v8;
  CLKTextProvider *v9;
  CLKTextProvider *v10;
  void *v11;

  v8 = body2TextProvider;
  v9 = body1TextProvider;
  v10 = headerTextProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:body1TextProvider:body2TextProvider:", v10, v9, v8);

  return (CLKComplicationTemplateModularLargeStandardBody *)v11;
}

+ (CLKComplicationTemplateModularLargeStandardBody)templateWithHeaderImageProvider:(CLKImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider body2TextProvider:(CLKTextProvider *)body2TextProvider
{
  CLKTextProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKImageProvider *v13;
  void *v14;

  v10 = body2TextProvider;
  v11 = body1TextProvider;
  v12 = headerTextProvider;
  v13 = headerImageProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateModularLargeStandardBody *)v14;
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
    {
      v3[2](v3, CFSTR("body1TextProvider"), 0, 1, &v4);
      if (!v4)
        v3[2](v3, CFSTR("body2TextProvider"), 1, 1, &v4);
    }
  }

}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;

  v4 = a3;
  v9 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  _ModularLargeImageSize(-[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), (uint64_t)&v7, (uint64_t)&v5);
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("headerImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);
  if (!v9)
    (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
     + 2))(v4, CFSTR("body1ImageProvider"), 1, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, char *))a3 + 2))(a3, CFSTR("shouldTruncateHeaderLeadingLabelFirst"), 0, &v3);
}

- (CLKImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKImageProvider *)headerImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerImageProvider, 80);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerTextProvider, 88);
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, body1TextProvider, 96);
}

- (CLKTextProvider)body2TextProvider
{
  return self->_body2TextProvider;
}

- (void)setBody2TextProvider:(CLKTextProvider *)body2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, body2TextProvider, 104);
}

- (CLKImageProvider)body1ImageProvider
{
  return self->_body1ImageProvider;
}

- (void)setBody1ImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CLKTextProvider)headerTrailingTextProvider
{
  return self->_headerTrailingTextProvider;
}

- (void)setHeaderTrailingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)shouldTruncateHeaderLeadingLabelFirst
{
  return self->_shouldTruncateHeaderLeadingLabelFirst;
}

- (void)setShouldTruncateHeaderLeadingLabelFirst:(BOOL)a3
{
  self->_shouldTruncateHeaderLeadingLabelFirst = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTrailingTextProvider, 0);
  objc_storeStrong((id *)&self->_body1ImageProvider, 0);
  objc_storeStrong((id *)&self->_body2TextProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
