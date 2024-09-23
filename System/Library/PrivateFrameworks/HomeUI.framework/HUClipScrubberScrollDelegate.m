@implementation HUClipScrubberScrollDelegate

- (HUClipScrubberScrollDelegate)initWithDataSource:(id)a3
{
  id v4;
  HUClipScrubberScrollDelegate *v5;
  HUClipScrubberScrollDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUClipScrubberScrollDelegate;
  v5 = -[HUClipScrubberScrollDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)updatePlaybackEngineDate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "currentTimelineState") == 5)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentTimelineState");

  if (v6 != 6)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "currentTimelineState");
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimelineState:", v8);

    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentTimelineState");

    if (!v18 || v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPlaybackPosition:", v4);
    }
    else
    {
      objc_opt_class();
      -[HUClipScrubberScrollDelegate currentEvent](self, "currentEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timelapseClipPositionForDate:inHighQualityClip:scrubbingType:", v18, v14, -[HUClipScrubberScrollDelegate isScrollingForward](self, "isScrollingForward") ^ 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShouldBypassHighQualityScrubbing:", v4 != 0);

      -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updatePlaybackPositionToDate:usingClip:", v18, v14);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)setUserScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_userScrubbing != a3)
  {
    v3 = a3;
    self->_userScrubbing = a3;
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v3)
    {
      objc_msgSend(v5, "beginScrubbing");
    }
    else
    {
      objc_msgSend(v5, "endScrubbing");

      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUClipScrubberScrollDelegate updatePlaybackEngineDate:](self, "updatePlaybackEngineDate:", v6);

    }
  }
}

- (BOOL)_doesPrecedingSpacerSpanMultipleDaysForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFirstEventOfTheDay:", v4))
  {
    objc_msgSend(v4, "dateOfOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hf_isMidnight") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (a5)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(a3, "bounds");
    v5 = v7 * 0.5;
    v6 = 0.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  CGSize result;

  v7 = a3;
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "mostRecentClipIndex") + 1 != a5)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEditing") & 1) != 0)
    {
      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "mostRecentClipIndex");

      if (v14 == a5)
        goto LABEL_3;
    }
    else
    {

    }
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEditing") & 1) != 0)
    {
      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mostRecentClipIndex");

      if (v17 == a5)
        goto LABEL_3;
    }
    else
    {

    }
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_13;
  }

LABEL_3:
  objc_msgSend(v7, "bounds");
  v10 = v9 * 0.5;
  v11 = 0.0;
LABEL_13:

  v18 = v10;
  v19 = v11;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v6 = a5;
  v7 = objc_msgSend(v6, "section");
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = 30.0;
  if (v7 != v10)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "eventForSection:", objc_msgSend(v6, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isValidEventAtIndexPath:", v6);

    if (!v15)
      goto LABEL_6;
    v16 = objc_msgSend(v13, "containerType");
    if (v16 == 2)
    {
      v11 = 60.0;
      goto LABEL_15;
    }
    if (v16 == 1)
    {
      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timelineWidthForEvent:", v13);
      v11 = v19;

    }
    else
    {
LABEL_6:
      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playbackEngine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isFirstEventOfTheDay:", v13) & 1) != 0)
      {
        objc_msgSend(v13, "dateOfOccurrence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "hf_isMidnight");

        if (!v23)
          goto LABEL_15;
      }
      else
      {

      }
      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "previousEventForSection:", objc_msgSend(v6, "section"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "hf_duration");
        if (v25 < 0.00000011920929)
          v11 = 60.0;
      }
    }

LABEL_15:
  }

  v26 = 47.0;
  v27 = v11;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[HUClipScrubberScrollDelegate setShouldIgnoreScrolling:](self, "setShouldIgnoreScrolling:", 0);
  v5 = objc_msgSend(v4, "isDragging");

  if ((v5 & 1) == 0)
    -[HUClipScrubberScrollDelegate setUserScrubbing:](self, "setUserScrubbing:", 0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;

  -[HUClipScrubberScrollDelegate setShouldIgnoreScrolling:](self, "setShouldIgnoreScrolling:", 0);
  -[HUClipScrubberScrollDelegate setUserScrubbing:](self, "setUserScrubbing:", 1);
  -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserScrubbing:", 1);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[HUClipScrubberScrollDelegate setElapsedTime:](self, "setElapsedTime:");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  NSObject *v9;
  CGFloat v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  CGFloat v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  x = a4.x;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (x == 0.0)
  {
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a5->x;
      objc_msgSend(v8, "contentOffset");
      v15 = 134218496;
      v16 = v10;
      v17 = 2048;
      v18 = x;
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Will end scrolling at offset:%.2f with velocity:%.2f vs current offset %.2f", (uint8_t *)&v15, 0x20u);
    }

    -[HUClipScrubberScrollDelegate setTargetScrollOffset:](self, "setTargetScrollOffset:", a5->x);
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setShouldBypassVideoFetchRequest:", v14);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v6;

  -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserScrubbing:", 0);

  if (!a4)
    -[HUClipScrubberScrollDelegate setUserScrubbing:](self, "setUserScrubbing:", 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  BOOL v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  int v66;
  double v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[HUClipScrubberScrollDelegate lastContentOffset](self, "lastContentOffset");
  v8 = v7;
  objc_msgSend(v4, "contentOffset");
  v10 = vabdd_f64(v8, v9);
  -[HUClipScrubberScrollDelegate elapsedTime](self, "elapsedTime");
  v12 = v10 / (v6 - v11);
  -[HUClipScrubberScrollDelegate setElapsedTime:](self, "setElapsedTime:", v6);
  if (v12 >= 100.0)
  {
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 >= 500.0)
      v15 = 2;
    else
      v15 = 1;
  }
  else
  {
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0;
  }
  objc_msgSend(v13, "setScrubbingSpeed:", v15);

  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 134218240;
    v67 = v12;
    v68 = 2048;
    v69 = objc_msgSend(v17, "scrubbingSpeed");
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Scrubbing speed %.3f engineSpeed:%ld", (uint8_t *)&v66, 0x16u);

  }
  -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldBypassVideoFetchRequest");

  if (v19)
  {
    objc_msgSend(v4, "contentOffset");
    v21 = v20;
    -[HUClipScrubberScrollDelegate targetScrollOffset](self, "targetScrollOffset");
    if (vabdd_f64(v21, v22) < 100.0)
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "contentOffset");
        v66 = 134217984;
        v67 = v24;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Scrollview did scroll and stopping at %.f", (uint8_t *)&v66, 0xCu);
      }

      -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setShouldBypassVideoFetchRequest:", 0);

    }
  }
  objc_msgSend(v4, "contentOffset");
  v27 = v26;
  -[HUClipScrubberScrollDelegate lastContentOffset](self, "lastContentOffset");
  -[HUClipScrubberScrollDelegate setScrollingForward:](self, "setScrollingForward:", v27 >= v28);
  objc_msgSend(v4, "contentOffset");
  -[HUClipScrubberScrollDelegate setLastContentOffset:](self, "setLastContentOffset:");
  v29 = -[HUClipScrubberScrollDelegate _shouldScrollBypassPlaybackEngineUpdate](self, "_shouldScrollBypassPlaybackEngineUpdate");
  v30 = v29;
  v31 = !v29;
  objc_msgSend(v4, "contentOffset");
  v33 = v32;
  v35 = v34;
  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  v37 = v33 + v36;
  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "indexPathForItemAtPoint:", v37, v35);
  v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v39 == 0.0)
  {
    *(float *)&v40 = v37;
    -[HUClipScrubberScrollDelegate _handleOutOfBoundsTimelinePosition:](self, "_handleOutOfBoundsTimelinePosition:", v40);
    goto LABEL_17;
  }
  v41 = objc_msgSend(*(id *)&v39, "section");
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "currentEvents");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v41 == v44)
  {
    objc_msgSend(v45, "setCurrentTimelineState:", 1);

LABEL_17:
    v47 = 0;
    goto LABEL_18;
  }
  v52 = objc_msgSend(v45, "isValidEventAtIndexPath:", *(_QWORD *)&v39);

  if (v52)
  {
    -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cellForItemAtIndexPath:", *(_QWORD *)&v39);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      HFLogForCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "currentEvents");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "count");
        v66 = 138412546;
        v67 = v39;
        v68 = 2048;
        v69 = v65;
        _os_log_error_impl(&dword_1B8E1E000, v55, OS_LOG_TYPE_ERROR, "Unable to scroll to find cell for valid indexPath %@ for clip count = %lu!", (uint8_t *)&v66, 0x16u);

      }
      v31 = 0;
    }
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "eventForSection:", objc_msgSend(*(id *)&v39, "section"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = objc_msgSend(v57, "containerType");
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v58 == 1)
      v61 = 2;
    else
      v61 = 3;
    objc_msgSend(v59, "setCurrentTimelineState:", v61);

    -[HUClipScrubberScrollDelegate setCurrentEvent:](self, "setCurrentEvent:", v57);
    if (v31)
    {
      objc_msgSend(v54, "frame");
      -[HUClipScrubberScrollDelegate _selectedDateForEventInRect:](self, "_selectedDateForEventInRect:");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }

  }
  else
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setCurrentTimelineState:", 4);

    if (v30)
    {
      v47 = 0;
      v31 = 0;
    }
    else
    {
      -[HUClipScrubberScrollDelegate _selectedDateForAreaOfNoActivityAtPoint:inScrollView:](self, "_selectedDateForAreaOfNoActivityAtPoint:inScrollView:", v4, v37, v35);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 1;
    }
  }
LABEL_18:
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "currentTimelineState");
  -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTimelineState:", v49);

  if (v31)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCurrentDate:", v47);

    -[HUClipScrubberScrollDelegate updatePlaybackEngineDate:](self, "updatePlaybackEngineDate:", v47);
  }
  -[HUClipScrubberScrollDelegate _updateFamiliarFaceCell](self, "_updateFamiliarFaceCell");

}

- (void)updateCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

  }
  -[HUClipScrubberScrollDelegate setClipCollectionView:](self, "setClipCollectionView:", v7);
  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  objc_super v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("contentSize"))
    && (-[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView"),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v11))
  {
    -[HUClipScrubberScrollDelegate lastContentWidth](self, "lastContentWidth");
    v15 = v14;
    -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentSize");
    v18 = v17;

    if (v15 != v18)
    {
      -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentSize");
      -[HUClipScrubberScrollDelegate setLastContentWidth:](self, "setLastContentWidth:");

      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[HUClipScrubberScrollDelegate lastContentWidth](self, "lastContentWidth");
        *(_DWORD *)buf = 134217984;
        v52 = v21;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Updating clip scrubber to lastContentWidth:%.0f", buf, 0xCu);
      }

      -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isUpdating");

      if ((v23 & 1) == 0)
      {
        -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentEvent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "offsetForEvent:", v26);
        v28 = v27;

        -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contentOffset");
        v31 = v30;

        -[HUClipScrubberScrollDelegate playbackEngine](self, "playbackEngine");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "playbackPosition");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "contentType");

        -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34)
        {
          objc_msgSend(v35, "bounds");
          v38 = v37;
          -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "posterFrameWidth");
          v41 = v40;

          if (v38 <= v41)
            goto LABEL_4;
          -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "bounds");
          v44 = v28 + v43 * -0.5;

          -[HUClipScrubberScrollDelegate setShouldIgnoreScrolling:](self, "setShouldIgnoreScrolling:", 1);
        }
        else
        {
          objc_msgSend(v35, "contentSize");
          v46 = v45;
          -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "bounds");
          v44 = v46 - v48;

        }
        -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setContentOffset:animated:", 0, v44, v31);

      }
    }
  }
  else
  {
    v50.receiver = self;
    v50.super_class = (Class)HUClipScrubberScrollDelegate;
    -[HUClipScrubberScrollDelegate observeValueForKeyPath:ofObject:change:context:](&v50, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_4:

}

- (BOOL)_shouldScrollBypassPlaybackEngineUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (-[HUClipScrubberScrollDelegate shouldIgnoreScrolling](self, "shouldIgnoreScrolling"))
    return 1;
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 1;
  else
    return !-[HUClipScrubberScrollDelegate isUserScrubbing](self, "isUserScrubbing");
}

- (void)_handleOutOfBoundsTimelinePosition:(float)a3
{
  float v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  float v10;
  NSObject *v11;
  void *v12;
  float v13;
  id v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  if (v5 < a3)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEditing");

    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    if ((v7 & 1) != 0)
      v9 = 6;
    else
      v9 = 1;
    goto LABEL_7;
  }
  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  if (v10 > a3)
  {
    -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    v9 = 5;
LABEL_7:
    objc_msgSend(v8, "setCurrentTimelineState:", v9);

    return;
  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
    *(_DWORD *)buf = 134218240;
    v16 = a3;
    v17 = 2048;
    v18 = v13;
    _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "invalid _handleOutOfBoundsTimelinePosition: call. timelinePosition:%.2f playheadPosition:%.2f", buf, 0x16u);
  }

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentTimelineState:", 4);

}

- (id)_selectedDateForAreaOfNoActivityAtPoint:(CGPoint)a3 inScrollView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float MidX;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventForSection:", objc_msgSend(v9, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previousEventForSection:", objc_msgSend(v9, "section"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUClipScrubberScrollDelegate _doesPrecedingSpacerSpanMultipleDaysForEvent:](self, "_doesPrecedingSpacerSpanMultipleDaysForEvent:", v13))
  {
    v16 = x;
    objc_msgSend(v11, "frame");
    MidX = CGRectGetMidX(v33);
    objc_msgSend(v11, "frame");
    v19 = (float)(v16 - MidX) / (v18 * 0.5);
    *(float *)&v19 = v19;
    if (v16 >= MidX)
      -[HUClipScrubberScrollDelegate _selectedDateForTodayFromEvent:percentDuration:](self, "_selectedDateForTodayFromEvent:percentDuration:", v13, v19);
    else
      -[HUClipScrubberScrollDelegate _selectedDateForYesterdayFromPreviousEvent:percentDuration:](self, "_selectedDateForYesterdayFromPreviousEvent:percentDuration:", v15, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v7, "contentOffset");
    *(float *)&v30 = v29;
    -[HUClipScrubberScrollDelegate _interpolatedDateFromEvent:toEvent:insideRect:atTimelinePosition:](self, "_interpolatedDateFromEvent:toEvent:insideRect:atTimelinePosition:", v15, v13, v22, v24, v26, v28, v30);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v20;

  return v31;
}

- (void)_updateFamiliarFaceCell
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];

  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clipCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  v10 = v6 + v9;
  -[HUClipScrubberScrollDelegate dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clipCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleCells");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HUClipScrubberScrollDelegate__updateFamiliarFaceCell__block_invoke;
  v14[3] = &unk_1E6F5B490;
  *(double *)&v14[5] = v10;
  v14[6] = v8;
  v14[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __55__HUClipScrubberScrollDelegate__updateFamiliarFaceCell__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  float v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  float v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGRect v18;

  v3 = a2;
  objc_opt_class();
  v17 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v17;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "frame");
    if (CGRectContainsPoint(v18, *(CGPoint *)(a1 + 40))
      && (objc_msgSend(*(id *)(a1 + 32), "dataSource"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEditing"),
          v6,
          (v7 & 1) == 0)
      && (objc_msgSend(*(id *)(a1 + 32), "playheadPosition"),
          v9 = (float)(v8 + -40.0),
          objc_msgSend(v5, "frame"),
          v10 + v9 >= *(double *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "playheadPosition");
      v14 = (float)(v13 + -5.0);
      v15 = *(double *)(a1 + 40);
      objc_msgSend(v5, "frame");
      objc_msgSend(v5, "showFamiliarFacesWithMaxWidth:", fmax(v15 - v16 + v14 + 40.0, 118.0));
    }
    else
    {
      objc_msgSend(v5, "hideFamiliarFaces");
    }
    if (objc_msgSend(MEMORY[0x1E0D31288], "markCachedVideoAsGreenInTimeline"))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEditing");

      if ((v12 & 1) == 0)
        objc_msgSend(v5, "updateVideoCacheMarker");
    }
  }

}

- (float)playheadPosition
{
  void *v2;
  double v3;
  float v4;

  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.5;

  return v4;
}

- (id)_selectedDateForEventInRect:(CGRect)a3
{
  double width;
  CGFloat MaxX;
  float v6;
  void *v7;
  double v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  width = a3.size.width;
  MaxX = CGRectGetMaxX(a3);
  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  *(float *)&MaxX = MaxX - v6;
  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v8;

  v10 = 1.0 - (float)(*(float *)&MaxX - v9) / width;
  v11 = v10;
  -[HUClipScrubberScrollDelegate currentEvent](self, "currentEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_duration");
  *(float *)&v11 = v13 * v11;

  -[HUClipScrubberScrollDelegate currentEvent](self, "currentEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateOfOccurrence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", *(float *)&v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_selectedDateForTodayFromEvent:(id)a3 percentDuration:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_startOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  v11 = v10 * a4;
  objc_msgSend(v7, "dateByAddingTimeInterval:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_selectedDateForYesterdayFromPreviousEvent:(id)a3 percentDuration:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_startOfNextDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hf_endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = v10 * a4;
  objc_msgSend(v7, "dateByAddingTimeInterval:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_interpolatedDateFromEvent:(id)a3 toEvent:(id)a4 insideRect:(CGRect)a5 atTimelinePosition:(float)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double MaxX;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  CGRect v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  objc_msgSend(a4, "dateOfOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;

  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  -[HUClipScrubberScrollDelegate playheadPosition](self, "playheadPosition");
  v20 = MaxX - v19;
  v21 = 1.0 - (float)(v20 - a6) / width;
  v22 = v17 * v21;
  objc_msgSend(v13, "hf_endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "dateByAddingTimeInterval:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUClipScrubberScrollDelegate clipCollectionView](self, "clipCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberScrollDelegate;
  -[HUClipScrubberScrollDelegate dealloc](&v4, sel_dealloc);
}

- (HUClipScrubberDataSource)dataSource
{
  return (HUClipScrubberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (UICollectionView)clipCollectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_clipCollectionView);
}

- (void)setClipCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_clipCollectionView, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (BOOL)shouldIgnoreScrolling
{
  return self->_shouldIgnoreScrolling;
}

- (void)setShouldIgnoreScrolling:(BOOL)a3
{
  self->_shouldIgnoreScrolling = a3;
}

- (BOOL)isUserScrubbing
{
  return self->_userScrubbing;
}

- (BOOL)hasUserInteractedWithScrubber
{
  return self->_hasUserInteractedWithScrubber;
}

- (void)setHasUserInteractedWithScrubber:(BOOL)a3
{
  self->_hasUserInteractedWithScrubber = a3;
}

- (double)lastContentWidth
{
  return self->_lastContentWidth;
}

- (void)setLastContentWidth:(double)a3
{
  self->_lastContentWidth = a3;
}

- (double)lastContentOffset
{
  return self->_lastContentOffset;
}

- (void)setLastContentOffset:(double)a3
{
  self->_lastContentOffset = a3;
}

- (HFCameraRecordingEvent)currentEvent
{
  return self->_currentEvent;
}

- (void)setCurrentEvent:(id)a3
{
  objc_storeStrong((id *)&self->_currentEvent, a3);
}

- (double)targetScrollOffset
{
  return self->_targetScrollOffset;
}

- (void)setTargetScrollOffset:(double)a3
{
  self->_targetScrollOffset = a3;
}

- (BOOL)isScrollingForward
{
  return self->_scrollingForward;
}

- (void)setScrollingForward:(BOOL)a3
{
  self->_scrollingForward = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEvent, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_clipCollectionView);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
