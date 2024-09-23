@implementation HUCameraErrorContent

+ (id)errorWithTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  HUCameraErrorContent *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HUCameraErrorContent);
  -[HUCameraErrorContent setTitleText:](v7, "setTitleText:", v6);

  -[HUCameraErrorContent setDescriptionText:](v7, "setDescriptionText:", v5);
  return v7;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
}

@end
