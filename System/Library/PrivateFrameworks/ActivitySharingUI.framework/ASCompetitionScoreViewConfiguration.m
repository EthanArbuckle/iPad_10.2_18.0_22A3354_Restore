@implementation ASCompetitionScoreViewConfiguration

+ (id)gizmoTotalScoreConfiguration
{
  ASCompetitionScoreViewConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(ASCompetitionScoreViewConfiguration);
  -[ASCompetitionScoreViewConfiguration setShowsScoreTypeHeader:](v2, "setShowsScoreTypeHeader:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionScoreViewConfiguration setNameFont:](v2, "setNameFont:", v3);

  -[ASCompetitionScoreViewConfiguration setNameBaselineOffset:](v2, "setNameBaselineOffset:", 19.5);
  -[ASCompetitionScoreViewConfiguration setShowsNames:](v2, "setShowsNames:", 1);
  -[ASCompetitionScoreViewConfiguration setUppercaseNames:](v2, "setUppercaseNames:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 25.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreFont:](v2, "setPrimaryScoreFont:", v4);

  -[ASCompetitionScoreViewConfiguration setPrimaryScoreBaselineOffset:](v2, "setPrimaryScoreBaselineOffset:", 22.5);
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreSource:](v2, "setPrimaryScoreSource:", 0);
  -[ASCompetitionScoreViewConfiguration setShowsPrimaryScoreUnits:](v2, "setShowsPrimaryScoreUnits:", 0);
  -[ASCompetitionScoreViewConfiguration setZeroPadPrimaryScore:](v2, "setZeroPadPrimaryScore:", 1);
  -[ASCompetitionScoreViewConfiguration setShowsAchievementThumbnail:](v2, "setShowsAchievementThumbnail:", 0);
  -[ASCompetitionScoreViewConfiguration setBottomMargin:](v2, "setBottomMargin:", 10.0);
  -[ASCompetitionScoreViewConfiguration setSideMargin:](v2, "setSideMargin:", 10.0);
  -[ASCompetitionScoreViewConfiguration setMinimumMiddleMargin:](v2, "setMinimumMiddleMargin:", 8.0);
  -[ASCompetitionScoreViewConfiguration setAlignment:](v2, "setAlignment:", 1);
  -[ASCompetitionScoreViewConfiguration setDivision:](v2, "setDivision:", 1);
  -[ASCompetitionScoreViewConfiguration setWantsScaledBaselineAlignment:](v2, "setWantsScaledBaselineAlignment:", 0);
  return v2;
}

+ (id)gizmoTotalScoreFriendDetailConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "gizmoTotalScoreConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderFont:", v3);

  objc_msgSend(v2, "setHeaderBaselineOffset:", 19.5);
  objc_msgSend(v2, "setNameBaselineOffset:", 21.0);
  objc_msgSend(v2, "setShowsScoreTypeHeader:", 1);
  return v2;
}

+ (id)gizmoTodayScoreConfiguration
{
  void *v2;

  objc_msgSend(a1, "gizmoTotalScoreFriendDetailConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsNames:", 0);
  objc_msgSend(v2, "setPrimaryScoreSource:", 1);
  return v2;
}

+ (id)gizmoTotalWinsConfiguration
{
  void *v2;

  objc_msgSend(a1, "gizmoTotalScoreFriendDetailConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsNames:", 0);
  objc_msgSend(v2, "setPrimaryScoreSource:", 2);
  objc_msgSend(v2, "setAchievementThumbnailSize:", 20.0, 20.0);
  objc_msgSend(v2, "setAchievementThumbnailTopMargin:", 5.5);
  objc_msgSend(v2, "setShowsAchievementThumbnail:", 1);
  objc_msgSend(v2, "setAchievementThumbnailAlignment:", 0);
  objc_msgSend(v2, "setAchievementThumbnailQuality:", 0);
  return v2;
}

+ (id)gizmoTotalWinsStandaloneConfiguration
{
  void *v2;

  objc_msgSend(a1, "gizmoTotalWinsConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsNames:", 1);
  return v2;
}

+ (id)companionTotalScoreFriendDetailConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASCompetitionScoreViewConfiguration *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BEBB548];
  v5 = *MEMORY[0x24BEBB598];
  v16[0] = *MEMORY[0x24BEBB5A0];
  v16[1] = v5;
  v17[0] = &unk_24EEA3560;
  v17[1] = &unk_24EEA3578;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(ASCompetitionScoreViewConfiguration);
  -[ASCompetitionScoreViewConfiguration setShowsScoreTypeHeader:](v12, "setShowsScoreTypeHeader:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionScoreViewConfiguration setNameFont:](v12, "setNameFont:", v13);

  -[ASCompetitionScoreViewConfiguration setNameBaselineOffset:](v12, "setNameBaselineOffset:", 20.5);
  -[ASCompetitionScoreViewConfiguration setShowsNames:](v12, "setShowsNames:", 1);
  -[ASCompetitionScoreViewConfiguration setUppercaseNames:](v12, "setUppercaseNames:", 0);
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreFont:](v12, "setPrimaryScoreFont:", v4);
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreBaselineOffset:](v12, "setPrimaryScoreBaselineOffset:", 30.0);
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreSource:](v12, "setPrimaryScoreSource:", 0);
  -[ASCompetitionScoreViewConfiguration setShowsPrimaryScoreUnits:](v12, "setShowsPrimaryScoreUnits:", 1);
  -[ASCompetitionScoreViewConfiguration setPrimaryScoreUnitFont:](v12, "setPrimaryScoreUnitFont:", v11);
  -[ASCompetitionScoreViewConfiguration setZeroPadPrimaryScore:](v12, "setZeroPadPrimaryScore:", 0);
  -[ASCompetitionScoreViewConfiguration setShowsTodaySecondaryScore:](v12, "setShowsTodaySecondaryScore:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionScoreViewConfiguration setSecondaryScoreFont:](v12, "setSecondaryScoreFont:", v14);

  -[ASCompetitionScoreViewConfiguration setSecondaryScoreBaselineOffset:](v12, "setSecondaryScoreBaselineOffset:", 20.5);
  -[ASCompetitionScoreViewConfiguration setShowsAchievementThumbnail:](v12, "setShowsAchievementThumbnail:", 0);
  -[ASCompetitionScoreViewConfiguration setBottomMargin:](v12, "setBottomMargin:", 19.0);
  -[ASCompetitionScoreViewConfiguration setSideMargin:](v12, "setSideMargin:", 0.0);
  -[ASCompetitionScoreViewConfiguration setMinimumMiddleMargin:](v12, "setMinimumMiddleMargin:", 19.0);
  -[ASCompetitionScoreViewConfiguration setAlignment:](v12, "setAlignment:", 0);
  -[ASCompetitionScoreViewConfiguration setDivision:](v12, "setDivision:", 2);
  -[ASCompetitionScoreViewConfiguration setWantsScaledBaselineAlignment:](v12, "setWantsScaledBaselineAlignment:", 1);

  return v12;
}

+ (id)companionFriendListConfiguration
{
  void *v2;

  objc_msgSend(a1, "companionTotalScoreFriendDetailConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDivision:", 0);
  objc_msgSend(v2, "setNameBaselineOffset:", 30.0);
  objc_msgSend(v2, "setMinimumMiddleMargin:", 19.0);
  objc_msgSend(v2, "setSideMargin:", 19.0);
  return v2;
}

+ (id)companionTotalWinsFriendDetailConfiguration
{
  void *v2;

  objc_msgSend(a1, "companionTotalScoreFriendDetailConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrimaryScoreSource:", 2);
  objc_msgSend(v2, "setShowsPrimaryScoreUnits:", 0);
  objc_msgSend(v2, "setShowsNames:", 0);
  objc_msgSend(v2, "setShowsTodaySecondaryScore:", 0);
  objc_msgSend(v2, "setBottomMargin:", 19.0);
  objc_msgSend(v2, "setPrimaryScoreBaselineOffset:", 29.0);
  objc_msgSend(v2, "setShowsAchievementThumbnail:", 1);
  objc_msgSend(v2, "setAchievementThumbnailAlignment:", 1);
  objc_msgSend(v2, "setAchievementThumbnailQuality:", 1);
  objc_msgSend(v2, "setAchievementThumbnailSize:", 41.0, 41.0);
  return v2;
}

+ (id)companionTotalWinsStandaloneFriendDetailConfiguration
{
  void *v2;

  objc_msgSend(a1, "companionTotalWinsFriendDetailConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsNames:", 1);
  return v2;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (void)setHeaderFont:(id)a3
{
  objc_storeStrong((id *)&self->_headerFont, a3);
}

- (double)headerBaselineOffset
{
  return self->_headerBaselineOffset;
}

- (void)setHeaderBaselineOffset:(double)a3
{
  self->_headerBaselineOffset = a3;
}

- (BOOL)showsScoreTypeHeader
{
  return self->_showsScoreTypeHeader;
}

- (void)setShowsScoreTypeHeader:(BOOL)a3
{
  self->_showsScoreTypeHeader = a3;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);
}

- (double)nameBaselineOffset
{
  return self->_nameBaselineOffset;
}

- (void)setNameBaselineOffset:(double)a3
{
  self->_nameBaselineOffset = a3;
}

- (BOOL)showsNames
{
  return self->_showsNames;
}

- (void)setShowsNames:(BOOL)a3
{
  self->_showsNames = a3;
}

- (BOOL)uppercaseNames
{
  return self->_uppercaseNames;
}

- (void)setUppercaseNames:(BOOL)a3
{
  self->_uppercaseNames = a3;
}

- (int64_t)primaryScoreSource
{
  return self->_primaryScoreSource;
}

- (void)setPrimaryScoreSource:(int64_t)a3
{
  self->_primaryScoreSource = a3;
}

- (UIFont)primaryScoreFont
{
  return self->_primaryScoreFont;
}

- (void)setPrimaryScoreFont:(id)a3
{
  objc_storeStrong((id *)&self->_primaryScoreFont, a3);
}

- (UIFont)primaryScoreUnitFont
{
  return self->_primaryScoreUnitFont;
}

- (void)setPrimaryScoreUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_primaryScoreUnitFont, a3);
}

- (double)primaryScoreBaselineOffset
{
  return self->_primaryScoreBaselineOffset;
}

- (void)setPrimaryScoreBaselineOffset:(double)a3
{
  self->_primaryScoreBaselineOffset = a3;
}

- (BOOL)showsPrimaryScoreUnits
{
  return self->_showsPrimaryScoreUnits;
}

- (void)setShowsPrimaryScoreUnits:(BOOL)a3
{
  self->_showsPrimaryScoreUnits = a3;
}

- (BOOL)zeroPadPrimaryScore
{
  return self->_zeroPadPrimaryScore;
}

- (void)setZeroPadPrimaryScore:(BOOL)a3
{
  self->_zeroPadPrimaryScore = a3;
}

- (double)achievementThumbnailTopMargin
{
  return self->_achievementThumbnailTopMargin;
}

- (void)setAchievementThumbnailTopMargin:(double)a3
{
  self->_achievementThumbnailTopMargin = a3;
}

- (CGSize)achievementThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_achievementThumbnailSize.width;
  height = self->_achievementThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAchievementThumbnailSize:(CGSize)a3
{
  self->_achievementThumbnailSize = a3;
}

- (BOOL)showsAchievementThumbnail
{
  return self->_showsAchievementThumbnail;
}

- (void)setShowsAchievementThumbnail:(BOOL)a3
{
  self->_showsAchievementThumbnail = a3;
}

- (int64_t)achievementThumbnailAlignment
{
  return self->_achievementThumbnailAlignment;
}

- (void)setAchievementThumbnailAlignment:(int64_t)a3
{
  self->_achievementThumbnailAlignment = a3;
}

- (int64_t)achievementThumbnailQuality
{
  return self->_achievementThumbnailQuality;
}

- (void)setAchievementThumbnailQuality:(int64_t)a3
{
  self->_achievementThumbnailQuality = a3;
}

- (UIFont)secondaryScoreFont
{
  return self->_secondaryScoreFont;
}

- (void)setSecondaryScoreFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryScoreFont, a3);
}

- (double)secondaryScoreBaselineOffset
{
  return self->_secondaryScoreBaselineOffset;
}

- (void)setSecondaryScoreBaselineOffset:(double)a3
{
  self->_secondaryScoreBaselineOffset = a3;
}

- (BOOL)showsTodaySecondaryScore
{
  return self->_showsTodaySecondaryScore;
}

- (void)setShowsTodaySecondaryScore:(BOOL)a3
{
  self->_showsTodaySecondaryScore = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)division
{
  return self->_division;
}

- (void)setDivision:(int64_t)a3
{
  self->_division = a3;
}

- (double)sideMargin
{
  return self->_sideMargin;
}

- (void)setSideMargin:(double)a3
{
  self->_sideMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)minimumMiddleMargin
{
  return self->_minimumMiddleMargin;
}

- (void)setMinimumMiddleMargin:(double)a3
{
  self->_minimumMiddleMargin = a3;
}

- (double)opponentScoreViewWidth
{
  return self->_opponentScoreViewWidth;
}

- (void)setOpponentScoreViewWidth:(double)a3
{
  self->_opponentScoreViewWidth = a3;
}

- (BOOL)wantsScaledBaselineAlignment
{
  return self->_wantsScaledBaselineAlignment;
}

- (void)setWantsScaledBaselineAlignment:(BOOL)a3
{
  self->_wantsScaledBaselineAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryScoreFont, 0);
  objc_storeStrong((id *)&self->_primaryScoreUnitFont, 0);
  objc_storeStrong((id *)&self->_primaryScoreFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_headerFont, 0);
}

@end
