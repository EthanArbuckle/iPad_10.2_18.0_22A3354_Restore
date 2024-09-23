@implementation SFPrivacyReportOverviewView

- (SFPrivacyReportOverviewView)initWithPrivacyReportDataProvider:(id)a3
{
  id v5;
  SFPrivacyReportOverviewView *v6;
  SFPrivacyReportOverviewView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SFPrivacyReportOverviewCellContentView *v16;
  SFPrivacyReportOverviewCellContentView *trackersPreventedFromProfilingView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SFPrivacyReportOverviewCellContentView *v26;
  SFPrivacyReportOverviewCellContentView *websitesContainingTrackersView;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SFPrivacyReportOverviewCellContentView *v35;
  SFPrivacyReportOverviewCellContentView *mostBlockedTrackerView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  SFPrivacyReportOverviewView *v49;
  objc_super v51;
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SFPrivacyReportOverviewView;
  v6 = -[SFPrivacyReportGridView init](&v51, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportDataProvider, a3);
    -[SFPrivacyReportOverviewView frame](v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v8, v10, v12, v14);
    trackersPreventedFromProfilingView = v7->_trackersPreventedFromProfilingView;
    v7->_trackersPreventedFromProfilingView = v16;

    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView titleLabel](v7->_trackersPreventedFromProfilingView, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    v20 = (void *)MEMORY[0x1E0CB37F0];
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "knownTrackers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView subtitleLabel](v7->_trackersPreventedFromProfilingView, "subtitleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    v26 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v9, v11, v13, v15);
    websitesContainingTrackersView = v7->_websitesContainingTrackersView;
    v7->_websitesContainingTrackersView = v26;

    _WBSLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView titleLabel](v7->_websitesContainingTrackersView, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    v30 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v30, "setNumberStyle:", 3);
    objc_msgSend(v30, "setRoundingMode:", 2);
    objc_msgSend(v30, "setMaximumFractionDigits:", 0);
    objc_msgSend(v30, "setMinimumIntegerDigits:", 1);
    objc_msgSend(v30, "setMaximumIntegerDigits:", 3);
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[WBSPrivacyReportDataProvider ratioOfTrackedFirstPartiesToAllVisited](v7->_reportDataProvider, "ratioOfTrackedFirstPartiesToAllVisited");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromNumber:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView subtitleLabel](v7->_websitesContainingTrackersView, "subtitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", v33);

    v35 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v9, v11, v13, v15);
    mostBlockedTrackerView = v7->_mostBlockedTrackerView;
    v7->_mostBlockedTrackerView = v35;

    _WBSLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView titleLabel](v7->_mostBlockedTrackerView, "titleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v37);

    objc_msgSend(v5, "mostSeenKnownTracker");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstParties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    v42 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "domain");
    if (v41 == 1)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringWithFormat:", v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportOverviewCellContentView subtitleLabel](v7->_mostBlockedTrackerView, "subtitleLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setText:", v45);
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "firstParties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringWithFormat:", v43, v44, objc_msgSend(v45, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportOverviewCellContentView subtitleLabel](v7->_mostBlockedTrackerView, "subtitleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setText:", v46);

    }
    v52[0] = v7->_trackersPreventedFromProfilingView;
    v52[1] = v7->_websitesContainingTrackersView;
    v52[2] = v7->_mostBlockedTrackerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewView setItemViews:](v7, "setItemViews:", v48);

    v49 = v7;
  }

  return v7;
}

- (void)setContextType:(int64_t)a3
{
  if (self->_contextType != a3)
  {
    self->_contextType = a3;
    -[SFPrivacyReportOverviewView updateItemBackgroundProperties](self, "updateItemBackgroundProperties");
  }
}

- (void)setItemViews:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportOverviewView;
  -[SFPrivacyReportGridView setItemViews:](&v4, sel_setItemViews_, a3);
  -[SFPrivacyReportOverviewView updateItemBackgroundProperties](self, "updateItemBackgroundProperties");
}

- (void)updateItemBackgroundProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  -[SFPrivacyReportGridView itemViews](self, "itemViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SFPrivacyReportOverviewView cellBackgroundColor](self, "cellBackgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCellBackgroundColor:", v9);

        -[SFPrivacyReportOverviewView cellBackgroundCornerRadius](self, "cellBackgroundCornerRadius");
        objc_msgSend(v8, "setCellBackgroundCornerRadius:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)cellBackgroundColor
{
  int64_t contextType;

  contextType = self->_contextType;
  if (contextType == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("startPagePrivacyReportColor"));
    self = (SFPrivacyReportOverviewView *)objc_claimAutoreleasedReturnValue();
  }
  else if (!contextType)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    self = (SFPrivacyReportOverviewView *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (double)cellBackgroundCornerRadius
{
  int IsPad;
  double result;

  IsPad = _SFDeviceIsPad();
  result = 9.22337204e18;
  if (IsPad)
    return 10.0;
  return result;
}

- (double)interItemSpacing
{
  double result;

  result = 20.0;
  if (!self->_usesInsetStyle)
    return 0.0;
  return result;
}

- (BOOL)itemViewCanUseCompactWidth:(id)a3
{
  return self->_mostBlockedTrackerView != a3;
}

- (BOOL)itemViewIsLineBreak:(id)a3
{
  return self->_mostBlockedTrackerView == a3;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
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
  if (self->_usesInsetStyle != a3)
  {
    v3 = a3;
    self->_usesInsetStyle = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SFPrivacyReportGridView itemViews](self, "itemViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setUsesInsetStyle:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[SFPrivacyReportGridView updateInterItemSpacing](self, "updateInterItemSpacing");
  }
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostBlockedTrackerView, 0);
  objc_storeStrong((id *)&self->_websitesContainingTrackersView, 0);
  objc_storeStrong((id *)&self->_trackersPreventedFromProfilingView, 0);
  objc_storeStrong((id *)&self->_reportDataProvider, 0);
}

@end
