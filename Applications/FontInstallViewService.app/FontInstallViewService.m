void sub_1000026E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

void sub_100004924()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_100005294(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *location)
{
  uint64_t v30;

  *(_QWORD *)(v30 - 144) = a1;
  *(_DWORD *)(v30 - 148) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v30 - 88));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 144));
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_1000058DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_10000AB68(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location)
{
  uint64_t v20;

  *(_QWORD *)(v20 - 176) = a1;
  *(_DWORD *)(v20 - 180) = a2;
  objc_destroyWeak((id *)(v20 - 136));
  objc_destroyWeak((id *)(v20 - 120));
  _Unwind_Resume(*(_Unwind_Exception **)(v20 - 176));
}

void sub_10000B09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v3;
  NSString *v5;
  void *context;
  int v9;

  context = objc_autoreleasePoolPush();
  v3 = (objc_class *)objc_opt_class(AppDelegate);
  v5 = NSStringFromClass(v3);
  v9 = UIApplicationMain(argc, (char **)argv, 0, v5);

  objc_autoreleasePoolPop(context);
  return v9;
}

void FSLog(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  os_log_t oslog;
  id v12[2];
  id v13;
  id location;
  uint8_t v15[24];

  location = 0;
  objc_storeStrong(&location, a1);
  v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  v9 = objc_alloc((Class)NSString);
  v12[0] = objc_msgSend(v9, "initWithFormat:arguments:", v13, &a9);
  oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)objc_msgSend(objc_retainAutorelease(v12[0]), "UTF8String"));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

id LogForCategory(id obj)
{
  id v2;
  id v3;
  id location;
  id v5;
  dispatch_once_t *v6;

  location = 0;
  objc_storeStrong(&location, obj);
  v6 = (dispatch_once_t *)&LogForCategory_onceToken;
  v5 = 0;
  objc_storeStrong(&v5, &__block_literal_global_3);
  if (*v6 != -1)
    dispatch_once(v6, v5);
  objc_storeStrong(&v5, 0);
  v3 = objc_msgSend((id)gLogsDict, "objectForKey:", location);
  if (!v3)
  {
    NSLog(CFSTR("FontServices - unknown log category."));
    objc_storeStrong(&v3, &_os_log_default);
  }
  v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);
  return v2;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void FSLog_Debug(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  os_log_t oslog;
  id v12[2];
  id v13;
  id location;
  uint8_t v15[24];

  location = 0;
  objc_storeStrong(&location, a1);
  v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  v9 = objc_alloc((Class)NSString);
  v12[0] = objc_msgSend(v9, "initWithFormat:arguments:", v13, &a9);
  oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)objc_msgSend(objc_retainAutorelease(v12[0]), "UTF8String"));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

void FSLog_Error(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  os_log_t oslog;
  id v12[2];
  id v13;
  id location;
  uint8_t v15[24];

  location = 0;
  objc_storeStrong(&location, a1);
  v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  v9 = objc_alloc((Class)NSString);
  v12[0] = objc_msgSend(v9, "initWithFormat:arguments:", v13, &a9);
  oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)objc_msgSend(objc_retainAutorelease(v12[0]), "UTF8String"));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__applicationIconImageForBundleIdentifier_format_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:");
}

id objc_msgSend__cleanupOnRootControllerDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupOnRootControllerDismiss");
}

id objc_msgSend__registerSceneActionsHandlerArray_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSceneActionsHandlerArray:forKey:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setHeaderContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHeaderContentViewController:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__systemDestructiveTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemDestructiveTintColor");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_applicationIconImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIconImage");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationName");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_configureControllersForInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureControllersForInput");
}

id objc_msgSend_connectToEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToEndpoint:");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:");
}

id objc_msgSend_destinationViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationViewController");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissViewWithMissingFonts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewWithMissingFonts:");
}

id objc_msgSend_doneWithDeleteAppFonts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithDeleteAppFonts:");
}

id objc_msgSend_doneWithInstallFonts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithInstallFonts:");
}

id objc_msgSend_doneWithMissingFonts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithMissingFonts:");
}

id objc_msgSend_doneWithMissingFonts_withDismissAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithMissingFonts:withDismissAnimated:");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontName");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIconImage_andSubIconImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIconImage:andSubIconImage:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "input");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instantiateViewControllerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instantiateViewControllerWithIdentifier:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "item");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftBarButtonItem");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringByJoiningStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringByJoiningStrings:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_providerCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerCount");
}

id objc_msgSend_providerIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerIcon");
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerName");
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forHeaderFooterViewReuseIdentifier:");
}

id objc_msgSend_registeredFonts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredFonts");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_remoteController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteController");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setContentsPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsPosition:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEstimatedSectionHeaderHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedSectionHeaderHeight:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInput:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMainController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainController:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setProviderBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProviderBundle:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRemoteController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteController:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSectionHeaderHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionHeaderHeight:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupWithUserInfo_xpcEndpoint_dismissHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWithUserInfo:xpcEndpoint:dismissHandler:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_storyboardWithName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storyboardWithName:bundle:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
