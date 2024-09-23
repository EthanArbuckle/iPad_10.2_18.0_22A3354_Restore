@implementation WAUIDimmingViewAccessibility

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
  void *v4;
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
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v16.receiver = self;
    v16.super_class = (Class)WAUIDimmingViewAccessibility;
    -[WAUIDimmingViewAccessibility passthroughViews](&v16, sel_passthroughViews);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
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
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WAUIDimmingViewAccessibility;
    -[WAUIDimmingViewAccessibility passthroughViews](&v17, sel_passthroughViews);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
