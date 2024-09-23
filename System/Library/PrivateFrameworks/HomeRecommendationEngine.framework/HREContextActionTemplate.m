@implementation HREContextActionTemplate

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (id)createStarterRecommendationInHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HREContextActionTemplate;
  -[HREActionTemplate createStarterRecommendationInHome:](&v11, sel_createStarterRecommendationInHome_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HREContextActionTemplate contextActionName](self, "contextActionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v8);

    -[HREContextActionTemplate iconDescriptor](self, "iconDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIconDescriptor:", v9);

  }
  return v5;
}

- (NSString)contextActionName
{
  return self->_contextActionName;
}

- (void)setContextActionName:(id)a3
{
  objc_storeStrong((id *)&self->_contextActionName, a3);
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_contextActionName, 0);
}

@end
