@implementation PLCropOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLCropOverlay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[PLCropOverlayAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PLCropOverlayAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y, (_QWORD)v17);
        objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
