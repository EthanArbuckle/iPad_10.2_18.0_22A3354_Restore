@implementation SafariUIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDimmingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)passthroughViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)SafariUIDimmingViewAccessibility;
  -[SafariUIDimmingViewAccessibility passthroughViews](&v16, sel_passthroughViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("BrowserToolbar"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

    -[SafariUIDimmingViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("axPassthroughViews"));
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

@end
