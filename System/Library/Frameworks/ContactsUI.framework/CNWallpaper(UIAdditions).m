@implementation CNWallpaper(UIAdditions)

- (id)posterAttributes
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D13818];
  objc_msgSend(a1, "posterArchiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if ((v2 & 1) != 0)
    return 0;
  objc_msgSend(a1, "posterArchiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  +[CNPRUISPosterTitleStyleAttributes attributesFromData:error:](CNPRUISPosterTitleStyleAttributes, "attributesFromData:error:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (!v6)
  {
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Error getting title style attributes from poster data: %@", buf, 0xCu);
    }

  }
  return v6;
}

- (id)font
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *MEMORY[0x1E0D13820];
  objc_msgSend(a1, "fontDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if ((v2 & 1) != 0)
  {
    objc_msgSend(a1, "posterAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleFont");
  }
  else
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(a1, "fontDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontFromDescription:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fontColor
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *MEMORY[0x1E0D13820];
  objc_msgSend(a1, "fontColorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  if ((v2 & 1) != 0)
  {
    objc_msgSend(a1, "posterAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleColor");
  }
  else
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(a1, "fontColorDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorFromDescription:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)backgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "backgroundColorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorFromDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)wallpaperType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "extensionBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperTypeFromExtensionBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reducedSizePosterArchiveDataFromData:()UIAdditions posterConfiguration:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _QWORD v49[2];
  uint8_t buf[4];
  NSObject *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
  {
    v9 = v6;
    v10 = v9;
    if (v9)
    {
      v7 = 0;
      v11 = v9;
    }
    else
    {
      v47 = 0;
      +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v5, &v47);
      v11 = objc_claimAutoreleasedReturnValue();
      v7 = v47;
      if (!v11)
      {
        CNUILogPosters();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v7;
          _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Failed to reduce posterArchiveDataSize: failed to unarchive configuration, %@", buf, 0xCu);
        }
        v8 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    -[NSObject providerBundleIdentifier](v11, "providerBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));

    if ((v13 & 1) != 0)
    {
      v33 = v10;
      v34 = v11;
      v35 = v7;
      v36 = v6;
      v37 = v5;
      -[NSObject assetDirectory](v11, "assetDirectory");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *MEMORY[0x1E0C99A90];
      v17 = *MEMORY[0x1E0C999D0];
      v49[0] = *MEMORY[0x1E0C99A90];
      v49[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v15;
      v32 = (void *)v14;
      objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v14, v18, 4, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v44;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            v42 = 0;
            objc_msgSend(v25, "getResourceValue:forKey:error:", &v42, v17, 0);
            v26 = v42;
            if (objc_msgSend(v26, "BOOLValue"))
            {
              v41 = 0;
              objc_msgSend(v25, "getResourceValue:forKey:error:", &v41, v16, 0);
              v27 = v41;
              if ((objc_msgSend(v27, "isEqualToString:", CFSTR("input.segmentation")) & 1) != 0)
              {
                objc_msgSend(v38, "addObject:", v25);

                goto LABEL_24;
              }
              if (objc_msgSend(v27, "isEqualToString:", CFSTR("supplements")))
                objc_msgSend(v20, "skipDescendants");

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_24:

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __85__CNWallpaper_UIAdditions__reducedSizePosterArchiveDataFromData_posterConfiguration___block_invoke;
      v39[3] = &unk_1E2049660;
      v28 = v31;
      v40 = v28;
      objc_msgSend(v38, "enumerateObjectsUsingBlock:", v39);
      v11 = v34;
      +[CNPRSPosterArchiver archiveCNConfiguration:error:](CNPRSPosterArchiver, "archiveCNConfiguration:error:", v34, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v29);
      objc_msgSend(v28, "removeItemAtURL:error:", v29, 0);
      v7 = v35;
      if (!v33)
        objc_msgSend(v28, "removeItemAtURL:error:", v32, 0);

      v6 = v36;
      v5 = v37;
    }
    else
    {
      v8 = v5;
    }
    goto LABEL_30;
  }
  CNUILogPosters();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Failed to reduce posterArchiveDataSize: posterArchiveData is empty.", buf, 2u);
  }
  v8 = 0;
LABEL_31:

  return v8;
}

+ (id)fontFromDescription:()UIAdditions
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  CTFontRef v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  float v23;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C97170];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_1E20D2DD8;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97168]);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97178]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && -[__CFString length](v9, "length"))
  {
    v11 = CTFontCreateWithNameAndOptions(v9, 12.0, 0, 0x20400uLL);
    v27 = *MEMORY[0x1E0CA8470];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    v26 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CTFont fontDescriptor](v11, "fontDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorByAddingAttributes:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v8, "floatValue");
    objc_msgSend(v17, "fontWithDescriptor:size:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v8, "floatValue");
    v22 = v21;
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v20, "systemFontOfSize:weight:", v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (double)fontWeightFromFont:()UIAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(a3, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CA8470]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

+ (id)colorFromDescription:()UIAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  float v31;
  float v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  float v45;
  double v46;
  float v47;
  double v48;
  float v49;
  double v50;
  float v51;
  float v52;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97128]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &unk_1E20D2D08;
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97160]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v8, "floatValue");
    v12 = v11;
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v10, "colorWithWhite:alpha:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97148]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97158]);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = &unk_1E20D2D08;
      v19 = v18;

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97138]);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (void *)v20;
      else
        v22 = &unk_1E20D2D08;
      v23 = v22;

      v24 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v15, "floatValue");
      v26 = v25;
      objc_msgSend(v19, "floatValue");
      v28 = v27;
      objc_msgSend(v23, "floatValue");
      v30 = v29;
      objc_msgSend(v7, "floatValue");
      v32 = v31;

      objc_msgSend(v24, "colorWithHue:saturation:brightness:alpha:", v26, v28, v30, v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97150]);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
        v35 = (void *)v33;
      else
        v35 = &unk_1E20D2D08;
      v19 = v35;

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97140]);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (void *)v36;
      else
        v38 = &unk_1E20D2D08;
      v39 = v38;

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97130]);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (v40)
        v42 = (void *)v40;
      else
        v42 = &unk_1E20D2D08;
      v43 = v42;

      v44 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v19, "floatValue");
      v46 = v45;
      objc_msgSend(v39, "floatValue");
      v48 = v47;
      objc_msgSend(v43, "floatValue");
      v50 = v49;
      objc_msgSend(v7, "floatValue");
      v52 = v51;

      objc_msgSend(v44, "colorWithRed:green:blue:alpha:", v46, v48, v50, v52);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v14;
}

+ (id)wallpaperWithPosterArchiveData:()UIAdditions metadataFromConfiguration:visualFingerprint:contentIsSensitive:
{
  id v8;
  id v9;
  CNPRSPosterConfigurationAttributes *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  CNPRSPosterConfigurationAttributes *v25;
  id v26;
  void *v27;

  v8 = a4;
  v9 = a5;
  v26 = a3;
  v10 = -[CNPRSPosterConfigurationAttributes initWithCNConfiguration:]([CNPRSPosterConfigurationAttributes alloc], "initWithCNConfiguration:", v8);
  +[CNPRUISPosterTitleStyleAttributes attributesForCNConfiguration:](CNPRUISPosterTitleStyleAttributes, "attributesForCNConfiguration:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  if (v9)
  {
    +[CNAvatarPosterCarouselLikenessFingerprint archiveWithFingerprint:](CNAvatarPosterCarouselLikenessFingerprint, "archiveWithFingerprint:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0C97408]);
  v14 = (void *)objc_opt_class();
  objc_msgSend(v11, "titleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptionFromFont:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_class();
  objc_msgSend(v11, "titleColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorDescriptionFromColor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backgroundColorDescriptionFromConfiguration:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPRSPosterConfigurationAttributes extensionIdentifier](v10, "extensionIdentifier");
  v25 = v10;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a6;
  v22 = (void *)objc_msgSend(v13, "initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:", v26, v16, v19, v20, v21, objc_msgSend(v11, "preferredTitleLayout") == 1, v12, v24);

  return v22;
}

+ (id)backgroundColorDescriptionFromConfiguration:()UIAdditions
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v3 = a3;
  objc_msgSend(v3, "loadUserInfoWithError:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13820] + 16))())
  {
    CNUILogPosters();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Unable to read background color, failed to load user info from configuration: %@", buf, 0xCu);

    }
  }
  objc_msgSend((id)objc_opt_class(), "wallpaperTypeFromConfiguration:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97188])
     && (v8 = &off_1E203FE78,
         +[CNMonogramPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI35CNMonogramPosterConfigurationReader, "canReadConfiguration"))|| objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97180])&& (v8 = off_1E203FE70, +[CNMemojiPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI33CNMemojiPosterConfigurationReader, "canReadConfiguration")))&& (v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithPosterConfigurationUserInfo:", v4), objc_msgSend(v9, "backgroundColor"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, v10))
  {
    objc_msgSend((id)objc_opt_class(), "colorDescriptionFromColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fontDescriptionFromFont:()UIAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13[0] = *MEMORY[0x1E0C97168];
    v3 = a3;
    objc_msgSend(v3, "fontName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v13[1] = *MEMORY[0x1E0C97170];
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "pointSize");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    v13[2] = *MEMORY[0x1E0C97178];
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)objc_opt_class(), "fontWeightFromFont:", v3);
    v9 = v8;

    objc_msgSend(v7, "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v11;
}

+ (id)wallpaperTypeFromConfiguration:()UIAdditions
{
  id v3;
  CNPRSPosterConfigurationAttributes *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[CNPRSPosterConfigurationAttributes initWithCNConfiguration:]([CNPRSPosterConfigurationAttributes alloc], "initWithCNConfiguration:", v3);

  -[CNPRSPosterConfigurationAttributes extensionIdentifier](v4, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "wallpaperTypeFromExtensionBundleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)wallpaperTypeFromExtensionBundleID:()UIAdditions
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AvatarUI.AvatarPosterExtension")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C97180];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ContactsUI.MonogramPosterExtension")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C97188];
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
    v4 = (id *)MEMORY[0x1E0C97190];
  }
  v5 = *v4;

  return v5;
}

+ (id)colorDescriptionFromColor:()UIAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA70];
  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v13[0] = *MEMORY[0x1E0C97150];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0C97140];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = *MEMORY[0x1E0C97130];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = *MEMORY[0x1E0C97128];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
