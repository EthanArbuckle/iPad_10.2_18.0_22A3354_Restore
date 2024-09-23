@implementation ACUISMutableActivitySceneMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISActivitySceneMetrics *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  ACUISActivitySceneMetrics *v12;

  v4 = [ACUISActivitySceneMetrics alloc];
  -[ACUISMutableActivitySceneMetrics size](self, "size");
  v6 = v5;
  v8 = v7;
  -[ACUISMutableActivitySceneMetrics cornerRadius](self, "cornerRadius");
  v10 = v9;
  -[ACUISMutableActivitySceneMetrics edgeInsets](self, "edgeInsets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v4, "initWithSize:cornerRadius:edgeInsets:", v11, v6, v8, v10);

  return v12;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->size.width;
  height = self->size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (double)cornerRadius
{
  return self->cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->cornerRadius = a3;
}

- (ACUISEdgeInsets)edgeInsets
{
  return self->edgeInsets;
}

- (void)setEdgeInsets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edgeInsets, 0);
}

@end
