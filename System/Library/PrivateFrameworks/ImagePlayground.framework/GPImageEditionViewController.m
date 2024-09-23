@implementation GPImageEditionViewController

- (GPImageEditionViewController)init
{
  GPImageEditionViewController *v2;
  _TtC15ImagePlayground29ImagePlaygroundViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GPImageEditionViewController;
  v2 = -[GPImageEditionViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v3 = objc_alloc_init(_TtC15ImagePlayground29ImagePlaygroundViewController);
  -[GPImageEditionViewController setGenerationViewController:](v2, "setGenerationViewController:", v3);

  -[GPImageEditionViewController generationViewController](v2, "generationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v2);

  -[GPImageEditionViewController generationViewController](v2, "generationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivateDelegate:", v2);

  -[GPImageEditionViewController generationViewController](v2, "generationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController gp_addChildViewController:](v2, "gp_addChildViewController:", v6);

  return v2;
}

- (int64_t)style
{
  void *v2;
  int64_t v3;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  id v4;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

- (GPRecipe)recipe
{
  void *v2;
  void *v3;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GPRecipe *)v3;
}

- (void)setRecipe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipe:", v4);

}

- (UIImage)sourceImage
{
  void *v2;
  void *v3;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setSourceImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceImage:", v4);

}

- (BOOL)sourceImageIsSketch
{
  void *v2;
  char v3;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceImageIsSketch");

  return v3;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceImageIsSketch:", v3);

}

- (NSString)localizedCreateButtonTitle
{
  void *v2;
  void *v3;

  -[GPImageEditionViewController generationViewController](self, "generationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedCreateButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)isAvailable
{
  return +[ImagePlaygroundViewController available](_TtC15ImagePlayground29ImagePlaygroundViewController, "available");
}

- (void)imagePlaygroundViewControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;

  -[GPImageEditionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[GPImageEditionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "imageEditionViewControllerDidCancel:", self);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[GPImageEditionViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageEditionViewControllerDidCancel:requiresShowingGrid:", self, 0);
  }

}

- (void)imageGenerationViewControllerWantsToShowGrid:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[GPImageEditionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[GPImageEditionViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageEditionViewControllerDidCancel:requiresShowingGrid:", self, 1);

  }
}

- (void)imageEditionViewController:(id)a3 didCreate:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GPImageEditionViewController setGeneratedAssets:](self, "setGeneratedAssets:", v7, v9, v10);
  -[GPImageEditionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageEditionViewControllerDidFinishEditing:error:", self, 0);

}

- (GPImageEditionViewControllerDelegate)delegate
{
  return (GPImageEditionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)generatedAssets
{
  return (NSArray *)objc_getProperty(self, a2, 984, 1);
}

- (void)setGeneratedAssets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (BOOL)isLoadingRecipe
{
  return self->isLoadingRecipe;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  self->isLoadingRecipe = a3;
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)generationViewController
{
  return self->_generationViewController;
}

- (void)setGenerationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_generationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationViewController, 0);
  objc_storeStrong((id *)&self->generatedAssets, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
