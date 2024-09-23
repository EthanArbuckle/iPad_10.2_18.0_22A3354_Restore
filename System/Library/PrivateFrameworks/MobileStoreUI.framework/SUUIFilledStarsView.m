@implementation SUUIFilledStarsView

- (SUUIFilledStarsView)initWithFrame:(CGRect)a3
{
  SUUIFilledStarsView *v3;
  NSMutableArray *v4;
  NSMutableArray *starViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIFilledStarsView;
  v3 = -[SUUIFilledStarsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    starViews = v3->_starViews;
    v3->_starViews = v4;

    -[SUUIFilledStarsView _setupStars](v3, "_setupStars");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUUIFilledStarsView;
  -[SUUIFilledStarsView dealloc](&v2, sel_dealloc);
}

- (void)layoutSubviews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_starViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[SUUIFilledStarsView addSubview:](self, "addSubview:", v9, (_QWORD)v24);
        objc_msgSend(v9, "sizeToFit");
        objc_msgSend(v9, "frame");
        v11 = v10;
        objc_msgSend(v9, "frame");
        v30.origin.y = 0.0;
        v30.origin.x = v7;
        v30.size.width = v11;
        MaxX = CGRectGetMaxX(v30);
        -[SUUIFilledStarsView bounds](self, "bounds");
        UIRectCenteredYInRect();
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        if (-[SUUIFilledStarsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
        {
          -[SUUIFilledStarsView bounds](self, "bounds");
          v22 = v21 - v18;
          -[SUUIFilledStarsView bounds](self, "bounds");
          v14 = v22 - (v14 - v23);
        }
        v7 = MaxX + 1.0;
        objc_msgSend(v9, "setFrame:", v14, v16, v18, v20);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

- (void)_setupStars
{
  void *v3;
  void *v4;
  int v5;
  NSMutableArray *starViews;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 10.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("star.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 5;
  do
  {
    starViews = self->_starViews;
    -[SUUIFilledStarsView _starImageViewWithImage:](self, "_starImageViewWithImage:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](starViews, "addObject:", v7);

    --v5;
  }
  while (v5);

}

- (id)_starImageViewWithImage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starViews, 0);
}

@end
