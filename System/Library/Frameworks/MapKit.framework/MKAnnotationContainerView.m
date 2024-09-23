@implementation MKAnnotationContainerView

- (void)_updateAnnotationViewsForReason:(int64_t)a3 updatePositions:(BOOL)a4
{
  _BOOL4 v5;
  id WeakRetained;
  CFAbsoluteTime Current;
  double v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSMutableDictionary *clusterableAnnotationViews;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  uint8_t buf[8];
  uint64_t v45;
  _BYTE v46[128];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (!self->_suppress && !self->_isUpdating)
  {
    v5 = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      self->_isUpdating = 1;
      if (v5 && !-[MKAnnotationContainerView _updateAnnotationViewPositions](self, "_updateAnnotationViewPositions"))
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
      }
      else
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (!a3)
        {
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
LABEL_13:
          self->_lastUpdate = Current;
          MKGetAnnotationsLog();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_signpost_id_make_with_pointer(v10, self);

          MKGetAnnotationsLog();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = v11 - 1;
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Clustering", (const char *)&unk_18B2CC343, buf, 2u);
          }

          clusterableAnnotationViews = self->_clusterableAnnotationViews;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __77__MKAnnotationContainerView__updateAnnotationViewsForReason_updatePositions___block_invoke;
          v43[3] = &unk_1E20DEF60;
          v43[4] = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clusterableAnnotationViews, "enumerateKeysAndObjectsUsingBlock:", v43);
          MKGetAnnotationsLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v17, OS_SIGNPOST_INTERVAL_END, v11, "Clustering", (const char *)&unk_18B2CC343, buf, 2u);
          }

          MKGetAnnotationsLog();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Collision", (const char *)&unk_18B2CC343, buf, 2u);
          }

          -[MKAnnotationContainerView _updateCollidableAnnotationViews](self, "_updateCollidableAnnotationViews");
          MKGetAnnotationsLog();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v21, OS_SIGNPOST_INTERVAL_END, v11, "Collision", (const char *)&unk_18B2CC343, buf, 2u);
          }

          goto LABEL_29;
        }
        if (a3 == 3 || a3 == 1)
        {
          v9 = Current - self->_lastUpdate;
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
          if (v9 >= 0.5)
            goto LABEL_13;
LABEL_28:
          v22 = fmin(Current - self->_lastUpdate, 0.5);
          v47[0] = *MEMORY[0x1E0C99860];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotationContainerView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_updateAnnotationViewsWithDelay, 0, v23, v22);

LABEL_29:
          -[MKAnnotationContainerView annotationViews](self, "annotationViews");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotationContainerView bounds](self, "bounds");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v33 = v24;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v40 != v36)
                  objc_enumerationMutation(v33);
                -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), v26, v28, v30, v32, (_QWORD)v39);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
            }
            while (v35);
          }

          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performStateUpdatesIfNeeded, 0);
          v45 = *MEMORY[0x1E0C99860];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotationContainerView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__performStateUpdatesIfNeeded, 0, v38, 0.0);

          goto LABEL_37;
        }
        if (a3 != 2)
        {
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
          goto LABEL_28;
        }
      }
LABEL_37:
      self->_isUpdating = 0;
    }
  }
}

- (BOOL)_updateAnnotationViews:(id)a3
{
  BOOL v3;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  MKAnnotationView *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_suppress)
    return 0;
  if (!objc_msgSend(a3, "count"))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v19 = objc_msgSend(WeakRetained, "annotationContainerShouldAlignToPixels:", self);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v3 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(MKAnnotationView **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v12 != self->_draggingAnnotationView
          && (unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dragState") - 3) >= 2)
        {
          v13 = -[MKAnnotationView anchor](v12, "anchor");
          objc_msgSend(v13, "updateIfNeeded");
          -[MKAnnotationContainerView bounds](self, "bounds");
          objc_msgSend(v13, "pointInLayer:bound:", 0);
          v15 = v14;
          v17 = v16;
          if ((objc_msgSend(WeakRetained, "annotationContainer:isAnnotationView:validForDisplayAtPoint:", self, v12) & 1) != 0)
          {
            -[MKAnnotationView _setHidden:forReason:animated:](v12, "_setHidden:forReason:animated:", 0, 3, 0);
            -[MKAnnotationView _updateAnchorPosition:alignToPixels:](v12, "_updateAnchorPosition:alignToPixels:", v19, v15, v17);
            -[MKAnnotationView _updateFromMap](v12, "_updateFromMap");
            -[MKAnnotationView _didUpdatePosition](v12, "_didUpdatePosition");
            v3 = 1;
          }
          else
          {
            -[MKAnnotationView _setHidden:forReason:animated:](v12, "_setHidden:forReason:animated:", 1, 3, 0);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_updateAnnotationViewPositions
{
  return -[MKAnnotationContainerView _updateAnnotationViews:](self, "_updateAnnotationViews:", self->_annotationViews);
}

- (void)updateAnnotationViewsForReason:(int64_t)a3
{
  -[MKAnnotationContainerView _updateAnnotationViewsForReason:updatePositions:](self, "_updateAnnotationViewsForReason:updatePositions:", a3, 1);
}

- (void)setMapPitchRadians:(double)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_mapPitchRadians != a3)
  {
    self->_mapPitchRadians = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_annotationViews;
    v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_setMapPitchRadians:", a3, (_QWORD)v9);
        }
        v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setAnnotationViewsRotationRadians:(double)a3 animation:(id)a4
{
  NSMutableOrderedSet *v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_annotationViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setMapRotationRadians:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSMutableOrderedSet)annotationViews
{
  return self->_annotationViews;
}

- (void)finishAddingAndRemovingAnnotationViews
{
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
  -[MKAnnotationContainerView invalidateCustomFeatureDataSource](self, "invalidateCustomFeatureDataSource");
}

- (void)annotationViewDidChangeHidden:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MKAnnotationContainerView _updatePriorityMapIfNeeded](self, "_updatePriorityMapIfNeeded");
  -[MKAnnotationContainerView bounds](self, "bounds");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v10, v11, v12, v13);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
  else
  {
    -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", v4, v6, v7, v8, v9);
  }

}

- (void)updateAnnotationViewsWithDelay
{
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 1);
}

- (unsigned)sceneState
{
  return 1;
}

- (unsigned)sceneID
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 0;
}

- (void)suppressUpdates
{
  self->_suppress = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
}

- (void)stopSuppressingUpdates
{
  self->_suppress = 0;
}

- (void)visibleCenteringRectChanged
{
  NSMutableOrderedSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_annotationViews;
  v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_mapVisibleCenteringRectChanged", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_addPrioritiesForAnnotationViewIfNeeded:(id)a3
{
  float v4;
  double v5;
  float v6;
  double v7;
  NSMutableSet *prioritiesToAdd;
  void *v9;
  float v10;
  double v11;
  float v12;
  double v13;
  NSMutableSet *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "zPriority");
  v4 = *(float *)&v5;
  LODWORD(v5) = 0;
  if (v4 > 0.0)
    objc_msgSend(v16, "zPriority", v5);
  v6 = fminf(*(float *)&v5, 1000.0);
  if (!-[MKPriorityToIndexMap containsPriority:](self->_priorityMap, "containsPriority:", v6))
  {
    prioritiesToAdd = self->_prioritiesToAdd;
    *(float *)&v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](prioritiesToAdd, "addObject:", v9);

  }
  objc_msgSend(v16, "selectedZPriority");
  v10 = *(float *)&v11;
  LODWORD(v11) = 0;
  if (v10 > 0.0)
    objc_msgSend(v16, "selectedZPriority", v11);
  v12 = fminf(*(float *)&v11, 1000.0);
  if (!-[MKPriorityToIndexMap containsPriority:](self->_priorityMap, "containsPriority:", v12))
  {
    v14 = self->_prioritiesToAdd;
    *(float *)&v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v14, "addObject:", v15);

  }
}

- (void)_updateZPositionForAnnotationView:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  MKPriorityToIndexMap *priorityMap;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((objc_msgSend(a3, "isHidden") & 1) == 0)
  {
    -[MKAnnotationContainerView _updatePriorityMapIfNeeded](self, "_updatePriorityMapIfNeeded");
    objc_msgSend(a3, "_effectiveZPriority");
    priorityMap = self->_priorityMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPriorityToIndexMap objectForKeyedSubscript:](priorityMap, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(a3, "_anchorPoint");
    v15 = v14;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v16 = v15 / CGRectGetHeight(v20) + (double)(100 * v13);
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_CA_setDisableActions:", 1);

    objc_msgSend(a3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZPosition:", v16);

    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_CA_setDisableActions:", 0);

  }
}

- (BOOL)_updatePriorityMapIfNeeded
{
  uint64_t v3;
  BOOL v4;

  v3 = -[NSMutableSet count](self->_prioritiesToAdd, "count");
  if (v3)
  {
    v4 = -[MKPriorityToIndexMap addPriorities:](self->_priorityMap, "addPriorities:", self->_prioritiesToAdd);
    -[NSMutableSet removeAllObjects](self->_prioritiesToAdd, "removeAllObjects");
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (MKAnnotationView)userLocationView
{
  return self->_userLocationView;
}

- (void)setMapType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_setMapType:", a3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dropPinsIfNeeded
{
  -[MKAnnotationContainerView _dropPinsIfNeeded:](self, "_dropPinsIfNeeded:", 1);
}

- (void)_dropPinsIfNeeded:(BOOL)a3
{
  NSMutableArray *pinsToAnimate;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  id WeakRetained;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x1E0C80C00];
  pinsToAnimate = self->_pinsToAnimate;
  if (a3)
  {
    if (-[NSMutableArray count](pinsToAnimate, "count"))
    {
      -[MKAnnotationContainerView _visibleCenteringRect](self, "_visibleCenteringRect");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v13 = self->_pinsToAnimate;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v19, "frame");
            v49.origin.x = v20;
            v49.origin.y = v21;
            v49.size.width = v22;
            v49.size.height = v23;
            v48.origin.x = v6;
            v48.origin.y = v8;
            v48.size.width = v10;
            v48.size.height = v12;
            if (CGRectIntersectsRect(v48, v49))
            {
              if (!v16)
                v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v16, "addObject:", v19);
            }
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }

      -[NSMutableArray removeAllObjects](self->_pinsToAnimate, "removeAllObjects");
      if (v16)
      {
        if (!-[NSMutableArray count](self->_awaitingDropPins, "count"))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "annotationContainerWillDropPins:", self);

        }
        -[NSMutableArray addObjectsFromArray:](self->_awaitingDropPins, "addObjectsFromArray:", v16);
        objc_msgSend(v16, "_mapkit_sortUsingLongitude");
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v25 = v16;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v38;
          v29 = 0.0;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v38 != v28)
                objc_enumerationMutation(v25);
              v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              v36 = 0.0;
              v32 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v31, "annotation");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "coordinate");
              objc_msgSend(v32, "annotationContainer:pinDropDistanceForCoordinate:maxDistance:", self, &v36);
              v35 = v34;

              objc_msgSend(v31, "_dropFromDistance:maxDistance:withDelay:", v35, v36, v29);
              v29 = v29 + 0.05;
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v27);
        }

      }
    }
  }
  else
  {
    -[NSMutableArray removeAllObjects](pinsToAnimate, "removeAllObjects");
  }
}

- (void)_performStateUpdatesIfNeeded
{
  id WeakRetained;
  void *v4;
  id v5;
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
  if (-[NSMutableOrderedSet count](self->_annotationViews, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v4 = (void *)-[NSMutableOrderedSet copy](self->_annotationViews, "copy");
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v4;
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
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_performStateUpdatesIfNeeded", (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSMutableArray *customFeatureDataSourceObservers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  customFeatureDataSourceObservers = self->_customFeatureDataSourceObservers;
  v8 = v4;
  if (!customFeatureDataSourceObservers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_customFeatureDataSourceObservers;
    self->_customFeatureDataSourceObservers = v6;

    v4 = v8;
    customFeatureDataSourceObservers = self->_customFeatureDataSourceObservers;
  }
  -[NSMutableArray addObject:](customFeatureDataSourceObservers, "addObject:", v4);

}

- (void)addAnnotationView:(id)a3 allowAnimation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  float v15;
  void **p_requiredPriorityAnnotationViews;
  void *requiredPriorityAnnotationViews;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *collidingAnnotationViews;
  int v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *clusterableAnnotationViews;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void *v34;
  NSMutableOrderedSet *annotationViews;
  NSMutableOrderedSet *v36;
  NSMutableOrderedSet *v37;
  void *v38;
  NSMutableDictionary *clusteringAnnotationViews;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableArray *pinsToAnimate;
  NSMutableArray *v47;
  NSMutableArray *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_50;
  v55 = v6;
  objc_msgSend(v6, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isMKClusterAnnotation");

  if (v8)
  {
    objc_msgSend(v55, "annotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clusteringIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKAnnotationContainerView _existingClusterViewsForClusterID:](self, "_existingClusterViewsForClusterID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v55, "clusteringIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v55, "annotation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_isMKClusterAnnotation");

    if ((v14 & 1) == 0)
    {
      clusterableAnnotationViews = self->_clusterableAnnotationViews;
      if (!clusterableAnnotationViews)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v33 = self->_clusterableAnnotationViews;
        self->_clusterableAnnotationViews = v32;

        clusterableAnnotationViews = self->_clusterableAnnotationViews;
      }
      -[NSMutableDictionary objectForKey:](clusterableAnnotationViews, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v55);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_clusterableAnnotationViews, "setObject:forKey:", v12, v10);
        goto LABEL_5;
      }
LABEL_4:
      v12 = v11;
      objc_msgSend(v11, "addObject:", v55);
LABEL_5:

    }
  }

  objc_msgSend(v55, "displayPriority");
  if (v15 >= 1000.0)
  {
    p_requiredPriorityAnnotationViews = (void **)&self->_requiredPriorityAnnotationViews;
    requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
    if (requiredPriorityAnnotationViews)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_requiredPriorityAnnotationViews = (void **)&self->_collidableAnnotationViews;
    requiredPriorityAnnotationViews = self->_collidableAnnotationViews;
    if (requiredPriorityAnnotationViews)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = *p_requiredPriorityAnnotationViews;
  *p_requiredPriorityAnnotationViews = (void *)v18;

  requiredPriorityAnnotationViews = *p_requiredPriorityAnnotationViews;
LABEL_14:
  objc_msgSend(requiredPriorityAnnotationViews, "addObject:", v55);
  if (!self->_collidingAnnotationViews)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    collidingAnnotationViews = self->_collidingAnnotationViews;
    self->_collidingAnnotationViews = v20;

  }
  objc_msgSend(v55, "_invalidateCachedCoordinate");
  objc_msgSend(v55, "_setMapType:", self->_mapType);
  objc_msgSend(v55, "_setMapDisplayStyle:", *(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32));
  objc_msgSend(v55, "_setMapPitchRadians:", self->_mapPitchRadians);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v55, "_setDelegate:", self), v4))
    v22 = objc_msgSend(v55, "animatesDrop") ^ 1;
  else
    v22 = 1;
  if (objc_msgSend(v55, "canShowCallout") && objc_msgSend(v55, "clipsToBounds"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot show callout with clipsToBounds enabled"), v55);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = *MEMORY[0x1E0C99750];
    goto LABEL_54;
  }
  v23 = _MKLinkedOnOrAfterReleaseSet(1539);
  v24 = objc_msgSend(v55, "canShowCallout");
  if (!v23)
  {
    if (!v24)
      goto LABEL_34;
    objc_msgSend(v55, "annotation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
      goto LABEL_34;
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v55, "annotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ must implement title when canShowCallout is YES on corresponding view %@"), v29, v55);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_53:

    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = *MEMORY[0x1E0C99750];
    v49 = v30;
LABEL_54:
    objc_msgSend(v50, "exceptionWithName:reason:userInfo:", v51, v49, 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v54);
  }
  if (v24)
  {
    objc_msgSend(v55, "annotation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {

      goto LABEL_34;
    }
    objc_msgSend(v55, "detailCalloutAccessoryView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      goto LABEL_34;
    v52 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v55, "annotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "detailCalloutAccessoryView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringWithFormat:", CFSTR("%@ must implement title, or view %@ must have a non-nil detailCalloutAccessoryView when canShowCallout is YES on corresponding view %@"), v29, v53, v55);
    v30 = objc_claimAutoreleasedReturnValue();

    goto LABEL_53;
  }
LABEL_34:
  annotationViews = self->_annotationViews;
  if (!annotationViews)
  {
    v36 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 10);
    v37 = self->_annotationViews;
    self->_annotationViews = v36;

    annotationViews = self->_annotationViews;
  }
  -[NSMutableOrderedSet addObject:](annotationViews, "addObject:", v55);
  if (objc_msgSend((id)objc_opt_class(), "_isInitiallyHiddenWhenAdded"))
    objc_msgSend(v55, "_setHidden:forReason:animated:", 1, 1, 0);
  -[MKAnnotationContainerView addSubview:](self, "addSubview:", v55);
  objc_msgSend(v55, "clusteringIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    clusteringAnnotationViews = self->_clusteringAnnotationViews;
    if (!clusteringAnnotationViews)
    {
      v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v41 = self->_clusteringAnnotationViews;
      self->_clusteringAnnotationViews = v40;

      clusteringAnnotationViews = self->_clusteringAnnotationViews;
    }
    -[NSMutableDictionary objectForKey:](clusteringAnnotationViews, "objectForKey:", v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = v42;
      objc_msgSend(v42, "addObject:", v55);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v55);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_clusteringAnnotationViews, "setObject:forKey:", v43, v38);
    }

  }
  -[MKAnnotationContainerView _addPrioritiesForAnnotationViewIfNeeded:](self, "_addPrioritiesForAnnotationViewIfNeeded:", v55);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_CA_setDisableActions:", 1);

  -[MKAnnotationContainerView _updateAnnotationView:](self, "_updateAnnotationView:", v55);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_CA_setDisableActions:", 0);

  if (((!v4 | v22) & 1) == 0)
  {
    pinsToAnimate = self->_pinsToAnimate;
    if (!pinsToAnimate)
    {
      v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = self->_pinsToAnimate;
      self->_pinsToAnimate = v47;

      pinsToAnimate = self->_pinsToAnimate;
    }
    -[NSMutableArray addObject:](pinsToAnimate, "addObject:", v55);
  }

  v6 = v55;
LABEL_50:

}

- (id)annotationsInMapRect:(id)a3
{
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_annotationViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isProvidingCustomFeature", (_QWORD)v13))
        {
          objc_msgSend(v10, "coordinate");
          GEOMapPointForCoordinate();
          if (GEOMapRectContainsPoint())
          {
            objc_msgSend(v10, "customFeatureAnnotation");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_updateCollidableAnnotationViews
{
  NSMutableSet *collidableAnnotationViews;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *requiredPriorityAnnotationViews;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  MKAnnotationView *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  MKAnnotationView *v21;
  NSMutableDictionary *collidingAnnotationViews;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MKSpatialCollider *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  collidableAnnotationViews = self->_collidableAnnotationViews;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filteredSetUsingPredicate:](collidableAnnotationViews, "filteredSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_collidingAnnotationViews, "objectForKey:", CFSTR("_MK_COLLISSIONS_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[MKSpatialCollider initWithAnnotationViews:previousCollissions:options:]([MKSpatialCollider alloc], "initWithAnnotationViews:previousCollissions:options:", v5, v6, 3);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_48_1);
  if (objc_msgSend(v7, "count"))
  {
    v24 = v6;
    v25 = v5;
    requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_49_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filteredArrayUsingPredicate:](requiredPriorityAnnotationViews, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v26 = v10;
    v27 = v7;
    while (1)
    {
      if (!objc_msgSend(v7, "count") && v11 >= objc_msgSend(v10, "count"))
      {

        v6 = v24;
        v5 = v25;
        goto LABEL_26;
      }
      v12 = objc_msgSend(v10, "count");
      if (v11 < v12)
      {
        v13 = (MKAnnotationView *)objc_msgSend(v10, "objectAtIndex:", v11);
        v14 = v11 + 1;
      }
      else
      {
        v13 = (MKAnnotationView *)objc_msgSend(v7, "firstObject");
        v14 = v11;
      }
      -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:](v28, "viewsCollidingWithAnnotationView:inCollidableList:", v13, v11 >= v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
        break;
      v29 = v14;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(MKAnnotationView **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (v21 != v13)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_setHidden:forReason:animated:", 1, 5, 1);
              if (self->_selectedAnnotationView == v21)
                -[MKAnnotationContainerView deselectAnnotationView:animated:](self, "deselectAnnotationView:animated:", v21, 1);
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v18);
      }
      v7 = v27;
      objc_msgSend(v27, "removeObjectsInArray:", v16);
      v10 = v26;
      v14 = v29;
      if (v11 >= v12)
        goto LABEL_23;
LABEL_24:

      v11 = v14;
    }
    if (v11 < v12)
      goto LABEL_24;
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
LABEL_23:
    -[MKAnnotationView _setHidden:forReason:animated:](v13, "_setHidden:forReason:animated:", 0, 5, 1);
    goto LABEL_24;
  }
LABEL_26:
  collidingAnnotationViews = self->_collidingAnnotationViews;
  -[MKSpatialCollider registeredCollissions](v28, "registeredCollissions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](collidingAnnotationViews, "setObject:forKey:", v23, CFSTR("_MK_COLLISSIONS_"));

}

- (void)_updateAnnotationView:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationContainerView _updateAnnotationViews:](self, "_updateAnnotationViews:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_customFeatureDataSourceObservers, "removeObject:", a3);
}

- (MKAnnotationContainerView)initWithFrame:(CGRect)a3
{
  MKAnnotationContainerView *v3;
  NSMutableArray *v4;
  NSMutableArray *awaitingDropPins;
  MKPriorityToIndexMap *v6;
  void *v7;
  uint64_t v8;
  MKPriorityToIndexMap *priorityMap;
  NSMutableSet *v10;
  NSMutableSet *prioritiesToAdd;
  MKAnnotationContainerView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MKAnnotationContainerView;
  v3 = -[MKAnnotationContainerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    awaitingDropPins = v3->_awaitingDropPins;
    v3->_awaitingDropPins = v4;

    v6 = [MKPriorityToIndexMap alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E215A210, &unk_1E215A220, &unk_1E215A230, &unk_1E215A240, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MKPriorityToIndexMap initWithPriorities:](v6, "initWithPriorities:", v7);
    priorityMap = v3->_priorityMap;
    v3->_priorityMap = (MKPriorityToIndexMap *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    prioritiesToAdd = v3->_prioritiesToAdd;
    v3->_prioritiesToAdd = v10;

    -[MKAnnotationContainerView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("AnnotationContainer"));
    v12 = v3;
  }

  return v3;
}

- (void)annotationViewDidChangeZPriority:(id)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MKAnnotationContainerView _addPrioritiesForAnnotationViewIfNeeded:](self, "_addPrioritiesForAnnotationViewIfNeeded:");
  v5 = -[MKAnnotationContainerView _updatePriorityMapIfNeeded](self, "_updatePriorityMapIfNeeded");
  -[MKAnnotationContainerView bounds](self, "bounds");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v10, v11, v12, v13);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
  else
  {
    -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", a3, v6, v7, v8, v9);
  }
}

- (void)invalidateCustomFeatureDataSource
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
  double v12;
  double v13;
  double v14;
  double v15;

  -[UIView _mapKit_mapView](self, "_mapKit_mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleMapRect");
  -[MKAnnotationContainerView _mapRectWithFraction:ofVisible:](self, "_mapRectWithFraction:ofVisible:", 3.0, v4, v5, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[MKAnnotationContainerView invalidateCustomFeatureDataSourceRect:](self, "invalidateCustomFeatureDataSourceRect:", v9, v11, v13, v15);
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapRect v15;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v6 = INFINITY;
  if (a4.var0.var0 == INFINITY && a4.var0.var1 == INFINITY)
  {
    v10 = INFINITY;
  }
  else
  {
    v8 = -(a4.var1.var1 * a3);
    v9 = -(var0 * a3);
    v10 = a4.var0.var0 + v9;
    v6 = a4.var0.var1 + v8;
    var0 = var0 - v9 * 2.0;
    var1 = a4.var1.var1 - v8 * 2.0;
  }
  v15.size.width = 268435456.0;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.height = 268435456.0;
  v11 = v10;
  v12 = var0;
  result = ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(v15, *(MKMapRect *)(&v6 - 1));
  v13 = v10;
  v14 = var0;
  result.var1.var0 = v14;
  result.var0.var0 = v13;
  return result;
}

- (void)setUserLocationView:(id)a3
{
  MKAnnotationView *v5;
  MKAnnotationView **p_userLocationView;
  MKAnnotationView *userLocationView;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (MKAnnotationView *)a3;
  p_userLocationView = &self->_userLocationView;
  userLocationView = self->_userLocationView;
  if (userLocationView != v5)
  {
    if (userLocationView)
      -[MKAnnotationView _setPresentationCoordinateChangedCallback:](userLocationView, "_setPresentationCoordinateChangedCallback:", 0);
    objc_storeStrong((id *)&self->_userLocationView, a3);
    if (*p_userLocationView)
    {
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__MKAnnotationContainerView_setUserLocationView___block_invoke;
      v8[3] = &unk_1E20D8A58;
      objc_copyWeak(&v9, &location);
      -[MKAnnotationView _setPresentationCoordinateChangedCallback:](*p_userLocationView, "_setPresentationCoordinateChangedCallback:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

- (void)invalidateCustomFeatureDataSourceRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_customFeatureDataSourceObservers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dataSource:featuresDidChangeForRect:", self, v6, v5, var0, var1, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateAnnotationViewsWithDelay, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performStateUpdatesIfNeeded, 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MKAnnotationContainerView annotationViews](self, "annotationViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "_setDelegate:", 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[MKAnnotationContainerView setUserLocationView:](self, "setUserLocationView:", 0);
  v10.receiver = self;
  v10.super_class = (Class)MKAnnotationContainerView;
  -[MKAnnotationContainerView dealloc](&v10, sel_dealloc);
}

- (MKAnnotationContainerViewDelegate)delegate
{
  return (MKAnnotationContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapDisplayStyle:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((((*(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32)) ^ *(_QWORD *)&a3.var0) & 0x1FFFFFFFFFFLL) != 0)
  {
    v3 = *(_QWORD *)&a3.var0;
    self->_mapDisplayStyle = ($4CDE9EFBD0E8DAF50B82D23E2BCF9383)a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = v3 & 0xFFFFFFFFFFFFLL;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_setMapDisplayStyle:", v7);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)calloutContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  MKAnnotationContainerView *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[MKAnnotationView _calloutView](self->_selectedAnnotationView, "_calloutView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[MKAnnotationContainerView _view:containsPoint:](v5, "_view:containsPoint:", v6, x, y);

  return (char)v5;
}

- (BOOL)accessoryContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  MKAnnotationContainerView *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[MKAnnotationView _selectionAccessoryView](self->_selectedAnnotationView, "_selectionAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[MKAnnotationContainerView _view:containsPoint:](v5, "_view:containsPoint:", v6, x, y);

  return (char)v5;
}

- (BOOL)_view:(id)a3 containsPoint:(CGPoint)a4
{
  double y;
  double x;
  MKAnnotationView *selectedAnnotationView;
  id v8;
  void *v9;

  if (!a3)
    return 0;
  y = a4.y;
  x = a4.x;
  selectedAnnotationView = self->_selectedAnnotationView;
  v8 = a3;
  -[MKAnnotationContainerView convertPoint:toView:](self, "convertPoint:toView:", selectedAnnotationView, x, y);
  -[MKAnnotationView hitTest:withEvent:](self->_selectedAnnotationView, "hitTest:withEvent:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(selectedAnnotationView) = objc_msgSend(v9, "isDescendantOfView:", v8);

  return (char)selectedAnnotationView;
}

- (CGRect)_visibleCenteringRect
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "visibleCenteringRectInView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_visibleCenteringRectInView:(id)a3
{
  MKAnnotationContainerViewDelegate **p_delegate;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "visibleCenteringRectInView:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_visibleRect
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "visibleRectInView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (MKPinAnnotationView)bubblePin
{
  MKAnnotationView *selectedAnnotationView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    selectedAnnotationView = self->_selectedAnnotationView;
  else
    selectedAnnotationView = 0;
  return (MKPinAnnotationView *)selectedAnnotationView;
}

- (void)removeAnnotationViewsRotationAnimations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeAnimationForKey:", 0x1E20E65C0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setSuppressCallout:(BOOL)a3
{
  if (self->_suppressCallout != a3)
  {
    self->_suppressCallout = a3;
    -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self->_selectedAnnotationView, "updateCalloutViewIfNeededAnimated:", 1);
  }
}

- (void)updateCalloutStateForSelectedAnnotationView:(id)a3
{
  MKAnnotationView *v4;
  MKAnnotationView *v5;

  v4 = (MKAnnotationView *)a3;
  if (!self->_suppressCallout && self->_selectedAnnotationView == v4)
  {
    v5 = v4;
    -[MKAnnotationView updateCalloutViewIfNeededAnimated:](v4, "updateCalloutViewIfNeededAnimated:", 1);
    v4 = v5;
  }

}

- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotationView *v6;
  MKAnnotationView *annotationViewToSelect;
  MKAnnotationView *v8;
  BOOL v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  MKAnnotationView *v14;
  MKAnnotationView *selectedAnnotationView;
  MKAnnotationView *v16;

  v4 = a4;
  v6 = (MKAnnotationView *)a3;
  if (!v6)
  {
    selectedAnnotationView = self->_selectedAnnotationView;
    if (!selectedAnnotationView)
      goto LABEL_13;
    v16 = 0;
    -[MKAnnotationContainerView deselectAnnotationView:animated:](self, "deselectAnnotationView:animated:", selectedAnnotationView, v4);
LABEL_12:
    v6 = v16;
    goto LABEL_13;
  }
  annotationViewToSelect = self->_annotationViewToSelect;
  self->_annotationViewToSelect = 0;
  v16 = v6;

  v6 = v16;
  v8 = self->_selectedAnnotationView;
  if (v8)
    v9 = v8 == v16;
  else
    v9 = 0;
  if (v9)
  {
    -[MKAnnotationView _setSelected:animated:](v16, "_setSelected:animated:", 0, v4);
    -[MKAnnotationView annotation](v16, "annotation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIView _mapKit_mapView](self, "_mapKit_mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAnnotationView annotation](v16, "annotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAnnotation:", v13);

    }
    v14 = self->_selectedAnnotationView;
    self->_selectedAnnotationView = 0;

    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __77__MKAnnotationContainerView__updateAnnotationViewsForReason_updatePositions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateClusterableAnnotationViews:withID:", a3, a2);
}

- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CLLocationCoordinate2D result;

  objc_msgSend(a3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "position");
  v6 = v5;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateFromView:", self, v6, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.longitude = v15;
  result.latitude = v14;
  return result;
}

- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "convertCoordinate:toPointToView:", self, latitude, longitude);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)updateUserLocationView
{
  if (self->_userLocationView)
    -[MKAnnotationContainerView _updateAnnotationView:](self, "_updateAnnotationView:");
}

- (id)_annotationViewForSelectionAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4 maxDistance:(double)a5
{
  _BOOL4 v6;
  CGFloat y;
  CGFloat x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  MKAnnotationView *v13;
  uint64_t v14;
  double v15;
  float v16;
  uint64_t i;
  MKAnnotationView *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v32;
  MKAnnotationView *v33;
  float v34;
  MKAnnotationView *selectedAnnotationView;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  v47 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[MKAnnotationContainerView annotationViews](self, "annotationViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v11)
  {

    if (!v6)
    {
LABEL_29:
      v13 = 0;
      return v13;
    }
LABEL_27:
    selectedAnnotationView = self->_selectedAnnotationView;
    if (selectedAnnotationView)
    {
      -[MKAnnotationView frame](selectedAnnotationView, "frame");
      MKDistanceBetweenPointAndRect(x, y, v36, v37, v38, v39);
      if (v40 <= a5)
      {
        v13 = self->_selectedAnnotationView;
        return v13;
      }
    }
    goto LABEL_29;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v43;
  v15 = 0.0;
  v16 = 1000.0;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v43 != v14)
        objc_enumerationMutation(v10);
      v18 = *(MKAnnotationView **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (-[MKAnnotationView _isSelectable](v18, "_isSelectable")
        && !-[MKAnnotationView isHidden](v18, "isHidden")
        && (!v6 || self->_selectedAnnotationView != v18))
      {
        -[MKAnnotationView _significantBounds](v18, "_significantBounds");
        -[MKAnnotationContainerView convertRect:fromView:](self, "convertRect:fromView:", v18);
        MKDistanceBetweenPointAndRect(x, y, v19, v20, v21, v22);
        if (v23 <= a5)
        {
          v24 = v23;
          if (!v13)
            goto LABEL_20;
          -[MKAnnotationView _selectionPriority](v13, "_selectionPriority");
          v26 = v25;
          -[MKAnnotationView _selectionPriority](v18, "_selectionPriority");
          if (v26 <= v27)
          {
            -[MKAnnotationView _selectionPriority](v13, "_selectionPriority");
            v29 = v28;
            -[MKAnnotationView _selectionPriority](v18, "_selectionPriority");
            if (vabds_f32(v29, v30) >= 0.000001 || v24 <= v15)
            {
              if (vabdd_f64(v15, v24) >= 0.000001 || (-[MKAnnotationView zPriority](v18, "zPriority"), v16 <= v32))
              {
LABEL_20:
                v33 = v18;

                -[MKAnnotationView zPriority](v33, "zPriority");
                v16 = v34;
                v15 = v24;
                v13 = v33;
              }
            }
          }
        }
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v12);

  if (!v13 && v6)
    goto LABEL_27;
  return v13;
}

- (id)annotationViewForPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 0, a3.x, a3.y, 10.0);
}

- (void)_liftForDragging:(id)a3 mouseDownPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  float v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  self->_clickedOnAnnotationView = 1;
  self->_mouseDownPoint.x = x;
  self->_mouseDownPoint.y = y;
  objc_storeStrong((id *)&self->_draggingAnnotationView, a3);
  self->_didDragAnnotationView = 0;
  objc_msgSend(v12, "setDragState:animated:", 1, 1);
  objc_msgSend(v12, "center");
  self->_draggingAnnotationViewCenter.x = v8;
  self->_draggingAnnotationViewCenter.y = v9;
  objc_msgSend(v12, "displayPriority");
  if (v10 < 1000.0
    || (objc_msgSend(v12, "clusteringIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
  }

}

- (void)_draggingAnnotationViewDidPause:(id)a3
{
  -[MKAnnotationView _didDragWithVelocity:](self->_draggingAnnotationView, "_didDragWithVelocity:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  self->_previousMouseDragTimeStamp = 0.0;
}

- (void)draggingTouchMovedToPoint:(CGPoint)a3 edgeInsets:(UIEdgeInsets)a4
{
  MKAnnotationView *draggingAnnotationView;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double previousMouseDragTimeStamp;

  draggingAnnotationView = self->_draggingAnnotationView;
  if (draggingAnnotationView)
  {
    y = a3.y;
    x = a3.x;
    if (-[MKAnnotationView dragState](draggingAnnotationView, "dragState", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right) == MKAnnotationViewDragStateDragging|| -[MKAnnotationView dragState](self->_draggingAnnotationView, "dragState") == MKAnnotationViewDragStateStarting)
    {
      v8 = x - self->_mouseDownPoint.x;
      v9 = y - self->_mouseDownPoint.y;
      if (v8 != 0.0 || v9 != 0.0)
      {
        self->_didDragAnnotationView = 1;
        -[MKAnnotationView setCenter:](self->_draggingAnnotationView, "setCenter:", v8 + self->_draggingAnnotationViewCenter.x, v9 + self->_draggingAnnotationViewCenter.y);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v11 = v10;
        previousMouseDragTimeStamp = self->_previousMouseDragTimeStamp;
        if (previousMouseDragTimeStamp > 0.0)
        {
          -[MKAnnotationView _didDragWithVelocity:](self->_draggingAnnotationView, "_didDragWithVelocity:", (x - self->_previousMouseDragPoint.x) / (v11 - previousMouseDragTimeStamp), (y - self->_previousMouseDragPoint.y) / (v11 - previousMouseDragTimeStamp));
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__draggingAnnotationViewDidPause_, self->_draggingAnnotationView);
          -[MKAnnotationContainerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__draggingAnnotationViewDidPause_, self->_draggingAnnotationView, 0.2);
        }
        self->_previousMouseDragTimeStamp = v11;
        self->_previousMouseDragPoint.x = x;
        self->_previousMouseDragPoint.y = y;
      }
    }
  }
}

- (CGPoint)draggingAnnotationViewDropPoint
{
  _BOOL4 didDragAnnotationView;
  MKAnnotationView *draggingAnnotationView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  didDragAnnotationView = self->_didDragAnnotationView;
  draggingAnnotationView = self->_draggingAnnotationView;
  if (didDragAnnotationView)
  {
    -[MKAnnotationView center](draggingAnnotationView, "center");
    v6 = v5;
    v8 = v7;
    -[MKAnnotationView _draggingDropOffset](self->_draggingAnnotationView, "_draggingDropOffset");
    v10 = v6 - v9;
    v12 = v8 - v11;
  }
  else
  {
    -[MKAnnotationView coordinate](draggingAnnotationView, "coordinate");
    v14 = v13;
    v16 = v15;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "convertCoordinate:toPointToView:", self, v14, v16);
    v10 = v18;
    v12 = v19;

  }
  v20 = v10;
  v21 = v12;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)draggingAnnotationViewDropPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[MKAnnotationView centerOffset](self->_draggingAnnotationView, "centerOffset");
  v6 = x - v5;
  v8 = y - v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (void)_dropDraggingAnnotationViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  MKAnnotationView *draggingAnnotationView;
  MKAnnotationView *v17;
  char isKindOfClass;
  MKAnnotationView *annotationViewToSelect;
  float v20;
  void *v21;
  MKAnnotationView *v22;
  CLLocationCoordinate2D v23;

  v3 = a3;
  if (self->_didDragAnnotationView)
  {
    -[MKAnnotationContainerView draggingAnnotationViewDropPoint](self, "draggingAnnotationViewDropPoint");
    v6 = v5;
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "convertPoint:toCoordinateFromView:", self, v6, v8);
    v11 = v10;
    v13 = v12;

    v23.latitude = v11;
    v23.longitude = v13;
    if (CLLocationCoordinate2DIsValid(v23))
    {
      -[MKAnnotationView annotation](self->_draggingAnnotationView, "annotation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCoordinate:", v11, v13);

    }
    v15 = 4;
  }
  else
  {
    v15 = 3;
  }
  -[MKAnnotationView setDragState:animated:](self->_draggingAnnotationView, "setDragState:animated:", v15, v3);
  if (_MKLinkedOnOrAfterReleaseSet(2053)
    && (!_MKLinkedOnOrAfterReleaseSet(2310)
     || !-[NSObject _mapkit_implementationOfSelector:isFromSubclassOfClass:](self->_draggingAnnotationView, "_mapkit_implementationOfSelector:isFromSubclassOfClass:", sel_setDragState_animated_, objc_opt_class())))
  {
    -[MKAnnotationView setDragState:animated:](self->_draggingAnnotationView, "setDragState:animated:", 0, v3);
  }
  v22 = self->_draggingAnnotationView;
  draggingAnnotationView = self->_draggingAnnotationView;
  self->_draggingAnnotationView = 0;

  v17 = v22;
  if (self->_annotationViewToSelect == v22)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v17 = v22;
    if ((isKindOfClass & 1) == 0)
    {
      -[MKAnnotationContainerView selectAnnotationView:animated:](self, "selectAnnotationView:animated:", self->_annotationViewToSelect, v3);
      annotationViewToSelect = self->_annotationViewToSelect;
      self->_annotationViewToSelect = 0;

      v17 = v22;
    }
  }
  -[MKAnnotationView displayPriority](v17, "displayPriority");
  if (v20 < 1000.0
    || (-[MKAnnotationView clusteringIdentifier](v22, "clusteringIdentifier"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
  }

}

- (void)pinDidDrop:(id)a3 animated:(BOOL)a4
{
  uint64_t v5;
  NSMutableArray *awaitingDropPins;
  id WeakRetained;
  MKAnnotationView *annotationViewToSelect;
  MKAnnotationView *v9;

  v5 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_awaitingDropPins, "indexOfObjectIdenticalTo:", a3, a4);
  awaitingDropPins = self->_awaitingDropPins;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[NSMutableArray count](awaitingDropPins, "count"))
      return;
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](awaitingDropPins, "removeObjectAtIndex:");
    if (-[NSMutableArray count](self->_awaitingDropPins, "count"))
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "annotationContainerDidDropPins:", self);

  }
  annotationViewToSelect = self->_annotationViewToSelect;
  if (annotationViewToSelect)
  {
    self->_annotationViewToSelect = 0;
    v9 = annotationViewToSelect;

    -[MKAnnotationContainerView selectAnnotationView:animated:](self, "selectAnnotationView:animated:", v9, 1);
  }
}

- (UIEdgeInsets)accessoryPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  +[MKPinAnnotationView _perceivedSize](MKPinAnnotationView, "_perceivedSize");
  v3 = v2;
  v5 = v4 + v4;
  v6 = v2 + 50.0;
  v7 = v5;
  result.right = v5;
  result.bottom = v3;
  result.left = v7;
  result.top = v6;
  return result;
}

- (BOOL)hasDroppingPins
{
  return -[NSMutableArray count](self->_awaitingDropPins, "count") != 0;
}

- (BOOL)hasPendingAnimations
{
  void *v2;
  void *v3;
  BOOL v5;
  void *v6;
  MKAnnotationView *draggingAnnotationView;

  if (!-[MKAnnotationContainerView hasDroppingPins](self, "hasDroppingPins"))
  {
    -[MKAnnotationContainerView bubblePin](self, "bubblePin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (-[MKAnnotationContainerView bubblePin](self, "bubblePin"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "superview"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      draggingAnnotationView = self->_draggingAnnotationView;
      v5 = draggingAnnotationView != 0;
      if (draggingAnnotationView
        && -[MKAnnotationView dragState](draggingAnnotationView, "dragState") != MKAnnotationViewDragStateStarting)
      {
        v5 = -[MKAnnotationView dragState](self->_draggingAnnotationView, "dragState") == MKAnnotationViewDragStateEnding;
      }
      if (!v6)
        goto LABEL_11;
    }
    else
    {
      v5 = 1;
    }

LABEL_11:
    return v5;
  }
  return 1;
}

void __49__MKAnnotationContainerView_setUserLocationView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateUserLocationView");

}

- (void)_willRemoveInternalAnnotationView:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v5;
    objc_msgSend(v4, "_setDelegate:", 0);
    objc_msgSend(v4, "_stopDrop");
    -[NSMutableArray removeObjectIdenticalTo:](self->_awaitingDropPins, "removeObjectIdenticalTo:", v4);

  }
}

- (void)removeAnnotationView:(id)a3
{
  MKAnnotationView *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[3];

  v4 = (MKAnnotationView *)a3;
  if (-[NSObject _mapkit_isInternalAnnotationView](v4, "_mapkit_isInternalAnnotationView"))
    -[MKAnnotationContainerView _willRemoveInternalAnnotationView:](self, "_willRemoveInternalAnnotationView:", v4);
  if (self->_annotationViewToSelect == v4)
  {
    self->_annotationViewToSelect = 0;

  }
  -[MKAnnotationView clusteringIdentifier](v4, "clusteringIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MKAnnotationView annotation](v4, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isMKClusterAnnotation");

    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_existingClusterAnnotationViews, "objectForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v4);
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_clusterableAnnotationViews, "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v4);

      -[MKAnnotationView clusterAnnotationView](v4, "clusterAnnotationView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[MKAnnotationContainerView delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "annotationContainer:requestRemovingClusterAnnotationView:updateVisible:", self, v8, 1);

      }
    }

  }
  -[MKAnnotationView displayPriority](v4, "displayPriority");
  if (v11 >= 1000.0)
  {
    -[NSMutableArray removeObject:](self->_requiredPriorityAnnotationViews, "removeObject:", v4);
  }
  else
  {
    -[NSMutableSet removeObject:](self->_collidableAnnotationViews, "removeObject:", v4);
    -[NSMutableDictionary removeAllObjects](self->_collidingAnnotationViews, "removeAllObjects");
  }
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_CA_setDisableActions:", 1);

  -[MKAnnotationView layer](v4, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v20[0] = *MEMORY[0x1E0C9BAA8];
  v20[1] = v14;
  v20[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v13, "setAffineTransform:", v20);

  -[MKAnnotationView layer](v4, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAnimationForKey:", 0x1E20E65C0);

  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_CA_setDisableActions:", 0);

  -[MKAnnotationView removeFromSuperview](v4, "removeFromSuperview");
  if (self->_selectedAnnotationView == v4)
    -[MKAnnotationContainerView deselectAnnotationView:animated:](self, "deselectAnnotationView:animated:", v4, 0);
  -[NSMutableOrderedSet removeObject:](self->_annotationViews, "removeObject:", v4);
  -[NSMutableArray removeObject:](self->_pinsToAnimate, "removeObject:", v4);
  -[MKAnnotationView clusteringIdentifier](v4, "clusteringIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[NSMutableDictionary objectForKey:](self->_clusteringAnnotationViews, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "removeObject:", v4);

  }
}

- (void)selectAnnotationView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotationView *annotationViewToSelect;
  _BOOL4 v8;
  MKAnnotationView *v9;
  MKAnnotationView *selectedAnnotationView;
  BOOL v11;
  MKAnnotationView *v12;

  v4 = a4;
  v12 = (MKAnnotationView *)a3;
  annotationViewToSelect = self->_annotationViewToSelect;
  self->_annotationViewToSelect = 0;

  v8 = -[MKAnnotationView _isSelectable](v12, "_isSelectable");
  v9 = v12;
  if (v8)
  {
    if (-[MKAnnotationContainerView hasPendingAnimations](self, "hasPendingAnimations") && v4)
    {
      objc_storeStrong((id *)&self->_annotationViewToSelect, a3);
LABEL_9:
      v9 = v12;
      goto LABEL_10;
    }
    selectedAnnotationView = self->_selectedAnnotationView;
    if (selectedAnnotationView != v12)
    {
LABEL_8:
      -[MKAnnotationView setHighlighted:](selectedAnnotationView, "setHighlighted:", 0);
      -[MKAnnotationView setHighlighted:](v12, "setHighlighted:", 0);
      -[MKAnnotationView _setSelected:animated:](v12, "_setSelected:animated:", 1, v4);
      objc_storeStrong((id *)&self->_selectedAnnotationView, a3);
      -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
      goto LABEL_9;
    }
    v11 = -[MKAnnotationView isSelected](v12, "isSelected");
    v9 = v12;
    if (!v11)
    {
      selectedAnnotationView = self->_selectedAnnotationView;
      goto LABEL_8;
    }
  }
LABEL_10:

}

- ($52AE83AFA48F224E1564B783D639217F)currentComparisonContext
{
  MKAnnotationContainerView *v3;
  void *v5;
  id WeakRetained;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGPoint v20;
  $52AE83AFA48F224E1564B783D639217F *result;
  void *v22;

  v3 = self;
  *(_QWORD *)&retstr->var5 = 0;
  *(_OWORD *)&retstr->var2.y = 0u;
  *(_OWORD *)&retstr->var3.y = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.longitude = 0u;
  -[MKAnnotationContainerView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v22 = v5,
        WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate),
        v7 = objc_msgSend(WeakRetained, "annotationContainerIsRotated:", v3),
        WeakRetained,
        v5 = v22,
        (v7 & 1) != 0))
  {
    objc_msgSend(v22, "bounds");
    v10 = v8 + v9;
    v13 = v11 + v12;
    -[MKAnnotationContainerView convertPoint:fromView:](v3, "convertPoint:fromView:", v22);
    v15 = v14;
    v17 = v16;
    -[MKAnnotationContainerView convertPoint:fromView:](v3, "convertPoint:fromView:", v22, v13, v10);
    v5 = v22;
    retstr->var0 = 3;
    retstr->var1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    retstr->var2.x = v15;
    retstr->var2.y = v17;
    retstr->var3.x = v18;
    retstr->var3.y = v19;
  }
  else
  {
    v3 = 0;
    retstr->var0 = 0;
    retstr->var1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    v20 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->var2 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->var3 = v20;
  }
  retstr->var4 = v3;
  retstr->var5 = 1;

  return result;
}

- (void)annotationViewDidChangeMetrics:(id)a3
{
  -[MKAnnotationContainerView _updateAnnotationView:](self, "_updateAnnotationView:", a3);
  -[MKAnnotationContainerView _updateAnnotationViewsForReason:updatePositions:](self, "_updateAnnotationViewsForReason:updatePositions:", 3, 0);
}

- (void)annotationViewDidChangeDisplayPriority:(id)a3
{
  NSMutableArray *requiredPriorityAnnotationViews;
  float v6;

  objc_msgSend(a3, "displayPriority");
  requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
  if (v6 == 1000.0)
  {
    -[NSMutableArray addObject:](requiredPriorityAnnotationViews, "addObject:", a3);
    -[NSMutableSet removeObject:](self->_collidableAnnotationViews, "removeObject:", a3);
    if (objc_msgSend(a3, "_isHiddenForReason:", 5))
      objc_msgSend(a3, "_setHidden:forReason:animated:", 0, 5, 1);
  }
  else
  {
    -[NSMutableArray removeObject:](requiredPriorityAnnotationViews, "removeObject:", a3);
    -[NSMutableSet addObject:](self->_collidableAnnotationViews, "addObject:", a3);
  }
  -[MKAnnotationContainerView updateAnnotationViewsForReason:](self, "updateAnnotationViewsForReason:", 0);
}

- (void)transitionTo:(int64_t)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = self->_annotationViews;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_transitionTo:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  MKAnnotationView *selectedAnnotationView;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  selectedAnnotationView = self->_selectedAnnotationView;
  if (!selectedAnnotationView
    || (-[MKAnnotationContainerView convertPoint:toView:](self, "convertPoint:toView:", self->_selectedAnnotationView, x, y), -[MKAnnotationView hitTest:withEvent:](selectedAnnotationView, "hitTest:withEvent:", v7), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)MKAnnotationContainerView;
    -[MKAnnotationContainerView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_existingClusterViewsForClusterID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *existingClusterAnnotationViews;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_existingClusterAnnotationViews, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    existingClusterAnnotationViews = self->_existingClusterAnnotationViews;
    if (!existingClusterAnnotationViews)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_existingClusterAnnotationViews;
      self->_existingClusterAnnotationViews = v7;

      existingClusterAnnotationViews = self->_existingClusterAnnotationViews;
    }
    -[NSMutableDictionary setObject:forKey:](existingClusterAnnotationViews, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_updateClusterableAnnotationViews:(id)a3 withID:(id)a4
{
  MKSpatialCollider *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v11;
  id WeakRetained;
  void *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  MKAnnotationView *v19;
  void *v20;
  BOOL v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t j;
  void *v29;
  _BOOL8 v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  MKAnnotationView *v35;
  id v36;
  NSMutableDictionary *collidingAnnotationViews;
  void *v38;
  void *v39;
  void *v40;
  MKSpatialCollider *v42;
  id obj;
  MKSpatialCollider *obja;
  _QWORD v45[4];
  id v46;
  id v47;
  id from;
  id location;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v65 = *MEMORY[0x1E0C80C00];
  -[MKAnnotationContainerView _existingClusterViewsForClusterID:](self, "_existingClusterViewsForClusterID:", a4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_collidingAnnotationViews, "objectForKey:", a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKSpatialCollider initWithAnnotationViews:previousCollissions:options:]([MKSpatialCollider alloc], "initWithAnnotationViews:previousCollissions:options:", a3, v40, 1);
  -[MKAnnotationContainerView bounds](self, "bounds");
  v67 = CGRectInset(v66, -100.0, -100.0);
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  v42 = v6;
  if (-[MKSpatialCollider viewCount](v6, "viewCount"))
  {
    v11 = 0;
    do
    {
      -[MKSpatialCollider viewsCollidingWithAnnotationViewAtIndex:](v42, "viewsCollidingWithAnnotationViewAtIndex:", v11);
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (obj)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "annotationContainer:requestAddingClusterForAnnotationViews:", self, obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setClusteringIdentifier:", a4);
        v14 = -[MKSpatialCollider insertAnnotationView:](v42, "insertAnnotationView:", v13);
        if (v11 >= v14)
          v11 = v14;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v15 = obj;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v59 != v17)
                objc_enumerationMutation(v15);
              v19 = *(MKAnnotationView **)(*((_QWORD *)&v58 + 1) + 8 * i);
              -[MKAnnotationView clusterAnnotationView](v19, "clusterAnnotationView");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20 == v13;

              if (!v21)
              {
                -[MKAnnotationView frame](v19, "frame");
                v71.origin.x = x;
                v71.origin.y = y;
                v71.size.width = width;
                v71.size.height = height;
                v22 = CGRectIntersectsRect(v68, v71);
                -[MKAnnotationView setClusterAnnotationView:](v19, "setClusterAnnotationView:", v13);
                -[MKAnnotationView _setHidden:forReason:animated:](v19, "_setHidden:forReason:animated:", 1, 4, v22);
                -[MKAnnotationView _offsetToAnnotationView:](v19, "_offsetToAnnotationView:", v13);
                -[MKAnnotationView _setPositionOffset:animated:](v19, "_setPositionOffset:animated:", v22);
                if (self->_selectedAnnotationView == v19)
                  -[MKAnnotationContainerView deselectAnnotationView:animated:](self, "deselectAnnotationView:animated:", v19, v22);
              }
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
          }
          while (v16);
        }

      }
      else
      {
        ++v11;
      }

    }
    while (v11 < -[MKSpatialCollider viewCount](v42, "viewCount"));
  }
  v23 = (void *)objc_msgSend(v39, "mutableCopy");

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obja = v42;
  v24 = -[MKSpatialCollider countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v55;
    v26 = *MEMORY[0x1E0C9D538];
    v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v23, "removeObject:", v29);
        objc_msgSend(v29, "setClusterAnnotationView:", 0);
        if (objc_msgSend(v29, "_isHiddenForReason:", 4))
        {
          objc_msgSend(v29, "frame");
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          v30 = CGRectIntersectsRect(v69, v72);
          objc_msgSend(v29, "_setHidden:forReason:animated:", 0, 4, v30);
          objc_msgSend(v29, "_setPositionOffset:animated:", v30, v26, v27);
        }
      }
      v24 = -[MKSpatialCollider countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v24);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v31 = v23;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(v31);
        v35 = *(MKAnnotationView **)(*((_QWORD *)&v50 + 1) + 8 * k);
        -[MKAnnotationView frame](v35, "frame");
        v73.origin.x = x;
        v73.origin.y = y;
        v73.size.width = width;
        v73.size.height = height;
        if (CGRectIntersectsRect(v70, v73))
        {
          objc_initWeak(&location, v35);
          objc_initWeak(&from, self);
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __70__MKAnnotationContainerView__updateClusterableAnnotationViews_withID___block_invoke;
          v45[3] = &unk_1E20DEF88;
          objc_copyWeak(&v46, &from);
          objc_copyWeak(&v47, &location);
          -[MKAnnotationView _setHidden:forReason:animated:completion:](v35, "_setHidden:forReason:animated:completion:", 1, 4, 1, v45);
          if (self->_selectedAnnotationView == v35)
            -[MKAnnotationContainerView deselectAnnotationView:animated:](self, "deselectAnnotationView:animated:", v35, 1);
          objc_destroyWeak(&v47);
          objc_destroyWeak(&v46);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }
        else
        {
          v36 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v36, "annotationContainer:requestRemovingClusterAnnotationView:updateVisible:", self, v35, 0);

        }
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v32);
  }

  collidingAnnotationViews = self->_collidingAnnotationViews;
  -[MKSpatialCollider registeredCollissions](obja, "registeredCollissions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](collidingAnnotationViews, "setObject:forKey:", v38, a4);

}

void __70__MKAnnotationContainerView__updateClusterableAnnotationViews_withID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 58);
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "annotationContainer:requestRemovingClusterAnnotationView:updateVisible:", v5, v4, 0);

    WeakRetained = v5;
  }

}

uint64_t __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke(uint64_t a1, _QWORD *a2)
{
  if (a2[89] == 2)
    return 0;
  else
    return objc_msgSend(a2, "_isHiddenForReason:", 4) ^ 1;
}

uint64_t __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForCollision:");
}

uint64_t __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke_3(uint64_t a1, _QWORD *a2)
{
  if (a2[89] == 2 || (objc_msgSend(a2, "_isHiddenForReason:", 4) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a2, "_isHiddenForReason:", 0) ^ 1;
}

- (BOOL)suppressCallout
{
  return self->_suppressCallout;
}

- (MKAnnotationView)draggingAnnotationView
{
  return self->_draggingAnnotationView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesToAdd, 0);
  objc_storeStrong((id *)&self->_priorityMap, 0);
  objc_storeStrong((id *)&self->_existingClusterAnnotationViews, 0);
  objc_storeStrong((id *)&self->_collidingAnnotationViews, 0);
  objc_storeStrong((id *)&self->_collidableAnnotationViews, 0);
  objc_storeStrong((id *)&self->_requiredPriorityAnnotationViews, 0);
  objc_storeStrong((id *)&self->_clusterableAnnotationViews, 0);
  objc_storeStrong((id *)&self->_pinsToAnimate, 0);
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_draggingAnnotationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationViewToSelect, 0);
  objc_storeStrong((id *)&self->_selectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_awaitingDropPins, 0);
  objc_storeStrong((id *)&self->_customFeatureDataSourceObservers, 0);
  objc_storeStrong((id *)&self->_clusteringAnnotationViews, 0);
  objc_storeStrong((id *)&self->_annotationViews, 0);
}

- (id)clusterStyleAttributes
{
  return 0;
}

- (id)globalAnnotations
{
  return 0;
}

@end
