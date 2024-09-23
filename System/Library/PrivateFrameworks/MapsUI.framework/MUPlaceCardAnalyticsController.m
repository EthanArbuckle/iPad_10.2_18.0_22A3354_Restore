@implementation MUPlaceCardAnalyticsController

- (_MKPlaceItem)placeItem
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "placeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_MKPlaceItem *)v3;
}

- (NSArray)analyticModules
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "analyticModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (MUPlaceCardAnalyticsController)initWithAnalyticsProvider:(id)a3
{
  id v4;
  MUPlaceCardAnalyticsController *v5;
  MUPlaceCardAnalyticsController *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *analyticsQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceCardAnalyticsController;
  v5 = -[MUPlaceCardAnalyticsController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MapsUI.PlaceViewController.Analytics", v7);
    analyticsQueue = v6->_analyticsQueue;
    v6->_analyticsQueue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (void)instrumentDailyUsageCount
{
  objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 77);
}

- (void)infoCardAnalyticsPopulateSharedStateWithButtonList:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MUGetPlaceCardAnalyticsUILog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_DEBUG, "Setting the shared state for button list %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__MUPlaceCardAnalyticsController_infoCardAnalyticsPopulateSharedStateWithButtonList___block_invoke;
  v7[3] = &unk_1E2E01780;
  p_buf = &buf;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "populateActionButtonDetails:", v7);

  _Block_object_dispose(&buf, 8);
}

BOOL __85__MUPlaceCardAnalyticsController_infoCardAnalyticsPopulateSharedStateWithButtonList___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, _DWORD *a4, _BYTE *a5)
{
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  int v14;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v11 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v10 < v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vendor");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v12, "isGroup");
    objc_msgSend(v12, "metadata");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "linkType");
    if ((v13 - 1) >= 3)
      v14 = 0;
    else
      v14 = v13;
    *a4 = v14;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  }
  return v10 < v11;
}

- (BOOL)instrumentRevealIfNeededWithImpressionsSessionId:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *p_super;
  const char *v8;
  BOOL v9;
  _BOOL4 deferLoggingRevealUntilRefinement;
  NSObject *v11;
  _BOOL4 v12;
  NSUUID *v13;
  id WeakRetained;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MUPlaceCardAnalyticsController placeItem](self, "placeItem");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    MUGetPlaceCardRevealLoggingLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "Place item is nil so not instrumenting reveal";
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_20;
  }
  if (-[NSObject isIntermediateMapItem](v5, "isIntermediateMapItem"))
  {
    MUGetPlaceCardRevealLoggingLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "Place item is present but it contains an intermediate map item so not instrumenting reveal";
LABEL_7:
      _os_log_impl(&dword_191DB8000, p_super, OS_LOG_TYPE_DEBUG, v8, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  deferLoggingRevealUntilRefinement = self->_deferLoggingRevealUntilRefinement;
  MUGetPlaceCardRevealLoggingLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (deferLoggingRevealUntilRefinement)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v11, OS_LOG_TYPE_DEBUG, "Deferring reveal logging until refinement has finished.  Saving session identifier for next reveal.", buf, 2u);
    }

    v13 = (NSUUID *)v4;
    v9 = 0;
    p_super = &self->_cachedSessionId->super;
    self->_cachedSessionId = v13;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_191DB8000, v11, OS_LOG_TYPE_DEBUG, "Logging reveal for place item %@", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "revealedModules");
    p_super = objc_claimAutoreleasedReturnValue();

    v15 = -[NSObject mutableCopy](p_super, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaceCardRevealedPlaceCardModules:", v15);

    MUGetPlaceCardRevealLoggingLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = p_super;
      _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_DEBUG, "Logging reveal modules %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "populateImpressionObjectId:", v4);

    -[NSObject mapItem](v6, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_enrichmentInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "showcaseId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPlaceCardPlaceActionDetailsShowcaseId:", v21);

    MUGetPlaceCardRevealLoggingLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject mapItem](v6, "mapItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_enrichmentInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "showcaseId");
      v26 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      _os_log_impl(&dword_191DB8000, v23, OS_LOG_TYPE_DEBUG, "Logging showcase id %@", buf, 0xCu);

    }
    v27 = objc_loadWeakRetained((id *)&self->_provider);
    v28 = objc_msgSend(v27, "defaultTargetForPlaceCardAnalytics");
    -[MUPlaceCardAnalyticsController analyticModules](self, "analyticModules");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    -[MUPlaceCardAnalyticsController _infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:modules:actionRichProviderId:completion:](self, "_infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:modules:actionRichProviderId:completion:", 21, v28, 0, 0, 0, 0, v30, 0, &__block_literal_global_6);

    v9 = 1;
  }
LABEL_20:

  return v9;
}

void __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "populateImpressionObjectId:", 0);

}

- (void)instrumentConceal
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardRevealLoggingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MUPlaceCardAnalyticsController placeItem](self, "placeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_DEBUG, "Logging conceal for place item %@", (uint8_t *)&v5, 0xCu);

  }
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 47, 0, 0, 0);
}

- (void)instrumentVerticalScrollWithBeginningPoint:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 velocity:(CGPoint)a5
{
  double v5;
  uint64_t v6;

  v5 = a3.y - a4->y;
  if (v5 <= 0.0)
  {
    if (v5 < 0.0)
      v6 = 7;
    else
      v6 = 0;
  }
  else
  {
    v6 = 8;
  }
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", v6, 0, 0, 0);
}

- (void)instrumentCloseUsingClientType:(unint64_t)a3
{
  unsigned int v3;
  uint64_t v4;

  if (a3 == 3)
    v3 = 701;
  else
    v3 = 0;
  if (a3 == 2)
    v4 = 702;
  else
    v4 = v3;
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 4, v4, 0, 0, 0);
}

- (void)instrumentPunchoutActionWithURL:(id)a3 providerId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MUGetPlaceCardAnalyticsUILog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_DEBUG, "Instrumenting punchout with url %@ and provider id %@", (uint8_t *)&v9, 0x16u);
  }

  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6050, v6, 0, v7);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  MUPlaceCardAnalyticsProvider **p_provider;
  id v9;
  id WeakRetained;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  p_provider = &self->_provider;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_provider);
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v6, objc_msgSend(WeakRetained, "defaultTargetForPlaceCardAnalytics"), v9, v5, 0);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  MUPlaceCardAnalyticsProvider **p_provider;
  id v11;
  id v12;
  id WeakRetained;

  v6 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  p_provider = &self->_provider;
  v11 = a6;
  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_provider);
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v8, objc_msgSend(WeakRetained, "defaultTargetForPlaceCardAnalytics"), v12, v6, v11);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, *(_QWORD *)&a6, a7);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  uint64_t v8;

  LODWORD(v8) = a7;
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0, a6, v8, a8);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v16 = a9;
  v25[1] = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  if (a8)
  {
    v25[0] = a8;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = a8;
    v23 = v21;
    v16 = a9;
    objc_msgSend(v23, "arrayWithObjects:count:", v25, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[MUPlaceCardAnalyticsController _infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:modules:actionRichProviderId:completion:](self, "_infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:modules:actionRichProviderId:completion:", v14, v13, v17, v18, v19, v16, v24, v20, 0);

}

- (void)_infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 modules:(id)a9 actionRichProviderId:(id)a10 completion:(id)a11
{
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  id WeakRetained;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  CFAbsoluteTime Current;
  id v30;
  NSObject *analyticsQueue;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  CFAbsoluteTime v55;
  int v56;
  int v57;
  int v58;
  uint8_t buf[4];
  __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v11 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a4;
  v15 = *(_QWORD *)&a3;
  v67 = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v44 = a6;
  v43 = a7;
  v18 = a9;
  v41 = a10;
  v39 = a11;
  -[MUPlaceCardAnalyticsController _requestHostToLogFeedbackTypeIfNeeded:](self, "_requestHostToLogFeedbackTypeIfNeeded:", v11);
  MUGetPlaceCardAnalyticsUILog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if ((int)v15 > 4000)
    {
      if ((int)v15 <= 10100)
      {
        if ((int)v15 > 7000)
        {
          switch((int)v15)
          {
            case 9001:
              v20 = CFSTR("TAP_WIDGET_ITEM");
              break;
            case 9002:
              v20 = CFSTR("DISPLAY_NOTIFICATION");
              break;
            case 9003:
              v20 = CFSTR("TAP_NOTIFICATION");
              break;
            case 9004:
              v20 = CFSTR("EXPAND_NOTIFICATION");
              break;
            case 9005:
              v20 = CFSTR("DISMISS_NOTIFICATION");
              break;
            case 9006:
              v20 = CFSTR("OPEN_SEARCH");
              break;
            case 9007:
              v20 = CFSTR("OPEN_PAN_VIEW");
              break;
            case 9008:
              v20 = CFSTR("PAN_LEFT");
              break;
            case 9009:
              v20 = CFSTR("PAN_UP");
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_47;
            case 9011:
              v20 = CFSTR("PAN_DOWN");
              break;
            case 9012:
              v20 = CFSTR("TAP_RECENT_DESTINATIONS");
              break;
            case 9013:
              v20 = CFSTR("OPEN_DESTINATIONS");
              break;
            case 9014:
              v20 = CFSTR("OPEN_FAVORITES");
              break;
            case 9015:
              v20 = CFSTR("VIEW_NAV_OPTIONS");
              break;
            case 9016:
              v20 = CFSTR("START_NAV_NO_GUIDANCE");
              break;
            case 9017:
              v20 = CFSTR("TURN_OFF_GUIDANCE");
              break;
            case 9018:
              v20 = CFSTR("TURN_ON_GUIDANCE");
              break;
            case 9019:
              v20 = CFSTR("OPEN_KEYBOARD");
              break;
            case 9020:
              v20 = CFSTR("SHARE_DESTINATION");
              break;
            case 9021:
              v20 = CFSTR("START_NAV_AUTOMATED");
              break;
            case 9022:
              v20 = CFSTR("SHARE_ETA");
              break;
            case 9023:
              v20 = CFSTR("SELECT_GROUP");
              break;
            case 9024:
              v20 = CFSTR("DESELECT_GROUP");
              break;
            case 9025:
              v20 = CFSTR("SELECT_CONTACT");
              break;
            case 9026:
              v20 = CFSTR("DESELECT_CONTACT");
              break;
            case 9027:
              v20 = CFSTR("TAP_VIEW_CONTACTS");
              break;
            case 9028:
              v20 = CFSTR("STOP_RECEIVING_ETA");
              break;
            case 9029:
              v20 = CFSTR("DISPLAY_ANNOUNCEMENT");
              break;
            case 9030:
              v20 = CFSTR("TAP_ANNOUNCEMENT");
              break;
            case 9031:
              v20 = CFSTR("DISPLAY_CYCLING_NOTIFICATION");
              break;
            case 9032:
              v20 = CFSTR("TAP_CYCLING_NOTIFICATION");
              break;
            case 9033:
              v20 = CFSTR("SHARE_CYCLING_ETA");
              break;
            case 9034:
              v20 = CFSTR("MANAGE_NOTIFICATIONS");
              break;
            case 9035:
              v20 = CFSTR("PUNCH_OUT_PUBLISHER_REVIEW");
              break;
            case 9036:
              v20 = CFSTR("SCROLL_FORWARD");
              break;
            case 9037:
              v20 = CFSTR("SCROLL_BACKWARD");
              break;
            case 9038:
              v20 = CFSTR("SHOW_ALL_CURATED_COLLECTIONS");
              break;
            case 9039:
              v20 = CFSTR("TAP_LESS");
              break;
            case 9040:
              v20 = CFSTR("TAP_MORE");
              break;
            case 9101:
              v20 = CFSTR("DISPLAY_ADD_HOME_AND_WORK");
              break;
            case 9102:
              v20 = CFSTR("TAP_ADD_HOME_AND_WORK");
              break;
            case 9103:
              v20 = CFSTR("DISPLAY_ALLOW_FREQUENTS");
              break;
            case 9104:
              v20 = CFSTR("TAP_ALLOW_FREQUENTS");
              break;
            case 9105:
              v20 = CFSTR("DISPLAY_ALLOW_LOCATION");
              break;
            case 9106:
              v20 = CFSTR("TAP_ALLOW_LOCATION");
              break;
            default:
              switch((int)v15)
              {
                case 7001:
                  v20 = CFSTR("EXPAND_TRANSIT_SYSTEM");
                  break;
                case 7002:
                  v20 = CFSTR("COLLAPSE_TRANSIT_SYSTEM");
                  break;
                case 7003:
                  v20 = CFSTR("SHOW_MORE_DEPARTURES");
                  break;
                case 7004:
                  v20 = CFSTR("VIEW_TRANSIT_LINE");
                  break;
                case 7005:
                  v20 = CFSTR("CANCEL_VIEW_TRANSIT_LINE");
                  break;
                case 7006:
                  v20 = CFSTR("TAP_TRANSIT_ATTRIBUTION");
                  break;
                case 7007:
                  v20 = CFSTR("TAP_TRANSIT_ADVISORY");
                  break;
                case 7008:
                  v20 = CFSTR("MORE_DETAILS_TRANSIT_ADVISORY");
                  break;
                case 7009:
                  v20 = CFSTR("SUBSCRIBE_LINE_INCIDENT");
                  break;
                case 7010:
                  v20 = CFSTR("UNSUBSCRIBE_LINE_INCIDENT");
                  break;
                case 7011:
                  v20 = CFSTR("TAP_NEAREST_STATION");
                  break;
                case 7012:
                  v20 = CFSTR("TAP_NEAREST_STOP");
                  break;
                case 7013:
                  v20 = CFSTR("TAP_CONNECTION");
                  break;
                case 7014:
                  v20 = CFSTR("GET_TICKETS");
                  break;
                case 7015:
                  v20 = CFSTR("OPEN_SCHEDULECARD_DATETIME");
                  break;
                case 7016:
                  v20 = CFSTR("EXPAND_PRIOR_STEP_DETAILS_TRANSIT");
                  break;
                case 7017:
                  v20 = CFSTR("EXPAND_ALIGHT_STEP_DETAILS_TRANSIT");
                  break;
                case 7018:
                  v20 = CFSTR("VIEW_ON_MAP");
                  break;
                case 7019:
                  v20 = CFSTR("FORCE_UPDATE_DEPARTURE_INFO");
                  break;
                case 7020:
                  v20 = CFSTR("TAP_TRANSIT_LINE_INFO");
                  break;
                case 7021:
                  v20 = CFSTR("TAP_ATTRIBUTION_CELL");
                  break;
                case 7022:
                  v20 = CFSTR("TAP_NEXT_DEPARTURES");
                  break;
                case 7023:
                  v20 = CFSTR("VIEW_BANNER");
                  break;
                case 7024:
                  v20 = CFSTR("GET_SHOWTIMES");
                  break;
                case 7025:
                  v20 = CFSTR("MAKE_APPOINTMENT");
                  break;
                case 7026:
                  v20 = CFSTR("RESERVE_PARKING");
                  break;
                case 7027:
                  v20 = CFSTR("RESERVE_ROOM");
                  break;
                case 7028:
                  v20 = CFSTR("WAITLIST");
                  break;
                case 7029:
                  v20 = CFSTR("ORDER_TAKEOUT");
                  break;
                case 7030:
                  v20 = CFSTR("RESERVE");
                  break;
                default:
                  switch((int)v15)
                  {
                    case 8001:
                      v20 = CFSTR("INVOKE_SIRI_SNIPPET");
                      break;
                    case 8002:
                      v20 = CFSTR("INVOKE_SIRI_DISAMBIGUATION");
                      break;
                    case 8003:
                      v20 = CFSTR("SHOW_PLACE_DETAILS");
                      break;
                    case 8004:
                      v20 = CFSTR("ANSWER_REROUTE_SUGGESTION");
                      break;
                    case 8005:
                      v20 = CFSTR("SUGGEST_NAV_REROUTE");
                      break;
                    case 8006:
                      v20 = CFSTR("GET_NAV_STATUS");
                      break;
                    case 8007:
                      v20 = CFSTR("REPEAT_NAV_STATUS");
                      break;
                    case 8008:
                      v20 = CFSTR("SELECT_AUDIO_VOLUME_UNMUTE");
                      break;
                    case 8009:
                      v20 = CFSTR("INVOKE_SIRI");
                      break;
                    case 8010:
                      v20 = CFSTR("DISPLAY_SIRI_ERROR_MESSAGE");
                      break;
                    case 8011:
                      v20 = CFSTR("DISPLAY_NO_RESULTS_MESSAGE");
                      break;
                    default:
                      goto LABEL_47;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)v15)
          {
            case 6003:
              v20 = CFSTR("GET_DIRECTIONS");
              break;
            case 6004:
              v20 = CFSTR("TAP_FLYOVER_TOUR");
              break;
            case 6005:
              v20 = CFSTR("REMOVE_PIN");
              break;
            case 6006:
              v20 = CFSTR("TAP_PHOTO");
              break;
            case 6007:
              v20 = CFSTR("TAP_MAPS_VIEW");
              break;
            case 6008:
              v20 = CFSTR("TAP_ADDRESS");
              break;
            case 6009:
              v20 = CFSTR("CALL");
              break;
            case 6010:
              v20 = CFSTR("TAP_URL");
              break;
            case 6011:
              v20 = CFSTR("SHOW_TODAY_HOURS");
              break;
            case 6012:
              v20 = CFSTR("SHOW_ALL_HOURS");
              break;
            case 6013:
              v20 = CFSTR("SHARE");
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_47;
            case 6015:
              v20 = CFSTR("ADD_TO_FAVORITES");
              break;
            case 6016:
              v20 = CFSTR("ADD_CONTACT");
              break;
            case 6018:
              v20 = CFSTR("PUNCH_OUT_PHOTO");
              break;
            case 6019:
              v20 = CFSTR("PUNCH_OUT_USEFUL_TO_KNOW");
              break;
            case 6020:
              v20 = CFSTR("PUNCH_OUT_OPEN_APP");
              break;
            case 6021:
              v20 = CFSTR("PUNCH_OUT_SINGLE_REVIEW");
              break;
            case 6022:
              v20 = CFSTR("PUNCH_OUT_CHECK_IN");
              break;
            case 6023:
              v20 = CFSTR("PUNCH_OUT_MORE_INFO");
              break;
            case 6024:
              v20 = CFSTR("PUNCH_OUT_WRITE_REVIEW");
              break;
            case 6025:
              v20 = CFSTR("PUNCH_OUT_ADD_PHOTO");
              break;
            case 6026:
              v20 = CFSTR("TAP_GRID_VIEW");
              break;
            case 6027:
              v20 = CFSTR("EDIT_LOCATION");
              break;
            case 6029:
              v20 = CFSTR("ADD_PHOTO");
              break;
            case 6031:
              v20 = CFSTR("RETAKE");
              break;
            case 6032:
              v20 = CFSTR("ADD_NOTE");
              break;
            case 6033:
              v20 = CFSTR("REMOVE_CAR");
              break;
            case 6034:
              v20 = CFSTR("EDIT_NAME");
              break;
            case 6036:
              v20 = CFSTR("RESERVE_TABLE");
              break;
            case 6037:
              v20 = CFSTR("ADD_TO_QUEUE");
              break;
            case 6038:
              v20 = CFSTR("VIEW_BOOKED_TABLE");
              break;
            case 6039:
              v20 = CFSTR("VIEW_QUEUED_TABLE");
              break;
            case 6040:
              v20 = CFSTR("PUNCH_OUT_THIRD_PARTY_APP");
              break;
            case 6041:
              v20 = CFSTR("PUNCH_OUT_LEGAL_LINK");
              break;
            case 6042:
              v20 = CFSTR("TAP_PLACECARD_HEADER");
              break;
            case 6043:
              v20 = CFSTR("REMOVE_FROM_FAVORITES");
              break;
            case 6044:
              v20 = CFSTR("VIEW_CONTACT");
              break;
            case 6045:
              v20 = CFSTR("CHAT");
              break;
            case 6046:
              v20 = CFSTR("FIND_STORES");
              break;
            case 6047:
              v20 = CFSTR("TAP_PARENT");
              break;
            case 6048:
              v20 = CFSTR("SCROLL_LEFT_PHOTOS");
              break;
            case 6049:
              v20 = CFSTR("SCROLL_RIGHT_PHOTOS");
              break;
            case 6050:
              v20 = CFSTR("PUNCH_OUT");
              break;
            case 6051:
              v20 = CFSTR("TAP_ENTER_MUNIN");
              break;
            case 6052:
              v20 = CFSTR("TAP_RECOMMENDED_DISHES_PHOTO");
              break;
            case 6053:
              v20 = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP");
              break;
            case 6054:
              v20 = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO");
              break;
            case 6055:
              v20 = CFSTR("SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS");
              break;
            case 6056:
              v20 = CFSTR("SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS");
              break;
            case 6057:
              v20 = CFSTR("SHOW_LINKED_SERVICE_HOURS");
              break;
            case 6058:
              v20 = CFSTR("ENTER_LOOK_AROUND");
              break;
            case 6059:
              v20 = CFSTR("EXIT_LOOK_AROUND");
              break;
            case 6060:
              v20 = CFSTR("TAP_ENTER_LOOK_AROUND_VIEW");
              break;
            case 6061:
              v20 = CFSTR("TAP_ENTER_LOOK_AROUND_PIP");
              break;
            case 6062:
              v20 = CFSTR("EXPAND_LOOK_AROUND_VIEW");
              break;
            case 6063:
              v20 = CFSTR("CLOSE_LOOK_AROUND");
              break;
            case 6064:
              v20 = CFSTR("COLLAPSE_LOOK_AROUND_VIEW");
              break;
            case 6065:
              v20 = CFSTR("TAP_SHOW_ACTIONS");
              break;
            case 6066:
              v20 = CFSTR("TAP_HIDE_LABELS");
              break;
            case 6067:
              v20 = CFSTR("TAP_SHOW_LABELS");
              break;
            case 6068:
              v20 = CFSTR("TAP_SHOW_DETAILS");
              break;
            case 6069:
              v20 = CFSTR("PAN_LOOK_AROUND");
              break;
            case 6070:
              v20 = CFSTR("TAP_LOOK_AROUND_THUMBNAIL");
              break;
            case 6071:
              v20 = CFSTR("TAP_LANDMARK");
              break;
            case 6072:
              v20 = CFSTR("TAP_SCENE");
              break;
            case 6073:
              v20 = CFSTR("SHOW_LINKED_BUSINESS_HOURS");
              break;
            case 6074:
              v20 = CFSTR("TAP_PLACECARD_SHORTCUT");
              break;
            case 6075:
              v20 = CFSTR("SHOW_ALL_LOCATIONS_INSIDE");
              break;
            case 6076:
              v20 = CFSTR("SHOW_ALL_SIMILAR_LOCATIONS");
              break;
            case 6077:
              v20 = CFSTR("SHOW_ALL_LOCATIONS_AT_ADDRESS");
              break;
            case 6078:
              v20 = CFSTR("TAP_PARENT_LOCATION");
              break;
            case 6079:
              v20 = CFSTR("TAP_SIMILAR_LOCATION");
              break;
            case 6080:
              v20 = CFSTR("TAP_LOCATION_INSIDE");
              break;
            case 6081:
              v20 = CFSTR("TAP_LOCATION_AT_ADDRESS");
              break;
            case 6082:
              v20 = CFSTR("CLOSE_ROUTE_GENIUS");
              break;
            case 6083:
              v20 = CFSTR("LOAD_WEB_CONTENT");
              break;
            case 6084:
              v20 = CFSTR("SCROLL_FORWARD_WEB_CONTENT");
              break;
            case 6085:
              v20 = CFSTR("SCROLL_BACKWARD_WEB_CONTENT");
              break;
            case 6086:
              v20 = CFSTR("TAP_WEB_CONTENT");
              break;
            case 6087:
              v20 = CFSTR("SHOW_PHOTO_VIEWER");
              break;
            case 6088:
              v20 = CFSTR("SHOW_LAST_PAGE");
              break;
            case 6089:
              v20 = CFSTR("TAP_VIEW_APP");
              break;
            case 6090:
              v20 = CFSTR("TAP_APP_CLIP");
              break;
            case 6091:
              v20 = CFSTR("DEAD_BATTERY");
              break;
            case 6092:
              v20 = CFSTR("DISMISS_LOW_BATTERY_ALERT");
              break;
            case 6093:
              v20 = CFSTR("DISMISS_OUT_OF_RANGE_ALERT");
              break;
            case 6094:
              v20 = CFSTR("FAILED_TO_LOAD_EV_STATUS");
              break;
            case 6095:
              v20 = CFSTR("LOW_BATTERY_ALERT");
              break;
            case 6096:
              v20 = CFSTR("PAUSE_ROUTE");
              break;
            case 6097:
              v20 = CFSTR("TAP_ADD_STOP");
              break;
            case 6098:
              v20 = CFSTR("TAP_CHARGE_POINT");
              break;
            case 6099:
              v20 = CFSTR("TAP_OUT_OF_RANGE_ALERT");
              break;
            case 6100:
              v20 = CFSTR("SCROLL_DOWN_PHOTOS");
              break;
            case 6101:
              v20 = CFSTR("SCROLL_UP_PHOTOS");
              break;
            case 6102:
              v20 = CFSTR("TAP_MORE_PHOTOS");
              break;
            case 6103:
              v20 = CFSTR("TAP_TO_CONFIRM_INCIDENT");
              break;
            case 6104:
              v20 = CFSTR("SHOW_INCIDENT");
              break;
            case 6105:
              v20 = CFSTR("REVEAL_APP_CLIP");
              break;
            case 6106:
              v20 = CFSTR("ORDER_DELIVERY");
              break;
            case 6107:
              v20 = CFSTR("VIEW_MENU");
              break;
            case 6108:
              v20 = CFSTR("TAP_EDIT_STOPS");
              break;
            case 6109:
              v20 = CFSTR("LEARN_MORE_WEB_CONTENT");
              break;
            case 6110:
              v20 = CFSTR("MAKE_APPOINTMENT_WEB_CONTENT");
              break;
            case 6111:
              v20 = CFSTR("REVEAL_SHOWCASE");
              break;
            default:
              switch((int)v15)
              {
                case 5001:
                  v20 = CFSTR("SHOW_MAPS_SETTINGS");
                  break;
                case 5002:
                  v20 = CFSTR("TAP_STANDARD_MODE");
                  break;
                case 5003:
                  v20 = CFSTR("TAP_TRANSIT_MODE");
                  break;
                case 5004:
                  v20 = CFSTR("TAP_SATELLITE_MODE");
                  break;
                case 5005:
                  v20 = CFSTR("SWITCH_ON_TRAFFIC");
                  break;
                case 5006:
                  v20 = CFSTR("SWITCH_OFF_TRAFFIC");
                  break;
                case 5007:
                  v20 = CFSTR("SWITCH_ON_LABELS");
                  break;
                case 5008:
                  v20 = CFSTR("SWITCH_OFF_LABELS");
                  break;
                case 5009:
                  v20 = CFSTR("SWITCH_ON_3D_MAP");
                  break;
                case 5010:
                  v20 = CFSTR("SWITCH_OFF_3D_MAP");
                  break;
                case 5011:
                  v20 = CFSTR("SWITCH_ON_WEATHER");
                  break;
                case 5012:
                  v20 = CFSTR("SWITCH_OFF_WEATHER");
                  break;
                case 5013:
                  v20 = CFSTR("REPORT_A_PROBLEM");
                  break;
                case 5014:
                  v20 = CFSTR("ADD_PLACE");
                  break;
                case 5015:
                  goto LABEL_47;
                case 5016:
                  v20 = CFSTR("TAP_PREFERENCES");
                  break;
                case 5017:
                  v20 = CFSTR("SWITCH_ON_TOLLS");
                  break;
                case 5018:
                  v20 = CFSTR("SWITCH_OFF_TOLLS");
                  break;
                case 5019:
                  v20 = CFSTR("SWITCH_ON_HIGHWAYS");
                  break;
                case 5020:
                  v20 = CFSTR("SWITCH_OFF_HIGHWAYS");
                  break;
                case 5021:
                  v20 = CFSTR("SWITCH_ON_HEADING");
                  break;
                case 5022:
                  v20 = CFSTR("SWITCH_OFF_HEADING");
                  break;
                case 5023:
                  v20 = CFSTR("SWITCH_ON_SPEED_LIMIT");
                  break;
                case 5024:
                  v20 = CFSTR("SWITCH_OFF_SPEED_LIMIT");
                  break;
                case 5025:
                  v20 = CFSTR("ELECT_DRIVING_MODE");
                  break;
                case 5026:
                  v20 = CFSTR("ELECT_WALKING_MODE");
                  break;
                case 5027:
                  v20 = CFSTR("ELECT_TRANSIT_MODE");
                  break;
                case 5028:
                  v20 = CFSTR("ELECT_RIDESHARE_MODE");
                  break;
                case 5029:
                  v20 = CFSTR("SWITCH_ON_FIND_MY_CAR");
                  break;
                case 5030:
                  v20 = CFSTR("SWITCH_OFF_FIND_MY_CAR");
                  break;
                case 5031:
                  v20 = CFSTR("MARK_MY_LOCATION");
                  break;
                case 5032:
                  v20 = CFSTR("TAP_HYBRID_MODE");
                  break;
                case 5033:
                  v20 = CFSTR("CHECK_AVOID_BUSY_ROADS");
                  break;
                case 5034:
                  v20 = CFSTR("UNCHECK_AVOID_BUSY_ROADS");
                  break;
                case 5035:
                  v20 = CFSTR("CHECK_AVOID_HILLS");
                  break;
                case 5036:
                  v20 = CFSTR("UNCHECK_AVOID_HILLS");
                  break;
                case 5037:
                  v20 = CFSTR("CHECK_AVOID_STAIRS");
                  break;
                case 5038:
                  v20 = CFSTR("UNCHECK_AVOID_STAIRS");
                  break;
                case 5039:
                  v20 = CFSTR("ELECT_CYCLING_MODE");
                  break;
                default:
                  switch((int)v15)
                  {
                    case 4001:
                      v20 = CFSTR("RECENTER_CURRENT_LOCATION");
                      break;
                    case 4002:
                      v20 = CFSTR("TAP_HEADING_ON");
                      break;
                    case 4003:
                      v20 = CFSTR("TAP_HEADING_OFF");
                      break;
                    case 4004:
                      v20 = CFSTR("PUCK_DRIFT");
                      break;
                    case 4005:
                      v20 = CFSTR("PUCK_SNAP");
                      break;
                    case 4006:
                      v20 = CFSTR("SELECT_FLOOR");
                      break;
                    default:
                      goto LABEL_47;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)v15 > 13000)
      {
        if ((int)v15 <= 16000)
        {
          if ((int)v15 <= 15000)
          {
            switch((int)v15)
            {
              case 14001:
                v20 = CFSTR("VIEW_APP");
                break;
              case 14002:
                v20 = CFSTR("ENABLE");
                break;
              case 14003:
                v20 = CFSTR("BOOK_RIDE");
                break;
              case 14004:
                v20 = CFSTR("REQUEST_RIDE");
                break;
              case 14005:
                v20 = CFSTR("CONTACT_DRIVER");
                break;
              case 14006:
                v20 = CFSTR("CHANGE_PAYMENT");
                break;
              case 14007:
                v20 = CFSTR("ENABLE_ALL_RIDESHARE_APPS");
                break;
              case 14008:
                v20 = CFSTR("TAP_FOR_MORE_RIDES");
                break;
              case 14009:
                v20 = CFSTR("SUBMIT_TRIP_FEEDBACK");
                break;
              default:
                switch((int)v15)
                {
                  case 13001:
                    v20 = CFSTR("SELECT_ADDRESS");
                    break;
                  case 13002:
                    v20 = CFSTR("ADD_ADDRESS");
                    break;
                  case 13003:
                    v20 = CFSTR("SELECT_LABEL");
                    break;
                  case 13004:
                    v20 = CFSTR("DELETE_ADDRESS");
                    break;
                  case 13005:
                    v20 = CFSTR("EDIT_ITEMS");
                    break;
                  case 13006:
                    v20 = CFSTR("RAP_FAVORITES");
                    break;
                  case 13007:
                    v20 = CFSTR("SORT_LIST_ITEM");
                    break;
                  default:
                    goto LABEL_47;
                }
                break;
            }
          }
          else
          {
            switch((_DWORD)v15)
            {
              case 0x3A99:
                v20 = CFSTR("ORB_PEEK");
                break;
              case 0x3A9A:
                v20 = CFSTR("ORB_POP");
                break;
              case 0x3A9B:
                v20 = CFSTR("ORB_DISMISS");
                break;
              default:
LABEL_47:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)v15)
          {
            case 17001:
              v20 = CFSTR("START_DRAG");
              break;
            case 17002:
              v20 = CFSTR("CANCEL_DRAG");
              break;
            case 17003:
              v20 = CFSTR("COMPLETE_DRAG");
              break;
            case 17004:
              v20 = CFSTR("START_DROP");
              break;
            case 17005:
              v20 = CFSTR("CANCEL_DROP");
              break;
            case 17006:
              v20 = CFSTR("COMPLETE_DROP");
              break;
            case 17007:
              v20 = CFSTR("ANNOTATION_SELECT");
              break;
            case 17008:
              v20 = CFSTR("ANNOTATION_SELECT_AUTO");
              break;
            case 17009:
              v20 = CFSTR("ANNOTATION_SELECT_LIST");
              break;
            case 17010:
              v20 = CFSTR("BROWSE_TOP_CATEGORY_DISPLAYED");
              break;
            case 17011:
              v20 = CFSTR("CALLOUT_FLYOVER_TOUR");
              break;
            case 17012:
              v20 = CFSTR("CALLOUT_INFO");
              break;
            case 17013:
              v20 = CFSTR("CALLOUT_NAV_TRANSIT");
              break;
            case 17014:
              v20 = CFSTR("CALLOUT_TRAFFIC_INCIDENT_INFO");
              break;
            case 17015:
              v20 = CFSTR("CALLOUT_VIEW_TRANSIT_LINE");
              break;
            case 17016:
              v20 = CFSTR("DIRECTIONS_SELECT");
              break;
            case 17017:
              v20 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM");
              break;
            case 17018:
              v20 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_ARRIVES");
              break;
            case 17019:
              v20 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DEPARTS");
              break;
            case 17020:
              v20 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DONE");
              break;
            case 17021:
              v20 = CFSTR("DIRECTIONS_TRANSIT_LATER");
              break;
            case 17022:
              v20 = CFSTR("DIRECTIONS_TRANSIT_NOW");
              break;
            case 17023:
              v20 = CFSTR("FLYOVER_NOTIFICATION_DISMISS");
              break;
            case 17024:
              v20 = CFSTR("FLYOVER_NOTIFICATION_START");
              break;
            case 17025:
              v20 = CFSTR("FLYOVER_TOUR_COMPLETED");
              break;
            case 17026:
              v20 = CFSTR("FLYOVER_TOUR_END");
              break;
            case 17027:
              v20 = CFSTR("FLYOVER_TOUR_NOTIFICATION");
              break;
            case 17028:
              v20 = CFSTR("FLYOVER_TOUR_START");
              break;
            case 17029:
              v20 = CFSTR("INFO_BOOKMARKS");
              break;
            case 17030:
              v20 = CFSTR("INFO_CARD_DETACHED");
              break;
            case 17031:
              v20 = CFSTR("INFO_CONTACTS");
              break;
            case 17032:
              v20 = CFSTR("INFO_DIRECTIONS");
              break;
            case 17033:
              v20 = CFSTR("INFO_DIRECTIONS_FROM");
              break;
            case 17034:
              v20 = CFSTR("INFO_DIRECTIONS_TO");
              break;
            case 17035:
              v20 = CFSTR("INFO_DISMISS");
              break;
            case 17036:
              v20 = CFSTR("INFO_INFO");
              break;
            case 17037:
              v20 = CFSTR("INFO_PHOTOS");
              break;
            case 17038:
              v20 = CFSTR("INFO_REVIEWS");
              break;
            case 17039:
              v20 = CFSTR("INFO_SHARE");
              break;
            case 17040:
              v20 = CFSTR("INFO_SHARE_AIRDROP");
              break;
            case 17041:
              v20 = CFSTR("INFO_SHARE_FACEBOOK");
              break;
            case 17042:
              v20 = CFSTR("INFO_SHARE_MAIL");
              break;
            case 17043:
              v20 = CFSTR("INFO_SHARE_MESSAGE");
              break;
            case 17044:
              v20 = CFSTR("INFO_SHARE_TENCENTWEIBO");
              break;
            case 17045:
              v20 = CFSTR("INFO_SHARE_WEIBO");
              break;
            case 17046:
              v20 = CFSTR("INFO_YELP");
              break;
            case 17047:
              v20 = CFSTR("MAPS_APP_LAUNCH");
              break;
            case 17048:
              v20 = CFSTR("MAP_3D_OFF");
              break;
            case 17049:
              v20 = CFSTR("MAP_3D_ON");
              break;
            case 17050:
              v20 = CFSTR("MAP_OPTIONS_DROP_PIN");
              break;
            case 17051:
              v20 = CFSTR("MAP_OPTIONS_HYBRID");
              break;
            case 17052:
              v20 = CFSTR("MAP_OPTIONS_PRINT");
              break;
            case 17053:
              v20 = CFSTR("MAP_OPTIONS_REMOVE_PIN");
              break;
            case 17054:
              v20 = CFSTR("MAP_OPTIONS_SATELLITE");
              break;
            case 17055:
              v20 = CFSTR("MAP_OPTIONS_STANDARD");
              break;
            case 17056:
              v20 = CFSTR("MAP_OPTIONS_TRAFFIC_HIDE");
              break;
            case 17057:
              v20 = CFSTR("MAP_OPTIONS_TRAFFIC_SHOW");
              break;
            case 17058:
              v20 = CFSTR("MAP_OPTIONS_TRANSIT");
              break;
            case 17059:
              v20 = CFSTR("MAP_TAP_FLYOVER_CITY");
              break;
            case 17060:
              v20 = CFSTR("MAP_TAP_LINE");
              break;
            case 17061:
              v20 = CFSTR("MAP_TAP_POI_TRANSIT");
              break;
            case 17062:
              v20 = CFSTR("MAP_TAP_TRAFFIC_INCIDENT");
              break;
            case 17063:
              v20 = CFSTR("MAP_TRANSIT_NOT_AVAIL_SHOWING");
              break;
            case 17064:
              v20 = CFSTR("MAP_USER_TRACKING_OFF");
              break;
            case 17065:
              v20 = CFSTR("MAP_USER_TRACKING_ON");
              break;
            case 17066:
              v20 = CFSTR("MAP_USER_TRACKING_WITH_HEADING_ON");
              break;
            case 17067:
              v20 = CFSTR("NAV_CLEAR");
              break;
            case 17068:
              v20 = CFSTR("NAV_LIST");
              break;
            case 17069:
              v20 = CFSTR("NAV_ROUTE_STEP_NEXT");
              break;
            case 17070:
              v20 = CFSTR("NAV_ROUTE_STEP_PREV");
              break;
            case 17071:
              v20 = CFSTR("NO_NETWORK_ROUTING_ALERT_DISPLAYED");
              break;
            case 17072:
              v20 = CFSTR("ORB_DISPLAY_MENU");
              break;
            case 17073:
              v20 = CFSTR("ORB_MENU_CALL");
              break;
            case 17074:
              v20 = CFSTR("ORB_MENU_DIRECTIONS");
              break;
            case 17075:
              v20 = CFSTR("ORB_MENU_DISMISS");
              break;
            case 17076:
              v20 = CFSTR("ORB_MENU_SHARE");
              break;
            case 17077:
              v20 = CFSTR("ORB_MENU_SHOW_PLACECARD");
              break;
            case 17078:
              v20 = CFSTR("ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP");
              break;
            case 17079:
              v20 = CFSTR("ORB_MENU_URL");
              break;
            case 17080:
              v20 = CFSTR("ORB_PRESS");
              break;
            case 17081:
              v20 = CFSTR("ORB_SPRINGBOARD_MARK_LOCATION");
              break;
            case 17082:
              v20 = CFSTR("ORB_SPRINGBOARD_SEARCH");
              break;
            case 17083:
              v20 = CFSTR("ORB_SPRINGBOARD_SHARE_LOCATION");
              break;
            case 17084:
              v20 = CFSTR("RAP_ENTRY_SEARCH_AUTOCOMPLETE");
              break;
            case 17085:
              v20 = CFSTR("RAP_PERMISSION_CANCEL");
              break;
            case 17086:
              v20 = CFSTR("RAP_PERMISSION_EMAIL_NA");
              break;
            case 17087:
              v20 = CFSTR("RAP_PERMISSION_EMAIL_OK");
              break;
            case 17088:
              v20 = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED");
              break;
            case 17089:
              v20 = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_DENIED");
              break;
            case 17090:
              v20 = CFSTR("RAP_PERMISSION_OK");
              break;
            case 17091:
              v20 = CFSTR("SEARCH_BEGIN");
              break;
            case 17092:
              v20 = CFSTR("SEARCH_CANCEL");
              break;
            case 17093:
              v20 = CFSTR("SEARCH_SELECT");
              break;
            case 17094:
              v20 = CFSTR("TRANSIT_LINE_SELECTION_DISMISS");
              break;
            case 17095:
              v20 = CFSTR("TRANSIT_LINE_SELECTION_VIEW");
              break;
            case 17096:
              v20 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS");
              break;
            case 17097:
              v20 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE");
              break;
            case 17098:
              v20 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS");
              break;
            case 17099:
              v20 = CFSTR("UNKNOWN_ACTION");
              break;
            case 17100:
              v20 = CFSTR("INFO_SHARE_TWITTER");
              break;
            case 17101:
              v20 = CFSTR("INFO_TAP_POPULAR_APP_NEARBY");
              break;
            case 17102:
              v20 = CFSTR("INFO_DIRECTIONS_WALK");
              break;
            case 17103:
              v20 = CFSTR("INFO_DIRECTIONS_TRANSIT");
              break;
            case 17104:
              v20 = CFSTR("INFO_DIRECTIONS_DRIVE");
              break;
            case 17105:
              v20 = CFSTR("INFO_REPORT_A_PROBLEM");
              break;
            case 17106:
              v20 = CFSTR("CALLOUT_NAV");
              break;
            case 17107:
              v20 = CFSTR("RAP_PERMISSION_EMAIL_CANCEL");
              break;
            case 17108:
              v20 = CFSTR("MAP_TAP_POI");
              break;
            default:
              if ((_DWORD)v15 == 16001)
              {
                v20 = CFSTR("SEARCH_IN_MAPS");
              }
              else
              {
                if ((_DWORD)v15 != 90010)
                  goto LABEL_47;
                v20 = CFSTR("PAN_RIGHT");
              }
              break;
          }
        }
      }
      else
      {
        switch((int)v15)
        {
          case 10101:
            v20 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT");
            break;
          case 10102:
            v20 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE");
            break;
          case 10103:
            v20 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT");
            break;
          case 10104:
            v20 = CFSTR("RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT");
            break;
          case 10105:
            v20 = CFSTR("RAP_DIRECTIONS_ADD_INSTRUCTION_INFO");
            break;
          case 10106:
            v20 = CFSTR("RAP_DIRECTIONS_COLLAPSE_INSTRUCTION");
            break;
          case 10107:
            v20 = CFSTR("RAP_DIRECTIONS_EXPAND_INSTRUCTION");
            break;
          case 10108:
            v20 = CFSTR("RAP_DIRECTIONS_SELECT_INSTRUCTION");
            break;
          case 10109:
            v20 = CFSTR("RAP_CANCEL");
            break;
          case 10110:
            v20 = CFSTR("RAP_NEXT");
            break;
          case 10111:
            v20 = CFSTR("RAP_BACK");
            break;
          case 10112:
            v20 = CFSTR("RAP_SEND");
            break;
          case 10113:
            v20 = CFSTR("RAP_SKIP");
            break;
          case 10114:
            v20 = CFSTR("RAP_SHOW_MORE");
            break;
          case 10115:
            v20 = CFSTR("RAP_ADD_PHOTO");
            break;
          case 10116:
            v20 = CFSTR("RAP_MAP_INCORRECT");
            break;
          case 10117:
            v20 = CFSTR("RAP_BAD_DIRECTIONS");
            break;
          case 10118:
            v20 = CFSTR("RAP_TRANSIT_INFO_INCORRECT");
            break;
          case 10119:
            v20 = CFSTR("RAP_SATELLITE_IMAGE_PROBLEM");
            break;
          case 10120:
            v20 = CFSTR("RAP_SEARCH_RESULTS_INCORRECT");
            break;
          case 10121:
            v20 = CFSTR("RAP_ADD_A_PLACE");
            break;
          case 10122:
            v20 = CFSTR("RAP_HOME");
            break;
          case 10123:
            v20 = CFSTR("RAP_WORK");
            break;
          case 10124:
            v20 = CFSTR("RAP_OTHER");
            break;
          case 10125:
            v20 = CFSTR("RAP_LOCATION");
            break;
          case 10126:
            v20 = CFSTR("RAP_TRANSIT_STATION_INFO_INCORRECT");
            break;
          case 10127:
            v20 = CFSTR("RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT");
            break;
          case 10128:
            v20 = CFSTR("RAP_TRANSIT_LINE_INFO_INCORRECT");
            break;
          case 10129:
            v20 = CFSTR("RAP_TRANSIT_LINE_NAME_INCORRECT");
            break;
          case 10130:
            v20 = CFSTR("RAP_TRANSIT_LINE_SHAPE_INCORRECT");
            break;
          case 10131:
            v20 = CFSTR("RAP_TRANSIT_LINE_SCHEDULE_INCORRECT");
            break;
          case 10132:
            v20 = CFSTR("RAP_TRANSIT_DELAY");
            break;
          case 10133:
            v20 = CFSTR("RAP_LOCATION_CLOSED");
            break;
          case 10134:
            v20 = CFSTR("RAP_CLOSED_PERMANENTLY");
            break;
          case 10135:
            v20 = CFSTR("RAP_CLOSED_TEMPORARILY");
            break;
          case 10136:
            v20 = CFSTR("RAP_HOURS_HAVE_CHANGED");
            break;
          case 10137:
            v20 = CFSTR("RAP_SELECT_STATION");
            break;
          case 10138:
            v20 = CFSTR("RAP_SELECT_LINE");
            break;
          case 10139:
            v20 = CFSTR("RAP_SELECT_ACCESS_POINT");
            break;
          case 10140:
            v20 = CFSTR("RAP_SELECT_SEARCH");
            break;
          case 10141:
            v20 = CFSTR("RAP_PAN_MAP");
            break;
          case 10142:
            v20 = CFSTR("RAP_CENTER_MAP_ON_USER");
            break;
          case 10143:
            v20 = CFSTR("RAP_SEARCH_UNEXPECTED");
            break;
          case 10144:
            v20 = CFSTR("RAP_ADD_POI");
            break;
          case 10145:
            v20 = CFSTR("RAP_ADD_STREET_ADDRESS");
            break;
          case 10146:
            v20 = CFSTR("RAP_ADD_OTHER");
            break;
          case 10147:
            v20 = CFSTR("RAP_SELECT_CATEGORY");
            break;
          case 10148:
            v20 = CFSTR("RAP_TAKE_PHOTO");
            break;
          case 10149:
            v20 = CFSTR("RAP_RETAKE_PHOTO");
            break;
          case 10150:
            v20 = CFSTR("RAP_PLACE_DETAILS");
            break;
          case 10151:
            v20 = CFSTR("RAP_SATELLITE_IMAGE_OUTDATED");
            break;
          case 10152:
            v20 = CFSTR("RAP_SATELLITE_IMAGE_QUALITY");
            break;
          case 10153:
            v20 = CFSTR("RAP_SELECT_LABEL");
            break;
          case 10154:
            v20 = CFSTR("RAP_SELECT_ROUTE");
            break;
          case 10155:
            v20 = CFSTR("RAP_CLAIM_BUSINESS");
            break;
          case 10156:
            v20 = CFSTR("RAP_BRAND_DETAILS");
            break;
          case 10157:
            v20 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY");
            break;
          case 10158:
            v20 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET");
            break;
          case 10159:
            v20 = CFSTR("RAP_LOOK_AROUND_BLURRING");
            break;
          case 10160:
            v20 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME");
            break;
          case 10161:
            v20 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE");
            break;
          case 10162:
            v20 = CFSTR("RAP_LOOK_AROUND_PRIVACY");
            break;
          case 10163:
            v20 = CFSTR("RAP_INCORRECT_HOURS");
            break;
          case 10164:
            v20 = CFSTR("RAP_INCORRECT_ADDRESS");
            break;
          case 10165:
            v20 = CFSTR("RAP_EDIT_PLACE_DETAILS");
            break;
          case 10166:
            v20 = CFSTR("RAP_EDIT_PLACE_NAME");
            break;
          case 10167:
            v20 = CFSTR("RAP_EDIT_ADDRESS");
            break;
          case 10168:
            v20 = CFSTR("RAP_ADD_CATEGORY");
            break;
          case 10169:
            v20 = CFSTR("RAP_REMOVE_CATEGORY");
            break;
          case 10170:
            v20 = CFSTR("RAP_DESELECT_CATEGORY");
            break;
          case 10171:
            v20 = CFSTR("RAP_ADD_HOURS");
            break;
          case 10172:
            v20 = CFSTR("RAP_REMOVE_HOURS");
            break;
          case 10173:
            v20 = CFSTR("RAP_TAP_DAY_OF_WEEK");
            break;
          case 10174:
            v20 = CFSTR("RAP_TAP_24_HOURS_BUTTON");
            break;
          case 10175:
            v20 = CFSTR("RAP_TAP_OPEN_TIME");
            break;
          case 10176:
            v20 = CFSTR("RAP_TAP_CLOSED_TIME");
            break;
          case 10177:
            v20 = CFSTR("RAP_TAP_TEMPORARY_CLOSURE");
            break;
          case 10178:
            v20 = CFSTR("RAP_TAP_PERMANENTLY_CLOSED");
            break;
          case 10179:
            v20 = CFSTR("RAP_EDIT_WEBSITE");
            break;
          case 10180:
            v20 = CFSTR("RAP_EDIT_PHONE_NUMBER");
            break;
          case 10181:
            v20 = CFSTR("RAP_TAP_ACCEPTS_APPLE_PAY");
            break;
          case 10182:
            v20 = CFSTR("RAP_ADD_COMMENTS");
            break;
          case 10183:
            v20 = CFSTR("RAP_EDIT_LOCATION");
            break;
          case 10184:
            v20 = CFSTR("RAP_VIEW_LOCATION");
            break;
          case 10185:
            v20 = CFSTR("RAP_ZOOM_IN");
            break;
          case 10186:
            v20 = CFSTR("RAP_ZOOM_OUT");
            break;
          case 10187:
            v20 = CFSTR("RAP_VIEW_ENTRY_POINTS");
            break;
          case 10188:
            v20 = CFSTR("RAP_EDIT_EXISTING_ENTRY_POINT");
            break;
          case 10189:
            v20 = CFSTR("RAP_ADD_NEW_ENTRY_POINT");
            break;
          case 10190:
            v20 = CFSTR("RAP_REMOVE_ENTRY_POINT");
            break;
          case 10191:
            v20 = CFSTR("RAP_SELECT_ENTRY_POINT_TYPE");
            break;
          default:
            switch((int)v15)
            {
              case 11001:
                v20 = CFSTR("EXIT_MAPS_LOWER_WRIST");
                break;
              case 11002:
                v20 = CFSTR("TASK_READY");
                break;
              case 11003:
                v20 = CFSTR("TAP_SEARCH");
                break;
              case 11004:
                v20 = CFSTR("TAP_MY_LOCATION");
                break;
              case 11005:
                v20 = CFSTR("SHOW_NEARBY");
                break;
              case 11006:
                v20 = CFSTR("TAP_NEARBY");
                break;
              case 11007:
                v20 = CFSTR("TAP_PROACTIVE");
                break;
              case 11008:
                v20 = CFSTR("FORCE_PRESS");
                break;
              case 11009:
                v20 = CFSTR("TAP_CONTACTS");
                break;
              case 11010:
                v20 = CFSTR("TAP_TRANSIT");
                break;
              case 11011:
                v20 = CFSTR("TAP_DICTATION");
                break;
              case 11012:
                v20 = CFSTR("GET_DIRECTIONS_DRIVING");
                break;
              case 11013:
                v20 = CFSTR("GET_DIRECTIONS_WALKING");
                break;
              case 11014:
                v20 = CFSTR("GET_DIRECTIONS_TRANSIT");
                break;
              case 11015:
                v20 = CFSTR("OPEN_STANDARD_MAP");
                break;
              case 11016:
                v20 = CFSTR("OPEN_TRANSIT_MAP");
                break;
              case 11017:
                v20 = CFSTR("START_NAV_AUTO");
                break;
              case 11018:
                v20 = CFSTR("TAP_RECENT");
                break;
              case 11019:
                v20 = CFSTR("TAP_FAVORITE");
                break;
              case 11020:
                v20 = CFSTR("TAP_SCRIBBLE");
                break;
              case 11021:
                v20 = CFSTR("TAP_VIEW_MAP");
                break;
              case 11022:
                v20 = CFSTR("TAP_VIEW_TBT");
                break;
              case 11023:
                v20 = CFSTR("VIEW_ROUTE_INFO");
                break;
              case 11024:
                v20 = CFSTR("NAV_UNMUTE");
                break;
              case 11025:
                v20 = CFSTR("NAV_MUTE");
                break;
              case 11026:
                v20 = CFSTR("GET_DIRECTIONS_CYCLING");
                break;
              case 11027:
                v20 = CFSTR("TAP_SEARCH_HOME");
                break;
              case 11028:
                v20 = CFSTR("ROUTE_PAUSED_ON_WATCH");
                break;
              case 11029:
                v20 = CFSTR("NEXT_STOP_TAPPED_ON_WATCH");
                break;
              default:
                switch((int)v15)
                {
                  case 12001:
                    v20 = CFSTR("VIEW_MORE_OPTIONS");
                    break;
                  case 12002:
                    v20 = CFSTR("SELECT_TIME");
                    break;
                  case 12003:
                    v20 = CFSTR("SHOW_NEXT_AVAILABLE");
                    break;
                  case 12004:
                    v20 = CFSTR("DECREASE_TABLE_SIZE");
                    break;
                  case 12005:
                    v20 = CFSTR("INCREASE_TABLE_SIZE");
                    break;
                  case 12006:
                    v20 = CFSTR("EDIT_BOOKING");
                    break;
                  case 12007:
                    v20 = CFSTR("EDIT_PHONE");
                    break;
                  case 12008:
                    v20 = CFSTR("ADD_SPECIAL_REQUEST");
                    break;
                  case 12009:
                    v20 = CFSTR("CHANGE_RESERVATION");
                    break;
                  case 12010:
                    v20 = CFSTR("LEARN_MORE");
                    break;
                  default:
                    goto LABEL_47;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v20 = CFSTR("UI_ACTION_UNKNOWN");
      switch((int)v15)
      {
        case 0:
          break;
        case 1:
          v20 = CFSTR("PULL_UP");
          break;
        case 2:
          v20 = CFSTR("PULL_DOWN");
          break;
        case 3:
          v20 = CFSTR("TAP");
          break;
        case 4:
          v20 = CFSTR("CLOSE");
          break;
        case 5:
          v20 = CFSTR("SWIPE_PREV");
          break;
        case 6:
          v20 = CFSTR("SWIPE_NEXT");
          break;
        case 7:
          v20 = CFSTR("SCROLL_UP");
          break;
        case 8:
          v20 = CFSTR("SCROLL_DOWN");
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 487:
        case 488:
        case 489:
        case 490:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_47;
        case 10:
          v20 = CFSTR("SHOW_MORE");
          break;
        case 11:
          v20 = CFSTR("SHOW_LESS");
          break;
        case 12:
          v20 = CFSTR("SWIPE_LEFT");
          break;
        case 13:
          v20 = CFSTR("SWIPE_RIGHT");
          break;
        case 14:
          v20 = CFSTR("MINIMIZE");
          break;
        case 15:
          v20 = CFSTR("TAP_PREV");
          break;
        case 16:
          v20 = CFSTR("TAP_NEXT");
          break;
        case 17:
          v20 = CFSTR("SUBMIT");
          break;
        case 18:
          v20 = CFSTR("CANCEL");
          break;
        case 19:
          v20 = CFSTR("ENTER_MAPS");
          break;
        case 20:
          v20 = CFSTR("EXIT_MAPS");
          break;
        case 21:
          v20 = CFSTR("REVEAL");
          break;
        case 22:
          v20 = CFSTR("OPEN_NEW_TAB");
          break;
        case 25:
          v20 = CFSTR("BACK");
          break;
        case 26:
          v20 = CFSTR("ACTIVATE");
          break;
        case 27:
          v20 = CFSTR("DEACTIVATE");
          break;
        case 28:
          v20 = CFSTR("AGREE");
          break;
        case 29:
          v20 = CFSTR("DISAGREE");
          break;
        case 30:
          v20 = CFSTR("SKIP_ANSWER");
          break;
        case 31:
          v20 = CFSTR("EXPAND");
          break;
        case 32:
          v20 = CFSTR("COLLAPSE");
          break;
        case 33:
          v20 = CFSTR("ENTER");
          break;
        case 34:
          v20 = CFSTR("EXIT");
          break;
        case 35:
          v20 = CFSTR("SCROLL_UP_INDEX_BAR");
          break;
        case 36:
          v20 = CFSTR("SCROLL_DOWN_INDEX_BAR");
          break;
        case 37:
          v20 = CFSTR("TOGGLE_ON");
          break;
        case 38:
          v20 = CFSTR("TOGGLE_OFF");
          break;
        case 39:
          v20 = CFSTR("LONG_PRESS");
          break;
        case 40:
          v20 = CFSTR("CLICK");
          break;
        case 41:
          v20 = CFSTR("TAP_DONE");
          break;
        case 42:
          v20 = CFSTR("TAP_CLOSE");
          break;
        case 43:
          v20 = CFSTR("SCROLL_LEFT");
          break;
        case 44:
          v20 = CFSTR("SCROLL_RIGHT");
          break;
        case 45:
          v20 = CFSTR("DISPLAY");
          break;
        case 46:
          v20 = CFSTR("OPEN_IN_APP");
          break;
        case 47:
          v20 = CFSTR("CONCEAL");
          break;
        case 48:
          v20 = CFSTR("TAP_DELETE");
          break;
        case 49:
          v20 = CFSTR("TAP_FILTER");
          break;
        case 50:
          v20 = CFSTR("TAP_SECONDARY_BUTTON");
          break;
        case 51:
          v20 = CFSTR("TAP_WIDGET_FOOD");
          break;
        case 52:
          v20 = CFSTR("TAP_WIDGET_GAS");
          break;
        case 53:
          v20 = CFSTR("TAP_WIDGET_LOADING");
          break;
        case 54:
          v20 = CFSTR("TAP_WIDGET_SEARCH");
          break;
        case 55:
          v20 = CFSTR("TAP_WIDGET_STORES");
          break;
        case 56:
          v20 = CFSTR("DISPLAY_ALLOW_ONCE_PROMPT");
          break;
        case 57:
          v20 = CFSTR("SHARE_CURRENT_LOCATION");
          break;
        case 58:
          v20 = CFSTR("SHARE_PHOTO");
          break;
        case 59:
          v20 = CFSTR("TAP_KEEP_OFF");
          break;
        case 60:
          v20 = CFSTR("TAP_PHOTO_CATEGORY");
          break;
        case 61:
          v20 = CFSTR("TAP_PRECISE_LOCATION_OFF_BANNER");
          break;
        case 62:
          v20 = CFSTR("TAP_TURN_ON");
          break;
        case 63:
          v20 = CFSTR("DISPLAY_CYCLING_ANNOTATION");
          break;
        case 64:
          v20 = CFSTR("DISPLAY_DRIVING_DEFAULT_OPTION");
          break;
        case 65:
          v20 = CFSTR("DISPLAY_TRANSIT_DEFAULT_OPTION");
          break;
        case 66:
          v20 = CFSTR("DISPLAY_WALKING_DEFAULT_OPTION");
          break;
        case 67:
          v20 = CFSTR("TAP_CYCLING_ANNOTATION");
          break;
        case 68:
          v20 = CFSTR("TAP_DRIVING_DEFAULT_OPTION");
          break;
        case 69:
          v20 = CFSTR("TAP_TRANSIT_DEFAULT_OPTION");
          break;
        case 70:
          v20 = CFSTR("TAP_WALKING_DEFAULT_OPTION");
          break;
        case 71:
          v20 = CFSTR("DISPLAY_RIDESHARE_DEFAULT_OPTION");
          break;
        case 72:
          v20 = CFSTR("TAP_RIDESHARE_DEFAULT_OPTION");
          break;
        case 73:
          v20 = CFSTR("TAP_PERSONAL_COLLECTION");
          break;
        case 74:
          v20 = CFSTR("RESUME_ROUTE");
          break;
        case 75:
          v20 = CFSTR("DISPLAY_OUT_OF_RANGE_ALERT");
          break;
        case 76:
          v20 = CFSTR("TAP_ALLOW_ONCE");
          break;
        case 77:
          v20 = CFSTR("TAP_DO_NOT_ALLOW");
          break;
        case 78:
          v20 = CFSTR("ADD_RECCOMENDED_FAVORITE");
          break;
        case 79:
          v20 = CFSTR("ADD_RECOMMENDED_HOME_FAVORITE");
          break;
        case 80:
          v20 = CFSTR("ADD_RECOMMENDED_SCHOOL_FAVORITE");
          break;
        case 81:
          v20 = CFSTR("ADD_RECOMMENDED_WORK_FAVORITE");
          break;
        case 82:
          v20 = CFSTR("CREATE_RECCOMENDED_SCHOOL_FAVORITE");
          break;
        case 83:
          v20 = CFSTR("CREATE_SCHOOL_FAVORITE");
          break;
        case 84:
          v20 = CFSTR("TAP_SCHOOL_FAVORITE");
          break;
        case 85:
          v20 = CFSTR("SELECT_ROUTING_TYPE_CYCLING");
          break;
        case 86:
          v20 = CFSTR("REPORT_PHOTO");
          break;
        case 87:
          v20 = CFSTR("TAP_LARGE_WIDGET_BROWSE_CATEGORY");
          break;
        case 88:
          v20 = CFSTR("TAP_MEDIUM_WIDGET_BROWSE_CATEGORY");
          break;
        case 89:
          v20 = CFSTR("TAP_SMALL_WIDGET_BROWSE_CATEGORY");
          break;
        case 90:
          v20 = CFSTR("CREATE_RECOMMENDED_FAVORITE");
          break;
        case 91:
          v20 = CFSTR("CREATE_RECOMMENDED_HOME_FAVORITE");
          break;
        case 92:
          v20 = CFSTR("CREATE_RECOMMENDED_SCHOOL_FAVORITE");
          break;
        case 93:
          v20 = CFSTR("CREATE_RECOMMENDED_WORK_FAVORITE");
          break;
        case 94:
          v20 = CFSTR("TAP_SMALL_WIDGET_ITEM");
          break;
        case 95:
          v20 = CFSTR("TAP_MEDIUM_WIDGET_ITEM");
          break;
        case 96:
          v20 = CFSTR("TAP_LARGE_WIDGET_ITEM");
          break;
        case 97:
          v20 = CFSTR("DISPLAY_ARP_TIPKIT");
          break;
        case 98:
          v20 = CFSTR("NEXT");
          break;
        case 99:
          v20 = CFSTR("TAP_RATE_AND_ADD_PHOTOS");
          break;
        case 100:
          v20 = CFSTR("TAP_TO_ADD_POSITIVE_RATING");
          break;
        case 101:
          v20 = CFSTR("TAP_TO_ADD_NEGATIVE_RATING");
          break;
        case 102:
          v20 = CFSTR("TAP_ACTIVE_SHARING_NOTIFICATION");
          break;
        case 103:
          v20 = CFSTR("INVOKE_SIRI_PROMPT");
          break;
        case 104:
          v20 = CFSTR("ETA_SHARED_SUCCESSFULLY");
          break;
        case 105:
          v20 = CFSTR("ENDED_ETA_SHARE_SUCCESSFULLY");
          break;
        case 106:
          v20 = CFSTR("CLEAR_INCIDENT");
          break;
        case 107:
          v20 = CFSTR("CONFIRM_INCIDENT");
          break;
        case 108:
          v20 = CFSTR("DISMISS_INCIDENT");
          break;
        case 109:
          v20 = CFSTR("INCIDENT_ALERT_TIMEOUT");
          break;
        case 110:
          v20 = CFSTR("INCIDENT_ALERT_TRAY_SHOWN");
          break;
        case 111:
          v20 = CFSTR("INCIDENT_CARD_SHOWN");
          break;
        case 112:
          v20 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN");
          break;
        case 113:
          v20 = CFSTR("INCIDENT_REPORT_TRAY_SHOWN");
          break;
        case 114:
          v20 = CFSTR("NAV_TRAY_DISCOVERY_SHOWN");
          break;
        case 115:
          v20 = CFSTR("TAP_TO_REPORT_INCIDENT");
          break;
        case 116:
          v20 = CFSTR("TAP_SHORTCUT");
          break;
        case 117:
          v20 = CFSTR("BLOCK_CONTACT");
          break;
        case 118:
          v20 = CFSTR("TAP_TO_ADD_RATING");
          break;
        case 119:
          v20 = CFSTR("AR_WALKING_LOCALIZATION_FAILED");
          break;
        case 120:
          v20 = CFSTR("AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE");
          break;
        case 121:
          v20 = CFSTR("AR_WALKING_LOCALIZATION_SUCCESSFUL");
          break;
        case 122:
          v20 = CFSTR("AR_WALKING_LOCALIZATION_USER_ABANDON");
          break;
        case 123:
          v20 = CFSTR("ATTEMPT_AR_WALKING_LOCALIZATION");
          break;
        case 124:
          v20 = CFSTR("RAISE_TO_ENTER_AR_WALKING");
          break;
        case 125:
          v20 = CFSTR("TAP_DISMISS");
          break;
        case 126:
          v20 = CFSTR("TAP_ENTER_AR_WALKING");
          break;
        case 127:
          v20 = CFSTR("TAP_OK");
          break;
        case 128:
          v20 = CFSTR("TAP_TRY_AGAIN");
          break;
        case 129:
          v20 = CFSTR("TAP_TURN_ON_IN_SETTINGS");
          break;
        case 130:
          v20 = CFSTR("VLF_CORRECTION_FAILED_TO_INITIALIZE");
          break;
        case 131:
          v20 = CFSTR("VLF_CORRECTION_USER_ABANDON");
          break;
        case 132:
          v20 = CFSTR("AREA_EVENTS_ALERT");
          break;
        case 133:
          v20 = CFSTR("TAP_SHOW_EVENTS_ADVISORY_DETAILS");
          break;
        case 134:
          v20 = CFSTR("ACCEPT_EVENT_REROUTE");
          break;
        case 135:
          v20 = CFSTR("DISPLAY_AREA_EVENTS_ADVISORY");
          break;
        case 136:
          v20 = CFSTR("DISMISS_EVENT_REROUTE");
          break;
        case 137:
          v20 = CFSTR("PUNCH_OUT_EVENTS_LINK");
          break;
        case 138:
          v20 = CFSTR("SELECT_VOICE_GUIDANCE_ALERTS_ONLY");
          break;
        case 139:
          v20 = CFSTR("ADJUST_GUIDANCE_SETTINGS");
          break;
        case 140:
          v20 = CFSTR("HIDE_DETAILS");
          break;
        case 141:
          v20 = CFSTR("SELECT_VOICE_GUIDANCE_ON");
          break;
        case 142:
          v20 = CFSTR("SELECT_VOICE_GUIDANCE_OFF");
          break;
        case 143:
          v20 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE");
          break;
        case 144:
          v20 = CFSTR("TAP_TEXT_LABEL");
          break;
        case 145:
          v20 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_WALKING");
          break;
        case 146:
          v20 = CFSTR("TAP_EXIT");
          break;
        case 147:
          v20 = CFSTR("TAP_CITY_MENU");
          break;
        case 148:
          v20 = CFSTR("CHECK_AVOID_TOLLS");
          break;
        case 149:
          v20 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT");
          break;
        case 150:
          v20 = CFSTR("TAP_ICLOUD");
          break;
        case 151:
          v20 = CFSTR("CHECK_AVOID_HIGHWAYS");
          break;
        case 152:
          v20 = CFSTR("TAP_FAVORITES");
          break;
        case 153:
          v20 = CFSTR("SELECT_DISTANCE_IN_KM");
          break;
        case 154:
          v20 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE");
          break;
        case 155:
          v20 = CFSTR("OPEN_FULL_CARD_FILTER");
          break;
        case 156:
          v20 = CFSTR("SCROLL_TEMPORAL_COLLECTION_BACKWARD");
          break;
        case 157:
          v20 = CFSTR("OPEN_SINGLE_CARD_FILTER");
          break;
        case 158:
          v20 = CFSTR("SELECT_RESULT_REFINEMENT_MULTI_SELECT");
          break;
        case 159:
          v20 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE");
          break;
        case 160:
          v20 = CFSTR("SESSIONLESS_REVEAL");
          break;
        case 161:
          v20 = CFSTR("SCROLL_CITY_CURATED_COLLECTION_BACKWARD");
          break;
        case 162:
          v20 = CFSTR("SCROLL_TEMPORAL_COLLECTION_FORWARD");
          break;
        case 163:
          v20 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_CYCLING");
          break;
        case 164:
          v20 = CFSTR("ENTER_RAP_REPORT_MENU");
          break;
        case 165:
          v20 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_DRIVING");
          break;
        case 166:
          v20 = CFSTR("TAP_MY_VEHICLES");
          break;
        case 167:
          v20 = CFSTR("SUBMIT_SINGLE_CARD_FILTER");
          break;
        case 168:
          v20 = CFSTR("SUBMIT_FULL_CARD_FILTER");
          break;
        case 169:
          v20 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE");
          break;
        case 170:
          v20 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE");
          break;
        case 171:
          v20 = CFSTR("TAP_EXPLORE_CURATED_COLELCTIONS");
          break;
        case 172:
          v20 = CFSTR("TAP_ACCOUNT");
          break;
        case 173:
          v20 = CFSTR("TAP_WORLDWIDE_CURATED_COLLECTIONS");
          break;
        case 174:
          v20 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE");
          break;
        case 175:
          v20 = CFSTR("TAP_RECENTLY_VIEWED_CURATED_COLLECTION");
          break;
        case 176:
          v20 = CFSTR("RESULT_REFINEMENT_TOGGLE_OFF");
          break;
        case 177:
          v20 = CFSTR("TAP_CITY_CURATED_COLLECTIONS");
          break;
        case 178:
          v20 = CFSTR("TAP_REPORTS");
          break;
        case 179:
          v20 = CFSTR("TAP_RATINGS");
          break;
        case 180:
          v20 = CFSTR("TAP_EXPLORE_CURATED_COLLECTIONS");
          break;
        case 181:
          v20 = CFSTR("TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION");
          break;
        case 182:
          v20 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE");
          break;
        case 183:
          v20 = CFSTR("SELECT_DISTANCE_IN_MILES");
          break;
        case 184:
          v20 = CFSTR("TAP_PRIVACY_STATEMENT");
          break;
        case 185:
          v20 = CFSTR("TAP_MAPS_SETTINGS");
          break;
        case 186:
          v20 = CFSTR("CANCEL_FULL_CARD_FILTER");
          break;
        case 187:
          v20 = CFSTR("TAP_LATEST_CURATED_COLLECTION");
          break;
        case 188:
          v20 = CFSTR("TAP_TEMPORAL_CURATED_COLLECTION");
          break;
        case 189:
          v20 = CFSTR("UNCHECK_AVOID_TOLLS");
          break;
        case 190:
          v20 = CFSTR("UNSELECT_SEARCH_REFINEMENT");
          break;
        case 191:
          v20 = CFSTR("TAP_RATING");
          break;
        case 192:
          v20 = CFSTR("TAP_ICLOUD_SIGN_IN");
          break;
        case 193:
          v20 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE");
          break;
        case 194:
          v20 = CFSTR("TAP_POI_HIGHLIGHTED_AUXILIARY");
          break;
        case 195:
          v20 = CFSTR("UNCHECK_AVOID_HIGHWAYS");
          break;
        case 196:
          v20 = CFSTR("SCROLL_CITY_CURATED_COLLECTION_FORWARD");
          break;
        case 197:
          v20 = CFSTR("RESULT_REFINEMENT_TOGGLE_ON");
          break;
        case 198:
          v20 = CFSTR("TAP_CONTEXT_LINE_HYPERLINK");
          break;
        case 199:
          v20 = CFSTR("TAP_MY_GUIDES");
          break;
        case 200:
          v20 = CFSTR("SELECT_SEARCH_REFINEMENT");
          break;
        case 201:
          v20 = CFSTR("SESSIONLESS_TAP_ACCOUNT");
          break;
        case 202:
          v20 = CFSTR("UNSELECT_RESULT_REFINEMENT_MULTI_SELECT");
          break;
        case 203:
          v20 = CFSTR("TAP_TRAVEL_PREFERENCES");
          break;
        case 204:
          v20 = CFSTR("SHOW_CURATED_COLLECTION_LIST");
          break;
        case 205:
          v20 = CFSTR("CANCEL_SINGLE_CARD_FILTER");
          break;
        case 206:
          v20 = CFSTR("DISPLAY_HFP_OPTION");
          break;
        case 207:
          v20 = CFSTR("SWITCH_OFF_HFP");
          break;
        case 208:
          v20 = CFSTR("SWITCH_ON_HFP");
          break;
        case 209:
          v20 = CFSTR("TAP_QUICK_ACTION_TRAY");
          break;
        case 210:
          v20 = CFSTR("SHOW_ALL_CITIES");
          break;
        case 211:
          v20 = CFSTR("TAP_ADD_NEARBY_TRANSIT");
          break;
        case 212:
          v20 = CFSTR("RESUME");
          break;
        case 213:
          v20 = CFSTR("DISPLAY_TIPKIT_PROMPT");
          break;
        case 214:
          v20 = CFSTR("TAP_NEARBY_TRANSIT_FAVORITE");
          break;
        case 215:
          v20 = CFSTR("TAP_DRIVING_MODE");
          break;
        case 216:
          v20 = CFSTR("SWITCH_ON_VOICE_GUIDANCE");
          break;
        case 217:
          v20 = CFSTR("DISMISS_TIPKIT_PROMPT");
          break;
        case 218:
          v20 = CFSTR("TAP_EXPAND_EXIT_DETAILS");
          break;
        case 219:
          v20 = CFSTR("TAP_NEARBY_TRANSIT_FILTER");
          break;
        case 220:
          v20 = CFSTR("TAP_MORE_DEPARTURES");
          break;
        case 221:
          v20 = CFSTR("RAP_INDIVIDUAL_PLACE");
          break;
        case 222:
          v20 = CFSTR("RAP_ADD_MAP");
          break;
        case 223:
          v20 = CFSTR("TAP_SUGGESTED_RAP");
          break;
        case 224:
          v20 = CFSTR("RAP_STREET_ISSUE");
          break;
        case 225:
          v20 = CFSTR("SWIPE_PIN_REVEAL");
          break;
        case 226:
          v20 = CFSTR("TAP_ADD_TIPKIT_FAVORITE");
          break;
        case 227:
          v20 = CFSTR("SCROLL_VEHICLE_INFORMATION_BACKWARD");
          break;
        case 228:
          v20 = CFSTR("RAP_BAD_TRIP");
          break;
        case 229:
          v20 = CFSTR("RAP_PLACE_ISSUE");
          break;
        case 230:
          v20 = CFSTR("TAP_OPEN_MAPS");
          break;
        case 231:
          v20 = CFSTR("TAP_NEARBY_TRANSIT_RESULT");
          break;
        case 232:
          v20 = CFSTR("RAP_GUIDE");
          break;
        case 233:
          v20 = CFSTR("SWITCH_OFF_VOICE_GUIDANCE");
          break;
        case 234:
          v20 = CFSTR("DISPLAY_TRIP_FEEDBACK_MESSAGE");
          break;
        case 235:
          v20 = CFSTR("SELECT_TRANSIT_STEP");
          break;
        case 236:
          v20 = CFSTR("SCROLL_VEHICLE_INFORMATION_FORWARD");
          break;
        case 237:
          v20 = CFSTR("TAP_SEE_MORE");
          break;
        case 238:
          v20 = CFSTR("RAP_IN_REVIEW");
          break;
        case 239:
          v20 = CFSTR("TAP_OPEN_MENU");
          break;
        case 240:
          v20 = CFSTR("TAP_NEARBY_TRANSIT");
          break;
        case 241:
          v20 = CFSTR("TAP_PIN_LINE");
          break;
        case 242:
          v20 = CFSTR("SWITCH_OFF_TRIP_FEEDBACK");
          break;
        case 243:
          v20 = CFSTR("RAP_GOOD_TRIP");
          break;
        case 244:
          v20 = CFSTR("TAP_FILTERED_CURATED_COLLECTION");
          break;
        case 245:
          v20 = CFSTR("SHARE_MY_LOCATION");
          break;
        case 246:
          v20 = CFSTR("ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION");
          break;
        case 247:
          v20 = CFSTR("DISPLAY_GENERIC_ADVISORY");
          break;
        case 248:
          v20 = CFSTR("ADVISORY_ALERT");
          break;
        case 249:
          v20 = CFSTR("PUNCH_OUT_LINK");
          break;
        case 250:
          v20 = CFSTR("TAP_GENERIC_ADVISORY");
          break;
        case 251:
          v20 = CFSTR("TAP_EXPLORE_MODE");
          break;
        case 252:
          v20 = CFSTR("TAP_UNPIN_LINE");
          break;
        case 253:
          v20 = CFSTR("MENU_UNPIN");
          break;
        case 254:
          v20 = CFSTR("MENU_PIN");
          break;
        case 255:
          v20 = CFSTR("SWIPE_PIN");
          break;
        case 256:
          v20 = CFSTR("SWIPE_UNPIN");
          break;
        case 257:
          v20 = CFSTR("TAP_MEDIA_APP");
          break;
        case 258:
          v20 = CFSTR("TAP_GUIDES_SUBACTION");
          break;
        case 259:
          v20 = CFSTR("TAP_MEDIA");
          break;
        case 260:
          v20 = CFSTR("PUNCH_OUT_MEDIA");
          break;
        case 261:
          v20 = CFSTR("SHOW_MEDIA_APP_MENU");
          break;
        case 262:
          v20 = CFSTR("SCROLL_RIGHT_RIBBON");
          break;
        case 263:
          v20 = CFSTR("SCROLL_LEFT_RIBBON");
          break;
        case 264:
          v20 = CFSTR("TAP_GOOD_TO_KNOW_MORE_BUTTON");
          break;
        case 265:
          v20 = CFSTR("TAP_SHOW_MORE_TEXT");
          break;
        case 266:
          v20 = CFSTR("SCROLL_LEFT_RATINGS");
          break;
        case 267:
          v20 = CFSTR("SCROLL_LEFT_TEMPLATE_PLACE");
          break;
        case 268:
          v20 = CFSTR("SCROLL_RIGHT_TEMPLATE_PLACE");
          break;
        case 269:
          v20 = CFSTR("SCROLL_RIGHT_RATINGS");
          break;
        case 270:
          v20 = CFSTR("TAP_ALLOW");
          break;
        case 271:
          v20 = CFSTR("TAP_GO_TO_SETTING");
          break;
        case 272:
          v20 = CFSTR("START_SUBMIT_REPORT");
          break;
        case 273:
          v20 = CFSTR("AUTHENTICATION_INFO_FAILURE");
          break;
        case 274:
          v20 = CFSTR("SUCCESSFULLY_SUBMIT_REPORT");
          break;
        case 275:
          v20 = CFSTR("FAILED_SUBMIT_REPORT");
          break;
        case 276:
          v20 = CFSTR("AUTHENTICATION_INFO_SUCCESS");
          break;
        case 277:
          v20 = CFSTR("EDIT_WAYPOINT");
          break;
        case 278:
          v20 = CFSTR("CLEAR_TEXT");
          break;
        case 279:
          v20 = CFSTR("REORDER_WAYPOINT");
          break;
        case 280:
          v20 = CFSTR("REMOVE_WAYPOINT");
          break;
        case 281:
          v20 = CFSTR("TAP_SECONDARY_MULTI_VENDORS_SELECTION");
          break;
        case 282:
          v20 = CFSTR("TAP_SHOWCASE_MENU");
          break;
        case 283:
          v20 = CFSTR("TAP_SHORTCUT_MULTI_VENDORS_SELECTION");
          break;
        case 284:
          v20 = CFSTR("TAP_PHOTO_ALBUM");
          break;
        case 285:
          v20 = CFSTR("RESEARVE_TABLE_MULTI_VENDORS_SELECTION");
          break;
        case 286:
          v20 = CFSTR("RAP_INLINE_ADD");
          break;
        case 287:
          v20 = CFSTR("RAP_TAP_EDIT");
          break;
        case 288:
          v20 = CFSTR("CLAIM_BUSINESS");
          break;
        case 289:
          v20 = CFSTR("RAP_EDIT_OPTIONS");
          break;
        case 290:
          v20 = CFSTR("TAP_IN_REVIEW_RAP");
          break;
        case 291:
          v20 = CFSTR("ORB_MENU_ADD_STOP");
          break;
        case 292:
          v20 = CFSTR("NEXT_STOP");
          break;
        case 293:
          v20 = CFSTR("ARRIVE_AT_WAYPOINT");
          break;
        case 294:
          v20 = CFSTR("REMOVE_STOP");
          break;
        case 295:
          v20 = CFSTR("DISPLAY_PAUSE_BUTTON");
          break;
        case 296:
          v20 = CFSTR("DISPLAY_PAUSE_NEXT_BUTTONS");
          break;
        case 297:
          v20 = CFSTR("AUTO_ADVANCE_NEXT_STOP");
          break;
        case 298:
          v20 = CFSTR("ADD_INLINE_NEGATIVE_RATING");
          break;
        case 299:
          v20 = CFSTR("ADD_INLINE_POSITIVE_RATING");
          break;
        case 300:
          v20 = CFSTR("TAP_TO_ADD_RATING_AND_PHOTO");
          break;
        case 301:
          v20 = CFSTR("SUBMIT_RATINGS_AND_PHOTOS");
          break;
        case 302:
          v20 = CFSTR("TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE");
          break;
        case 303:
          v20 = CFSTR("TAP_RECENTLY_VIEWED_ROUTE");
          break;
        case 304:
          v20 = CFSTR("SHOW_ALL_RECENTS");
          break;
        case 305:
          v20 = CFSTR("RESUME_MULTIPOINT_ROUTE");
          break;
        case 306:
          v20 = CFSTR("DISMISS_TRANSIT_TIPKIT");
          break;
        case 307:
          v20 = CFSTR("DISPLAY_TRANSIT_TIPKIT");
          break;
        case 308:
          v20 = CFSTR("TAP_TRANSIT_TIPKIT");
          break;
        case 309:
          v20 = CFSTR("FILTER_EV");
          break;
        case 310:
          v20 = CFSTR("FILTER_SURCHARGE");
          break;
        case 311:
          v20 = CFSTR("FILTER_PREFER");
          break;
        case 312:
          v20 = CFSTR("TAP_WALKING_ANNOTATION");
          break;
        case 313:
          v20 = CFSTR("FILTER_AVOID");
          break;
        case 314:
          v20 = CFSTR("FILTER_TRANSPORTATION_MODE");
          break;
        case 315:
          v20 = CFSTR("FILTER_RECOMMENDED_ROUTES");
          break;
        case 316:
          v20 = CFSTR("FILTER_IC_FARES");
          break;
        case 317:
          v20 = CFSTR("FILTER_TRANSIT_CARD_FARES");
          break;
        case 318:
          v20 = CFSTR("RESERVE_TABLE_MULTI_VENDORS_SELECTION");
          break;
        case 319:
          v20 = CFSTR("TAP_NOTIFICATION_SETTINGS");
          break;
        case 320:
          v20 = CFSTR("TAP_ENABLE_NOTIFICATION");
          break;
        case 321:
          v20 = CFSTR("ARP_SUGGESTIONS_TURN_OFF");
          break;
        case 322:
          v20 = CFSTR("ARP_SUGGESTIONS_TURN_ON");
          break;
        case 323:
          v20 = CFSTR("DISMISS_ARP_SUGGESTION");
          break;
        case 324:
          v20 = CFSTR("RATINGS_AND_PHOTOS_TURN_ON");
          break;
        case 325:
          v20 = CFSTR("SCROLL_RIGHT_SUGGESTED_PHOTOS");
          break;
        case 326:
          v20 = CFSTR("UNSELECT_SUGGESTED_PHOTOS");
          break;
        case 327:
          v20 = CFSTR("SUGGESTED_PHOTOS_SHOWN");
          break;
        case 328:
          v20 = CFSTR("DISMISS_PHOTOS_LIVE_NOTIFICATION");
          break;
        case 329:
          v20 = CFSTR("TAP_YOUR_PHOTOS_ALBUM");
          break;
        case 330:
          v20 = CFSTR("RATINGS_AND_PHOTOS_TURN_OFF");
          break;
        case 331:
          v20 = CFSTR("DELETE_PHOTO");
          break;
        case 332:
          v20 = CFSTR("DISPLAY_PHOTOS_LIVE_NOTIFICATION");
          break;
        case 333:
          v20 = CFSTR("SCROLL_LEFT_SUGGESTED_PHOTOS");
          break;
        case 334:
          v20 = CFSTR("TAP_PHOTOS_LIVE_NOTIFICATION");
          break;
        case 335:
          v20 = CFSTR("DISPLAY_YOUR_PHOTOS_ALBUM");
          break;
        case 336:
          v20 = CFSTR("SELECT_SUGGESTED_PHOTOS");
          break;
        case 337:
          v20 = CFSTR("ADD_STOP");
          break;
        case 338:
          v20 = CFSTR("SHOW_CREDIT_TURN_ON");
          break;
        case 339:
          v20 = CFSTR("DISPLAY_ARP_SUGGESTION");
          break;
        case 340:
          v20 = CFSTR("TAP_TO_ADD_PHOTO_CREDIT");
          break;
        case 341:
          v20 = CFSTR("SHOW_CREDIT_TURN_OFF");
          break;
        case 342:
          v20 = CFSTR("TAP_TO_EDIT_NICKNAME");
          break;
        case 343:
          v20 = CFSTR("SUBMIT_RATINGS");
          break;
        case 344:
          v20 = CFSTR("END_NAV_ON_WATCH");
          break;
        case 345:
          v20 = CFSTR("FILTER_EBIKE");
          break;
        case 356:
          v20 = CFSTR("ADD_STOP_SIRI");
          break;
        case 357:
          v20 = CFSTR("TAP_REVIEWED_RAP");
          break;
        case 358:
          v20 = CFSTR("TAP_OUTREACH_RAP");
          break;
        case 359:
          v20 = CFSTR("DISPLAY_SUGGESTED_ITEM");
          break;
        case 360:
          v20 = CFSTR("DISPLAY_HIKING_TIPKIT");
          break;
        case 361:
          v20 = CFSTR("DISMISS_HIKING_TIPKIT");
          break;
        case 362:
          v20 = CFSTR("TAP_HIKING_TIPKIT");
          break;
        case 363:
          v20 = CFSTR("SCROLL_LEFT_TRAILS");
          break;
        case 364:
          v20 = CFSTR("TAP_MORE_TRAILS");
          break;
        case 365:
          v20 = CFSTR("TAP_RELATED_TRAIL");
          break;
        case 366:
          v20 = CFSTR("DISPLAY_EXPIRED_SHOWCASE_ERROR");
          break;
        case 367:
          v20 = CFSTR("SCROLL_RIGHT_TRAILS");
          break;
        case 368:
          v20 = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
          break;
        case 369:
          v20 = CFSTR("DISPLAY_DOWNLOAD_MAPS_ALERTS");
          break;
        case 370:
          v20 = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS");
          break;
        case 371:
          v20 = CFSTR("TAP_DOWNLOAD_MAPS_TIPKIT");
          break;
        case 372:
          v20 = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS");
          break;
        case 373:
          v20 = CFSTR("EXPIRED_MAPS_REMOVED");
          break;
        case 374:
          v20 = CFSTR("UPDATE_ALL_DOWNLOAD_MAPS");
          break;
        case 375:
          v20 = CFSTR("TAP_EXPIRED_MAPS");
          break;
        case 376:
          v20 = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS");
          break;
        case 377:
          v20 = CFSTR("MOVE_DOWNLOAD_MAPS");
          break;
        case 378:
          v20 = CFSTR("SAVE_RENAME_DOWNLOAD_MAPS");
          break;
        case 379:
          v20 = CFSTR("TAP_COMPLETE_DOWNLOAD_MAPS");
          break;
        case 380:
          v20 = CFSTR("TAP_ENTER_OFFLINE_MAPS");
          break;
        case 381:
          v20 = CFSTR("TAP_DOWNLOAD_MAPS");
          break;
        case 382:
          v20 = CFSTR("TAP_DOWNLOAD_MAPS_CONTINUE");
          break;
        case 383:
          v20 = CFSTR("DELETE_DOWNLOAD_MAPS");
          break;
        case 384:
          v20 = CFSTR("SLIDE_CLEAR_EXPIRED_MAPS");
          break;
        case 385:
          v20 = CFSTR("RENAME_DOWNLOAD_MAPS");
          break;
        case 386:
          v20 = CFSTR("RESIZE_DOWNLOAD_MAPS");
          break;
        case 387:
          v20 = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS");
          break;
        case 388:
          v20 = CFSTR("RESTORE_EXPIRED_MAPS");
          break;
        case 389:
          v20 = CFSTR("CLEAR_EXPIRED_MAPS");
          break;
        case 390:
          v20 = CFSTR("TAP_USING_OFFLINE_BAR");
          break;
        case 391:
          v20 = CFSTR("UPDATE_DOWNLOAD_MAPS");
          break;
        case 392:
          v20 = CFSTR("DISPLAY_DOWNLOAD_MAPS_TIPKIT");
          break;
        case 393:
          v20 = CFSTR("DISPLAY_DOWNLOAD_MAPS");
          break;
        case 394:
          v20 = CFSTR("TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION");
          break;
        case 395:
          v20 = CFSTR("DISPLAY_EXPIRED_MAPS");
          break;
        case 396:
          v20 = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
          break;
        case 397:
          v20 = CFSTR("DISPLAY_SUGGESTED_DOWNLOAD_MAPS");
          break;
        case 398:
          v20 = CFSTR("SLIDE_RESTORE_EXPIRED_MAPS");
          break;
        case 399:
          v20 = CFSTR("ETA_SHARE_TRAY_TIMEOUT");
          break;
        case 400:
          v20 = CFSTR("START_ETA_SHARING");
          break;
        case 401:
          v20 = CFSTR("PERSON_LOCATION_UPDATE");
          break;
        case 402:
          v20 = CFSTR("STOP_ETA_SHARING");
          break;
        case 403:
          v20 = CFSTR("PUNCH_OUT_TO_FINDMY");
          break;
        case 404:
          v20 = CFSTR("TAP_PEOPLE_LOCATION");
          break;
        case 405:
          v20 = CFSTR("TAP_TO_REQUEST_LOCATION");
          break;
        case 406:
          v20 = CFSTR("ZOOM_OUT_CROWN");
          break;
        case 407:
          v20 = CFSTR("TAP_RESIZE_DOWNLOAD_MAPS");
          break;
        case 408:
          v20 = CFSTR("TAP_DELETE_DOWNLOAD_MAPS");
          break;
        case 409:
          v20 = CFSTR("SELECT_LIST_VIEW");
          break;
        case 410:
          v20 = CFSTR("SCROLL_RIGHT_TRAILHEADS");
          break;
        case 411:
          v20 = CFSTR("SWITCH_TO_ONLINE_MODE");
          break;
        case 412:
          v20 = CFSTR("TAP_RELATED_TRAILHEAD");
          break;
        case 413:
          v20 = CFSTR("SELECT_ELEVATION_VIEW");
          break;
        case 414:
          v20 = CFSTR("TOGGLE_PROXIMITY_RADIUS_ON");
          break;
        case 415:
          v20 = CFSTR("SEE_MORE_RECENTS");
          break;
        case 416:
          v20 = CFSTR("SEE_MORE_GUIDES");
          break;
        case 417:
          v20 = CFSTR("SELECT_CONTROLS");
          break;
        case 418:
          v20 = CFSTR("NO_SEARCH_RESULTS");
          break;
        case 419:
          v20 = CFSTR("TAP_VIEW_RESULTS_CAROUSEL");
          break;
        case 420:
          v20 = CFSTR("TAP_VIEW_RESULTS_LIST");
          break;
        case 421:
          v20 = CFSTR("SELECT_MAP_VIEW");
          break;
        case 422:
          v20 = CFSTR("SCROLL_LEFT_TRAILHEADS");
          break;
        case 423:
          v20 = CFSTR("SWITCH_TO_OFFLINE_MODE");
          break;
        case 424:
          v20 = CFSTR("ZOOM_IN_CROWN");
          break;
        case 425:
          v20 = CFSTR("TOGGLE_PROXIMITY_RADIUS_OFF");
          break;
        case 426:
          v20 = CFSTR("TAP_MAP");
          break;
        case 427:
          v20 = CFSTR("SWIPE_DOWN");
          break;
        case 428:
          v20 = CFSTR("TAP_MORE_TRAILHEADS");
          break;
        case 429:
          v20 = CFSTR("TAP_ROUTE_OPTIONS");
          break;
        case 430:
          v20 = CFSTR("TAP_ROUTE_NAV_MAP");
          break;
        case 431:
          v20 = CFSTR("TAP_ROUTE_OVERVIEW_MAP");
          break;
        case 432:
          v20 = CFSTR("TAP_AUDIO");
          break;
        case 433:
          v20 = CFSTR("TAP_OPEN_PLACECARD");
          break;
        case 434:
          v20 = CFSTR("TAP_VIEW_STOPS");
          break;
        case 435:
          v20 = CFSTR("TAP_ROUTE_DETAILS");
          break;
        case 436:
          v20 = CFSTR("ADD_LPR_VEHICLE");
          break;
        case 437:
          v20 = CFSTR("TAP_ADD_VEHICLE");
          break;
        case 438:
          v20 = CFSTR("TAP_PLUG_TYPE");
          break;
        case 439:
          v20 = CFSTR("UNSELECT_SUGGESTED_NETWORK");
          break;
        case 440:
          v20 = CFSTR("TAP_SET_UP_LATER");
          break;
        case 441:
          v20 = CFSTR("ADD_EV_VEHICLE");
          break;
        case 442:
          v20 = CFSTR("UPDATE_COLOR");
          break;
        case 443:
          v20 = CFSTR("SELECT_OTHER_NETWORK");
          break;
        case 444:
          v20 = CFSTR("UNSELECT_NETWORK");
          break;
        case 445:
          v20 = CFSTR("TAP_BACK");
          break;
        case 446:
          v20 = CFSTR("TAP_CANCEL");
          break;
        case 447:
          v20 = CFSTR("UNSELECT_VEHICLE");
          break;
        case 448:
          v20 = CFSTR("UNSELECT_OTHER_NETWORK");
          break;
        case 449:
          v20 = CFSTR("DISPLAY_EV_TIPKIT");
          break;
        case 450:
          v20 = CFSTR("SELECT_NETWORK");
          break;
        case 451:
          v20 = CFSTR("TAP_EV_TIPKIT");
          break;
        case 452:
          v20 = CFSTR("TAP_CHOOSE_NETWORKS");
          break;
        case 453:
          v20 = CFSTR("TAP_ADD_NETWORK");
          break;
        case 454:
          v20 = CFSTR("FILTER_NETWORK");
          break;
        case 455:
          v20 = CFSTR("SELECT_SUGGESTED_NETWORK");
          break;
        case 456:
          v20 = CFSTR("TRANSIT_TO_WALKING");
          break;
        case 457:
          v20 = CFSTR("TRANSIT_TO_FINDMY");
          break;
        case 458:
          v20 = CFSTR("TAP_AC_KEYBOARD");
          break;
        case 459:
          v20 = CFSTR("REACH_PHOTO_STRIP_END");
          break;
        case 460:
          v20 = CFSTR("SEARCH_HERE_REVEAL");
          break;
        case 461:
          v20 = CFSTR("TAP_SEARCH_HERE");
          break;
        case 462:
          v20 = CFSTR("TAP_RECENTLY_VIEWED_CURATED_HIKE");
          break;
        case 463:
          v20 = CFSTR("SAVE");
          break;
        case 464:
          v20 = CFSTR("TAP_MORE_CURATED_HIKES");
          break;
        case 465:
          v20 = CFSTR("CREATE_CUSTOM_ROUTE");
          break;
        case 466:
          v20 = CFSTR("TAP_TRY_NOW");
          break;
        case 467:
          v20 = CFSTR("TAP_CURATED_HIKE");
          break;
        case 468:
          v20 = CFSTR("TAP_RECENTLY_VIEWED_CUSTOM_ROUTE");
          break;
        case 469:
          v20 = CFSTR("ADD_TO_LIBRARY");
          break;
        case 470:
          v20 = CFSTR("START_HIKING");
          break;
        case 471:
          v20 = CFSTR("EDIT_NOTE");
          break;
        case 472:
          v20 = CFSTR("CREATE_NOTE");
          break;
        case 473:
          v20 = CFSTR("DELETE_PIN");
          break;
        case 474:
          v20 = CFSTR("ADD_ROUTE");
          break;
        case 475:
          v20 = CFSTR("ADD_PIN");
          break;
        case 476:
          v20 = CFSTR("REMOVE_FROM_COLLECTION");
          break;
        case 477:
          v20 = CFSTR("REMOVE_FROM_LIBRARY");
          break;
        case 478:
          v20 = CFSTR("TAP_ITEM");
          break;
        case 479:
          v20 = CFSTR("DELETE_ROUTE");
          break;
        case 480:
          v20 = CFSTR("TAP_ROUTE");
          break;
        case 481:
          v20 = CFSTR("TAP_DOWNLOAD_WATCH_MAPS");
          break;
        case 482:
          v20 = CFSTR("DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
          break;
        case 483:
          v20 = CFSTR("STOP_DOWNLOAD_ONTO_WATCH");
          break;
        case 484:
          v20 = CFSTR("TAP_DOWNLOAD_ONTO_WATCH");
          break;
        case 485:
          v20 = CFSTR("TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
          break;
        case 486:
          v20 = CFSTR("TAP_DOWNLOAD_NOW_WATCH");
          break;
        case 1001:
          v20 = CFSTR("PAN");
          break;
        case 1002:
          v20 = CFSTR("ZOOM_IN");
          break;
        case 1003:
          v20 = CFSTR("ZOOM_OUT");
          break;
        case 1004:
          v20 = CFSTR("ROTATE");
          break;
        case 1010:
          v20 = CFSTR("TAP_POI");
          break;
        case 1011:
          v20 = CFSTR("TAP_POI_TRANSIT");
          break;
        case 1017:
          v20 = CFSTR("TAP_POI_HIGHLIGHTED");
          break;
        case 1018:
          v20 = CFSTR("TAP_POI_CLUSTERED");
          break;
        case 1020:
          v20 = CFSTR("TAP_POI_DROPPED_PIN");
          break;
        case 1030:
          v20 = CFSTR("DROP_PIN");
          break;
        case 1031:
          v20 = CFSTR("TAP_INCIDENT");
          break;
        case 1032:
          v20 = CFSTR("TAP_TRANSIT_LINE");
          break;
        case 1033:
          v20 = CFSTR("TAP_POI_CALENDAR");
          break;
        case 1034:
          v20 = CFSTR("TAP_POI_CURRENT_LOCATION");
          break;
        case 1035:
          v20 = CFSTR("TAP_POI_TRANSIT_LINE");
          break;
        case 1036:
          v20 = CFSTR("TAP_POI_LANDMARK");
          break;
        case 1037:
          v20 = CFSTR("TAP_POI_FLYOVER");
          break;
        case 1038:
          v20 = CFSTR("TAP_TO_HIDE_TRAY");
          break;
        case 1039:
          v20 = CFSTR("TAP_TO_REVEAL_TRAY");
          break;
        case 1040:
          v20 = CFSTR("TAP_COMPASS");
          break;
        case 1041:
          v20 = CFSTR("PITCH_AWAY_FROM_GROUND");
          break;
        case 1042:
          v20 = CFSTR("PITCH_CLOSER_TO_GROUND");
          break;
        case 1043:
          v20 = CFSTR("ZOOM_IN_PINCH");
          break;
        case 1044:
          v20 = CFSTR("ZOOM_OUT_PINCH");
          break;
        case 1045:
          v20 = CFSTR("ZOOM_IN_DOUBLE_TAP");
          break;
        case 1046:
          v20 = CFSTR("ZOOM_OUT_TWO_FINGER_TAP");
          break;
        case 1047:
          v20 = CFSTR("ZOOM_IN_ONE_FINGER");
          break;
        case 1048:
          v20 = CFSTR("ZOOM_OUT_ONE_FINGER");
          break;
        case 1049:
          v20 = CFSTR("ZOOM_IN_BUTTON");
          break;
        case 1050:
          v20 = CFSTR("ZOOM_OUT_BUTTON");
          break;
        case 1051:
          v20 = CFSTR("TAP_TRAFFIC_CAMERA");
          break;
        case 1052:
          v20 = CFSTR("DISPLAY_INDOOR_MAP_BUTTON");
          break;
        case 1053:
          v20 = CFSTR("OPEN_INDOOR_MAP");
          break;
        case 1054:
          v20 = CFSTR("DISPLAY_VENUE_BROWSE_BUTTON");
          break;
        case 1055:
          v20 = CFSTR("TAP_VENUE_BROWSE_BUTTON");
          break;
        case 1056:
          v20 = CFSTR("ENTER_VENUE_EXPERIENCE");
          break;
        case 1057:
          v20 = CFSTR("EXIT_VENUE_EXPERIENCE");
          break;
        case 1058:
          v20 = CFSTR("ZOOM_IN_SCENE_PINCH");
          break;
        case 1059:
          v20 = CFSTR("ZOOM_OUT_SCENE_PINCH");
          break;
        case 1060:
          v20 = CFSTR("ZOOM_RESET");
          break;
        case 1061:
          v20 = CFSTR("TAP_SCENE_UNAVAILABLE_AREA");
          break;
        case 1062:
          v20 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
          break;
        case 1063:
          v20 = CFSTR("TAP_SPEED_CAMERA");
          break;
        case 1064:
          v20 = CFSTR("TAP_RED_LIGHT_CAMERA");
          break;
        case 1065:
          v20 = CFSTR("TAP_GEO");
          break;
        default:
          switch((int)v15)
          {
            case 2001:
              v20 = CFSTR("TAP_SEARCH_FIELD");
              break;
            case 2002:
              v20 = CFSTR("CLEAR_SEARCH");
              break;
            case 2003:
              v20 = CFSTR("CANCEL_SEARCH");
              break;
            case 2004:
              v20 = CFSTR("TAP_BROWSE_TOP_CATEGORY");
              break;
            case 2005:
              v20 = CFSTR("TAP_BROWSE_SUB_CATEGORY");
              break;
            case 2006:
              v20 = CFSTR("TAP_BACK_TO_BROWSE_TOP_CATEGORY");
              break;
            case 2007:
              v20 = CFSTR("TAP_LIST_ITEM");
              break;
            case 2008:
              v20 = CFSTR("SHARE_LIST_ITEM");
              break;
            case 2009:
              v20 = CFSTR("DELETE_LIST_ITEM");
              break;
            case 2010:
              v20 = CFSTR("EDIT_LIST_ITEM");
              break;
            case 2011:
              v20 = CFSTR("REFRESH_SEARCH");
              break;
            case 2012:
              v20 = CFSTR("REVEAL_LIST_ITEM_ACTIONS");
              break;
            case 2013:
              v20 = CFSTR("HIDE_LIST_ITEM_ACTIONS");
              break;
            case 2014:
              v20 = CFSTR("TAP_SEARCH_BUTTON");
              break;
            case 2015:
              v20 = CFSTR("SHOW_SEARCH_RESULTS");
              break;
            case 2016:
              v20 = CFSTR("SHOW_REFRESH_SEARCH");
              break;
            case 2017:
              v20 = CFSTR("PASTE_TEXT");
              break;
            case 2018:
              v20 = CFSTR("TAP_LIST_SUB_ITEM");
              break;
            case 2019:
              v20 = CFSTR("DISPLAY_DID_YOU_MEAN_MESSAGE");
              break;
            case 2020:
              v20 = CFSTR("TAP_DID_YOU_MEAN_MESSAGE");
              break;
            case 2021:
              v20 = CFSTR("CLOSE_DID_YOU_MEAN_MESSAGE");
              break;
            case 2022:
              v20 = CFSTR("SCROLL_LEFT_DID_YOU_MEAN_MESSAGE");
              break;
            case 2023:
              v20 = CFSTR("SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE");
              break;
            case 2024:
              v20 = CFSTR("RETAINED_QUERY");
              break;
            case 2025:
              v20 = CFSTR("TAP_RECENT_AC_SUGGESTION");
              break;
            case 2026:
              v20 = CFSTR("CLEAR_RECENT_AC_SUGGESTION");
              break;
            case 2027:
              v20 = CFSTR("DELETE_RECENT_AC_SUGGESTION");
              break;
            case 2028:
            case 2029:
              goto LABEL_47;
            case 2030:
              v20 = CFSTR("TAP_BROWSE_NEARBY_CATEGORY");
              break;
            case 2031:
              v20 = CFSTR("TAP_SUBACTION");
              break;
            case 2032:
              v20 = CFSTR("TAP_QUERY_BUILDING_ARROW");
              break;
            case 2033:
              v20 = CFSTR("CLICK_ON_EDIT_SEARCH");
              break;
            case 2034:
              v20 = CFSTR("REMOVE_CLIENT_AC_SUGGESTION");
              break;
            case 2035:
              v20 = CFSTR("SHARE_CLIENT_AC_SUGGESTION");
              break;
            case 2036:
              v20 = CFSTR("TAP_ON_MORE_RESULTS");
              break;
            case 2037:
              v20 = CFSTR("SHARE_ITEM");
              break;
            case 2038:
              v20 = CFSTR("HIDE_ITEM");
              break;
            case 2039:
              v20 = CFSTR("TAP_SUGGESTED_ITEM");
              break;
            case 2040:
              v20 = CFSTR("SHARE_SUGGESTED_ITEM");
              break;
            case 2041:
              v20 = CFSTR("HIDE_SUGGESTED_ITEM");
              break;
            case 2042:
              v20 = CFSTR("ADD_HOME_FAVORITE");
              break;
            case 2043:
              v20 = CFSTR("ADD_WORK_FAVORITE");
              break;
            case 2044:
              v20 = CFSTR("ADD_FAVORITE");
              break;
            case 2045:
              v20 = CFSTR("VIEW_FAVORITES_LIST");
              break;
            case 2046:
              v20 = CFSTR("TAP_HOME_FAVORITE");
              break;
            case 2047:
              v20 = CFSTR("TAP_WORK_FAVORITE");
              break;
            case 2048:
              v20 = CFSTR("TAP_CAR_FAVORITE");
              break;
            case 2049:
              v20 = CFSTR("TAP_FAVORITE_ITEM");
              break;
            case 2050:
              v20 = CFSTR("CREATE_HOME_FAVORITE");
              break;
            case 2051:
              v20 = CFSTR("CREATE_WORK_FAVORITE");
              break;
            case 2052:
              v20 = CFSTR("CREATE_FAVORITE");
              break;
            case 2053:
              v20 = CFSTR("SUBMIT_FAVORITE_EDIT");
              break;
            case 2054:
              v20 = CFSTR("ADD_RECOMMENDED_FAVORITE");
              break;
            case 2055:
              v20 = CFSTR("EDIT_FAVORITE");
              break;
            case 2056:
              v20 = CFSTR("REMOVE_FAVORITE");
              break;
            case 2057:
              v20 = CFSTR("SHARE_FAVORITE");
              break;
            case 2058:
              v20 = CFSTR("EDIT_FAVORITES");
              break;
            case 2059:
              v20 = CFSTR("ADD_FAVORITE_PLACE");
              break;
            case 2060:
              v20 = CFSTR("REMOVE_FAVORITE_PLACE");
              break;
            case 2061:
              v20 = CFSTR("CHANGE_HOME_ADDRESS");
              break;
            case 2062:
              v20 = CFSTR("CHANGE_WORK_ADDRESS");
              break;
            case 2063:
              v20 = CFSTR("REFINE_LOCATION");
              break;
            case 2064:
              v20 = CFSTR("TAP_RECENTLY_VIEWED_ITEM");
              break;
            case 2065:
              v20 = CFSTR("SHOW_COLLECTION_LIST");
              break;
            case 2066:
              v20 = CFSTR("SHOW_FAVORITES_COLLECTION");
              break;
            case 2067:
              v20 = CFSTR("SHOW_COLLECTION");
              break;
            case 2068:
              v20 = CFSTR("TAP_COLLECTION_ITEM");
              break;
            case 2069:
              v20 = CFSTR("SHARE_COLLECTION_ITEM");
              break;
            case 2070:
              v20 = CFSTR("REMOVE_COLLECTION_ITEM");
              break;
            case 2071:
              v20 = CFSTR("SAVE_SHARED_COLLECTION");
              break;
            case 2072:
              v20 = CFSTR("CREATE_NEW_COLLECTION");
              break;
            case 2073:
              v20 = CFSTR("SAVE_TO_COLLECTION");
              break;
            case 2074:
              v20 = CFSTR("EDIT_PHOTO");
              break;
            case 2075:
              v20 = CFSTR("SORT_BY_NAME");
              break;
            case 2076:
              v20 = CFSTR("SORT_BY_DISTANCE");
              break;
            case 2077:
              v20 = CFSTR("SORT_BY_RECENT");
              break;
            case 2078:
              v20 = CFSTR("AUTO_SHARE_ETA");
              break;
            case 2079:
              v20 = CFSTR("CANCEL_AUTO_SHARE_ETA");
              break;
            case 2080:
              v20 = CFSTR("MAP_SEARCH");
              break;
            case 2081:
              v20 = CFSTR("DELETE_COLLECTION");
              break;
            case 2082:
              v20 = CFSTR("SHARE_COLLECTION");
              break;
            case 2083:
              v20 = CFSTR("SHOW_TRANSIT_LINES_COLLECTION");
              break;
            case 2084:
              v20 = CFSTR("SHOW_MY_PLACES");
              break;
            case 2085:
              v20 = CFSTR("SHOW_ALL_PLACES");
              break;
            case 2086:
              v20 = CFSTR("TAP_RECENT_QUERY");
              break;
            case 2087:
              v20 = CFSTR("TAP_QUERY_SUGGESTION");
              break;
            case 2088:
              v20 = CFSTR("DELETE_CURATED_COLLECTION");
              break;
            case 2089:
              v20 = CFSTR("FOLLOW");
              break;
            case 2090:
              v20 = CFSTR("PUNCH_IN");
              break;
            case 2091:
              v20 = CFSTR("SAVE_CURATED_COLLECTION");
              break;
            case 2092:
              v20 = CFSTR("SCROLL_LEFT_COLLECTIONS");
              break;
            case 2093:
              v20 = CFSTR("SCROLL_RIGHT_COLLECTIONS");
              break;
            case 2094:
              v20 = CFSTR("SEE_ALL_CURATED_COLLECTION");
              break;
            case 2095:
              v20 = CFSTR("SEE_ALL_PUBLISHERS");
              break;
            case 2096:
              v20 = CFSTR("SHARE_CURATED_COLLECTION");
              break;
            case 2097:
              v20 = CFSTR("SHARE_PUBLISHER");
              break;
            case 2098:
              v20 = CFSTR("SHOW_MORE_COLLECTION");
              break;
            case 2099:
              v20 = CFSTR("TAP_CURATED_COLLECTION");
              break;
            case 2100:
              v20 = CFSTR("TAP_FEATURED_COLLECTIONS");
              break;
            case 2101:
              v20 = CFSTR("TAP_LOCATION");
              break;
            case 2102:
              v20 = CFSTR("TAP_PUBLISHER");
              break;
            case 2103:
              v20 = CFSTR("TAP_PUBLISHER_APP");
              break;
            case 2104:
              v20 = CFSTR("TAP_PUBLISHER_COLLECTIONS");
              break;
            case 2105:
              v20 = CFSTR("UNFOLLOW");
              break;
            case 2106:
              v20 = CFSTR("CHANGE_SCHOOL_ADDRESS");
              break;
            case 2107:
              v20 = CFSTR("ADD_VEHICLE");
              break;
            case 2108:
              v20 = CFSTR("DISPLAY_VIRTUAL_GARAGE");
              break;
            case 2109:
              v20 = CFSTR("ENTER_VIRTUAL_GARAGE");
              break;
            case 2110:
              v20 = CFSTR("PUNCH_OUT_MANUFACTURER_APP");
              break;
            case 2111:
              v20 = CFSTR("REMOVE_LICENSE_PLATE");
              break;
            case 2112:
              v20 = CFSTR("REMOVE_VEHICLE");
              break;
            case 2113:
              v20 = CFSTR("SELECT_VEHICLE");
              break;
            case 2114:
              v20 = CFSTR("SUBMIT_LICENSE_PLATE");
              break;
            case 2115:
              v20 = CFSTR("TAP_ADD_LICENSE_PLATE");
              break;
            case 2116:
              v20 = CFSTR("TAP_ADD_NEW_CAR");
              break;
            case 2117:
              v20 = CFSTR("TAP_BANNER");
              break;
            case 2118:
              v20 = CFSTR("TAP_CONNECT");
              break;
            case 2119:
              v20 = CFSTR("TAP_CONTINUE");
              break;
            case 2120:
              v20 = CFSTR("TAP_EDIT");
              break;
            case 2121:
              v20 = CFSTR("TAP_NAME");
              break;
            case 2122:
              v20 = CFSTR("TAP_NOT_NOW");
              break;
            case 2123:
              v20 = CFSTR("TAP_OTHER_VEHICLE");
              break;
            case 2124:
              v20 = CFSTR("TAP_REMOVE_LICENSE_PLATE");
              break;
            case 2125:
              v20 = CFSTR("TAP_UPDATE_PLATE_NUMBER");
              break;
            case 2126:
              v20 = CFSTR("TAP_VEHICLE");
              break;
            case 2127:
              v20 = CFSTR("TAP_VEHICLE_NAME");
              break;
            case 2128:
              v20 = CFSTR("UPDATE_NAME");
              break;
            case 2129:
              v20 = CFSTR("DONE_TAKING_PHOTO");
              break;
            case 2130:
              v20 = CFSTR("ENABLE_SHOW_PHOTO_NAME");
              break;
            case 2131:
              v20 = CFSTR("SUBMIT_PHOTO");
              break;
            case 2132:
              v20 = CFSTR("USE_PHOTO");
              break;
            case 2133:
              v20 = CFSTR("ADD_RECOMMENDATION_TO_MAPS");
              break;
            case 2134:
              v20 = CFSTR("CANCEL_PHOTO_SUBMISSION");
              break;
            case 2135:
              v20 = CFSTR("CLOSE_RECOMMENDATION_CARD");
              break;
            case 2136:
              v20 = CFSTR("EDIT_RATING");
              break;
            case 2137:
              v20 = CFSTR("PROMPTED_TO_ADD_PHOTO");
              break;
            case 2138:
              v20 = CFSTR("PROMPTED_TO_ADD_RATING");
              break;
            case 2139:
              v20 = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION");
              break;
            case 2140:
              v20 = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_SIRI");
              break;
            case 2141:
              v20 = CFSTR("RETAKE_PHOTO");
              break;
            case 2142:
              v20 = CFSTR("REVEAL_RECOMMENDATION_CARD");
              break;
            case 2143:
              v20 = CFSTR("SUBMIT_NEGATIVE_RATING");
              break;
            case 2144:
              v20 = CFSTR("SUBMIT_POSITIVE_RATING");
              break;
            case 2145:
              v20 = CFSTR("TAP_CHOOSING_PHOTO");
              break;
            case 2146:
              v20 = CFSTR("TAP_TAKE_NEW_PHOTO");
              break;
            case 2147:
              v20 = CFSTR("TAP_TO_ADD_PHOTO");
              break;
            case 2148:
              v20 = CFSTR("CANCEL_INCIDENT_REPORT");
              break;
            case 2149:
              v20 = CFSTR("INCIDENT_REPORT_SUBMITTED");
              break;
            case 2150:
              v20 = CFSTR("REPORTED_INCIDENT_NOT_RECEIVED");
              break;
            case 2151:
              v20 = CFSTR("REPORTED_INCIDENT_RECEIVED");
              break;
            case 2152:
              v20 = CFSTR("REPORT_INCIDENT");
              break;
            case 2153:
              v20 = CFSTR("SELECT_INCIDENT_TYPE");
              break;
            case 2154:
              v20 = CFSTR("SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT");
              break;
            case 2155:
              v20 = CFSTR("TAP_TO_START_REPORT_INCIDENT");
              break;
            case 2156:
              v20 = CFSTR("ACTIVELY_DISPLAY_VLF_ENTRY_POINT");
              break;
            case 2157:
              v20 = CFSTR("ATTEMPT_VLF_CORRECTION");
              break;
            case 2158:
              v20 = CFSTR("DISMISS_VLF_PROMPT");
              break;
            case 2159:
              v20 = CFSTR("PASSIVELY_DISPLAY_VLF_ENTRY_POINT");
              break;
            case 2160:
              v20 = CFSTR("VLF_CORRECTION_FAILED");
              break;
            case 2161:
              v20 = CFSTR("VLF_CORRECTION_SUCCESSFUL");
              break;
            case 2162:
              v20 = CFSTR("ENABLE_WIDGET_SUGGESTIONS");
              break;
            case 2163:
              v20 = CFSTR("DISPLAY_CZ_ADVISORY");
              break;
            case 2164:
              v20 = CFSTR("PUNCH_OUT_URL_PAY");
              break;
            case 2165:
              v20 = CFSTR("TAP_SHOW_CZ_ADVISORY_DETAILS");
              break;
            case 2166:
              v20 = CFSTR("DELETE_ITEM");
              break;
            case 2167:
              v20 = CFSTR("CANCEL_REMOVE");
              break;
            case 2168:
              v20 = CFSTR("DELETE_SUGGESTION");
              break;
            case 2169:
              v20 = CFSTR("ADD_SCHOOL_FAVORITE");
              break;
            case 2170:
              v20 = CFSTR("GO_TO_WEBSITE");
              break;
            case 2171:
              v20 = CFSTR("TRY_AGAIN");
              break;
            case 2172:
              v20 = CFSTR("CHECK_AUTO_RECORD_WORKOUT");
              break;
            case 2173:
              v20 = CFSTR("CHECK_EBIKE");
              break;
            case 2174:
              v20 = CFSTR("DISPLAY_AUTOMATIC_WORKOUT_OPTION");
              break;
            case 2175:
              v20 = CFSTR("DISPLAY_CYCLING_DEFAULT_OPTION");
              break;
            case 2176:
              v20 = CFSTR("DISPLAY_CYCLING_NO_BIKE_ADVISORY");
              break;
            case 2177:
              v20 = CFSTR("DISPLAY_CYCLING_STAIRS_ADVISORY");
              break;
            case 2178:
              v20 = CFSTR("DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY");
              break;
            case 2179:
              v20 = CFSTR("TAP_AUTOMATIC_WORKOUT_OPTION");
              break;
            case 2180:
              v20 = CFSTR("TAP_CYCLING_DEFAULT_OPTION");
              break;
            case 2181:
              v20 = CFSTR("TAP_CYCLING_NO_BIKE_ADVISORY");
              break;
            case 2182:
              v20 = CFSTR("TAP_CYCLING_STAIRS_ADVISORY");
              break;
            case 2183:
              v20 = CFSTR("TAP_CYCLING_STEEP_CLIMB_ADVISORY");
              break;
            case 2184:
              v20 = CFSTR("UNCHECK_AUTO_RECORD_WORKOUT");
              break;
            case 2185:
              v20 = CFSTR("UNCHECK_EBIKE");
              break;
            case 2186:
              v20 = CFSTR("DISPLAY_LICENSE_PLATE_SUGGESTION");
              break;
            case 2187:
              v20 = CFSTR("DISPLAY_LPR_ADVISORY");
              break;
            case 2188:
              v20 = CFSTR("TAP_SHOW_LPR_ADVISORY_DETAILS");
              break;
            case 2189:
              v20 = CFSTR("CREATE_WIDGET");
              break;
            case 2190:
              v20 = CFSTR("REVEAL_WIDGET_TRAY");
              break;
            case 2191:
              v20 = CFSTR("LPR_ERROR_CODE");
              break;
            case 2192:
              v20 = CFSTR("TAP_SEE_ALL_RECENTLY_VIEWED");
              break;
            case 2193:
              v20 = CFSTR("TAP_CLEAR_RECENTLY_VIEWED");
              break;
            case 2194:
              v20 = CFSTR("LPR_HARD_STOP");
              break;
            case 2195:
              v20 = CFSTR("TAP_PUBLISHER_SUBACTION");
              break;
            case 2196:
              v20 = CFSTR("CARPLAY_DISPLAY_ACTIVATED");
              break;
            case 2197:
              v20 = CFSTR("CARPLAY_DISPLAY_DEACTIVATED");
              break;
            case 2198:
              v20 = CFSTR("TAP_FEATURED_COLLECTION");
              break;
            case 2199:
              v20 = CFSTR("SCROLL_FEATURED_COLLECTION_FORWARD");
              break;
            case 2200:
              v20 = CFSTR("SCROLL_FEATURED_COLLECTION_BACKWARD");
              break;
            default:
              switch((int)v15)
              {
                case 3001:
                  v20 = CFSTR("START_NAV");
                  break;
                case 3002:
                  v20 = CFSTR("END_NAV");
                  break;
                case 3003:
                  v20 = CFSTR("OPEN_NAV_AUDIO_SETTINGS");
                  break;
                case 3004:
                  v20 = CFSTR("VIEW_DETAILS");
                  break;
                case 3005:
                  v20 = CFSTR("TAP_SEARCH_ALONG_ROUTE_CATEGORY");
                  break;
                case 3006:
                  v20 = CFSTR("OPEN_ROUTING_EDITOR");
                  break;
                case 3007:
                  v20 = CFSTR("EDIT_ORIGIN");
                  break;
                case 3008:
                  v20 = CFSTR("EDIT_DESTINATION");
                  break;
                case 3009:
                  v20 = CFSTR("SWAP_ORIGIN_DESTINATION");
                  break;
                case 3010:
                  v20 = CFSTR("OPEN_MORE_ROUTES");
                  break;
                case 3011:
                  v20 = CFSTR("SELECT_ROUTING_TYPE_DRIVING");
                  break;
                case 3012:
                  v20 = CFSTR("SELECT_ROUTING_TYPE_WALKING");
                  break;
                case 3013:
                  v20 = CFSTR("SELECT_ROUTING_TYPE_TRANSIT");
                  break;
                case 3014:
                  v20 = CFSTR("SELECT_ROUTING_TYPE_RIDESHARE");
                  break;
                case 3015:
                  v20 = CFSTR("SELECT_ROUTE");
                  break;
                case 3016:
                  v20 = CFSTR("COLLAPSE_STEP_DETAILS_WALK");
                  break;
                case 3017:
                  v20 = CFSTR("EXPAND_STEP_DETAILS_WALK");
                  break;
                case 3018:
                  v20 = CFSTR("COLLAPSE_STEP_DETAILS_TRANSIT");
                  break;
                case 3019:
                  v20 = CFSTR("EXPAND_STEP_DETAILS_TRANSIT");
                  break;
                case 3020:
                  v20 = CFSTR("UNCHECK_BUS");
                  break;
                case 3021:
                  v20 = CFSTR("UNCHECK_SUBWAY_AND_LIGHT_RAIL");
                  break;
                case 3022:
                  v20 = CFSTR("UNCHECK_COMMUTER_RAIL");
                  break;
                case 3023:
                  v20 = CFSTR("UNCHECK_FERRY");
                  break;
                case 3024:
                  v20 = CFSTR("CHECK_BUS");
                  break;
                case 3025:
                  v20 = CFSTR("CHECK_SUBWAY_AND_LIGHT_RAIL");
                  break;
                case 3026:
                  v20 = CFSTR("CHECK_COMMUTER_RAIL");
                  break;
                case 3027:
                  v20 = CFSTR("CHECK_FERRY");
                  break;
                case 3028:
                  v20 = CFSTR("SELECT_LEAVE_AT");
                  break;
                case 3029:
                  v20 = CFSTR("SELECT_ARRIVE_BY");
                  break;
                case 3030:
                  v20 = CFSTR("SELECT_LEAVE_NOW");
                  break;
                case 3031:
                  v20 = CFSTR("SELECT_DATE_TIME");
                  break;
                case 3032:
                  v20 = CFSTR("SWITCH_ON_IC_FARES");
                  break;
                case 3033:
                  v20 = CFSTR("SWITCH_OFF_IC_FARES");
                  break;
                case 3034:
                  v20 = CFSTR("OPEN_ROUTE_OPTIONS_DATETIME");
                  break;
                case 3035:
                  v20 = CFSTR("OPEN_ROUTE_OPTIONS_TRANSIT");
                  break;
                case 3036:
                  v20 = CFSTR("OPEN_ROUTE_OPTIONS_DRIVING");
                  break;
                case 3037:
                  v20 = CFSTR("OPEN_TRANSIT_ROUTE_CLUSTER_SHEET");
                  break;
                case 3038:
                  v20 = CFSTR("REVEAL_FROM_ROUTING");
                  break;
                case 3039:
                  v20 = CFSTR("DISPLAY_ROUTES");
                  break;
                case 3040:
                  v20 = CFSTR("CHECK_RECOMMENDED_ROUTES");
                  break;
                case 3041:
                  v20 = CFSTR("UNCHECK_RECOMMENDED_ROUTES");
                  break;
                case 3042:
                  v20 = CFSTR("CHECK_FASTER_TRIPS");
                  break;
                case 3043:
                  v20 = CFSTR("UNCHECK_FASTER_TRIPS");
                  break;
                case 3044:
                  v20 = CFSTR("CHECK_FEWER_TRANSFERS");
                  break;
                case 3045:
                  v20 = CFSTR("UNCHECK_FEWER_TRANSFERS");
                  break;
                case 3046:
                  v20 = CFSTR("CHECK_LESS_WALKING");
                  break;
                case 3047:
                  v20 = CFSTR("UNCHECK_LESS_WALKING");
                  break;
                case 3048:
                  v20 = CFSTR("OPEN_ROUTE_OPTIONS_CYCLING");
                  break;
                case 3049:
                  v20 = CFSTR("TAP_MORE_ROUTES");
                  break;
                case 3050:
                  v20 = CFSTR("OPEN_NAV_OVERVIEW");
                  break;
                case 3051:
                  v20 = CFSTR("RESUME_NAV_MANEUVER_VIEW");
                  break;
                case 3052:
                  v20 = CFSTR("SELECT_AUDIO_VOLUME_SILENT");
                  break;
                case 3053:
                  v20 = CFSTR("SELECT_AUDIO_VOLUME_LOW");
                  break;
                case 3054:
                  v20 = CFSTR("SELECT_AUDIO_VOLUME_NORMAL");
                  break;
                case 3055:
                  v20 = CFSTR("SELECT_AUDIO_VOLUME_LOUD");
                  break;
                case 3056:
                  v20 = CFSTR("SWITCH_ON_PAUSE_SPOKEN_AUDIO");
                  break;
                case 3057:
                  v20 = CFSTR("SWITCH_OFF_PAUSE_SPOKEN_AUDIO");
                  break;
                case 3058:
                  v20 = CFSTR("RESUME_PREV_NAV");
                  break;
                case 3059:
                  v20 = CFSTR("ACKNOWLEDGE_TRAFFIC_INCIDENT");
                  break;
                case 3060:
                  v20 = CFSTR("ACCEPT_REROUTE");
                  break;
                case 3061:
                  v20 = CFSTR("DISMISS_REROUTE");
                  break;
                case 3062:
                  v20 = CFSTR("ATTEMPT_END_NAV");
                  break;
                case 3063:
                  v20 = CFSTR("DISPLAY_BANNER");
                  break;
                case 3064:
                  v20 = CFSTR("VIEW_BANNER_DETAILS");
                  break;
                case 3065:
                  v20 = CFSTR("ENTER_GUIDANCE");
                  break;
                case 3066:
                  v20 = CFSTR("AUTO_ADVANCE_GUIDANCE");
                  break;
                case 3067:
                  v20 = CFSTR("TAP_OPEN_WALLET");
                  break;
                case 3068:
                  v20 = CFSTR("SELECT_VOICE_GUIDANCE_ALL");
                  break;
                case 3069:
                  v20 = CFSTR("SELECT_VOICE_GUIDANCE_INCIDENTS");
                  break;
                case 3070:
                  v20 = CFSTR("SELECT_VOICE_GUIDANCE_NONE");
                  break;
                case 3071:
                  v20 = CFSTR("DISPLAY_CARD");
                  break;
                case 3072:
                  v20 = CFSTR("RENDER_ROUTE");
                  break;
                case 3073:
                  v20 = CFSTR("DISPLAY_JUNCTION_VIEW");
                  break;
                case 3074:
                  v20 = CFSTR("SELECT_DEPARTURE");
                  break;
                case 3075:
                  v20 = CFSTR("DISPLAY_AR_VIEW_RAISE_BANNER");
                  break;
                case 3076:
                  v20 = CFSTR("DEVICE_RAISE");
                  break;
                case 3077:
                  v20 = CFSTR("ENTER_AR_NAV_VIEW");
                  break;
                case 3078:
                  v20 = CFSTR("EXIT_AR_NAV_VIEW");
                  break;
                case 3079:
                  v20 = CFSTR("AR_CALIBRATION_START");
                  break;
                case 3080:
                  v20 = CFSTR("AR_CALIBRATION_FAILURE");
                  break;
                case 3081:
                  v20 = CFSTR("AR_CALIBRATION_SUCCESS");
                  break;
                case 3082:
                  v20 = CFSTR("DISPLAY_AR_NAV_ARROW");
                  break;
                case 3083:
                  v20 = CFSTR("DISPLAY_AR_NAV_TURN_AROUND");
                  break;
                case 3084:
                  v20 = CFSTR("DISPLAY_GO_OUTSIDE_BANNER");
                  break;
                case 3085:
                  v20 = CFSTR("DISPLAY_AR_DARKNESS_MESSAGE");
                  break;
                case 3086:
                  v20 = CFSTR("DISPLAY_AR_NAV_ENDPOINT");
                  break;
                case 3087:
                  v20 = CFSTR("DISPLAY_ADVISORY_BANNER");
                  break;
                case 3088:
                  v20 = CFSTR("TAP_SHOW_ADVISORY_DETAILS");
                  break;
                default:
                  goto LABEL_47;
              }
              break;
          }
          break;
      }
    }
    v21 = v20;
    if ((int)v14 > 1000)
    {
      if ((int)v14 > 1600)
      {
        switch((int)v14)
        {
          case 1801:
            v22 = CFSTR("MAPS_WEB_PLACE");
            break;
          case 1802:
            v22 = CFSTR("MAPS_WEB_SEARCH");
            break;
          case 1803:
            v22 = CFSTR("MAPS_WEB_SEARCH_RESULTS");
            break;
          case 1804:
            v22 = CFSTR("MAPS_WEB_PUBLISHER");
            break;
          case 1805:
            v22 = CFSTR("MAPS_WEB_GUIDE");
            break;
          case 1806:
            v22 = CFSTR("MAPS_WEB_GUIDES_HOME");
            break;
          case 1807:
            v22 = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
            break;
          case 1808:
            v22 = CFSTR("MAPS_WEB_COLLECTION_LIST");
            break;
          case 1809:
            v22 = CFSTR("MAPS_WEB_DIRECTIONS");
            break;
          case 1810:
            v22 = CFSTR("MAPS_WEB_SIDEBAR");
            break;
          default:
            switch((int)v14)
            {
              case 1700:
                v22 = CFSTR("LOOK_AROUND_PIP");
                break;
              case 1701:
                v22 = CFSTR("LOOK_AROUND_ACTION_SHEET");
                break;
              case 1702:
                v22 = CFSTR("LOOK_AROUND_VIEW");
                break;
              case 1703:
                v22 = CFSTR("LOOK_AROUND_PLATTER");
                break;
              case 1704:
                v22 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
                break;
              case 1705:
                v22 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
                break;
              case 1706:
                v22 = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
                break;
              case 1707:
                v22 = CFSTR("LOOK_AROUND_PIP_PLACECARD");
                break;
              case 1708:
                v22 = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
                break;
              default:
                if ((_DWORD)v14 == 1601)
                {
                  v22 = CFSTR("MENU_ITEM_DARK_MAP");
                }
                else
                {
LABEL_1362:
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
                  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                break;
            }
            break;
        }
      }
      else
      {
        switch((int)v14)
        {
          case 1001:
            v22 = CFSTR("CARPLAY_NAV");
            break;
          case 1002:
            v22 = CFSTR("CARPLAY_EXPLORE");
            break;
          case 1003:
            v22 = CFSTR("CARPLAY_DESTINATIONS");
            break;
          case 1004:
            v22 = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
            break;
          case 1005:
            v22 = CFSTR("CARPLAY_CONTROL");
            break;
          case 1006:
            v22 = CFSTR("CARPLAY_PROACTIVE");
            break;
          case 1007:
            v22 = CFSTR("CARPLAY_ROUTING");
            break;
          case 1008:
            v22 = CFSTR("CARPLAY_MORE_ROUTES");
            break;
          case 1009:
            v22 = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
            break;
          case 1010:
            v22 = CFSTR("CARPLAY_SEARCH");
            break;
          case 1011:
            v22 = CFSTR("CARPLAY_SEARCH_RESULTS");
            break;
          case 1012:
            v22 = CFSTR("CARPLAY_FAVORITES");
            break;
          case 1013:
            v22 = CFSTR("CARPLAY_NAV_CONFIRMATION");
            break;
          case 1014:
            v22 = CFSTR("CARPLAY_DESTINATION_SHARING");
            break;
          case 1015:
            v22 = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
            break;
          case 1016:
            v22 = CFSTR("CARPLAY_NOTIFICATION_DOOM");
            break;
          case 1017:
            v22 = CFSTR("CARPLAY_NOTIFICATION_FUEL");
            break;
          case 1018:
            v22 = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
            break;
          case 1019:
            v22 = CFSTR("CARPLAY_SHARE_ETA_TRAY");
            break;
          case 1020:
            v22 = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
            break;
          case 1021:
            v22 = CFSTR("CARPLAY_ACTION_TRAY");
            break;
          case 1022:
            v22 = CFSTR("CARPLAY_PLACECARD");
            break;
          case 1023:
            v22 = CFSTR("CARPLAY_KEYBOARD");
            break;
          case 1024:
            v22 = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
            break;
          case 1025:
            v22 = CFSTR("CARPLAY_EDIT_STOPS");
            break;
          case 1026:
          case 1027:
          case 1028:
          case 1029:
          case 1030:
          case 1031:
          case 1032:
          case 1033:
          case 1034:
          case 1035:
          case 1036:
          case 1037:
          case 1038:
          case 1039:
          case 1040:
          case 1041:
          case 1042:
          case 1043:
          case 1044:
          case 1045:
          case 1046:
          case 1047:
          case 1048:
          case 1049:
          case 1050:
          case 1051:
          case 1052:
          case 1053:
          case 1054:
          case 1055:
          case 1056:
          case 1057:
          case 1058:
          case 1059:
          case 1060:
          case 1061:
          case 1062:
          case 1063:
          case 1064:
          case 1065:
          case 1066:
          case 1067:
          case 1068:
          case 1069:
          case 1070:
          case 1071:
          case 1072:
          case 1073:
          case 1074:
          case 1075:
          case 1076:
          case 1077:
          case 1078:
          case 1079:
          case 1080:
          case 1081:
          case 1082:
          case 1083:
          case 1084:
          case 1085:
          case 1086:
          case 1087:
          case 1088:
          case 1089:
          case 1090:
          case 1091:
          case 1092:
          case 1093:
          case 1094:
          case 1095:
          case 1096:
          case 1097:
          case 1098:
          case 1099:
          case 1162:
          case 1163:
          case 1164:
          case 1165:
          case 1166:
          case 1167:
          case 1168:
          case 1169:
          case 1170:
          case 1171:
          case 1172:
          case 1173:
          case 1174:
          case 1175:
          case 1176:
          case 1177:
          case 1178:
          case 1179:
          case 1180:
          case 1181:
          case 1182:
          case 1183:
          case 1184:
          case 1185:
          case 1186:
          case 1187:
          case 1188:
          case 1189:
          case 1190:
          case 1191:
          case 1192:
          case 1193:
          case 1194:
          case 1195:
          case 1196:
          case 1197:
          case 1198:
          case 1199:
          case 1200:
          case 1241:
          case 1242:
          case 1243:
          case 1244:
          case 1245:
          case 1246:
          case 1247:
          case 1248:
          case 1249:
          case 1250:
          case 1251:
          case 1252:
          case 1253:
          case 1254:
          case 1255:
          case 1256:
          case 1257:
          case 1258:
          case 1259:
          case 1260:
          case 1261:
          case 1262:
          case 1263:
          case 1264:
          case 1265:
          case 1266:
          case 1267:
          case 1268:
          case 1269:
          case 1270:
          case 1271:
          case 1272:
          case 1273:
          case 1274:
          case 1275:
          case 1276:
          case 1277:
          case 1278:
          case 1279:
          case 1280:
          case 1281:
          case 1282:
          case 1283:
          case 1284:
          case 1285:
          case 1286:
          case 1287:
          case 1288:
          case 1289:
          case 1290:
          case 1291:
          case 1292:
          case 1293:
          case 1294:
          case 1295:
          case 1296:
          case 1297:
          case 1298:
          case 1299:
          case 1300:
            goto LABEL_1362;
          case 1100:
            v22 = CFSTR("RAP_DIRECTIONS_MENU");
            break;
          case 1101:
            v22 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
            break;
          case 1102:
            v22 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
            break;
          case 1103:
            v22 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
            break;
          case 1104:
            v22 = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
            break;
          case 1105:
            v22 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
            break;
          case 1106:
            v22 = CFSTR("RAP_TRANSIT_MENU");
            break;
          case 1107:
            v22 = CFSTR("RAP_STATION_MAP");
            break;
          case 1108:
            v22 = CFSTR("RAP_STATION_MENU");
            break;
          case 1109:
            v22 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
            break;
          case 1110:
            v22 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
            break;
          case 1111:
            v22 = CFSTR("RAP_STATION_CLOSED_FORM");
            break;
          case 1112:
            v22 = CFSTR("RAP_LINE_MAP");
            break;
          case 1113:
            v22 = CFSTR("RAP_LINE_MENU");
            break;
          case 1114:
            v22 = CFSTR("RAP_LINE_NAME_FORM");
            break;
          case 1115:
            v22 = CFSTR("RAP_LINE_SHAPE_FORM");
            break;
          case 1116:
            v22 = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
            break;
          case 1117:
            v22 = CFSTR("RAP_ADD_PLACE_MENU");
            break;
          case 1118:
            v22 = CFSTR("RAP_ADD_POI_MAP");
            break;
          case 1119:
            v22 = CFSTR("RAP_CATEGORY_LIST");
            break;
          case 1120:
            v22 = CFSTR("RAP_POI_DETAILS_FORM");
            break;
          case 1121:
            v22 = CFSTR("RAP_ADD_STREET_MAP");
            break;
          case 1122:
            v22 = CFSTR("RAP_STREET_DETAILS_FORM");
            break;
          case 1123:
            v22 = CFSTR("RAP_ADD_OTHER_MAP");
            break;
          case 1124:
            v22 = CFSTR("RAP_OTHER_DETAILS_FORM");
            break;
          case 1125:
            v22 = CFSTR("RAP_CAMERA");
            break;
          case 1126:
            v22 = CFSTR("RAP_LABEL_MAP");
            break;
          case 1127:
            v22 = CFSTR("RAP_LABEL_DETAILS_FORM");
            break;
          case 1128:
            v22 = CFSTR("RAP_SEARCH_MENU");
            break;
          case 1129:
            v22 = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
            break;
          case 1130:
            v22 = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
            break;
          case 1131:
            v22 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
            break;
          case 1132:
            v22 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
            break;
          case 1133:
            v22 = CFSTR("RAP_SATELLITE_IMAGE_MAP");
            break;
          case 1134:
            v22 = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
            break;
          case 1135:
            v22 = CFSTR("RAP_OTHER_FORM");
            break;
          case 1136:
            v22 = CFSTR("RAP_PRIVACY");
            break;
          case 1137:
            v22 = CFSTR("RAP_CONFIRMATION");
            break;
          case 1138:
            v22 = CFSTR("RAP_POI_MENU");
            break;
          case 1139:
            v22 = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
            break;
          case 1140:
            v22 = CFSTR("RAP_ADD_A_PLACE_MAP");
            break;
          case 1141:
            v22 = CFSTR("RAP_POI_LOCATION_MAP");
            break;
          case 1142:
            v22 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
            break;
          case 1143:
            v22 = CFSTR("RAP_POI_CLOSED_FORM");
            break;
          case 1144:
            v22 = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
            break;
          case 1145:
            v22 = CFSTR("RAP_BRAND_MENU");
            break;
          case 1146:
            v22 = CFSTR("RAP_BRAND_DETAILS_FORM");
            break;
          case 1147:
            v22 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
            break;
          case 1148:
            v22 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
            break;
          case 1149:
            v22 = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
            break;
          case 1150:
            v22 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
            break;
          case 1151:
            v22 = CFSTR("RAP_LOOK_AROUND_MENU");
            break;
          case 1152:
            v22 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
            break;
          case 1153:
            v22 = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
            break;
          case 1154:
            v22 = CFSTR("RAP_LIGHTWEIGHT");
            break;
          case 1155:
            v22 = CFSTR("RAP_EDIT_PLACE_DETAILS");
            break;
          case 1156:
            v22 = CFSTR("RAP_ADD_CATEGORY");
            break;
          case 1157:
            v22 = CFSTR("RAP_ADD_HOURS");
            break;
          case 1158:
            v22 = CFSTR("RAP_EDIT_LOCATION");
            break;
          case 1159:
            v22 = CFSTR("RAP_EDIT_ENTRY_POINT");
            break;
          case 1160:
            v22 = CFSTR("RAP_LOOK_AROUND");
            break;
          case 1161:
            v22 = CFSTR("RAP_ADD_ENTRY_POINT");
            break;
          case 1201:
            v22 = CFSTR("WATCH_MAIN_MENU");
            break;
          case 1202:
            v22 = CFSTR("WATCH_MAIN_PRESS_MENU");
            break;
          case 1203:
            v22 = CFSTR("WATCH_SEARCH");
            break;
          case 1204:
            v22 = CFSTR("WATCH_DICTATION");
            break;
          case 1205:
            v22 = CFSTR("WATCH_FAVORITES");
            break;
          case 1206:
            v22 = CFSTR("WATCH_SUB_CATEGORY_LIST");
            break;
          case 1207:
            v22 = CFSTR("WATCH_SEARCH_RESULTS_LIST");
            break;
          case 1208:
            v22 = CFSTR("WATCH_MAP_VIEW");
            break;
          case 1209:
            v22 = CFSTR("WATCH_PLACECARD");
            break;
          case 1210:
            v22 = CFSTR("WATCH_ROUTE_PLANNING");
            break;
          case 1211:
            v22 = CFSTR("WATCH_ROUTE_DETAILS");
            break;
          case 1212:
            v22 = CFSTR("WATCH_NAV_TBT");
            break;
          case 1213:
            v22 = CFSTR("WATCH_NAV_MAP");
            break;
          case 1214:
            v22 = CFSTR("WATCH_NAV_PRESS_MENU");
            break;
          case 1215:
            v22 = CFSTR("WATCH_MAP_PRESS_MENU");
            break;
          case 1216:
            v22 = CFSTR("WATCH_ROUTING_PRESS_MENU");
            break;
          case 1217:
            v22 = CFSTR("WATCH_TRANSIT_MAP_VIEW");
            break;
          case 1218:
            v22 = CFSTR("WATCH_SCRIBBLE");
            break;
          case 1219:
            v22 = CFSTR("WATCH_COLLECTION_VIEW");
            break;
          case 1220:
            v22 = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
            break;
          case 1221:
            v22 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
            break;
          case 1222:
            v22 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
            break;
          case 1223:
            v22 = CFSTR("WATCH_PAIRED_DEVICE");
            break;
          case 1224:
            v22 = CFSTR("WATCH_NAV_DRIVING_SPLIT");
            break;
          case 1225:
            v22 = CFSTR("WATCH_NAV_DRIVING_PLATTER");
            break;
          case 1226:
            v22 = CFSTR("WATCH_NAV_DRIVING_MAP");
            break;
          case 1227:
            v22 = CFSTR("WATCH_NAV_WALKING_SPLIT");
            break;
          case 1228:
            v22 = CFSTR("WATCH_NAV_WALKING_PLATTER");
            break;
          case 1229:
            v22 = CFSTR("WATCH_NAV_WALKING_MAP");
            break;
          case 1230:
            v22 = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
            break;
          case 1231:
            v22 = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
            break;
          case 1232:
            v22 = CFSTR("WATCH_NAV_TRANSIT_MAP");
            break;
          case 1233:
            v22 = CFSTR("WATCH_ROUTE_INFO");
            break;
          case 1234:
            v22 = CFSTR("WATCH_NAV_CYCLING_MAP");
            break;
          case 1235:
            v22 = CFSTR("WATCH_NAV_CYCLING_PLATTER");
            break;
          case 1236:
            v22 = CFSTR("WATCH_NAV_CYCLING_SPLIT");
            break;
          case 1237:
            v22 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
            break;
          case 1238:
            v22 = CFSTR("WATCH_SEARCH_INPUT");
            break;
          case 1239:
            v22 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
            break;
          case 1240:
            v22 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
            break;
          case 1301:
            v22 = CFSTR("PERSONALIZED_ADDRESS_LIST");
            break;
          case 1302:
            v22 = CFSTR("PERSONALIZED_ADDRESS_FORM");
            break;
          case 1303:
            v22 = CFSTR("PERSONALIZED_LABEL_FORM");
            break;
          case 1304:
            v22 = CFSTR("PERSONALIZED_EDIT_MAP");
            break;
          case 1305:
            v22 = CFSTR("PERSONALIZED_CONFIRMATION");
            break;
          case 1306:
            v22 = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
            break;
          case 1307:
            v22 = CFSTR("PERSONALIZED_ADDRESS_INFO");
            break;
          case 1308:
            v22 = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
            break;
          case 1309:
            v22 = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
            break;
          case 1310:
            v22 = CFSTR("FAVORITE_SEARCH");
            break;
          case 1311:
            v22 = CFSTR("FAVORITE_LIST");
            break;
          case 1312:
            v22 = CFSTR("FAVORITE_INFO");
            break;
          case 1313:
            v22 = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
            break;
          default:
            switch((int)v14)
            {
              case 1401:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
                break;
              case 1402:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
                break;
              case 1403:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
                break;
              case 1404:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
                break;
              case 1405:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
                break;
              case 1406:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
                break;
              case 1407:
                v22 = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
                break;
              default:
                switch((int)v14)
                {
                  case 1501:
                    v22 = CFSTR("PLACECARD_HEADER");
                    break;
                  case 1502:
                    v22 = CFSTR("PLACECARD_ADDRESS");
                    break;
                  case 1503:
                    v22 = CFSTR("PLACECARD_PHONE");
                    break;
                  case 1504:
                    v22 = CFSTR("PLACECARD_URL");
                    break;
                  default:
                    goto LABEL_1362;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v22 = CFSTR("UI_TARGET_UNKNOWN");
      switch((int)v14)
      {
        case 0:
          break;
        case 1:
          v22 = CFSTR("UI_TARGET_POI");
          break;
        case 2:
          v22 = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
          break;
        case 3:
          v22 = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
          break;
        case 4:
          v22 = CFSTR("UI_TARGET_CALLOUT");
          break;
        case 5:
          v22 = CFSTR("UI_TARGET_SEARCH_PIN");
          break;
        case 6:
          v22 = CFSTR("UI_TARGET_DROPPED_PIN");
          break;
        case 7:
          v22 = CFSTR("UI_TARGET_TRANSIT_LINE");
          break;
        case 8:
          v22 = CFSTR("SEARCH_TRAY");
          break;
        case 9:
          v22 = CFSTR("SEARCH_TRAY_BROWSE");
          break;
        case 10:
          v22 = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
          break;
        case 11:
          v22 = CFSTR("SEARCH_TRAY_AC");
          break;
        case 12:
          v22 = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
          break;
        case 13:
          v22 = CFSTR("SEARCH_TRAY_NO_QUERY");
          break;
        case 14:
          v22 = CFSTR("AR_WALKING_LEGAL_TRAY");
          break;
        case 15:
          v22 = CFSTR("RAISE_TO_START_AR_TRAY");
          break;
        case 16:
          v22 = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
          break;
        case 17:
          v22 = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
          break;
        case 18:
          v22 = CFSTR("HIGHLIGHTED_AREA");
          break;
        case 19:
          v22 = CFSTR("CURATED_COLLECTIONS_HOME");
          break;
        case 20:
          v22 = CFSTR("TRAVEL_PREFERENCES_TRAY");
          break;
        case 21:
          v22 = CFSTR("RESULT_TRAY_SEARCH");
          break;
        case 22:
          v22 = CFSTR("SINGLE_CARD_FILTER");
          break;
        case 23:
          v22 = CFSTR("FULL_CARD_FILTER");
          break;
        case 24:
          v22 = CFSTR("ACCOUNT_PRIVACY_TRAY");
          break;
        case 25:
          v22 = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
          break;
        case 26:
          v22 = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
          break;
        case 27:
          v22 = CFSTR("CITY_MENU");
          break;
        case 28:
          v22 = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
          break;
        case 29:
          v22 = CFSTR("ACCOUNT_TRAY");
          break;
        case 30:
          v22 = CFSTR("QUICK_ACTION_TRAY");
          break;
        case 31:
          v22 = CFSTR("SUBMIT_TRIP_FEEDBACK");
          break;
        case 32:
          v22 = CFSTR("RAP_PLACE_ISSUE_DETAILS");
          break;
        case 33:
          v22 = CFSTR("RAP_GUIDES_DETAILS");
          break;
        case 34:
          v22 = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
          break;
        case 35:
          v22 = CFSTR("RAP_ADD_MAP_DETAILS");
          break;
        case 36:
          v22 = CFSTR("WATCH_COMPLICATION");
          break;
        case 37:
          v22 = CFSTR("RAP_NAV_MENU");
          break;
        case 38:
          v22 = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
          break;
        case 39:
          v22 = CFSTR("RAP_REPORT_MENU");
          break;
        case 40:
          v22 = CFSTR("RAP_CURATED_COLLECTION_MENU");
          break;
        case 41:
          v22 = CFSTR("RAP_REPORT_CARD_DETAILS");
          break;
        case 42:
          v22 = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
          break;
        case 43:
          v22 = CFSTR("RAP_STREET_ISSUE_DETAILS");
          break;
        case 44:
          v22 = CFSTR("NEARBY_TRANSIT_CARD");
          break;
        case 45:
          v22 = CFSTR("WATCH_NAV_MENU");
          break;
        case 46:
          v22 = CFSTR("GENERIC_ADVISORY_PAGE");
          break;
        case 47:
          v22 = CFSTR("USER_PROFILE_TRAY");
          break;
        case 48:
          v22 = CFSTR("MEDIA_APP_MENU");
          break;
        case 49:
          v22 = CFSTR("TEMPLATE_PLACE_TRAY");
          break;
        case 50:
          v22 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
          break;
        case 51:
          v22 = CFSTR("ALLOW_NOTIFICATION_DIALOG");
          break;
        case 52:
          v22 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
          break;
        case 53:
          v22 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
          break;
        case 54:
          v22 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
          break;
        case 55:
          v22 = CFSTR("NOTIFICATION_CONSENT_PROMPT");
          break;
        case 56:
          v22 = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
          break;
        case 57:
          v22 = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
          break;
        case 58:
          v22 = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
          break;
        case 59:
          v22 = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
          break;
        case 60:
          v22 = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
          break;
        case 61:
          v22 = CFSTR("PLACECARD_SHOWCASE_MENU");
          break;
        case 62:
          v22 = CFSTR("RAP_INLINE_ADD_DETAILS");
          break;
        case 63:
          v22 = CFSTR("RAP_EDIT_MENU_DETAILS");
          break;
        case 64:
          v22 = CFSTR("RAP_SUBMISSION_PROMPT");
          break;
        case 65:
          v22 = CFSTR("RAP_PLACECARD_EDIT_MENU");
          break;
        case 66:
          v22 = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
          break;
        case 67:
          v22 = CFSTR("INCIDENT_REPORT_MENU");
          break;
        case 68:
          v22 = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
          break;
        case 69:
          v22 = CFSTR("RAP_SELECT_BAD_ROUTES");
          break;
        case 70:
          v22 = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
          break;
        case 71:
          v22 = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
          break;
        case 72:
          v22 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
          break;
        case 73:
          v22 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
          break;
        case 74:
          v22 = CFSTR("NOTIFICATION_ARP");
          break;
        case 75:
          v22 = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
          break;
        case 76:
          v22 = CFSTR("YOUR_PHOTOS_ALBUM");
          break;
        case 77:
          v22 = CFSTR("ARP_PHOTO_CREDIT");
          break;
        case 78:
          v22 = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
          break;
        case 79:
          v22 = CFSTR("RAP_REPORT_MENU_MORE");
          break;
        case 80:
          v22 = CFSTR("WATCH_MAPS_SETTINGS");
          break;
        case 81:
          v22 = CFSTR("OFFLINE_FEATURE_PROMPT");
          break;
        case 82:
          v22 = CFSTR("EXPIRED_MAPS_DETAILS");
          break;
        case 83:
          v22 = CFSTR("MAPS_VIEW");
          break;
        case 84:
          v22 = CFSTR("NOTIFICATION_OFFLINE");
          break;
        case 85:
          v22 = CFSTR("EXPIRED_MAPS_MANAGEMENT");
          break;
        case 86:
          v22 = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
          break;
        case 87:
          v22 = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
          break;
        case 88:
          v22 = CFSTR("OFFLINE_MAPS_MANAGEMENT");
          break;
        case 89:
          v22 = CFSTR("REGION_SELECTOR");
          break;
        case 90:
          v22 = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
          break;
        case 91:
          v22 = CFSTR("FIND_MY_ETA_SHARING_TRAY");
          break;
        case 92:
          v22 = CFSTR("WATCH_PLACE");
          break;
        case 93:
          v22 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
          break;
        case 94:
          v22 = CFSTR("WATCH_ROUTE_PLANNING_MAP");
          break;
        case 95:
          v22 = CFSTR("WATCH_NAV_WALKING_CONTROLS");
          break;
        case 96:
          v22 = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
          break;
        case 97:
          v22 = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
          break;
        case 98:
          v22 = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
          break;
        case 99:
          v22 = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
          break;
        case 100:
          v22 = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
          break;
        case 101:
          v22 = CFSTR("RESULTS_TRAY_SEARCH");
          break;
        case 102:
          v22 = CFSTR("RESULTS_TRAY_BROWSE");
          break;
        case 103:
          v22 = CFSTR("RESULTS_TRAY_FAVORITES");
          break;
        case 104:
          v22 = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
          break;
        case 105:
          v22 = CFSTR("RESULTS_TRAY_CLUSTER");
          break;
        case 106:
          v22 = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
          break;
        case 107:
          v22 = CFSTR("WATCH_MAP_RESULTS");
          break;
        case 108:
          v22 = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
          break;
        case 109:
          v22 = CFSTR("WATCH_PLACES");
          break;
        case 110:
          v22 = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
          break;
        case 111:
          v22 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
          break;
        case 112:
          v22 = CFSTR("DOWNLOADED_MAPS_DETAILS");
          break;
        case 113:
          v22 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
          break;
        case 114:
          v22 = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
          break;
        case 115:
          v22 = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
          break;
        case 116:
          v22 = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
          break;
        case 117:
          v22 = CFSTR("WATCH_ROUTE_OPTIONS");
          break;
        case 118:
          v22 = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
          break;
        case 119:
          v22 = CFSTR("WATCH_MORE_GUIDES");
          break;
        case 120:
          v22 = CFSTR("WATCH_RECENTLY_VIEWED");
          break;
        case 121:
          v22 = CFSTR("EV_SUCCESS_TRAY");
          break;
        case 122:
          v22 = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
          break;
        case 123:
          v22 = CFSTR("PREFERRED_NETWORK_TRAY");
          break;
        case 124:
          v22 = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
          break;
        case 125:
          v22 = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
          break;
        case 126:
          v22 = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
          break;
        case 127:
          v22 = CFSTR("AC_KEYBOARD_TRAY");
          break;
        case 128:
          v22 = CFSTR("MORE_RELATED_TRAILS");
          break;
        case 129:
          v22 = CFSTR("MORE_RELATED_TRAILHEADS");
          break;
        case 130:
          v22 = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
          break;
        case 131:
          v22 = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
          break;
        case 132:
          v22 = CFSTR("ROUTING_TRAY_CURATED_HIKE");
          break;
        case 133:
          v22 = CFSTR("MORE_CURATED_HIKES");
          break;
        case 134:
          v22 = CFSTR("CUSTOM_ROUTE_ONBOARDING");
          break;
        case 135:
          v22 = CFSTR("LIBRARY_ROUTES");
          break;
        case 136:
          v22 = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
          break;
        case 137:
          v22 = CFSTR("MY_LIBRARY");
          break;
        case 138:
          v22 = CFSTR("EDIT_NOTE_TRAY");
          break;
        case 139:
          v22 = CFSTR("CREATE_NOTE_TRAY");
          break;
        case 140:
          v22 = CFSTR("LIBRARY_PLACES");
          break;
        case 141:
          v22 = CFSTR("WATCH_ACCOUNT");
          break;
        case 142:
          v22 = CFSTR("WATCH_DOWNLOADED_MAPS");
          break;
        case 143:
        case 144:
        case 145:
        case 146:
        case 147:
        case 148:
        case 149:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 180:
        case 181:
        case 182:
        case 183:
        case 184:
        case 185:
        case 186:
        case 187:
        case 188:
        case 189:
        case 190:
        case 191:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 238:
        case 239:
        case 240:
        case 241:
        case 242:
        case 243:
        case 244:
        case 245:
        case 246:
        case 247:
        case 248:
        case 249:
        case 269:
        case 270:
        case 271:
        case 272:
        case 273:
        case 274:
        case 275:
        case 276:
        case 277:
        case 278:
        case 279:
        case 280:
        case 281:
        case 282:
        case 283:
        case 284:
        case 285:
        case 286:
        case 287:
        case 288:
        case 289:
        case 290:
        case 291:
        case 292:
        case 293:
        case 294:
        case 295:
        case 296:
        case 297:
        case 298:
        case 299:
        case 300:
        case 307:
        case 308:
        case 309:
        case 310:
        case 311:
        case 312:
        case 313:
        case 314:
        case 315:
        case 316:
        case 317:
        case 318:
        case 319:
        case 320:
        case 321:
        case 322:
        case 323:
        case 324:
        case 325:
        case 326:
        case 327:
        case 328:
        case 329:
        case 330:
        case 331:
        case 332:
        case 333:
        case 334:
        case 335:
        case 336:
        case 337:
        case 338:
        case 339:
        case 340:
        case 341:
        case 342:
        case 343:
        case 344:
        case 345:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 356:
        case 357:
        case 358:
        case 359:
        case 360:
        case 361:
        case 362:
        case 363:
        case 364:
        case 365:
        case 366:
        case 367:
        case 368:
        case 369:
        case 370:
        case 371:
        case 372:
        case 373:
        case 374:
        case 375:
        case 376:
        case 377:
        case 378:
        case 379:
        case 380:
        case 381:
        case 382:
        case 383:
        case 384:
        case 385:
        case 386:
        case 387:
        case 388:
        case 389:
        case 390:
        case 391:
        case 392:
        case 393:
        case 394:
        case 395:
        case 396:
        case 397:
        case 398:
        case 399:
        case 400:
        case 405:
        case 406:
        case 407:
        case 408:
        case 409:
        case 410:
        case 411:
        case 412:
        case 413:
        case 414:
        case 415:
        case 416:
        case 417:
        case 418:
        case 419:
        case 420:
        case 421:
        case 422:
        case 423:
        case 424:
        case 425:
        case 426:
        case 427:
        case 428:
        case 429:
        case 430:
        case 431:
        case 432:
        case 433:
        case 434:
        case 435:
        case 436:
        case 437:
        case 438:
        case 439:
        case 440:
        case 441:
        case 442:
        case 443:
        case 444:
        case 445:
        case 446:
        case 447:
        case 448:
        case 449:
        case 450:
        case 451:
        case 452:
        case 453:
        case 454:
        case 455:
        case 456:
        case 457:
        case 458:
        case 459:
        case 460:
        case 461:
        case 462:
        case 463:
        case 464:
        case 465:
        case 466:
        case 467:
        case 468:
        case 469:
        case 470:
        case 471:
        case 472:
        case 473:
        case 474:
        case 475:
        case 476:
        case 477:
        case 478:
        case 479:
        case 480:
        case 481:
        case 482:
        case 483:
        case 484:
        case 485:
        case 486:
        case 487:
        case 488:
        case 489:
        case 490:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 700:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
          goto LABEL_1362;
        case 201:
          v22 = CFSTR("PLACECARD_TRAY");
          break;
        case 202:
          v22 = CFSTR("WEB_MODULE");
          break;
        case 250:
          v22 = CFSTR("ADD_FAVORITE_TRAY");
          break;
        case 251:
          v22 = CFSTR("COLLECTION_LIST");
          break;
        case 252:
          v22 = CFSTR("COLLECTION_VIEW");
          break;
        case 253:
          v22 = CFSTR("FAVORITE_DETAILS");
          break;
        case 254:
          v22 = CFSTR("FAVORITES_TRAY");
          break;
        case 255:
          v22 = CFSTR("SHARED_COLLECTION");
          break;
        case 256:
          v22 = CFSTR("SHARED_COLLECTION_VIEW");
          break;
        case 257:
          v22 = CFSTR("RECENTLY_VIEWED");
          break;
        case 258:
          v22 = CFSTR("SHARED_WEB_COLLECTION");
          break;
        case 259:
          v22 = CFSTR("CURATED_COLLECTION_VIEW");
          break;
        case 260:
          v22 = CFSTR("FEATURED_COLLECTIONS");
          break;
        case 261:
          v22 = CFSTR("PUBLISHER_TRAY");
          break;
        case 262:
          v22 = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
          break;
        case 263:
          v22 = CFSTR("CURATED_COLLECTION_NOTIFICATION");
          break;
        case 264:
          v22 = CFSTR("CURATED_COLLECTION_LIST");
          break;
        case 265:
          v22 = CFSTR("PUBLISHER_LIST");
          break;
        case 266:
          v22 = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
          break;
        case 267:
          v22 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
          break;
        case 268:
          v22 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
          break;
        case 301:
          v22 = CFSTR("ROUTING_TRAY_DRIVING");
          break;
        case 302:
          v22 = CFSTR("ROUTING_TRAY_WALKING");
          break;
        case 303:
          v22 = CFSTR("ROUTING_TRAY_TRANSIT");
          break;
        case 304:
          v22 = CFSTR("ROUTING_TRAY_RIDESHARE");
          break;
        case 305:
          v22 = CFSTR("ROUTING_TRAY_CYCLING");
          break;
        case 306:
          v22 = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
          break;
        case 401:
          v22 = CFSTR("NAV_TRAY_DRIVING");
          break;
        case 402:
          v22 = CFSTR("NAV_TRAY_WALKING");
          break;
        case 403:
          v22 = CFSTR("NAV_TRAY_TRANSIT");
          break;
        case 404:
          v22 = CFSTR("NAV_TRAY_CYCLING");
          break;
        case 501:
          v22 = CFSTR("MAP_PLACECARD");
          break;
        case 502:
          v22 = CFSTR("MAP_SEARCH");
          break;
        case 503:
          v22 = CFSTR("MAP_RESULTS");
          break;
        case 504:
          v22 = CFSTR("MAP_ROUTING");
          break;
        case 505:
          v22 = CFSTR("MAP_NAV");
          break;
        case 506:
          v22 = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
          break;
        case 507:
          v22 = CFSTR("MAP_TRAFFIC_INCIDENT");
          break;
        case 508:
          v22 = CFSTR("MAP_FULL_SCREEN");
          break;
        case 509:
          v22 = CFSTR("MAP_DRIVE");
          break;
        case 510:
          v22 = CFSTR("MAP_LAUNCH_AND_GO");
          break;
        case 511:
          v22 = CFSTR("MAP_VIEW");
          break;
        case 601:
          v22 = CFSTR("MAPS_SETTINGS");
          break;
        case 602:
          v22 = CFSTR("MAPS_PREFERENCES");
          break;
        case 603:
          v22 = CFSTR("RAP");
          break;
        case 604:
          v22 = CFSTR("ROUTING_DRIVING_DETAILS");
          break;
        case 605:
          v22 = CFSTR("ROUTING_WALKING_DETAILS");
          break;
        case 606:
          v22 = CFSTR("ROUTING_TRANSIT_DETAILS");
          break;
        case 607:
          v22 = CFSTR("ROUTING_EDITOR");
          break;
        case 608:
          v22 = CFSTR("NAV_DRIVING_DETAILS");
          break;
        case 609:
          v22 = CFSTR("NAV_WALKING_DETAILS");
          break;
        case 610:
          v22 = CFSTR("NAV_TRANSIT_DETAILS");
          break;
        case 611:
          v22 = CFSTR("NAV_AUDIO_SETTINGS");
          break;
        case 612:
          v22 = CFSTR("PHOTO_VIEWER_ALL");
          break;
        case 613:
          v22 = CFSTR("PHOTO_VIEWER_SINGLE");
          break;
        case 614:
          v22 = CFSTR("ROUTE_OPTIONS_TRANSIT");
          break;
        case 615:
          v22 = CFSTR("TRAFFIC_INCIDENT_TRAY");
          break;
        case 616:
          v22 = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
          break;
        case 617:
          v22 = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
          break;
        case 618:
          v22 = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
          break;
        case 619:
          v22 = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
          break;
        case 620:
          v22 = CFSTR("ADD_PHOTO_SHEET");
          break;
        case 621:
          v22 = CFSTR("ADD_PLACE_SHEET");
          break;
        case 622:
          v22 = CFSTR("SHARE_SHEET");
          break;
        case 623:
          v22 = CFSTR("EDIT_LOCATION_SHEET");
          break;
        case 624:
          v22 = CFSTR("ADD_CONTACT_SHEET");
          break;
        case 625:
          v22 = CFSTR("EDIT_NAME_SHEET");
          break;
        case 626:
          v22 = CFSTR("DRIVING_NAV_SETTINGS");
          break;
        case 627:
          v22 = CFSTR("TRANSIT_SETTINGS");
          break;
        case 628:
          v22 = CFSTR("TRANSIT_ADVISORY_SHEET");
          break;
        case 629:
          v22 = CFSTR("REMOVE_CAR_SHEET");
          break;
        case 630:
          v22 = CFSTR("ROUTE_OPTIONS_DRIVING");
          break;
        case 631:
          v22 = CFSTR("ROUTE_OPTIONS_DATETIME");
          break;
        case 632:
          v22 = CFSTR("TRANSIT_ADVISORY_BANNER");
          break;
        case 633:
          v22 = CFSTR("BOOK_TABLE_SELECT_TIME");
          break;
        case 634:
          v22 = CFSTR("BOOK_TABLE_MORE_OPTIONS");
          break;
        case 635:
          v22 = CFSTR("BOOK_TABLE_READY");
          break;
        case 636:
          v22 = CFSTR("BOOK_TABLE_BOOKED");
          break;
        case 637:
          v22 = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
          break;
        case 638:
          v22 = CFSTR("TRANSIT_LINE_LIST_SHEET");
          break;
        case 639:
          v22 = CFSTR("TRANSIT_BALANCE_BANNER");
          break;
        case 640:
          v22 = CFSTR("WEATHER_ICON");
          break;
        case 641:
          v22 = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
          break;
        case 642:
          v22 = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
          break;
        case 643:
          v22 = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
          break;
        case 644:
          v22 = CFSTR("FLOOR_PICKER");
          break;
        case 645:
          v22 = CFSTR("VENUE_LIST");
          break;
        case 646:
          v22 = CFSTR("AR_MODE");
          break;
        case 647:
          v22 = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
          break;
        case 648:
          v22 = CFSTR("LINKED_SERVICE_HOURS");
          break;
        case 649:
          v22 = CFSTR("SHARE_ETA_TRAY");
          break;
        case 650:
          v22 = CFSTR("ETA_UPDATE_TRAY");
          break;
        case 651:
          v22 = CFSTR("SCHEDULECARD_TRAY");
          break;
        case 652:
          v22 = CFSTR("AR_NAV");
          break;
        case 653:
          v22 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
          break;
        case 654:
          v22 = CFSTR("LOCATIONS_INSIDE");
          break;
        case 655:
          v22 = CFSTR("SIMILAR_LOCATIONS");
          break;
        case 656:
          v22 = CFSTR("LOCATIONS_AT_ADDRESS");
          break;
        case 657:
          v22 = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
          break;
        case 658:
          v22 = CFSTR("ROUTE_OPTIONS_CYCLING");
          break;
        case 659:
          v22 = CFSTR("EV_CONNECTION_TRAY");
          break;
        case 660:
          v22 = CFSTR("VIRTUAL_GARAGE");
          break;
        case 661:
          v22 = CFSTR("VIRTUAL_GARAGE_BANNER");
          break;
        case 662:
          v22 = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
          break;
        case 663:
          v22 = CFSTR("ADVISORY_DETAILS_PAGE");
          break;
        case 664:
          v22 = CFSTR("APP_CLIP_NOTIFICATION");
          break;
        case 665:
          v22 = CFSTR("PHOTO_VIEWER_GALLERY");
          break;
        case 666:
          v22 = CFSTR("RECOMMENDATION_CARD");
          break;
        case 667:
          v22 = CFSTR("INCIDENT_REPORT_TRAY");
          break;
        case 668:
          v22 = CFSTR("MAPS_WIDGET_DISPLAY");
          break;
        case 669:
          v22 = CFSTR("VISUAL_LOCATION_FRAMEWORK");
          break;
        case 670:
          v22 = CFSTR("APP_CLIP_TRAY");
          break;
        case 671:
          v22 = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
          break;
        case 672:
          v22 = CFSTR("NOTIFICATION_ADD_PLATE");
          break;
        case 673:
          v22 = CFSTR("MAPS_RESULTS");
          break;
        case 674:
          v22 = CFSTR("MAPS_WIDGET_APP_CONNECTION");
          break;
        case 675:
          v22 = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
          break;
        case 676:
          v22 = CFSTR("MAPS_WIDGET_CURRENT_NAV");
          break;
        case 677:
          v22 = CFSTR("MAPS_WIDGET_ETA");
          break;
        case 678:
          v22 = CFSTR("MAPS_WIDGET_TRANSIT");
          break;
        case 679:
          v22 = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
          break;
        case 680:
          v22 = CFSTR("WIDGET_CREATION_TRAY");
          break;
        case 681:
          v22 = CFSTR("MAPS_WIDGET_HOME");
          break;
        case 682:
          v22 = CFSTR("MAPS_WIDGET_PARKED_CAR");
          break;
        case 683:
          v22 = CFSTR("MAPS_WIDGET_POI");
          break;
        case 684:
          v22 = CFSTR("MAPS_WIDGET_SCHOOL");
          break;
        case 685:
          v22 = CFSTR("MAPS_WIDGET_WORK");
          break;
        case 686:
          v22 = CFSTR("AIRPORT_NOTIFICATION");
          break;
        case 687:
          v22 = CFSTR("MAPS_WIDGET_EMPTY");
          break;
        case 688:
          v22 = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
          break;
        case 689:
          v22 = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
          break;
        case 690:
          v22 = CFSTR("SHARE_MY_LOCATION");
          break;
        case 691:
          v22 = CFSTR("MARK_MY_LOCATION");
          break;
        case 692:
          v22 = CFSTR("AIRPORT_NOTIFICATION_WATCH");
          break;
        case 693:
          v22 = CFSTR("EDIT_FAVORITE");
          break;
        case 694:
          v22 = CFSTR("ROUTING_CYCLING_DETAILS");
          break;
        case 695:
          v22 = CFSTR("NAV_CYCLING_DETAILS");
          break;
        case 696:
          v22 = CFSTR("MAPS_SUGGESTION_WIDGET");
          break;
        case 697:
          v22 = CFSTR("ARP_TIPKIT");
          break;
        case 698:
          v22 = CFSTR("ARP_PRIVACY");
          break;
        case 699:
          v22 = CFSTR("ROUTE_OPTIONS_WALKING");
          break;
        case 701:
          v22 = CFSTR("SAFARI_SEARCH");
          break;
        case 702:
          v22 = CFSTR("SPOTLIGHT_SEARCH");
          break;
        case 703:
          v22 = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
          break;
        case 704:
          v22 = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
          break;
        case 705:
          v22 = CFSTR("WIDGET_MAPS_DESTINATIONS");
          break;
        case 706:
          v22 = CFSTR("WIDGET_MAPS_TRANSIT");
          break;
        case 707:
          v22 = CFSTR("WIDGET_MAPS_NEARBY");
          break;
        case 708:
          v22 = CFSTR("NOTIFICATION_FIND_MY_CAR");
          break;
        case 709:
          v22 = CFSTR("CONTROL_CENTER");
          break;
        case 710:
          v22 = CFSTR("NOTIFICATION_CENTER");
          break;
        case 711:
          v22 = CFSTR("NOTIFICATION_DOOM");
          break;
        case 712:
          v22 = CFSTR("NOTIFICATION_VENUES");
          break;
        case 713:
          v22 = CFSTR("NOTIFICATION_RAP_UPDATE");
          break;
        case 714:
          v22 = CFSTR("NOTIFICATION_TRIP_CANCELLED");
          break;
        case 715:
          v22 = CFSTR("NOTIFICATION_STOP_SKIPPED");
          break;
        case 716:
          v22 = CFSTR("NOTIFICATION_TRIP_DELAYED");
          break;
        case 717:
          v22 = CFSTR("NOTIFICATION_RAP");
          break;
        case 718:
          v22 = CFSTR("NOTIFICATION_PROXY_AUTH");
          break;
        case 719:
          v22 = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
          break;
        case 720:
          v22 = CFSTR("NOTIFICATION_LOW_FUEL");
          break;
        case 721:
          v22 = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
          break;
        case 722:
          v22 = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
          break;
        case 723:
          v22 = CFSTR("NOTIFICATION_SHARED_ETA");
          break;
        case 724:
          v22 = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
          break;
        case 725:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
          break;
        case 726:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
          break;
        case 727:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
          break;
        case 728:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
          break;
        case 729:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
          break;
        case 730:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
          break;
        case 731:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
          break;
        case 732:
          v22 = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
          break;
        case 733:
          v22 = CFSTR("APP_SHEET");
          break;
        case 734:
          v22 = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
          break;
        case 735:
          v22 = CFSTR("SHARE_ETA_CONTACT_TRAY");
          break;
        case 736:
          v22 = CFSTR("SIRI_SHARE_ETA");
          break;
        case 737:
          v22 = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
          break;
        case 738:
          v22 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
          break;
        case 739:
          v22 = CFSTR("INCIDENT_ALERT_TRAY");
          break;
        case 740:
          v22 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
          break;
        case 741:
          v22 = CFSTR("RAP_INCIDENT_REPORT_VIEW");
          break;
        case 742:
          v22 = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
          break;
        case 743:
          v22 = CFSTR("TRAFFIC_ADVISORY_SHEET");
          break;
        case 801:
          v22 = CFSTR("SIRI_PLUGIN_SNIPPET");
          break;
        case 802:
          v22 = CFSTR("SIRI_PLUGIN_COMMAND");
          break;
        case 803:
          v22 = CFSTR("SIRI_SEARCH_RESULT_LIST");
          break;
        case 804:
          v22 = CFSTR("SIRI_DISAMBIGUATION_LIST");
          break;
        case 805:
          v22 = CFSTR("SIRI_PLACE_SNIPPET");
          break;
        default:
          if ((_DWORD)v14 != 901)
            goto LABEL_1362;
          v22 = CFSTR("CHROME");
          break;
      }
    }
    *(_DWORD *)buf = 138413058;
    v60 = v21;
    v61 = 2112;
    v62 = v22;
    v63 = 2112;
    v64 = v17;
    v65 = 2112;
    v66 = v18;
    _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_DEBUG, "Creating an action %@ with target %@ with value %@ and module metadata %@", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "generateAvailableActionForAnalytics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(v25, "generateUnactionableUIElementsForAnalytics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceCardAnalyticsController placeItem](self, "placeItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "mapItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  v30 = objc_loadWeakRetained((id *)&self->_provider);
  LODWORD(v27) = objc_msgSend(v30, "getPlaceCardTypeForAnalytics");

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke;
  block[3] = &unk_1E2E017F0;
  v56 = v15;
  v57 = v14;
  v46 = v17;
  v47 = v28;
  v55 = Current;
  v48 = v44;
  v49 = v43;
  v58 = (int)v27;
  v50 = v24;
  v51 = v26;
  v52 = v18;
  v53 = v41;
  v54 = v39;
  v40 = v39;
  v42 = v41;
  v32 = v18;
  v33 = v26;
  v34 = v24;
  v35 = v43;
  v36 = v44;
  v37 = v28;
  v38 = v17;
  dispatch_async(analyticsQueue, block);

}

void __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  _QWORD block[4];
  id v25;

  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_DWORD *)(a1 + 116);
  v22 = *(_DWORD *)(a1 + 112);
  v2 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 104);
  v19 = objc_msgSend(v2, "_muid");
  objc_msgSend(*(id *)(a1 + 40), "_vendorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_DWORD *)(a1 + 120);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_firstLocalizedCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v9, "_allPhotoAttributions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v9, "_allPhotoAttributions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MUMap(v12, &__block_literal_global_3721);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  LODWORD(v15) = v16;
  objc_msgSend(v23, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v22, v21, v20, v2, 0xFFFFFFFFLL, v19, v3, v4, 0, v17, v18, v15, v5, v6, v7,
    v8,
    v13,
    *(_QWORD *)(a1 + 88));

  v14 = *(void **)(a1 + 96);
  if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke_2;
    block[3] = &unk_1E2E017C8;
    v25 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  CFAbsoluteTime Current;
  id WeakRetained;
  int v22;
  NSObject *analyticsQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  CFAbsoluteTime v34;
  int64_t v35;
  unint64_t v36;
  int v37;
  int v38;
  int v39;

  v15 = a6;
  v16 = a7;
  v17 = a9;
  -[MUPlaceCardAnalyticsController _requestHostToLogFeedbackTypeIfNeeded:](self, "_requestHostToLogFeedbackTypeIfNeeded:", a10);
  -[MUPlaceCardAnalyticsController placeItem](self, "placeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mapItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v22 = objc_msgSend(WeakRetained, "defaultTargetForPlaceCardAnalytics");

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __198__MUPlaceCardAnalyticsController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke;
  block[3] = &unk_1E2E01818;
  v37 = a3;
  v38 = v22;
  v34 = Current;
  v35 = a4;
  v36 = a5;
  v39 = a8;
  v30 = v19;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v19;
  dispatch_async(analyticsQueue, block);

}

void __198__MUPlaceCardAnalyticsController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned int *)(a1 + 88);
  v3 = *(unsigned int *)(a1 + 92);
  v4 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 64);
  v6 = *(unsigned int *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v4, "_vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  objc_msgSend(v10, "captureTransitPlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", v2, v3, 0, v4, v6, v7, v5, v8, -1, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_requestHostToLogFeedbackTypeIfNeeded:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  id WeakRetained;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    MUGetPlaceCardAnalyticsUILog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_DEBUG, "Invoking the delegate and placecard type is %d", (uint8_t *)v7, 8u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "requestHostToLogFeedbackTypeIfNeeded:", v3);

  }
}

- (void)instrumentAction:(int)a3 forModuleType:(int64_t)a4 usingFeedbackType:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  id WeakRetained;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](self, "instrumentAction:target:eventValue:moduleType:feedbackType:", v7, objc_msgSend(WeakRetained, "defaultTargetForPlaceCardAnalytics"), 0, a4, v5);

}

- (void)instrumentAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleType:(int64_t)a6 feedbackType:(int)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  -[MUPlaceCardAnalyticsController analyticModules](self, "analyticModules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MUPlaceCardAnalyticsController_instrumentAction_target_eventValue_moduleType_feedbackType___block_invoke;
  v16[3] = &__block_descriptor_40_e37_B32__0__GEOAPPlaceCardModule_8Q16_B24l;
  v16[4] = a6;
  MUFindFirst(v13, v16);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = a7;
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v10, v9, v12, 0, 0, v15, v14, 0);

}

BOOL __93__MUPlaceCardAnalyticsController_instrumentAction_target_eventValue_moduleType_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32) - 1;
  if (v2 > 5)
    v3 = 0;
  else
    v3 = dword_191F06494[v2];
  return v3 == objc_msgSend(a2, "type");
}

- (void)setDisableDeferLoggingUntilRefinement
{
  self->_deferLoggingRevealUntilRefinement = 1;
}

- (void)disableDeferLoggingUntilRefinementWithShouldInvokeReveal:(BOOL)a3
{
  void *v4;
  NSUUID *cachedSessionId;

  self->_deferLoggingRevealUntilRefinement = 0;
  if (a3)
  {
    v4 = (void *)-[NSUUID copy](self->_cachedSessionId, "copy");
    -[MUPlaceCardAnalyticsController instrumentRevealIfNeededWithImpressionsSessionId:](self, "instrumentRevealIfNeededWithImpressionsSessionId:", v4);

  }
  cachedSessionId = self->_cachedSessionId;
  self->_cachedSessionId = 0;

}

- (BOOL)deferLoggingRevealUntilRefinement
{
  return self->_deferLoggingRevealUntilRefinement;
}

- (MUPlaceCardAnalyticsProvider)provider
{
  return (MUPlaceCardAnalyticsProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (GEOLogContextDelegate)logContextDelegate
{
  return self->_logContextDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContextDelegate, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_cachedSessionId, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end
