@implementation MKPuckAnnotationViewBaseColor

id ___MKPuckAnnotationViewBaseColor_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
  {
    if (objc_msgSend(v3, "accessibilityContrast") == 1)
    {
      v4 = 0.682352941;
      v5 = 0.698039216;
    }
    else
    {
      v4 = 0.780392157;
      v5 = 0.8;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v4, v4, v5, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(v7, "colorWithAlphaComponent:", 0.5);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
