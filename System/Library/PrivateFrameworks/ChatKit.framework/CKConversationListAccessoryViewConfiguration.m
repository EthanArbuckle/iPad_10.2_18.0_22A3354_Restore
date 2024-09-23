@implementation CKConversationListAccessoryViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  CKConversationListAccessoryViewConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[CKConversationListAccessoryViewConfiguration init](+[CKConversationListAccessoryViewConfiguration allocWithZone:](CKConversationListAccessoryViewConfiguration, "allocWithZone:", a3), "init");
  -[CKConversationListAccessoryViewConfiguration setVibrancyStyle:](v4, "setVibrancyStyle:", -[CKConversationListAccessoryViewConfiguration vibrancyStyle](self, "vibrancyStyle"));
  -[CKConversationListAccessoryViewConfiguration blurEffect](self, "blurEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryViewConfiguration setBlurEffect:](v4, "setBlurEffect:", v5);

  -[CKConversationListAccessoryViewConfiguration image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryViewConfiguration setImage:](v4, "setImage:", v6);

  -[CKConversationListAccessoryViewConfiguration backgroundColor](self, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryViewConfiguration setBackgroundColor:](v4, "setBackgroundColor:", v7);

  -[CKConversationListAccessoryViewConfiguration tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryViewConfiguration setTintColor:](v4, "setTintColor:", v8);

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (int64_t)vibrancyStyle
{
  return self->_vibrancyStyle;
}

- (void)setVibrancyStyle:(int64_t)a3
{
  self->_vibrancyStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
