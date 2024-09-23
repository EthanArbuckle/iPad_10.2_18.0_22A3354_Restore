@implementation NTKGreenfieldPlaceholderTimelineEntryModel

+ (id)entryModelWithNullState
{
  NTKGreenfieldPlaceholderTimelineEntryModel *v2;
  void *v3;

  v2 = objc_alloc_init(NTKGreenfieldPlaceholderTimelineEntryModel);
  v2->_modelState = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModel setEntryDate:](v2, "setEntryDate:", v3);

  return v2;
}

+ (id)entryModelWithAppIcon:(id)a3 appName:(id)a4 installationProgress:(float)a5
{
  UIImage *v7;
  id v8;
  NTKGreenfieldPlaceholderTimelineEntryModel *v9;
  UIImage *appIcon;
  UIImage *v11;
  uint64_t v12;
  NSString *appName;
  double v14;
  void *v15;

  v7 = (UIImage *)a3;
  v8 = a4;
  v9 = objc_alloc_init(NTKGreenfieldPlaceholderTimelineEntryModel);
  v9->_modelState = 1;
  appIcon = v9->_appIcon;
  v9->_appIcon = v7;
  v11 = v7;

  v12 = objc_msgSend(v8, "copy");
  appName = v9->_appName;
  v9->_appName = (NSString *)v12;

  v14 = fmin(a5, 1.0);
  if (v14 < 0.0)
    v14 = 0.0;
  v9->_installationProgress = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKTimelineEntryModel setEntryDate:](v9, "setEntryDate:", v15);
  return v9;
}

+ (id)placeholderImageForFamily:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 <= 0xC && ((0x1791u >> a3) & 1) != 0)
  {
    NTKImageNamed(off_1E6BCD9A0[a3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v3;

  if (self->_modelState == 1)
  {
    -[NTKGreenfieldPlaceholderTimelineEntryModel _installationTemplateForComplicationFamily:](self, "_installationTemplateForComplicationFamily:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "finalize");
  return v3;
}

- (id)_installationTemplateForComplicationFamily:(int64_t)a3
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 0:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _modularSmallTemplateForInstallation](self, "_modularSmallTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _modularLargeTemplateForInstallation](self, "_modularLargeTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 6:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _utilitarianSmallFlatTemplateForInstallation](self, "_utilitarianSmallFlatTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _utilitarianLargeTemplateForInstallation](self, "_utilitarianLargeTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _circularSmallTemplateForInstallation](self, "_circularSmallTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _extraLargeTemplateForInstallation](self, "_extraLargeTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicCornerTemplateForInstallation](self, "_graphicCornerTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicBezelTemplateForInstallation](self, "_graphicBezelTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicCircularTemplateForInstallation](self, "_graphicCircularTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicRectangularTemplateForInstallation](self, "_graphicRectangularTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicExtraLargeTemplateForInstallation](self, "_graphicExtraLargeTemplateForInstallation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_graphicRectangularTemplateForInstallation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->_appName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C94530];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _downloadTextWithIsUpperCased:](self, "_downloadTextWithIsUpperCased:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProviderWithText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderTextProvider:body1TextProvider:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_utilitarianSmallFlatTemplateForInstallation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->_appName);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94468], "templateWithTextProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_utilitarianLargeTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C94530];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _downloadTextWithIsUpperCased:](self, "_downloadTextWithIsUpperCased:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_graphicCircularTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94260];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderFullColorImageProvider](self, "_placeholderFullColorImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_modularSmallTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94438];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderImageProvider](self, "_placeholderImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_modularLargeTemplateForInstallation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->_appName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C94530];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _downloadTextWithIsUpperCased:](self, "_downloadTextWithIsUpperCased:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProviderWithText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_circularSmallTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C941A0];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderImageProvider](self, "_placeholderImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_graphicCornerTemplateForInstallation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C94530];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _downloadTextWithIsUpperCased:](self, "_downloadTextWithIsUpperCased:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProviderWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C94308];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderFullColorImageProvider](self, "_placeholderFullColorImageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "templateWithTextProvider:imageProvider:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_graphicBezelTemplateForInstallation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C94530];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _downloadTextWithIsUpperCased:](self, "_downloadTextWithIsUpperCased:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProviderWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C94238];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _graphicCircularTemplateForInstallation](self, "_graphicCircularTemplateForInstallation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "templateWithCircularTemplate:textProvider:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_extraLargeTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94218];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderImageProvider](self, "_placeholderImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_graphicExtraLargeTemplateForInstallation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94330];
  -[NTKGreenfieldPlaceholderTimelineEntryModel _placeholderFullColorImageProvider](self, "_placeholderFullColorImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_downloadTextWithIsUpperCased:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_DOWNLOADING_TEXT"), CFSTR("Downloading..."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseStringWithLocale:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)_placeholderFullColorImageProvider
{
  void *v3;
  void *v4;
  UIImage *appIcon;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_installationProgress);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("NTKGreenfieldPlaceholderTimelineEntryModelProgressKey"));

  appIcon = self->_appIcon;
  if (appIcon)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", appIcon, CFSTR("NTKGreenfieldPlaceholderTimelineEntryModelIconKey"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "placeholderImageForFamily:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NTKGreenfieldPlaceholderTimelineEntryModelIconKey"));

  }
  objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v7, "setMetadata:", v8);

  return v7;
}

- (id)_placeholderImageProvider
{
  void *v3;

  +[NTKGreenfieldPlaceholderImageProvider provider](NTKGreenfieldPlaceholderImageProvider, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppIcon:", self->_appIcon);
  objc_msgSend(v3, "setProgress:", self->_installationProgress);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
}

@end
