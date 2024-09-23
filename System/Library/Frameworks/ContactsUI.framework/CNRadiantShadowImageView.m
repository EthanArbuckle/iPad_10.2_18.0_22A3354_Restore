@implementation CNRadiantShadowImageView

- (CNRadiantShadowImageView)init
{
  CNRadiantShadowImageView *v2;
  CNRadiantShadowImageView *v3;
  void *v4;
  void *v5;
  CNRadiantShadowImageView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNRadiantShadowImageView;
  v2 = -[CNRadiantShadowImageView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[CNRadiantShadowImageView setContentMode:](v2, "setContentMode:", 2);
    -[CNRadiantShadowImageView layer](v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldRasterize:", 1);

    -[CNRadiantShadowImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRasterizationScale:", 0.5);

    v6 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNRadiantShadowImageView;
  -[CNRadiantShadowImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[CNRadiantShadowImageView applyAffineTransform](self, "applyAffineTransform");
}

- (void)setImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNRadiantShadowImageView;
  -[CNRadiantShadowImageView setImage:](&v4, sel_setImage_, a3);
  -[CNRadiantShadowImageView updateLayerFilters](self, "updateLayerFilters");
}

- (void)updateLayerFilters
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E20D2CD8, *MEMORY[0x1E0CD2D90]);
  v5 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D58]);
  objc_msgSend(v4, "setValue:forKeyPath:", v5, *MEMORY[0x1E0CD2D70]);
  objc_msgSend(v4, "setValue:forKeyPath:", v5, *MEMORY[0x1E0CD2D28]);
  objc_msgSend(v4, "setValue:forKeyPath:", v5, *MEMORY[0x1E0CD2D68]);
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E20D2CE8, *MEMORY[0x1E0CD2CB8]);
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = xmmword_18AF8B880;
  v11[1] = xmmword_18AF8B890;
  v11[2] = xmmword_18AF8B8A0;
  v11[3] = xmmword_18AF8B8B0;
  v11[4] = xmmword_18AF8B8C0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, *MEMORY[0x1E0CD2D20]);
  objc_msgSend(v3, "addObject:", v7);

  -[CNRadiantShadowImageView setAlpha:](self, "setAlpha:", 0.3);
  v9 = (void *)objc_msgSend(v3, "copy");
  -[CNRadiantShadowImageView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilters:", v9);

}

- (void)applyAffineTransform
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[CNRadiantShadowImageView frame](self, "frame");
  v4 = v3 * 0.015;
  -[CNRadiantShadowImageView frame](self, "frame");
  v6 = v5 * 0.015;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 1.05, 1.05);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, v6, v4);
  memset(&v12, 0, sizeof(v12));
  t1 = v14;
  t2 = v13;
  CGAffineTransformConcat(&v12, &t1, &t2);
  v9 = v12;
  -[CNRadiantShadowImageView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setAffineTransform:", &v8);

}

@end
