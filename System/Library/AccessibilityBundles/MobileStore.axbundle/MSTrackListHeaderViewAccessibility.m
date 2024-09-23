@implementation MSTrackListHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSTrackListHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MSTrackListHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_albumLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSTrackListHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artistLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSTrackListHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_releaseDateLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v9, "appendFormat:", CFSTR("%@, "), v6);
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v9, "appendFormat:", CFSTR("%@, "), v4);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v9, "appendFormat:", CFSTR("%@, "), v8);

  return v9;
}

- (id)accessibilityLanguage
{
  return (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_accessibilityContentLanguage"));
}

- (id)_accessibilityChildren
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[MSTrackListHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    -[MSTrackListHeaderViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, *v3);
    v7 = (void *)objc_msgSend(objc_allocWithZone((Class)MSTrackAccessibilityElement), "initWithAccessibilityContainer:", self);
    -[MSTrackListHeaderViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v8);

    -[MSTrackListHeaderViewAccessibility accessibilityLanguage](self, "accessibilityLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLanguage:", v9);

    -[MSTrackListHeaderViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    objc_msgSend(v7, "setAccessibilityFrame:");
    objc_msgSend(v6, "addObject:", v7);
    -[MSTrackListHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_offerButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "addObject:", v10);
    v5 = v6;

  }
  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "_gsEvent", a3.x, a3.y))
  {
    GSEventGetLocationInWindow();
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
    v6 = 0.0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MSTrackListHeaderViewAccessibility _accessibilityChildren](self, "_accessibilityChildren", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "accessibilityFrame");
        v23.x = v6;
        v23.y = v8;
        if (CGRectContainsPoint(v24, v23))
        {
          v12 = v15;
          goto LABEL_14;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_14:

  return v12;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[MSTrackListHeaderViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MSTrackListHeaderViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[MSTrackListHeaderViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

@end
