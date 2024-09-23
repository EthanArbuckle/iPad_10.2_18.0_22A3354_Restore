@implementation PBShelfTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBShelfTile");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBShelfTileAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("superview.subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "indexOfObject:", self);
  v11 = (void *)MEMORY[0x24BDD17C8];
  axLocalizedString(CFSTR("photo.position"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234919778](v10 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73C8];
  -[PBShelfTileAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isSelected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

@end
