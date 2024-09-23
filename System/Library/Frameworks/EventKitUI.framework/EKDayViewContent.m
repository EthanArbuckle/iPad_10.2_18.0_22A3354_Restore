@implementation EKDayViewContent

void __36__EKDayViewContent_loadOccurrences___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  EKDayViewContentItem *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  unint64_t v47;
  unint64_t v48;
  id v49;

  v49 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_dayRangeForEvent:useProposedTime:");
  v8 = v6 + v7;
  v43 = 440;
  if (v6 + v7 >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440))
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
  v47 = v8;
  v48 = v6;
  if (v6 < v8)
  {
    v9 = v6;
    v45 = v8 - 1;
    v10 = ~v6;
    v44 = a4;
    do
    {
      v11 = v9;
      if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
        v11 = v10 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + v43);
      v12 = -[EKDayViewContentItem initWithEventIndex:sizeClass:]([EKDayViewContentItem alloc], "initWithEventIndex:sizeClass:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);
      -[EKDayViewContentItem setEvent:](v12, "setEvent:", v49);
      if (a4)
      {
        objc_msgSend(v49, "endDateUnadjustedForLegacyClients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;

        objc_msgSend(v49, "proposedStartDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dateByAddingTimeInterval:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0D0C420];
        objc_msgSend(v49, "proposedStartDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "timeZone");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "calendarDateWithDate:timeZone:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKDayViewContentItem setStartDate:](v12, "setStartDate:", v23);

        v24 = (void *)MEMORY[0x1E0D0C420];
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0D0C420];
        objc_msgSend(v49, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "timeZone");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "calendarDateWithDate:timeZone:", v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKDayViewContentItem setStartDate:](v12, "setStartDate:", v28);

        v24 = (void *)MEMORY[0x1E0D0C420];
        objc_msgSend(v49, "endDateUnadjustedForLegacyClients");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      a4 = v44;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "timeZone", v43);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "calendarDateWithDate:timeZone:", v19, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayViewContentItem setEndDate:](v12, "setEndDate:", v30);

      objc_msgSend(v49, "travelTime");
      -[EKDayViewContentItem setTravelTime:](v12, "setTravelTime:");
      -[EKDayViewContentItem setUsesSmallText:](v12, "setUsesSmallText:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 646));
      -[EKDayViewContentItem setIsProposedTime:](v12, "setIsProposedTime:", v44);
      v31 = *(id *)(a1 + 32);
      objc_sync_enter(v31);
      v32 = *(id *)(*(_QWORD *)(a1 + 32) + 656);
      v33 = *(id *)(*(_QWORD *)(a1 + 32) + 664);
      objc_sync_exit(v31);

      if (v9 <= v48)
      {
        -[EKDayViewContentItem startDate](v12, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "absoluteTime");
        v36 = v35;
        objc_msgSend(v32, "absoluteTime");
        -[EKDayViewContentItem setHasPrecedingDuration:](v12, "setHasPrecedingDuration:", v36 < v37);

      }
      else
      {
        -[EKDayViewContentItem setHasPrecedingDuration:](v12, "setHasPrecedingDuration:", 1);
      }
      if (v9 >= v45)
      {
        -[EKDayViewContentItem endDate](v12, "endDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "absoluteTime");
        v40 = v39;
        objc_msgSend(v33, "calendarDateForEndOfDay");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "absoluteTime");
        -[EKDayViewContentItem setHasTrailingDuration:](v12, "setHasTrailingDuration:", v40 > v42 + 1.0);

      }
      else
      {
        -[EKDayViewContentItem setHasTrailingDuration:](v12, "setHasTrailingDuration:", 1);
      }
      -[EKDayViewContentItem setOccurrenceIsFirstVisibleDayOfEvent:](v12, "setOccurrenceIsFirstVisibleDayOfEvent:", -[EKDayViewContentItem hasPrecedingDuration](v12, "hasPrecedingDuration") ^ 1);

      ++v9;
      --v10;
    }
    while (v47 != v9);
  }

}

uint64_t __42__EKDayViewContent__adjustViewsForPinning__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double MinY;
  double MaxY;
  uint64_t v17;
  uint64_t v18;
  CGRect v20;
  CGRect v21;

  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && ((objc_msgSend(v9, "unPinnedViewFrame"), (a4 & 1) == 0)
      ? (MinY = CGRectGetMinY(*(CGRect *)&v11), objc_msgSend(v6, "unPinnedViewFrame"), MaxY = CGRectGetMinY(v21))
      : (MinY = CGRectGetMaxY(*(CGRect *)&v11), objc_msgSend(v6, "unPinnedViewFrame"), MaxY = CGRectGetMaxY(v20)),
        MinY == MaxY))
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v17);
    v18 = 1;
    v8 = (void *)v17;
  }
  objc_msgSend(v8, "addObject:", v6);

  return v18;
}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL IsNull;
  void *v6;
  double v7;
  double v8;
  double MaxY;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v22 = a2;
  objc_msgSend(v22, "unPinnedViewFrame");
  IsNull = CGRectIsNull(v23);
  v6 = v22;
  if (!IsNull)
  {
    v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v7 >= *(double *)(a1 + 96))
      v7 = *(double *)(a1 + 96);
    v8 = *(double *)(a1 + 88) + v7;
    objc_msgSend(v22, "unPinnedViewFrame");
    MaxY = CGRectGetMaxY(v24);
    CalRoundToScreenScale(3.5);
    v11 = v8 + v10;
    v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v12 >= *(double *)(a1 + 96))
      v12 = *(double *)(a1 + 96);
    v13 = *(double *)(a1 + 88) + v12;
    objc_msgSend(v22, "unPinnedViewFrame");
    v14 = CGRectGetMaxY(v25);
    CalRoundToScreenScale(3.5);
    objc_msgSend(v22, "setTopPinningProximity:", (v13 + v15 - v14 + 20.0) / 20.0);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    {
      v6 = v22;
      if (MaxY >= v11)
        goto LABEL_17;
      goto LABEL_16;
    }
    CalRoundToScreenScale(3.5);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "unPinnedViewFrame");
      v18 = CGRectGetMaxY(v26);
      objc_msgSend(v17, "unPinnedViewFrame");
      v19 = v18 - CGRectGetMaxY(v27);
      CalRoundToScreenScale(3.5);
      if (v20 < v19)
        v19 = v20;

    }
    else
    {
      v19 = v16;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v19
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
    v6 = v22;
    if (MaxY < v11)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v19
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
      v21 = objc_msgSend(*(id *)(a1 + 32), "count", v22);
      v6 = v22;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v21;
LABEL_16:
      objc_msgSend(*(id *)(a1 + 48), "removeObject:", v6);
      v6 = v22;
    }
  }
LABEL_17:

}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL IsNull;
  void *v6;
  double v7;
  double v8;
  double MinY;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v32 = a2;
  objc_msgSend(v32, "unPinnedViewFrame");
  IsNull = CGRectIsNull(v33);
  v6 = v32;
  if (!IsNull)
  {
    v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v7 >= *(double *)(a1 + 96))
      v7 = *(double *)(a1 + 96);
    v8 = *(double *)(a1 + 88) - v7;
    objc_msgSend(v32, "unPinnedViewFrame");
    MinY = CGRectGetMinY(v34);
    CalRoundToScreenScale(3.5);
    v11 = v8 - v10;
    v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v12 >= *(double *)(a1 + 96))
      v12 = *(double *)(a1 + 96);
    v13 = *(double *)(a1 + 88) - v12;
    CalRoundToScreenScale(3.5);
    v15 = v13 - v14;
    objc_msgSend(v32, "unPinnedViewFrame");
    objc_msgSend(v32, "setBottomPinningProximity:", (CGRectGetMinY(v35) - v15 + 20.0) / 20.0);
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    {
      CalRoundToScreenScale(3.5);
      v17 = v16;
      v18 = a3 + 1;
      if (v18 < objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v32;
        objc_msgSend(v19, "unPinnedViewFrame");
        v21 = CGRectGetMinY(v36);
        objc_msgSend(v20, "unPinnedViewFrame");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;

        v37.origin.x = v23;
        v37.origin.y = v25;
        v37.size.width = v27;
        v37.size.height = v29;
        v17 = v21 - CGRectGetMinY(v37);
        CalRoundToScreenScale(3.5);
        if (v30 < v17)
          v17 = v30;

      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v17
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      v6 = v32;
      if (MinY > v11)
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v17
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
        v31 = objc_msgSend(*(id *)(a1 + 32), "count", v32);
        v6 = v32;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v31;
LABEL_14:
        objc_msgSend(*(id *)(a1 + 48), "removeObject:", v6);
        v6 = v32;
      }
    }
    else
    {
      v6 = v32;
      if (MinY > v11)
        goto LABEL_14;
    }
  }

}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (_NSRange)_dayRangeForEvent:(id)a3 useProposedTime:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EKDayViewContent *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "proposedStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "duration");
    objc_msgSend(v8, "dateByAddingTimeInterval:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "proposedStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self;
    v12 = v10;
    v13 = v9;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDateUnadjustedForLegacyClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self;
    v12 = v9;
    v13 = v10;
  }
  v14 = -[EKDayViewContent _dayRangeForEventWithStartDate:endDate:](v11, "_dayRangeForEventWithStartDate:endDate:", v12, v13);
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)_configureOccurrenceViewMarginAndPadding:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultPadding");
  if (self->_usesSmallText)
    CalRoundToScreenScale(0.5);
  objc_msgSend(v4, "setPadding:");

}

uint64_t __46__EKDayViewContent__layoutDay_isLoadingAsync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

uint64_t __46__EKDayViewContent__layoutDay_isLoadingAsync___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsLoadingAsync:", 1);
}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double MinY;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;

        v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        objc_msgSend(v9, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isHidden"))
        {
          v39.origin.x = v12;
          v39.origin.y = v19;
          v39.size.width = v16;
          v39.size.height = v18;
          v21 = CGRectIntersectsRect(v39, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536));

          if (!v21)
            continue;
        }
        else
        {

        }
        v40.origin.x = v12;
        v40.origin.y = v14;
        v40.size.width = v16;
        v40.size.height = v18;
        if (!CGRectIntersectsRect(v40, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536)))
        {
          v41.origin.x = v12;
          v41.origin.y = v19;
          v41.size.width = v16;
          v41.size.height = v18;
          if (!CGRectIntersectsRect(v41, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536)))
            continue;
        }
        objc_msgSend(v9, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFrame:", v12, v19, v16, v18);

        objc_msgSend(v9, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isHidden"))
        {
          v42.origin.x = v12;
          v42.origin.y = v19;
          v42.size.width = v16;
          v42.size.height = v18;
          v24 = CGRectIntersectsRect(v42, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536));

          if (!v24)
            continue;
          objc_msgSend(v9, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setHidden:", 0);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }
  CalRoundToScreenScale(3.5);
  v26 = v25;
  if (a3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 + 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "unPinnedViewFrame");
    MinY = CGRectGetMinY(v43);
    objc_msgSend(v29, "unPinnedViewFrame");
    v31 = MinY - CGRectGetMinY(v44);
    if (v26 >= v31)
      v26 = v31;

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v26;

}

- (double)dateForPoint:(CGPoint)a3
{
  double y;
  double x;
  const void *v6;
  double v7;
  double v8;

  y = a3.y;
  x = a3.x;
  -[EKDayViewContent _dayWidth](self, "_dayWidth");
  -[EKDayGridView secondAtPosition:](self->_grid, "secondAtPosition:", y);
  if (x >= 0.0)
    CalTimeDirectionIsLeftToRight();
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v6 = (const void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
  CalAbsoluteTimeAddGregorianUnits();
  v8 = v7;
  if (v6)
    CFRelease(v6);
  return v8;
}

- (CGPoint)pointForDate:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v5 = (void *)MEMORY[0x1E0D0C420];
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarDateWithAbsoluteTime:timeZone:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "calendarDateForDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)objc_msgSend(v8, "secondsFromGMT");
  v10 = (double)objc_msgSend(v7, "secondsFromGMT");
  objc_msgSend(v8, "absoluteTime");
  -[EKDayGridView positionOfSecond:](self->_grid, "positionOfSecond:", (uint64_t)(a3 - v11 - (v9 - v10)));
  v13 = v12;
  -[EKDayViewContent dayStarts](self, "dayStarts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("startDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v7, "differenceInDays:", v16);
  -[EKDayViewContent _dayWidth](self, "_dayWidth");
  v19 = v18 * 0.5 + v18 * (double)v17;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    -[EKDayGridView widthForOccurrences](self->_grid, "widthForOccurrences");
    v19 = v20 - v19;
  }

  v21 = v19;
  v22 = v13;
  result.y = v22;
  result.x = v21;
  return result;
}

- (double)_dayWidth
{
  double result;
  unint64_t daysToDisplay;
  double v5;

  result = self->_fixedDayWidth;
  daysToDisplay = self->_daysToDisplay;
  if (result <= 0.0)
  {
    if (!daysToDisplay)
      return 0.0;
    -[EKDayGridView widthForOccurrences](self->_grid, "widthForOccurrences");
    daysToDisplay = self->_daysToDisplay;
    result = (double)((unint64_t)v5 / daysToDisplay);
  }
  if (daysToDisplay == 1 && self->_eventsFillGrid)
    return result + 1.0;
  return result;
}

- (id)dayStarts
{
  EKDayViewContent *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_dayStarts, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (_NSRange)_dayRangeForEventWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  EKCalendarDate *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  _NSRange result;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D0C420];
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarDateWithDate:timeZone:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D0C420];
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendarDateWithDate:timeZone:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "absoluteTime");
  v15 = v14;
  -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
  if (v15 < v16)
  {
    v17 = self->_startDate;

    v10 = v17;
  }
  v18 = objc_msgSend(v10, "differenceInDays:", self->_startDate);
  objc_msgSend(v10, "calendarDateForDay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "differenceInDays:", v19);
  if ((objc_msgSend(v6, "isEqualToDate:", v7) & 1) == 0 && !objc_msgSend(v13, "hour") && !objc_msgSend(v13, "minute"))
    v20 = (__PAIR128__(v20, objc_msgSend(v13, "second")) - 1) >> 64;

  v21 = v18;
  v22 = v20 + 1;
  result.length = v22;
  result.location = v21;
  return result;
}

- (id)grid
{
  return self->_grid;
}

- (void)_layoutDay:(unint64_t)a3 isLoadingAsync:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  EKDayViewContent *v34;
  NSMutableArray *v35;
  NSMutableArray *v36;
  id WeakRetained;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  EKDayViewContent *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  -[EKDayViewContent _dayWidth](self, "_dayWidth");
  v7 = v6;
  v57 = self;
  if (v4)
  {
    -[EKDayViewContent singleItemsForPreloadByDay](self, "singleItemsForPreloadByDay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
      goto LABEL_35;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_1);
  }
  else
  {
    -[EKDayViewContent singleItemsByDay](self, "singleItemsByDay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
      goto LABEL_35;
  }
  v54 = v9;
  -[NSMutableArray objectAtIndexedSubscript:](v57->_dayStarts, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("startDate"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndexedSubscript:](v57->_dayStarts, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("endDate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndexedSubscript:](v57->_geometryDelegates, "objectAtIndexedSubscript:", a3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "frame");
  v14 = v13;
  v16 = v15;
  v17 = 0.5;
  if (v57->_daysToDisplay <= 1)
    +[EKDayOccurrenceView barToBarGapWidth](EKDayOccurrenceView, "barToBarGapWidth", 0.5);
  objc_msgSend(v55, "setFrame:", v7 * (double)a3 + v17, v14, v7 - v17, v16);
  v18 = objc_alloc(MEMORY[0x1E0D0CE00]);
  objc_msgSend(v53, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithOccurrences:startOfDay:endOfDay:geometryDelegate:screenUtilsDelegate:calendar:", v9, v19, v20, v55, v57, v21);

  v50 = v22;
  objc_msgSend(v22, "groupOccurrences:", v57);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_249);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24 = v57->_displayItemsForPreloadByDay;
    objc_sync_enter(v24);
    -[NSMutableArray setObject:atIndexedSubscript:](v57->_displayItemsForPreloadByDay, "setObject:atIndexedSubscript:", v23, a3);
    objc_sync_exit(v24);

    v25 = v57->_displayItemsForPreloadByDayByEndDate;
    objc_sync_enter(v25);
    -[NSMutableArray setObject:atIndexedSubscript:](v57->_displayItemsForPreloadByDayByEndDate, "setObject:atIndexedSubscript:", v51, a3);
    objc_sync_exit(v25);

    objc_msgSend(v22, "applyLayoutToOccurrences");
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v26 = v9;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v67 != v28)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "setIsLoadingAsync:", 0);
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v27);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v30 = v23;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v63 != v32)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "setIsLoadingAsync:", 0);
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v31);
    }

    v34 = v57;
  }
  else
  {
    v34 = v57;
    v35 = v57->_itemsByDay;
    objc_sync_enter(v35);
    -[NSMutableArray setObject:atIndexedSubscript:](v57->_itemsByDay, "setObject:atIndexedSubscript:", v23, a3);
    objc_sync_exit(v35);

    v36 = v57->_itemsByDayByEndDate;
    objc_sync_enter(v36);
    -[NSMutableArray setObject:atIndexedSubscript:](v57->_itemsByDayByEndDate, "setObject:atIndexedSubscript:", v51, a3);
    objc_sync_exit(v36);

    objc_msgSend(v22, "applyLayoutToOccurrences");
  }
  WeakRetained = objc_loadWeakRetained((id *)&v34->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v38 = objc_loadWeakRetained((id *)&v34->_delegate);
    v39 = objc_msgSend(v38, "dayViewContentShouldDrawSynchronously:", v57);

  }
  else
  {
    v39 = 0;
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v40 = v23;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_msgSend(v44, "currentState");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKDayViewContentItemStateWrapper wrapperWithContentItem:viewContent:](EKDayViewContentItemStateWrapper, "wrapperWithContentItem:viewContent:", v44, v57);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "performChangesWithState:", v46);

        objc_msgSend(v44, "_requestPayloadAnimated:drawSynchronously:", v57->_shouldAnimateLayout, v39);
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v41);
  }

  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[EKDayViewContent frame](v57, "frame");
  objc_msgSend(v47, "numberWithDouble:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](v57->_lastLayoutWidthForDay, "setObject:atIndexedSubscript:", v49, a3);

  v9 = v54;
LABEL_35:

}

- (void)layoutSubviews
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  EKCalendarDate *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;

  if (-[NSMutableArray count](self->_geometryDelegates, "count"))
  {
    v3 = 0;
    do
    {
      -[EKDayViewContent bounds](self, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[NSMutableArray objectAtIndexedSubscript:](self->_geometryDelegates, "objectAtIndexedSubscript:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

      ++v3;
    }
    while (-[NSMutableArray count](self->_geometryDelegates, "count") > v3);
  }
  -[EKDayViewContent _layoutDaysIfVisible](self, "_layoutDaysIfVisible");
  -[EKDayViewContent rectBecameVisible:](self, "rectBecameVisible:", self->_latestVisibleRect.origin.x, self->_latestVisibleRect.origin.y, self->_latestVisibleRect.size.width, self->_latestVisibleRect.size.height);
  if (self->_darkensWeekends)
  {
    -[EKDayViewContent _dayWidth](self, "_dayWidth");
    v14 = v13;
    v15 = self->_startDate;
    v16 = v15;
    if (self->_daysToDisplay)
    {
      v17 = 0;
      while (1)
      {
        v18 = objc_msgSend(v16, "dayOfWeek");
        if (v18 == 1)
          break;
        if (v18 == 7)
        {
          v19 = &OBJC_IVAR___EKDayViewContent__saturdayDarkeningView;
LABEL_11:
          -[EKDayGridView bounds](self->_grid, "bounds");
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v19), "setFrame:", v14 * (double)(int)v17, 0.0, v14);
        }
        objc_msgSend(v16, "calendarDateByAddingDays:", 1);
        v20 = objc_claimAutoreleasedReturnValue();

        v15 = (EKCalendarDate *)v20;
        ++v17;
        v16 = (void *)v20;
        if (self->_daysToDisplay <= v17)
          goto LABEL_15;
      }
      v19 = &OBJC_IVAR___EKDayViewContent__sundayDarkeningView;
      goto LABEL_11;
    }
LABEL_15:

  }
}

- (void)_layoutDaysIfVisible
{
  unint64_t daysToDisplay;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];

  if (!self->_dataLoaded)
    return;
  daysToDisplay = self->_daysToDisplay;
  -[EKDayViewContent singleItemsByDay](self, "singleItemsByDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (daysToDisplay < v5)
    v5 = daysToDisplay;
  if (!self->_waitingForSynchronousLayoutToReapplyViews)
  {
    if (!v5)
      return;
    v8 = 0;
    while (!-[EKDayViewContent _layoutNeededForDay:isLoadingAsync:](self, "_layoutNeededForDay:isLoadingAsync:", v8, 0))
    {
      if (v5 == ++v8)
        return;
    }
    -[EKDayViewContent saveTemporaryViews](self, "saveTemporaryViews");
  }
  if (self->_shouldLayoutInReverse)
  {
    v6 = v5 - 1;
    if ((uint64_t)(v5 - 1) >= 0)
    {
      v7 = 0;
      do
        v7 |= -[EKDayViewContent _layoutDayIfNeeded:isLoadingAsync:](self, "_layoutDayIfNeeded:isLoadingAsync:", v6--, 0);
      while (v6 != -1);
      goto LABEL_20;
    }
LABEL_19:
    LOBYTE(v7) = 0;
    goto LABEL_20;
  }
  if (!v5)
    goto LABEL_19;
  v9 = 0;
  v7 = 0;
  do
    v7 |= -[EKDayViewContent _layoutDayIfNeeded:isLoadingAsync:](self, "_layoutDayIfNeeded:isLoadingAsync:", v9++, 0);
  while (v5 != v9);
LABEL_20:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__EKDayViewContent__layoutDaysIfVisible__block_invoke;
  v13[3] = &unk_1E6018688;
  v13[4] = self;
  -[EKDayViewContent applyLoadedOccurrencesWithBatching:animated:reverse:completion:](self, "applyLoadedOccurrencesWithBatching:animated:reverse:completion:", 0, 0, 0, v13);
  self->_shouldAnimateLayout = 0;
  if ((v7 & 1) != 0)
  {
    -[EKDayViewContent delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[EKDayViewContent delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dayViewContentDidLayout:", self);

    }
  }
}

- (void)applyLoadedOccurrenceBatchStartingAtIndex:(int64_t)a3 batchSize:(int64_t)a4 fromArray:(id)a5 withStartDate:(id)a6 animated:(BOOL)a7 reverse:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  void (**v17)(_QWORD);
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  BOOL v21;
  int64_t v22;
  BOOL v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  char v27;
  id v28;
  void (**v29)(void *, int64_t);
  int64_t v30;
  dispatch_time_t v31;
  id v32;
  id v33;
  int64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  BOOL v49;
  void (**v50)(void *, int64_t);
  void (**v51)(_QWORD);
  id v52;
  _QWORD block[5];
  id v54;
  id v55;
  void (**v56)(_QWORD);
  int64_t v57;
  int64_t v58;
  BOOL v59;
  BOOL v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD aBlock[4];
  id v66;
  EKDayViewContent *v67;
  BOOL v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(_QWORD))a9;
  v18 = objc_msgSend(v15, "count");
  if (self->_dataLoaded)
  {
    v19 = v18;
    v52 = v15;
    if (!v16)
      goto LABEL_4;
    -[EKDayViewContent startDate](self, "startDate");
    v20 = v19;
    v21 = a8;
    v22 = a4;
    v23 = a7;
    v24 = v17;
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    v16 = v25;
    v17 = v24;
    a7 = v23;
    a4 = v22;
    a8 = v21;
    v19 = v20;
    v15 = v52;
    if ((v27 & 1) != 0)
    {
LABEL_4:
      self->_shouldLayoutInReverse = a8;
      v49 = a7;
      self->_shouldAnimateLayout = a7;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke;
      aBlock[3] = &unk_1E60187E8;
      v28 = v15;
      v66 = v28;
      v67 = self;
      v68 = a8;
      v29 = (void (**)(void *, int64_t))_Block_copy(aBlock);
      v51 = v17;
      if (a8)
      {
        if (a3 < a4)
          v30 = -1;
        else
          v30 = a3 - a4;
        for (; a3 > v30; --a3)
          v29[2](v29, a3);
        if ((a3 & 0x8000000000000000) == 0)
        {
LABEL_11:
          v31 = dispatch_time(0, 0);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke_2;
          block[3] = &unk_1E6018810;
          block[4] = self;
          v57 = a3;
          v58 = a4;
          v54 = v28;
          v55 = v16;
          v59 = v49;
          v60 = a8;
          v56 = v17;
          dispatch_after(v31, MEMORY[0x1E0C80D38], block);

LABEL_32:
          goto LABEL_33;
        }
      }
      else
      {
        v32 = v16;
        v33 = v15;
        if (a4 + a3 >= v19)
          v34 = v19;
        else
          v34 = a4 + a3;
        if (v34 > a3)
        {
          do
            v29[2](v29, a3++);
          while (v34 != a3);
          a3 = v34;
        }
        v15 = v33;
        v16 = v32;
        v17 = v51;
        if (a3 != v19)
          goto LABEL_11;
      }
      v48 = v16;
      v50 = v29;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v35 = v28;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v62 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v40, "view", v48);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "selectedCopy");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v42, "requestContentIfNeeded:completion:", 16, 0);
              -[EKDayGridView occurrenceContainerView](self->_grid, "occurrenceContainerView");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "bringSubviewToFront:", v42);

            }
            objc_msgSend(v40, "view");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "selected");

            if (v45)
            {
              objc_msgSend(v40, "currentState");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              +[EKDayViewContentItemStateWrapper wrapperWithContentItem:viewContent:](EKDayViewContentItemStateWrapper, "wrapperWithContentItem:viewContent:", v40, self);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "performChangesWithState:", v47);

              objc_msgSend(v40, "_requestPayloadAnimated:drawSynchronously:", self->_shouldAnimateLayout, 1);
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v37);
      }

      v17 = v51;
      v51[2](v51);
      v15 = v52;
      v16 = v48;
      v29 = v50;
      goto LABEL_32;
    }
  }
  v17[2](v17);
LABEL_33:

}

void __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "_dayIndexForAllIndex:", a2);
  if (v4 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v24, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarItemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6
      && (objc_msgSend(v7, "objectForKeyedSubscript:", v6), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v11 + 632) == 1)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v6);
        v11 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend(*(id *)(v11 + 592), "removeObject:", v10);

    }
    else
    {
      v10 = 0;
    }

  }
  v12 = *(id *)(a1 + 40);
  objc_sync_enter(v12);
  if (!v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 592), "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareForReuse");
  }
  v13 = objc_msgSend(*(id *)(a1 + 40), "_shouldAnnotateAppEntitiesForDayAtIndex:", v4);
  objc_msgSend(v24, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v24, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareForReuse");

    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 592);
    objc_msgSend(v24, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v17);

    v18 = *(void **)(a1 + 40);
    objc_msgSend(v24, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applyContentItem:toView:shouldAnnotate:", v24, v19, v13);

    objc_msgSend(v24, "view");
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v20;
  }
  else
  {
    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 592), "removeObject:", v10);
    }
    else
    {
      +[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "occurrenceContainerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "applyContentItem:toView:shouldAnnotate:", v24, v10, v13);
  }
  v22 = *(void **)(*(_QWORD *)(a1 + 40) + 416);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v22, "occurrenceContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendSubviewToBack:", v10);
  }
  else
  {
    objc_msgSend(v22, "occurrenceContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bringSubviewToFront:", v10);
  }

  objc_sync_exit(v12);
}

- (unint64_t)_dayIndexForAllIndex:(unint64_t)a3
{
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = self->_itemsByDay;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_itemsByDay;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v7;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "count", (_QWORD)v14);
        if (v8 > a3)
        {
          v12 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v7 != v11);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = v12;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  objc_sync_exit(v5);
  return v12;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOrientation:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[EKDayGridView setOrientation:](self->_grid, "setOrientation:");
  v5 = a3 - 3;
  -[EKDayViewContent setUsesSmallText:](self, "setUsesSmallText:", (unint64_t)(a3 - 3) < 2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKDayViewContent occurrenceViews](self, "occurrenceViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setUsesSmallText:", v5 < 2);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNeedsLayout
{
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewContent;
  -[EKDayViewContent setNeedsLayout](&v4, sel_setNeedsLayout);
  if (self->_daysToDisplay)
  {
    v3 = 0;
    do
      -[NSMutableArray setObject:atIndexedSubscript:](self->_lastLayoutWidthForDay, "setObject:atIndexedSubscript:", &unk_1E606F078, v3++);
    while (self->_daysToDisplay > v3);
  }
}

- (void)setUsesSmallText:(BOOL)a3
{
  void *v4;
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
  if (self->_usesSmallText != a3)
  {
    self->_usesSmallText = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[EKDayViewContent occurrenceViews](self, "occurrenceViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setUsesSmallText:", self->_usesSmallText);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)occurrenceViews
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKDayGridView occurrenceContainerView](self->_grid, "occurrenceContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setEventsFillGrid:(BOOL)a3
{
  self->_eventsFillGrid = a3;
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  if (self->_allowsOccurrenceSelection != a3)
  {
    v3 = a3;
    self->_allowsOccurrenceSelection = a3;
    -[EKDayViewContent subviews](self, "subviews");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v8, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "tag") == 2423)
          objc_msgSend(v7, "setUserInteractionEnabled:", v3);

      }
    }

  }
}

void __83__EKDayViewContent_applyLoadedOccurrencesWithBatching_animated_reverse_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
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
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 592);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setHidden:", 1, (_QWORD)v9);
        objc_msgSend(v8, "setOccurrence:", 0);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)clearTemporaryViews
{
  EKDayViewContent *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  NSMutableArray *obj;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_saveTemporaryViewsEntryCount - 1;
  v2->_saveTemporaryViewsEntryCount = v3;
  if (!v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v2->_temporaryViewCacheByDay;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v6, "allValues");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v15;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v15 != v9)
                  objc_enumerationMutation(v7);
                v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
                objc_msgSend(v11, "setHidden:", 1);
                objc_msgSend(v11, "setOccurrence:", 0);
                -[NSMutableArray addObject:](v2->_reusableViews, "addObject:", v11);
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v8);
          }

          objc_msgSend(v6, "removeAllObjects");
        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
    }

  }
  objc_sync_exit(v2);

}

- (void)rectBecameVisible:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL IsEmpty;
  void *v17;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  self->_latestVisibleRect = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EKDayViewContent allVisibleItems](self, "allVisibleItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v9)
    goto LABEL_13;
  v10 = v9;
  v11 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isHidden"))
        goto LABEL_10;
      objc_msgSend(v13, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      IsEmpty = CGRectIsEmpty(v25);

      if (!IsEmpty)
      {
        objc_msgSend(v13, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        v18 = CGRectIntersectsRect(v26, v27);

        if (v18)
        {
          objc_msgSend(v13, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setHidden:", 0);
LABEL_10:

          continue;
        }
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v10);
LABEL_13:

  if (-[EKDayViewContent offscreenOccurrencePinningEnabled](self, "offscreenOccurrencePinningEnabled"))
    -[EKDayViewContent _adjustViewsForPinning](self, "_adjustViewsForPinning");
}

- (id)allVisibleItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKDayViewContent visibleItemsByDay](self, "visibleItemsByDay", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)offscreenOccurrencePinningEnabled
{
  return self->_offscreenOccurrencePinningEnabled;
}

- (void)_adjustViewsForPinning
{
  void *v3;
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MinY;
  double MaxY;
  double v23;
  double v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  CGRect *p_latestVisibleRect;
  void *v75;
  void *v76;
  EKDayViewContent *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  id v83;
  _QWORD *v84;
  _QWORD v85[5];
  id v86;
  _QWORD *v87;
  _QWORD v88[3];
  double v89;
  _QWORD v90[3];
  double v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t *v97;
  _QWORD *v98;
  uint64_t *v99;
  double v100;
  double v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  id v106;
  uint64_t *v107;
  _QWORD *v108;
  uint64_t *v109;
  double v110;
  double v111;
  _QWORD v112[4];
  _QWORD v113[4];
  uint64_t v114;
  double *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v136 = *MEMORY[0x1E0C80C00];
  p_latestVisibleRect = &self->_latestVisibleRect;
  if (!CGRectIsNull(self->_latestVisibleRect))
  {
    v77 = self;
    -[EKDayViewContent visibleItemsByDay](self, "visibleItemsByDay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (-[EKDayViewContent _doOffscreenOccurrences](self, "_doOffscreenOccurrences"))
      {
        v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[EKDayViewContent visibleItemsByDay](self, "visibleItemsByDay");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_daysToDisplay)
        {
          v5 = 0;
          do
          {
            if (v5 >= objc_msgSend(v75, "count"))
              break;
            objc_msgSend(v75, "objectAtIndex:", v5);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v76, "count"))
            {
              -[EKDayViewContent _dayWidth](v77, "_dayWidth");
              v7 = v6;
              v8 = v5;
              if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
                v8 = v77->_daysToDisplay + ~v5;
              -[EKDayViewContent frame](v77, "frame");
              v137.origin.x = v7 * (double)v8;
              v137.origin.y = 0.0;
              v137.size.width = v7;
              if (CGRectIntersectsRect(v137, *p_latestVisibleRect))
              {
                v9 = v76;
                v10 = v77->_itemsByDayByEndDate;
                objc_sync_enter(v10);
                -[NSMutableArray objectAtIndex:](v77->_itemsByDayByEndDate, "objectAtIndex:", v5);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_sync_exit(v10);

                v132 = 0u;
                v133 = 0u;
                v130 = 0u;
                v131 = 0u;
                v12 = v9;
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v130, v135, 16);
                if (v13)
                {
                  v14 = *(_QWORD *)v131;
                  do
                  {
                    for (i = 0; i != v13; ++i)
                    {
                      if (*(_QWORD *)v131 != v14)
                        objc_enumerationMutation(v12);
                      v16 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
                      if (objc_msgSend(v16, "isPinned"))
                        objc_msgSend(v4, "addObject:", v16);
                    }
                    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v130, v135, 16);
                  }
                  while (v13);
                }

                CalRoundToScreenScale(3.5);
                v18 = v17;
                CalRoundToScreenScale(3.5);
                v20 = v19;
                MinY = CGRectGetMinY(*p_latestVisibleRect);
                MaxY = CGRectGetMaxY(*p_latestVisibleRect);
                CalRoundToScreenScale(0.5);
                v24 = v23;
                v126 = 0;
                v127 = &v126;
                v128 = 0x2020000000;
                v129 = 0;
                v122 = 0;
                v123 = &v122;
                v124 = 0x2020000000;
                v125 = 0;
                v118 = 0;
                v119 = (double *)&v118;
                v120 = 0x2020000000;
                v121 = 0;
                v114 = 0;
                v115 = (double *)&v114;
                v116 = 0x2020000000;
                v117 = 0;
                v113[0] = 0;
                v113[1] = v113;
                v113[2] = 0x2020000000;
                v113[3] = 0;
                v112[0] = 0;
                v112[1] = v112;
                v112[2] = 0x2020000000;
                v112[3] = 0;
                v102[0] = MEMORY[0x1E0C809B0];
                v102[1] = 3221225472;
                v102[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_2;
                v102[3] = &unk_1E60188C8;
                v110 = MinY;
                v111 = v18;
                v107 = &v118;
                v108 = v113;
                v106 = &__block_literal_global_261;
                v25 = v71;
                v103 = v25;
                v26 = v11;
                v104 = v26;
                v109 = &v126;
                v27 = v4;
                v105 = v27;
                v73 = v26;
                objc_msgSend(v26, "enumerateObjectsWithOptions:usingBlock:", 0, v102);
                v28 = v127[3];
                v29 = objc_msgSend(v25, "count");
                objc_msgSend(v25, "removeObjectsInRange:", v28, v29 - v127[3]);
                v30 = v20 * 3.0;
                v92[0] = MEMORY[0x1E0C809B0];
                v31 = MaxY - v24;
                v92[1] = 3221225472;
                v92[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_3;
                v92[3] = &unk_1E60188C8;
                v100 = v31;
                v101 = v20 * 3.0;
                v98 = v112;
                v97 = &v114;
                v96 = &__block_literal_global_261;
                v32 = v70;
                v93 = v32;
                v33 = v12;
                v94 = v33;
                v99 = &v122;
                v34 = v27;
                v95 = v34;
                v72 = v33;
                objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", 2, v92);
                v35 = v123[3];
                v36 = objc_msgSend(v32, "count");
                objc_msgSend(v32, "removeObjectsInRange:", v35, v36 - v123[3]);
                v37 = v119[3];
                if (v37 >= v18)
                  v37 = v18;
                v77->_visiblePinnedStackHeightAbove[v5] = v37;
                v38 = v115[3];
                if (v38 >= v30)
                  v38 = v20 * 3.0;
                v77->_visiblePinnedStackHeightBelow[v5] = v38;
                if (objc_msgSend(v25, "count"))
                {
                  objc_msgSend(v25, "lastObject");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectAtIndex:", 0);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "unPinnedViewFrame");
                  v41 = CGRectGetMaxY(v138);

                }
                else
                {
                  v41 = 0.0;
                }
                if (objc_msgSend(v32, "count"))
                {
                  objc_msgSend(v32, "lastObject");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "objectAtIndex:", 0);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "unPinnedViewFrame");
                  v44 = CGRectGetMinY(v139);

                }
                else
                {
                  v44 = 0.0;
                }
                v45 = v119[3];
                if (MinY + v45 > v18 + MinY)
                {
                  v46 = MinY + v45 - v41;
                  v47 = v45 - v18;
                  if (v46 < v47)
                    v47 = v46;
                  MinY = MinY - v47;
                }
                v48 = v115[3];
                if (v31 - v48 < v31 - v30)
                {
                  v49 = v44 + v48 - v31;
                  v50 = v48 - v30;
                  if (v49 < v50)
                    v50 = v49;
                  v31 = v31 + v50;
                }
                v90[0] = 0;
                v90[1] = v90;
                v90[2] = 0x2020000000;
                v91 = 0.0;
                CalRoundToScreenScale(3.5);
                v91 = MinY + v51;
                v88[0] = 0;
                v88[1] = v88;
                v88[2] = 0x2020000000;
                v89 = 0.0;
                CalRoundToScreenScale(3.5);
                v89 = v31 - v52;
                v85[0] = MEMORY[0x1E0C809B0];
                v85[1] = 3221225472;
                v85[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_4;
                v85[3] = &unk_1E60188F0;
                v87 = v90;
                v85[4] = v77;
                v53 = v25;
                v86 = v53;
                objc_msgSend(v53, "enumerateObjectsUsingBlock:", v85);
                v82[0] = MEMORY[0x1E0C809B0];
                v82[1] = 3221225472;
                v82[2] = __42__EKDayViewContent__adjustViewsForPinning__block_invoke_5;
                v82[3] = &unk_1E60188F0;
                v84 = v88;
                v82[4] = v77;
                v54 = v32;
                v83 = v54;
                objc_msgSend(v54, "enumerateObjectsUsingBlock:", v82);
                v80 = 0u;
                v81 = 0u;
                v78 = 0u;
                v79 = 0u;
                v55 = v34;
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v134, 16);
                if (v56)
                {
                  v57 = *(_QWORD *)v79;
                  do
                  {
                    for (j = 0; j != v56; ++j)
                    {
                      if (*(_QWORD *)v79 != v57)
                        objc_enumerationMutation(v55);
                      v59 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                      objc_msgSend(v59, "view");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "frame");
                      v62 = v61;
                      v64 = v63;
                      v66 = v65;

                      objc_msgSend(v59, "unPinnedViewFrame");
                      v68 = v67;
                      objc_msgSend(v59, "view");
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v69, "setFrame:", v62, v68, v64, v66);

                    }
                    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v134, 16);
                  }
                  while (v56);
                }

                objc_msgSend(v53, "removeAllObjects");
                objc_msgSend(v54, "removeAllObjects");
                objc_msgSend(v55, "removeAllObjects");

                _Block_object_dispose(v88, 8);
                _Block_object_dispose(v90, 8);

                _Block_object_dispose(v112, 8);
                _Block_object_dispose(v113, 8);
                _Block_object_dispose(&v114, 8);
                _Block_object_dispose(&v118, 8);
                _Block_object_dispose(&v122, 8);
                _Block_object_dispose(&v126, 8);

              }
            }

            ++v5;
          }
          while (v5 < v77->_daysToDisplay);
        }

      }
    }
  }
}

- (id)visibleItemsByDay
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_itemsByDay;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_itemsByDay, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)_doOffscreenOccurrences
{
  return 1;
}

- (void)movePreloadedItemsToVisible
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  NSMutableArray *reusableViews;
  void *v13;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  id v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  void *v25;
  id v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  NSMutableArray *v32;
  NSMutableArray *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  NSMutableArray *v38;
  NSMutableArray *obj;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
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
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v32 = self->_itemsByDay;
  objc_sync_enter(v32);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = self->_itemsByDay;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v3)
  {
    v40 = *(_QWORD *)v59;
    do
    {
      v41 = v3;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v59 != v40)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v55 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v10, "view");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                reusableViews = self->_reusableViews;
                objc_msgSend(v10, "view");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](reusableViews, "addObject:", v13);

              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
          }
          while (v7);
        }

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v3);
  }

  -[NSMutableArray removeAllObjects](self->_itemsByDay, "removeAllObjects");
  objc_sync_exit(v32);

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v33);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = self->_singleItemsForPreloadByDay;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "copy");
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v16);
  }

  objc_sync_exit(v33);
  v34 = self->_singleItemsByDay;
  objc_sync_enter(v34);
  -[NSMutableArray removeAllObjects](self->_singleItemsByDay, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_singleItemsByDay, "addObjectsFromArray:", v14);
  objc_sync_exit(v34);

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = self->_displayItemsForPreloadByDay;
  objc_sync_enter(v35);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = self->_displayItemsForPreloadByDay;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "copy");
        objc_msgSend(v20, "addObject:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v22);
  }

  objc_sync_exit(v35);
  v36 = self->_itemsByDay;
  objc_sync_enter(v36);
  -[NSMutableArray removeAllObjects](self->_itemsByDay, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_itemsByDay, "addObjectsFromArray:", v20);
  objc_sync_exit(v36);

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = self->_displayItemsForPreloadByDayByEndDate;
  objc_sync_enter(v37);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = self->_displayItemsForPreloadByDayByEndDate;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * n), "copy");
        objc_msgSend(v26, "addObject:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    }
    while (v28);
  }

  objc_sync_exit(v37);
  v38 = self->_itemsByDayByEndDate;
  objc_sync_enter(v38);
  -[NSMutableArray removeAllObjects](self->_itemsByDayByEndDate, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_itemsByDayByEndDate, "addObjectsFromArray:", v26);
  objc_sync_exit(v38);

}

- (void)setDimmedOccurrence:(id)a3
{
  EKEvent *v5;
  EKEvent *dimmedOccurrence;
  EKEvent *v7;

  v5 = (EKEvent *)a3;
  dimmedOccurrence = self->_dimmedOccurrence;
  v7 = v5;
  if (dimmedOccurrence != v5)
  {
    if (dimmedOccurrence)
      -[EKDayViewContent setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 0);
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (self->_dimmedOccurrence)
      -[EKDayViewContent setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 1);
  }

}

- (void)setStartDateWithDateComponents:(id)a3
{
  EKDayViewContent *v4;
  void *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;
  EKCalendarDate *startDate;
  EKCalendarDate *v10;
  EKCalendarDate *v11;
  EKCalendarDate *endDate;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "isEqual:", self->_startDate) & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)MEMORY[0x1E0D0C420];
    -[NSCalendar timeZone](v4->_calendar, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarDateWithDateComponents:timeZone:", v13, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarDateForDay");
    v8 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v8;

    v10 = self->_startDate;
    if (v4->_daysToDisplay == 1)
    {
      v11 = v10;
    }
    else
    {
      -[EKCalendarDate calendarDateByAddingDays:](v10, "calendarDateByAddingDays:", LODWORD(v4->_daysToDisplay) - 1);
      v11 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    }
    endDate = v4->_endDate;
    v4->_endDate = v11;

    objc_sync_exit(v4);
    -[EKDayViewContent _computeDayStartsAndEnds](v4, "_computeDayStartsAndEnds");
    -[EKDayViewContent setNeedsLayout](v4, "setNeedsLayout");
  }

}

- (void)_computeDayStartsAndEnds
{
  EKCalendarDate *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;
  EKDayViewContent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_dayStarts, "removeAllObjects");
  v2 = obj->_startDate;
  if ((CalTimeDirectionIsLeftToRight() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[EKCalendarDate calendarDateByAddingDays:](v2, "calendarDateByAddingDays:", obj->_daysToDisplay - 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = -1;
    v2 = (EKCalendarDate *)v4;
  }
  if (obj->_daysToDisplay)
  {
    v5 = 0;
    do
    {
      -[EKCalendarDate calendarDateForEndOfDay](v2, "calendarDateForEndOfDay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v2, CFSTR("startDate"), v6, CFSTR("endDate"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](obj->_dayStarts, "addObject:", v7);
      -[EKCalendarDate calendarDateByAddingDays:](v2, "calendarDateByAddingDays:", v3);
      v8 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();

      ++v5;
      v2 = v8;
    }
    while (obj->_daysToDisplay > v5);
  }
  else
  {
    v8 = v2;
  }
  -[EKDayViewContent _updateShouldAnnotateAppEntitiesByDay](obj, "_updateShouldAnnotateAppEntitiesByDay");

  objc_sync_exit(obj);
}

- (void)loadOccurrences:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSMutableArray *v24;
  uint64_t i;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  char v33;
  EKEvent *selectedEvent;
  void *v35;
  void *v36;
  id v37;
  id obj;
  char v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD aBlock[5];
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v42 = objc_msgSend(v37, "count");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_daysToDisplay);
  if (self->_daysToDisplay)
  {
    v5 = 0;
    do
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < self->_daysToDisplay);
  }
  v35 = v4;
  if (v42)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__EKDayViewContent_loadOccurrences___block_invoke;
    aBlock[3] = &unk_1E6018860;
    aBlock[4] = self;
    v40 = v4;
    v53 = v40;
    v36 = _Block_copy(aBlock);
    v7 = 0;
    v8 = 0;
    while (1)
    {
      objc_msgSend(v37, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isProposedTimeEvent");
      v11 = (void *)MEMORY[0x1E0D0C2B8];
      if (v10)
      {
        objc_msgSend(v9, "proposedStartDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "duration");
        objc_msgSend(v11, "rangeWithStartDate:duration:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDateUnadjustedForLegacyClients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rangeWithStartDate:endDate:", v12, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[EKDayViewContent endDate](self, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "calendarDateByAddingDays:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0D0C2B8];
      -[EKDayViewContent startDate](self, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rangeWithStartDate:endDate:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v13, "intersectsRange:", v21))
        goto LABEL_15;
      if ((objc_msgSend(v9, "isProposedTimeEvent") & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v9, "eventStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "showDeclinedEvents"))
        break;
      v23 = objc_msgSend(v9, "participationStatus") == 3;

      if (!v23)
        goto LABEL_14;
LABEL_15:

      if (v42 == ++v8)
      {
        v24 = self->_singleItemsForPreloadByDay;
        objc_sync_enter(v24);
        -[NSMutableArray removeAllObjects](self->_singleItemsForPreloadByDay, "removeAllObjects");
        -[NSMutableArray addObjectsFromArray:](self->_singleItemsForPreloadByDay, "addObjectsFromArray:", v40);
        objc_sync_exit(v24);

        if (!self->_selectedEvent)
          goto LABEL_38;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v40;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        if (v43)
        {
          v39 = 0;
          v41 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v49 != v41)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v27 = v26;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v45;
                while (2)
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v45 != v29)
                      objc_enumerationMutation(v27);
                    objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "view");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "occurrence");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "isEqual:", self->_selectedEvent);

                    if ((v33 & 1) != 0)
                    {
                      v39 = 1;
                      goto LABEL_32;
                    }
                  }
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
                  if (v28)
                    continue;
                  break;
                }
              }
LABEL_32:

            }
            v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
          }
          while (v43);

          if ((v39 & 1) != 0)
          {
LABEL_38:

            goto LABEL_39;
          }
        }
        else
        {

        }
        selectedEvent = self->_selectedEvent;
        self->_selectedEvent = 0;

        goto LABEL_38;
      }
    }

LABEL_14:
    (*((void (**)(void *, void *, uint64_t, uint64_t))v36 + 2))(v36, v9, v7++, objc_msgSend(v9, "isProposedTimeEvent"));
    goto LABEL_15;
  }
LABEL_39:
  self->_dataLoaded = 1;

}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)loadAndLayoutOccurrences:(id)a3 reverse:(BOOL)a4
{
  unint64_t daysToDisplay;
  unint64_t v7;
  unint64_t v8;

  -[EKDayViewContent loadOccurrences:](self, "loadOccurrences:", a3);
  daysToDisplay = self->_daysToDisplay;
  if (a4)
  {
    v7 = daysToDisplay - 1;
    if ((uint64_t)(daysToDisplay - 1) >= 0)
    {
      do
        -[EKDayViewContent _layoutDay:isLoadingAsync:](self, "_layoutDay:isLoadingAsync:", v7--, 1);
      while (v7 != -1);
    }
  }
  else if (daysToDisplay)
  {
    v8 = 0;
    do
      -[EKDayViewContent _layoutDay:isLoadingAsync:](self, "_layoutDay:isLoadingAsync:", v8++, 1);
    while (v8 < self->_daysToDisplay);
  }
}

- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = v10;
  if (self->_dataLoaded)
  {
    -[EKDayViewContent allVisibleItems](self, "allVisibleItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8)
    {
      v14 = 1;
      if (!v6)
        goto LABEL_4;
    }
    else
    {
      v14 = objc_msgSend(v12, "count");
      if (!v6)
      {
LABEL_4:
        v15 = 0;
        if (!v8)
        {
LABEL_5:
          v16 = 0;
LABEL_11:
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __83__EKDayViewContent_applyLoadedOccurrencesWithBatching_animated_reverse_completion___block_invoke;
          v17[3] = &unk_1E6018838;
          v17[4] = self;
          v18 = v11;
          -[EKDayViewContent applyLoadedOccurrenceBatchStartingAtIndex:batchSize:fromArray:withStartDate:animated:reverse:completion:](self, "applyLoadedOccurrenceBatchStartingAtIndex:batchSize:fromArray:withStartDate:animated:reverse:completion:", v15, v14, v13, v16, v7, v6, v17);

          goto LABEL_12;
        }
LABEL_10:
        -[EKDayViewContent startDate](self, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v15 = objc_msgSend(v13, "count") - 1;
    if (!v8)
      goto LABEL_5;
    goto LABEL_10;
  }
  if (v10)
    (*((void (**)(id))v10 + 2))(v10);
LABEL_12:

}

- (void)saveTemporaryViews
{
  EKDayViewContent *v2;
  uint64_t v3;
  unint64_t v4;
  EKDayViewContent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *obj;
  EKDayViewContent *v17;

  v2 = self;
  objc_sync_enter(v2);
  ++v2->_saveTemporaryViewsEntryCount;
  objc_sync_exit(v2);

  obj = v2->_itemsByDay;
  objc_sync_enter(obj);
  v3 = -[NSMutableArray count](v2->_itemsByDay, "count");
  if (v3 >= 1)
  {
    v4 = 0;
    v17 = v2;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](v2->_itemsByDay, "objectAtIndexedSubscript:", v4);
      v5 = v2;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 >= -[NSMutableArray count](v5->_temporaryViewCacheByDay, "count"))
      {
        v7 = (void *)objc_opt_new();
        -[NSMutableArray addObject:](v17->_temporaryViewCacheByDay, "addObject:", v7);

      }
      -[NSMutableArray objectAtIndexedSubscript:](v17->_temporaryViewCacheByDay, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "count");
      if (v9 >= 1)
      {
        for (i = 0; i != v9; ++i)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "event");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "calendarItemIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (v14)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v14);
                objc_msgSend(v11, "setView:", 0);
              }
            }
          }

        }
      }

      ++v4;
      v2 = v17;
    }
    while (v4 != v3);
  }
  objc_sync_exit(obj);

}

- (void)prepareForReuseIsReload:(BOOL)a3
{
  NSMutableArray *v5;
  unint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  unint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  _QWORD block[4];
  NSObject *v20;
  void (**v21)(_QWORD);
  _QWORD aBlock[5];

  self->_dataLoaded = 0;
  v5 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v5);
  -[NSMutableArray removeAllObjects](self->_singleItemsForPreloadByDay, "removeAllObjects");
  if (self->_daysToDisplay)
  {
    v6 = 0;
    v7 = MEMORY[0x1E0C9AA60];
    do
    {
      -[NSMutableArray addObject:](self->_singleItemsForPreloadByDay, "addObject:", v7);
      ++v6;
    }
    while (v6 < self->_daysToDisplay);
  }
  objc_sync_exit(v5);

  v8 = self->_displayItemsForPreloadByDay;
  objc_sync_enter(v8);
  -[NSMutableArray removeAllObjects](self->_displayItemsForPreloadByDay, "removeAllObjects");
  if (self->_daysToDisplay)
  {
    v9 = 0;
    v10 = MEMORY[0x1E0C9AA60];
    do
    {
      -[NSMutableArray addObject:](self->_displayItemsForPreloadByDay, "addObject:", v10);
      ++v9;
    }
    while (v9 < self->_daysToDisplay);
  }
  objc_sync_exit(v8);

  v11 = self->_displayItemsForPreloadByDayByEndDate;
  objc_sync_enter(v11);
  -[NSMutableArray removeAllObjects](self->_displayItemsForPreloadByDayByEndDate, "removeAllObjects");
  if (self->_daysToDisplay)
  {
    v12 = 0;
    v13 = MEMORY[0x1E0C9AA60];
    do
    {
      -[NSMutableArray addObject:](self->_displayItemsForPreloadByDayByEndDate, "addObject:", v13);
      ++v12;
    }
    while (v12 < self->_daysToDisplay);
  }
  objc_sync_exit(v11);

  if (!a3)
  {
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__EKDayViewContent_prepareForReuseIsReload___block_invoke;
    aBlock[3] = &unk_1E6018688;
    aBlock[4] = self;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v15[2](v15);
    }
    else
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __44__EKDayViewContent_prepareForReuseIsReload___block_invoke_2;
      block[3] = &unk_1E6018838;
      v20 = v16;
      v21 = v15;
      v17 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v18 = dispatch_time(0, 200000000);
      dispatch_group_wait(v17, v18);

    }
  }
}

- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 backgroundColor:(id)a6 opaque:(BOOL)a7 isMiniPreviewInEventDetail:(BOOL)a8 numberOfDaysToDisplay:(unint64_t)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  double width;
  double y;
  double x;
  id v18;
  double v19;
  EKDayViewContent *v20;
  EKDayViewContent *v21;
  double v22;
  NSObject *v23;
  EKDayGridView *v24;
  uint64_t v25;
  EKDayGridView *grid;
  uint64_t v27;
  NSCalendar *calendar;
  uint64_t v29;
  NSMutableArray *dayStarts;
  uint64_t v31;
  NSMutableArray *lastLayoutWidthForDay;
  unint64_t v33;
  CGSize v34;
  void *v35;
  uint64_t v36;
  NSMutableArray *singleItemsForPreloadByDay;
  uint64_t v38;
  NSMutableArray *displayItemsForPreloadByDay;
  uint64_t v40;
  NSMutableArray *displayItemsForPreloadByDayByEndDate;
  uint64_t v42;
  NSMutableArray *singleItemsByDay;
  uint64_t v44;
  NSMutableArray *itemsByDay;
  uint64_t v46;
  NSMutableArray *itemsByDayByEndDate;
  uint64_t v48;
  NSMutableArray *reusableViews;
  uint64_t v50;
  NSMutableArray *temporaryViewCacheByDay;
  uint64_t v52;
  NSMutableArray *geometryDelegates;
  unint64_t v54;
  EKDayViewContentGeometryDelegate *v55;
  __int16 v57[8];
  objc_super v58;

  v10 = a8;
  v11 = a7;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a6;
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", a4, a5);
  v58.receiver = self;
  v58.super_class = (Class)EKDayViewContent;
  v20 = -[EKDayViewContent initWithFrame:](&v58, sel_initWithFrame_, x, y, width, v19);
  v21 = v20;
  if (v20)
  {
    -[EKDayViewContent setOpaque:](v20, "setOpaque:", v11);
    -[EKDayViewContent bounds](v21, "bounds");
    if (v22 < 0.0)
    {
      v23 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v57[0] = 0;
        _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_ERROR, "EKDayContentView initialized with negative width", (uint8_t *)v57, 2u);
      }
    }
    v24 = [EKDayGridView alloc];
    -[EKDayViewContent bounds](v21, "bounds");
    v25 = -[EKDayGridView initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:](v24, "initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:", a4, v18, v11, a9);
    grid = v21->_grid;
    v21->_grid = (EKDayGridView *)v25;

    -[EKDayGridView setAutoresizingMask:](v21->_grid, "setAutoresizingMask:", 18);
    -[EKDayViewContent addSubview:](v21, "addSubview:", v21->_grid);
    -[EKDayViewContent setAllowsOccurrenceSelection:](v21, "setAllowsOccurrenceSelection:", 1);
    -[EKDayViewContent setEventsFillGrid:](v21, "setEventsFillGrid:", 0);
    CUIKCalendar();
    v27 = objc_claimAutoreleasedReturnValue();
    calendar = v21->_calendar;
    v21->_calendar = (NSCalendar *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a9);
    dayStarts = v21->_dayStarts;
    v21->_dayStarts = (NSMutableArray *)v29;

    v21->_daysToDisplay = a9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a9);
    v31 = objc_claimAutoreleasedReturnValue();
    lastLayoutWidthForDay = v21->_lastLayoutWidthForDay;
    v21->_lastLayoutWidthForDay = (NSMutableArray *)v31;

    if (v21->_daysToDisplay)
    {
      v33 = 0;
      do
        -[NSMutableArray setObject:atIndexedSubscript:](v21->_lastLayoutWidthForDay, "setObject:atIndexedSubscript:", &unk_1E606F078, v33++);
      while (v21->_daysToDisplay > v33);
    }
    v21->_visiblePinnedStackHeightAbove = (double *)malloc_type_calloc(a9, 8uLL, 0x100004000313F17uLL);
    v21->_visiblePinnedStackHeightBelow = (double *)malloc_type_calloc(a9, 8uLL, 0x100004000313F17uLL);
    -[EKDayViewContent setIsMiniPreviewInEventDetail:](v21, "setIsMiniPreviewInEventDetail:", v10);
    v34 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v21->_latestVisibleRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v21->_latestVisibleRect.size = v34;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v21, sel__tapRecognized_);
    objc_msgSend(v35, "setDelegate:", v21);
    -[EKDayViewContent addGestureRecognizer:](v21, "addGestureRecognizer:", v35);
    v21->_offscreenOccurrencePinningEnabled = 1;
    v36 = objc_opt_new();
    singleItemsForPreloadByDay = v21->_singleItemsForPreloadByDay;
    v21->_singleItemsForPreloadByDay = (NSMutableArray *)v36;

    v38 = objc_opt_new();
    displayItemsForPreloadByDay = v21->_displayItemsForPreloadByDay;
    v21->_displayItemsForPreloadByDay = (NSMutableArray *)v38;

    v40 = objc_opt_new();
    displayItemsForPreloadByDayByEndDate = v21->_displayItemsForPreloadByDayByEndDate;
    v21->_displayItemsForPreloadByDayByEndDate = (NSMutableArray *)v40;

    v42 = objc_opt_new();
    singleItemsByDay = v21->_singleItemsByDay;
    v21->_singleItemsByDay = (NSMutableArray *)v42;

    v44 = objc_opt_new();
    itemsByDay = v21->_itemsByDay;
    v21->_itemsByDay = (NSMutableArray *)v44;

    v46 = objc_opt_new();
    itemsByDayByEndDate = v21->_itemsByDayByEndDate;
    v21->_itemsByDayByEndDate = (NSMutableArray *)v46;

    v48 = objc_opt_new();
    reusableViews = v21->_reusableViews;
    v21->_reusableViews = (NSMutableArray *)v48;

    v21->_sizeClass = a4;
    v50 = objc_opt_new();
    temporaryViewCacheByDay = v21->_temporaryViewCacheByDay;
    v21->_temporaryViewCacheByDay = (NSMutableArray *)v50;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21->_daysToDisplay);
    v52 = objc_claimAutoreleasedReturnValue();
    geometryDelegates = v21->_geometryDelegates;
    v21->_geometryDelegates = (NSMutableArray *)v52;

    if (v21->_daysToDisplay)
    {
      v54 = 0;
      do
      {
        v55 = objc_alloc_init(EKDayViewContentGeometryDelegate);
        -[EKDayViewContentGeometryDelegate setDayViewContent:](v55, "setDayViewContent:", v21);
        -[NSMutableArray setObject:atIndexedSubscript:](v21->_geometryDelegates, "setObject:atIndexedSubscript:", v55, v54);

        ++v54;
      }
      while (v21->_daysToDisplay > v54);
    }

  }
  return v21;
}

- (EKDayViewContent)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  EKDayViewContent *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKDayViewContent initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:](self, "initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:", a4, a5, v12, 1, 0, 1, x, y, width, height);

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  free(self->_visiblePinnedStackHeightAbove);
  free(self->_visiblePinnedStackHeightBelow);
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewContent;
  -[EKDayViewContent dealloc](&v4, sel_dealloc);
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  self->_useMultiDayStyle = a3;
  -[EKDayGridView setUseMultiDayStyle:](self->_grid, "setUseMultiDayStyle:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[EKDayGridView sizeThatFits:](self->_grid, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)singleItemsByDay
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_singleItemsByDay;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_singleItemsByDay, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (id)singleItemsForPreloadByDay
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_singleItemsForPreloadByDay;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_singleItemsForPreloadByDay, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (EKEvent)selectedEvent
{
  return self->_selectedEvent;
}

- (void)selectEvent:(id)a3
{
  EKEvent *v5;
  EKEvent *v6;

  v5 = (EKEvent *)a3;
  if (self->_selectedEvent != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedEvent, a3);
    v5 = v6;
  }

}

- (void)setShowsLeftBorder:(BOOL)a3
{
  -[EKDayGridView setShowsLeftBorder:](self->_grid, "setShowsLeftBorder:", a3);
}

- (BOOL)showsLeftBorder
{
  return -[EKDayGridView showsLeftBorder](self->_grid, "showsLeftBorder");
}

- (void)setFixedDayWidth:(double)a3
{
  void *v5;

  if (self->_fixedDayWidth != a3)
  {
    self->_fixedDayWidth = a3;
    -[EKDayViewContent grid](self, "grid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFixedDayWidth:", a3);

    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHoursToPadTop:(double)a3
{
  -[EKDayGridView setHoursToPadTop:](self->_grid, "setHoursToPadTop:", a3);
}

- (void)setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  _BOOL8 v3;
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
  if (self->_reduceLayoutProcessingForAnimation != a3)
  {
    v3 = a3;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[EKDayViewContent occurrenceViews](self, "occurrenceViews", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setReduceLayoutProcessingForAnimation:", v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    self->_reduceLayoutProcessingForAnimation = v3;
  }
}

- (void)setCalendar:(id)a3
{
  char v4;
  void *v5;
  NSCalendar *v6;
  NSCalendar *calendar;
  EKDayViewContent *v8;
  EKCalendarDate *startDate;
  void *v10;
  uint64_t v11;
  EKCalendarDate *v12;
  EKCalendarDate *endDate;
  void *v14;
  uint64_t v15;
  EKCalendarDate *v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "isEqual:", self->_calendar);
  v5 = v17;
  if ((v4 & 1) == 0)
  {
    v6 = (NSCalendar *)objc_msgSend(v17, "copy");
    calendar = self->_calendar;
    self->_calendar = v6;

    v8 = self;
    objc_sync_enter(v8);
    startDate = v8->_startDate;
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarDate calendarDateInTimeZone:](startDate, "calendarDateInTimeZone:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v8->_startDate;
    v8->_startDate = (EKCalendarDate *)v11;

    endDate = v8->_endDate;
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarDate calendarDateInTimeZone:](endDate, "calendarDateInTimeZone:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v8->_endDate;
    v8->_endDate = (EKCalendarDate *)v15;

    objc_sync_exit(v8);
    -[EKDayViewContent _computeDayStartsAndEnds](v8, "_computeDayStartsAndEnds");
    v5 = v17;
  }

}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  EKDayViewContent *v6;
  uint64_t v7;
  EKCalendarDate *startDate;
  uint64_t v9;
  EKCalendarDate *endDate;
  id v11;

  v11 = a3;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "isEqualToTimeZone:", v4);

  if ((v5 & 1) == 0)
  {
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v11);
    v6 = self;
    objc_sync_enter(v6);
    -[EKCalendarDate calendarDateInTimeZone:](v6->_startDate, "calendarDateInTimeZone:", v11);
    v7 = objc_claimAutoreleasedReturnValue();
    startDate = v6->_startDate;
    v6->_startDate = (EKCalendarDate *)v7;

    -[EKCalendarDate calendarDateInTimeZone:](v6->_endDate, "calendarDateInTimeZone:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
    endDate = v6->_endDate;
    v6->_endDate = (EKCalendarDate *)v9;

    objc_sync_exit(v6);
    -[EKDayViewContent _computeDayStartsAndEnds](v6, "_computeDayStartsAndEnds");
  }

}

- (NSTimeZone)timeZone
{
  return -[NSCalendar timeZone](self->_calendar, "timeZone");
}

- (void)setOccurrenceTitleColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_occurrenceTitleColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTitleColor, a3);
    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setOccurrenceTimeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_occurrenceTimeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTimeColor, a3);
    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setOccurrenceLocationColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_occurrenceLocationColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceLocationColor, a3);
    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setOccurrenceTextBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_occurrenceTextBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_occurrenceTextBackgroundColor, a3);
    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIEdgeInsets)insetsForInterfaceLayout:(UIEdgeInsets)a3
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
  int IsLeftToRight;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  if (IsLeftToRight)
    v8 = left;
  else
    v8 = right;
  if (IsLeftToRight)
    v9 = right;
  else
    v9 = left;
  v10 = top;
  v11 = bottom;
  result.right = v9;
  result.bottom = v11;
  result.left = v8;
  result.top = v10;
  return result;
}

- (void)setOccurrencePadding:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  -[EKDayViewContent insetsForInterfaceLayout:](self, "insetsForInterfaceLayout:", a3.top, a3.left, a3.bottom, a3.right);
  if (!self->_hasCustomOccurrencePadding
    || (v5 == self->_occurrencePadding.left ? (v8 = v4 == self->_occurrencePadding.top) : (v8 = 0),
        v8 ? (v9 = v7 == self->_occurrencePadding.right) : (v9 = 0),
        v9 ? (v10 = v6 == self->_occurrencePadding.bottom) : (v10 = 0),
        !v10))
  {
    self->_occurrencePadding.top = v4;
    self->_occurrencePadding.left = v5;
    self->_occurrencePadding.bottom = v6;
    self->_occurrencePadding.right = v7;
    self->_hasCustomOccurrencePadding = 1;
    -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "isReminderStack"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "occurrences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dayViewContent:didSelectEvents:userInitiated:", self, v9, a4 == 0);
LABEL_6:

      goto LABEL_7;
    }
  }
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "occurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dayViewContent:didSelectEvent:userInitiated:", self, v9, a4 == 0);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)presentationControllerForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationControllerForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "selectedEventsForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedCopyViewForDayOccurrenceView:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "dayViewContent:selectedCopyViewForOccurrenceView:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)attemptDisplayReviewPrompt
{
  EKDayViewContentDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (BOOL)_shouldAnnotateAppEntitiesForDayAtIndex:(unint64_t)a3
{
  NSMutableArray *shouldAnnotateAppEntitiesByDay;
  void *v6;
  char v7;

  shouldAnnotateAppEntitiesByDay = self->_shouldAnnotateAppEntitiesByDay;
  if (!shouldAnnotateAppEntitiesByDay)
  {
    -[EKDayViewContent _updateShouldAnnotateAppEntitiesByDay](self, "_updateShouldAnnotateAppEntitiesByDay");
    shouldAnnotateAppEntitiesByDay = self->_shouldAnnotateAppEntitiesByDay;
  }
  if (-[NSMutableArray count](shouldAnnotateAppEntitiesByDay, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_shouldAnnotateAppEntitiesByDay, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)_updateShouldAnnotateAppEntitiesByDay
{
  void *v3;
  char v4;
  uint64_t v5;
  NSMutableArray *shouldAnnotateAppEntitiesByDay;
  uint64_t v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[EKDayViewContent delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = 528;
    shouldAnnotateAppEntitiesByDay = self->_shouldAnnotateAppEntitiesByDay;
    if (shouldAnnotateAppEntitiesByDay)
    {
      -[NSMutableArray removeAllObjects](shouldAnnotateAppEntitiesByDay, "removeAllObjects");
      v7 = 440;
    }
    else
    {
      v7 = 440;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_daysToDisplay);
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_shouldAnnotateAppEntitiesByDay;
      self->_shouldAnnotateAppEntitiesByDay = v8;

    }
    if (self->_daysToDisplay)
    {
      v10 = 0;
      v23 = 440;
      v24 = 528;
      do
      {
        if ((unint64_t)v10 >= -[NSMutableArray count](self->_dayStarts, "count", v23, v24))
          break;
        -[NSMutableArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("startDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKDayViewContent delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "dayViewContentShouldAnnotateAppEntities:onDayStarting:", self, v12);

        v15 = *(Class *)((char *)&self->super.super.super.isa + v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);

        if ((unint64_t)v10 < -[NSMutableArray count](self->_itemsByDay, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_itemsByDay, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v26;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v26 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "view");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setShouldAnnotateAppEntities:", v14);

                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            }
            while (v19);
          }

          v7 = v23;
          v5 = v24;
        }

        v10 = (objc_class *)((char *)v10 + 1);
      }
      while (v10 != *(objc_class **)((char *)&self->super.super.super.isa + v7));
    }
  }
}

- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EKDayViewContent allVisibleItems](self, "allVisibleItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "occurrence");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if (v15)
        {
          objc_msgSend(v12, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDimmed:", v4);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (id)occurrenceViewForEvent:(id)a3 onDate:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGPoint v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKDayGridView occurrenceContainerView](self->_grid, "occurrenceContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v15, "tag", (_QWORD)v24) == 2423)
        {
          objc_msgSend(v15, "occurrences");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v6);

          if (v17)
          {
            if (!v12)
              v12 = v15;
            if (a4 != 0.0)
            {
              -[EKDayViewContent pointForDate:](self, "pointForDate:", a4);
              -[EKDayViewContent convertPoint:toView:](self, "convertPoint:toView:", v15);
              v19 = v18;
              v21 = v20;
              objc_msgSend(v15, "bounds");
              v30.x = v19;
              v30.y = v21;
              if (CGRectContainsPoint(v31, v30))
              {
                v22 = v15;

                goto LABEL_18;
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }

  v12 = v12;
  v22 = v12;
LABEL_18:

  return v22;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[EKDayGridView occurrenceContainerView](self->_grid, "occurrenceContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "tag", (_QWORD)v15) == 2423)
          {
            objc_msgSend(v11, "occurrences");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "containsObject:", v4);

            if ((v13 & 1) != 0)
            {
              v8 = v11;
              goto LABEL_14;
            }
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setDarkensWeekends:(BOOL)a3
{
  UIView *v4;
  UIView *sundayDarkeningView;
  void *v6;
  UIView *v7;
  UIView *saturdayDarkeningView;
  void *v9;
  UIView *v10;
  UIView *v11;

  if (self->_darkensWeekends != a3)
  {
    self->_darkensWeekends = a3;
    if (a3)
    {
      if (!self->_sundayDarkeningView)
      {
        v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        sundayDarkeningView = self->_sundayDarkeningView;
        self->_sundayDarkeningView = v4;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.05);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_sundayDarkeningView, "setBackgroundColor:", v6);

        -[EKDayGridView insertSubview:atIndex:](self->_grid, "insertSubview:atIndex:", self->_sundayDarkeningView, 0);
      }
      if (!self->_saturdayDarkeningView)
      {
        v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        saturdayDarkeningView = self->_saturdayDarkeningView;
        self->_saturdayDarkeningView = v7;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.05);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_saturdayDarkeningView, "setBackgroundColor:", v9);

        -[EKDayGridView insertSubview:atIndex:](self->_grid, "insertSubview:atIndex:", self->_saturdayDarkeningView, 0);
      }
      -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIView removeFromSuperview](self->_saturdayDarkeningView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_sundayDarkeningView, "removeFromSuperview");
      v10 = self->_saturdayDarkeningView;
      self->_saturdayDarkeningView = 0;

      v11 = self->_sundayDarkeningView;
      self->_sundayDarkeningView = 0;

    }
  }
}

uint64_t __40__EKDayViewContent__layoutDaysIfVisible__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "clearTemporaryViews");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 640) = 0;
  return result;
}

- (BOOL)_layoutNeededForDay:(int64_t)a3 isLoadingAsync:(BOOL)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  CGRect v18;

  -[NSMutableArray objectAtIndexedSubscript:](self->_lastLayoutWidthForDay, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  -[EKDayViewContent frame](self, "frame");
  v11 = vabdd_f64(v9, v10);

  if (v11 < 2.22044605e-16)
    return 0;
  -[EKDayViewContent _dayWidth](self, "_dayWidth");
  v13 = v12;
  -[EKDayViewContent frame](self, "frame");
  v18.origin.y = 0.0;
  v18.origin.x = v13 * (double)a3;
  v18.size.width = v13;
  if (!CGRectIntersectsRect(v18, self->_latestVisibleRect))
    return 0;
  if (a4)
    -[EKDayViewContent singleItemsForPreloadByDay](self, "singleItemsForPreloadByDay");
  else
    -[EKDayViewContent singleItemsByDay](self, "singleItemsByDay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v16, "count") != 0;
  return v14;
}

- (BOOL)_layoutDayIfNeeded:(int64_t)a3 isLoadingAsync:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;

  v4 = a4;
  v7 = -[EKDayViewContent _layoutNeededForDay:isLoadingAsync:](self, "_layoutNeededForDay:isLoadingAsync:");
  if (v7)
    -[EKDayViewContent _layoutDay:isLoadingAsync:](self, "_layoutDay:isLoadingAsync:", a3, v4);
  return v7;
}

- (double)firstEventSecond
{
  double v2;
  void *v4;
  uint64_t v5;
  char IsLeftToRight;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  EKCalendarDate *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = -1.0;
  if (self->_daysToDisplay == 1)
  {
    -[EKDayViewContent singleItemsByDay](self, "singleItemsByDay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      IsLeftToRight = CalTimeDirectionIsLeftToRight();
      -[EKDayViewContent singleItemsByDay](self, "singleItemsByDay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((IsLeftToRight & 1) != 0)
        objc_msgSend(v7, "firstObject");
      else
        objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteTime");
        v13 = v12;
        -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
        if (v13 < v14)
        {
          v15 = self->_startDate;

          v11 = v15;
        }
        v16 = 3600 * objc_msgSend(v11, "hour");
        v17 = v16 + 60 * objc_msgSend(v11, "minute");
        v2 = (double)(v17 + objc_msgSend(v11, "second"));

      }
    }
  }
  return v2;
}

- (id)lastDisplayedSecond
{
  void *v3;
  int IsLeftToRight;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKDayViewContent dayStarts](self, "dayStarts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[EKDayViewContent _computeDayStartsAndEnds](self, "_computeDayStartsAndEnds");
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  -[EKDayViewContent dayStarts](self, "dayStarts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (IsLeftToRight)
    objc_msgSend(v5, "lastObject");
  else
    objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __124__EKDayViewContent_applyLoadedOccurrenceBatchStartingAtIndex_batchSize_fromArray_withStartDate_animated_reverse_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyLoadedOccurrenceBatchStartingAtIndex:batchSize:fromArray:withStartDate:animated:reverse:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 56));
}

- (void)applyContentItem:(id)a3 toView:(id)a4 shouldAnnotate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a5;
  v12 = a4;
  v8 = a3;
  objc_msgSend(v8, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsProposedTime:", objc_msgSend(v8, "isProposedTime"));
  objc_msgSend(v8, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOccurrences:", v10);

  objc_msgSend(v8, "setView:", v12);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setUsesSmallText:", self->_usesSmallText);
  objc_msgSend(v12, "setUserInteractionEnabled:", self->_allowsOccurrenceSelection);
  objc_msgSend(v12, "setTag:", 2423);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setDimmed:", objc_msgSend(v8, "isProposedTime"));
  objc_msgSend(v12, "setHasPrecedingDuration:", objc_msgSend(v8, "hasPrecedingDuration"));
  objc_msgSend(v12, "setHasTrailingDuration:", objc_msgSend(v8, "hasTrailingDuration"));
  objc_msgSend(v12, "setMultiAllDayRoundCorners:", 1);
  v11 = objc_msgSend(v8, "occurrenceIsFirstVisibleDayOfEvent");

  objc_msgSend(v12, "setOccurrenceIsFirstVisibleDayOfEvent:", v11);
  objc_msgSend(v12, "setIsSelectedCopyView:", 0);
  objc_msgSend(v12, "setShouldAnnotateAppEntities:", v5);
  -[EKDayViewContent _configureOccurrenceViewMarginAndPadding:](self, "_configureOccurrenceViewMarginAndPadding:", v12);
  if (self->_hasCustomOccurrencePadding)
  {
    -[EKDayViewContent occurrencePadding](self, "occurrencePadding");
    objc_msgSend(v12, "setPadding:");
  }
  if (objc_msgSend(v9, "isEqual:", self->_dimmedOccurrence))
    objc_msgSend(v12, "setDimmed:", 1);

}

void __44__EKDayViewContent_prepareForReuseIsReload___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  objc_sync_enter(v2);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v14;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "view");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "prepareForReuse");

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void __44__EKDayViewContent_prepareForReuseIsReload___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setOccurrences:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_waitingForSynchronousLayoutToReapplyViews)
  {
    -[EKDayViewContent saveTemporaryViews](self, "saveTemporaryViews");
    self->_waitingForSynchronousLayoutToReapplyViews = 1;
  }
  -[EKDayViewContent prepareForReuseIsReload:](self, "prepareForReuseIsReload:", 1);
  -[EKDayViewContent loadOccurrences:](self, "loadOccurrences:", v4);
  -[EKDayViewContent movePreloadedItemsToVisible](self, "movePreloadedItemsToVisible");
  -[EKDayViewContent setNeedsLayout](self, "setNeedsLayout");

}

void __42__EKDayViewContent__adjustViewsForPinning__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double MaxY;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;

        v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v18;
        objc_msgSend(v9, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isHidden"))
        {
          v39.origin.x = v12;
          v39.origin.y = v19;
          v39.size.width = v16;
          v39.size.height = v18;
          v21 = CGRectIntersectsRect(v39, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536));

          if (!v21)
            continue;
        }
        else
        {

        }
        v40.origin.x = v12;
        v40.origin.y = v14;
        v40.size.width = v16;
        v40.size.height = v18;
        if (!CGRectIntersectsRect(v40, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536)))
        {
          v41.origin.x = v12;
          v41.origin.y = v19;
          v41.size.width = v16;
          v41.size.height = v18;
          if (!CGRectIntersectsRect(v41, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536)))
            continue;
        }
        objc_msgSend(v9, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFrame:", v12, v19, v16, v18);

        objc_msgSend(v9, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isHidden"))
        {
          v42.origin.x = v12;
          v42.origin.y = v19;
          v42.size.width = v16;
          v42.size.height = v18;
          v24 = CGRectIntersectsRect(v42, *(CGRect *)(*(_QWORD *)(a1 + 32) + 536));

          if (!v24)
            continue;
          objc_msgSend(v9, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setHidden:", 0);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }
  CalRoundToScreenScale(3.5);
  v26 = v25;
  if (a3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 + 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "unPinnedViewFrame");
    MaxY = CGRectGetMaxY(v43);
    objc_msgSend(v27, "unPinnedViewFrame");
    v31 = MaxY - CGRectGetMaxY(v44);
    if (v26 >= v31)
      v26 = v31;

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v26
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

- (BOOL)eventsIntersectRect:(CGRect)a3
{
  CGFloat x;
  id v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t i;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double height;
  double v18;
  CGFloat y;
  CGFloat width;
  CGFloat r1;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  width = a3.size.width;
  r1 = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  -[EKDayViewContent occurrenceViews](self, "occurrenceViews");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    v7 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "frame");
        v31.origin.x = v12;
        v31.origin.y = v13;
        v31.size.width = v14;
        v16 = v15;
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = r1;
        v31.size.height = v16;
        v30 = CGRectIntersection(v29, v31);
        height = v30.size.height;
        v32.origin.x = v7;
        v32.origin.y = v8;
        v32.size.width = v9;
        v32.size.height = v10;
        if (!CGRectEqualToRect(v30, v32))
        {
          v18 = v16 + -1.0;
          if (v16 + -1.0 > 1800.0)
            v18 = 1800.0;
          if (height > v18)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  return v5;
}

- (BOOL)_getBottomPinRegion:(double *)a3 dayIndex:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y;
  double x;
  double v10;
  unint64_t v11;
  CGFloat MaxY;
  double *visiblePinnedStackHeightBelow;
  double v14;
  double v15;
  double v16;

  y = a5.y;
  x = a5.x;
  -[EKDayViewContent _dayWidth](self, "_dayWidth");
  v11 = (unint64_t)(x / v10);
  MaxY = CGRectGetMaxY(self->_latestVisibleRect);
  visiblePinnedStackHeightBelow = self->_visiblePinnedStackHeightBelow;
  v14 = visiblePinnedStackHeightBelow[v11];
  v15 = MaxY - v14;
  if (a4)
    *a4 = v11;
  v16 = v15 + -3.0;
  if (a3)
  {
    *a3 = v16;
    v14 = visiblePinnedStackHeightBelow[v11];
  }
  return y >= v16 && v14 > 0.0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  char v6;
  void *v7;
  char isKindOfClass;

  v5 = a4;
  objc_msgSend(v5, "locationInView:", self);
  if (-[EKDayViewContent _getBottomPinRegion:dayIndex:forPoint:](self, "_getBottomPinRegion:dayIndex:forPoint:", 0, 0))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v6 = isKindOfClass ^ 1;
  }

  return v6 & 1;
}

- (void)_tapRecognized:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  char v16;
  id WeakRetained;
  char v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  double v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  v27 = 0;
  v28 = 0.0;
  if (!-[EKDayViewContent _getBottomPinRegion:dayIndex:forPoint:](self, "_getBottomPinRegion:dayIndex:forPoint:", &v28, &v27))
  {
    -[EKDayGridView hitTest:withEvent:](self->_grid, "hitTest:withEvent:", 0, v5, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_20;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_20;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKDayViewContent dateForPoint:](self, "dateForPoint:", v5, v7);
    objc_msgSend(v9, "dayViewContent:didTapInEmptySpaceOnDay:", self);
LABEL_19:

    goto LABEL_20;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[EKDayViewContent visibleItemsByDay](self, "visibleItemsByDay", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (!v10)
    goto LABEL_19;
  v11 = *(_QWORD *)v24;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v11)
      objc_enumerationMutation(v9);
    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    if (v15 >= v28)
      break;

LABEL_10:
    if (v10 == (id)++v12)
    {
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v10)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  v16 = objc_msgSend(v13, "isPinned");

  if ((v16 & 1) == 0)
    goto LABEL_10;
  v10 = v13;

  if (v10)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "occurrence");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dayViewContent:didTapPinnedOccurrence:", self, v22);

      goto LABEL_19;
    }
  }
LABEL_20:

}

- (BOOL)itemIsEligibleForGrouping:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReminderIntegrationEvent");

  return v4;
}

- (id)groupItem:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  EKDayViewContentItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "eventIndex");
  v12 = objc_msgSend(v6, "eventIndex");
  if (v11 >= v12)
    v11 = v12;
  v13 = -[EKDayViewContentItem initWithEventIndex:sizeClass:]([EKDayViewContentItem alloc], "initWithEventIndex:sizeClass:", v11, self->_sizeClass);
  -[EKDayViewContentItem setEvents:](v13, "setEvents:", v10);
  -[EKDayViewContentItem setIsLoadingAsync:](v13, "setIsLoadingAsync:", objc_msgSend(v7, "isLoadingAsync"));
  -[EKDayViewContentItem setUsesSmallText:](v13, "setUsesSmallText:", objc_msgSend(v7, "usesSmallText"));
  objc_msgSend(v7, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  objc_msgSend(v6, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  objc_msgSend(v7, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isBeforeDate:", v19);

  if (v20)
    v21 = v16;
  else
    v21 = v17;
  v22 = v21;
  -[EKDayViewContentItem setStartDate:](v13, "setStartDate:", v22);
  -[EKDayViewContentItem setEndDate:](v13, "setEndDate:", v22);

  return v13;
}

- (CGRect)_occurrencePaddingBetweenDays:(CGRect)result
{
  double v3;
  double v4;
  double v5;

  v3 = result.origin.x + 2.0;
  v4 = result.origin.y + 0.0;
  v5 = result.size.width + -4.0;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (EKDayViewContentDelegate)delegate
{
  return (EKDayViewContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setOffscreenOccurrencePinningEnabled:(BOOL)a3
{
  self->_offscreenOccurrencePinningEnabled = a3;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)eventsFillGrid
{
  return self->_eventsFillGrid;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (BOOL)darkensWeekends
{
  return self->_darkensWeekends;
}

- (BOOL)reduceLayoutProcessingForAnimation
{
  return self->_reduceLayoutProcessingForAnimation;
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (UIColor)occurrenceTitleColor
{
  return self->_occurrenceTitleColor;
}

- (UIColor)occurrenceTimeColor
{
  return self->_occurrenceTimeColor;
}

- (UIColor)occurrenceLocationColor
{
  return self->_occurrenceLocationColor;
}

- (UIColor)occurrenceTextBackgroundColor
{
  return self->_occurrenceTextBackgroundColor;
}

- (UIEdgeInsets)occurrencePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_occurrencePadding.top;
  left = self->_occurrencePadding.left;
  bottom = self->_occurrencePadding.bottom;
  right = self->_occurrencePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_storeStrong((id *)&self->_occurrenceTextBackgroundColor, 0);
  objc_storeStrong((id *)&self->_occurrenceLocationColor, 0);
  objc_storeStrong((id *)&self->_occurrenceTimeColor, 0);
  objc_storeStrong((id *)&self->_occurrenceTitleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_temporaryViewCacheByDay, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_geometryDelegates, 0);
  objc_storeStrong((id *)&self->_shouldAnnotateAppEntitiesByDay, 0);
  objc_storeStrong((id *)&self->_itemsByDayByEndDate, 0);
  objc_storeStrong((id *)&self->_itemsByDay, 0);
  objc_storeStrong((id *)&self->_singleItemsByDay, 0);
  objc_storeStrong((id *)&self->_displayItemsForPreloadByDayByEndDate, 0);
  objc_storeStrong((id *)&self->_displayItemsForPreloadByDay, 0);
  objc_storeStrong((id *)&self->_singleItemsForPreloadByDay, 0);
  objc_storeStrong((id *)&self->_dayStarts, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_lastLayoutWidthForDay, 0);
  objc_storeStrong((id *)&self->_sundayDarkeningView, 0);
  objc_storeStrong((id *)&self->_saturdayDarkeningView, 0);
  objc_storeStrong((id *)&self->_grid, 0);
}

@end
