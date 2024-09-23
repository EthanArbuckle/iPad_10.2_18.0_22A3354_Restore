@implementation UIImage(HUImageUtilities)

+ (id)hu_locationArrowTemplate
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithRenderingMode:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (double)hu_scaleSize:()HUImageUtilities toSize:contentMode:
{
  double v7;
  double v8;

  v7 = a1 / a2;
  v8 = a3 / a4;
  if (a7 == 2)
  {
    if (v7 <= v8)
      return a3;
    return a4 * v7;
  }
  if (a7 == 1 && v7 < v8)
    return a4 * v7;
  return a3;
}

- (id)hu_imageScaledToSize:()HUImageUtilities contentMode:
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  id v23;
  CGSize v25;

  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "size");
  objc_msgSend(v5, "hu_scaleSize:toSize:contentMode:", a3);
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "size");
  if (v11 == v7 && v10 == v9)
  {
    v23 = a1;
  }
  else
  {
    objc_msgSend(a1, "scale");
    UIRectIntegralWithScale();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(a1, "scale");
    v22 = v21;
    v25.width = v18;
    v25.height = v20;
    UIGraphicsBeginImageContextWithOptions(v25, 0, v22);
    objc_msgSend(a1, "drawInRect:", v14, v16, v18, v20);
    UIGraphicsGetImageFromCurrentImageContext();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v23;
}

+ (uint64_t)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:
{
  return objc_msgSend(a1, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", a3, a4, a5, 0);
}

+ (id)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:
{
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  CGSize v28;

  v15 = a7;
  v16 = (void *)MEMORY[0x1E0CEA638];
  v17 = a8;
  objc_msgSend(v16, "systemImageNamed:withConfiguration:", a6, a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithTintColor:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "scale");
    v21 = v20;
    v28.width = a1;
    v28.height = a2;
    UIGraphicsBeginImageContextWithOptions(v28, 0, v21);
    objc_msgSend(v15, "setFill");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a1, a2, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fill");
    objc_msgSend(v19, "size");
    v24 = (a1 - v23) * 0.5;
    objc_msgSend(v19, "size");
    objc_msgSend(v19, "drawAtPoint:", v24, (a2 - v25) * 0.5);
    UIGraphicsGetImageFromCurrentImageContext();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)hu_symbolForDevice:()HUImageUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v27;
  _QWORD *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productClass");

  switch(v6)
  {
    case 0:
      objc_msgSend(a1, "hu_symbolFromProductPlatform:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    case 1:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30FC0];
      goto LABEL_31;
    case 2:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30FC8];
      goto LABEL_31;
    case 3:
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("ipad"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v36 = "+[UIImage(HUImageUtilities) hu_symbolForDevice:]";
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%s iPad icon: %@", buf, 0x16u);

      }
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30FB8];
      goto LABEL_31;
    case 4:
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("appletv.fill"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v36 = "+[UIImage(HUImageUtilities) hu_symbolForDevice:]";
        v37 = 2112;
        v38 = v14;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s Apple TV icon: %@", buf, 0x16u);

      }
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30F50];
      goto LABEL_31;
    case 5:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30F58];
      goto LABEL_31;
    case 6:
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v18)
        goto LABEL_26;
      v19 = v18;
      v20 = *(_QWORD *)v31;
      break;
    case 7:
      goto LABEL_27;
    case 8:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30F98];
      goto LABEL_31;
    case 9:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30FA0];
      goto LABEL_31;
    case 10:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = (_QWORD *)MEMORY[0x1E0D30FA8];
      goto LABEL_31;
    default:
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (const char *)v4;
        _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Could not fetch icon for %@. Both product class and platform were unknown", buf, 0xCu);
      }

      v7 = 0;
      goto LABEL_33;
  }
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v31 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v22, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v4);

      if (v24)
      {
        if (objc_msgSend(v22, "homePodVariant") == 2)
        {
          v27 = (void *)MEMORY[0x1E0CEA638];
          v28 = (_QWORD *)MEMORY[0x1E0D30F88];
          goto LABEL_36;
        }
        if (objc_msgSend(v22, "homePodVariant") == 1 || objc_msgSend(v22, "homePodVariant") == 3)
        {
          v27 = (void *)MEMORY[0x1E0CEA638];
          v28 = (_QWORD *)MEMORY[0x1E0D30F90];
LABEL_36:
          objc_msgSend(v27, "systemImageNamed:", *v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "imageWithTintColor:", v29);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v19)
      continue;
    break;
  }
LABEL_26:

LABEL_27:
  v9 = (void *)MEMORY[0x1E0CEA638];
  v10 = (_QWORD *)MEMORY[0x1E0D30FB0];
LABEL_31:
  objc_msgSend(v9, "systemImageNamed:", *v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithTintColor:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:
  return v7;
}

+ (id)hu_symbolFromProductPlatform:()HUImageUtilities
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD *v25;
  void *v26;
  uint8_t v27[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productPlatform");

  objc_msgSend(v3, "productInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "productClass");

  switch(v5)
  {
    case 1:
      v8 = (void *)MEMORY[0x1E0CEA638];
      v9 = (_QWORD *)MEMORY[0x1E0D30F98];
      goto LABEL_22;
    case 2:
      v8 = (void *)MEMORY[0x1E0CEA638];
      v9 = (_QWORD *)MEMORY[0x1E0D30FC0];
      goto LABEL_22;
    case 3:
      v8 = (void *)MEMORY[0x1E0CEA638];
      v9 = (_QWORD *)MEMORY[0x1E0D30F58];
      goto LABEL_22;
    case 4:
      if (v7 != 6)
      {
        v8 = (void *)MEMORY[0x1E0CEA638];
        v9 = (_QWORD *)MEMORY[0x1E0D30F50];
LABEL_22:
        objc_msgSend(v8, "systemImageNamed:", *v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageWithTintColor:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v13)
        goto LABEL_17;
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "device");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v3);

          if (!v19)
            continue;
          if (objc_msgSend(v17, "homePodVariant") == 2)
          {
            v24 = (void *)MEMORY[0x1E0CEA638];
            v25 = (_QWORD *)MEMORY[0x1E0D30F88];
LABEL_27:
            objc_msgSend(v24, "systemImageNamed:", *v25);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "imageWithTintColor:", v26);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
            goto LABEL_24;
          }
          if (objc_msgSend(v17, "homePodVariant") == 1 || objc_msgSend(v17, "homePodVariant") == 3)
          {
            v24 = (void *)MEMORY[0x1E0CEA638];
            v25 = (_QWORD *)MEMORY[0x1E0D30F90];
            goto LABEL_27;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
LABEL_17:

LABEL_18:
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "Unknown product Platform", v27, 2u);
      }

      v21 = 0;
LABEL_24:

      return v21;
    default:
      goto LABEL_18;
  }
}

@end
