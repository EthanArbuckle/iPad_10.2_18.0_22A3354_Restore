uint64_t start(int a1, char **a2)
{
  return UIApplicationMain(a1, a2, CFSTR("WebSheetAppDelegate"), CFSTR("WebSheetAppDelegate"));
}

id sub_100004100()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v1 = objc_msgSend(v0, "isMultiUser");

  return v1;
}

BOOL sub_10000413C()
{
  uint64_t v0;
  __int16 v2;

  v2 = 0;
  v0 = SBSSpringBoardServerPort();
  SBGetScreenLockStatus(v0, &v2, (char *)&v2 + 1);
  return (_BYTE)v2 != 0;
}

uint64_t sub_100004174(id *a1, const __CFDictionary *a2, int a3)
{
  const void *Value;
  NSURL *v6;
  void *v7;
  const void *v8;
  const void *v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  uint64_t v12;
  const void *v13;
  const __CFArray *v14;
  const __CFArray *v15;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v17;
  CFTypeID TypeID;
  CFDictionaryRef Copy;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  dword_10000D208 = a3;
  if (sub_100004100() || !sub_10000413C())
  {
    Value = CFDictionaryGetValue(a2, CFSTR("Interface"));
    v6 = +[NSURL URLWithString:](NSURL, "URLWithString:", CFDictionaryGetValue(a2, CFSTR("ProbeURL")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = CFDictionaryGetValue(a2, CFSTR("SSID"));
    if (!Value || !v7 || (v9 = v8) == 0)
    {
      objc_msgSend(UIApp, "terminateWithSuccess");
      v20 = 0;
LABEL_32:

      return v20;
    }
    v10 = CFDictionaryCreate(kCFAllocatorDefault, &kSCProxiesNoGlobal, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v10)
    {
      v11 = v10;
      v12 = SCDynamicStoreCopyProxiesWithOptions(0, v10);
      if (v12)
      {
        v13 = (const void *)v12;
        v14 = (const __CFArray *)SCNetworkProxiesCopyMatching(v12, 0, Value);
        if (v14)
        {
          v15 = v14;
          if (CFArrayGetCount(v14) >= 1
            && (ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, 0)) != 0
            && (v17 = ValueAtIndex, TypeID = CFDictionaryGetTypeID(), CFGetTypeID(v17) == TypeID))
          {
            Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v17);
          }
          else
          {
            Copy = 0;
          }
          CFRelease(v15);
        }
        else
        {
          Copy = 0;
        }
        CFRelease(v13);
      }
      else
      {
        Copy = 0;
      }
      CFRelease(v11);
      if (!a1)
        goto LABEL_24;
    }
    else
    {
      Copy = 0;
      if (!a1)
        goto LABEL_24;
    }
    objc_msgSend(*a1, "setInterfaceName:", Value);
    objc_msgSend(a1[1], "startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:", v7, v9, Value, Copy, 1, *a1);
LABEL_24:
    if (Copy)
      CFRelease(Copy);
    v21 = objc_alloc((Class)SBSRemoteAlertDefinition);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleIdentifier"));
    v24 = objc_msgSend(v21, "initWithServiceName:viewControllerClassName:", v23, CFSTR("WebSheetRemoteAlertPresentationViewController"));

    if (a1)
    {
      v25 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v24, 0);
      v26 = a1[2];
      a1[2] = v25;

    }
    v27 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    objc_msgSend(v27, "setReason:", CFSTR("CaptiveWebSheet"));
    if (a1)
    {
      v28 = a1[2];
      if (v28)
      {
        objc_msgSend(v28, "registerObserver:", *a1);
        objc_msgSend(a1[2], "activateWithContext:", v27);
      }
    }

    v20 = 1;
    goto LABEL_32;
  }
  objc_msgSend(UIApp, "terminateWithSuccess");
  return 0;
}

void sub_100004A34(id *a1)
{

}

void sub_100004A64(void *a1, const void *a2, int a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  NSLog(CFSTR("captive probe completed"));
  if (a2)
    CFRelease(a2);
  if (a1)
  {
    v6 = a1;
    v7 = v6;
    if ((a3 - 1) > 6)
      v8 = 0;
    else
      v8 = qword_100005EE8[a3 - 1];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "probeCompleteCompletionHandler"));

    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100004B44;
      v10[3] = &unk_100008260;
      v11 = v7;
      v12 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

    }
  }
}

id sub_100004B44(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);

  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "probeCompleteCompletionHandler"));
  v2[2](v2, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setProbeCompleteCompletionHandler:", 0);
}

void sub_100004BE4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setWallpaperTunnelActive:", 0);
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004C84;
  v6[3] = &unk_1000082C8;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", v4, v6);

}

void sub_100004C84(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismiss");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000082A0);
}

void sub_100004CAC(id a1)
{
  objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_100004ED8(uint64_t a1)
{
  id v2;

  NSLog(CFSTR("WebSheet view controller presentation finished."));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 1);

}

const char *sub_100004F34()
{
  return "WebSheet";
}

const char *sub_100004F48(char a1)
{
  if ((a1 & 1) != 0)
    return "Exclusive";
  else
    return "BuddyAnchor";
}

uint64_t sub_100004F74(char a1)
{
  char v1;
  char v2;
  _QWORD v4[5];

  v1 = a1 & 1;
  v4[3] = &type metadata for WebSheetFeatureFlags;
  v4[4] = sub_100004FC8();
  LOBYTE(v4[0]) = v1;
  v2 = isFeatureEnabled(_:)(v4);
  sub_10000500C(v4);
  return v2 & 1;
}

unint64_t sub_100004FC8()
{
  unint64_t result;

  result = qword_10000D1F8;
  if (!qword_10000D1F8)
  {
    result = swift_getWitnessTable(&unk_100005FAC, &type metadata for WebSheetFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_10000D1F8);
  }
  return result;
}

uint64_t sub_10000500C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

BOOL sub_10000502C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10000503C(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int sub_100005060(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL sub_1000050A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000050BC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100005100()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100005128(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10000516C()
{
  unint64_t result;

  result = qword_10000D200;
  if (!qword_10000D200)
  {
    result = swift_getWitnessTable("]$", &type metadata for WebSheetFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_10000D200);
  }
  return result;
}

const char *sub_1000051B0()
{
  _BYTE *v0;

  if (*v0)
    return "Exclusive";
  else
    return "BuddyAnchor";
}

_BYTE *initializeBufferWithCopyOfBuffer for WebSheetFeatureFlags(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WebSheetFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WebSheetFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1000052CC + 4 * byte_100005F35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100005300 + 4 * byte_100005F30[v4]))();
}

uint64_t sub_100005300(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005308(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100005310);
  return result;
}

uint64_t sub_10000531C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100005324);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100005328(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005330(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000533C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100005348(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WebSheetFeatureFlags()
{
  return &type metadata for WebSheetFeatureFlags;
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissPresentationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPresentationController:");
}

id objc_msgSend_dismissViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewController:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_probeCompleteCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeCompleteCompletionHandler");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_remotePresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePresentationController");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsBanners:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setInterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceName:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setOpenWiFiPreferencesOnExit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpenWiFiPreferencesOnExit:");
}

id objc_msgSend_setProbeCompleteCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProbeCompleteCompletionHandler:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRemotePresentationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemotePresentationController:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_startWithURL_ssid_interface_proxyConfiguration_showCancelMenu_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:");
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateWithSuccess");
}

id objc_msgSend_webSheetCont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webSheetCont");
}
