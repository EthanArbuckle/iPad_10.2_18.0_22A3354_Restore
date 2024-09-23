@implementation CKInlineReplyTransitionProperties

+ (id)defaultProperties
{
  CKInlineReplyTransitionProperties *v2;
  uint64_t v3;

  v2 = objc_alloc_init(CKInlineReplyTransitionProperties);
  -[CKInlineReplyTransitionProperties setInitialBalloonOffsetX:](v2, "setInitialBalloonOffsetX:", 0.0);
  v3 = MEMORY[0x1E0C9AA60];
  -[CKInlineReplyTransitionProperties setChatItemGUIDs:](v2, "setChatItemGUIDs:", MEMORY[0x1E0C9AA60]);
  -[CKInlineReplyTransitionProperties setAssociatedChatItemGUIDs:](v2, "setAssociatedChatItemGUIDs:", v3);
  -[CKInlineReplyTransitionProperties setSwipeVelocity:](v2, "setSwipeVelocity:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKInlineReplyTransitionProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(CKInlineReplyTransitionProperties);
  -[CKInlineReplyTransitionProperties initialBalloonOffsetX](self, "initialBalloonOffsetX");
  -[CKInlineReplyTransitionProperties setInitialBalloonOffsetX:](v4, "setInitialBalloonOffsetX:");
  -[CKInlineReplyTransitionProperties chatItemGUIDs](self, "chatItemGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CKInlineReplyTransitionProperties setChatItemGUIDs:](v4, "setChatItemGUIDs:", v6);

  -[CKInlineReplyTransitionProperties associatedChatItemGUIDs](self, "associatedChatItemGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[CKInlineReplyTransitionProperties setAssociatedChatItemGUIDs:](v4, "setAssociatedChatItemGUIDs:", v8);

  -[CKInlineReplyTransitionProperties swipeVelocity](self, "swipeVelocity");
  -[CKInlineReplyTransitionProperties setSwipeVelocity:](v4, "setSwipeVelocity:");
  return v4;
}

- (double)initialBalloonOffsetX
{
  return self->_initialBalloonOffsetX;
}

- (void)setInitialBalloonOffsetX:(double)a3
{
  self->_initialBalloonOffsetX = a3;
}

- (NSArray)chatItemGUIDs
{
  return self->_chatItemGUIDs;
}

- (void)setChatItemGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemGUIDs, a3);
}

- (NSArray)associatedChatItemGUIDs
{
  return self->_associatedChatItemGUIDs;
}

- (void)setAssociatedChatItemGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_associatedChatItemGUIDs, a3);
}

- (CGPoint)swipeVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_swipeVelocity.x;
  y = self->_swipeVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSwipeVelocity:(CGPoint)a3
{
  self->_swipeVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChatItemGUIDs, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDs, 0);
}

@end
