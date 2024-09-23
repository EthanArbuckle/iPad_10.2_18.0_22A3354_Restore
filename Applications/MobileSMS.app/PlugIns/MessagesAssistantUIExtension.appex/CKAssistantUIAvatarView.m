@implementation CKAssistantUIAvatarView

- (CKAssistantUIAvatarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAssistantUIAvatarView *v7;
  UIView *v8;
  UIView *blurView;
  void *v10;
  id v11;
  CNAvatarView *v12;
  CNAvatarView *avatar;
  UILabel *v14;
  UILabel *toLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKAssistantUIAvatarView;
  v7 = -[CKAssistantUIAvatarView initWithFrame:](&v22, "initWithFrame:");
  if (v7)
  {
    v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    blurView = v7->_blurView;
    v7->_blurView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 0));
    v11 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v10);
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v7->_blurView, "addSubview:", v11);
    -[CKAssistantUIAvatarView addSubview:](v7, "addSubview:", v7->_blurView);
    v12 = (CNAvatarView *)objc_msgSend(objc_alloc((Class)CNAvatarView), "initWithFrame:", x, y, width, height);
    avatar = v7->_avatar;
    v7->_avatar = v12;

    -[CNAvatarView setAsynchronousRendering:](v7->_avatar, "setAsynchronousRendering:", 1);
    -[CNAvatarView setUserInteractionEnabled:](v7->_avatar, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setShowsContactOnTap:](v7->_avatar, "setShowsContactOnTap:", 0);
    -[CKAssistantUIAvatarView addSubview:](v7, "addSubview:", v7->_avatar);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x, y, width, height);
    toLabel = v7->_toLabel;
    v7->_toLabel = v14;

    v16 = v7->_toLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    v18 = v7->_toLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "avatarNameFont"));
    -[UILabel setFont:](v18, "setFont:", v20);

    -[UILabel setTextAlignment:](v7->_toLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_toLabel, "setNumberOfLines:", 1);
    -[CKAssistantUIAvatarView addSubview:](v7, "addSubview:", v7->_toLabel);

  }
  return v7;
}

- (void)setToFieldText:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_toLabel, "text"));
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_toLabel, "setText:", v6);
    -[CKAssistantUIAvatarView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContactsForAvatarView:(id)a3
{
  id v4;
  CNAvatarView *avatar;
  id v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[CNAvatarView setContacts:](self->_avatar, "setContacts:", v7);
  }
  else
  {
    avatar = self->_avatar;
    v6 = objc_alloc_init((Class)CNContact);
    -[CNAvatarView setContact:](avatar, "setContact:", v6);

  }
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
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UILabel *toLabel;
  double v19;
  CGRect v20;

  -[CKAssistantUIAvatarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v11, "conversationListContactImageDiameter");
  v13 = v12;

  -[CNAvatarView setFrame:](self->_avatar, "setFrame:", v8 * 0.5 - v13 * 0.5, 10.0, v13, v13);
  -[UILabel sizeThatFits:](self->_toLabel, "sizeThatFits:", v8 + -40.0, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  toLabel = self->_toLabel;
  v19 = v8 * 0.5 - v14 * 0.5;
  -[CNAvatarView frame](self->_avatar, "frame");
  -[UILabel setFrame:](toLabel, "setFrame:", v19, CGRectGetMaxY(v20) + 5.0, v15, v17);
  -[UIView setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height));
  objc_msgSend(v5, "conversationListContactImageDiameter");
  v7 = v6;

  -[UILabel sizeThatFits:](self->_toLabel, "sizeThatFits:", width + -40.0, 1.79769313e308);
  v9 = v7 + 5.0 + v8 + 20.0;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (UILabel)toLabel
{
  return self->_toLabel;
}

- (void)setToLabel:(id)a3
{
  objc_storeStrong((id *)&self->_toLabel, a3);
}

- (CNAvatarView)avatar
{
  return self->_avatar;
}

- (void)setAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_avatar, a3);
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_toLabel, 0);
}

@end
