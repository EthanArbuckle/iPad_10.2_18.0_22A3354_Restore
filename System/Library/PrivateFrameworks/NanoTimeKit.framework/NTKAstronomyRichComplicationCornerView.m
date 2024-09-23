@implementation NTKAstronomyRichComplicationCornerView

- (id)_outerView
{
  NTKAstronomyRichComplicationContentView *astronomyContentView;
  double v4;
  double v5;
  NTKAstronomyRichComplicationContentView *v6;
  void *v7;
  NTKAstronomyRichComplicationContentView *v8;
  NTKAstronomyRichComplicationContentView *v9;

  astronomyContentView = self->_astronomyContentView;
  if (!astronomyContentView)
  {
    -[CDRichComplicationCornerTextCustomView _outerViewDiameter](self, "_outerViewDiameter");
    v5 = v4;
    v6 = [NTKAstronomyRichComplicationContentView alloc];
    -[CDRichComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTKAstronomyRichComplicationContentView initForDevice:family:diameter:](v6, "initForDevice:family:diameter:", v7, 10, v5);
    v9 = self->_astronomyContentView;
    self->_astronomyContentView = v8;

    astronomyContentView = self->_astronomyContentView;
  }
  return astronomyContentView;
}

- (void)_applyPausedUpdate
{
  -[NTKAstronomyRichComplicationContentView applyPausedUpdate:](self->_astronomyContentView, "applyPausedUpdate:", -[CDRichComplicationView paused](self, "paused"));
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  NTKAstronomyRichComplicationContentView *astronomyContentView;
  void *v7;

  astronomyContentView = self->_astronomyContentView;
  objc_msgSend(a3, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAstronomyRichComplicationContentView handleTemplateMetadata:reason:](astronomyContentView, "handleTemplateMetadata:reason:", v7, a4);

  -[NTKAstronomyRichComplicationCornerView _updateInnerLabel](self, "_updateInnerLabel");
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[NTKAstronomyRichComplicationContentView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_astronomyContentView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyRichComplicationCornerView;
  v6 = a3;
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](&v7, sel_setTimeTravelDate_animated_, v6, v4);
  -[NTKAstronomyRichComplicationContentView setTimeTravelDate:animated:](self->_astronomyContentView, "setTimeTravelDate:animated:", v6, v4, v7.receiver, v7.super_class);

  -[NTKAstronomyRichComplicationCornerView _updateInnerLabel](self, "_updateInnerLabel");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationCornerView;
  -[CDRichComplicationView setEditing:](&v5, sel_setEditing_);
  -[NTKAstronomyRichComplicationContentView setEditing:](self->_astronomyContentView, "setEditing:", v3);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 2, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseTextView innerLabel](self, "innerLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v11);

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, 4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKAstronomyRichComplicationContentView layer](self->_astronomyContentView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilters:", v9);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseTextView innerLabel](self, "innerLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v9);

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKAstronomyRichComplicationContentView layer](self->_astronomyContentView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v7);

}

- (void)_updateInnerLabel
{
  NTKAstronomyRichComplicationCornerView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NTKAstronomyRichComplicationCornerView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  -[CDRichComplicationTemplateView template](self, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("current date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("current location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("any location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CDRichComplicationView timeTravelDate](v2, "timeTravelDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478595;
    v31 = v6;
    v32 = 2113;
    v33 = v7;
    v34 = 2112;
    v35 = v5;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKAstronomyRichComplicationCornerView create moon phase model with currentLocation:%{private}@ anyLocation:%{private}@ entryDate:%@ timeTravelDate:%@", buf, 0x2Au);

  }
  -[CDRichComplicationView timeTravelDate](v2, "timeTravelDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CDRichComplicationView timeTravelDate](v2, "timeTravelDate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v5;
  }
  v12 = v11;

  v13 = objc_alloc(MEMORY[0x1E0D518D8]);
  if (v6)
    v14 = v6;
  else
    v14 = v7;
  v15 = (void *)objc_msgSend(v13, "initWithDate:location:", v12, v14);
  objc_msgSend(v15, "eventDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v16;
    _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "NTKAstronomyRichComplicationCornerView created NUNIMoonPhaseModel with date:%@", buf, 0xCu);
  }

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C94560], "textProviderWithDate:", v16);
    v29 = v15;
    v18 = v2;
    v19 = v4;
    v20 = v6;
    v21 = v12;
    v22 = v7;
    v23 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94508], "textProviderWithDate:style:units:", v16, 3, 96);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@, %@"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
    v7 = v22;
    v12 = v21;
    v6 = v20;
    v4 = v19;
    v2 = v18;
    v15 = v29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", &stru_1E6BDC918);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  NTKAstronomyComplicationForegroundColor(1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTintColor:", v27);

  -[CDRichComplicationCornerBaseTextView innerLabel](v2, "innerLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextProvider:", v26);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_astronomyContentView, 0);
}

@end
