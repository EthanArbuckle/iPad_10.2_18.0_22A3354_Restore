@implementation NTKComplicationController

+ (Class)controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (Class)objc_msgSend(a1, "_controllerClassForComplicationType:family:device:resolvedFamily:", a3, a4, a5, 0);
}

+ (Class)_controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5 resolvedFamily:(int64_t *)a6
{
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v8 = a5;
  v9 = 0uLL;
  do
  {
    if (a6)
      *a6 = v31;
    v29 = v9;
    v30 = v9;
    v27 = v9;
    v28 = v9;
    if (_NonLegacyControllerClasses_onceToken != -1)
      dispatch_once(&_NonLegacyControllerClasses_onceToken, &__block_literal_global_158_0);
    v10 = (id)_NonLegacyControllerClasses___classes;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
LABEL_8:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
        if ((objc_msgSend(v15, "_acceptsComplicationType:family:forDevice:", a3, v31, v8) & 1) != 0)
          goto LABEL_26;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
          if (v12)
            goto LABEL_8;
          break;
        }
      }
    }

    v16 = NTKFallbackComplicationFamilyForFamily(v31, &v31);
    v9 = 0uLL;
  }
  while ((v16 & 1) != 0);
  if (NTKIsRichComplicationFamily(v31))
  {
    v17 = 0;
    goto LABEL_28;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  _LegacyControllerClasses();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (!v18)
  {
LABEL_25:
    v17 = 0;
    goto LABEL_27;
  }
  v19 = v18;
  v20 = *(_QWORD *)v24;
LABEL_19:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v20)
      objc_enumerationMutation(v10);
    v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
    if ((objc_msgSend(v15, "_acceptsComplicationType:forDevice:", a3, v8, (_QWORD)v23) & 1) != 0)
      break;
    if (v19 == ++v21)
    {
      v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v19)
        goto LABEL_19;
      goto LABEL_25;
    }
  }
LABEL_26:
  v17 = v15;
LABEL_27:

LABEL_28:
  return (Class)v17;
}

+ (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = objc_msgSend(v9, "family");
  v14 = v15;
  v11 = objc_msgSend(a1, "_controllerClassForComplicationType:family:device:resolvedFamily:", objc_msgSend(v8, "complicationType"), v15, v10, &v15);
  if (!v11)
  {
    while (!+[NTKLocalBundleTimelineComplicationController acceptsComplication:family:forDevice:](NTKLocalBundleTimelineComplicationController, "acceptsComplication:family:forDevice:", v8, v14, v10))
    {
      if ((NTKFallbackComplicationFamilyForFamily(v14, &v14) & 1) == 0)
        goto LABEL_6;
    }
    v11 = objc_opt_class();
    if (v11)
      goto LABEL_7;
LABEL_6:
    v11 = objc_opt_class();
  }
LABEL_7:
  v12 = (void *)objc_msgSend(a1, "_newOrCachedControllerOfClass:complication:variant:device:", v11, v8, v9, v10);

  return v12;
}

+ (id)_newOrCachedControllerOfClass:(Class)a3 complication:(id)a4 variant:(id)a5 device:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  Class v26;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __87__NTKComplicationController__newOrCachedControllerOfClass_complication_variant_device___block_invoke;
  v22 = &unk_1E6BD94E0;
  v26 = a3;
  v12 = v9;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  v14 = v11;
  v25 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(&v19);
  if (-[objc_class _isLegacy](a3, "_isLegacy", v19, v20, v21, v22))
  {
    v15[2](v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NTKComplicationControllerCache sharedCache](NTKComplicationControllerCache, "sharedCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "controllerForComplication:variant:device:create:", v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

id __87__NTKComplicationController__newOrCachedControllerOfClass_complication_variant_device___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithComplication:variant:device:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return 0;
}

+ (BOOL)_isLegacy
{
  return 1;
}

- (BOOL)wantsLegacyDisplay
{
  return objc_msgSend((id)objc_opt_class(), "_isLegacy");
}

- (Class)richComplicationDisplayViewClass
{
  return 0;
}

+ (id)DEPRECATEDControllerForComplication:(id)a3 withLegacyDisplay:(id)a4 forDevice:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "complicationType");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  _LegacyControllerClasses();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
      if ((objc_msgSend(v16, "_acceptsComplicationType:forDevice:", v10, v9, (_QWORD)v19) & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (v16)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v16 = (void *)objc_opt_class();
LABEL_12:
  v17 = (void *)objc_msgSend(objc_alloc((Class)v16), "_initWithComplication:legacyDisplay:forDevice:", v7, v8, v9);

  return v17;
}

- (NTKComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKComplicationController *v12;
  NTKComplicationController *v13;
  NSMutableArray *v14;
  NSMutableArray *displayWrappers;
  uint64_t v16;
  NSMapTable *displayWrappersToDisplayProperties;
  uint64_t v18;
  NSMapTable *displayWrappersToTouchObservers;
  uint64_t v20;
  NSHashTable *assertions;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKComplicationController;
  v12 = -[NTKComplicationController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_complication, a3);
    v13->_complicationFamily = objc_msgSend(v10, "family");
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    displayWrappers = v13->_displayWrappers;
    v13->_displayWrappers = v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    displayWrappersToDisplayProperties = v13->_displayWrappersToDisplayProperties;
    v13->_displayWrappersToDisplayProperties = (NSMapTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    displayWrappersToTouchObservers = v13->_displayWrappersToTouchObservers;
    v13->_displayWrappersToTouchObservers = (NSMapTable *)v18;

    objc_storeStrong((id *)&v13->_device, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    assertions = v13->_assertions;
    v13->_assertions = (NSHashTable *)v20;

    -[NTKComplicationController _updateInternalModes:](v13, "_updateInternalModes:", 1);
  }

  return v13;
}

- (id)_initWithComplication:(id)a3 legacyDisplay:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  NTKComplicationController *v19;

  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v12 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v16 = a3;
  +[NTKComplicationMetrics metricsWithSize:safeAreaInsets:cornerRadius:opaque:](NTKComplicationMetrics, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:", 0, v10, v11, v12, v13, v14, v15, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationVariant variantWithFamily:metrics:](NTKComplicationVariant, "variantWithFamily:metrics:", -1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NTKComplicationController initWithComplication:variant:device:](self, "initWithComplication:variant:device:", v16, v18, v9);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeWeak((id *)&v19->_legacyDisplayDEPRECATED, v8);
    -[NTKComplicationController _configureForLegacyDisplay:](v19, "_configureForLegacyDisplay:", v8);
  }

  return v19;
}

- (void)_updateEffectiveCachingMode
{
  int64_t v2;

  v2 = 2;
  switch(self->_effectiveFaceDataMode)
  {
    case 0:
      v2 = 0;
      goto LABEL_5;
    case 1:
      goto LABEL_5;
    case 2:
    case 3:
      v2 = 2 * self->_hasGoneLive;
      goto LABEL_5;
    case 4:
    case 5:
      v2 = 1;
LABEL_5:
      self->_cachingMode = v2;
      break;
    default:
      return;
  }
}

- (void)_updateEffectiveUpdatingMode
{
  unint64_t effectiveFaceDataMode;

  effectiveFaceDataMode = self->_effectiveFaceDataMode;
  if (effectiveFaceDataMode <= 5)
    self->_updatingMode = qword_1B755FD18[effectiveFaceDataMode];
}

- (void)_updateEffectiveAnimationMode
{
  unint64_t effectiveFaceDataMode;
  int64_t v3;

  effectiveFaceDataMode = self->_effectiveFaceDataMode;
  if (effectiveFaceDataMode <= 5)
  {
    if (((1 << effectiveFaceDataMode) & 0x39) != 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = 1;
      if (self->_faceZooming)
        v3 = 2;
    }
    self->_animationMode = v3;
  }
}

- (void)_updateEffectiveFaceDataMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  NSAllMapTableKeys(self->_displayWrappersToDisplayProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        -[NTKComplicationController displayPropertiesForDisplayWrapper:](self, "displayPropertiesForDisplayWrapper:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = _MaxFaceDataMode(v6, objc_msgSend(v9, "faceDataMode"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_assertions;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        v6 = _MaxFaceDataMode(v6, objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "dataMode", (_QWORD)v15));
      }
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  self->_effectiveFaceDataMode = v6;
}

- (void)_updateInternalModes:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t effectiveFaceDataMode;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  int64_t cachingMode;
  int64_t updatingMode;
  int64_t animationMode;
  uint64_t v13;
  NSObject *v15;
  void *v16;
  int64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  effectiveFaceDataMode = self->_effectiveFaceDataMode;
  -[NTKComplicationController _updateEffectiveFaceDataMode](self, "_updateEffectiveFaceDataMode");
  v6 = self->_effectiveFaceDataMode;
  v7 = effectiveFaceDataMode == v6 && !v3;
  v8 = effectiveFaceDataMode;
  if (!v7)
  {
    if (v6 <= 5 && ((0x33u >> v6) & 1) != 0)
      self->_hasGoneLive = 0x1010100uLL >> (8 * v6);
    cachingMode = self->_cachingMode;
    updatingMode = self->_updatingMode;
    animationMode = self->_animationMode;
    -[NTKComplicationController _updateEffectiveCachingMode](self, "_updateEffectiveCachingMode");
    -[NTKComplicationController _updateEffectiveUpdatingMode](self, "_updateEffectiveUpdatingMode");
    -[NTKComplicationController _updateEffectiveAnimationMode](self, "_updateEffectiveAnimationMode");
    if (updatingMode != self->_updatingMode)
      -[NTKComplicationController _applyUpdatingMode](self, "_applyUpdatingMode");
    if (cachingMode != self->_cachingMode)
      -[NTKComplicationController _applyCachingMode](self, "_applyCachingMode");
    if (animationMode != self->_animationMode)
      -[NTKComplicationController _applyAnimationMode](self, "_applyAnimationMode");
    v8 = self->_effectiveFaceDataMode;
  }
  if (effectiveFaceDataMode != v8 || v3)
  {
    v13 = (v8 > 5) | (6u >> v8) & 1;
    if (((effectiveFaceDataMode > 5) | (6u >> effectiveFaceDataMode) & 1) != (_DWORD)v13 || v3)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[NTKComplicationController complication](self, "complication");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_effectiveFaceDataMode;
        v18 = 138413058;
        v19 = v16;
        v20 = 2048;
        v21 = effectiveFaceDataMode;
        v22 = 2048;
        v23 = v17;
        v24 = 1024;
        v25 = v13;
        _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "updateIsComplicationActive: complication: %@ from %ld to %ld. isActive: %d", (uint8_t *)&v18, 0x26u);

      }
      -[NTKComplicationController _updateIsComplicationActive:](self, "_updateIsComplicationActive:", v13);
    }
  }
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  id v6;
  NSMapTable *displayWrappersToDisplayProperties;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    displayWrappersToDisplayProperties = self->_displayWrappersToDisplayProperties;
    v8 = (void *)objc_msgSend(v9, "copy");
    -[NSMapTable setObject:forKey:](displayWrappersToDisplayProperties, "setObject:forKey:", v8, v6);

    objc_msgSend(v6, "setTapEnabled:", objc_msgSend(v9, "tapEnabled"));
    objc_msgSend(v6, "setTapAnimationEnabled:", objc_msgSend(v9, "defaultTapAnimationEnabled"));
    objc_msgSend(v6, "setPaused:", objc_msgSend(v9, "faceDataMode") != 1);
    objc_msgSend(v6, "setTapInternalInputEnabled:", 1);
    -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 0);
  }

}

- (id)displayPropertiesForDisplayWrapper:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMapTable objectForKey:](self->_displayWrappersToDisplayProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updatePropertiesForDisplayWrapper:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  -[NTKComplicationController displayPropertiesForDisplayWrapper:](self, "displayPropertiesForDisplayWrapper:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_opt_new();
  v11 = v8;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v6[2](v6, v9);

  v10 = (void *)objc_msgSend(v9, "copy");
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](self, "setDisplayProperties:forDisplayWrapper:", v10, v7);

}

- (void)setFaceZooming:(BOOL)a3
{
  if (self->_faceZooming != a3)
  {
    self->_faceZooming = a3;
    -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 1);
  }
}

- (void)deactivate
{
  if (self->_active)
  {
    self->_hasGoneLive = 0;
    -[NTKComplicationController _deactivate](self, "_deactivate");
    self->_active = 0;
  }
}

- (void)activate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_DEBUG, "Activating controller %@", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  objc_super v3;

  -[NTKComplicationController deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationController;
  -[NTKComplicationController dealloc](&v3, sel_dealloc);
}

- (void)addDisplayWrapper:(id)a3 withDisplayProperties:(id)a4
{
  NSMapTable *displayWrappersToDisplayProperties;
  id v7;
  void *v8;
  id v9;

  displayWrappersToDisplayProperties = self->_displayWrappersToDisplayProperties;
  v7 = a4;
  v9 = a3;
  v8 = (void *)objc_msgSend(v7, "copy");
  -[NSMapTable setObject:forKey:](displayWrappersToDisplayProperties, "setObject:forKey:", v8, v9);

  -[NTKComplicationController addDisplayWrapper:](self, "addDisplayWrapper:", v9);
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](self, "setDisplayProperties:forDisplayWrapper:", v7, v9);

}

- (void)addDisplayWrapper:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;

  v4 = a3;
  if (!-[NSMutableArray count](self->_displayWrappers, "count"))
    -[NTKComplicationController activate](self, "activate");
  -[NSMutableArray addObject:](self->_displayWrappers, "addObject:", v4);
  if (-[NSMutableArray count](self->_displayWrappers, "count") == 1)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationController _configureForLegacyDisplay:](self, "_configureForLegacyDisplay:", v5);

  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke;
  v12[3] = &unk_1E6BD9508;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  objc_msgSend(v4, "setTouchDownHandler:", v12);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke_2;
  v9[3] = &unk_1E6BD9508;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  objc_msgSend(v4, "setTouchUpInsideHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke_3;
  v7[3] = &unk_1E6BD9530;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "setRenderStatsHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  id *WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didTouchDownInView:", v4);

  objc_msgSend(WeakRetained[5], "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationController:touchedDownForDisplayWrapper:", WeakRetained, v5);
  if (objc_msgSend(v5, "tapAnimationEnabled") && (objc_msgSend(v5, "tapInternalInputEnabled") & 1) == 0)
    objc_msgSend(v5, "setHighlighted:", 1);

}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  id *WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didTouchUpInsideView:", v4);

  objc_msgSend(WeakRetained, "performTapActionForDisplayWrapper:", v5);
  objc_msgSend(WeakRetained[5], "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationController:touchedUpForDisplayWrapper:", WeakRetained, v5);
  if (objc_msgSend(v5, "tapAnimationEnabled") && (objc_msgSend(v5, "tapInternalInputEnabled") & 1) == 0)
    objc_msgSend(v5, "setHighlighted:", 0);

}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke_3(uint64_t a1, void *a2, double a3, double a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleRenderStatsForDisplayWrapper:withTime:cost:", v7, a3, a4);

}

- (void)removeDisplayWrapper:(id)a3
{
  NSMutableArray *displayWrappers;
  id v5;
  id v6;

  displayWrappers = self->_displayWrappers;
  v5 = a3;
  -[NSMutableArray removeObjectIdenticalTo:](displayWrappers, "removeObjectIdenticalTo:", v5);
  -[NSMapTable removeObjectForKey:](self->_displayWrappersToDisplayProperties, "removeObjectForKey:", v5);
  -[NSMapTable removeObjectForKey:](self->_displayWrappersToTouchObservers, "removeObjectForKey:", v5);
  objc_msgSend(v5, "setTouchUpInsideHandler:", 0);

  -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 0);
  if (!-[NSMutableArray count](self->_displayWrappers, "count"))
    -[NTKComplicationController _updateActive](self, "_updateActive");
  if (-[NSMutableArray count](self->_displayWrappers, "count") == 1)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationController _configureForLegacyDisplay:](self, "_configureForLegacyDisplay:", v6);

  }
}

- (void)enumerateDisplayWrappersWithBlock:(id)a3
{
  id v4;
  NSMutableArray *displayWrappers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  displayWrappers = self->_displayWrappers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__NTKComplicationController_enumerateDisplayWrappersWithBlock___block_invoke;
  v7[3] = &unk_1E6BD9558;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayWrappers, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __63__NTKComplicationController_enumerateDisplayWrappersWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CDComplicationDisplay)legacyDisplay
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_legacyDisplayDEPRECATED);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[NSMutableArray firstObject](self->_displayWrappers, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "display");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CDComplicationDisplay *)v5;
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_openAppWithURL:(id)a3 forDisplayWrapper:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NTKComplicationController complicationApplicationIdentifier](self, "complicationApplicationIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationController _openApp:withURL:forDisplayWrapper:result:](self, "_openApp:withURL:forDisplayWrapper:result:", v8, v7, v6, 0);

}

- (void)_openApp:(id)a3 withURL:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NTKComplicationController displayPropertiesForDisplayWrapper:](self, "displayPropertiesForDisplayWrapper:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "launchLocation");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "willPerformAppLaunchForComplication:", self);
  NTKLaunchApp(v12);

}

- (void)_openUserActivity:(id)a3 forApp:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[NTKComplicationController displayPropertiesForDisplayWrapper:](self, "displayPropertiesForDisplayWrapper:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "launchLocation");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  NTKOpenUserActivity(v12, v11, v14, v10);
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

- (void)_updateActive
{
  _BOOL4 active;
  uint64_t v4;

  active = self->_active;
  v4 = -[NSMutableArray count](self->_displayWrappers, "count");
  if (active)
  {
    if (!v4 && !-[NSHashTable count](self->_assertions, "count"))
      -[NTKComplicationController deactivate](self, "deactivate");
  }
  else if (v4 || -[NSHashTable count](self->_assertions, "count"))
  {
    -[NTKComplicationController activate](self, "activate");
  }
}

- (void)addDataModeAssertion:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSHashTable addObject:](self->_assertions, "addObject:", v4);

  -[NTKComplicationController _updateActive](self, "_updateActive");
  -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 0);
}

- (void)updateDataModeAssertion:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 0);
}

- (void)removeDataModeAssertion:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSHashTable removeObject:](self->_assertions, "removeObject:", v4);

  -[NTKComplicationController _updateActive](self, "_updateActive");
  -[NTKComplicationController _updateInternalModes:](self, "_updateInternalModes:", 0);
}

- (void)setTouchObserver:(id)a3 forDisplayWrapper:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[NSMutableArray containsObject:](self->_displayWrappers, "containsObject:", v6))
    -[NSMapTable setObject:forKey:](self->_displayWrappersToTouchObservers, "setObject:forKey:", v7, v6);

}

- (NTKComplication)complication
{
  return self->_complication;
}

- (int64_t)complicationFamily
{
  return self->_complicationFamily;
}

- (CLKDevice)device
{
  return self->_device;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)pauseDate
{
  return self->_pauseDate;
}

- (void)setPauseDate:(id)a3
{
  objc_storeStrong((id *)&self->_pauseDate, a3);
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (void)setShowsLockedUI:(BOOL)a3
{
  self->_showsLockedUI = a3;
}

- (BOOL)isFaceZooming
{
  return self->_faceZooming;
}

- (int64_t)cachingMode
{
  return self->_cachingMode;
}

- (int64_t)updatingMode
{
  return self->_updatingMode;
}

- (int64_t)animationMode
{
  return self->_animationMode;
}

- (int64_t)effectiveFaceDataMode
{
  return self->_effectiveFaceDataMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseDate, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_displayWrappersToTouchObservers, 0);
  objc_storeStrong((id *)&self->_displayWrappersToDisplayProperties, 0);
  objc_storeStrong((id *)&self->_displayWrappers, 0);
  objc_destroyWeak((id *)&self->_legacyDisplayDEPRECATED);
}

@end
