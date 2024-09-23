@implementation CALayer(AVPictureInPictureContentSourceExtensions)

- (id)avkit_findFirstCALayerHost
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "sublayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "avkit_findFirstCALayerHost");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (double)avkit_visibleRectForRect:()AVPictureInPictureContentSourceExtensions inLayer:
{
  id v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v12 = a7;
  v13 = *MEMORY[0x1E0C9D648];
  if (v12)
  {
    if ((objc_msgSend(a1, "isHidden") & 1) == 0)
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      if (!CGRectIsEmpty(v22))
      {
        objc_msgSend(a1, "superlayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (a1 == v12 || !v14)
        {
          v13 = x;
        }
        else
        {
          if (objc_msgSend(a1, "masksToBounds"))
          {
            objc_msgSend(a1, "bounds");
            objc_msgSend(v12, "convertRect:fromLayer:", a1);
            v25.origin.x = v15;
            v25.origin.y = v16;
            v25.size.width = v17;
            v25.size.height = v18;
            v23.origin.x = x;
            v23.origin.y = y;
            v23.size.width = width;
            v23.size.height = height;
            v24 = CGRectIntersection(v23, v25);
            x = v24.origin.x;
            y = v24.origin.y;
            width = v24.size.width;
            height = v24.size.height;
          }
          objc_msgSend(a1, "superlayer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "avkit_visibleRectForRect:inLayer:", v12, x, y, width, height);
          v13 = v20;

        }
      }
    }
  }

  return v13;
}

- (id)avkit_window
{
  id v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      objc_msgSend(v2, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v2, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(v2, "superlayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

@end
