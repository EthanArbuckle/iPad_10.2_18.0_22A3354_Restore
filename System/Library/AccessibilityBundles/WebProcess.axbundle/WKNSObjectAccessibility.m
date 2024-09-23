@implementation WKNSObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  WKNSObjectAccessibility *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WKNSObjectAccessibility *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WKNSObjectAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    && (-[WKNSObjectAccessibility accessibilityFrame](self, "accessibilityFrame"),
        v20.x = x,
        v20.y = y,
        CGRectContainsPoint(v21, v20)))
  {
    v6 = self;
  }
  else
  {
    -[WKNSObjectAccessibility accessibilityElements](self, "accessibilityElements");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "accessibilityHitTest:", x, y, (_QWORD)v14);
        v12 = (WKNSObjectAccessibility *)objc_claimAutoreleasedReturnValue();
        v6 = v12;
        if (v12)
        {
          if ((-[WKNSObjectAccessibility isAccessibilityElement](v12, "isAccessibilityElement") & 1) != 0)
            break;
        }

        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            goto LABEL_6;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v6 = 0;
    }

  }
  return v6;
}

- (id)_accessibilityFirstElementForFocusForRemoteElement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WKNSObjectAccessibility _accessibilityResponderElement](self, "_accessibilityResponderElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[WKNSObjectAccessibility _accessibilityFirstDescendant](self, "_accessibilityFirstDescendant");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a3 == 95250 && (isKindOfClass & 1) != 0)
  {
    -[WKNSObjectAccessibility _accessibilityFirstElementForFocusForRemoteElement](self, "_accessibilityFirstElementForFocusForRemoteElement");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WKNSObjectAccessibility;
    -[WKNSObjectAccessibility _iosAccessibilityAttributeValue:forParameter:](&v11, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  objc_super v10;
  objc_super v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[WKNSObjectAccessibility _iosAccessibilityAttributeValue:](&v10, sel__iosAccessibilityAttributeValue_, a3, self, WKNSObjectAccessibility, v11.receiver, v11.super_class);
    goto LABEL_8;
  }
  if (a3 > 3022)
  {
    if ((unint64_t)(a3 - 3023) >= 2)
    {
      if (a3 != 3050)
        goto LABEL_6;
      goto LABEL_12;
    }
    -[WKNSObjectAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityResponderElementForFocus");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 3000)
    {
      -[WKNSObjectAccessibility _accessibilityUnignoredDescendant](self, "_accessibilityUnignoredDescendant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (a3 != 3002)
    {
      if (a3 != 3009)
      {
LABEL_6:
        -[WKNSObjectAccessibility _iosAccessibilityAttributeValue:](&v11, sel__iosAccessibilityAttributeValue_, a3, v10.receiver, v10.super_class, self, WKNSObjectAccessibility);
LABEL_8:
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
LABEL_12:
      -[WKNSObjectAccessibility _accessibilityFirstElementForFocusForRemoteElement](self, "_accessibilityFirstElementForFocusForRemoteElement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    -[WKNSObjectAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityResponderElement");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  return -[WKNSObjectAccessibility _accessibilityIsVisibleByCompleteHitTest:](self, "_accessibilityIsVisibleByCompleteHitTest:", 0);
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  objc_super v19;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if ((_DWORD)v6 == 5300)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count") == 2)
    {
      -[WKNSObjectAccessibility accessibilityElements](self, "accessibilityElements");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", objc_msgSend(v14, "unsignedIntegerValue"), 0);
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if ((_DWORD)v6 != 5304)
  {
    v19.receiver = self;
    v19.super_class = (Class)WKNSObjectAccessibility;
    v17 = -[WKNSObjectAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v19, sel__iosAccessibilityPerformAction_withValue_fencePort_, v6, v8, v5);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "count") != 2)
    goto LABEL_14;
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_msgSend(v8, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  -[WKNSObjectAccessibility accessibilityElements](self, "accessibilityElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  objc_msgSend(v8, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", v15, v16);

LABEL_11:
LABEL_15:

  return v17;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[WKNSObjectAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", a3, v6);

  return a3;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  void *v5;

  -[WKNSObjectAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", a3, 0);

  return a3;
}

@end
