@implementation MKPlaceCardUseSmallerFont

void ___MKPlaceCardUseSmallerFont_block_invoke()
{
  void *v0;
  double v1;
  double v2;

  _MergedGlobals_144 = 0;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  if (v2 <= 320.0)
    _MergedGlobals_144 = 1;
}

@end
