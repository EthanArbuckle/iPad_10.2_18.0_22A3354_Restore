@implementation AMPOnboardingFeature

- (AMPOnboardingFeature)initWithImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMPOnboardingFeature *v12;
  AMPOnboardingFeature *v13;
  uint64_t v14;
  NSString *titleText;
  uint64_t v16;
  NSString *descriptionText;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AMPOnboardingFeature;
  v12 = -[AMPOnboardingFeature init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    v14 = objc_msgSend(v10, "copy");
    titleText = v13->_titleText;
    v13->_titleText = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    descriptionText = v13->_descriptionText;
    v13->_descriptionText = (NSString *)v16;

  }
  return v13;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
