@implementation CKConversationListCellLayout

- (BOOL)shouldShowChevron
{
  return self->_shouldShowChevron;
}

- (CGRect)unreadFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unreadFrame.origin.x;
  y = self->_unreadFrame.origin.y;
  width = self->_unreadFrame.size.width;
  height = self->_unreadFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)summaryLabelCapFrameYOrigin
{
  return self->_summaryLabelCapFrameYOrigin;
}

- (BOOL)shouldShowAvatarView
{
  return self->_shouldShowAvatarView;
}

- (CGRect)senderFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_senderFrame.origin.x;
  y = self->_senderFrame.origin.y;
  width = self->_senderFrame.size.width;
  height = self->_senderFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5
{
  _BOOL4 v5;

  if (self->_invalid)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = CKFloatApproximatelyEqualToFloatWithTolerance(self->_contentViewWidth, a3, 0.00000999999975);
    if (v5)
    {
      v5 = CKFloatApproximatelyEqualToFloatWithTolerance(self->_widthForDeterminingAvatarVisibility, a4, 0.00000999999975);
      if (v5)
        LOBYTE(v5) = -[CKConversationListCellLayout showingEditControl](self, "showingEditControl") ^ a5 ^ 1;
    }
  }
  return v5;
}

- (CGRect)dateFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dateFrame.origin.x;
  y = self->_dateFrame.origin.y;
  width = self->_dateFrame.size.width;
  height = self->_dateFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)chevronFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_chevronFrame.origin.x;
  y = self->_chevronFrame.origin.y;
  width = self->_chevronFrame.size.width;
  height = self->_chevronFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)avatarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avatarFrame.origin.x;
  y = self->_avatarFrame.origin.y;
  width = self->_avatarFrame.size.width;
  height = self->_avatarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showingEditControl
{
  return self->_showingEditControl;
}

- (CKConversationListCellLayout)init
{
  CKConversationListCellLayout *v2;
  CKConversationListCellLayout *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKConversationListCellLayout;
  v2 = -[CKConversationListCellLayout init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_invalid = 1;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_shouldShowChevron = objc_msgSend(v4, "showsConversationListCellChevronImage");

  }
  return v3;
}

- (double)tableViewWidth
{
  return self->_tableViewWidth;
}

- (void)setTableViewWidth:(double)a3
{
  self->_tableViewWidth = a3;
}

- (void)setShouldShowChevron:(BOOL)a3
{
  self->_shouldShowChevron = a3;
}

- (void)invalidate
{
  CGPoint v2;
  CGSize v3;

  self->_shouldShowAvatarView = 0;
  self->_contentViewWidth = 0.0;
  self->_widthForDeterminingAvatarVisibility = 0.0;
  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_summaryFrameIfAccessoryIndicatorVisible.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_summaryFrameIfAccessoryIndicatorVisible.size = v3;
  self->_summaryFrameIfAccessoryIndicatorHidden.origin = v2;
  self->_summaryFrameIfAccessoryIndicatorHidden.size = v3;
  self->_dateFrame.size = v3;
  self->_dateFrame.origin = v2;
  self->_senderFrame.size = v3;
  self->_senderFrame.origin = v2;
  self->_chevronFrame.size = v3;
  self->_chevronFrame.origin = v2;
  self->_unreadFrame.origin = v2;
  self->_unreadFrame.size = v3;
  self->_avatarFrame.origin = v2;
  self->_avatarFrame.size = v3;
  self->_tableViewWidth = 0.0;
  self->_summaryLabelCapFrameYOrigin = 0.0;
  self->_lastUsedDisplayScale = 0.0;
  self->_cellHeight = 0.0;
  self->_invalid = 1;
}

- (double)cellHeightForDisplayScale:(double)a3
{
  double v5;
  double v6;

  if (self->_cellHeight == 0.0
    || (-[CKConversationListCellLayout lastUsedDisplayScale](self, "lastUsedDisplayScale"), v5 != a3))
  {
    +[CKConversationListCell cellHeightForDisplayScale:](CKConversationListCell, "cellHeightForDisplayScale:", a3);
    self->_cellHeight = v6;
    -[CKConversationListCellLayout setLastUsedDisplayScale:](self, "setLastUsedDisplayScale:", a3);
  }
  return self->_cellHeight;
}

- (double)lastUsedDisplayScale
{
  return self->_lastUsedDisplayScale;
}

- (void)setUnreadFrame:(CGRect)a3
{
  self->_unreadFrame = a3;
}

- (void)setTrailingLayoutMarginSize:(double)a3
{
  self->_trailingLayoutMarginSize = a3;
}

- (void)setSummaryLabelCapFrameYOrigin:(double)a3
{
  self->_summaryLabelCapFrameYOrigin = a3;
}

- (void)setShouldShowAvatarView:(BOOL)a3
{
  self->_shouldShowAvatarView = a3;
}

- (void)setSenderFrame:(CGRect)a3
{
  self->_senderFrame = a3;
}

- (void)setLastUsedDisplayScale:(double)a3
{
  self->_lastUsedDisplayScale = a3;
}

- (void)setDateFrame:(CGRect)a3
{
  self->_dateFrame = a3;
}

- (void)setChevronFrame:(CGRect)a3
{
  self->_chevronFrame = a3;
}

- (void)setAvatarFrame:(CGRect)a3
{
  self->_avatarFrame = a3;
}

- (void)markAsValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5
{
  self->_invalid = 0;
  self->_contentViewWidth = a3;
  self->_widthForDeterminingAvatarVisibility = a4;
  self->_showingEditControl = a5;
}

- (void)setShowingEditControl:(BOOL)a3
{
  self->_showingEditControl = a3;
}

- (CGRect)summaryFrameIfAccessoryIndicatorVisible
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_summaryFrameIfAccessoryIndicatorVisible.origin.x;
  y = self->_summaryFrameIfAccessoryIndicatorVisible.origin.y;
  width = self->_summaryFrameIfAccessoryIndicatorVisible.size.width;
  height = self->_summaryFrameIfAccessoryIndicatorVisible.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSummaryFrameIfAccessoryIndicatorVisible:(CGRect)a3
{
  self->_summaryFrameIfAccessoryIndicatorVisible = a3;
}

- (CGRect)summaryFrameIfAccessoryIndicatorHidden
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_summaryFrameIfAccessoryIndicatorHidden.origin.x;
  y = self->_summaryFrameIfAccessoryIndicatorHidden.origin.y;
  width = self->_summaryFrameIfAccessoryIndicatorHidden.size.width;
  height = self->_summaryFrameIfAccessoryIndicatorHidden.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSummaryFrameIfAccessoryIndicatorHidden:(CGRect)a3
{
  self->_summaryFrameIfAccessoryIndicatorHidden = a3;
}

- (CGRect)indicatorContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_indicatorContainerFrame.origin.x;
  y = self->_indicatorContainerFrame.origin.y;
  width = self->_indicatorContainerFrame.size.width;
  height = self->_indicatorContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setIndicatorContainerFrame:(CGRect)a3
{
  self->_indicatorContainerFrame = a3;
}

- (double)trailingLayoutMarginSize
{
  return self->_trailingLayoutMarginSize;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (double)contentViewWidth
{
  return self->_contentViewWidth;
}

- (void)setContentViewWidth:(double)a3
{
  self->_contentViewWidth = a3;
}

- (double)widthForDeterminingAvatarVisibility
{
  return self->_widthForDeterminingAvatarVisibility;
}

- (void)setWidthForDeterminingAvatarVisibility:(double)a3
{
  self->_widthForDeterminingAvatarVisibility = a3;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

@end
