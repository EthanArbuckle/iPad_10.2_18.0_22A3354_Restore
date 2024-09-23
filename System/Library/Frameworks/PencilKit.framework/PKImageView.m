@implementation PKImageView

- (PKImageView)initWithFrame:(CGRect)a3
{
  PKImageView *v3;
  PKImageView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKImageView;
  v3 = -[PKImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[PKImageView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (PKImageView)initWithImage:(id)a3
{
  id v5;
  PKImageView *v6;
  PKImageView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKImageView;
  v6 = -[PKImageView init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PKImageView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    -[PKImageView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    objc_storeStrong((id *)&v7->_image, a3);
    -[PKImageView _updateImageLayer](v7, "_updateImageLayer");
  }

  return v7;
}

- (void)setupWithDrawing:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 strokeSpaceClipRect:(CGRect)a6 sixChannel:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  id v16;
  PKImageRenderer *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[6];
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4.height;
  v14 = a4.width;
  v16 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  v17 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:]([PKImageRenderer alloc], "initWithSize:scale:renderQueue:sixChannelBlending:", 0, v7, v14, v13, a5);
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageRenderer setInvertColors:](v17, "setInvertColors:", objc_msgSend(v18, "userInterfaceStyle") == 2);

  v19 = dispatch_semaphore_create(0);
  v20 = v19;
  if (v7)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke;
    v23[3] = &unk_1E7779218;
    v23[5] = &v30;
    v23[6] = &v24;
    v21 = v23;
    v23[4] = v19;
    -[PKImageRenderer sixChannelCGRenderDrawing:clippedToStrokeSpaceRect:scale:completion:](v17, "sixChannelCGRenderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v23, x, y, width, height, a5);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke_2;
    v22[3] = &unk_1E7779240;
    v22[5] = &v36;
    v21 = v22;
    v22[4] = v19;
    -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v17, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v22, x, y, width, height, a5);
  }

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  -[PKImageView setImage:](self, "setImage:", v37[5]);
  -[PKImageView setMulImage:](self, "setMulImage:", v25[5]);
  -[PKImageView setAddImage:](self, "setAddImage:", v31[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

intptr_t __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKImageView;
  -[PKImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKImageView _updateLayerFrames](self, "_updateLayerFrames");
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[PKImageView _updateImageLayer](self, "_updateImageLayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v5 = v6;
  }

}

- (void)setAddImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_addImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_addImage, a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[PKImageView _updateAddLayer](self, "_updateAddLayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v5 = v6;
  }

}

- (void)setMulImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_mulImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mulImage, a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[PKImageView _updateMulLayer](self, "_updateMulLayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v5 = v6;
  }

}

- (id)_createViewWithImage:(id)a3 compositingFiler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = (objc_class *)MEMORY[0x1E0DC3F10];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView bounds](self, "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v10, "setOpaque:", 0);
  objc_msgSend(v10, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v10, "setAllowsGroupBlending:", 0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCompositingFilter:", v11);
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "CGImage");

  objc_msgSend(v10, "setContents:", v13);
  return v9;
}

- (void)_updateImageLayer
{
  UIImage *image;
  UIView *imageView;
  uint64_t v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;

  image = self->_image;
  imageView = self->_imageView;
  if (!image)
  {
    -[UIView removeFromSuperview](imageView, "removeFromSuperview");
    v6 = self->_imageView;
    self->_imageView = 0;
    goto LABEL_5;
  }
  if (imageView)
  {
    v5 = -[UIImage CGImage](image, "CGImage");
    -[UIView layer](self->_imageView, "layer");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setContents:](v9, "setContents:", v5);
    v6 = v9;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  v8 = self->_imageView;
  self->_imageView = v7;

  -[PKImageView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_imageView, 0);
}

- (void)_updateAddLayer
{
  UIImage *addImage;
  UIView *addView;
  uint64_t v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;

  addImage = self->_addImage;
  addView = self->_addView;
  if (!addImage)
  {
    -[UIView removeFromSuperview](addView, "removeFromSuperview");
    v6 = self->_addView;
    self->_addView = 0;
    goto LABEL_5;
  }
  if (addView)
  {
    v5 = -[UIImage CGImage](addImage, "CGImage");
    -[UIView layer](self->_addView, "layer");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setContents:](v10, "setContents:", v5);
    v6 = v10;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  v8 = self->_addView;
  self->_addView = v7;

  v9 = self->_addView;
  if (self->_mulView)
    -[PKImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v9);
  else
    -[PKImageView addSubview:](self, "addSubview:", v9);
}

- (void)_updateMulLayer
{
  UIImage *mulImage;
  UIView *mulView;
  uint64_t v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;

  mulImage = self->_mulImage;
  mulView = self->_mulView;
  if (!mulImage)
  {
    -[UIView removeFromSuperview](mulView, "removeFromSuperview");
    v6 = self->_mulView;
    self->_mulView = 0;
    goto LABEL_5;
  }
  if (mulView)
  {
    v5 = -[UIImage CGImage](mulImage, "CGImage");
    -[UIView layer](self->_mulView, "layer");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setContents:](v10, "setContents:", v5);
    v6 = v10;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  v8 = self->_mulView;
  self->_mulView = v7;

  v9 = self->_mulView;
  if (self->_addView)
    -[PKImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
  else
    -[PKImageView addSubview:](self, "addSubview:", v9);
}

- (void)_updateLayerFrames
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PKImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_addView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_mulView, "setFrame:", v4, v6, v8, v10);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)addImage
{
  return self->_addImage;
}

- (UIImage)mulImage
{
  return self->_mulImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mulImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mulView, 0);
  objc_storeStrong((id *)&self->_addView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
