@implementation PHSublayerResizingLayer

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  void *v7;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PHSublayerResizingLayer;
  -[PHSublayerResizingLayer setFrame:](&v9, "setFrame:", a3.origin.x, a3.origin.y);
  y = CGPointZero.y;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSublayerResizingLayer sublayers](self, "sublayers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(v8, "setFrame:", CGPointZero.x, y, width, height);
  +[CATransaction commit](CATransaction, "commit");

}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(CABasicAnimation, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSublayerResizingLayer sublayers](self, "sublayers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = objc_msgSend(v10, "copy");
    objc_msgSend(v13, "setDelegate:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyPath"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("bounds.size"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fromValue"));
      objc_msgSend(v16, "sizeValue");
      v18 = v17;
      v20 = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toValue"));
      objc_msgSend(v21, "sizeValue");
      v23 = v22;
      v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v20, v18));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v25, v23));
      objc_msgSend(v13, "setFromValue:", v26);
      objc_msgSend(v13, "setToValue:", v27);

    }
    objc_msgSend(v12, "addAnimation:forKey:", v13, v7);

  }
  v28.receiver = self;
  v28.super_class = (Class)PHSublayerResizingLayer;
  -[PHSublayerResizingLayer addAnimation:forKey:](&v28, "addAnimation:forKey:", v6, v7);

}

@end
