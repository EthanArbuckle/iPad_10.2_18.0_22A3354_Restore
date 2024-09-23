@implementation ATXHomeScreenWidgetFeedbackProcessor

+ (BOOL)_shouldProcessEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "homeScreenEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "eventTypeString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
      {
        v7 = 0;
LABEL_13:

LABEL_14:
        if (v7 <= 0xC)
          v8 = (0x100Eu >> v7) & 1;
        else
          LOBYTE(v8) = 0;
        goto LABEL_17;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
      {
        v7 = 1;
        goto LABEL_13;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
      {
        v7 = 2;
        goto LABEL_13;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
      {
        v7 = 3;
        goto LABEL_13;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
        goto LABEL_20;
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
      {
        v7 = 5;
        goto LABEL_13;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
      {
LABEL_20:

      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
        {
          v7 = 7;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
        {
          v7 = 8;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
        {
          v7 = 9;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
        {
          v7 = 10;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
        {
          v7 = 11;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
        {
          v7 = 12;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
        {
          v7 = 13;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
        {
          v7 = 14;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
        {
          v7 = 15;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
        {
          v7 = 16;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
        {
          v7 = 17;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
        {
          v7 = 18;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
        {
          v7 = 19;
          goto LABEL_13;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
        {
          v7 = 20;
          goto LABEL_13;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("AppAdded")))
        {
          v7 = 21;
          goto LABEL_13;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("AppRemoved")))
          v7 = 22;
        else
          v7 = 0;

        if ((v7 & 0xFFFFFFFD) != 4)
          goto LABEL_14;
      }
      LOBYTE(v8) = 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v8) = 0;
LABEL_18:

  return v8;
}

- (void)_addToHistogramForWidgetsInEvent:(id)a3 type:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v8[6];

  objc_msgSend(a3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke;
  v8[3] = &unk_1E82DD290;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke_cold_1(v4);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v4, "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEventForWidgetBundleId:type:", v7, *(_QWORD *)(a1 + 40));

}

- (void)_updateHistogramForEvent:(id)a3
{
  id v5;
  void *v6;
  ATXHomeScreenEvent *lastPageAppearEvent;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  ATXHomeScreenEvent *v17;
  void *v18;
  void *v19;
  int v20;
  ATXHomeScreenWidgetFeedback *v21;
  void *v22;
  ATXHomeScreenWidgetFeedback *v23;
  void *v24;
  uint64_t v25;
  ATXHomeScreenWidgetFeedback *widgetFeedback;
  ATXHomeScreenWidgetFeedback *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  ATXHomeScreenWidgetFeedback *v33;
  void *v34;
  void *v35;
  int v36;
  ATXHomeScreenWidgetFeedback *v37;
  void *v38;
  void *v39;
  int v40;
  ATXHomeScreenWidgetFeedback *v41;
  void *v42;
  void *v43;
  int v44;
  ATXHomeScreenWidgetFeedback *v45;
  ATXHomeScreenWidgetFeedback *v46;
  id v47;

  v47 = a3;
  objc_msgSend(v47, "eventTypeString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
  {

    -[ATXHomeScreenWidgetFeedbackProcessor _addToHistogramForWidgetsInEvent:type:](self, "_addToHistogramForWidgetsInEvent:type:", v47, 2);
    objc_storeStrong((id *)&self->_lastPageAppearEvent, a3);
    goto LABEL_6;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("StackChanged")) & 1) == 0)
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
      {

        widgetFeedback = self->_widgetFeedback;
        objc_msgSend(v47, "widgetBundleId");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v27 = widgetFeedback;
        v28 = v5;
        v29 = 0;
      }
      else
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
        {
LABEL_2:

LABEL_3:
LABEL_6:
          v6 = v47;
          goto LABEL_7;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0)
        {
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceLocked")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) == 0)
          {
            if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
            {

              -[ATXHomeScreenWidgetFeedbackProcessor _addToHistogramForWidgetsInEvent:type:](self, "_addToHistogramForWidgetsInEvent:type:", v47, 2);
              goto LABEL_6;
            }
            if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackShown")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackDisappeared")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackCreated")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
            {
              objc_msgSend(v5, "isEqualToString:", CFSTR("AppRemoved"));
            }
          }
          goto LABEL_2;
        }

        objc_msgSend(v47, "reason");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringForATXHomeScreenWidgetExplicitFeedback();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "isEqualToString:", v35);

        v6 = v47;
        if (!v36)
          goto LABEL_7;
        v37 = self->_widgetFeedback;
        objc_msgSend(v47, "widgetBundleId");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v27 = v37;
        v28 = v5;
        v29 = 7;
      }
LABEL_38:
      -[ATXHomeScreenWidgetFeedback addEventForWidgetBundleId:type:](v27, "addEventForWidgetBundleId:type:", v28, v29);
      goto LABEL_3;
    }

    objc_msgSend(v47, "reason");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringForATXHomeScreenStackChangeReason();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if (v20)
    {
      v21 = self->_widgetFeedback;
      objc_msgSend(v47, "widgetBundleId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = v22;
      v25 = 3;
    }
    else
    {
      objc_msgSend(v47, "reason");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringForATXHomeScreenStackChangeReason();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (v32)
      {
        v33 = self->_widgetFeedback;
        objc_msgSend(v47, "widgetBundleId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v33;
        v24 = v22;
        v25 = 4;
      }
      else
      {
        objc_msgSend(v47, "reason");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringForATXHomeScreenStackChangeReason();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqualToString:", v39);

        if (v40)
        {
          v41 = self->_widgetFeedback;
          objc_msgSend(v47, "widgetBundleId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v41;
          v24 = v22;
          v25 = 5;
        }
        else
        {
          objc_msgSend(v47, "reason");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringForATXHomeScreenStackChangeReason();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqualToString:", v43);

          if (!v44)
          {
LABEL_37:
            v46 = self->_widgetFeedback;
            objc_msgSend(v47, "widgetBundleId");
            v5 = (id)objc_claimAutoreleasedReturnValue();
            v27 = v46;
            v28 = v5;
            v29 = 2;
            goto LABEL_38;
          }
          v45 = self->_widgetFeedback;
          objc_msgSend(v47, "widgetBundleId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v45;
          v24 = v22;
          v25 = 6;
        }
      }
    }
    -[ATXHomeScreenWidgetFeedback addEventForWidgetBundleId:type:](v23, "addEventForWidgetBundleId:type:", v24, v25);

    goto LABEL_37;
  }

  lastPageAppearEvent = self->_lastPageAppearEvent;
  v6 = v47;
  if (lastPageAppearEvent)
  {
    -[ATXHomeScreenEvent metadata](lastPageAppearEvent, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pageIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    v6 = v47;
    if (v12)
    {
      objc_msgSend(v47, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenEvent date](self->_lastPageAppearEvent, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v14);
      v16 = v15;

      if (v16 > 5.0)
        -[ATXHomeScreenWidgetFeedbackProcessor _addToHistogramForWidgetsInEvent:type:](self, "_addToHistogramForWidgetsInEvent:type:", v47, 1);
      v17 = self->_lastPageAppearEvent;
      self->_lastPageAppearEvent = 0;

      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (id)_retrieveLastHistogramUpdateDate
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("HomeScreenLastEventDateProcessedForHistograms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXHomeScreenWidgetFeedbackProcessor _retrieveLastHistogramUpdateDate].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }

  return v4;
}

+ (void)_storeLastHistogramUpdateDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("HomeScreenLastEventDateProcessedForHistograms"));

}

- (ATXHomeScreenWidgetFeedbackProcessor)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXHomeScreenWidgetFeedbackProcessor *v7;

  v3 = (void *)objc_opt_new();
  +[ATXHomeScreenWidgetFeedbackProcessor _retrieveLastHistogramUpdateDate](ATXHomeScreenWidgetFeedbackProcessor, "_retrieveLastHistogramUpdateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "genericEventPublisherFromStartTime:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v7 = -[ATXHomeScreenWidgetFeedbackProcessor initWithWidgetFeedback:publisher:](self, "initWithWidgetFeedback:publisher:", v6, v5);

  return v7;
}

- (ATXHomeScreenWidgetFeedbackProcessor)initWithWidgetFeedback:(id)a3 publisher:(id)a4
{
  id v7;
  id v8;
  ATXHomeScreenWidgetFeedbackProcessor *v9;
  ATXHomeScreenWidgetFeedbackProcessor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenWidgetFeedbackProcessor;
  v9 = -[ATXHomeScreenWidgetFeedbackProcessor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_widgetFeedback, a3);
    objc_storeStrong((id *)&v10->_publisher, a4);
  }

  return v10;
}

- (void)updateHistogramsForRecentHomeScreenEvents
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];
  id location;
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__16;
  v9[4] = __Block_byref_object_dispose__16;
  v10 = 0;
  objc_initWeak(&location, self);
  -[BPSPublisher filterWithIsIncluded:](self->_publisher, "filterWithIsIncluded:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2;
  v7[3] = &unk_1E82DB658;
  v7[4] = v9;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_17;
  v5[3] = &unk_1E82DD2D8;
  objc_copyWeak(&v6, &location);
  v5[4] = v9;
  v4 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", v7, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(v9, 8);

}

BOOL __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ATXHomeScreenWidgetFeedbackProcessor _shouldProcessEvent:](ATXHomeScreenWidgetFeedbackProcessor, "_shouldProcessEvent:", v2);

  return v3;
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2_cold_1(v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetFeedbackProcessor: Histograms updated for recent home screen events", v7, 2u);
  }

  +[ATXHomeScreenWidgetFeedbackProcessor _storeLastHistogramUpdateDate:](ATXHomeScreenWidgetFeedbackProcessor, "_storeLastHistogramUpdateDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "_updateHistogramForEvent:", v6);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v6, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v8, "laterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v8;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v10);
      if (v7)

    }
    else
    {
      __atxlog_handle_home_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_17_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPageAppearEvent, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_widgetFeedback, 0);
}

void __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "dictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXHomeScreenWidgetFeedbackProcessor: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)_retrieveLastHistogramUpdateDate
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXHomeScreenWidgetFeedbackProcessor: Failed to retrieve date of last log processed.", a5, a6, a7, a8, 0);
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXHomeScreenWidgetFeedbackProcessor: Error while updating histograms for recent home screen events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_17_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Can't deserialize ATXHomeScreenEvent instance", a5, a6, a7, a8, 0);
}

@end
