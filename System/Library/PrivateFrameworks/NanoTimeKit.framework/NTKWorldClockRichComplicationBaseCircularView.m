@implementation NTKWorldClockRichComplicationBaseCircularView

- (NTKWorldClockRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  NTKWorldClockRichComplicationBaseCircularView *v4;
  NTKWorldClockRichComplicationBaseCircularView *v5;
  void *v6;
  __objc2_class *v7;
  uint64_t v8;
  NSObject *p_super;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v13, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    -[CDRichComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 12)
    {
      v7 = NTKWorldClockGraphicCircularExtraLargeView;
    }
    else
    {
      if (a3 != 10)
      {
        _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[NTKWorldClockRichComplicationBaseCircularView initWithFamily:].cold.1(a3, p_super);
        goto LABEL_9;
      }
      v7 = NTKWorldClockGraphicCircularView;
    }
    v8 = objc_msgSend([v7 alloc], "initFullColorImageViewWithDevice:", v6);
    p_super = &v5->_worldClockCircularView->super.super.super;
    v5->_worldClockCircularView = (NTKWorldClockGraphicCircularView *)v8;
LABEL_9:

    -[NTKWorldClockRichComplicationBaseCircularView _applyPaused](v5, "_applyPaused");
    -[CDRichComplicationView filterProvider](v5, "filterProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockGraphicCircularView setFilterProvider:](v5->_worldClockCircularView, "setFilterProvider:", v10);

    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5->_worldClockCircularView);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKWorldClockRichComplicationBaseCircularView _stopClockUpdates](self, "_stopClockUpdates");
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  -[NTKWorldClockRichComplicationBaseCircularView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NTKWorldClockGraphicCircularView setFrame:](self->_worldClockCircularView, "setFrame:", v5, v7, v9, v11);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NTKWorldClockGraphicCircularViewConfiguration *v19;
  id v20;

  objc_msgSend(a3, "metadata");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NTKWorldClockComplicationShowIdealizedTimeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NTKWorldClockComplicationIsPrivacyKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!(_DWORD)v9)
  {
    -[CDRichComplicationView timeTravelDate](self, "timeTravelDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CDRichComplicationView timeTravelDate](self, "timeTravelDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_9;
      goto LABEL_6;
    }
    if (!v7)
      goto LABEL_9;
  }
  NTKIdealizedDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_9:
    +[NTKDate faceDate](NTKDate, "faceDate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!(_DWORD)v9)
      goto LABEL_10;
    goto LABEL_7;
  }
LABEL_6:
  v12 = v10;
  v13 = v12;
  if (!(_DWORD)v9)
  {
LABEL_10:
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NTKWorldClockComplicationCityKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NTKWorldClockCityAbbreviation(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alCity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E6BCA6B8, "transitInfoForDate:city:", v12, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_7:
  NTKClockFaceLocalizedString(CFSTR("WORLDCLOCK_PRIVACY_REDACTION_TEXT"), CFSTR("--"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E6BCA6B8, "transitInfoForDate:location:", v12, 0.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NTKWorldClockComplicationTimeZoneKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NTKWorldClockGraphicCircularViewConfiguration initWithTimeZone:labelText:transitInfo:inTritium:overrideDate:isPrivacy:]([NTKWorldClockGraphicCircularViewConfiguration alloc], "initWithTimeZone:labelText:transitInfo:inTritium:overrideDate:isPrivacy:", v18, v14, v15, 0, v13, v9);
  -[NTKWorldClockGraphicCircularView applyConfiguration:animated:](self->_worldClockCircularView, "applyConfiguration:animated:", v19, -[NTKWorldClockRichComplicationBaseCircularView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", a4));
  -[NTKWorldClockRichComplicationBaseCircularView _applyPaused](self, "_applyPaused");

}

- (void)setPaused:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  -[CDRichComplicationView setPaused:](&v4, sel_setPaused_, a3);
  -[NTKWorldClockRichComplicationBaseCircularView _applyPaused](self, "_applyPaused");
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_applyPaused
{
  if (-[CDRichComplicationView paused](self, "paused"))
    -[NTKWorldClockRichComplicationBaseCircularView _stopClockUpdates](self, "_stopClockUpdates");
  else
    -[NTKWorldClockRichComplicationBaseCircularView _startClockUpdates](self, "_startClockUpdates");
}

- (void)_startClockUpdates
{
  -[NTKWorldClockGraphicCircularView resumeLiveFullColorImageView](self->_worldClockCircularView, "resumeLiveFullColorImageView");
}

- (void)_stopClockUpdates
{
  -[NTKWorldClockGraphicCircularView pauseLiveFullColorImageView](self->_worldClockCircularView, "pauseLiveFullColorImageView");
}

- (UIColor)daytimeBackgroundColor
{
  return -[NTKWorldClockGraphicCircularView daytimeBackgroundColor](self->_worldClockCircularView, "daytimeBackgroundColor");
}

- (void)setDaytimeBackgroundColor:(id)a3
{
  -[NTKWorldClockGraphicCircularView setDaytimeBackgroundColor:](self->_worldClockCircularView, "setDaytimeBackgroundColor:", a3);
}

- (UIColor)daytimeHandsColor
{
  return -[NTKWorldClockGraphicCircularView daytimeHandsColor](self->_worldClockCircularView, "daytimeHandsColor");
}

- (void)setDaytimeHandsColor:(id)a3
{
  -[NTKWorldClockGraphicCircularView setDaytimeHandsColor:](self->_worldClockCircularView, "setDaytimeHandsColor:", a3);
}

- (UIColor)nighttimeBackgroundColor
{
  return -[NTKWorldClockGraphicCircularView nighttimeBackgroundColor](self->_worldClockCircularView, "nighttimeBackgroundColor");
}

- (void)setNighttimeBackgroundColor:(id)a3
{
  -[NTKWorldClockGraphicCircularView setNighttimeBackgroundColor:](self->_worldClockCircularView, "setNighttimeBackgroundColor:", a3);
}

- (UIColor)nighttimeHandsColor
{
  return -[NTKWorldClockGraphicCircularView nighttimeHandsColor](self->_worldClockCircularView, "nighttimeHandsColor");
}

- (void)setNighttimeHandsColor:(id)a3
{
  -[NTKWorldClockGraphicCircularView setNighttimeHandsColor:](self->_worldClockCircularView, "setNighttimeHandsColor:", a3);
}

- (int64_t)tritiumUpdateMode
{
  return 1;
}

- (void)setTintedFraction:(double)a3
{
  -[NTKWorldClockGraphicCircularView setTintedFraction:](self->_worldClockCircularView, "setTintedFraction:", a3);
}

- (void)setTintedPlatterColor:(id)a3
{
  -[NTKWorldClockGraphicCircularView setTintedPlatterColor:](self->_worldClockCircularView, "setTintedPlatterColor:", a3);
}

- (void)setFilterProvider:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  v4 = a3;
  -[CDRichComplicationView setFilterProvider:](&v5, sel_setFilterProvider_, v4);
  -[NTKWorldClockGraphicCircularView setFilterProvider:](self->_worldClockCircularView, "setFilterProvider:", v4, v5.receiver, v5.super_class);

}

- (void)updateMonochromeColor
{
  -[NTKWorldClockGraphicCircularView updateMonochromeColor](self->_worldClockCircularView, "updateMonochromeColor");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKWorldClockGraphicCircularView transitionToMonochromeWithFraction:](self->_worldClockCircularView, "transitionToMonochromeWithFraction:", a3);
}

- (UIColor)daytimeHandsDotColor
{
  return self->_daytimeHandsDotColor;
}

- (void)setDaytimeHandsDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeHandsDotColor, a3);
}

- (UIColor)nighttimeHandsDotColor
{
  return self->_nighttimeHandsDotColor;
}

- (void)setNighttimeHandsDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeHandsDotColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nighttimeHandsDotColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsDotColor, 0);
  objc_storeStrong((id *)&self->_worldClockCircularView, 0);
}

- (void)initWithFamily:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NTKWorldClockRichComplicationBaseCircularView initWithFamily:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s world clock rich circular view creation: %ld", (uint8_t *)&v2, 0x16u);
}

@end
