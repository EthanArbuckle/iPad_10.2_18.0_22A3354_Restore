@implementation SSSBetaFeedbackActivity

- (SSSBetaFeedbackActivity)initWithBlock:(id)a3
{
  id v3;
  SSSBetaFeedbackActivity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSBetaFeedbackActivity;
  v3 = a3;
  v4 = -[SSSBetaFeedbackActivity init](&v11, "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v11.receiver, v11.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_BETA_FEEDBACK_SHARESHEET"), CFSTR("Share Beta Feedback"), 0));
  -[SSSBetaFeedbackActivity setTitle:](v4, "setTitle:", v6);

  -[SSSBetaFeedbackActivity setBlock:](v4, "setBlock:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleTitle2, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithSymbolConfiguration:", v8));
  -[SSSBetaFeedbackActivity setImage:](v4, "setImage:", v9);

  return v4;
}

- (id)activityType
{
  return CFSTR("com.apple.screenshotservicesservice.betafeedback");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void (**v2)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SSSBetaFeedbackActivity block](self, "block"));
  v2[2]();

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
