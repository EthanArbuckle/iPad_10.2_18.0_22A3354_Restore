@implementation UIView(DC)

- (BOOL)dc_isRTL
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (uint64_t)dc_directionalSafeAreaInsets
{
  objc_msgSend(a1, "dc_isRTL");
  return objc_msgSend(a1, "safeAreaInsets");
}

- (uint64_t)dc_isInSecureWindow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "expectsSecureRendering");

    return v6;
  }
  else
  {
    v8 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[UIView(DC) dc_isInSecureWindow].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    return 1;
  }
}

- (uint64_t)dc_crashIfWindowIsSecure
{
  uint64_t result;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = objc_msgSend(a1, "dc_isInSecureWindow");
  if ((_DWORD)result)
  {
    v2 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[UIView(DC) dc_crashIfWindowIsSecure].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

    return objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Attempted to show notes during unsecure session."));
  }
  return result;
}

- (id)dc_imageRenderedFromLayer
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6A98]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__UIView_DC__dc_imageRenderedFromLayer__block_invoke;
  v10[3] = &unk_24C5B8708;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dc_imageRenderedFromViewHierarchy
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6A98]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__UIView_DC__dc_imageRenderedFromViewHierarchy__block_invoke;
  v10[3] = &unk_24C5B8708;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dc_imageViewRenderedFromLayer
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "dc_imageRenderedFromLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

- (id)dc_imageViewRenderedFromViewHierarchy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "dc_imageRenderedFromViewHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

- (void)dc_removeAllConstraintsForSubview:()DC
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "constraints", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "firstItem");
        v12 = objc_claimAutoreleasedReturnValue();
        if ((id)v12 == v4)
        {

        }
        else
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "secondItem");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 != v4)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "removeConstraints:", v5);
}

- (void)dc_addConstraintsToFillSuperview
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _NSDictionaryOfVariableBindings(CFSTR("view"), v1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[view]|"), 0, 0, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConstraints:", v3);

  v4 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v5);

}

- (id)dc_renderImage
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6A98]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __28__UIView_DC__dc_renderImage__block_invoke;
  v10[3] = &unk_24C5B8708;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dc_renderImageView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "dc_renderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

+ (uint64_t)dc_animateWithDuration:()DC timingFunction:animations:
{
  return objc_msgSend(a1, "dc_animateWithDuration:timingFunction:animations:completion:", a3, a4, 0);
}

+ (void)dc_animateWithDuration:()DC timingFunction:animations:completion:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a6;
  if (a5)
  {
    v10 = (void *)MEMORY[0x24BDE57D8];
    v11 = a5;
    v12 = a4;
    objc_msgSend(v10, "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationTimingFunction:", v12);

    v13 = (void *)MEMORY[0x24BDF6F90];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__UIView_DC__dc_animateWithDuration_timingFunction_animations_completion___block_invoke;
    v14[3] = &unk_24C5B8730;
    v15 = v9;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v11, v14, a1);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)dc_isInSecureWindow
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "It is invalid to call dc_isInSecureWindow for views that don't have a window.", a5, a6, a7, a8, 0);
}

- (void)dc_crashIfWindowIsSecure
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "Attempted to show notes during unsecure session.", a5, a6, a7, a8, 0);
}

@end
