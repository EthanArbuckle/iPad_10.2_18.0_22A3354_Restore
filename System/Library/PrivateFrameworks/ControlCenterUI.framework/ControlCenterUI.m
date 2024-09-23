BOOL CCUILayoutSizeEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

id CCUIIconImageForApplicationIdentifier(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  id v7;
  os_log_t *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  id v32;

  v5 = a1;
  if (!v5)
  {
    v13 = *MEMORY[0x1E0D14698];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14698], OS_LOG_TYPE_ERROR))
      CCUIIconImageForApplicationIdentifier_cold_1(v13);
    goto LABEL_25;
  }
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v5, &v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v32;
  if (!v6)
  {
    v8 = (os_log_t *)MEMORY[0x1E0D14698];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14698], OS_LOG_TYPE_ERROR))
      CCUIIconImageForApplicationIdentifier_cold_4();
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    if (!v6 && os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      CCUIIconImageForApplicationIdentifier_cold_3();

  }
  v10 = objc_opt_class();
  v11 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v14 = v12;

  objc_msgSend(v14, "applicationState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v15, "isValid");
  if ((_DWORD)v14)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v5);
    _CCUIIconImageDescriptorForSize(a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepareImageForDescriptor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0DC3870];
      v21 = objc_msgSend(v18, "CGImage");
      objc_msgSend(v19, "scale");
      objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = *MEMORY[0x1E0D14698];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14698], OS_LOG_TYPE_ERROR))
        CCUIIconImageForApplicationIdentifier_cold_2((uint64_t)v5, v23, v24, v25, v26, v27, v28, v29);
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  if (!v22)
  {
LABEL_25:
    CCUIGenericIconImageForSize(a2, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id _CCUIIconImageDescriptorForSize(double a1, double a2)
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a1, a2, v6);
}

id CCUIFixSpecialAttributions(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a1;
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v25;
    v4 = *MEMORY[0x1E0D14620];
    v22 = *MEMORY[0x1E0D146D8];
    v21 = *MEMORY[0x1E0D14650];
    v5 = *MEMORY[0x1E0D14708];
    v20 = *MEMORY[0x1E0D14700];
    v6 = *MEMORY[0x1E0D14618];
    v7 = *MEMORY[0x1E0D14728];
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v25 != v3)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "userInterfaceIdiom");

          if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v14 = v21;
          else
            v14 = v22;
          objc_msgSend(v9, "setBundleIdentifier:", v14);
        }
        objc_msgSend(v9, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v5);

        if (v16)
          objc_msgSend(v9, "setBundleIdentifier:", v20);
        objc_msgSend(v9, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v6);

        if (v18)
          objc_msgSend(v9, "setBundleIdentifier:", v7);
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v2);
  }
  return obj;
}

id CCUIUniqueSensorAttributionEntitiesForSensorActivityData(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v7 = v1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (!objc_msgSend(v12, "sensorType"))
          objc_msgSend(v3, "addObject:", v12);
        if (objc_msgSend(v12, "sensorType") == 1)
          objc_msgSend(v4, "addObject:", v12);
        if (objc_msgSend(v12, "sensorType") == 2)
          objc_msgSend(v5, "addObject:", v12);
        if (objc_msgSend(v12, "sensorType") == 3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v9);
  }
  v39 = v7;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x1E0D147D0], "attributionEntityFromSensorActivityData:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v15);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(MEMORY[0x1E0D147D0], "attributionEntityFromSensorActivityData:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v21);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v5;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(MEMORY[0x1E0D147D0], "attributionEntityFromSensorActivityData:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v27);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = v6;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(MEMORY[0x1E0D147D0], "attributionEntityFromSensorActivityData:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * n));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v33);
  }

  objc_msgSend(v2, "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

double CCUIPortraitHeaderHeight()
{
  double v0;

  if (_CCUIPortraitStatusBarBaselineToTopOffsetHeight_onceToken != -1)
    dispatch_once(&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_onceToken, &__block_literal_global_4);
  v0 = *(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height;
  if (CCUIStatusBarBaselineHeight_onceToken != -1)
    dispatch_once(&CCUIStatusBarBaselineHeight_onceToken, &__block_literal_global_3);
  return v0 + *(double *)&CCUIStatusBarBaselineHeight_height;
}

double CCUIStatusBarHeight()
{
  if (CCUIStatusBarHeight_onceToken != -1)
    dispatch_once(&CCUIStatusBarHeight_onceToken, &__block_literal_global_2);
  return *(double *)&CCUIStatusBarHeight_height;
}

double CCUILayoutEdgeInsetsForInterfaceOrientation(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t *v5;
  double v6;

  if (CCUILayoutEdgeInsetsForInterfaceOrientation_onceToken != -1)
    dispatch_once(&CCUILayoutEdgeInsetsForInterfaceOrientation_onceToken, &__block_literal_global_8);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");
  v4 = (unint64_t)(a1 - 1) < 2 || v3 == 1;
  v5 = &CCUILayoutEdgeInsetsForInterfaceOrientation_portraitInsets_0;
  if (!v4)
    v5 = &CCUILayoutEdgeInsetsForInterfaceOrientation_landscapeInsets_0;
  v6 = *(double *)v5;

  return v6;
}

id CCUILocalizedDescriptionForSensorActivityData(void *a1)
{
  id v1;
  unint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = objc_msgSend(v1, "sensorType") - 1;
  if (v2 > 2)
    v3 = CFSTR("CONTROL_CENTER_SENSOR_CAMERA");
  else
    v3 = off_1E8CFC370[v2];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E8D00320, CFSTR("ControlCenterUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  LODWORD(v4) = objc_msgSend(v1, "usedRecently");

  v7 = v6;
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_STATUS_RECENTLY"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id CCUIIndicatorColorForSensorType(uint64_t a1)
{
  void *v1;

  if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a1 == 3)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id CCUIIndicatorColorForGameModeState(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  switch((unint64_t)a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

BOOL CCUISectionForSensorType(uint64_t a1)
{
  return a1 == 3;
}

id CCUIPlainCircleImage()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  _imageSymbolConfiguration();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemImageNamed:withConfiguration:", CFSTR("circle.fill"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _imageSymbolConfiguration()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1438]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v0, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CCUIImageForSensorType(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  if (a1 == 1)
  {
    v1 = (void *)MEMORY[0x1E0DC3870];
    _imageSymbolConfiguration();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = CFSTR("mic.fill");
  }
  else if (a1 == 2)
  {
    v1 = (void *)MEMORY[0x1E0DC3870];
    _imageSymbolConfiguration();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = CFSTR("location.fill");
  }
  else
  {
    v1 = (void *)MEMORY[0x1E0DC3870];
    if (a1 == 3)
    {
      _imageSymbolConfiguration();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = CFSTR("gamecontroller.fill");
    }
    else
    {
      _imageSymbolConfiguration();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = CFSTR("video.fill");
    }
  }
  objc_msgSend(v1, "systemImageNamed:withConfiguration:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *CCUIIdentifierForSensorType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("ccui-camera-attribution");
  else
    return off_1E8CFC388[a1 - 1];
}

id CCUISortedAttributionsForEntity(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isGenericLocationSystemServiceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0D147C8], "_genericLocationSystemServiceActivity");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v13, "isSystemService") && objc_msgSend(v13, "sensorType") == 2)
            v11 &= objc_msgSend(v13, "usedRecently");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v9);
    }
    else
    {
      LOBYTE(v11) = 1;
    }

    objc_msgSend(v6, "setUsedRecently:", v11 & 1);
    objc_msgSend(v5, "addObject:", v6);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v4;
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v6);
          v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D147D0], "attributionEntityFromSensorActivityData:", v18, (_QWORD)v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "isEqual:", v19))
            objc_msgSend(v5, "addObject:", v18);

        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v15);
    }
  }

  v20 = objc_alloc(MEMORY[0x1E0CB3928]);
  NSStringFromSelector(sel_website);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithKey:ascending:", v21, 1);

  v23 = objc_alloc(MEMORY[0x1E0CB3928]);
  NSStringFromSelector(sel_sensorType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithKey:ascending:comparator:", v24, 1, &__block_literal_global);

  v36[0] = v22;
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingDescriptors:", v26);

  return v5;
}

void sub_1CFB8BD2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1CFB8CA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFB8CBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initRCPSyntheticEventStream()
{
  Class result;

  if (LoadRecap_loadPredicate != -1)
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  result = objc_getClass("RCPSyntheticEventStream");
  classRCPSyntheticEventStream = (uint64_t)result;
  getRCPSyntheticEventStreamClass = (uint64_t (*)())RCPSyntheticEventStreamFunction;
  return result;
}

id RCPSyntheticEventStreamFunction()
{
  return (id)classRCPSyntheticEventStream;
}

Class initRCPPlayerPlaybackOptions()
{
  Class result;

  if (LoadRecap_loadPredicate != -1)
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  result = objc_getClass("RCPPlayerPlaybackOptions");
  classRCPPlayerPlaybackOptions = (uint64_t)result;
  getRCPPlayerPlaybackOptionsClass = (uint64_t (*)())RCPPlayerPlaybackOptionsFunction;
  return result;
}

id RCPPlayerPlaybackOptionsFunction()
{
  return (id)classRCPPlayerPlaybackOptions;
}

Class initRCPInlinePlayer()
{
  Class result;

  if (LoadRecap_loadPredicate != -1)
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  result = objc_getClass("RCPInlinePlayer");
  classRCPInlinePlayer = (uint64_t)result;
  getRCPInlinePlayerClass = (uint64_t (*)())RCPInlinePlayerFunction;
  return result;
}

id RCPInlinePlayerFunction()
{
  return (id)classRCPInlinePlayer;
}

void sub_1CFB8FF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1CFB91834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CCUIGenericIconImageForSize(double a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CCUIIconImageDescriptorForSize(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareImageForDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3870];
  v8 = objc_msgSend(v6, "CGImage");
  objc_msgSend(v6, "scale");
  objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CCUIIconImageForUntreatedImage(uint64_t a1, double a2, double a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v8 = (void *)objc_msgSend(v6, "initWithCGImage:scale:", a1);

  v9 = objc_alloc(MEMORY[0x1E0D3A820]);
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithImages:", v10);

  _CCUIIconImageDescriptorForSize(a2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v18 = *MEMORY[0x1E0D14698];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14698], OS_LOG_TYPE_ERROR))
      CCUIIconImageForUntreatedImage_cold_1(a1, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1E0DC3870];
  v16 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v14, "scale");
  objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_6:
    CCUIGenericIconImageForSize(a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *CCUIStringFromCAFrameRateRange(float a1, float a2, float a3)
{
  __CFString *v6;

  if (CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)&a1, *MEMORY[0x1E0CD23C0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%f, %f, %f)"), a1, a2, a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("(CAFrameRateRangeDefault)");
  }
  return v6;
}

void sub_1CFB93FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1CFB9450C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFB94714(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFB94880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initRCPPlayerPlaybackOptions_0()
{
  Class result;

  if (LoadRecap_loadPredicate_0 != -1)
    dispatch_once(&LoadRecap_loadPredicate_0, &__block_literal_global_65);
  result = objc_getClass("RCPPlayerPlaybackOptions");
  classRCPPlayerPlaybackOptions_0 = (uint64_t)result;
  getRCPPlayerPlaybackOptionsClass_0 = (uint64_t (*)())RCPPlayerPlaybackOptionsFunction_0;
  return result;
}

id RCPPlayerPlaybackOptionsFunction_0()
{
  return (id)classRCPPlayerPlaybackOptions_0;
}

Class initRCPInlinePlayer_0()
{
  Class result;

  if (LoadRecap_loadPredicate_0 != -1)
    dispatch_once(&LoadRecap_loadPredicate_0, &__block_literal_global_65);
  result = objc_getClass("RCPInlinePlayer");
  classRCPInlinePlayer_0 = (uint64_t)result;
  getRCPInlinePlayerClass_0 = (uint64_t (*)())RCPInlinePlayerFunction_0;
  return result;
}

id RCPInlinePlayerFunction_0()
{
  return (id)classRCPInlinePlayer_0;
}

double _CCUIPortraitStatusBarBaselineToTopOffsetHeight()
{
  if (_CCUIPortraitStatusBarBaselineToTopOffsetHeight_onceToken != -1)
    dispatch_once(&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_onceToken, &__block_literal_global_4);
  return *(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height;
}

double CCUIStatusBarBaselineToBaselineOffsetHeight()
{
  if (CCUIStatusBarBaselineToBaselineOffsetHeight_onceToken != -1)
    dispatch_once(&CCUIStatusBarBaselineToBaselineOffsetHeight_onceToken, &__block_literal_global_1);
  return *(double *)&CCUIStatusBarBaselineToBaselineOffsetHeight_height;
}

double CCUIStatusBarBaselineHeight()
{
  if (CCUIStatusBarBaselineHeight_onceToken != -1)
    dispatch_once(&CCUIStatusBarBaselineHeight_onceToken, &__block_literal_global_3);
  return *(double *)&CCUIStatusBarBaselineHeight_height;
}

double CCUIPortraitGridLayoutTopMargin()
{
  if (CCUIPortraitGridLayoutTopMargin_onceToken != -1)
    dispatch_once(&CCUIPortraitGridLayoutTopMargin_onceToken, &__block_literal_global_4);
  return *(double *)&CCUIPortraitGridLayoutTopMargin_margin;
}

double CCUILandscapeGridLayoutTopMargin()
{
  if (CCUILandscapeGridLayoutTopMargin_onceToken != -1)
    dispatch_once(&CCUILandscapeGridLayoutTopMargin_onceToken, &__block_literal_global_5);
  return *(double *)&CCUILandscapeGridLayoutTopMargin_margin;
}

double CCUILandscapeGridLayoutSideMargin()
{
  if (CCUILandscapeGridLayoutSideMargin_onceToken != -1)
    dispatch_once(&CCUILandscapeGridLayoutSideMargin_onceToken, &__block_literal_global_6);
  return *(double *)&CCUILandscapeGridLayoutSideMargin_margin;
}

void sub_1CFB96CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFB97820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFB97A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFB9A344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *CCUIStringFromModularControlCenterPresentationState(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("<invalid>");
  else
    return off_1E8CFCE00[a1];
}

const __CFString *CCUIStringFromModularControlCenterTransitionState(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E8CFCDE8[a1];
}

void sub_1CFB9D8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1CFB9EF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1CFB9F330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CFBA2058(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CFBA2174(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CFBA22C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFBA25C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1CFBA272C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CFBA3DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFBA584C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL CCUILayoutPointsEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL CCUILayoutRectEqual(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
    return 0;
  return a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t CCUIMakeLayoutSizeFromDictionary(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("width"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  if (v5)
    a2 = v5;
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unsignedIntegerValue");
  return a2;
}

__CFString *NSStringFromCCUIOverlayTransitionType(unint64_t a1)
{
  if (a1 < 3)
    return off_1E8CFD160[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sendExpandModuleTransitionNotificationForSubviews(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "contentModuleWillTransitionToExpandedContentMode:", a2);
        else
          sendExpandModuleTransitionNotificationForSubviews(v8, a2);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t CCUIStatusBarIsSpeakeasy()
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

id CCUIStatusBarForStatusBar(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (CCUIStatusBarIsSpeakeasy())
  {
    objc_msgSend(v1, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t sub_1CFBB52C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1CFBB5304(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CFBB5324(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF18);
}

void type metadata accessor for SBIconViewConfigurationOptions(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF20);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF28);
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1CFBB5DF4(a1, (unint64_t *)&unk_1EFBEFF30);
}

void type metadata accessor for SBHIconGridSizeClass(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1ED90AE18);
}

void type metadata accessor for CCUIGridSizeClassMask(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF40);
}

void type metadata accessor for CCUIGameModeState(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF48);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF50);
}

void type metadata accessor for SBIconDragPreviewState(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF58);
}

void type metadata accessor for SBIconImageInfo(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF60);
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1CFBB5430(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CFBB5450(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

void type metadata accessor for SBHIconGridSize(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF68);
}

uint64_t sub_1CFBB548C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CFBB54AC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for SBIconCoordinate(uint64_t a1)
{
  sub_1CFBB5DF4(a1, &qword_1EFBEFF70);
}

double sub_1CFBB54E8()
{
  void *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v3 = 0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2);
  return *(double *)v5;
}

uint64_t sub_1CFBB5564(uint64_t a1, uint64_t a2)
{
  return sub_1CFBB5868(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

BOOL sub_1CFBB557C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1CFBB5590(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1CFBFA87C();
  *a2 = 0;
  return result;
}

uint64_t sub_1CFBB5604(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1CFBFA888();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1CFBB5680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1CFBFA894();
  v2 = sub_1CFBFA870();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_1CFBB56CC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1CFBB56D4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1CFBB56E8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_1CFBB56FC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1CFBB5728@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1CFBB574C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1CFBB5760@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1CFBB5774(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1CFBB5788(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1CFBB579C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1CFBB57B0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1CFBB57C0()
{
  return sub_1CFBFABF4();
}

_QWORD *sub_1CFBB57D8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1CFBB57F0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_1CFBB5804(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1CFBB5834(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1CFBB5848(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_1CFBB585C(uint64_t a1, uint64_t a2)
{
  return sub_1CFBB5868(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1CFBB5868(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1CFBFA894();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1CFBB58A4()
{
  sub_1CFBFA894();
  sub_1CFBFA8AC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFBB58E4()
{
  uint64_t v0;

  sub_1CFBFA894();
  sub_1CFBFADF8();
  sub_1CFBFA8AC();
  v0 = sub_1CFBFAE10();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *sub_1CFBB5954@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1CFBB5964(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1CFBB5970@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1CFBB5D28(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_1CFBB59AC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1CFBB59B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1CFBFA894();
  v2 = v1;
  if (v0 == sub_1CFBFA894() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1CFBFAD8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1CFBB5A40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CFBFA870();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1CFBB5A84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1CFBFA894();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1CFBB5AAC()
{
  sub_1CFBB5C0C((unint64_t *)&unk_1ED90AD90, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC01A88);
  sub_1CFBB5C0C((unint64_t *)&unk_1EFBF00A0, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC019DC);
  return sub_1CFBFAD68();
}

uint64_t sub_1CFBB5B30()
{
  sub_1CFBB5C0C((unint64_t *)&qword_1ED90AE00, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC0170C);
  sub_1CFBB5C0C(&qword_1EFBEFFB8, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC016AC);
  return sub_1CFBFAD68();
}

uint64_t sub_1CFBB5BB4()
{
  return sub_1CFBB5C0C(&qword_1EFBEFF78, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC01670);
}

uint64_t sub_1CFBB5BE0()
{
  return sub_1CFBB5C0C((unint64_t *)&unk_1EFBEFF80, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC01644);
}

uint64_t sub_1CFBB5C0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D17DBC58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CFBB5C4C()
{
  return sub_1CFBB5C0C((unint64_t *)&unk_1ED90AE08, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC016E0);
}

uint64_t sub_1CFBB5C78()
{
  return sub_1CFBB5C0C(&qword_1EFBEFF90, (uint64_t (*)(uint64_t))type metadata accessor for SBIconViewConfigurationOptions, (uint64_t)&unk_1CFC017D0);
}

uint64_t sub_1CFBB5CA4()
{
  return sub_1CFBB5C0C(&qword_1EFBEFF98, (uint64_t (*)(uint64_t))type metadata accessor for SBIconViewConfigurationOptions, (uint64_t)&unk_1CFC0179C);
}

uint64_t sub_1CFBB5CD0()
{
  return sub_1CFBB5C0C(&qword_1EFBEFFA0, (uint64_t (*)(uint64_t))type metadata accessor for SBIconViewConfigurationOptions, (uint64_t)&unk_1CFC017FC);
}

uint64_t sub_1CFBB5CFC()
{
  return sub_1CFBB5C0C((unint64_t *)&unk_1EFBEFFA8, (uint64_t (*)(uint64_t))type metadata accessor for SBIconViewConfigurationOptions, (uint64_t)&unk_1CFC01838);
}

uint64_t sub_1CFBB5D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1CFBB5D74(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CFBB5D94(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_1CFBB5DF4(a1, (unint64_t *)&unk_1EFBF0080);
}

void type metadata accessor for SBIconLocation(uint64_t a1)
{
  sub_1CFBB5DF4(a1, (unint64_t *)&unk_1ED90ADA8);
}

void sub_1CFBB5DF4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1CFBB5E38()
{
  return sub_1CFBB5C0C(&qword_1EFBF0090, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC019A0);
}

uint64_t sub_1CFBB5E64()
{
  return sub_1CFBB5C0C(&qword_1EFBF0098, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC01974);
}

uint64_t sub_1CFBB5E90()
{
  return sub_1CFBB5C0C(&qword_1ED90ADA0, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC01A10);
}

id sub_1CFBB5EFC(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v20 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  v11(v9, 1, 1, v10);
  v12 = objc_msgSend(a1, sel_containerBundleIdentifier);
  if (v12)
  {
    v13 = v12;
    sub_1CFBFA894();

    sub_1CFBFA744();
    sub_1CFBB61E4((uint64_t)v9);
    v11(v6, 0, 1, v10);
    sub_1CFBB6224((uint64_t)v6, (uint64_t)v9);
  }
  sub_1CFBFAA80();
  v14 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  sub_1CFBFA894();

  sub_1CFBFA744();
  sub_1CFBB619C((uint64_t)v9, (uint64_t)v6);
  v15 = (void *)sub_1CFBFAA74();
  v16 = objc_msgSend(a1, sel_kind);
  if (!v16)
  {
    sub_1CFBFA894();
    v16 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v18 = objc_msgSend(v17, sel_initWithExtensionIdentity_kind_intent_, v15, v16, v21);

  sub_1CFBB61E4((uint64_t)v9);
  return v18;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17DBC40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1CFBB619C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CFBB61E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFBB6224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1CFBB626C(void *a1, void *a2, void *a3)
{
  void *v3;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  v16.receiver = v3;
  v16.super_class = (Class)type metadata accessor for ModuleInstanceObserver();
  v7 = objc_msgSendSuper2(&v16, sel_init);
  v8 = v7;
  if (a3)
  {
    if (a2)
    {
      v9 = v7;
      v10 = a3;
      v11 = a2;
      v12 = objc_msgSend(v10, sel_orderedEnabledModuleIdentifiersFromSettingsApp);
      v13 = sub_1CFBFA900();

      objc_msgSend(v10, sel_addObserver_, v9);
      objc_msgSend(v11, sel_addObserver_, v9);
      sub_1CFBB6674(v13);
      swift_bridgeObjectRelease();
      v14 = (void *)sub_1CFBFA978();
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setEnabledModuleIdentifiersFromSettingsApp_, v14);

      a1 = v10;
      a2 = v10;
    }
    else
    {
      a2 = a1;
      a1 = a3;
    }
  }

  return v8;
}

id sub_1CFBB6458()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModuleInstanceObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ModuleInstanceObserver()
{
  return objc_opt_self();
}

uint64_t sub_1CFBB6674(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1CFBFA990();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1CFBBD5F8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1CFBB6708()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1ED90AFC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90AFC0);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1ED90AFE0, (uint64_t)qword_1ED90AFC0, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1CFBB67B8()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1ED90ACC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90ACC0);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlHost.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1ED90ACD8, (uint64_t)qword_1ED90ACC0, a1);
}

uint64_t sub_1CFBB6854()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1ED90ACE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90ACE0);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlsDataPersistence.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1ED90AD00, (uint64_t)qword_1ED90ACE0, a1);
}

uint64_t sub_1CFBB68EC()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1EFBF0550);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF0550);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlsGallery.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1EFBEFE18, (uint64_t)qword_1EFBF0550, a1);
}

uint64_t sub_1CFBB698C()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1EFBF0568);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF0568);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.editing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1EFBEFE20, (uint64_t)qword_1EFBF0568, a1);
}

uint64_t sub_1CFBB6A20()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1EFBF0580);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF0580);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.systemControls.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1EFBEFE28, (uint64_t)qword_1EFBF0580, a1);
}

uint64_t sub_1CFBB6AC0()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1EFBF0598);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF0598);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.xcodeSupport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFBB6B5C(&qword_1EFBEFE30, (uint64_t)qword_1EFBF0598, a1);
}

uint64_t sub_1CFBB6B5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1CFBFA7A4();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

char *sub_1CFBB6C04(void *a1)
{
  _BYTE *v1;
  _QWORD *v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  void *v14;
  char *v15;
  id v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  uint64_t v22;
  unsigned __int8 v23;
  objc_super v25;

  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox] = 1;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale] = 0x3FF0000000000000;
  v3 = &v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler];
  *v3 = 0;
  v3[1] = 0;
  v4 = &v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconImageInfo];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowAdornments] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isDelayingCleanup] = 0;
  objc_msgSend(a1, sel_iconImageInfo);
  BSRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v25.receiver = v1;
  v25.super_class = (Class)type metadata accessor for ControlIconDragPreview();
  v13 = (char *)objc_msgSendSuper2(&v25, sel_initWithFrame_, v6, v8, v10, v12);
  v14 = *(void **)&v13[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView];
  *(_QWORD *)&v13[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView] = a1;
  v15 = v13;
  v16 = a1;

  v17 = objc_msgSend(v16, sel_isEditing);
  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing] = v17;
  v18 = objc_msgSend(v16, sel_allowsLabelArea);
  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea] = v18;
  v19 = objc_msgSend(v16, sel_allowsAccessoryView);
  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory] = v19;
  v20 = objc_msgSend(v16, sel_allowsCloseBox);
  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox] = v20;
  v21 = objc_msgSend(v16, sel_allowsResizeHandle);
  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle] = v21;
  objc_msgSend(v16, sel_iconContentScale);
  *(_QWORD *)&v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale] = v22;
  v23 = objc_msgSend(v16, sel_allowsAdornmentsOverIconImage);

  v15[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowAdornments] = v23;
  return v15;
}

id sub_1CFBB6F54(uint64_t a1, uint64_t a2, char a3, _QWORD *a4, SEL *a5)
{
  *(_BYTE *)(a1 + *a4) = a3;
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), *a5);
}

uint64_t sub_1CFBB7040(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

unint64_t sub_1CFBB7144(unint64_t result)
{
  char *v1;
  uint64_t v2;
  void (*v3)();
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  void *v15;
  _QWORD v16[6];

  v2 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState] != result)
  {
    *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState] = result;
    if (result < 2 || *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView])
    {
      v3 = 0;
    }
    else
    {
      v10 = objc_opt_self();
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = v1;
      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = sub_1CFBB856C;
      *(_QWORD *)(v12 + 24) = v11;
      v16[4] = sub_1CFBB8584;
      v16[5] = v12;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 1107296256;
      v16[2] = sub_1CFBE86CC;
      v16[3] = &block_descriptor;
      v13 = _Block_copy(v16);
      v14 = v1;
      swift_retain();
      swift_release();
      objc_msgSend((id)v10, sel_performWithoutAnimation_, v13);
      _Block_release(v13);
      LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
      result = swift_release();
      if ((v10 & 1) != 0)
      {
        __break(1u);
        return result;
      }
      v15 = *(void **)&v14[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView];
      *(_QWORD *)&v14[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView] = 0;

      result = *(_QWORD *)&v1[v2];
      v3 = sub_1CFBB856C;
    }
    if (result - 3 >= 2)
    {
      if (result != 2)
        goto LABEL_14;
      v8 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView;
      v9 = *(void **)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
      if (!v9)
        goto LABEL_14;
      objc_msgSend(v9, sel_setAllowsAdornmentsOverIconImage_animated_, 0, 1);
      v7 = *(void **)&v1[v8];
      if (!v7)
        goto LABEL_14;
      v6 = 0;
    }
    else
    {
      v4 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView;
      v5 = *(void **)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
      if (!v5)
        goto LABEL_14;
      v6 = 1;
      objc_msgSend(v5, sel_setAllowsAdornmentsOverIconImage_animated_, 1, 1);
      v7 = *(void **)&v1[v4];
      if (!v7)
        goto LABEL_14;
    }
    objc_msgSend(v7, sel_setEditing_animated_, v6, 1);
LABEL_14:
    objc_msgSend(v1, sel_setNeedsLayout);
    objc_msgSend(v1, sel_layoutIfNeeded);
    return sub_1CFBB8538((uint64_t)v3);
  }
  return result;
}

void sub_1CFBB7390(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView);
  if (v1)
  {
    v2 = v1;
    sub_1CFBB7944(v2);

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBB7440(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController) = a1;
  v5 = a1;

  v6 = *(void **)(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView);
  if (v6)
  {
    v9 = v6;
    if (a1)
    {
      v7 = objc_msgSend(v5, sel_parentViewController);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, sel_bs_removeChildViewController_, v5);

      }
    }
    objc_msgSend(v9, sel_setOverrideCustomIconImageViewController_, *(_QWORD *)(v1 + v3));

  }
}

id sub_1CFBB75FC()
{
  uint64_t v0;
  uint64_t v1;
  id result;

  v1 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView;
  result = *(id *)(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView);
  if (result)
  {
    objc_msgSend(result, sel_setIcon_, 0);
    result = *(id *)(v0 + v1);
    if (result)
      return objc_msgSend(result, sel_setDelegate_, 0);
  }
  return result;
}

void sub_1CFBB7754()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  CGFloat v5;
  CGAffineTransform v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ControlIconDragPreview();
  objc_msgSendSuper2(&v7, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
  if (v1)
  {
    if ((v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconImageInfo + 32] & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v2 = v1;
      BSRectWithSize();
      objc_msgSend(v2, sel_setBounds_);
      v3 = v2;
      objc_msgSend(v0, sel_bounds);
      UIRectGetCenter();
      objc_msgSend(v3, sel_setCenter_);

      v4 = *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState];
      v5 = 1.0;
      if (v4 <= 4)
        v5 = dbl_1CFC01B60[v4];
      if (BSFloatIsOne())
      {
        *(_OWORD *)&v6.a = 0x3FF0000000000000uLL;
        v6.c = 0.0;
        v6.d = 1.0;
        *(_OWORD *)&v6.tx = 0uLL;
        objc_msgSend(v3, sel_setTransform_, &v6);
      }
      else
      {
        CGAffineTransformMakeScale(&v6, v5, v5);
        objc_msgSend(v3, sel_setTransform_, &v6);
      }

    }
  }
}

id sub_1CFBB78CC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1CFBB7944(void *a1)
{
  char *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromObject()), sel_initWithConfigurationOptions_, 4);
  v4 = *(void **)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController];
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, sel_parentViewController);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_bs_removeChildViewController_, v5);

    }
    objc_msgSend(v3, sel_setOverrideCustomIconImageViewController_, v5);

  }
  objc_msgSend(a1, sel_configureMatchingIconView_, v3);
  objc_msgSend(v3, sel_setSuppressesDefaultEditingAnimation_, 1);
  objc_msgSend(a1, sel_iconImageInfo);
  v8 = &v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconImageInfo];
  *(_QWORD *)v8 = v9;
  *((_QWORD *)v8 + 1) = v10;
  *((_QWORD *)v8 + 2) = v11;
  *((_QWORD *)v8 + 3) = v12;
  v8[32] = 0;
  objc_msgSend(v3, sel_setIconImageInfo_);
  objc_msgSend(v3, sel_setEditing_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing]);
  objc_msgSend(v3, sel_setAllowsLabelArea_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea]);
  objc_msgSend(v3, sel_setAllowsAccessoryView_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory]);
  objc_msgSend(v3, sel_setAllowsCloseBox_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox]);
  objc_msgSend(v3, sel_setAllowsResizeHandle_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle]);
  objc_msgSend(v3, sel_setAllowsAdornmentsOverIconImage_, v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowAdornments]);
  objc_msgSend(v3, sel_setIconContentScale_, *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale]);
  v13 = objc_msgSend(a1, sel_accessibilityTintColor);
  objc_msgSend(v3, sel_setAccessibilityTintColor_, v13);

  v14 = v3;
  BSRectWithSize();
  objc_msgSend(v14, sel_setFrame_);

  v15 = MEMORY[0x1D17DBD84](&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconViewDelegate]);
  if (v15)
  {
    objc_msgSend(v14, sel_setDelegate_, v15);
    swift_unknownObjectRelease();
  }
  v16 = *(void **)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView] = v14;
  v17 = v14;

  objc_msgSend(v1, sel_addSubview_, v17);
  objc_msgSend(v1, sel_setNeedsLayout);
  objc_msgSend(v1, sel_layoutIfNeeded);

}

void sub_1CFBB7C0C(uint64_t a1)
{
  uint64_t v1;
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  void (*v9)(uint64_t);

  v3 = sub_1CFBB78CC();
  v4 = objc_msgSend(v3, sel_containsObject_, a1);

  if (v4)
  {
    v5 = sub_1CFBB78CC();
    objc_msgSend(v5, sel_removeObject_, a1);

    v6 = sub_1CFBB78CC();
    v7 = objc_msgSend(v6, sel_count);

    if (!v7 && *(_BYTE *)(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isDelayingCleanup) == 1)
    {
      v8 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
      v9 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
      if (v9)
      {
        *v8 = 0;
        v8[1] = 0;
        swift_retain();
        sub_1CFBB8538((uint64_t)v9);
        v9(v1);
        sub_1CFBB8538((uint64_t)v9);
      }
    }
  }
}

id sub_1CFBB7D24()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlIconDragPreview();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlIconDragPreview()
{
  return objc_opt_self();
}

id sub_1CFBB7DF0()
{
  _BYTE *v0;
  objc_super v2;

  if ((v0[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated] & 1) == 0)
  {
    v0[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated] = 1;
    sub_1CFBB7C0C((uint64_t)v0);
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion()
{
  return objc_opt_self();
}

void sub_1CFBB8270()
{
  _BYTE *v0;
  _QWORD *v1;
  char *v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox] = 1;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale] = 0x3FF0000000000000;
  v1 = &v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler];
  *v1 = 0;
  v1[1] = 0;
  v2 = &v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconImageInfo];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowAdornments] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isDelayingCleanup] = 0;

  sub_1CFBFAD14();
  __break(1u);
}

void sub_1CFBB83B8()
{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  void (*v4)(uint64_t);

  v1 = sub_1CFBB78CC();
  v2 = objc_msgSend(v1, sel_count);

  if (v2)
  {
    *(_BYTE *)(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isDelayingCleanup) = 1;
  }
  else
  {
    v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
    v4 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
    if (v4)
    {
      *v3 = 0;
      v3[1] = 0;
      swift_retain();
      sub_1CFBB8538((uint64_t)v4);
      v4(v0);
      sub_1CFBB8538((uint64_t)v4);
    }
  }
}

void sub_1CFBB845C()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D01748]), sel_initWithObject_, v0);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)sub_1CFBFA870();
    v4 = (void *)sub_1CFBFA870();
    objc_msgSend(v2, sel_appendString_withName_, v3, v4);

    v5 = objc_msgSend(v2, sel_build);
    if (v5)
    {
      sub_1CFBFA894();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1CFBB8538(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1CFBB8548()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CFBB856C()
{
  uint64_t v0;

  sub_1CFBB7390(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CFBB8574()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBB8584()
{
  uint64_t v0;

  return sub_1CFBE86AC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1CFBB85A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CFBB85C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1CFBB85D8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1CFBB87D4(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, _QWORD *a7)
{
  double *v7;

  v7 = (double *)(result + *a7);
  *v7 = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  return result;
}

id sub_1CFBB8858()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ColorViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ColorViewController()
{
  return objc_opt_self();
}

void sub_1CFBB88B8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder) = a1;
  v8 = a1;
  if (!v4)
  {
    if (!a1)
    {
LABEL_7:
      v5 = v4;
      goto LABEL_8;
    }
LABEL_6:
    sub_1CFBB8C90(v4);
    goto LABEL_7;
  }
  if (!a1)
    goto LABEL_6;
  sub_1CFBBAA24(0, &qword_1EFBF0900);
  v5 = v4;
  v6 = v8;
  v7 = sub_1CFBFAB10();

  if ((v7 & 1) == 0)
    goto LABEL_6;
LABEL_8:

}

uint64_t sub_1CFBB8C90(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(void *);
  void *v9;
  char *v10;
  uint64_t result;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(void *);
  void *v17;
  char *v18;
  uint64_t aBlock;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  v3 = &v1[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypesByListIdentifier];
  swift_beginAccess();
  *(_QWORD *)v3 = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  v4 = MEMORY[0x1E0C809B0];
  if (!a1)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v5 = a1;
  objc_msgSend(v5, sel_removeFolderObserver_, v1);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v1;
  v7 = swift_allocObject();
  v8 = sub_1CFBBAA04;
  *(_QWORD *)(v7 + 16) = sub_1CFBBAA04;
  *(_QWORD *)(v7 + 24) = v6;
  v23 = sub_1CFBBAC70;
  v24 = v7;
  aBlock = v4;
  v20 = 1107296256;
  v21 = sub_1CFBB8F6C;
  v22 = &block_descriptor_33;
  v9 = _Block_copy(&aBlock);
  v10 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, (SEL)0x1F2D20848, 4, v9);

  _Block_release(v9);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v5 & 1) == 0)
  {
LABEL_5:
    v12 = *(void **)&v1[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder];
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v13, sel_addFolderObserver_, v1);
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = v1;
      v15 = swift_allocObject();
      v16 = sub_1CFBBA9E4;
      *(_QWORD *)(v15 + 16) = sub_1CFBBA9E4;
      *(_QWORD *)(v15 + 24) = v14;
      v23 = sub_1CFBBAC70;
      v24 = v15;
      aBlock = v4;
      v20 = 1107296256;
      v21 = sub_1CFBB8F6C;
      v22 = &block_descriptor_23;
      v17 = _Block_copy(&aBlock);
      v18 = v1;
      swift_retain();
      swift_release();
      objc_msgSend(v13, (SEL)0x1F2D20848, 4, v17);

      _Block_release(v17);
      LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v13 & 1) == 0)
      {
LABEL_9:
        sub_1CFBB936C();
        sub_1CFBB8538((uint64_t)v8);
        return sub_1CFBB8538((uint64_t)v16);
      }
      __break(1u);
    }
    v16 = 0;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

void sub_1CFBB8F6C(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_1CFBB8FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;

  v0 = sub_1CFBFA7A4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFBFA780();
  v4 = sub_1CFBFA78C();
  v5 = sub_1CFBFA9CC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CFB7D000, v4, v5, "Page indicator content did invalidate for folder", v6, 2u);
    MEMORY[0x1D17DBCE8](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_1CFBB936C();
}

uint64_t sub_1CFBB90B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint8_t *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  void *v28;
  id v29;

  v2 = v1;
  v4 = sub_1CFBFA7A4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v27 - v9;
  v11 = *(void **)(v2 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder);
  if (v11)
  {
    v12 = v11;
    sub_1CFBFA780();
    v13 = v12;
    v14 = a1;
    v15 = sub_1CFBFA78C();
    v16 = sub_1CFBFA9CC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v28 = a1;
      v18 = v17;
      v27[1] = v2;
      *(_DWORD *)v17 = 134217984;
      v29 = -[NSObject indexOfList:](v13, sel_indexOfList_, v14);
      sub_1CFBFABD0();

      _os_log_impl(&dword_1CFB7D000, v15, v16, "Page indicator content did invalidate for list at index: %lu", v18, 0xCu);
      v19 = v18;
      a1 = v28;
      MEMORY[0x1D17DBCE8](v19, -1, -1);

    }
    else
    {

      v15 = v13;
    }
  }
  else
  {
    sub_1CFBFA780();
    v15 = sub_1CFBFA78C();
    v20 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v15, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1CFB7D000, v15, v20, "Page indicator content did invalidate for list despite not tracking a folder", v21, 2u);
      MEMORY[0x1D17DBCE8](v21, -1, -1);
    }
    v10 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  v22 = objc_msgSend(a1, sel_uniqueIdentifier);
  v23 = sub_1CFBFA894();
  v25 = v24;

  swift_beginAccess();
  sub_1CFBC7DDC(v23, v25);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return sub_1CFBB936C();
}

uint64_t sub_1CFBB936C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t (*v10)(void *, uint64_t, uint64_t);
  char *v11;
  uint64_t result;
  char v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t aBlock[6];
  uint64_t v31;

  v1 = sub_1CFBFA7A4();
  v28 = *(_QWORD *)(v1 - 8);
  v29 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (uint64_t *)&v0[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypes];
  swift_beginAccess();
  v5 = *v4;
  *v4 = MEMORY[0x1E0DEE9D8];
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))&v0[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder];
  if (v6)
  {
    LOBYTE(v31) = 0;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v0;
    *(_QWORD *)(v7 + 24) = &v31;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_1CFBBA988;
    *(_QWORD *)(v8 + 24) = v7;
    aBlock[4] = (uint64_t)sub_1CFBBA9A0;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1CFBB8F6C;
    aBlock[3] = (uint64_t)&block_descriptor_13;
    v9 = _Block_copy(aBlock);
    v10 = v6;
    v11 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_enumerateListsWithOptions_usingBlock_, 6, v9);

    _Block_release(v9);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((v9 & 1) != 0)
    {
      __break(1u);
      return result;
    }
    v6 = sub_1CFBBA988;
  }
  v13 = sub_1CFBBA310(*v4, v5);
  swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
  {
    sub_1CFBFA780();
    v14 = v0;
    v15 = sub_1CFBFA78C();
    v16 = sub_1CFBFA9C0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v27 = v6;
      v18 = (uint8_t *)v17;
      v26 = swift_slowAlloc();
      aBlock[0] = v26;
      *(_DWORD *)v18 = 136315138;
      v25[1] = v18 + 4;
      v19 = swift_bridgeObjectRetain();
      v20 = MEMORY[0x1D17DABC0](v19, &type metadata for PageIndicatorType);
      v22 = v21;
      swift_bridgeObjectRelease();
      v31 = sub_1CFBC779C(v20, v22, aBlock);
      sub_1CFBFABD0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CFB7D000, v15, v16, "Page indicator types: %s", v18, 0xCu);
      v23 = v26;
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v23, -1, -1);
      v24 = v18;
      v6 = v27;
      MEMORY[0x1D17DBCE8](v24, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v3, v29);
    if (MEMORY[0x1D17DBD84](&v14[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_delegate]))
    {
      sub_1CFBE9C24();
      swift_unknownObjectRelease();
    }
  }
  return sub_1CFBB8538((uint64_t)v6);
}

uint64_t sub_1CFBB96EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  char v7;
  char **v8;
  char *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;

  v7 = sub_1CFBB97F4(a1);
  if (v7 == 5)
  {
    if ((*a5 & 1) != 0)
    {
      v7 = 5;
    }
    else
    {
      *a5 = 1;
      v7 = 4;
    }
  }
  v8 = (char **)(a4 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypes);
  swift_beginAccess();
  v9 = *v8;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v8 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_1CFBEBBEC(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *v8 = v9;
  }
  v12 = *((_QWORD *)v9 + 2);
  v11 = *((_QWORD *)v9 + 3);
  if (v12 >= v11 >> 1)
  {
    v9 = sub_1CFBEBBEC((char *)(v11 > 1), v12 + 1, 1, v9);
    *v8 = v9;
  }
  *((_QWORD *)v9 + 2) = v12 + 1;
  v9[v12 + 32] = v7;
  return swift_endAccess();
}

uint64_t sub_1CFBB97F4(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  v3 = objc_msgSend(a1, sel_uniqueIdentifier);
  v4 = sub_1CFBFA894();
  v6 = v5;

  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypesByListIdentifier);
  swift_beginAccess();
  v8 = *v7;
  if (!*(_QWORD *)(*v7 + 16))
  {
LABEL_5:
    v12 = sub_1CFBB9B80(a1, (uint64_t)sub_1CFBB99C4, 0);
    if (!*(_QWORD *)(v12 + 16))
    {
      swift_bridgeObjectRelease();
      v11 = 6;
      goto LABEL_11;
    }
    v11 = sub_1CFBB9D40(v12);
    v14 = v13;
    v16 = v15;
    v17 = ~v15;
    swift_bridgeObjectRelease();
    if (v17)
    {
      if ((v16 & 1) == 0)
      {
LABEL_11:
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v20 = *v7;
        *v7 = 0x8000000000000000;
        sub_1CFBCAB60(v11, v4, v6, isUniquelyReferenced_nonNull_native);
        *v7 = v20;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        return v11;
      }
      sub_1CFBBA3A0(v11, v14, v16);
    }
    v11 = 5;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_1CFBBEE14(v4, v6);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v8 + 56) + v9);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v11;
}

void sub_1CFBB99C4(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v10 = -2;
    goto LABEL_14;
  }
  v5 = (void *)v4;
  v6 = a1;
  if (!objc_msgSend(v5, sel_activeDataSource))
    goto LABEL_13;
  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();
  if (!v7)
  {
    objc_opt_self();
    v11 = swift_dynamicCastObjCClass();
    if (v11)
    {
      v12 = (void *)v11;
      swift_unknownObjectRetain();
      v9 = objc_msgSend(v12, sel_containerBundleIdentifier);
      if (!v9)
        v9 = objc_msgSend(v12, sel_extensionBundleIdentifier);
      goto LABEL_9;
    }
    swift_unknownObjectRelease();
LABEL_13:

    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v10 = -1;
    goto LABEL_14;
  }
  v8 = (void *)v7;
  swift_unknownObjectRetain();
  v9 = objc_msgSend(v8, sel_moduleIdentifier);
LABEL_9:
  v13 = sub_1CFBFA894();
  v15 = v14;

  swift_bridgeObjectRetain();
  v16 = sub_1CFBF0ADC(v13, v15);
  swift_unknownObjectRelease_n();

  if (v16 != 4)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v16;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) = 0;
    return;
  }
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v15;
  v10 = 1;
LABEL_14:
  *(_BYTE *)(a2 + 16) = v10;
}

uint64_t sub_1CFBB9B80(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  _QWORD aBlock[6];
  int v15;
  unint64_t v16;

  v5 = a1;
  v6 = objc_msgSend(a1, sel_iconGridSizeClassSizes);
  v16 = sub_1CFBBAD90(MEMORY[0x1E0DEE9D8]);
  v15 = 0;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = v6;
  v7[5] = &v16;
  v7[6] = &v15;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1CFBBA404;
  *(_QWORD *)(v8 + 24) = v7;
  aBlock[4] = sub_1CFBBA424;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFBB8F6C;
  aBlock[3] = &block_descriptor_0;
  v9 = _Block_copy(aBlock);
  swift_retain();
  v10 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_enumerateIconsUsingBlock_, v9);
  _Block_release(v9);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v5 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v15)
      v12 = sub_1CFBBA444(v16, &v15);
    else
      v12 = sub_1CFBBAECC(MEMORY[0x1E0DEE9D8]);
    v13 = v12;

    swift_release();
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_1CFBB9D40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v11 >= v6)
      goto LABEL_24;
    v12 = *(_QWORD *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v6)
        goto LABEL_24;
      v12 = *(_QWORD *)(v2 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v6)
          goto LABEL_24;
        v12 = *(_QWORD *)(v2 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v6)
            goto LABEL_24;
          v12 = *(_QWORD *)(v2 + 8 * v8);
          if (!v12)
          {
            v13 = v11 + 4;
            if (v13 >= v6)
            {
LABEL_24:
              v15 = 0;
              goto LABEL_25;
            }
            v12 = *(_QWORD *)(v2 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                v8 = v13 + 1;
                if (__OFADD__(v13, 1))
                  goto LABEL_27;
                if (v8 >= v6)
                  goto LABEL_24;
                v12 = *(_QWORD *)(v2 + 8 * v8);
                ++v13;
                if (v12)
                  goto LABEL_22;
              }
            }
            v8 = v13;
          }
        }
      }
    }
LABEL_22:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_5:
    if (*(double *)(*(_QWORD *)(a1 + 56) + 8 * v10) > 0.5)
    {
      v14 = *(_QWORD *)(a1 + 48) + 24 * v10;
      v15 = *(_QWORD *)v14;
      sub_1CFBBA3C8(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_BYTE *)(v14 + 16));
LABEL_25:
      swift_release();
      return v15;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_1CFBB9F0C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FolderPageIndicatorProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FolderPageIndicatorProvider()
{
  return objc_opt_self();
}

uint64_t sub_1CFBB9FB4()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 16);
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  if ((v1 & 1) != 0)
    sub_1CFBFA8AC();
  else
    sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBBA034()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    sub_1CFBFAE04();
    return sub_1CFBFA8AC();
  }
  else
  {
    sub_1CFBFAE04();
    return sub_1CFBFAE04();
  }
}

uint64_t sub_1CFBBA0A4()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 16);
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  if ((v1 & 1) != 0)
    sub_1CFBFA8AC();
  else
    sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBBA120(uint64_t a1, uint64_t a2)
{
  return sub_1CFBBA8D0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

unint64_t sub_1CFBBA13C(void *a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, void *), uint64_t a5, void *a6, uint64_t *a7, _DWORD *a8)
{
  unint64_t result;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  int v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;

  result = (unint64_t)objc_msgSend(a1, sel_isPlaceholder);
  if ((result & 1) == 0)
  {
    result = (unint64_t)a4(&v26, a1);
    v14 = v28;
    if (v28 != 254)
    {
      v15 = v26;
      v16 = v27;
      sub_1CFBBA920(v26, v27, v28);
      v17 = objc_msgSend(a1, sel_gridSizeClass);
      v18 = objc_msgSend(a6, sel_gridSizeAreaForGridSizeClass_, v17);
      if (v14 == 255)
      {

      }
      else
      {
        v19 = *a7;
        v20 = *(_QWORD *)(*a7 + 16);
        result = sub_1CFBBA3C8(v15, v16, v14 & 1);
        if (v20 && (result = sub_1CFBBEE78(v15, v16, v14 & 1), (v21 & 1) != 0))
          v22 = *(_DWORD *)(*(_QWORD *)(v19 + 56) + 4 * result);
        else
          v22 = 0;
        v23 = v22 + v18;
        if (__CFADD__(v22, v18))
          goto LABEL_15;
        sub_1CFBBA3C8(v15, v16, v14 & 1);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v25 = *a7;
        *a7 = 0x8000000000000000;
        sub_1CFBCAA1C(v23, v15, v16, v14 & 1, isUniquelyReferenced_nonNull_native);
        *a7 = v25;
        swift_bridgeObjectRelease();
        sub_1CFBBA938(v15, v16, v14);

        sub_1CFBBA938(v15, v16, v14);
        sub_1CFBBA938(v15, v16, v14);
      }
      result = sub_1CFBBA938(v15, v16, v14);
      if (!__CFADD__(*a8, v18))
      {
        *a8 += v18;
        return result;
      }
      __break(1u);
LABEL_15:
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1CFBBA310(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (unsigned __int8 *)(a1 + 32);
    v4 = (unsigned __int8 *)(a2 + 32);
    do
    {
      v6 = *v3++;
      v5 = v6;
      v8 = *v4++;
      v7 = v8;
      switch(v5)
      {
        case 6:
          if (v7 != 6)
            return 0;
          break;
        case 5:
          if (v7 != 5)
            return 0;
          break;
        case 4:
          if (v7 != 4)
            return 0;
          break;
        default:
          if ((v7 - 7) > 0xFFFFFFFC || v5 != v7)
            return 0;
          break;
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_1CFBBA3A0(uint64_t result, uint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_1CFBBA3B8(result, a2, a3 & 1);
  return result;
}

uint64_t sub_1CFBBA3B8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1CFBBA3C8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1CFBBA3D8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

unint64_t sub_1CFBBA404(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1CFBBA13C(a1, a2, a3, *(_QWORD *(**)(uint64_t *__return_ptr, void *))(v3 + 16), *(_QWORD *)(v3 + 24), *(void **)(v3 + 32), *(uint64_t **)(v3 + 40), *(_DWORD **)(v3 + 48));
}

uint64_t sub_1CFBBA414()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBBA424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1CFBF36FC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1CFBBA444(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEB0);
  result = sub_1CFBFAD38();
  v7 = (_QWORD *)result;
  v8 = 0;
  v9 = a1 + 64;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a1 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  v14 = result + 64;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v18)) + (v8 << 6))
  {
    v20 = *(_QWORD *)(a1 + 48) + 24 * i;
    result = *(_QWORD *)v20;
    v21 = *(_QWORD *)(v20 + 8);
    v22 = *(_BYTE *)(v20 + 16);
    LODWORD(v5) = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * i);
    LODWORD(v6) = *a2;
    *(_QWORD *)(v14 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v23 = v7[6] + 24 * i;
    *(_QWORD *)v23 = result;
    *(_QWORD *)(v23 + 8) = v21;
    *(_BYTE *)(v23 + 16) = v22;
    *(double *)(v7[7] + 8 * i) = (double)v5 / (double)v6;
    v24 = v7[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v7[2] = v26;
    result = sub_1CFBBA3C8(result, v21, v22);
    if (v12)
      goto LABEL_4;
LABEL_5:
    v17 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_24;
    if (v17 >= v13)
      return (uint64_t)v7;
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v8;
    if (!v18)
    {
      v8 = v17 + 1;
      if (v17 + 1 >= v13)
        return (uint64_t)v7;
      v18 = *(_QWORD *)(v9 + 8 * v8);
      if (!v18)
      {
        v8 = v17 + 2;
        if (v17 + 2 >= v13)
          return (uint64_t)v7;
        v18 = *(_QWORD *)(v9 + 8 * v8);
        if (!v18)
          break;
      }
    }
LABEL_18:
    v12 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v13)
    return (uint64_t)v7;
  v18 = *(_QWORD *)(v9 + 8 * v19);
  if (v18)
  {
    v8 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v8 >= v13)
      return (uint64_t)v7;
    v18 = *(_QWORD *)(v9 + 8 * v8);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1CFBBA614(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_1CFBFA7A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1CFBFAD2C();
    v6 = result;
    if (result)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_15;
LABEL_3:
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  v24 = v5;
  v25 = v3;
  v26 = v2;
  v8 = 0;
  v9 = (uint64_t *)(v27 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypesByListIdentifier);
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v10 = (id)MEMORY[0x1D17DAF80](v8, a1);
    else
      v10 = *(id *)(a1 + 8 * v8 + 32);
    v11 = v10;
    v12 = objc_msgSend(v10, sel_uniqueIdentifier, v24, v25, v26);
    v13 = sub_1CFBFA894();
    v15 = v14;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    v16 = sub_1CFBBEE14(v13, v15);
    v18 = v17;
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v20 = *v9;
      v28 = *v9;
      *v9 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1CFBC9E24();
        v20 = v28;
      }
      swift_bridgeObjectRelease();
      sub_1CFBC96B8(v16, v20);
      *v9 = v20;
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    ++v8;
    swift_endAccess();
    objc_msgSend(v11, sel_removeListObserver_, v27);

  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
  v3 = v25;
  v2 = v26;
  v5 = v24;
LABEL_16:
  sub_1CFBFA780();
  v21 = sub_1CFBFA78C();
  v22 = sub_1CFBFA9CC();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1CFB7D000, v21, v22, "Page indicator content did invalidate for folder", v23, 2u);
    MEMORY[0x1D17DBCE8](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_1CFBB936C();
}

uint64_t sub_1CFBBA8D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0)
    {
      if (a1 == a4 && a2 == a5)
        return 1;
      else
        return sub_1CFBFAD8C();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return (a6 & 1) == 0 && a4 == a1;
  }
}

uint64_t sub_1CFBBA920(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_1CFBBA3C8(result, a2, a3 & 1);
  return result;
}

uint64_t sub_1CFBBA938(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 254)
    return sub_1CFBBA94C(result, a2, a3);
  return result;
}

uint64_t sub_1CFBBA94C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_1CFBBA3B8(result, a2, a3 & 1);
  return result;
}

uint64_t sub_1CFBBA964()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBBA988(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1CFBB96EC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_BYTE **)(v3 + 24));
}

uint64_t sub_1CFBBA990()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBBA9A0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1CFBBA9C0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBBA9E4(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_addListObserver_, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1CFBBA9F4()
{
  return swift_deallocObject();
}

id sub_1CFBBAA04(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_removeListObserver_, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1CFBBAA14()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBBAA24(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t destroy for FolderPageIndicatorProvider.IconListType(uint64_t a1)
{
  return sub_1CFBBA3B8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s15ControlCenterUI27FolderPageIndicatorProviderC12IconListTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CFBBA3C8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FolderPageIndicatorProvider.IconListType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CFBBA3C8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1CFBBA3B8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FolderPageIndicatorProvider.IconListType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1CFBBA3B8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FolderPageIndicatorProvider.IconListType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FolderPageIndicatorProvider.IconListType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1CFBBABF0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1CFBBABFC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FolderPageIndicatorProvider.IconListType()
{
  return &type metadata for FolderPageIndicatorProvider.IconListType;
}

unint64_t sub_1CFBBAC1C()
{
  unint64_t result;

  result = qword_1ED90ACB0;
  if (!qword_1ED90ACB0)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC01C0C, &type metadata for FolderPageIndicatorProvider.IconListType);
    atomic_store(result, (unint64_t *)&qword_1ED90ACB0);
  }
  return result;
}

unint64_t sub_1CFBBAC80(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEC8);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1CFBBEE14(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBAD90(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AEB8);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 52);
  while (1)
  {
    v5 = *(_QWORD *)(v4 - 5);
    v6 = *(_QWORD *)(v4 - 3);
    v7 = *((_BYTE *)v4 - 4);
    v8 = *v4;
    sub_1CFBBA3C8(v5, v6, v7);
    result = sub_1CFBBEE78(v5, v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = v2[6] + 24 * result;
    *(_QWORD *)v11 = v5;
    *(_QWORD *)(v11 + 8) = v6;
    *(_BYTE *)(v11 + 16) = v7;
    *(_DWORD *)(v2[7] + 4 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 += 6;
    v2[2] = v14;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBAECC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEB0);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *((_BYTE *)v4 - 8);
    v8 = *v4;
    sub_1CFBBA3C8(v5, v6, v7);
    result = sub_1CFBBEE78(v5, v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = v2[6] + 24 * result;
    *(_QWORD *)v11 = v5;
    *(_QWORD *)(v11 + 8) = v6;
    *(_BYTE *)(v11 + 16) = v7;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 4;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBAFFC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A58);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1CFBBEE14(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBB10C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A50);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1CFBBEE14(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBB224(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A48);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1CFBBEE14(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBB33C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0990);
  v2 = sub_1CFBFAD50();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1CFBBFA10(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1CFBBEE14(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1CFBBFA58(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBB464(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AED0);
  v2 = (_QWORD *)sub_1CFBFAD50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    result = sub_1CFBBEF50((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1CFBBB56C()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_1CFBFA7A4();
  __swift_allocate_value_buffer(v0, qword_1EFBF2CE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF2CE8);
  result = *MEMORY[0x1E0D146B0];
  if (*MEMORY[0x1E0D146B0])
  {
    sub_1CFBFA8C4();
    return sub_1CFBFA798();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CFBBB5E4()
{
  return 1;
}

id sub_1CFBBB650()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)();
  void *v20;
  void (*v21)();
  uint64_t v22;

  v1 = OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection);
  }
  else
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
    v5 = (void *)sub_1CFBFA870();
    v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 0);

    v7 = (void *)sub_1CFBFA72C();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

    v8 = (void *)sub_1CFBFA720();
    objc_msgSend(v6, sel_setExportedInterface_, v8);

    v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v21 = sub_1CFBC0328;
    v22 = v9;
    v10 = MEMORY[0x1E0C809B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 1107296256;
    v19 = sub_1CFBCD038;
    v20 = &block_descriptor_42;
    v11 = _Block_copy(&v17);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v11);
    _Block_release(v11);
    v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v21 = sub_1CFBC0330;
    v22 = v12;
    v17 = v10;
    v18 = 1107296256;
    v19 = sub_1CFBCD038;
    v20 = &block_descriptor_46;
    v13 = _Block_copy(&v17);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v13);
    _Block_release(v13);
    objc_msgSend(v6, sel_setExportedObject_, v0);
    objc_msgSend(v6, sel_resume);
    v14 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v15 = v2;
  return v3;
}

void sub_1CFBBB87C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  char *v5;
  void *v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D17DBD84](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_retain(*(id *)(v2
                           + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection));

    objc_msgSend(v4, sel_invalidate);
  }
  swift_beginAccess();
  v5 = (char *)MEMORY[0x1D17DBD84](v1);
  if (v5)
  {
    v6 = *(void **)&v5[OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection];
    *(_QWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection] = 0;

  }
}

void sub_1CFBBB92C(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (char *)MEMORY[0x1D17DBD84](v1);
  if (v2)
  {
    v3 = *(void **)&v2[OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection];
    *(_QWORD *)&v2[OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection] = 0;

  }
}

id sub_1CFBBB988()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CCUIGamePolicyProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CFBBBA44()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBBBA84()
{
  return sub_1CFBFAE04();
}

uint64_t sub_1CFBBBAA8()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

const char *sub_1CFBBBAE4()
{
  return "GamePolicy";
}

const char *sub_1CFBBBAF8()
{
  return "universalGamePolicySupport";
}

unint64_t CCUIGameModeBundleState.init(rawValue:)(unint64_t a1)
{
  return sub_1CFBBF558(a1);
}

uint64_t sub_1CFBBBB28()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBBBB6C()
{
  return sub_1CFBFAE04();
}

uint64_t sub_1CFBBBB94()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

unint64_t sub_1CFBBBBD4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1CFBBF558(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1CFBBBC98()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CFBBBD70(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFBBBDC0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1CFBBBE28())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CFBBBEB0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1CFBBBF3C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1CFBBBF84())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CFBBC00C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1CFBBC098(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1CFBBC0E0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

char *CCUIGameModeActivityDataProvider.__allocating_init(delegate:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return CCUIGameModeActivityDataProvider.init(delegate:)();
}

char *CCUIGameModeActivityDataProvider.init(delegate:)()
{
  char *v0;
  uint64_t v1;
  char *v2;
  id v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int *v8;
  _QWORD v10[3];
  ValueMetadata *v11;
  unint64_t v12;
  uint64_t v13;
  objc_super v14;

  swift_unknownObjectWeakInit();
  v1 = OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_bundleIdentifierState;
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_1CFBBAFFC(MEMORY[0x1E0DEE9D8]);
  *(_DWORD *)&v2[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_consoleModeDidChangeNotificationToken] = 0;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v2[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v2[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState] = 1;
  v2[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA] = 0;

  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for CCUIGameModeActivityDataProvider();
  v3 = objc_msgSendSuper2(&v14, sel_init);
  v11 = &type metadata for GamePolicyFF;
  v12 = sub_1CFBBF588();
  v4 = (char *)v3;
  LOBYTE(v3) = sub_1CFBFA738();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if ((v3 & 1) != 0)
  {
    sub_1CFBBAA24(0, &qword_1ED90ADD0);
    v5 = sub_1CFBFAA50();
    v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v12 = (unint64_t)sub_1CFBBF610;
    v13 = v6;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 1107296256;
    v10[2] = sub_1CFBBC44C;
    v11 = (ValueMetadata *)&block_descriptor_1;
    v7 = _Block_copy(v10);
    swift_release();
    v8 = (int *)&v4[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_consoleModeDidChangeNotificationToken];
    swift_beginAccess();
    notify_register_dispatch("com.apple.system.console_mode_available_changed", v8, v5, v7);
    swift_endAccess();

    swift_unknownObjectRelease();
    _Block_release(v7);

  }
  else
  {

    swift_unknownObjectRelease();
  }
  return v4;
}

void sub_1CFBBC35C(int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1D17DBD84](v3);
  if (v4)
  {
    v5 = (char *)v4;
    v7[0] = 0;
    if (!notify_get_state(a1, v7))
    {
      if (!v7[0])
      {
        v6 = &v5[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData];
        swift_beginAccess();
        *(_QWORD *)v6 = MEMORY[0x1E0DEE9E8];

        swift_bridgeObjectRelease();
        return;
      }
      if (v7[0] == 1)
        sub_1CFBBD170();
    }

  }
}

uint64_t sub_1CFBBC44C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1CFBBC4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v6;
  char v7;
  uint64_t v8;

  v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_bundleIdentifierState);
  if (!*(_QWORD *)(v3 + 16))
    return 4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_1CFBBEE14(a1, a2);
  if ((v7 & 1) != 0)
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
  else
    v8 = 4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_1CFBBC5A0(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD aBlock[7];

  if (a1 >= 4)
  {
    if (a1 != 4)
    {
      sub_1CFBFADA4();
      __break(1u);
    }
  }
  else
  {
    v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CCUIGamePolicyProxy()), sel_init);
    v11 = sub_1CFBBB650();
    v12 = objc_msgSend(v11, sel_remoteObjectProxy);

    sub_1CFBFABE8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0940);
    if (swift_dynamicCast())
    {
      v13 = (void *)aBlock[6];
      v14 = (void *)sub_1CFBFA870();
      v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v16 = (_QWORD *)swift_allocObject();
      v16[2] = v10;
      v16[3] = v15;
      v16[4] = a4;
      v16[5] = a5;
      v16[6] = a2;
      v16[7] = a3;
      aBlock[4] = sub_1CFBBF654;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBBC8FC;
      aBlock[3] = &block_descriptor_7;
      v17 = _Block_copy(aBlock);
      v18 = v10;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_release();
      objc_msgSend(v13, sel_requestCCUISetGameModeInfoWithState_bundleIdentifier_withReply_, a1, v14, v17);
      _Block_release(v17);

      swift_unknownObjectRelease();
    }
    else
    {

      a4(4);
    }
  }
}

void sub_1CFBBC7B8(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  v11 = a3 + 16;
  objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection), sel_invalidate);
  swift_beginAccess();
  v12 = MEMORY[0x1D17DBD84](v11);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v15 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x60))();
    swift_bridgeObjectRetain();
    v16 = sub_1CFBBF3E0(v15, a6, a7);
    swift_bridgeObjectRelease();
    v17 = swift_bridgeObjectRelease();
    if (v16)
    {
      v18 = (*(uint64_t (**)(uint64_t))((*v14 & *v16) + 0xF8))(v17);
      if (v18 >= 4)
        v18 = 4;
      a4(v18);

    }
    else
    {
      a4(4uLL);
    }
    sub_1CFBBCA54((unint64_t)a1);

  }
  else
  {
    a4(4uLL);
  }
}

void sub_1CFBBC8FC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

BOOL sub_1CFBBC9DC()
{
  size_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = 8;
  v3[0] = 0;
  return sysctlbyname("kern.console_mode", v3, &v2, 0, 0) != -1 && v3[0] == 1;
}

uint64_t sub_1CFBBCA54(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  _QWORD *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  id v53;
  id aBlock[6];
  uint64_t v55;

  v2 = sub_1CFBFA7D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CFBFA7F8();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x1E0C80A78](v6);
  v42 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0DEE9D8];
  v53 = (id)sub_1CFBBAFFC(MEMORY[0x1E0DEE9D8]);
  v46 = v3;
  v47 = v2;
  v45 = v5;
  if ((v8 & 0xC000000000000000) != 0)
    goto LABEL_22;
LABEL_2:
  v9 = MEMORY[0x1E0DEE9E8];
  while (1)
  {
    v55 = v9;
    v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v11 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1) + 0x60))();
    if (v11 >> 62)
      break;
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v12)
      goto LABEL_25;
LABEL_5:
    v41 = (_QWORD *)a1;
    a1 = 0;
    v13 = 0;
    v51 = (_QWORD *)v12;
    v52 = v11 & 0xC000000000000001;
    v48 = v11 & 0xFFFFFFFFFFFFFF8;
    v49 = v11;
    v50 = 0x80000001CFC05540;
    if ((v11 & 0xC000000000000001) != 0)
    {
      while (1)
      {
        v14 = (_QWORD *)MEMORY[0x1D17DAF80](a1, v11);
LABEL_11:
        v15 = v14;
        if (__OFADD__(a1, 1))
          break;
        v16 = *(uint64_t (**)(void))((*v10 & *v14) + 0x80);
        v17 = v16();
        v19 = v18;
        v20 = (*(uint64_t (**)(void))((*v10 & *v15) + 0xF8))();
        v21 = v53;
        if (v20 >= 4)
          v22 = 4;
        else
          v22 = v20;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = v21;
        sub_1CFBCACB0(v22, v17, v19, isUniquelyReferenced_nonNull_native);
        v53 = aBlock[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D147C8]), sel_init);
        (*(void (**)(id))((*v10 & *v15) + 0x98))(objc_msgSend(v24, sel_setSensorType_, 3));
        v25 = (void *)sub_1CFBFA870();
        swift_bridgeObjectRelease();
        objc_msgSend(v24, sel_setExecutableDisplayName_, v25);

        v16();
        v26 = (void *)sub_1CFBFA870();
        swift_bridgeObjectRelease();
        objc_msgSend(v24, sel_setBundleIdentifier_, v26);

        v27 = (void *)sub_1CFBFA870();
        objc_msgSend(v24, sel_setAttributionGroup_, v27);

        v28 = objc_msgSend(v24, sel_setIsSystemService_, (*(uint64_t (**)(id))((*v10 & *v15) + 0xB0))(objc_msgSend(v24, sel_setWebsite_, 0)) & 1);
        objc_msgSend(v24, sel_setUsedRecently_, (*(uint64_t (**)(id))((*v10 & *v15) + 0xE0))(v28) & 1);
        v29 = v24;
        sub_1CFBBD7C0(aBlock, v29, &qword_1ED90AE30, 0x1E0D147C8, &qword_1EFBF0A28);

        if ((v13 & 1) != 0)
        {

          v13 = 1;
        }
        else
        {
          v13 = (*(uint64_t (**)(void))((*v10 & *v15) + 0xC8))();

        }
        if ((_QWORD *)(a1 + 1) == v51)
        {
          a1 = (unint64_t)v41;
          goto LABEL_26;
        }
        ++a1;
        v11 = v49;
        if (!v52)
          goto LABEL_9;
      }
      __break(1u);
    }
    else
    {
LABEL_9:
      if (a1 < *(_QWORD *)(v48 + 16))
      {
        v14 = *(id *)(v11 + 8 * a1 + 32);
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_22:
    if (!sub_1CFBFAD2C())
      goto LABEL_2;
    sub_1CFBBFF00(MEMORY[0x1E0DEE9D8]);
  }
  v12 = sub_1CFBFAD2C();
  if (v12)
    goto LABEL_5;
LABEL_25:
  v13 = 0;
LABEL_26:
  swift_bridgeObjectRelease();
  sub_1CFBBAA24(0, &qword_1ED90ADD0);
  v30 = (void *)sub_1CFBFAA50();
  v31 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v32 = v55;
  v33 = swift_allocObject();
  v34 = v53;
  *(_QWORD *)(v33 + 16) = v31;
  *(_QWORD *)(v33 + 24) = v34;
  *(_QWORD *)(v33 + 32) = v32;
  *(_QWORD *)(v33 + 40) = a1;
  *(_BYTE *)(v33 + 48) = v13 & 1;
  aBlock[4] = sub_1CFBBFB8C;
  aBlock[5] = (id)v33;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1CFBCD038;
  aBlock[3] = &block_descriptor_25;
  v35 = _Block_copy(aBlock);
  v36 = (id)a1;
  swift_release();
  v37 = v42;
  sub_1CFBFA7E0();
  aBlock[0] = (id)MEMORY[0x1E0DEE9D8];
  sub_1CFBBFB9C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
  sub_1CFBBFBE4();
  v38 = v45;
  v39 = v47;
  sub_1CFBFAC00();
  MEMORY[0x1D17DAD10](0, v37, v38, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v39);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v37, v44);
}

void sub_1CFBBCFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;

  v9 = a1 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x1D17DBD84](v9);
  if (v10)
  {
    v11 = (char *)v10;
    *(_QWORD *)(v10 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_bundleIdentifierState) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v12 = &v11[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData];
    swift_beginAccess();
    *(_QWORD *)v12 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v13 = &v11[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState];
    swift_beginAccess();
    v14 = *(_QWORD *)v13;
    *(_QWORD *)v13 = *(unsigned __int8 *)(a4 + *MEMORY[0x1E0D25C98]);
    v15 = &v11[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA];
    swift_beginAccess();
    *v15 = a5 & 1;
    v16 = (void *)MEMORY[0x1D17DBD84](&v11[OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_delegate]);
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, sel_gameModeActivitiesDidChange);
      if (v14 == *(_QWORD *)v13)
      {

        swift_unknownObjectRelease();
        return;
      }
      objc_msgSend(v17, sel_gameModeStateDidChange_);
      swift_unknownObjectRelease();
    }

  }
}

void sub_1CFBBD170()
{
  id v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[8];

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CCUIGamePolicyProxy()), sel_init);
  v1 = sub_1CFBBB650();
  v2 = objc_msgSend(v1, sel_remoteObjectProxy);

  sub_1CFBFABE8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0940);
  if (swift_dynamicCast())
  {
    v3 = (void *)v17[7];
    v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v0;
    *(_QWORD *)(v5 + 24) = v4;
    v17[4] = sub_1CFBBFB48;
    v17[5] = v5;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 1107296256;
    v17[2] = sub_1CFBBC8FC;
    v17[3] = &block_descriptor_18;
    v6 = _Block_copy(v17);
    v7 = v0;
    swift_release();
    objc_msgSend(v3, sel_requestCCUIGameModeStatusInfoWithReply_, v6);
    _Block_release(v6);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_1CFBBFAD8();
    v8 = (void *)swift_allocError();
    swift_willThrow();

    if (qword_1EFBEFE38 != -1)
      swift_once();
    v9 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EFBF2CE8);
    v10 = v8;
    v11 = v8;
    v12 = sub_1CFBFA78C();
    v13 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v16 = v8;
      v17[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_1CFBFABD0();
      *v15 = v17[0];

      _os_log_impl(&dword_1CFB7D000, v12, v13, "Unable to request game mode status %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v15, -1, -1);
      MEMORY[0x1D17DBCE8](v14, -1, -1);

    }
    else
    {

    }
  }
}

void sub_1CFBBD498(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a3 + 16;
  objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection), sel_invalidate);
  swift_beginAccess();
  v5 = MEMORY[0x1D17DBD84](v4);
  if (v5)
  {
    v6 = (void *)v5;
    sub_1CFBBCA54(a1);

  }
}

id CCUIGameModeActivityDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CCUIGameModeActivityDataProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CCUIGameModeActivityDataProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CCUIGameModeActivityDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CFBBD5F8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1CFBFADF8();
  swift_bridgeObjectRetain();
  sub_1CFBFA8AC();
  v8 = sub_1CFBFAE10();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1CFBFAD8C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1CFBFAD8C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1CFBBE27C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1CFBBD7A4(_QWORD *a1, void *a2)
{
  return sub_1CFBBD7C0(a1, a2, &qword_1ED90AD60, 0x1E0DAA628, &qword_1EFBF0A40);
}

uint64_t sub_1CFBBD7C0(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_1CFBFAC3C();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_1CFBBAA24(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1CFBFAC30();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_1CFBBDA88(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_1CFBBDF64(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_1CFBBE1FC((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_1CFBFAB04();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_1CFBBAA24(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_1CFBFAB10();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_1CFBFAB10();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_1CFBBE414((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_1CFBBDA88(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_1CFBFAC9C();
    v19 = v6;
    sub_1CFBFAC24();
    if (sub_1CFBFAC48())
    {
      sub_1CFBBAA24(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_1CFBBDF64(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_1CFBFAB04();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_1CFBFAC48());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v6;
}

uint64_t sub_1CFBBDC88()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0A30);
  v3 = sub_1CFBFAC90();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1CFBFADF8();
      sub_1CFBFA8AC();
      result = sub_1CFBFAE10();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1CFBBDF64(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1CFBFAC90();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_1CFBFAB04();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_1CFBBE1FC(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1CFBFAB04();
  result = sub_1CFBFAC18();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_1CFBBE27C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1CFBBDC88();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1CFBBE5A4();
      goto LABEL_22;
    }
    sub_1CFBBE8F4();
  }
  v11 = *v4;
  sub_1CFBFADF8();
  sub_1CFBFA8AC();
  result = sub_1CFBFAE10();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1CFBFAD8C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1CFBFADB0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1CFBFAD8C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void sub_1CFBBE414(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1CFBBDF64(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_1CFBBE754(a4);
      goto LABEL_14;
    }
    sub_1CFBBEBA0(v11, a4);
  }
  v12 = *v5;
  v13 = sub_1CFBFAB04();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1CFBBAA24(0, a5);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_1CFBFAB10();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_1CFBFADB0();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_1CFBFAB10();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

void *sub_1CFBBE5A4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0A30);
  v2 = *v0;
  v3 = sub_1CFBFAC84();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1CFBBE754(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1CFBFAC84();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1CFBBE8F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0A30);
  v3 = sub_1CFBFAC90();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1CFBFADF8();
    swift_bridgeObjectRetain();
    sub_1CFBFA8AC();
    result = sub_1CFBFAE10();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1CFBBEBA0(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1CFBFAC90();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_1CFBFAB04();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1CFBBEE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1CFBFADF8();
  sub_1CFBFA8AC();
  v4 = sub_1CFBFAE10();
  return sub_1CFBBEFDC(a1, a2, v4);
}

unint64_t sub_1CFBBEE78(uint64_t a1, uint64_t a2, char a3)
{
  char v6;
  uint64_t v7;

  v6 = a3 & 1;
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  if ((a3 & 1) != 0)
    sub_1CFBFA8AC();
  else
    sub_1CFBFAE04();
  v7 = sub_1CFBFAE10();
  return sub_1CFBBF0BC(a1, a2, v6, v7);
}

unint64_t sub_1CFBBEF1C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1CFBFAC60();
  return sub_1CFBBF1A8(a1, v2);
}

unint64_t sub_1CFBBEF50(uint64_t a1)
{
  uint64_t v2;

  sub_1CFBFA894();
  sub_1CFBFADF8();
  sub_1CFBFA8AC();
  v2 = sub_1CFBFAE10();
  swift_bridgeObjectRelease();
  return sub_1CFBBF26C(a1, v2);
}

unint64_t sub_1CFBBEFDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1CFBFAD8C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1CFBFAD8C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1CFBBF0BC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = (uint64_t *)(v12 + 24 * v7);
      v14 = *v13;
      if ((v13[2] & 1) != 0)
      {
        if ((a3 & 1) != 0)
        {
          v15 = v14 == a1 && v13[1] == a2;
          if (v15 || (sub_1CFBFAD8C() & 1) != 0)
            return v7;
        }
      }
      else if ((a3 & 1) == 0 && v14 == a1)
      {
        return v7;
      }
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_1CFBBF1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1CFBBFA68(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D17DAF20](v9, a1);
      sub_1CFBBFAA4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1CFBBF26C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1CFBFA894();
    v8 = v7;
    if (v6 == sub_1CFBFA894() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1CFBFAD8C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1CFBFA894();
          v15 = v14;
          if (v13 == sub_1CFBFA894() && v15 == v16)
            break;
          v18 = sub_1CFBFAD8C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void *sub_1CFBBF3E0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  if (a1 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_1CFBFAD2C())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0
         ? (_QWORD *)MEMORY[0x1D17DAF80](v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      if ((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x80))() == a2 && v11 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v9;
      }
      v13 = sub_1CFBFAD8C();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_16;

      ++v7;
      if (v10 == v6)
        goto LABEL_19;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1CFBBF558(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

uint64_t type metadata accessor for CCUIGameModeActivityDataProvider()
{
  return objc_opt_self();
}

unint64_t sub_1CFBBF588()
{
  unint64_t result;

  result = qword_1ED90ACA0;
  if (!qword_1ED90ACA0)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC01E38, &type metadata for GamePolicyFF);
    atomic_store(result, (unint64_t *)&qword_1ED90ACA0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1CFBBF5EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CFBBF610(int a1)
{
  uint64_t v1;

  sub_1CFBBC35C(a1, v1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t type metadata accessor for CCUIGamePolicyProxy()
{
  return objc_opt_self();
}

unint64_t sub_1CFBBF65C()
{
  unint64_t result;

  result = qword_1EFBF0948;
  if (!qword_1EFBF0948)
  {
    result = MEMORY[0x1D17DBC58](&protocol conformance descriptor for CCUIGameModeBundleState, &type metadata for CCUIGameModeBundleState);
    atomic_store(result, (unint64_t *)&qword_1EFBF0948);
  }
  return result;
}

uint64_t sub_1CFBBF6A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CFBBF6F8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1CFBBF748(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1CFBBF794@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1CFBBF7E4(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for CCUIGameModeBundleState()
{
  return &type metadata for CCUIGameModeBundleState;
}

uint64_t method lookup function for CCUIGameModeActivityDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.activityData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.activityData.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.activityData.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeAAA.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeAAA.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeAAA.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.__allocating_init(delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.state(forBundleIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.set(state:forBundleIdentifier:callback:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of CCUIGameModeActivityDataProvider.gameModeEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t sub_1CFBBF9B0()
{
  return 0;
}

ValueMetadata *type metadata accessor for GamePolicyFF()
{
  return &type metadata for GamePolicyFF;
}

unint64_t sub_1CFBBF9CC()
{
  unint64_t result;

  result = qword_1EFBF0988;
  if (!qword_1EFBF0988)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC01E10, &type metadata for GamePolicyFF);
    atomic_store(result, (unint64_t *)&qword_1EFBF0988);
  }
  return result;
}

uint64_t sub_1CFBBFA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1CFBBFA58(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1CFBBFA68(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1CFBBFAA4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

unint64_t sub_1CFBBFAD8()
{
  unint64_t result;

  result = qword_1EFBF0A00;
  if (!qword_1EFBF0A00)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC01EE0, &type metadata for CCUIGamePolicyProxy.Error);
    atomic_store(result, (unint64_t *)&qword_1EFBF0A00);
  }
  return result;
}

uint64_t sub_1CFBBFB1C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1CFBBFB48(unint64_t a1)
{
  uint64_t v1;

  sub_1CFBBD498(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1CFBBFB50()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1CFBBFB8C()
{
  uint64_t v0;

  sub_1CFBBCFF4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
}

unint64_t sub_1CFBBFB9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBF0A10;
  if (!qword_1EFBF0A10)
  {
    v1 = sub_1CFBFA7D4();
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBF0A10);
  }
  return result;
}

unint64_t sub_1CFBBFBE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBF0A20;
  if (!qword_1EFBF0A20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EFBF1050);
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBF0A20);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17DBC4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1CFBBFC74(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(_QWORD, _QWORD))
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  _QWORD aBlock[7];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a5;
  if (a1 >= 4)
  {
    if (a1 == 4)
    {
      _Block_copy(a5);
      swift_release();
    }
    else
    {
      swift_release();
      aBlock[0] = a1;
      sub_1CFBFADA4();
      __break(1u);
    }
  }
  else
  {
    v10 = objc_allocWithZone((Class)type metadata accessor for CCUIGamePolicyProxy());
    _Block_copy(a5);
    v11 = objc_msgSend(v10, sel_init);
    v12 = sub_1CFBBB650();
    v13 = objc_msgSend(v12, sel_remoteObjectProxy);

    sub_1CFBFABE8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0940);
    if (swift_dynamicCast())
    {
      v14 = (void *)aBlock[6];
      v15 = (void *)sub_1CFBFA870();
      v16 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = v11;
      v17[3] = v16;
      v17[4] = sub_1CFBB85C8;
      v17[5] = v9;
      v17[6] = a2;
      v17[7] = a3;
      aBlock[4] = sub_1CFBBF654;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBBC8FC;
      aBlock[3] = &block_descriptor_36;
      v18 = _Block_copy(aBlock);
      v19 = v11;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_release();
      objc_msgSend(v14, sel_requestCCUISetGameModeInfoWithState_bundleIdentifier_withReply_, a1, v15, v18);
      _Block_release(v18);
      swift_release();

      swift_unknownObjectRelease();
    }
    else
    {

      a5[2](a5, 4);
      swift_release();
    }
  }
}

void sub_1CFBBFF00(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A28);
      v3 = sub_1CFBFACA8();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x1D17DAF80](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_1CFBFAB04();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_1CFBBAA24(0, &qword_1ED90AE30);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_1CFBFAB10();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_1CFBFAB10();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_1CFBFAB04();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_1CFBBAA24(0, &qword_1ED90AE30);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_1CFBFAB10();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_1CFBFAB10();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_1CFBC025C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1CFBC02C0(_QWORD *a1)
{
  uint64_t v1;

  sub_1CFBBC7B8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(unint64_t))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

unint64_t sub_1CFBC02D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED90AE38;
  if (!qword_1ED90AE38)
  {
    v1 = sub_1CFBBAA24(255, &qword_1ED90AE30);
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED90AE38);
  }
  return result;
}

void sub_1CFBC0328()
{
  uint64_t v0;

  sub_1CFBBB87C(v0);
}

void sub_1CFBC0330()
{
  uint64_t v0;

  sub_1CFBBB92C(v0);
}

uint64_t _s15ControlCenterUI12GamePolicyFFOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s15ControlCenterUI12GamePolicyFFOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CFBC03C8 + 4 * byte_1CFC01C80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CFBC03E8 + 4 * byte_1CFC01C85[v4]))();
}

_BYTE *sub_1CFBC03C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CFBC03E8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFBC03F0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFBC03F8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFBC0400(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFBC0408(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CCUIGamePolicyProxy.Error()
{
  return &type metadata for CCUIGamePolicyProxy.Error;
}

unint64_t sub_1CFBC0428()
{
  unint64_t result;

  result = qword_1EFBF0A60;
  if (!qword_1EFBF0A60)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC01EB8, &type metadata for CCUIGamePolicyProxy.Error);
    atomic_store(result, (unint64_t *)&qword_1EFBF0A60);
  }
  return result;
}

uint64_t type metadata accessor for AccessoryButton()
{
  return objc_opt_self();
}

id sub_1CFBC0554(char a1)
{
  void *v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char **v7;
  id result;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  char **v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t (*v42)();
  void *v43;
  id v44;
  char v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  char v54[32];
  __int128 aBlock;
  uint64_t (*v56)(uint64_t);
  void *v57;
  uint64_t (*v58)();
  uint64_t v59;

  v2 = v1;
  v3 = a1 & 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE98);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &selRef_setSmallControlsResizeHandleSettings_;
  result = objc_msgSend(v1, sel_isEnabled);
  if ((_DWORD)result == v3)
    return result;
  v9 = objc_msgSend(v1, sel_layer);
  sub_1CFBFABA0();
  v10 = sub_1CFBFAB94();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v6, 1, v10))
    goto LABEL_6;
  sub_1CFBC127C((uint64_t)v6);
  do
  {
    v11 = objc_msgSend(v1, sel_tintColor);
    if (v11)
      break;
    __break(1u);
LABEL_6:
    v11 = (id)sub_1CFBFAB40();
    sub_1CFBC127C((uint64_t)v6);
  }
  while (!v11);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v9;
  v13 = v9;
  v51 = v11;
  v14 = &selRef_setSmallControlsResizeHandleSettings_;
  v15 = objc_msgSend(v13, sel_filters);
  v52 = v13;
  if (v15)
  {
    v16 = v15;
    v17 = sub_1CFBFA900();

    v18 = v17;
    v19 = *(_QWORD *)(v17 + 16);
    if (v19)
    {
      v49 = v12;
      v50 = v2;
      v20 = v18 + 32;
      v48 = v18;
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_1CFBC1384(v20, (uint64_t)&aBlock);
        sub_1CFBC1384((uint64_t)&aBlock, (uint64_t)v54);
        sub_1CFBBAA24(0, &qword_1EFBF0A78);
        if (!swift_dynamicCast())
          break;
        v22 = v53;
        v23 = objc_msgSend(v53, sel_name);

        if (!v23)
          break;
        v24 = sub_1CFBFA894();
        v26 = v25;

        v27 = sub_1CFBFA894();
        if (!v26)
          goto LABEL_19;
        if (v24 == v27 && v26 == v28)
        {
          swift_bridgeObjectRelease_n();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
LABEL_32:
          swift_bridgeObjectRelease_n();
          v42 = 0;
          v2 = v50;
          v7 = &selRef_setSmallControlsResizeHandleSettings_;
LABEL_30:
          v45 = objc_msgSend(v2, v7[287]);
          v47 = v51;
          v46 = v52;
          sub_1CFBC0B30(v45, v51, v52);

          swift_release();
          return (id)sub_1CFBB8538((uint64_t)v42);
        }
        v21 = sub_1CFBFAD8C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
        if ((v21 & 1) != 0)
          goto LABEL_32;
LABEL_11:
        v20 += 32;
        if (!--v19)
        {
          swift_bridgeObjectRelease_n();
          v12 = v49;
          v2 = v50;
          v7 = &selRef_setSmallControlsResizeHandleSettings_;
          v13 = v52;
          v14 = &selRef_setSmallControlsResizeHandleSettings_;
          goto LABEL_22;
        }
      }
      sub_1CFBFA894();
LABEL_19:
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
  }
LABEL_22:
  v29 = objc_msgSend(v13, v14[293]);
  if (v29)
  {
    v30 = v29;
    v31 = (_QWORD *)sub_1CFBFA900();

  }
  else
  {
    v31 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  sub_1CFBFA894();
  v32 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v33 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_initWithType_, v33);

  v57 = (void *)sub_1CFBBAA24(0, &qword_1EFBF0A78);
  *(_QWORD *)&aBlock = v34;
  v35 = v12;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v31 = sub_1CFBEBCE4(0, v31[2] + 1, 1, v31);
  v37 = v31[2];
  v36 = v31[3];
  if (v37 >= v36 >> 1)
    v31 = sub_1CFBEBCE4((_QWORD *)(v36 > 1), v37 + 1, 1, v31);
  v31[2] = v37 + 1;
  sub_1CFBBFA58(&aBlock, &v31[4 * v37 + 4]);
  v38 = (void *)sub_1CFBFA8F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setFilters_, v38);

  v39 = (void *)objc_opt_self();
  v40 = (_QWORD *)swift_allocObject();
  v40[2] = sub_1CFBC12E8;
  v40[3] = v35;
  v40[4] = v2;
  v41 = swift_allocObject();
  v42 = sub_1CFBC131C;
  *(_QWORD *)(v41 + 16) = sub_1CFBC131C;
  *(_QWORD *)(v41 + 24) = v40;
  v58 = sub_1CFBB8584;
  v59 = v41;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v56 = sub_1CFBE86CC;
  v57 = &block_descriptor_2;
  v43 = _Block_copy(&aBlock);
  swift_retain();
  v44 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v39, sel_performWithoutAnimation_, v43);
  _Block_release(v43);
  LOBYTE(v43) = swift_isEscapingClosureAtFileLocation();
  result = (id)swift_release();
  if ((v43 & 1) == 0)
    goto LABEL_30;
  __break(1u);
  return result;
}

void sub_1CFBC0B30(char a1, id a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if ((a1 & 1) != 0)
  {
    sub_1CFBB54E8();
    CAColorMatrixMakeColorSourceOver();
    v10 = v13;
    v11 = v12;
    v8 = v15;
    v9 = v14;
    v7 = v16;
  }
  else
  {
    v4 = objc_msgSend(a2, sel_colorWithAlphaComponent_, 0.12);
    sub_1CFBB54E8();
    CAColorMatrixMakePlusL();
    v10 = v13;
    v11 = v12;
    v8 = v15;
    v9 = v14;
    v7 = v16;

  }
  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v5 = objc_msgSend((id)objc_opt_self(), sel_valueWithCAColorMatrix_, &v12);
  if (qword_1ED90B000 != -1)
    swift_once();
  v6 = (void *)sub_1CFBFA870();
  objc_msgSend(a3, sel_setValue_forKeyPath_, v5, v6);

}

id sub_1CFBC0CB8(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for AccessoryButton();
  return objc_msgSendSuper2(&v5, *a3);
}

id sub_1CFBC0D34(char a1)
{
  void *v1;
  objc_class *v3;
  unsigned int v4;
  id result;
  uint64_t v6;
  objc_super v7;
  objc_super v8;

  v3 = (objc_class *)type metadata accessor for AccessoryButton();
  v8.receiver = v1;
  v8.super_class = v3;
  v4 = objc_msgSendSuper2(&v8, sel_isHighlighted);
  v7.receiver = v1;
  v7.super_class = v3;
  objc_msgSendSuper2(&v7, sel_setHighlighted_, a1 & 1);
  result = objc_msgSend(v1, sel_isHighlighted);
  if (v4 != (_DWORD)result)
  {
    objc_msgSend(v1, sel_isHighlighted);
    v6 = sub_1CFBBAA24(0, &qword_1EFBF0A70);
    MEMORY[0x1E0C80A78](v6);
    return (id)sub_1CFBFAAF8();
  }
  return result;
}

id sub_1CFBC0E50()
{
  uint64_t v0;
  void *v1;
  unsigned int v2;
  double v3;

  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_isHighlighted);
  v3 = 0.4;
  if (!v2)
    v3 = 1.0;
  return objc_msgSend(v1, sel_setAlpha_, v3);
}

id AccessoryButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id AccessoryButton.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for AccessoryButton();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id AccessoryButton.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AccessoryButton.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AccessoryButton();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id AccessoryButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CFBC11DC()
{
  uint64_t result;

  sub_1CFBFA894();
  sub_1CFBFA8B8();
  swift_bridgeObjectRelease();
  sub_1CFBFA8B8();
  sub_1CFBFA894();
  sub_1CFBFA8B8();
  result = swift_bridgeObjectRelease();
  qword_1ED90AFE8 = 0x2E737265746C6966;
  *(_QWORD *)algn_1ED90AFF0 = 0xE800000000000000;
  return result;
}

uint64_t sub_1CFBC127C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFBC12BC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CFBC12E8(char a1)
{
  uint64_t v1;

  sub_1CFBC0B30(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1CFBC12F0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1CFBC131C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(objc_msgSend(*(id *)(v0 + 32), sel_isEnabled) ^ 1);
}

uint64_t sub_1CFBC135C()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1CFBC1384(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CFBC13D0()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IconImageViewControllerCache()
{
  return objc_opt_self();
}

uint64_t sub_1CFBC1418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD v16[2];

  v6 = sub_1CFBFA7A4();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)(a3 + 16);
  objc_msgSend(v11, sel_setObject_forKey_, a1, a2, v8);
  sub_1CFBFA780();
  swift_retain();
  v12 = sub_1CFBFA78C();
  v13 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 134217984;
    v16[1] = objc_msgSend(v11, sel_count);
    sub_1CFBFABD0();
    swift_release();
    _os_log_impl(&dword_1CFB7D000, v12, v13, "[IconImageViewControllerCache] Added entry. Cache size: %ld", v14, 0xCu);
    MEMORY[0x1D17DBCE8](v14, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_1CFBC159C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD v14[2];

  v4 = sub_1CFBFA7A4();
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](v4).n128_u64[0];
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(a2 + 16);
  objc_msgSend(v9, sel_removeObjectForKey_, a1, v6);
  sub_1CFBFA780();
  swift_retain();
  v10 = sub_1CFBFA78C();
  v11 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 134217984;
    v14[1] = objc_msgSend(v9, sel_count);
    sub_1CFBFABD0();
    swift_release();
    _os_log_impl(&dword_1CFB7D000, v10, v11, "[IconImageViewControllerCache] Removed entry. Cache size: %ld", v12, 0xCu);
    MEMORY[0x1D17DBCE8](v12, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

id PowerButton.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PowerButton.init()()
{
  void *v0;

  return objc_msgSend(v0, sel_initWithFrame_luminanceMap_, 0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t type metadata accessor for PowerButton()
{
  return objc_opt_self();
}

id PowerButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void PowerButton.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PowerButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PowerButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1CFBC1CC0(void *a1)
{
  char *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;

  v3 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1D17DBD84](&v1[OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate]);
    if (v5)
    {
      v6 = v5;
      v7 = v5 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
      swift_beginAccess();
      v8 = (void *)MEMORY[0x1D17DBD84](v7);
      if (v8)
      {
        objc_msgSend(v8, sel_pagingViewController_didAdd_, v6, v4);

        swift_unknownObjectRelease();
      }
      else
      {

      }
      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
  objc_msgSend(a1, sel_setAllowsAdornmentsOverIconImage_animated_, v1[OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_allowsIconAdornments], 0);
  v9 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v9)
  {
    v10 = v9;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      v11 = (char *)objc_msgSend(v10, sel_parentViewController);
      if (v11)
      {
        v12 = v11;

        if (v12 == v1)
        {
          v13 = objc_msgSend(v1, sel__appearState);
          if (v13 - 1 <= 1)
          {
            v14 = v13;
            objc_msgSend(v10, sel_ccui_safelyBeginAppearanceTransitionForChildViewControllers_animated_, 1, 0);
            if (v14 == 2)
              objc_msgSend(v10, sel_ccui_safelyEndAppearanceTransitionForChildViewControllers);
          }
        }
      }
    }

  }
}

id sub_1CFBC1EDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IconListFolderController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IconListFolderController()
{
  return objc_opt_self();
}

uint64_t sub_1CFBC1F3C(uint64_t result)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (result)
  {
    v2 = (void *)result;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      v3 = v2;
      v4 = objc_msgSend(v3, sel_parentViewController);

      if (!v4)
      {
        objc_msgSend(v3, sel_ccui_safelyBeginAppearanceTransitionForChildViewControllers_animated_, 0, 0);
        objc_msgSend(v3, sel_ccui_safelyEndAppearanceTransitionForChildViewControllers);
      }

    }
    result = MEMORY[0x1D17DBD84](v1 + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate);
    if (result)
    {
      v5 = result;
      v6 = result + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
      swift_beginAccess();
      v7 = MEMORY[0x1D17DBD84](v6);
      if (v7)
      {
        v8 = (void *)v7;
        v9 = v2;
        objc_msgSend(v8, sel_pagingViewController_willRemove_, v5, v9);

        swift_unknownObjectRelease();
      }
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id ControlDescriptorProvider.__allocating_init(widgetExtensionProvider:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlDescriptorProvider_widgetExtensionProvider] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ControlDescriptorProvider.init(widgetExtensionProvider:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR___CCUIControlDescriptorProvider_widgetExtensionProvider] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ControlDescriptorProvider();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for ControlDescriptorProvider()
{
  return objc_opt_self();
}

uint64_t sub_1CFBC215C()
{
  return sub_1CFBFAAB0();
}

id ControlDescriptorProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ControlDescriptorProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ControlDescriptorProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlDescriptorProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ControlDescriptorProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ControlDescriptorProvider.__allocating_init(widgetExtensionProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ControlDescriptorProvider.descriptor(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

id sub_1CFBC2310()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimpleContentModule();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SimpleContentModule()
{
  return objc_opt_self();
}

void sub_1CFBC2370()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_folderView);
  v2 = objc_msgSend(v1, sel_currentIconListView);

  if (!v2)
    return;
  v3 = objc_msgSend(v2, sel_visibleIcons);
  sub_1CFBBAA24(0, &qword_1ED90AE70);
  v4 = sub_1CFBFA900();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_4;
LABEL_9:

    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_9;
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x1D17DAF80](0, v4);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v4 + 32);
LABEL_7:
    v6 = v5;
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_displayedIconViewForIcon_, v6);

    return;
  }
  __break(1u);
}

uint64_t sub_1CFBC24D0()
{
  void *v0;
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  unsigned __int8 v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = objc_msgSend(v0, sel_visibleIconListViews);
  sub_1CFBBAA24(0, &qword_1ED90AD78);
  v2 = sub_1CFBFA900();

  v3 = MEMORY[0x1E0DEE9D8];
  v34 = MEMORY[0x1E0DEE9D8];
  if (v2 >> 62)
    goto LABEL_49;
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v4)
  {
    v5 = 0;
    v31 = v4;
    v32 = v2 & 0xC000000000000001;
    v29 = v2 + 32;
    v30 = v2;
    v2 = (unint64_t)&selRef_setSmallControlsResizeHandleSettings_;
    while (1)
    {
      if (v32)
        v7 = (id)MEMORY[0x1D17DAF80](v5, v30);
      else
        v7 = *(id *)(v29 + 8 * v5);
      v8 = v7;
      v9 = __OFADD__(v5, 1);
      v10 = v5 + 1;
      if (v9)
      {
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      v33 = v10;
      v11 = objc_msgSend(v7, sel_visibleIcons);
      sub_1CFBBAA24(0, &qword_1ED90AE70);
      v12 = sub_1CFBFA900();

      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        v13 = sub_1CFBFAD2C();
        if (!v13)
        {
LABEL_24:
          swift_bridgeObjectRelease();
          v18 = v3;
          goto LABEL_25;
        }
      }
      else
      {
        v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v13)
          goto LABEL_24;
      }
      if (v13 < 1)
        goto LABEL_47;
      for (i = 0; i != v13; ++i)
      {
        if ((v12 & 0xC000000000000001) != 0)
          v15 = (id)MEMORY[0x1D17DAF80](i, v12);
        else
          v15 = *(id *)(v12 + 8 * i + 32);
        v16 = v15;
        v17 = objc_msgSend(v8, sel_displayedIconViewForIcon_, v15);

        if (v17)
        {
          MEMORY[0x1D17DAB9C]();
          if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1CFBFA924();
          sub_1CFBFA930();
          sub_1CFBFA918();
        }
      }
      swift_bridgeObjectRelease();
      v18 = v3;
      v3 = MEMORY[0x1E0DEE9D8];
LABEL_25:
      swift_bridgeObjectRelease();
      if (!(v18 >> 62))
      {
        v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v19)
          break;
        goto LABEL_44;
      }
      swift_bridgeObjectRetain();
      v19 = sub_1CFBFAD2C();
      if (v19)
        break;
LABEL_44:
      swift_bridgeObjectRelease();
      v6 = v3;
LABEL_5:

      swift_bridgeObjectRelease();
      sub_1CFBC2D0C(v6);
      v5 = v33;
      if (v33 == v31)
      {
        swift_bridgeObjectRelease_n();
        return v34;
      }
    }
    if (v19 >= 1)
    {
      v20 = 0;
      while (1)
      {
        if ((v18 & 0xC000000000000001) != 0)
          v21 = (id)MEMORY[0x1D17DAF80](v20, v18);
        else
          v21 = *(id *)(v18 + 8 * v20 + 32);
        v22 = v21;
        v23 = objc_msgSend(v21, sel_customIconImageViewController);
        if (v23)
        {
          v24 = v23;
          objc_opt_self();
          v25 = (void *)swift_dynamicCastObjCClass();
          if (!v25)
          {

            goto LABEL_30;
          }
          v26 = objc_msgSend(v25, sel_contentViewController);

          if (v26)
          {
            v27 = objc_msgSend(v26, sel_respondsToSelector_, sel_interpretsLocationAsContent_inView_);

            if ((v27 & 1) != 0)
            {
              MEMORY[0x1D17DAB9C]();
              if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_1CFBFA924();
              sub_1CFBFA930();
              sub_1CFBFA918();
            }
            else
            {

            }
            goto LABEL_30;
          }
        }

LABEL_30:
        if (v19 == ++v20)
        {
          swift_bridgeObjectRelease();
          v6 = v3;
          v3 = MEMORY[0x1E0DEE9D8];
          goto LABEL_5;
        }
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    swift_bridgeObjectRetain();
    v4 = sub_1CFBFAD2C();
  }
  swift_bridgeObjectRelease_n();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1CFBC2954(void *a1, double a2, double a3)
{
  void *v3;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;

  v7 = objc_msgSend(v3, sel_folderView);
  v8 = objc_msgSend(v7, sel_scrollView);

  objc_msgSend(a1, sel_convertPoint_toCoordinateSpace_, v8, a2, a3);
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v8, sel_hitTest_withEvent_, 0);
  if (v13)
  {
    if (v13 == v8)
    {
      v23 = 0;
    }
    else
    {
      v14 = v13;
      v15 = sub_1CFBC24D0();
      v16 = v14;
      v17 = sub_1CFBC3B80(v15, v16);
      swift_bridgeObjectRelease();

      if (v17)
      {
        v18 = v17;
        objc_msgSend(v8, sel_convertPoint_toCoordinateSpace_, v16, v10, v12);
        v20 = v19;
        v22 = v21;
        if ((objc_msgSend(v18, sel_respondsToSelector_, sel_interpretsLocationAsContent_inView_) & 1) != 0)
        {
          v23 = (uint64_t)objc_msgSend(v18, sel_interpretsLocationAsContent_inView_, v16, v20, v22);
          v24 = v18;
        }
        else
        {
          v23 = 1;
          v24 = v16;
          v16 = v18;
        }

        v8 = v24;
      }
      else
      {
        v23 = 1;
      }

      v8 = v16;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t sub_1CFBC2B04()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x1E0DEE9D8];
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = &v8;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_1CFBC3D70;
  *(_QWORD *)(v2 + 24) = v1;
  aBlock[4] = sub_1CFBC3D88;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFBCD300;
  aBlock[3] = &block_descriptor_9;
  v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v0, sel_enumerateDisplayedIconViewsUsingBlock_, v3);
  _Block_release(v3);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

void sub_1CFBC2C3C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  v1 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v3)
    {
      v4 = v3;
      if ((objc_msgSend(v3, sel_respondsToSelector_, sel_topLevelBlockingGestureRecognizers) & 1) != 0)
      {
        v5 = objc_msgSend(v4, sel_topLevelBlockingGestureRecognizers);
        sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADF0);
        v6 = sub_1CFBFA900();

        sub_1CFBC2EC4(v6);
      }
    }

  }
}

uint64_t sub_1CFBC2D0C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1D17DAF8C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1CFBC35AC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1CFBFA918();
  }
  __break(1u);
  return result;
}

uint64_t sub_1CFBC2EC4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1D17DAF8C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1CFBC37B4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1CFBFA918();
  }
  __break(1u);
  return result;
}

void sub_1CFBC307C(void *a1, void *a2, void (*a3)(void), uint64_t a4)
{
  void *v4;
  void *v5;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  char *v30;
  char *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  char v37;
  _QWORD aBlock[7];

  v5 = v4;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  sub_1CFBFAAA4();
  v9 = a1;
  v10 = sub_1CFBF0364(v9);
  v11 = objc_msgSend(v9, sel_identity);
  v12 = objc_msgSend(v11, sel_intentReference);
  if (v12)
  {
    v13 = v12;
    v14 = objc_msgSend(v12, sel_intent);

    if (v14)
    {
      v15 = (char *)objc_msgSend(v11, sel_extensionIdentity);
      v16 = &v15[*MEMORY[0x1E0D0FE18]];
      swift_beginAccess();
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v16, 1, v17))
      {
        swift_endAccess();
        v18 = v14;
      }
      else
      {
        sub_1CFBFA750();
        swift_endAccess();

        v18 = (void *)sub_1CFBFA870();
        swift_bridgeObjectRelease();
        v15 = (char *)objc_msgSend(v10, sel_uniqueIdentifier);
        if (!v15)
        {
          sub_1CFBFA894();
          v15 = (char *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(a2, sel_storeIntent_bundleIdentifier_dataSourceIdentifier_, v14, v18, v15);

      }
    }
  }
  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
  v19 = (void *)sub_1CFBFA9A8();
  objc_msgSend(v19, sel_addIconDataSource_, v10);
  v20 = v19;
  objc_msgSend(v9, sel_size);
  v21 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  objc_msgSend(v20, sel_setGridSizeClass_, v21);

  v22 = objc_msgSend(v5, sel_folderView);
  v23 = objc_msgSend(v5, sel_folderView);
  v24 = objc_msgSend(v23, sel_currentPageIndex);

  v25 = objc_msgSend(v22, sel_iconListModelIndexForPageIndex_, v24);
  v37 = 0;
  v26 = objc_msgSend(v5, sel_folder);
  if (v26)
  {
    v27 = v26;

  }
  objc_msgSend(v5, sel_layoutIconListsWithAnimationType_forceRelayout_, -1, 0);
  if (v37 == 1)
  {
    v28 = objc_msgSend(v5, sel_folderView);
    v29 = objc_msgSend(v5, sel_folderView);
    v30 = (char *)objc_msgSend(v29, sel_currentPageIndex);

    v31 = v30 + 1;
    if (__OFADD__(v30, 1))
      __break(1u);
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = a3;
    v32[3] = a4;
    v32[4] = v5;
    v32[5] = v20;
    aBlock[4] = sub_1CFBC3D2C;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD038;
    aBlock[3] = &block_descriptor_3;
    v33 = _Block_copy(aBlock);
    v34 = v20;
    sub_1CFBC3D50((uint64_t)a3);
    v35 = v5;
    swift_release();
    objc_msgSend(v28, sel_setCurrentPageIndex_animated_completion_, v31, 1, v33);
    _Block_release(v33);
    goto LABEL_16;
  }
  if (a3)
  {
    v28 = objc_msgSend(v5, sel_firstIconViewForIcon_, v20);
    a3();
LABEL_16:

    v11 = v20;
    v20 = v28;
  }

}

uint64_t CCUIGridSizeClass.init(controlSize:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_1CFC02068[a1 - 1];
}

void sub_1CFBC3550(void (*a1)(void), int a2, id a3, uint64_t a4)
{
  id v5;

  if (a1)
  {
    v5 = objc_msgSend(a3, sel_firstIconViewForIcon_, a4);
    a1();

  }
}

uint64_t sub_1CFBC35AC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1CFBC3D90(&qword_1EFBF0C58, &qword_1EFBF0C50);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0C50);
          v12 = sub_1CFBC39C8(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0C48);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

uint64_t sub_1CFBC37B4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1CFBC3D90((unint64_t *)&unk_1ED90AD40, &qword_1ED90AD38);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AD38);
          v12 = sub_1CFBC3A20(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADF0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

void (*sub_1CFBC39C8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1CFBC3AA0(v6, a2, a3);
  return sub_1CFBC3A1C;
}

void (*sub_1CFBC3A20(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1CFBC3B0C(v6, a2, a3);
  return sub_1CFBC3A1C;
}

void sub_1CFBC3A74(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1CFBC3AA0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1D17DAF80](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1CFBC3DD8;
  }
  __break(1u);
  return result;
}

void (*sub_1CFBC3B0C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1D17DAF80](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1CFBC3B78;
  }
  __break(1u);
  return result;
}

void sub_1CFBC3B78(id *a1)
{

}

id sub_1CFBC3B80(unint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id result;
  void *v10;
  unsigned int v11;

  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_14:
  swift_bridgeObjectRetain();
  v4 = sub_1CFBFAD2C();
  if (!v4)
    goto LABEL_15;
LABEL_3:
  v5 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x1D17DAF80](v5 - 4, a1);
    else
      v6 = *(id *)(a1 + 8 * v5);
    v7 = v6;
    v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_14;
    }
    result = objc_msgSend(v6, sel_view);
    if (!result)
      break;
    v10 = result;
    v11 = objc_msgSend(a2, sel_isDescendantOfView_, result);

    if (v11)
    {
      swift_bridgeObjectRelease();
      return v7;
    }

    ++v5;
    if (v8 == v4)
      goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t _sSo17CCUIGridSizeClassV15ControlCenterUIE06moduleB0ABSo09CCSModuleB0V_tcfC_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return 0;
  else
    return qword_1CFC02080[a1 - 1];
}

uint64_t sub_1CFBC3CF0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

void sub_1CFBC3D2C()
{
  uint64_t v0;

  sub_1CFBC3550(*(void (**)(void))(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1CFBC3D50(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1CFBC3D60()
{
  return swift_deallocObject();
}

void sub_1CFBC3D70(void *a1)
{
  sub_1CFBC2C3C(a1);
}

uint64_t sub_1CFBC3D78()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBC3D88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBCD2E0(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1CFBC3D90(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEAF50], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1CFBC3E24(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 0x3FF0000000000000;
  v4 = 0;
  v5 = 0;
  v6 = 0x3FF0000000000000;
  v7 = 0;
  v8 = 0;
  objc_msgSend(a1, sel_setTransform_, &v3);
  v2 = objc_msgSend(a1, sel_contentContainerView);
  v3 = 0x3FF0000000000000;
  v4 = 0;
  v5 = 0;
  v6 = 0x3FF0000000000000;
  v7 = 0;
  v8 = 0;
  objc_msgSend(v2, sel_setTransform_, &v3);

}

uint64_t sub_1CFBC3EFC()
{
  uint64_t v0;

  sub_1CFBB85D8(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IconViewProvider()
{
  return objc_opt_self();
}

uint64_t sub_1CFBC3F48(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t result;
  _QWORD v9[6];

  v2 = a1;
  objc_msgSend(a1, sel_setDelegate_, MEMORY[0x1D17DBD84](v1 + 16));
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_setAllowsResizeHandle_, 1);
  objc_msgSend(v2, sel_setSuppressesDefaultEditingAnimation_, 1);
  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1CFBC40F4;
  *(_QWORD *)(v5 + 24) = v4;
  v9[4] = sub_1CFBB8584;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1CFBE86CC;
  v9[3] = &block_descriptor_4;
  v6 = _Block_copy(v9);
  v7 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performWithoutAnimation_, v6);
  _Block_release(v6);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1CFBC40D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CFBC40F4()
{
  uint64_t v0;

  sub_1CFBC3E24(*(void **)(v0 + 16));
}

uint64_t sub_1CFBC40FC()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_1CFBC41F8()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v1 = objc_msgSend(v0, sel_editingSettings);

  v2 = objc_msgSend(v1, sel_resizingSettings);
  qword_1EFBF0C60 = (uint64_t)v2;
}

uint64_t sub_1CFBC4278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  SBHIconListLayoutIconImageInfoForGridSizeClass();
  v8 = v7;
  v10 = v9;
  swift_beginAccess();
  v11 = *(_QWORD *)(a4 + 16);
  v12 = *(_QWORD *)(a4 + 24);
  if (BSFloatGreaterThanFloat())
  {
    BSIntervalMake((uint64_t)&v20, v8, v8);
    BSUIConstrainValueToIntervalWithRubberBand();
    v11 = v13;
  }
  if (BSFloatGreaterThanFloat())
  {
    BSIntervalMake((uint64_t)&v20, v10, v10);
    BSUIConstrainValueToIntervalWithRubberBand();
    v12 = v14;
  }
  swift_beginAccess();
  *(_QWORD *)(a4 + 16) = v11;
  *(_QWORD *)(a4 + 24) = v12;
  swift_beginAccess();
  v15 = *(_QWORD *)(a5 + 16);
  v16 = *(_QWORD *)(a5 + 24);
  if (BSFloatLessThanFloat())
  {
    BSIntervalMake((uint64_t)&v20, v8, v8);
    BSUIConstrainValueToIntervalWithRubberBand();
    v15 = v17;
  }
  if (BSFloatLessThanFloat())
  {
    BSIntervalMake((uint64_t)&v20, v10, v10);
    BSUIConstrainValueToIntervalWithRubberBand();
    v16 = v18;
  }
  result = swift_beginAccess();
  *(_QWORD *)(a5 + 16) = v15;
  *(_QWORD *)(a5 + 24) = v16;
  return result;
}

void sub_1CFBC4484(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  int v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  double v67;
  double v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t aBlock;
  uint64_t v73;
  void (*v74)(uint64_t, void *);
  void *v75;
  void *v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  if ((*(_BYTE *)(v1 + 120) & 1) != 0)
  {
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v4 = *(void **)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  v5 = *(double *)(v1 + 104);
  v69 = *(_QWORD *)(v1 + 96);
  v6 = *(double *)(v1 + 88);
  v7 = objc_msgSend(v3, sel__shouldReverseLayoutDirection);
  objc_msgSend(a1, sel_locationInView_, v4);
  v9 = v8;
  v11 = v10;
  v70 = v7;
  v68 = v5;
  if (v7)
  {
    v12 = BSFloatGreaterThanFloat();
  }
  else
  {
    v5 = 0.0;
    v12 = BSFloatLessThanFloat();
  }
  if (v12)
    v13 = v5;
  else
    v13 = v9;
  v14 = 0.0;
  if (!BSFloatLessThanFloat())
    v14 = v11;
  objc_msgSend(v4, sel_frame);
  v67 = v6;
  v80.origin.x = v13 - (v6 - v15);
  v78.origin.y = 0.0;
  v78.size.width = 1.0;
  v78.size.height = 1.0;
  v80.size.width = 1.0;
  v80.size.height = 1.0;
  v78.origin.x = v5;
  v80.origin.y = v14;
  v79 = CGRectUnion(v78, v80);
  if ((*(_BYTE *)(v1 + 144) & 1) != 0)
    goto LABEL_40;
  x = v79.origin.x;
  y = v79.origin.y;
  width = v79.size.width;
  height = v79.size.height;
  v20 = *(double *)(v1 + 128);
  v21 = *(double *)(v1 + 136);
  if (qword_1EFBEFE48 != -1)
    swift_once();
  v22 = (void *)qword_1EFBF0C60;
  objc_msgSend((id)qword_1EFBF0C60, sel_undersizeRubberbandingRange);
  if (BSFloatLessThanFloat())
  {
    BSIntervalMake((uint64_t)&aBlock, v20, v20);
    BSUIConstrainValueToIntervalWithRubberBand();
    width = v23;
  }
  if (BSFloatLessThanFloat())
  {
    BSIntervalMake((uint64_t)&aBlock, v21, v21);
    BSUIConstrainValueToIntervalWithRubberBand();
    height = v24;
  }
  if ((*(_BYTE *)(v1 + 168) & 1) != 0)
    goto LABEL_41;
  v25 = *(double *)(v1 + 152);
  v26 = *(double *)(v1 + 160);
  objc_msgSend(v22, sel_oversizeRubberbandingRange);
  if (BSFloatGreaterThanFloat())
  {
    BSIntervalMake((uint64_t)&aBlock, v25, v25);
    BSUIConstrainValueToIntervalWithRubberBand();
    width = v27;
  }
  if (BSFloatGreaterThanFloat())
  {
    BSIntervalMake((uint64_t)&aBlock, v26, v26);
    BSUIConstrainValueToIntervalWithRubberBand();
    height = v28;
  }
  v29 = *(void **)(v1 + 200);
  if (!v29)
    goto LABEL_42;
  v30 = objc_msgSend(v29, sel_gridSizeClass);
  if (!v30)
    return;
  v31 = v30;
  v65 = v4;
  v66 = v3;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = 0;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = 0;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = 0;
  v35 = *(void **)(v1 + 184);
  if (!v35)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v36 = v34;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = v1;
  *(_BYTE *)(v37 + 24) = v70;
  *(double *)(v37 + 32) = v5;
  *(_QWORD *)(v37 + 40) = 0;
  *(CGFloat *)(v37 + 48) = x;
  *(CGFloat *)(v37 + 56) = y;
  *(double *)(v37 + 64) = width;
  *(double *)(v37 + 72) = height;
  *(double *)(v37 + 80) = width * height;
  *(_QWORD *)(v37 + 88) = v31;
  *(_QWORD *)(v37 + 96) = v32;
  *(_QWORD *)(v37 + 104) = v36;
  *(_QWORD *)(v37 + 112) = v33;
  v76 = sub_1CFBC59A4;
  v77 = v37;
  aBlock = MEMORY[0x1E0C809B0];
  v73 = 1107296256;
  v74 = sub_1CFBEAA70;
  v75 = &block_descriptor_17;
  v71 = v33;
  v38 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v39 = v35;
  v40 = v31;
  swift_release();
  objc_msgSend(v39, sel_enumerateGridSizeClassesUsingBlock_, v38);
  _Block_release(v38);

  swift_beginAccess();
  v41 = *(void **)(v71 + 16);
  if (v41)
  {
    swift_beginAccess();
    swift_beginAccess();
    v42 = v40;
    v43 = v41;
    v44 = BSFloatGreaterThanFloat();
    v45 = v42;
    v46 = MEMORY[0x1E0C809B0];
    if (v44)
    {

      v47 = *(void **)(v1 + 200);
      if (!v47)
      {
LABEL_46:
        __break(1u);
        return;
      }
      v45 = v43;
      objc_msgSend(v47, sel_setGridSizeClass_, v45);
      objc_msgSend(v66, sel_layoutIconsIfNeededWithAnimationType_options_, 0, 0);
    }
    v64 = v43;
    if (*(_QWORD *)(v1 + 216))
    {
      SBHIconListLayoutIconImageInfoForGridSizeClass();
      v49 = v48;
      v51 = v50;
      if (v70)
        v52 = v68 + v67 - width;
      else
        v52 = v67;
      v53 = (void *)objc_opt_self();
      v54 = objc_msgSend((id)qword_1EFBF0C60, sel_animationSettings);
      v55 = swift_allocObject();
      *(_QWORD *)(v55 + 16) = v65;
      *(double *)(v55 + 24) = width;
      *(double *)(v55 + 32) = height;
      *(_QWORD *)(v55 + 40) = v49;
      *(_QWORD *)(v55 + 48) = v51;
      *(double *)(v55 + 56) = v52;
      *(_QWORD *)(v55 + 64) = v69;
      *(double *)(v55 + 72) = width;
      *(double *)(v55 + 80) = height;
      v76 = sub_1CFBC59EC;
      v77 = v55;
      aBlock = v46;
      v73 = 1107296256;
      v74 = (void (*)(uint64_t, void *))sub_1CFBCD038;
      v75 = &block_descriptor_23_0;
      v56 = _Block_copy(&aBlock);
      v57 = v65;
      swift_release();
      objc_msgSend(v53, sel_sb_animateWithSettings_mode_animations_completion_, v54, 5, v56, 0);
      _Block_release(v56);

      if (v44)
      {
        v58 = objc_msgSend((id)qword_1EFBF0C60, sel_animationSettings, v64);
        v59 = swift_allocObject();
        *(_QWORD *)(v59 + 16) = v1;
        *(_QWORD *)(v59 + 24) = v45;
        v76 = sub_1CFBC5A30;
        v77 = v59;
        aBlock = v46;
        v73 = 1107296256;
        v74 = (void (*)(uint64_t, void *))sub_1CFBCD038;
        v75 = &block_descriptor_29;
        v60 = _Block_copy(&aBlock);
        swift_retain();
        v61 = v45;
        swift_release();
        objc_msgSend(v53, sel_sb_animateWithSettings_mode_animations_completion_, v58, 3, v60, 0);
        _Block_release(v60);

      }
      v62 = *(void **)(v1 + 208);
      if (v62)
      {
        v63 = v62;
        objc_msgSend(v66, sel_bringSubviewToFront_, v63);
        swift_release();
        swift_release();
        swift_release();

        return;
      }
      goto LABEL_45;
    }
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }

  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1CFBC4C08(void *a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t result;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  void **v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;

  result = *(_QWORD *)(a10 + 216);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v47 = a1;
  SBHIconListLayoutIconImageInfoForGridSizeClass();
  v29 = v27;
  v30 = v28;
  if ((a11 & 1) != 0)
  {
    v31 = a2 - v27;
    v32 = 0;
    v33 = v27;
    v34 = v28;
  }
  else
  {
    BSRectWithSize();
    v31 = v35;
    v32 = v36;
    v33 = v37;
    v34 = v38;
  }
  v48.origin.x = a4;
  v48.origin.y = a5;
  v48.size.width = a6;
  v48.size.height = a7;
  v49 = CGRectIntersection(v48, *(CGRect *)&v31);
  v39 = 1.0 - (v29 * v30 + a8 - v49.size.width * v49.size.height - v49.size.width * v49.size.height) / (v29 * v30 + a8);
  v40 = sub_1CFBFA894();
  v42 = v41;
  if (v40 == sub_1CFBFA894() && v42 == v43)
  {
    swift_bridgeObjectRelease_n();
LABEL_9:
    result = swift_beginAccess();
    *(double *)(a13 + 16) = v39;
    return result;
  }
  v44 = sub_1CFBFAD8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v44 & 1) != 0)
    goto LABEL_9;
  swift_beginAccess();
  result = BSFloatGreaterThanFloat();
  if ((result & 1) != 0)
  {
    v45 = (void **)(a15 + 16);
    swift_beginAccess();
    *(double *)(a14 + 16) = v39;
    swift_beginAccess();
    v46 = *v45;
    *v45 = v47;

    return (uint64_t)v47;
  }
  return result;
}

id sub_1CFBC4E2C(void *a1)
{
  objc_msgSend(a1, sel_setIconImageInfo_);
  UIRectGetCenter();
  objc_msgSend(a1, sel_setCenter_);
  return objc_msgSend(a1, sel_layoutIfNeeded);
}

void sub_1CFBC4EA4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 192);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_setGridSizeClass_, CCUIGridSizeClassForSBHIconGridSizeClass());
    objc_msgSend(v2, sel_setSuppressesCompactContinuousCornerRadiusUpdates_, 0);
    objc_msgSend(v2, sel_setSuppressesCompactContinuousCornerRadiusUpdates_, 1);

  }
}

id sub_1CFBC4F2C(void *a1, int a2, id a3, double a4, double a5, double a6, double a7)
{
  if (a1)
  {
    objc_msgSend(a1, sel_setGridSizeClass_, CCUIGridSizeClassForSBHIconGridSizeClass());
    objc_msgSend(a3, sel_setIconImageInfo_, a4, a5, a6, a7);
    objc_msgSend(a1, sel_setSuppressesCompactContinuousCornerRadiusUpdates_, 0);
  }
  else
  {
    objc_msgSend(a3, sel_setIconImageInfo_, a4, a5, a6, a7);
  }
  UIRectGetCenter();
  objc_msgSend(a3, sel_setCenter_);
  return objc_msgSend(a3, sel_layoutIfNeeded);
}

id sub_1CFBC5034(int a1, int a2, uint64_t a3, uint64_t a4, id a5, uint64_t a6)
{
  void (*v9)(uint64_t, uint64_t);
  id result;

  if (*(_QWORD *)(a4 + 224) == a3)
  {
    if (a5)
    {
      objc_msgSend(a5, sel_setResizing_, 0);
      objc_msgSend(a5, sel_setMinResizeDimensions_, 0.0, 0.0);
      objc_msgSend(a5, sel_setMaxResizeDimensions_, 0.0, 0.0);
    }
    v9 = *(void (**)(uint64_t, uint64_t))(a4 + 72);
    if (v9)
    {
      swift_retain();
      v9(a4, a6);
      sub_1CFBB8538((uint64_t)v9);
    }
    return sub_1CFBC5134();
  }
  return result;
}

uint64_t sub_1CFBC50EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

id sub_1CFBC5134()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *i;
  id result;
  void *v16;

  v3 = (void *)v0[3];
  v4 = MEMORY[0x1D17DBD84](v0 + 4);
  if (!v4)
    goto LABEL_13;
  v1 = (void *)v4;
  v5 = (void *)v0[24];
  if (!v5)
    goto LABEL_12;
  v6 = (void *)v0[2];
  v7 = v5;
  v8 = objc_msgSend(v6, sel_icon);
  if (!v8)
    goto LABEL_11;
  v2 = v8;
  objc_opt_self();
  v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9)
    goto LABEL_10;
  v10 = objc_msgSend(v9, sel_activeDataSource);
  if (!v10)
  {

    goto LABEL_13;
  }
  v11 = (uint64_t)v10;
  v12 = objc_msgSend(v3, sel_iconViewProvider);
  if (v12)
  {
    objc_msgSend(v12, sel_recycleIconView_, v6);
    swift_unknownObjectRelease();
  }
  v13 = v7;
  v7 = sub_1CFBC5664((uint64_t)v13, v11, 0x632D657A69736572, 0xEE0070756E61656CLL, (uint64_t)v1);
  swift_unknownObjectRelease();

  for (i = (void *)v0[25]; !i; i = (void *)v0[25])
  {
    __break(1u);
LABEL_10:

LABEL_11:
LABEL_12:

LABEL_13:
    v7 = 0;
  }
  objc_msgSend(i, sel_invalidate);
  v0[25] = 0;
  swift_unknownObjectRelease();
  result = (id)v0[26];
  if (result)
  {
    objc_msgSend(result, sel_removeFromSuperview);
    v16 = (void *)v0[26];
    v0[26] = 0;

    result = objc_msgSend(v3, sel_layoutIconsNow);
    if (v7)
    {
      objc_msgSend(v7, sel_invalidate);
      return (id)swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CFBC5318()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  sub_1CFBB8538(*(_QWORD *)(v0 + 40));
  sub_1CFBB8538(*(_QWORD *)(v0 + 56));
  sub_1CFBB8538(*(_QWORD *)(v0 + 72));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1CFBC538C()
{
  sub_1CFBC5318();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ControlResizeGestureHandler()
{
  return objc_opt_self();
}

uint64_t sub_1CFBC53CC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t *v30;
  uint64_t v31;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0F60);
  result = sub_1CFBFACA8();
  v9 = result;
  v30 = a1;
  v31 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= v31)
      goto LABEL_36;
    v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_36;
      v16 = v30[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_36;
        v16 = v30[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v14);
    sub_1CFBFA894();
    sub_1CFBFADF8();
    v19 = v18;
    sub_1CFBFA8AC();
    v20 = sub_1CFBFAE10();
    result = swift_bridgeObjectRelease();
    v21 = -1 << *(_BYTE *)(v9 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v24) = v19;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= v31)
    goto LABEL_36;
  v16 = v30[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_36;
    v16 = v30[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

id sub_1CFBC5664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[6];

  v8 = OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource;
  v9 = *(void **)(a5 + OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource);
  if (v9)
  {
    v10 = *(void **)(a5 + OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource);
  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_self(), sel_mapTableWithKeyOptions_valueOptions_, 0, 0);
    v10 = v11;
    if (*(_QWORD *)(a5 + v8))
    {
      v9 = 0;
    }
    else
    {
      *(_QWORD *)(a5 + v8) = v11;
      v9 = v11;
    }
  }
  v12 = v9;
  objc_msgSend(v10, sel_setObject_forKey_, a1, a2);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3A28]), sel_init);
  v14 = objc_msgSend(v13, sel_UUIDString);

  sub_1CFBFA894();
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = v10;
  v16[4] = a2;
  v17 = objc_allocWithZone(MEMORY[0x1E0D01868]);
  v18 = v10;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  v19 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v20 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v24[4] = sub_1CFBC5908;
  v24[5] = v16;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 1107296256;
  v24[2] = sub_1CFBBC8FC;
  v24[3] = &block_descriptor_5;
  v21 = _Block_copy(v24);
  v22 = objc_msgSend(v17, sel_initWithIdentifier_forReason_invalidationBlock_, v19, v20, v21);

  _Block_release(v21);
  swift_release();

  swift_release();
  return v22;
}

uint64_t sub_1CFBC58B0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CFBC58D4()
{
  uint64_t v0;

  swift_release();

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1CFBC5908(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBD71A0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1CFBC592C()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBC593C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBC5960()
{
  uint64_t v0;

  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBC59A4(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBC4C08(a1, *(double *)(v2 + 32), *(double *)(v2 + 40), *(CGFloat *)(v2 + 48), *(CGFloat *)(v2 + 56), *(CGFloat *)(v2 + 64), *(CGFloat *)(v2 + 72), *(double *)(v2 + 80), a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 104), *(_QWORD *)(v2 + 112));
}

uint64_t sub_1CFBC59C8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBC59EC()
{
  uint64_t v0;

  return sub_1CFBC4E2C(*(void **)(v0 + 16));
}

uint64_t sub_1CFBC5A04()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1CFBC5A30()
{
  uint64_t v0;

  sub_1CFBC4EA4(*(_QWORD *)(v0 + 16));
}

void BSIntervalMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 16) = a3;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 24) = 1;
}

uint64_t sub_1CFBC5A58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakInit();
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_BYTE *)(v2 + 120) = 1;
  *(_QWORD *)(v2 + 128) = 0;
  *(_QWORD *)(v2 + 136) = 0;
  *(_BYTE *)(v2 + 144) = 1;
  *(_QWORD *)(v2 + 152) = 0;
  *(_QWORD *)(v2 + 160) = 0;
  *(_BYTE *)(v2 + 168) = 1;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_QWORD *)(v2 + 224) = 0;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return v2;
}

unint64_t *sub_1CFBC5ADC(unint64_t *result, uint64_t a2, uint64_t a3, id a4, unsigned int a5)
{
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int64_t v20;
  unint64_t *v22;
  uint64_t v23;

  v22 = result;
  v7 = 0;
  v8 = 0;
  v9 = a3 + 56;
  v10 = 1 << *(_BYTE *)(a3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = (unsigned __int16)a5;
  v13 = HIWORD(a5);
  v14 = v11 & *(_QWORD *)(a3 + 56);
  v15 = (unint64_t)(v10 + 63) >> 6;
  while (2)
  {
    v23 = v7;
    do
    {
      if (v14)
      {
        v16 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        if (v8 >= v15)
          goto LABEL_26;
        v19 = *(_QWORD *)(v9 + 8 * v8);
        if (!v19)
        {
          v20 = v8 + 1;
          if (v8 + 1 >= v15)
            goto LABEL_26;
          v19 = *(_QWORD *)(v9 + 8 * v20);
          if (!v19)
          {
            v20 = v8 + 2;
            if (v8 + 2 >= v15)
              goto LABEL_26;
            v19 = *(_QWORD *)(v9 + 8 * v20);
            if (!v19)
            {
              v20 = v8 + 3;
              if (v8 + 3 >= v15)
              {
LABEL_26:
                swift_retain();
                return (unint64_t *)sub_1CFBC53CC(v22, a2, v23, a3);
              }
              v19 = *(_QWORD *)(v9 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  v8 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_28;
                  if (v8 >= v15)
                    goto LABEL_26;
                  v19 = *(_QWORD *)(v9 + 8 * v8);
                  ++v20;
                  if (v19)
                    goto LABEL_18;
                }
              }
            }
          }
          v8 = v20;
        }
LABEL_18:
        v14 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      result = (unint64_t *)objc_msgSend(a4, sel_iconGridSizeForClass_, *(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v17));
    }
    while (v13 < result >> 16 || v12 < (unsigned __int16)result);
    *(unint64_t *)((char *)v22 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v7 = v23 + 1;
    if (!__OFADD__(v23, 1))
      continue;
    break;
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t *sub_1CFBC5CA4(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v3;
  char v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t isStackAllocationSafe;
  void *v10;
  char *v11;
  id v12;
  unint64_t *v13;
  void *v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (unint64_t)((1 << v6) + 63) >> 6;
  isStackAllocationSafe = a2;
  v10 = (void *)isStackAllocationSafe;
  if (v7 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    v11 = (char *)v17 - ((8 * v8 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v11, 8 * v8);
    v12 = v10;
    v13 = sub_1CFBC5ADC((unint64_t *)v11, v8, a1, v12, a3);
    swift_release();

    if (v3)
      swift_willThrow();

  }
  else
  {
    v14 = (void *)swift_slowAlloc();
    bzero(v14, 8 * v8);
    v15 = v10;
    v13 = sub_1CFBC5ADC((unint64_t *)v14, v8, a1, v15, a3);
    swift_release();

    MEMORY[0x1D17DBCE8](v14, -1, -1);
  }
  return v13;
}

void sub_1CFBC5E5C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  _QWORD aBlock[8];

  v1 = *(_QWORD *)(v0 + 224);
  v2 = __CFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
    goto LABEL_18;
  }
  *(_QWORD *)(v0 + 224) = v3;
  if (*(_BYTE *)(v0 + 120) != 1)
    return;
  v5 = *(void **)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v6 = objc_msgSend(v5, sel_icon);
  if (!v6)
  {
LABEL_19:
    sub_1CFBFAD14();
    __break(1u);
    return;
  }
  v7 = v6;
  objc_opt_self();
  v46 = v7;
  v8 = swift_dynamicCastObjCClass();
  if (!v8 || (v9 = (void *)v8, (v47 = objc_msgSend(v5, sel_listLayout)) == 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v5, sel_frame);
  *(_QWORD *)(v0 + 88) = v10;
  *(_QWORD *)(v0 + 96) = v11;
  *(_QWORD *)(v0 + 104) = v12;
  *(_QWORD *)(v0 + 112) = v13;
  *(_BYTE *)(v0 + 120) = 0;
  v14 = objc_msgSend(v9, sel_gridSizeClass);
  v15 = *(void **)(v0 + 176);
  *(_QWORD *)(v0 + 176) = v14;

  v16 = objc_msgSend(v4, sel_gridSizeForCurrentOrientation);
  v17 = objc_msgSend(v9, sel_supportedGridSizeClasses);
  v18 = objc_msgSend(v17, sel_gridSizeClasses);

  type metadata accessor for SBHIconGridSizeClass(0);
  sub_1CFBC678C();
  v19 = sub_1CFBFA984();

  v20 = v4;
  sub_1CFBC5CA4(v19, v20, v16);

  v21 = objc_allocWithZone(MEMORY[0x1E0DAA488]);
  v22 = (void *)sub_1CFBFA978();
  swift_release();
  v23 = objc_msgSend(v21, sel_initWithGridSizeClasses_, v22);

  v24 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 184) = v23;
  v25 = v23;

  objc_msgSend(v5, sel_setAllowsCloseBox_, 0);
  objc_msgSend(v20, sel_forgetIconView_, v5);
  v26 = (void *)sub_1CFBFA870();
  v27 = objc_msgSend(v20, sel_addPlaceholderRepresentingIcon_reason_options_, v9, v26, 16);

  v28 = *(void **)(v0 + 200);
  if (v28)
    objc_msgSend(v28, sel_invalidate);
  *(_QWORD *)(v0 + 200) = v27;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  objc_msgSend(v20, sel_bounds);
  v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, v29, v30, v31, v32);
  objc_msgSend(v20, sel_addSubview_, v33);
  objc_msgSend(v33, sel_addSubview_, v5);
  v34 = *(void **)(v0 + 208);
  *(_QWORD *)(v0 + 208) = v33;
  v45 = v33;

  *(_QWORD *)(v0 + 216) = v47;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v35 = swift_allocObject();
  *(int64x2_t *)(v35 + 16) = vdupq_n_s64(0x43E0000000000000uLL);
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 24) = 0;
  *(_QWORD *)(v36 + 16) = 0;
  v37 = (_QWORD *)swift_allocObject();
  v37[2] = v47;
  v37[3] = v35;
  v37[4] = v36;
  aBlock[4] = sub_1CFBC6818;
  aBlock[5] = v37;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFBEAA70;
  aBlock[3] = &block_descriptor_39;
  v38 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_enumerateGridSizeClassesUsingBlock_, v38);
  _Block_release(v38);
  swift_beginAccess();
  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v35 + 16);
  *(_BYTE *)(v0 + 144) = 0;
  swift_beginAccess();
  *(_OWORD *)(v0 + 152) = *(_OWORD *)(v36 + 16);
  *(_BYTE *)(v0 + 168) = 0;
  objc_msgSend(v5, sel_setOverrideCustomIconImageViewController_, 0);
  v39 = objc_msgSend(v5, sel_customIconImageViewController);
  if (v39)
  {
    v40 = v39;
    objc_opt_self();
    v41 = (void *)swift_dynamicCastObjCClass();
    if (!v41)

  }
  else
  {
    v41 = 0;
  }
  v42 = *(void **)(v0 + 192);
  *(_QWORD *)(v0 + 192) = v41;
  v43 = v41;

  if (v41)
  {
    objc_msgSend(v43, sel_setResizing_, 1);

    objc_msgSend(v43, sel_setMinResizeDimensions_, *(double *)(v35 + 16), *(double *)(v35 + 24));
    objc_msgSend(v43, sel_setMaxResizeDimensions_, *(double *)(v36 + 16), *(double *)(v36 + 24));
    v44 = v43;
    objc_msgSend(v44, sel_setSuppressesCompactContinuousCornerRadiusUpdates_, 1);
    swift_release();
    swift_release();

  }
  else
  {
    swift_release();
    swift_release();
    v44 = v46;
  }

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

void sub_1CFBC6464()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void (*v23)(_QWORD *);
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t aBlock;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  void *v44;
  void *v45;
  _QWORD *v46;

  if ((*(_BYTE *)(v0 + 120) & 1) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v1 = (_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(double *)(v0 + 104);
  v4 = *(double *)(v0 + 88);
  v5 = *(void **)(v0 + 16);
  v6 = objc_msgSend(*(id *)(v0 + 24), sel__shouldReverseLayoutDirection);
  objc_msgSend(v5, sel_iconImageInfo);
  v11 = *(void **)(v0 + 200);
  if (!v11)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v16 = objc_msgSend(v11, sel_gridSizeClass);
  if (v16)
  {
    if (!*(_QWORD *)(v0 + 216))
    {
LABEL_20:
      __break(1u);
      return;
    }
    v17 = v16;
    swift_unknownObjectRetain();
    SBHIconListLayoutIconImageInfoForGridSizeClass();
    v12 = v18;
    v13 = v19;
    swift_unknownObjectRelease();

  }
  v20 = (void *)v1[25];
  if (!v20)
    goto LABEL_18;
  v21 = objc_msgSend(v20, sel_gridSizeClass);
  if (!v21)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v22 = v21;
  v40 = v1[28];
  objc_msgSend(v5, sel_setAllowsCloseBox_, 1);
  v23 = (void (*)(_QWORD *))v1[7];
  if (v23)
  {
    swift_retain();
    v23(v1);
    sub_1CFBB8538((uint64_t)v23);
  }
  v24 = (void *)v1[24];
  v25 = (void *)objc_opt_self();
  v26 = qword_1EFBEFE48;
  v27 = v24;
  if (v26 != -1)
    swift_once();
  if (v6)
    v28 = v3 + v4 - v12;
  else
    v28 = v4;
  v29 = objc_msgSend((id)qword_1EFBF0C60, sel_animationSettings);
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v24;
  *(_QWORD *)(v30 + 24) = v22;
  *(_QWORD *)(v30 + 32) = v5;
  *(double *)(v30 + 40) = v12;
  *(_QWORD *)(v30 + 48) = v13;
  *(_QWORD *)(v30 + 56) = v14;
  *(_QWORD *)(v30 + 64) = v15;
  *(double *)(v30 + 72) = v28;
  *(_QWORD *)(v30 + 80) = v2;
  *(double *)(v30 + 88) = v12;
  *(_QWORD *)(v30 + 96) = v13;
  v45 = sub_1CFBC6858;
  v46 = (_QWORD *)v30;
  v31 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v42 = 1107296256;
  v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1CFBCD038;
  v44 = &block_descriptor_45;
  v32 = _Block_copy(&aBlock);
  v33 = v27;
  v34 = v22;
  v35 = v5;
  swift_release();
  v36 = (_QWORD *)swift_allocObject();
  v36[2] = v40;
  v36[3] = v1;
  v36[4] = v24;
  v36[5] = v34;
  v45 = sub_1CFBC68A8;
  v46 = v36;
  aBlock = v31;
  v42 = 1107296256;
  v43 = sub_1CFBC50EC;
  v44 = &block_descriptor_51;
  v37 = _Block_copy(&aBlock);
  v38 = v33;
  v39 = v34;
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_sb_animateWithSettings_mode_animations_completion_, v29, 3, v32, v37);
  _Block_release(v37);
  _Block_release(v32);

}

unint64_t sub_1CFBC678C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED90AE00;
  if (!qword_1ED90AE00)
  {
    type metadata accessor for SBHIconGridSizeClass(255);
    result = MEMORY[0x1D17DBC58](&unk_1CFC0170C, v1);
    atomic_store(result, (unint64_t *)&qword_1ED90AE00);
  }
  return result;
}

uint64_t sub_1CFBC67D4()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBC67E4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBC6818(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1CFBC4278(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1CFBC6824()
{
  id *v0;

  return swift_deallocObject();
}

id sub_1CFBC6858()
{
  uint64_t v0;

  return sub_1CFBC4F2C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56), *(double *)(v0 + 64));
}

uint64_t sub_1CFBC6874()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_1CFBC68A8(int a1, int a2)
{
  uint64_t v2;

  return sub_1CFBC5034(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(id *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

INIntent_optional __swiftcall ControlIntentStorage.intent(bundleIdentifier:dataSourceIdentifier:)(Swift::String bundleIdentifier, Swift::String dataSourceIdentifier)
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  Swift::Bool v6;
  objc_class *v7;
  INIntent_optional result;

  v3 = (void *)sub_1CFBFA870();
  v4 = (void *)sub_1CFBFA870();
  v5 = (objc_class *)objc_msgSend(v2, sel_intentWithBundleIdentifier_dataSourceIdentifier_defaultIntentProvider_, v3, v4, 0);

  v7 = v5;
  result.value.super.isa = v7;
  result.is_nil = v6;
  return result;
}

void sub_1CFBC6958(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  id v16;
  char v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t inited;
  id v20;
  uint64_t v21;

  v11 = (uint64_t *)(v5 + OBJC_IVAR___CCUIControlIntentStore_localIntentsCache);
  swift_beginAccess();
  v12 = *v11;
  if (!*(_QWORD *)(*v11 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_1CFBBEE14(a2, a3);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0F78);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFC021B0;
    *(_QWORD *)(inited + 32) = a4;
    *(_QWORD *)(inited + 40) = a5;
    *(_QWORD *)(inited + 48) = a1;
    swift_bridgeObjectRetain();
    v20 = a1;
    v15 = sub_1CFBBB10C(inited);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v21 = *v11;
    *v11 = 0x8000000000000000;
    goto LABEL_6;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v16 = a1;
  v17 = swift_isUniquelyReferenced_nonNull_native();
  sub_1CFBCAF5C((uint64_t)v16, a4, a5, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v11;
  *v11 = 0x8000000000000000;
LABEL_6:
  sub_1CFBCAE00(v15, a2, a3, isUniquelyReferenced_nonNull_native);
  *v11 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1CFBCB620((uint64_t)a1, a2, a3, a4, a5);
}

void sub_1CFBC6C10(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  os_log_type_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a4)
  {
    v9 = (uint64_t *)(v4 + OBJC_IVAR___CCUIControlIntentStore_localIntentsCache);
    swift_beginAccess();
    v10 = *v9;
    v11 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    if (v11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = sub_1CFBBEE14(a1, a2);
      if ((v13 & 1) != 0)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v12);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v30 = v14;

        swift_bridgeObjectRelease();
        if (qword_1ED90AD00 != -1)
          swift_once();
        v15 = sub_1CFBFA7A4();
        __swift_project_value_buffer(v15, (uint64_t)qword_1ED90ACE0);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v16 = sub_1CFBFA78C();
        v17 = sub_1CFBFA9F0();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = swift_slowAlloc();
          v19 = swift_slowAlloc();
          v29 = v19;
          *(_DWORD *)v18 = 136315394;
          swift_bridgeObjectRetain();
          sub_1CFBC779C(a1, a2, &v29);
          sub_1CFBFABD0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v18 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_1CFBC779C(a3, a4, &v29);
          sub_1CFBFABD0();
          swift_bridgeObjectRelease_n();
          v20 = "Remove intent from local succeeded with bundle identifier:%s data source identifier:%s.";
LABEL_24:
          _os_log_impl(&dword_1CFB7D000, v16, v17, v20, (uint8_t *)v18, 0x16u);
          goto LABEL_25;
        }
LABEL_26:

        swift_bridgeObjectRelease_n();
LABEL_28:
        swift_bridgeObjectRelease_n();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_1ED90AD00 != -1)
      swift_once();
    v28 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v28, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v16 = sub_1CFBFA78C();
    v17 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v30 = v19;
      *(_DWORD *)v18 = 136315394;
      swift_bridgeObjectRetain();
      sub_1CFBC779C(a1, a2, &v30);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2080;
      swift_bridgeObjectRetain();
      v29 = sub_1CFBC779C(a3, a4, &v30);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      v20 = "Remove intent from local failed because no intents found with bundle identifier:%s data source identifier:%s.";
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  v21 = v4 + OBJC_IVAR___CCUIControlIntentStore_localIntentsCache;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v21 + 16)
    || (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_1CFBBEE14(a1, a2),
        v23 = v22,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v23 & 1) == 0))
  {
    if (qword_1ED90AD00 != -1)
      swift_once();
    v27 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v27, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    v16 = sub_1CFBFA78C();
    v25 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v16, v25))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v30 = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v29 = sub_1CFBC779C(a1, a2, &v30);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      v26 = "Remove all intents from local failed because no intents found with bundle identifier:%s.";
      goto LABEL_18;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (qword_1ED90AD00 != -1)
    swift_once();
  v24 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v24, (uint64_t)qword_1ED90ACE0);
  swift_bridgeObjectRetain_n();
  v16 = sub_1CFBFA78C();
  v25 = sub_1CFBFA9F0();
  if (!os_log_type_enabled(v16, v25))
    goto LABEL_27;
  v18 = swift_slowAlloc();
  v19 = swift_slowAlloc();
  v30 = v19;
  *(_DWORD *)v18 = 136315138;
  swift_bridgeObjectRetain();
  v29 = sub_1CFBC779C(a1, a2, &v30);
  sub_1CFBFABD0();
  swift_bridgeObjectRelease_n();
  v26 = "Remove all intents from local succeeded with bundle identifier:%s.";
LABEL_18:
  _os_log_impl(&dword_1CFB7D000, v16, v25, v26, (uint8_t *)v18, 0xCu);
LABEL_25:
  swift_arrayDestroy();
  MEMORY[0x1D17DBCE8](v19, -1, -1);
  MEMORY[0x1D17DBCE8](v18, -1, -1);

LABEL_29:
  sub_1CFBCBD7C(a1, a2, a3, a4);
}

void *sub_1CFBC7320(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v11 = (uint64_t *)(v5 + OBJC_IVAR___CCUIControlIntentStore_localIntentsCache);
  swift_beginAccess();
  v12 = *v11;
  if (*(_QWORD *)(*v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = sub_1CFBBEE14(a1, a2);
    if ((v14 & 1) != 0)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v13);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*(_QWORD *)(v15 + 16))
        goto LABEL_9;
      swift_bridgeObjectRetain();
      v16 = sub_1CFBBEE14(a3, a4);
      if ((v17 & 1) != 0)
      {
        v18 = *(void **)(*(_QWORD *)(v15 + 56) + 8 * v16);
        v19 = v18;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v18;
      }
    }
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
  }
  sub_1CFBCC2F8(a1, a2, a3, a4);
  v18 = v20;
  if (!v20)
  {
    if (a5)
    {
      v21 = swift_retain();
      v22 = (void *)a5(v21);
      v18 = v22;
      if (v22)
        sub_1CFBC6958(v22, a1, a2, a3, a4);
      sub_1CFBB8538((uint64_t)a5);
    }
    else
    {
      return 0;
    }
  }
  return v18;
}

void sub_1CFBC75A4()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_1ED90AD00 != -1)
    swift_once();
  v0 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90ACE0);
  oslog = sub_1CFBFA78C();
  v1 = sub_1CFBFA9F0();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1CFB7D000, oslog, v1, "Control intent store is synchronized.", v2, 2u);
    MEMORY[0x1D17DBCE8](v2, -1, -1);
  }

}

id ControlIntentStore.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ControlIntentStore.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR___CCUIControlIntentStore_localIntentsCache;
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_1CFBBB224(MEMORY[0x1E0DEE9D8]);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for ControlIntentStore();
  return objc_msgSendSuper2(&v4, sel_init);
}

id ControlIntentStore.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlIntentStore();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CFBC779C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1CFBC786C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1CFBC1384((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1CFBC1384((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1CFBC786C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1CFBFABDC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1CFBC7A24(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1CFBFACE4();
  if (!v8)
  {
    sub_1CFBFAD08();
    __break(1u);
LABEL_17:
    result = sub_1CFBFAD5C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1CFBC7A24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1CFBC7AB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CFBC7C90(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1CFBC7C90(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CFBC7AB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1CFBC7C2C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1CFBFACC0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1CFBFAD08();
      __break(1u);
LABEL_10:
      v2 = sub_1CFBFA8D0();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1CFBFAD5C();
    __break(1u);
LABEL_14:
    result = sub_1CFBFAD08();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1CFBC7C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0F80);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CFBC7C90(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF0F80);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

uint64_t sub_1CFBC7DDC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CFBBEE14(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 7;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CFBC9E24();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(unsigned __int8 *)(*(_QWORD *)(v9 + 56) + v6);
  sub_1CFBC96B8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1CFBC7EA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CFBBEE14(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CFBCA4E4();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1CFBC988C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_1CFBC7F74@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1CFBBEE14(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1CFBCA694();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1CFBBFA58((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1CFBC9A60(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1CFBC8064(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1CFBBEF4C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CFBCA878();
    v7 = v10;
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_1CFBC9C34(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1CFBC8128(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEC8);
  v37 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CFBFADF8();
    sub_1CFBFA8AC();
    result = sub_1CFBFAE10();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC8430(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AEB8);
  v36 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v35 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_36;
        v19 = v35[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_36;
          v19 = v35[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v34)
            {
LABEL_36:
              swift_release();
              v3 = v2;
              if ((v36 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v35[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_43;
                if (v13 >= v34)
                  goto LABEL_36;
                v19 = v35[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = *(_QWORD *)(v5 + 48) + 24 * v17;
      v23 = *(_QWORD *)v21;
      v22 = *(_QWORD *)(v21 + 8);
      v24 = *(_BYTE *)(v21 + 16);
      v25 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v17);
      if ((v36 & 1) == 0)
        sub_1CFBBA3C8(*(_QWORD *)v21, *(_QWORD *)(v21 + 8), *(_BYTE *)(v21 + 16));
      sub_1CFBFADF8();
      sub_1CFBFAE04();
      if ((v24 & 1) != 0)
        sub_1CFBFA8AC();
      else
        sub_1CFBFAE04();
      result = sub_1CFBFAE10();
      v26 = -1 << *(_BYTE *)(v7 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v11 + 8 * v28);
        }
        while (v32 == -1);
        v14 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = *(_QWORD *)(v7 + 48) + 24 * v14;
      *(_QWORD *)v15 = v23;
      *(_QWORD *)(v15 + 8) = v22;
      *(_BYTE *)(v15 + 16) = v24;
      *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v14) = v25;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC8768(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A58);
  v37 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CFBFADF8();
    sub_1CFBFA8AC();
    result = sub_1CFBFAE10();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC8A70(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A48);
  v36 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1CFBFADF8();
    sub_1CFBFA8AC();
    result = sub_1CFBFAE10();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC8D84(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A50);
  v38 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1CFBFADF8();
    sub_1CFBFA8AC();
    result = sub_1CFBFAE10();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC9090(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0990);
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1CFBBFA58(v24, v35);
      }
      else
      {
        sub_1CFBC1384((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1CFBFADF8();
      sub_1CFBFA8AC();
      result = sub_1CFBFAE10();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1CFBBFA58(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CFBC938C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AED8);
  v39 = a2;
  v6 = sub_1CFBFAD44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    sub_1CFBFA894();
    sub_1CFBFADF8();
    sub_1CFBFA8AC();
    v14 = sub_1CFBFAE10();
    result = swift_bridgeObjectRelease();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1CFBC96B8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CFBFAC0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CFBFADF8();
        swift_bridgeObjectRetain();
        sub_1CFBFA8AC();
        v9 = sub_1CFBFAE10();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_BYTE *)(v14 + v3);
          v16 = (_BYTE *)(v14 + v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1CFBC988C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CFBFAC0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CFBFADF8();
        swift_bridgeObjectRetain();
        sub_1CFBFA8AC();
        v9 = sub_1CFBFAE10();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1CFBC9A60(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CFBFAC0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CFBFADF8();
        swift_bridgeObjectRetain();
        sub_1CFBFA8AC();
        v10 = sub_1CFBFAE10();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1CFBC9C34(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CFBFAC0C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_1CFBFA894();
        sub_1CFBFADF8();
        v10 = v9;
        sub_1CFBFA8AC();
        v11 = sub_1CFBFAE10();

        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1CFBC9E24()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEC8);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CFBC9FCC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AEB8);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    v21 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v21);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v22 = v18;
    *(_QWORD *)(v22 + 8) = v19;
    *(_BYTE *)(v22 + 16) = v20;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v21) = v17;
    result = (void *)sub_1CFBBA3C8(v18, v19, v20);
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CFBCA184()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A58);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CFBCA330()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A48);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1CFBCA4E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0A50);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CFBCA694()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0990);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1CFBC1384(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1CFBBFA58(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1CFBCA878()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AED8);
  v2 = *v0;
  v3 = sub_1CFBFAD38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CFBCAA1C(int a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  char v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  char v21;

  v6 = (_QWORD **)v5;
  v11 = a4 & 1;
  v12 = (_QWORD *)*v5;
  v14 = sub_1CFBBEE78(a2, a3, a4 & 1);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= result && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        *(_DWORD *)(v20[7] + 4 * v14) = a1;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= result && (a5 & 1) == 0)
    {
      result = (uint64_t)sub_1CFBC9FCC();
      goto LABEL_7;
    }
    sub_1CFBC8430(result, a5 & 1);
    result = sub_1CFBBEE78(a2, a3, v11);
    if ((v18 & 1) == (v21 & 1))
    {
      v14 = result;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CFBCB338(v14, a2, a3, v11, a1, v20);
      return sub_1CFBBA3C8(a2, a3, v11);
    }
  }
  result = sub_1CFBFADBC();
  __break(1u);
  return result;
}

uint64_t sub_1CFBCAB60(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CFBBEE14(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1CFBC9E24();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CFBC8128(result, a4 & 1);
  result = sub_1CFBBEE14(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CFBFADBC();
  __break(1u);
  return result;
}

uint64_t sub_1CFBCACB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CFBBEE14(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1CFBCA184();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CFBC8768(result, a4 & 1);
  result = sub_1CFBBEE14(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CFBFADBC();
  __break(1u);
  return result;
}

uint64_t sub_1CFBCAE00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CFBBEE14(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1CFBCA330();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CFBC8A70(v15, a4 & 1);
  v21 = sub_1CFBBEE14(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CFBFADBC();
  __break(1u);
  return result;
}

void sub_1CFBCAF5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CFBBEE14(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1CFBCA4E4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1CFBC8D84(v15, a4 & 1);
  v20 = sub_1CFBBEE14(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1CFBFADBC();
  __break(1u);
}

_OWORD *sub_1CFBCB0B8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1CFBBEE14(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_1CFBBFA58(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1CFBCA694();
      goto LABEL_7;
    }
    sub_1CFBC9090(v15, a4 & 1);
    v21 = sub_1CFBBEE14(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CFBCB38C(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1CFBFADBC();
  __break(1u);
  return result;
}

void sub_1CFBCB1E8(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1CFBBEF4C(a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1CFBCA878();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_1CFBC938C(v12, a3 & 1);
  v17 = sub_1CFBBEF4C(a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for SBHIconGridSizeClass(0);
  sub_1CFBFADBC();
  __break(1u);
}

unint64_t sub_1CFBCB338(unint64_t result, uint64_t a2, uint64_t a3, char a4, int a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = a6[6] + 24 * result;
  *(_QWORD *)v6 = a2;
  *(_QWORD *)(v6 + 8) = a3;
  *(_BYTE *)(v6 + 16) = a4 & 1;
  *(_DWORD *)(a6[7] + 4 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

_OWORD *sub_1CFBCB38C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1CFBBFA58(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

id sub_1CFBCB3F4(uint64_t a1, unint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13[2];

  v13[0] = a1;
  v13[1] = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AE58);
  swift_dynamicCast();
  v4 = objc_msgSend((id)objc_opt_self(), sel_storeForApplicationIdentifier_, v12);
  if (v4)
  {
    v5 = v4;
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_1ED90AD00 != -1)
      swift_once();
    v6 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    v7 = sub_1CFBFA78C();
    v8 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v13[0] = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_1CFBC779C(a1, a2, v13);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v7, v8, "Failed to load data store for bundle identifier:%s.", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v10, -1, -1);
      MEMORY[0x1D17DBCE8](v9, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    return 0;
  }
  return v5;
}

void sub_1CFBCB620(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _DWORD *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v10 = sub_1CFBCB3F4(a2, a3);
  if (!v10)
  {
    if (qword_1ED90AD00 != -1)
      swift_once();
    v23 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v23, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    v24 = sub_1CFBFA78C();
    v25 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      aBlock[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      sub_1CFBC779C(a2, a3, (uint64_t *)aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v24, v25, "Save intent to data store failed because no data store found for bundle identifier:%s.", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v27, -1, -1);
      MEMORY[0x1D17DBCE8](v26, -1, -1);

      return;
    }

LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  v11 = v10;
  aBlock[0] = 0;
  v12 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, aBlock);
  v13 = aBlock[0];
  if (!v12)
  {
    v28 = v13;
    v29 = (void *)sub_1CFBFA5E8();

    swift_willThrow();
    if (qword_1ED90AD00 != -1)
      swift_once();
    v30 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v30, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v31 = sub_1CFBFA78C();
    v32 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      aBlock[0] = v34;
      *(_DWORD *)v33 = 136315394;
      swift_bridgeObjectRetain();
      sub_1CFBC779C(a2, a3, (uint64_t *)aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1CFBC779C(a4, a5, (uint64_t *)aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v31, v32, "Save intent to data store failed because cannot archive intent for bundle identifier:%s data source identifier:%s.", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v34, -1, -1);
      MEMORY[0x1D17DBCE8](v33, -1, -1);

      return;
    }

    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v14 = sub_1CFBFA678();
  v16 = v15;

  v17 = (void *)sub_1CFBFA66C();
  v18 = (void *)sub_1CFBFA870();
  objc_msgSend(v11, sel_setObject_forKey_, v17, v18);

  if (qword_1ED90AD00 != -1)
    swift_once();
  v19 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v19, (uint64_t)qword_1ED90ACE0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_1CFBCCE9C(v14, v16);
  v20 = sub_1CFBFA78C();
  v21 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (_DWORD *)swift_slowAlloc();
    aBlock[0] = (id)swift_slowAlloc();
    *v22 = 134218498;
    __asm { BR              X10 }
  }
  sub_1CFBCCE3C(v14, v16);
  sub_1CFBCCE3C(v14, v16);

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  v35 = (void *)objc_opt_self();
  aBlock[4] = sub_1CFBC75A4;
  aBlock[5] = 0;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1CFBCD038;
  aBlock[3] = &block_descriptor_4;
  v36 = _Block_copy(aBlock);
  objc_msgSend(v35, sel_synchronizeWithCompletion_, v36);
  _Block_release(v36);

}

void sub_1CFBCBD7C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t aBlock[6];
  uint64_t v29;

  v8 = sub_1CFBCB3F4(a1, a2);
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      swift_bridgeObjectRetain();
      v10 = (void *)sub_1CFBFA870();
      objc_msgSend(v9, sel_removeObjectForKey_, v10);

      if (qword_1ED90AD00 != -1)
        swift_once();
      v11 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v11, (uint64_t)qword_1ED90ACE0);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v12 = sub_1CFBFA78C();
      v13 = sub_1CFBFA9F0();
      if (!os_log_type_enabled(v12, v13))
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
LABEL_20:
        v26 = (void *)objc_opt_self();
        aBlock[4] = (uint64_t)sub_1CFBC75A4;
        aBlock[5] = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1CFBCD038;
        aBlock[3] = (uint64_t)&block_descriptor_6;
        v27 = _Block_copy(aBlock);
        objc_msgSend(v26, sel_synchronizeWithCompletion_, v27);
        _Block_release(v27);
        return;
      }
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      aBlock[0] = v15;
      *(_DWORD *)v14 = 136315394;
      swift_bridgeObjectRetain();
      v29 = sub_1CFBC779C(a1, a2, aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      v29 = sub_1CFBC779C(a3, a4, aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v12, v13, "Remove intent from data store succeeded with bundle identifier:%s data source identifier:%s.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v15, -1, -1);
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, sel_removeAllObjects);
      if (qword_1ED90AD00 != -1)
        swift_once();
      v22 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v22, (uint64_t)qword_1ED90ACE0);
      swift_bridgeObjectRetain_n();
      v12 = sub_1CFBFA78C();
      v23 = sub_1CFBFA9F0();
      if (!os_log_type_enabled(v12, v23))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_19;
      }
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      aBlock[0] = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      v29 = sub_1CFBC779C(a1, a2, aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v12, v23, "Remove all intents from data store succeeded with bundle identifier:%s.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v25, -1, -1);
      v16 = (uint64_t)v24;
    }
    MEMORY[0x1D17DBCE8](v16, -1, -1);

LABEL_19:
    goto LABEL_20;
  }
  if (qword_1ED90AD00 != -1)
    swift_once();
  v17 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ED90ACE0);
  swift_bridgeObjectRetain_n();
  v18 = sub_1CFBFA78C();
  v19 = sub_1CFBFA9D8();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    v29 = sub_1CFBC779C(a1, a2, aBlock);
    sub_1CFBFABD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CFB7D000, v18, v19, "Remove intent from data store failed because no data store found for bundle identifier:%s.", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v21, -1, -1);
    MEMORY[0x1D17DBCE8](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_1CFBCC2F8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  os_log_type_t v54;
  NSObject *v55;
  NSObject *log;
  os_log_t loga;
  uint64_t v58;
  void *v59;
  _OWORD v60[2];
  uint64_t v61[4];

  v8 = sub_1CFBCB3F4(a1, a2);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)sub_1CFBFA870();
    sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90AE60);
    v11 = objc_msgSend(v9, sel_safeObjectForKey_ofType_, v10, swift_getObjCClassFromMetadata());

    if (v11)
    {
      sub_1CFBFABE8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v60, 0, sizeof(v60));
    }
    sub_1CFBCCDB4((uint64_t)v60, (uint64_t)v61);
    if (v61[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v58 = a3;
        v17 = v59;
        sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADC0);
        sub_1CFBBAA24(0, &qword_1ED90AE80);
        v18 = MEMORY[0x1D17DA914]();
        v20 = v19;
        v38 = sub_1CFBFAA20();
        sub_1CFBCCE3C(v18, v20);
        if (v38)
        {
          if (qword_1ED90AD00 == -1)
            goto LABEL_32;
          goto LABEL_43;
        }
        if (qword_1ED90AD00 != -1)
          swift_once();
        v21 = sub_1CFBFA7A4();
        __swift_project_value_buffer(v21, (uint64_t)qword_1ED90ACE0);
        v22 = v59;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v23 = v22;
        v24 = sub_1CFBFA78C();
        v25 = sub_1CFBFA9D8();
        if (!os_log_type_enabled(v24, v25))
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();

          return;
        }
        v54 = v25;
        log = v24;
        v26 = swift_slowAlloc();
        v52 = swift_slowAlloc();
        v61[0] = v52;
        *(_DWORD *)v26 = 134218498;
        v27 = v23;
        v28 = sub_1CFBFAAD4();
        v29 = sub_1CFBFAAE0();
        v30 = sub_1CFBFAAD4();
        v31 = sub_1CFBFAAE0();
        if (v28 < v30 || v31 < v28)
        {
          __break(1u);
        }
        else
        {
          v17 = (void *)sub_1CFBFAAD4();
          v32 = sub_1CFBFAAE0();

          if (v29 >= (uint64_t)v17 && v32 >= v29)
          {
            if (!__OFSUB__(v29, v28))
            {
              *(_QWORD *)&v60[0] = v29 - v28;
              sub_1CFBFABD0();

              *(_WORD *)(v26 + 12) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v60[0] = sub_1CFBC779C(a1, a2, v61);
              sub_1CFBFABD0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v26 + 22) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v60[0] = sub_1CFBC779C(v58, a4, v61);
              sub_1CFBFABD0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_1CFB7D000, log, v54, "Fetch intent %ld bytes from data store failed because cannot unarchive data with bundle identifier:%s data source identifier:%s.", (uint8_t *)v26, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x1D17DBCE8](v52, -1, -1);
              MEMORY[0x1D17DBCE8](v26, -1, -1);

              return;
            }
            goto LABEL_42;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        swift_once();
LABEL_32:
        v39 = sub_1CFBFA7A4();
        __swift_project_value_buffer(v39, (uint64_t)qword_1ED90ACE0);
        v40 = v17;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v41 = v40;
        v42 = sub_1CFBFA78C();
        v43 = sub_1CFBFA9F0();
        if (!os_log_type_enabled(v42, v43))
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();

          return;
        }
        v53 = v43;
        v55 = v42;
        v44 = swift_slowAlloc();
        v51 = swift_slowAlloc();
        v61[0] = v51;
        *(_DWORD *)v44 = 134218498;
        v45 = v41;
        v46 = sub_1CFBFAAD4();
        v47 = sub_1CFBFAAE0();
        v48 = sub_1CFBFAAD4();
        v49 = sub_1CFBFAAE0();
        if (v46 < v48 || v49 < v46)
        {
          __break(1u);
        }
        else
        {
          loga = (os_log_t)sub_1CFBFAAD4();
          v50 = sub_1CFBFAAE0();

          if (v47 >= (uint64_t)loga && v50 >= v47)
          {
            if (!__OFSUB__(v47, v46))
            {
              *(_QWORD *)&v60[0] = v47 - v46;
              sub_1CFBFABD0();

              *(_WORD *)(v44 + 12) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v60[0] = sub_1CFBC779C(a1, a2, v61);
              sub_1CFBFABD0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v44 + 22) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v60[0] = sub_1CFBC779C(v58, a4, v61);
              sub_1CFBFABD0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_1CFB7D000, v55, v53, "Fetch intent %ld bytes from data store succeeded with bundle identifier:%s data source identifier:%s.", (uint8_t *)v44, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x1D17DBCE8](v51, -1, -1);
              MEMORY[0x1D17DBCE8](v44, -1, -1);

              return;
            }
            goto LABEL_46;
          }
        }
        __break(1u);
LABEL_46:
        __break(1u);
        return;
      }
    }
    else
    {
      sub_1CFBCCDFC((uint64_t)v61);
    }
    if (qword_1ED90AD00 != -1)
      swift_once();
    v33 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v33, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v34 = sub_1CFBFA78C();
    v35 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v61[0] = v37;
      *(_DWORD *)v36 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v60[0] = sub_1CFBC779C(a1, a2, v61);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v60[0] = sub_1CFBC779C(a3, a4, v61);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v34, v35, "Fetch intent from data store failed because no intent data found with bundle identifier:%s data source identifier:%s.", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v37, -1, -1);
      MEMORY[0x1D17DBCE8](v36, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

  }
  else
  {
    if (qword_1ED90AD00 != -1)
      swift_once();
    v12 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED90ACE0);
    swift_bridgeObjectRetain_n();
    v13 = sub_1CFBFA78C();
    v14 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v61[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v60[0] = sub_1CFBC779C(a1, a2, v61);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CFB7D000, v13, v14, "Fetch intent from data store failed because no data store found with bundle identifier:%s.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v16, -1, -1);
      MEMORY[0x1D17DBCE8](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t type metadata accessor for ControlIntentStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for ControlIntentStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ControlIntentStore.storeIntent(_:bundleIdentifier:dataSourceIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ControlIntentStore.deleteIntent(bundleIdentifier:dataSourceIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ControlIntentStore.intent(bundleIdentifier:dataSourceIdentifier:defaultIntentProvider:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t sub_1CFBCCD70()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id sub_1CFBCCD94()
{
  uint64_t v0;

  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1CFBCCDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CFBCCDFC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AF00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFBCCE3C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_1CFBCCE9C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1CFBCCEE8(void *a1, unint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  unsigned int v8;
  id v10;
  unsigned int v11;
  uint64_t result;

  v4 = objc_msgSend(a1, sel_gridSizeForCurrentOrientation);
  v5 = (unsigned __int16)v4;
  v6 = HIWORD(v4);
  v7 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  v8 = objc_msgSend(a1, sel_iconGridSizeForClass_, v7);

  if (v6 >= HIWORD(v8) && v5 >= (unsigned __int16)v8)
    return a2;
  if (a2 < 0xB)
  {
    v10 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    v11 = objc_msgSend(a1, sel_iconGridSizeForClass_, v10);
    if (v6 >= HIWORD(v11) && v5 >= (unsigned __int16)v11)
      a2 = qword_1CFC02200[a2];
    else
      a2 = 0;

    return a2;
  }
  result = sub_1CFBFAD14();
  __break(1u);
  return result;
}

void sub_1CFBCD03C(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  void *v18;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v17 = 0;
    v1 = 0;
    v2 = 0;
    v3 = sub_1CFBFACF0() | 0x8000000000000000;
  }
  else
  {
    v4 = -1 << *(_BYTE *)(a1 + 32);
    v1 = ~v4;
    v17 = a1 + 64;
    v5 = -v4;
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v2 = v6 & *(_QWORD *)(a1 + 64);
    v3 = a1;
  }
  swift_bridgeObjectRetain();
  v7 = 0;
  v16 = (unint64_t)(v1 + 64) >> 6;
  while (1)
  {
    v12 = v7;
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!sub_1CFBFACFC())
      goto LABEL_31;
    swift_unknownObjectRelease();
    sub_1CFBBAA24(0, &qword_1EFBF1778);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v18;
    swift_unknownObjectRelease();
    if (!v18)
      goto LABEL_31;
LABEL_10:
    v11 = objc_msgSend(v10, sel_isConfigurable);

    if (v11)
      goto LABEL_31;
  }
  if (v2)
  {
    v8 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    v9 = v8 | (v7 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v3 + 56) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v13 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v13 >= v16)
      goto LABEL_31;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v7;
    if (!v14)
    {
      v7 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_31;
      v14 = *(_QWORD *)(v17 + 8 * v7);
      if (!v14)
      {
        v7 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_31;
        v14 = *(_QWORD *)(v17 + 8 * v7);
        if (!v14)
        {
          v7 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_31;
          v14 = *(_QWORD *)(v17 + 8 * v7);
          if (!v14)
          {
            v7 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_31;
            v14 = *(_QWORD *)(v17 + 8 * v7);
            if (!v14)
            {
              v15 = v12 + 6;
              while (v16 != v15)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v7 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_1CFBE7A6C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v2 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_1CFBCD2E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_1CFBCD300(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

char *PagingViewController.__allocating_init(moduleInstanceManager:moduleSettingsManager:controlIntentStore:controlDescriptorProvider:controlExtensionProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  id v11;
  char *v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_1CFBE3994(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v12;
}

char *PagingViewController.init(moduleInstanceManager:moduleSettingsManager:controlIntentStore:controlDescriptorProvider:controlExtensionProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char *v6;

  v6 = sub_1CFBE3994(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v6;
}

uint64_t sub_1CFBCD40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_1CFBFA954();
  *(_QWORD *)(v4 + 24) = sub_1CFBFA948();
  sub_1CFBFA93C();
  return swift_task_switch();
}

uint64_t sub_1CFBCD478()
{
  uint64_t v0;

  swift_release();
  sub_1CFBDA9B8(1, 0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFBCD4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CFBFA96C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CFBFA960();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CFBE7CCC(a1, &qword_1ED90AF08);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CFBFA93C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id PagingViewController.__deallocating_deinit()
{
  char *v0;
  void *v1;
  void *v2;
  id result;
  objc_super v4;

  sub_1CFBD487C();
  v2 = v1;
  objc_msgSend(v1, sel_removeKeyObserver_, v0);

  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription];
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    v4.receiver = v0;
    v4.super_class = (Class)type metadata accessor for PagingViewController();
    return objc_msgSendSuper2(&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CFBCDA40()
{
  return sub_1CFBCEAF4(&OBJC_IVAR___CCUIPagingViewController_pagingDelegate);
}

uint64_t sub_1CFBCDB88()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  if (qword_1ED90AFE0 != -1)
    swift_once();
  v0 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90AFC0);
  v1 = sub_1CFBFA78C();
  v2 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CFB7D000, v1, v2, "Check for invalid control icon elements.", v3, 2u);
    MEMORY[0x1D17DBCE8](v3, -1, -1);
  }

  sub_1CFBD86DC();
  sub_1CFBD90B0();
  sub_1CFBD9B30();
  return swift_unknownObjectRelease();
}

uint64_t sub_1CFBCDCB0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v0 = qword_1ED90AFE0;
  swift_unknownObjectRetain();
  if (v0 != -1)
    swift_once();
  v1 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED90AFC0);
  v2 = sub_1CFBFA78C();
  v3 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFB7D000, v2, v3, "Check for invalid control icon elements.", v4, 2u);
    MEMORY[0x1D17DBCE8](v4, -1, -1);
  }

  sub_1CFBD86DC();
  sub_1CFBD90B0();
  sub_1CFBD9B30();
  return swift_unknownObjectRelease();
}

void (*sub_1CFBCDDE0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1D17DBD84](v5);
  return sub_1CFBCDE50;
}

void sub_1CFBCDE50(void **a1, char a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v4 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED90AFC0);
    v5 = sub_1CFBFA78C();
    v6 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CFB7D000, v5, v6, "Check for invalid control icon elements.", v7, 2u);
      MEMORY[0x1D17DBCE8](v7, -1, -1);
    }

    sub_1CFBD86DC();
    sub_1CFBD90B0();
    sub_1CFBD9B30();
  }
  free(v3);
}

uint64_t sub_1CFBCDF80()
{
  swift_dynamicCastObjCProtocolUnconditional();
  return swift_unknownObjectWeakAssign();
}

id sub_1CFBCE0D4()
{
  char *v0;
  id result;
  id v2;
  id v3;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v2 = objc_msgSend(result, sel_folderView);
    v3 = objc_msgSend(v2, sel_scrollView);

    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBCE154()
{
  return sub_1CFBCF304((SEL *)&selRef_pageControl);
}

id sub_1CFBCE1B0()
{
  char *v0;
  id result;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController_addButton];
  if (result)
    return result;
  __break(1u);
  return result;
}

id sub_1CFBCE23C()
{
  char *v0;
  id result;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
    return objc_msgSend(result, sel_iconListViewCount);
  __break(1u);
  return result;
}

void sub_1CFBCE2F4()
{
  char *v0;
  void *v1;
  id v2;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_folderView);
    sub_1CFBEC974();

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBCE400()
{
  char *v0;
  void *v1;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v1)

  else
    __break(1u);
}

void sub_1CFBCE4E8(float64_t a1, float64_t a2, float64_t a3, float64_t a4)
{
  char *v4;
  void *v9;
  char *v10;
  float64x2_t *v11;
  double *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  objc_msgSend(v4, sel_loadViewIfNeeded);
  v9 = *(void **)&v4[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v9)
  {
    v10 = (char *)objc_msgSend(v9, sel_folderView);
    v11 = (float64x2_t *)&v10[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];
    v12 = (double *)&v10[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 24];
    v17 = *(double *)&v10[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 8];
    v18 = *(double *)&v10[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];
    v19 = *(double *)&v10[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16];
    v16 = *v12;
    v11->f64[0] = a1;
    v11->f64[1] = a2;
    v11[1].f64[0] = a3;
    v11[1].f64[1] = a4;
    v20 = v10;
    sub_1CFBECB8C(v18, v17, v19, v16);
    v13.f64[0] = v11[1].f64[0];
    v13.f64[1] = v16;
    v14.f64[0] = v18;
    v14.f64[1] = v17;
    v15.f64[0] = v19;
    v15.f64[1] = *v12;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v11, v14), (int32x4_t)vceqq_f64(v13, v15))), 0xFuLL))) & 1) == 0)sub_1CFBE96E4();

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBCE5F4(id *a1@<X0>, _OWORD *a2@<X8>)
{
  char *v3;
  void *v4;
  char *v5;
  __int128 v6;
  __int128 v7;

  v3 = (char *)*a1;
  objc_msgSend(*a1, sel_loadViewIfNeeded);
  v4 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = (char *)objc_msgSend(v4, sel_folderView);
    v6 = *(_OWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16];
    v7 = *(_OWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];

    *a2 = v7;
    a2[1] = v6;
  }
  else
  {
    __break(1u);
  }
}

void (*sub_1CFBCE680(_QWORD *a1))(float64_t **a1)
{
  char *v1;
  _QWORD *v3;
  void (*result)(float64_t **);
  char *v5;
  __int128 v6;
  __int128 v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(void (**)(float64_t **))&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v5 = (char *)objc_msgSend(result, sel_folderView);
    v6 = *(_OWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16];
    v7 = *(_OWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];

    *(_OWORD *)v3 = v7;
    *((_OWORD *)v3 + 1) = v6;
    return sub_1CFBCE730;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CFBCE730(float64_t **a1)
{
  float64_t *v1;

  v1 = *a1;
  sub_1CFBCE4E8(**a1, (*a1)[1], (*a1)[2], (*a1)[3]);
  free(v1);
}

void sub_1CFBCE7E4()
{
  char *v0;
  void *v1;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v1)

  else
    __break(1u);
}

void sub_1CFBCE8A0(double a1, double a2)
{
  char *v2;
  void *v5;
  char *v6;
  double *v7;
  double v8;
  double v9;
  BOOL v10;
  char *v12;

  objc_msgSend(v2, sel_loadViewIfNeeded);
  v5 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v5)
  {
    v6 = (char *)objc_msgSend(v5, sel_folderView);
    v7 = (double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
    v8 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
    v9 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset + 8];
    *v7 = a1;
    v7[1] = a2;
    v10 = v8 == a1 && v9 == a2;
    v12 = v6;
    if (!v10)
    {
      objc_msgSend(v6, sel__updateIconListFrames);
      v6 = v12;
      a1 = *v7;
      a2 = v7[1];
    }
    if (v8 != a1 || v9 != a2)
    {
      sub_1CFBE96E4();
      v6 = v12;
    }

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBCE968(id *a1@<X0>, _OWORD *a2@<X8>)
{
  char *v3;
  void *v4;
  char *v5;
  __int128 v6;

  v3 = (char *)*a1;
  objc_msgSend(*a1, sel_loadViewIfNeeded);
  v4 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = (char *)objc_msgSend(v4, sel_folderView);
    v6 = *(_OWORD *)&v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];

    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
}

void (*sub_1CFBCE9E8(uint64_t a1))(double *a1)
{
  char *v1;
  void (*result)(double *);
  char *v4;
  __int128 v5;

  *(_QWORD *)(a1 + 16) = v1;
  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(void (**)(double *))&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v4 = (char *)objc_msgSend(result, sel_folderView);
    v5 = *(_OWORD *)&v4[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];

    *(_OWORD *)a1 = v5;
    return sub_1CFBCEA74;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CFBCEA74(double *a1)
{
  sub_1CFBCE8A0(*a1, a1[1]);
}

id sub_1CFBCEAA4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return (id)MEMORY[0x1D17DBD84](v3);
}

uint64_t sub_1CFBCEAE8()
{
  return sub_1CFBCEAF4(&OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer);
}

uint64_t sub_1CFBCEAF4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x1D17DBD84](v2);
}

void sub_1CFBCEBF4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  swift_beginAccess();
  v2 = swift_unknownObjectWeakAssign();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_1CFBD487C();
    v6 = v5;
    objc_msgSend(v5, sel_longPressToEditDuration);
    v8 = v7;

    objc_msgSend(v4, sel_setMinimumPressDuration_, v8);
    a1 = v4;
  }

}

void sub_1CFBCEC9C(void **a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v1 = *a1;
  swift_beginAccess();
  v2 = swift_unknownObjectWeakAssign();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v1;
    sub_1CFBD487C();
    v7 = v6;
    objc_msgSend(v6, sel_longPressToEditDuration);
    v9 = v8;

    objc_msgSend(v4, sel_setMinimumPressDuration_, v9);
  }
}

void (*sub_1CFBCED4C(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1D17DBD84](v5);
  return sub_1CFBCEDBC;
}

void sub_1CFBCEDBC(uint64_t *a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v3 = *a1;
  v4 = *(void **)(*a1 + 24);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 32) + *(_QWORD *)(v3 + 40);
    swift_endAccess();

    v6 = MEMORY[0x1D17DBD84](v5);
    if (v6)
    {
      v7 = (void *)v6;
      sub_1CFBD487C();
      v9 = v8;
      objc_msgSend(v8, sel_longPressToEditDuration);
      v11 = v10;

      objc_msgSend(v7, sel_setMinimumPressDuration_, v11);
    }
  }
  free((void *)v3);
}

uint64_t sub_1CFBCEEAC()
{
  char *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR___CCUIPagingViewController_expandedViewControllers], sel_allObjects);
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v2 = sub_1CFBFA900();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3 > 0 || (objc_msgSend(v0, sel_isEditing) & 1) != 0)
    return 1;
  v4 = (void *)MEMORY[0x1D17DBD84](&v0[OBJC_IVAR___CCUIPagingViewController_configuringIconView]);
  if (v4)
  {

    return 1;
  }
  result = (uint64_t)objc_msgSend(v0, sel_presentedViewController);
  if (result)
  {
    v6 = (void *)result;
    objc_opt_self();
    v7 = swift_dynamicCastObjCClass();

    if (v7)
    {
      result = (uint64_t)objc_msgSend(v0, sel_presentedViewController);
      if (result)
      {
        v8 = (void *)result;
        v9 = objc_msgSend((id)result, sel_isBeingDismissed);

        return v9 ^ 1;
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id sub_1CFBCF084()
{
  return sub_1CFBCF1A0((uint64_t (*)(void))sub_1CFBC2370);
}

id sub_1CFBCF090(void *a1, double a2, double a3)
{
  char *v3;
  id result;
  void *v8;
  id v9;
  char v10;

  result = objc_msgSend(v3, sel_loadViewIfNeeded);
  v8 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v8)
  {
    v9 = v8;
    v10 = sub_1CFBC2954(a1, a2, a3);

    return (id)(v10 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBCF194()
{
  return sub_1CFBCF1A0(sub_1CFBC2B04);
}

id sub_1CFBCF1A0(uint64_t (*a1)(void))
{
  char *v1;
  id result;
  void *v4;
  id v5;
  uint64_t v6;

  result = objc_msgSend(v1, sel_loadViewIfNeeded);
  v4 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = v4;
    v6 = a1();

    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBCF298(void *a1, uint64_t a2, SEL *a3)
{
  char *v4;
  id result;
  id v6;

  v4 = a1;
  objc_msgSend(v4, sel_loadViewIfNeeded);
  result = *(id *)&v4[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v6 = objc_msgSend(result, *a3);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBCF2F8()
{
  return sub_1CFBCF304((SEL *)&selRef_folderView);
}

id sub_1CFBCF304(SEL *a1)
{
  char *v1;
  id result;

  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(id *)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
    return objc_msgSend(result, *a1);
  __break(1u);
  return result;
}

void sub_1CFBCF350(char a1, void *a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  v4 = v3;
  objc_msgSend(v3, sel_loadViewIfNeeded);
  v8 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v9 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v9)
  {
    __break(1u);
    goto LABEL_7;
  }
  v10 = v9;
  objc_msgSend(v4, sel_loadViewIfNeeded);
  v11 = *(void **)&v4[v8];
  if (!v11)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v12 = objc_msgSend(v11, sel_defaultPageIndex);
  if (a2)
  {
    v13[4] = a2;
    v13[5] = a3;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 1107296256;
    v13[2] = sub_1CFBCD038;
    v13[3] = &block_descriptor_7;
    a2 = _Block_copy(v13);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v10, sel_setCurrentPageIndex_animated_completion_, v12, a1 & 1, a2);
  _Block_release(a2);

}

id sub_1CFBCF504()
{
  return sub_1CFBCF580((uint64_t)&unk_1E8CFE970, (uint64_t)sub_1CFBD7780, (uint64_t)sub_1CFBBA9A0, (uint64_t)&block_descriptor_3);
}

id sub_1CFBCF55C()
{
  return sub_1CFBCF580((uint64_t)&unk_1E8CFE9C0, (uint64_t)sub_1CFBD778C, (uint64_t)sub_1CFBBAC70, (uint64_t)&block_descriptor_10);
}

id sub_1CFBCF580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  id result;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  result = objc_msgSend(v4, sel_loadViewIfNeeded);
  v9 = *(void **)&v4[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = 0;
    v13[4] = a3;
    v13[5] = v10;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 1107296256;
    v13[2] = sub_1CFBCD300;
    v13[3] = a4;
    v11 = _Block_copy(v13);
    v12 = v9;
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_enumerateDisplayedIconViewsUsingBlock_, v11);

    _Block_release(v11);
    LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
    result = (id)swift_release();
    if ((v11 & 1) == 0)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1CFBCF6D4()
{
  char *v0;
  id result;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  result = objc_msgSend(v0, sel__appearState);
  if ((_DWORD)result == 2)
  {
    result = objc_msgSend(v0, sel_loadViewIfNeeded);
    v2 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    if (v2)
    {
      v3 = swift_allocObject();
      *(_QWORD *)(v3 + 16) = sub_1CFBD7798;
      *(_QWORD *)(v3 + 24) = 0;
      v6[4] = sub_1CFBBAC70;
      v6[5] = v3;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 1107296256;
      v6[2] = sub_1CFBCD300;
      v6[3] = &block_descriptor_17_0;
      v4 = _Block_copy(v6);
      v5 = v2;
      swift_retain();
      swift_release();
      objc_msgSend(v5, sel_enumerateDisplayedIconViewsUsingBlock_, v4);

      _Block_release(v4);
      LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
      result = (id)swift_release();
      if ((v4 & 1) == 0)
        return result;
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

id sub_1CFBCF8D0()
{
  char *v0;
  id result;
  void *v2;
  id v3;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    result = objc_msgSend(result, sel_currentIconListModel);
    if (result)
    {
      v2 = result;
      v3 = objc_msgSend(result, sel_numberOfUsedRows);

      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBCF940(uint64_t a1, uint64_t a2)
{
  char *v2;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD aBlock[6];
  uint64_t v11;

  v11 = 0;
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = &v11;
  result = objc_msgSend(v2, sel_loadViewIfNeeded);
  v4 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_1CFBE4060;
    *(_QWORD *)(v5 + 24) = v9;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1CFBE407C;
    *(_QWORD *)(v6 + 24) = v5;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_27;
    v7 = _Block_copy(aBlock);
    v8 = v4;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_enumerateDisplayedIconViewsUsingBlock_, v7);

    _Block_release(v7);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v7 & 1) == 0)
      return (id)v11;
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1CFBCFAB0(void *a1, _BYTE *a2, uint64_t a3, uint64_t a4, void **a5)
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  id v16;
  void *v17;

  v10 = objc_msgSend(a1, sel_moduleIdentifier);
  v11 = sub_1CFBFA894();
  v13 = v12;

  if (v11 == a3 && v13 == a4)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v15 = sub_1CFBFAD8C();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_8:
    v16 = objc_msgSend(a1, sel_view);
    v17 = *a5;
    *a5 = v16;

    *a2 = 1;
  }
}

uint64_t sub_1CFBCFCB4()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_allObjects));
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v2 = sub_1CFBFA900();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1CFBCFD64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  unint64_t v6;

  v5 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_allObjects));
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v6 = sub_1CFBFA900();

  swift_bridgeObjectRetain();
  LOBYTE(v5) = sub_1CFBE32E4(v6, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

id sub_1CFBCFEF4(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  id result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _QWORD aBlock[6];

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AF90);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1CFBFA6D8();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v16 = a1;
  v17 = a2;
  v18 = v7;
  result = objc_msgSend(v2, sel_loadViewIfNeeded);
  v10 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_1CFBE4094;
    *(_QWORD *)(v11 + 24) = v15;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_1CFBE8044;
    *(_QWORD *)(v12 + 24) = v11;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_38;
    v13 = _Block_copy(aBlock);
    v14 = v10;
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_enumerateDisplayedIconViewsUsingBlock_, v13);

    _Block_release(v13);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v13 & 1) == 0)
      return (id)sub_1CFBE7CCC((uint64_t)v7, (uint64_t *)&unk_1ED90AF90);
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1CFBD0120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  _QWORD aBlock[6];

  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  result = objc_msgSend(v3, sel_loadViewIfNeeded);
  v5 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1CFBE8050;
    *(_QWORD *)(v6 + 24) = v10;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = sub_1CFBE8044;
    *(_QWORD *)(v7 + 24) = v6;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_50;
    v8 = _Block_copy(aBlock);
    v9 = v5;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_enumerateDisplayedIconViewsUsingBlock_, v8);

    _Block_release(v8);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v8 & 1) == 0)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1CFBD0284(void *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  id result;
  id v26;
  id v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  id v32;

  v30 = a2;
  v31 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AF90);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CFBFA6D8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v16 = MEMORY[0x1E0C80A78](v15).n128_u64[0];
  v18 = (char *)&v29 - v17;
  v32 = a1;
  v19 = objc_msgSend(a1, sel_moduleIdentifier, v16);
  v20 = sub_1CFBFA894();
  v22 = v21;

  if (v20 == a3 && v22 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = sub_1CFBFAD8C();
    result = (id)swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
      return result;
  }
  sub_1CFBE7E08(v31, (uint64_t)v10, (uint64_t *)&unk_1ED90AF90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1CFBE7CCC((uint64_t)v10, (uint64_t *)&unk_1ED90AF90);
    result = objc_msgSend(v32, sel_expandModule);
    *v30 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v18, v10, v11);
    v26 = v32;
    v27 = objc_msgSend(v32, sel_uniqueIdentifier);
    sub_1CFBFA6C0();

    LOBYTE(v27) = sub_1CFBFA6B4();
    v28 = *(void (**)(char *, uint64_t))(v12 + 8);
    v28(v14, v11);
    if ((v27 & 1) != 0)
    {
      objc_msgSend(v26, sel_expandModule);
      *v30 = 1;
    }
    return (id)((uint64_t (*)(char *, uint64_t))v28)(v18, v11);
  }
  return result;
}

void sub_1CFBD05C4(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t isEscapingClosureAtFileLocation;
  const char *v5;
  double v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void (*v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  void (*v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v25;
  uint64_t v26;
  void *v27;
  void (*v28)(void *, uint64_t);
  char *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  int v38;
  uint64_t v39;
  char *v40;
  void (*v41)(void *, uint64_t);
  const char *v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v46;
  char *v47;
  __int128 v48;
  __int128 aBlock;
  void (*v50)(uint64_t, void *);
  void *v51;
  uint64_t (*v52)();
  char *v53;

  v3 = v2;
  v45 = a1;
  v46 = a2;
  isEscapingClosureAtFileLocation = sub_1CFBFA600();
  v5 = *(const char **)(isEscapingClosureAtFileLocation - 8);
  *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](isEscapingClosureAtFileLocation).n128_u64[0];
  v8 = (void (*)(void *, uint64_t))((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(v3, sel_loadViewIfNeeded, v6);
  v9 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v9)
  {
LABEL_33:
    __break(1u);
    return;
  }
  v10 = objc_msgSend(v9, sel_visibleIconListViews);
  sub_1CFBBAA24(0, &qword_1ED90AD78);
  v11 = sub_1CFBFA900();

  if (v11 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  v42 = v5;
  v43 = isEscapingClosureAtFileLocation;
  if (v12)
  {
    while (v12 >= 1)
    {
      v44 = v11 & 0xC000000000000001;
      v40 = v3;
      v41 = v8;
      if ((v11 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x1D17DAF80](0, v11);
      else
        v13 = *(id *)(v11 + 32);
      v14 = v13;
      v15 = (_QWORD *)swift_allocObject();
      v16 = v45;
      v15[2] = v14;
      v15[3] = v16;
      v15[4] = v46;
      v17 = v14;
      sub_1CFBB8538(0);
      v5 = (const char *)swift_allocObject();
      v8 = sub_1CFBE40E0;
      *((_QWORD *)v5 + 2) = sub_1CFBE40E0;
      *((_QWORD *)v5 + 3) = v15;
      v52 = sub_1CFBBAC70;
      v53 = (char *)v5;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v50 = sub_1CFBCD300;
      v51 = &block_descriptor_60;
      v18 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v17, sel_enumerateDisplayedIconViewsUsingBlock_, v18);

      _Block_release(v18);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
      {
        v19 = v12 - 1;
        if (v12 == 1)
        {
LABEL_16:
          swift_bridgeObjectRelease();
          v28 = sub_1CFBE40E0;
          v3 = v40;
          v8 = v41;
          goto LABEL_20;
        }
        v20 = 0;
        v5 = "";
        while (1)
        {
          v21 = v44 ? (id)MEMORY[0x1D17DAF80](v20 + 1, v11) : *(id *)(v11 + 8 * v20 + 40);
          v22 = v21;
          v23 = (_QWORD *)swift_allocObject();
          v24 = v45;
          v23[2] = v22;
          v23[3] = v24;
          v23[4] = v46;
          v25 = v22;
          sub_1CFBB8538((uint64_t)sub_1CFBE40E0);
          v26 = swift_allocObject();
          *(_QWORD *)(v26 + 16) = sub_1CFBE40E0;
          *(_QWORD *)(v26 + 24) = v23;
          v52 = sub_1CFBBAC70;
          v53 = (char *)v26;
          *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          v50 = sub_1CFBCD300;
          v51 = &block_descriptor_60;
          v27 = _Block_copy(&aBlock);
          v3 = v53;
          swift_retain();
          swift_release();
          objc_msgSend(v25, sel_enumerateDisplayedIconViewsUsingBlock_, v27);

          _Block_release(v27);
          isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if ((isEscapingClosureAtFileLocation & 1) != 0)
            break;
          if (v19 == ++v20)
            goto LABEL_16;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      v12 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      v42 = v5;
      v43 = isEscapingClosureAtFileLocation;
      if (!v12)
        goto LABEL_19;
    }
    __break(1u);
    goto LABEL_33;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  v28 = 0;
LABEL_20:
  v29 = *(char **)&v3[OBJC_IVAR___CCUIPagingViewController_controlDragWindow];
  if (v29)
  {
    v44 = (unint64_t)v28;
    v30 = *(void **)&v29[OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews];
    v40 = v29;
    v31 = objc_msgSend(v30, sel_objectEnumerator);
    sub_1CFBFA9B4();

    sub_1CFBFA5F4();
    while (v51)
    {
      sub_1CFBBFA58(&aBlock, &v48);
      type metadata accessor for ControlIconDragPreview();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v32 = v47;
        v33 = *(void **)&v47[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
        if (v33)
        {
          v34 = v33;
          v35 = objc_msgSend(v34, sel_icon);
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, sel_gridSizeClass);
            CCUIGridSizeClassForSBHIconGridSizeClass();

            LODWORD(v37) = CCUINumberOfColumnsForGridSizeClass();
            v38 = CCUINumberOfRowsForGridSizeClass();
            v45(v34, 1, 1, v37 | (v38 << 16));

          }
          else
          {

          }
        }
        else
        {

        }
      }
      sub_1CFBFA5F4();
    }
    (*((void (**)(_QWORD, uint64_t))v42 + 1))(v8, v43);

    v28 = (void (*)(void *, uint64_t))v44;
  }
  sub_1CFBB8538((uint64_t)v28);
}

void sub_1CFBD0B34(void *a1, uint64_t a2, void *a3, void (*a4)(void *, id, uint64_t, _QWORD))
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;

  v7 = objc_msgSend(a1, sel_icon);
  if (v7)
  {
    v13 = v7;
    v8 = objc_msgSend(a3, sel_coordinateForIcon_);
    v10 = v9;
    if ((sub_1CFBFAA08() & 1) == 0)
    {
      v11 = objc_msgSend(v13, sel_gridSizeClass);
      CCUIGridSizeClassForSBHIconGridSizeClass();

      LODWORD(v11) = CCUINumberOfColumnsForGridSizeClass();
      v12 = CCUINumberOfRowsForGridSizeClass();
      a4(a1, v8, v10, v11 | (v12 << 16));
    }

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBD0C6C(char a1, void *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t aBlock;
  uint64_t v20;
  uint64_t (*v21)();
  void *v22;
  void *v23;
  uint64_t v24;

  v7 = sub_1CFBFA7D4();
  v8 = objc_msgSend(*(id *)&v3[OBJC_IVAR___CCUIPagingViewController_expandedViewControllers], sel_allObjects, MEMORY[0x1E0C80A78](v7).n128_f64[0]);
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v9 = sub_1CFBFA900();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_3;
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
    {
LABEL_3:
      if (a2)
      {
        sub_1CFBBAA24(0, &qword_1ED90ADD0);
        swift_retain();
        v18 = (void *)sub_1CFBFAA50();
        v23 = a2;
        v24 = a3;
        aBlock = MEMORY[0x1E0C809B0];
        v20 = 1107296256;
        v21 = sub_1CFBCD038;
        v22 = &block_descriptor_63;
        v17 = _Block_copy(&aBlock);
        sub_1CFBB5C0C((unint64_t *)&qword_1EFBF0A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
        sub_1CFBE7C74((unint64_t *)&qword_1EFBF0A20, (uint64_t *)&unk_1EFBF1050);
        sub_1CFBFAC00();
        sub_1CFBFA810();
        swift_allocObject();
        sub_1CFBFA804();
        swift_release();
        sub_1CFBFAA2C();

        swift_release();
        sub_1CFBB8538((uint64_t)a2);
      }
      if (v10 < 1)
      {
        __break(1u);
      }
      else
      {
        swift_bridgeObjectRetain();
        for (i = 0; i != v10; ++i)
        {
          if ((v9 & 0xC000000000000001) != 0)
            v12 = (id)MEMORY[0x1D17DAF80](i, v9);
          else
            v12 = *(id *)(v9 + 8 * i + 32);
          v13 = v12;
          objc_msgSend(v12, sel_dismissExpandedModuleAnimated_, a1 & 1, v17);

        }
        swift_bridgeObjectRelease_n();
      }
      return;
    }
  }
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v3, sel_presentedViewController);
  if (v14)
  {
    v15 = v14;
    if (a2)
    {
      v23 = a2;
      v24 = a3;
      aBlock = MEMORY[0x1E0C809B0];
      v20 = 1107296256;
      v21 = sub_1CFBCD038;
      v22 = &block_descriptor_66;
      a2 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v15, sel_dismissViewControllerAnimated_completion_, a1 & 1, a2);
    _Block_release(a2);

  }
  else if (a2)
  {
    v16 = swift_retain();
    ((void (*)(uint64_t))a2)(v16);
    sub_1CFBB8538((uint64_t)a2);
  }
}

void sub_1CFBD101C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1CFBFAC24();
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    sub_1CFBE40FC(&qword_1EFBF1750, &qword_1ED90AE70);
    sub_1CFBFA99C();
    v1 = v20;
    v19 = v21;
    v2 = v22;
    v3 = v23;
    v4 = v24;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v19 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v18 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_1CFBFAC48())
      goto LABEL_34;
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v11 = v25;
    swift_unknownObjectRelease();
    v10 = v3;
    v8 = v4;
    if (!v11)
      goto LABEL_34;
LABEL_32:
    objc_opt_self();
    v15 = swift_dynamicCastObjCClass();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = v11;
      sub_1CFBBD7A4(&v25, v16);
      v11 = v25;

    }
    v3 = v10;
    v4 = v8;
  }
  if (v4)
  {
    v8 = (v4 - 1) & v4;
    v9 = __clz(__rbit64(v4)) | (v3 << 6);
    v10 = v3;
LABEL_31:
    v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v11)
      goto LABEL_34;
    goto LABEL_32;
  }
  v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 >= v18)
      goto LABEL_34;
    v13 = *(_QWORD *)(v19 + 8 * v12);
    v10 = v3 + 1;
    if (!v13)
    {
      v10 = v3 + 2;
      if (v3 + 2 >= v18)
        goto LABEL_34;
      v13 = *(_QWORD *)(v19 + 8 * v10);
      if (!v13)
      {
        v10 = v3 + 3;
        if (v3 + 3 >= v18)
          goto LABEL_34;
        v13 = *(_QWORD *)(v19 + 8 * v10);
        if (!v13)
        {
          v10 = v3 + 4;
          if (v3 + 4 >= v18)
            goto LABEL_34;
          v13 = *(_QWORD *)(v19 + 8 * v10);
          if (!v13)
          {
            v10 = v3 + 5;
            if (v3 + 5 >= v18)
              goto LABEL_34;
            v13 = *(_QWORD *)(v19 + 8 * v10);
            if (!v13)
            {
              v14 = v3 + 6;
              while (v18 != v14)
              {
                v13 = *(_QWORD *)(v19 + 8 * v14++);
                if (v13)
                {
                  v10 = v14 - 1;
                  goto LABEL_30;
                }
              }
LABEL_34:
              sub_1CFBE7A6C();
              return;
            }
          }
        }
      }
    }
LABEL_30:
    v8 = (v13 - 1) & v13;
    v9 = __clz(__rbit64(v13)) + (v10 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

void sub_1CFBD13D4(char a1, void *a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  __n128 v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  char **v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_1CFBFA7D4();
  v9 = MEMORY[0x1E0C80A78](v8);
  v10 = &v3[OBJC_IVAR___CCUIPagingViewController_configuringIconView];
  v11 = (void *)MEMORY[0x1D17DBD84](v10, v9);
  if (v11)
  {

    v12 = (void *)MEMORY[0x1D17DBD84](v10);
    v13 = v12;
    v14 = &selRef_dismissConfigurationCard;
    if ((a1 & 1) == 0)
      v14 = &selRef_dismissConfigurationCardImmediately;
    objc_msgSend(v12, *v14);

    if (a2)
      goto LABEL_5;
    return;
  }
  v15 = objc_msgSend(v4, sel_presentedViewController);
  if (v15)
  {
    v16 = v15;
    objc_opt_self();
    v17 = swift_dynamicCastObjCClass();

    if (v17)
    {
      v18 = objc_msgSend(v4, sel_presentedViewController);
      if (!v18)
        goto LABEL_28;
      v19 = v18;
      v20 = objc_msgSend(v18, sel_isBeingDismissed);

      if ((v20 & 1) == 0)
      {
        sub_1CFBD7E54(a1 & 1, a2, a3);
        return;
      }
    }
  }
  if (!objc_msgSend(v4, sel_isEditing))
  {
    if (a2)
    {
      sub_1CFBBAA24(0, &qword_1ED90ADD0);
      swift_retain();
      v21 = (void *)sub_1CFBFAA50();
      aBlock[4] = a2;
      aBlock[5] = a3;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBCD038;
      aBlock[3] = &block_descriptor_69;
      _Block_copy(aBlock);
      sub_1CFBB5C0C((unint64_t *)&qword_1EFBF0A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
      sub_1CFBE7C74((unint64_t *)&qword_1EFBF0A20, (uint64_t *)&unk_1EFBF1050);
      sub_1CFBFAC00();
      sub_1CFBFA810();
      swift_allocObject();
      sub_1CFBFA804();
      swift_release();
      sub_1CFBFAA2C();

      swift_release();
      sub_1CFBB8538((uint64_t)a2);
    }
    v22 = objc_msgSend(*(id *)&v4[OBJC_IVAR___CCUIPagingViewController_expandedViewControllers], sel_allObjects);
    sub_1CFBBAA24(0, &qword_1ED90AF10);
    v23 = sub_1CFBFA900();

    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if (v24)
        goto LABEL_17;
    }
    else
    {
      v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v24)
      {
LABEL_17:
        if (v24 >= 1)
        {
          for (i = 0; i != v24; ++i)
          {
            if ((v23 & 0xC000000000000001) != 0)
              v26 = (id)MEMORY[0x1D17DAF80](i, v23);
            else
              v26 = *(id *)(v23 + 8 * i + 32);
            v27 = v26;
            objc_msgSend(v26, sel_dismissPresentedContentAnimated_, a1 & 1);

          }
          goto LABEL_25;
        }
        __break(1u);
LABEL_28:
        __break(1u);
        return;
      }
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return;
  }
  objc_msgSend(v4, sel_setEditing_, 0);
  if (a2)
LABEL_5:
    ((void (*)(void))a2)();
}

id PagingViewController.iconModel.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CCUIPagingViewController_iconModel);
}

void sub_1CFBD188C(void *a1, int a2)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v5;
  Class isa;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  objc_class *v26;
  id v27;
  objc_class *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  NSObject *v39;
  char **v40;
  uint32_t *p_cb;
  char **v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;
  char *v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  NSObject *v69;
  uint8_t *v70;
  id v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint8_t *v78;
  void *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  NSObject *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  char **v102;
  NSObject *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (**v108)(uint64_t, uint64_t, uint64_t, NSObject *);
  uint64_t v109;
  NSObject *v110;
  NSObject *v111;
  os_log_type_t v112;
  uint8_t *v113;
  id v114;
  void *v115;
  char *v116;
  char *v117;
  void *v118;
  id v119;
  uint64_t v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  char *v128;
  char *v129;
  uint64_t v130;
  id v131;
  NSObject *v132;
  os_log_type_t v133;
  uint8_t *v134;
  _QWORD *v135;
  id v136;
  uint8_t *v137;
  void (**v138)(uint64_t, uint64_t, uint64_t, NSObject *);
  id v139;
  NSObject *v140;
  os_log_type_t v141;
  uint8_t *v142;
  id v143;
  void *v144;
  void *v145;
  _QWORD *v146;
  void *v147;
  id v148;
  NSObject *v149;
  os_log_type_t v150;
  char *v151;
  uint8_t *v152;
  uint8_t *v153;
  void (**v154)(uint64_t, uint64_t, uint64_t, NSObject *);
  id v155;
  _QWORD v156[2];
  uint8_t *v157;
  void *v158;
  NSObject *v159;
  int v160;
  NSObject *v161;
  NSObject *v162;
  int v163;
  char *v164;
  char *v165;
  char *v166;
  uint8_t *v167;
  char *v168;
  char *v169;
  void (**v170)(uint64_t, uint64_t, uint64_t, NSObject *);
  id v171;
  NSObject *v172;
  uint64_t v173;
  id aBlock[8];

  v3 = v2;
  v163 = a2;
  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v5 = sub_1CFBFA714();
  isa = v5[-1].isa;
  MEMORY[0x1E0C80A78](v5);
  v168 = (char *)v156 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v156 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v169 = (char *)v156 - v12;
  MEMORY[0x1E0C80A78](v13);
  v165 = (char *)v156 - v14;
  MEMORY[0x1E0C80A78](v15);
  v164 = (char *)v156 - v16;
  if (qword_1EFBEFE30 != -1)
    swift_once();
  v17 = sub_1CFBFA7A4();
  v18 = (uint8_t *)__swift_project_value_buffer(v17, (uint64_t)qword_1EFBF0598);
  v19 = a1;
  v20 = sub_1CFBFA78C();
  v21 = sub_1CFBFA9F0();
  v22 = os_log_type_enabled(v20, v21);
  v166 = v10;
  if (v22)
  {
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v161 = v24;
    v171 = (id)swift_slowAlloc();
    aBlock[0] = v171;
    *(_DWORD *)v23 = 138543618;
    v172 = v3;
    v25 = (objc_class *)objc_msgSend(v19, sel_extensionIdentity);
    v162 = v5;
    v26 = v25;
    v173 = (uint64_t)v25;
    v167 = v18;
    sub_1CFBFABD0();
    v24->isa = v26;
    *(_WORD *)(v23 + 12) = 2082;
    v27 = objc_msgSend(v19, sel_kind);
    v28 = isa;
    v29 = sub_1CFBFA894();
    v31 = v30;

    v5 = v162;
    v32 = v29;
    isa = v28;
    v173 = sub_1CFBC779C(v32, v31, (uint64_t *)aBlock);
    v18 = v167;
    v3 = v172;
    sub_1CFBFABD0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CFB7D000, v20, v21, "Requested add/scroll to control in CC: %{public}@ with kind: %{public}s", (uint8_t *)v23, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
    v33 = v161;
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v33, -1, -1);
    v34 = v171;
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v34, -1, -1);
    MEMORY[0x1D17DBCE8](v23, -1, -1);

  }
  else
  {

  }
  v35 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v3->isa
                                                              + OBJC_IVAR___CCUIPagingViewController_iconModel), sel_leafIcons));
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
  v36 = sub_1CFBFA984();

  v37 = (char *)v19;
  sub_1CFBE2DD0(v36, v37);
  v39 = v38;
  swift_bridgeObjectRelease();

  v40 = &selRef_controlCenterWillPresent;
  p_cb = (_DWORD *)(&OBJC_PROTOCOL___SBHAddWidgetSheetGalleryItem + 64);
  v42 = &selRef_setSmallControlsResizeHandleSettings_;
  v170 = (void (**)(uint64_t, uint64_t, uint64_t, NSObject *))isa;
  if (v39)
  {
    v171 = v39;
    v172 = v39;
    goto LABEL_41;
  }
  v172 = v3;
  v43 = sub_1CFBFA78C();
  v44 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_1CFB7D000, v43, v44, "Didn't find existing control; trying to add it...", v45, 2u);
    MEMORY[0x1D17DBCE8](v45, -1, -1);
  }

  v46 = objc_msgSend(v37, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
  sub_1CFBFA750();
  swift_endAccess();

  v47 = (char *)objc_msgSend(v37, sel_extensionIdentity);
  v48 = &v47[*MEMORY[0x1E0D0FE18]];
  swift_beginAccess();
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
  v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 48))(v48, 1, v49);
  v167 = 0;
  v51 = 0;
  if (!v50)
  {
    v167 = (uint8_t *)sub_1CFBFA750();
    v51 = v52;
  }
  swift_endAccess();

  v53 = objc_msgSend(v37, sel_kind);
  sub_1CFBFA894();

  v54 = objc_msgSend(v37, sel_controlType);
  swift_bridgeObjectRetain();
  v55 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v56 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v57 = v5;
  if (v51)
  {
    v58 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  else
  {
    v58 = 0;
  }
  v3 = v172;
  v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D14818]), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v55, v54, v56, v58);

  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
  v60 = (void *)sub_1CFBFA9A8();
  v162 = v59;
  objc_msgSend(v60, sel_addIconDataSource_, v59);
  v61 = v60;
  objc_msgSend(v37, sel_preferredControlSize);
  v62 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  objc_msgSend(v61, sel_setGridSizeClass_, v62);
  v171 = v61;

  v63 = objc_msgSend(v37, sel_defaultIntentReference);
  v40 = &selRef_controlCenterWillPresent;
  v42 = &selRef_setSmallControlsResizeHandleSettings_;
  v5 = v57;
  if (!v63)
  {
    swift_bridgeObjectRelease();
    isa = (Class)v170;
LABEL_23:
    v80 = sub_1CFBFA78C();
    v81 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v82 = 0;
      _os_log_impl(&dword_1CFB7D000, v80, v81, "No default intent found", v82, 2u);
      MEMORY[0x1D17DBCE8](v82, -1, -1);
    }
    v83 = (uint64_t)v165;
    goto LABEL_30;
  }
  v64 = v63;
  v65 = objc_msgSend(v63, sel_intent);

  isa = (Class)v170;
  if (!v65)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (!v51)
  {

    goto LABEL_23;
  }
  v161 = v162;
  v66 = sub_1CFBFA78C();
  v67 = sub_1CFBFA9F0();
  v160 = v67;
  if (os_log_type_enabled(v66, v67))
  {
    v68 = (uint8_t *)swift_slowAlloc();
    v158 = (void *)swift_slowAlloc();
    aBlock[0] = v158;
    v157 = v68;
    *(_DWORD *)v68 = 136315138;
    v156[1] = v68 + 4;
    v69 = v161;
    v70 = v18;
    v71 = -[NSObject uniqueIdentifier](v161, sel_uniqueIdentifier);
    v72 = sub_1CFBFA894();
    v159 = v66;
    v73 = v5;
    v74 = v72;
    v76 = v75;

    v18 = v70;
    v42 = &selRef_setSmallControlsResizeHandleSettings_;
    v77 = v74;
    v5 = v73;
    v173 = sub_1CFBC779C(v77, v76, (uint64_t *)aBlock);
    v3 = v172;
    sub_1CFBFABD0();

    isa = (Class)v170;
    swift_bridgeObjectRelease();
    v78 = v157;
    _os_log_impl(&dword_1CFB7D000, v159, (os_log_type_t)v160, "Associating control configuration intent to id=%s", v157, 0xCu);
    v79 = v158;
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v79, -1, -1);
    MEMORY[0x1D17DBCE8](v78, -1, -1);

  }
  else
  {

    v84 = v161;
  }
  v85 = *(Class *)((char *)&v3->isa + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
  v86 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v80 = -[NSObject uniqueIdentifier](v161, sel_uniqueIdentifier);
  if (!v80)
  {
    sub_1CFBFA894();
    v80 = sub_1CFBFA870();
    v42 = &selRef_setSmallControlsResizeHandleSettings_;
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v85, sel_storeIntent_bundleIdentifier_dataSourceIdentifier_, v65, v86, v80);

  v83 = (uint64_t)v165;
  v40 = &selRef_controlCenterWillPresent;
LABEL_30:

  objc_msgSend(v3, v40[266]);
  v87 = *(Class *)((char *)&v3->isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (!v87)
  {
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v88 = objc_msgSend(v87, v42[315]);
  if (v88)
  {
    v89 = v88;
    v90 = objc_msgSend(v88, sel_addIcon_, v171);

    if (v90)
    {
      sub_1CFBFA708();

      v91 = 0;
    }
    else
    {
      v91 = 1;
    }
    v92 = (uint64_t)v164;
    (*((void (**)(uint64_t, uint64_t, uint64_t, NSObject *))isa + 7))(v83, v91, 1, v5);
    sub_1CFBE413C(v83, v92);
  }
  else
  {
    v92 = (uint64_t)v164;
    (*((void (**)(char *, uint64_t, uint64_t, NSObject *))isa + 7))(v164, 1, 1, v5);
  }
  sub_1CFBE7CCC(v92, &qword_1ED90AFA0);
  v93 = sub_1CFBFA78C();
  v94 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v93, v94))
  {
    v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v95 = 0;
    _os_log_impl(&dword_1CFB7D000, v93, v94, "Added icon.", v95, 2u);
    MEMORY[0x1D17DBCE8](v95, -1, -1);
    v96 = v162;
  }
  else
  {
    v96 = v93;
    v93 = v162;
  }
  p_cb = &OBJC_PROTOCOL___SBHAddWidgetSheetGalleryItem.cb;

  v172 = v171;
  v39 = 0;
LABEL_41:
  v97 = v39;
  objc_msgSend(v3, v40[266]);
  v98 = *((_QWORD *)p_cb + 502);
  v99 = *(Class *)((char *)&v3->isa + v98);
  if (!v99)
    __break(1u);
  v100 = objc_msgSend(v99, v42[315]);
  if (!v100)
  {
    v107 = (uint64_t)v169;
    (*((void (**)(char *, uint64_t, uint64_t, NSObject *))isa + 7))(v169, 1, 1, v5);
LABEL_48:

    sub_1CFBE7CCC(v107, &qword_1ED90AFA0);
    v111 = sub_1CFBFA78C();
    v112 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v111, v112))
    {
      v113 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v113 = 0;
      _os_log_impl(&dword_1CFB7D000, v111, v112, "Error: unable to scroll to control because we couldn't find the icon index path.", v113, 2u);
      MEMORY[0x1D17DBCE8](v113, -1, -1);
    }

    v114 = v171;
LABEL_75:

    return;
  }
  v101 = v100;
  v165 = v37;
  v102 = v40;
  v103 = v5;
  v104 = objc_msgSend(v100, sel_indexPathForIcon_, v172);

  if (v104)
  {
    v105 = (uint64_t)v166;
    sub_1CFBFA708();

    v106 = 0;
    v107 = (uint64_t)v169;
  }
  else
  {
    v106 = 1;
    v107 = (uint64_t)v169;
    v105 = (uint64_t)v166;
  }
  v108 = v170;
  v170[7](v105, v106, 1, v103);
  v109 = v105;
  v110 = v103;
  sub_1CFBE413C(v109, v107);
  if (((unsigned int (*)(uint64_t, uint64_t, NSObject *))v108[6])(v107, 1, v103) == 1)
    goto LABEL_48;
  v167 = v18;
  ((void (*)(char *, uint64_t, NSObject *))v108[4])(v168, v107, v103);
  objc_msgSend(v3, (SEL)v102 + 1003);
  v115 = *(Class *)((char *)&v3->isa + v98);
  if (!v115)
    goto LABEL_78;
  v116 = (char *)objc_msgSend(v115, v42[315]);
  if (!v116)
  {
    v114 = 0;
    v138 = v170;
    goto LABEL_64;
  }
  v117 = v116;
  v118 = (void *)sub_1CFBFA6FC();
  aBlock[0] = 0;
  v119 = objc_msgSend(v117, sel_folderContainingIndexPath_relativeIndexPath_, v118, aBlock);

  v114 = aBlock[0];
  if (!v119 || (v119, !v114))
  {
    v138 = v170;

LABEL_64:
    v139 = v171;
    v140 = sub_1CFBFA78C();
    v141 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v140, v141))
    {
      v142 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v142 = 0;
      _os_log_impl(&dword_1CFB7D000, v140, v141, "Error: unable to scroll to control because we couldn't find the list index the icon belongs to.", v142, 2u);
      MEMORY[0x1D17DBCE8](v142, -1, -1);
    }

    ((void (*)(char *, NSObject *))v138[1])(v168, v110);
    goto LABEL_75;
  }
  v114 = v114;
  v120 = SBFolderRelativeListIndex();
  objc_msgSend(v3, (SEL)v102 + 1003);
  v121 = *(Class *)((char *)&v3->isa + v98);
  if (!v121)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v122 = objc_msgSend(v121, sel_pageIndexForIconListViewIndex_, v120);
  objc_msgSend(v3, (SEL)v102 + 1003);
  v123 = *(Class *)((char *)&v3->isa + v98);
  v124 = v165;
  if (v123)
  {
    objc_msgSend(v123, sel_setCurrentPageIndex_animated_completion_, v122, v163 & 1, 0);
    v125 = sub_1CFBFA78C();
    v126 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v125, v126))
    {
      v127 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v127 = 0;
      _os_log_impl(&dword_1CFB7D000, v125, v126, "Success! Scrolling to page.", v127, 2u);
      MEMORY[0x1D17DBCE8](v127, -1, -1);
    }

    v128 = (char *)objc_msgSend(v124, sel_extensionIdentity);
    v129 = &v128[*MEMORY[0x1E0D0FE18]];
    swift_beginAccess();
    v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v130 - 8) + 48))(v129, 1, v130))
    {
      v169 = v117;
      swift_endAccess();

      v131 = v124;
      v132 = sub_1CFBFA78C();
      v133 = sub_1CFBFA9D8();
      if (os_log_type_enabled(v132, v133))
      {
        v134 = (uint8_t *)swift_slowAlloc();
        v135 = (_QWORD *)swift_slowAlloc();
        v167 = v134;
        *(_DWORD *)v134 = 138412290;
        aBlock[0] = v131;
        v136 = v131;
        sub_1CFBFABD0();
        *v135 = v131;

        v137 = v167;
        _os_log_impl(&dword_1CFB7D000, v132, v133, "Unable to reload control; unknown container bundle identifier for descriptor: %@",
          v167,
          0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
        swift_arrayDestroy();
        MEMORY[0x1D17DBCE8](v135, -1, -1);
        MEMORY[0x1D17DBCE8](v137, -1, -1);
      }
      else
      {

      }
      v155 = v171;
      v149 = v172;
      v117 = v169;
      v154 = v170;
    }
    else
    {
      v162 = v110;
      sub_1CFBFA750();
      swift_endAccess();

      v132 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D10130]), sel_init);
      v143 = objc_msgSend(v124, sel_kind);
      if (!v143)
      {
        sub_1CFBFA894();
        v143 = (id)sub_1CFBFA870();
        swift_bridgeObjectRelease();
      }
      v144 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      v145 = (void *)sub_1CFBFA870();
      v146 = (_QWORD *)swift_allocObject();
      v146[2] = v124;
      aBlock[4] = sub_1CFBE4184;
      aBlock[5] = v146;
      aBlock[0] = (id)MEMORY[0x1E0C809B0];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1CFBD2DC0;
      aBlock[3] = &block_descriptor_75;
      v147 = _Block_copy(aBlock);
      v148 = v124;
      swift_release();
      -[NSObject reloadControlsOfKind:containedIn:reason:completion:](v132, sel_reloadControlsOfKind_containedIn_reason_completion_, v143, v144, v145, v147);
      _Block_release(v147);

      v149 = sub_1CFBFA78C();
      v150 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v149, v150))
      {
        v151 = v117;
        v152 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v152 = 0;
        _os_log_impl(&dword_1CFB7D000, v149, v150, "Reloading control...", v152, 2u);
        v153 = v152;
        v117 = v151;
        MEMORY[0x1D17DBCE8](v153, -1, -1);
      }

      v110 = v162;
      v154 = v170;
      v155 = v171;
    }

    ((void (*)(char *, NSObject *))v154[1])(v168, v110);
    goto LABEL_75;
  }
LABEL_80:
  __break(1u);
}

void sub_1CFBD2B78(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  if (a1)
  {
    v4 = a1;
    if (qword_1EFBEFE30 != -1)
      swift_once();
    v5 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EFBF0598);
    v6 = a1;
    v7 = a2;
    v8 = a1;
    v16 = v7;
    v9 = sub_1CFBFA78C();
    v10 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v11 = 138412546;
      v13 = a1;
      v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_1CFBFABD0();
      *v12 = v14;

      *(_WORD *)(v11 + 12) = 2112;
      v15 = v16;
      sub_1CFBFABD0();
      v12[1] = v16;

      _os_log_impl(&dword_1CFB7D000, v9, v10, "Error reloading control: %@, descriptor: %@", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v12, -1, -1);
      MEMORY[0x1D17DBCE8](v11, -1, -1);

    }
    else
    {

    }
  }
}

void sub_1CFBD2DC0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_1CFBD2E70()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id result;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD aBlock[6];
  objc_super v36;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE98);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AD10);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CFBFAB94();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (objc_class *)type metadata accessor for PagingViewController();
  v36.receiver = v0;
  v36.super_class = v12;
  objc_msgSendSuper2(&v36, sel_viewDidLoad);
  sub_1CFBBAA24(0, &qword_1ED90ADD0);
  v13 = (void *)sub_1CFBFAA50();
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1CFBE41B0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFBDC6E4;
  aBlock[3] = &block_descriptor_81;
  v15 = _Block_copy(aBlock);
  swift_release();
  v16 = AKSEventsRegister();
  _Block_release(v15);

  *(_QWORD *)&v1[OBJC_IVAR___CCUIPagingViewController_appleKeyStoreEventsRegister] = v16;
  sub_1CFBD34E0();
  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(id *)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    objc_msgSend(result, sel_setContentVisibility_, 2);
    *(_QWORD *)(*(_QWORD *)&v1[OBJC_IVAR___CCUIPagingViewController_controlCenterOperationsServiceController] + 24) = &off_1E8CFEEC8;
    swift_unknownObjectWeakAssign();
    type metadata accessor for AccessoryButton();
    sub_1CFBBAA24(0, (unint64_t *)&qword_1ED90AE90);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1CFBFAB1C();
    v18 = (void *)sub_1CFBFABB8();
    sub_1CFBFAB70();
    v19 = (void *)sub_1CFBFA870();
    v20 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v19);

    sub_1CFBFAB64();
    if (qword_1ED90AE88 != -1)
      swift_once();
    v21 = (void *)qword_1ED90B8F8;
    v22 = (void *)sub_1CFBFA870();
    v23 = (void *)sub_1CFBFA870();
    v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, 0, v23);

    sub_1CFBFA894();
    sub_1CFBFAB7C();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1CFBFA7C8();
    v25 = sub_1CFBFA7BC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v7, 0, 1, v25);
    sub_1CFBFAB58();
    v26 = objc_msgSend((id)objc_opt_self(), sel_configurationWithScale_, 1);
    sub_1CFBFAB28();
    v27 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    sub_1CFBFAB4C();
    sub_1CFBFAB34();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v4, v11, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
    v28 = v18;
    sub_1CFBFABAC();

    objc_msgSend(v28, sel_setAutomaticallyUpdatesConfiguration_, 0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90B010);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_1CFC021B0;
    v30 = sub_1CFBFA7B0();
    v31 = MEMORY[0x1E0DC29B0];
    *(_QWORD *)(v29 + 32) = v30;
    *(_QWORD *)(v29 + 40) = v31;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1CFBBAA24(0, &qword_1ED90AEA8);
    sub_1CFBFAAEC();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    objc_msgSend(v28, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E0DC48D0]);
    objc_msgSend(v28, sel_setTintAdjustmentMode_, 1);
    v32 = objc_msgSend(v28, sel_layer);
    objc_msgSend(v32, sel_setZPosition_, -1.0);

    result = objc_msgSend(v1, sel_view);
    if (result)
    {
      v33 = result;
      objc_msgSend(result, sel_addSubview_, v28);

      objc_msgSend(v28, sel_setAlpha_, 0.0);
      v34 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController_addButton];
      *(_QWORD *)&v1[OBJC_IVAR___CCUIPagingViewController_addButton] = v28;

      return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1CFBD34E0()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  objc_class *v20;
  Class v21;

  v1 = (void *)type metadata accessor for IconListRootFolderController();
  v2 = objc_msgSend(v1, sel_iconLocation);
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IconListLayoutProvider()), sel_init);
  if (objc_msgSend(v3, sel_layoutForIconLocation_, v2))
  {
    v20 = (objc_class *)v1;
    *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy] = SBHIconListLayoutMaximumIconCount();
    v4 = objc_msgSend(*(id *)&v0[OBJC_IVAR___CCUIPagingViewController_iconModel], sel_rootFolder);
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      objc_msgSend(v6, sel_addFolderObserver_, v0);
      objc_msgSend(v6, sel_setDelegate_, v0);

    }
    v7 = objc_msgSend(v0, sel_traitCollection);
    v8 = objc_msgSend(v7, sel_userInterfaceIdiom);

    if (v8 == (id)1)
      v9 = 2;
    else
      v9 = 26;
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA3D0]), sel_init);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA508]), sel_initWithDelegate_, v0);
    type metadata accessor for IconViewProvider();
    v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_QWORD *)(v12 + 24) = v11;
    swift_unknownObjectWeakAssign();
    v13 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_iconViewMap];
    *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconViewMap] = v11;
    v19 = v11;

    *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconViewProvider] = v12;
    swift_retain();
    swift_unknownObjectRelease();
    objc_msgSend(v10, sel_setVertical_, 1);
    objc_msgSend(v10, sel_setIconViewProvider_, v12);
    objc_msgSend(v10, sel_setListLayoutProvider_, v3);
    objc_msgSend(v10, sel_setAllowedOrientations_, v9);
    objc_msgSend(v10, sel_setOriginatingIconLocation_, v2);
    objc_msgSend(v10, sel_setOrientation_, 1);
    objc_msgSend(v10, sel_setFolder_, v5);
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA5C8]), sel_init);
    objc_msgSend(v14, sel_setDelegate_, v0);
    objc_msgSend(v14, sel_setPrioritizesDirectIconPlacement_, 1);
    v15 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_iconDragManager];
    *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconDragManager] = v14;
    v16 = v14;

    v17 = objc_msgSend(objc_allocWithZone(v20), sel_initWithConfiguration_, v10);
    v18 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController] = v17;
    v21 = (Class)v17;

    objc_msgSend(v0, sel_bs_addChildViewController_, v21);
    *(_QWORD *)((char *)v21 + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate + 8) = &off_1E8CFEEB0;
    swift_unknownObjectWeakAssign();
    -[objc_class setFolderDelegate:](v21, sel_setFolderDelegate_, v0);
    -[objc_class setOpen:](v21, sel_setOpen_, 1);

    swift_unknownObjectRelease();
    swift_release();

  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBD3888(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D14830]), sel_init);
    sub_1CFBFAAC8();
    sub_1CFBD5A90();
    sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADE0);
    v6 = (void *)sub_1CFBFA8F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setDisallowedControlIdentities_, v6);

    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D14838]), sel_initWithConfiguration_, v5);
    objc_msgSend(v7, sel_setDelegate_, v4);
    objc_msgSend(v7, sel_setCustomItemsDelegate_, v4);
    objc_msgSend(v4, sel_presentViewController_animated_completion_, v7, 1, 0);

  }
}

id sub_1CFBD39C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id result;
  void *v17;
  uint64_t KeyPath;
  void *v19;
  id v20;

  v6 = sub_1CFBFA5C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = MEMORY[0x1D17DBD84](a2 + 16);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!v10)
    return (id)v11(a3, a1, v6);
  v12 = (void *)v10;
  v11((uint64_t)v9, a1, v6);
  v13 = objc_msgSend(v12, sel_traitCollection);
  v14 = objc_msgSend(v13, sel_preferredContentSizeCategory);

  v15 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, v14);
  result = objc_msgSend((id)objc_opt_self(), sel__preferredFontDescriptorWithTextStyle_design_weight_compatibleWithTraitCollection_, *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1398], v15, *MEMORY[0x1E0DC1448]);
  if (result)
  {
    v17 = result;
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    *(&v20 - 2) = v19;
    swift_getKeyPath();
    v20 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v17, 0.0);
    sub_1CFBE7D24();
    sub_1CFBFA5B8();

    return (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CFBD3BEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF17D0);
  return sub_1CFBFA864() & 1;
}

void sub_1CFBD3C44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _BYTE v22[24];

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE98);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8);
  v10 = &v22[-v9];
  v11 = sub_1CFBFAB94();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1CFBFABA0();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1CFBE7CCC((uint64_t)v10, (uint64_t *)&unk_1ED90AE98);
    return;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 32))(v14, v10, v11);
  sub_1CFBFAB88();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  sub_1CFBFABAC();
  objc_msgSend(a1, sel_updateTraitsIfNeeded);
  swift_beginAccess();
  v15 = MEMORY[0x1D17DBD84](a3 + 16);
  if (!v15)
    goto LABEL_7;
  v16 = (char *)v15;
  v17 = v15 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v18 = MEMORY[0x1D17DBD84](v17);
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v16, sel_loadViewIfNeeded);
    v20 = *(void **)&v16[OBJC_IVAR___CCUIPagingViewController_addButton];
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v19, sel_pagingViewController_editingAccessoryViewIntrinsicSizeDidChange_, v16, v21);
      swift_unknownObjectRelease();

LABEL_7:
      (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
      return;
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);

  }
}

id sub_1CFBD3EAC(char a1)
{
  char *v1;
  char *v2;
  id result;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  objc_super v14;

  v2 = v1;
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for PagingViewController();
  objc_msgSendSuper2(&v14, sel_viewWillAppear_, a1 & 1);
  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v5 = result;
    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v5, sel_window);

    objc_msgSend(v6, sel_setAnimationsPermitted_inWindow_, 1, v7);
    v8 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController_controlHost];
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v9, sel_activate);
      if (qword_1ED90ACD8 != -1)
        swift_once();
      v10 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v10, (uint64_t)qword_1ED90ACC0);
      v11 = sub_1CFBFA78C();
      v12 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CFB7D000, v11, v12, "activating control host", v13, 2u);
        MEMORY[0x1D17DBCE8](v13, -1, -1);
      }

    }
    objc_msgSend(v2, sel_loadViewIfNeeded);
    result = *(id *)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    if (result)
      return objc_msgSend(result, sel_setContentVisibility_, 0);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1CFBD41B0(char a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  id result;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[3];
  _QWORD aBlock[6];
  uint64_t v12;
  objc_super v13;

  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for PagingViewController();
  objc_msgSendSuper2(&v13, sel_viewWillDisappear_, a1 & 1);
  v3 = (void *)MEMORY[0x1D17DBD84](&v1[OBJC_IVAR___CCUIPagingViewController_configuringIconView]);
  objc_msgSend(v3, sel_dismissConfigurationCardImmediately);

  v12 = 0;
  v10[2] = &v12;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_1CFBE41D0;
  *(_QWORD *)(v4 + 24) = v10;
  result = objc_msgSend(v1, sel_loadViewIfNeeded);
  v6 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = sub_1CFBBAC70;
    *(_QWORD *)(v7 + 24) = v4;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_96;
    v8 = _Block_copy(aBlock);
    v9 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_enumerateDisplayedIconViewsUsingBlock_, v8);

    _Block_release(v8);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v8 & 1) == 0)
    {
      *(_QWORD *)&v1[OBJC_IVAR___CCUIPagingViewController_hiddenDroppingIconViews] = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return (id)swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1CFBD4384(void *a1, _QWORD *a2)
{
  id result;
  id v5;

  result = objc_msgSend(a1, sel_isDropping);
  if ((_DWORD)result)
  {
    objc_msgSend(a1, sel_setHidden_, 1);
    if (!*a2)
      *a2 = MEMORY[0x1E0DEE9D8];
    v5 = a1;
    MEMORY[0x1D17DAB9C]();
    if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CFBFA924();
    sub_1CFBFA930();
    return (id)sub_1CFBFA918();
  }
  return result;
}

id sub_1CFBD446C(char a1)
{
  char *v1;
  char *v2;
  id result;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  objc_super v20;

  v2 = v1;
  v20.receiver = v2;
  v20.super_class = (Class)type metadata accessor for PagingViewController();
  objc_msgSendSuper2(&v20, sel_viewDidDisappear_, a1 & 1);
  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v5 = result;
    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v5, sel_window);

    objc_msgSend(v6, sel_setAnimationsPermitted_inWindow_, 0, v7);
    v8 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController_controlHost];
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v9, sel_deactivate);
      if (qword_1ED90ACD8 != -1)
        swift_once();
      v10 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v10, (uint64_t)qword_1ED90ACC0);
      v11 = sub_1CFBFA78C();
      v12 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CFB7D000, v11, v12, "deactivating control host", v13, 2u);
        MEMORY[0x1D17DBCE8](v13, -1, -1);
      }

    }
    objc_msgSend(v2, sel_loadViewIfNeeded);
    result = *(id *)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    if (!result)
      goto LABEL_23;
    objc_msgSend(result, sel_setContentVisibility_, 2);
    v14 = OBJC_IVAR___CCUIPagingViewController_hiddenDroppingIconViews;
    v15 = *(_QWORD *)&v2[OBJC_IVAR___CCUIPagingViewController_hiddenDroppingIconViews];
    if (!v15)
    {
LABEL_20:
      *(_QWORD *)&v2[v14] = 0;
      return (id)swift_bridgeObjectRelease();
    }
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      result = (id)sub_1CFBFAD2C();
      v16 = (uint64_t)result;
      if (result)
        goto LABEL_12;
    }
    else
    {
      v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      result = (id)swift_bridgeObjectRetain();
      if (v16)
      {
LABEL_12:
        if (v16 >= 1)
        {
          for (i = 0; i != v16; ++i)
          {
            if ((v15 & 0xC000000000000001) != 0)
              v18 = (id)MEMORY[0x1D17DAF80](i, v15);
            else
              v18 = *(id *)(v15 + 8 * i + 32);
            v19 = v18;
            objc_msgSend(v18, sel_setHidden_, 0);

          }
          goto LABEL_19;
        }
        __break(1u);
        goto LABEL_22;
      }
    }
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

void sub_1CFBD473C()
{
  char *v0;
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for PagingViewController();
  objc_msgSendSuper2(&v14, sel_viewWillLayoutSubviews);
  v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = v1;
  objc_msgSend(v1, sel_bounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v11 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v11)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v12 = objc_msgSend(v11, sel_view);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_setFrame_, v4, v6, v8, v10);

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_1CFBD487C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings;
  v2 = *(void **)(v0 + OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings);
  if (v2)
    goto LABEL_5;
  v3 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_iconEditingSettings);

    if (v5)
    {
      objc_msgSend(v5, sel_addKeyObserver_, v0);
      v6 = *(void **)(v0 + v1);
      *(_QWORD *)(v0 + v1) = v5;
      v5;

      v2 = 0;
LABEL_5:
      v7 = v2;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_1CFBD4938()
{
  return sub_1CFBD4960(&OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconResizeHandleSettings, (SEL *)&selRef_resizeHandleSettings);
}

id sub_1CFBD494C()
{
  return sub_1CFBD4960(&OBJC_IVAR___CCUIPagingViewController____lazy_storage___smallIconResizeHandleSettings, (SEL *)&selRef_smallControlsResizeHandleSettings);
}

id sub_1CFBD4960(uint64_t *a1, SEL *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
    v8 = objc_msgSend(v7, sel_editingSettings);

    v9 = objc_msgSend(v8, sel_resizingSettings);
    v10 = objc_msgSend(v9, *a2);

    v11 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v10;
    v5 = v10;

    v4 = 0;
  }
  v12 = v4;
  return v5;
}

id sub_1CFBD4A3C()
{
  return sub_1CFBD4A64(&OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingFeedbackGenerator);
}

id sub_1CFBD4A50()
{
  return sub_1CFBD4A64(&OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingNotificationFeedbackGenerator);
}

id sub_1CFBD4A64(uint64_t *a1)
{
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id result;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = *a1;
  v3 = *(void **)&v1[*a1];
  if (v3)
  {
    v4 = *(id *)&v1[*a1];
LABEL_5:
    v9 = v3;
    return v4;
  }
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend((id)objc_opt_self(), sel_feedbackGeneratorForView_, result);

    v8 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = v7;
    v4 = v7;

    v3 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void *sub_1CFBD4B10()
{
  char *v0;
  id v1;
  id v2;
  void *result;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (v2)
    goto LABEL_5;
  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    if (UIInterfaceOrientationIsLandscape((uint64_t)objc_msgSend(result, sel_orientation)))
      return (void *)0xD000000000000018;
LABEL_5:
    v5 = &v0[OBJC_IVAR___CCUIPagingViewController_pagingDelegate];
    swift_beginAccess();
    v6 = (void *)MEMORY[0x1D17DBD84](v5);
    v4 = (uint64_t)v6;
    if (v6)
    {
      v7 = objc_msgSend(v6, sel_reasonToDisallowEditing_, v0);
      swift_unknownObjectRelease();
      if (v7)
      {
        v4 = sub_1CFBFA894();

      }
      else
      {
        return 0;
      }
    }
    return (void *)v4;
  }
  __break(1u);
  return result;
}

void sub_1CFBD4C44()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  void *v27;
  char *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  char *v43;
  __int128 v44;
  __int128 aBlock;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;

  v1 = v0;
  v2 = sub_1CFBFA600();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0[OBJC_IVAR___CCUIPagingViewController__isEditing];
  if ((_DWORD)v6 == 1)
  {
    v7 = sub_1CFBD4A3C();
    objc_msgSend(v7, sel_impactOccurredWithIntensity_, 1.0);

    _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
    objc_msgSend((id)objc_opt_self(), sel_resetEditingBorderPulseAnimationStartTime);
    objc_msgSend(v1, sel_loadViewIfNeeded);
    v8 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    if (!v8)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v9 = (char *)objc_msgSend(v8, sel_folderView);
    *(_QWORD *)&v9[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_iconViewConfigurationOptions] &= ~4uLL;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v48 = sub_1CFBE7EE8;
    v49 = v10;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v46 = sub_1CFBEAA70;
    v47 = &block_descriptor_281;
    v11 = _Block_copy(&aBlock);
    v12 = v9;
    swift_release();
    objc_msgSend(v12, sel_enumerateIconListViewsUsingBlock_, v11);
    _Block_release(v11);

  }
  if (qword_1EFBEFE20 != -1)
    swift_once();
  v13 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EFBF0568);
  v14 = sub_1CFBFA78C();
  v15 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 67109120;
    LODWORD(aBlock) = v6;
    sub_1CFBFABD0();
    _os_log_impl(&dword_1CFB7D000, v14, v15, "Editing state changed: %{BOOL}d", v16, 8u);
    MEMORY[0x1D17DBCE8](v16, -1, -1);
  }

  objc_msgSend(v1, sel_loadViewIfNeeded);
  v17 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v18 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v18)
    goto LABEL_32;
  objc_msgSend(v18, sel_setEditing_animated_, v6, 1);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v1, sel_loadViewIfNeeded);
    v19 = *(void **)&v1[v17];
    if (!v19)
    {
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v20 = objc_msgSend(v19, sel_folder);
    objc_msgSend(v20, sel_compactAllLists);

  }
  v21 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController_iconDragManager];
  if (!v21)
    goto LABEL_33;
  objc_msgSend(v21, sel_noteIconManagerEditingDidChange);
  v22 = &v1[OBJC_IVAR___CCUIPagingViewController_pagingDelegate];
  swift_beginAccess();
  v23 = (void *)MEMORY[0x1D17DBD84](v22);
  if (v23)
  {
    objc_msgSend(v23, sel_pagingViewController_editingDidChange_, v1, v6);
    swift_unknownObjectRelease();
  }
  if ((v6 & 1) == 0)
  {
    v24 = OBJC_IVAR___CCUIPagingViewController_endEditingTimer;
    objc_msgSend(*(id *)&v1[OBJC_IVAR___CCUIPagingViewController_endEditingTimer], sel_invalidate);
    v25 = *(void **)&v1[v24];
    *(_QWORD *)&v1[v24] = 0;

    v1[OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments] = 1;
    sub_1CFBD6FF4();
    v26 = *(char **)&v1[OBJC_IVAR___CCUIPagingViewController_controlDragWindow];
    if (v26)
    {
      v27 = *(void **)&v26[OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews];
      v28 = v26;
      v29 = objc_msgSend(v27, sel_objectEnumerator);
      sub_1CFBFA9B4();

      sub_1CFBFA5F4();
      while (v47)
      {
        sub_1CFBBFA58(&aBlock, &v44);
        type metadata accessor for ControlIconDragPreview();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v30 = v43;
          v31 = *(void **)&v43[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
          if (v31)
            objc_msgSend(v31, sel_setEditing_animated_, 0, 1);

        }
        sub_1CFBFA5F4();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

    }
    objc_msgSend(*(id *)&v1[OBJC_IVAR___CCUIPagingViewController_iconModel], sel_saveIconStateIfNeeded);
    sub_1CFBD7FAC();
    objc_msgSend(v1, sel_loadViewIfNeeded);
    v32 = *(void **)&v1[v17];
    if (!v32)
      goto LABEL_36;
    v33 = objc_msgSend(v32, sel_folder);
    if (!v33)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    v34 = v33;
    objc_opt_self();
    v35 = (void *)swift_dynamicCastObjCClassUnconditional();
    v48 = sub_1CFBD52D4;
    v49 = 0;
    v36 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v46 = sub_1CFBD534C;
    v47 = &block_descriptor_268;
    v37 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v35, sel_enumerateAllIconsWithOptions_usingBlock_, 1, v37);
    _Block_release(v37);
    if ((swift_isEscapingClosureAtFileLocation() & 1) == 0)
    {
      objc_msgSend(v1, sel_loadViewIfNeeded);
      v38 = *(void **)&v1[v17];
      if (v38)
      {
        v39 = (char *)objc_msgSend(v38, sel_folderView);
        *(_QWORD *)&v39[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_iconViewConfigurationOptions] |= 4uLL;
        v40 = swift_allocObject();
        *(_QWORD *)(v40 + 16) = v39;
        v48 = sub_1CFBE7CB4;
        v49 = v40;
        *(_QWORD *)&aBlock = v36;
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v46 = sub_1CFBEAA70;
        v47 = &block_descriptor_274;
        v41 = _Block_copy(&aBlock);
        v42 = v39;
        swift_release();
        objc_msgSend(v42, sel_enumerateIconListViewsUsingBlock_, v41);
        _Block_release(v41);

        return;
      }
LABEL_38:
      __break(1u);
      return;
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
}

void sub_1CFBD52D4(void *a1)
{
  id v2;
  id v3;

  if (objc_msgSend(a1, sel_isFolderIcon))
  {
    v2 = objc_msgSend(a1, sel_folder);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, sel_setCancelable_, 0);

    }
  }
}

uint64_t sub_1CFBD534C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(void);
  id v9;
  uint64_t v11;

  v4 = sub_1CFBFA714();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(void))(a1 + 32);
  sub_1CFBFA708();
  v9 = a2;
  v8();

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1CFBD5458(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  int v21;
  char *v22;
  void *v23;
  uint64_t v24;
  id v25;
  char *v26;
  const void *v27;
  id v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_1CFBFA7D4();
  v32 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CFBFA7F8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a1;
  v12 = sub_1CFBD4B10();
  v14 = v13;
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v21 = *(unsigned __int8 *)(v11 + 16);
    v22 = &v1[OBJC_IVAR___CCUIPagingViewController__isEditing];
    if (v21 == v1[OBJC_IVAR___CCUIPagingViewController__isEditing])
      return swift_release();
    if ((v21 & 1) == 0)
    {
LABEL_16:
      *v22 = 0;
      sub_1CFBD4C44();
      return swift_release();
    }
    goto LABEL_11;
  }
  if (!v13)
  {
    if ((v1[OBJC_IVAR___CCUIPagingViewController__isEditing] & 1) != 0)
      return swift_release();
LABEL_11:
    if (qword_1EFBEFE50 != -1)
      swift_once();
    v23 = (void *)qword_1EFBF0F90;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v2;
    *(_QWORD *)(v24 + 24) = v11;
    aBlock[4] = (uint64_t)sub_1CFBE4234;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1CFBCD038;
    aBlock[3] = (uint64_t)&block_descriptor_105;
    v31 = _Block_copy(aBlock);
    v25 = v23;
    v26 = v2;
    swift_retain();
    sub_1CFBFA7E0();
    v33 = MEMORY[0x1E0DEE9D8];
    sub_1CFBB5C0C((unint64_t *)&qword_1EFBF0A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
    sub_1CFBE7C74((unint64_t *)&qword_1EFBF0A20, (uint64_t *)&unk_1EFBF1050);
    sub_1CFBFAC00();
    v27 = v31;
    MEMORY[0x1D17DAD10](0, v10, v6, v31);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_release();
    return swift_release();
  }
  v15 = (uint64_t)v12;
  if (qword_1EFBEFE20 != -1)
    swift_once();
  v16 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EFBF0568);
  swift_bridgeObjectRetain();
  v17 = sub_1CFBFA78C();
  v18 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136446210;
    swift_bridgeObjectRetain();
    v33 = sub_1CFBC779C(v15, v14, aBlock);
    sub_1CFBFABD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CFB7D000, v17, v18, "Disallowing editing: %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v20, -1, -1);
    MEMORY[0x1D17DBCE8](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v28 = sub_1CFBD4A50();
  objc_msgSend(v28, sel_notificationOccurred_, 2);

  *(_BYTE *)(v11 + 16) = 0;
  v22 = &v2[OBJC_IVAR___CCUIPagingViewController__isEditing];
  if ((v2[OBJC_IVAR___CCUIPagingViewController__isEditing] & 1) != 0)
    goto LABEL_16;
  return swift_release();
}

void sub_1CFBD589C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = a2;
  v6[4] = sub_1CFBE7C6C;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1CFBD5A24;
  v6[3] = &block_descriptor_265;
  v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  SBSRequestPasscodeUnlockAlertUI();
  _Block_release(v5);
}

void sub_1CFBD5970(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1D17DBD84](v5);
  if (v6)
  {
    v7 = (_BYTE *)v6;
    swift_beginAccess();
    v8 = *(_BYTE *)(a3 + 16) & a1;
    swift_beginAccess();
    *(_BYTE *)(a3 + 16) = v8 & 1;
    if ((v8 & 1) != v7[OBJC_IVAR___CCUIPagingViewController__isEditing])
    {
      v7[OBJC_IVAR___CCUIPagingViewController__isEditing] = v8 & 1;
      sub_1CFBD4C44();
    }

  }
}

uint64_t sub_1CFBD5A24(uint64_t a1, int a2)
{
  void (*v2)(_BOOL8);
  _BOOL8 v3;

  v2 = *(void (**)(_BOOL8))(a1 + 32);
  v3 = a2 != 0;
  swift_retain();
  v2(v3);
  return swift_release();
}

uint64_t sub_1CFBD5A64(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1CFBD5A90()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, _QWORD, uint64_t, uint64_t);
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, _QWORD, uint64_t, uint64_t);
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v49;
  id v50;
  char *v51;
  char *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v49 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
  MEMORY[0x1E0C80A78](v3);
  v58 = MEMORY[0x1E0DEE9D8];
  v4 = sub_1CFBFAA80();
  v52 = "t Dynamic Type setting.";
  sub_1CFBFA744();
  v51 = "enterControlsExtension";
  sub_1CFBFA744();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
  v6 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v2, 0, 1, v5);
  sub_1CFBFA75C();
  v7 = (void *)sub_1CFBFAA74();
  v8 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v9 = (void *)sub_1CFBFA870();
  v56 = v7;
  v10 = objc_msgSend(v8, sel_initWithExtensionIdentity_kind_intent_, v7, v9, 0);

  v11 = v10;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  v55 = v11;
  sub_1CFBFA930();
  sub_1CFBFA918();
  sub_1CFBFA744();
  sub_1CFBFA744();
  v12 = v5;
  v13 = v5;
  v14 = v6;
  v6(v2, 0, 1, v13);
  sub_1CFBFA75C();
  v57 = v4;
  v15 = (void *)sub_1CFBFAA74();
  v16 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v17 = (void *)sub_1CFBFA870();
  v54 = v15;
  v18 = objc_msgSend(v16, sel_initWithExtensionIdentity_kind_intent_, v15, v17, 0);

  v19 = v18;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  v53 = v19;
  sub_1CFBFA930();
  sub_1CFBFA918();
  v20 = objc_msgSend(v50, sel_traitCollection);
  v21 = objc_msgSend(v20, sel_userInterfaceIdiom);

  if (v21 == (id)1)
  {
    sub_1CFBFA744();
    sub_1CFBFA744();
    v6(v2, 0, 1, v12);
    sub_1CFBFA75C();
    v22 = (void *)sub_1CFBFAA74();
    v23 = objc_allocWithZone(MEMORY[0x1E0D10000]);
    v24 = (void *)sub_1CFBFA870();
    v25 = objc_msgSend(v23, sel_initWithExtensionIdentity_kind_intent_, v22, v24, 0);

    v26 = v25;
    MEMORY[0x1D17DAB9C]();
    if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CFBFA924();
    sub_1CFBFA930();
    sub_1CFBFA918();

  }
  sub_1CFBFA744();
  sub_1CFBFA744();
  v6(v2, 0, 1, v12);
  sub_1CFBFA75C();
  v27 = (void *)sub_1CFBFAA74();
  v28 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v29 = (void *)sub_1CFBFA870();
  v50 = v27;
  v30 = objc_msgSend(v28, sel_initWithExtensionIdentity_kind_intent_, v27, v29, 0);

  v31 = v30;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  v49 = v31;
  sub_1CFBFA930();
  sub_1CFBFA918();
  sub_1CFBFA744();
  sub_1CFBFA744();
  v6(v2, 0, 1, v12);
  sub_1CFBFA75C();
  v32 = (void *)sub_1CFBFAA74();
  v33 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v34 = v32;
  v35 = (void *)sub_1CFBFA870();
  v36 = objc_msgSend(v33, sel_initWithExtensionIdentity_kind_intent_, v34, v35, 0);

  v37 = v36;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  sub_1CFBFA930();
  sub_1CFBFA918();
  v38 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v39 = v34;
  v40 = (void *)sub_1CFBFA870();
  v41 = objc_msgSend(v38, sel_initWithExtensionIdentity_kind_intent_, v39, v40, 0);

  v42 = v41;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  sub_1CFBFA930();
  sub_1CFBFA918();
  sub_1CFBFA744();
  sub_1CFBFA744();
  v14(v2, 0, 1, v12);
  sub_1CFBFA75C();
  v43 = (void *)sub_1CFBFAA74();
  v44 = objc_allocWithZone(MEMORY[0x1E0D10000]);
  v45 = (void *)sub_1CFBFA870();
  v46 = objc_msgSend(v44, sel_initWithExtensionIdentity_kind_intent_, v43, v45, 0);

  v47 = v46;
  MEMORY[0x1D17DAB9C]();
  if (*(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFBFA924();
  sub_1CFBFA930();
  sub_1CFBFA918();

  return v58;
}

void _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD aBlock[6];

  v1 = &v0[OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons];
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    v2 = OBJC_IVAR___CCUIPagingViewController_endEditingTimer;
    v3 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_endEditingTimer];
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v4, sel_invalidate);
      v5 = *(void **)&v0[v2];
      *(_QWORD *)&v0[v2] = 0;

    }
    if (objc_msgSend(v0, sel_isEditing))
    {
      v6 = (void *)objc_opt_self();
      v7 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_1CFBE7A7C;
      aBlock[5] = v7;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBBC8FC;
      aBlock[3] = &block_descriptor_229;
      v8 = _Block_copy(aBlock);
      swift_release();
      v9 = objc_msgSend(v6, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v8, 30.0);
      _Block_release(v8);
      objc_msgSend(v9, sel_setTolerance_, 10.0);
      v10 = *(void **)&v0[v2];
      *(_QWORD *)&v0[v2] = v9;

    }
  }
}

void sub_1CFBD652C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setEditing_, 0);

  }
}

void sub_1CFBD65BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD **v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v5 = (_QWORD **)(v2 + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  v6 = *v5;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_1CFBEBDF0(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    v6 = sub_1CFBEBDF0((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v9 + 1;
  v10 = &v6[2 * v9];
  v10[4] = a1;
  v10[5] = a2;
  swift_endAccess();
  v11 = OBJC_IVAR___CCUIPagingViewController_endEditingTimer;
  objc_msgSend(*(id *)(v2 + OBJC_IVAR___CCUIPagingViewController_endEditingTimer), sel_invalidate);
  v12 = *(void **)(v2 + v11);
  *(_QWORD *)(v2 + v11) = 0;

}

uint64_t sub_1CFBD66C8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_1CFBFAD8C() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_1CFBFAD8C();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

uint64_t sub_1CFBD67AC(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_1CFBE27D0(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[2 * a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 6, 16 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

id sub_1CFBD6888(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id result;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  char *v43;

  v3 = sub_1CFBFA714();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v43 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  v6 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v40 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v40 - v12;
  objc_msgSend(v1, sel_loadViewIfNeeded);
  v14 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  result = *(id *)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!result)
  {
    __break(1u);
    goto LABEL_33;
  }
  result = objc_msgSend(result, sel_folder);
  if (!result)
    return result;
  v16 = result;
  v17 = objc_msgSend(result, sel_indexPathForIcon_, a1);
  if (v17)
  {
    v18 = v17;
    sub_1CFBFA708();

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v11, v19, 1, v3);
  sub_1CFBE413C((uint64_t)v11, (uint64_t)v13);
  sub_1CFBE7E08((uint64_t)v13, (uint64_t)v8, &qword_1ED90AFA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v43, v8, v3);
    v25 = sub_1CFBD7B94();
    v26 = v24;
    if (v24)
    {
      v27 = objc_msgSend(v24, sel_displayedIconViewForIcon_, a1);
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v27, sel_setAllowsEditingAnimation_, 0);
        objc_msgSend(v26, sel_markIcon_asNeedingAnimation_, a1, 0);

      }
    }
    v42 = v16;
    v40 = v26;
    if (v25)
      v29 = objc_msgSend(v25, sel_startCoalescingContentChangesForReason_, *MEMORY[0x1E0DAAAA8]);
    else
      v29 = 0;
    v41 = v25;
    result = objc_msgSend(v1, sel_loadViewIfNeeded, v40);
    v30 = *(void **)&v1[v14];
    if (v30)
    {
      v31 = objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v30, sel_orientation), 0);
      objc_msgSend(v1, sel_loadViewIfNeeded);
      result = *(id *)&v1[v14];
      if (result)
      {
        v32 = objc_msgSend(result, sel_folder);
        objc_msgSend(v32, sel_removeIcon_options_listGridCellInfoOptions_, a1, 26214400, v31);

        objc_msgSend(*(id *)&v1[OBJC_IVAR___CCUIPagingViewController_iconModel], sel_saveIconStateIfNeeded);
        v33 = v40;
        if (v29)
          objc_msgSend(v29, sel_invalidate);
        objc_opt_self();
        v34 = (void *)swift_dynamicCastObjCClass();
        v36 = v41;
        v35 = v42;
        if (v34 && objc_msgSend(v34, sel_activeDataSource))
        {
          objc_opt_self();
          v37 = (void *)swift_dynamicCastObjCClass();
          if (v37)
          {
            v38 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager];
            v39 = objc_msgSend(v37, sel_uniqueIdentifier);
            if (!v39)
            {
              sub_1CFBFA894();
              v39 = (id)sub_1CFBFA870();
              v36 = v41;
              swift_bridgeObjectRelease();
            }
            objc_msgSend(v38, sel_removeModuleWithUniqueIdentifier_, v39);
            swift_unknownObjectRelease();

            v35 = v42;
          }
          else
          {
            swift_unknownObjectRelease();
          }
        }
        objc_msgSend(v1, sel_layoutIconListsWithAnimationType_forceRelayout_, 1, 0);

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v4 + 8))(v43, v3);
        return (id)sub_1CFBE7CCC((uint64_t)v13, &qword_1ED90AFA0);
      }
LABEL_34:
      __break(1u);
      return result;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_1CFBE7CCC((uint64_t)v8, &qword_1ED90AFA0);
  if (qword_1EFBEFE20 != -1)
    swift_once();
  v20 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EFBF0568);
  v21 = sub_1CFBFA78C();
  v22 = sub_1CFBFA9D8();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1CFB7D000, v21, v22, "Icon given to removeIcon(for:) not found in root folder", v23, 2u);
    MEMORY[0x1D17DBCE8](v23, -1, -1);
  }

  return (id)sub_1CFBE7CCC((uint64_t)v13, &qword_1ED90AFA0);
}

_QWORD *sub_1CFBD6DAC(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD *result;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  uint64_t (*v20)();
  uint64_t v21;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  v6 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController_iconViewMap];
  if (!v6)
    goto LABEL_8;
  v7 = result;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1CFBBA9A0;
  *(_QWORD *)(v8 + 24) = v7;
  v20 = sub_1CFBBAC70;
  v21 = v8;
  v9 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 1107296256;
  v18 = sub_1CFBCD300;
  v19 = &block_descriptor_145;
  v10 = _Block_copy(&v16);
  swift_retain();
  swift_retain();
  v11 = v6;
  swift_release();
  objc_msgSend(v11, sel_enumerateRecycledViewsUsingBlock_, v10);

  _Block_release(v10);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  result = (_QWORD *)swift_release();
  if ((v10 & 1) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = objc_msgSend(v2, sel_loadViewIfNeeded);
  v12 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v12)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1CFBBA9A0;
  *(_QWORD *)(v13 + 24) = v7;
  v20 = sub_1CFBBAC70;
  v21 = v13;
  v16 = v9;
  v17 = 1107296256;
  v18 = sub_1CFBCD300;
  v19 = &block_descriptor_152;
  v14 = _Block_copy(&v16);
  v15 = v12;
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_enumerateDisplayedIconViewsUsingBlock_, v14);

  _Block_release(v14);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release_n();
  result = (_QWORD *)swift_release();
  if ((v14 & 1) != 0)
    goto LABEL_7;
  return result;
}

id sub_1CFBD6FF4()
{
  char *v0;
  id result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  _QWORD aBlock[6];

  result = objc_msgSend(v0, sel_loadViewIfNeeded);
  v2 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v3 = *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v3)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  *(_BYTE *)(v3 + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_allowsIconAdornments) = v0[OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments];
  MEMORY[0x1E0C80A78](result);
  v9[2] = v0;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_1CFBE7A2C;
  *(_QWORD *)(v4 + 24) = v9;
  result = objc_msgSend(v0, sel_loadViewIfNeeded);
  v5 = *(void **)&v0[v2];
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1CFBBAC70;
    *(_QWORD *)(v6 + 24) = v4;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_219;
    v7 = _Block_copy(aBlock);
    v8 = v5;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_enumerateDisplayedIconViewsUsingBlock_, v7);

    _Block_release(v7);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v7 & 1) == 0)
      return result;
    __break(1u);
    goto LABEL_5;
  }
LABEL_6:
  __break(1u);
  return result;
}

void sub_1CFBD71A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;

  v6 = a2 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x1D17DBD84](v6);
  if (v7)
  {
    v8 = (char *)v7;
    objc_msgSend(a3, sel_removeObjectForKey_, a4);
    if (!objc_msgSend(a3, sel_count))
    {
      v9 = *(char **)&v8[OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource];
      *(_QWORD *)&v8[OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource] = 0;

      v8 = v9;
    }

  }
}

uint64_t sub_1CFBD723C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_1CFBFAA44();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CFBFAA38();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1CFBFA7F8();
  MEMORY[0x1E0C80A78](v6);
  sub_1CFBBAA24(0, &qword_1ED90ADD0);
  sub_1CFBFA7EC();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1CFBB5C0C(&qword_1EFBF17B0, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF17B8);
  sub_1CFBE7C74((unint64_t *)&unk_1EFBF17C0, &qword_1EFBF17B8);
  sub_1CFBFAC00();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1CFBFAA68();
  qword_1EFBF0F90 = result;
  return result;
}

id sub_1CFBD7408()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics;
  v2 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics];
  }
  else
  {
    sub_1CFBD7468(v0);
    v4 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v5;
    v3 = v5;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1CFBD7468(char *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, sel_loadViewIfNeeded);
  v2 = *(void **)&a1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = objc_msgSend(v2, sel_listLayoutProvider);
  v4 = objc_msgSend((id)type metadata accessor for IconListRootFolderController(), sel_iconLocation);
  v5 = objc_msgSend(v3, sel_layoutForIconLocation_, v4);

  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  objc_msgSend(v5, sel_iconImageInfo);
  v7 = v6;
  v8 = 0.0;
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_iconSpacingForOrientation_) & 1) != 0)
  {
    objc_msgSend(v5, sel_iconSpacingForOrientation_, 1);
    v8 = v9;
  }
  objc_msgSend((id)objc_opt_self(), sel_defaultMetricsForGridGeometryInfo_, v7, v8);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

id _s15ControlCenterUI20PagingViewControllerC017compactModeSourceE03forSo6UIViewCSgSo026CCUIContentModuleContainereF0C_tF_0(void *a1)
{
  char *v1;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  uint64_t v11;
  _QWORD aBlock[6];
  uint64_t v13;

  v13 = 0;
  result = objc_msgSend(v1, sel_loadViewIfNeeded);
  v4 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = &v13;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1CFBE7C18;
    *(_QWORD *)(v6 + 24) = v5;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_258;
    v7 = _Block_copy(aBlock);
    v8 = v4;
    v9 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_enumerateDisplayedIconViewsUsingBlock_, v7);

    _Block_release(v7);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = (id)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v11 = v13;
      swift_release();
      return (id)v11;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1CFBD7708(void *a1, _BYTE *a2, id a3, void **a4)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v8)
  {
    v9 = v8;

    if (v9 == a3)
    {
      v10 = *a4;
      *a4 = a1;
      v11 = a1;

      *a2 = 1;
    }
  }
}

void sub_1CFBD7780(void *a1, uint64_t a2)
{
  sub_1CFBD77A4(a1, a2, (SEL *)&selRef_willBecomeActive);
}

void sub_1CFBD778C(void *a1, uint64_t a2)
{
  sub_1CFBD77A4(a1, a2, (SEL *)&selRef_willResignActive);
}

void sub_1CFBD7798(void *a1, uint64_t a2)
{
  sub_1CFBD77A4(a1, a2, (SEL *)&selRef_displayWillTurnOff);
}

void sub_1CFBD77A4(void *a1, uint64_t a2, SEL *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v4)
  {
    v6 = v4;
    objc_opt_self();
    v5 = (void *)swift_dynamicCastObjCClass();
    if (v5)
      objc_msgSend(v5, *a3);

  }
}

void sub_1CFBD781C(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v5)
  {
    v7 = v5;
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6)
      a3(v6, a2);

  }
}

void sub_1CFBD78A8(char a1, void *a2)
{
  char *v2;
  unsigned __int8 v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[6];

  v5 = objc_msgSend(v2, sel_bs_isAppearingOrAppeared);
  if ((a1 & 1) != 0)
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend(v2, sel_loadViewIfNeeded);
  v7 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v8 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v8)
    goto LABEL_9;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_BYTE *)(v9 + 24) = v5;
  *(_BYTE *)(v9 + 25) = a1 & 1;
  *(double *)(v9 + 32) = v6;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1CFBE7BD0;
  *(_QWORD *)(v10 + 24) = v9;
  v16[4] = sub_1CFBBAC70;
  v16[5] = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1CFBCD300;
  v16[3] = &block_descriptor_248;
  v11 = _Block_copy(v16);
  v12 = a2;
  swift_retain();
  v13 = v8;
  swift_release();
  objc_msgSend(v13, sel_enumerateDisplayedIconViewsUsingBlock_, v11);

  _Block_release(v11);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(v2, sel_loadViewIfNeeded);
  v14 = *(void **)&v2[v7];
  if (v14)
  {
    v15 = objc_msgSend(v14, sel_pageControl);
    objc_msgSend(v15, sel_setAlpha_, v6);
    swift_release();

    return;
  }
LABEL_10:
  __break(1u);
}

void sub_1CFBD7A94(void *a1, double a2, uint64_t a3, id a4, char a5, char a6)
{
  id v11;
  id v12;

  v11 = objc_msgSend(a1, sel_customIconImageViewController);
  if (v11)
  {
    if (a4 && v11 == a4)
    {
      if ((a5 & 1) == 0 || (a6 & 1) == 0)
        goto LABEL_12;
      v12 = v11;
      objc_msgSend(v11, sel_ccui_safelyBeginAppearanceTransition_animated_, 1, 0);
      objc_msgSend(v12, sel_ccui_safelyEndAppearanceTransition);
    }
    else
    {
      v12 = v11;
      if ((a5 & 1) != 0)
      {
        objc_msgSend(v11, sel_ccui_safelyBeginAppearanceTransition_animated_, (a6 & 1) == 0, 0);
        objc_msgSend(v12, sel_ccui_safelyEndAppearanceTransition);
      }
      objc_msgSend(a1, sel_setAlpha_, a2);
    }
    v11 = v12;
LABEL_12:

  }
}

id sub_1CFBD7B94()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id result;
  id v10;
  void *v11;
  id v12[2];

  v1 = v0;
  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(v0, sel_loadViewIfNeeded);
  v2 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v3 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v3)
    __break(1u);
  v4 = objc_msgSend(v3, sel_folder);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)sub_1CFBFA6FC();
  v12[0] = 0;
  v7 = objc_msgSend(v5, sel_folderContainingIndexPath_relativeIndexPath_, v6, v12);

  if (!v7)
  {
LABEL_13:

    return v7;
  }
  if (!v12[0])
  {

    return 0;
  }
  v8 = v12[0];
  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(id *)&v1[v2];
  if (result)
  {
    v10 = objc_msgSend(result, sel_folderControllerForFolder_, v7);
    if (v10)
    {
      v11 = v10;
      if ((objc_msgSend(v10, sel_isOpen) & 1) != 0)
      {
        objc_msgSend(v11, sel_iconListViewForIconListModelIndex_, SBFolderRelativeListIndex());

        return v7;
      }

    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1CFBD7D3C()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_folderView);
    v3 = objc_msgSend(v2, sel_window);

    if (v3)
    {
      v10 = objc_msgSend(v3, sel_windowScene);

      v4 = v10;
      if (v10)
      {
        v5 = OBJC_IVAR___CCUIPagingViewController_controlDragWindow;
        v6 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_controlDragWindow];
        if (v6)
        {
          v7 = objc_msgSend(v6, sel_windowScene);
          if (v7)
          {
            v8 = v7;
            if (v10 != v7)
            {
              v9 = *(void **)&v0[v5];
              *(_QWORD *)&v0[v5] = 0;

              v4 = v9;
              goto LABEL_11;
            }

          }
          v4 = v10;
        }
LABEL_11:

      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1CFBD7E54(char a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  _QWORD v16[6];

  v4 = v3;
  v8 = objc_msgSend(v4, sel_presentedViewController);
  if (v8)
  {
    v9 = v8;
    objc_opt_self();
    v10 = swift_dynamicCastObjCClass();

    if (v10)
    {
      v11 = objc_msgSend(v4, sel_presentedViewController);
      if (v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v11, sel_isBeingDismissed);

        if ((v13 & 1) == 0)
        {
          v14 = objc_msgSend(v4, sel_presentedViewController);
          if (v14)
          {
            v15 = v14;
            if (a2)
            {
              v16[4] = a2;
              v16[5] = a3;
              v16[0] = MEMORY[0x1E0C809B0];
              v16[1] = 1107296256;
              v16[2] = sub_1CFBCD038;
              v16[3] = &block_descriptor_288;
              a2 = _Block_copy(v16);
              swift_retain();
              swift_release();
            }
            objc_msgSend(v15, sel_dismissViewControllerAnimated_completion_, a1 & 1, a2);
            _Block_release(a2);

          }
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_1CFBD7FAC()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v1)
  {
    __break(1u);
    return;
  }
  v2 = objc_msgSend(v1, sel_folder);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_leafIcons);

    sub_1CFBBAA24(0, &qword_1ED90AD60);
    sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
    v5 = sub_1CFBFA984();

    v6 = v0;
    sub_1CFBE3480(v5);
    v8 = v7;
    swift_bridgeObjectRelease();

    v9 = v8 >> 62;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      v35 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if (v35)
        goto LABEL_5;
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      v10 = objc_allocWithZone(MEMORY[0x1E0D0FFC8]);
      sub_1CFBFAABC();
      swift_bridgeObjectRetain();
      v11 = (void *)sub_1CFBFA8F4();
      swift_bridgeObjectRelease();
      v12 = objc_msgSend(v10, sel_initWithControlItems_, v11);

      v13 = OBJC_IVAR___CCUIPagingViewController_controlHost;
      v14 = *(void **)&v6[OBJC_IVAR___CCUIPagingViewController_controlHost];
      if (v14)
      {
        v15 = qword_1ED90ACD8;
        v16 = v14;
        if (v15 != -1)
          swift_once();
        v17 = sub_1CFBFA7A4();
        __swift_project_value_buffer(v17, (uint64_t)qword_1ED90ACC0);
        swift_bridgeObjectRetain();
        v18 = sub_1CFBFA78C();
        v19 = sub_1CFBFA9F0();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v20 = 134217984;
          if (v9)
          {
            swift_bridgeObjectRetain();
            sub_1CFBFAD2C();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          sub_1CFBFABD0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CFB7D000, v18, v19, "updating control host: %ld items", v20, 0xCu);
          MEMORY[0x1D17DBCE8](v20, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        objc_msgSend(v16, sel_setConfiguration_, v12);

        goto LABEL_29;
      }
      if (qword_1ED90ACD8 != -1)
        swift_once();
      v21 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v21, (uint64_t)qword_1ED90ACC0);
      swift_bridgeObjectRetain();
      v22 = sub_1CFBFA78C();
      v23 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v24 = 134217984;
        if (v9)
        {
          swift_bridgeObjectRetain();
          sub_1CFBFAD2C();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        sub_1CFBFABD0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CFB7D000, v22, v23, "creating control host: %ld items", v24, 0xCu);
        MEMORY[0x1D17DBCE8](v24, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_1CFBFA8A0();
      v25 = objc_allocWithZone(MEMORY[0x1E0D0FFF8]);
      v12 = v12;
      v26 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      v27 = objc_msgSend(v25, sel_initWithIdentifier_configuration_, v26, v12);

      v28 = *(void **)&v6[v13];
      *(_QWORD *)&v6[v13] = v27;
      v29 = v27;

      if (!objc_msgSend(v6, sel_bs_isAppearingOrAppeared) || (v30 = *(void **)&v6[v13]) == 0)
      {

LABEL_29:
        return;
      }
      v31 = v30;
      objc_msgSend(v31, sel_activate);
      v32 = sub_1CFBFA78C();
      v33 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1CFB7D000, v32, v33, "activating control host", v34, 2u);
        MEMORY[0x1D17DBCE8](v34, -1, -1);
      }

      return;
    }
    swift_bridgeObjectRelease();
    v36 = OBJC_IVAR___CCUIPagingViewController_controlHost;
    v37 = *(void **)&v6[OBJC_IVAR___CCUIPagingViewController_controlHost];
    if (v37)
    {
      v46 = v37;
      objc_msgSend(v46, sel_deactivate);
      if (qword_1ED90ACD8 != -1)
        swift_once();
      v38 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v38, (uint64_t)qword_1ED90ACC0);
      v39 = sub_1CFBFA78C();
      v40 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_1CFB7D000, v39, v40, "deactivating control host", v41, 2u);
        MEMORY[0x1D17DBCE8](v41, -1, -1);
      }

      objc_msgSend(v46, sel_invalidate);
      v42 = *(void **)&v6[v36];
      *(_QWORD *)&v6[v36] = 0;

      if (qword_1ED90ACD8 != -1)
        swift_once();
      __swift_project_value_buffer(v38, (uint64_t)qword_1ED90ACC0);
      v43 = sub_1CFBFA78C();
      v44 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_1CFB7D000, v43, v44, "invalidating control host", v45, 2u);
        MEMORY[0x1D17DBCE8](v45, -1, -1);
      }

    }
  }
}

uint64_t sub_1CFBD86DC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  BOOL v40;
  uint64_t v41;
  _QWORD *v42;
  BOOL v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  unint64_t v54;
  uint64_t v55;
  uint64_t i;
  id v57;
  void *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72[9];
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;

  if (qword_1ED90AFE0 != -1)
    goto LABEL_81;
LABEL_2:
  v0 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED90AFC0);
  v1 = sub_1CFBFA78C();
  v2 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CFB7D000, v1, v2, "Check for invalid modules.", v3, 2u);
    MEMORY[0x1D17DBCE8](v3, -1, -1);
  }

  v4 = objc_msgSend(*(id *)(v70 + OBJC_IVAR___CCUIPagingViewController_iconModel), sel_leafIcons);
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
  v5 = sub_1CFBFA984();

  v73 = MEMORY[0x1E0DEE9D8];
  if ((v5 & 0xC000000000000001) != 0)
  {
    sub_1CFBFAC24();
    sub_1CFBFA99C();
    v5 = v74;
    v61 = v75;
    v6 = v76;
    v7 = v77;
    v8 = v78;
  }
  else
  {
    v7 = 0;
    v9 = -1 << *(_BYTE *)(v5 + 32);
    v61 = v5 + 56;
    v10 = ~v9;
    v11 = -v9;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v8 = v12 & *(_QWORD *)(v5 + 56);
    v6 = v10;
  }
  v59 = v6;
  v60 = (unint64_t)(v6 + 64) >> 6;
  v62 = v5;
  while (v5 < 0)
  {
    if (!sub_1CFBFAC48())
      goto LABEL_70;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v72[0];
    swift_unknownObjectRelease();
    v16 = (id)v15;
    v14 = v7;
    v64 = v8;
    if (!v15)
      goto LABEL_70;
LABEL_33:
    v63 = v14;
    v66 = v16;
    v21 = objc_msgSend(v16, sel_iconDataSources, v59);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE20);
    v22 = sub_1CFBFA900();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      v23 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if (!v23)
        goto LABEL_11;
LABEL_35:
      v24 = 0;
      v71 = v22 & 0xC000000000000001;
      v68 = v22;
      v69 = OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager;
      v65 = v22 & 0xFFFFFFFFFFFFFF8;
      v67 = v23;
      while (1)
      {
        while (1)
        {
          if (v71)
          {
            MEMORY[0x1D17DAF80](v24, v22);
            v25 = __OFADD__(v24++, 1);
            if (v25)
              goto LABEL_78;
          }
          else
          {
            if (v24 >= *(_QWORD *)(v65 + 16))
              goto LABEL_79;
            swift_unknownObjectRetain();
            v25 = __OFADD__(v24++, 1);
            if (v25)
            {
LABEL_78:
              __break(1u);
LABEL_79:
              __break(1u);
LABEL_80:
              __break(1u);
LABEL_81:
              swift_once();
              goto LABEL_2;
            }
          }
          objc_opt_self();
          v26 = swift_dynamicCastObjCClass();
          if (v26)
            break;
          swift_unknownObjectRelease();
          if (v24 == v23)
            goto LABEL_11;
        }
        v27 = (void *)v26;
        v28 = *(void **)(v70 + v69);
        swift_unknownObjectRetain();
        v29 = objc_msgSend(v28, sel_loadableModuleIdentifiers);
        v30 = sub_1CFBFA984();

        v31 = objc_msgSend(v27, sel_moduleIdentifier);
        v32 = sub_1CFBFA894();
        v34 = v33;

        if (*(_QWORD *)(v30 + 16))
        {
          sub_1CFBFADF8();
          sub_1CFBFA8AC();
          v35 = sub_1CFBFAE10();
          v36 = -1 << *(_BYTE *)(v30 + 32);
          v37 = v35 & ~v36;
          if (((*(_QWORD *)(v30 + 56 + ((v37 >> 3) & 0xFFFFFFFFFFFFF8)) >> v37) & 1) != 0)
          {
            v38 = *(_QWORD *)(v30 + 48);
            v39 = (_QWORD *)(v38 + 16 * v37);
            v40 = *v39 == v32 && v39[1] == v34;
            if (v40 || (sub_1CFBFAD8C() & 1) != 0)
            {
LABEL_51:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_65:
              swift_unknownObjectRelease_n();
              goto LABEL_66;
            }
            v41 = ~v36;
            while (1)
            {
              v37 = (v37 + 1) & v41;
              if (((*(_QWORD *)(v30 + 56 + ((v37 >> 3) & 0xFFFFFFFFFFFFF8)) >> v37) & 1) == 0)
                break;
              v42 = (_QWORD *)(v38 + 16 * v37);
              v43 = *v42 == v32 && v42[1] == v34;
              if (v43 || (sub_1CFBFAD8C() & 1) != 0)
                goto LABEL_51;
            }
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = v66;
        MEMORY[0x1D17DAB9C]();
        if (*(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1CFBFA924();
        sub_1CFBFA930();
        sub_1CFBFA918();
        swift_unknownObjectRetain_n();
        v45 = sub_1CFBFA78C();
        v46 = sub_1CFBFA9F0();
        if (!os_log_type_enabled(v45, v46))
        {

          goto LABEL_65;
        }
        v47 = swift_slowAlloc();
        v48 = swift_slowAlloc();
        v72[0] = v48;
        *(_DWORD *)v47 = 136315138;
        v49 = objc_msgSend(v27, sel_moduleIdentifier);
        v50 = sub_1CFBFA894();
        v52 = v51;

        *(_QWORD *)(v47 + 4) = sub_1CFBC779C(v50, v52, v72);
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CFB7D000, v45, v46, "Remove invalid module %s for module not loadable.", (uint8_t *)v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DBCE8](v48, -1, -1);
        MEMORY[0x1D17DBCE8](v47, -1, -1);
        swift_unknownObjectRelease_n();

LABEL_66:
        v23 = v67;
        v22 = v68;
        if (v24 == v67)
          goto LABEL_11;
      }
    }
    v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v23)
      goto LABEL_35;
LABEL_11:

    swift_bridgeObjectRelease();
    v7 = v63;
    v8 = v64;
    v5 = v62;
  }
  if (v8)
  {
    v64 = (v8 - 1) & v8;
    v13 = __clz(__rbit64(v8)) | (v7 << 6);
    v14 = v7;
    goto LABEL_32;
  }
  v17 = v7 + 1;
  if (__OFADD__(v7, 1))
    goto LABEL_80;
  if (v17 >= v60)
    goto LABEL_70;
  v18 = *(_QWORD *)(v61 + 8 * v17);
  v19 = v7 + 1;
  if (v18)
    goto LABEL_31;
  v19 = v7 + 2;
  if (v7 + 2 >= v60)
    goto LABEL_70;
  v18 = *(_QWORD *)(v61 + 8 * v19);
  if (v18)
    goto LABEL_31;
  v19 = v7 + 3;
  if (v7 + 3 >= v60)
    goto LABEL_70;
  v18 = *(_QWORD *)(v61 + 8 * v19);
  if (v18)
    goto LABEL_31;
  v19 = v7 + 4;
  if (v7 + 4 >= v60)
    goto LABEL_70;
  v18 = *(_QWORD *)(v61 + 8 * v19);
  if (v18)
  {
LABEL_31:
    v64 = (v18 - 1) & v18;
    v14 = v19;
    v13 = __clz(__rbit64(v18)) + (v19 << 6);
LABEL_32:
    v16 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v13);
    if (!v16)
      goto LABEL_70;
    goto LABEL_33;
  }
  v20 = v7 + 5;
  while (v60 != v20)
  {
    v18 = *(_QWORD *)(v61 + 8 * v20++);
    if (v18)
    {
      v19 = v20 - 1;
      v5 = v62;
      goto LABEL_31;
    }
  }
LABEL_70:
  result = sub_1CFBE7A6C();
  v54 = v73;
  if (v73 >> 62)
  {
    swift_bridgeObjectRetain();
    v55 = sub_1CFBFAD2C();
    result = swift_bridgeObjectRelease();
    if (!v55)
      return swift_bridgeObjectRelease();
LABEL_72:
    if (v55 >= 1)
    {
      for (i = 0; i != v55; ++i)
      {
        if ((v54 & 0xC000000000000001) != 0)
          v57 = (id)MEMORY[0x1D17DAF80](i, v54);
        else
          v57 = *(id *)(v54 + 8 * i + 32);
        v58 = v57;
        sub_1CFBD6888((uint64_t)v57);

      }
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  else
  {
    v55 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v55)
      goto LABEL_72;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1CFBD8F54(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = sub_1CFBFAC54();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_1CFBFAB04(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_1CFBFAB10();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_1CFBFAB10();

        if ((v12 & 1) != 0)
          break;
        v14 = (v14 + 1) & v13;
      }
      while (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  v12 = 1;
  return v12 & 1;
}

void sub_1CFBD90B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char **v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  int64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  os_log_type_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t i;
  id v63;
  void *v64;
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;

  v1 = v0;
  v2 = v0 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1D17DBD84](v2);
  if (!v3)
  {
    if (qword_1ED90AFE0 == -1)
    {
LABEL_8:
      v8 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v8, (uint64_t)qword_1ED90AFC0);
      v9 = sub_1CFBFA78C();
      v10 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1CFB7D000, v9, v10, "Skip invalid control checking because of nil pagingDelegate.", v11, 2u);
        MEMORY[0x1D17DBCE8](v11, -1, -1);
      }

      return;
    }
LABEL_84:
    swift_once();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, sel_isSystemRestoringForPagingViewController_, v0))
  {
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v4 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED90AFC0);
    v5 = sub_1CFBFA78C();
    v6 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CFB7D000, v5, v6, "Skip invalid control checking because system is restoring.", v7, 2u);
      MEMORY[0x1D17DBCE8](v7, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_unknownObjectRelease();
    }
    return;
  }
  swift_unknownObjectRelease();
  if (qword_1ED90AFE0 != -1)
    swift_once();
  v12 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED90AFC0);
  v13 = sub_1CFBFA78C();
  v14 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CFB7D000, v13, v14, "Check for invalid controls.", v15, 2u);
    MEMORY[0x1D17DBCE8](v15, -1, -1);
  }

  v16 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___CCUIPagingViewController_iconModel), sel_leafIcons);
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
  v17 = sub_1CFBFA984();

  v79 = MEMORY[0x1E0DEE9D8];
  if ((v17 & 0xC000000000000001) != 0)
  {
    sub_1CFBFAC24();
    sub_1CFBFA99C();
    v17 = v80;
    v67 = v81;
    v18 = v82;
    v19 = v83;
    v20 = v84;
  }
  else
  {
    v19 = 0;
    v21 = -1 << *(_BYTE *)(v17 + 32);
    v67 = v17 + 56;
    v22 = ~v21;
    v23 = -v21;
    if (v23 < 64)
      v24 = ~(-1 << v23);
    else
      v24 = -1;
    v20 = v24 & *(_QWORD *)(v17 + 56);
    v18 = v22;
  }
  v65 = v18;
  v66 = (unint64_t)(v18 + 64) >> 6;
  v25 = &selRef_setSmallControlsResizeHandleSettings_;
  v69 = v2;
  v70 = v1;
  v68 = v17;
  while (v17 < 0)
  {
    if (!sub_1CFBFAC48())
      goto LABEL_74;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v29 = v78;
    swift_unknownObjectRelease();
    v28 = v19;
    v26 = v20;
    v25 = &selRef_setSmallControlsResizeHandleSettings_;
    if (!v29)
      goto LABEL_74;
LABEL_45:
    v71 = v26;
    v72 = v28;
    v33 = objc_msgSend(v29, sel_iconDataSources, v65);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE20);
    v34 = sub_1CFBFA900();

    v73 = v29;
    if (v34 >> 62)
    {
      swift_bridgeObjectRetain();
      v35 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if (!v35)
        goto LABEL_23;
LABEL_47:
      if (v35 >= 1)
      {
        v36 = 0;
        v76 = v35;
        v77 = v34 & 0xC000000000000001;
        v74 = OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider;
        v75 = v34;
        while (1)
        {
          if (v77)
            MEMORY[0x1D17DAF80](v36, v34);
          else
            swift_unknownObjectRetain();
          objc_opt_self();
          v37 = swift_dynamicCastObjCClass();
          if (v37)
          {
            v38 = (void *)v37;
            swift_unknownObjectRetain();
            v39 = objc_msgSend(v38, v25[227]);
            if (v39)
            {
              v40 = v39;
              v41 = (void *)MEMORY[0x1D17DBD84](v2);
              if (v41)
              {
                v42 = objc_msgSend(v41, sel_pagingViewController_shouldPauseCheckingInvalidControlsForApplicationIdentifier_, v1, v40);

                if ((v42 & 1) != 0)
                {
                  swift_unknownObjectRetain_n();
                  v43 = sub_1CFBFA78C();
                  v44 = sub_1CFBFA9F0();
                  if (os_log_type_enabled(v43, v44))
                  {
                    v45 = swift_slowAlloc();
                    v46 = swift_slowAlloc();
                    v78 = (void *)v46;
                    *(_DWORD *)v45 = 136315138;
                    v47 = objc_msgSend(v38, sel_extensionBundleIdentifier);
                    v48 = sub_1CFBFA894();
                    v50 = v49;

                    v51 = v48;
                    v2 = v69;
                    *(_QWORD *)(v45 + 4) = sub_1CFBC779C(v51, v50, (uint64_t *)&v78);
                    swift_unknownObjectRelease_n();
                    v1 = v70;
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_1CFB7D000, v43, v44, "Skip invalid control checking for %s because container app is installing.", (uint8_t *)v45, 0xCu);
                    goto LABEL_68;
                  }
LABEL_69:

                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease_n();
                }
                else
                {
                  v52 = objc_msgSend(*(id *)(v1 + v74), sel_descriptorFor_, v38);

                  if (v52)
                  {
                    swift_unknownObjectRelease();
                    swift_unknownObjectRelease_n();
                  }
                  else
                  {
                    v53 = v73;
                    MEMORY[0x1D17DAB9C]();
                    if (*(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
                      sub_1CFBFA924();
                    sub_1CFBFA930();
                    sub_1CFBFA918();
                    swift_unknownObjectRetain_n();
                    v43 = sub_1CFBFA78C();
                    v54 = sub_1CFBFA9F0();
                    if (!os_log_type_enabled(v43, v54))
                      goto LABEL_69;
                    v45 = swift_slowAlloc();
                    v46 = swift_slowAlloc();
                    v78 = (void *)v46;
                    *(_DWORD *)v45 = 136315138;
                    v55 = objc_msgSend(v38, sel_extensionBundleIdentifier);
                    v56 = sub_1CFBFA894();
                    v58 = v57;

                    v59 = v56;
                    v1 = v70;
                    *(_QWORD *)(v45 + 4) = sub_1CFBC779C(v59, v58, (uint64_t *)&v78);
                    swift_unknownObjectRelease_n();
                    v2 = v69;
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_1CFB7D000, v43, v54, "Remove control %s for no control descriptor.", (uint8_t *)v45, 0xCu);
LABEL_68:
                    swift_arrayDestroy();
                    MEMORY[0x1D17DBCE8](v46, -1, -1);
                    MEMORY[0x1D17DBCE8](v45, -1, -1);
                    swift_unknownObjectRelease_n();
                    swift_unknownObjectRelease();

                  }
                }
                v25 = &selRef_setSmallControlsResizeHandleSettings_;
              }
              else
              {
                swift_unknownObjectRelease_n();

              }
              v34 = v75;
              v35 = v76;
              goto LABEL_50;
            }
            swift_unknownObjectRelease_n();
            v35 = v76;
          }
          else
          {
            swift_unknownObjectRelease();
          }
LABEL_50:
          if (v35 == ++v36)
            goto LABEL_23;
        }
      }
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    v35 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v35)
      goto LABEL_47;
LABEL_23:

    swift_bridgeObjectRelease();
    v20 = v71;
    v19 = v72;
    v17 = v68;
  }
  if (v20)
  {
    v26 = (v20 - 1) & v20;
    v27 = __clz(__rbit64(v20)) | (v19 << 6);
    v28 = v19;
    goto LABEL_44;
  }
  v30 = v19 + 1;
  if (__OFADD__(v19, 1))
    goto LABEL_83;
  if (v30 < v66)
  {
    v31 = *(_QWORD *)(v67 + 8 * v30);
    v28 = v19 + 1;
    if (!v31)
    {
      v28 = v19 + 2;
      if (v19 + 2 >= v66)
        goto LABEL_74;
      v31 = *(_QWORD *)(v67 + 8 * v28);
      if (!v31)
      {
        v28 = v19 + 3;
        if (v19 + 3 >= v66)
          goto LABEL_74;
        v31 = *(_QWORD *)(v67 + 8 * v28);
        if (!v31)
        {
          v28 = v19 + 4;
          if (v19 + 4 >= v66)
            goto LABEL_74;
          v31 = *(_QWORD *)(v67 + 8 * v28);
          if (!v31)
          {
            v32 = v19 + 5;
            do
            {
              if (v66 == v32)
                goto LABEL_74;
              v31 = *(_QWORD *)(v67 + 8 * v32++);
            }
            while (!v31);
            v28 = v32 - 1;
          }
        }
      }
    }
    v26 = (v31 - 1) & v31;
    v27 = __clz(__rbit64(v31)) + (v28 << 6);
LABEL_44:
    v29 = *(id *)(*(_QWORD *)(v17 + 48) + 8 * v27);
    if (!v29)
      goto LABEL_74;
    goto LABEL_45;
  }
LABEL_74:
  sub_1CFBE7A6C();
  v60 = v79;
  if (v79 >> 62)
  {
    swift_bridgeObjectRetain();
    v61 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (!v61)
      goto LABEL_86;
LABEL_76:
    if (v61 >= 1)
    {
      for (i = 0; i != v61; ++i)
      {
        if ((v60 & 0xC000000000000001) != 0)
          v63 = (id)MEMORY[0x1D17DAF80](i, v60);
        else
          v63 = *(id *)(v60 + 8 * i + 32);
        v64 = v63;
        sub_1CFBD6888((uint64_t)v63);

      }
      goto LABEL_86;
    }
    __break(1u);
  }
  else
  {
    v61 = *(_QWORD *)((v79 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v61)
      goto LABEL_76;
LABEL_86:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1CFBD9B30()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  char **v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t result;
  unint64_t v58;
  uint64_t v59;
  uint64_t i;
  id v61;
  void *v62;
  uint64_t v63;
  int64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;

  if (qword_1ED90AFE0 != -1)
    goto LABEL_73;
LABEL_2:
  v0 = sub_1CFBFA7A4();
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED90AFC0);
  v2 = sub_1CFBFA78C();
  v3 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFB7D000, v2, v3, "Check for app protected control icon elements.", v4, 2u);
    MEMORY[0x1D17DBCE8](v4, -1, -1);
  }

  v5 = objc_msgSend(*(id *)(v67 + OBJC_IVAR___CCUIPagingViewController_iconModel), sel_leafIcons);
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
  v6 = sub_1CFBFA984();

  v80 = MEMORY[0x1E0DEE9D8];
  if ((v6 & 0xC000000000000001) != 0)
  {
    sub_1CFBFAC24();
    sub_1CFBFA99C();
    v6 = v81;
    v65 = v82;
    v7 = v83;
    v8 = v84;
    v9 = v85;
  }
  else
  {
    v8 = 0;
    v10 = -1 << *(_BYTE *)(v6 + 32);
    v65 = v6 + 56;
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(v6 + 56);
    v7 = v11;
  }
  v63 = v7;
  v64 = (unint64_t)(v7 + 64) >> 6;
  v14 = &selRef_setSmallControlsResizeHandleSettings_;
  v66 = v6;
  while (v6 < 0)
  {
    v17 = sub_1CFBFAC48();
    if (!v17)
      goto LABEL_63;
    v75 = v17;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v18 = (id)v77;
    swift_unknownObjectRelease();
    v16 = v8;
    v69 = v9;
    if (!v18)
      goto LABEL_63;
LABEL_33:
    v68 = v16;
    v23 = objc_msgSend(v18, sel_iconDataSources, v63);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE20);
    v24 = sub_1CFBFA900();

    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      v25 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      v26 = &selRef_presentViewController_animated_completion_;
      if (!v25)
        goto LABEL_11;
LABEL_35:
      if (v25 >= 1)
      {
        v27 = 0;
        v73 = v18;
        v74 = v24 & 0xC000000000000001;
        v70 = v24;
        v72 = v25;
        while (1)
        {
          if (v74)
            MEMORY[0x1D17DAF80](v27, v24);
          else
            swift_unknownObjectRetain();
          v79 = v26[184];
          v28 = swift_dynamicCastObjCProtocolConditional();
          if (v28)
          {
            v29 = (void *)v28;
            swift_unknownObjectRetain();
            v30 = objc_msgSend(v29, v14[227]);
            if (v30)
            {
              v31 = v30;
              v32 = sub_1CFBFA894();
              v34 = v33;

              v35 = (void *)objc_opt_self();
              v71 = v32;
              v36 = (void *)sub_1CFBFA870();
              v37 = objc_msgSend(v35, sel_applicationWithBundleIdentifier_, v36);

              if ((objc_msgSend(v37, sel_isHidden) & 1) != 0)
              {

                goto LABEL_48;
              }
              v38 = objc_msgSend(v37, sel_isLocked);

              if (v38)
              {
LABEL_48:
                v39 = v73;
                MEMORY[0x1D17DAB9C]();
                if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_1CFBFA924();
                sub_1CFBFA930();
                sub_1CFBFA918();
                v77 = 0xD000000000000012;
                v78 = 0x80000001CFC07100;
                objc_opt_self();
                v40 = swift_dynamicCastObjCClass();
                if (v40)
                {
                  v41 = (void *)v40;
                  v75 = 0;
                  v76 = 0xE000000000000000;
                  swift_unknownObjectRetain();
                  sub_1CFBFACB4();
                  swift_bridgeObjectRelease();
                  v75 = 0xD000000000000013;
                  v76 = 0x80000001CFC07140;
                  v42 = objc_msgSend(v41, sel_extensionBundleIdentifier);
                  sub_1CFBFA894();

                  sub_1CFBFA8B8();
                  swift_bridgeObjectRelease();
                  sub_1CFBFA8B8();
                  v43 = objc_msgSend(v41, sel_kind);
                  sub_1CFBFA894();

                  sub_1CFBFA8B8();
                  swift_unknownObjectRelease();
                  swift_bridgeObjectRelease();
                  v44 = v75;
                  v45 = v76;
                  goto LABEL_54;
                }
                objc_opt_self();
                v46 = swift_dynamicCastObjCClass();
                if (v46)
                {
                  v47 = (void *)v46;
                  v75 = 0;
                  v76 = 0xE000000000000000;
                  swift_unknownObjectRetain();
                  sub_1CFBFACB4();
                  swift_bridgeObjectRelease();
                  v75 = 0xD000000000000012;
                  v76 = 0x80000001CFC07120;
                  v48 = objc_msgSend(v47, sel_moduleIdentifier);
                  sub_1CFBFA894();

                  sub_1CFBFA8B8();
                  swift_unknownObjectRelease();
                  swift_bridgeObjectRelease();
                  v44 = v75;
                  v45 = v76;
LABEL_54:
                  swift_beginAccess();
                  v77 = v44;
                  v78 = v45;
                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRetain();
                v49 = sub_1CFBFA78C();
                v50 = sub_1CFBFA9F0();
                if (os_log_type_enabled(v49, v50))
                {
                  v51 = swift_slowAlloc();
                  v52 = swift_slowAlloc();
                  v75 = v52;
                  *(_DWORD *)v51 = 136315394;
                  swift_beginAccess();
                  v53 = v1;
                  v54 = v77;
                  v55 = v78;
                  swift_bridgeObjectRetain();
                  v56 = v54;
                  v1 = v53;
                  v26 = &selRef_presentViewController_animated_completion_;
                  *(_QWORD *)(v51 + 4) = sub_1CFBC779C(v56, v55, &v75);
                  swift_bridgeObjectRelease();
                  *(_WORD *)(v51 + 12) = 2080;
                  swift_bridgeObjectRetain();
                  *(_QWORD *)(v51 + 14) = sub_1CFBC779C(v71, v34, &v75);
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_1CFB7D000, v49, v50, "Remove %s because container %s is protected.", (uint8_t *)v51, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x1D17DBCE8](v52, -1, -1);
                  MEMORY[0x1D17DBCE8](v51, -1, -1);
                  swift_unknownObjectRelease_n();

                }
                else
                {

                  swift_bridgeObjectRelease_n();
                  swift_unknownObjectRelease_n();
                }
                swift_bridgeObjectRelease();
                v14 = &selRef_setSmallControlsResizeHandleSettings_;
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease_n();
              }
              v25 = v72;
              v18 = v73;
              v24 = v70;
              goto LABEL_38;
            }
            swift_unknownObjectRelease_n();
            v25 = v72;
          }
          else
          {
            swift_unknownObjectRelease();
          }
LABEL_38:
          if (v25 == ++v27)
            goto LABEL_11;
        }
      }
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      swift_once();
      goto LABEL_2;
    }
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    v26 = &selRef_presentViewController_animated_completion_;
    if (v25)
      goto LABEL_35;
LABEL_11:

    swift_bridgeObjectRelease();
    v8 = v68;
    v9 = v69;
    v6 = v66;
  }
  if (v9)
  {
    v69 = (v9 - 1) & v9;
    v15 = __clz(__rbit64(v9)) | (v8 << 6);
    v16 = v8;
    goto LABEL_32;
  }
  v19 = v8 + 1;
  if (__OFADD__(v8, 1))
    goto LABEL_72;
  if (v19 < v64)
  {
    v20 = *(_QWORD *)(v65 + 8 * v19);
    v21 = v8 + 1;
    if (!v20)
    {
      v21 = v8 + 2;
      if (v8 + 2 >= v64)
        goto LABEL_63;
      v20 = *(_QWORD *)(v65 + 8 * v21);
      if (!v20)
      {
        v21 = v8 + 3;
        if (v8 + 3 >= v64)
          goto LABEL_63;
        v20 = *(_QWORD *)(v65 + 8 * v21);
        if (!v20)
        {
          v21 = v8 + 4;
          if (v8 + 4 >= v64)
            goto LABEL_63;
          v20 = *(_QWORD *)(v65 + 8 * v21);
          if (!v20)
          {
            v22 = v8 + 5;
            do
            {
              if (v64 == v22)
                goto LABEL_63;
              v20 = *(_QWORD *)(v65 + 8 * v22++);
            }
            while (!v20);
            v21 = v22 - 1;
            v6 = v66;
          }
        }
      }
    }
    v69 = (v20 - 1) & v20;
    v16 = v21;
    v15 = __clz(__rbit64(v20)) + (v21 << 6);
LABEL_32:
    v18 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
    if (!v18)
      goto LABEL_63;
    goto LABEL_33;
  }
LABEL_63:
  result = sub_1CFBE7A6C();
  v58 = v80;
  if (v80 >> 62)
  {
    swift_bridgeObjectRetain();
    v59 = sub_1CFBFAD2C();
    result = swift_bridgeObjectRelease();
    if (!v59)
      return swift_bridgeObjectRelease();
LABEL_65:
    if (v59 >= 1)
    {
      for (i = 0; i != v59; ++i)
      {
        if ((v58 & 0xC000000000000001) != 0)
          v61 = (id)MEMORY[0x1D17DAF80](i, v58);
        else
          v61 = *(id *)(v58 + 8 * i + 32);
        v62 = v61;
        sub_1CFBD6888((uint64_t)v61);

      }
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  else
  {
    v59 = *(_QWORD *)((v80 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v59)
      goto LABEL_65;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1CFBDA534(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = objc_msgSend(a1, sel_icon);
  if (v3)
  {
    v10 = v3;
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (v4 && objc_msgSend(v4, sel_activeDataSource))
    {
      objc_opt_self();
      v5 = swift_dynamicCastObjCClass();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = objc_msgSend(*(id *)(a2 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider), sel_descriptorFor_, v5);
        v8 = v7;
        if (v7 && (v9 = objc_msgSend(v7, sel_displayName)) != 0
          || (v9 = objc_msgSend(v6, sel_sbh_appName)) != 0)
        {
          sub_1CFBFA894();

          v9 = (id)sub_1CFBFA870();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v6, sel_setDisplayName_, v9);
        swift_unknownObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }

  }
}

void sub_1CFBDA6C0()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  NSObject *oslog;

  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_iconModel];
  v2 = objc_msgSend(v1, sel_rootFolder);
  if (!v2)
    goto LABEL_4;
  v3 = v2;
  if ((objc_msgSend(v2, sel_isIconStateDirty) & 1) != 0)
  {

LABEL_4:
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v4 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED90AFC0);
    oslog = sub_1CFBFA78C();
    v5 = sub_1CFBFA9D8();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CFB7D000, oslog, v5, "Unexpectedly found dirty folder icon state while updating supported sizes for Dynamic Type setting.", v6, 2u);
      MEMORY[0x1D17DBCE8](v6, -1, -1);
    }
    goto LABEL_12;
  }
  objc_msgSend(v3, sel_setDelegate_, 0);
  objc_msgSend(v3, sel_removeFolderObserver_, v0);
  objc_msgSend(v1, sel_layout);
  oslog = objc_msgSend(v1, sel_rootFolder);
  if (oslog)
  {
    v7 = oslog;
    -[NSObject addFolderObserver:](v7, sel_addFolderObserver_, v0);
    -[NSObject setDelegate:](v7, sel_setDelegate_, v0);

  }
  objc_msgSend(v0, sel_loadViewIfNeeded);
  v8 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v8)
  {
    objc_msgSend(v8, sel_setFolder_, oslog);

LABEL_12:
    return;
  }
  __break(1u);
}

void sub_1CFBDA89C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility) & 1) == 0)
  {
    v1 = v0;
    v2 = OBJC_IVAR___CCUIPagingViewController_needsUpdateToSupportedSizesForAccessibility;
    if (*(_BYTE *)(v0 + OBJC_IVAR___CCUIPagingViewController_needsUpdateToSupportedSizesForAccessibility) == 1)
    {
      if (qword_1ED90AFE0 != -1)
        swift_once();
      v3 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v3, (uint64_t)qword_1ED90AFC0);
      v4 = sub_1CFBFA78C();
      v5 = sub_1CFBFA9D8();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1CFB7D000, v4, v5, "Updating supported sizes for accessibility after delay.", v6, 2u);
        MEMORY[0x1D17DBCE8](v6, -1, -1);
      }

      *(_BYTE *)(v1 + v2) = 0;
      sub_1CFBDA9B8(1, 0);
    }
  }
}

void sub_1CFBDA9B8(char a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char isEscapingClosureAtFileLocation;
  void *v38;
  uint64_t v39;
  __int128 v40;
  unint64_t v41;
  char **v42;
  char **v43;
  char **v44;
  id v45;
  void *v46;
  BOOL v47;
  unint64_t v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  unsigned __int8 v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  void *v68;
  id v69;
  unint64_t v70;
  unint64_t v71;
  char **v72;
  void *v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  id v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  _BOOL4 v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  os_log_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  char *v102;
  uint64_t v103;
  void (*v104)(void);
  char *v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t, uint64_t, uint64_t);
  _BYTE *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  char *v114;
  uint64_t v115;
  void (*v116)(char *, char *, uint64_t);
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  _BYTE *v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  char *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136[2];
  id v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  char *v144;
  char *v145;
  int v146;
  os_log_t v147;
  uint64_t v148;
  char **v149;
  char *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  char *v156;
  uint64_t v157;
  _BYTE *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  int v163;
  void *v164;
  unint64_t v165;
  uint64_t v166;
  NSObject *v167;
  uint64_t v168;
  char *v169;
  uint64_t aBlock[6];
  unint64_t v171;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v136 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v136 - v9;
  v11 = sub_1CFBFA714();
  v160 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v12);
  v156 = (char *)v136 - v13;
  *(_QWORD *)&v17 = MEMORY[0x1E0C80A78](v14).n128_u64[0];
  v145 = (char *)v136 - v18;
  if ((v2[OBJC_IVAR___CCUIPagingViewController_isUpdatingSupportedSizesForAccessibility] & 1) != 0)
  {
    if (qword_1ED90AFE0 == -1)
    {
LABEL_3:
      v19 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v19, (uint64_t)qword_1ED90AFC0);
      v167 = sub_1CFBFA78C();
      v20 = sub_1CFBFA9E4();
      if (!os_log_type_enabled(v167, v20))
      {
LABEL_11:

        return;
      }
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      v22 = "Unexpectedly tried to update supported sizes for Dynamic Type setting recursively.";
LABEL_10:
      _os_log_impl(&dword_1CFB7D000, v167, v20, v22, v21, 2u);
      MEMORY[0x1D17DBCE8](v21, -1, -1);
      goto LABEL_11;
    }
LABEL_99:
    swift_once();
    goto LABEL_3;
  }
  v138 = v16;
  v161 = v15;
  v139 = OBJC_IVAR___CCUIPagingViewController_isUpdatingSupportedSizesForAccessibility;
  v137 = *(id *)&v2[OBJC_IVAR___CCUIPagingViewController_iconModel];
  if ((objc_msgSend(v137, sel_isIconStateDirty, v17) & 1) != 0)
  {
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v23 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v23, (uint64_t)qword_1ED90AFC0);
    v167 = sub_1CFBFA78C();
    v20 = sub_1CFBFA9D8();
    if (!os_log_type_enabled(v167, v20))
      goto LABEL_11;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    v22 = "Unexpectedly found dirty icon state while updating supported sizes for Dynamic Type setting.";
    goto LABEL_10;
  }
  v2[v139] = 1;
  v158 = v2;
  if ((a1 & 1) != 0)
  {
    sub_1CFBDA6C0();
    v2 = v158;
  }
  objc_msgSend(v2, sel_loadViewIfNeeded);
  v152 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  v24 = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v24)
    goto LABEL_105;
  v151 = objc_msgSend(v24, sel_folder);
  if (!v151)
  {
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v29 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v29, (uint64_t)qword_1ED90AFC0);
    v30 = sub_1CFBFA78C();
    v31 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1CFB7D000, v30, v31, "Unexpectedly missing root folder.", v32, 2u);
      MEMORY[0x1D17DBCE8](v32, -1, -1);
    }

    v158[v139] = 0;
    return;
  }
  v150 = v10;
  v25 = objc_msgSend(v158, sel_traitCollection);
  v26 = objc_msgSend(v25, sel_preferredContentSizeCategory);

  v27 = sub_1CFBFAA98();
  if (a2)
  {
    v28 = a2;
  }
  else
  {
    v33 = objc_msgSend(v137, sel_leafIcons);
    sub_1CFBBAA24(0, &qword_1ED90AD60);
    sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
    v28 = sub_1CFBFA984();

  }
  v171 = MEMORY[0x1E0DEE9D8];
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = v28;
  v34[3] = &v171;
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_1CFBE785C;
  *(_QWORD *)(v35 + 24) = v34;
  v136[1] = v34;
  aBlock[4] = (uint64_t)sub_1CFBBA9A0;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1CFBD534C;
  aBlock[3] = (uint64_t)&block_descriptor_135;
  v36 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v151, sel_enumerateAllIconsWithOptions_usingBlock_, 1, v36);
  _Block_release(v36);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_101:
    swift_bridgeObjectRetain();
    v39 = sub_1CFBFAD2C();
    if (v39)
      goto LABEL_27;
LABEL_102:
    swift_bridgeObjectRelease();
    objc_msgSend(v137, sel_markIconStateClean);
    objc_msgSend(v136[0], sel_invalidate);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    v158[v139] = 0;
    swift_release();
    return;
  }
  v38 = (void *)sub_1CFBFA870();
  v136[0] = objc_msgSend(v137, sel_disableIconStateAutosaveForReason_, v38);

  v35 = v171;
  if (v171 >> 62)
    goto LABEL_101;
  v39 = *(_QWORD *)((v171 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v39)
    goto LABEL_102;
LABEL_27:
  v41 = 0;
  v155 = v35 & 0xC000000000000001;
  v141 = v35 & 0xFFFFFFFFFFFFFF8;
  v140 = v35 + 32;
  v149 = &v169;
  v42 = &selRef_presentViewController_animated_completion_;
  v43 = &selRef_setSmallControlsResizeHandleSettings_;
  v44 = &selRef_setSmallControlsResizeHandleSettings_;
  *(_QWORD *)&v40 = 136315650;
  v143 = v40;
  v142 = MEMORY[0x1E0DEE9B8] + 8;
  v144 = v7;
  v163 = v27;
  v154 = v35;
  v153 = v39;
  while (1)
  {
    if (v155)
    {
      v45 = (id)MEMORY[0x1D17DAF80](v41, v35);
    }
    else
    {
      if (v41 >= *(_QWORD *)(v141 + 16))
        goto LABEL_98;
      v45 = *(id *)(v140 + 8 * v41);
    }
    v46 = v45;
    v47 = __OFADD__(v41, 1);
    v48 = v41 + 1;
    if (v47)
    {
      __break(1u);
      goto LABEL_97;
    }
    v162 = v48;
    v49 = objc_msgSend(v45, sel_iconDataSources);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AE20);
    v50 = sub_1CFBFA900();

    if (v50 >> 62)
      break;
    v51 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v51)
      goto LABEL_36;
LABEL_28:

    swift_bridgeObjectRelease();
    v41 = v162;
    v35 = v154;
    if (v162 == v153)
      goto LABEL_102;
  }
  swift_bridgeObjectRetain();
  v51 = sub_1CFBFAD2C();
  swift_bridgeObjectRelease();
  if (!v51)
    goto LABEL_28;
LABEL_36:
  if (v51 < 1)
  {
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v52 = 0;
  v166 = v51;
  v167 = (v50 & 0xC000000000000001);
  v164 = v46;
  v165 = v50;
  while (1)
  {
    if (v167)
      MEMORY[0x1D17DAF80](v52, v50);
    else
      swift_unknownObjectRetain();
    v169 = v42[184];
    v53 = swift_dynamicCastObjCProtocolConditional();
    if (!v53)
      goto LABEL_39;
    v54 = (void *)v53;
    swift_unknownObjectRetain();
    objc_msgSend(v54, v43[431], v27 & 1);
    if ((objc_msgSend(v54, sel_respondsToSelector_, v44[432]) & 1) == 0)
    {
      swift_unknownObjectRelease();
      goto LABEL_39;
    }
    v55 = objc_msgSend(v54, v44[432], v46);
    v56 = objc_msgSend(v46, sel_gridSizeClass);
    v57 = v46;
    v58 = objc_msgSend(v55, sel_containsGridSizeClass_, v56);

    if ((v58 & 1) != 0)
    {
      swift_unknownObjectRelease();
      v43 = &selRef_setSmallControlsResizeHandleSettings_;
      v44 = &selRef_setSmallControlsResizeHandleSettings_;
      v46 = v57;
LABEL_50:
      v50 = v165;
      v51 = v166;
      goto LABEL_39;
    }
    v59 = objc_msgSend(v57, sel_gridSizeClass);
    CCUIGridSizeClassForSBHIconGridSizeClass();

    CCUIAdjustGridSizeClassForAccessibility();
    v60 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    v61 = objc_msgSend(v57, sel_gridSizeClass);
    v62 = sub_1CFBFA894();
    v64 = v63;
    if (v62 == sub_1CFBFA894() && v64 == v65)
    {

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      LOBYTE(v27) = v163;
      v42 = &selRef_presentViewController_animated_completion_;
      v43 = &selRef_setSmallControlsResizeHandleSettings_;
      v44 = &selRef_setSmallControlsResizeHandleSettings_;
      v46 = v164;
      goto LABEL_50;
    }
    v66 = sub_1CFBFAD8C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v165;
    v51 = v166;
    if ((v66 & 1) != 0)
    {

      goto LABEL_85;
    }
    objc_opt_self();
    v67 = swift_dynamicCastObjCClass();
    if (v67)
    {
      v68 = (void *)v67;
      swift_unknownObjectRetain();
      v69 = objc_msgSend(v68, sel_kind);
      v157 = sub_1CFBFA894();
      v71 = v70;
      swift_unknownObjectRelease();
      v72 = &selRef_controlCenterWillPresent;
      v73 = v164;
LABEL_59:

      goto LABEL_60;
    }
    objc_opt_self();
    v74 = swift_dynamicCastObjCClass();
    v72 = &selRef_controlCenterWillPresent;
    if (v74)
    {
      v75 = (void *)v74;
      swift_unknownObjectRetain();
      v69 = objc_msgSend(v75, sel_moduleIdentifier);
      v157 = sub_1CFBFA894();
      v71 = v76;
      swift_unknownObjectRelease();
      v73 = v164;
      goto LABEL_59;
    }
    v77 = objc_msgSend(v54, sel_containerBundleIdentifier);
    v73 = v164;
    if (v77)
    {
      v69 = v77;
      v157 = sub_1CFBFA894();
      v71 = v78;
      goto LABEL_59;
    }
    v71 = 0xEF3E726569666974;
    v157 = 0x6E656469206F6E3CLL;
LABEL_60:
    if (qword_1ED90AFE0 != -1)
      swift_once();
    v79 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v79, (uint64_t)qword_1ED90AFC0);
    v80 = v73;
    v81 = v60;
    v82 = v80;
    v83 = v81;
    swift_bridgeObjectRetain();
    v84 = sub_1CFBFA78C();
    v85 = sub_1CFBFA9F0();
    v86 = v85;
    v87 = os_log_type_enabled(v84, v85);
    v159 = v83;
    if (v87)
    {
      v88 = swift_slowAlloc();
      v147 = v84;
      v89 = v82;
      v90 = v88;
      v148 = swift_slowAlloc();
      aBlock[0] = v148;
      *(_DWORD *)v90 = v143;
      v146 = v86;
      swift_bridgeObjectRetain();
      v168 = sub_1CFBC779C(v157, v71, aBlock);
      sub_1CFBFABD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v90 + 12) = 2080;
      v157 = v90 + 14;
      v91 = objc_msgSend(v89, v72[117]);
      v92 = sub_1CFBFA894();
      v94 = v93;

      v168 = sub_1CFBC779C(v92, v94, aBlock);
      sub_1CFBFABD0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v90 + 22) = 2080;
      v95 = sub_1CFBFA894();
      v168 = sub_1CFBC779C(v95, v96, aBlock);
      sub_1CFBFABD0();

      swift_bridgeObjectRelease();
      v97 = v147;
      _os_log_impl(&dword_1CFB7D000, v147, (os_log_type_t)v146, "Adjusting size class of %s from %s to %s due to Dynamic Type setting.", (uint8_t *)v90, 0x20u);
      v98 = v148;
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v98, -1, -1);
      MEMORY[0x1D17DBCE8](v90, -1, -1);

      v99 = (uint64_t)v150;
      v42 = &selRef_presentViewController_animated_completion_;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v99 = (uint64_t)v150;
      v42 = &selRef_presentViewController_animated_completion_;
      v89 = v82;
    }
    v44 = &selRef_setSmallControlsResizeHandleSettings_;
    v51 = v166;
    v157 = (uint64_t)v89;
    v100 = objc_msgSend(v151, sel_indexPathForIcon_, v89);
    if (!v100)
    {
      v107 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v160 + 56);
      v107(v99, 1, 1, v161);
      goto LABEL_69;
    }
    v101 = v100;
    v102 = v156;
    sub_1CFBFA708();

    v103 = v160;
    v104 = *(void (**)(void))(v160 + 32);
    v105 = v102;
    v106 = v161;
    ((void (*)(uint64_t, char *, uint64_t))v104)(v99, v105, v161);
    v107 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v103 + 56);
    v107(v99, 0, 1, v106);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v99, 1, v106) == 1)
    {
      v44 = &selRef_setSmallControlsResizeHandleSettings_;
LABEL_69:
      v46 = v164;
      sub_1CFBE7CCC(v99, &qword_1ED90AFA0);
      goto LABEL_70;
    }
    v126 = v145;
    v104();
    v127 = sub_1CFBD7B94();
    v129 = v128;

    v46 = v164;
    if (!v129)
    {
      (*(void (**)(char *, uint64_t))(v160 + 8))(v126, v106);
      v44 = &selRef_setSmallControlsResizeHandleSettings_;
      goto LABEL_70;
    }
    v130 = v129;
    v131 = objc_msgSend(v130, sel_displayedIconViewForIcon_, v157);
    if (!v131)
    {
      (*(void (**)(char *, uint64_t))(v160 + 8))(v145, v161);
LABEL_91:

      v44 = &selRef_setSmallControlsResizeHandleSettings_;
      goto LABEL_70;
    }
    v132 = v131;
    if (!objc_msgSend(v131, sel_listLayout))
    {
      (*(void (**)(char *, uint64_t))(v160 + 8))(v145, v161);

      goto LABEL_91;
    }
    objc_msgSend(v132, sel_iconImageInfo);
    SBHIconListLayoutIconImageInfoForGridSizeClass();
    objc_msgSend(v132, sel_setIconImageInfo_);
    v133 = objc_msgSend(v132, sel_customIconImageViewController);
    if (v133)
    {
      v134 = v133;
      objc_opt_self();
      v135 = (void *)swift_dynamicCastObjCClass();
      if (v135)
      {
        objc_msgSend(v135, sel_setGridSizeClass_, CCUIGridSizeClassForSBHIconGridSizeClass());

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v160 + 8))(v145, v161);
        v42 = &selRef_presentViewController_animated_completion_;
        v44 = &selRef_setSmallControlsResizeHandleSettings_;
        v46 = v164;
        goto LABEL_70;
      }

      v46 = v164;
    }
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v160 + 8))(v145, v161);
    v42 = &selRef_presentViewController_animated_completion_;
    v44 = &selRef_setSmallControlsResizeHandleSettings_;
LABEL_70:
    v108 = v158;
    objc_msgSend(v158, sel_loadViewIfNeeded);
    v109 = *(void **)&v108[v152];
    if (!v109)
      break;
    v110 = objc_msgSend(v109, sel_folder);
    if (v110)
    {
      v111 = v110;
      v112 = objc_msgSend(v110, sel_indexPathForIcon_, v157);
      if (v112)
      {
        v113 = v112;
        v114 = v156;
        sub_1CFBFA708();

        v115 = v160;
        v116 = *(void (**)(char *, char *, uint64_t))(v160 + 32);
        v117 = (uint64_t)v144;
        v118 = v114;
        v119 = v161;
        v116(v144, v118, v161);
        v107(v117, 0, 1, v119);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v117, 1, v119) != 1)
        {
          v120 = v138;
          v116(v138, (char *)v117, v161);
          v121 = v158;
          objc_msgSend(v158, sel_loadViewIfNeeded);
          v122 = *(void **)&v121[v152];
          LOBYTE(v27) = v163;
          if (!v122)
            goto LABEL_104;
          v123 = objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v122, sel_orientation), 0);
          v124 = (void *)sub_1CFBFA6FC();
          v125 = v159;

          (*(void (**)(char *, uint64_t))(v160 + 8))(v120, v161);
          swift_unknownObjectRelease();
          goto LABEL_86;
        }
      }
      else
      {
        v117 = (uint64_t)v144;
        v107((uint64_t)v144, 1, 1, v161);
      }

      sub_1CFBE7CCC(v117, &qword_1ED90AFA0);
LABEL_85:
      swift_unknownObjectRelease();
      LOBYTE(v27) = v163;
LABEL_86:
      v42 = &selRef_presentViewController_animated_completion_;
      v43 = &selRef_setSmallControlsResizeHandleSettings_;
      v44 = &selRef_setSmallControlsResizeHandleSettings_;
      v46 = v164;
      goto LABEL_39;
    }

    swift_unknownObjectRelease();
    LOBYTE(v27) = v163;
    v43 = &selRef_setSmallControlsResizeHandleSettings_;
LABEL_39:
    ++v52;
    swift_unknownObjectRelease();
    if (v51 == v52)
      goto LABEL_28;
  }
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
}

void sub_1CFBDBCDC(void *a1, uint64_t a2, _BYTE *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    v15 = a1;
    v11 = sub_1CFBD8F54(v10, a4);
    v12 = v15;
    if ((v11 & 1) == 0)
    {
LABEL_13:

      return;
    }
    MEMORY[0x1D17DAB9C](v15);
    if (*(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CFBFA924();
    sub_1CFBFA930();
    sub_1CFBFA918();
    if (*a5 >> 62)
    {
      swift_bridgeObjectRetain();
      v13 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      if ((a4 & 0xC000000000000001) != 0)
        goto LABEL_7;
    }
    else
    {
      v13 = *(_QWORD *)((*a5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if ((a4 & 0xC000000000000001) != 0)
      {
LABEL_7:
        v14 = sub_1CFBFAC30();
        goto LABEL_11;
      }
    }
    v14 = *(_QWORD *)(a4 + 16);
LABEL_11:
    v12 = v15;
    if (v13 == v14)
      *a3 = 1;
    goto LABEL_13;
  }
}

id sub_1CFBDBE2C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id result;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = v2;
  v26 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CFBFA714();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](v12).n128_u64[0];
  v15 = (char *)&v25 - v14;
  objc_msgSend(v3, sel_loadViewIfNeeded, v13);
  v16 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
  result = *(id *)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  result = objc_msgSend(result, sel_folder);
  if (result)
  {
    v18 = result;
    v19 = objc_msgSend(result, sel_indexPathForIcon_, a1);
    if (v19)
    {
      v20 = v19;
      sub_1CFBFA708();

      v21 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v21(v7, v11, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        v21(v15, v7, v8);
        result = objc_msgSend(v3, sel_loadViewIfNeeded);
        v22 = *(void **)&v3[v16];
        if (v22)
        {
          v23 = objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v22, sel_orientation), 0);
          v24 = (void *)sub_1CFBFA6FC();

          return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v8);
        }
        goto LABEL_11;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    }

    return (id)sub_1CFBE7CCC((uint64_t)v7, &qword_1ED90AFA0);
  }
  return result;
}

void sub_1CFBDC100(void *a1, void *a2)
{
  uint64_t v2;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD aBlock[6];

  v11 = objc_msgSend(a1, sel_contentViewController);
  if ((objc_msgSend(v11, sel_respondsToSelector_, sel_wantsConfigurationIntent) & 1) != 0
    && (objc_msgSend(v11, sel_wantsConfigurationIntent) & 1) != 0)
  {
    v4 = *(void **)(v2 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
    v5 = objc_msgSend(a2, sel_containerBundleIdentifier);
    if (!v5)
    {
      sub_1CFBFA894();
      v5 = (id)sub_1CFBFA870();
      swift_bridgeObjectRelease();
    }
    v6 = objc_msgSend(a2, sel_uniqueIdentifier);
    if (!v6)
    {
      sub_1CFBFA894();
      v6 = (id)sub_1CFBFA870();
      swift_bridgeObjectRelease();
    }
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v11;
    aBlock[4] = sub_1CFBE7A74;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBDC328;
    aBlock[3] = &block_descriptor_225;
    v8 = _Block_copy(aBlock);
    v9 = v11;
    swift_release();
    v10 = objc_msgSend(v4, sel_intentWithBundleIdentifier_dataSourceIdentifier_defaultIntentProvider_, v5, v6, v8);
    _Block_release(v8);

    if (v10)
    {
      objc_msgSend(v9, sel_setConfigurationIntent_, v10);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {

  }
}

id sub_1CFBDC2E0(void *a1)
{
  id result;

  result = objc_msgSend(a1, sel_respondsToSelector_, sel_defaultConfigurationIntent);
  if ((result & 1) != 0)
    return objc_msgSend(a1, sel_defaultConfigurationIntent);
  __break(1u);
  return result;
}

id sub_1CFBDC328(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = (void *)v1(v2);
  swift_release();
  return v3;
}

void sub_1CFBDC360(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  id v15;

  v2 = objc_msgSend(a1, sel_icon);
  if (v2)
  {
    v15 = v2;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3 && objc_msgSend(v3, sel_activeDataSource))
    {
      objc_opt_self();
      v4 = swift_dynamicCastObjCClass();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = objc_msgSend(a1, sel_customIconImageViewController);
        if (v6)
        {
          v7 = v6;
          objc_opt_self();
          v8 = swift_dynamicCastObjCClass();
          if (v8)
          {
            v9 = (void *)v8;
            if (qword_1ED90AFE0 != -1)
              swift_once();
            v10 = sub_1CFBFA7A4();
            __swift_project_value_buffer(v10, (uint64_t)qword_1ED90AFC0);
            v11 = sub_1CFBFA78C();
            v12 = sub_1CFBFA9F0();
            if (os_log_type_enabled(v11, v12))
            {
              v13 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v13 = 0;
              _os_log_impl(&dword_1CFB7D000, v11, v12, "Updating all known module configurations...", v13, 2u);
              MEMORY[0x1D17DBCE8](v13, -1, -1);
            }

            sub_1CFBDC100(v9, v5);
            v14 = v15;
            v15 = v7;
          }
          else
          {
            v14 = v7;
          }

        }
      }
      swift_unknownObjectRelease();
    }

  }
}

void sub_1CFBDC54C(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_1CFBFA7A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = MEMORY[0x1D17DBD84](a3 + 16);
  if (v9)
  {
    v10 = (_BYTE *)v9;
    if (a1 == 1)
    {
      v11 = MKBGetDeviceLockState();
      if (v11 == 3 || !v11)
      {
        v12 = OBJC_IVAR___CCUIPagingViewController_isFinishedRunningFirstUnlockTasks;
        if ((v10[OBJC_IVAR___CCUIPagingViewController_isFinishedRunningFirstUnlockTasks] & 1) == 0)
        {
          sub_1CFBFA780();
          v13 = sub_1CFBFA78C();
          v14 = sub_1CFBFA9F0();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1CFB7D000, v13, v14, "Running first unlock tasks...", v15, 2u);
            MEMORY[0x1D17DBCE8](v15, -1, -1);
          }

          v16 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          MEMORY[0x1E0C80A78](v16);
          *(&v17 - 2) = (uint64_t)v10;
          sub_1CFBD6DAC((uint64_t)sub_1CFBE7E00, (uint64_t)(&v17 - 4));
          sub_1CFBF8F54();
          v10[v12] = 1;
        }
      }
    }

  }
}

void sub_1CFBDC6E4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id PagingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void PagingViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

Swift::Void __swiftcall PagingViewController.settings(_:changedValueForKey:)(PTSettings_optional *_, Swift::String_optional changedValueForKey)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = v2 + OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer;
  swift_beginAccess();
  v4 = MEMORY[0x1D17DBD84](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_1CFBD487C();
    v7 = v6;
    objc_msgSend(v6, sel_longPressToEditDuration);
    v9 = v8;

    objc_msgSend(v5, sel_setMinimumPressDuration_, v9);
  }
}

__C::CGRect __swiftcall PagingViewController.compactModeFrame(for:)(CCUIContentModuleContainerViewController *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __C::CGRect result;

  v2 = objc_msgSend(v1, sel_compactModeSourceViewForContentModuleContainerViewController_, a1);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v1, sel_bs_presentationContextDefiningViewController);
    if (!v4)
    {
      __break(1u);
      goto LABEL_7;
    }
    v9 = v4;
    objc_msgSend(v3, sel_bounds);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = objc_msgSend(v9, sel_view);
    objc_msgSend(v3, sel_convertRect_toView_, v18, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v20 = 0.0;
    v22 = 0.0;
    v24 = 0.0;
    v26 = 0.0;
  }
  v5 = v20;
  v6 = v22;
  v7 = v24;
  v8 = v26;
LABEL_7:
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

BOOL PagingViewController.contentModuleContainerViewController(_:canBeginInteractionWith:)()
{
  char *v0;
  id v2;
  unint64_t v3;
  uint64_t v4;

  if ((objc_msgSend(v0, sel_isEditing) & 1) != 0)
    return 0;
  v2 = objc_msgSend(*(id *)&v0[OBJC_IVAR___CCUIPagingViewController_expandedViewControllers], sel_allObjects);
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v3 = sub_1CFBFA900();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v4 == 0;
}

void *PagingViewController.contentModuleContainerViewController(_:didOpenExpandedModule:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *result;

  v3 = v1 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x1D17DBD84](v3);
  if (result)
  {
    objc_msgSend(result, sel_pagingViewController_didExpand_, v1, a1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void PagingViewController.contentModuleContainerViewController(_:willCloseExpandedModule:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_removeObject_, a1);
  v3 = v1 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1D17DBD84](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_pagingViewController_willClose_, v1, a1);
    swift_unknownObjectRelease();
  }
  sub_1CFBD78A8(0, a1);
}

uint64_t sub_1CFBDD06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_1CFBFA954();
  *(_QWORD *)(v4 + 24) = sub_1CFBFA948();
  sub_1CFBFA93C();
  return swift_task_switch();
}

uint64_t sub_1CFBDD0D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  *(_BYTE *)(v1 + OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility) = 0;
  sub_1CFBDA89C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1CFBDD124(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id))
{
  id v7;
  id v8;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a1;
  a5(v7);

  swift_unknownObjectRelease();
}

Swift::Void __swiftcall PagingViewController.contentModuleContainerViewController(_:willPresent:)(CCUIContentModuleContainerViewController *_, UIViewController *willPresent)
{
  sub_1CFBDD1C0((uint64_t)_, (uint64_t)willPresent, (SEL *)&selRef_pagingViewController_willPresent_, 1);
}

Swift::Void __swiftcall PagingViewController.contentModuleContainerViewController(_:willDismiss:)(CCUIContentModuleContainerViewController *_, UIViewController *willDismiss)
{
  sub_1CFBDD1C0((uint64_t)_, (uint64_t)willDismiss, (SEL *)&selRef_pagingViewController_willDismiss_, 0);
}

void sub_1CFBDD1C0(uint64_t a1, uint64_t a2, SEL *a3, char a4)
{
  uint64_t v4;
  uint64_t v8;
  void *v9;

  v8 = v4 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v9 = (void *)MEMORY[0x1D17DBD84](v8);
  if (v9)
  {
    objc_msgSend(v9, *a3, v4, a1);
    swift_unknownObjectRelease();
  }
  sub_1CFBD78A8(a4 & 1, 0);
}

void sub_1CFBDD260(char *a1, uint64_t a2, void *a3, void *a4, SEL *a5, char a6)
{
  char *v11;
  void *v12;
  id v13;
  id v14;
  char *v15;

  v11 = &a1[OBJC_IVAR___CCUIPagingViewController_pagingDelegate];
  swift_beginAccess();
  v12 = (void *)MEMORY[0x1D17DBD84](v11);
  v13 = a3;
  v14 = a4;
  v15 = a1;
  if (v12)
  {
    objc_msgSend(v12, *a5, v15, v13);
    swift_unknownObjectRelease();
  }
  sub_1CFBD78A8(a6 & 1, 0);

}

Swift::Void __swiftcall PagingViewController.contentModuleContainerViewControllerDismissPresentedContent(_:)(CCUIContentModuleContainerViewController *a1)
{
  sub_1CFBD13D4(1, 0, 0);
}

uint64_t PagingViewController.viewMap(_:maxRecycledViewsOf:)()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy);
}

id PagingViewController.recycledViewsContainerProvider(for:)()
{
  void *v0;
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v2 = result;
  v3 = objc_msgSend(result, sel_window);

  if (v3)
  {
    result = (id)swift_dynamicCastObjCProtocolConditional();
    if (result)
      return result;

  }
  return 0;
}

uint64_t PagingViewController.controllerClass(for:)()
{
  return type metadata accessor for IconListFolderController();
}

Swift::Bool __swiftcall PagingViewController.folderController(_:canChangeCurrentPageIndexTo:)(SBFolderController *_, Swift::Int canChangeCurrentPageIndexTo)
{
  return 1;
}

Swift::Bool __swiftcall PagingViewController.folderControllerShouldClose(_:withPinchGesture:)(SBFolderController *_, UIPinchGestureRecognizer *withPinchGesture)
{
  return 0;
}

Swift::Void __swiftcall PagingViewController.folderControllerWillBeginScrolling(_:)(SBFolderController *a1)
{
  uint64_t v1;
  void *v2;

  sub_1CFBD65BC(0x63537265646C6F66, 0xEF676E696C6C6F72);
  v2 = *(void **)(v1 + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (v2)
    objc_msgSend(v2, sel_noteFolderBeganScrolling);
  else
    __break(1u);
}

Swift::Void __swiftcall PagingViewController.folderControllerDidEndScrolling(_:)(SBFolderController *a1)
{
  uint64_t v1;
  _QWORD **v2;
  uint64_t v3;
  char v4;
  unint64_t v5;

  v2 = (_QWORD **)(v1 + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  v3 = sub_1CFBD66C8(0x63537265646C6F66, 0xEF676E696C6C6F72, *v2);
  if ((v4 & 1) == 0)
  {
    v5 = v3;
    swift_beginAccess();
    sub_1CFBD67AC(v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
}

id PagingViewController.draggingDelegate(for:)()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (result)
    return result;
  __break(1u);
  return result;
}

id PagingViewController.customImageViewController(for:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  objc_class *v26;
  _BYTE *v27;
  _OWORD *v28;
  int64x2_t *v29;
  id v30;
  objc_class *v31;
  _BYTE *v32;
  _OWORD *v33;
  int64x2_t *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  objc_class *v81;
  char *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  int v102;
  id v103;
  objc_class *v104;
  _BYTE *v105;
  _OWORD *v106;
  int64x2_t *v107;
  id v109;
  objc_class *v110;
  _BYTE *v111;
  _OWORD *v112;
  int64x2_t *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  id v118;
  uint64_t v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  objc_super v127;
  _QWORD aBlock[6];
  objc_super v129;
  objc_super v130;
  objc_super v131;
  objc_super v132;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AF90);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CFBFA6D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v11 = MEMORY[0x1E0C80A78](v10).n128_u64[0];
  v13 = (char *)&v118 - v12;
  v14 = objc_msgSend(a1, sel_icon, v11);
  if (!v14)
  {
    v25 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v26 = (objc_class *)type metadata accessor for ColorViewController();
    v27 = objc_allocWithZone(v26);
    v28 = &v27[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v28 = 0u;
    v28[1] = 0u;
    v29 = (int64x2_t *)&v27[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v29->i64[0] = 0;
    v29->i64[1] = 0;
    v29[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v27[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v27[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v27[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v25;
    v132.receiver = v27;
    v132.super_class = v26;
    return objc_msgSendSuper2(&v132, sel_initWithNibName_bundle_, 0, 0);
  }
  v15 = v14;
  objc_opt_self();
  v16 = swift_dynamicCastObjCClass();
  if (!v16)
  {
    v30 = objc_msgSend((id)objc_opt_self(), sel_magentaColor);
    v31 = (objc_class *)type metadata accessor for ColorViewController();
    v32 = objc_allocWithZone(v31);
    v33 = &v32[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v33 = 0u;
    v33[1] = 0u;
    v34 = (int64x2_t *)&v32[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v34->i64[0] = 0;
    v34->i64[1] = 0;
    v34[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v32[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v32[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v32[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v30;
    v131.receiver = v32;
    v131.super_class = v31;
    v20 = objc_msgSendSuper2(&v131, sel_initWithNibName_bundle_, 0, 0);
LABEL_43:

    return v20;
  }
  v17 = (void *)v16;
  v126 = v6;
  v15 = v15;
  v18 = objc_msgSend(v17, sel_activeDataSource);
  if (v18)
  {
    v19 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache) + 16), sel_objectForKey_, v18);
    if (v19)
    {
      v20 = v19;
      objc_opt_self();
      v21 = swift_dynamicCastObjCClass();
      if (v21)
      {
        v22 = (void *)v21;
        v20 = v20;
        v23 = objc_msgSend(v15, sel_gridSizeClass);
        v24 = CCUIGridSizeClassForSBHIconGridSizeClass();

        objc_msgSend(v22, sel_setGridSizeClass_, v24);
      }
      goto LABEL_7;
    }
    swift_unknownObjectRelease();
  }
  v35 = objc_msgSend(v17, sel_activeDataSource);
  if (v35)
  {
    v36 = v35;
    v37 = *(void **)(v1 + OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource);
    if (v37)
    {
      v38 = objc_msgSend(v37, sel_objectForKey_, v36);
      if (v38)
      {
        v20 = v38;
        v39 = *(_QWORD *)(v1 + OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache);
        ObjectType = swift_getObjectType();
        sub_1CFBC1414(v20, v36, v39, ObjectType);

        swift_unknownObjectRelease();
        return v20;
      }
    }
    swift_unknownObjectRelease();
  }
  objc_opt_self();
  v41 = swift_dynamicCastObjCClass();
  if (v41)
  {
    v42 = (void *)v41;
    v43 = v15;
    v44 = objc_msgSend(v42, sel_activeDataSource);
    if (v44)
    {
      v45 = (uint64_t)v44;
      v125 = v1;
      objc_opt_self();
      v46 = (void *)swift_dynamicCastObjCClass();
      if (v46)
      {
        v47 = v46;
        v124 = v45;
        v48 = objc_msgSend(v46, sel_containerBundleIdentifier);
        if (v48)
        {
          v49 = v48;
          v50 = v125;
          v51 = objc_msgSend(*(id *)(v125 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider), sel_descriptorFor_, v47);
          v52 = *(void **)(v50 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
          v53 = v47;
          v54 = objc_msgSend(v47, sel_uniqueIdentifier);
          if (!v54)
          {
            sub_1CFBFA894();
            v54 = (id)sub_1CFBFA870();
            swift_bridgeObjectRelease();
          }
          v55 = swift_allocObject();
          *(_QWORD *)(v55 + 16) = v51;
          aBlock[4] = sub_1CFBE552C;
          aBlock[5] = v55;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1CFBDC328;
          aBlock[3] = &block_descriptor_111;
          v56 = _Block_copy(aBlock);
          v57 = v51;
          swift_release();
          v58 = objc_msgSend(v52, sel_intentWithBundleIdentifier_dataSourceIdentifier_defaultIntentProvider_, v49, v54, v56);
          _Block_release(v56);

          v122 = v57;
          v123 = v43;
          if (v57 && (v59 = objc_msgSend(v57, sel_displayName)) != 0
            || (v59 = objc_msgSend(v53, sel_sbh_appName)) != 0)
          {
            sub_1CFBFA894();

            v59 = (id)sub_1CFBFA870();
            swift_bridgeObjectRelease();
          }
          v60 = v53;
          objc_msgSend(v53, sel_setDisplayName_, v59);

          sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADE0);
          swift_unknownObjectRetain();
          v61 = v58;
          v121 = v61;
          v62 = sub_1CFBB5EFC(v60, (uint64_t)v58);
          swift_unknownObjectRelease();

          v63 = v62;
          v64 = objc_msgSend(v60, sel_controlType);
          v65 = objc_msgSend(v60, sel_uniqueIdentifier);
          sub_1CFBFA894();

          v66 = objc_allocWithZone(MEMORY[0x1E0D14798]);
          v67 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v120 = v63;
          v118 = objc_msgSend(v66, sel_initWithIdentity_type_contentType_configurationIdentifier_, v63, v64, 0, v67);

          v68 = objc_msgSend(v60, sel_uniqueIdentifier);
          v119 = sub_1CFBFA894();
          v70 = v69;

          swift_bridgeObjectRetain();
          sub_1CFBFA6CC();
          v71 = objc_allocWithZone(MEMORY[0x1E0D14778]);
          v72 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v73 = (void *)sub_1CFBFA6A8();
          v74 = objc_msgSend(v71, sel_initWithModuleIdentifier_uniqueIdentifier_, v72, v73);

          v75 = *(void (**)(char *, uint64_t))(v7 + 8);
          v76 = v126;
          v75(v13, v126);
          v77 = v125;
          objc_msgSend(v74, sel_setDelegate_, MEMORY[0x1D17DBD84](v125 + OBJC_IVAR___CCUIPagingViewController_contextDelegate));
          swift_unknownObjectRelease();
          v78 = v118;
          objc_msgSend(v118, sel_setContentModuleContext_, v74);
          v79 = v78;
          v80 = objc_msgSend(v79, sel_supportedGridSizeClasses);
          v81 = (objc_class *)type metadata accessor for SimpleContentModule();
          v82 = (char *)objc_allocWithZone(v81);
          *(_QWORD *)&v82[OBJC_IVAR____TtC15ControlCenterUI19SimpleContentModule_contentModuleViewController] = v79;
          *(_QWORD *)&v82[OBJC_IVAR____TtC15ControlCenterUI19SimpleContentModule_supportedGridSizeClasses] = v80;
          v127.receiver = v82;
          v127.super_class = v81;
          v83 = objc_msgSendSuper2(&v127, sel_init);
          v84 = objc_msgSend(v74, sel_uniqueIdentifier);
          sub_1CFBFA6C0();

          swift_unknownObjectRetain();
          v85 = v83;
          v86 = v77;
          v87 = v123;
          v20 = sub_1CFBE27E4(v119, v70, (uint64_t)v13, v85, (uint64_t)v60, v86, v123);

          swift_bridgeObjectRelease();
          swift_unknownObjectRelease_n();

          v75(v13, v76);
          return v20;
        }

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();

      }
      v1 = v125;
    }
    else
    {

    }
  }
  v88 = objc_msgSend(v17, sel_activeDataSource);
  if (!v88)
  {
LABEL_41:
    v103 = objc_msgSend((id)objc_opt_self(), sel_yellowColor);
    v104 = (objc_class *)type metadata accessor for ColorViewController();
    v105 = objc_allocWithZone(v104);
    v106 = &v105[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v106 = 0u;
    v106[1] = 0u;
    v107 = (int64x2_t *)&v105[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v107->i64[0] = 0;
    v107->i64[1] = 0;
    v107[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v105[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v105[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v105[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v103;
    v130.receiver = v105;
    v130.super_class = v104;
    v20 = objc_msgSendSuper2(&v130, sel_initWithNibName_bundle_, 0, 0);
    goto LABEL_42;
  }
  v89 = v88;
  objc_opt_self();
  v90 = (void *)swift_dynamicCastObjCClass();
  if (!v90)
  {
    swift_unknownObjectRelease();
    goto LABEL_41;
  }
  v91 = v90;
  v123 = v89;
  v125 = v1;
  v92 = objc_msgSend(v90, sel_moduleIdentifier);
  if (!v92)
  {
    sub_1CFBFA894();
    v92 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v122 = (id)sub_1CFBFA894();
  v124 = v93;
  v94 = *(void **)(v125 + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
  v95 = objc_msgSend(v91, sel_uniqueIdentifier);
  if (!v95)
  {
    sub_1CFBFA894();
    v95 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v96 = objc_msgSend(v94, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v92, v95);

  if (!v96)
  {
    swift_bridgeObjectRelease();
    v109 = objc_msgSend((id)objc_opt_self(), sel_blueColor);
    v110 = (objc_class *)type metadata accessor for ColorViewController();
    v111 = objc_allocWithZone(v110);
    v112 = &v111[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v112 = 0u;
    v112[1] = 0u;
    v113 = (int64x2_t *)&v111[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v113->i64[0] = 0;
    v113->i64[1] = 0;
    v113[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v111[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v111[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v111[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v109;
    v129.receiver = v111;
    v129.super_class = v110;
    v20 = objc_msgSendSuper2(&v129, sel_initWithNibName_bundle_, 0, 0);
LABEL_7:
    swift_unknownObjectRelease();
LABEL_42:

    goto LABEL_43;
  }
  v121 = v15;
  v97 = v96;
  v98 = objc_msgSend(v97, sel_displayName);
  objc_msgSend(v91, sel_setDisplayName_, v98);

  v99 = objc_msgSend(v97, sel_module);
  v100 = objc_msgSend(v91, (SEL)&selRef_shouldPresentInFullscreen);
  sub_1CFBFA894();

  sub_1CFBFA690();
  swift_bridgeObjectRelease();
  v101 = v126;
  v102 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v126);
  v120 = v97;
  if (v102 == 1)
  {
    sub_1CFBFA6CC();
    sub_1CFBE7CCC((uint64_t)v5, (uint64_t *)&unk_1ED90AF90);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v101);
  }
  v114 = v125;
  v115 = (uint64_t)v122;
  swift_getObjectType();
  sub_1CFBFAA8C();
  swift_unknownObjectRetain();
  v116 = v121;
  v20 = sub_1CFBE29C0(v115, v124, (uint64_t)v9, (uint64_t)v99, (uint64_t)v91, v114, v121);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CFBDC100(v20, v91);
  swift_unknownObjectRelease();
  v117 = v120;

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v126);
  return v20;
}

id sub_1CFBDE5D0(void *a1)
{
  id v1;
  void *v2;
  id v3;

  if (!a1)
    return 0;
  v1 = objc_msgSend(a1, sel_defaultIntentReference);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_intent);

  return v3;
}

void *PagingViewController.draggingDelegate(for:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  v2 = v1;
  return v1;
}

uint64_t PagingViewController.icon(_:canReceiveGrabbedIcon:)()
{
  return 0;
}

uint64_t PagingViewController.iconViewDisplaysLabel(_:)()
{
  return 0;
}

uint64_t PagingViewController.iconViewDisplaysResizeHandle(_:)(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;

  v1 = objc_msgSend(a1, sel_icon);
  if (!v1)
    return 1;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_isPlaceholder);

  return v3 ^ 1;
}

__n128 PagingViewController.resizeHandleMetrics(for:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  __n128 result;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __n128 v21;

  v3 = objc_msgSend(a1, sel_icon);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_gridSizeClass);

  }
  else
  {
    v5 = 0;
  }
  v6 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  v7 = v6;
  if (!v5)
  {

    goto LABEL_11;
  }
  v8 = sub_1CFBFA894();
  v10 = v9;
  if (v8 != sub_1CFBFA894() || v10 != v11)
  {
    v12 = sub_1CFBFAD8C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_10;
LABEL_11:
    v13 = sub_1CFBD4938();
    goto LABEL_12;
  }

  swift_bridgeObjectRelease_n();
LABEL_10:
  v13 = sub_1CFBD494C();
LABEL_12:
  v14 = v13;
  SBIconResizeHandleMetricsForIconResizingSettings();

  *(_OWORD *)a2 = v16;
  *(_OWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 32) = v18;
  *(_QWORD *)(a2 + 40) = v19;
  result = v21;
  *(_OWORD *)(a2 + 48) = v20;
  *(__n128 *)(a2 + 64) = v21;
  return result;
}

_QWORD *PagingViewController.resizeGestureHandler(for:)(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *result;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_icon);
  if (!v4)
    return 0;
  v5 = v4;
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  if (!v6)
  {
LABEL_8:

    return 0;
  }
  v7 = objc_msgSend(v6, sel_activeDataSource);
  swift_unknownObjectRelease();
  if (!v7)
  {

    return v7;
  }
  objc_msgSend(v2, sel_loadViewIfNeeded);
  result = *(_QWORD **)&v2[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v9 = objc_msgSend(result, sel_folderView);
    v10 = objc_msgSend(v9, sel_iconListViewDisplayingIconView_, a1);

    if (v10)
    {
      sub_1CFBD65BC(0x676E697A69736572, 0xEC0000006E6F6349);
      type metadata accessor for ControlResizeGestureHandler();
      swift_allocObject();
      v7 = (_QWORD *)sub_1CFBC5A58((uint64_t)a1, (uint64_t)v10);
      v11 = a1;

      v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v13 = v7[5];
      v7[5] = sub_1CFBE5534;
      v7[6] = v12;
      sub_1CFBB8538(v13);
      v14 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v15 = v7[7];
      v7[7] = sub_1CFBE553C;
      v7[8] = v14;
      sub_1CFBB8538(v15);
      v16 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v17 = v7[9];
      v7[9] = sub_1CFBE5544;
      v7[10] = v16;
      sub_1CFBB8538(v17);
      return v7;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

void sub_1CFBDEBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    *(_BYTE *)(v3 + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 0;
    sub_1CFBD6FF4();

  }
}

void sub_1CFBDEC08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    *(_BYTE *)(v3 + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 1;
    sub_1CFBD6FF4();

  }
}

void sub_1CFBDEC68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  _QWORD **v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CFBFA714();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v42 - v14;
  swift_beginAccess();
  v16 = MEMORY[0x1D17DBD84](a3 + 16);
  if (v16)
  {
    v17 = (char *)v16;
    v18 = (_QWORD **)(v16 + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
    swift_beginAccess();
    v19 = sub_1CFBD66C8(0x676E697A69736572, 0xEC0000006E6F6349, *v18);
    if ((v20 & 1) == 0)
    {
      v21 = v19;
      swift_beginAccess();
      sub_1CFBD67AC(v21);
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
    _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
    v22 = objc_msgSend(*(id *)(a1 + 16), sel_icon);
    if (!v22)
    {

      return;
    }
    v23 = v22;
    v44 = v9;
    v24 = objc_msgSend(v22, sel_gridSizeClass);
    v25 = sub_1CFBFA894();
    v27 = v26;
    v43 = a2;
    if (v25 == sub_1CFBFA894() && v27 == v28)
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    v29 = sub_1CFBFAD8C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
      goto LABEL_18;
    objc_msgSend(v17, sel_loadViewIfNeeded);
    v30 = OBJC_IVAR___CCUIPagingViewController___rootFolderController;
    v31 = *(void **)&v17[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
    if (v31)
    {
      v32 = objc_msgSend(v31, sel_folder);
      if (!v32)
      {
LABEL_18:

        return;
      }
      v33 = v32;
      v34 = objc_msgSend(v32, sel_indexPathForIcon_, v23);
      if (v34)
      {
        v35 = v34;
        sub_1CFBFA708();

        v36 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v37 = v12;
        v38 = v44;
        v36(v8, v37, v44);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v38);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v38) != 1)
        {
          v36(v15, v8, v38);
          objc_msgSend(v17, sel_loadViewIfNeeded);
          v39 = *(void **)&v17[v30];
          if (v39)
          {
            v40 = objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v39, sel_orientation), 0);
            v41 = (void *)sub_1CFBFA6FC();

            (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v38);
            goto LABEL_18;
          }
LABEL_21:
          __break(1u);
          return;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v44);
      }

      sub_1CFBE7CCC((uint64_t)v8, &qword_1ED90AFA0);
      goto LABEL_18;
    }
    __break(1u);
    goto LABEL_21;
  }
}

uint64_t PagingViewController.closeBoxType(for:)()
{
  return 1;
}

id PagingViewController.gridSizeClassDomain(for:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
}

uint64_t PagingViewController.actionDelegate(for:)()
{
  return swift_unknownObjectRetain();
}

void PagingViewController.iconTapped(_:)(void *a1)
{
  void *v1;
  id v3;
  id v4;

  v3 = objc_msgSend(a1, sel_icon);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, sel_isLeafIcon) && objc_msgSend(v1, sel_isEditing))
    {
      if (objc_msgSend(a1, sel_supportsConfigurationCard))
        objc_msgSend(a1, sel_presentConfigurationCard);
    }

  }
}

void PagingViewController.iconCloseBoxTapped(_:)(void *a1)
{
  void *v1;
  id v3;
  id v4;

  if (objc_msgSend(v1, sel_isEditing))
  {
    v3 = objc_msgSend(a1, sel_icon);
    if (v3)
    {
      v4 = v3;
      sub_1CFBD6888((uint64_t)v3);
      _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

    }
  }
}

uint64_t PagingViewController.iconView(_:supportsConfigurationFor:)()
{
  return sub_1CFBE554C();
}

id PagingViewController.iconView(_:configurationInteractionFor:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  int v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  Swift::String v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  objc_class *ObjCClassFromMetadata;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  id v81;
  Swift::String v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC88);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
  MEMORY[0x1E0C80A78](v7);
  v87[1] = (uint64_t)&unk_1EFC57FF8;
  v8 = (void *)swift_dynamicCastObjCProtocolConditional();
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) != 0)
    {
      swift_unknownObjectRetain();
      v10 = objc_msgSend(v9, sel_uniqueIdentifier);
      v84 = sub_1CFBFA894();
      v12 = v11;

      v85 = objc_msgSend(a1, sel_icon);
      if (v85)
      {
        v13 = objc_msgSend(v9, sel_containerBundleIdentifier);
        if (v13)
        {
          v14 = v13;
          v83 = v12;
          v82._countAndFlagsBits = sub_1CFBFA894();
          v82._object = v15;

          objc_opt_self();
          v16 = swift_dynamicCastObjCClass();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = *(void **)(v2 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider);
            swift_unknownObjectRetain();
            v19 = objc_msgSend(v18, sel_descriptorFor_, v17);
            if (v19)
            {
              v20 = v19;
              swift_unknownObjectRelease();
              v21 = v83;
LABEL_35:
              swift_getObjectType();
              v65._countAndFlagsBits = v84;
              v65._object = v21;
              v66 = (void *)ControlIntentStorage.intent(bundleIdentifier:dataSourceIdentifier:)(v82, v65);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v66)
              {
                sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF11B0);
                v67 = v85;
                v68 = objc_msgSend(v85, sel_gridSizeClass);
                v69 = objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
                ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
                swift_unknownObjectRetain();
                v9 = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_initWithDescriptor_gridSizeClass_gridSizeClassDomain_intent_configuredDataSource_, v20, v68, v69, v66, v9);

                swift_unknownObjectRelease_n();
                return v9;
              }
              if (qword_1ED90AFE0 != -1)
                swift_once();
              v71 = sub_1CFBFA7A4();
              __swift_project_value_buffer(v71, (uint64_t)qword_1ED90AFC0);
              swift_unknownObjectRetain_n();
              v72 = sub_1CFBFA78C();
              v73 = sub_1CFBFA9D8();
              if (!os_log_type_enabled(v72, v73))
              {

                swift_unknownObjectRelease_n();
                return 0;
              }
              v74 = (uint8_t *)swift_slowAlloc();
              v75 = swift_slowAlloc();
              v87[0] = v75;
              *(_DWORD *)v74 = 136315138;
              v84 = (uint64_t)(v74 + 4);
              v76 = objc_msgSend(v9, sel_description);
              v77 = sub_1CFBFA894();
              v79 = v78;

              v86 = sub_1CFBC779C(v77, v79, v87);
              sub_1CFBFABD0();
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1CFB7D000, v72, v73, "No intent found for configuration of %s", v74, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1D17DBCE8](v75, -1, -1);
              MEMORY[0x1D17DBCE8](v74, -1, -1);

              swift_unknownObjectRelease();
              goto LABEL_11;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_1ED90AFE0 != -1)
              swift_once();
            v38 = sub_1CFBFA7A4();
            __swift_project_value_buffer(v38, (uint64_t)qword_1ED90AFC0);
            swift_unknownObjectRetain_n();
            v39 = sub_1CFBFA78C();
            v40 = sub_1CFBFA9D8();
            if (os_log_type_enabled(v39, v40))
            {
              v41 = swift_slowAlloc();
              v42 = swift_slowAlloc();
              v87[0] = v42;
              *(_DWORD *)v41 = 136315394;
              v43 = objc_msgSend(v17, sel_extensionBundleIdentifier);
              v44 = sub_1CFBFA894();
              v46 = v45;

              v86 = sub_1CFBC779C(v44, v46, v87);
              sub_1CFBFABD0();
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v41 + 12) = 2080;
              v47 = objc_msgSend(v17, sel_kind);
              v48 = sub_1CFBFA894();
              v50 = v49;

              v86 = sub_1CFBC779C(v48, v50, v87);
              sub_1CFBFABD0();
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1CFB7D000, v39, v40, "No descriptor found for configuration of %s:%s", (uint8_t *)v41, 0x16u);
              swift_arrayDestroy();
              v51 = v42;
LABEL_31:
              MEMORY[0x1D17DBCE8](v51, -1, -1);
              MEMORY[0x1D17DBCE8](v41, -1, -1);
              swift_unknownObjectRelease_n();

              goto LABEL_11;
            }
            goto LABEL_32;
          }
          objc_opt_self();
          v23 = swift_dynamicCastObjCClass();
          if (v23)
          {
            v24 = (id)v23;
            v25 = *(void **)(v2 + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
            swift_unknownObjectRetain();
            v26 = objc_msgSend(v24, sel_moduleIdentifier);
            v81 = v24;
            if (!v26)
            {
              sub_1CFBFA894();
              v26 = (id)sub_1CFBFA870();
              v24 = v81;
              swift_bridgeObjectRelease();
            }
            v27 = objc_msgSend(v24, sel_uniqueIdentifier);
            if (!v27)
            {
              sub_1CFBFA894();
              v80 = v25;
              v27 = (id)sub_1CFBFA870();
              v25 = v80;
              swift_bridgeObjectRelease();
            }
            v28 = objc_msgSend(v25, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v26, v27);

            v29 = v28;
            if (v28)
            {
              sub_1CFBFAA80();
              sub_1CFBFA744();
              v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v6, 1, 1, v30);
              v31 = (void *)sub_1CFBFAA74();
              v32 = objc_allocWithZone(MEMORY[0x1E0D10090]);
              v33 = (void *)sub_1CFBFA870();
              v20 = objc_msgSend(v32, sel_initWithExtensionIdentity_kind_controlType_intentType_, v31, v33, 0, 0);

              v34 = objc_msgSend(v29, sel_displayName);
              objc_msgSend(v20, sel_setDisplayName_, v34);

              v35 = objc_msgSend(v29, sel_module);
              if ((objc_msgSend(v35, sel_respondsToSelector_, sel_moduleDescription) & 1) != 0)
              {
                v36 = objc_msgSend(v35, sel_moduleDescription);
                swift_unknownObjectRelease();
                sub_1CFBFA894();

                v37 = (void *)sub_1CFBFA870();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_unknownObjectRelease();
                v37 = 0;
              }
              v21 = v83;
              objc_msgSend(v20, sel_setWidgetDescription_, v37);

              swift_unknownObjectRelease();
              goto LABEL_35;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_1ED90AFE0 != -1)
              swift_once();
            v52 = sub_1CFBFA7A4();
            __swift_project_value_buffer(v52, (uint64_t)qword_1ED90AFC0);
            swift_unknownObjectRetain_n();
            v39 = sub_1CFBFA78C();
            v53 = sub_1CFBFA9D8();
            v54 = v53;
            if (os_log_type_enabled(v39, v53))
            {
              v41 = swift_slowAlloc();
              v84 = swift_slowAlloc();
              v87[0] = v84;
              *(_DWORD *)v41 = 136315394;
              LODWORD(v83) = v54;
              v55 = v81;
              v56 = objc_msgSend(v81, sel_moduleIdentifier);
              v57 = sub_1CFBFA894();
              v59 = v58;

              v86 = sub_1CFBC779C(v57, v59, v87);
              sub_1CFBFABD0();
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v41 + 12) = 2080;
              v60 = objc_msgSend(v55, sel_uniqueIdentifier);
              v61 = sub_1CFBFA894();
              v63 = v62;

              v86 = sub_1CFBC779C(v61, v63, v87);
              sub_1CFBFABD0();
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1CFB7D000, v39, (os_log_type_t)v83, "No module instance found for configuration of %s:%s", (uint8_t *)v41, 0x16u);
              v64 = v84;
              swift_arrayDestroy();
              v51 = v64;
              goto LABEL_31;
            }
LABEL_32:

            swift_unknownObjectRelease_n();
            goto LABEL_11;
          }
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        swift_bridgeObjectRelease();
LABEL_11:

        return 0;
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return v9;
}

id PagingViewController.iconView(_:containerViewControllerFor:)()
{
  void *v0;

  return v0;
}

id PagingViewController.iconView(_:containerViewFor:)()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_view);
  if (!result)
    __break(1u);
  return result;
}

void PagingViewController.iconView(_:contentBoundingRectFor:)()
{
  void *v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_bounds);

  }
  else
  {
    __break(1u);
  }
}

double PagingViewController.verticalMarginPercentageForConfiguration(of:)()
{
  return 0.2;
}

void PagingViewController.iconView(_:configurationDidUpdateWith:)(void *a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  char **v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  v4 = objc_msgSend(a1, sel_icon);
  if (v4)
  {
    v5 = v4;
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6)
    {
      v7 = (void *)v6;
      if (objc_msgSend(a2, sel_configuredDataSource)
        || objc_msgSend(v7, sel_activeDataSource))
      {
        v8 = swift_dynamicCastObjCProtocolConditional();
        if (v8)
        {
          v9 = (void *)v8;
          if (objc_msgSend(a2, sel_configuration))
          {
            objc_opt_self();
            v10 = swift_dynamicCastObjCClass();
            if (v10)
            {
              v11 = v10;
              swift_getObjectType();
              v12 = objc_msgSend(v9, sel_copyWithUniqueIdentifier);
              v28 = objc_msgSend(v9, sel_containerBundleIdentifier);
              if (v28)
              {
                sub_1CFBFA894();
                v29 = v13;
              }
              else
              {
                v29 = 0;
              }
              v18 = &selRef_setDynamicLayoutEnabled_;
              if ((objc_msgSend(v12, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) != 0)
              {
                v27 = v12;
                v19 = objc_msgSend(v12, sel_uniqueIdentifier);
                sub_1CFBFA894();

                if (v29)
                {
                  v26 = *(id *)(v2 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
                  swift_bridgeObjectRetain();
                  v20 = (void *)sub_1CFBFA870();
                  swift_bridgeObjectRelease();
                  v21 = (void *)sub_1CFBFA870();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v26, sel_storeIntent_bundleIdentifier_dataSourceIdentifier_, v11, v20, v21);

                  v12 = v27;
                  v18 = &selRef_setDynamicLayoutEnabled_;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  v12 = v27;
                }
              }
              objc_msgSend(v7, sel_replaceIconDataSource_withIconDataSource_, v9, v12, v26);
              if ((objc_msgSend(v9, sel_respondsToSelector_, v18[252]) & 1) != 0)
              {
                v22 = objc_msgSend(v9, v18[252]);
                sub_1CFBFA894();

                swift_bridgeObjectRelease();
                if (v29)
                {
                  v23 = *(void **)(v2 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
                  v24 = (void *)sub_1CFBFA870();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v23, sel_deleteIntentWithBundleIdentifier_dataSourceIdentifier_, v28, v24);

                }
                else
                {

                }
              }
              else
              {

                swift_bridgeObjectRelease();
              }
              v25 = *(_QWORD *)(v2 + OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache);
              swift_unknownObjectRetain();
              sub_1CFBC159C((uint64_t)v9, v25);

              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease_n();
              return;
            }
            swift_unknownObjectRelease();
          }
        }
        swift_unknownObjectRelease();
      }
    }

  }
  if (qword_1ED90AFE0 != -1)
    swift_once();
  v14 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v14, (uint64_t)qword_1ED90AFC0);
  v15 = sub_1CFBFA78C();
  v16 = sub_1CFBFA9D8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1CFB7D000, v15, v16, "Invalid control configuration update", v17, 2u);
    MEMORY[0x1D17DBCE8](v17, -1, -1);
  }

}

uint64_t PagingViewController.iconView(_:configurationWillBeginWith:)()
{
  sub_1CFBD65BC(0xD00000000000001FLL, 0x80000001CFC05FC0);
  return swift_unknownObjectWeakAssign();
}

id PagingViewController.iconDragManager(_:canBeginIconDragFor:)()
{
  void *v0;

  return objc_msgSend(v0, sel_isEditing);
}

uint64_t PagingViewController.iconDragManager(_:canAcceptDropIn:in:)()
{
  return 1;
}

id PagingViewController.iconDragManager(_:dragItemsFor:)(int a1, id a2)
{
  id result;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(a2, sel_icon);
  if (result)
  {
    v3 = result;
    v4 = (void *)sub_1CFBFA870();
    v5 = (id)SBHIconDragItemWithIconAndIconView();

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DF0);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1CFC02270;
    *(_QWORD *)(v6 + 32) = v5;
    v7 = v6;
    sub_1CFBFA918();
    return (id)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PagingViewController.iconDragManager(_:doesIconViewRepresentRealIconPosition:)()
{
  return 1;
}

id PagingViewController.iconDragManager(_:iconView:willBegin:)()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 0;
  return sub_1CFBD6FF4();
}

id PagingViewController.iconDragManagerUserActiveIconDraggingDidChange(_:)(void *a1)
{
  uint64_t v1;
  id result;

  result = objc_msgSend(a1, sel_isTrackingUserActiveIconDrags);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(v1 + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 1;
    return sub_1CFBD6FF4();
  }
  return result;
}

uint64_t PagingViewController.iconViewDelegateForExternalDrag(for:)()
{
  return swift_unknownObjectRetain();
}

id PagingViewController.windowForIconDragPreviews(for:for:)(uint64_t a1, void *a2)
{
  return sub_1CFBE585C(a2);
}

char *PagingViewController.iconDragManager(_:dragPreviewFor:)(uint64_t a1, void *a2)
{
  return sub_1CFBE596C(a2);
}

id PagingViewController.rootView(for:)()
{
  char *v0;
  id result;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  result = objc_msgSend(result, sel_view);
  if (!result)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t PagingViewController.iconDragManager(_:canAddDragItemsTo:from:)()
{
  return 0;
}

id PagingViewController.iconViewQueryable(for:)()
{
  char *v0;
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(v0, sel_loadViewIfNeeded);
  v2 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v2)
  {
    v3 = v2;
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id PagingViewController.rootFolder(for:)()
{
  char *v0;
  id result;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    result = objc_msgSend(result, sel_folder);
    if (result)
    {
      objc_opt_self();
      return (id)swift_dynamicCastObjCClassUnconditional();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t PagingViewController.iconListView(for:)()
{
  id v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1CFBD7B94();
  v2 = v1;

  return v2;
}

id PagingViewController.listGridCellInfoOptions(for:)()
{
  char *v0;
  id result;
  void *v2;

  result = objc_msgSend(v0, sel_loadViewIfNeeded);
  v2 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v2)
    return objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v2, sel_orientation), 0);
  __break(1u);
  return result;
}

id PagingViewController.iconLayoutHider(for:)()
{
  char *v0;
  id result;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(id *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
    return result;
  __break(1u);
  return result;
}

uint64_t PagingViewController.allowsSnappingIconsToGrid(for:)()
{
  return 1;
}

id PagingViewController.layoutIconLists(with:forceRelayout:)(uint64_t a1, char a2)
{
  char *v2;
  char *v3;
  id result;

  v3 = v2;
  objc_msgSend(v3, sel_loadViewIfNeeded);
  result = *(id *)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
    return objc_msgSend(result, sel_layoutIconListsWithAnimationType_forceRelayout_, a1, a2 & 1);
  __break(1u);
  return result;
}

id PagingViewController.rootFolder(_:canBounce:)()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (result)
    return objc_msgSend(result, sel_isIconDragging);
  __break(1u);
  return result;
}

void *PagingViewController.folder(_:didAdd:removedIcons:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CFBE5A38(a2, a3);
}

id PagingViewController.controlsGalleryViewController(_:didFinishWithResult:error:)(int a1, void *a2, id a3)
{
  return sub_1CFBE5B7C(a2, a3);
}

void sub_1CFBE136C(void *a1, void *a2)
{
  id v3;

  if (a1)
  {
    v3 = a1;
    if (objc_msgSend(a2, sel_promptsForUserConfiguration))
    {
      if (objc_msgSend(v3, sel_supportsConfigurationCard))
        objc_msgSend(v3, sel_presentConfigurationCard);
    }

  }
}

uint64_t PagingViewController.customApplicationWidgetCollections(for:)()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v9;

  v9 = MEMORY[0x1E0DEE9D8];
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager];
  v2 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController_moduleSettingsManager];
  v3 = objc_msgSend(v1, sel_loadableModuleIdentifiers);
  v4 = sub_1CFBFA984();

  v5 = v0;
  v6 = v1;
  v7 = v2;
  sub_1CFBE4F8C(v4, v5, v6, v7, &v9);
  swift_bridgeObjectRelease();

  return v9;
}

void sub_1CFBE1620(uint64_t *a1, char *a2, void *a3, void *a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  unsigned int v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  _QWORD *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  _QWORD *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  _QWORD *v74;
  uint64_t v75;
  id v76;
  unint64_t v77;

  v76 = a3;
  v74 = a5;
  v8 = sub_1CFBFA6D8();
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)&v10 = MEMORY[0x1E0C80A78](v8).n128_u64[0];
  v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a1;
  v13 = a1[1];
  v15 = objc_msgSend(a2, sel_traitCollection, v10);
  v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  if (v16 == (id)1)
    v17 = (_QWORD *)sub_1CFBFA768();
  else
    v17 = (_QWORD *)sub_1CFBFA774();
  v18 = sub_1CFBE1DE0(v14, v13, v17);
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    sub_1CFBFA6CC();
    v19 = sub_1CFBFA69C();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v22 = (void *)sub_1CFBFA870();
    v75 = v19;
    v23 = (void *)sub_1CFBFA870();
    v24 = objc_msgSend(v76, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v22, v23);

    if (!v24)
    {
      swift_bridgeObjectRelease();
      return;
    }
    v25 = objc_msgSend(v24, sel_metadata);
    v26 = objc_msgSend(v25, sel_associatedBundleIdentifier);

    if (v26)
    {
      sub_1CFBFA894();
      v28 = v27;

    }
    else
    {
      v28 = 0;
    }
    swift_bridgeObjectRetain();
    v29 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    if (v28)
    {
      v30 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
    }
    else
    {
      v30 = 0;
    }
    v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA628]), sel_initWithLeafIdentifier_applicationBundleID_, v29, v30);

    v31 = (void *)sub_1CFBFA870();
    v32 = objc_msgSend(a4, sel_moduleSettingsForModuleIdentifier_, v31);

    v73 = v32;
    v33 = objc_msgSend(v32, sel_moduleContainerBundleIdentifier);
    sub_1CFBFA894();

    v34 = (void *)objc_opt_self();
    v35 = (void *)sub_1CFBFA870();
    v36 = objc_msgSend(v34, sel_applicationWithBundleIdentifier_, v35);

    if (objc_msgSend(v36, sel_isHidden))
    {
      swift_bridgeObjectRelease();

LABEL_17:
      v38 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_removeModuleWithUniqueIdentifier_, v38);

      return;
    }
    v37 = objc_msgSend(v36, sel_isLocked);

    if (v37)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v76 = v24;
    v39 = OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers;
    if (*(_QWORD *)&a2[OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers])
      v40 = *(_QWORD **)&a2[OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers];
    else
      v40 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if ((sub_1CFBE1DE0(v75, v21, v40) & 1) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v40 = sub_1CFBEBDF0(0, v40[2] + 1, 1, v40);
      v42 = v40[2];
      v41 = v40[3];
      v43 = (id)(v42 + 1);
      if (v42 >= v41 >> 1)
      {
        v71 = (id)(v42 + 1);
        v69 = sub_1CFBEBDF0((_QWORD *)(v41 > 1), v42 + 1, 1, v40);
        v43 = v71;
        v40 = v69;
      }
      v40[2] = v43;
      v44 = &v40[2 * v42];
      v44[4] = v75;
      v44[5] = v21;
    }
    *(_QWORD *)&a2[v39] = v40;
    swift_bridgeObjectRelease();
    v71 = objc_msgSend(v73, sel_gridSizeClass);
    v45 = objc_msgSend(v76, sel_module);
    if ((objc_msgSend(v45, sel_respondsToSelector_, sel_supportedGridSizeClasses) & 1) != 0)
    {
      objc_msgSend(v45, sel_supportedGridSizeClasses);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      CCUIDefaultSupportedGridSizeClassesForChronoControls();
    }
    v46 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();
    v47 = objc_msgSend(v76, sel_module);
    if ((objc_msgSend(v47, sel_respondsToSelector_, sel_expandsGridSizeClassesForAccessibility) & 1) != 0)
      v48 = objc_msgSend(v47, sel_expandsGridSizeClassesForAccessibility);
    else
      v48 = 0;
    swift_unknownObjectRelease();
    v49 = objc_allocWithZone(MEMORY[0x1E0D14820]);
    swift_bridgeObjectRetain();
    v50 = v46;
    v51 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v52 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v53 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v54 = objc_msgSend(v49, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v51, v52, v53, v50, v48);

    v55 = objc_msgSend(v76, sel_displayName);
    objc_msgSend(v54, sel_setDisplayName_, v55);

    v56 = v71;
    objc_msgSend(v54, sel_setPreferredGallerySizeClass_, CCUIGridSizeClassForSBHIconGridSizeClass());
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DF0);
    v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_1CFC02270;
    *(_QWORD *)(v57 + 32) = v54;
    v77 = v57;
    sub_1CFBFA918();
    if (v77 >> 62)
    {
      v67 = v54;
      v59 = v72;
      v68 = v72;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1760);
      sub_1CFBFAD20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v58 = v54;
      v59 = v72;
      v60 = v72;
      swift_bridgeObjectRetain();
      sub_1CFBFAD98();
    }
    v61 = v74;
    swift_bridgeObjectRelease();
    v62 = objc_allocWithZone(MEMORY[0x1E0DAA410]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1760);
    v63 = (void *)sub_1CFBFA8F4();
    swift_bridgeObjectRelease();
    v64 = (void *)sub_1CFBFA870();
    v65 = objc_msgSend(v62, sel_initWithIcon_galleryItems_vendorName_, v59, v63, v64);

    v66 = v65;
    MEMORY[0x1D17DAB9C]();
    if (*(_QWORD *)((*v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CFBFA924();
    sub_1CFBFA930();
    sub_1CFBFA918();

  }
}

uint64_t sub_1CFBE1DE0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_1CFBFAD8C();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_1CFBFAD8C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

id PagingViewController.controlsGalleryViewController(_:customImageViewControllerFor:withPrimaryAction:contentMetrics:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFBE6288(a2, a3, a4);
}

void *PagingViewController.controlsGalleryViewController(_:widgetIconFor:)()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClass();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  swift_unknownObjectRetain();
  objc_msgSend(v1, sel_preferredGallerySizeClass);
  v2 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
  v3 = (void *)sub_1CFBFA9A8();
  objc_msgSend(v3, sel_addIconDataSource_, v1);
  objc_msgSend(v3, sel_setGridSizeClass_, v2);
  swift_unknownObjectRelease();

  return v3;
}

id PagingViewController.controlsGalleryViewController(_:didFinishWith:)(uint64_t a1, void *a2)
{
  return sub_1CFBE6A14(a2);
}

void sub_1CFBE2238(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  if (a1)
  {
    v7 = a1;
    if (!objc_msgSend(v7, sel_supportsConfigurationCard)
      || (v1 = objc_msgSend(v7, sel_customIconImageViewController)) == 0)
    {
      v6 = v7;
LABEL_13:

      return;
    }
    v2 = v1;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = objc_msgSend(v3, sel_contentViewController);
      if ((objc_msgSend(v4, sel_respondsToSelector_, sel_promptsForUserConfiguration) & 1) == 0)
      {

        v2 = v7;
        goto LABEL_12;
      }
      v5 = objc_msgSend(v4, sel_promptsForUserConfiguration);

      if ((v5 & 1) != 0)
        objc_msgSend(v7, sel_presentConfigurationCard);
    }
    v4 = v7;
LABEL_12:

    v6 = v4;
    goto LABEL_13;
  }
}

void PagingViewController.handleIconElementRequest(_:completionHandler:)(void *a1, void (*a2)(_QWORD, id), uint64_t a3)
{
  sub_1CFBF1118(a1, a2, a3);
}

uint64_t PagingViewController.requestIconElementState(forRequest:completionHandler:)(void *a1, void (*a2)(uint64_t, _QWORD))
{
  return sub_1CFBF1314(a1, a2);
}

void sub_1CFBE2400(char *a1, int a2, void *a3, void *aBlock, void (*a5)(id, uint64_t, void *))
{
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;

  v8 = _Block_copy(aBlock);
  v9 = *(_QWORD *)&a1[OBJC_IVAR___CCUIPagingViewController_controlCenterOperationsServiceController];
  _Block_copy(v8);
  v10 = a3;
  v11 = a1;
  a5(v10, v9, v8);
  _Block_release(v8);
  _Block_release(v8);

}

uint64_t PagingViewController.appProtectionSubjectsChanged(_:for:)()
{
  return sub_1CFBE7150((uint64_t)&unk_1E8CFF2B0, (uint64_t)sub_1CFBE7990, (uint64_t)&block_descriptor_197);
}

uint64_t PagingViewController.extensionsDidChange(provider:)()
{
  return sub_1CFBE7150((uint64_t)&unk_1E8CFF1E8, (uint64_t)sub_1CFBE7960, (uint64_t)&block_descriptor_180);
}

id sub_1CFBE2550(char *a1)
{
  uint64_t v2;
  id result;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  _QWORD aBlock[6];

  sub_1CFBD90B0();
  v8[2] = a1;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_1CFBE7968;
  *(_QWORD *)(v2 + 24) = v8;
  result = objc_msgSend(a1, sel_loadViewIfNeeded);
  v4 = *(void **)&a1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_1CFBBAC70;
    *(_QWORD *)(v5 + 24) = v2;
    aBlock[4] = sub_1CFBBAC70;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD300;
    aBlock[3] = &block_descriptor_191;
    v6 = _Block_copy(aBlock);
    v7 = v4;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_enumerateDisplayedIconViewsUsingBlock_, v6);

    _Block_release(v6);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v6 & 1) == 0)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CFBE2720(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CFBE2784;
  return v6(a1);
}

uint64_t sub_1CFBE2784()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_1CFBE27D0(_QWORD *a1)
{
  return sub_1CFBEBDF0(0, a1[2], 0, a1);
}

id sub_1CFBE27E4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id result;
  void *v22;
  uint64_t v23;
  id v24;

  v11 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v12 = a4;
  v13 = objc_msgSend(v11, sel_defaultControlCenterPresentationContext);
  v14 = objc_allocWithZone((Class)CCUIContentModuleContainerViewController);
  v15 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_1CFBFA6A8();
  v17 = objc_msgSend(v14, sel_initWithModuleIdentifier_uniqueIdentifier_contentModule_presentationContext_, v15, v16, v12, v13);

  objc_msgSend(v17, sel_setDelegate_, a6);
  objc_msgSend(v17, sel_setContentRenderingMode_, 0);
  v18 = sub_1CFBD7408();
  objc_msgSend(v17, sel_setContentMetrics_, v18);

  v19 = objc_msgSend(a7, sel_gridSizeClass);
  v20 = CCUIGridSizeClassForSBHIconGridSizeClass();

  objc_msgSend(v17, sel_setGridSizeClass_, v20);
  result = objc_msgSend(v17, sel_view);
  if (result)
  {
    v22 = result;
    objc_msgSend(result, sel__controlCenterApplyModuleBackgroundMaterial);

    v23 = *(_QWORD *)(a6 + OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache);
    v24 = v17;
    sub_1CFBC1418((uint64_t)v24, a5, v23);

    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CFBE29C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id result;
  void *v20;
  id v21;

  v10 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v11 = objc_msgSend(v10, sel_defaultControlCenterPresentationContext);
  v12 = objc_allocWithZone((Class)CCUIContentModuleContainerViewController);
  v13 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1CFBFA6A8();
  v15 = objc_msgSend(v12, sel_initWithModuleIdentifier_uniqueIdentifier_contentModule_presentationContext_, v13, v14, a4, v11);
  swift_unknownObjectRelease();

  objc_msgSend(v15, sel_setDelegate_, a6);
  objc_msgSend(v15, sel_setContentRenderingMode_, 0);
  v16 = sub_1CFBD7408();
  objc_msgSend(v15, sel_setContentMetrics_, v16);

  v17 = objc_msgSend(a7, sel_gridSizeClass);
  v18 = CCUIGridSizeClassForSBHIconGridSizeClass();

  objc_msgSend(v15, sel_setGridSizeClass_, v18);
  result = objc_msgSend(v15, sel_view);
  if (result)
  {
    v20 = result;
    objc_msgSend(result, sel__controlCenterApplyModuleBackgroundMaterial);

    v21 = v15;
    sub_1CFBC1414();

    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CFBE2BA4(void *a1, void *a2)
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  char *v7;
  id v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AF08);
  *(_QWORD *)&v5 = MEMORY[0x1E0C80A78](v4).n128_u64[0];
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a2, sel_preferredContentSizeCategory, v5);
  v9 = sub_1CFBFAA98() & 1;

  v10 = objc_msgSend(a1, sel_traitCollection);
  v11 = objc_msgSend(v10, sel_preferredContentSizeCategory);

  LODWORD(v10) = sub_1CFBFAA98() & 1;
  if (v9 != (_DWORD)v10)
  {
    if ((*((_BYTE *)a1 + OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility) & 1) != 0)
    {
      if (qword_1ED90AFE0 != -1)
        swift_once();
      v12 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v12, (uint64_t)qword_1ED90AFC0);
      v13 = sub_1CFBFA78C();
      v14 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CFB7D000, v13, v14, "Suppressed an update to supported sizes for accessibility.", v15, 2u);
        MEMORY[0x1D17DBCE8](v15, -1, -1);
      }

      *((_BYTE *)a1 + OBJC_IVAR___CCUIPagingViewController_needsUpdateToSupportedSizesForAccessibility) = 1;
    }
    else
    {
      v16 = sub_1CFBFA96C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
      sub_1CFBFA954();
      v17 = a1;
      v18 = sub_1CFBFA948();
      v19 = (_QWORD *)swift_allocObject();
      v20 = MEMORY[0x1E0DF06E8];
      v19[2] = v18;
      v19[3] = v20;
      v19[4] = v17;
      sub_1CFBCD4B4((uint64_t)v7, (uint64_t)&unk_1EFBF17E0, (uint64_t)v19);
      swift_release();
    }
  }
}

void sub_1CFBE2DD0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1CFBFAC24();
    sub_1CFBBAA24(0, &qword_1ED90AD60);
    sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
    sub_1CFBFA99C();
    v2 = v44;
    v40 = v45;
    v3 = v46;
    v4 = v47;
    v5 = v48;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v40 = a1 + 56;
    v7 = ~v6;
    v8 = -v6;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v5 = v9 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = v7;
    v4 = 0;
  }
  v39 = (unint64_t)(v3 + 64) >> 6;
  v10 = &selRef_setSmallControlsResizeHandleSettings_;
  v38 = v2;
  if ((v2 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_31:
  if (!sub_1CFBFAC48())
    goto LABEL_50;
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v17 = v43;
  swift_unknownObjectRelease();
  v13 = v4;
  v11 = v5;
  if (!v43)
    goto LABEL_50;
  while (1)
  {
    if (!objc_msgSend(v17, v10[263]))
    {

      goto LABEL_10;
    }
    objc_opt_self();
    v18 = (void *)swift_dynamicCastObjCClass();
    if (!v18)
    {

      swift_unknownObjectRelease();
LABEL_10:
      v4 = v13;
      v5 = v11;
      if (v2 < 0)
        goto LABEL_31;
      goto LABEL_11;
    }
    v19 = v18;
    v42 = v11;
    v20 = objc_msgSend(v18, sel_extensionBundleIdentifier);
    v21 = sub_1CFBFA894();
    v23 = v22;

    v24 = objc_msgSend(a2, sel_extensionIdentity);
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
    v25 = sub_1CFBFA750();
    v27 = v26;
    swift_endAccess();

    if (v21 == v25 && v23 == v27)
    {
      swift_bridgeObjectRelease_n();
      v10 = &selRef_setSmallControlsResizeHandleSettings_;
LABEL_40:
      v29 = objc_msgSend(v19, sel_kind);
      v30 = sub_1CFBFA894();
      v32 = v31;

      v33 = objc_msgSend(a2, sel_kind);
      v34 = sub_1CFBFA894();
      v36 = v35;

      if (v30 == v34 && v32 == v36)
      {
        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease();
        goto LABEL_50;
      }
      v37 = sub_1CFBFAD8C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if ((v37 & 1) != 0)
        goto LABEL_50;

      goto LABEL_45;
    }
    v28 = sub_1CFBFAD8C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = &selRef_setSmallControlsResizeHandleSettings_;
    if ((v28 & 1) != 0)
      goto LABEL_40;

    swift_unknownObjectRelease();
LABEL_45:
    v4 = v13;
    v5 = v42;
    v2 = v38;
    if (v38 < 0)
      goto LABEL_31;
LABEL_11:
    if (!v5)
      break;
    v11 = (v5 - 1) & v5;
    v12 = __clz(__rbit64(v5)) | (v4 << 6);
    v13 = v4;
LABEL_29:
    v17 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v12);
    if (!v17)
      goto LABEL_50;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v39)
    goto LABEL_50;
  v15 = *(_QWORD *)(v40 + 8 * v14);
  v13 = v4 + 1;
  if (v15)
    goto LABEL_28;
  v13 = v4 + 2;
  if (v4 + 2 >= v39)
    goto LABEL_50;
  v15 = *(_QWORD *)(v40 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 3;
  if (v4 + 3 >= v39)
    goto LABEL_50;
  v15 = *(_QWORD *)(v40 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 4;
  if (v4 + 4 >= v39)
    goto LABEL_50;
  v15 = *(_QWORD *)(v40 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 5;
  if (v4 + 5 >= v39)
    goto LABEL_50;
  v15 = *(_QWORD *)(v40 + 8 * v13);
  if (v15)
  {
LABEL_28:
    v11 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_29;
  }
  v16 = v4 + 6;
  while (v39 != v16)
  {
    v15 = *(_QWORD *)(v40 + 8 * v16++);
    if (v15)
    {
      v13 = v16 - 1;
      goto LABEL_28;
    }
  }
LABEL_50:
  sub_1CFBE7A6C();
}

uint64_t sub_1CFBE32E4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_1CFBFAD2C();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v9 = 4;
      while (1)
      {
        v10 = v9 - 4;
        if (v24)
        {
          v11 = (id)MEMORY[0x1D17DAF80](v9 - 4, v7);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
            goto LABEL_19;
        }
        else
        {
          v11 = *(id *)(v7 + 8 * v9);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v11;
        v14 = a3;
        v15 = objc_msgSend(v11, sel_moduleIdentifier, v22);
        v16 = sub_1CFBFA894();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          v20 = 1;
          goto LABEL_22;
        }
        v20 = sub_1CFBFAD8C();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          v8 = v12;
          v19 = v4 == v12;
          v7 = v23;
          if (!v19)
            continue;
        }
        goto LABEL_22;
      }
    }
  }
  v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

void sub_1CFBE3480(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char **v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Swift::String v27;
  Swift::String v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v1 = a1;
  v46 = MEMORY[0x1E0DEE9D8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1CFBFAC24();
    sub_1CFBBAA24(0, &qword_1ED90AD60);
    sub_1CFBE40FC((unint64_t *)&unk_1ED90AD68, &qword_1ED90AD60);
    sub_1CFBFA99C();
    v1 = v41;
    v38 = v42;
    v2 = v43;
    v3 = v44;
    v4 = v45;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v38 = a1 + 56;
    v6 = ~v5;
    v7 = -v5;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v4 = v8 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v2 = v6;
    v3 = 0;
  }
  v35 = v2;
  v37 = (unint64_t)(v2 + 64) >> 6;
  v9 = &selRef_setSmallControlsResizeHandleSettings_;
  v36 = v1;
  if ((v1 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_31:
  if (!sub_1CFBFAC48())
    goto LABEL_42;
  sub_1CFBBAA24(0, &qword_1ED90AD60);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v16 = v40;
  swift_unknownObjectRelease();
  v12 = v3;
  v10 = v4;
  if (!v40)
    goto LABEL_42;
  while (1)
  {
    if (!objc_msgSend(v16, v9[263], v35))
    {

      goto LABEL_10;
    }
    objc_opt_self();
    v17 = (void *)swift_dynamicCastObjCClass();
    if (!v17)
    {

      swift_unknownObjectRelease();
LABEL_10:
      v3 = v12;
      v4 = v10;
      if (v1 < 0)
        goto LABEL_31;
      goto LABEL_11;
    }
    v18 = v17;
    v39 = v10;
    v19 = objc_msgSend(v17, sel_uniqueIdentifier);
    v20 = sub_1CFBFA894();
    v22 = v21;

    v23 = objc_msgSend(v18, sel_containerBundleIdentifier);
    if (v23)
    {
      v24 = sub_1CFBFA894();
      v26 = v25;

      swift_getObjectType();
      v27._countAndFlagsBits = v24;
      v27._object = v26;
      v28._countAndFlagsBits = v20;
      v28._object = v22;
      v23 = (id)ControlIntentStorage.intent(bundleIdentifier:dataSourceIdentifier:)(v27, v28);
      swift_bridgeObjectRelease();
    }
    sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADE0);
    v29 = v23;
    swift_unknownObjectRetain();
    v30 = sub_1CFBB5EFC(v18, (uint64_t)v23);
    swift_unknownObjectRelease();

    v31 = objc_allocWithZone(MEMORY[0x1E0D10088]);
    v32 = v30;
    v33 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v31, sel_initWithUniqueIdentifier_controlIdentity_location_, v33, v32, 8);

    objc_msgSend(v34, sel_setPushPolicy_, 1);
    objc_msgSend(v34, sel_setCanAppearInSecureEnvironment_, 1);

    swift_unknownObjectRelease();
    MEMORY[0x1D17DAB9C]();
    if (*(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CFBFA924();
    sub_1CFBFA930();
    sub_1CFBFA918();
    v3 = v12;
    v4 = v39;
    v1 = v36;
    v9 = &selRef_setSmallControlsResizeHandleSettings_;
    if (v36 < 0)
      goto LABEL_31;
LABEL_11:
    if (!v4)
      break;
    v10 = (v4 - 1) & v4;
    v11 = __clz(__rbit64(v4)) | (v3 << 6);
    v12 = v3;
LABEL_29:
    v16 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v11);
    if (!v16)
      goto LABEL_42;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    return;
  }
  if (v13 >= v37)
    goto LABEL_42;
  v14 = *(_QWORD *)(v38 + 8 * v13);
  v12 = v3 + 1;
  if (v14)
    goto LABEL_28;
  v12 = v3 + 2;
  if (v3 + 2 >= v37)
    goto LABEL_42;
  v14 = *(_QWORD *)(v38 + 8 * v12);
  if (v14)
    goto LABEL_28;
  v12 = v3 + 3;
  if (v3 + 3 >= v37)
    goto LABEL_42;
  v14 = *(_QWORD *)(v38 + 8 * v12);
  if (v14)
    goto LABEL_28;
  v12 = v3 + 4;
  if (v3 + 4 >= v37)
    goto LABEL_42;
  v14 = *(_QWORD *)(v38 + 8 * v12);
  if (v14)
    goto LABEL_28;
  v12 = v3 + 5;
  if (v3 + 5 >= v37)
    goto LABEL_42;
  v14 = *(_QWORD *)(v38 + 8 * v12);
  if (v14)
  {
LABEL_28:
    v10 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
    goto LABEL_29;
  }
  v15 = v3 + 6;
  while (v37 != v15)
  {
    v14 = *(_QWORD *)(v38 + 8 * v15++);
    if (v14)
    {
      v12 = v15 - 1;
      goto LABEL_28;
    }
  }
LABEL_42:
  sub_1CFBE7A6C();
}

char *sub_1CFBE3994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _BYTE *v5;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_class *v24;
  _BYTE *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char *v32;
  void *v33;
  char *v34;
  id v35;
  char *v36;
  id v37;
  void *v38;
  void *v39;
  char *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  objc_super v51;
  objc_super v52;
  void *v53;
  _BYTE v54[32];

  swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_endEditingTimer] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconResizeHandleSettings] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController____lazy_storage___smallIconResizeHandleSettings] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingFeedbackGenerator] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingNotificationFeedbackGenerator] = 0;
  v5[OBJC_IVAR___CCUIPagingViewController__isEditing] = 0;
  v5[OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments] = 1;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_moduleInstanceObserver] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_controlHost] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController___rootFolderController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_iconDragManager] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_iconViewMap] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_iconViewProvider] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIPagingViewController_addButton] = 0;
  v11 = OBJC_IVAR___CCUIPagingViewController_expandedViewControllers;
  v12 = (void *)objc_opt_self();
  v13 = v5;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, sel_weakObjectsHashTable);
  v14 = OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup;
  *(_QWORD *)&v13[v14] = dispatch_group_create();
  swift_unknownObjectWeakInit();
  v15 = OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache;
  type metadata accessor for IconImageViewControllerCache();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = objc_msgSend((id)objc_opt_self(), sel_mapTableWithKeyOptions_valueOptions_, 5, 0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v17, sel_addObserver_selector_name_object_, v16, sel_purgeCache, *MEMORY[0x1E0DC4778], 0);

  *(_QWORD *)&v13[v15] = v16;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource] = 0;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers] = 0;
  v18 = OBJC_IVAR___CCUIPagingViewController_controlCenterOperationsServiceController;
  type metadata accessor for ControlCenterOperationServiceController();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v13[v18] = v19;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_controlDragWindow] = 0;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_hiddenDroppingIconViews] = 0;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics] = 0;
  v13[OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility] = 0;
  v13[OBJC_IVAR___CCUIPagingViewController_needsUpdateToSupportedSizesForAccessibility] = 0;
  v13[OBJC_IVAR___CCUIPagingViewController_isUpdatingSupportedSizesForAccessibility] = 0;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_appleKeyStoreEventsRegister] = 0;
  v13[OBJC_IVAR___CCUIPagingViewController_isFinishedRunningFirstUnlockTasks] = 0;
  sub_1CFBC1384(a1, (uint64_t)v54);
  sub_1CFBBAA24(0, &qword_1ED90AE48);
  swift_dynamicCast();
  v20 = OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager] = v53;
  v21 = a2;
  sub_1CFBC1384(a2, (uint64_t)v54);
  sub_1CFBBAA24(0, &qword_1ED90AE50);
  swift_dynamicCast();
  v22 = v53;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_moduleSettingsManager] = v53;
  v23 = *(void **)&v13[v20];
  v24 = (objc_class *)type metadata accessor for ControlsIconModelLoader();
  v25 = objc_allocWithZone(v24);
  *(_QWORD *)&v25[OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_maxListCountForFolders] = 15;
  v25[OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_iconStateDirty] = 0;
  *(_QWORD *)&v25[OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager] = v23;
  *(_QWORD *)&v25[OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager] = v22;
  *(_QWORD *)&v25[OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_controlIntentStore] = a3;
  v52.receiver = v25;
  v52.super_class = v24;
  v26 = v23;
  v27 = v22;
  swift_unknownObjectRetain();
  v28 = objc_msgSendSuper2(&v52, sel_init);
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_iconModelLoader] = v28;
  v29 = v28;
  v30 = sub_1CFBF371C();

  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_iconModel] = v30;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_controlIntentStore] = a3;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider] = a4;
  *(_QWORD *)&v13[OBJC_IVAR___CCUIPagingViewController_controlExtensionProvider] = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v31 = a5;

  v51.receiver = v13;
  v51.super_class = (Class)type metadata accessor for PagingViewController();
  v32 = (char *)objc_msgSendSuper2(&v51, sel_initWithNibName_bundle_, 0, 0);
  v33 = *(void **)&v32[OBJC_IVAR___CCUIPagingViewController_controlExtensionProvider];
  v34 = v32;
  objc_msgSend(v33, sel_registerObserver_, v34);
  v35 = objc_msgSend((id)objc_opt_self(), sel_subjectMonitorRegistry);
  v36 = v34;
  v37 = objc_msgSend(v35, sel_addMonitor_subjectMask_subscriptionOptions_, v36, 1, 1);

  swift_unknownObjectRelease();
  *(_QWORD *)&v36[OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription] = v37;
  swift_unknownObjectRelease();
  v38 = *(void **)&v36[OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager];
  v39 = *(void **)&v36[OBJC_IVAR___CCUIPagingViewController_moduleSettingsManager];
  objc_allocWithZone((Class)type metadata accessor for ModuleInstanceObserver());
  v40 = v36;
  v41 = v38;
  v42 = v39;
  v43 = sub_1CFBB626C(v36, v38, v39);
  v44 = *(void **)&v40[OBJC_IVAR___CCUIPagingViewController_moduleInstanceObserver];
  *(_QWORD *)&v40[OBJC_IVAR___CCUIPagingViewController_moduleInstanceObserver] = v43;

  sub_1CFBD7FAC();
  sub_1CFBDA9B8(0, 0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90B010);
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1CFC021B0;
  v46 = sub_1CFBFA7B0();
  v47 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v45 + 32) = v46;
  *(_QWORD *)(v45 + 40) = v47;
  v48 = v40;
  sub_1CFBFAA14();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v21);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v48;
}

uint64_t type metadata accessor for PagingViewController()
{
  return objc_opt_self();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1CFBE4030()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE4040()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE4050()
{
  return swift_deallocObject();
}

void sub_1CFBE4060(void *a1, _BYTE *a2)
{
  uint64_t v2;

  sub_1CFBCFAB0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void ***)(v2 + 32));
}

uint64_t sub_1CFBE406C()
{
  return swift_deallocObject();
}

void sub_1CFBE407C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBD781C(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1CFBE4084()
{
  return swift_deallocObject();
}

id sub_1CFBE4094(void *a1, _BYTE *a2)
{
  uint64_t *v2;

  return sub_1CFBD0284(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1CFBE40A0()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE40B0()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE40C0()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE40D0()
{
  return swift_deallocObject();
}

void sub_1CFBE40E0(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBD0B34(a1, a2, *(void **)(v2 + 16), *(void (**)(void *, id, uint64_t, _QWORD))(v2 + 24));
}

uint64_t sub_1CFBE40EC()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE40FC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1CFBBAA24(255, a2);
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEFCF8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CFBE413C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1CFBE4184(void *a1)
{
  uint64_t v1;

  sub_1CFBD2B78(a1, *(void **)(v1 + 16));
}

uint64_t sub_1CFBE418C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CFBE41B0(int a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBDC54C(a1, a2, v2);
}

void sub_1CFBE41B8(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBD3888(a1, v1);
}

id sub_1CFBE41C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1CFBD39C4(a1, v2, a2);
}

void sub_1CFBE41C8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBD3C44(a1, a2, v2);
}

id sub_1CFBE41D0(void *a1)
{
  uint64_t v1;

  return sub_1CFBD4384(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_1CFBE41D8()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE41E8()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE41F8()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE4208()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1CFBE4234()
{
  uint64_t v0;

  sub_1CFBD589C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1CFBE423C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_endEditingTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconResizeHandleSettings] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___smallIconResizeHandleSettings] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingFeedbackGenerator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingNotificationFeedbackGenerator] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController__isEditing] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_moduleInstanceObserver] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_controlHost] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconDragManager] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconViewMap] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_iconViewProvider] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_addButton] = 0;
  v1 = OBJC_IVAR___CCUIPagingViewController_expandedViewControllers;
  *(_QWORD *)&v0[v1] = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  v2 = OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup;
  *(_QWORD *)&v0[v2] = dispatch_group_create();
  swift_unknownObjectWeakInit();
  v3 = OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache;
  type metadata accessor for IconImageViewControllerCache();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = objc_msgSend((id)objc_opt_self(), sel_mapTableWithKeyOptions_valueOptions_, 5, 0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v4, sel_purgeCache, *MEMORY[0x1E0DC4778], 0);

  *(_QWORD *)&v0[v3] = v4;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers] = 0;
  v6 = OBJC_IVAR___CCUIPagingViewController_controlCenterOperationsServiceController;
  type metadata accessor for ControlCenterOperationServiceController();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[v6] = v7;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_controlDragWindow] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_hiddenDroppingIconViews] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController_needsUpdateToSupportedSizesForAccessibility] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController_isUpdatingSupportedSizesForAccessibility] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIPagingViewController_appleKeyStoreEventsRegister] = 0;
  v0[OBJC_IVAR___CCUIPagingViewController_isFinishedRunningFirstUnlockTasks] = 0;

  sub_1CFBFAD14();
  __break(1u);
}

uint64_t sub_1CFBE455C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a5 + 16))(a5, a1, a2, a3, a4);
}

void sub_1CFBE4580(void (*a1)(void *, uint64_t), uint64_t a2)
{
  _QWORD *v4;
  char *v5;
  double v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void (*v24)(void *, uint64_t);
  char *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char *v33;
  id v34;
  unsigned int v35;
  uint64_t v36;
  void (*v37)(void *, uint64_t);
  char *v38;
  char *v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  _BYTE v43[16];
  uint64_t v44;
  char *v45;
  __int128 v46;
  __int128 aBlock;
  void (*v48)(uint64_t, void *);
  void *v49;
  uint64_t (*v50)();
  char *v51;

  v4 = (_QWORD *)sub_1CFBFA600();
  v5 = (char *)*(v4 - 1);
  *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](v4).n128_u64[0];
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a2;
  v44 = a2;
  objc_msgSend(a1, sel_loadViewIfNeeded, v6);
  v9 = *(void **)((char *)a1 + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (!v9)
  {
LABEL_33:
    __break(1u);
    return;
  }
  v10 = objc_msgSend(v9, sel_visibleIconListViews);
  sub_1CFBBAA24(0, &qword_1ED90AD78);
  v11 = sub_1CFBFA900();

  if (v11 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  v39 = v5;
  v40 = v4;
  if (v12)
  {
    while (v12 >= 1)
    {
      v38 = v8;
      v42 = v11 & 0xC000000000000001;
      v37 = a1;
      if ((v11 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x1D17DAF80](0, v11);
      else
        v13 = *(id *)(v11 + 32);
      v14 = v13;
      v4 = (_QWORD *)swift_allocObject();
      v4[2] = v14;
      v4[3] = sub_1CFBE78D4;
      v4[4] = v43;
      v15 = v14;
      sub_1CFBB8538(0);
      v16 = swift_allocObject();
      a1 = sub_1CFBE8054;
      *(_QWORD *)(v16 + 16) = sub_1CFBE8054;
      *(_QWORD *)(v16 + 24) = v4;
      v50 = sub_1CFBBAC70;
      v51 = (char *)v16;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v48 = sub_1CFBCD300;
      v49 = &block_descriptor_170;
      v17 = _Block_copy(&aBlock);
      v8 = v51;
      swift_retain();
      swift_release();
      objc_msgSend(v15, sel_enumerateDisplayedIconViewsUsingBlock_, v17);

      _Block_release(v17);
      LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v17 & 1) == 0)
      {
        v18 = v12 - 1;
        if (v12 == 1)
        {
LABEL_16:
          swift_bridgeObjectRelease();
          v24 = sub_1CFBE8054;
          v8 = v38;
          a1 = v37;
          goto LABEL_20;
        }
        v19 = 0;
        while (1)
        {
          v20 = v42 ? (id)MEMORY[0x1D17DAF80](v19 + 1, v11) : *(id *)(v11 + 8 * v19 + 40);
          v21 = v20;
          v4 = (_QWORD *)swift_allocObject();
          v4[2] = v21;
          v4[3] = sub_1CFBE78D4;
          v4[4] = v43;
          v22 = v21;
          sub_1CFBB8538((uint64_t)sub_1CFBE8054);
          v8 = (char *)swift_allocObject();
          *((_QWORD *)v8 + 2) = sub_1CFBE8054;
          *((_QWORD *)v8 + 3) = v4;
          v50 = sub_1CFBBAC70;
          v51 = v8;
          *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          v48 = sub_1CFBCD300;
          v49 = &block_descriptor_170;
          v23 = _Block_copy(&aBlock);
          v5 = v51;
          swift_retain();
          swift_release();
          objc_msgSend(v22, sel_enumerateDisplayedIconViewsUsingBlock_, v23);

          _Block_release(v23);
          LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if ((v23 & 1) != 0)
            break;
          if (v18 == ++v19)
            goto LABEL_16;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      v12 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      v39 = v5;
      v40 = v4;
      if (!v12)
        goto LABEL_19;
    }
    __break(1u);
    goto LABEL_33;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  v24 = 0;
LABEL_20:
  v25 = *(char **)((char *)a1 + OBJC_IVAR___CCUIPagingViewController_controlDragWindow);
  if (v25)
  {
    v42 = (unint64_t)v24;
    v26 = *(void **)&v25[OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews];
    v38 = v25;
    v27 = objc_msgSend(v26, sel_objectEnumerator);
    sub_1CFBFA9B4();

    sub_1CFBFA5F4();
    while (v49)
    {
      sub_1CFBBFA58(&aBlock, &v46);
      type metadata accessor for ControlIconDragPreview();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v28 = v45;
        v29 = *(void **)&v45[OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView];
        if (v29)
        {
          v30 = v29;
          v31 = objc_msgSend(v30, sel_icon);
          if (v31)
          {
            v32 = v31;
            v33 = v8;
            v34 = objc_msgSend(v31, sel_gridSizeClass);
            CCUIGridSizeClassForSBHIconGridSizeClass();

            LODWORD(v34) = CCUINumberOfColumnsForGridSizeClass();
            v35 = CCUINumberOfRowsForGridSizeClass();
            v36 = v34;
            v8 = v33;
            (*(void (**)(uint64_t, id, uint64_t, uint64_t, unint64_t))(v41 + 16))(v41, v30, 1, 1, v36 | ((unint64_t)v35 << 16));

          }
          else
          {

          }
        }
        else
        {

        }
      }
      sub_1CFBFA5F4();
    }
    (*((void (**)(char *, _QWORD *))v39 + 1))(v8, v40);

    v24 = (void (*)(void *, uint64_t))v42;
  }
  sub_1CFBB8538((uint64_t)v24);
}

void sub_1CFBE4B38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1CFBFAC24();
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    sub_1CFBE40FC(&qword_1EFBF1750, &qword_1ED90AE70);
    sub_1CFBFA99C();
    v2 = v33;
    v3 = v34;
    v4 = v35;
    v5 = v36;
    v6 = v37;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v3 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = v8;
    v5 = 0;
  }
  v31 = (unint64_t)(v4 + 64) >> 6;
  v29 = v3;
  while (v2 < 0)
  {
    if (!sub_1CFBFAC48())
      goto LABEL_44;
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v14 = v32;
    swift_unknownObjectRelease();
    v13 = v5;
    v11 = v6;
    if (!v32)
      goto LABEL_44;
LABEL_34:
    objc_opt_self();
    v18 = swift_dynamicCastObjCClass();
    if (v18)
    {
      v19 = (void *)v18;
      v20 = v14;
      if (!objc_msgSend(v19, sel_activeDataSource))
        goto LABEL_9;
      v21 = swift_dynamicCastObjCProtocolConditional();
      if (!v21)
      {
        swift_unknownObjectRelease();
LABEL_9:

        goto LABEL_10;
      }
      v22 = (void *)v21;
      swift_getObjectType();
      if ((objc_msgSend(v22, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) != 0)
      {
        v23 = objc_msgSend(v22, sel_uniqueIdentifier);
        sub_1CFBFA894();

        v24 = objc_msgSend(v22, sel_containerBundleIdentifier);
        if (v24)
        {
          v25 = v24;
          v28 = *(id *)(a2 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
          v26 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          objc_msgSend(v28, sel_deleteIntentWithBundleIdentifier_dataSourceIdentifier_, v25, v26);

        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v3 = v29;
      }
      v27 = *(_QWORD *)(a2 + OBJC_IVAR___CCUIPagingViewController_iconImageViewControllerCache);
      swift_unknownObjectRetain();
      sub_1CFBC159C((uint64_t)v22, v27);

      swift_unknownObjectRelease_n();
    }
    else
    {

    }
LABEL_10:
    v5 = v13;
    v6 = v11;
  }
  if (v6)
  {
    v11 = (v6 - 1) & v6;
    v12 = __clz(__rbit64(v6)) | (v5 << 6);
    v13 = v5;
LABEL_33:
    v14 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v12);
    if (!v14)
      goto LABEL_44;
    goto LABEL_34;
  }
  v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v31)
      goto LABEL_44;
    v16 = *(_QWORD *)(v3 + 8 * v15);
    v13 = v5 + 1;
    if (!v16)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v31)
        goto LABEL_44;
      v16 = *(_QWORD *)(v3 + 8 * v13);
      if (!v16)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v31)
          goto LABEL_44;
        v16 = *(_QWORD *)(v3 + 8 * v13);
        if (!v16)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v31)
            goto LABEL_44;
          v16 = *(_QWORD *)(v3 + 8 * v13);
          if (!v16)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v31)
              goto LABEL_44;
            v16 = *(_QWORD *)(v3 + 8 * v13);
            if (!v16)
            {
              v17 = v5 + 6;
              while (v31 != v17)
              {
                v16 = *(_QWORD *)(v3 + 8 * v17++);
                if (v16)
                {
                  v13 = v17 - 1;
                  goto LABEL_32;
                }
              }
LABEL_44:
              sub_1CFBE7A6C();
              return;
            }
          }
        }
      }
    }
LABEL_32:
    v11 = (v16 - 1) & v16;
    v12 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

uint64_t sub_1CFBE4F8C(uint64_t a1, char *a2, void *a3, void *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25[2];
  int64_t v26;

  v24 = a1 + 56;
  v11 = 1 << *(_BYTE *)(a1 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(a1 + 56);
  v26 = (unint64_t)(v11 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v15 = 0;
  if (!v13)
    goto LABEL_5;
LABEL_4:
  v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v22 = v21[1];
    v25[0] = *v21;
    v25[1] = v22;
    swift_bridgeObjectRetain();
    sub_1CFBE1620(v25, a2, a3, a4, a5);
    if (v5)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v15++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v15 >= v26)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v15);
    if (!v19)
    {
      v20 = v15 + 1;
      if (v15 + 1 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
        goto LABEL_14;
      v20 = v15 + 2;
      if (v15 + 2 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
        goto LABEL_14;
      v20 = v15 + 3;
      if (v15 + 3 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
      {
LABEL_14:
        v15 = v20;
        goto LABEL_15;
      }
      v23 = v15 + 4;
      if (v15 + 4 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v23);
      v15 += 4;
      if (!v19)
        break;
    }
LABEL_15:
    v13 = (v19 - 1) & v19;
  }
  while (1)
  {
    v15 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v15 >= v26)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v15);
    ++v23;
    if (v19)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

void _s15ControlCenterUI20PagingViewControllerC07controlB8GridSize3forSo6CGSizeVSo026CCUIContentModuleContainereF0C_tF_0()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(v0, sel_loadViewIfNeeded);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v2, sel_listLayoutProvider);
    v4 = objc_msgSend((id)type metadata accessor for IconListRootFolderController(), sel_iconLocation);
    v5 = objc_msgSend(v3, sel_layoutForIconLocation_, v4);

    if (v5)
    {
      UIInterfaceOrientationIsPortrait((uint64_t)objc_msgSend(v2, sel_orientation));
      v6 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
      objc_msgSend(v5, sel_iconImageInfoForGridSizeClass_, v6);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void _s15ControlCenterUI20PagingViewControllerC022contentModuleContainereF0_016willOpenExpandedH0ySo011CCUIContenthieF0C_So0mH0_ptF_0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(v1 + OBJC_IVAR___CCUIPagingViewController_isSuppressingUpdatesToSupportedSizesForAccessibility) = 1;
  sub_1CFBDA89C();
  dispatch_group_enter(*(dispatch_group_t *)(v1
                                           + OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_addObject_, a1);
  v3 = v1 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1D17DBD84](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_pagingViewController_willExpand_, v1, a1);
    swift_unknownObjectRelease();
  }
  sub_1CFBD78A8(1, a1);
}

id _s15ControlCenterUI20PagingViewControllerC022contentModuleContainereF0_016didCloseExpandedH0ySo011CCUIContenthieF0C_So0mH0_ptF_0(void *a1)
{
  char *v1;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  id result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AF08);
  *(_QWORD *)&v4 = MEMORY[0x1E0C80A78](v3).n128_u64[0];
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController_expandedViewControllers];
  objc_msgSend(v7, sel_removeObject_, a1, v4);
  v8 = &v1[OBJC_IVAR___CCUIPagingViewController_pagingDelegate];
  swift_beginAccess();
  v9 = (void *)MEMORY[0x1D17DBD84](v8);
  if (v9)
  {
    objc_msgSend(v9, sel_pagingViewController_didClose_, v1, a1);
    swift_unknownObjectRelease();
  }
  v10 = _s15ControlCenterUI20PagingViewControllerC017compactModeSourceE03forSo6UIViewCSgSo026CCUIContentModuleContainereF0C_tF_0(a1);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_setNeedsLayout);

  }
  dispatch_group_leave(*(dispatch_group_t *)&v1[OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup]);
  result = objc_msgSend(v7, sel_count);
  if (!result)
  {
    v13 = sub_1CFBFA96C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
    sub_1CFBFA954();
    v14 = v1;
    v15 = sub_1CFBFA948();
    v16 = (_QWORD *)swift_allocObject();
    v17 = MEMORY[0x1E0DF06E8];
    v16[2] = v15;
    v16[3] = v17;
    v16[4] = v14;
    sub_1CFBCD4B4((uint64_t)v6, (uint64_t)&unk_1EFBF1798, (uint64_t)v16);
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_1CFBE5508()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBE552C()
{
  uint64_t v0;

  return sub_1CFBDE5D0(*(void **)(v0 + 16));
}

void sub_1CFBE5534(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBDEBAC(a1, v1);
}

void sub_1CFBE553C(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBDEC08(a1, v1);
}

void sub_1CFBE5544(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBDEC68(a1, a2, v2);
}

uint64_t sub_1CFBE554C()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  void *v13;
  id v14;
  id v16;
  unint64_t v17;
  char v18;

  v0 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v0)
    goto LABEL_9;
  v1 = v0;
  if ((objc_msgSend(v0, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) == 0)
    goto LABEL_9;
  swift_unknownObjectRetain();
  v2 = objc_msgSend(v1, sel_uniqueIdentifier);
  v3 = sub_1CFBFA894();
  v5 = v4;

  v6 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (!v6)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    LOBYTE(v14) = 0;
    return v14 & 1;
  }
  v7 = v6;
  v8 = sub_1CFBFA894();
  v10 = v9;

  swift_getObjectType();
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  v12._countAndFlagsBits = v3;
  v12._object = v5;
  v13 = (void *)ControlIntentStorage.intent(bundleIdentifier:dataSourceIdentifier:)(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    swift_unknownObjectRelease();

    LOBYTE(v14) = 1;
  }
  else
  {
    v16 = objc_msgSend(v13, sel__codableDescription);
    v14 = objc_msgSend(v16, sel_attributes);

    if (v14)
    {
      sub_1CFBBAA24(0, &qword_1EFBF1770);
      sub_1CFBBAA24(0, &qword_1EFBF1778);
      sub_1CFBE40FC((unint64_t *)&unk_1EFBF1780, &qword_1EFBF1770);
      v17 = sub_1CFBFA84C();

      sub_1CFBCD03C(v17);
      LOBYTE(v14) = v18;
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();

    }
  }
  return v14 & 1;
}

uint64_t _s15ControlCenterUI20PagingViewControllerC04iconE0_23configurationDidEndWithySo06SBIconE0C_So07SBHIconE24ConfigurationInteraction_ptF_0()
{
  uint64_t v0;
  _QWORD **v1;
  uint64_t v2;
  char v3;
  unint64_t v4;

  v1 = (_QWORD **)(v0 + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  v2 = sub_1CFBD66C8(0xD00000000000001FLL, 0x80000001CFC05FC0, *v1);
  if ((v3 & 1) == 0)
  {
    v4 = v2;
    swift_beginAccess();
    sub_1CFBD67AC(v4);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
  return swift_unknownObjectWeakAssign();
}

id sub_1CFBE585C(id a1)
{
  char *v1;
  id result;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(v1, sel_loadViewIfNeeded);
  result = *(id *)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v4 = objc_msgSend(result, sel_folderView);
    v5 = objc_msgSend(v4, sel_window);

    if (v5)
    {
      v6 = objc_msgSend(v5, sel_windowScene);

      if (v6)
      {
        if (v6 == a1)
        {
          v7 = OBJC_IVAR___CCUIPagingViewController_controlDragWindow;
          v5 = *(id *)&v1[OBJC_IVAR___CCUIPagingViewController_controlDragWindow];
          if (v5)
          {
            v8 = v5;

          }
          else
          {
            v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlDragWindow()), sel_initWithWindowScene_, a1);
            v10 = *(void **)&v1[v7];
            *(_QWORD *)&v1[v7] = v9;

            v5 = *(id *)&v1[v7];
            if (v5)
              v11 = v5;
          }
          return v5;
        }

      }
      return 0;
    }
    return v5;
  }
  __break(1u);
  return result;
}

char *sub_1CFBE596C(void *a1)
{
  id v2;
  id v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = objc_allocWithZone((Class)type metadata accessor for ControlIconDragPreview());
  v3 = a1;
  v4 = sub_1CFBB6C04(v3);
  objc_msgSend(v3, sel_iconImageCenter);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v3, sel_window);
  objc_msgSend(v3, sel_convertPoint_toView_, v9, v6, v8);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, sel_setCenter_, v11, v13);
  return v4;
}

void *sub_1CFBE5A38(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  void *result;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  result = *(void **)&v2[OBJC_IVAR___CCUIPagingViewController_iconDragManager];
  if (!result)
  {
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_noteRootFolderDidMutate);
  v10 = MEMORY[0x1E0DEE9E8];
  if (a1)
  {
    v6 = swift_bridgeObjectRetain();
    sub_1CFBD101C(v6);
    swift_bridgeObjectRelease();
  }
  if ((v2[OBJC_IVAR___CCUIPagingViewController_isUpdatingSupportedSizesForAccessibility] & 1) == 0)
  {
    if ((v10 & 0xC000000000000001) == 0)
    {
      if (*(uint64_t *)(v10 + 16) < 1)
        goto LABEL_8;
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    v7 = sub_1CFBFAC30();
    swift_bridgeObjectRelease();
    if (v7 >= 1)
    {
LABEL_7:
      objc_msgSend(*(id *)&v2[OBJC_IVAR___CCUIPagingViewController_iconModel], sel_saveIconStateIfNeeded);
      swift_bridgeObjectRetain();
      sub_1CFBDA9B8(0, v10);
      swift_bridgeObjectRelease();
    }
  }
LABEL_8:
  if (a2)
  {
    v8 = v2;
    v9 = swift_bridgeObjectRetain();
    sub_1CFBE4B38(v9, (uint64_t)v8);
    swift_bridgeObjectRelease();

  }
  sub_1CFBD7FAC();
  return (void *)swift_bridgeObjectRelease();
}

id sub_1CFBE5B7C(void *a1, id a2)
{
  char *v2;
  char *v3;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  id v14;
  id result;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;

  v3 = v2;
  if (a2)
  {
    v5 = a2;
    if (qword_1EFBEFE18 != -1)
      swift_once();
    v6 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EFBF0550);
    v7 = a2;
    v8 = a2;
    v9 = sub_1CFBFA78C();
    v10 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v11 = 138412290;
      v13 = a2;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      sub_1CFBFABD0();
      *v12 = v25;

      _os_log_impl(&dword_1CFB7D000, v9, v10, "Controls gallery returned an error: %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v12, -1, -1);
      MEMORY[0x1D17DBCE8](v11, -1, -1);

      return objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }

LABEL_10:
    return objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  if (!a1)
  {
    if (qword_1EFBEFE18 != -1)
      swift_once();
    v22 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EFBF0550);
    v9 = sub_1CFBFA78C();
    v23 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v9, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1CFB7D000, v9, v23, "Controls gallery returned nil control without an error", v24, 2u);
      MEMORY[0x1D17DBCE8](v24, -1, -1);
    }
    goto LABEL_10;
  }
  v14 = a1;
  result = objc_msgSend(v3, sel_loadViewIfNeeded);
  v16 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v14, sel_control);
    v19 = *(void **)&v3[OBJC_IVAR___CCUIPagingViewController_controlIntentStore];
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v14;
    v21 = v14;
    sub_1CFBC307C(v18, v19, (void (*)(void))sub_1CFBE7A24, v20);

    swift_release();
    return objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *_s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillPresentyySo013CCUISControlsheF0CF_0()
{
  char *v0;
  void *result;
  id v2;
  uint64_t v3;

  sub_1CFBD65BC(0xD000000000000013, 0x80000001CFC07010);
  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v2 = objc_msgSend(result, sel_folderView);
    objc_msgSend(v2, sel_setSuppressesEditingStateForListViews_animated_, 1, 1);

    v3 = sub_1CFBBAA24(0, &qword_1EFBF0A70);
    MEMORY[0x1E0C80A78](v3);
    return (void *)sub_1CFBFAAF8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *_s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillDismissyySo013CCUISControlsheF0CF_0()
{
  char *v0;
  id v1;
  id v2;
  void *result;
  id v4;
  uint64_t v5;

  objc_msgSend((id)objc_opt_self(), sel_resetEditingBorderPulseAnimationStartTime);
  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  objc_msgSend(v0, sel_loadViewIfNeeded);
  result = *(void **)&v0[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v4 = objc_msgSend(result, sel_folderView);
    objc_msgSend(v4, sel_setSuppressesEditingStateForListViews_animated_, 0, v2 != 0);

    v5 = sub_1CFBBAA24(0, &qword_1EFBF0A70);
    MEMORY[0x1E0C80A78](v5);
    return (void *)sub_1CFBFAAF8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF10DidDismissyySo013CCUISControlsheF0CF_0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD **v2;
  uint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v1 = v0;
  v2 = (_QWORD **)(v0 + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  v3 = sub_1CFBD66C8(0xD000000000000013, 0x80000001CFC07010, *v2);
  if ((v4 & 1) == 0)
  {
    v5 = v3;
    swift_beginAccess();
    sub_1CFBD67AC(v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();
  v6 = OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers;
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers);
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 16);
    if (v8)
    {
      v9 = *(void **)(v1 + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
      swift_bridgeObjectRetain();
      v10 = v7 + 40;
      do
      {
        swift_bridgeObjectRetain();
        v11 = (void *)sub_1CFBFA870();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_removeModuleWithUniqueIdentifier_, v11);

        v10 += 16;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }
  }
  *(_QWORD *)(v1 + v6) = 0;
  return swift_bridgeObjectRelease();
}

id sub_1CFBE6288(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  objc_class *v43;
  _BYTE *v44;
  _OWORD *v45;
  int64x2_t *v46;
  id v47;
  id v48;
  objc_class *v49;
  _BYTE *v50;
  _OWORD *v51;
  int64x2_t *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  id result;
  id v62;
  _QWORD v63[2];
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  objc_super v73;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AF90);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CFBFA6D8();
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)&v12 = MEMORY[0x1E0C80A78](v10).n128_u64[0];
  v14 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(a1, sel_activeDataSource, v12);
  if (!v15)
    goto LABEL_20;
  v16 = v15;
  objc_opt_self();
  v17 = (void *)swift_dynamicCastObjCClass();
  if (!v17)
  {
    swift_unknownObjectRelease();
LABEL_20:
    v42 = objc_msgSend((id)objc_opt_self(), sel_systemPinkColor);
    v43 = (objc_class *)type metadata accessor for ColorViewController();
    v44 = objc_allocWithZone(v43);
    v45 = &v44[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v45 = 0u;
    v45[1] = 0u;
    v46 = (int64x2_t *)&v44[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v46->i64[0] = 0;
    v46->i64[1] = 0;
    v46[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v44[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v44[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v44[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v42;
    v73.receiver = v44;
    v73.super_class = v43;
    return objc_msgSendSuper2(&v73, sel_initWithNibName_bundle_, 0, 0);
  }
  v18 = v17;
  v64 = a3;
  v66 = a2;
  v67 = v16;
  v69 = v14;
  v71 = v10;
  v19 = objc_msgSend(v17, sel_moduleIdentifier);
  if (!v19)
  {
    sub_1CFBFA894();
    v19 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v65 = a1;
  v70 = v11;
  v63[1] = sub_1CFBFA894();
  v68 = v20;
  v21 = *(void **)(v3 + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
  v22 = objc_msgSend(v18, sel_uniqueIdentifier);
  if (!v22)
  {
    sub_1CFBFA894();
    v22 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v23 = objc_msgSend(v21, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v19, v22);

  v24 = OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers;
  if (*(_QWORD *)(v3 + OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers))
    v25 = *(_QWORD **)(v3 + OBJC_IVAR___CCUIPagingViewController_controlsGalleryModuleInstanceUniqueIdentifiers);
  else
    v25 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = objc_msgSend(v18, sel_uniqueIdentifier);
  v27 = sub_1CFBFA894();
  v29 = v28;

  LOBYTE(v26) = sub_1CFBE1DE0(v27, v29, v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    v30 = objc_msgSend(v18, sel_uniqueIdentifier);
    v31 = sub_1CFBFA894();
    v63[0] = v32;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_1CFBEBDF0(0, v25[2] + 1, 1, v25);
    v34 = v25[2];
    v33 = v25[3];
    if (v34 >= v33 >> 1)
      v25 = sub_1CFBEBDF0((_QWORD *)(v33 > 1), v34 + 1, 1, v25);
    v25[2] = v34 + 1;
    v35 = &v25[2 * v34];
    v36 = v63[0];
    v35[4] = v31;
    v35[5] = v36;
  }
  *(_QWORD *)(v3 + v24) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v48 = objc_msgSend((id)objc_opt_self(), sel_systemCyanColor);
    v49 = (objc_class *)type metadata accessor for ColorViewController();
    v50 = objc_allocWithZone(v49);
    v51 = &v50[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo];
    *v51 = 0u;
    v51[1] = 0u;
    v52 = (int64x2_t *)&v50[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds];
    v52->i64[0] = 0;
    v52->i64[1] = 0;
    v52[1] = vdupq_n_s64(0x4049000000000000uLL);
    *(_QWORD *)&v50[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius] = 0;
    v50[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners] = 1;
    *(_QWORD *)&v50[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color] = v48;
    v72.receiver = v50;
    v72.super_class = v49;
    v47 = objc_msgSendSuper2(&v72, sel_initWithNibName_bundle_, 0, 0);
    swift_unknownObjectRelease();
    return v47;
  }
  v37 = v23;
  v38 = objc_msgSend(v37, sel_module);
  v39 = objc_msgSend(v18, sel_uniqueIdentifier);
  sub_1CFBFA894();

  sub_1CFBFA690();
  swift_bridgeObjectRelease();
  v41 = v70;
  v40 = v71;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v9, 1, v71) == 1)
  {
    sub_1CFBFA6CC();
    sub_1CFBE7CCC((uint64_t)v9, (uint64_t *)&unk_1ED90AF90);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v69, v9, v40);
  }
  v53 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v54 = objc_msgSend(v53, sel_defaultControlCenterPresentationContext);
  v55 = objc_allocWithZone((Class)CCUIContentModuleContainerViewController);
  v56 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v57 = (void *)sub_1CFBFA6A8();
  v47 = objc_msgSend(v55, sel_initWithModuleIdentifier_uniqueIdentifier_contentModule_presentationContext_, v56, v57, v38, v54);
  swift_unknownObjectRelease();

  objc_msgSend(v47, sel_setContentRenderingMode_, 1);
  objc_msgSend(v47, sel_setContentMetrics_, v64);
  v58 = objc_msgSend(v65, sel_gridSizeClass);
  v59 = CCUIGridSizeClassForSBHIconGridSizeClass();

  objc_msgSend(v47, sel_setGridSizeClass_, v59);
  objc_msgSend(v47, sel_setAllowsAutomaticForwardingOfAppearanceMethods_, 1);
  objc_msgSend(v47, sel_redirectTapsWithAction_, v66);
  v60 = objc_msgSend(v47, sel_contentViewController);
  if ((objc_msgSend(v60, sel_respondsToSelector_, sel_wantsConfigurationIntent) & 1) == 0
    || !objc_msgSend(v60, sel_wantsConfigurationIntent))
  {
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v71);
    swift_bridgeObjectRelease();
    return v47;
  }
  result = objc_msgSend(v60, sel_respondsToSelector_, sel_defaultConfigurationIntent);
  if ((result & 1) != 0)
  {
    v62 = objc_msgSend(v60, sel_defaultConfigurationIntent);
    swift_bridgeObjectRelease();
    objc_msgSend(v60, sel_setConfigurationIntent_, v62);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v71);
    return v47;
  }
  __break(1u);
  return result;
}

id sub_1CFBE6A14(void *a1)
{
  char *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  char *v20;
  BOOL v21;
  char *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  _QWORD aBlock[6];
  char v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, sel_copyWithUniqueLeafIdentifier);
  if (objc_msgSend(v2, sel_activeDataSource))
  {
    v34 = &unk_1EFC57FF8;
    v3 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v2, sel_addIconDataSource_, objc_msgSend(v3, sel_copyWithUniqueIdentifier));
      objc_msgSend(v2, sel_removeIconDataSource_, v4);
      if ((objc_msgSend(v4, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) != 0)
      {
        v5 = objc_msgSend(v4, sel_uniqueIdentifier);
        sub_1CFBFA894();

        v6 = objc_msgSend(v4, sel_containerBundleIdentifier);
        if (v6)
        {
          v7 = v6;
          v8 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController_controlIntentStore];
          v9 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          objc_msgSend(v8, sel_deleteIntentWithBundleIdentifier_dataSourceIdentifier_, v7, v9);

        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  objc_msgSend(v1, sel_loadViewIfNeeded);
  v10 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v10)
    goto LABEL_31;
  v11 = v10;
  v12 = objc_msgSend(v11, sel_folderView);
  v13 = objc_msgSend(v11, sel_folderView);
  v14 = objc_msgSend(v13, sel_currentPageIndex);

  v15 = objc_msgSend(v12, sel_iconListModelIndexForPageIndex_, v14);
  v33 = 0;
  v16 = objc_msgSend(v11, sel_folder);
  if (v16)
  {
    v17 = v16;

  }
  objc_msgSend(v11, sel_layoutIconListsWithAnimationType_forceRelayout_, -1, 0);
  if (v33 == 1)
  {
    v18 = objc_msgSend(v11, sel_folderView);
    v19 = objc_msgSend(v11, sel_folderView);
    v20 = (char *)objc_msgSend(v19, sel_currentPageIndex);

    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v23 = (_QWORD *)swift_allocObject();
      v23[2] = sub_1CFBE2238;
      v23[3] = 0;
      v23[4] = v11;
      v23[5] = v2;
      aBlock[4] = sub_1CFBE7EFC;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBCD038;
      aBlock[3] = &block_descriptor_204;
      v24 = _Block_copy(aBlock);
      v25 = v11;
      v11 = v2;
      swift_release();
      objc_msgSend(v18, sel_setCurrentPageIndex_animated_completion_, v22, 1, v24);
      _Block_release(v24);
      goto LABEL_27;
    }
    __break(1u);
LABEL_31:
    __break(1u);
  }
  v26 = objc_msgSend(v11, sel_firstIconViewForIcon_, v2);
  if (v26)
  {
    v25 = v26;
    if (objc_msgSend(v25, sel_supportsConfigurationCard)
      && (v27 = objc_msgSend(v25, sel_customIconImageViewController)) != 0)
    {
      v28 = v27;
      objc_opt_self();
      v29 = (void *)swift_dynamicCastObjCClass();
      if (v29)
      {
        v18 = objc_msgSend(v29, sel_contentViewController);
        if ((objc_msgSend(v18, sel_respondsToSelector_, sel_promptsForUserConfiguration) & 1) == 0)
        {

          v11 = v25;
          goto LABEL_27;
        }
        v30 = objc_msgSend(v18, sel_promptsForUserConfiguration);

        if ((v30 & 1) != 0)
          objc_msgSend(v25, sel_presentConfigurationCard);
      }

      v11 = v28;
    }
    else
    {

    }
    v18 = v25;
LABEL_27:

    v2 = v25;
    v11 = v18;
  }

  return objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1CFBE6EF4(void *a1)
{
  char *v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[6];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, sel_loadViewIfNeeded);
  v3 = *(void **)&v1[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!v3)
    goto LABEL_9;
  v4 = v3;
  v5 = objc_msgSend(v4, sel_folderView);
  v6 = objc_msgSend(v4, sel_folderView);
  v7 = objc_msgSend(v6, sel_currentPageIndex);

  v8 = objc_msgSend(v5, sel_iconListModelIndexForPageIndex_, v7);
  v20 = 0;
  v9 = objc_msgSend(v4, sel_folder);
  if (v9)
  {
    v10 = v9;

  }
  objc_msgSend(v4, sel_layoutIconListsWithAnimationType_forceRelayout_, -1, 0);
  if (v20 == 1)
  {
    v11 = objc_msgSend(v4, sel_folderView);
    v12 = objc_msgSend(v4, sel_folderView);
    v13 = (char *)objc_msgSend(v12, sel_currentPageIndex);

    v14 = v13 + 1;
    if (!__OFADD__(v13, 1))
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = 0;
      v15[3] = 0;
      v15[4] = v4;
      v15[5] = a1;
      v19[4] = sub_1CFBC3D2C;
      v19[5] = v15;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 1107296256;
      v19[2] = sub_1CFBCD038;
      v19[3] = &block_descriptor_126;
      v16 = _Block_copy(v19);
      v17 = v4;
      v18 = a1;
      swift_release();
      objc_msgSend(v11, sel_setCurrentPageIndex_animated_completion_, v14, 1, v16);
      _Block_release(v16);

      v4 = v11;
      goto LABEL_7;
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
LABEL_7:

}

uint64_t sub_1CFBE7150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v6 = sub_1CFBFA7D4();
  v18 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1CFBFA7F8();
  v9 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFBBAA24(0, &qword_1ED90ADD0);
  v12 = (void *)sub_1CFBFAA50();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFBCD038;
  aBlock[3] = a3;
  v14 = _Block_copy(aBlock);
  v15 = v3;
  swift_release();
  sub_1CFBFA7E0();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1CFBB5C0C((unint64_t *)&qword_1EFBF0A10, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
  sub_1CFBE7C74((unint64_t *)&qword_1EFBF0A20, (uint64_t *)&unk_1EFBF1050);
  sub_1CFBFAC00();
  MEMORY[0x1D17DAD10](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

uint64_t sub_1CFBE7350@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___CCUIPagingViewController_pagingDelegate, a2);
}

void sub_1CFBE7364(float64_t *a1)
{
  sub_1CFBCE4E8(*a1, a1[1], a1[2], a1[3]);
}

void sub_1CFBE7390(double *a1)
{
  sub_1CFBCE8A0(*a1, a1[1]);
}

uint64_t sub_1CFBE73B4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x1D17DBD84](v4);
  *a3 = result;
  return result;
}

uint64_t method lookup function for PagingViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PagingViewController.__allocating_init(moduleInstanceManager:moduleSettingsManager:controlIntentStore:controlDescriptorProvider:controlExtensionProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of PagingViewController.pagingDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of PagingViewController.pagingDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of PagingViewController.pagingDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of PagingViewController.setContextDelegate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of PagingViewController.scrollView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of PagingViewController.pageControl.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of PagingViewController.editingAccessoryView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of PagingViewController.pageCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of PagingViewController.contentLayoutSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentInsets.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentInsets.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentInsets.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentOffset.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentOffset.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of PagingViewController.additionalContentOffset.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of PagingViewController.longPressToEditGestureRecognizer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of PagingViewController.longPressToEditGestureRecognizer.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of PagingViewController.longPressToEditGestureRecognizer.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of PagingViewController.canDismissPresentedContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of PagingViewController.topmostContentView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of PagingViewController.interpretsLocationAsContent(_:in:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of PagingViewController.queryAllTopLevelBlockingGestureRecognizers()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of PagingViewController.interactivePagingCoordinator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of PagingViewController.scrollToDefaultPage(animated:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of PagingViewController.willBecomeActive()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of PagingViewController.willResignActive()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of PagingViewController.displayWillTurnOff()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of PagingViewController.moduleRowCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of PagingViewController.moduleView(forIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of PagingViewController.expandedModuleCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of PagingViewController.isModuleExpanded(forIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of PagingViewController.expandModule(withIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of PagingViewController.expandModule(withIdentifier:uniqueIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of PagingViewController.enumerateDisplayedModuleViews(block:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of PagingViewController.dismissExpandedModule(animated:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of PagingViewController.dismissPresentedContent(animated:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of PagingViewController.addIfNecessaryAndScrollToControlMatching(descriptor:animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t sub_1CFBE7838()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1CFBE785C(void *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  sub_1CFBDBCDC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD **)(v3 + 24));
}

uint64_t sub_1CFBE7864()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7874()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7884()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7894()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE78A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CFBE78C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1CFBE78D4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(_QWORD *)(v4 + 16);
  swift_getObjectType();
  return sub_1CFBE455C(a1, a2, a3, a4, v9);
}

uint64_t sub_1CFBE792C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBE7950()
{
  return swift_deallocObject();
}

id sub_1CFBE7960()
{
  uint64_t v0;

  return sub_1CFBE2550(*(char **)(v0 + 16));
}

void sub_1CFBE7968(void *a1)
{
  uint64_t v1;

  sub_1CFBDA534(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1CFBE7970()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7980()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7990()
{
  return sub_1CFBD9B30();
}

uint64_t objectdestroy_122Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

id sub_1CFBE79F4()
{
  uint64_t v0;
  id result;

  result = *(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___CCUIPagingViewController_addButton);
  if (result)
    return objc_msgSend(result, sel_setEnabled_, (*(_BYTE *)(v0 + 24) & 1) == 0);
  __break(1u);
  return result;
}

void sub_1CFBE7A24(void *a1)
{
  uint64_t v1;

  sub_1CFBE136C(a1, *(void **)(v1 + 16));
}

id sub_1CFBE7A2C(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setAllowsAdornmentsOverIconImage_animated_, *(unsigned __int8 *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments), 1);
}

uint64_t sub_1CFBE7A4C()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7A5C()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7A6C()
{
  return swift_release();
}

id sub_1CFBE7A74()
{
  uint64_t v0;

  return sub_1CFBDC2E0(*(void **)(v0 + 16));
}

void sub_1CFBE7A7C(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBD652C(a1, v1);
}

uint64_t sub_1CFBE7A88(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CFBE7AF4;
  return sub_1CFBDD06C(a1, v4, v5, v6);
}

uint64_t sub_1CFBE7AF4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CFBE7B3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBE7B60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CFBE7AF4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFBF17A0 + dword_1EFBF17A0))(a1, v4);
}

void sub_1CFBE7BD0(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBD7A94(a1, *(double *)(v2 + 32), a2, *(id *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_BYTE *)(v2 + 25));
}

uint64_t sub_1CFBE7BE4()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBE7BF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CFBE7C18(void *a1, _BYTE *a2)
{
  uint64_t v2;

  sub_1CFBD7708(a1, a2, *(id *)(v2 + 16), *(void ***)(v2 + 24));
}

uint64_t sub_1CFBE7C20()
{
  return swift_deallocObject();
}

BOOL UIInterfaceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_1CFBE7C40()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1CFBE7C6C(char a1)
{
  uint64_t v1;

  sub_1CFBD5970(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1CFBE7C74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_1CFBE7CB4(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBECB74(a1, a2, *(_QWORD *)(v2 + 16));
}

BOOL UIInterfaceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t sub_1CFBE7CCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1CFBE7D08()
{
  sub_1CFBFA5AC();
  __break(1u);
}

unint64_t sub_1CFBE7D24()
{
  unint64_t result;

  result = qword_1ED90AC78;
  if (!qword_1ED90AC78)
  {
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DC1948], MEMORY[0x1E0DC1958]);
    atomic_store(result, (unint64_t *)&qword_1ED90AC78);
  }
  return result;
}

void sub_1CFBE7D68()
{
  sub_1CFBE7D24();
  sub_1CFBFA5D0();
  __break(1u);
}

uint64_t sub_1CFBE7D8C()
{
  return 8;
}

uint64_t sub_1CFBE7D98()
{
  return swift_release();
}

uint64_t sub_1CFBE7DA0(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1CFBE7DB0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF17D0);
  return sub_1CFBFA858();
}

_QWORD *sub_1CFBE7DF4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_1CFBE7E00(void *a1)
{
  sub_1CFBDC360(a1);
}

uint64_t sub_1CFBE7E08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_231Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1CFBE7E7C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CFBE7F00;
  return sub_1CFBCD40C(a1, v4, v5, v6);
}

void sub_1CFBE80D0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v1 = OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode))
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC5C68]), sel_initWithDelegate_, v0);
    v3 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v2;

  }
  v4 = OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation))
  {
    v5 = *(void **)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_systemHost);
    v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v9[4] = sub_1CFBE868C;
    v9[5] = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1CFBBC44C;
    v9[3] = &block_descriptor_8;
    v7 = _Block_copy(v9);
    swift_release();
    v8 = objc_msgSend(v5, sel_observeSilentModeWithBlock_, v7);
    _Block_release(v7);
    *(_QWORD *)(v0 + v4) = v8;
    swift_unknownObjectRelease();
  }
}

void sub_1CFBE81F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1D17DBD84](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_1CFBE83DC();

  }
}

void *sub_1CFBE8278()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *result;

  v1 = *(void **)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode);
  *(_QWORD *)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_userInterfaceStyleMode) = 0;

  v2 = OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation;
  result = *(void **)(v0 + OBJC_IVAR___CCUISystemControlsCoordinator_silentModeObservation);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    *(_QWORD *)(v0 + v2) = 0;
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void __swiftcall CCUISystemControlsCoordinator.init()(CCUISystemControlsCoordinator *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUISystemControlsCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t CCUISystemControlsCoordinator.userInterfaceStyleModeDidChange(_:)()
{
  return sub_1CFBE83DC();
}

uint64_t sub_1CFBE83DC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0xE000000000000000;
  sub_1CFBFACB4();
  sub_1CFBFA8B8();
  sub_1CFBFA8B8();
  swift_bridgeObjectRelease();
  if (qword_1EFBEFE28 != -1)
    swift_once();
  v0 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFBF0580);
  swift_bridgeObjectRetain_n();
  v1 = sub_1CFBFA78C();
  v2 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v6[0] = v4;
    *(_DWORD *)v3 = 136315138;
    swift_bridgeObjectRetain();
    sub_1CFBC779C(0, 0xE000000000000000, v6);
    sub_1CFBFABD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CFB7D000, v1, v2, "[SystemControlsCoordinator] reloading controls of kind: %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17DBCE8](v4, -1, -1);
    MEMORY[0x1D17DBCE8](v3, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1CFBFA834();
  sub_1CFBFA828();
  sub_1CFBFA81C();
  swift_bridgeObjectRelease();
  return swift_release();
}

unint64_t type metadata accessor for CCUISystemControlsCoordinator()
{
  unint64_t result;

  result = qword_1EFBF1870;
  if (!qword_1EFBF1870)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFBF1870);
  }
  return result;
}

uint64_t sub_1CFBE8668()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CFBE868C(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBE81F0(a1, v1);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_1CFBE86AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1CFBE86CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_1CFBE86EC(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  id v8;
  objc_class *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  double v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  objc_super v64;
  objc_super v65;

  v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDown] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDownFromPagingContinuation] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] = 0;
  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pagingDidChangeHandlers] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer] = 0;
  v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation] = 0;
  v4 = &v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlVerticalPanRange];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = &v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_beginPageContentTranslation];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha] = 0x3FF0000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale] = 0x3FF0000000000000;
  v6 = &v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  *v6 = 0;
  v6[1] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings] = 0;
  v7 = v1;
  v8 = objc_msgSend(a1, sel_folder);
  v9 = (objc_class *)type metadata accessor for FolderPageIndicatorProvider();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v10[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypes] = v3;
  v11 = OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder;
  *(_QWORD *)&v10[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_folder] = 0;
  v12 = OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypesByListIdentifier;
  v13 = v10;
  *(_QWORD *)&v10[v12] = sub_1CFBBAC80(v3);
  v14 = *(void **)&v10[v11];
  *(_QWORD *)&v10[v11] = v8;
  v15 = v8;

  v65.receiver = v13;
  v65.super_class = v9;
  v16 = objc_msgSendSuper2(&v65, sel_init);
  sub_1CFBB8C90(0);

  *(_QWORD *)&v7[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageIndicatorProvider] = v16;
  v17 = objc_allocWithZone(MEMORY[0x1E0DC39C8]);
  v18 = (char *)v16;
  v19 = objc_msgSend(v17, sel_initWithTarget_action_, 0, 0);
  objc_msgSend(v19, sel_setMinimumPressDuration_, 0.15);
  objc_msgSend(v19, sel_setAllowableMovement_, 1.79769313e308);
  *(_QWORD *)&v7[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer] = v19;
  v20 = v19;

  v64.receiver = v7;
  v64.super_class = (Class)type metadata accessor for IconListRootFolderView();
  v21 = objc_msgSendSuper2(&v64, sel_initWithConfiguration_, a1);
  *(_QWORD *)&v18[OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_delegate + 8] = &off_1E8CFF790;
  swift_unknownObjectWeakAssign();
  v22 = v21;
  v23 = objc_msgSend(v22, sel_pageControl);
  objc_msgSend(v23, sel_setDirection_, 3);
  objc_msgSend(v23, sel_setBackgroundStyle_, 2);
  v24 = (void *)objc_opt_self();
  v25 = v23;
  v26 = objc_msgSend(v24, sel_blackColor);
  v27 = objc_msgSend(v26, sel_colorWithAlphaComponent_, 0.17);

  objc_msgSend(v25, sel_setPageIndicatorTintColor_, v27);
  v28 = (void *)objc_opt_self();
  v29 = v25;
  v30 = objc_msgSend(v28, sel_configurationWithPointSize_weight_scale_, 6, -1, 16.0);
  v31 = (void *)sub_1CFBFA870();
  v32 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v31, v30);

  objc_msgSend(v29, sel_setPreferredIndicatorImage_, v32);
  objc_msgSend(v29, sel__setPreferredNumberOfVisibleIndicators_, 8);
  objc_msgSend(v29, sel__setCustomIndicatorSpacing_, 36.0);
  objc_msgSend(v29, sel__setAllowsDiscreteInteraction_, 1);
  objc_msgSend(v29, sel__setPrefersTargetPageForDiscreteInteraction_, 1);
  LODWORD(v30) = objc_msgSend(v22, sel__shouldReverseLayoutDirection);
  CGAffineTransformMakeScale(&v59, 2.333, 2.333);
  v33 = -18.0;
  if ((_DWORD)v30)
    v33 = 18.0;
  CGAffineTransformTranslate(&v63, &v59, v33, 0.0);
  v59 = v63;
  objc_msgSend(v29, sel__setActiveTransformForTouchedPage_, &v59);
  v34 = v29;
  objc_msgSend(v34, sel__activeTransformForTouchedPage);
  v35 = *(_OWORD *)&v59.a;
  v36 = *(_OWORD *)&v59.c;
  v37 = *(_OWORD *)&v59.tx;
  v59.a = 1.0;
  v59.b = 0.0;
  v59.c = 0.0;
  v59.d = 1.0;
  v59.tx = 0.0;
  v59.ty = 0.0;
  *(_OWORD *)&v63.a = v35;
  *(_OWORD *)&v63.c = v36;
  *(_OWORD *)&v63.tx = v37;
  _UITransformLerp();
  v59 = v62;
  objc_msgSend(v34, sel__setTargetTransformForTouchedPage_, &v59);

  v38 = objc_msgSend(v24, sel_blackColor);
  v39 = objc_msgSend(v38, sel_colorWithAlphaComponent_, 0.17);

  sub_1CFBB54E8();
  CAColorMatrixMakePlusD();
  v55 = *(_OWORD *)&v59.c;
  v57 = *(_OWORD *)&v59.a;
  v51 = v60;
  v53 = *(_OWORD *)&v59.tx;
  v49 = v61;

  *(_OWORD *)&v59.a = v57;
  *(_OWORD *)&v59.c = v55;
  *(_OWORD *)&v59.tx = v53;
  v60 = v51;
  v61 = v49;
  if (objc_msgSend(v34, sel_ccui_setPageIndicatorVibrantColorMatrix_, &v59))
  {
    v40 = v34;
    v41 = objc_msgSend(v24, sel_blackColor);
    objc_msgSend(v40, sel_setPageIndicatorTintColor_, v41);

  }
  v42 = objc_msgSend(v24, sel_whiteColor);
  sub_1CFBB54E8();
  CAColorMatrixMakeColorSourceOver();
  v56 = *(_OWORD *)&v59.c;
  v58 = *(_OWORD *)&v59.a;
  v52 = v60;
  v54 = *(_OWORD *)&v59.tx;
  v50 = v61;

  *(_OWORD *)&v59.a = v58;
  *(_OWORD *)&v59.c = v56;
  *(_OWORD *)&v59.tx = v54;
  v60 = v52;
  v61 = v50;
  objc_msgSend(v34, sel_ccui_setActivePageIndicatorVibrantColorMatrix_, &v59);
  sub_1CFBEC86C();
  v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v48 = v43;
  v44 = (void *)sub_1CFBFAB1C();
  objc_msgSend(v34, sel_addAction_forControlEvents_, v44, 1, 0, 0, 0, sub_1CFBEC8A8, v48);

  v45 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v46 = (void *)sub_1CFBFAB1C();
  objc_msgSend(v34, sel_addAction_forControlEvents_, v46, 448, 0, 0, 0, sub_1CFBEC8C8, v45);

  objc_msgSend(v20, sel_addTarget_action_, v22, sel_handlePageControlInteraction_);
  objc_msgSend(v20, sel_setDelegate_, v22);
  objc_msgSend(v20, sel_setCancelsTouchesInView_, 0);
  objc_msgSend(v34, sel_addGestureRecognizer_, v20);

  return v22;
}

void sub_1CFBE8F38(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x1D17DBD84](v4);
  if (v5)
  {
    v6 = (void *)v5;
    a3();

  }
}

double sub_1CFBE8FB0()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets);
}

double sub_1CFBE8FCC()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset);
}

id sub_1CFBE90B8(void *a1)
{
  char *v1;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for IconListRootFolderView();
  objc_msgSendSuper2(&v12, sel__didAddIconListView_, a1);
  v3 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale];
  v4 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v5 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8];
  if (BSFloatIsOne() && BSPointEqualToPoint())
  {
    v6 = xmmword_1CFC023E0;
    v7 = xmmword_1CFC023F0;
    v8 = 0uLL;
  }
  else
  {
    CGAffineTransformMakeScale(&v11, v3, v3);
    CGAffineTransformTranslate(&v10, &v11, v4, v5);
    v7 = *(_OWORD *)&v10.a;
    v6 = *(_OWORD *)&v10.c;
    v8 = *(_OWORD *)&v10.tx;
  }
  *(_OWORD *)&v11.a = v7;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = v8;
  return objc_msgSend(a1, sel_setTransform_, &v11);
}

void sub_1CFBE92D0(uint64_t a1, char a2, char a3)
{
  void *v3;
  void *v4;
  char *v8;
  char *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  void *v32;
  uint64_t v33;

  v4 = v3;
  v8 = (char *)objc_msgSend(v4, sel_minimumPageIndex);
  if (__OFADD__(v8, a1))
  {
    __break(1u);
    goto LABEL_14;
  }
  if ((uint64_t)v8 <= (uint64_t)&v8[a1])
    v9 = &v8[a1];
  else
    v9 = v8;
  v10 = (char *)objc_msgSend(v4, sel_maximumPageIndex);
  if ((uint64_t)v10 < (uint64_t)v9)
    v9 = v10;
  if (v9 != objc_msgSend(v4, sel_scrollAnimationTargetPageIndex))
  {
    objc_msgSend(v4, sel_setCurrentPageIndex_animated_, v9, 0);
    if ((a2 & 1) != 0)
    {
      v11 = objc_msgSend(v4, sel_currentIconListView);
      if (v11)
      {
        v12 = v11;
        v13 = (void *)objc_opt_self();
        v14 = swift_allocObject();
        *(_BYTE *)(v14 + 16) = a3 & 1;
        *(_QWORD *)(v14 + 24) = v4;
        *(_QWORD *)(v14 + 32) = v12;
        v15 = swift_allocObject();
        *(_QWORD *)(v15 + 16) = sub_1CFBEC800;
        *(_QWORD *)(v15 + 24) = v14;
        v32 = sub_1CFBBAC70;
        v33 = v15;
        v16 = MEMORY[0x1E0C809B0];
        v28 = MEMORY[0x1E0C809B0];
        v29 = 1107296256;
        v30 = sub_1CFBE86CC;
        v31 = &block_descriptor_94;
        v17 = _Block_copy(&v28);
        v18 = v4;
        v19 = v12;
        swift_retain();
        swift_release();
        objc_msgSend(v13, sel_performWithoutAnimation_, v17);
        _Block_release(v17);
        LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((v12 & 1) == 0)
        {
          v20 = swift_allocObject();
          *(_QWORD *)(v20 + 16) = v19;
          *(_QWORD *)(v20 + 24) = v18;
          v32 = sub_1CFBEC81C;
          v33 = v20;
          v28 = v16;
          v29 = 1107296256;
          v30 = (uint64_t (*)(uint64_t))sub_1CFBCD038;
          v31 = &block_descriptor_100;
          v21 = _Block_copy(&v28);
          v22 = v18;
          v23 = v19;
          swift_release();
          objc_msgSend(v13, sel_animateWithDuration_delay_options_animations_completion_, 2, v21, 0, 0.15, 0.0);
          _Block_release(v21);
          v24 = swift_allocObject();
          *(_QWORD *)(v24 + 16) = v23;
          *(_QWORD *)(v24 + 24) = v22;
          v32 = sub_1CFBEC864;
          v33 = v24;
          v28 = v16;
          v29 = 1107296256;
          v30 = (uint64_t (*)(uint64_t))sub_1CFBCD038;
          v31 = &block_descriptor_106;
          v25 = _Block_copy(&v28);
          v26 = v22;
          v27 = v23;
          swift_release();
          objc_msgSend(v13, sel_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_, 2, v25, 0, 0.85, 0.0, 0.525, 0.0);
          _Block_release(v25);
          swift_release();

          return;
        }
LABEL_14:
        __break(1u);
      }
    }
  }
}

void sub_1CFBE96E4()
{
  char *v0;
  double v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v33;
  id v34;
  void *v35;
  double MaxX;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  CGFloat v46;
  id v47;
  id v48;
  double v49;
  id v50;
  uint64_t v51;
  CGFloat v52;
  uint64_t v53;
  double v54;
  CGFloat rect;
  id recta;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  objc_msgSend(v0, sel_bounds);
  rect = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v0, sel_orientation);
  v9 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v9, sel_displayScale);
  v53 = v10;

  v11 = objc_msgSend(v0, sel__shouldReverseLayoutDirection);
  v12 = *(double *)&v0[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
  v13 = *(double *)&v0[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset + 8];
  v14 = objc_msgSend(v0, sel_listLayoutProvider);
  v15 = objc_msgSend(v0, sel_iconLocation);
  v16 = objc_msgSend(v14, sel_layoutForIconLocation_, v15);

  swift_unknownObjectRelease();
  if (v16)
  {
    objc_msgSend(v16, sel_layoutInsetsForOrientation_, v8);
    v18 = v17;
    v20 = v19;
    UIEdgeInsetsAdd();
    v54 = v21;
    v22 = objc_msgSend(v0, sel_traitCollection);
    v23 = objc_msgSend(v22, sel_userInterfaceIdiom);

    v52 = v7;
    v24 = v3;
    if (v23 == (id)1)
    {
      sub_1CFBEC974();
      v7 = v25 - v18 - v20;
      v24 = v54;
    }
    v26 = rect;
    v27 = v5;
    v28 = v7;
    v57 = CGRectOffset(*(CGRect *)(&v24 - 1), v12, v13);
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
    v33 = objc_msgSend(v0, sel_pageControl);
    v34 = objc_msgSend(v0, sel_window);
    if (v34)
    {
      v35 = v34;
      objc_msgSend(v34, sel_safeAreaInsets);

    }
    UIInterfaceOrientationIsLandscape((uint64_t)v8);
    MaxX = 0.0;
    if (!v11)
    {
      v58.origin.x = x;
      v58.origin.y = y;
      v58.size.width = width;
      v58.size.height = height;
      MaxX = CGRectGetMaxX(v58);
    }
    objc_msgSend(v33, sel_sizeForNumberOfPages_, objc_msgSend(v33, sel_numberOfPages, MaxX));
    objc_msgSend(v33, sel__customHorizontalPadding);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    CGRectGetHeight(v59);
    v51 = v53;
    UIRectCenteredYInRectScale();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    if ((v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDownFromPagingContinuation] & 1) != 0
      || (v45 = *(void **)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer]) != 0
      && (objc_msgSend(v45, sel_isValid, v53) & 1) != 0
      || objc_msgSend(v0, sel_shouldExtendAreaForPagingContinuation, v51))
    {
      v60.origin.x = v38;
      v60.origin.y = v40;
      v60.size.width = v42;
      v60.size.height = v44;
      v46 = (CGRectGetMinY(v60) - v54) * 0.8;
      v61.origin.x = rect;
      v61.size.width = v5;
      v61.origin.y = v3;
      v61.size.height = v52;
      CGRectGetWidth(v61);
      v62.origin.x = v38;
      v62.origin.y = v40;
      v62.size.width = v42;
      v62.size.height = v44;
      CGRectGetWidth(v62);
      v47 = v33;
      v63.origin.x = v38;
      v63.origin.y = v40;
      v63.size.width = v42;
      v63.size.height = v44;
      CGRectGetWidth(v63);
      v64.origin.x = v38;
      v64.origin.y = v40;
      v64.size.width = v42;
      v64.size.height = v44;
      CGRectGetHeight(v64);
      BSRectWithSize();
      objc_msgSend(v47, sel_setBounds_);

      v48 = v47;
      objc_msgSend(v48, sel_bounds);
      v49 = CGRectGetWidth(v65);
      v66.origin.x = v38;
      v66.origin.y = v40;
      v66.size.width = v42;
      v66.size.height = v44;
      objc_msgSend(v48, sel__setCustomVerticalPadding_, (v49 - CGRectGetWidth(v66)) * 0.5);

      objc_msgSend(v48, sel__setCustomHorizontalPadding_, v46, v51);
    }
    else
    {
      v50 = v33;
      BSRectWithSize();
      objc_msgSend(v50, sel_setBounds_);

      objc_msgSend(v50, sel__setCustomVerticalPadding_, 10.0);
      objc_msgSend(v50, sel__setCustomHorizontalPadding_, 20.0, v51);
    }
    recta = v33;
    UIRectGetCenter();
    objc_msgSend(recta, sel_setCenter_);
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1CFBE9C24()
{
  char *v0;
  id v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v9;
  const char *v10;

  v1 = objc_msgSend(v0, sel_pageControl);
  v2 = (uint64_t *)(*(_QWORD *)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageIndicatorProvider]
                 + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypes);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  v4 = (unint64_t)objc_msgSend(v1, sel_numberOfPages);
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_10;
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    v7 = *(_QWORD *)(v3 + 16);
    v10 = "appletvremote.gen4.fill";
    v9 = "with negative count";
    while (v6 >= v7)
    {
      objc_msgSend(v1, sel_setIndicatorImage_forPage_, 0, v6, v9, v10);

      if (v5 == ++v6)
        goto LABEL_8;
    }
    if (v6 < *(_QWORD *)(v3 + 16))
      __asm { BR              X9 }
    __break(1u);
LABEL_10:
    __break(1u);
    JUMPOUT(0x1CFBE9E98);
  }
LABEL_8:

  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFBE9EB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageIndicatorProvider)
     + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_indicatorTypes;
  swift_beginAccess();
  if ((a1 & 0x8000000000000000) == 0 && *(_QWORD *)(*(_QWORD *)v3 + 16) > a1)
    __asm { BR              X10 }
  return 0x646578696DLL;
}

uint64_t sub_1CFBEA02C(uint64_t a1)
{
  uint64_t *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *);
  char v9;

  v2 = (uint64_t *)(a1 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pagingDidChangeHandlers);
  result = swift_beginAccess();
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5)
  {
    v6 = OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing;
    swift_bridgeObjectRetain();
    v7 = v4 + 40;
    do
    {
      v8 = *(void (**)(char *))(v7 - 8);
      v9 = *(_BYTE *)(a1 + v6);
      swift_retain();
      v8(&v9);
      swift_release();
      v7 += 16;
      --v5;
    }
    while (v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1CFBEA0E0()
{
  _BYTE *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  _QWORD v10[6];

  v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDown] = 1;
  v1 = OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer;
  v2 = *(void **)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer];
  if (v2)
  {
    if (objc_msgSend(v2, sel_isValid))
    {
      objc_msgSend(*(id *)&v0[v1], sel_invalidate);
      v3 = *(void **)&v0[v1];
      *(_QWORD *)&v0[v1] = 0;

      v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDownFromPagingContinuation] = 1;
      v4 = v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing];
      v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] = 1;
      if ((v4 & 1) == 0)
      {
        v5 = (void *)objc_opt_self();
        v6 = sub_1CFBEB1E0();
        v7 = swift_allocObject();
        *(_QWORD *)(v7 + 16) = v0;
        v10[4] = sub_1CFBEC954;
        v10[5] = v7;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 1107296256;
        v10[2] = sub_1CFBCD038;
        v10[3] = &block_descriptor_84;
        v8 = _Block_copy(v10);
        v9 = v0;
        swift_release();
        objc_msgSend(v5, sel_sb_animateWithSettings_mode_animations_completion_, v6, 3, v8, 0);
        _Block_release(v8);

      }
    }
  }
  sub_1CFBEAE2C(1);
  sub_1CFBE96E4();
}

void sub_1CFBEA23C()
{
  _BYTE *v0;
  int v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  _QWORD v7[6];

  v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDown] = 0;
  v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDownFromPagingContinuation] = 0;
  v1 = v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing];
  v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] = 0;
  if (v1 == 1)
  {
    v2 = (void *)objc_opt_self();
    v3 = sub_1CFBEB1E0();
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v0;
    v7[4] = sub_1CFBEC954;
    v7[5] = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 1107296256;
    v7[2] = sub_1CFBCD038;
    v7[3] = &block_descriptor_77;
    v5 = _Block_copy(v7);
    v6 = v0;
    swift_release();
    objc_msgSend(v2, sel_sb_animateWithSettings_mode_animations_completion_, v3, 3, v5, 0);
    _Block_release(v5);

  }
  sub_1CFBEAE2C(1);
  sub_1CFBE96E4();
}

void sub_1CFBEA358(void *a1)
{
  char *v1;
  char *v2;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  char *v12;
  char *v13;
  char *v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  char *v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double MinY;
  double MaxY;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  id v54;
  CGFloat *v55;
  void *v56;
  char *v57;
  CGFloat recta;
  double rect_8;
  double rect_16;
  double rect_24;
  double v62;
  CGFloat v63;
  CGFloat v64;
  uint64_t aBlock;
  uint64_t v66;
  uint64_t (*v67)();
  void *v68;
  void *v69;
  CGFloat *v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v2 = v1;
  objc_msgSend(v2, sel_bounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (char *)objc_msgSend(a1, sel_state);
  if ((unint64_t)(v12 - 3) >= 3)
  {
    if (v12 == (char *)2)
    {
      v23 = (double *)&v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlVerticalPanRange];
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
      if ((v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlVerticalPanRange + 16] & 1) == 0)
      {
        v26 = *v23;
        v25 = v23[1];
      }
      rect_24 = v26;
      v62 = v25;
      v27 = (double *)&v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_beginPageContentTranslation];
      v28 = 0.0;
      if ((v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_beginPageContentTranslation + 16] & 1) == 0)
      {
        v28 = *v27;
        v24 = v27[1];
      }
      v63 = v28;
      v64 = v24;
      v29 = objc_msgSend(v2, sel_pageControl);
      objc_msgSend(a1, sel__translationInView_, v29);
      v31 = v30;

      rect_16 = v31;
      v32 = MEMORY[0x1E0C809B0];
      if (fabs(v31) > 16.0 && (v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] & 1) == 0)
      {
        v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] = 1;
        v33 = (void *)objc_opt_self();
        v34 = sub_1CFBEB1E0();
        v35 = swift_allocObject();
        *(_QWORD *)(v35 + 16) = v2;
        v69 = sub_1CFBEC7CC;
        v70 = (CGFloat *)v35;
        aBlock = v32;
        v66 = 1107296256;
        v67 = sub_1CFBCD038;
        v68 = &block_descriptor_70;
        v36 = _Block_copy(&aBlock);
        v37 = v2;
        swift_release();
        objc_msgSend(v33, (SEL)&selRef_setIsSystemService_ + 2, v34, 3, v36, 0);
        _Block_release(v36);

        sub_1CFBEAE2C(1);
      }
      sub_1CFBEC974();
      SBHSizeScaled();
      BSRectWithSize();
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      v74 = CGRectOffset(v73, v63, v64);
      x = v74.origin.x;
      recta = v74.origin.x;
      y = v74.origin.y;
      width = v74.size.width;
      height = v74.size.height;
      v74.origin.x = v5;
      v74.origin.y = v7;
      v74.size.width = v9;
      v74.size.height = v11;
      v75 = CGRectInset(v74, 0.0, 50.0);
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      v76 = CGRectUnion(v75, v80);
      v42 = v76.origin.x;
      v43 = v76.origin.y;
      v44 = v76.size.width;
      v45 = v76.size.height;
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      rect_8 = CGRectGetMinY(v76);
      v77.origin.x = v42;
      v77.origin.y = v43;
      v77.size.width = v44;
      v77.size.height = v45;
      MinY = CGRectGetMinY(v77);
      v78.origin.x = v42;
      v78.origin.y = v43;
      v78.size.width = v44;
      v78.size.height = v45;
      MaxY = CGRectGetMaxY(v78);
      v79.origin.x = recta;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      v48 = CGRectGetMaxY(v79);
      v49 = rect_8 - MinY;
      v50 = MaxY - v48;
      v51 = v62;
      if (rect_16 >= 0.0)
        v49 = v50;
      else
        v51 = rect_24;
      v52 = _UILerp(rect_16 / v51, v49);
      v53 = (void *)objc_opt_self();
      v54 = sub_1CFBEB27C();
      v55 = (CGFloat *)swift_allocObject();
      *((_QWORD *)v55 + 2) = v2;
      v55[3] = v63;
      v55[4] = v64;
      v55[5] = v52;
      v69 = sub_1CFBEC78C;
      v70 = v55;
      aBlock = v32;
      v66 = 1107296256;
      v67 = sub_1CFBCD038;
      v68 = &block_descriptor_64;
      v56 = _Block_copy(&aBlock);
      v57 = v2;
      swift_release();
      objc_msgSend(v53, sel_sb_animateWithSettings_mode_animations_completion_, v54, 5, v56, 0);
      _Block_release(v56);

    }
    else if (v12 == (char *)1)
    {
      objc_msgSend(a1, sel_locationInView_, v2);
      v16 = v15;
      v71.origin.x = v5;
      v71.origin.y = v7;
      v71.size.width = v9;
      v71.size.height = v11;
      v17 = v16 - CGRectGetMinY(v71);
      v72.origin.x = v5;
      v72.origin.y = v7;
      v72.size.width = v9;
      v72.size.height = v11;
      v18 = CGRectGetMaxY(v72);
      v19 = (CGFloat *)&v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlVerticalPanRange];
      *v19 = v17;
      v19[1] = v18 - v16;
      *((_BYTE *)v19 + 16) = 0;
      objc_msgSend(v2, sel_pageContentTranslation);
      v20 = &v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_beginPageContentTranslation];
      *(_QWORD *)v20 = v21;
      *((_QWORD *)v20 + 1) = v22;
      v20[16] = 0;
    }
  }
  else
  {
    v13 = &v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlVerticalPanRange];
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = 0;
    v13[16] = 1;
    v14 = &v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_beginPageContentTranslation];
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 1;
    if ((v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDown] & 1) == 0
      && (v2[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] & 1) == 0)
    {
      objc_msgSend(v2, sel_setPageContentTranslation_, 0.0, 0.0);
      sub_1CFBEAE2C(1);
    }
  }
}

uint64_t sub_1CFBEA8D8(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t result;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  char isEscapingClosureAtFileLocation;
  _QWORD v14[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(double *)(v7 + 24) = a2;
  if (a4 && a4 == a1)
  {
    objc_msgSend(a1, sel_setAlpha_, a2);
    return swift_release();
  }
  else
  {
    v9 = (void *)objc_opt_self();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = sub_1CFBEC630;
    *(_QWORD *)(v10 + 24) = v7;
    v14[4] = sub_1CFBBA9A0;
    v14[5] = v10;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 1107296256;
    v14[2] = sub_1CFBE86CC;
    v14[3] = &block_descriptor_22;
    v11 = _Block_copy(v14);
    v12 = a1;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performWithoutAnimation_, v11);
    _Block_release(v11);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release_n();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_1CFBEAA70(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_1CFBEAACC()
{
  char *v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat a;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  id v9;
  CGFloat *v10;
  void *v11;
  id v12;
  CGFloat b;
  CGAffineTransform v14;
  CGAffineTransform aBlock;

  v1 = *(double *)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale];
  v2 = *(double *)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v3 = *(double *)&v0[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8];
  if (!BSFloatIsOne()
    || (b = 0.0, a = 1.0, c = 0.0, d = 1.0, tx = 0.0, ty = 0.0, !BSPointEqualToPoint()))
  {
    CGAffineTransformMakeScale(&aBlock, v1, v1);
    CGAffineTransformTranslate(&v14, &aBlock, v2, v3);
    a = v14.a;
    b = v14.b;
    c = v14.c;
    d = v14.d;
    tx = v14.tx;
    ty = v14.ty;
  }
  v9 = objc_msgSend(v0, sel_currentIconListView);
  v10 = (CGFloat *)swift_allocObject();
  v10[2] = a;
  v10[3] = b;
  v10[4] = c;
  v10[5] = d;
  v10[6] = tx;
  v10[7] = ty;
  *((_QWORD *)v10 + 8) = v9;
  *(_QWORD *)&aBlock.tx = sub_1CFBEC6D0;
  *(_QWORD *)&aBlock.ty = v10;
  *(_QWORD *)&aBlock.a = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_1CFBEAA70;
  *(_QWORD *)&aBlock.d = &block_descriptor_48;
  v11 = _Block_copy(&aBlock);
  v12 = v9;
  swift_release();
  objc_msgSend(v0, sel_enumerateIconListViewsUsingBlock_, v11);
  _Block_release(v11);

}

uint64_t sub_1CFBEAC70(void *a1, uint64_t a2, _QWORD *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t (*v11)();
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t result;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  uint64_t v26;

  v7 = *a3;
  v8 = a3[1];
  v9 = (uint64_t (*)(uint64_t))a3[2];
  v10 = (void *)a3[3];
  v11 = (uint64_t (*)())a3[4];
  v12 = a3[5];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  v14 = *((_OWORD *)a3 + 1);
  *(_OWORD *)(v13 + 24) = *(_OWORD *)a3;
  *(_OWORD *)(v13 + 40) = v14;
  *(_OWORD *)(v13 + 56) = *((_OWORD *)a3 + 2);
  if (a4 && a4 == a1)
  {
    v21 = v7;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    v25 = v11;
    v26 = v12;
    objc_msgSend(a1, sel_setTransform_, &v21);
    return swift_release();
  }
  else
  {
    v16 = (void *)objc_opt_self();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = sub_1CFBEC700;
    *(_QWORD *)(v17 + 24) = v13;
    v25 = sub_1CFBBAC70;
    v26 = v17;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 1107296256;
    v23 = sub_1CFBE86CC;
    v24 = &block_descriptor_58;
    v18 = _Block_copy(&v21);
    v19 = a1;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_performWithoutAnimation_, v18);
    _Block_release(v18);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release_n();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_1CFBEAE2C(char a1)
{
  _BYTE *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  double v11;
  double *v12;
  double v13;
  double v14;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  void (*v23)();
  uint64_t v24;

  if ((v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing] & 1) != 0)
  {
    v2 = 0.8;
  }
  else
  {
    if (v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isTouchDown] != 1)
    {
      v3 = 0.0;
      v2 = 1.0;
      v4 = 0.0;
      v5 = 1.0;
      if ((a1 & 1) != 0)
        goto LABEL_6;
      goto LABEL_8;
    }
    v2 = 0.95;
  }
  v3 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v4 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8];
  v5 = 0.7;
  if ((a1 & 1) != 0)
  {
LABEL_6:
    v6 = (void *)objc_opt_self();
    v7 = sub_1CFBEB27C();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v1;
    *(double *)(v8 + 24) = v2;
    *(double *)(v8 + 32) = v3;
    *(double *)(v8 + 40) = v4;
    *(double *)(v8 + 48) = v5;
    v23 = sub_1CFBEC69C;
    v24 = v8;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1107296256;
    v21 = (void (*)(uint64_t, void *))sub_1CFBCD038;
    v22 = &block_descriptor_35;
    v9 = _Block_copy(&v19);
    v10 = v1;
    swift_release();
    objc_msgSend(v6, sel_sb_animateWithSettings_mode_animations_completion_, v7, 3, v9, 0);
LABEL_17:
    _Block_release(v9);

    return;
  }
LABEL_8:
  v11 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale];
  *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale] = v2;
  if (v11 != v2)
    sub_1CFBEAACC();
  v12 = (double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v13 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v14 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8];
  *v12 = v3;
  v12[1] = v4;
  if (v13 != v3 || v14 != v4)
    sub_1CFBEAACC();
  v16 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha];
  *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha] = v5;
  if (v16 != v5)
  {
    v17 = objc_msgSend(v1, sel_currentIconListView);
    v18 = swift_allocObject();
    *(double *)(v18 + 16) = v5;
    *(_QWORD *)(v18 + 24) = v17;
    v23 = (void (*)())sub_1CFBEC96C;
    v24 = v18;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1107296256;
    v21 = sub_1CFBEAA70;
    v22 = &block_descriptor_29_0;
    v9 = _Block_copy(&v19);
    v7 = v17;
    swift_release();
    objc_msgSend(v1, sel_enumerateIconListViewsUsingBlock_, v9);
    goto LABEL_17;
  }
}

void sub_1CFBEB090(char *a1, double a2, double a3, double a4, double a5)
{
  double v9;
  double *v10;
  double v11;
  double v12;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[6];

  v9 = *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale];
  *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale] = a2;
  if (v9 != a2)
    sub_1CFBEAACC();
  v10 = (double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v11 = *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation];
  v12 = *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8];
  *v10 = a3;
  v10[1] = a4;
  if (v11 != a3 || v12 != a4)
    sub_1CFBEAACC();
  v14 = *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha];
  *(double *)&a1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha] = a5;
  if (v14 != a5)
  {
    v15 = objc_msgSend(a1, sel_currentIconListView);
    v16 = swift_allocObject();
    *(double *)(v16 + 16) = a5;
    *(_QWORD *)(v16 + 24) = v15;
    v19[4] = sub_1CFBEC96C;
    v19[5] = v16;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 1107296256;
    v19[2] = sub_1CFBEAA70;
    v19[3] = &block_descriptor_42_0;
    v17 = _Block_copy(v19);
    v18 = v15;
    swift_release();
    objc_msgSend(a1, sel_enumerateIconListViewsUsingBlock_, v17);
    _Block_release(v17);

  }
}

id sub_1CFBEB1E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA9E08]), sel_init);
    objc_msgSend(v4, sel_setDampingRatio_, 1.0);
    objc_msgSend(v4, sel_setResponse_, 0.2);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1CFBEB27C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA9E08]), sel_init);
    objc_msgSend(v4, sel_setTrackingResponse_, 0.325);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1CFBEB304()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings));
}

id sub_1CFBEB370()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IconListRootFolderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IconListRootFolderView()
{
  return objc_opt_self();
}

void sub_1CFBEB48C(double a1)
{
  char *v1;
  double v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  v3 = *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha];
  *(double *)&v1[OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha] = a1;
  if (v3 != a1)
  {
    v4 = objc_msgSend(v1, sel_currentIconListView);
    v5 = swift_allocObject();
    *(double *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_1CFBEC600;
    v8[5] = v5;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 1107296256;
    v8[2] = sub_1CFBEAA70;
    v8[3] = &block_descriptor_13_0;
    v6 = _Block_copy(v8);
    v7 = v4;
    swift_release();
    objc_msgSend(v1, sel_enumerateIconListViewsUsingBlock_, v6);
    _Block_release(v6);

  }
}

id sub_1CFBEB824(uint64_t a1, double a2, double a3)
{
  void *v3;
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = objc_msgSend(v3, sel_pageControl);
  objc_msgSend(v7, sel_convertPoint_fromCoordinateSpace_, a1, a2, a3);
  v8 = objc_msgSend(v7, sel_hitTest_withEvent_, 0);
  if (v8)
  {
    v9 = v8;
    if (v8 == v7)
    {
      v10 = 0;
      v9 = v7;
    }
    else
    {
      v10 = objc_msgSend(v8, sel_isDescendantOfView_, v7);
    }

    v7 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1CFBEB958(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1D17DBD84](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void **)(v4
                  + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer);
    if (v6)
      v7 = v6 == a1;
    else
      v7 = 0;
    if (v7)
    {
      *(_QWORD *)(v4 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer) = 0;

    }
    sub_1CFBE96E4();

  }
}

id sub_1CFBEBA00(char a1, uint64_t a2, id a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v5 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha);
  if (v5 > 0.7)
    v5 = 0.7;
  v6 = 0.75;
  if ((a1 & 1) == 0)
    v6 = 1.0;
  v7 = v6 * v5;
  if ((a1 & 1) != 0)
    v8 = 0.9;
  else
    v8 = 1.0;
  objc_msgSend(a3, sel_setAlpha_, v7);
  v9 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale);
  if (v9 > 0.95)
    v9 = 0.95;
  v10 = v8 * v9;
  v11 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  v12 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8);
  CGAffineTransformMakeScale(&v15, v10, v10);
  CGAffineTransformTranslate(&v14, &v15, v11, v12);
  v15 = v14;
  return objc_msgSend(a3, sel_setTransform_, &v15);
}

id sub_1CFBEBB08(void *a1, uint64_t a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v3 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale);
  v4 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  v5 = *(double *)(a2 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation + 8);
  if (BSFloatIsOne() && BSPointEqualToPoint())
  {
    v6 = xmmword_1CFC023E0;
    v7 = xmmword_1CFC023F0;
    v8 = 0uLL;
  }
  else
  {
    CGAffineTransformMakeScale(&v11, v3, v3);
    CGAffineTransformTranslate(&v10, &v11, v4, v5);
    v7 = *(_OWORD *)&v10.a;
    v6 = *(_OWORD *)&v10.c;
    v8 = *(_OWORD *)&v10.tx;
  }
  *(_OWORD *)&v11.a = v7;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = v8;
  return objc_msgSend(a1, sel_setTransform_, &v11);
}

char *sub_1CFBEBBEC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AEE8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x1E0DEE9D8];
      v12 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1CFBEC008(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1CFBEBCE4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1A28);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CFBEC0EC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1CFBEBDF0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1A20);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CFBEC1E0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1CFBEBEFC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90B020);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CFBEC2D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1CFBEC008(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_1CFBFAD5C();
  __break(1u);
  return result;
}

uint64_t sub_1CFBEC0EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

uint64_t sub_1CFBEC1E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

uint64_t sub_1CFBEC2D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90B028);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1CFBFAD5C();
  __break(1u);
  return result;
}

void sub_1CFBEC3D8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[6];

  v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_1CFBEC560;
  v9[5] = v1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1CFBBC8FC;
  v9[3] = &block_descriptor_9;
  v2 = _Block_copy(v9);
  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = objc_msgSend(v3, sel_timerWithTimeInterval_repeats_block_, 0, v2, 0.05);
  _Block_release(v2);
  swift_release();
  swift_release();
  v5 = OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer), sel_invalidate);
  v6 = *(void **)(v0 + v5);
  *(_QWORD *)(v0 + v5) = v4;
  v7 = v4;

  v8 = objc_msgSend((id)objc_opt_self(), sel_currentRunLoop);
  objc_msgSend(v8, sel_addTimer_forMode_, v7, *MEMORY[0x1E0C99860]);

}

uint64_t sub_1CFBEC53C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CFBEC560(void *a1)
{
  uint64_t v1;

  sub_1CFBEB958(a1, v1);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_1CFBEC580()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CFBEC5A4(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_1CFBEC5B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBEC5DC(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_1CFBEC600(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBEA8D8(a1, *(double *)(v2 + 16), a2, *(void **)(v2 + 24));
}

uint64_t sub_1CFBEC60C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBEC630()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, *(double *)(v0 + 24));
}

uint64_t sub_1CFBEC644()
{
  return swift_deallocObject();
}

uint64_t sub_1CFBEC654()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBEC678()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CFBEC69C()
{
  uint64_t v0;

  sub_1CFBEB090(*(char **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1CFBEC6AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBEC6D0(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBEAC70(a1, a2, (_QWORD *)(v2 + 16), *(void **)(v2 + 64));
}

uint64_t sub_1CFBEC6DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBEC700()
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(v0 + 16);
  v2 = *(_OWORD *)(v0 + 40);
  v4[0] = *(_OWORD *)(v0 + 24);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(v0 + 56);
  return objc_msgSend(v1, sel_setTransform_, v4);
}

uint64_t sub_1CFBEC740()
{
  return swift_deallocObject();
}

double _UILerp(double a1, double a2)
{
  return a1 * a2 + (1.0 - a1) * 0.0;
}

uint64_t sub_1CFBEC768()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBEC78C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setPageContentTranslation_, *(double *)(v0 + 24), *(double *)(v0 + 32) + *(double *)(v0 + 40));
}

uint64_t sub_1CFBEC7A8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CFBEC7CC()
{
  uint64_t v0;

  return sub_1CFBEA02C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CFBEC7D4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBEC800()
{
  uint64_t v0;

  return sub_1CFBEBA00(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_1CFBEC80C()
{
  return swift_deallocObject();
}

id sub_1CFBEC81C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, *(double *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha));
}

uint64_t sub_1CFBEC838()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1CFBEC864()
{
  uint64_t v0;

  return sub_1CFBEBB08(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_1CFBEC86C()
{
  unint64_t result;

  result = qword_1ED90AE90;
  if (!qword_1ED90AE90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED90AE90);
  }
  return result;
}

void sub_1CFBEC8A8(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBE8F38(a1, v1, sub_1CFBEA0E0);
}

void sub_1CFBEC8C8(uint64_t a1)
{
  uint64_t v1;

  sub_1CFBE8F38(a1, v1, sub_1CFBEA23C);
}

void sub_1CFBEC974()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_currentIconListView);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_layoutMetrics);
    objc_msgSend(v3, sel_rows);
    objc_msgSend(v3, sel_columns);
    objc_msgSend(v3, sel_alignmentIconSize);
    objc_msgSend(v3, sel_iconContentScale);
    objc_msgSend(v3, sel_alignmentIconSize);
    objc_msgSend(v3, sel_iconContentScale);
    objc_msgSend(v3, sel_iconInsets);
    objc_msgSend(v2, sel_additionalLayoutInsets);
    UIEdgeInsetsSubtract();
    objc_msgSend(v3, sel_iconSpacing);
    objc_msgSend(v3, sel_iconSpacing);

  }
}

id sub_1CFBECB74(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, sel_setIconViewConfigurationOptions_, *(_QWORD *)(a3 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_iconViewConfigurationOptions));
}

void sub_1CFBECB8C(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  id v13;
  void *v14;

  if (*(double *)((char *)v4 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets) != a1
    || *(double *)((char *)v4 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 8) != a2
    || *(double *)((char *)v4 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16) != a3
    || *(double *)((char *)v4 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 24) != a4)
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    v8 = objc_msgSend(v4, sel_iconListViews);
    sub_1CFBBAA24(0, &qword_1ED90AD78);
    v9 = sub_1CFBFA900();

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_1CFBFAD2C();
      if (v10)
        goto LABEL_13;
    }
    else
    {
      v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v10)
      {
LABEL_13:
        if (v10 < 1)
        {
          __break(1u);
          return;
        }
        v11 = 0;
        v12 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0xA0);
        do
        {
          if ((v9 & 0xC000000000000001) != 0)
            v13 = (id)MEMORY[0x1D17DAF80](v11, v9);
          else
            v13 = *(id *)(v9 + 8 * v11 + 32);
          v14 = v13;
          ++v11;
          v12();
          objc_msgSend(v14, sel_setAdditionalLayoutInsets_);
          objc_msgSend(v14, sel_layoutIconsIfNeeded);

        }
        while (v10 != v11);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

double sub_1CFBECD18()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets);
}

double sub_1CFBECD30()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset);
}

id sub_1CFBECD44(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  char *v6;
  __int128 v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v3 = OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_iconViewConfigurationOptions;
  v4 = (void *)type metadata accessor for IconListFolderView.IconListView();
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_defaultIconViewConfigurationOptions);
  v6 = &v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];
  v7 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)v6 = *MEMORY[0x1E0DC49E8];
  *((_OWORD *)v6 + 1) = v7;
  v8 = &v5[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for IconListFolderView();
  v9 = objc_msgSendSuper2(&v16, sel_initWithConfiguration_, a1);
  v10 = objc_msgSend(v9, sel_scalingView);
  v11 = objc_msgSend(v9, sel_scrollView);
  objc_msgSend(v10, sel_addSubview_, v11);

  v12 = objc_msgSend(v9, sel_pageControl);
  objc_msgSend(v10, sel_addSubview_, v12);

  v13 = v9;
  v14 = (void *)sub_1CFBFA870();
  objc_msgSend(v13, sel__setParallaxDisabled_forReason_, 1, v14);

  return v13;
}

void sub_1CFBECFA8(void *a1)
{
  _QWORD *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for IconListFolderView();
  objc_msgSendSuper2(&v9, sel__configureIconListView_, a1);
  objc_msgSend(objc_msgSend(a1, sel_layout), sel_iconSpacingForOrientation_, 1);
  v4 = v3;
  v6 = v5;
  swift_unknownObjectRelease();
  objc_msgSend(a1, sel_setIconSpacing_, v4, v6);
  v7 = objc_msgSend(a1, sel_setAutomaticallyAdjustsLayoutMetricsToFit_, 0);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xA0))(v7);
  objc_msgSend(a1, sel_setAdditionalLayoutInsets_);
  objc_msgSend(a1, sel_setIconViewConfigurationOptions_, *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_iconViewConfigurationOptions));
  v8 = objc_msgSend(a1, sel_layer);
  objc_msgSend(a1, sel_setAutomaticallyShowsEmptyGridCellsWhileEditing_, 1);
  objc_msgSend(v8, sel_setAllowsGroupBlending_, 0);
  objc_msgSend(v8, sel_setAllowsGroupOpacity_, 0);

}

void sub_1CFBED158(unint64_t a1)
{
  _QWORD *v1;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  id v11;
  id v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = v1;
  v18.super_class = (Class)type metadata accessor for IconListFolderView();
  objc_msgSendSuper2(&v18, sel__frameForIconListAtIndex_, a1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((objc_msgSend(v1, sel__shouldReverseLayoutDirection) & 1) == 0)
  {
    v11 = objc_msgSend(v1, sel_traitCollection);
    v12 = objc_msgSend(v11, sel_userInterfaceIdiom);

    if (v12 == (id)1 && (unint64_t)objc_msgSend(v1, sel_iconListViewCount) > a1)
    {
      v13 = objc_msgSend(v1, sel_iconListViewAtIndex_, a1);
      objc_msgSend(v13, sel_intrinsicContentSize);
      v8 = v14;

      objc_msgSend(v1, sel_bounds);
      v4 = CGRectGetWidth(v19) - v8;
    }
  }
  v15 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xB8))();
  v17 = v16;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGRectOffset(v20, v15, v17);
}

void sub_1CFBED308(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for IconListFolderView();
  objc_msgSendSuper2(&v6, sel_scrollViewDidScroll_, a1);
  v3 = objc_msgSend(v1, sel_scrollView);
  v4 = objc_msgSend(v3, sel_hostingDelegate);

  if (v4)
  {
    if ((objc_msgSend(v4, sel_respondsToSelector_, sel_scrollViewDidScroll_) & 1) != 0)
    {
      v5 = objc_msgSend(v1, sel_scrollView);
      objc_msgSend(v4, sel_scrollViewDidScroll_, v5);

    }
    swift_unknownObjectRelease();
  }
}

unint64_t sub_1CFBED534()
{
  objc_super v1;

  v1.receiver = (id)swift_getObjCClassFromMetadata();
  v1.super_class = (Class)&OBJC_METACLASS____TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView;
  return (unint64_t)objc_msgSendSuper2(&v1, sel_defaultIconViewConfigurationOptions) | 0x1E;
}

id sub_1CFBED574()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  id result;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v8;
  void *v9;
  char v10;

  v10 = 0;
  v1 = objc_msgSend(v0, sel_icons);
  sub_1CFBBAA24(0, &qword_1ED90AE70);
  v2 = sub_1CFBFA900();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease_n();
LABEL_13:
    v8.receiver = v0;
    v8.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
    return objc_msgSendSuper2(&v8, sel_layoutIconsIfNeeded);
  }
  swift_bridgeObjectRetain();
  result = (id)sub_1CFBFAD2C();
  v3 = (uint64_t)result;
  if (!result)
    goto LABEL_12;
LABEL_3:
  if (v3 >= 1)
  {
    v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1D17DAF80](v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      ++v5;
      v9 = v6;
      sub_1CFBED6FC(&v9, v0, &v10);

    }
    while (v3 != v5);
    swift_bridgeObjectRelease_n();
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v0, sel_removeAllIconViews);
      objc_msgSend(v0, sel_setNeedsLayout);
    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1CFBED6FC(void **a1, void *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v37 = sub_1CFBFA7A4();
  v7 = *(_QWORD *)(v37 - 8);
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v37).n128_u64[0];
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = objc_msgSend(v11, sel_gridSizeClass, v8);
  v13 = CCUIGridSizeClassForSBHIconGridSizeClass();

  v14 = sub_1CFBCCEE8(a2, v13);
  if ((v15 & 1) != 0)
  {
    v36 = v3;
    sub_1CFBFA780();
    v17 = v11;
    v18 = a2;
    v19 = v17;
    v20 = v18;
    v21 = sub_1CFBFA78C();
    v22 = sub_1CFBFA9D8();
    v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v24 = swift_slowAlloc();
      v34 = v23;
      v25 = v24;
      v35 = swift_slowAlloc();
      v39 = v35;
      *(_DWORD *)v25 = 136315394;
      v26 = objc_msgSend(v19, sel_gridSizeClass, v25 + 4);
      v27 = sub_1CFBFA894();
      v29 = v28;

      v38 = sub_1CFBC779C(v27, v29, &v39);
      sub_1CFBFABD0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      objc_msgSend(v20, sel_gridSizeForCurrentOrientation);
      v30 = sub_1CFBFA9FC();
      v38 = sub_1CFBC779C(v30, v31, &v39);
      sub_1CFBFABD0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CFB7D000, v21, (os_log_type_t)v34, "Icon grid size (%s) does not fit in list view grid size (%s). Icon view will be ignored in ListView.", (uint8_t *)v25, 0x16u);
      v32 = v35;
      swift_arrayDestroy();
      MEMORY[0x1D17DBCE8](v32, -1, -1);
      MEMORY[0x1D17DBCE8](v25, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v37);
  }
  else if (v14 != v13)
  {
    v16 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    objc_msgSend(v11, sel_setGridSizeClass_, v16);

    *a3 = 1;
  }
}

id sub_1CFBEDACC(void *a1)
{
  void *v1;
  id v3;
  id v4;
  objc_super v6;

  v3 = objc_msgSend(v1, sel_window);
  if (v3
    || (v4 = objc_msgSend(a1, sel_containerView),
        v3 = objc_msgSend(v4, sel_window),
        v4,
        v3))
  {
    objc_msgSend(v1, sel_setOrientation_, objc_msgSend(v3, sel__toWindowOrientation));

  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  return objc_msgSendSuper2(&v6, sel_willRotateWithTransitionCoordinator_, a1);
}

id sub_1CFBEDC6C()
{
  return sub_1CFBEDC88(0, type metadata accessor for IconListFolderView.IconListView);
}

id sub_1CFBEDC7C(uint64_t a1)
{
  return sub_1CFBEDC88(a1, type metadata accessor for IconListFolderView);
}

id sub_1CFBEDC88(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for IconListFolderView()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for IconListFolderView.IconListView()
{
  return objc_opt_self();
}

id sub_1CFBEDCF8()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EmptyGridCell()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_whiteColor);
  v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.05);

  objc_msgSend(v2, sel_setBackgroundColor_, v4);
  v5 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v5, sel_setCompositingFilter_, *MEMORY[0x1E0CD2EA0]);

  return v2;
}

uint64_t sub_1CFBEDDF4()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_1CFBEDDFC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1CFBEDE28()
{
  return swift_release();
}

_QWORD *sub_1CFBEDE30(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1CFBEDE68(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1CFBEDE98(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1CFBEDEE0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for IconListTraitAnalyzer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IconListTraitAnalyzer);
}

uint64_t sub_1CFBEDF28()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1CFBEDF30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CFBFABC4();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_1CFBEDF88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v13;
  int v14;
  int v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7)
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (v7 >= 2)
    v9 = v8;
  else
    v9 = v8 + 1;
  v10 = *(_DWORD *)(v6 + 80);
  if (v10 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v9 > 0x18)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  else
  {
    if (v7 > 1)
    {
      if ((*(unsigned int (**)(uint64_t *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)) >= 2)
      {
LABEL_32:
        memcpy(a1, a2, v9);
        return a1;
      }
    }
    else if (*((_BYTE *)a2 + v8))
    {
      v14 = (*((unsigned __int8 *)a2 + v8) - 1) << (8 * v8);
      if (v8 > 3)
        v14 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v15 = v8;
        else
          v15 = 4;
        __asm { BR              X11 }
      }
      if (v14 != -1)
        goto LABEL_32;
    }
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v8);
      if (v7 > 1)
        return a1;
      goto LABEL_30;
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    if (v7 <= 1)
LABEL_30:
      *((_BYTE *)a1 + v8) = 0;
  }
  return a1;
}

uint64_t sub_1CFBEE13C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;

  v2 = result;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v4 + 64) + 1;
  if (v5 > 1)
  {
    result = (*(uint64_t (**)(uint64_t))(v4 + 48))(result);
    if (result >= 2)
      return result;
    goto LABEL_15;
  }
  if (!*(_BYTE *)(result + v6))
    goto LABEL_15;
  v7 = (*(unsigned __int8 *)(result + v6) - 1) << (8 * v6);
  if (v6 > 3)
    v7 = 0;
  if ((_DWORD)v6)
  {
    if (v6 > 3)
      LODWORD(v6) = 4;
    __asm { BR              X11 }
  }
  if (v7 == -1)
  {
LABEL_15:
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  }
  return result;
}

void *sub_1CFBEE248(void *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  int v9;
  int v10;
  size_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7)
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (v7 <= 1)
  {
    if (a2[v8])
    {
      v9 = (a2[v8] - 1) << (8 * v8);
      if (v8 > 3)
        v9 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v10 = v8;
        else
          v10 = 4;
        __asm { BR              X11 }
      }
      if (v9 != -1)
        goto LABEL_20;
    }
LABEL_14:
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v8);
      if (v7 > 1)
        return a1;
    }
    else
    {
      (*(void (**)(void *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      if (v7 > 1)
        return a1;
    }
    *((_BYTE *)a1 + v8) = 0;
    return a1;
  }
  if ((*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)) < 2)goto LABEL_14;
LABEL_20:
  if (v7 >= 2)
    v11 = v8;
  else
    v11 = v8 + 1;
  memcpy(a1, a2, v11);
  return a1;
}

unsigned __int8 *sub_1CFBEE3BC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char v9;
  int v10;
  int v11;
  uint64_t (*v12)(unsigned __int8 *, uint64_t, uint64_t);
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t (*v17)(unsigned __int8 *, uint64_t, uint64_t);
  int v18;
  int v19;
  size_t v20;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  if ((_DWORD)v7)
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (v7 > 1)
  {
    v12 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    v13 = v12(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16));
    v14 = v12(a2, v7, v5);
    if (v13 >= 2)
    {
      if (v14 >= 2)
        goto LABEL_41;
LABEL_45:
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
      {
        memcpy(a1, a2, v8);
        if (v7 > 1)
          return a1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(unsigned __int8 *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
        if (v7 > 1)
          return a1;
      }
      a1[v8] = 0;
      return a1;
    }
    if (v14 >= 2)
    {
LABEL_31:
      if (!v12(a1, 1, v5))
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_41;
    }
LABEL_33:
    v17 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    v18 = v17(a1, 1, v5);
    v19 = v17(a2, 1, v5);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(unsigned __int8 *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
        return a1;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 24))(a1, a2, v5);
        return a1;
      }
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    memcpy(a1, a2, v8);
    return a1;
  }
  v9 = 8 * v8;
  if (!a1[v8])
    goto LABEL_29;
  v10 = (a1[v8] - 1) << v9;
  if (v8 > 3)
    v10 = 0;
  if ((_DWORD)v8)
  {
    if (v8 <= 3)
      v11 = v8;
    else
      v11 = 4;
    __asm { BR              X12 }
  }
  if (v10 == -1)
  {
LABEL_29:
    if (a2[v8])
    {
      v15 = (a2[v8] - 1) << v9;
      if (v8 > 3)
        v15 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v16 = v8;
        else
          v16 = 4;
        __asm { BR              X11 }
      }
      if (v15 != -1)
      {
        v12 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
        goto LABEL_31;
      }
    }
    goto LABEL_33;
  }
  if (!a2[v8] || (a2[v8] - 1) << v9 == -1)
    goto LABEL_45;
LABEL_41:
  if (v7 >= 2)
    v20 = v8;
  else
    v20 = v8 + 1;
  memcpy(a1, a2, v20);
  return a1;
}

void *sub_1CFBEE728(void *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  int v9;
  int v10;
  size_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7)
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (v7 <= 1)
  {
    if (a2[v8])
    {
      v9 = (a2[v8] - 1) << (8 * v8);
      if (v8 > 3)
        v9 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v10 = v8;
        else
          v10 = 4;
        __asm { BR              X11 }
      }
      if (v9 != -1)
        goto LABEL_20;
    }
LABEL_14:
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v8);
      if (v7 > 1)
        return a1;
    }
    else
    {
      (*(void (**)(void *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      if (v7 > 1)
        return a1;
    }
    *((_BYTE *)a1 + v8) = 0;
    return a1;
  }
  if ((*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)) < 2)goto LABEL_14;
LABEL_20:
  if (v7 >= 2)
    v11 = v8;
  else
    v11 = v8 + 1;
  memcpy(a1, a2, v11);
  return a1;
}

unsigned __int8 *sub_1CFBEE89C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char v9;
  int v10;
  int v11;
  uint64_t (*v12)(unsigned __int8 *, uint64_t, uint64_t);
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t (*v17)(unsigned __int8 *, uint64_t, uint64_t);
  int v18;
  int v19;
  size_t v20;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  if ((_DWORD)v7)
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (v7 > 1)
  {
    v12 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    v13 = v12(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16));
    v14 = v12(a2, v7, v5);
    if (v13 >= 2)
    {
      if (v14 >= 2)
        goto LABEL_41;
LABEL_45:
      if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
      {
        memcpy(a1, a2, v8);
        if (v7 > 1)
          return a1;
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        (*(void (**)(unsigned __int8 *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
        if (v7 > 1)
          return a1;
      }
      a1[v8] = 0;
      return a1;
    }
    if (v14 >= 2)
    {
LABEL_31:
      if (!v12(a1, 1, v5))
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_41;
    }
LABEL_33:
    v17 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    v18 = v17(a1, 1, v5);
    v19 = v17(a2, 1, v5);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        (*(void (**)(unsigned __int8 *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
        return a1;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 40))(a1, a2, v5);
        return a1;
      }
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    memcpy(a1, a2, v8);
    return a1;
  }
  v9 = 8 * v8;
  if (!a1[v8])
    goto LABEL_29;
  v10 = (a1[v8] - 1) << v9;
  if (v8 > 3)
    v10 = 0;
  if ((_DWORD)v8)
  {
    if (v8 <= 3)
      v11 = v8;
    else
      v11 = 4;
    __asm { BR              X12 }
  }
  if (v10 == -1)
  {
LABEL_29:
    if (a2[v8])
    {
      v15 = (a2[v8] - 1) << v9;
      if (v8 > 3)
        v15 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v16 = v8;
        else
          v16 = 4;
        __asm { BR              X11 }
      }
      if (v15 != -1)
      {
        v12 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
        goto LABEL_31;
      }
    }
    goto LABEL_33;
  }
  if (!a2[v8] || (a2[v8] - 1) << v9 == -1)
    goto LABEL_45;
LABEL_41:
  if (v7 >= 2)
    v20 = v8;
  else
    v20 = v8 + 1;
  memcpy(a1, a2, v20);
  return a1;
}

uint64_t sub_1CFBEEC08(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  BOOL v16;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = v6 - 1;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (v5 < 2)
  {
    v7 = 0;
    ++v8;
  }
  if (!a2)
    return 0;
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_26;
  v10 = 8 * v8;
  if (v8 > 3)
    goto LABEL_10;
  v12 = ((v9 + ~(-1 << v10)) >> v10) + 1;
  if (HIWORD(v12))
  {
    v11 = *(_DWORD *)(a1 + v8);
    if (v11)
      goto LABEL_17;
  }
  else
  {
    if (v12 <= 0xFF)
    {
      if (v12 < 2)
        goto LABEL_26;
LABEL_10:
      v11 = *(unsigned __int8 *)(a1 + v8);
      if (!*(_BYTE *)(a1 + v8))
        goto LABEL_26;
LABEL_17:
      v13 = (v11 - 1) << v10;
      if (v8 > 3)
        v13 = 0;
      if ((_DWORD)v8)
      {
        if (v8 <= 3)
          v14 = v8;
        else
          v14 = 4;
        __asm { BR              X12 }
      }
      return v7 + v13 + 1;
    }
    v11 = *(unsigned __int16 *)(a1 + v8);
    if (*(_WORD *)(a1 + v8))
      goto LABEL_17;
  }
LABEL_26:
  if (!v7)
    return 0;
  if (v5 < 2)
    return 0;
  v15 = (*(uint64_t (**)(void))(v4 + 48))();
  v16 = v15 >= 2;
  result = v15 - 2;
  if ((_DWORD)result == 0 || !v16)
    return 0;
  return result;
}

void sub_1CFBEED50(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  size_t v11;
  size_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  v10 = v9 - 1;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v8 >= 2)
  {
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = v11 + 1;
  }
  v13 = a3 >= v10;
  v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v12 > 3)
    {
      v6 = 1u;
      if (v10 < a2)
        goto LABEL_19;
      goto LABEL_26;
    }
    v15 = ((v14 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v6 = 4u;
      if (v10 < a2)
      {
LABEL_19:
        v16 = ~v10 + a2;
        if (v12 < 4)
        {
          if ((_DWORD)v12)
          {
            v17 = v16 & ~(-1 << (8 * v12));
            bzero(a1, v12);
            if ((_DWORD)v12 == 3)
            {
              *a1 = v17;
              *((_BYTE *)a1 + 2) = BYTE2(v17);
            }
            else if ((_DWORD)v12 == 2)
            {
              *a1 = v17;
            }
            else
            {
              *(_BYTE *)a1 = v17;
            }
          }
        }
        else
        {
          bzero(a1, v12);
          *(_DWORD *)a1 = v16;
        }
        __asm { BR              X10 }
      }
LABEL_26:
      __asm { BR              X13 }
    }
    if (v15 >= 0x100)
      v6 = 2;
    else
      v6 = v15 > 1;
  }
  if (v10 < a2)
    goto LABEL_19;
  goto LABEL_26;
}

void sub_1CFBEEF74()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1CFBEEF7C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_1CFBEEF9C()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1CFBEEFAC()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_1CFBEEFB4()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t sub_1CFBEEFC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_DWORD *)(v2 + 84);
  v4 = *(_QWORD *)(v2 + 64);
  if (!v3)
    ++v4;
  if (v3 > 1)
  {
    v6 = (*(uint64_t (**)(void))(v2 + 48))();
    if (v6 >= 2)
      return v6 - 1;
    else
      return 0;
  }
  else if (*(_BYTE *)(a1 + v4))
  {
    v5 = (*(unsigned __int8 *)(a1 + v4) - 1) << (8 * v4);
    if (v4 > 3)
      v5 = 0;
    if ((_DWORD)v4)
    {
      if (v4 > 3)
        LODWORD(v4) = 4;
      __asm { BR              X11 }
    }
    return (v5 + 1);
  }
  else
  {
    return 0;
  }
}

void sub_1CFBEF08C(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (v5)
  {
    v7 = *(_QWORD *)(v4 + 64);
  }
  else
  {
    v6 = 0;
    v7 = *(_QWORD *)(v4 + 64) + 1;
  }
  if (v6 < a2)
  {
    v8 = ~v6 + a2;
    if (v7 >= 4)
    {
      bzero(a1, v7);
      *a1 = v8;
      LOBYTE(v9) = 1;
      if (v5 > 1)
        return;
LABEL_19:
      *((_BYTE *)a1 + v7) = v9;
      return;
    }
    v9 = (v8 >> (8 * v7)) + 1;
    if ((_DWORD)v7)
    {
      v10 = v8 & ~(-1 << (8 * v7));
      bzero(a1, v7);
      if ((_DWORD)v7 != 3)
      {
        if ((_DWORD)v7 == 2)
        {
          *(_WORD *)a1 = v10;
          if (v5 > 1)
            return;
        }
        else
        {
          *(_BYTE *)a1 = v10;
          if (v5 > 1)
            return;
        }
        goto LABEL_19;
      }
      *(_WORD *)a1 = v10;
      *((_BYTE *)a1 + 2) = BYTE2(v10);
    }
    if (v5 > 1)
      return;
    goto LABEL_19;
  }
  if (v5 > 1)
  {
    if (a2)
      (*(void (**)(unsigned int *, _QWORD, _QWORD))(v4 + 56))(a1, a2 + 1, *(unsigned int *)(v4 + 84));
  }
  else
  {
    *((_BYTE *)a1 + v7) = 0;
  }
}

uint64_t type metadata accessor for IconListTraitAnalyzer.IconTraitInclusion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IconListTraitAnalyzer.IconTraitInclusion);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1D17DBBF8](a1, v6, a5);
}

id sub_1CFBEF2B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IconListRootFolderController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IconListRootFolderController()
{
  return objc_opt_self();
}

id PowerButtonGlyphView.__allocating_init(symbolConfiguration:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;
  id v5;

  v3 = objc_allocWithZone(v1);
  v4 = objc_allocWithZone((Class)type metadata accessor for PowerButtonGlyphView());
  v5 = sub_1CFBEF47C(a1, 0.0, 0.0, 0.0, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id PowerButtonGlyphView.init(symbolConfiguration:)(void *a1)
{
  id v2;
  id v3;

  v2 = objc_allocWithZone((Class)type metadata accessor for PowerButtonGlyphView());
  v3 = sub_1CFBEF47C(a1, 0.0, 0.0, 0.0, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t type metadata accessor for PowerButtonGlyphView()
{
  return objc_opt_self();
}

id sub_1CFBEF47C(void *a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  char *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  objc_super v18;

  v11 = v5;
  v12 = (void *)sub_1CFBFA870();
  v13 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v12, a1);

  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v13);
  *(_QWORD *)&v11[OBJC_IVAR___CCUIPowerButtonGlyphView_imageView] = v14;
  v15 = v14;

  v18.receiver = v11;
  v18.super_class = (Class)type metadata accessor for PowerButtonGlyphView();
  v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a2, a3, a4, a5);
  objc_msgSend(v16, sel_addSubview_, v15);

  return v16;
}

id sub_1CFBEF600()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for PowerButtonGlyphView();
  objc_msgSendSuper2(&v8, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIPowerButtonGlyphView_imageView];
  v2 = objc_msgSend(v1, sel_image);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_size);

  }
  objc_msgSend(v0, sel_bounds);
  v4 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v4, sel_displayScale);
  v6 = v5;

  UIRectCenteredIntegralRectScale();
  return objc_msgSend(v1, sel_setFrame_, v6);
}

id PowerButtonGlyphView.imageView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CCUIPowerButtonGlyphView_imageView);
}

id PowerButtonGlyphView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void PowerButtonGlyphView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PowerButtonGlyphView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PowerButtonGlyphView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PowerButtonGlyphView()
{
  return swift_lookUpClassMethod();
}

id sub_1CFBEF880()
{
  void *v0;
  id v1;
  uint64_t inited;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IconListLayout()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AEF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFC021B0;
  if (qword_1ED90AD80 != -1)
    swift_once();
  v3 = (void *)qword_1ED90B8F0;
  *(_QWORD *)(inited + 32) = qword_1ED90B8F0;
  *(_QWORD *)(inited + 40) = v1;
  v4 = v3;
  v5 = v1;
  sub_1CFBBB464(inited);
  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90ADB8);
  sub_1CFBB5C0C((unint64_t *)&unk_1ED90AD90, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_1CFC01A88);
  v6 = (void *)sub_1CFBFA840();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v0, sel_initWithListLayouts_, v6);

  return v7;
}

id sub_1CFBEFAC8()
{
  return sub_1CFBF0220(type metadata accessor for IconListLayoutProvider);
}

uint64_t type metadata accessor for IconListLayoutProvider()
{
  return objc_opt_self();
}

id sub_1CFBEFC20()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x1E0DEE9E0];
  v1 = objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
  v2 = objc_msgSend(v1, sel_allNonDefaultGridSizeClasses);

  v8[4] = sub_1CFBF02A4;
  v8[5] = v0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1CFBEAA70;
  v8[3] = &block_descriptor_10;
  v3 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_enumerateGridSizeClassesUsingBlock_, v3);
  _Block_release(v3);

  swift_beginAccess();
  v4 = objc_allocWithZone(MEMORY[0x1E0DAA490]);
  type metadata accessor for SBHIconGridSizeClass(0);
  sub_1CFBF02C4();
  sub_1CFBB5C0C((unint64_t *)&qword_1ED90AE00, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_1CFC0170C);
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1CFBFA840();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithGridSizeClassSizes_, v5);
  swift_release();

  return v6;
}

uint64_t sub_1CFBEFDE0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  void *v12;
  uint64_t v14;

  v4 = (uint64_t *)(a3 + 16);
  CCUIGridSizeClassForSBHIconGridSizeClass();
  v5 = CCUINumberOfColumnsForGridSizeClass();
  v6 = CCUINumberOfRowsForGridSizeClass();
  v7 = (void *)objc_opt_self();
  v8 = v5 | ((unint64_t)v6 << 16);
  v9 = a1;
  v10 = objc_msgSend(v7, sel_sbh_valueWithSBHIconGridSize_, v8);
  swift_beginAccess();
  if (v10)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v4;
    *v4 = 0x8000000000000000;
    sub_1CFBCB1E8((uint64_t)v10, v9, isUniquelyReferenced_nonNull_native);
    *v4 = v14;

    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (void *)sub_1CFBC8064((uint64_t)v9);

  }
  return swift_endAccess();
}

double sub_1CFBEFF88(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned __int16 v15;
  double v16;
  id v17;

  v3 = sub_1CFBFA894();
  v5 = v4;
  if (v3 == sub_1CFBFA894() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v8 = sub_1CFBFAD8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_8:
    v9 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    goto LABEL_9;
  }
  v9 = a1;
LABEL_9:
  v10 = v9;
  CCUIPortraitMainListGridGeometryInfo();
  v12 = v11;
  CCUILayoutGutter();
  v14 = v13;
  v15 = (unsigned __int16)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_iconGridSizeClassSizes), sel_gridSizeForGridSizeClass_, v10);
  v16 = v12 * (double)v15 + v14 * ((double)v15 + -1.0);
  CCUIGridSizeClassForSBHIconGridSizeClass();
  CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
  v17 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v17, sel_scale);

  return v16;
}

id sub_1CFBF0214()
{
  return sub_1CFBF0220(type metadata accessor for IconListLayout);
}

id sub_1CFBF0220(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for IconListLayout()
{
  return objc_opt_self();
}

uint64_t sub_1CFBF0280()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CFBF02A4(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CFBEFDE0(a1, a2, v2);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

unint64_t sub_1CFBF02C4()
{
  unint64_t result;

  result = qword_1ED90AE78;
  if (!qword_1ED90AE78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED90AE78);
  }
  return result;
}

void *SBIconView.c2AnimationContainerView.getter()
{
  void *v0;
  id v1;

  v1 = v0;
  return v0;
}

id sub_1CFBF031C(void *a1)
{
  return objc_msgSend(a1, sel_contentContainerView);
}

id SBIconView.caAnimationContainerView.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_contentContainerView);
}

id sub_1CFBF0364(void *a1)
{
  id v2;
  char *v3;
  id v4;
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(a1, sel_identity);
  v3 = (char *)objc_msgSend(v2, sel_extensionIdentity);
  v4 = objc_msgSend(v2, sel_kind);
  if (!v4)
  {
    sub_1CFBFA894();
    v4 = (id)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v5 = objc_msgSend(a1, sel_type);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AC90);
  sub_1CFBFA750();
  v6 = (void *)sub_1CFBFA870();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v7 = &v3[*MEMORY[0x1E0D0FE18]];
  swift_beginAccess();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AC80);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_endAccess();
    v9 = 0;
  }
  else
  {
    sub_1CFBFA750();
    swift_endAccess();
    v9 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v4, v5, v6, v9);

  return v10;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PageIndicatorType(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
  {
    v6 = *a1;
    if (v6 >= 4)
      v7 = v6 - 3;
    else
      v7 = 0;
    if (v7 >= 4)
      return v7 - 3;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 6;
    if (a2 + 6 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1CFBF05AC + 4 * asc_1CFC025A0[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for PageIndicatorType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 6;
  if (a3 + 6 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFA)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1CFBF0658 + 4 * byte_1CFC025AA[v5]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1CFBF068C + 4 * byte_1CFC025A5[v5]))();
}

uint64_t sub_1CFBF068C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF0694(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFBF069CLL);
  return result;
}

uint64_t sub_1CFBF06A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFBF06B0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1CFBF06B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF06BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF06C8(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 4)
    return v1 - 3;
  else
    return 0;
}

_BYTE *sub_1CFBF06DC(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 3;
  return result;
}

ValueMetadata *type metadata accessor for PageIndicatorType()
{
  return &type metadata for PageIndicatorType;
}

uint64_t sub_1CFBF06FC()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBF0740()
{
  return sub_1CFBFAE04();
}

uint64_t sub_1CFBF0768()
{
  sub_1CFBFADF8();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

BOOL sub_1CFBF07A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1CFBF07BC()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_1CFBFADF8();
  if ((v1 - 4) >= 3u)
    sub_1CFBFAE04();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBF0830()
{
  _BYTE *v0;

  if ((*v0 - 4) >= 3u)
    sub_1CFBFAE04();
  return sub_1CFBFAE04();
}

uint64_t sub_1CFBF0888()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_1CFBFADF8();
  if ((v1 - 4) >= 3u)
    sub_1CFBFAE04();
  sub_1CFBFAE04();
  return sub_1CFBFAE10();
}

BOOL sub_1CFBF08F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  switch(v2)
  {
    case 6:
      return v3 == 6;
    case 5:
      return v3 == 5;
    case 4:
      return v3 == 4;
  }
  if ((v3 - 4) < 3)
    return 0;
  return v2 == v3;
}

uint64_t sub_1CFBF0960()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFBF0990 + 4 * byte_1CFC025AF[*v0]))(0x657469726F766166, 0xE800000000000000);
}

uint64_t sub_1CFBF0990()
{
  return 0x6979616C50776F6ELL;
}

uint64_t sub_1CFBF09AC()
{
  return 1701670760;
}

uint64_t sub_1CFBF09BC()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_1CFBF09DC()
{
  return 0x65746F6D65527674;
}

uint64_t sub_1CFBF09F0()
{
  return 0x646578696DLL;
}

uint64_t sub_1CFBF0A04()
{
  return 0x7974706D65;
}

unint64_t sub_1CFBF0A1C()
{
  unint64_t result;

  result = qword_1EFBF1BE0;
  if (!qword_1EFBF1BE0)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC0260C, &type metadata for PageIndicatorType);
    atomic_store(result, (unint64_t *)&qword_1EFBF1BE0);
  }
  return result;
}

uint64_t sub_1CFBF0A60()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFBF0A94 + 4 * byte_1CFC025B6[*v0]))(0x6979616C50776F6ELL, 0xEA0000000000676ELL);
}

uint64_t sub_1CFBF0A94()
{
  return 1701670760;
}

uint64_t sub_1CFBF0AA4()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_1CFBF0AC4()
{
  return 0x65746F6D65527674;
}

uint64_t sub_1CFBF0ADC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000002ELL && a2 == 0x80000001CFC07BC0 || (sub_1CFBFAD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if ((sub_1CFBFA8DC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000002BLL && a2 == 0x80000001CFC07BF0 || (sub_1CFBFAD8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000002CLL && a2 == 0x80000001CFC07C20
         || (sub_1CFBFAD8C() & 1) != 0
         || a1 == 0xD00000000000001BLL && a2 == 0x80000001CFC06F90)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_1CFBFAD8C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t getEnumTagSinglePayload for PageIndicatorType.BuiltInType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PageIndicatorType.BuiltInType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1CFBF0D74 + 4 * byte_1CFC025BF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1CFBF0DA8 + 4 * byte_1CFC025BA[v4]))();
}

uint64_t sub_1CFBF0DA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF0DB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFBF0DB8);
  return result;
}

uint64_t sub_1CFBF0DC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFBF0DCCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CFBF0DD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF0DD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF0DE4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1CFBF0DEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PageIndicatorType.BuiltInType()
{
  return &type metadata for PageIndicatorType.BuiltInType;
}

unint64_t sub_1CFBF0E08()
{
  unint64_t result;

  result = qword_1EFBF1BE8;
  if (!qword_1EFBF1BE8)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC026A8, &type metadata for PageIndicatorType.BuiltInType);
    atomic_store(result, (unint64_t *)&qword_1EFBF1BE8);
  }
  return result;
}

id sub_1CFBF0E4C(void *a1, double a2, double a3)
{
  id v3;
  id v7;
  id v8;
  id v9;
  objc_super v11;
  objc_super v12;

  if (a1)
  {
    v7 = a1;
    if (objc_msgSend(v7, sel_type) == (id)9)
    {
      v11.receiver = v3;
      v11.super_class = (Class)type metadata accessor for EmptyGridCell();
      v8 = objc_msgSendSuper2(&v11, sel_hitTest_withEvent_, v7, a2, a3);

      return v8;
    }

  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for EmptyGridCell();
  v9 = objc_msgSendSuper2(&v12, sel_hitTest_withEvent_, a1, a2, a3);
  v8 = v9;
  if (v9 && v9 == v3)
  {

    return 0;
  }
  return v8;
}

id sub_1CFBF1044()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmptyGridCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmptyGridCell()
{
  return objc_opt_self();
}

id sub_1CFBF1094()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1ED90B8F8 = (uint64_t)result;
  return result;
}

uint64_t sub_1CFBF10E8()
{
  return swift_deallocClassInstance();
}

uint64_t _s2__CMa()
{
  return objc_opt_self();
}

void sub_1CFBF1118(void *a1, void (*a2)(_QWORD, id), uint64_t a3)
{
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  if (!objc_msgSend(a1, sel_intent))
    goto LABEL_9;
  if (objc_msgSend(a1, sel_intent) == (id)2)
  {
    v6 = sub_1CFBF17F8(a1);

    if (v6)
    {
      if (qword_1ED90AFE0 != -1)
        swift_once();
      v7 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v7, (uint64_t)qword_1ED90AFC0);
      v8 = sub_1CFBFA78C();
      v9 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1CFB7D000, v8, v9, "Skipped adding iconElement:<%%@> because it is already in ControlCenter", v10, 2u);
        MEMORY[0x1D17DBCE8](v10, -1, -1);
      }

      goto LABEL_12;
    }
LABEL_9:
    sub_1CFBF142C(a1, (void (*)(_QWORD, _QWORD))a2, a3);
    return;
  }
  if (objc_msgSend(a1, sel_intent) == (id)1)
  {
    sub_1CFBF2008(a1, (void (*)(_QWORD, _QWORD))a2, a3);
    return;
  }
LABEL_12:
  v11 = sub_1CFBF2A90();
  a2(0, v11);

}

void sub_1CFBF12BC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1CFBFA5DC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_1CFBF1314(void *a1, void (*a2)(uint64_t, _QWORD))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;

  if (sub_1CFBF2280(a1))
  {
    objc_opt_self();
    v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      v6 = v5;
      v7 = MEMORY[0x1D17DBD84](v2 + 16);
      if (!v7
        || (v8 = objc_msgSend(*(id *)(v7 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider), sel_descriptorFor_, v6), swift_unknownObjectRelease(), !v8))
      {
        a2(3, 0);
        return swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  v9 = sub_1CFBF17F8(a1);

  if (v9)
    v10 = 1;
  else
    v10 = 2;
  return ((uint64_t (*)(uint64_t, _QWORD))a2)(v10, 0);
}

void sub_1CFBF142C(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(char *, _QWORD);
  _QWORD aBlock[6];

  v35 = sub_1CFBFA7D4();
  v7 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CFBFA7F8();
  v36 = *(void (***)(char *, _QWORD))(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CFBF2280(a1);
  if (v13)
  {
    v14 = v13;
    v33 = v7;
    v34 = a3;
    objc_opt_self();
    v15 = swift_dynamicCastObjCClass();
    v32 = v10;
    if (!v15)
    {
LABEL_6:
      sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
      v20 = (void *)sub_1CFBFA9A8();
      objc_msgSend(v20, sel_addIconDataSource_, v14);
      v21 = v20;
      _sSo17CCUIGridSizeClassV15ControlCenterUIE06moduleB0ABSo09CCSModuleB0V_tcfC_0((uint64_t)objc_msgSend(a1, sel_moduleSize));
      v22 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
      objc_msgSend(v21, sel_setGridSizeClass_, v22);

      sub_1CFBBAA24(0, &qword_1ED90ADD0);
      v23 = (void *)sub_1CFBFAA50();
      v24 = swift_allocObject();
      swift_weakInit();
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = v24;
      v25[3] = a1;
      v25[4] = v14;
      v25[5] = v21;
      v26 = v34;
      v25[6] = a2;
      v25[7] = v26;
      aBlock[4] = sub_1CFBF35E0;
      aBlock[5] = v25;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBCD038;
      aBlock[3] = &block_descriptor_14;
      v27 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      v28 = v21;
      v29 = a1;
      swift_retain();
      swift_release();
      sub_1CFBFA7E0();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1CFBBFB9C();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
      sub_1CFBBFBE4();
      v30 = v35;
      sub_1CFBFAC00();
      MEMORY[0x1D17DAD10](0, v12, v9, v27);
      _Block_release(v27);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v30);
      v36[1](v12, v32);
      return;
    }
    v16 = v15;
    v17 = MEMORY[0x1D17DBD84](v3 + 16);
    if (v17)
    {
      v18 = *(void **)(v17 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider);
      swift_unknownObjectRetain();
      v19 = objc_msgSend(v18, sel_descriptorFor_, v16);
      swift_unknownObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();

        goto LABEL_6;
      }
    }
    else
    {
      swift_unknownObjectRetain();
    }
    v36 = (void (**)(char *, _QWORD))sub_1CFBF2A90();
    a2(0, v36);
    swift_unknownObjectRelease_n();
  }
  else
  {
    v36 = (void (**)(char *, _QWORD))sub_1CFBF2A90();
    a2(0, v36);
  }

}

char *sub_1CFBF17F8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  char *v5;
  char *result;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char **v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  id v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  Swift::String v68;
  void *v69;
  char v70;
  uint64_t v71;
  Swift::String v72;
  unint64_t v73;
  id v74;
  id v75;
  unint64_t v76;
  unint64_t v77;

  v3 = v1 + 16;
  v4 = (char *)MEMORY[0x1D17DBD84](v1 + 16);
  v5 = v4;
  if (!v4)
    return v5;
  objc_msgSend(v4, sel_loadViewIfNeeded);
  result = *(char **)&v5[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (!result)
  {
    __break(1u);
    return result;
  }
  v7 = objc_msgSend(result, sel_folder);
  if (!v7)
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) == 0)
      goto LABEL_6;
LABEL_70:
    swift_bridgeObjectRetain();
    v62 = sub_1CFBFAD2C();
    swift_bridgeObjectRelease();
    if (v62)
      goto LABEL_7;
LABEL_71:
    swift_bridgeObjectRelease();
    return 0;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_iconsInLists);

  sub_1CFBBAA24(0, &qword_1ED90AE70);
  v10 = sub_1CFBFA900();
  swift_unknownObjectRelease();

  if ((v10 & 0x8000000000000000) != 0 || (v10 & 0x4000000000000000) != 0)
    goto LABEL_70;
LABEL_6:
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_71;
LABEL_7:
  v11 = 0;
  v12 = v10 & 0xC000000000000001;
  v13 = v10 & 0xFFFFFFFFFFFFFF8;
  v71 = v3;
  v76 = v10 & 0xC000000000000001;
  v77 = v10 >> 62;
  v14 = &selRef_presentViewController_animated_completion_;
  v73 = v10;
  v74 = a1;
  while (v12)
  {
    v15 = (char *)MEMORY[0x1D17DAF80](v11, v10);
LABEL_11:
    v5 = v15;
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_77;
    objc_opt_self();
    v17 = swift_dynamicCastObjCClass();
    if (v17)
    {
      v18 = (void *)v17;
      v5 = v5;
      if (objc_msgSend(a1, v14[97]) == (id)2)
      {
        if (!objc_msgSend(v18, sel_activeDataSource))
          goto LABEL_26;
        objc_opt_self();
        v19 = (void *)swift_dynamicCastObjCClass();
        if (!v19
          || (v75 = v19,
              (v20 = objc_msgSend(v19, sel_containerBundleIdentifier)) == 0))
        {
          swift_unknownObjectRelease();
          goto LABEL_26;
        }
        v21 = v20;
        v72._countAndFlagsBits = sub_1CFBFA894();
        v72._object = v22;

        v23 = objc_msgSend(a1, sel_extensionBundleIdentifier);
        if (v23)
        {
          v24 = v23;
          v25 = sub_1CFBFA894();
          v27 = v26;

        }
        else
        {
          v25 = 0;
          v27 = 0;
        }
        v41 = objc_msgSend(v75, sel_extensionBundleIdentifier);
        v42 = sub_1CFBFA894();
        v44 = v43;

        if (!v27)
          goto LABEL_47;
        if (v25 == v42 && v27 == v44)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v12 = v76;
          goto LABEL_49;
        }
        v45 = sub_1CFBFAD8C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v12 = v76;
        if ((v45 & 1) != 0)
        {
LABEL_49:
          a1 = v74;
          v46 = objc_msgSend(v74, sel_containerBundleIdentifier);
          if (v46)
          {
            v47 = v46;
            v48 = sub_1CFBFA894();
            v50 = v49;

            if (__PAIR128__(v50, v48) == v72)
            {
              swift_bridgeObjectRelease();
              goto LABEL_56;
            }
            v51 = sub_1CFBFAD8C();
            swift_bridgeObjectRelease();
            if ((v51 & 1) == 0)
            {

              v10 = v73;
              v12 = v76;
              goto LABEL_65;
            }
LABEL_56:
            v52 = objc_msgSend(v74, sel_controlKind);
            if (v52)
            {
              v53 = v52;
              v54 = sub_1CFBFA894();
              v56 = v55;

            }
            else
            {
              v54 = 0;
              v56 = 0;
            }
            v57 = objc_msgSend(v75, sel_kind);
            v58 = sub_1CFBFA894();
            v60 = v59;

            if (v56)
            {
              if (v54 == v58 && v56 == v60)
                goto LABEL_78;
              v61 = sub_1CFBFAD8C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v61 & 1) != 0)
                goto LABEL_79;

LABEL_64:
              v10 = v73;
              a1 = v74;
              v12 = v76;
LABEL_65:
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_27;
            }
LABEL_47:

            swift_bridgeObjectRelease();
            goto LABEL_64;
          }

        }
        else
        {

          a1 = v74;
        }
        v10 = v73;
        goto LABEL_65;
      }
      if (!objc_msgSend(a1, v14[97]) || objc_msgSend(a1, v14[97]) == (id)1)
      {
        if (objc_msgSend(v18, sel_activeDataSource))
        {
          objc_opt_self();
          v28 = swift_dynamicCastObjCClass();
          if (v28)
          {
            v29 = (void *)v28;
            v30 = objc_msgSend(a1, sel_moduleIdentifier);
            if (v30)
            {
              v31 = v30;
              v32 = sub_1CFBFA894();
              v34 = v33;

            }
            else
            {
              v32 = 0;
              v34 = 0;
            }
            v36 = objc_msgSend(v29, sel_moduleIdentifier);
            v37 = sub_1CFBFA894();
            v39 = v38;

            if (v34)
            {
              v12 = v76;
              if (v32 == v37 && v34 == v39)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();

LABEL_75:
                swift_bridgeObjectRelease();
                return v5;
              }
              v40 = sub_1CFBFAD8C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();

              if ((v40 & 1) != 0)
                goto LABEL_75;

              v10 = v73;
              a1 = v74;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();

              v10 = v73;
              a1 = v74;
              v12 = v76;
            }
          }
          else
          {
            swift_unknownObjectRelease();

          }
LABEL_27:
          v14 = &selRef_presentViewController_animated_completion_;
          if (v77)
            goto LABEL_33;
          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }

    }
    if (v77)
    {
LABEL_33:
      swift_bridgeObjectRetain();
      v35 = sub_1CFBFAD2C();
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
LABEL_28:
    v35 = *(_QWORD *)(v13 + 16);
LABEL_29:
    ++v11;
    if (v16 == v35)
      goto LABEL_71;
  }
  if (v11 < *(_QWORD *)(v13 + 16))
  {
    v15 = (char *)*(id *)(v10 + 8 * v11 + 32);
    goto LABEL_11;
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_79:
  swift_bridgeObjectRelease();
  v63 = objc_msgSend(v74, sel_intentConfiguration);
  if (!v63)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    return v5;
  }
  if (!MEMORY[0x1D17DBD84](v71))
  {
    swift_bridgeObjectRelease();
    goto LABEL_86;
  }
  v64 = objc_msgSend(v75, sel_uniqueIdentifier);
  v65 = sub_1CFBFA894();
  v67 = v66;

  swift_getObjectType();
  v68._countAndFlagsBits = v65;
  v68._object = v67;
  v69 = (void *)ControlIntentStorage.intent(bundleIdentifier:dataSourceIdentifier:)(v72, v68);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v69)
  {
LABEL_86:

    swift_unknownObjectRelease();
    return v5;
  }
  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF1CC8);
  v70 = sub_1CFBFAB10();

  swift_unknownObjectRelease();
  if ((v70 & 1) == 0)
  {

    return 0;
  }
  return v5;
}

void sub_1CFBF2008(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void (**v21)(char *, uint64_t);
  _QWORD aBlock[6];

  v6 = sub_1CFBFA7D4();
  v21 = *(void (***)(char *, uint64_t))(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CFBFA7F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CFBF17F8(a1);
  if (v13)
  {
    v14 = v13;
    sub_1CFBBAA24(0, &qword_1ED90ADD0);
    v20 = sub_1CFBFAA50();
    v15 = swift_allocObject();
    swift_weakInit();
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = v14;
    v16[4] = a2;
    v16[5] = a3;
    aBlock[4] = sub_1CFBF36A0;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD038;
    aBlock[3] = &block_descriptor_33_0;
    v17 = _Block_copy(aBlock);
    v18 = v14;
    swift_retain();
    swift_release();
    sub_1CFBFA7E0();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1CFBBFB9C();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
    sub_1CFBBFBE4();
    sub_1CFBFAC00();
    v19 = (void *)v20;
    MEMORY[0x1D17DAD10](0, v12, v8, v17);
    _Block_release(v17);

    v21[1](v8, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    v21 = (void (**)(char *, uint64_t))sub_1CFBF2A90();
    a2(0, v21);

  }
}

id sub_1CFBF2280(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (!objc_msgSend(a1, sel_elementType) || objc_msgSend(a1, sel_elementType) == (id)1)
  {
    v3 = objc_msgSend(a1, sel_moduleIdentifier);
    if (v3)
    {
      v4 = v3;
      sub_1CFBFA894();
      v5 = objc_msgSend(a1, sel_containerBundleIdentifier);
      if (v5)
      {
        v6 = v5;
        sub_1CFBFA894();

        v7 = MEMORY[0x1D17DBD84](v1 + 16);
        if (v7)
        {
          v8 = *(id *)(v7 + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
          swift_unknownObjectRelease();
          CCUIDefaultSupportedGridSizeClassesForChronoControls();
          v9 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();
          v10 = (void *)sub_1CFBFA870();
          v11 = objc_msgSend(v8, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v4, v10);

          if (v11)
          {
            v12 = objc_msgSend(v11, sel_module);
            if ((objc_msgSend(v12, sel_respondsToSelector_, sel_supportedGridSizeClasses) & 1) != 0)
            {
              objc_msgSend(v12, sel_supportedGridSizeClasses);
              v13 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();

              v9 = v13;
            }
            if ((objc_msgSend(v12, sel_respondsToSelector_, sel_expandsGridSizeClassesForAccessibility) & 1) != 0)
              v14 = objc_msgSend(v12, sel_expandsGridSizeClassesForAccessibility);
            else
              v14 = 0;

            swift_unknownObjectRelease();
          }
          else
          {
            v14 = 0;
          }
          v21 = objc_allocWithZone(MEMORY[0x1E0D14820]);
          v22 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v23 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v15 = objc_msgSend(v21, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v22, v23, v9, v14);

          return v15;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();

      return 0;
    }
    return 0;
  }
  if (objc_msgSend(a1, sel_elementType) != (id)2)
    return 0;
  v15 = objc_msgSend(a1, sel_controlKind);
  if (v15)
  {
    sub_1CFBFA894();

    v15 = objc_msgSend(a1, sel_extensionBundleIdentifier);
    if (v15)
    {
      sub_1CFBFA894();

      v16 = objc_msgSend(a1, sel_controlType);
      v17 = objc_msgSend(a1, sel_containerBundleIdentifier);
      if (v17)
      {
        v18 = v17;
        sub_1CFBFA894();
        v20 = v19;

      }
      else
      {
        v20 = 0;
      }
      v24 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      v25 = (void *)sub_1CFBFA870();
      swift_bridgeObjectRelease();
      if (v20)
      {
        v26 = (void *)sub_1CFBFA870();
        swift_bridgeObjectRelease();
      }
      else
      {
        v26 = 0;
      }
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D14818]), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v24, v16, v25, v26);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v15;
}

uint64_t sub_1CFBF2664(uint64_t a1, void *a2, void *a3, void *a4, void (*a5)(uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v10 = result;
  v11 = objc_msgSend(a2, sel_intentConfiguration);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(a3, sel_containerBundleIdentifier);
    if (v13)
    {
      v14 = v13;
      sub_1CFBFA894();

      if ((objc_msgSend(a3, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) == 0)
      {

        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
      v15 = objc_msgSend(a3, sel_uniqueIdentifier);
      sub_1CFBFA894();

      v16 = MEMORY[0x1D17DBD84](v10 + 16);
      if (v16)
      {
        v19 = *(id *)(v16 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
        v17 = (void *)sub_1CFBFA870();
        v18 = (void *)sub_1CFBFA870();
        objc_msgSend(v19, sel_storeIntent_bundleIdentifier_dataSourceIdentifier_, v12, v17, v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();

        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }

  }
LABEL_10:
  if (MEMORY[0x1D17DBD84](v10 + 16))
  {
    sub_1CFBE6EF4(a4);
    swift_unknownObjectRelease();
  }
  a5(1, 0);
  return swift_release();
}

uint64_t sub_1CFBF2858(uint64_t a1, void *a2, void (*a3)(uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v6 = result;
  v7 = swift_dynamicCastObjCProtocolConditional();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = a2;
    v10 = objc_msgSend(v8, sel_containerBundleIdentifier);
    if (!v10)
    {

      goto LABEL_11;
    }
    v11 = v10;
    sub_1CFBFA894();

    if ((objc_msgSend(v8, sel_respondsToSelector_, sel_uniqueIdentifier) & 1) != 0)
    {
      v12 = objc_msgSend(v8, sel_uniqueIdentifier);
      sub_1CFBFA894();

      v13 = MEMORY[0x1D17DBD84](v6 + 16);
      if (v13)
      {
        v16 = *(id *)(v13 + OBJC_IVAR___CCUIPagingViewController_controlIntentStore);
        v14 = (void *)sub_1CFBFA870();
        v15 = (void *)sub_1CFBFA870();
        objc_msgSend(v16, sel_deleteIntentWithBundleIdentifier_dataSourceIdentifier_, v14, v15);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();

        goto LABEL_11;
      }

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    swift_bridgeObjectRelease();
  }
LABEL_11:
  if (MEMORY[0x1D17DBD84](v6 + 16))
  {
    sub_1CFBD6888((uint64_t)a2);
    swift_unknownObjectRelease();
  }
  a3(1, 0);
  return swift_release();
}

uint64_t sub_1CFBF2A4C()
{
  uint64_t v0;

  sub_1CFBB85D8(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ControlCenterOperationServiceController()
{
  return objc_opt_self();
}

id sub_1CFBF2A90()
{
  uint64_t inited;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  sub_1CFBFA894();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1CD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFC021B0;
  *(_QWORD *)(inited + 32) = sub_1CFBFA894();
  *(_QWORD *)(inited + 40) = v1;
  v2 = (id)NSStringFromIconElementRequestErrorCode();
  v3 = sub_1CFBFA894();
  v5 = v4;

  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v5;
  sub_1CFBBB33C(inited);
  v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v7 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1CFBFA840();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithDomain_code_userInfo_, v7, 0, v8);

  return v9;
}

void sub_1CFBF2BD0(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD aBlock[6];

  v6 = sub_1CFBFA7D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)sub_1CFBFA7F8();
  v34 = *(v10 - 1);
  v35 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  _Block_copy(a3);
  v14 = sub_1CFBF2280(a1);
  if (v14)
  {
    v15 = v14;
    v32 = v7;
    v33 = v6;
    objc_opt_self();
    v16 = swift_dynamicCastObjCClass();
    if (!v16)
    {
LABEL_6:
      sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
      v21 = (void *)sub_1CFBFA9A8();
      objc_msgSend(v21, sel_addIconDataSource_, v15);
      v22 = v21;
      _sSo17CCUIGridSizeClassV15ControlCenterUIE06moduleB0ABSo09CCSModuleB0V_tcfC_0((uint64_t)objc_msgSend(a1, sel_moduleSize));
      v23 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
      objc_msgSend(v22, sel_setGridSizeClass_, v23);

      sub_1CFBBAA24(0, &qword_1ED90ADD0);
      v24 = (void *)sub_1CFBFAA50();
      v25 = swift_allocObject();
      swift_weakInit();
      v26 = (_QWORD *)swift_allocObject();
      v26[2] = v25;
      v26[3] = a1;
      v26[4] = v15;
      v26[5] = v22;
      v26[6] = sub_1CFBF35B0;
      v26[7] = v13;
      aBlock[4] = sub_1CFBF35E0;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFBCD038;
      aBlock[3] = &block_descriptor_11;
      v27 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      v28 = v22;
      v29 = a1;
      swift_retain();
      swift_release();
      sub_1CFBFA7E0();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1CFBBFB9C();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
      sub_1CFBBFBE4();
      v30 = v33;
      sub_1CFBFAC00();
      MEMORY[0x1D17DAD10](0, v12, v9, v27);
      _Block_release(v27);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v30);
      (*(void (**)(char *, id))(v34 + 8))(v12, v35);
      swift_release();
      return;
    }
    v17 = v16;
    v18 = MEMORY[0x1D17DBD84](a2 + 16);
    if (v18)
    {
      v19 = *(void **)(v18 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider);
      swift_unknownObjectRetain();
      v20 = objc_msgSend(v19, sel_descriptorFor_, v17);
      swift_unknownObjectRelease();
      if (v20)
      {
        swift_unknownObjectRelease();

        goto LABEL_6;
      }
    }
    else
    {
      swift_unknownObjectRetain();
    }
    v31 = sub_1CFBF2A90();
    v35 = (id)sub_1CFBFA5DC();
    ((void (**)(_QWORD, _QWORD, id))a3)[2](a3, 0, v35);
    swift_release();
    swift_unknownObjectRelease_n();
  }
  else
  {
    v31 = sub_1CFBF2A90();
    v35 = (id)sub_1CFBFA5DC();
    ((void (**)(_QWORD, _QWORD, id))a3)[2](a3, 0, v35);
    swift_release();
  }

}

void sub_1CFBF2FEC(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  const void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  _QWORD aBlock[6];

  v5 = sub_1CFBFA7D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CFBFA7F8();
  v24 = *(void (***)(_QWORD, _QWORD))(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  _Block_copy(a3);
  v13 = sub_1CFBF17F8(a1);
  if (v13)
  {
    v14 = v13;
    sub_1CFBBAA24(0, &qword_1ED90ADD0);
    v15 = (void *)sub_1CFBFAA50();
    v16 = swift_allocObject();
    swift_weakInit();
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = v16;
    v17[3] = v14;
    v17[4] = sub_1CFBF369C;
    v17[5] = v12;
    aBlock[4] = sub_1CFBF3658;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFBCD038;
    aBlock[3] = &block_descriptor_25_0;
    v18 = _Block_copy(aBlock);
    v23 = v9;
    v19 = v6;
    v20 = v18;
    v21 = v14;
    swift_retain();
    swift_release();
    sub_1CFBFA7E0();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1CFBBFB9C();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1050);
    sub_1CFBBFBE4();
    sub_1CFBFAC00();
    MEMORY[0x1D17DAD10](0, v11, v8, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v5);
    ((void (**)(char *, uint64_t))v24)[1](v11, v23);
    swift_release();
  }
  else
  {
    v22 = sub_1CFBF2A90();
    v24 = (void (**)(_QWORD, _QWORD))sub_1CFBFA5DC();
    ((void (**)(_QWORD, _QWORD, void (**)(_QWORD, _QWORD)))a3)[2](a3, 0, v24);
    swift_release();

  }
}

void sub_1CFBF32B0(void *a1, uint64_t a2, void *aBlock)
{
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  void *v12;

  _Block_copy(aBlock);
  _Block_copy(aBlock);
  _Block_copy(aBlock);
  if (!objc_msgSend(a1, sel_intent))
  {
LABEL_9:
    _Block_copy(aBlock);
    sub_1CFBF2BD0(a1, a2, (void (**)(_QWORD, _QWORD, _QWORD))aBlock);
    goto LABEL_12;
  }
  if (objc_msgSend(a1, sel_intent) == (id)2)
  {
    v6 = sub_1CFBF17F8(a1);

    if (v6)
    {
      if (qword_1ED90AFE0 != -1)
        swift_once();
      v7 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v7, (uint64_t)qword_1ED90AFC0);
      v8 = sub_1CFBFA78C();
      v9 = sub_1CFBFA9F0();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1CFB7D000, v8, v9, "Skipped adding iconElement:<%%@> because it is already in ControlCenter", v10, 2u);
        MEMORY[0x1D17DBCE8](v10, -1, -1);
      }

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(a1, sel_intent) != (id)1)
  {
LABEL_13:
    v11 = sub_1CFBF2A90();
    v12 = (void *)sub_1CFBFA5DC();
    (*((void (**)(void *, _QWORD, void *))aBlock + 2))(aBlock, 0, v12);

    goto LABEL_14;
  }
  _Block_copy(aBlock);
  sub_1CFBF2FEC(a1, a2, (void (**)(_QWORD, _QWORD, _QWORD))aBlock);
LABEL_12:
  _Block_release(aBlock);
LABEL_14:
  _Block_release(aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

uint64_t sub_1CFBF347C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char *v10;
  uint64_t v11;

  if (sub_1CFBF2280(a1))
  {
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6)
    {
      v7 = v6;
      v8 = MEMORY[0x1D17DBD84](a2 + 16);
      if (!v8
        || (v9 = objc_msgSend(*(id *)(v8 + OBJC_IVAR___CCUIPagingViewController_controlDescriptorProvider), sel_descriptorFor_, v7), swift_unknownObjectRelease(), !v9))
      {
        (*(void (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, 3, 0);
        return swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  v10 = sub_1CFBF17F8(a1);

  if (v10)
    v11 = 1;
  else
    v11 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, v11, 0);
}

uint64_t sub_1CFBF358C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1CFBF35B0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CFBF12BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1CFBF35B8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBF3644()
{
  uint64_t v0;

  return sub_1CFBF2664(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void (**)(uint64_t, _QWORD))(v0 + 48));
}

uint64_t sub_1CFBF3658()
{
  uint64_t v0;

  return sub_1CFBF2858(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(uint64_t, _QWORD))(v0 + 32));
}

uint64_t objectdestroy_21Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFBF36C0()
{
  uint64_t result;

  result = sub_1CFBFA870();
  qword_1ED90B8F0 = result;
  return result;
}

uint64_t sub_1CFBF36FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

id sub_1CFBF371C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  char v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v34;
  void *v35;
  id v36[5];
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v1 = v0;
  v39 = *MEMORY[0x1E0C80C00];
  v2 = sub_1CFBF8048();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA4B0]), sel_initWithStore_, v2);
  objc_msgSend(v3, sel_setDelegate_, v0);
  sub_1CFBF541C();
  v36[0] = 0;
  v4 = objc_msgSend(v2, sel_loadCurrentIconState_, v36);
  v5 = v36[0];
  if (v4)
  {
    v6 = v4;
    v7 = sub_1CFBFA84C();
    v8 = v5;

    LOBYTE(v35) = 8;
    sub_1CFBF9920();
    sub_1CFBFAC78();
    if (*(_QWORD *)(v7 + 16) && (v9 = sub_1CFBBEF1C((uint64_t)v36), (v10 & 1) != 0))
    {
      sub_1CFBC1384(*(_QWORD *)(v7 + 56) + 32 * v9, (uint64_t)&v37);
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1CFBBFAA4((uint64_t)v36);
    if (*((_QWORD *)&v38 + 1))
    {
      sub_1CFBBAA24(0, &qword_1EFBF1770);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, 1000);
        v12 = sub_1CFBFAB10();

        if ((v12 & 1) == 0)
          *(_BYTE *)(v1 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_iconStateDirty) = 1;
      }
    }
    else
    {
      sub_1CFBE7CCC((uint64_t)&v37, &qword_1ED90AF00);
    }
    objc_msgSend(v3, sel_layout);
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_iconStateDirty) == 1)
    {
      *(_BYTE *)(v1 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_iconStateDirty) = 0;
      v25 = objc_msgSend(v3, sel_rootFolder);
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v25, sel_markIconStateDirty);

      }
      objc_msgSend(v3, sel_saveIconStateIfNeeded);
    }
    sub_1CFBF491C((unint64_t)v3);
  }
  else
  {
    v13 = v36[0];
    v14 = (void *)sub_1CFBFA5E8();

    swift_willThrow();
    if (qword_1ED90AD00 != -1)
      swift_once();
    v15 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED90ACE0);
    v16 = v14;
    v17 = v14;
    v18 = sub_1CFBFA78C();
    v19 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v34 = v2;
      v21 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v22 = v14;
      v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v36[0] = v23;
      sub_1CFBFABD0();
      *v21 = v23;

      _os_log_impl(&dword_1CFB7D000, v18, v19, "Did not find controls icon state plist; %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
      swift_arrayDestroy();
      v24 = v21;
      v2 = v34;
      MEMORY[0x1D17DBCE8](v24, -1, -1);
      MEMORY[0x1D17DBCE8](v20, -1, -1);

    }
    else
    {

    }
    v27 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager), sel_orderedEnabledModuleIdentifiersFromSettingsApp);
    v28 = sub_1CFBFA900();

    v29 = sub_1CFBF6548(v3, v28);
    swift_bridgeObjectRelease();
    if (v29)
    {
      sub_1CFBF491C((unint64_t)v29);

      v2 = v3;
      v3 = v29;
    }
    else
    {
      v30 = sub_1CFBFA78C();
      v31 = sub_1CFBFA9D8();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1CFB7D000, v30, v31, "Cannot build icon model from user-enabled Legacy module identifiers", v32, 2u);
        MEMORY[0x1D17DBCE8](v32, -1, -1);

        v2 = v30;
      }
      else
      {

      }
    }
  }

  return v3;
}

id sub_1CFBF3C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[3];
  uint64_t v28;

  v27[2] = a3;
  v28 = a5;
  v7 = sub_1CFBFA6D8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  CCUIDefaultSupportedGridSizeClassesForChronoControls();
  v11 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();
  v12 = *(void **)(v5 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager);
  v27[1] = a1;
  v13 = (void *)sub_1CFBFA870();
  sub_1CFBFA6CC();
  sub_1CFBFA69C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v13, v14);

  if (v15)
  {
    v16 = objc_msgSend(v15, sel_module);
    if ((objc_msgSend(v16, sel_respondsToSelector_, sel_supportedGridSizeClasses) & 1) != 0)
    {
      objc_msgSend(v16, sel_supportedGridSizeClasses);
      v17 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();

      v11 = v17;
    }
    if ((objc_msgSend(v16, sel_respondsToSelector_, sel_expandsGridSizeClassesForAccessibility) & 1) != 0)
      v18 = objc_msgSend(v16, sel_expandsGridSizeClassesForAccessibility);
    else
      v18 = 0;

    swift_unknownObjectRelease();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_allocWithZone(MEMORY[0x1E0D14820]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = v11;
  v21 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v22 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v19, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v21, v22, v20, v18);

  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
  v24 = (void *)sub_1CFBFA9A8();
  objc_msgSend(v24, sel_addIconDataSource_, v23);
  v25 = v24;
  objc_msgSend(v25, sel_setGridSizeClass_, v28);

  return v25;
}

uint64_t sub_1CFBF3EEC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1CFBF3F28 + 4 * byte_1CFC027C0[a1]))(0xD000000000000010, 0x80000001CFC04010);
}

unint64_t sub_1CFBF3F28()
{
  return 0xD000000000000019;
}

uint64_t sub_1CFBF3F50()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_1CFBF3FF4()
{
  return 0x6556746567646977;
}

uint64_t sub_1CFBF4018(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_1CFBF3EEC(*a1);
  v5 = v4;
  if (v3 == sub_1CFBF3EEC(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_1CFBFAD8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1CFBF40A0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1CFBFADF8();
  sub_1CFBF3EEC(v1);
  sub_1CFBFA8AC();
  swift_bridgeObjectRelease();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBF4100()
{
  unsigned __int8 *v0;

  sub_1CFBF3EEC(*v0);
  sub_1CFBFA8AC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFBF4140()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1CFBFADF8();
  sub_1CFBF3EEC(v1);
  sub_1CFBFA8AC();
  swift_bridgeObjectRelease();
  return sub_1CFBFAE10();
}

uint64_t sub_1CFBF419C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1CFBF912C();
  *a1 = result;
  return result;
}

uint64_t sub_1CFBF41C8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1CFBF3EEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1CFBF41F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF0990);
    v2 = (_QWORD *)sub_1CFBFAD50();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x1E0DEE9B8] + 8;
  v11 = MEMORY[0x1E0DEA968];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_1CFBE7A6C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1CFBBFA58(v6, v7);
    sub_1CFBBFA58(v7, v40);
    sub_1CFBBFA58(v40, &v38);
    result = sub_1CFBBEE14(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      result = (unint64_t)sub_1CFBBFA58(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_1CFBBFA58(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1CFBF4558(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1DD8);
    v2 = sub_1CFBFAD50();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1CFBC1384(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1CFBBFA58(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1CFBBFA58(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1CFBBFA58(v36, v37);
    sub_1CFBBFA58(v37, &v33);
    result = sub_1CFBFAC60();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1CFBBFA58(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1CFBE7A6C();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1CFBF491C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  void (*v20)(void *, uint64_t, _BYTE *);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD *v42;
  BOOL v43;
  void *v44;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v46;
  char v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  __int128 aBlock;
  void (*v55)(uint64_t, void *);
  void *v56;
  uint64_t (*v57)();
  uint64_t v58;
  uint64_t v59;
  _OWORD v60[3];

  v2 = 0;
  v3 = sub_1CFBF8314();
  v4 = (unint64_t)"deviceDependentModuleMigrated";
  v14 = v3;
  if (!v3)
    goto LABEL_12;
  if (*(_QWORD *)(v3 + 16))
  {
    v15 = sub_1CFBBEE14(0xD00000000000001DLL, 0x80000001CFC040D0);
    if ((v16 & 1) != 0)
    {
      sub_1CFBC1384(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&aBlock);
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        if (v60[0] == __PAIR128__(0xE100000000000000, 49))
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v48 = sub_1CFBFAD8C();
          swift_bridgeObjectRelease();
          if ((v48 & 1) == 0)
            goto LABEL_12;
        }
        return swift_bridgeObjectRelease();
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_14:
  v17 = objc_msgSend((id)a1, sel_rootFolder);
  v50 = v14;
  if (!v17)
  {
    v20 = 0;
    goto LABEL_50;
  }
  v49 = a1;
  v18 = objc_msgSend(*(id *)(v52 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager), sel_loadableModuleIdentifiers);
  v19 = sub_1CFBFA984();

  v53 = objc_msgSend(v17, sel_firstList);
  if (v53)
  {
    v51 = v17;
    v20 = 0;
    v4 = 0;
    v21 = v19 + 56;
    while (1)
    {
      if (v4 >= 3)
      {
        __break(1u);
LABEL_54:
        __break(1u);
        swift_once();
        v5 = sub_1CFBFA7A4();
        __swift_project_value_buffer(v5, (uint64_t)qword_1ED90ACE0);
        v6 = (id)v2;
        v7 = (id)v2;
        v8 = sub_1CFBFA78C();
        v9 = sub_1CFBFA9D8();
        if (os_log_type_enabled(v8, v9))
        {
          v10 = (uint8_t *)swift_slowAlloc();
          v11 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v10 = 138412290;
          v12 = (id)v2;
          v13 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)&aBlock = v13;
          v4 = (unint64_t)"deviceDependentModuleMigrated";
          sub_1CFBFABD0();
          *v11 = v13;

          _os_log_impl(&dword_1CFB7D000, v8, v9, "Migration settings file load error %@", v10, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
          swift_arrayDestroy();
          MEMORY[0x1D17DBCE8](v11, -1, -1);
          MEMORY[0x1D17DBCE8](v10, -1, -1);

        }
        else
        {

        }
        v2 = 0;
LABEL_12:
        v14 = MEMORY[0x1E0DEE9E0];
        goto LABEL_14;
      }
      if (*(_QWORD *)(v19 + 16))
      {
        v22 = (char *)&unk_1E8CFD368 + 16 * v4;
        v24 = *((_QWORD *)v22 + 4);
        v23 = *((_QWORD *)v22 + 5);
        sub_1CFBFADF8();
        swift_bridgeObjectRetain();
        sub_1CFBFA8AC();
        v25 = sub_1CFBFAE10();
        v2 = -1 << *(_BYTE *)(v19 + 32);
        a1 = v25 & ~v2;
        if (((*(_QWORD *)(v21 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) == 0)
          goto LABEL_17;
        v26 = *(_QWORD *)(v19 + 48);
        v27 = (_QWORD *)(v26 + 16 * a1);
        v28 = *v27 == v24 && v27[1] == v23;
        if (!v28 && (sub_1CFBFAD8C() & 1) == 0)
        {
          v2 = ~v2;
          while (1)
          {
            a1 = (a1 + 1) & v2;
            if (((*(_QWORD *)(v21 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) == 0)
              break;
            v42 = (_QWORD *)(v26 + 16 * a1);
            v43 = *v42 == v24 && v42[1] == v23;
            if (v43 || (sub_1CFBFAD8C() & 1) != 0)
              goto LABEL_27;
          }
LABEL_17:
          swift_bridgeObjectRelease();
          goto LABEL_18;
        }
LABEL_27:
        LOBYTE(v60[0]) = 0;
        a1 = swift_allocObject();
        *(_QWORD *)(a1 + 16) = v24;
        *(_QWORD *)(a1 + 24) = v23;
        *(_QWORD *)(a1 + 32) = v60;
        swift_bridgeObjectRetain();
        sub_1CFBB8538((uint64_t)v20);
        v29 = swift_allocObject();
        *(_QWORD *)(v29 + 16) = sub_1CFBF98EC;
        *(_QWORD *)(v29 + 24) = a1;
        v57 = sub_1CFBBA9A0;
        v58 = v29;
        *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v55 = sub_1CFBB8F6C;
        v56 = &block_descriptor_12;
        v30 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v53, sel_enumerateIconsUsingBlock_, v30);
        _Block_release(v30);
        LOBYTE(v30) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((v30 & 1) != 0)
          goto LABEL_54;
        if (LOBYTE(v60[0]) == 1)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v31 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
          v32 = sub_1CFBF3C40(v24, v23, 0xD000000000000015, 0x80000001CFC06CA0, (uint64_t)v31);

          swift_bridgeObjectRelease();
          v33 = objc_msgSend(v51, sel_firstList);
          if (v33)
          {
            v34 = v33;
            v35 = objc_msgSend(v33, sel_lastIcon);
            if (v35)
            {
              v36 = v35;
              v37 = objc_msgSend(v34, sel_gridSize);
              v38 = HIWORD(v37);
              v39 = (unsigned __int16)v37;
              v40 = objc_msgSend(v34, sel_gridCellInfoWithOptions_, 0);
              v41 = objc_msgSend(v34, sel_iconAtCoordinate_gridCellInfo_, v39, v38, v40);

              if (v41)
              {
                v2 = (uint64_t)objc_msgSend(v51, sel_insertIcon_beforeIcon_options_listGridCellInfoOptions_, v32, v36, 0x1000000, 0);

              }
              else
              {
                v2 = (uint64_t)objc_msgSend(v51, sel_insertIcon_afterIcon_options_listGridCellInfoOptions_, v32, v36, 0x1000000, 0);

              }
            }
            else
            {

            }
          }
          else
          {
            v34 = v32;
          }

        }
        v20 = sub_1CFBF98EC;
      }
LABEL_18:
      if (++v4 == 3)
      {
        swift_arrayDestroy();

        swift_bridgeObjectRelease();
        a1 = v49;
        v4 = (unint64_t)"deviceDependentModuleMigrated";
        goto LABEL_50;
      }
    }
  }

  swift_bridgeObjectRelease();
  v20 = 0;
LABEL_50:
  v44 = (void *)MEMORY[0x1E0DEA968];
  objc_msgSend((id)a1, sel_saveIconStateIfNeeded);
  v56 = v44;
  *(_QWORD *)&aBlock = 49;
  *((_QWORD *)&aBlock + 1) = 0xE100000000000000;
  sub_1CFBBFA58(&aBlock, v60);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v59 = v50;
  sub_1CFBCB0B8(v60, 0xD00000000000001DLL, (v4 - 32) | 0x8000000000000000, isUniquelyReferenced_nonNull_native);
  v46 = v59;
  swift_bridgeObjectRelease();
  v56 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1E00);
  *(_QWORD *)&aBlock = v46;
  sub_1CFBF8668(&aBlock);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  return sub_1CFBB8538((uint64_t)v20);
}

void sub_1CFBF52D0(void *a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  id v20;

  objc_opt_self();
  v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    v12 = (void *)v11;
    v20 = a1;
    if (!objc_msgSend(v12, sel_activeDataSource))
    {
LABEL_14:

      return;
    }
    objc_opt_self();
    v13 = (void *)swift_dynamicCastObjCClass();
    if (v13)
    {
      v14 = objc_msgSend(v13, sel_moduleIdentifier);
      v15 = sub_1CFBFA894();
      v17 = v16;

      if (v15 == a4 && v17 == a5)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = sub_1CFBFAD8C();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
          goto LABEL_13;
      }
      *a6 = 1;
      *a3 = 1;
    }
LABEL_13:
    swift_unknownObjectRelease();
    goto LABEL_14;
  }
}

uint64_t sub_1CFBF541C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  void *v6;
  void *v7;
  char isUniquelyReferenced_nonNull_native;
  char v10;
  _OWORD v11[2];
  __int128 v12;
  uint64_t v13;

  v1 = v0;
  v2 = sub_1CFBF8314();
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v3 = MEMORY[0x1E0DEE9E0];
LABEL_9:
    v6 = *(void **)(v1 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_controlIntentStore);
    v7 = (void *)sub_1CFBFA870();
    objc_msgSend(v6, sel_deleteIntentWithBundleIdentifier_dataSourceIdentifier_, v7, 0);

    v13 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v12 = 49;
    *((_QWORD *)&v12 + 1) = 0xE100000000000000;
    sub_1CFBBFA58(&v12, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1CFBCB0B8(v11, 0xD000000000000020, 0x80000001CFC040F0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBF1E00);
    *(_QWORD *)&v12 = v3;
    sub_1CFBF8668(&v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  }
  if (!*(_QWORD *)(v2 + 16)
    || (v4 = sub_1CFBBEE14(0xD000000000000020, 0x80000001CFC040F0), (v5 & 1) == 0)
    || (sub_1CFBC1384(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v12), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  if (v11[0] != __PAIR128__(0xE100000000000000, 49))
  {
    v10 = sub_1CFBFAD8C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1CFBF5920(id a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  int v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  char v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[2];
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  int v76;
  unint64_t v77;
  char *v78;
  id v79;
  unint64_t v80;
  const char *v81;
  uint64_t v82;

  v3 = v2;
  v6 = sub_1CFBFA6D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v71 = (char *)v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED90AFA0);
  *(_QWORD *)&v10 = MEMORY[0x1E0C80A78](v9).n128_u64[0];
  v70 = (char *)v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(v2 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager);
  v79 = *(id *)(v2 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager);
  v13 = objc_msgSend(v12, sel_loadableModuleIdentifiers, v10);
  v14 = sub_1CFBFA984();

  v15 = *(_QWORD *)(a2 + 16);
  v72 = v7;
  v73 = v6;
  if (v15)
  {
    v74 = v3;
    v75 = a1;
    v16 = a2 + 32;
    v17 = v14 + 56;
    v69 = a2;
    swift_bridgeObjectRetain();
    v76 = 0;
    v18 = 0;
    v81 = "com.apple.Home.ControlCenter";
    v80 = 0x80000001CFC07EF0;
    v78 = "nceControlCenterModule";
    v77 = 0x80000001CFC07F30;
    v67[1] = "ControlsDesiredIconState.plist";
    v68 = 0x80000001CFC07ED0;
    while (1)
    {
      if (*(_QWORD *)(v14 + 16))
      {
        v19 = (uint64_t *)(v16 + 16 * v18);
        v20 = *v19;
        v21 = v19[1];
        sub_1CFBFADF8();
        swift_bridgeObjectRetain();
        sub_1CFBFA8AC();
        v22 = sub_1CFBFAE10();
        v23 = -1 << *(_BYTE *)(v14 + 32);
        v24 = v22 & ~v23;
        if (((*(_QWORD *)(v17 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) != 0)
        {
          v25 = *(_QWORD *)(v14 + 48);
          v26 = (_QWORD *)(v25 + 16 * v24);
          v27 = *v26 == v20 && v26[1] == v21;
          if (v27 || (sub_1CFBFAD8C() & 1) != 0)
          {
LABEL_12:
            if ((v20 != 0xD000000000000036 || v21 != v80)
              && (sub_1CFBFAD8C() & 1) == 0
              && (v20 != 0xD000000000000036 || v21 != v77)
              && (sub_1CFBFAD8C() & 1) == 0)
            {
              if (v20 == 0xD00000000000001CLL && v21 == v68)
                v31 = 1;
              else
                v31 = sub_1CFBFAD8C() | v76;
              v76 = v31;
              v32 = (void *)sub_1CFBFA870();
              v33 = v79;
              v34 = objc_msgSend(v79, sel_moduleSettingsForModuleIdentifier_, v32);

              v35 = objc_msgSend(v34, sel_gridSizeClass);
              v36 = sub_1CFBF611C(v20, v21, (uint64_t)v35, v33, v74);
              swift_bridgeObjectRelease();
              v37 = objc_msgSend(v75, sel_addIcon_options_, v36, 2);
              if (v37)
              {
                v38 = v37;
                v39 = (uint64_t)v70;
                sub_1CFBFA708();

                v40 = sub_1CFBFA714();
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 0, 1, v40);
              }
              else
              {

                v41 = sub_1CFBFA714();
                v39 = (uint64_t)v70;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v70, 1, 1, v41);
              }
              sub_1CFBE7CCC(v39, &qword_1ED90AFA0);
              goto LABEL_4;
            }
          }
          else
          {
            v28 = ~v23;
            while (1)
            {
              v24 = (v24 + 1) & v28;
              if (((*(_QWORD *)(v17 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
                break;
              v29 = (_QWORD *)(v25 + 16 * v24);
              v30 = *v29 == v20 && v29[1] == v21;
              if (v30 || (sub_1CFBFAD8C() & 1) != 0)
                goto LABEL_12;
            }
          }
        }
        swift_bridgeObjectRelease();
      }
LABEL_4:
      if (++v18 == v15)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v3 = v74;
        a1 = v75;
        v42 = v79;
        v43 = v76;
        goto LABEL_37;
      }
    }
  }
  swift_bridgeObjectRelease();
  v43 = 0;
  v42 = v79;
LABEL_37:
  v44 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  v45 = sub_1CFBF611C(0xD00000000000002ELL, 0x80000001CFC07BC0, (uint64_t)v44, v42, v3);

  if ((v43 & 1) != 0)
  {
    v46 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    v47 = sub_1CFBF611C(0xD00000000000001CLL, 0x80000001CFC07ED0, (uint64_t)v46, v42, v3);

    v48 = v71;
    sub_1CFBFA6CC();
    sub_1CFBFA69C();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v48, v73);
    v49 = objc_allocWithZone(MEMORY[0x1E0D14818]);
    v50 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v51 = (void *)sub_1CFBFA870();
    v52 = v3;
    v53 = (void *)sub_1CFBFA870();
    v54 = (void *)sub_1CFBFA870();
    v55 = objc_msgSend(v49, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v50, v51, 2, v53, v54);

    sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
    v56 = (void *)sub_1CFBFA9A8();
    objc_msgSend(v56, sel_addIconDataSource_, v55);
    v57 = v56;
    v58 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    objc_msgSend(v57, sel_setGridSizeClass_, v58);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DF0);
    v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_1CFC028C0;
    *(_QWORD *)(v59 + 32) = v47;
    *(_QWORD *)(v59 + 40) = v57;
    v82 = v59;
    sub_1CFBFA918();
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    v60 = v57;
    v61 = v47;
    v62 = (void *)sub_1CFBFA8F4();
    swift_bridgeObjectRelease();
    v63 = objc_msgSend(a1, sel_addListWithIcons_, v62);

    v42 = v79;
    v3 = v52;

  }
  v64 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  v65 = sub_1CFBF611C(0xD00000000000002BLL, 0x80000001CFC07BF0, (uint64_t)v64, v42, v3);

  v66 = objc_msgSend(a1, sel_addListWithIcon_, v65);
}

id sub_1CFBF611C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v47[5];
  uint64_t v48;
  id v49;
  uint64_t v50;

  v48 = sub_1CFBFA6D8();
  v8 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)sub_1CFBFA870();
  v12 = objc_msgSend(a4, sel_moduleSettingsForModuleIdentifier_, v11);

  v13 = objc_msgSend(v12, sel_moduleContainerBundleIdentifier);
  v14 = sub_1CFBFA894();

  v15 = objc_allocWithZone(MEMORY[0x1E0DAA488]);
  v50 = a3;
  v49 = objc_msgSend(v15, sel_initWithGridSizeClass_, a3);
  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
  v16 = (void *)sub_1CFBFA9A8();
  v17 = *(void **)(a5 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager);
  v18 = (void *)sub_1CFBFA870();
  v19 = objc_msgSend(v17, sel_moduleSettingsForModuleIdentifier_, v18);

  v20 = objc_msgSend(v19, sel_parityControlExtensionIdentifier);
  if (!v20)
    goto LABEL_9;
  v21 = v20;
  v47[4] = sub_1CFBFA894();

  v22 = objc_msgSend(v19, sel_parityControlContainerBundleIdentifier);
  if (!v22)
  {
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_9:
    v41 = objc_allocWithZone(MEMORY[0x1E0D14820]);
    swift_bridgeObjectRetain();
    v40 = v49;
    v42 = v49;
    v43 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v44 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v39 = objc_msgSend(v41, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v43, v44, v42, 0);

    goto LABEL_10;
  }
  v23 = v22;
  v47[3] = v14;
  v47[2] = sub_1CFBFA894();
  v25 = v24;

  v26 = objc_msgSend(v19, sel_parityControlKind);
  if (!v26)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v27 = v26;
  v47[1] = v25;
  v47[0] = sub_1CFBFA894();

  v28 = objc_msgSend(v19, sel_parityControlType);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v29 = v28;
  swift_bridgeObjectRelease();
  v30 = sub_1CFBFA894();
  v32 = v31;

  sub_1CFBFA6CC();
  sub_1CFBFA69C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v48);
  v33 = sub_1CFBF8A9C(v30, v32);
  swift_bridgeObjectRelease();
  v34 = objc_allocWithZone(MEMORY[0x1E0D14818]);
  v35 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v36 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v37 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v38 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v34, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v35, v36, v33, v37, v38);

  v40 = v49;
LABEL_10:
  objc_msgSend(v16, sel_addIconDataSource_, v39);
  v45 = v16;
  objc_msgSend(v45, sel_setGridSizeClass_, v50);

  swift_unknownObjectRelease();
  return v45;
}

void *sub_1CFBF6548(void *a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  uint8_t *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  _QWORD *v48;
  id v49;
  id v50;
  void *v51;
  uint8_t *v52;
  id v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  void *v61;
  uint8_t *v62;
  id v63;
  _QWORD *v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v79;
  void *v80;
  _QWORD *v81;
  id v82;
  id v83[2];

  v83[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = sub_1CFBF88F8();
  v7 = v6;
  v9 = v8;
  v10 = objc_allocWithZone(MEMORY[0x1E0DAA640]);
  v11 = v7;
  v12 = (void *)sub_1CFBFA870();
  v13 = (void *)sub_1CFBFA870();
  v14 = objc_msgSend(v10, sel_initWithUniqueIdentifier_displayName_maxListCount_listGridSize_iconGridSizeClassSizes_, v12, v13, 15, v5, v11);

  objc_msgSend(v14, sel_setListAllowedGridSizeClasses_, v9);
  v15 = (void *)objc_opt_self();
  v16 = v14;
  v17 = objc_msgSend(v15, sel_controlCenterDomain);
  objc_msgSend(v16, sel_setGridSizeClassDomain_, v17);

  objc_msgSend(v16, sel_setListsAllowRotatedLayout_, 0);
  sub_1CFBF5920(v16, a2);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAA4B8]), sel_initWithRootNode_, v16);
  objc_msgSend(v18, sel_setDelegate_, v2);
  v83[0] = 0;
  v19 = objc_msgSend(v18, sel_archiveWithError_, v83);
  v20 = v83[0];
  if (v19)
  {
    v21 = v19;
    v80 = v9;
    sub_1CFBFA84C();
    v22 = v20;

    v23 = sub_1CFBF8048();
    v24 = (void *)sub_1CFBFA840();
    v83[0] = 0;
    v25 = objc_msgSend(v23, sel_saveCurrentIconState_error_, v24, v83);

    v26 = &unk_1ED90A000;
    v82 = v11;
    if (v25)
    {
      v27 = qword_1ED90AD00;
      v28 = v83[0];
      if (v27 != -1)
        swift_once();
      v29 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v29, (uint64_t)qword_1ED90ACE0);
      v30 = sub_1CFBFA78C();
      v31 = sub_1CFBFA9F0();
      v32 = v9;
      if (os_log_type_enabled(v30, v31))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1CFB7D000, v30, v31, "Save current icon state to plist succeeded", v33, 2u);
        MEMORY[0x1D17DBCE8](v33, -1, -1);
      }

    }
    else
    {
      v40 = v83[0];
      v41 = (void *)sub_1CFBFA5E8();

      swift_willThrow();
      if (qword_1ED90AD00 != -1)
        swift_once();
      v42 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v42, (uint64_t)qword_1ED90ACE0);
      v43 = v41;
      v44 = v41;
      v45 = sub_1CFBFA78C();
      v46 = sub_1CFBFA9D8();
      if (os_log_type_enabled(v45, v46))
      {
        v79 = a1;
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v47 = 138412290;
        v49 = v41;
        v50 = v18;
        v51 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v83[0] = v51;
        sub_1CFBFABD0();
        *v48 = v51;
        v18 = v50;
        v26 = (_QWORD *)&unk_1ED90A000;

        _os_log_impl(&dword_1CFB7D000, v45, v46, "Save current icon state to plist failed because %@", v47, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
        swift_arrayDestroy();
        MEMORY[0x1D17DBCE8](v48, -1, -1);
        v52 = v47;
        a1 = v79;
        MEMORY[0x1D17DBCE8](v52, -1, -1);

      }
      else
      {

      }
      v32 = v80;
    }
    v53 = sub_1CFBF8048();
    v54 = (void *)sub_1CFBFA840();
    swift_bridgeObjectRelease();
    v83[0] = 0;
    v55 = objc_msgSend(v53, sel_saveDesiredIconState_error_, v54, v83);

    if (v55)
    {
      v56 = v26[416];
      v57 = v83[0];
      if (v56 != -1)
        swift_once();
      v58 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v58, (uint64_t)qword_1ED90ACE0);
      v59 = sub_1CFBFA78C();
      v60 = sub_1CFBFA9F0();
      v61 = v82;
      if (os_log_type_enabled(v59, v60))
      {
        v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_1CFB7D000, v59, v60, "Save desired icon state to plist succeeded", v62, 2u);
        MEMORY[0x1D17DBCE8](v62, -1, -1);
      }

    }
    else
    {
      v63 = v83[0];
      v64 = v26;
      v65 = (void *)sub_1CFBFA5E8();

      swift_willThrow();
      if (v64[416] != -1)
        swift_once();
      v66 = sub_1CFBFA7A4();
      __swift_project_value_buffer(v66, (uint64_t)qword_1ED90ACE0);
      v67 = v65;
      v68 = v65;
      v69 = sub_1CFBFA78C();
      v70 = sub_1CFBFA9D8();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = (uint8_t *)swift_slowAlloc();
        v81 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v71 = 138412290;
        v72 = v65;
        v73 = v32;
        v74 = v18;
        v75 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v83[0] = v75;
        sub_1CFBFABD0();
        *v81 = v75;
        v18 = v74;
        v32 = v73;

        _os_log_impl(&dword_1CFB7D000, v69, v70, "Save desired icon state to plist failed because %@", v71, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DE0);
        swift_arrayDestroy();
        MEMORY[0x1D17DBCE8](v81, -1, -1);
        MEMORY[0x1D17DBCE8](v71, -1, -1);

      }
      else
      {

      }
      v61 = v82;
    }
    v76 = sub_1CFBF8048();
    objc_msgSend(a1, sel_setStore_, v76);

    v77 = a1;
  }
  else
  {
    v34 = v83[0];
    v35 = (void *)sub_1CFBFA5E8();

    swift_willThrow();
    if (qword_1ED90AD00 != -1)
      swift_once();
    v36 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v36, (uint64_t)qword_1ED90ACE0);
    v37 = sub_1CFBFA78C();
    v38 = sub_1CFBFA9D8();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_1CFB7D000, v37, v38, "Fail to archive migrated control center folder.", v39, 2u);
      MEMORY[0x1D17DBCE8](v39, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return a1;
}

id sub_1CFBF6E50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  __int128 *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  char v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[7];
  id v78;
  unint64_t v79;
  unint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  v2 = v1;
  v4 = sub_1CFBFA6D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = 0x73746E656D656C65;
  v80 = 0xE800000000000000;
  sub_1CFBFAC78();
  if (*(_QWORD *)(a1 + 16) && (v8 = sub_1CFBBEF1C((uint64_t)&v81), (v9 & 1) != 0))
  {
    sub_1CFBC1384(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)&v83);
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  sub_1CFBBFAA4((uint64_t)&v81);
  if (!*((_QWORD *)&v84 + 1))
    goto LABEL_85;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AD50);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  if (*(_QWORD *)(v79 + 16))
  {
    sub_1CFBC1384(v79 + 32, (uint64_t)&v81);
  }
  else
  {
    v81 = 0u;
    v82 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v82 + 1))
  {
    v13 = &v81;
LABEL_86:
    sub_1CFBE7CCC((uint64_t)v13, &qword_1ED90AF00);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AD28);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v10 = v83;
  v79 = 0x54746E656D656C65;
  v80 = 0xEB00000000657079;
  sub_1CFBFAC78();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_1CFBBEF1C((uint64_t)&v81), (v12 & 1) != 0))
  {
    sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)&v83);
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  sub_1CFBBFAA4((uint64_t)&v81);
  if (!*((_QWORD *)&v84 + 1))
  {
LABEL_84:
    swift_bridgeObjectRelease();
LABEL_85:
    v13 = &v83;
    goto LABEL_86;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_104;
  v15 = v79;
  v14 = v80;
  if ((v79 != 0x656C75646F6DLL || v80 != 0xE600000000000000) && (sub_1CFBFAD8C() & 1) == 0)
  {
    if (v15 == 0x6C6F72746E6F63 && v14 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = sub_1CFBFAD8C();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
        goto LABEL_104;
    }
    v79 = 0xD00000000000001ALL;
    v80 = 0x80000001CFC04070;
    sub_1CFBFAC78();
    if (*(_QWORD *)(v10 + 16) && (v23 = sub_1CFBBEF1C((uint64_t)&v81), (v24 & 1) != 0))
    {
      sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v83);
    }
    else
    {
      v83 = 0u;
      v84 = 0u;
    }
    sub_1CFBBFAA4((uint64_t)&v81);
    if (!*((_QWORD *)&v84 + 1))
      goto LABEL_84;
    if ((swift_dynamicCast() & 1) != 0)
    {
      v79 = 0xD000000000000019;
      v80 = 0x80000001CFC04030;
      sub_1CFBFAC78();
      if (*(_QWORD *)(v10 + 16) && (v25 = sub_1CFBBEF1C((uint64_t)&v81), (v26 & 1) != 0))
      {
        sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v25, (uint64_t)&v83);
      }
      else
      {
        v83 = 0u;
        v84 = 0u;
      }
      sub_1CFBBFAA4((uint64_t)&v81);
      if (!*((_QWORD *)&v84 + 1))
        goto LABEL_83;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_103;
      v79 = 0xD000000000000019;
      v80 = 0x80000001CFC04050;
      sub_1CFBFAC78();
      if (*(_QWORD *)(v10 + 16) && (v50 = sub_1CFBBEF1C((uint64_t)&v81), (v51 & 1) != 0))
      {
        sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v50, (uint64_t)&v83);
      }
      else
      {
        v83 = 0u;
        v84 = 0u;
      }
      sub_1CFBBFAA4((uint64_t)&v81);
      if (*((_QWORD *)&v84 + 1))
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
LABEL_102:
          swift_bridgeObjectRelease();
LABEL_103:
          swift_bridgeObjectRelease();
          goto LABEL_104;
        }
        v79 = 0x546C6F72746E6F63;
        v80 = 0xEB00000000657079;
        sub_1CFBFAC78();
        if (*(_QWORD *)(v10 + 16) && (v52 = sub_1CFBBEF1C((uint64_t)&v81), (v53 & 1) != 0))
        {
          sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v52, (uint64_t)&v83);
        }
        else
        {
          v83 = 0u;
          v84 = 0u;
        }
        sub_1CFBBFAA4((uint64_t)&v81);
        if (*((_QWORD *)&v84 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v55 = v79;
            v54 = v80;
            v79 = 0x4B6C6F72746E6F63;
            v80 = 0xEB00000000646E69;
            sub_1CFBFAC78();
            if (*(_QWORD *)(v10 + 16) && (v56 = sub_1CFBBEF1C((uint64_t)&v81), (v57 & 1) != 0))
            {
              sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v56, (uint64_t)&v83);
            }
            else
            {
              v83 = 0u;
              v84 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_1CFBBFAA4((uint64_t)&v81);
            if (*((_QWORD *)&v84 + 1))
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v71 = sub_1CFBF8A9C(v55, v54);
                swift_bridgeObjectRelease();
                v72 = objc_allocWithZone(MEMORY[0x1E0D14818]);
                v73 = (void *)sub_1CFBFA870();
                swift_bridgeObjectRelease();
                v74 = (void *)sub_1CFBFA870();
                swift_bridgeObjectRelease();
                v75 = (void *)sub_1CFBFA870();
                swift_bridgeObjectRelease();
                v76 = (void *)sub_1CFBFA870();
                swift_bridgeObjectRelease();
                v49 = objc_msgSend(v72, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v73, v74, v71, v75, v76);

                return v49;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return 0;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_84;
          }
          swift_bridgeObjectRelease();
          goto LABEL_102;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
LABEL_83:
      swift_bridgeObjectRelease();
      goto LABEL_84;
    }
LABEL_104:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  v79 = 0xD000000000000010;
  v80 = 0x80000001CFC04010;
  sub_1CFBFAC78();
  if (*(_QWORD *)(v10 + 16) && (v16 = sub_1CFBBEF1C((uint64_t)&v81), (v17 & 1) != 0))
  {
    sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v16, (uint64_t)&v83);
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  sub_1CFBBFAA4((uint64_t)&v81);
  if (!*((_QWORD *)&v84 + 1))
    goto LABEL_84;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_104;
  v79 = 0xD000000000000019;
  v80 = 0x80000001CFC04050;
  sub_1CFBFAC78();
  if (*(_QWORD *)(v10 + 16) && (v18 = sub_1CFBBEF1C((uint64_t)&v81), (v19 & 1) != 0))
  {
    sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v18, (uint64_t)&v83);
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  sub_1CFBBFAA4((uint64_t)&v81);
  if (!*((_QWORD *)&v84 + 1))
    goto LABEL_83;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_103;
  v78 = (id)v79;
  v79 = 0xD00000000000001ALL;
  v80 = 0x80000001CFC04070;
  sub_1CFBFAC78();
  if (*(_QWORD *)(v10 + 16) && (v20 = sub_1CFBBEF1C((uint64_t)&v81), (v21 & 1) != 0))
  {
    sub_1CFBC1384(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v83);
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1CFBBFAA4((uint64_t)&v81);
  if (!*((_QWORD *)&v84 + 1))
    goto LABEL_83;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  v77[5] = v79;
  v77[6] = v80;
  v27 = *(void **)(v2 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager);
  v28 = (void *)sub_1CFBFA870();
  v29 = objc_msgSend(v27, sel_moduleSettingsForModuleIdentifier_, v28);

  v30 = objc_msgSend(v29, sel_parityControlExtensionIdentifier);
  if (v30)
  {
    v31 = v30;
    v77[4] = sub_1CFBFA894();

    v32 = objc_msgSend(v29, sel_parityControlContainerBundleIdentifier);
    if (v32)
    {
      v33 = v32;
      v77[2] = sub_1CFBFA894();
      v77[3] = v34;

      v35 = objc_msgSend(v29, sel_parityControlKind);
      if (v35)
      {
        v36 = v35;
        v77[0] = sub_1CFBFA894();
        v77[1] = v37;

        v38 = objc_msgSend(v29, sel_parityControlType);
        if (v38)
        {
          v39 = v38;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v40 = sub_1CFBFA894();
          v42 = v41;

          sub_1CFBFA6CC();
          v78 = v29;
          sub_1CFBFA69C();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          v43 = sub_1CFBF8A9C(v40, v42);
          swift_bridgeObjectRelease();
          v44 = objc_allocWithZone(MEMORY[0x1E0D14818]);
          v45 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v46 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v47 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v48 = (void *)sub_1CFBFA870();
          swift_bridgeObjectRelease();
          v49 = objc_msgSend(v44, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v45, v46, v43, v47, v48);

          *(_BYTE *)(v2 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_iconStateDirty) = 1;
          return v49;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  CCUIDefaultSupportedGridSizeClassesForChronoControls();
  v59 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();
  v60 = *(void **)(v2 + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager);
  v61 = (void *)sub_1CFBFA870();
  v62 = (void *)sub_1CFBFA870();
  v63 = objc_msgSend(v60, sel_obtainModuleWithBundleIdentifier_uniqueIdentifier_, v61, v62);

  if (v63)
  {
    v64 = objc_msgSend(v63, sel_module);
    if ((objc_msgSend(v64, sel_respondsToSelector_, sel_supportedGridSizeClasses) & 1) != 0)
    {
      objc_msgSend(v64, sel_supportedGridSizeClasses);
      v65 = (id)SBHIconGridSizeClassSetForCCUIGridSizeClassMask();

      v59 = v65;
    }
    if ((objc_msgSend(v64, sel_respondsToSelector_, sel_expandsGridSizeClassesForAccessibility) & 1) != 0)
      v66 = objc_msgSend(v64, sel_expandsGridSizeClassesForAccessibility);
    else
      v66 = 0;

    swift_unknownObjectRelease();
  }
  else
  {
    v66 = 0;
  }
  v67 = objc_allocWithZone(MEMORY[0x1E0D14820]);
  v68 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v69 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v70 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  v49 = objc_msgSend(v67, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v68, v69, v70, v59, v66);

  return v49;
}

id sub_1CFBF7BD4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlsIconModelLoader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlsIconModelLoader()
{
  return objc_opt_self();
}

id sub_1CFBF8048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  id v16;
  char *v17;
  id v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v0 = sub_1CFBFA60C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_1CFBFA648();
  v26 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v28 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v24 - v6;
  MEMORY[0x1E0C80A78](v8);
  v27 = (char *)&v24 - v9;
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel__configurationDirectoryURL);
  sub_1CFBFA624();

  v30 = 0xD000000000000017;
  v31 = 0x80000001CFC07E90;
  v12 = *MEMORY[0x1E0CAFD78];
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v25(v3, v12, v0);
  sub_1CFBF9860();
  sub_1CFBFA63C();
  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v3, v0);
  swift_bridgeObjectRelease();
  v14 = *(void (**)(char *, uint64_t))(v26 + 8);
  v15 = v29;
  v14(v7, v29);
  v16 = objc_msgSend(v10, sel__configurationDirectoryURL);
  v17 = v28;
  sub_1CFBFA624();

  v30 = 0xD00000000000001ELL;
  v31 = 0x80000001CFC07EB0;
  v25(v3, v12, v0);
  sub_1CFBFA63C();
  v13(v3, v0);
  swift_bridgeObjectRelease();
  v14(v17, v15);
  v18 = objc_allocWithZone(MEMORY[0x1E0DAA610]);
  v19 = v27;
  v20 = (void *)sub_1CFBFA618();
  v21 = (void *)sub_1CFBFA618();
  v22 = objc_msgSend(v18, sel_initWithIconStateURL_desiredIconStateURL_, v20, v21);

  v14(v7, v15);
  v14(v19, v15);
  return v22;
}

uint64_t sub_1CFBF8314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v1 = sub_1CFBFA60C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CFBFA648();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v17 - v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel__configurationDirectoryURL);
  sub_1CFBFA624();

  v17[1] = 0xD00000000000001FLL;
  v17[2] = 0x80000001CFC07FF0;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAFD78], v1);
  sub_1CFBF9860();
  sub_1CFBFA63C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  sub_1CFBFA654();
  if (!v0)
  {
    v15 = v14;
    v13(v11, v5);
    __asm { BR              X10 }
  }
  v13(v11, v5);
  return v5;
}

uint64_t sub_1CFBF8668(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void (*v20)(char *, uint64_t);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25[3];

  v25[2] = *(id *)MEMORY[0x1E0C80C00];
  v2 = sub_1CFBFA60C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CFBFA648();
  v24 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - v10;
  v12 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v13 = sub_1CFBFAD80();
  v25[0] = 0;
  v14 = objc_msgSend(v12, sel_dataWithPropertyList_format_options_error_, v13, 100, 0, v25);
  swift_unknownObjectRelease();
  v15 = v25[0];
  if (v14)
  {
    v16 = sub_1CFBFA678();
    v18 = v17;

    v19 = objc_msgSend((id)objc_opt_self(), sel__configurationDirectoryURL);
    sub_1CFBFA624();

    v25[0] = (id)0xD00000000000001FLL;
    v25[1] = (id)0x80000001CFC07FF0;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAFD78], v2);
    sub_1CFBF9860();
    sub_1CFBFA63C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    v20 = *(void (**)(char *, uint64_t))(v24 + 8);
    v20(v8, v6);
    sub_1CFBFA684();
    v20(v11, v6);
    return sub_1CFBCCE3C(v16, v18);
  }
  else
  {
    v22 = v15;
    sub_1CFBFA5E8();

    return swift_willThrow();
  }
}

uint64_t sub_1CFBF88F8()
{
  id v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  int v7;
  id v8;
  uint64_t result;

  v0 = objc_msgSend((id)type metadata accessor for IconListRootFolderController(), sel_iconLocation);
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IconListLayoutProvider()), sel_init);
  v2 = objc_msgSend(v1, sel_layoutForIconLocation_, v0);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_numberOfColumnsForOrientation_, 1);
    if ((unint64_t)v4 >= 0x10000)
      goto LABEL_10;
    v5 = (int)v4;
    v6 = objc_msgSend(v3, sel_numberOfRowsForOrientation_, 1);
    if ((unint64_t)v6 >= 0x10000)
      goto LABEL_10;
    v7 = (int)v6;
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_iconGridSizeClassSizes) & 1) != 0)
    {
      objc_msgSend(v3, sel_iconGridSizeClassSizes);
      if ((objc_msgSend(v3, sel_respondsToSelector_, sel_supportedIconGridSizeClasses) & 1) != 0)
      {
        v8 = objc_msgSend(v3, sel_supportedIconGridSizeClasses);

        swift_unknownObjectRelease();
        return v5 | (v7 << 16);
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_9:
  __break(1u);
LABEL_10:
  result = sub_1CFBFAD08();
  __break(1u);
  return result;
}

uint64_t sub_1CFBF8A9C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E776F6E6B6E55 && a2 == 0xE700000000000000)
    return 0;
  if ((sub_1CFBFAD8C() & 1) != 0)
    return 0;
  if (a1 == 0x656C67676F54 && a2 == 0xE600000000000000 || (sub_1CFBFAD8C() & 1) != 0)
    return 1;
  if (a1 == 0x6E6F74747542 && a2 == 0xE600000000000000 || (sub_1CFBFAD8C() & 1) != 0)
    return 2;
  if (a1 == 0x72656B636950 && a2 == 0xE600000000000000)
    return 3;
  if ((sub_1CFBFAD8C() & 1) != 0)
    return 3;
  return 0;
}

void sub_1CFBF8C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void (*v13)(char *, uint64_t);
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  id v24[3];

  v24[2] = *(id *)MEMORY[0x1E0C80C00];
  v0 = sub_1CFBFA60C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v24[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CFBFA648();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v24[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v24[-1] - v9;
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = objc_msgSend((id)objc_opt_self(), sel__configurationDirectoryURL);
  sub_1CFBFA624();

  v24[0] = (id)0xD000000000000017;
  v24[1] = (id)0x80000001CFC08040;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAFD78], v0);
  sub_1CFBF9860();
  sub_1CFBFA63C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  sub_1CFBFA630();
  v13(v10, v4);
  v14 = (void *)sub_1CFBFA870();
  LODWORD(v10) = objc_msgSend(v11, sel_fileExistsAtPath_, v14);

  if ((_DWORD)v10)
  {
    v15 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
    v24[0] = 0;
    v16 = objc_msgSend(v11, sel_removeItemAtPath_error_, v15, v24);

    if (v16)
    {
      v17 = v24[0];
    }
    else
    {
      v22 = v24[0];
      sub_1CFBFA5E8();

      swift_willThrow();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_1ED90AD00 != -1)
      swift_once();
    v18 = sub_1CFBFA7A4();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED90ACE0);
    v19 = sub_1CFBFA78C();
    v20 = sub_1CFBFA9F0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1CFB7D000, v19, v20, "No old migration settings", v21, 2u);
      MEMORY[0x1D17DBCE8](v21, -1, -1);
    }

  }
}

void sub_1CFBF8F54()
{
  sub_1CFBF8C00();
}

uint64_t sub_1CFBF912C()
{
  unint64_t v0;

  v0 = sub_1CFBFAD74();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB)
    return 11;
  else
    return v0;
}

uint64_t sub_1CFBF9174()
{
  unint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  unint64_t v61;
  _OWORD v62[2];
  __int128 v63;
  uint64_t v64;
  unint64_t v65;

  v0 = sub_1CFBBB33C(MEMORY[0x1E0DEE9D8]);
  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = MEMORY[0x1E0DEA968];
    v64 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v63 = 0x656C75646F6DLL;
    *((_QWORD *)&v63 + 1) = 0xE600000000000000;
    sub_1CFBBFA58(&v63, v62);
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v65 = v0;
    sub_1CFBCB0B8(v62, 0x54746E656D656C65, 0xEB00000000657079, isUniquelyReferenced_nonNull_native);
    v5 = v65;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v2, sel_uniqueIdentifier);
    v7 = sub_1CFBFA894();
    v9 = v8;

    v64 = v3;
    *(_QWORD *)&v63 = v7;
    *((_QWORD *)&v63 + 1) = v9;
    sub_1CFBBFA58(&v63, v62);
    v10 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v5;
    sub_1CFBCB0B8(v62, 0xD00000000000001ALL, 0x80000001CFC04070, v10);
    v11 = v65;
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v2, sel_moduleIdentifier);
    v13 = sub_1CFBFA894();
    v15 = v14;

    v64 = v3;
    *(_QWORD *)&v63 = v13;
    *((_QWORD *)&v63 + 1) = v15;
    sub_1CFBBFA58(&v63, v62);
    v16 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v11;
    sub_1CFBCB0B8(v62, 0xD000000000000010, 0x80000001CFC04010, v16);
    v17 = v65;
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v2, sel_containerBundleIdentifier);
    v19 = sub_1CFBFA894();
    v21 = v20;

    v64 = v3;
    *(_QWORD *)&v63 = v19;
    *((_QWORD *)&v63 + 1) = v21;
    sub_1CFBBFA58(&v63, v62);
    v22 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v17;
    sub_1CFBCB0B8(v62, 0xD000000000000019, 0x80000001CFC04050, v22);
    v0 = v65;
LABEL_20:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    v24 = (void *)v23;
    v25 = MEMORY[0x1E0DEA968];
    v64 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v63 = 0x6C6F72746E6F63;
    *((_QWORD *)&v63 + 1) = 0xE700000000000000;
    sub_1CFBBFA58(&v63, v62);
    swift_unknownObjectRetain();
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v0;
    sub_1CFBCB0B8(v62, 0x54746E656D656C65, 0xEB00000000657079, v26);
    v27 = v65;
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v24, sel_uniqueIdentifier);
    v29 = sub_1CFBFA894();
    v31 = v30;

    v64 = v25;
    *(_QWORD *)&v63 = v29;
    *((_QWORD *)&v63 + 1) = v31;
    sub_1CFBBFA58(&v63, v62);
    v32 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v27;
    sub_1CFBCB0B8(v62, 0xD00000000000001ALL, 0x80000001CFC04070, v32);
    v33 = v65;
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v24, sel_extensionBundleIdentifier);
    v35 = sub_1CFBFA894();
    v37 = v36;

    v64 = v25;
    *(_QWORD *)&v63 = v35;
    *((_QWORD *)&v63 + 1) = v37;
    sub_1CFBBFA58(&v63, v62);
    v38 = swift_isUniquelyReferenced_nonNull_native();
    v61 = v33;
    sub_1CFBCB0B8(v62, 0xD000000000000019, 0x80000001CFC04030, v38);
    v65 = v33;
    swift_bridgeObjectRelease();
    v39 = objc_msgSend(v24, sel_containerBundleIdentifier);
    if (v39)
    {
      v40 = v39;
      v41 = sub_1CFBFA894();
      v43 = v42;

      v64 = v25;
      *(_QWORD *)&v63 = v41;
      *((_QWORD *)&v63 + 1) = v43;
      sub_1CFBBFA58(&v63, v62);
      v44 = swift_isUniquelyReferenced_nonNull_native();
      v61 = v33;
      sub_1CFBCB0B8(v62, 0xD000000000000019, 0x80000001CFC04050, v44);
      v65 = v33;
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1CFBC7F74(0xD000000000000019, 0x80000001CFC04050, &v63);
      sub_1CFBE7CCC((uint64_t)&v63, &qword_1ED90AF00);
    }
    v49 = objc_msgSend(v24, sel_controlType, v61);
    if (v49 == (id)3)
    {
      v50 = 0xE600000000000000;
      v51 = 0x72656B636950;
    }
    else if (v49 == (id)2)
    {
      v50 = 0xE600000000000000;
      v51 = 0x6E6F74747542;
    }
    else if (v49 == (id)1)
    {
      v50 = 0xE600000000000000;
      v51 = 0x656C67676F54;
    }
    else
    {
      v50 = 0xE700000000000000;
      v51 = 0x6E776F6E6B6E55;
    }
    v64 = v25;
    *(_QWORD *)&v63 = v51;
    *((_QWORD *)&v63 + 1) = v50;
    sub_1CFBBFA58(&v63, v62);
    v52 = v65;
    v53 = swift_isUniquelyReferenced_nonNull_native();
    sub_1CFBCB0B8(v62, 0x546C6F72746E6F63, 0xEB00000000657079, v53);
    swift_bridgeObjectRelease();
    v54 = objc_msgSend(v24, sel_kind);
    v55 = sub_1CFBFA894();
    v57 = v56;

    v64 = v25;
    *(_QWORD *)&v63 = v55;
    *((_QWORD *)&v63 + 1) = v57;
    sub_1CFBBFA58(&v63, v62);
    v58 = swift_isUniquelyReferenced_nonNull_native();
    sub_1CFBCB0B8(v62, 0x4B6C6F72746E6F63, 0xEB00000000646E69, v58);
    v0 = v52;
    goto LABEL_20;
  }
  if (qword_1ED90AD00 != -1)
    swift_once();
  v45 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v45, (uint64_t)qword_1ED90ACE0);
  v46 = sub_1CFBFA78C();
  v47 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_1CFB7D000, v46, v47, "Unable to archive icon data source.", v48, 2u);
    MEMORY[0x1D17DBCE8](v48, -1, -1);
  }

LABEL_21:
  v59 = sub_1CFBF4558(v0);
  swift_bridgeObjectRelease();
  return v59;
}

unint64_t sub_1CFBF9860()
{
  unint64_t result;

  result = qword_1ED90AD18;
  if (!qword_1ED90AD18)
  {
    result = MEMORY[0x1D17DBC58](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED90AD18);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1CFBF98C8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1CFBF98EC(void *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  sub_1CFBF52D0(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE **)(v3 + 32));
}

uint64_t sub_1CFBF98F8()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

unint64_t sub_1CFBF9920()
{
  unint64_t result;

  result = qword_1ED90AFA8;
  if (!qword_1ED90AFA8)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC02880, &type metadata for ControlsIconModelLoader.ArchivingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED90AFA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ControlsIconModelLoader.ArchivingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsIconModelLoader.ArchivingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_1CFBF9A40 + 4 * byte_1CFC027D0[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_1CFBF9A74 + 4 * byte_1CFC027CB[v4]))();
}

uint64_t sub_1CFBF9A74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF9A7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFBF9A84);
  return result;
}

uint64_t sub_1CFBF9A90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFBF9A98);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_1CFBF9A9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFBF9AA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ControlsIconModelLoader.ArchivingKeys()
{
  return &type metadata for ControlsIconModelLoader.ArchivingKeys;
}

unint64_t sub_1CFBF9AC4()
{
  unint64_t result;

  result = qword_1ED90AFB8;
  if (!qword_1ED90AFB8)
  {
    result = MEMORY[0x1D17DBC58](&unk_1CFC02858, &type metadata for ControlsIconModelLoader.ArchivingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED90AFB8);
  }
  return result;
}

id sub_1CFBF9BAC(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews;
  v4 = (void *)objc_opt_self();
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_weakObjectsHashTable);

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ControlDragWindow();
  v6 = objc_msgSendSuper2(&v12, sel_initWithWindowScene_, a1);
  type metadata accessor for ControlDragWindow.ControlDragViewController();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v8 = v6;
  v9 = objc_msgSend(v7, sel_init);
  objc_msgSend(v8, sel_setRootViewController_, v9);

  objc_msgSend(v8, sel_setWindowLevel_, *MEMORY[0x1E0DC5630] + -4.0);
  v10 = v8;
  objc_msgSend(v10, sel_setUserInteractionEnabled_, 0);

  return v10;
}

id sub_1CFBF9F50()
{
  return sub_1CFBEDC88(0, type metadata accessor for ControlDragWindow.ControlDragViewController);
}

void sub_1CFBF9F80()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1CFBF9FA0(uint64_t a1)
{
  return sub_1CFBEDC88(a1, type metadata accessor for ControlDragWindow);
}

uint64_t type metadata accessor for ControlDragWindow()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ControlDragWindow.ControlDragViewController()
{
  return objc_opt_self();
}

void CCUIIconImageForApplicationIdentifier_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFB7D000, log, OS_LOG_TYPE_ERROR, "Trying to retrieve an icon for some Unknown attribution. There is a nil applicationIdentifier.", v1, 2u);
}

void CCUIIconImageForApplicationIdentifier_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFB7D000, a2, a3, "Failed to obtain ISImage for application ID '%{public}@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CCUIIconImageForApplicationIdentifier_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CFB7D000, v0, v1, "Failed to retrieve bundle record for bundle ID '%{public}@': %{public}@");
  OUTLINED_FUNCTION_1();
}

void CCUIIconImageForApplicationIdentifier_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CFB7D000, v0, v1, "Failed to retrieve bundle record for application ID '%{public}@': %{public}@ – Attempting retrieval via bundle ID.");
  OUTLINED_FUNCTION_1();
}

void CCUIIconImageForUntreatedImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFB7D000, a2, a3, "Failed to obtain ISImage for raw input image %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CFBFA5AC()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_1CFBFA5B8()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_1CFBFA5C4()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1CFBFA5D0()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_1CFBFA5DC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CFBFA5E8()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CFBFA5F4()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1CFBFA600()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1CFBFA60C()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1CFBFA618()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CFBFA624()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1CFBFA630()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1CFBFA63C()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1CFBFA648()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CFBFA654()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1CFBFA660()
{
  return MEMORY[0x1E0CB0118]();
}

uint64_t sub_1CFBFA66C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CFBFA678()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CFBFA684()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1CFBFA690()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1CFBFA69C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CFBFA6A8()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1CFBFA6B4()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1CFBFA6C0()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CFBFA6CC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CFBFA6D8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CFBFA6E4()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1CFBFA6F0()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1CFBFA6FC()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1CFBFA708()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1CFBFA714()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1CFBFA720()
{
  return MEMORY[0x1E0D25CA8]();
}

uint64_t sub_1CFBFA72C()
{
  return MEMORY[0x1E0D25CB0]();
}

uint64_t sub_1CFBFA738()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1CFBFA744()
{
  return MEMORY[0x1E0D0F938]();
}

uint64_t sub_1CFBFA750()
{
  return MEMORY[0x1E0D0F940]();
}

uint64_t sub_1CFBFA75C()
{
  return MEMORY[0x1E0D0F9B0]();
}

uint64_t sub_1CFBFA768()
{
  return MEMORY[0x1E0D147E0]();
}

uint64_t sub_1CFBFA774()
{
  return MEMORY[0x1E0D147E8]();
}

uint64_t sub_1CFBFA780()
{
  return MEMORY[0x1E0D145B0]();
}

uint64_t sub_1CFBFA78C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CFBFA798()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CFBFA7A4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CFBFA7B0()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1CFBFA7BC()
{
  return MEMORY[0x1E0DC2A28]();
}

uint64_t sub_1CFBFA7C8()
{
  return MEMORY[0x1E0DC2A38]();
}

uint64_t sub_1CFBFA7D4()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CFBFA7E0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CFBFA7EC()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1CFBFA7F8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CFBFA804()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1CFBFA810()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1CFBFA81C()
{
  return MEMORY[0x1E0CF0188]();
}

uint64_t sub_1CFBFA828()
{
  return MEMORY[0x1E0CF0190]();
}

uint64_t sub_1CFBFA834()
{
  return MEMORY[0x1E0CF0198]();
}

uint64_t sub_1CFBFA840()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CFBFA84C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CFBFA858()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1CFBFA864()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CFBFA870()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CFBFA87C()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CFBFA888()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CFBFA894()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CFBFA8A0()
{
  return MEMORY[0x1E0D145B8]();
}

uint64_t sub_1CFBFA8AC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CFBFA8B8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CFBFA8C4()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1CFBFA8D0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CFBFA8DC()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1CFBFA8E8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CFBFA8F4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CFBFA900()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CFBFA90C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CFBFA918()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CFBFA924()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CFBFA930()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CFBFA93C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CFBFA948()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1CFBFA954()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1CFBFA960()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CFBFA96C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CFBFA978()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1CFBFA984()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1CFBFA990()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CFBFA99C()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1CFBFA9A8()
{
  return MEMORY[0x1E0DAA378]();
}

uint64_t sub_1CFBFA9B4()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t sub_1CFBFA9C0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CFBFA9CC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CFBFA9D8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CFBFA9E4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CFBFA9F0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CFBFA9FC()
{
  return MEMORY[0x1E0DAA380]();
}

uint64_t sub_1CFBFAA08()
{
  return MEMORY[0x1E0DAA388]();
}

uint64_t sub_1CFBFAA14()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_1CFBFAA20()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1CFBFAA2C()
{
  return MEMORY[0x1E0DEF7F0]();
}

uint64_t sub_1CFBFAA38()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CFBFAA44()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CFBFAA50()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CFBFAA5C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CFBFAA68()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CFBFAA74()
{
  return MEMORY[0x1E0D0FE20]();
}

uint64_t sub_1CFBFAA80()
{
  return MEMORY[0x1E0D0FE48]();
}

uint64_t sub_1CFBFAA8C()
{
  return MEMORY[0x1E0D147F0]();
}

uint64_t sub_1CFBFAA98()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1CFBFAAA4()
{
  return MEMORY[0x1E0D147F8]();
}

uint64_t sub_1CFBFAAB0()
{
  return MEMORY[0x1E0D14800]();
}

uint64_t sub_1CFBFAABC()
{
  return MEMORY[0x1E0D0FE78]();
}

uint64_t sub_1CFBFAAC8()
{
  return MEMORY[0x1E0D14808]();
}

uint64_t sub_1CFBFAAD4()
{
  return MEMORY[0x1E0CB1FC0]();
}

uint64_t sub_1CFBFAAE0()
{
  return MEMORY[0x1E0CB1FC8]();
}

uint64_t sub_1CFBFAAEC()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1CFBFAAF8()
{
  return MEMORY[0x1E0DC2FC8]();
}

uint64_t sub_1CFBFAB04()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CFBFAB10()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CFBFAB1C()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1CFBFAB28()
{
  return MEMORY[0x1E0DC3008]();
}

uint64_t sub_1CFBFAB34()
{
  return MEMORY[0x1E0DC3090]();
}

uint64_t sub_1CFBFAB40()
{
  return MEMORY[0x1E0DC3140]();
}

uint64_t sub_1CFBFAB4C()
{
  return MEMORY[0x1E0DC3148]();
}

uint64_t sub_1CFBFAB58()
{
  return MEMORY[0x1E0DC3170]();
}

uint64_t sub_1CFBFAB64()
{
  return MEMORY[0x1E0DC31B8]();
}

uint64_t sub_1CFBFAB70()
{
  return MEMORY[0x1E0DC31C0]();
}

uint64_t sub_1CFBFAB7C()
{
  return MEMORY[0x1E0DC31D0]();
}

uint64_t sub_1CFBFAB88()
{
  return MEMORY[0x1E0DC31E8]();
}

uint64_t sub_1CFBFAB94()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_1CFBFABA0()
{
  return MEMORY[0x1E0DC3240]();
}

uint64_t sub_1CFBFABAC()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_1CFBFABB8()
{
  return MEMORY[0x1E0DC3258]();
}

uint64_t sub_1CFBFABC4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CFBFABD0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CFBFABDC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CFBFABE8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CFBFABF4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CFBFAC00()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CFBFAC0C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CFBFAC18()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CFBFAC24()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1CFBFAC30()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1CFBFAC3C()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1CFBFAC48()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1CFBFAC54()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1CFBFAC60()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CFBFAC6C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CFBFAC78()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CFBFAC84()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CFBFAC90()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CFBFAC9C()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1CFBFACA8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CFBFACB4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CFBFACC0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CFBFACCC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CFBFACD8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CFBFACE4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CFBFACF0()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1CFBFACFC()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1CFBFAD08()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CFBFAD14()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CFBFAD20()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1CFBFAD2C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CFBFAD38()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CFBFAD44()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CFBFAD50()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CFBFAD5C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CFBFAD68()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CFBFAD74()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CFBFAD80()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CFBFAD8C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CFBFAD98()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1CFBFADA4()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1CFBFADB0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CFBFADBC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CFBFADC8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CFBFADD4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CFBFADE0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CFBFADEC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CFBFADF8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CFBFAE04()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CFBFAE10()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x1E0CFD2E0]();
}

uint64_t AVControlCenterModulesShouldBeShownForBundleID()
{
  return MEMORY[0x1E0C8A218]();
}

uint64_t BKSHIDEventTransferTouchesToDifferentCAContext()
{
  return MEMORY[0x1E0D00AB0]();
}

uint64_t BSCompareFloats()
{
  return MEMORY[0x1E0D01130]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSRectCenteredAboutPoint()
{
  return MEMORY[0x1E0D014D8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1E0D018E0]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1E0D018E8]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

uint64_t CAColorMatrixMakePlusD()
{
  return MEMORY[0x1E0CD2360]();
}

uint64_t CAColorMatrixMakePlusL()
{
  return MEMORY[0x1E0CD2368]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CCUIAdjustGridSizeClassForAccessibility()
{
  return MEMORY[0x1E0D145C0]();
}

uint64_t CCUIAffineTransformBetweenInterfaceOrientations()
{
  return MEMORY[0x1E0D145C8]();
}

uint64_t CCUICompactModuleColumns()
{
  return MEMORY[0x1E0D145E8]();
}

uint64_t CCUICompactModuleContinuousCornerRadius()
{
  return MEMORY[0x1E0D145F0]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x1E0D14600]();
}

uint64_t CCUICompactModuleRows()
{
  return MEMORY[0x1E0D14610]();
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x1E0D14628]();
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return MEMORY[0x1E0D14630]();
}

uint64_t CCUIEdgeInsetsRTLSwap()
{
  return MEMORY[0x1E0D14638]();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x1E0D14640]();
}

uint64_t CCUIFeatureEnabled()
{
  return MEMORY[0x1E0D14658]();
}

uint64_t CCUIGridSizeClassForSBHIconGridSizeClass()
{
  return MEMORY[0x1E0D14810]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x1E0D14670]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x1E0D14680]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x1E0D146B8]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x1E0D146D0]();
}

uint64_t CCUIPortraitGridLayoutSideMargin()
{
  return MEMORY[0x1E0D146E0]();
}

uint64_t CCUIPortraitMainListGridGeometryInfo()
{
  return MEMORY[0x1E0D146E8]();
}

uint64_t CCUIReferenceScreenBounds()
{
  return MEMORY[0x1E0D146F0]();
}

uint64_t CCUIRegisterControlCenterLogging()
{
  return MEMORY[0x1E0D146F8]();
}

uint64_t CCUIScreenSafeAreaInsets()
{
  return MEMORY[0x1E0D14720]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromIconElementRequestErrorCode()
{
  return MEMORY[0x1E0D14530]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1E0DAA080]();
}

uint64_t SBFolderRelativeListIndex()
{
  return MEMORY[0x1E0DAA688]();
}

uint64_t SBHIconDragItemWithIconAndIconView()
{
  return MEMORY[0x1E0DAA748]();
}

uint64_t SBHIconGridSizeClassForCCUIGridSizeClass()
{
  return MEMORY[0x1E0D14840]();
}

uint64_t SBHIconGridSizeClassSetForCCUIGridSizeClassMask()
{
  return MEMORY[0x1E0D14848]();
}

uint64_t SBHIconGridSizeIsEmpty()
{
  return MEMORY[0x1E0DAA7B0]();
}

uint64_t SBHIconListLayoutIconImageInfoForGridSizeClass()
{
  return MEMORY[0x1E0DAA7B8]();
}

uint64_t SBHIconListLayoutMaximumIconCount()
{
  return MEMORY[0x1E0DAA7C0]();
}

uint64_t SBHSizeScaled()
{
  return MEMORY[0x1E0DAA8C0]();
}

uint64_t SBIconCoordinateIsNotFound()
{
  return MEMORY[0x1E0DAA938]();
}

uint64_t SBIconImageInfoEqualToIconImageInfo()
{
  return MEMORY[0x1E0DAA940]();
}

uint64_t SBIconImageInfoMake()
{
  return MEMORY[0x1E0DAA948]();
}

uint64_t SBIconResizeHandleMetricsForIconResizingSettings()
{
  return MEMORY[0x1E0DAAA28]();
}

uint64_t SBSRequestPasscodeUnlockAlertUI()
{
  return MEMORY[0x1E0DAB948]();
}

uint64_t SFCreateAskToAirDropReceiverController()
{
  return MEMORY[0x1E0D974F0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1E0DC49E0]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0DC4A08]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0DC5258]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0DC5260]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1E0DC52C0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _UILegibilityStyleFromStatusBarStyle()
{
  return MEMORY[0x1E0DC5968]();
}

uint64_t _UITransformLerp()
{
  return MEMORY[0x1E0DC5A48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

