@implementation UIScreen(MKBasicMapViewAdditions)

- (id)_mapkit_display
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
  {
    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayLinkWithTarget:selector:", v3, sel_isEqual_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "display");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  return v8;
}

@end
