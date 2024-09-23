@implementation CUICatalog(IconServicesAdditions)

+ (id)_IS_coreGlyphsBundleURL
{
  if (_IS_coreGlyphsBundleURL_onceToken != -1)
    dispatch_once(&_IS_coreGlyphsBundleURL_onceToken, &__block_literal_global_36);
  return (id)_IS_coreGlyphsBundleURL_url;
}

+ (CFURLRef)_IS_assetCatalogURLWithBundleURL:()IconServicesAdditions
{
  id v3;
  __CFBundle *Unique;
  __CFBundle *v5;
  CFURLRef v6;

  v3 = a3;
  if (v3 && (Unique = (__CFBundle *)_CFBundleCreateUnique()) != 0)
  {
    v5 = Unique;
    v6 = CFBundleCopyResourceURL(Unique, CFSTR("Assets"), CFSTR("car"), 0);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (const)_IS_appearanceStringFromAppearance:()IconServicesAdditions
{
  NSObject *v4;

  if (a3 > 1)
  {
    if (a3 == 2)
      return CFSTR("ISAppearanceTintable");
    if (a3 == 0xFFFF)
      return CFSTR("UIAppearanceAny");
  }
  else
  {
    if (!a3)
      return CFSTR("UIAppearanceLight");
    if (a3 == 1)
      return CFSTR("UIAppearanceDark");
  }
  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[CUICatalog(IconServicesAdditions) _IS_appearanceStringFromAppearance:].cold.1(v4);

  return 0;
}

+ (id)_IS_appearanceNameFromAppearance:()IconServicesAdditions
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v10[0] = CFSTR("ISAppearanceTintable");
    v10[1] = CFSTR("UIAppearanceLight");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v10;
  }
  else
  {
    if (a3 != 1)
    {
      v9[0] = CFSTR("UIAppearanceLight");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = v3;
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v9;
      v6 = 2;
      goto LABEL_7;
    }
    v11[0] = CFSTR("UIAppearanceDark");
    v11[1] = CFSTR("UIAppearanceLight");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v11;
  }
  v6 = 3;
LABEL_7:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:
{
  return objc_msgSend(a1, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", a3, a4, a5, 0);
}

- (id)_IS_multisizedImageWithName:()IconServicesAdditions size:scale:layoutDirection:platform:appearance:
{
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  double v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v37 = a6;
  v16 = objc_msgSend(a1, "subtypeForPlatform:", a8);
  v36 = a1;
  objc_msgSend(a1, "idiomsForPlatform:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_appearanceNameFromAppearance:", a9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v17;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
  v18 = 0;
  if (v32)
  {
    v31 = *(_QWORD *)v43;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v31)
        objc_enumerationMutation(obj);
      if (v18)
        break;
      v20 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v19), "integerValue");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v35 = v33;
      v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v64, 16);
      if (v21)
      {
        v22 = v21;
        v34 = v19;
        v23 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v35);
            v25 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v26 = (id)objc_claimAutoreleasedReturnValue();

            if (v25 == v26)
            {

              v25 = 0;
            }
            objc_msgSend(v36, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", v37, v20, v16, 1, a7, 0, a4, a2, a3, 0, v25);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            _ISDefaultLog();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v18)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138414338;
                v47 = v37;
                v48 = 2048;
                v49 = a4;
                v50 = 1024;
                v51 = v20;
                v52 = 1024;
                v53 = v16;
                v54 = 1024;
                v55 = 1;
                v56 = 1024;
                v57 = a7;
                v58 = 2048;
                v59 = a2;
                v60 = 2048;
                v61 = a3;
                v62 = 2112;
                v63 = v25;
                _os_log_debug_impl(&dword_1AA928000, v28, OS_LOG_TYPE_DEBUG, "Found catalog image with query info name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d desiredSize:%f,%f appearanceName:%@]", buf, 0x4Cu);
              }

              goto LABEL_23;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138414338;
              v47 = v37;
              v48 = 2048;
              v49 = a4;
              v50 = 1024;
              v51 = v20;
              v52 = 1024;
              v53 = v16;
              v54 = 1024;
              v55 = 1;
              v56 = 1024;
              v57 = a7;
              v58 = 2048;
              v59 = a2;
              v60 = 2048;
              v61 = a3;
              v62 = 2112;
              v63 = v25;
              _os_log_impl(&dword_1AA928000, v28, OS_LOG_TYPE_DEFAULT, "Failed to find named image for name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d desiredSize:%f,%f appearanceName:%@]", buf, 0x4Cu);
            }

          }
          v22 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v64, 16);
          if (v22)
            continue;
          break;
        }
        v18 = 0;
LABEL_23:
        v19 = v34;
      }
      else
      {
        v18 = 0;
      }

      if (++v19 == v32)
      {
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
        if (v32)
          goto LABEL_3;
        break;
      }
    }
  }

  return v18;
}

- (uint64_t)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:platform:
{
  return objc_msgSend(a1, "_IS_layerStackWithName:scale:layoutDirection:softCheck:platform:", a3, a4, 0, a5);
}

- (id)_IS_layerStackWithName:()IconServicesAdditions scale:layoutDirection:softCheck:platform:
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  double v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = objc_msgSend(a1, "subtypeForPlatform:", a7);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "idiomsForPlatform:", a7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v14)
  {
    v15 = v14;
    v26 = *(_QWORD *)v28;
    v24 = v13;
    if ((_DWORD)a6)
      v16 = 0;
    else
      v16 = v13;
LABEL_5:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v26)
        objc_enumerationMutation(obj);
      v18 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "integerValue");
      v19 = (_DWORD)a6 ? 0 : v18;
      objc_msgSend(a1, "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", v12, v19, v16, 1, a5, 0, a2, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      v21 = a6;
      _ISDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413570;
        v32 = v12;
        v33 = 2048;
        v34 = a2;
        v35 = 1024;
        v36 = v19;
        v37 = 1024;
        v38 = v24;
        v39 = 1024;
        v40 = 1;
        v41 = 1024;
        v42 = a5;
        _os_log_impl(&dword_1AA928000, v22, OS_LOG_TYPE_DEFAULT, "Failed to find layer stack for name:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d]", buf, 0x2Eu);
      }

      ++v17;
      a6 = v21;
      if (v15 == v17)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
        if (v15)
          goto LABEL_5;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    v20 = 0;
  }

  return v20;
}

- (BOOL)_IS_possibleLayerStackExistsWithName:()IconServicesAdditions platform:
{
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "_IS_layerStackWithName:scale:layoutDirection:softCheck:platform:", a3, 5, 1, a4, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_IS_possibleMultisizedImageExistsWithName:()IconServicesAdditions platform:
{
  id v6;
  void *v7;
  _BOOL8 v8;

  v6 = a3;
  if (objc_msgSend(a1, "imageExistsWithName:", v6))
  {
    objc_msgSend(a1, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:", v6, 4, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)nativeIdiom
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceClass");

  v2 = v1 - 1;
  if ((v1 - 1) < 0xB && ((0x52Fu >> v2) & 1) != 0)
    return qword_1AA9771F0[v2];
  _ISDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_impl(&dword_1AA928000, v3, OS_LOG_TYPE_DEFAULT, "Unknown device class: %d", (uint8_t *)v5, 8u);
  }

  return 0;
}

- (id)idiomsForPlatform:()IconServicesAdditions
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CUICatalog_IconServicesAdditions__idiomsForPlatform___block_invoke;
  v9[3] = &unk_1E5801498;
  v9[4] = a1;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF4232B8](v9);
  v4[2](v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v6, "nativePlatform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v5 = v7;
    }
    else
    {

      v5 = &unk_1E5816610;
    }
  }

  return v5;
}

- (uint64_t)subtypeForPlatform:()IconServicesAdditions
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;

  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceSubtype");

  +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "nativePlatform");

  if (v7 == 1)
  {
    *((_QWORD *)&v9 + 1) = a3;
    *(_QWORD *)&v9 = a3 - 4;
    v8 = v9 >> 2;
    if (v8 <= 7 && ((0x8Bu >> v8) & 1) != 0)
      return qword_1AA977248[v8];
  }
  return v5;
}

+ (void)_IS_appearanceStringFromAppearance:()IconServicesAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Unknown appearance", v1, 2u);
}

@end
