@implementation UIScreen(CKUtilities)

- (BOOL)__ck_isFullscreen
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  _BOOL8 result;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 1)
    return 1;
  objc_msgSend(a1, "_mainSceneFrame");
  result = 1;
  if (v4 != 0.0)
  {
    v7 = v5;
    if (v5 != 0.0)
    {
      v8 = v4;
      objc_msgSend(a1, "_referenceBounds");
      v11 = v8 < v7;
      if (v9 < v10)
        v11 = v8 > v7;
      if (v11)
        v12 = v8;
      else
        v12 = v7;
      if (v11)
        v13 = v7;
      else
        v13 = v8;
      return v12 == v10 && v13 == v9;
    }
  }
  return result;
}

@end
