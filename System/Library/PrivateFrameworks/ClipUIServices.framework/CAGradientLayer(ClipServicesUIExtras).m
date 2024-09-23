@implementation CAGradientLayer(ClipServicesUIExtras)

+ (id)cps_grayscaleConicGradientLayer
{
  id v0;
  id v1;
  id v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(v0, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v0, "setEndPoint:", 0.0, 0.5);
  objc_msgSend(v0, "setType:", *MEMORY[0x1E0CD2F50]);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5[0] = objc_msgSend(v1, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5[1] = objc_msgSend(v2, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setColors:", v3);

  return v0;
}

@end
