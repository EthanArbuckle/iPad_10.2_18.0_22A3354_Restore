@implementation CUIKORPayloadProvider

void __57__CUIKORPayloadProvider__lookupQueue_activeRequestForId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __53__CUIKORPayloadProvider__lookupQueue_enqueueRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "requestId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

void __54__CUIKORPayloadProvider__lookupQueue_removeRequestId___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (int64_t)requestPayloadForState:(id)a3 requestOptions:(unint64_t)a4 resultHandler:(id)a5
{
  int64_t v8;
  id v9;
  id v10;
  CUIKORContentImageRequest *v11;

  do
    v8 = __ldxr(&requestPayloadForState_requestOptions_resultHandler__nextRequestId);
  while (__stxr(v8 + 1, &requestPayloadForState_requestOptions_resultHandler__nextRequestId));
  v9 = a5;
  v10 = a3;
  v11 = -[CUIKORContentImageRequest initWithId:options:state:resultHandler:]([CUIKORContentImageRequest alloc], "initWithId:options:state:resultHandler:", v8, a4, v10, v9);

  -[CUIKORPayloadProvider _lookupQueue_enqueueRequest:](self, "_lookupQueue_enqueueRequest:", v11);
  if (_bitmaskContainsOption())
    -[CUIKORPayloadProvider _renderRequestId:](self, "_renderRequestId:", v8);
  else
    -[CUIKORPayloadProvider _scheduleRequestId:](self, "_scheduleRequestId:", v8);

  return v8;
}

- (void)_renderRequestId:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  CUIKORContentPayload *v17;
  void (**v18)(_QWORD, _QWORD);
  _QWORD block[4];
  id v20;
  CUIKORContentPayload *v21;
  uint8_t buf[4];
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CUIKORPayloadProvider _lookupQueue_activeRequestForId:](self, "_lookupQueue_activeRequestForId:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CUIKORPayloadProvider _lookupQueue_removeRequestId:](self, "_lookupQueue_removeRequestId:", a3);
    objc_msgSend(v5, "state");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isValid](v6, "isValid") & 1) != 0)
    {
      v7 = objc_msgSend(v5, "options");
      +[CUIKLogSubsystem signpost](CUIKLogSubsystem, "signpost");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B8A6A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RenderPayload", ", buf, 2u);
      }

      -[NSObject traitCollection](v6, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v9);

      if (_bitmaskContainsOption())
      {
        objc_msgSend((id)objc_opt_class(), "backgroundImageCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v6);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          -[CUIKORPayloadProvider _renderBackgroundImageWithState:](self, "_renderBackgroundImageWithState:", v6);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v11, v6);
        }

      }
      else
      {
        v11 = 0;
      }
      if (_bitmaskContainsOption())
      {
        -[CUIKORPayloadProvider _renderTextImageWithState:options:](self, "_renderTextImageWithState:options:", v6, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (_bitmaskContainsOption())
      {
        -[CUIKORPayloadProvider _renderTravelTimeImageWithState:](self, "_renderTravelTimeImageWithState:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKORPayloadProvider stringGenerator](self, "stringGenerator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "generateTravelTimeStringWithState:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
        v15 = 0;
      }
      +[CUIKLogSubsystem signpost](CUIKLogSubsystem, "signpost");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B8A6A000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RenderPayload", ", buf, 2u);
      }

      v17 = -[CUIKORContentPayload initWithRequestId:requestOptions:backgroundImage:textImage:textDrawInfo:travelTimeImage:travelTimeString:]([CUIKORContentPayload alloc], "initWithRequestId:requestOptions:backgroundImage:textImage:textDrawInfo:travelTimeImage:travelTimeString:", a3, v7, v11, v12, 0, v13, v15);
      if ((v7 & 0x10) != 0)
      {
        dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
        objc_msgSend(v5, "resultHandler");
        v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, CUIKORContentPayload *))v18)[2](v18, v17);
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__CUIKORPayloadProvider__renderRequestId___block_invoke;
        block[3] = &unk_1E6EB6170;
        v20 = v5;
        v21 = v17;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        v18 = (void (**)(_QWORD, _QWORD))v20;
      }

    }
    else
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CUIKORPayloadProvider _renderRequestId:].cold.1((uint64_t)v6, a3, v11);
    }

  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v23 = a3;
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_INFO, "Aborting occurrence render. Could not find request with id <%ld>", buf, 0xCu);
    }
  }

}

- (CUIKORStringGenerator)stringGenerator
{
  return self->_stringGenerator;
}

- (id)_renderBackgroundImageWithState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isReminder"))
    -[CUIKORPayloadProvider _renderReminderImageWithState:](self, "_renderReminderImageWithState:", v4);
  else
    -[CUIKORPayloadProvider _renderColorBlockImageWithState:](self, "_renderColorBlockImageWithState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_lookupQueue_removeRequestId:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[CUIKORPayloadProvider lookupQueue](self, "lookupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CUIKORPayloadProvider__lookupQueue_removeRequestId___block_invoke;
  v6[3] = &unk_1E6EB6578;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)_lookupQueue_enqueueRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CUIKORPayloadProvider lookupQueue](self, "lookupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CUIKORPayloadProvider__lookupQueue_enqueueRequest___block_invoke;
  block[3] = &unk_1E6EB6170;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

- (id)_lookupQueue_activeRequestForId:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[CUIKORPayloadProvider lookupQueue](self, "lookupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CUIKORPayloadProvider__lookupQueue_activeRequestForId___block_invoke;
  block[3] = &unk_1E6EB6550;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (NSCache)backgroundImageCache
{
  if (backgroundImageCache_onceToken != -1)
    dispatch_once(&backgroundImageCache_onceToken, &__block_literal_global_5);
  return (NSCache *)(id)backgroundImageCache_cache;
}

+ (CUIKORPayloadProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_21);
  return (CUIKORPayloadProvider *)(id)sharedProvider_provider;
}

uint64_t __45__CUIKORPayloadProvider_backgroundImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)backgroundImageCache_cache;
  backgroundImageCache_cache = (uint64_t)v0;

  return objc_msgSend((id)backgroundImageCache_cache, "setCountLimit:", 10);
}

void __39__CUIKORPayloadProvider_sharedProvider__block_invoke()
{
  CUIKORPayloadProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CUIKORPayloadProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

- (CUIKORPayloadProvider)init
{
  CUIKORPayloadProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *lookupQueue;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *drawingQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *pendingRequests;
  CUIKORStringGenerator *v11;
  CUIKORStringGenerator *stringGenerator;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CUIKORPayloadProvider;
  v2 = -[CUIKORPayloadProvider init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.calendar-occurrencecontentlookup", 0);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.calendar-occurrencecontentdrawing", v6);
    drawingQueue = v2->_drawingQueue;
    v2->_drawingQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v9;

    v11 = objc_alloc_init(CUIKORStringGenerator);
    stringGenerator = v2->_stringGenerator;
    v2->_stringGenerator = v11;

  }
  return v2;
}

- (void)cancelRequest:(int64_t)a3
{
  NSObject *v4;

  if (a3 < 0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CUIKORPayloadProvider cancelRequest:].cold.1(a3, v4);

  }
  else
  {
    -[CUIKORPayloadProvider _lookupQueue_removeRequestId:](self, "_lookupQueue_removeRequestId:", a3);
  }
}

- (void)_scheduleRequestId:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  -[CUIKORPayloadProvider drawingQueue](self, "drawingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CUIKORPayloadProvider__scheduleRequestId___block_invoke;
  block[3] = &unk_1E6EB6528;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __44__CUIKORPayloadProvider__scheduleRequestId___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renderRequestId:", *(_QWORD *)(a1 + 40));

}

void __42__CUIKORPayloadProvider__renderRequestId___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "resultHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)_renderReminderImageWithState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSelected");
  v5 = objc_msgSend(v3, "reminderStackDepth");
  v6 = objc_msgSend(v3, "userInterfaceStyle");
  v7 = objc_msgSend(v3, "isMiniPreviewInEventDetail");

  return +[CUIKOccurrenceRenderer renderReminderBackgroundSelected:stackDepth:userInterfaceStyle:miniPreview:](CUIKOccurrenceRenderer, "renderReminderBackgroundSelected:stackDepth:userInterfaceStyle:miniPreview:", v4, v5, v6, v7);
}

- (id)_renderColorBlockImageWithState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isSelected"))
    -[CUIKORPayloadProvider _renderSelectedColorBlockImageWithState:](self, "_renderSelectedColorBlockImageWithState:", v4);
  else
    -[CUIKORPayloadProvider _renderUnselectedColorBlockImageWithState:](self, "_renderUnselectedColorBlockImageWithState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_renderSelectedColorBlockImageWithState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "baseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isCancelled");
  v7 = objc_msgSend(v4, "isDeclined");
  v8 = objc_msgSend(v4, "isTentative");
  if (!objc_msgSend(v4, "needsReply") || (v6 & 1) != 0)
  {
    if ((v6 | v7) == 1)
    {
      CUIKSelectedDeclinedBackgroundColor();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v5, "colorWithAlphaComponent:", 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKSelectedTentativeStripeColor();
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(v5, "colorWithAlphaComponent:", 0.9);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v11;
    -[CUIKORPayloadProvider _renderBackgroundImageForState:backgroundColor:](self, "_renderBackgroundImageForState:backgroundColor:", v4, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  CUIKSelectedNeedsReplyBackgroundColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKSelectedNeedsReplyStripeColor();
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v12 = (void *)v10;
  -[CUIKORPayloadProvider _renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:](self, "_renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:", v4, v9, v10, 0.9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v13;
}

- (id)_renderUnselectedColorBlockImageWithState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  CUIKORPayloadProvider *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "baseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "isCancelled");
  v8 = objc_msgSend(v4, "isDeclined");
  v9 = objc_msgSend(v4, "isTentative");
  if (!objc_msgSend(v4, "needsReply") || (v7 & 1) != 0)
  {
    if ((v7 | v8) == 1)
    {
      CUIKDeclinedEventBackgroundColor();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
      {
        CUIKLightStripeColorForColor(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == 2)
        {
          CUIKColorDarkenedToPercentageWithFinalAlpha(v5, 0.25);
          v18 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v18;
        }
        CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v5, 1, v6, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self;
        v13 = v4;
        v14 = v11;
        v15 = v10;
        goto LABEL_4;
      }
      CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v5, 0, v6, 0);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v17;
    -[CUIKORPayloadProvider _renderBackgroundImageForState:backgroundColor:](self, "_renderBackgroundImageForState:backgroundColor:", v4, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  CUIKNeedsReplyBackgroundColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKNeedsReplyStripeColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self;
  v13 = v4;
  v14 = v10;
  v15 = v11;
LABEL_4:
  -[CUIKORPayloadProvider _renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:](v12, "_renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:", v13, v14, v15, 0.6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v16;
}

- (id)_renderBackgroundImageForState:(id)a3 backgroundColor:(id)a4
{
  return -[CUIKORPayloadProvider _renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:](self, "_renderColorBlockImageWithState:backgroundColor:stripeColor:stripedImageAlpha:", a3, a4, 0, 1.0);
}

- (id)_renderColorBlockImageWithState:(id)a3 backgroundColor:(id)a4 stripeColor:(id)a5 stripedImageAlpha:(double)a6
{
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v8 = a5;
  v9 = a4;
  +[CUIKORImageUtils colorBarThickness](CUIKORImageUtils, "colorBarThickness");
  v11 = v10;
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v12, "CGColor");

  v14 = objc_retainAutorelease(v8);
  v15 = objc_msgSend(v14, "CGColor");

  return +[CUIKOccurrenceRenderer renderColorBlockImageWithThickness:backgroundColor:stripeColor:stripedImageAlpha:](CUIKOccurrenceRenderer, "renderColorBlockImageWithThickness:backgroundColor:stripeColor:stripedImageAlpha:", v13, v15, v11, a6);
}

- (id)_renderTextImageWithState:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  -[CUIKORPayloadProvider stringGenerator](self, "stringGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateContentStringsWithState:options:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textSpace");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "primaryTextFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageAwareInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v6, "leadingIcon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingIcons");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKOccurrenceRenderer renderStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:](CUIKOccurrenceRenderer, "renderStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:", v8, v13, v22, v23, v10, v12, v15, v17, v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_textDrawInfoWithState:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  CUIKORTextDrawInfo *v25;
  CUIKORTextDrawInfo *v26;
  double v28;
  double v29;

  v6 = a3;
  -[CUIKORPayloadProvider stringGenerator](self, "stringGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateContentStringsWithState:options:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0.0;
  v29 = 0.0;
  objc_msgSend(v6, "textSpace");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "primaryTextFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageAwareInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v6, "leadingIcon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingIcons");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKOccurrenceRenderer renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:](CUIKOccurrenceRenderer, "renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:", v8, v13, v22, v23, &v28, v10, v12, v15, v17, v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [CUIKORTextDrawInfo alloc];
  v26 = -[CUIKORTextDrawInfo initWithContentSize:renderingBlock:](v25, "initWithContentSize:renderingBlock:", v24, v28, v29);

  return v26;
}

- (OS_dispatch_queue)drawingQueue
{
  return self->_drawingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringGenerator, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
}

- (void)cancelRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Attempted to cancel an invalid id <%ld>", (uint8_t *)&v2, 0xCu);
}

- (void)_renderRequestId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "Aborting occurrence render. Request <%ld> is not valid: %@", (uint8_t *)&v3, 0x16u);
}

@end
