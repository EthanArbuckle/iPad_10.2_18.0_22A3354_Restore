@implementation NTKFaceBundle

- (NSNumber)legacyFaceStyle
{
  return 0;
}

+ (id)localizedStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5
{
  return (id)objc_msgSend(a1, "_localizedStringForKey:table:suffix:comment:", a3, CFSTR("Localizable"), a4, a5);
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return (id)objc_msgSend(a1, "localizedStringForKey:tableSuffix:comment:", a3, 0, a4);
}

- (BOOL)isHardwareSpecific
{
  return 0;
}

- (NSString)galleryDescriptionText
{
  return 0;
}

+ (id)localizedStringForKey:(id)a3 table:(id)a4 comment:(id)a5
{
  return (id)objc_msgSend(a1, "_localizedStringForKey:table:suffix:comment:", a3, a4, 0, a5);
}

- (id)heroFacesForDevice:(id)a3
{
  return 0;
}

+ (id)_localizedStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("Companion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("-%@"), v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v9, CFSTR("NTKFaceBundleNotFound"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("NTKFaceBundleNotFound")))
  {
    v16 = v10;
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("-%@"), v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v17;
    }
    objc_msgSend(v12, "localizedStringForKey:value:table:", v9, &stru_1E6BDC918, v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }

  return v15;
}

+ (NSString)identifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NTKFaceBundle)init
{
  NTKFaceBundle *v2;
  uint64_t v3;
  NSMutableSet *observers;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *observerQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKFaceBundle;
  v2 = -[NTKFaceBundle init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    if (objc_msgSend((id)objc_opt_class(), "supportsGalleryObserverNotifications"))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.NanoTimeKit.FaceBundleObserverQueue.%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_retainAutorelease(v7);
      v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), v8);
      observerQueue = v2->_observerQueue;
      v2->_observerQueue = (OS_dispatch_queue *)v10;

    }
  }
  return v2;
}

+ (NSString)analyticsIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:](NTKFace, "defaultAnalyticsIdentifierForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFaceBundle defaultFaceForDevice:](self, "defaultFaceForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceSupportsPigmentEditOption"))
  {
    -[NTKFaceBundle galleryDefaultPigmentOptionsForDevice:](self, "galleryDefaultPigmentOptionsForDevice:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
            -[NTKFaceBundle defaultFaceForDevice:](self, "defaultFaceForDevice:", v4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "selectOption:forCustomEditMode:slot:", v13, 10, 0);
              objc_msgSend(v7, "addObject:", v15);
            }

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      v16 = (void *)objc_msgSend(v7, "copy");
      v6 = v18;
    }
    else
    {
      v23 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)galleryDefaultPigmentOptionsForDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NTKFaceBundle defaultFaceForDevice:](self, "defaultFaceForDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsPigmentEditOption"))
  {
    -[objc_class pigmentFaceDomain](-[NTKFaceBundle faceClass](self, "faceClass"), "pigmentFaceDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", -[NTKFaceBundle faceClass](self, "faceClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultGalleryColorsForDomain:bundle:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "count"))
    {
      +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pigmentSetForDomain:bundle:", v5, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pigmentsFromMostRecentAddableCollectionsForSlot:", 0);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    if (!objc_msgSend(v8, "count"))
    {
      +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pigmentSetForDomain:bundle:", v5, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionForSlot:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultOption");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v18[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)prideFacesForDevice:(id)a3
{
  return 0;
}

- (id)unityFacesForDevice:(id)a3
{
  return 0;
}

- (id)artistFacesForDevice:(id)a3
{
  return 0;
}

- (void)addObserver:(id)a3
{
  NSObject *observerQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsGalleryObserverNotifications"))
  {
    observerQueue = self->_observerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__NTKFaceBundle_addObserver___block_invoke;
    block[3] = &unk_1E6BCD778;
    block[4] = self;
    v7 = v5;
    dispatch_sync(observerQueue, block);

  }
}

uint64_t __29__NTKFaceBundle_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  NSObject *observerQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsGalleryObserverNotifications"))
  {
    observerQueue = self->_observerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__NTKFaceBundle_removeObserver___block_invoke;
    block[3] = &unk_1E6BCD778;
    block[4] = self;
    v7 = v5;
    dispatch_sync(observerQueue, block);

  }
}

uint64_t __32__NTKFaceBundle_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (BOOL)supportsGalleryObserverNotifications
{
  return 0;
}

- (void)notifyObserversGalleryFacesDidUpdate
{
  NSObject *observerQueue;
  _QWORD v4[4];
  id v5;
  id location;

  if (objc_msgSend((id)objc_opt_class(), "supportsGalleryObserverNotifications"))
  {
    objc_initWeak(&location, self);
    observerQueue = self->_observerQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke;
    v4[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v5, &location);
    dispatch_async(observerQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_enumerateObserversWithBlock:", &__block_literal_global_16);
    WeakRetained = v2;
  }

}

uint64_t __63__NTKFaceBundle_Internal__notifyObserversGalleryFacesDidUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "galleryFacesDidUpdate");
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4;
  NSMutableSet *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NTKFaceBundle_Internal___enumerateObserversWithBlock___block_invoke;
  v7[3] = &unk_1E6BCEED0;
  v8 = v4;
  v6 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](observers, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __56__NTKFaceBundle_Internal___enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)argon_generateNotificationContentWithCompletion:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v10[0] = CFSTR("description");
    v10[1] = CFSTR("faceBundleClass");
    v11[0] = CFSTR("Notification content not supported for face bundle");
    v5 = a3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 100, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))a3 + 2))(v5, 0, 0, v9);

  }
}

+ (unint64_t)argon_defaultNotificationAction
{
  return 0;
}

+ (id)imageWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)logObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (!logObject__logConnections)
  {
    v4 = objc_opt_new();
    v5 = (void *)logObject__logConnections;
    logObject__logConnections = v4;

  }
  objc_msgSend(a1, "logCategoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)logObject__logConnections, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = objc_retainAutorelease(v6);
    v7 = os_log_create("NanoTimeKit", (const char *)objc_msgSend(v8, "UTF8String"));
    if (v8)
      objc_msgSend((id)logObject__logConnections, "setObject:forKey:", v7, v8);
  }

  objc_sync_exit(v3);
  return v7;
}

- (id)heroPride2020DefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryFDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryEDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroGloryBDefaultFacesForDevice:(id)a3
{
  return 0;
}

- (id)heroLegacyDefaultFacesForDevice:(id)a3
{
  return 0;
}

+ (id)localizedMarkdownStringForKey:(id)a3 comment:(id)a4
{
  return (id)objc_msgSend(a1, "localizedMarkdownStringForKey:tableSuffix:comment:", a3, 0, a4);
}

+ (id)localizedMarkdownStringForKey:(id)a3 tableSuffix:(id)a4 comment:(id)a5
{
  return (id)objc_msgSend(a1, "_localizedMarkdownStringForKey:table:suffix:comment:", a3, CFSTR("Localizable"), a4, a5);
}

+ (id)localizedMarkdownStringForKey:(id)a3 table:(id)a4 comment:(id)a5
{
  return (id)objc_msgSend(a1, "_localizedMarkdownStringForKey:table:suffix:comment:", a3, a4, 0, a5);
}

+ (id)_localizedMarkdownStringForKey:(id)a3 table:(id)a4 suffix:(id)a5 comment:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("Companion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("-%@"), v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v12, "ntk_localizedMarkdownStringForKey:value:table:", v9, CFSTR("NTKFaceBundleNotFound"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length")
    || objc_msgSend(v15, "isEqualToString:", CFSTR("NTKFaceBundleNotFound")))
  {
    v16 = v10;
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("-%@"), v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v17;
    }
    objc_msgSend(v12, "ntk_localizedMarkdownStringForKey:value:table:", v9, &stru_1E6BDC918, v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }

  return v15;
}

- (id)faceFromShareSheetSidecarDirectory:(id)a3
{
  return 0;
}

- (BOOL)companionShouldDisplayDebugMenuForFace:(id)a3
{
  return 0;
}

- (id)viewControllerForCompanionDebugMenuWithFace:(id)a3
{
  return 0;
}

- (BOOL)useDynamicCollectionForDevice:(id)a3
{
  return 0;
}

- (id)galleryFacesInDynamicCollectionForDevice:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (Class)faceClass
{
  Class result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (Class)faceViewClass
{
  Class result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 12, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)galleryTitle
{
  NSString *result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

@end
