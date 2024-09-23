@implementation PKSqueezePaletteViewResizeHandle

- (PKSqueezePaletteViewResizeHandle)init
{
  return (PKSqueezePaletteViewResizeHandle *)-[PKSqueezePaletteViewResizeHandle initWithStrokeStartPresentationValue:strokeEndPresentationValue:](self, 0.0, 0.0);
}

- (id)initWithStrokeStartPresentationValue:(double)a3 strokeEndPresentationValue:
{
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
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
  v17.super_class = (Class)PKSqueezePaletteViewResizeHandle;
  v5 = (id *)objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v7 = v5[1];
    v5[1] = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v9 = v5[2];
    v5[2] = v8;

    objc_msgSend(v5[1], "setValue:", a2);
    objc_msgSend(v5[2], "setValue:", a3);
    objc_initWeak(&location, v5);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11 = v5[2];
    v18[0] = v5[1];
    v18[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__PKSqueezePaletteViewResizeHandle_initWithStrokeStartPresentationValue_strokeEndPresentationValue___block_invoke;
    v14[3] = &unk_1E7777588;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __100__PKSqueezePaletteViewResizeHandle_initWithStrokeStartPresentationValue_strokeEndPresentationValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 3);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }

}

- (void)resizeToStrokeStart:(void *)a3 strokeEnd:(void *)a4 animated:(double)a5 resizeHandler:(double)a6 completion:
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22[3];
  id location;
  _QWORD aBlock[4];
  id v25;

  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v13 = objc_msgSend(v11, "copy");
    v14 = (void *)a1[3];
    a1[3] = v13;

    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke;
    aBlock[3] = &unk_1E7777F58;
    v25 = v12;
    v16 = _Block_copy(aBlock);
    objc_initWeak(&location, a1);
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_2;
    v20[3] = &unk_1E777BE08;
    objc_copyWeak(v22, &location);
    v21 = v16;
    v22[1] = *(id *)&a5;
    v22[2] = *(id *)&a6;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_3;
    v18[3] = &unk_1E777AF00;
    v17 = v21;
    v19 = v17;
    -[PKSqueezePaletteViewResizeHandle _performAnimated:animations:completion:]((uint64_t)a1, a2, v20, v18);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);

  }
}

uint64_t __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "setValue:", *(double *)(a1 + 48));
    objc_msgSend(v3[2], "setValue:", *(double *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __100__PKSqueezePaletteViewResizeHandle_resizeToStrokeStart_strokeEnd_animated_resizeHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v8, v7, *(double *)&PKSqueezePaletteViewResizeDampingRatio, *(double *)&PKSqueezePaletteViewResizeResponse, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationValueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_strokeEndAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_strokeStartAnimatableProperty, 0);
}

@end
