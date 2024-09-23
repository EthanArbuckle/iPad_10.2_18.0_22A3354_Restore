@implementation MKPuckAnnotationView

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLegacyConfiguration");

}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char BOOL;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (_MKLinkedOnOrAfterReleaseSet(3081))
      BOOL = GEOConfigGetBOOL();
    else
      BOOL = 0;
    *((_BYTE *)v3 + 1144) = BOOL;
    objc_msgSend(*((id *)v3 + 155), "setFaux3DEnabled:");
    objc_msgSend(v3, "_updateBaseImage");
    objc_msgSend(v3, "_updateShadowImage");
    objc_msgSend(v3, "_createOrRemoveFaux3DRingsIfNecessary");
    objc_msgSend(v3, "_updateFaux3DColors");
    objc_msgSend(v3, "_updateFaux3DLayers");
    WeakRetained = v3;
  }

}

uint64_t __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOConfigGetDouble();
  objc_msgSend(WeakRetained, "_setMinimumAccuracyRadius:");

}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOConfigGetDouble();
    WeakRetained[176] = v1;
    objc_msgSend(WeakRetained, "_updateFromMap");
  }

}

uint64_t __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "removeAnimationForKey:", CFSTR("show/hide"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "removeFromSuperlayer");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  *(_QWORD *)(v2 + 1128) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "removeFromSuperlayer");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1120);
  *(_QWORD *)(v4 + 1120) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "removeAnimationForKey:", CFSTR("show/hide"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "removeAnimationForKey:", CFSTR("show/hide"));
}

id __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1120);
  *(_QWORD *)(v3 + 1120) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "_mapkit_setActionsToRemoveDefaultImplicitActions");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "position");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setPosition:");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSublayer:above:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));

  objc_msgSend(*(id *)(a1 + 32), "_createFakePuckLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1032);
  if (v8)
  {
    objc_msgSend(v8, "transform");
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
  }
  v9 = *(void **)(v7 + 1120);
  v21[4] = v26;
  v21[5] = v27;
  v21[6] = v28;
  v21[7] = v29;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  v21[3] = v25;
  objc_msgSend(v9, "setTransform:", v21);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  if (v10)
  {
    objc_msgSend(v10, "transform");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
  }
  v12[4] = v17;
  v12[5] = v18;
  v12[6] = v19;
  v12[7] = v20;
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  v12[3] = v16;
  objc_msgSend(v6, "setTransform:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "addSublayer:", v6);
  return v6;
}

void __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2 == *(void **)(v3 + 1128))
  {
    *(_QWORD *)(v3 + 1128) = 0;

    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void **)(v4 + 1120);
    *(_QWORD *)(v4 + 1120) = 0;

  }
}

void __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_CA_setDisableActions:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperlayer");
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3 == *(void **)(v4 + 1128))
  {
    *(_QWORD *)(v4 + 1128) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1120);
    *(_QWORD *)(v5 + 1120) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "removeAnimationForKey:", CFSTR("show/hide"));
  }
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_CA_setDisableActions:", 0);

}

void __42___MKPuckAnnotationView__updateGlyphImage__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  uint64_t v20;
  id v21;

  objc_msgSend((id)objc_opt_class(), "innerDiameter");
  v3 = v2 + -8.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "size");
  v4 = v3;
  if (v5 < v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "size");
    v4 = v6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "size");
  if (v7 < v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "size");
    v3 = v8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentsScale");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setFrame:", round(v18 * (v10 + (v14 - v4) * 0.5)) / v18, round(v18 * (v12 + (v16 - v3) * 0.5)) / v18, v4, v3);

  v19 = *(id *)(*(_QWORD *)(a1 + 32) + 1048);
  if (objc_msgSend(v19, "renderingMode") != 1)
  {
    objc_msgSend(v19, "_mapkit_templateImageWithTintColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v20;
  }
  v21 = objc_retainAutorelease(v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setContents:", objc_msgSend(v21, "CGImage"));

}

uint64_t __37___MKPuckAnnotationView__removePulse__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1232), "removeFromSuperlayer");
  return result;
}

uint64_t __68___MKPuckAnnotationView__updateShowHeadingLayer_animatedIfPossible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

@end
