@implementation PKSqueezePaletteViewPresentationHandle

- (PKSqueezePaletteViewPresentationHandle)init
{
  return (PKSqueezePaletteViewPresentationHandle *)-[PKSqueezePaletteViewPresentationHandle initWithPaletteViewOpacityPresentationValue:paletteViewScalePresentationValue:](self, 0.0, 1.0);
}

- (id)initWithPaletteViewOpacityPresentationValue:(double)a3 paletteViewScalePresentationValue:
{
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v17.receiver = a1;
  v17.super_class = (Class)PKSqueezePaletteViewPresentationHandle;
  v5 = (id *)objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v7 = v5[3];
    v5[3] = v6;

    objc_msgSend(v5[3], "setValue:", a2);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v9 = v5[4];
    v5[4] = v8;

    objc_msgSend(v5[4], "setValue:", a3);
    v10 = v5[4];
    v18[0] = v5[3];
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __120__PKSqueezePaletteViewPresentationHandle_initWithPaletteViewOpacityPresentationValue_paletteViewScalePresentationValue___block_invoke;
    v14[3] = &unk_1E7777588;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v11, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __120__PKSqueezePaletteViewPresentationHandle_initWithPaletteViewOpacityPresentationValue_paletteViewScalePresentationValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 5);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }

}

- (void)animateToPaletteViewOpacity:(void *)a3 paletteViewScale:(void *)a4 animated:(double)a5 presentationValueHandler:(double)a6 completion:
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26[3];
  id location;
  _QWORD aBlock[4];
  id v29;

  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v13 = objc_msgSend(v11, "copy");
    v14 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v13;

    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke;
    aBlock[3] = &unk_1E777AF00;
    v29 = v12;
    v16 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 24), "value");
    *(_QWORD *)(a1 + 8) = v17;
    objc_msgSend(*(id *)(a1 + 32), "value");
    *(_QWORD *)(a1 + 16) = v18;
    objc_initWeak(&location, (id)a1);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_2;
    v24[3] = &unk_1E777BE08;
    objc_copyWeak(v26, &location);
    v19 = v16;
    v25 = v19;
    v26[1] = *(id *)&a5;
    v26[2] = *(id *)&a6;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_3;
    v21[3] = &unk_1E777D100;
    objc_copyWeak(&v23, &location);
    v20 = v19;
    v22 = v20;
    -[PKSqueezePaletteViewPresentationHandle _performAnimated:animations:completion:](a1, a2, v24, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(v26);
    objc_destroyWeak(&location);

  }
}

uint64_t __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 48) = 1;
    objc_msgSend(WeakRetained[3], "setValue:", *(double *)(a1 + 48));
    objc_msgSend(v3[4], "setValue:", *(double *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __132__PKSqueezePaletteViewPresentationHandle_animateToPaletteViewOpacity_paletteViewScale_animated_presentationValueHandler_completion___block_invoke_3(uint64_t a1, char a2)
{
  _BYTE *WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    WeakRetained[48] = a2 ^ 1;
  v5 = WeakRetained;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_performAnimated:(void *)a3 animations:(void *)a4 completion:
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (a1)
  {
    if (a2)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v8, v7, *(double *)&PKSqueezePaletteViewPresentationDampingRatio, *(double *)&PKSqueezePaletteViewPresentationResponse, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v8);
  }

}

- (double)animationProgress
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 24), "presentationValue");
  v3 = v2 - *(double *)(a1 + 8);
  objc_msgSend(*(id *)(a1 + 24), "value");
  v5 = v3 / (v4 - *(double *)(a1 + 8));
  objc_msgSend(*(id *)(a1 + 32), "presentationValue");
  v7 = v6 - *(double *)(a1 + 16);
  objc_msgSend(*(id *)(a1 + 32), "value");
  return (v5 + v7 / (v8 - *(double *)(a1 + 16))) * 0.5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationValueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_paletteViewScaleAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_paletteViewOpacityAnimatableProperty, 0);
}

@end
