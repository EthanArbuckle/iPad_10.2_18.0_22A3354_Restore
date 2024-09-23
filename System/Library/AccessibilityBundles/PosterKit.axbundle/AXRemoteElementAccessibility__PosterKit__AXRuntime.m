@implementation AXRemoteElementAccessibility__PosterKit__AXRuntime

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AXRemoteElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PREditingSceneViewController"));
  if (NSClassFromString(CFSTR("PRUISAmbientPosterViewController")))
    objc_msgSend(v3, "validateClass:", CFSTR("PRUISAmbientPosterViewController"));

}

- (BOOL)_accessibilityShouldHitTestRemoteElementProcess
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  if (_accessibilityShouldHitTestRemoteElementProcess_onceToken != -1)
    dispatch_once(&_accessibilityShouldHitTestRemoteElementProcess_onceToken, &__block_literal_global_0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __101__AXRemoteElementAccessibility__PosterKit__AXRuntime__accessibilityShouldHitTestRemoteElementProcess__block_invoke_2;
  v6[3] = &unk_25030BBF0;
  v6[4] = self;
  -[AXRemoteElementAccessibility__PosterKit__AXRuntime _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_axIsKindOfClass:(id)a3 fromArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
