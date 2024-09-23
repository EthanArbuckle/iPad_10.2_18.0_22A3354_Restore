@implementation AVTAvatarColorSliderContainerView

- (AVTAvatarColorSliderContainerView)initWithFrame:(CGRect)a3 userInterfaceLayoutDirection:(int64_t)a4
{
  AVTAvatarColorSliderContainerView *v5;
  void *v6;
  AVTColorSlider *v7;
  AVTColorSlider *slider;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarColorSliderContainerView;
  v5 = -[AVTAvatarColorSliderContainerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarColorSliderContainerView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = -[AVTColorSlider initWithUserInterfaceLayoutDirection:]([AVTColorSlider alloc], "initWithUserInterfaceLayoutDirection:", a4);
    slider = v5->_slider;
    v5->_slider = v7;

    -[AVTColorSlider setAutoresizingMask:](v5->_slider, "setAutoresizingMask:", 34);
    -[AVTColorSlider setDelegate:](v5->_slider, "setDelegate:", v5);
    -[AVTAvatarColorSliderContainerView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[AVTAvatarColorSliderContainerView addSubview:](v5, "addSubview:", v5->_slider);
  }
  return v5;
}

- (void)setSectionItem:(id)a3
{
  -[AVTAvatarColorSliderContainerView setSectionItem:animated:](self, "setSectionItem:animated:", a3, 0);
}

- (void)setSectionItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  AVTAvatarAttributeEditorSectionColorItem *v7;
  AVTAvatarAttributeEditorSectionColorItem *v8;

  v4 = a4;
  v7 = (AVTAvatarAttributeEditorSectionColorItem *)a3;
  if (self->_sectionItem != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_sectionItem, a3);
    -[AVTAvatarColorSliderContainerView updateSliderTrackLayerAnimated:](self, "updateSliderTrackLayerAnimated:", v4);
    v7 = v8;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarColorSliderContainerView;
  -[AVTAvatarColorSliderContainerView layoutSubviews](&v8, sel_layoutSubviews);
  -[AVTAvatarColorSliderContainerView bounds](self, "bounds");
  v4 = v3 + -40.0;
  -[AVTAvatarColorSliderContainerView bounds](self, "bounds");
  v6 = v5;
  -[AVTAvatarColorSliderContainerView slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 20.0, 0.0, v4, v6);

}

- (void)updateSliderTrackLayerAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;

  -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gradientProvider");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "skinColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__AVTAvatarColorSliderContainerView_updateSliderTrackLayerAnimated___block_invoke;
    v12[3] = &unk_1EA520570;
    v12[4] = self;
    v13 = a3;
    ((void (**)(_QWORD, void *, void *, _QWORD *))v7)[2](v7, v9, v11, v12);

  }
}

void __68__AVTAvatarColorSliderContainerView_updateSliderTrackLayerAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrackLayer:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

- (void)updateSliderWithColorPreset:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarColorSliderContainerView slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  objc_msgSend(v6, "variation");
  v11 = v10;

  if (v9 != v11)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v13 = 0.2;
    else
      v13 = 0.0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__AVTAvatarColorSliderContainerView_updateSliderWithColorPreset_animated___block_invoke;
    v20[3] = &unk_1EA520598;
    v20[4] = self;
    v21 = v6;
    v22 = v4;
    objc_msgSend(v12, "animateWithDuration:animations:", v20, v13);

  }
  -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layerContentProvider");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "skinColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorSliderContainerView slider](self, "slider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "thumbLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *, void *))v15)[2](v15, v6, v17, v19);

}

void __74__AVTAvatarColorSliderContainerView_updateSliderWithColorPreset_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "slider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "variation");
  objc_msgSend(v2, "setValue:animated:", *(unsigned __int8 *)(a1 + 48));

}

- (void)colorSlider:(id)a3 valueChanged:(double)a4
{
  void *v6;
  id v7;

  -[AVTAvatarColorSliderContainerView delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorSliderVariationChanged:forItem:", v6, a4);

}

- (void)colorSlider:(id)a3 didFinishSelectingValue:(double)a4
{
  void *v6;
  id v7;

  -[AVTAvatarColorSliderContainerView delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorSliderContainerView sectionItem](self, "sectionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorSliderDidFinishChangingVariation:forItem:", v6, a4);

}

- (AVTAvatarAttributeEditorSectionColorItem)sectionItem
{
  return self->_sectionItem;
}

- (AVTAvatarColorSliderContainerViewDelegate)delegate
{
  return (AVTAvatarColorSliderContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTColorSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionItem, 0);
}

@end
