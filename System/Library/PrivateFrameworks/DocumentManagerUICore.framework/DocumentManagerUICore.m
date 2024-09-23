void sub_2172C7438(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C75B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2172C7C4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id DOCConstraintsToResizeWithReferenceView(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v11 = a1;
  v12 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  objc_msgSend(v11, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v19);

  objc_msgSend(v11, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v22);

  objc_msgSend(v11, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v25);

  return v13;
}

void sub_2172C8AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2172C9004(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C94C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C95A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C975C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C9818(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172C9900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2172C99A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CA744(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CA804(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CA888(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CA9BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CAC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id getICQInAppMessageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getICQInAppMessageClass_softClass;
  v7 = getICQInAppMessageClass_softClass;
  if (!getICQInAppMessageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getICQInAppMessageClass_block_invoke;
    v3[3] = &unk_24D72AE60;
    v3[4] = &v4;
    __getICQInAppMessageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2172CBB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getICQInAppMessageClass_block_invoke(uint64_t a1)
{
  Class result;

  iCloudQuotaUILibrary();
  result = objc_getClass("ICQInAppMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getICQInAppMessageClass_block_invoke_cold_1();
  getICQInAppMessageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t iCloudQuotaUILibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = iCloudQuotaUILibraryCore();
  if (!result)
    iCloudQuotaUILibrary_cold_1(&v1);
  return result;
}

uint64_t iCloudQuotaUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = iCloudQuotaUILibraryCore_frameworkLibrary;
  v6 = iCloudQuotaUILibraryCore_frameworkLibrary;
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D72AE38;
    v8 = *(_OWORD *)&off_24D72AE48;
    v1 = _sl_dlopen();
    v4[3] = v1;
    iCloudQuotaUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2172CBCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getICQInAppMessagingClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getICQInAppMessagingClass_softClass;
  v7 = getICQInAppMessagingClass_softClass;
  if (!getICQInAppMessagingClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getICQInAppMessagingClass_block_invoke;
    v3[3] = &unk_24D72AE60;
    v3[4] = &v4;
    __getICQInAppMessagingClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2172CBD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *getICQInAppMessageKeySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getICQInAppMessageKeySymbolLoc_ptr;
  v6 = getICQInAppMessageKeySymbolLoc_ptr;
  if (!getICQInAppMessageKeySymbolLoc_ptr)
  {
    v1 = (void *)iCloudQuotaUILibrary();
    v0 = dlsym(v1, "ICQInAppMessageKey");
    v4[3] = (uint64_t)v0;
    getICQInAppMessageKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2172CBE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getICQInAppMessageKey()
{
  id *ICQInAppMessageKeySymbolLoc;

  ICQInAppMessageKeySymbolLoc = (id *)getICQInAppMessageKeySymbolLoc();
  if (!ICQInAppMessageKeySymbolLoc)
    getICQInAppMessageKey_cold_1();
  return *ICQInAppMessageKeySymbolLoc;
}

void *getICQCurrentInAppMessageChangedNotificationSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  v6 = getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  if (!getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)iCloudQuotaUILibrary();
    v0 = dlsym(v1, "ICQCurrentInAppMessageChangedNotification");
    v4[3] = (uint64_t)v0;
    getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2172CBEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getICQCurrentInAppMessageChangedNotification()
{
  id *ICQCurrentInAppMessageChangedNotificationSymbolLoc;

  ICQCurrentInAppMessageChangedNotificationSymbolLoc = (id *)getICQCurrentInAppMessageChangedNotificationSymbolLoc();
  if (!ICQCurrentInAppMessageChangedNotificationSymbolLoc)
    getICQCurrentInAppMessageChangedNotification_cold_1();
  return *ICQCurrentInAppMessageChangedNotificationSymbolLoc;
}

Class __getICQInAppMessagingClass_block_invoke(uint64_t a1)
{
  Class result;

  iCloudQuotaUILibrary();
  result = objc_getClass("ICQInAppMessaging");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getICQInAppMessagingClass_block_invoke_cold_1();
  getICQInAppMessagingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id DOCConstraintsToResizeWithSuperview(void *a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v14[0] = a1;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a1;
  objc_msgSend(v9, "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DOCConstraintsToResizeViewsWithSuperview(v11, a2, a3, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id DOCConstraintsToResizeViewsWithSuperview(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4 * objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "superview", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        DOCConstraintsToResizeWithReferenceView(v16, v17, a2, a3, a4, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

void sub_2172CC7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 48), 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_2172CD848(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v4 - 160), 8);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

DOCThumbnailFittingImageView *DOCNewThumbnailFittingImageView(void *a1, double a2, double a3)
{
  id v5;
  DOCThumbnailFittingImageView *v6;

  v5 = a1;
  v6 = -[DOCThumbnailFittingImageView initWithSize:url:]([DOCThumbnailFittingImageView alloc], "initWithSize:url:", v5, a2, a3);

  return v6;
}

void sub_2172CF28C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CF380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2172CF3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2172CF448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
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

void DOCDocumentPickerExtensionUpdateWithConfiguration(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "_setPickerMode:", objc_msgSend(v3, "interactionMode"));
  v5 = (void *)MEMORY[0x24BDF8238];
  objc_msgSend(v3, "documentContentTypes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doc_identifiersForContentTypes:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPickableTypes:", v6);

}

id DOCLogHandle()
{
  void **v0;
  void *v1;

  v0 = (void **)MEMORY[0x24BE2DF90];
  v1 = (void *)*MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v1 = *v0;
  }
  return v1;
}

DOCOpenLocationIntent *DOCCreateDefaultHomeScreenWidgetIntent()
{
  DOCIntentLocation *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  DOCIntentLocation *v4;
  void *v5;
  DOCOpenLocationIntent *v6;

  v0 = [DOCIntentLocation alloc];
  v1 = *MEMORY[0x24BE2DE38];
  _DocumentManagerBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Recents"), CFSTR("Recents"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DOCIntentLocation initWithIdentifier:displayString:](v0, "initWithIdentifier:displayString:", v1, v3);

  objc_msgSend(MEMORY[0x24BDD9DA8], "systemImageNamed:", CFSTR("folder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCIntentLocation setDisplayImage:](v4, "setDisplayImage:", v5);

  -[DOCIntentLocation setLocationType:](v4, "setLocationType:", CFSTR("recents"));
  -[DOCIntentLocation setLocationIdentifier:](v4, "setLocationIdentifier:", v1);
  v6 = objc_alloc_init(DOCOpenLocationIntent);
  -[DOCOpenLocationIntent _setLaunchId:](v6, "_setLaunchId:", CFSTR("com.apple.DocumentsApp"));
  -[DOCOpenLocationIntent _setExtensionBundleId:](v6, "_setExtensionBundleId:", CFSTR("com.apple.DocumentManagerUICore.RecentsAvocadoIntentHandler"));
  -[DOCOpenLocationIntent setLocation:](v6, "setLocation:", v4);

  return v6;
}

id DOCConstraintsToResizeWithSuperviewSafeArea(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v9 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  objc_msgSend(v9, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v19, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v20);

  objc_msgSend(v9, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v24, -a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v25);

  objc_msgSend(v9, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29, -a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v30);

  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_3);
  return v10;
}

id DOCConstraintWithPriority(void *a1, float a2)
{
  id v3;
  double v4;

  v3 = a1;
  *(float *)&v4 = a2;
  objc_msgSend(v3, "setPriority:", v4);
  return v3;
}

id DOCConstraintsWithPriority(void *a1, float a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  float v10;

  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a1;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __DOCConstraintsWithPriority_block_invoke;
  v8[3] = &unk_24D72ADF0;
  v6 = v5;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void iCloudQuotaUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *iCloudQuotaUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DOCDocumentManagerUICoreSoftLinking.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getICQInAppMessageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getICQInAppMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DOCDocumentManagerUICoreSoftLinking.m"), 14, CFSTR("Unable to find class %s"), "ICQInAppMessage");

  __break(1u);
}

void __getICQInAppMessagingClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getICQInAppMessagingClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DOCDocumentManagerUICoreSoftLinking.m"), 15, CFSTR("Unable to find class %s"), "ICQInAppMessaging");

  __break(1u);
}

void getICQCurrentInAppMessageChangedNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "typeof (((typeof (ICQCurrentInAppMessageChangedNotification) (*)(void))0)()) getICQCurrentInAppMessageChangedNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DOCDocumentManagerUICoreSoftLinking.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void getICQInAppMessageKey_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "typeof (((typeof (ICQInAppMessageKey) (*)(void))0)()) getICQInAppMessageKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DOCDocumentManagerUICoreSoftLinking.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t DOCAdaptSizeToRect()
{
  return MEMORY[0x24BE2DD18]();
}

uint64_t DOCFrameworkBundle()
{
  return MEMORY[0x24BE2DD40]();
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x24BE2DE58]();
}

uint64_t DOCProviderDomainIDIsSharedServerDomainID()
{
  return MEMORY[0x24BE2DE90]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x24BE2DEA0]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x24BDD9AF0]();
}

uint64_t NLSearchParseCandidateCopyAttributedInput()
{
  return MEMORY[0x24BE6B248]();
}

uint64_t NLSearchParserCopyParseWithOptions()
{
  return MEMORY[0x24BE6B250]();
}

uint64_t NLSearchParserCreate()
{
  return MEMORY[0x24BE6B258]();
}

uint64_t NLSearchParserSetContext()
{
  return MEMORY[0x24BE6B260]();
}

uint64_t NLSearchParserSetIndex()
{
  return MEMORY[0x24BE6B268]();
}

uint64_t NLSearchParserSetString()
{
  return MEMORY[0x24BE6B270]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x24BDD0BD0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BDF7CA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x24BE2DF48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x24BDADD30](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

