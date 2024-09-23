@implementation HKOutsideViewTapDetector

- (HKOutsideViewTapDetector)init
{
  HKOutsideViewTapDetector *v2;
  NSMutableArray *v3;
  NSMutableArray *windowCallbacks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKOutsideViewTapDetector;
  v2 = -[HKOutsideViewTapDetector init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    windowCallbacks = v2->_windowCallbacks;
    v2->_windowCallbacks = v3;

  }
  return v2;
}

+ (id)_detectorSingleton
{
  if (_detectorSingleton_onceToken != -1)
    dispatch_once(&_detectorSingleton_onceToken, &__block_literal_global_46);
  return (id)_detectorSingleton__detector;
}

void __46__HKOutsideViewTapDetector__detectorSingleton__block_invoke()
{
  HKOutsideViewTapDetector *v0;
  void *v1;

  v0 = objc_alloc_init(HKOutsideViewTapDetector);
  v1 = (void *)_detectorSingleton__detector;
  _detectorSingleton__detector = (uint64_t)v0;

}

+ (void)addOutsideTouchCallbackForView:(id)a3 outsideTapBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  +[HKOutsideViewTapDetector _detectorSingleton](HKOutsideViewTapDetector, "_detectorSingleton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_callbacksForWindow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addCallbackForView:outsideTapBlock:", v6, v5);
}

+ (void)removeOutsideTouchCallbackForView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HKOutsideViewTapDetector _detectorSingleton](HKOutsideViewTapDetector, "_detectorSingleton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_removeCallbacksForView:", v3);

}

- (id)_callbacksForWindow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _HKOutsideTapWindowCallbacks *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKOutsideViewTapDetector windowCallbacks](self, "windowCallbacks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "matchesWindow:", v4) & 1) != 0)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = -[_HKOutsideTapWindowCallbacks initWithWindow:]([_HKOutsideTapWindowCallbacks alloc], "initWithWindow:", v4);
  -[HKOutsideViewTapDetector windowCallbacks](self, "windowCallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);
LABEL_11:

  return v11;
}

- (void)_removeCallbacksForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKOutsideViewTapDetector windowCallbacks](self, "windowCallbacks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeCallbackForView:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSMutableArray)windowCallbacks
{
  return self->_windowCallbacks;
}

- (void)setWindowCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_windowCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowCallbacks, 0);
}

@end
