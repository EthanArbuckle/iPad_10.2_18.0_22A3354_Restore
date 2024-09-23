@implementation PosterKitUtilities

+ (id)archiver
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPRSPosterArchiverClass_softClass;
  v9 = getPRSPosterArchiverClass_softClass;
  if (!getPRSPosterArchiverClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPRSPosterArchiverClass_block_invoke;
    v5[3] = &unk_1E5CCC218;
    v5[4] = &v6;
    __getPRSPosterArchiverClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return (id)objc_msgSend([v3 alloc], "init");
}

+ (id)systemTimeFontConfigurationWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getPRPosterSystemTimeFontConfigurationClass_softClass;
  v16 = getPRPosterSystemTimeFontConfigurationClass_softClass;
  if (!getPRPosterSystemTimeFontConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getPRPosterSystemTimeFontConfigurationClass_block_invoke;
    v12[3] = &unk_1E5CCC218;
    v12[4] = &v13;
    __getPRPosterSystemTimeFontConfigurationClass_block_invoke((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithTimeFontIdentifier:weight:systemItem:", v7, v5, a4);

  return v10;
}

+ (id)posterColorWithColor:(CGColor *)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5
{
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getPRPosterColorClass_softClass;
  v18 = getPRPosterColorClass_softClass;
  if (!getPRPosterColorClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getPRPosterColorClass_block_invoke;
    v14[3] = &unk_1E5CCC218;
    v14[4] = &v15;
    __getPRPosterColorClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v10 = [v9 alloc];
  v11 = (void *)objc_msgSend(objc_alloc((Class)getUIColorClass()), "initWithCGColor:", a3);
  v12 = (void *)objc_msgSend(v10, "initWithColor:preferredStyle:localizedName:", v11, a4, v7);

  return v12;
}

+ (id)titleStyleConfigurationWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v12 = a8;
  v31 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v21 = (void *)getPRPosterTitleStyleConfigurationClass_softClass;
  v30 = getPRPosterTitleStyleConfigurationClass_softClass;
  if (!getPRPosterTitleStyleConfigurationClass_softClass)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __getPRPosterTitleStyleConfigurationClass_block_invoke;
    v26[3] = &unk_1E5CCC218;
    v26[4] = &v27;
    __getPRPosterTitleStyleConfigurationClass_block_invoke((uint64_t)v26);
    v21 = (void *)v28[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v27, 8);
  LOBYTE(v25) = a10;
  v23 = (void *)objc_msgSend([v22 alloc], "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v17, a4, a5, v18, v19, v12, a9, v25, v20);

  return v23;
}

+ (id)renderingConfigurationWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  objc_class *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v6 = (void *)getPRPosterRenderingConfigurationClass_softClass;
  v13 = getPRPosterRenderingConfigurationClass_softClass;
  if (!getPRPosterRenderingConfigurationClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getPRPosterRenderingConfigurationClass_block_invoke;
    v9[3] = &unk_1E5CCC218;
    v9[4] = &v10;
    __getPRPosterRenderingConfigurationClass_block_invoke((uint64_t)v9);
    v6 = (void *)v11[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v10, 8);
  return (id)objc_msgSend([v7 alloc], "initWithDepthEffectDisabled:parallaxEnabled:", v5, v4);
}

+ (id)configuredPropertiesWithTitleStyleConfiguration:(id)a3 renderingConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getPRPosterConfiguredPropertiesClass_softClass;
  v15 = getPRPosterConfiguredPropertiesClass_softClass;
  if (!getPRPosterConfiguredPropertiesClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getPRPosterConfiguredPropertiesClass_block_invoke;
    v11[3] = &unk_1E5CCC218;
    v11[4] = &v12;
    __getPRPosterConfiguredPropertiesClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v5, 0, 0, v6, 0, 0, 0, 0, 0);

  return v9;
}

+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v14 = (void *)getPFServerPosterIdentityClass_softClass;
  v28 = getPFServerPosterIdentityClass_softClass;
  if (!getPFServerPosterIdentityClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = (uint64_t)__getPFServerPosterIdentityClass_block_invoke;
    v23 = &unk_1E5CCC218;
    v24 = &v25;
    __getPFServerPosterIdentityClass_block_invoke((uint64_t)&v20);
    v14 = (void *)v26[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v25, 8);
  v20 = 0;
  v21 = (uint64_t)&v20;
  v22 = 0x2020000000;
  v16 = (_QWORD *)getPRSPosterRoleIncomingCallSymbolLoc_ptr;
  v23 = (void *)getPRSPosterRoleIncomingCallSymbolLoc_ptr;
  if (!getPRSPosterRoleIncomingCallSymbolLoc_ptr)
  {
    v17 = (void *)PosterBoardServicesLibrary();
    v16 = dlsym(v17, "PRSPosterRoleIncomingCall");
    *(_QWORD *)(v21 + 24) = v16;
    getPRSPosterRoleIncomingCallSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v20, 8);
  if (!v16)
    +[PosterKitUtilities configurationIdentityWithProvider:identifier:posterUUID:version:supplement:].cold.1();
  objc_msgSend(v15, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v11, v12, *v16, v13, a6, a7, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)serverPathWithProviderURL:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getPFServerPosterPathClass_softClass;
  v15 = getPFServerPosterPathClass_softClass;
  if (!getPFServerPosterPathClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getPFServerPosterPathClass_block_invoke;
    v11[3] = &unk_1E5CCC218;
    v11[4] = &v12;
    __getPFServerPosterPathClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v8, "pathWithProviderURL:identity:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)configurationWithPath:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getPRSPosterConfigurationClass_softClass;
  v12 = getPRSPosterConfigurationClass_softClass;
  if (!getPRSPosterConfigurationClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getPRSPosterConfigurationClass_block_invoke;
    v8[3] = &unk_1E5CCC218;
    v8[4] = &v9;
    __getPRSPosterConfigurationClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithPath:", v3);

  return v6;
}

+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v9 = (void *)getPRPosterPathUtilitiesClass_softClass;
  v17 = getPRPosterPathUtilitiesClass_softClass;
  if (!getPRPosterPathUtilitiesClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getPRPosterPathUtilitiesClass_block_invoke;
    v13[3] = &unk_1E5CCC218;
    v13[4] = &v14;
    __getPRPosterPathUtilitiesClass_block_invoke((uint64_t)v13);
    v9 = (void *)v15[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v14, 8);
  v11 = objc_msgSend(v10, "storeConfiguredPropertiesForPath:configuredProperties:error:", v7, v8, a5);

  return v11;
}

+ (id)loadConfiguredPropertiesFromPosterConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  PosterKitLibrary();
  objc_msgSend(v5, "pr_loadConfiguredPropertiesWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)discreteColorsContentStyleForColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variation:(double)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __94__PosterKitUtilities_discreteColorsContentStyleForColors_vibrant_supportsVariation_variation___block_invoke;
  v20 = &unk_1E5CCC1F0;
  v21 = v11;
  v12 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);

  v13 = objc_alloc((Class)getPRPosterContentDiscreteColorsStyleClass());
  if (v8 && v7)
  {
    v14 = objc_msgSend(v13, "initWithVibrantColors:variation:", v12, a6, v17, v18, v19, v20, v21, v22);
  }
  else if (v7 || !v8)
  {
    v14 = objc_msgSend(v13, "initWithOpaqueColors:variation:", v12, a6, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v14 = objc_msgSend(v13, "initWithVibrantColors:", v12, v17, v18, v19, v20, v21, v22);
  }
  v15 = (void *)v14;

  return v15;
}

void __94__PosterKitUtilities_discreteColorsContentStyleForColors_vibrant_supportsVariation_variation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(objc_alloc((Class)getUIColorClass()), "initWithCGColor:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

+ (id)gradientContentStyleForColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v29 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__PosterKitUtilities_gradientContentStyleForColors_gradientType_locations_startPoint_endPoint___block_invoke;
  v22[3] = &unk_1E5CCC1F0;
  v17 = v15;
  v23 = v17;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v18 = (void *)getPRPosterContentGradientStyleClass_softClass;
  v28 = getPRPosterContentGradientStyleClass_softClass;
  if (!getPRPosterContentGradientStyleClass_softClass)
  {
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __getPRPosterContentGradientStyleClass_block_invoke;
    v24[3] = &unk_1E5CCC218;
    v24[4] = &v25;
    __getPRPosterContentGradientStyleClass_block_invoke((uint64_t)v24);
    v18 = (void *)v26[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v25, 8);
  v20 = (void *)objc_msgSend([v19 alloc], "initWithColors:gradientType:locations:startPoint:endPoint:", v17, a4, v14, v10, v9, x, y);

  return v20;
}

void __95__PosterKitUtilities_gradientContentStyleForColors_gradientType_locations_startPoint_endPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(objc_alloc((Class)getUIColorClass()), "initWithCGColor:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

+ (id)vibrantMaterialContentStyle
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPRPosterContentVibrantMaterialStyleClass_softClass;
  v9 = getPRPosterContentVibrantMaterialStyleClass_softClass;
  if (!getPRPosterContentVibrantMaterialStyleClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPRPosterContentVibrantMaterialStyleClass_block_invoke;
    v5[3] = &unk_1E5CCC218;
    v5[4] = &v6;
    __getPRPosterContentVibrantMaterialStyleClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

+ (id)vibrantMonochromeContentStyle
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPRPosterContentVibrantMonochromeStyleClass_softClass;
  v9 = getPRPosterContentVibrantMonochromeStyleClass_softClass;
  if (!getPRPosterContentVibrantMonochromeStyleClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPRPosterContentVibrantMonochromeStyleClass_block_invoke;
    v5[3] = &unk_1E5CCC218;
    v5[4] = &v6;
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

+ (BOOL)saveCompoundLayerStack:(id)a3 toWallpaperURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v9 = (void *)getPISegmentationLoaderClass_softClass;
  v17 = getPISegmentationLoaderClass_softClass;
  if (!getPISegmentationLoaderClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getPISegmentationLoaderClass_block_invoke;
    v13[3] = &unk_1E5CCC218;
    v13[4] = &v14;
    __getPISegmentationLoaderClass_block_invoke((uint64_t)v13);
    v9 = (void *)v15[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v14, 8);
  v11 = objc_msgSend(v10, "saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:", 0, v7, 0, v8, a5);

  return v11;
}

+ (void)configurationIdentityWithProvider:identifier:posterUUID:version:supplement:.cold.1()
{
  dlerror();
  abort_report_np();
  __getPRSPosterArchiverClass_block_invoke_cold_1();
}

@end
