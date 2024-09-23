@implementation AXGestureRecorderViewController

- (void)dealloc
{
  objc_super v3;

  -[AXGestureRecorderViewController _releaseOutlets](self, "_releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderViewController;
  -[AXGestureRecorderViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fingerPathsCount");
  -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 + objc_msgSend(v5, "fingerPathsCount") == 0;

  return v4;
}

- (void)loadView
{
  AXGestureRecorderView *v3;
  void *v4;
  void *v5;
  AXGestureRecorderView *v6;

  v3 = [AXGestureRecorderView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = -[AXGestureRecorderView initWithFrame:](v3, "initWithFrame:");

  -[AXGestureRecorderView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[AXGestureRecorderViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderView setStyleProvider:](v6, "setStyleProvider:", v5);

  -[AXGestureRecorderView setDataSource:](v6, "setDataSource:", self);
  -[AXGestureRecorderViewController setView:](self, "setView:", v6);

}

- (void)hideStaticView
{
  id v2;

  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideStaticView");

}

- (id)recordedGesturePropertyListRepresentationWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyListRepresentationWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recordedReplayableGestureRepresentation
{
  void *v2;
  void *v3;

  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replayableGestureRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)deleteAllFingerPaths
{
  void *v3;

  -[AXGestureRecorderViewController setFingerPathCollection:](self, "setFingerPathCollection:", 0);
  -[AXGestureRecorderViewController setDynamicFingerPathCollection:](self, "setDynamicFingerPathCollection:", 0);
  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllFingerPaths");

  -[AXGestureRecorderViewController setShouldPreventFurtherRecording:](self, "setShouldPreventFurtherRecording:", 0);
  -[AXGestureRecorderViewController setTrackingTouches:](self, "setTrackingTouches:", 0);
  -[AXGestureRecorderViewController _endInstantReplay](self, "_endInstantReplay");
}

- (void)preventFurtherRecording
{
  -[AXGestureRecorderViewController setShouldPreventFurtherRecording:](self, "setShouldPreventFurtherRecording:", 1);
}

- (void)replayRecordedGesture
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timestampsCount");

  if (v4
    && (-[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "fingerPathsCount"),
        v5,
        v6))
  {
    -[AXGestureRecorderViewController _endInstantReplay](self, "_endInstantReplay");
    -[AXGestureRecorderViewController setInReplayMode:](self, "setInReplayMode:", 1);
    -[AXGestureRecorderViewController setReplayTimestampIndex:](self, "setReplayTimestampIndex:", 0);
    -[AXGestureRecorderViewController setReplayTimestampsCount:](self, "setReplayTimestampsCount:", v4);
    -[AXGestureRecorderViewController _advanceReplay](self, "_advanceReplay");
  }
  else
  {
    -[AXGestureRecorderViewController _exitReplayMode](self, "_exitReplayMode");
  }
}

- (void)reloadAllFingerPaths
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXGestureRecorderViewController numberOfDynamicFingerPathsInGestureRecorderView:](self, "numberOfDynamicFingerPathsInGestureRecorderView:", v3);

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadDynamicFingerPathAtIndex:", i);

    }
  }
}

- (void)_advanceReplay
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;

  v4 = -[AXGestureRecorderViewController replayTimestampIndex](self, "replayTimestampIndex");
  if (v4 >= -[AXGestureRecorderViewController replayTimestampsCount](self, "replayTimestampsCount"))
    _AXAssert();
  if (v4 < -[AXGestureRecorderViewController replayTimestampsCount](self, "replayTimestampsCount"))
  {
    -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReplayMode:", 1);
    if (!v4)
      objc_msgSend(v17, "deleteAllFingerPaths");
    -[AXGestureRecorderViewController replayDynamicFingerPaths](self, "replayDynamicFingerPaths", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fingerPathsCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        if (!v5)
        {
          v5 = (void *)objc_opt_new();
          -[AXGestureRecorderViewController setReplayDynamicFingerPaths:](self, "setReplayDynamicFingerPaths:", v5);
        }
        objc_msgSend(v7, "fingerPathToAppendForIndex:forTimestampAtIndex:", i, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (i >= v6)
          {
            objc_msgSend(v5, "addObject:", v11);
            objc_msgSend(v17, "insertDynamicFingerPathAtIndex:", v6++);
          }
          else
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendPath:", v11);
            objc_msgSend(v17, "reloadDynamicFingerPathAtIndex:", i);

          }
        }

      }
    }
    -[AXGestureRecorderViewController setReplayTimestampIndex:](self, "setReplayTimestampIndex:", v4 + 1);
    if (v4 + 1 >= -[AXGestureRecorderViewController replayTimestampsCount](self, "replayTimestampsCount"))
    {
      -[AXGestureRecorderViewController _exitReplayMode](self, "_exitReplayMode");
    }
    else
    {
      objc_msgSend(v7, "timestampAtIndex:", v4 + 1);
      v14 = v13;
      objc_msgSend(v7, "timestampAtIndex:", v4);
      -[AXGestureRecorderViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v16, 0, v14 - v15);
    }

  }
}

- (void)_exitReplayMode
{
  void *v3;
  id v4;

  -[AXGestureRecorderViewController setInReplayMode:](self, "setInReplayMode:", 0);
  -[AXGestureRecorderViewController setReplayTimestampIndex:](self, "setReplayTimestampIndex:", 0);
  -[AXGestureRecorderViewController setReplayTimestampsCount:](self, "setReplayTimestampsCount:", 0);
  -[AXGestureRecorderViewController setReplayDynamicFingerPaths:](self, "setReplayDynamicFingerPaths:", 0);
  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "freezeAllDynamicFingerPaths");

  -[AXGestureRecorderViewController _didFinishReplayingRecordedGesture](self, "_didFinishReplayingRecordedGesture");
  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReplayMode:", 0);

}

- (void)_advanceInstantReplayForStaticFingerAtIndex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  id v32;

  v32 = a3;
  -[AXGestureRecorderViewController instantReplayTimestampIndexes](self, "instantReplayTimestampIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderViewController setInstantReplayTimestampIndexes:](self, "setInstantReplayTimestampIndexes:", v5);

  }
  -[AXGestureRecorderViewController instantReplayPartialFingerPaths](self, "instantReplayPartialFingerPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderViewController setInstantReplayPartialFingerPaths:](self, "setInstantReplayPartialFingerPaths:", v7);

  }
  -[AXGestureRecorderViewController instantReplayTimestampIndexes](self, "instantReplayTimestampIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "timestampsCount");

  v13 = objc_msgSend(v32, "unsignedIntegerValue");
  if (v10 >= v12)
  {
    -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "timestampsCount");

    if (v10 != v21)
      _AXAssert();
    -[AXGestureRecorderViewController _endInstantReplayForStaticFingerAtIndex:](self, "_endInstantReplayForStaticFingerAtIndex:", v13);
  }
  else
  {
    if (v10)
    {
      -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fingerPathToAppendForIndex:forTimestampAtIndex:", v13, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
    }
    else
    {
      v15 = 0;
      while (v10 < v12)
      {
        while (1)
        {
          -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fingerPathToAppendForIndex:forTimestampAtIndex:", v13, v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v15 = v23;
          if (!v23)
            break;
          if (!objc_msgSend(v23, "isEmpty") || v10 >= v12)
            goto LABEL_8;
        }
      }
      v15 = 0;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderViewController instantReplayTimestampIndexes](self, "instantReplayTimestampIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v32);

    if (v15)
    {
      -[AXGestureRecorderViewController instantReplayPartialFingerPaths](self, "instantReplayPartialFingerPaths");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v32);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(v19, "appendBezierPath:", v15);
      else
        v19 = v15;
      -[AXGestureRecorderViewController instantReplayPartialFingerPaths](self, "instantReplayPartialFingerPaths");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v32);

      -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateInstantReplayAtIndex:withPartialPath:", v13, v19);

      if (v10 >= v12)
      {
        v31 = 0.3;
      }
      else
      {
        -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timestampAtIndex:", v10);
        v28 = v27;
        -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timestampAtIndex:", v10 - 1);
        v31 = v28 - v30;

      }
      -[AXGestureRecorderViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__advanceInstantReplayForStaticFingerAtIndex_, v32, v31);

    }
    else
    {
      -[AXGestureRecorderViewController _endInstantReplayForStaticFingerAtIndex:](self, "_endInstantReplayForStaticFingerAtIndex:", v13);
    }

  }
}

- (void)_startInstantReplayForStaticFingerAtIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderViewController _advanceInstantReplayForStaticFingerAtIndex:](self, "_advanceInstantReplayForStaticFingerAtIndex:", v4);

}

- (void)_endInstantReplayForStaticFingerAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishInstantReplayAtIndex:", a3);

  -[AXGestureRecorderViewController instantReplayTimestampIndexes](self, "instantReplayTimestampIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  -[AXGestureRecorderViewController instantReplayPartialFingerPaths](self, "instantReplayPartialFingerPaths");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v8);

}

- (void)_endInstantReplay
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AXGestureRecorderViewController instantReplayTimestampIndexes](self, "instantReplayTimestampIndexes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__advanceInstantReplayForStaticFingerAtIndex_, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearInstantReplayFingerPaths");

  -[AXGestureRecorderViewController setInstantReplayTimestampIndexes:](self, "setInstantReplayTimestampIndexes:", 0);
  -[AXGestureRecorderViewController setInstantReplayPartialFingerPaths:](self, "setInstantReplayPartialFingerPaths:", 0);
}

- (void)_clearWeakReferencesWithOutlets
{
  id v3;

  if (-[AXGestureRecorderViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDataSource:", 0);

  }
}

- (double)_maximumDurationOfRecordedGesture
{
  void *v3;
  double v4;
  double v5;

  -[AXGestureRecorderViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "maximumDurationOfRecordedGestureForGestureRecorderViewController:", self);
    v4 = v5;
  }

  return v4;
}

- (void)_didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  -[AXGestureRecorderViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "gestureRecorderViewController:didStartRecordingAtomicFingerPathAtPoint:", self, x, y);

}

- (void)_didStopRecordingAtomicFingerPath
{
  id v3;

  -[AXGestureRecorderViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gestureRecorderViewControllerDidStopRecordingAtomicFingerPath:", self);

}

- (void)_didFinishReplayingRecordedGesture
{
  id v3;

  -[AXGestureRecorderViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gestureRecorderViewControllerDidFinishReplayingRecordedGesture:", self);

}

- (void)_updateDynamicFingerPathsWithTouches:(id)a3 touchesDidEnd:(BOOL)a4
{
  _BOOL4 v4;
  AXGestureRecorderFingerPathCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  double Current;
  id v11;

  v4 = a4;
  v11 = a3;
  -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
  v6 = (AXGestureRecorderFingerPathCollection *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[AXGestureRecorderFingerPathCollection initWithMaximumFingerPathsCount:]([AXGestureRecorderFingerPathCollection alloc], "initWithMaximumFingerPathsCount:", 10);
    -[AXGestureRecorderFingerPathCollection setShouldRecordRealTimeGesture:](v6, "setShouldRecordRealTimeGesture:", (-[AXGestureRecorderViewController recorderType](self, "recorderType") & 0xFFFFFFFFFFFFFFFDLL) == 1);
    -[AXGestureRecorderViewController styleProvider](self, "styleProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimumFingerLineWidth");
    -[AXGestureRecorderFingerPathCollection setMinimumFingerLineWidth:](v6, "setMinimumFingerLineWidth:");

    -[AXGestureRecorderViewController styleProvider](self, "styleProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maximumFingerLineWidth");
    -[AXGestureRecorderFingerPathCollection setMaximumFingerLineWidth:](v6, "setMaximumFingerLineWidth:");

    -[AXGestureRecorderFingerPathCollection setDelegate:](v6, "setDelegate:", self);
    -[AXGestureRecorderViewController setDynamicFingerPathCollection:](self, "setDynamicFingerPathCollection:", v6);
  }
  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  if (v4)
    -[AXGestureRecorderFingerPathCollection handleLiftForTouches:referenceView:time:](v6, "handleLiftForTouches:referenceView:time:", v11, v9, Current);
  else
    -[AXGestureRecorderFingerPathCollection appendPointsForTouches:referenceView:time:](v6, "appendPointsForTouches:referenceView:time:", v11, v9, Current);

  -[AXGestureRecorderViewController reloadAllFingerPaths](self, "reloadAllFingerPaths");
}

- (void)_freezeAllDynamicFingerPaths
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  AXGestureRecorderFingerPathCollection *v9;

  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v9 = (AXGestureRecorderFingerPathCollection *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[AXGestureRecorderFingerPathCollection initWithMaximumFingerPathsCount:]([AXGestureRecorderFingerPathCollection alloc], "initWithMaximumFingerPathsCount:", 10);
    -[AXGestureRecorderFingerPathCollection setShouldRecordRealTimeGesture:](v9, "setShouldRecordRealTimeGesture:", (-[AXGestureRecorderViewController recorderType](self, "recorderType") & 0xFFFFFFFFFFFFFFFDLL) == 1);
    -[AXGestureRecorderViewController styleProvider](self, "styleProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "minimumFingerLineWidth");
    -[AXGestureRecorderFingerPathCollection setMinimumFingerLineWidth:](v9, "setMinimumFingerLineWidth:");

    -[AXGestureRecorderViewController styleProvider](self, "styleProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumFingerLineWidth");
    -[AXGestureRecorderFingerPathCollection setMaximumFingerLineWidth:](v9, "setMaximumFingerLineWidth:");

    -[AXGestureRecorderFingerPathCollection setDelegate:](v9, "setDelegate:", self);
    -[AXGestureRecorderViewController setFingerPathCollection:](self, "setFingerPathCollection:", v9);
  }
  -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fingerPathsCount");

  -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderFingerPathCollection appendFingerPathsFromFingerPathCollection:](v9, "appendFingerPathsFromFingerPathCollection:", v7);
  -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "freezeAllDynamicFingerPathsWithInstantReplayOffset:", v6);

  objc_msgSend(v7, "reset");
  -[AXGestureRecorderViewController setTrackingTouches:](self, "setTrackingTouches:", 0);
  if (!-[AXGestureRecorderViewController isInReplayMode](self, "isInReplayMode"))
  {
    while (v6 < -[AXGestureRecorderFingerPathCollection fingerPathsCount](v9, "fingerPathsCount"))
      -[AXGestureRecorderViewController _startInstantReplayForStaticFingerAtIndex:](self, "_startInstantReplayForStaticFingerAtIndex:", v6++);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[AXGestureRecorderViewController shouldPreventFurtherRecording](self, "shouldPreventFurtherRecording"))
  {
    -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fingerPathsCount");
    -[AXGestureRecorderViewController fingerPathCollection](self, "fingerPathCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fingerPathsCount") + v6;

    if (v8 <= 9)
    {
      if (!-[AXGestureRecorderViewController isTrackingTouches](self, "isTrackingTouches"))
      {
        if (!-[AXGestureRecorderViewController isInReplayMode](self, "isInReplayMode"))
        {
          if (!objc_msgSend(v12, "count"))
            _AXAssert();
          objc_msgSend(v12, "anyObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[AXGestureRecorderViewController recorderType](self, "recorderType") == 2 && v9)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
            v10 = objc_claimAutoreleasedReturnValue();

            v12 = (id)v10;
          }
          -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "locationInView:", v11);
          -[AXGestureRecorderViewController _didStartRecordingAtomicFingerPathAtPoint:](self, "_didStartRecordingAtomicFingerPathAtPoint:");

        }
        -[AXGestureRecorderViewController setTrackingTouches:](self, "setTrackingTouches:", 1);
        -[AXGestureRecorderViewController setTrackingTouchesDidStartTimeInterval:](self, "setTrackingTouchesDidStartTimeInterval:", CFAbsoluteTimeGetCurrent());
      }
      -[AXGestureRecorderViewController _updateDynamicFingerPathsWithTouches:touchesDidEnd:](self, "_updateDynamicFingerPathsWithTouches:touchesDidEnd:", v12, 0);
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double Current;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if (!-[AXGestureRecorderViewController shouldPreventFurtherRecording](self, "shouldPreventFurtherRecording")
    && -[AXGestureRecorderViewController isTrackingTouches](self, "isTrackingTouches"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[AXGestureRecorderViewController trackingTouchesDidStartTimeInterval](self, "trackingTouchesDidStartTimeInterval");
    v7 = Current - v6;
    -[AXGestureRecorderViewController _maximumDurationOfRecordedGesture](self, "_maximumDurationOfRecordedGesture");
    if (v7 <= v8)
      -[AXGestureRecorderViewController _updateDynamicFingerPathsWithTouches:touchesDidEnd:](self, "_updateDynamicFingerPathsWithTouches:touchesDidEnd:", v9, 0);
    else
      -[AXGestureRecorderViewController _freezeAllDynamicFingerPaths](self, "_freezeAllDynamicFingerPaths");
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  double Current;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (!-[AXGestureRecorderViewController shouldPreventFurtherRecording](self, "shouldPreventFurtherRecording")
    && -[AXGestureRecorderViewController isTrackingTouches](self, "isTrackingTouches"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[AXGestureRecorderViewController trackingTouchesDidStartTimeInterval](self, "trackingTouchesDidStartTimeInterval");
    v9 = Current - v8;
    -[AXGestureRecorderViewController _maximumDurationOfRecordedGesture](self, "_maximumDurationOfRecordedGesture");
    if (v9 <= v10)
      -[AXGestureRecorderViewController _updateDynamicFingerPathsWithTouches:touchesDidEnd:](self, "_updateDynamicFingerPathsWithTouches:touchesDidEnd:", v15, 1);
    v11 = objc_msgSend(v15, "count");
    -[AXGestureRecorderViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touchesForView:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v11 == v14)
    {
      -[AXGestureRecorderViewController _freezeAllDynamicFingerPaths](self, "_freezeAllDynamicFingerPaths");
      if (!-[AXGestureRecorderViewController isInReplayMode](self, "isInReplayMode"))
        -[AXGestureRecorderViewController _didStopRecordingAtomicFingerPath](self, "_didStopRecordingAtomicFingerPath");
    }
  }

}

- (unint64_t)numberOfDynamicFingerPathsInGestureRecorderView:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;

  if (-[AXGestureRecorderViewController isInReplayMode](self, "isInReplayMode", a3))
  {
    -[AXGestureRecorderViewController replayDynamicFingerPaths](self, "replayDynamicFingerPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }
  else
  {
    -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fingerPathsCount");
  }
  v6 = v5;

  return v6;
}

- (id)gestureRecorderView:(id)a3 dynamicFingerPathAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;

  if (-[AXGestureRecorderViewController isInReplayMode](self, "isInReplayMode", a3))
  {
    -[AXGestureRecorderViewController replayDynamicFingerPaths](self, "replayDynamicFingerPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
  }
  else
  {
    -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fingerPathAtIndex:", a4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)canToggleChromeForGestureRecorderView:(id)a3
{
  return -[AXGestureRecorderViewController recorderType](self, "recorderType", a3) != 0;
}

- (BOOL)isChromeVisibleForGestureRecorderView:(id)a3
{
  AXGestureRecorderViewController *v3;
  void *v4;

  v3 = self;
  -[AXGestureRecorderViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isChromeVisibleForGestureRecorderViewController:", v3);

  return (char)v3;
}

- (void)gestureRecorderView:(id)a3 setChromeVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AXGestureRecorderViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureRecorderViewController:setChromeVisible:", self, v4);

}

- (void)gestureRecorderFingerPathCollection:(id)a3 didInsertFingerPathAtIndex:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertDynamicFingerPathAtIndex:", a4);

  }
}

- (void)gestureRecorderFingerPathCollection:(id)a3 didUpdateFingerPathAtIndex:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  -[AXGestureRecorderViewController dynamicFingerPathCollection](self, "dynamicFingerPathCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[AXGestureRecorderViewController gestureRecorderView](self, "gestureRecorderView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadDynamicFingerPathAtIndex:", a4);

  }
}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (AXGestureRecorderViewControllerDelegate)delegate
{
  return (AXGestureRecorderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXGestureRecorderFingerPathCollection)fingerPathCollection
{
  return self->_fingerPathCollection;
}

- (void)setFingerPathCollection:(id)a3
{
  objc_storeStrong((id *)&self->_fingerPathCollection, a3);
}

- (AXGestureRecorderFingerPathCollection)dynamicFingerPathCollection
{
  return self->_dynamicFingerPathCollection;
}

- (void)setDynamicFingerPathCollection:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicFingerPathCollection, a3);
}

- (BOOL)shouldPreventFurtherRecording
{
  return self->_shouldPreventFurtherRecording;
}

- (void)setShouldPreventFurtherRecording:(BOOL)a3
{
  self->_shouldPreventFurtherRecording = a3;
}

- (BOOL)isTrackingTouches
{
  return self->_trackingTouches;
}

- (void)setTrackingTouches:(BOOL)a3
{
  self->_trackingTouches = a3;
}

- (double)trackingTouchesDidStartTimeInterval
{
  return self->_trackingTouchesDidStartTimeInterval;
}

- (void)setTrackingTouchesDidStartTimeInterval:(double)a3
{
  self->_trackingTouchesDidStartTimeInterval = a3;
}

- (BOOL)isInReplayMode
{
  return self->_inReplayMode;
}

- (void)setInReplayMode:(BOOL)a3
{
  self->_inReplayMode = a3;
}

- (unint64_t)replayTimestampIndex
{
  return self->_replayTimestampIndex;
}

- (void)setReplayTimestampIndex:(unint64_t)a3
{
  self->_replayTimestampIndex = a3;
}

- (unint64_t)replayTimestampsCount
{
  return self->_replayTimestampsCount;
}

- (void)setReplayTimestampsCount:(unint64_t)a3
{
  self->_replayTimestampsCount = a3;
}

- (NSMutableArray)replayDynamicFingerPaths
{
  return self->_replayDynamicFingerPaths;
}

- (void)setReplayDynamicFingerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_replayDynamicFingerPaths, a3);
}

- (int64_t)recorderType
{
  return self->_recorderType;
}

- (void)setRecorderType:(int64_t)a3
{
  self->_recorderType = a3;
}

- (NSMutableDictionary)instantReplayTimestampIndexes
{
  return self->_instantReplayTimestampIndexes;
}

- (void)setInstantReplayTimestampIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_instantReplayTimestampIndexes, a3);
}

- (NSMutableDictionary)instantReplayPartialFingerPaths
{
  return self->_instantReplayPartialFingerPaths;
}

- (void)setInstantReplayPartialFingerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_instantReplayPartialFingerPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantReplayPartialFingerPaths, 0);
  objc_storeStrong((id *)&self->_instantReplayTimestampIndexes, 0);
  objc_storeStrong((id *)&self->_replayDynamicFingerPaths, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathCollection, 0);
  objc_storeStrong((id *)&self->_fingerPathCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
