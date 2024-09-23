@implementation CKTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v8;
  int v9;
  int isKindOfClass;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "contentInsets");
  -[CKEditableCollectionViewCell setContentInsets:](self, "setContentInsets:");
  v8 = objc_msgSend(v15, "transcriptOrientation");
  if (-[CKEditableCollectionViewCell orientation](self, "orientation") != (_DWORD)v8)
  {
    -[CKEditableCollectionViewCell setOrientation:](self, "setOrientation:", v8);
    -[CKTranscriptCell setNeedsLayout](self, "setNeedsLayout");
  }
  v9 = objc_msgSend(v15, "canBeSelectedInEditMode");
  if ((objc_msgSend(v15, "itemIsReplyContextPreview") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  objc_opt_class();
  v12 = isKindOfClass | v11 | objc_opt_isKindOfClass();
  v13 = 2;
  if (!v9)
    v13 = 0;
  if ((v12 & 1) != 0)
    v14 = 1;
  else
    v14 = v13;
  -[CKEditableCollectionViewCell setEditingStyle:](self, "setEditingStyle:", v14);

}

- (CKTranscriptCell)initWithFrame:(CGRect)a3
{
  CKTranscriptCell *v3;
  CKTranscriptCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTranscriptCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[CKTranscriptCell _configureForDebugOutliningIfNeeded](v4, "_configureForDebugOutliningIfNeeded");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptCell;
  -[CKEditableCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CKEditableCollectionViewCell layoutSubviewsForContents](self, "layoutSubviewsForContents");
  -[CKTranscriptCell layoutSubviewsForDrawer](self, "layoutSubviewsForDrawer");
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](self, "layoutSubviewsForAlignmentContents");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCell;
  -[CKTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKEditableCollectionViewCell clearFilters](self, "clearFilters");
  -[CKTranscriptCell setInsertionDuration:](self, "setInsertionDuration:", 0.0);
  -[CKTranscriptCell setInsertingBeforeReplyPreview:](self, "setInsertingBeforeReplyPreview:", 0);
  -[CKTranscriptCell setInsertingWithReplyPreview:](self, "setInsertingWithReplyPreview:", 0);
  -[CKTranscriptCell setSuppressAnimationsForLineUpdates:](self, "setSuppressAnimationsForLineUpdates:", 0);
  -[CKEditableCollectionViewCell setIsInReplyContext:](self, "setIsInReplyContext:", 0);
  -[CKTranscriptCell setShouldFreezeReplyDecorationsForTimestampReveal:](self, "setShouldFreezeReplyDecorationsForTimestampReveal:", 0);
  -[CKTranscriptCell setDrawerPercentRevealed:](self, "setDrawerPercentRevealed:", 0.0);
  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)setDrawerPercentRevealed:(double)a3
{
  if (self->_drawerPercentRevealed != a3)
  {
    self->_drawerPercentRevealed = a3;
    -[CKTranscriptCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviewsForDrawer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CKTranscriptCell;
  -[CKEditableCollectionViewCell layoutSubviewsForDrawer](&v37, sel_layoutSubviewsForDrawer);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKEditableCollectionViewCell wantsDrawerLayout](self, "wantsDrawerLayout"))
  {
    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
      {
        -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
        v35 = v21;
        -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
        v23 = v22;
        v32 = v25;
        v33 = v24;
        v31 = v26;
        objc_msgSend(v20, "transcriptDrawerWidthForMarginInsets:");
        v34 = v27;
        objc_msgSend(v20, "transcriptDrawerOverlapForMarginInsets:", v23, v33, v32, v31);
        v13 = -((v34 - v28) * v35);
      }
    }
    else if ((objc_msgSend(v20, "timestampsPushBalloons") & 1) == 0)
    {
      -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
      v36 = v29;
      v13 = -(v4 * v29);
      -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
      v4 = v4 + v36 * v30;
    }
  }
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v13, v15, v17, v19);

}

- (void)setLinkInteractions:(id)a3
{
  id v4;
  NSArray *linkInteractions;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  linkInteractions = self->_linkInteractions;
  if (linkInteractions)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = linkInteractions;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          -[CKTranscriptCell removeInteraction:](self, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  v12 = self->_linkInteractions;
  self->_linkInteractions = v11;

  v13 = self->_linkInteractions;
  if (v13)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v13;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
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
          -[CKTranscriptCell addInteraction:](self, "addInteraction:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (UIColor)debugBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
}

- (void)_configureForDebugOutliningIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  if (_configureForDebugOutliningIfNeeded_onceToken != -1)
    dispatch_once(&_configureForDebugOutliningIfNeeded_onceToken, &__block_literal_global_279);
  if (_configureForDebugOutliningIfNeeded_wantsDebugOutlining)
  {
    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setBorderWidth:", 1.0);
    -[CKTranscriptCell debugBorderColor](self, "debugBorderColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v4, "CGColor"));

    -[CKTranscriptCell debugBorderColor](self, "debugBorderColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.12);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  }
}

void __55__CKTranscriptCell__configureForDebugOutliningIfNeeded__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("showTranscriptCellDebugBorders"));

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  _configureForDebugOutliningIfNeeded_wantsDebugOutlining = v1 & v3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (BOOL)shouldConfigureForDarkFSM
{
  return self->_shouldConfigureForDarkFSM;
}

- (void)setShouldConfigureForDarkFSM:(BOOL)a3
{
  self->_shouldConfigureForDarkFSM = a3;
}

- (int64_t)insertionType
{
  return self->_insertionType;
}

- (void)setInsertionType:(int64_t)a3
{
  self->_insertionType = a3;
}

- (double)insertionDuration
{
  return self->_insertionDuration;
}

- (void)setInsertionDuration:(double)a3
{
  self->_insertionDuration = a3;
}

- (double)insertionBeginTime
{
  return self->_insertionBeginTime;
}

- (void)setInsertionBeginTime:(double)a3
{
  self->_insertionBeginTime = a3;
}

- (BOOL)insertingBeforeReplyPreview
{
  return self->_insertingBeforeReplyPreview;
}

- (void)setInsertingBeforeReplyPreview:(BOOL)a3
{
  self->_insertingBeforeReplyPreview = a3;
}

- (BOOL)insertingWithReplyPreview
{
  return self->_insertingWithReplyPreview;
}

- (void)setInsertingWithReplyPreview:(BOOL)a3
{
  self->_insertingWithReplyPreview = a3;
}

- (BOOL)suppressesAnimationsForLineUpdates
{
  return self->_suppressAnimationsForLineUpdates;
}

- (void)setSuppressAnimationsForLineUpdates:(BOOL)a3
{
  self->_suppressAnimationsForLineUpdates = a3;
}

- (BOOL)shouldFreezeReplyDecorationsForTimestampReveal
{
  return self->_shouldFreezeReplyDecorationsForTimestampReveal;
}

- (void)setShouldFreezeReplyDecorationsForTimestampReveal:(BOOL)a3
{
  self->_shouldFreezeReplyDecorationsForTimestampReveal = a3;
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkInteractions, 0);
}

@end
