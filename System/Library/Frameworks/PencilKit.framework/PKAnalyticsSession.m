@implementation PKAnalyticsSession

- (PKAnalyticsSession)init
{
  PKAnalyticsSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAnalyticsSession;
  result = -[PKAnalyticsSession init](&v3, sel_init);
  if (result)
  {
    result->_undosPerSession = 0;
    result->_strokesPerSession = 0;
    result->_textLineStraighteningPerSession = 0;
  }
  return result;
}

- (void)_sendSessionAnalyticsMainThread
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCanvasSessionStatisticsManager endSession]((uint64_t)v2);

    if (a1[2] >= 1)
    {
      v3 = +[PKHoverSettings isHoverEnabled](PKHoverSettings, "isHoverEnabled");
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKPencilStatisticsManager allowedBundleIDFromBundleID:](PKPencilStatisticsManager, "allowedBundleIDFromBundleID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKStatisticsManager sharedStatisticsManager]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStatisticsManager recordNumberOfUndos:numberOfStrokes:showEffectsEnabled:shadowEnabled:bundleID:]((uint64_t)v7, a1[1], a1[2], v3, 0, v6);

    }
    +[PKStatisticsManager sharedStatisticsManager]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordTextLineStraighteningPerSession:Undos:]((uint64_t)v8);

    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0;
  }
}

- (void)endSessionAndSendAnalytics
{
  _QWORD block[5];

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PKAnalyticsSession _sendSessionAnalyticsMainThread](a1);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PKAnalyticsSession_endSessionAndSendAnalytics__block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __48__PKAnalyticsSession_endSessionAndSendAnalytics__block_invoke(uint64_t a1)
{
  -[PKAnalyticsSession _sendSessionAnalyticsMainThread](*(uint64_t **)(a1 + 32));
}

- (void)incrementUndoCount
{
  _QWORD v2[4];
  id v3;
  id location;

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      ++a1[1];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __40__PKAnalyticsSession_incrementUndoCount__block_invoke;
      v2[3] = &unk_1E7777588;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __40__PKAnalyticsSession_incrementUndoCount__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    ++WeakRetained[1];

}

- (void)incrementStrokeCount
{
  _QWORD v2[4];
  id v3;
  id location;

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      ++a1[2];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __42__PKAnalyticsSession_incrementStrokeCount__block_invoke;
      v2[3] = &unk_1E7777588;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __42__PKAnalyticsSession_incrementStrokeCount__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    ++WeakRetained[2];

}

- (void)incrementTextLineStraighteningCount
{
  _QWORD v2[4];
  id v3;
  id location;

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      ++a1[3];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __57__PKAnalyticsSession_incrementTextLineStraighteningCount__block_invoke;
      v2[3] = &unk_1E7777588;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __57__PKAnalyticsSession_incrementTextLineStraighteningCount__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    ++WeakRetained[3];

}

@end
