@implementation CPMapTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMapTemplate)init
{
  CPMapTemplate *v2;
  CPMapTemplate *v3;
  uint64_t v4;
  NSMutableDictionary *postedBannerObjects;
  NAFuture *v6;
  NAFuture *navigationSessionProviderFuture;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPMapTemplate;
  v2 = -[CPTemplate init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_automaticallyHidesNavigationBar = 1;
    v2->_hidesButtonsWithNavigationBar = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    postedBannerObjects = v3->_postedBannerObjects;
    v3->_postedBannerObjects = (NSMutableDictionary *)v4;

    v3->_tripEstimateStyle = 1;
    v6 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    navigationSessionProviderFuture = v3->_navigationSessionProviderFuture;
    v3->_navigationSessionProviderFuture = v6;

  }
  return v3;
}

- (CPMapTemplate)initWithCoder:(id)a3
{
  id v4;
  CPMapTemplate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *mapButtons;
  void *v11;
  void *v12;
  uint64_t v13;
  UIColor *guidanceBackgroundColor;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPMapTemplate;
  v5 = -[CPTemplate initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPMapTemplateMapButtonsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    mapButtons = v5->_mapButtons;
    v5->_mapButtons = (NSArray *)v9;

    v5->_automaticallyHidesNavigationBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPMapTemplateAutoHidesNavigationBarKey"));
    v5->_hidesButtonsWithNavigationBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPMapTemplateHidesButtonsWithNavigationBarKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMapTemplateGuidanceBackgroundColorKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      CPSanitizedBackgroundColor(v11);
      v13 = objc_claimAutoreleasedReturnValue();
      guidanceBackgroundColor = v5->_guidanceBackgroundColor;
      v5->_guidanceBackgroundColor = (UIColor *)v13;

    }
    v5->_tripEstimateStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPMapTemplateTripEstimateStyleKey"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPMapTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPMapTemplate mapButtons](self, "mapButtons", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPMapTemplateMapButtonsKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapTemplate automaticallyHidesNavigationBar](self, "automaticallyHidesNavigationBar"), CFSTR("kCPMapTemplateAutoHidesNavigationBarKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapTemplate hidesButtonsWithNavigationBar](self, "hidesButtonsWithNavigationBar"), CFSTR("kCPMapTemplateHidesButtonsWithNavigationBarKey"));
  -[CPMapTemplate guidanceBackgroundColor](self, "guidanceBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPMapTemplateGuidanceBackgroundColorKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMapTemplate tripEstimateStyle](self, "tripEstimateStyle"), CFSTR("kCPMapTemplateTripEstimateStyleKey"));
}

- (void)setGuidanceBackgroundColor:(UIColor *)guidanceBackgroundColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;
  void *v7;
  UIColor *v8;
  id v9;
  _QWORD v10[4];
  UIColor *v11;

  if (self->_guidanceBackgroundColor != guidanceBackgroundColor)
  {
    CPSanitizedBackgroundColor(guidanceBackgroundColor);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_guidanceBackgroundColor;
    self->_guidanceBackgroundColor = v4;

    v6 = self->_guidanceBackgroundColor;
    -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__CPMapTemplate_setGuidanceBackgroundColor___block_invoke;
    v10[3] = &unk_24C77CC40;
    v11 = v6;
    v8 = v6;
    v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v10);

  }
}

uint64_t __44__CPMapTemplate_setGuidanceBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostGuidanceBackgroundColor:", *(_QWORD *)(a1 + 32));
}

- (void)setTripEstimateStyle:(CPTripEstimateStyle)tripEstimateStyle
{
  void *v4;
  id v5;
  _QWORD v6[5];

  if (self->_tripEstimateStyle != tripEstimateStyle)
  {
    self->_tripEstimateStyle = tripEstimateStyle;
    -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__CPMapTemplate_setTripEstimateStyle___block_invoke;
    v6[3] = &__block_descriptor_40_e34_v16__0___CPMapTemplateProviding__8l;
    v6[4] = tripEstimateStyle;
    v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

  }
}

uint64_t __38__CPMapTemplate_setTripEstimateStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostTripEstimateStyle:", *(_QWORD *)(a1 + 32));
}

- (void)setAutomaticallyHidesNavigationBar:(BOOL)automaticallyHidesNavigationBar
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  CPMapTemplate *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = automaticallyHidesNavigationBar;
  v15 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "%@: Set automatically hides navigation bar: %@", buf, 0x16u);

  }
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__CPMapTemplate_setAutomaticallyHidesNavigationBar___block_invoke;
  v9[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  v10 = v3;
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

  self->_automaticallyHidesNavigationBar = v3;
}

uint64_t __52__CPMapTemplate_setAutomaticallyHidesNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostAutoHidesNavigationBar:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setHidesButtonsWithNavigationBar:(BOOL)hidesButtonsWithNavigationBar
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  CPMapTemplate *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = hidesButtonsWithNavigationBar;
  v15 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "%@: Set hides buttons with navigation bar: %@", buf, 0x16u);

  }
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CPMapTemplate_setHidesButtonsWithNavigationBar___block_invoke;
  v9[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  v10 = v3;
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

  self->_hidesButtonsWithNavigationBar = v3;
}

uint64_t __50__CPMapTemplate_setHidesButtonsWithNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostHidesButtonsWithNavigationBar:", *(unsigned __int8 *)(a1 + 32));
}

- (void)showTripPreviews:(NSArray *)tripPreviews textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
  -[CPMapTemplate showTripPreviews:selectedTrip:textConfiguration:](self, "showTripPreviews:selectedTrip:textConfiguration:", tripPreviews, 0, textConfiguration);
}

- (void)showTripPreviews:(NSArray *)tripPreviews selectedTrip:(CPTrip *)selectedTrip textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
  NSArray *v9;
  CPTrip *v10;
  CPTripPreviewTextConfiguration *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  CPTripPreviewTextConfiguration *v16;
  id v17;
  NSArray *v18;
  NSArray *v19;
  _QWORD v20[4];
  NSArray *v21;
  CPTripPreviewTextConfiguration *v22;
  uint64_t v23;

  v9 = tripPreviews;
  v10 = selectedTrip;
  v11 = textConfiguration;
  if (-[NSArray containsObject:](v9, "containsObject:", v10))
  {
    v12 = -[NSArray indexOfObject:](v9, "indexOfObject:", v10);
    if (!v11)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12 = 0;
  if (v11)
  {
LABEL_5:
    v13 = objc_opt_class();
    CPAssertAllowedClass(v11, v13, a2);
  }
LABEL_6:
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__CPMapTemplate_showTripPreviews_selectedTrip_textConfiguration___block_invoke;
  v20[3] = &unk_24C77D708;
  v15 = v9;
  v21 = v15;
  v22 = v11;
  v23 = v12;
  v16 = v11;
  v17 = (id)objc_msgSend(v14, "addSuccessBlock:", v20);

  v18 = self->_tripPreviews;
  self->_tripPreviews = v15;
  v19 = v15;

}

uint64_t __65__CPMapTemplate_showTripPreviews_selectedTrip_textConfiguration___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:", a1[4], a1[5], 0, a1[6]);
}

- (void)showRouteChoicesPreviewForTrip:(CPTrip *)tripPreview textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
  CPTrip *v7;
  CPTripPreviewTextConfiguration *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CPTripPreviewTextConfiguration *v12;
  CPTrip *v13;
  id v14;
  NSArray *v15;
  NSArray *tripPreviews;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CPTrip *v21;
  CPTripPreviewTextConfiguration *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = tripPreview;
  v8 = textConfiguration;
  v9 = objc_opt_class();
  CPAssertAllowedClass(v7, v9, a2);
  if (v8)
  {
    v10 = objc_opt_class();
    CPAssertAllowedClass(v8, v10, a2);
  }
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __66__CPMapTemplate_showRouteChoicesPreviewForTrip_textConfiguration___block_invoke;
  v20 = &unk_24C77D730;
  v21 = v7;
  v22 = v8;
  v12 = v8;
  v13 = v7;
  v14 = (id)objc_msgSend(v11, "addSuccessBlock:", &v17);

  v23[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1, v17, v18, v19, v20);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tripPreviews = self->_tripPreviews;
  self->_tripPreviews = v15;

}

void __66__CPMapTemplate_showRouteChoicesPreviewForTrip_textConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:", v5, *(_QWORD *)(a1 + 40), 1, 0, v6, v7);

}

- (void)hideTripPreviews
{
  void *v3;
  id v4;
  NSArray *tripPreviews;

  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", &__block_literal_global_11);

  tripPreviews = self->_tripPreviews;
  self->_tripPreviews = (NSArray *)MEMORY[0x24BDBD1A8];

}

uint64_t __33__CPMapTemplate_hideTripPreviews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:", MEMORY[0x24BDBD1A8], 0, 0, 0);
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip
{
  -[CPMapTemplate updateTravelEstimates:forTrip:withTimeRemainingColor:](self, "updateTravelEstimates:forTrip:withTimeRemainingColor:", estimates, trip, 0);
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip withTimeRemainingColor:(CPTimeRemainingColor)timeRemainingColor
{
  CPTravelEstimates *v8;
  CPTrip *v9;
  void *v10;
  CPTrip *v11;
  CPTravelEstimates *v12;
  id v13;
  _QWORD v14[4];
  CPTravelEstimates *v15;
  CPTrip *v16;

  v8 = estimates;
  v9 = trip;
  -[CPTravelEstimates setTimeRemainingColor:](v8, "setTimeRemainingColor:", timeRemainingColor);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__CPMapTemplate_updateTravelEstimates_forTrip_withTimeRemainingColor___block_invoke;
  v14[3] = &unk_24C77D730;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  v13 = (id)objc_msgSend(v10, "addSuccessBlock:", v14);

}

void __70__CPMapTemplate_updateTravelEstimates_forTrip_withTimeRemainingColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostUpdateTravelEstimates:forTripIdentifier:", v2, v5);

}

- (CPNavigationSession)startNavigationSessionForTrip:(CPTrip *)trip
{
  CPTrip *v4;
  NSObject *v5;
  CPNavigationSession *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  void *v17;
  CPNavigationSession *v18;
  CPTrip *v19;
  id v20;
  CPNavigationSession *v21;
  CPNavigationSession *v22;
  _QWORD v24[4];
  CPTrip *v25;
  CPMapTemplate *v26;
  CPNavigationSession *v27;
  uint8_t buf[4];
  CPTrip *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = trip;
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Starting navigation session for trip: %@.", buf, 0xCu);
  }

  v6 = -[CPNavigationSession initWithTrip:mapTemplate:]([CPNavigationSession alloc], "initWithTrip:mapTemplate:", v4, self);
  -[CPMapTemplate mapDelegate](self, "mapDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CPMapTemplate mapDelegate](self, "mapDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mapTemplateShouldProvideNavigationMetadata:", self);

    -[CPNavigationSession setSendsNavigationMetadata:](v6, "setSendsNavigationMetadata:", v10);
    -[CPTrip setSendsNavigationMetadata:](v4, "setSendsNavigationMetadata:", v10);
  }
  -[CPTrip destinationNameVariants](v4, "destinationNameVariants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationSession setDestinationNameVariants:](v6, "setDestinationNameVariants:", v11);

  -[CPMapTemplate navigationSessionProviderFuture](self, "navigationSessionProviderFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isFinished");

  CarPlayFrameworkGeneralLogging();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Navigation session provider already connected";
LABEL_10:
      _os_log_impl(&dword_20D6F4000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    v16 = "Navigation session provider not connected";
    goto LABEL_10;
  }

  -[CPMapTemplate navigationSessionProviderFuture](self, "navigationSessionProviderFuture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke;
  v24[3] = &unk_24C77D778;
  v25 = v4;
  v26 = self;
  v18 = v6;
  v27 = v18;
  v19 = v4;
  v20 = (id)objc_msgSend(v17, "addSuccessBlock:", v24);

  v21 = v27;
  v22 = v18;

  return v22;
}

void __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;
  uint8_t buf[16];

  v3 = a2;
  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Starting navigation session on host", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke_26;
  v7[3] = &unk_24C77C940;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "hostStartNavigationSessionForTrip:reply:", v5, v7);

}

void __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Navigation session started", (uint8_t *)&v9, 2u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count"))
  {
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Hiding trip previews card for trip %@.", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 184);
    *(_QWORD *)(v7 + 184) = MEMORY[0x24BDBD1A8];

  }
  objc_msgSend(*(id *)(a1 + 48), "setManager:", v3);

}

- (void)setNavigationSessionProvider:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_navigationSessionProvider, a3);
  v5 = a3;
  -[CPMapTemplate navigationSessionProviderFuture](self, "navigationSessionProviderFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v5);

}

- (BOOL)mapButton:(id)a3 setHidden:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__CPMapTemplate_mapButton_setHidden___block_invoke;
  v11[3] = &unk_24C77D7A0;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v11);

  return 1;
}

void __37__CPMapTemplate_mapButton_setHidden___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapButton:hidden:", v5, *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)mapButton:(id)a3 setImageSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__CPMapTemplate_mapButton_setImageSet___block_invoke;
  v13[3] = &unk_24C77D730;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v13);

  return 1;
}

void __39__CPMapTemplate_mapButton_setImageSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostSetMapButton:imageSet:", v5, *(_QWORD *)(a1 + 40));

}

- (BOOL)mapButton:(id)a3 setFocusedImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__CPMapTemplate_mapButton_setFocusedImage___block_invoke;
  v13[3] = &unk_24C77D730;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v13);

  return 1;
}

void __43__CPMapTemplate_mapButton_setFocusedImage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapButton:focusedImage:", v5, *(_QWORD *)(a1 + 40));

}

- (void)presentNavigationAlert:(CPNavigationAlert *)navigationAlert animated:(BOOL)animated
{
  CPNavigationAlert *v7;
  NSObject *v8;
  void *v9;
  CPNavigationAlert *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  CPNavigationAlert *v16;
  BOOL v17;
  uint8_t buf[4];
  CPMapTemplate *v19;
  __int16 v20;
  CPNavigationAlert *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = navigationAlert;
  -[CPNavigationAlert setNavigationAlertUpdateTarget:](v7, "setNavigationAlertUpdateTarget:", self);
  objc_storeStrong((id *)&self->_currentNavigationAlert, navigationAlert);
  CarPlayFrameworkGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_INFO, "%@: Presenting navigation alert: %@", buf, 0x16u);
  }

  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __49__CPMapTemplate_presentNavigationAlert_animated___block_invoke;
  v15 = &unk_24C77D7A0;
  v16 = v7;
  v17 = animated;
  v10 = v7;
  v11 = (id)objc_msgSend(v9, "addSuccessBlock:", &v12);

  -[CPMapTemplate _postBannerIfNecessaryForNavigationAlert:](self, "_postBannerIfNecessaryForNavigationAlert:", v10, v12, v13, v14, v15);
}

uint64_t __49__CPMapTemplate_presentNavigationAlert_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showNavigationAlert:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)dismissNavigationAlertAnimated:(BOOL)animated completion:(void *)completion
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = completion;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke;
  v10[3] = &unk_24C77D818;
  v12 = animated;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v10);

}

void __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_2;
  v4[3] = &unk_24C77D7F0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "dismissNavigationAlertAnimated:completion:", v3, v4);

}

void __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_3;
  v3[3] = &unk_24C77D7C8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_updateNavigationAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  CPMapTemplate *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_INFO, "%@: Updating navigation alert: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMapTemplate currentNavigationAlert](self, "currentNavigationAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__CPMapTemplate__updateNavigationAlert___block_invoke;
    v12[3] = &unk_24C77CC40;
    v13 = v4;
    v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

  }
}

uint64_t __40__CPMapTemplate__updateNavigationAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNavigationAlert:", *(_QWORD *)(a1 + 32));
}

- (void)setMapButtons:(NSArray *)mapButtons
{
  uint64_t v4;
  NSArray *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  id v12;
  _QWORD v13[4];
  NSArray *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];

  v4 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __31__CPMapTemplate_setMapButtons___block_invoke;
  v17[3] = &__block_descriptor_40_e28_v32__0__CPMapButton_8Q16_B24l;
  v17[4] = a2;
  v5 = mapButtons;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v17);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_mapButtons, "makeObjectsPerformSelector:withObject:", sel_setControlDelegate_, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __31__CPMapTemplate_setMapButtons___block_invoke_2;
  v15[3] = &unk_24C77D860;
  v15[4] = self;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v15);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_mapButtons;
  self->_mapButtons = v7;

  v9 = self->_mapButtons;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __31__CPMapTemplate_setMapButtons___block_invoke_3;
  v13[3] = &unk_24C77CC40;
  v14 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v13);

}

void __31__CPMapTemplate_setMapButtons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_opt_class();
  CPAssertAllowedClass(v4, v3, *(const char **)(a1 + 32));

}

void __31__CPMapTemplate_setMapButtons___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  id v6;

  if (a3 == 4)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a2;
    objc_msgSend(v6, "setControlDelegate:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

uint64_t __31__CPMapTemplate_setMapButtons___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hostSetMapButtons:", *(_QWORD *)(a1 + 32));
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentNavigationAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentNavigationAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v6);

    if ((_DWORD)v3)
    {
      CarPlayFrameworkGeneralLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_INFO, "%@: Activated navigation alert primary action with control identifier: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "currentNavigationAlert");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "primaryAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v19 = v11;
      __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_2((uint64_t)v11, v11);

      return;
    }
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentNavigationAlert");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secondaryAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isEqual:", v15);

    if ((_DWORD)v12)
    {
      CarPlayFrameworkGeneralLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_20D6F4000, v16, OS_LOG_TYPE_INFO, "%@: Activated navigation alert secondary action with control identifier: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "currentNavigationAlert");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "secondaryAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  v39 = 0;
  objc_msgSend(*(id *)(a1 + 32), "mapButtons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_38;
  v27[3] = &unk_24C77D888;
  v28 = *(id *)(a1 + 40);
  v29 = buf;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v27);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    CarPlayFrameworkGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v30 = 138412802;
      v31 = v23;
      v32 = 2112;
      v33 = v22;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_20D6F4000, v21, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", v30, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "handlePrimaryAction");
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 40);
    v26.receiver = *(id *)(a1 + 32);
    v26.super_class = (Class)CPMapTemplate;
    objc_msgSendSuper2(&v26, sel_handleActionForControlIdentifier_, v25);
  }

  _Block_object_dispose(buf, 8);
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_3;
    block[3] = &unk_24C77C5B0;
    v5 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_3(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_38(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_resolveTrip:(id)a3 routeChoice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  -[CPMapTemplate tripPreviews](self, "tripPreviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1758];
  v13 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke;
  v30[3] = &unk_24C77D8B0;
  v14 = v8;
  v31 = v14;
  objc_msgSend(v12, "predicateWithBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "routeChoices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1758];
  v25 = v13;
  v26 = 3221225472;
  v27 = __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke_2;
  v28 = &unk_24C77D8D8;
  v20 = v9;
  v29 = v20;
  objc_msgSend(v19, "predicateWithBlock:", &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v21, v25, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && v23)
  {
    if (v10)
      v10[2](v10, v17, v23);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CPMapTemplate _resolveTrip:routeChoice:completion:].cold.1((uint64_t)v14, (uint64_t)v20, v24);

  }
}

uint64_t __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)previewTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke;
  block[3] = &unk_24C77D928;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2;
  v7[3] = &unk_24C77D900;
  v5 = *(void **)(a1 + 32);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  objc_msgSend(v5, "_resolveTrip:routeChoice:completion:", v4, v3, v7);

}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapTemplate:selectedPreviewForTrip:usingRouteChoice:", *(_QWORD *)(a1 + 40), v5, v6);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)startTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke;
  block[3] = &unk_24C77D928;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2;
  v7[3] = &unk_24C77D900;
  v5 = *(void **)(a1 + 32);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  objc_msgSend(v5, "_resolveTrip:routeChoice:completion:", v4, v3, v7);

}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapTemplate:startedTrip:usingRouteChoice:", *(_QWORD *)(a1 + 40), v5, v6);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)showPanningInterfaceAnimated:(BOOL)animated
{
  void *v4;
  id v5;
  _QWORD v6[4];
  BOOL v7;

  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__CPMapTemplate_showPanningInterfaceAnimated___block_invoke;
  v6[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  v7 = animated;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

uint64_t __46__CPMapTemplate_showPanningInterfaceAnimated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hostSetPanInterfaceVisible:animated:", 1, *(unsigned __int8 *)(a1 + 32));
}

- (void)dismissPanningInterfaceAnimated:(BOOL)animated
{
  void *v4;
  id v5;
  _QWORD v6[4];
  BOOL v7;

  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CPMapTemplate_dismissPanningInterfaceAnimated___block_invoke;
  v6[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  v7 = animated;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

uint64_t __49__CPMapTemplate_dismissPanningInterfaceAnimated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hostSetPanInterfaceVisible:animated:", 0, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isPanningInterfaceVisible
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  dispatch_time_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke;
  v9[3] = &unk_24C77D978;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  v6 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);

  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v7);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke_2;
  v5[3] = &unk_24C77D950;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "hostPanInterfaceVisible:", v5);

}

intptr_t __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clientTripAlreadyStartedException
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_49);
}

void __50__CPMapTemplate_clientTripAlreadyStartedException__block_invoke()
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Attempted to start a new navigation session while one is already active."));
  exit(-1);
}

- (void)clientPanViewDidAppear
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CPMapTemplate_clientPanViewDidAppear__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __39__CPMapTemplate_clientPanViewDidAppear__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplateDidShowPanningInterface:", *(_QWORD *)(a1 + 32));

  }
}

- (void)clientPanViewWillDisappear
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CPMapTemplate_clientPanViewWillDisappear__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __43__CPMapTemplate_clientPanViewWillDisappear__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplateWillDismissPanningInterface:", *(_QWORD *)(a1 + 32));

  }
}

- (void)clientPanViewDidDisappear
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CPMapTemplate_clientPanViewDidDisappear__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __42__CPMapTemplate_clientPanViewDidDisappear__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplateDidDismissPanningInterface:", *(_QWORD *)(a1 + 32));

  }
}

- (void)clientPanBeganWithDirection:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CPMapTemplate_clientPanBeganWithDirection___block_invoke;
  v3[3] = &unk_24C77C8A0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __45__CPMapTemplate_clientPanBeganWithDirection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplate:panBeganWithDirection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)clientPanEndedWithDirection:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CPMapTemplate_clientPanEndedWithDirection___block_invoke;
  v3[3] = &unk_24C77C8A0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __45__CPMapTemplate_clientPanEndedWithDirection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplate:panEndedWithDirection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)clientPanGestureBegan
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CPMapTemplate_clientPanGestureBegan__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__CPMapTemplate_clientPanGestureBegan__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplateDidBeginPanGesture:", *(_QWORD *)(a1 + 32));

  }
}

- (void)clientPanGestureWithDeltaPoint:(CGPoint)a3 velocity:(CGPoint)a4
{
  _QWORD block[5];
  CGPoint v5;
  CGPoint v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CPMapTemplate_clientPanGestureWithDeltaPoint_velocity___block_invoke;
  block[3] = &unk_24C77CDC8;
  block[4] = self;
  v5 = a3;
  v6 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__CPMapTemplate_clientPanGestureWithDeltaPoint_velocity___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplate:didUpdatePanGestureWithTranslation:velocity:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
}

- (void)clientPanGestureEndedWithVelocity:(CGPoint)a3
{
  _QWORD block[5];
  CGPoint v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CPMapTemplate_clientPanGestureEndedWithVelocity___block_invoke;
  block[3] = &unk_24C77D9A0;
  block[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__CPMapTemplate_clientPanGestureEndedWithVelocity___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplate:didEndPanGestureWithVelocity:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
}

- (void)clientPanWithDirection:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__CPMapTemplate_clientPanWithDirection___block_invoke;
  v3[3] = &unk_24C77C8A0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __40__CPMapTemplate_clientPanWithDirection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "%@: Pan button pressed with direction: %@. Delegate responds to panWithDirection: %@", (uint8_t *)&v9, 0x20u);

  }
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapTemplate:panWithDirection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)clientNavigationAlertWillAppear:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CPMapTemplate_clientNavigationAlertWillAppear___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __49__CPMapTemplate_clientNavigationAlertWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "currentNavigationAlert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      v6 = *(void **)(a1 + 40);
    objc_msgSend(v7, "mapTemplate:willShowNavigationAlert:", v4, v6);

  }
}

- (void)clientNavigationAlertDidAppear:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CPMapTemplate_clientNavigationAlertDidAppear___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __48__CPMapTemplate_clientNavigationAlertDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "currentNavigationAlert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      v6 = *(void **)(a1 + 40);
    objc_msgSend(v7, "mapTemplate:didShowNavigationAlert:", v4, v6);

  }
}

- (void)clientNavigationAlertWillDisappear:(id)a3 context:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPMapTemplate_clientNavigationAlertWillDisappear_context___block_invoke;
  block[3] = &unk_24C77D0F0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CPMapTemplate_clientNavigationAlertWillDisappear_context___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "currentNavigationAlert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      v6 = *(void **)(a1 + 40);
    objc_msgSend(v7, "mapTemplate:willDismissNavigationAlert:dismissalContext:", v4, v6, *(_QWORD *)(a1 + 48));

  }
}

- (void)clientNavigationAlertDidDisappear:(id)a3 context:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke;
  block[3] = &unk_24C77D0F0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "currentNavigationAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = *(void **)(a1 + 40);
    objc_msgSend(v4, "mapTemplate:didDismissNavigationAlert:dismissalContext:", v5, v7, *(_QWORD *)(a1 + 48));

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 144);
  *(_QWORD *)(v8 + 144) = 0;

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "postedBannerObjects");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v11);

  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)clientTripCanceledByExternalNavigation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CPMapTemplate_clientTripCanceledByExternalNavigation__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __55__CPMapTemplate_clientTripCanceledByExternalNavigation__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapTemplateDidCancelNavigation:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "postedBannerObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (int64_t)_displayStyleForManeuver:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPMapTemplate mapDelegate](self, "mapDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "mapTemplate:displayStyleForManeuver:", self, v4);
    objc_msgSend(v4, "setDisplayStyle:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPMapTemplate postedBannerObjects](self, "postedBannerObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)bannerTappedWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  -[CPMapTemplate postedBannerObjects](self, "postedBannerObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CPMapTemplate postedBannerObjects](self, "postedBannerObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v19);

    +[CPTemplateApplicationScene activeTemplateScene](CPTemplateApplicationScene, "activeTemplateScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "templateApplicationScene:didSelectNavigationAlert:", v7, v5);
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "application:didSelectNavigationAlert:", v14, v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "templateApplicationScene:didSelectManeuver:", v7, v5);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "application:didSelectManeuver:", v14, v5);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_postBannerIfNecessaryForManeuver:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  NSMutableDictionary *postedBannerObjects;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CPTemplate templateDelegate](self, "templateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (-[CPTemplate templateDelegate](self, "templateDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isCarPlayCanvasActive"),
        v6,
        (v7 & 1) == 0))
  {
    -[CPMapTemplate mapDelegate](self, "mapDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v8, "mapTemplate:shouldShowNotificationForManeuver:", self, v12))
    {
      postedBannerObjects = self->_postedBannerObjects;
      objc_msgSend(v12, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](postedBannerObjects, "setObject:forKeyedSubscript:", v12, v10);

      -[CPMapTemplate bannerProvider](self, "bannerProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postBannerForManeuver:travelEstimates:", v12, 0);

    }
  }

}

- (void)_postBannerIfNecessaryForNavigationAlert:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  NSMutableDictionary *postedBannerObjects;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CPTemplate templateDelegate](self, "templateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (-[CPTemplate templateDelegate](self, "templateDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isCarPlayCanvasActive"),
        v6,
        (v7 & 1) == 0))
  {
    -[CPMapTemplate mapDelegate](self, "mapDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v8, "mapTemplate:shouldShowNotificationForNavigationAlert:", self, v12))
    {
      postedBannerObjects = self->_postedBannerObjects;
      objc_msgSend(v12, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](postedBannerObjects, "setObject:forKeyedSubscript:", v12, v10);

      -[CPMapTemplate bannerProvider](self, "bannerProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postBannerForNavigationAlert:", v12);

    }
  }

}

- (void)_updateBannerIfNecessaryForManeuver:(id)a3 travelEstimates:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSMutableDictionary *postedBannerObjects;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[CPTemplate templateDelegate](self, "templateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (-[CPTemplate templateDelegate](self, "templateDelegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isCarPlayCanvasActive"),
        v9,
        (v10 & 1) == 0))
  {
    -[CPMapTemplate mapDelegate](self, "mapDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "mapTemplate:shouldUpdateNotificationForManeuver:withTravelEstimates:", self, v16, v6);
      if (v16)
      {
        if (v12)
        {
          postedBannerObjects = self->_postedBannerObjects;
          objc_msgSend(v16, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](postedBannerObjects, "setObject:forKeyedSubscript:", v16, v14);

          -[CPMapTemplate bannerProvider](self, "bannerProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "postBannerForManeuver:travelEstimates:", v16, v6);

        }
      }
    }

  }
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (CPTripEstimateStyle)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (NSArray)mapButtons
{
  return self->_mapButtons;
}

- (BOOL)automaticallyHidesNavigationBar
{
  return self->_automaticallyHidesNavigationBar;
}

- (BOOL)hidesButtonsWithNavigationBar
{
  return self->_hidesButtonsWithNavigationBar;
}

- (id)mapDelegate
{
  return objc_loadWeakRetained((id *)&self->_mapDelegate);
}

- (void)setMapDelegate:(id)mapDelegate
{
  objc_storeWeak((id *)&self->_mapDelegate, mapDelegate);
}

- (CPNavigationAlert)currentNavigationAlert
{
  return self->_currentNavigationAlert;
}

- (NSMutableDictionary)postedBannerObjects
{
  return self->_postedBannerObjects;
}

- (void)setPostedBannerObjects:(id)a3
{
  objc_storeStrong((id *)&self->_postedBannerObjects, a3);
}

- (NAFuture)navigationSessionProviderFuture
{
  return self->_navigationSessionProviderFuture;
}

- (void)setNavigationSessionProviderFuture:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSessionProviderFuture, a3);
}

- (CPBannerProviding)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setBannerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bannerProvider, a3);
}

- (CPNavigationSessionProviding)navigationSessionProvider
{
  return self->_navigationSessionProvider;
}

- (NSArray)tripPreviews
{
  return self->_tripPreviews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripPreviews, 0);
  objc_storeStrong((id *)&self->_navigationSessionProvider, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_navigationSessionProviderFuture, 0);
  objc_storeStrong((id *)&self->_postedBannerObjects, 0);
  objc_storeStrong((id *)&self->_currentNavigationAlert, 0);
  objc_destroyWeak((id *)&self->_mapDelegate);
  objc_storeStrong((id *)&self->_mapButtons, 0);
  objc_storeStrong((id *)&self->_guidanceBackgroundColor, 0);
}

- (void)_resolveTrip:(uint64_t)a1 routeChoice:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20D6F4000, log, OS_LOG_TYPE_ERROR, "failed to find matching objects for trip %@ and route %@", (uint8_t *)&v3, 0x16u);
}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "map delegate doesn't support mapTemplate:selectedPreviewForTrip:usingRouteChoice:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "trip delegate doesn't support mapTemplate:startedTrip:usingRouteChoice:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Navigation alert did dismiss without an identifier", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
