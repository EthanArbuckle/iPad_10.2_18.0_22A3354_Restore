@implementation CALayer(ITKUtilities)

- (id)itk_quadFromConvertingBoundsToLayer:()ITKUtilities
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "itk_quadFromConvertingRect:toLayer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ITKQuad)itk_quadFromConvertingRect:()ITKUtilities toLayer:
{
  id v12;
  ITKQuad *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  ITKQuad *v30;

  v12 = a7;
  v13 = -[ITKQuad initWithRect:]([ITKQuad alloc], "initWithRect:", a2, a3, a4, a5);
  -[ITKQuad topLeft](v13, "topLeft");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v15 = v14;
  v17 = v16;
  -[ITKQuad topRight](v13, "topRight");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v19 = v18;
  v21 = v20;
  -[ITKQuad bottomLeft](v13, "bottomLeft");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v23 = v22;
  v25 = v24;
  -[ITKQuad bottomRight](v13, "bottomRight");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v27 = v26;
  v29 = v28;

  v30 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v23, v25, v27, v29, v15, v17, v19, v21);
  return v30;
}

- (ITKAutoFadeOutLayer)itk_autoFadeOutShapePointLayer
{
  ITKAutoFadeOutLayer *v2;
  void *v3;
  id v4;
  ITKAutoFadeOutLayer *v6;

  v2 = objc_alloc_init(ITKAutoFadeOutLayer);
  objc_msgSend(MEMORY[0x24BEBD4B8], "itk_randomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[ITKAutoFadeOutLayer setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  ITKRectWithOriginAndSize();
  -[ITKAutoFadeOutLayer setBounds:](v2, "setBounds:");
  objc_msgSend(a1, "addSublayer:", v2);
  v6 = v2;
  itk_dispatchMainAfterDelay();

  return v6;
}

- (id)itk_autoFadeOutShapeRectLayer
{
  void *v1;
  id v2;

  objc_msgSend(a1, "itk_autoFadeOutShapePointLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  objc_msgSend(v1, "setBorderWidth:", 2.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

@end
