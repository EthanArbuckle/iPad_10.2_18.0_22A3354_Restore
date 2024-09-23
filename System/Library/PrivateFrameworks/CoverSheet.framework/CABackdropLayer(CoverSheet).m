@implementation CABackdropLayer(CoverSheet)

+ (id)backdropLayerWithGaussianBlurRadius:()CoverSheet brightnessAmount:saturationAmount:
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2708], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setOpacity:", v7);
  objc_msgSend(MEMORY[0x1E0CD2780], "gaussianFilterWithInputRadius:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "brightnessFilterWithAmount:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "saturationFilterWithAmount:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = v9;
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v11);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(v6, "setScale:", 100.0);
  objc_msgSend(v6, "setAllowsGroupOpacity:", 1);
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 1);

  return v6;
}

@end
