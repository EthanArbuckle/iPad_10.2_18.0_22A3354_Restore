@implementation AVTCameraItemView

- (AVTCameraItemView)initWithFrame:(CGRect)a3
{
  AVTCameraItemView *v3;
  AVTCameraItemView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CAShapeLayer *v17;
  CAShapeLayer *shapeLayer;
  CAShapeLayer *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AVTCameraItemView;
  v3 = -[AVTCameraItemView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTCameraItemView tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTCameraItemView tintColor](v4, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AVTUIColorRepository dynamicColorWithLightColor:darkColor:](AVTUIColorRepository, "dynamicColorWithLightColor:darkColor:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCameraItemView setBackgroundColor:](v4, "setBackgroundColor:", v9);
    v10 = (void *)MEMORY[0x1E0CEA650];
    -[AVTCameraItemView bounds](v4, "bounds");
    objc_msgSend(v10, "configurationWithPointSize:weight:", 5, v11 * 0.3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCameraItemView setCameraConfiguration:](v4, "setCameraConfiguration:", v12);

    v13 = (void *)MEMORY[0x1E0CEA638];
    -[AVTCameraItemView cameraConfiguration](v4, "cameraConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_systemImageNamed:withConfiguration:", CFSTR("camera.fill"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v15);
    -[AVTCameraItemView setImageView:](v4, "setImageView:", v16);
    objc_msgSend(v16, "setContentMode:", 4);
    -[AVTCameraItemView bounds](v4, "bounds");
    objc_msgSend(v16, "setFrame:");
    objc_msgSend(v16, "setAutoresizingMask:", 18);
    -[AVTCameraItemView addSubview:](v4, "addSubview:", v16);
    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    shapeLayer = v4->_shapeLayer;
    v4->_shapeLayer = v17;

    v19 = v4->_shapeLayer;
    -[AVTCameraItemView layer](v4, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMask:", v19);

    v21 = (void *)MEMORY[0x1E0CEA390];
    -[AVTCameraItemView bounds](v4, "bounds");
    objc_msgSend(v21, "bezierPathWithOvalInRect:");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v4->_shapeLayer, "setPath:", objc_msgSend(v22, "CGPath"));

  }
  return v4;
}

- (void)updateCameraImage
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0CEA390];
  -[AVTCameraItemView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", objc_msgSend(v4, "CGPath"));

  v5 = (void *)MEMORY[0x1E0CEA650];
  -[AVTCameraItemView bounds](self, "bounds");
  objc_msgSend(v5, "configurationWithPointSize:weight:", 5, v6 * 0.3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCameraItemView cameraConfiguration](self, "cameraConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "isEqualToConfiguration:", v7);

  if ((v8 & 1) == 0)
  {
    -[AVTCameraItemView setCameraConfiguration:](self, "setCameraConfiguration:", v12);
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("camera.fill"), v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCameraItemView imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

    -[AVTCameraItemView imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCameraItemView bounds](self, "bounds");
    objc_msgSend(v11, "setFrame:");

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTCameraItemView;
  -[AVTCameraItemView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVTCameraItemView updateCameraImage](self, "updateCameraImage");
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageSymbolConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (void)setCameraConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cameraConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraConfiguration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
