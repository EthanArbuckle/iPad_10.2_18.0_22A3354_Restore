@implementation HROnboardingBulletPoint

- (HROnboardingBulletPoint)initWithImage:(id)a3 title:(id)a4 body:(id)a5
{
  id v9;
  id v10;
  id v11;
  HROnboardingBulletPoint *v12;
  HROnboardingBulletPoint *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HROnboardingBulletPoint;
  v12 = -[HROnboardingBulletPoint init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bulletImage, a3);
    objc_storeStrong((id *)&v13->_bulletTitleString, a4);
    objc_storeStrong((id *)&v13->_bulletBodyString, a5);
  }

  return v13;
}

+ (id)bulletPointWithImage:(id)a3 title:(id)a4 body:(id)a5
{
  id v7;
  id v8;
  id v9;
  HROnboardingBulletPoint *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HROnboardingBulletPoint initWithImage:title:body:]([HROnboardingBulletPoint alloc], "initWithImage:title:body:", v9, v8, v7);

  return v10;
}

- (UIImage)bulletImage
{
  return self->_bulletImage;
}

- (NSString)bulletTitleString
{
  return self->_bulletTitleString;
}

- (NSString)bulletBodyString
{
  return self->_bulletBodyString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletBodyString, 0);
  objc_storeStrong((id *)&self->_bulletTitleString, 0);
  objc_storeStrong((id *)&self->_bulletImage, 0);
}

@end
