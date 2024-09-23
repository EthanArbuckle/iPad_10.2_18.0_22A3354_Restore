@implementation ATXHomeScreenLogWidgetAddedFeatures

- (ATXHomeScreenLogWidgetAddedFeatures)initWithHSEvent:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5
{
  id v9;
  id v10;
  ATXHomeScreenLogWidgetAddedFeatures *v11;
  uint64_t v12;
  NSMutableDictionary *widgetAddedFeatures;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenLogWidgetAddedFeatures;
  v11 = -[ATXHomeScreenLogWidgetAddedFeatures init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    widgetAddedFeatures = v11->_widgetAddedFeatures;
    v11->_widgetAddedFeatures = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_hsEvent, a3);
    v11->_rankOfWidgetInGallery = a4;
    objc_storeStrong((id *)&v11->_galleryItems, a5);
  }

  return v11;
}

- (void)_sendToCoreAnalytics
{
  NSObject *v3;
  NSMutableDictionary *widgetAddedFeatures;
  int v5;
  NSMutableDictionary *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    widgetAddedFeatures = self->_widgetAddedFeatures;
    v5 = 138412290;
    v6 = widgetAddedFeatures;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogWidgetAddedFeatures: Widget added features: %@", (uint8_t *)&v5, 0xCu);
  }

  AnalyticsSendEvent();
}

- (void)_populateFeaturesForAddedWidget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *widgetAddedFeatures;
  int v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  unint64_t rankOfWidgetInGallery;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = (void *)MEMORY[0x1E0CF9220];
  -[ATXHomeScreenEvent widgetBundleId](self->_hsEvent, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent widgetKind](self->_hsEvent, "widgetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringRepresentationForExtensionBundleId:kind:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  widgetAddedFeatures = self->_widgetAddedFeatures;
  v8 = 1;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetBundleIdAndKindFor"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](widgetAddedFeatures, "setObject:forKeyedSubscript:", v6, v9);

  -[ATXHomeScreenEvent widgetSize](self->_hsEvent, "widgetSize");
  ATXCAStringForStackLayoutSize();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetSizeFor"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  -[ATXHomeScreenEvent stackKind](self->_hsEvent, "stackKind");
  ATXStringForStackKind();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetAddedFeatures, "setObject:forKeyedSubscript:", v13, CFSTR("stackKindForAddedWidget"));

  -[ATXHomeScreenEvent stackLocation](self->_hsEvent, "stackLocation");
  ATXCAStringForStackLocation();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetAddedFeatures, "setObject:forKeyedSubscript:", v14, CFSTR("stackLocationForAddedWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rankOfWidgetInGallery);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("rankInGalleryFor"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

  rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
  if (rankOfWidgetInGallery)
  {
    -[NSArray objectAtIndexedSubscript:](self->_galleryItems, "objectAtIndexedSubscript:", rankOfWidgetInGallery - 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "rankType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  v27 = 0;
  v19 = &unk_1E83CC958;
LABEL_7:
  v20 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("galleryRankTypeFor"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetAddedFeatures, "setObject:forKeyedSubscript:", &unk_1E83CC958, CFSTR("suggestedSizeInGalleryIsSameForAddedWidget"));
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "suggestedSize") == -[ATXHomeScreenEvent widgetSize](self->_hsEvent, "widgetSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetAddedFeatures, "setObject:forKeyedSubscript:", v22, CFSTR("suggestedSizeInGalleryIsSameForAddedWidget"));

  }
  -[ATXHomeScreenEvent appBundleId](self->_hsEvent, "appBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenLogWidgetAddedFeatures _populateParentAppFeaturesForParentAppBundleId:widgetWasAdded:](self, "_populateParentAppFeaturesForParentAppBundleId:widgetWasAdded:", v23, 1);

  -[ATXHomeScreenEvent widgetBundleId](self->_hsEvent, "widgetBundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent widgetKind](self->_hsEvent, "widgetKind");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenEvent appBundleId](self->_hsEvent, "appBundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenLogWidgetAddedFeatures _populateHomeScreenConfigFeaturesForWidgetBundleId:widgetKind:parentAppBundleId:widgetWasAdded:](self, "_populateHomeScreenConfigFeaturesForWidgetBundleId:widgetKind:parentAppBundleId:widgetWasAdded:", v24, v25, v26, 1);

}

- (void)_populateFeaturesForNegativeExample
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *widgetAddedFeatures;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[ATXHomeScreenLogWidgetAddedFeatures _pickIndexForNegativeExampleFromGalleryItems](self, "_pickIndexForNegativeExampleFromGalleryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v27 = v3;
    -[NSArray objectAtIndexedSubscript:](self->_galleryItems, "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0CF9220];
      objc_msgSend(v5, "extensionBundleIdForMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widgetKind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringRepresentationForExtensionBundleId:kind:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      widgetAddedFeatures = self->_widgetAddedFeatures;
      -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetBundleIdAndKindFor"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](widgetAddedFeatures, "setObject:forKeyedSubscript:", v9, v11);

      objc_msgSend(v5, "suggestedSize");
      ATXCAStringForStackLayoutSize();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_widgetAddedFeatures;
      -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetSizeFor"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v27, "unsignedIntValue") + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_widgetAddedFeatures;
      -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("rankInGalleryFor"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "rankType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_widgetAddedFeatures;
      -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("galleryRankTypeFor"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

      objc_msgSend(v5, "appBundleId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLogWidgetAddedFeatures _populateParentAppFeaturesForParentAppBundleId:widgetWasAdded:](self, "_populateParentAppFeaturesForParentAppBundleId:widgetWasAdded:", v21, 0);

      objc_msgSend(v5, "avocadoDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "extensionBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "avocadoDescriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "kind");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenLogWidgetAddedFeatures _populateHomeScreenConfigFeaturesForWidgetBundleId:widgetKind:parentAppBundleId:widgetWasAdded:](self, "_populateHomeScreenConfigFeaturesForWidgetBundleId:widgetKind:parentAppBundleId:widgetWasAdded:", v23, v25, v26, 0);

    }
    else
    {
      v5 = 0;
    }

    v3 = v27;
  }

}

- (void)_populateParentAppFeaturesForParentAppBundleId:(id)a3 widgetWasAdded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *widgetAddedFeatures;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  NSMutableDictionary *v52;
  id v53;
  void *v54;
  NSMutableDictionary *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  NSMutableDictionary *v59;
  void *v60;
  NSMutableDictionary *v61;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  NSMutableDictionary *v65;
  void *v66;
  NSMutableDictionary *v67;
  void *v68;
  NSMutableDictionary *v69;
  void *v70;
  NSMutableDictionary *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  _QWORD v78[2];

  v4 = a4;
  v78[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v76 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "histogramForLaunchType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "categoricalHistogramForLaunchType:", 32);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8CE8], "genreForBundle:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    widgetAddedFeatures = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppGenreIdFor"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](widgetAddedFeatures, "setObject:forKeyedSubscript:", v8, v10);

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v75, "lastLaunchDateForBundleId:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceNow");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("secondsSinceLastParentAppLaunchFor"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

    v16 = (void *)MEMORY[0x1E0CB37E8];
    v78[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "totalLaunchesForBundleIds:", v17);
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppTotalDecayedLaunchesFor"), v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

    v21 = (void *)MEMORY[0x1E0CB37E8];
    v73 = v7;
    objc_msgSend(v7, "overallLaunchPopularityForBundleId:", v6);
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppRelativeLaunchPopularityFor"), v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "entropyForBundleId:", v6);
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppEntropyFor"), v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v28);

    objc_msgSend(MEMORY[0x1E0DC60B0], "currentNotificationSettingsCenter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "notificationSourceWithIdentifier:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "sourceSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "notificationSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v32, "authorizationStatus"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsAreAuthorizedFor"), v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v33, v35);

    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v74, "totalLaunchesForBundleId:category:", v6, CFSTR("r"));
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsReceivedFor"), v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v37, v39);

    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v74, "totalLaunchesForBundleId:category:", v6, CFSTR("e"));
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsEngagedFor"), v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v41, v43);

    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v74, "totalLaunchesForBundleId:category:", v6, CFSTR("c"));
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsClearedFor"), v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v45, v47);

    v48 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v74, "totalLaunchesForBundleId:category:", v6, CFSTR("i"));
    objc_msgSend(v48, "numberWithDouble:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsClearedFor"), v4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v49, v51);

  }
  else
  {
    v52 = self->_widgetAddedFeatures;
    v53 = 0;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppGenreIdFor"), v4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", CFSTR("Not applicable"), v54);

    v55 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("secondsSinceLastParentAppLaunchFor"), v4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", &unk_1E83CC958, v56);

    v57 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppTotalDecayedLaunchesFor"), v4);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v57, "setObject:forKeyedSubscript:", &unk_1E83CC958, v58);

    v59 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppRelativeLaunchPopularityFor"), v4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", &unk_1E83CC958, v60);

    v61 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppEntropyFor"), v4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", &unk_1E83CC958, v62);

    v63 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsAreAuthorizedFor"), v4);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", &unk_1E83CC958, v64);

    v65 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsReceivedFor"), v4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v65, "setObject:forKeyedSubscript:", &unk_1E83CC958, v66);

    v67 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsEngagedFor"), v4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", &unk_1E83CC958, v68);

    v69 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsIgnoredFor"), v4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v69, "setObject:forKeyedSubscript:", &unk_1E83CC958, v70);

    v71 = self->_widgetAddedFeatures;
    -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppNotificationsClearedFor"), v4);
    v77 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", &unk_1E83CC958);

  }
}

- (void)_populateHomeScreenConfigFeaturesForWidgetBundleId:(id)a3 widgetKind:(id)a4 parentAppBundleId:(id)a5 widgetWasAdded:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSMutableDictionary *widgetAddedFeatures;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  BOOL v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v6 = a6;
  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  widgetAddedFeatures = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetIsAlreadyAddedOnTodayPageFor"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](widgetAddedFeatures, "setObject:forKeyedSubscript:", &unk_1E83CC958, v12);

  v13 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetIsAlreadyAddedOnHomeScreenFor"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &unk_1E83CC958, v14);

  v15 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetFromParentAppBundleIdIsAlreadyAddedOnTodayPageFor"), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &unk_1E83CC958, v16);

  v17 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("widgetFromParentAppBundleIdIsAlreadyAddedOnHomeScreenFor"), v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &unk_1E83CC958, v18);

  v19 = self->_widgetAddedFeatures;
  -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppIsOnDockFor"), v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &unk_1E83CC958, v20);

  v21 = (void *)objc_opt_new();
  v51 = 0;
  objc_msgSend(v21, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v51;
  if (v22)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __134__ATXHomeScreenLogWidgetAddedFeatures__populateHomeScreenConfigFeaturesForWidgetBundleId_widgetKind_parentAppBundleId_widgetWasAdded___block_invoke;
    v47[3] = &unk_1E82E2530;
    v47[4] = self;
    v48 = v9;
    v49 = v10;
    v50 = v6;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v47);
    v46 = v23;
    objc_msgSend(v21, "loadDockAppListWithError:", &v46);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v46;

    if (v24)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = v24;
      v26 = v24;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v27)
      {
        v28 = v27;
        v36 = v25;
        v37 = v22;
        v38 = v21;
        v39 = v10;
        v40 = v9;
        v29 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v43 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            -[ATXHomeScreenEvent appBundleId](self->_hsEvent, "appBundleId", v36, v37, v38, v39, v40);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v31) = objc_msgSend(v31, "isEqualToString:", v32);

            if ((_DWORD)v31)
            {
              v33 = self->_widgetAddedFeatures;
              -[ATXHomeScreenLogWidgetAddedFeatures _key:byAppendingStringIndicatingIfWidgetWasAdded:](self, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", CFSTR("parentAppIsOnDockFor"), v6);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &unk_1E83CC970, v34);

            }
          }
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v28);
        v10 = v39;
        v9 = v40;
        v22 = v37;
        v21 = v38;
        v25 = v36;
      }
      v24 = v41;
    }
    else
    {
      __atxlog_handle_home_screen();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v25;
        _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: failed to fetch apps on dock with error: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v23;
      _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: failed to fetch home screen config with error: %@", buf, 0xCu);
    }

    v25 = v23;
  }

}

void __134__ATXHomeScreenLogWidgetAddedFeatures__populateHomeScreenConfigFeaturesForWidgetBundleId_widgetKind_parentAppBundleId_widgetWasAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ATXStackLocationForPageAndIndex();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v3, "stacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v3;
  objc_msgSend(v3, "panels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v44;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        v38 = v7;
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v8, "widgets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v14, "widgetUniqueId");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "widgetUniqueId");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if ((v17 & 1) != 0)
                continue;
              if (objc_msgSend(v14, "isSameWidgetAsWidgetBundleId:widgetKind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
              {
                if (ATXStackLocationIsTodayPage())
                {
                  v18 = *(_QWORD **)(a1 + 32);
                  v19 = (void *)v18[1];
                  v20 = *(unsigned __int8 *)(a1 + 56);
                  v21 = CFSTR("widgetIsAlreadyAddedOnTodayPageFor");
LABEL_17:
                  objc_msgSend(v18, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", v21, v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E83CC970, v22);

                  goto LABEL_18;
                }
                if (ATXStackLocationIsHomeScreen())
                {
                  v18 = *(_QWORD **)(a1 + 32);
                  v19 = (void *)v18[1];
                  v20 = *(unsigned __int8 *)(a1 + 56);
                  v21 = CFSTR("widgetIsAlreadyAddedOnHomeScreenFor");
                  goto LABEL_17;
                }
              }
LABEL_18:
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appBundleId");
              v23 = objc_claimAutoreleasedReturnValue();
              if (!v23)
                continue;
              v24 = (void *)v23;
              objc_msgSend(v14, "appBundleId");
              v25 = objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v26 = (void *)v25;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appBundleId");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "appBundleId");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToString:", v28);

                if (!v29)
                  continue;
                if (ATXStackLocationIsTodayPage())
                {
                  v30 = *(_QWORD **)(a1 + 32);
                  v31 = (void *)v30[1];
                  v32 = *(unsigned __int8 *)(a1 + 56);
                  v33 = CFSTR("widgetFromParentAppBundleIdIsAlreadyAddedOnTodayPageFor");
                }
                else
                {
                  if (!ATXStackLocationIsHomeScreen())
                    continue;
                  v30 = *(_QWORD **)(a1 + 32);
                  v31 = (void *)v30[1];
                  v32 = *(unsigned __int8 *)(a1 + 56);
                  v33 = CFSTR("widgetFromParentAppBundleIdIsAlreadyAddedOnHomeScreenFor");
                }
                objc_msgSend(v30, "_key:byAppendingStringIndicatingIfWidgetWasAdded:", v33, v32);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1E83CC970, v24);
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v11);
        }

        v7 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v37);
  }

}

- (id)_pickIndexForNegativeExampleFromGalleryItems
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t rankOfWidgetInGallery;
  BOOL v9;
  unint64_t v10;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v3 = -[NSArray count](self->_galleryItems, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 20;
    do
    {
      v6 = arc4random_uniform(v4);
      -[NSArray objectAtIndexedSubscript:](self->_galleryItems, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
        v9 = rankOfWidgetInGallery != 0;
        v10 = rankOfWidgetInGallery - 1;
        if (!v9 || v10 != v6)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          return v14;
        }
      }

      --v5;
    }
    while (v5);
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenLogWidgetAddedFeatures _pickIndexForNegativeExampleFromGalleryItems].cold.2(v4, v12);

  }
  else
  {
    __atxlog_handle_home_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenLogWidgetAddedFeatures _pickIndexForNegativeExampleFromGalleryItems].cold.1(v13);

  }
  v14 = 0;
  return v14;
}

- (id)_key:(id)a3 byAppendingStringIndicatingIfWidgetWasAdded:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = CFSTR("NegativeExample");
  if (v4)
    v8 = CFSTR("WidgetAdded");
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@%@"), v6, v8);

  return v9;
}

- (void)logWidgetAddedFeaturesInCoreAnalytics
{
  NSObject *v3;
  void *v4;
  unint64_t rankOfWidgetInGallery;
  int v6;
  void *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXHomeScreenEvent widgetBundleId](self->_hsEvent, "widgetBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    rankOfWidgetInGallery = self->_rankOfWidgetInGallery;
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = rankOfWidgetInGallery;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogWidgetAddedFeatures: logging new widget added: %@, rank in gallery: %lu", (uint8_t *)&v6, 0x16u);

  }
  -[ATXHomeScreenLogWidgetAddedFeatures _populateFeaturesForAddedWidget](self, "_populateFeaturesForAddedWidget");
  -[ATXHomeScreenLogWidgetAddedFeatures _populateFeaturesForNegativeExample](self, "_populateFeaturesForNegativeExample");
  -[ATXHomeScreenLogWidgetAddedFeatures _sendToCoreAnalytics](self, "_sendToCoreAnalytics");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryItems, 0);
  objc_storeStrong((id *)&self->_hsEvent, 0);
  objc_storeStrong((id *)&self->_widgetAddedFeatures, 0);
}

- (void)_pickIndexForNegativeExampleFromGalleryItems
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogWidgetAddedFeatures: Unable to find a negative example with negExampleIndexUpperBound: %lu", (uint8_t *)&v2, 0xCu);
}

@end
