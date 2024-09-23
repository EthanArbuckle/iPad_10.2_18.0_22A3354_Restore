@implementation NTKPolygonCylinderTransformView

void __50___NTKPolygonCylinderTransformView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  _OWORD v10[8];

  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = a3;
  objc_msgSend(v7, "setCenter:", v5, v6);
  objc_msgSend(v7, "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  if (v9)
    objc_msgSend(v9, "_transformForFaceIndex:", a2);
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(v8, "setTransform:", v10);

}

@end
