@implementation EKUIAvailabilityRowView

- (EKUIAvailabilityRowView)initWithParticipant:(id)a3
{
  id v5;
  EKUIAvailabilityRowView *v6;
  EKUIAvailabilityRowView *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *spanViews;
  uint64_t v11;
  NSMutableArray *spans;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUIAvailabilityRowView;
  v6 = -[EKUIAvailabilityRowView init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_participant, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityRowView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_opt_new();
    spanViews = v7->_spanViews;
    v7->_spanViews = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    spans = v7->_spans;
    v7->_spans = (NSMutableArray *)v11;

  }
  return v7;
}

- (void)startLoadForDate:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  EKUIAvailabilityRowView *v10;
  NSMutableArray *spans;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_startOfDay, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_spanViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "removeFromSuperview", (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableArray removeAllObjects](v10->_spans, "removeAllObjects");
  spans = v10->_spans;
  v10->_spans = 0;

  objc_sync_exit(v10);
}

- (void)completedLoad
{
  EKUIAvailabilityRowView *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *spans;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_spans)
  {
    -[NSDate dateByAddingTimeInterval:](v2->_startOfDay, "dateByAddingTimeInterval:", 86399.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA9FE0]), "initWithStartDate:endDate:type:", v2->_startOfDay, v3, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    spans = v2->_spans;
    v2->_spans = (NSMutableArray *)v5;

  }
  objc_sync_exit(v2);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EKUIAvailabilityRowView_completedLoad__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __40__EKUIAvailabilityRowView_completedLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSpanViews");
}

- (NSArray)spans
{
  EKUIAvailabilityRowView *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2->_spans);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addToSpans:(id)a3
{
  EKUIAvailabilityRowView *v4;
  id v5;
  NSMutableArray *spans;
  uint64_t v7;
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v9;
  spans = v4->_spans;
  if (!spans)
  {
    v7 = objc_opt_new();
    v8 = v4->_spans;
    v4->_spans = (NSMutableArray *)v7;

    spans = v4->_spans;
    v5 = v9;
  }
  -[NSMutableArray addObjectsFromArray:](spans, "addObjectsFromArray:", v5);
  -[NSMutableArray sortUsingComparator:](v4->_spans, "sortUsingComparator:", &__block_literal_global_17);
  objc_sync_exit(v4);

}

uint64_t __38__EKUIAvailabilityRowView_addToSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)updateSpanViews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
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

  v47 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = self->_spanViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v5);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[EKUIAvailabilityRowView spans](self, "spans");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v8)
  {
    v9 = v8;
    v36 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v38 != v36)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v11, "type") == 1 || objc_msgSend(v11, "type") == 5)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v11, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setStartDate:", v13);

          objc_msgSend(v11, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setEndDate:", v14);

          objc_msgSend(v12, "setInset:", 1);
          -[EKUIAvailabilityRowView frameForSpanView:](self, "frameForSpanView:", v12);
          objc_msgSend(v12, "setFrame:");
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "colorWithAlphaComponent:", 0.3);
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = objc_msgSend(v16, "CGColor");
          objc_msgSend(v12, "layer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setBackgroundColor:", v17);

          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v20 = objc_msgSend(v19, "CGColor");
          objc_msgSend(v12, "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setBorderColor:", v20);

          objc_msgSend(v12, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBorderWidth:", 1.5);

          +[EKUIAvailabilityRowView cornerRadius](EKUIAvailabilityRowView, "cornerRadius");
          v24 = v23;
          objc_msgSend(v12, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCornerRadius:", v24);

          objc_msgSend(v12, "layer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setMasksToBounds:", 1);

          -[NSMutableArray addObject:](self->_spanViews, "addObject:", v12);
          -[EKUIAvailabilityRowView addSubview:](self, "addSubview:", v12);

        }
        if (objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsUnavailable:", objc_msgSend(v11, "type")))
        {
          v27 = (void *)objc_opt_new();
          objc_msgSend(v11, "startDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setStartDate:", v28);

          objc_msgSend(v11, "endDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setEndDate:", v29);

          -[EKUIAvailabilityRowView frameForSpanView:](self, "frameForSpanView:", v27);
          objc_msgSend(v27, "setFrame:");
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "colorWithAlphaComponent:", 0.3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          CUIKCreateStripedUIImage();
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithPatternImage:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setBackgroundColor:", v34);

          -[NSMutableArray addObject:](self->_spanViews, "addObject:", v27);
          -[EKUIAvailabilityRowView addSubview:](self, "addSubview:", v27);
          -[EKUIAvailabilityRowView sendSubviewToBack:](self, "sendSubviewToBack:", v27);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v9);
  }

  -[EKUIAvailabilityRowView setNeedsDisplay](self, "setNeedsDisplay");
}

+ (double)padInset
{
  return 8.0;
}

+ (double)cornerRadius
{
  return 8.0;
}

- (CGRect)frameForSpanView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  v5 = 0.0;
  if (objc_msgSend(v4, "inset"))
  {
    +[EKUIAvailabilityRowView padInset](EKUIAvailabilityRowView, "padInset");
    v5 = v6;
  }
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityRowView convertDateIntoOffset:](self, "convertDateIntoOffset:", v7);
  v9 = v8;

  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIAvailabilityRowView convertDateIntoOffset:](self, "convertDateIntoOffset:", v10);
  v12 = v11;

  if (CalTimeDirectionIsLeftToRight())
    v13 = v12 - v9;
  else
    v13 = v9 - v12;
  if (!CalTimeDirectionIsLeftToRight())
    v9 = v12;
  -[EKUIAvailabilityRowView frame](self, "frame");
  v15 = v14 + v5 * -2.0;
  v16 = v9;
  v17 = v5;
  v18 = v13;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)EKUIAvailabilityRowView;
  -[EKUIAvailabilityRowView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_spanViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[EKUIAvailabilityRowView frameForSpanView:](self, "frameForSpanView:", v9, (_QWORD)v10);
        objc_msgSend(v9, "setFrame:");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (double)convertDateIntoOffset:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int IsLeftToRight;
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_startOfDay);
  v5 = v4;
  -[EKUIAvailabilityRowView frame](self, "frame");
  v7 = v6;
  v8 = v5 / 86400.0 * v6;
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  result = v7 - v8;
  if (IsLeftToRight)
    return v8;
  return result;
}

- (EKParticipant)participant
{
  return (EKParticipant *)objc_getProperty(self, a2, 456, 1);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_spanViews, 0);
}

@end
