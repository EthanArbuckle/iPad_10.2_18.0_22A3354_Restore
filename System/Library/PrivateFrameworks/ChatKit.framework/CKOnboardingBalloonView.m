@implementation CKOnboardingBalloonView

- (void)prepareForDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKOnboardingBalloonView;
  -[CKTextBalloonView prepareForDisplay](&v4, sel_prepareForDisplay);
  -[CKOnboardingBalloonView largeBalloonImage](self, "largeBalloonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonImageView setImage:](self, "setImage:", v3);

}

- (UIImage)largeBalloonImage
{
  return self->_largeBalloonImage;
}

- (void)setLargeBalloonImage:(id)a3
{
  objc_storeStrong((id *)&self->_largeBalloonImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeBalloonImage, 0);
}

@end
