@implementation WKPreferences

- (BOOL)_serviceWorkerEntitlementDisabledForTesting
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::key, v2);
}

- (BOOL)shouldPrintBackgrounds
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::key, v2);
}

- (BOOL)_modelDocumentEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::key, v2);
}

- (void)_setStorageBlockingPolicy:(int64_t)a3
{
  ObjectStorage<WebKit::WebPreferences> *p_preferences;
  unsigned int v4;
  unsigned int v5;

  p_preferences = &self->_preferences;
  v4 = a3 == 1;
  if (a3 == 2)
    v4 = 2;
  v5 = v4;
  WebKit::WebPreferences::setStorageBlockingPolicy((WebKit::WebPreferences *)p_preferences, &v5);
}

- (void)_setMockCaptureDevicesEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMockCaptureDevicesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaCaptureRequiresSecureConnection:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaCaptureRequiresSecureConnection((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setICECandidateFilteringEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setICECandidateFilteringEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setEnumeratingAllNetworkInterfacesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setManagedMediaSourceHighThreshold:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceHighThreshold((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setManagedMediaSourceLowThreshold:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceLowThreshold((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (WKPreferences)init
{
  WKPreferences *v2;
  WKPreferences *v3;
  Object *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v9;
  objc_super v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;

  v10.receiver = self;
  v10.super_class = (Class)WKPreferences;
  v2 = -[WKPreferences init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[WKPreferences _apiObject](v2, "_apiObject", 0);
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v5 = v13;
    v12 = v13;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v6 = v13;
    v11 = v13;
    WebKit::WebPreferences::WebPreferences((WebKit::WebPreferences *)v4, (const WTF::String *)&v9, (const WTF::String *)&v12, (const WTF::String *)&v11);
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v7);
        if (!v5)
        {
LABEL_11:
          v4->var1 = v3;
          return v3;
        }
LABEL_8:
        if (*(_DWORD *)v5 == 2)
          WTF::StringImpl::destroy(v5, v7);
        else
          *(_DWORD *)v5 -= 2;
        goto LABEL_11;
      }
      *(_DWORD *)v6 -= 2;
    }
    if (!v5)
      goto LABEL_11;
    goto LABEL_8;
  }
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_preferences;
}

- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds
{
  BOOL v3;

  v3 = shouldPrintBackgrounds;
  WebKit::WebPreferences::setShouldPrintBackgrounds((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebPreferences> *))self->_preferences.data.__lx)(&self->_preferences);
    v4.receiver = self;
    v4.super_class = (Class)WKPreferences;
    -[WKPreferences dealloc](&v4, sel_dealloc);
  }
}

- (void)_setSafeBrowsingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setSafeBrowsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setFraudulentWebsiteWarningEnabled:(BOOL)fraudulentWebsiteWarningEnabled
{
  BOOL v3;

  v3 = fraudulentWebsiteWarningEnabled;
  WebKit::WebPreferences::setSafeBrowsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setTextAutosizingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setTextAutosizingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPunchOutWhiteBackgroundsInDarkMode((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setTelephoneNumberDetectionIsEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setTelephoneNumberParsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setShouldSuppressKeyboardInputDuringProvisionalNavigation:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setShouldSuppressTextInputFromEditingDuringProvisionalNavigation((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setShouldIgnoreMetaViewport:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setShouldIgnoreMetaViewport((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setShouldAllowUserInstalledFonts:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setShouldAllowUserInstalledFonts((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setNeedsSiteSpecificQuirks:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setNeedsSiteSpecificQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaSourceEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaSourceEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaDevicesEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaDevicesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setDiagnosticLoggingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setDiagnosticLoggingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setApplePayCapabilityDisclosureAllowed:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setApplePayCapabilityDisclosureAllowed((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled
{
  BOOL v3;

  v3 = javaScriptEnabled;
  WebKit::WebPreferences::setJavaScriptEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically
{
  BOOL v3;

  v3 = javaScriptCanOpenWindowsAutomatically;
  WebKit::WebPreferences::setJavaScriptCanOpenWindowsAutomatically((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setElementFullscreenEnabled:(BOOL)elementFullscreenEnabled
{
  BOOL v3;

  v3 = elementFullscreenEnabled;
  WebKit::WebPreferences::setFullScreenEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

+ (id)_features
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  CFTypeRef v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = WebKit::WebPreferences::features((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v9, v2);
  v3 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v3 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v3);
  *(_QWORD *)v3 = &off_1E34CC2F8;
  *(_QWORD *)(v3 + 16) = v9;
  v4 = v10;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = *(const void **)(v3 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v3 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v7);
  return (id)v6;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKPreferences accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKPreferences accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  -[WKPreferences minimumFontSize](self, "minimumFontSize");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("minimumFontSize"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences javaScriptCanOpenWindowsAutomatically](self, "javaScriptCanOpenWindowsAutomatically"), CFSTR("javaScriptCanOpenWindowsAutomatically"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences javaScriptEnabled](self, "javaScriptEnabled"), CFSTR("javaScriptEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences shouldPrintBackgrounds](self, "shouldPrintBackgrounds"), CFSTR("shouldPrintBackgrounds"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences isTextInteractionEnabled](self, "isTextInteractionEnabled"), CFSTR("textInteractionEnabled"));
}

- (WKPreferences)initWithCoder:(id)a3
{
  WKPreferences *v4;

  v4 = -[WKPreferences init](self, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("minimumFontSize"));
    -[WKPreferences setMinimumFontSize:](v4, "setMinimumFontSize:");
    -[WKPreferences setJavaScriptCanOpenWindowsAutomatically:](v4, "setJavaScriptCanOpenWindowsAutomatically:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("javaScriptCanOpenWindowsAutomatically")));
    -[WKPreferences setJavaScriptEnabled:](v4, "setJavaScriptEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("javaScriptEnabled")));
    -[WKPreferences setShouldPrintBackgrounds:](v4, "setShouldPrintBackgrounds:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("shouldPrintBackgrounds")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("textInteractionEnabled")))
      -[WKPreferences setTextInteractionEnabled:](v4, "setTextInteractionEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("textInteractionEnabled")));
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ObjectStorage<WebKit::WebPreferences> *p_preferences;
  CFTypeRef *v4;
  WebKit::WebPreferences *v5;
  void *v6;
  id v7;

  p_preferences = &self->_preferences;
  v4 = (CFTypeRef *)API::Object::newObject(0x70uLL, 92);
  v5 = WebKit::WebPreferences::WebPreferences((WebKit::WebPreferences *)v4, (const WebKit::WebPreferences *)p_preferences);
  v6 = (void *)*((_QWORD *)v5 + 1);
  if (v6)
    CFRetain(*((CFTypeRef *)v5 + 1));
  v7 = v6;
  if (v6)
    CFRelease(v6);
  CFRelease(v4[1]);
  return v7;
}

- (CGFloat)minimumFontSize
{
  {
    WebKit::WebPreferencesKey::minimumFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::minimumFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::minimumFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::minimumFontSizeKey(void)::key);
}

- (void)setMinimumFontSize:(CGFloat)minimumFontSize
{
  CGFloat v3;

  v3 = minimumFontSize;
  WebKit::WebPreferences::setMinimumFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isFraudulentWebsiteWarningEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key, v2);
}

- (BOOL)javaScriptCanOpenWindowsAutomatically
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::key, v2);
}

- (BOOL)isTextInteractionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v2);
}

- (void)setTextInteractionEnabled:(BOOL)textInteractionEnabled
{
  BOOL v3;

  v3 = textInteractionEnabled;
  WebKit::WebPreferences::setTextInteractionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isSiteSpecificQuirksModeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key, v2);
}

- (void)setSiteSpecificQuirksModeEnabled:(BOOL)siteSpecificQuirksModeEnabled
{
  BOOL v3;

  v3 = siteSpecificQuirksModeEnabled;
  WebKit::WebPreferences::setNeedsSiteSpecificQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isElementFullscreenEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v2);
}

- (void)setInactiveSchedulingPolicy:(WKInactiveSchedulingPolicy)inactiveSchedulingPolicy
{
  ObjectStorage<WebKit::WebPreferences> *p_preferences;
  char v4;
  BOOL *v5;
  char v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v12;
  BOOL v13;
  BOOL v14;

  if (inactiveSchedulingPolicy == WKInactiveSchedulingPolicyNone)
  {
    p_preferences = &self->_preferences;
    v8 = 1;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v8);
    v7 = 0;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v7);
    v6 = 0;
    v5 = (BOOL *)&v6;
  }
  else if (inactiveSchedulingPolicy == WKInactiveSchedulingPolicyThrottle)
  {
    p_preferences = &self->_preferences;
    v11 = 1;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v11);
    v10 = 1;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v10);
    v9 = 0;
    v5 = &v9;
  }
  else
  {
    if (inactiveSchedulingPolicy)
      return;
    p_preferences = &self->_preferences;
    v14 = 0;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v14);
    v13 = 1;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v13);
    {
      v4 = WebKit::defaultShouldDropNearSuspendedAssertionAfterDelay(void)::newSDK;
    }
    else
    {
      v4 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultShouldDropNearSuspendedAssertionAfterDelay(void)::newSDK = v4;
    }
    v12 = v4;
    v5 = (BOOL *)&v12;
  }
  WebKit::WebPreferences::setShouldDropNearSuspendedAssertionAfterDelay((WebKit::WebPreferences *)p_preferences, v5);
}

- (WKInactiveSchedulingPolicy)inactiveSchedulingPolicy
{
  const WTF::StringImpl *v2;
  WebKit::WebPreferencesStore *v3;
  const WTF::StringImpl *v4;

  {
    WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  v3 = (WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40];
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::key, v2))return 2;
  {
    WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::WebPreferencesStore::getBoolValueForKey(v3, (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::key, v4);
}

- (BOOL)_telephoneNumberDetectionIsEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::key, v2);
}

- (int64_t)_storageBlockingPolicy
{
  int v2;

  {
    WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::$_0::operator() const(void)::impl;
  }
  v2 = WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::key);
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (BOOL)_fullScreenEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v2);
}

- (void)_setFullScreenEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setFullScreenEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_allowsPictureInPictureMediaPlayback
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key, v2);
}

- (void)_setAllowsPictureInPictureMediaPlayback:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAllowsPictureInPictureMediaPlayback((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_compositingBordersVisible
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::key, v2);
}

- (void)_setCompositingBordersVisible:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setCompositingBordersVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_compositingRepaintCountersVisible
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::key, v2);
}

- (void)_setCompositingRepaintCountersVisible:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setCompositingRepaintCountersVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_tiledScrollingIndicatorVisible
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::key, v2);
}

- (void)_setTiledScrollingIndicatorVisible:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setTiledScrollingIndicatorVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_resourceUsageOverlayVisible
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::key, v2);
}

- (void)_setResourceUsageOverlayVisible:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setResourceUsageOverlayVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_visibleDebugOverlayRegions
{
  {
    WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::key);
}

- (void)_setVisibleDebugOverlayRegions:(unint64_t)a3
{
  unsigned int v3;

  v3 = a3;
  WebKit::WebPreferences::setVisibleDebugOverlayRegions((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_legacyLineLayoutVisualCoverageEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::key, v2);
}

- (void)_setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setLegacyLineLayoutVisualCoverageEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_contentChangeObserverEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::key, v2);
}

- (void)_setContentChangeObserverEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setContentChangeObserverEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_acceleratedDrawingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::key, v2);
}

- (void)_setAcceleratedDrawingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAcceleratedDrawingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_largeImageAsyncDecodingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::key, v2);
}

- (void)_setLargeImageAsyncDecodingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setLargeImageAsyncDecodingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_needsInAppBrowserPrivacyQuirks
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::key, v2);
}

- (void)_setNeedsInAppBrowserPrivacyQuirks:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setNeedsInAppBrowserPrivacyQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_animatedImageAsyncDecodingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::key, v2);
}

- (void)_setAnimatedImageAsyncDecodingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAnimatedImageAsyncDecodingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_textAutosizingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::key, v2);
}

- (BOOL)_developerExtrasEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::key, v2);
}

- (void)_setDeveloperExtrasEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setDeveloperExtrasEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_logsPageMessagesToSystemConsoleEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::key, v2);
}

- (void)_setLogsPageMessagesToSystemConsoleEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setLogsPageMessagesToSystemConsoleEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_hiddenPageDOMTimerThrottlingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::key, v2);
}

- (void)_setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setHiddenPageDOMTimerThrottlingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_hiddenPageDOMTimerThrottlingAutoIncreases
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::key, v2);
}

- (void)_setHiddenPageDOMTimerThrottlingAutoIncreases:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setHiddenPageDOMTimerThrottlingAutoIncreases((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_pageVisibilityBasedProcessSuppressionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::key, v2);
}

- (void)_setPageVisibilityBasedProcessSuppressionEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPageVisibilityBasedProcessSuppressionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_allowFileAccessFromFileURLs
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::key, v2);
}

- (void)_setAllowFileAccessFromFileURLs:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAllowFileAccessFromFileURLs((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_javaScriptRuntimeFlags
{
  {
    WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::key);
}

- (void)_setJavaScriptRuntimeFlags:(unint64_t)a3
{
  unsigned int v3;

  v3 = a3;
  WebKit::WebPreferences::setJavaScriptRuntimeFlags((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_isStandalone
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::standaloneKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::standaloneKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::standaloneKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::standaloneKey(void)::key, v2);
}

- (void)_setStandalone:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setStandalone((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_diagnosticLoggingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::key, v2);
}

- (unint64_t)_defaultFontSize
{
  {
    WebKit::WebPreferencesKey::defaultFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::defaultFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::defaultFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::defaultFontSizeKey(void)::key);
}

- (void)_setDefaultFontSize:(unint64_t)a3
{
  double v3;

  v3 = (double)a3;
  WebKit::WebPreferences::setDefaultFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_defaultFixedPitchFontSize
{
  {
    WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::key);
}

- (void)_setDefaultFixedPitchFontSize:(unint64_t)a3
{
  double v3;

  v3 = (double)a3;
  WebKit::WebPreferences::setDefaultFixedFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (NSString)_fixedPitchFontFamily
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v6;

  {
    WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::$_0::operator() const(void)::impl;
  }
  WebKit::valueForKey<WTF::String>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::key, &v6);
  v2 = v6;
  if (!v6)
    return (NSString *)&stru_1E351F1B8;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (void)_setFixedPitchFontFamily:(id)a3
{
  ObjectStorage<WebKit::WebPreferences> *p_preferences;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  p_preferences = &self->_preferences;
  MEMORY[0x19AEABCC8](&v6, a3);
  WebKit::WebPreferences::setFixedFontFamily((WebKit::WebPreferences *)p_preferences, &v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

+ (id)_internalDebugFeatures
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  CFTypeRef v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = WebKit::WebPreferences::internalDebugFeatures((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v9, (uint64_t)v2);
  v3 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v3 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v3);
  *(_QWORD *)v3 = &off_1E34CC2F8;
  *(_QWORD *)(v3 + 16) = v9;
  v4 = v10;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = *(const void **)(v3 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v3 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v7);
  return (id)v6;
}

- (BOOL)_isEnabledForInternalDebugFeature:(id)a3
{
  return WebKit::WebPreferences::isFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a3 + 8));
}

- (void)_setEnabled:(BOOL)a3 forInternalDebugFeature:(id)a4
{
  WebKit::WebPreferences::setFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a4 + 8), a3);
}

+ (id)_experimentalFeatures
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  CFTypeRef v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = WebKit::WebPreferences::experimentalFeatures((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v9, (uint64_t)v2);
  v3 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v3 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v3);
  *(_QWORD *)v3 = &off_1E34CC2F8;
  *(_QWORD *)(v3 + 16) = v9;
  v4 = v10;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = *(const void **)(v3 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v3 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v7);
  return (id)v6;
}

- (BOOL)_isEnabledForFeature:(id)a3
{
  return WebKit::WebPreferences::isFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a3 + 8));
}

- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4
{
  WebKit::WebPreferences::setFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a4 + 8), a3);
}

- (BOOL)_applePayCapabilityDisclosureAllowed
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::key, v2);
}

- (BOOL)_shouldSuppressKeyboardInputDuringProvisionalNavigation
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::key, v2);
}

- (BOOL)_loadsImagesAutomatically
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::key, v2);
}

- (void)_setLoadsImagesAutomatically:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setLoadsImagesAutomatically((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_peerConnectionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::key, v2);
}

- (void)_setPeerConnectionEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPeerConnectionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaDevicesEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key, v2);
}

- (BOOL)_getUserMediaRequiresFocus
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::key, v2);
}

- (void)_setGetUserMediaRequiresFocus:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setGetUserMediaRequiresFocus((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_screenCaptureEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::key, v2);
}

- (void)_setScreenCaptureEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setScreenCaptureEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mockCaptureDevicesEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::key, v2);
}

- (BOOL)_mockCaptureDevicesPromptEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::key, v2);
}

- (void)_setMockCaptureDevicesPromptEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMockCaptureDevicesPromptEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaCaptureRequiresSecureConnection
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::key, v2);
}

- (double)_inactiveMediaCaptureSteamRepromptIntervalInMinutes
{
  {
    WebKit::WebPreferencesKey::inactiveMediaCaptureSteamRepromptIntervalInMinutesKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::inactiveMediaCaptureSteamRepromptIntervalInMinutesKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::inactiveMediaCaptureSteamRepromptIntervalInMinutesKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::inactiveMediaCaptureSteamRepromptIntervalInMinutesKey(void)::key);
}

- (void)_setInactiveMediaCaptureSteamRepromptIntervalInMinutes:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setInactiveMediaCaptureSteamRepromptIntervalInMinutes((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_interruptAudioOnPageVisibilityChangeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::key, v2);
}

- (void)_setInterruptAudioOnPageVisibilityChangeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setInterruptAudioOnPageVisibilityChangeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_enumeratingAllNetworkInterfacesEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::key, v2);
}

- (BOOL)_iceCandidateFilteringEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::key, v2);
}

- (void)_setJavaScriptCanAccessClipboard:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setJavaScriptCanAccessClipboard((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_shouldAllowUserInstalledFonts
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::key, v2);
}

- (int64_t)_editableLinkBehavior
{
  int64_t result;

  {
    WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::$_0::operator() const(void)::impl;
  }
  LOBYTE(result) = WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::key);
  if (result >= 5u)
    return 4;
  else
    return result;
}

- (void)_setEditableLinkBehavior:(int64_t)a3
{
  unsigned int v3;
  unsigned int v4;

  if ((unint64_t)a3 >= 5)
    v3 = 4;
  else
    v3 = a3;
  v4 = v3;
  WebKit::WebPreferences::setEditableLinkBehavior((WebKit::WebPreferences *)&self->_preferences, &v4);
}

- (void)_setAVFoundationEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAVFoundationEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_avFoundationEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::key, v2);
}

- (void)_setTextExtractionEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setTextExtractionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_textExtractionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key, v2);
}

- (void)_setColorFilterEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setColorFilterEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_colorFilterEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::key, v2);
}

- (BOOL)_punchOutWhiteBackgroundsInDarkMode
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::key, v2);
}

- (void)_setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setLowPowerVideoAudioBufferSizeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_lowPowerVideoAudioBufferSizeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::key, v2);
}

- (BOOL)_shouldIgnoreMetaViewport
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::key, v2);
}

- (BOOL)_needsSiteSpecificQuirks
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key, v2);
}

- (void)_setItpDebugModeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setItpDebugModeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_itpDebugModeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::key, v2);
}

- (BOOL)_mediaSourceEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::key, v2);
}

- (void)_setManagedMediaSourceEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_managedMediaSourceEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::key, v2);
}

- (double)_managedMediaSourceLowThreshold
{
  {
    WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::key);
}

- (double)_managedMediaSourceHighThreshold
{
  {
    WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::key);
}

- (BOOL)_secureContextChecksEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::key, v2);
}

- (void)_setSecureContextChecksEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setSecureContextChecksEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setWebAudioEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setWebAudioEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_webAudioEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::webAudioEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::webAudioEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::webAudioEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::webAudioEnabledKey(void)::key, v2);
}

- (void)_setAcceleratedCompositingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAcceleratedCompositingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_acceleratedCompositingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::key, v2);
}

- (BOOL)_remotePlaybackEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::key, v2);
}

- (void)_setRemotePlaybackEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setRemotePlaybackEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setServiceWorkerEntitlementDisabledForTesting:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setServiceWorkerEntitlementDisabledForTesting((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_javaScriptCanAccessClipboard
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::key, v2);
}

- (void)_setDOMPasteAllowed:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setDOMPasteAllowed((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_domPasteAllowed
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::domPasteAllowedKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::domPasteAllowedKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::domPasteAllowedKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::domPasteAllowedKey(void)::key, v2);
}

- (void)_setShouldEnableTextAutosizingBoost:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setShouldEnableTextAutosizingBoost((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_shouldEnableTextAutosizingBoost
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::key, v2);
}

- (BOOL)_isSafeBrowsingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key, v2);
}

- (void)_setVideoQualityIncludesDisplayCompositingEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setVideoQualityIncludesDisplayCompositingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_videoQualityIncludesDisplayCompositingEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::key, v2);
}

- (void)_setDeviceOrientationEventEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setDeviceOrientationEventEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_deviceOrientationEventEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::key, v2);
}

- (BOOL)_accessibilityIsolatedTreeEnabled
{
  return 0;
}

- (BOOL)_speechRecognitionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::key, v2);
}

- (void)_setSpeechRecognitionEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setSpeechRecognitionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_privateClickMeasurementEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::key, v2);
}

- (void)_setPrivateClickMeasurementEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPrivateClickMeasurementEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_privateClickMeasurementDebugModeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::key, v2);
}

- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPrivateClickMeasurementDebugModeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (int64_t)_pitchCorrectionAlgorithm
{
  {
    WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::key);
}

- (void)_setPitchCorrectionAlgorithm:(int64_t)a3
{
  unsigned int v3;

  v3 = a3;
  WebKit::WebPreferences::setPitchCorrectionAlgorithm((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaSessionEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::key, v2);
}

- (void)_setMediaSessionEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaSessionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_isExtensibleSSOEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::key, v2);
}

- (void)_setExtensibleSSOEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setExtensibleSSOEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_requiresPageVisibilityToPlayAudio
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::key, v2);
}

- (void)_setRequiresPageVisibilityToPlayAudio:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setRequiresPageVisibilityToPlayAudio((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_fileSystemAccessEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::key, v2);
}

- (void)_setFileSystemAccessEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setFileSystemAccessEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_storageAPIEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::key, v2);
}

- (void)_setStorageAPIEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setStorageAPIEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_accessHandleEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::key, v2);
}

- (void)_setAccessHandleEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAccessHandleEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setNotificationsEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setNotificationsEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_notificationsEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::notificationsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::notificationsEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::notificationsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::notificationsEnabledKey(void)::key, v2);
}

- (void)_setNotificationEventEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setNotificationEventEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_notificationEventEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::key, v2);
}

- (BOOL)_pushAPIEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::key, v2);
}

- (void)_setPushAPIEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setPushAPIEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setModelDocumentEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setModelDocumentEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setRequiresFullscreenToLockScreenOrientation:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setFullscreenRequirementForScreenOrientationLockingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_requiresFullscreenToLockScreenOrientation
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::key, v2);
}

- (void)_setInteractionRegionMinimumCornerRadius:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setInteractionRegionMinimumCornerRadius((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_interactionRegionMinimumCornerRadius
{
  {
    WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::key);
}

- (void)_setInteractionRegionInlinePadding:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setInteractionRegionInlinePadding((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_interactionRegionInlinePadding
{
  {
    WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::key);
}

- (void)_setMediaPreferredFullscreenWidth:(double)a3
{
  double v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaPreferredFullscreenWidth((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_mediaPreferredFullscreenWidth
{
  {
    WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::key);
}

- (void)_setAppBadgeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setAppBadgeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_appBadgeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::key, v2);
}

- (void)_setClientBadgeEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setClientBadgeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_clientBadgeEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::key, v2);
}

- (void)_setVerifyWindowOpenUserGestureFromUIProcess:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setVerifyWindowOpenUserGestureFromUIProcess((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_verifyWindowOpenUserGestureFromUIProcess
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::key, v2);
}

- (BOOL)_mediaCapabilityGrantsEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::key, v2);
}

- (void)_setMediaCapabilityGrantsEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setMediaCapabilityGrantsEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)javaScriptEnabled
{
  const WTF::StringImpl *v2;

  {
    WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::key, v2);
}

- (BOOL)_shouldAllowDesignSystemUIFonts
{
  return 1;
}

- (BOOL)_requestAnimationFrameEnabled
{
  return 1;
}

- (BOOL)_subpixelAntialiasedLayerTextEnabled
{
  return 0;
}

- (BOOL)_displayListDrawingEnabled
{
  return 0;
}

- (BOOL)_offlineApplicationCacheIsEnabled
{
  return 0;
}

@end
