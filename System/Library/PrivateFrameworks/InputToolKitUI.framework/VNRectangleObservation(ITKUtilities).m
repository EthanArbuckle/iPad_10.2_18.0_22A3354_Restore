@implementation VNRectangleObservation(ITKUtilities)

- (ITKQuad)itkQuad
{
  void *v0;
  void *v1;
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
  ITKQuad *v14;
  double v16;
  double v17;

  objc_opt_class();
  ITKDynamicCast();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "topLeft");
    ITKFlipPoint();
    v16 = v3;
    v17 = v2;
    objc_msgSend(v1, "topRight");
    ITKFlipPoint();
    v5 = v4;
    v7 = v6;
    objc_msgSend(v1, "bottomLeft");
    ITKFlipPoint();
    v9 = v8;
    v11 = v10;
    objc_msgSend(v1, "bottomRight");
    ITKFlipPoint();
    v14 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v9, v11, v12, v13, v17, v16, v5, v7);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)itk_quadConvertedToView:()ITKUtilities withContentsRect:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(a1, "itkQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v12, a2, a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
