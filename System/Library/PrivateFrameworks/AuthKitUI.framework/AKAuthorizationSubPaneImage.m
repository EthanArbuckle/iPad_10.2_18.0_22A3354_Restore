@implementation AKAuthorizationSubPaneImage

- (AKAuthorizationSubPaneImage)initWithImage:(id)a3
{
  id v4;
  UIImageView *v5;
  UIImageView *imageView;
  UIImageView *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_imageViewWithImage:", v4);
  v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();

  imageView = self->_imageView;
  self->_imageView = v5;

  v7 = self->_imageView;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPaneImage;
  return -[AKAuthorizationSubPane initWithView:](&v9, sel_initWithView_, v7);
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[AKAuthorizationSubPaneImage imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAuthorizationSubPaneImage imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    -[AKAuthorizationSubPaneImage imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__AKAuthorizationSubPaneImage_setImage_animated___block_invoke;
    v9[3] = &unk_1E7678D18;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v9, 0, 0.25);

  }
  else
  {
    -[AKAuthorizationSubPaneImage setImage:](self, "setImage:", v6);
  }

}

void __49__AKAuthorizationSubPaneImage_setImage_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)addToStackView:(id)a3 context:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneImage;
  -[AKAuthorizationSubPane addToStackView:context:](&v4, sel_addToStackView_context_, a3, a4);
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AKAuthorizationSubPaneImage imageViewConstraints](self, "imageViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKAuthorizationSubPaneImage imageViewConstraints](self, "imageViewConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v6);

  }
}

+ (id)_imageViewWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA658];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSArray)imageViewConstraints
{
  return self->_imageViewConstraints;
}

- (void)setImageViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewConstraints, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
