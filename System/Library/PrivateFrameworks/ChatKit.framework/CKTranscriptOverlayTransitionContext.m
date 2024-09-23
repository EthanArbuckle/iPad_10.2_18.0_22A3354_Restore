@implementation CKTranscriptOverlayTransitionContext

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = CFSTR("YES");
  if (-[CKTranscriptOverlayTransitionContext wantsModalPresentation](self, "wantsModalPresentation"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!-[CKTranscriptOverlayTransitionContext wantsUnanimatedPresentation](self, "wantsUnanimatedPresentation"))
    v4 = CFSTR("NO");
  -[CKTranscriptOverlayTransitionContext anchorChatItemGUID](self, "anchorChatItemGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptOverlayTransitionContext visibleChatItemToFrameMap](self, "visibleChatItemToFrameMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("modal %@ unanimated: %@ anchor GUID %@ frames: %@"), v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)visibleChatItemToFrameMap
{
  return self->_visibleChatItemToFrameMap;
}

- (void)setVisibleChatItemToFrameMap:(id)a3
{
  objc_storeStrong((id *)&self->_visibleChatItemToFrameMap, a3);
}

- (NSString)anchorChatItemGUID
{
  return self->_anchorChatItemGUID;
}

- (void)setAnchorChatItemGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKInlineReplyTransitionProperties)replyTransitionProperties
{
  return self->_replyTransitionProperties;
}

- (void)setReplyTransitionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)wantsModalPresentation
{
  return self->_wantsModalPresentation;
}

- (void)setWantsModalPresentation:(BOOL)a3
{
  self->_wantsModalPresentation = a3;
}

- (BOOL)wantsUnanimatedPresentation
{
  return self->_wantsUnanimatedPresentation;
}

- (void)setWantsUnanimatedPresentation:(BOOL)a3
{
  self->_wantsUnanimatedPresentation = a3;
}

- (BOOL)presentWithKeyboard
{
  return self->_presentWithKeyboard;
}

- (void)setPresentWithKeyboard:(BOOL)a3
{
  self->_presentWithKeyboard = a3;
}

- (BOOL)keyboardWasUpInMainTranscript
{
  return self->_keyboardWasUpInMainTranscript;
}

- (void)setKeyboardWasUpInMainTranscript:(BOOL)a3
{
  self->_keyboardWasUpInMainTranscript = a3;
}

- (int64_t)navBarContext
{
  return self->_navBarContext;
}

- (void)setNavBarContext:(int64_t)a3
{
  self->_navBarContext = a3;
}

- (BOOL)isParentChatControllerShowingBanner
{
  return self->_isParentChatControllerShowingBanner;
}

- (void)setIsParentChatControllerShowingBanner:(BOOL)a3
{
  self->_isParentChatControllerShowingBanner = a3;
}

- (UIEdgeInsets)transcriptMarginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_transcriptMarginInsets.top;
  left = self->_transcriptMarginInsets.left;
  bottom = self->_transcriptMarginInsets.bottom;
  right = self->_transcriptMarginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTranscriptMarginInsets:(UIEdgeInsets)a3
{
  self->_transcriptMarginInsets = a3;
}

- (UIEdgeInsets)transcriptSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_transcriptSafeAreaInsets.top;
  left = self->_transcriptSafeAreaInsets.left;
  bottom = self->_transcriptSafeAreaInsets.bottom;
  right = self->_transcriptSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTranscriptSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_transcriptSafeAreaInsets = a3;
}

- (CGRect)parentCollectionViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_parentCollectionViewFrame.origin.x;
  y = self->_parentCollectionViewFrame.origin.y;
  width = self->_parentCollectionViewFrame.size.width;
  height = self->_parentCollectionViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setParentCollectionViewFrame:(CGRect)a3
{
  self->_parentCollectionViewFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyTransitionProperties, 0);
  objc_storeStrong((id *)&self->_anchorChatItemGUID, 0);
  objc_storeStrong((id *)&self->_visibleChatItemToFrameMap, 0);
}

@end
