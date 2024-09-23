@implementation UIView(MapKitExtras)

- (id)_mapKit_mapView
{
  void *v1;
  void *v2;
  uint64_t Delegate;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_mapKit_mapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    Delegate = CALayerGetDelegate();
    if (Delegate)
    {
      v4 = (void *)Delegate;
      if (!MKIsMKView__viewClass)
        MKIsMKView__viewClass = objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mapkit_currentLayer
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)_mapkit_countOfSet:()MapKitExtras minusSubset:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v9, "minusSet:", v6);
    v8 = objc_msgSend(v9, "count");

  }
  return v8;
}

- (double)_mapkit_doubleFrame
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleBounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(v1, "superlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v1, "superlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "convertDoubleRect:toLayer:", v11, v3, v5, v7, v9);
    v3 = v12;

  }
  return v3;
}

- (id)_findNearestViewController
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      break;
    objc_msgSend(v1, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_opt_class();
      v1 = v3;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        continue;
    }
    goto LABEL_7;
  }
  v3 = v1;
LABEL_7:

  return v2;
}

@end
