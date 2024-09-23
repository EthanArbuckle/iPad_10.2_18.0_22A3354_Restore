@implementation PKSqueezePaletteStrokeWeightButton

- (double)initWithStrokeWeight:(void *)a1
{
  double *v3;
  double *v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)PKSqueezePaletteStrokeWeightButton;
  v3 = (double *)objc_msgSendSuper2(&v9, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[94] = a2;
    objc_initWeak(&location, v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PKSqueezePaletteStrokeWeightButton_initWithStrokeWeight___block_invoke;
    v6[3] = &unk_1E777A1C0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "setPointerStyleProvider:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __59__PKSqueezePaletteStrokeWeightButton_initWithStrokeWeight___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *v8;
  void *WeakRetained;
  id v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a2;
  v7 = a4;
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained(v8);
    v11 = objc_msgSend(v10, "isSelected");

    if ((v11 & 1) != 0)
    {
      WeakRetained = 0;
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v6);
      objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, v7);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return WeakRetained;
}

@end
