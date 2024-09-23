void sub_100004124(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchViewController"));
  objc_msgSend(v1, "searchViewDidPresentFromSource:", 1);

}

uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  v4 = (objc_class *)objc_opt_class(SPUIApplication);
  v5 = NSStringFromClass(v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (objc_class *)objc_opt_class(SPUIAppDelegate);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = UIApplicationMain(a1, a2, v6, v9);

  return v10;
}

void sub_10000454C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t isKindOfClass;
  NSObject *v6;
  _BOOL8 v7;
  NSObject *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  int v13;

  v3 = a2;
  v4 = objc_opt_class(SPUISearchViewMutableClientSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  if ((isKindOfClass & 1) != 0)
  {
    v6 = spuiLogHandles[3];
    if (!v6)
    {
      SPUIInitLogging(isKindOfClass);
      v6 = spuiLogHandles[3];
    }
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v7)
      sub_100006B5C(a1, v6);
    v8 = spuiLogHandles[3];
    if (!v8)
    {
      SPUIInitLogging(v7);
      v8 = spuiLogHandles[3];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100006AA4(a1, v8);
    v9 = v3;
    objc_msgSend(v9, "setDistanceToTopOfIcons:", *(double *)(a1 + 64));
    objc_msgSend(v9, "setSearchHeaderLayerRenderID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "setSearchHeaderContextID:", *(unsigned int *)(a1 + 120));
    objc_msgSend(v9, "setSearchHeaderBackgroundLayerRenderID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v9, "setSearchHeaderBackgroundContextID:", *(unsigned int *)(a1 + 124));
    objc_msgSend(v9, "setKeyboardHeight:", *(double *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "keyboardProtectorHeight");
    v11 = v10;
    v12 = *(double *)(a1 + 56);
    v13 = *(unsigned __int8 *)(a1 + 132);
    if (*(_BYTE *)(a1 + 133))
    {
      objc_msgSend(v9, "setKeyboardPresented:", *(unsigned __int8 *)(a1 + 134));
      if (v13 && !*(_BYTE *)(a1 + 134))
        goto LABEL_14;
    }
    else if (*(_BYTE *)(a1 + 132))
    {
      goto LABEL_14;
    }
    objc_msgSend(v9, "setKeyboardProtectorHeight:", v11 + v12);
LABEL_14:
    objc_msgSend(v9, "setSearchBarSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(v9, "setDockedSearchBarSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(v9, "setSearchBarCornerRadius:", *(double *)(a1 + 104));
    objc_msgSend(v9, "setSearchHeaderBlurContextID:", *(unsigned int *)(a1 + 128));
    objc_msgSend(v9, "setSearchHeaderBlurLayerRenderID:", *(_QWORD *)(a1 + 112));

  }
}

void sub_100005500(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100012570;
  qword_100012570 = (uint64_t)v1;

}

void sub_1000056AC(id a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = spuiLogHandles[0];
  if (!spuiLogHandles[0])
  {
    SPUIInitLogging(a1);
    v1 = spuiLogHandles[0];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    sub_100006950(v1, v2, v3, v4, v5, v6, v7, v8);
}

void sub_1000057F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005B6C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_opt_class(SPUISearchBarMutableClientSceneSettings);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    objc_msgSend(v4, "setHeaderHeight:", *(double *)(a1 + 32));

}

FBSSceneTransitionContext *__cdecl sub_100005D78(id a1, FBSMutableSceneClientSettings *a2)
{
  void *v2;

  v2 = (void *)objc_opt_new(SPUISearchBarTransitionContext);
  objc_msgSend(v2, "setSearchBarDidFocus:", 1);
  return (FBSSceneTransitionContext *)v2;
}

void sub_100005F80(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("restorationQueue", v3);
  v5 = (void *)qword_100012568;
  qword_100012568 = (uint64_t)v4;

}

void sub_1000060B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000060D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000060E0(uint64_t a1)
{

}

void sub_1000060E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restorationUrl"));
  v16 = 0;
  v3 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v2, 0, &v16));
  v4 = v16;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v15 = 0;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decompressedDataUsingAlgorithm:error:", 0, &v15));
  v9 = v15;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (!v4)
    goto LABEL_5;
  v13 = spuiLogHandles[5];
  if (!v13)
  {
    SPUIInitLogging(v12);
    v13 = spuiLogHandles[5];
  }
  v12 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    sub_1000069E4();
    if (!v9)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (!v9)
      goto LABEL_10;
  }
  v14 = spuiLogHandles[5];
  if (!v14)
  {
    SPUIInitLogging(v12);
    v14 = spuiLogHandles[5];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_100006984();
LABEL_10:

}

void sub_1000062D0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  NSData *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSData *v16;
  void *v17;
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restorationUrl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restorationUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v9 = objc_opt_new(NSData);
    objc_msgSend(v6, "createFileAtPath:contents:attributes:", v8, v9, 0);

  }
  v10 = (NSData *)*(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v11 = *(void **)(a1 + 32);
    v18 = 0;
    v12 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "compressedDataUsingAlgorithm:error:", 0, &v18));
    v13 = v18;

    if (v13)
    {
      v15 = spuiLogHandles[5];
      if (!v15)
      {
        SPUIInitLogging(v14);
        v15 = spuiLogHandles[5];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100006A44();
      v16 = objc_opt_new(NSData);

      v12 = v16;
    }

    v10 = v12;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restorationUrl"));
  -[NSData writeToURL:atomically:](v10, "writeToURL:atomically:", v17, 0);

}

void sub_100006480(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchViewController"));
  objc_msgSend(v1, "purgeMemory");

}

FBSSceneTransitionContext *__cdecl sub_100006600(id a1, FBSMutableSceneClientSettings *a2)
{
  void *v2;

  v2 = (void *)objc_opt_new(SPUISearchViewSceneTransitionContext);
  objc_msgSend(v2, "setShouldBackground:", 1);
  return (FBSSceneTransitionContext *)v2;
}

FBSSceneTransitionContext *__cdecl sub_100006688(id a1, FBSMutableSceneClientSettings *a2)
{
  void *v2;

  v2 = (void *)objc_opt_new(SPUISearchViewSceneTransitionContext);
  objc_msgSend(v2, "setShouldDismiss:", 1);
  return (FBSSceneTransitionContext *)v2;
}

void sub_100006740(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000067C0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006800(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1000067C0(&qword_1000124A8);
  v1 = swift_allocObject(v0, 64, 7);
  *(_OWORD *)(v1 + 16) = xmmword_1000087F0;
  v2 = type metadata accessor for SpotlightUISharedPackage(0);
  v3 = sub_100006800(&qword_1000124B0, (uint64_t (*)(uint64_t))&type metadata accessor for SpotlightUISharedPackage, (uint64_t)&protocol conformance descriptor for SpotlightUISharedPackage);
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  v4 = type metadata accessor for SearchUIAppIntentsPackage(0);
  v5 = sub_100006800(&qword_1000124B8, (uint64_t (*)(uint64_t))&type metadata accessor for SearchUIAppIntentsPackage, (uint64_t)&protocol conformance descriptor for SearchUIAppIntentsPackage);
  *(_QWORD *)(v1 + 48) = v4;
  *(_QWORD *)(v1 + 56) = v5;
  return v1;
}

ValueMetadata *type metadata accessor for SpotlightAppPackage()
{
  return &type metadata for SpotlightAppPackage;
}

uint64_t sub_1000068EC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9SpotlightP33_978A511CD15EB783823476D14103BA4F19ResourceBundleClass);
}

void sub_10000691C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057F4((void *)&_mh_execute_header, a1, a3, "Spotlight is terminating", a5, a6, a7, a8, 0);
}

void sub_100006950(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057F4((void *)&_mh_execute_header, a1, a3, "Spotlight flushed feedback on terminate", a5, a6, a7, a8, 0);
}

void sub_100006984()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006750();
  sub_100006740((void *)&_mh_execute_header, v0, v1, "failed to decompress data with error %@", v2, v3, v4, v5, v6);
  sub_10000675C();
}

void sub_1000069E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006750();
  sub_100006740((void *)&_mh_execute_header, v0, v1, "failed to get restoration data with error %@", v2, v3, v4, v5, v6);
  sub_10000675C();
}

void sub_100006A44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006750();
  sub_100006740((void *)&_mh_execute_header, v0, v1, "failed to compress data with error %@", v2, v3, v4, v5, v6);
  sub_10000675C();
}

void sub_100006AA4(uint64_t a1, void *a2)
{
  float v2;
  NSObject *v3;
  double v4;
  void *v5;
  uint8_t v6[24];

  v2 = *(double *)(a1 + 64);
  v3 = a2;
  *(float *)&v4 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  sub_100006750();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "distanceToTop %@", v6, 0xCu);

}

void sub_100006B5C(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 120)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124)));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 56)));
  v10 = 138413314;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Header Setting renderID: %@, contextID: %@, backgroundRenderID:%@, backgroundContextId:%@ keyboardHeight:%@", (uint8_t *)&v10, 0x34u);

}

void sub_100006CAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006750();
  sub_100006740((void *)&_mh_execute_header, v0, v1, "Failed to archive restoration context with error %@", v2, v3, v4, v5, v6);
  sub_10000675C();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_FBSScene");
}

id objc_msgSend__extendLaunchTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extendLaunchTest");
}

id objc_msgSend__registerSettingsDiffActionArray_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSettingsDiffActionArray:forKey:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scene");
}

id objc_msgSend__setKeepContextAssociationInBackground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setKeepContextAssociationInBackground:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_addMenusToBuilder_forFocusEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMenusToBuilder:forFocusEnvironment:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundBlurView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundBlurView");
}

id objc_msgSend_backgroundSearchScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundSearchScene");
}

id objc_msgSend_bottomSearchFieldEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomSearchFieldEnabled");
}

id objc_msgSend_compressedDataUsingAlgorithm_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compressedDataUsingAlgorithm:error:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextId");
}

id objc_msgSend_createAdditionalHeaderView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAdditionalHeaderView");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentIntent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentIntent");
}

id objc_msgSend_currentPresentationSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPresentationSource");
}

id objc_msgSend_currentRevealProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRevealProgress");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_decompressedDataUsingAlgorithm_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decompressedDataUsingAlgorithm:error:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_didSizeWithHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSizeWithHeight:");
}

id objc_msgSend_distanceToTopOfAppIcons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distanceToTopOfAppIcons");
}

id objc_msgSend_dockedUnifiedFieldSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dockedUnifiedFieldSize");
}

id objc_msgSend_enableFloatingWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFloatingWindow");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_feedbackListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedbackListener");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_flushFeedbackWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushFeedbackWithCompletion:");
}

id objc_msgSend_focusSystemForEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "focusSystemForEnvironment:");
}

id objc_msgSend_focusedItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "focusedItem");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_headerHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerHeight");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerView");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initWithEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEvent:");
}

id objc_msgSend_initWithNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNavigationController:");
}

id objc_msgSend_initWithSearchViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchViewController:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInHardwareKeyboardMode");
}

id objc_msgSend_isUnifiedFieldDocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUnifiedFieldDocked");
}

id objc_msgSend_keyboardProtectorHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardProtectorHeight");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_legibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legibilitySettings");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyWindow");
}

id objc_msgSend_navController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navController");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_platterViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterViewController");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_postMemoryWarningAndPerformBlockIfOverInactiveLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postMemoryWarningAndPerformBlockIfOverInactiveLimit:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_presentationIntent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationIntent");
}

id objc_msgSend_presentationSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationSource");
}

id objc_msgSend_purgeMemory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeMemory");
}

id objc_msgSend_releaseVisionCachedResources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseVisionCachedResources");
}

id objc_msgSend_restorationData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorationData");
}

id objc_msgSend_restorationDataQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorationDataQueue");
}

id objc_msgSend_restorationUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorationUrl");
}

id objc_msgSend_revealProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revealProgress");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_runTest_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTest:options:");
}

id objc_msgSend_saveRestorationData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRestorationData:");
}

id objc_msgSend_searchBarWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchBarWindow");
}

id objc_msgSend_searchField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchField");
}

id objc_msgSend_searchProtectorLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchProtectorLayer");
}

id objc_msgSend_searchViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewController");
}

id objc_msgSend_searchViewDidDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidDisappear:");
}

id objc_msgSend_searchViewDidDismissWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidDismissWithReason:");
}

id objc_msgSend_searchViewDidPresentFromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidPresentFromSource:");
}

id objc_msgSend_searchViewDidUpdatePresentationProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidUpdatePresentationProgress:");
}

id objc_msgSend_searchViewRestorationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewRestorationContext");
}

id objc_msgSend_searchViewWillDismissWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewWillDismissWithReason:");
}

id objc_msgSend_searchViewWillPresentFromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewWillPresentFromSource:");
}

id objc_msgSend_searchViewWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewWindow");
}

id objc_msgSend_sendPresentationFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPresentationFeedback");
}

id objc_msgSend_setActiveInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveInterfaceOrientation:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCurrentIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentIntent:");
}

id objc_msgSend_setCurrentPresentationSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPresentationSource:");
}

id objc_msgSend_setCurrentRevealProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentRevealProgress:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDistanceToTopOfIcons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistanceToTopOfIcons:");
}

id objc_msgSend_setDockedSearchBarSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDockedSearchBarSize:");
}

id objc_msgSend_setHeaderHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderHeight:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setInteractionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteractionDelegate:");
}

id objc_msgSend_setKeyboardHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardHeight:");
}

id objc_msgSend_setKeyboardPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardPresented:");
}

id objc_msgSend_setKeyboardProtectorHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardProtectorHeight:");
}

id objc_msgSend_setLegibilitySettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegibilitySettings:");
}

id objc_msgSend_setNavController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavController:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setPlatterViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatterViewController:");
}

id objc_msgSend_setRestorationData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestorationData:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSearchBarCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchBarCornerRadius:");
}

id objc_msgSend_setSearchBarDidFocus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchBarDidFocus:");
}

id objc_msgSend_setSearchBarSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchBarSize:");
}

id objc_msgSend_setSearchBarWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchBarWindow:");
}

id objc_msgSend_setSearchHeaderBackgroundContextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderBackgroundContextID:");
}

id objc_msgSend_setSearchHeaderBackgroundLayerRenderID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderBackgroundLayerRenderID:");
}

id objc_msgSend_setSearchHeaderBlurContextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderBlurContextID:");
}

id objc_msgSend_setSearchHeaderBlurLayerRenderID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderBlurLayerRenderID:");
}

id objc_msgSend_setSearchHeaderContextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderContextID:");
}

id objc_msgSend_setSearchHeaderLayerRenderID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchHeaderLayerRenderID:");
}

id objc_msgSend_setSearchViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchViewController:");
}

id objc_msgSend_setSearchViewWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchViewWindow:");
}

id objc_msgSend_setShouldBackground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldBackground:");
}

id objc_msgSend_setShouldDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDismiss:");
}

id objc_msgSend_setUnifiedFieldController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnifiedFieldController:");
}

id objc_msgSend_setUnifiedFieldViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnifiedFieldViewController:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindowScene:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showCancelButton_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCancelButton:animated:");
}

id objc_msgSend_sizeBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeBar");
}

id objc_msgSend_sizeForInterfaceOrientation_inputDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeForInterfaceOrientation:inputDelegate:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_unifiedFieldController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedFieldController");
}

id objc_msgSend_unifiedFieldCornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedFieldCornerRadius");
}

id objc_msgSend_unifiedFieldSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedFieldSize");
}

id objc_msgSend_unifiedFieldViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedFieldViewController");
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientSettingsWithBlock:");
}

id objc_msgSend_updateClientSettingsWithTransitionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientSettingsWithTransitionBlock:");
}

id objc_msgSend_updateSearchViewClientSceneSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSearchViewClientSceneSettings");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}
