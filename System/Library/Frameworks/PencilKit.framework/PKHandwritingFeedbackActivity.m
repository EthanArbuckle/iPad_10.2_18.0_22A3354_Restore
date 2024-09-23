@implementation PKHandwritingFeedbackActivity

- (PKHandwritingFeedbackActivity)initWithBlock:(id)a3
{
  id v3;
  PKHandwritingFeedbackActivity *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKHandwritingFeedbackActivity;
  v3 = a3;
  v4 = -[UIActivity init](&v9, sel_init);
  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Handwriting Feedback"), CFSTR("Handwriting Feedback"), CFSTR("Localizable"), v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingFeedbackActivity setTitle:](v4, "setTitle:", v6);

  -[PKHandwritingFeedbackActivity setBlock:](v4, "setBlock:", v3);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingFeedbackActivity setImage:](v4, "setImage:", v7);

  return v4;
}

- (id)activityType
{
  return CFSTR("com.apple.pencilkit.handwritingfeedback");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void (**v2)(void);

  -[PKHandwritingFeedbackActivity block](self, "block");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
