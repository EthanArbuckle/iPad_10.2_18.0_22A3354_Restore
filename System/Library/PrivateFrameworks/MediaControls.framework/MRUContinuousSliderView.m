@implementation MRUContinuousSliderView

- (void)setGlyphScale:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUContinuousSliderView;
  -[CCUIBaseSliderView setGlyphScale:](&v5, sel_setGlyphScale_);
  -[MRUContinuousSliderView setReferenceGlyphScale:](self, "setReferenceGlyphScale:", a3);
}

- (void)setImageSymbolConfiguration:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[UIImageSymbolConfiguration isEqualToConfiguration:](self->_imageSymbolConfiguration, "isEqualToConfiguration:"))
  {
    objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
    -[MRUOutputDeviceAsset icon](self->_outputDeviceAsset, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v5)
    {
      objc_msgSend(v5, "imageByApplyingSymbolConfiguration:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIBaseSliderView setGlyphImage:](self, "setGlyphImage:", v6);

      -[MRUContinuousSliderView setNeedsLayout](self, "setNeedsLayout");
      -[MRUContinuousSliderView layoutIfNeeded](self, "layoutIfNeeded");
    }

  }
}

- (void)setOutputDeviceAsset:(id)a3 state:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[6];

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (v5)
    v11 = objc_msgSend(v9, "isEqual:", self->_outputDeviceAsset) ^ 1;
  else
    v11 = 0;
  objc_storeStrong((id *)&self->_outputDeviceAsset, a3);
  objc_msgSend(v9, "packageDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && self->_imageSymbolConfiguration)
  {
    objc_msgSend(v13, "imageByApplyingSymbolConfiguration:");
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  if (v11)
  {
    -[MRUContinuousSliderView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke;
    v24[3] = &unk_1E5819110;
    v24[4] = self;
    v24[5] = 0x3FE999999999999ALL;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_2;
    v18[3] = &unk_1E5819A28;
    v18[4] = self;
    v19 = v9;
    v20 = v14;
    v21 = v12;
    v22 = v10;
    v23 = 6;
    objc_msgSend(v16, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 6, v24, v18, 0.3175, 0.0, 1.0, 845.74, 58.1632, 0.0);

  }
  else
  {
    -[CCUIBaseSliderView setGlyphImage:](self, "setGlyphImage:", v14);
    -[CCUIBaseSliderView setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v12);
    -[CCUIBaseSliderView setGlyphState:](self, "setGlyphState:", v10);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_4;
    v17[3] = &unk_1E5818C88;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  }

}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  objc_super v5;

  objc_msgSend(*(id *)(a1 + 32), "referenceGlyphScale");
  v3 = v2 * *(double *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v5, sel_setGlyphScale_, v3);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "outputDeviceAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setGlyphImage:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setGlyphPackageDescription:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setGlyphState:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  v4 = *(_QWORD *)(a1 + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_3;
  v6[3] = &unk_1E5818C88;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v4, v6, 0, 0.9975, 0.0, 2.0, 300.0, 30.0, 0.0);
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_3(uint64_t a1)
{
  objc_super v3;

  objc_msgSend(*(id *)(a1 + 32), "referenceGlyphScale");
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v3, sel_setGlyphScale_);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __63__MRUContinuousSliderView_setOutputDeviceAsset_state_animated___block_invoke_4(uint64_t a1)
{
  objc_super v3;

  objc_msgSend(*(id *)(a1 + 32), "referenceGlyphScale");
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MRUContinuousSliderView;
  objc_msgSendSuper2(&v3, sel_setGlyphScale_);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (MRUOutputDeviceAsset)outputDeviceAsset
{
  return self->_outputDeviceAsset;
}

- (double)referenceGlyphScale
{
  return self->_referenceGlyphScale;
}

- (void)setReferenceGlyphScale:(double)a3
{
  self->_referenceGlyphScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceAsset, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
}

@end
