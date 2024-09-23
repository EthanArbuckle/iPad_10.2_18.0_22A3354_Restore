@implementation AVTPoseCollectionViewCell

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  id v3;
  CGPath *v4;
  CGRect v6;

  v6 = CGRectInset(a3, 6.0, 6.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 16.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGPath *)objc_msgSend(v3, "CGPath");

  return v4;
}

- (AVTPoseCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTPoseCollectionViewCell *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  void *v7;
  CAShapeLayer *v8;
  id v9;
  id v10;
  CAShapeLayer *selectionLayer;
  CAShapeLayer *v12;
  void *v13;
  void *v14;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)AVTPoseCollectionViewCell;
  v3 = -[AVTPoseCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTPoseCollectionViewCell bounds](v3, "bounds");
    v18 = CGRectInset(v17, 10.0, 10.0);
    v5 = objc_msgSend(v4, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[AVTPoseCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_imageView);

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    -[CAShapeLayer setLineWidth:](v8, "setLineWidth:", 3.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    -[CAShapeLayer setHidden:](v8, "setHidden:", 1);
    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v8;
    v12 = v8;

    -[AVTPoseCollectionViewCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v12);

  }
  return v3;
}

- (void)updateImage:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD v31[5];
  _QWORD v32[5];

  v6 = a3;
  -[AVTPoseCollectionViewCell contextIdentifier](self, "contextIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCollectionViewCell image](self, "image");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    if (v6)
    {
      if (a4)
      {
        v9 = objc_alloc(MEMORY[0x1E0CEABC8]);
        v10 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke;
        v32[3] = &unk_1EA51D188;
        v32[4] = self;
        v11 = (void *)objc_msgSend(v9, "initWithDuration:curve:animations:", 0, v32, 0.15);
        -[AVTPoseCollectionViewCell setScaleDownTransformAnimator:](self, "setScaleDownTransformAnimator:", v11);

        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_2;
        v31[3] = &unk_1EA51D188;
        v31[4] = self;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:dampingRatio:animations:", v31, 0.5, 0.6);
        -[AVTPoseCollectionViewCell setScaleUpWithBounceTransformAnimator:](self, "setScaleUpWithBounceTransformAnimator:", v12);

        objc_initWeak(&location, self);
        -[AVTPoseCollectionViewCell scaleDownTransformAnimator](self, "scaleDownTransformAnimator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v10;
        v26[1] = 3221225472;
        v26[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_3;
        v26[3] = &unk_1EA51E510;
        objc_copyWeak(&v29, &location);
        v14 = v7;
        v27 = v14;
        v28 = v6;
        objc_msgSend(v13, "addCompletion:", v26);

        -[AVTPoseCollectionViewCell scaleUpWithBounceTransformAnimator](self, "scaleUpWithBounceTransformAnimator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v10;
        v21 = 3221225472;
        v22 = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_4;
        v23 = &unk_1EA51E538;
        objc_copyWeak(&v25, &location);
        v24 = v14;
        objc_msgSend(v15, "addCompletion:", &v20);

        -[AVTPoseCollectionViewCell scaleDownTransformAnimator](self, "scaleDownTransformAnimator", v20, v21, v22, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startAnimation");

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      -[AVTPoseCollectionViewCell imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v6;
    }
    else
    {
      -[AVTPoseCollectionViewCell imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0;
    }
    objc_msgSend(v17, "setImage:", v19);

  }
LABEL_8:

}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 0.2, 0.2);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

    CGAffineTransformMakeScale(&v10, 0.2, 0.2);
    objc_msgSend(WeakRetained, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    objc_msgSend(v7, "setTransform:", &v9);

    objc_msgSend(WeakRetained, "scaleUpWithBounceTransformAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAnimation");

  }
  else
  {
    objc_msgSend(WeakRetained, "cancelAnimations");
  }

}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(WeakRetained, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(v5, "setScaleDownTransformAnimator:", 0);
    objc_msgSend(v5, "setScaleUpWithBounceTransformAnimator:", 0);
  }
  else
  {
    objc_msgSend(v5, "cancelAnimations");
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTPoseCollectionViewCell;
  -[AVTPoseCollectionViewCell layoutSubviews](&v7, sel_layoutSubviews);
  v3 = (void *)objc_opt_class();
  -[AVTPoseCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "selectionPathInBounds:");
  -[AVTPoseCollectionViewCell selectionLayer](self, "selectionLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTPoseCollectionViewCell;
  v4 = a3;
  -[AVTPoseCollectionViewCell traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v11.receiver, v11.super_class);

  -[AVTPoseCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[AVTPoseCollectionViewCell selectionLayer](self, "selectionLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStrokeColor:", v9);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVTPoseCollectionViewCell;
  -[AVTPoseCollectionViewCell setSelected:](&v6, sel_setSelected_);
  -[AVTPoseCollectionViewCell selectionLayer](self, "selectionLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

}

- (void)cancelAnimations
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  -[AVTPoseCollectionViewCell scaleDownTransformAnimator](self, "scaleDownTransformAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation:", 1);

  -[AVTPoseCollectionViewCell scaleUpWithBounceTransformAnimator](self, "scaleUpWithBounceTransformAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimation:", 1);

  -[AVTPoseCollectionViewCell setScaleDownTransformAnimator:](self, "setScaleDownTransformAnimator:", 0);
  -[AVTPoseCollectionViewCell setScaleUpWithBounceTransformAnimator:](self, "setScaleUpWithBounceTransformAnimator:", 0);
  -[AVTPoseCollectionViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "setTransform:", v8);

  -[AVTPoseCollectionViewCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", 0);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[AVTPoseCollectionViewCell cancelAnimations](self, "cancelAnimations");
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCollectionViewCell;
  -[AVTPoseCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[AVTPoseCollectionViewCell setContextIdentifier:](self, "setContextIdentifier:", 0);
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)transitionImageView
{
  return self->_transitionImageView;
}

- (void)setTransitionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionImageView, a3);
}

- (UIViewPropertyAnimator)scaleDownTransformAnimator
{
  return self->_scaleDownTransformAnimator;
}

- (void)setScaleDownTransformAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_scaleDownTransformAnimator, a3);
}

- (UIViewPropertyAnimator)scaleUpWithBounceTransformAnimator
{
  return self->_scaleUpWithBounceTransformAnimator;
}

- (void)setScaleUpWithBounceTransformAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_scaleUpWithBounceTransformAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleUpWithBounceTransformAnimator, 0);
  objc_storeStrong((id *)&self->_scaleDownTransformAnimator, 0);
  objc_storeStrong((id *)&self->_transitionImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end
