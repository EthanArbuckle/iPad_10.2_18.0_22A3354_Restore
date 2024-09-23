@implementation ACUISActivitySceneMetrics

- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  ACUISActivitySceneMetrics *v11;
  ACUISActivitySceneMetrics *v12;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneMetrics;
  v11 = -[ACUISActivitySceneMetrics init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_size.width = width;
    v11->_size.height = height;
    v11->_cornerRadius = a4;
    objc_storeStrong((id *)&v11->_edgeInsets, a5);
  }

  return v12;
}

- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](self, "initWithSize:cornerRadius:edgeInsets:", 0, a3.width, a3.height, a4);
}

- (ACUISActivitySceneMetrics)initWithSceneMetrics:(id)a3
{
  id v4;
  ACUISActivitySceneMetrics *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  ACUISEdgeInsets *v9;
  void *v10;
  uint64_t v11;
  ACUISEdgeInsets *edgeInsets;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneMetrics;
  v5 = -[ACUISActivitySceneMetrics init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "size");
    v5->_size.width = v6;
    v5->_size.height = v7;
    objc_msgSend(v4, "cornerRadius");
    v5->_cornerRadius = v8;
    v9 = [ACUISEdgeInsets alloc];
    objc_msgSend(v4, "edgeInsets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ACUISEdgeInsets _initWithEdgeInsets:](v9, "_initWithEdgeInsets:", v10);
    edgeInsets = v5->_edgeInsets;
    v5->_edgeInsets = (ACUISEdgeInsets *)v11;

  }
  return v5;
}

- (id)_ActivitySceneMetrics
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v12;

  v3 = [_TtC18ActivityUIServices20ActivitySceneMetrics alloc];
  -[ACUISActivitySceneMetrics size](self, "size");
  v5 = v4;
  v7 = v6;
  -[ACUISActivitySceneMetrics cornerRadius](self, "cornerRadius");
  v9 = v8;
  -[ACUISActivitySceneMetrics edgeInsets](self, "edgeInsets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_edgeInsets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v3, "initWithSize:cornerRadius:edgeInsets:", v11, v5, v7, v9);

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  ACUISMutableActivitySceneMetrics *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  ACUISMutableActivitySceneMetrics *v12;

  v4 = [ACUISMutableActivitySceneMetrics alloc];
  -[ACUISActivitySceneMetrics size](self, "size");
  v6 = v5;
  v8 = v7;
  -[ACUISActivitySceneMetrics cornerRadius](self, "cornerRadius");
  v10 = v9;
  -[ACUISActivitySceneMetrics edgeInsets](self, "edgeInsets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v4, "initWithSize:cornerRadius:edgeInsets:", v11, v6, v8, v10);

  return v12;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (ACUISEdgeInsets)edgeInsets
{
  return self->_edgeInsets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeInsets, 0);
}

@end
