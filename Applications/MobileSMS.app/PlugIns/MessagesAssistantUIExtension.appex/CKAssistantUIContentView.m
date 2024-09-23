@implementation CKAssistantUIContentView

- (CKAssistantUIContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAssistantUIContentView *v7;
  UIView *v8;
  UIView *chatBackgroundView;
  UIView *v10;
  void *v11;
  CKAssistantUIAvatarView *v12;
  CKAssistantUIAvatarView *avatarView;
  UIView *v14;
  UIView *keylineView;
  UIView *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKAssistantUIContentView;
  v7 = -[CKAssistantUIContentView initWithFrame:](&v19, "initWithFrame:");
  if (v7)
  {
    v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    chatBackgroundView = v7->_chatBackgroundView;
    v7->_chatBackgroundView = v8;

    v10 = v7->_chatBackgroundView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[CKAssistantUIContentView addSubview:](v7, "addSubview:", v7->_chatBackgroundView);
    v12 = -[CKAssistantUIAvatarView initWithFrame:]([CKAssistantUIAvatarView alloc], "initWithFrame:", x, y, width, height);
    avatarView = v7->_avatarView;
    v7->_avatarView = v12;

    -[CKAssistantUIContentView addSubview:](v7, "addSubview:", v7->_avatarView);
    v14 = (UIView *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x, y, width, height);
    keylineView = v7->_keylineView;
    v7->_keylineView = v14;

    v16 = v7->_keylineView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIView setAlpha:](v7->_keylineView, "setAlpha:", 0.18);
    -[CKAssistantUIContentView addSubview:](v7, "addSubview:", v7->_keylineView);
  }
  return v7;
}

- (void)setToFieldText:(id)a3
{
  -[CKAssistantUIAvatarView setToFieldText:](self->_avatarView, "setToFieldText:", a3);
}

- (void)setContactsForAvatarView:(id)a3
{
  -[CKAssistantUIAvatarView setContactsForAvatarView:](self->_avatarView, "setContactsForAvatarView:", a3);
}

- (void)setMessageContent:(id)a3 sent:(BOOL)a4
{
  CKTextBalloonView *balloonView;
  CKTextBalloonView *v7;
  CKTextBalloonView *v8;
  id v9;

  v9 = a3;
  -[CKTextBalloonView removeFromSuperview](self->_balloonView, "removeFromSuperview");
  balloonView = self->_balloonView;
  self->_balloonView = 0;

  if (!a4)
  {
    v7 = (CKTextBalloonView *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIContentView _balloonViewWithText:color:](self, "_balloonViewWithText:color:", v9, 0xFFFFFFFFLL));
    v8 = self->_balloonView;
    self->_balloonView = v7;

    -[CKAssistantUIContentView addSubview:](self, "addSubview:", self->_balloonView);
  }
  -[CKAssistantUIContentView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setChatContent:(id)a3
{
  UIView *chatView;
  UIView *v5;
  id v6;

  v6 = a3;
  chatView = self->_chatView;
  if (chatView)
  {
    -[UIView removeFromSuperview](chatView, "removeFromSuperview");
    v5 = self->_chatView;
    self->_chatView = 0;

  }
  -[CKAssistantUIContentView setChatView:](self, "setChatView:", v6);
  -[CKAssistantUIContentView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, self->_chatBackgroundView);
  -[CKAssistantUIContentView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *keylineView;
  double MaxY;
  void *v12;
  double v13;
  CKTextBalloonView *balloonView;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *chatView;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22.receiver = self;
  v22.super_class = (Class)CKAssistantUIContentView;
  -[CKAssistantUIContentView layoutSubviews](&v22, "layoutSubviews");
  -[CKAssistantUIContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CKAssistantUIAvatarView sizeThatFits:](self->_avatarView, "sizeThatFits:", v7, 1.79769313e308);
  -[CKAssistantUIAvatarView setFrame:](self->_avatarView, "setFrame:", 0.0, 0.0, v8, v9);
  keylineView = self->_keylineView;
  -[CKAssistantUIAvatarView frame](self->_avatarView, "frame");
  MaxY = CGRectGetMaxY(v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "scale");
  -[UIView setFrame:](keylineView, "setFrame:", 0.0, MaxY, v8, 1.0 / v13);

  balloonView = self->_balloonView;
  if (balloonView)
  {
    -[CKTextBalloonView prepareForDisplayIfNeeded](balloonView, "prepareForDisplayIfNeeded");
    -[CKAssistantUIContentView _balloonMaxWidthForBoundsWidth:](self, "_balloonMaxWidthForBoundsWidth:", v8);
    -[CKTextBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:");
    v16 = v15;
    v18 = v17;
    v19 = fmax(v8 - v15 + -22.0, 0.0);
    -[UIView frame](self->_keylineView, "frame");
    -[CKTextBalloonView setFrame:](self->_balloonView, "setFrame:", v19, CGRectGetMaxY(v24) + 28.0 + 200.0, v16, v18);
  }
  -[UIView frame](self->_keylineView, "frame");
  v20 = CGRectGetMaxY(v25) + 200.0;
  -[UIView setFrame:](self->_chatBackgroundView, "setFrame:", v4, v6, v8, v20);
  chatView = self->_chatView;
  if (chatView)
  {
    -[UIView setFrame:](chatView, "setFrame:", v4, v6, v8, v20);
    -[UIView setNeedsLayout](self->_chatView, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  -[CKAssistantUIAvatarView sizeThatFits:](self->_avatarView, "sizeThatFits:");
  v6 = v5;
  v8 = v7;
  -[CKAssistantUIContentView _balloonMaxWidthForBoundsWidth:](self, "_balloonMaxWidthForBoundsWidth:", width);
  -[CKTextBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:");
  v11 = v10 + 56.0;
  if (!self->_balloonView)
    v11 = 0.0;
  v12 = v8 + 200.0 + v11;
  v13 = v9 + 22.0;
  if (v6 >= v13)
    v13 = v6;
  result.height = v12;
  result.width = v13;
  return result;
}

- (id)_balloonViewWithText:(id)a3 color:(char)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v7 = objc_opt_class(CKTextBalloonView);
  v8 = CKBalloonViewForClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setHasTail:", 1);
  objc_msgSend(v9, "setOrientation:", 1);
  objc_msgSend(v9, "setColor:", v4);
  objc_msgSend(v9, "setCanUseOpaqueMask:", 0);
  v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);

  v11 = objc_msgSend(v10, "length");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "balloonTextFont"));
  objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v12, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "theme"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "balloonTextColorForColorType:", objc_msgSend(v9, "color")));
  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, v11);

  objc_msgSend(v9, "setAttributedText:", v10);
  objc_msgSend(v9, "prepareForDisplay");

  return v9;
}

- (double)_balloonMaxWidthForBoundsWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v4, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 0, 0, 0, 0, a3, 0.0, 22.0, 0.0, 22.0);
  v6 = v5;

  result = a3 + -44.0;
  if (v6 < a3 + -44.0)
    return v6;
  return result;
}

- (CKAssistantUIAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (UIView)keylineView
{
  return self->_keylineView;
}

- (void)setKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_keylineView, a3);
}

- (UIView)chatView
{
  return self->_chatView;
}

- (void)setChatView:(id)a3
{
  objc_storeStrong((id *)&self->_chatView, a3);
}

- (UIView)chatBackgroundView
{
  return self->_chatBackgroundView;
}

- (void)setChatBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_chatBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatBackgroundView, 0);
  objc_storeStrong((id *)&self->_chatView, 0);
  objc_storeStrong((id *)&self->_keylineView, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
