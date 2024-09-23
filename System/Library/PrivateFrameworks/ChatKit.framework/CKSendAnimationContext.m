@implementation CKSendAnimationContext

- (BOOL)shouldUseQuickReplySourceRect
{
  return !CGRectEqualToRect(self->_quickReplySourceRect, *MEMORY[0x1E0C9D648]);
}

- (NSArray)animatableViews
{
  return self->_animatableViews;
}

- (void)setAnimatableViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)animatableTextViews
{
  return self->_animatableTextViews;
}

- (void)setAnimatableTextViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)impactIdentifier
{
  return self->_impactIdentifier;
}

- (void)setImpactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_impactIdentifier, a3);
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (void)setShouldRepeat:(BOOL)a3
{
  self->_shouldRepeat = a3;
}

- (BOOL)isSender
{
  return self->_isSender;
}

- (void)setIsSender:(BOOL)a3
{
  self->_isSender = a3;
}

- (NSArray)throwBalloonViews
{
  return self->_throwBalloonViews;
}

- (void)setThrowBalloonViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSArray)framesOfAddedChatItems
{
  return self->_framesOfAddedChatItems;
}

- (void)setFramesOfAddedChatItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CABackdropLayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayer, a3);
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (NSArray)throwBalloonViewAttributesCollection
{
  return self->_throwBalloonViewAttributesCollection;
}

- (void)setThrowBalloonViewAttributesCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)beginAnimationFromTranscriptPresentedState
{
  return self->_beginAnimationFromTranscriptPresentedState;
}

- (void)setBeginAnimationFromTranscriptPresentedState:(BOOL)a3
{
  self->_beginAnimationFromTranscriptPresentedState = a3;
}

- (CGRect)quickReplySourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_quickReplySourceRect.origin.x;
  y = self->_quickReplySourceRect.origin.y;
  width = self->_quickReplySourceRect.size.width;
  height = self->_quickReplySourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setQuickReplySourceRect:(CGRect)a3
{
  self->_quickReplySourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throwBalloonViewAttributesCollection, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_framesOfAddedChatItems, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_throwBalloonViews, 0);
  objc_storeStrong((id *)&self->_impactIdentifier, 0);
  objc_storeStrong((id *)&self->_animatableTextViews, 0);
  objc_storeStrong((id *)&self->_animatableViews, 0);
}

@end
