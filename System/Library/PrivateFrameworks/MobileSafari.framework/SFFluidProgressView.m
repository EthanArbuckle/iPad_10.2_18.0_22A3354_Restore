@implementation SFFluidProgressView

uint64_t __38___SFFluidProgressView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  char v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(double *)(a1 + 56);
  if (v2 != 0.0)
  {
    CATransform3DMakeScale(&v23, 1.0 / v2, 1.0, 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23;
    objc_msgSend(v3, "setTransform:", &v22);

    v2 = *(double *)(a1 + 56);
  }
  CATransform3DMakeScale(&v21, v2, 1.0, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  objc_msgSend(v4, "setTransform:", &v20);

  v5 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
  v6 = 0.0;
  v7 = 0.0;
  if ((v5 & 1) == 0)
    v7 = *(double *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 441))
  {
    objc_msgSend((id)v8, "frame");
    v10 = v9;
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
    v6 = v10 - v11;
    v8 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v8 + 424), "setCenter:", v7, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend((id)objc_opt_class(), "defaultHeight");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBounds:", v13, v15, v17, v18);
}

void __37___SFFluidProgressView_defaultHeight__block_invoke()
{
  defaultHeight_height = _SFCeilingFloatToPixels(2.5);
}

uint64_t __89___SFFluidProgressView_setProgressAnimationSuppressed_duringFluidProgressState_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", v1);
}

uint64_t __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

void __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  id WeakRetained;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "opacity");
    v6 = v5;

    if (v6 == 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 448));
      objc_msgSend(WeakRetained, "fluidProgressViewDidShowProgress:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setHidden:", 1);
    }
  }
}

uint64_t __86___SFFluidProgressView_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 0.0;
  if (!*(_BYTE *)(v1 + 440))
    v2 = 1.0;
  return objc_msgSend(*(id *)(v1 + 424), "setAlpha:", v2);
}

uint64_t __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *v11;
  double v12;
  double v13;
  int v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "destinationPosition");
  objc_msgSend(v2, "_progressBarBoundsForValue:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (*(_BYTE *)(a1 + 48))
  {
    v11 = *(id **)(a1 + 32);
    if (v11[53])
    {
      objc_msgSend(v11[53], "transform");
      v12 = *(double *)&v17;
      v11 = *(id **)(a1 + 32);
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
      v12 = 0.0;
    }
    v13 = 100.0 / v12;
    v8 = v8 + 100.0 / v12;
    v14 = objc_msgSend(v11, "_sf_usesLeftToRightLayout", v17, v18, v19);
    v15 = 0.0;
    if (!v14)
      v15 = v13;
    v4 = v4 - v15;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBounds:", v4, v6, v8, v10);
}

void __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_3;
  block[3] = &unk_1E21E4698;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

@end
