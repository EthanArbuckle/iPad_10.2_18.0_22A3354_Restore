@implementation CDGraphicSubdialComplicationDistanceFromCenter

double __CDGraphicSubdialComplicationDistanceFromCenter_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double result;
  id v8;

  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledValue:withOverride:forSizeClass:", 3, 16.0, 19.0);
  v5 = v4;
  v6 = CDCircularMediumComplicationDiameter(v3);

  *(double *)&CDGraphicSubdialComplicationDistanceFromCenter__distance = v5 + (v6 + 4.0) * 0.5;
  return result;
}

@end
