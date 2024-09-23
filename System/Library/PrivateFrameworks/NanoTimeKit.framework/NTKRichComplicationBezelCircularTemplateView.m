@implementation NTKRichComplicationBezelCircularTemplateView

- (Class)_circularViewClassFromFromTemplate:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "circularTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKComplicationDisplayClassForTemplateAndFamily(v3, 10);

  return (Class)v4;
}

- (id)_bezelTextProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "textProvider");
}

- (id)_circularTemplateFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "circularTemplate");
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "circularTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = NTKComplicationDisplayClassForTemplateAndFamily(v5, 10);

    v7 = v6 != 0;
    if (!v6)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "circularTemplate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Failed to handle template %@ because there is not associated view for the circular template: %@", (uint8_t *)&v11, 0x16u);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 9;
}

@end
